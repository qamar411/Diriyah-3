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
                  li x27, 0x40001120
                  csrw 0x301, x27
kernel_sp:        
                  la x22, kernel_stack_end

trap_vec_init:    
                  la x27, mtvec_handler
                  ori x27, x27, 1
                  csrw 0x305, x27 # MTVEC

mepc_setup:       
                  la x27, init
                  csrw 0x341, x27

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x27, 0x3800
                  csrw 0x300, x27 # MSTATUS
                  li x27, 0x0
                  csrw 0x304, x27 # MIE
                  mret
init:             
                  li x27, 2139095039
                  fmv.w.x f0, x27
                  li x27, 717989802
                  fmv.w.x f1, x27
                  li x27, 0
                  fmv.w.x f2, x27
                  li x27, 2139095041
                  fmv.w.x f3, x27
                  li x27, 2143289344
                  fmv.w.x f4, x27
                  li x27, 4286578687
                  fmv.w.x f5, x27
                  li x27, 2139095039
                  fmv.w.x f6, x27
                  li x27, 1043997325
                  fmv.w.x f7, x27
                  li x27, 1352024721
                  fmv.w.x f8, x27
                  li x27, 4286578688
                  fmv.w.x f9, x27
                  li x27, 4168836720
                  fmv.w.x f10, x27
                  li x27, 0
                  fmv.w.x f11, x27
                  li x27, 5895384
                  fmv.w.x f12, x27
                  li x27, 0
                  fmv.w.x f13, x27
                  li x27, 4286578688
                  fmv.w.x f14, x27
                  li x27, 4286578687
                  fmv.w.x f15, x27
                  li x27, 2139095041
                  fmv.w.x f16, x27
                  li x27, 2147483648
                  fmv.w.x f17, x27
                  li x27, 2139095040
                  fmv.w.x f18, x27
                  li x27, 2139095040
                  fmv.w.x f19, x27
                  li x27, 6852748
                  fmv.w.x f20, x27
                  li x27, 2139095039
                  fmv.w.x f21, x27
                  li x27, 2139095040
                  fmv.w.x f22, x27
                  li x27, 0
                  fmv.w.x f23, x27
                  li x27, 2139095039
                  fmv.w.x f24, x27
                  li x27, 2139095039
                  fmv.w.x f25, x27
                  li x27, 1937382184
                  fmv.w.x f26, x27
                  li x27, 2139095039
                  fmv.w.x f27, x27
                  li x27, 2139095039
                  fmv.w.x f28, x27
                  li x27, 4286578688
                  fmv.w.x f29, x27
                  li x27, 2147488591
                  fmv.w.x f30, x27
                  li x27, 2143289344
                  fmv.w.x f31, x27
                  fsrmi 3
                  li x0, 0x80000000
                  li x1, 0xbe21f7e
                  li x2, 0x0
                  li x3, 0xf47f106c
                  li x4, 0xebb7c2a9
                  li x5, 0x0
                  li x6, 0x80000000
                  li x7, 0xf0c128e0
                  li x8, 0x7
                  li x9, 0x80000000
                  li x10, 0x80000000
                  li x11, 0xf56dc889
                  li x13, 0x80000000
                  li x14, 0x0
                  li x15, 0x55fc3fb3
                  li x16, 0xf3d507f5
                  li x17, 0xd96c724c
                  li x18, 0x0
                  li x19, 0x80000000
                  li x20, 0xd
                  li x21, 0xcf0d8ca5
                  li x23, 0xf1ff7bf8
                  li x24, 0xffcc1df6
                  li x25, 0x80000000
                  li x26, 0x0
                  li x27, 0x80000000
                  li x28, 0x19567d8e
                  li x29, 0xc
                  li x30, 0x0
                  li x31, 0x0
                  la x12, user_stack_end
main:             fmax.s       fa0, ft5, fs11
                  mulhsu       zero, a5, s9
                  fle.s        t0, ft0, fs7
                  fsgnjx.s     fa5, fa7, fa1
                  slt          a4, s4, a2
                  sra          t1, zero, t4
                  and          s2, t2, a6
                  fcvt.w.s     s4, fs6, rne
                  and          a6, a6, t3
                  add          t5, s6, a0
                  fcvt.s.wu    ft2, t3, rmm
                  fdiv.s       ft1, fs2, fa7
                  flt.s        s1, fs0, ft5
                  fadd.s       fs10, fa6, fs6
                  nop
                  auipc        t1, 114744
                  lui          t3, 890579
                  slli         s4, a6, 19
                  fsqrt.s      ft11, fs9
                  fmul.s       fs11, fs3, ft9, rup
                  andi         t5, s9, -436
                  fsqrt.s      ft1, fa1
                  slt          gp, t3, t4
                  flt.s        t5, ft4, ft0
                  add          a6, s7, a1
                  and          s9, a6, s8
                  sub          t2, t6, tp
                  fmv.x.w      a1, fa3
                  mul          t4, s0, s3
                  slt          t4, ra, s10
                  fsqrt.s      fa1, fa5, rup
                  srl          s1, s6, s0
                  fle.s        a6, fa3, fs6
                  srl          s2, sp, s9
                  fmv.w.x      ft8, t2
                  fcvt.s.w     ft6, t0
                  fcvt.s.wu    fs10, t1
                  srli         s0, s10, 15
                  fcvt.s.wu    fs5, a0
                  mulhsu       s11, s0, zero
                  fsqrt.s      fs9, ft6
                  xor          gp, t6, s9
                  slt          s0, sp, s3
                  sltiu        s1, t3, -1815
                  mulhsu       sp, t1, t5
                  mulhu        t5, s1, ra
                  rem          t3, s11, a2
                  and          a3, t4, zero
                  fmul.s       ft7, ft6, ft6, rdn
                  divu         s1, t6, s2
                  fmul.s       fs8, fs8, fs2, rmm
                  fmin.s       ft10, ft0, ft5
                  srai         a7, a4, 17
                  fsqrt.s      ft5, ft4, rtz
                  ori          t6, s11, -1052
                  addi         t5, a4, -535
                  lui          s2, 1039252
                  srl          t1, a0, s0
                  fmv.w.x      fs3, a5
                  fle.s        t5, fa6, fs9
                  fmin.s       ft2, ft4, fa0
                  fmul.s       ft3, fs7, ft5
                  feq.s        t6, fa2, ft6
                  auipc        s5, 912413
                  fcvt.w.s     a1, fa6
                  fcvt.w.s     t2, fs9, rtz
                  slti         s3, a5, 1399
                  mulhu        a6, s8, t6
                  sll          t4, s8, t1
                  remu         t2, a7, zero
                  sra          zero, a4, s1
                  mul          s10, t0, t6
                  fdiv.s       fa4, fs4, fa6, rmm
                  fsub.s       fa1, fa7, ft9, rtz
                  mul          gp, a0, gp
                  remu         s9, s10, s5
                  mul          t5, s6, s0
                  or           t3, s6, s3
                  fsub.s       fs10, fs9, fs2
                  slt          t2, s4, t6
                  fcvt.s.wu    fs7, a5
                  sra          a5, t1, a0
                  or           t5, t2, s6
                  divu         s5, a2, t2
                  fcvt.s.wu    ft8, s2
                  fsqrt.s      ft1, fs11
                  add          s4, t4, t4
                  mulh         zero, t3, t3
                  sra          a6, s2, s4
                  mul          s4, tp, s2
                  fadd.s       fa3, fs5, fs6
                  or           ra, t3, a1
                  rem          s11, t1, s8
                  slti         s1, a2, -1324
                  fmv.w.x      fa1, t2
                  and          s0, t0, s6
                  srli         t5, t3, 7
                  nop
                  fmax.s       ft6, fs9, fs1
                  fclass.s     s3, ft11
                  fcvt.wu.s    s1, fa4, rne
                  rem          ra, a4, a4
                  fadd.s       ft0, fs1, fa7, rtz
                  xori         a5, zero, -1863
                  fmv.x.w      s1, ft3
                  feq.s        t6, fs9, fs5
                  fdiv.s       fa3, fa1, ft5
                  fcvt.s.wu    fs8, tp
                  slli         t2, t6, 18
                  fcvt.s.w     fa0, tp, rdn
                  add          s2, s7, s1
                  fdiv.s       ft7, fa2, fs7, rtz
                  lui          a6, 429988
                  fmul.s       ft6, fs8, fs4
                  xor          s10, t6, t3
                  fcvt.s.wu    fs8, a7, rne
                  slti         t6, t3, 273
                  fmul.s       ft5, ft2, fa1
                  and          s11, t5, gp
                  fadd.s       fa2, ft10, fa5
                  ori          s0, a7, -56
                  slli         s7, s9, 10
                  ori          s5, s10, -1795
                  mulh         s9, a7, s5
                  fadd.s       fa3, fs3, fa5
                  div          a6, s8, t6
                  fmv.x.w      t3, ft10
                  andi         t3, a4, -1465
                  mulh         zero, tp, s9
                  fdiv.s       fs3, ft8, fs7
                  fmax.s       fs10, fs4, fa7
                  slt          t1, t1, a6
                  fsgnjx.s     fa5, ft8, fs5
                  fsgnjn.s     fs6, fa4, ft6
                  sra          s10, s11, s3
                  srl          t4, a5, s2
                  divu         tp, zero, ra
                  addi         s11, a6, -1186
                  sra          t6, s2, a4
                  slli         t4, sp, 3
                  rem          t6, ra, ra
                  nop
                  sltu         s0, s11, a5
                  mulhsu       ra, s2, s9
                  srl          s2, t4, t2
                  rem          s11, gp, s7
                  fclass.s     ra, fa2
                  flt.s        s2, ft9, ft7
                  fsgnjn.s     ft0, ft6, fa4
                  sra          zero, s9, s10
                  div          t2, t6, a7
                  lui          s3, 527920
                  fcvt.wu.s    a1, ft11, rmm
                  addi         s7, t1, -2009
                  nop
                  mulh         a5, a2, a4
                  fadd.s       ft10, fs8, fa7
                  fdiv.s       fs5, fs5, fs7
                  lui          t2, 992963
                  fclass.s     s5, fa4
                  fdiv.s       fs5, fa2, fs5
                  mulhsu       s7, gp, zero
                  add          s3, ra, tp
                  fsub.s       fa7, ft3, fs2
                  fsgnjn.s     ft2, ft9, fs9
                  add          t2, sp, gp
                  auipc        s5, 75959
                  fcvt.s.wu    fs11, a0
                  mulhsu       a7, a3, a4
                  flt.s        tp, fa2, fs11
                  sub          a5, s5, s3
                  fcvt.s.w     ft3, t6, rne
                  fcvt.s.w     fa7, s9, rmm
                  add          s7, a4, s11
                  fmul.s       ft11, ft6, ft4, rup
                  sltiu        t2, s9, 522
                  sll          s10, t6, t2
                  sub          a5, s10, s5
                  ori          tp, t0, -432
                  fdiv.s       ft7, fs2, ft6, rne
                  sltu         a7, t2, s5
                  srl          t3, s7, s5
                  fcvt.wu.s    s2, fa2
                  fmv.x.w      t3, fs7
                  sra          a5, t3, a2
                  srai         t5, a0, 26
                  divu         a0, s7, s10
                  mulhsu       zero, s2, a7
                  divu         s4, s1, s3
                  ori          a4, s8, -1007
                  sra          a3, a3, a5
                  add          s5, a1, t2
                  slli         a4, s10, 20
                  sltiu        s5, a5, 1975
                  srai         t0, t5, 30
                  fsgnj.s      fs8, fs7, fs2
                  and          a6, s1, t6
                  sll          t1, tp, s4
                  fmul.s       ft4, fs4, fs8
                  slti         t6, s6, -1445
                  fcvt.s.w     ft2, s0, rtz
                  auipc        t5, 384038
                  mulhsu       s11, s8, sp
                  fsgnj.s      ft8, fs5, ft11
                  fcvt.s.wu    fa4, s0
                  ori          t5, t3, -1342
                  slti         t2, t2, 1381
                  sltiu        a3, s1, -1270
                  add          a6, gp, s7
                  sll          s2, a2, s4
                  fsgnj.s      fs0, fa0, fs9
                  slt          s0, s6, t0
                  srl          s0, t5, s11
                  rem          s10, t4, t0
                  fcvt.s.wu    ft7, s8, rdn
                  fsgnjx.s     fs3, fa3, fs8
                  fsgnjx.s     fs9, ft7, fs5
                  fle.s        a6, fs6, fa2
                  mulhu        t0, s11, a2
                  fsgnjn.s     fs9, fs4, fa1
                  andi         a6, s7, -1546
                  ori          a1, t3, -1342
                  fsgnjx.s     ft1, fs4, ft9
                  slti         t2, sp, -779
                  fle.s        t6, ft11, fa0
                  addi         t4, a4, -566
                  fle.s        a1, ft5, ft6
                  fcvt.wu.s    t0, fs9
                  flt.s        t4, fa0, fs6
                  add          ra, zero, s6
                  ori          t5, ra, -1943
                  ori          s7, a6, 136
                  sub          t3, a6, s1
                  fsgnjn.s     fa6, ft1, fs1
                  mulh         a5, zero, s5
                  xor          a1, t3, s6
                  auipc        s10, 133060
                  nop
                  fdiv.s       fs2, fa5, fs10, rmm
                  sltu         s1, t6, zero
                  auipc        a1, 660474
                  div          a0, s9, s0
                  fdiv.s       fa6, fa1, ft9, rne
                  slli         t6, ra, 24
                  xori         s2, s0, -378
                  fcvt.s.wu    fa5, s7, rne
                  or           zero, s0, t2
                  fsub.s       fs6, fs0, fa3
                  auipc        tp, 276468
                  fmax.s       ft11, fs8, ft2
                  add          a1, s3, s10
                  mulhsu       sp, ra, s10
                  fdiv.s       fs3, fa6, fa3, rne
                  feq.s        a3, fs0, fs9
                  srl          s3, ra, t5
                  slt          t1, gp, a0
                  fcvt.wu.s    tp, fa2, rtz
                  sltu         a1, s6, s11
                  remu         a0, s9, s6
                  fmul.s       fs2, ft3, fs3
                  fdiv.s       ft8, fs3, ft1
                  xor          t6, t2, s10
                  fdiv.s       fs11, fs3, ft5, rtz
                  fmul.s       fa4, fa3, fa3
                  lui          tp, 412525
                  fmul.s       fs2, ft2, fs2
                  fdiv.s       fs0, fs5, ft2, rdn
                  sltu         a0, s6, a1
                  auipc        sp, 19471
                  fsgnj.s      fa3, fa7, fa7
                  sra          a7, zero, sp
                  fmv.w.x      fa7, s2
                  srl          t0, t2, t4
                  fcvt.wu.s    s5, fs1
                  fmax.s       fa3, fa0, fs11
                  divu         s10, t2, s8
                  fmv.x.w      a4, ft5
                  srai         a0, t0, 26
                  and          gp, tp, a1
                  mulhsu       a3, s7, s2
                  lui          sp, 697873
                  fmul.s       fs6, fs4, ft8, rne
                  fclass.s     t5, fa3
                  fcvt.w.s     s5, ft0
                  addi         s0, a3, 914
                  fsgnj.s      fa4, fs4, fs11
                  fcvt.s.w     fs7, s4
                  sll          ra, s9, s3
                  srai         a4, a7, 21
                  mulhu        a3, a5, s3
                  or           s11, tp, gp
                  fcvt.w.s     s1, ft9, rup
                  remu         t0, s4, t0
                  fmv.w.x      ft3, a5
                  slli         a7, t1, 31
                  sltiu        s1, s8, -1780
                  add          s10, s4, s2
                  fsqrt.s      fa4, ft10, rup
                  sltiu        t2, t1, -115
                  sltu         a5, tp, t2
                  xor          tp, s5, s3
                  div          a4, t0, s1
                  fle.s        tp, fs0, fs3
                  rem          a1, s7, t5
                  lui          a0, 761279
                  sltiu        s9, t2, -260
                  fsgnjn.s     ft3, fs3, fa2
                  nop
                  fcvt.w.s     s1, fs3
                  fcvt.s.w     fs11, s7
                  fsgnjn.s     fa2, fa7, fs2
                  srli         tp, t3, 29
                  mulhu        s1, a5, gp
                  sltu         s11, a4, sp
                  and          a0, t5, s5
                  addi         a0, a0, -79
                  flt.s        s2, ft4, fa5
                  div          a0, t3, s2
                  fsgnjx.s     fa3, fs10, ft5
                  fcvt.wu.s    a1, fs10
                  srai         s11, a2, 15
                  slti         a0, t1, -1358
                  feq.s        t2, fa6, fa6
                  fmv.w.x      fs6, t3
                  sub          s1, sp, s8
                  sra          t6, t2, a4
                  fmv.x.w      zero, fa5
                  sub          s11, a3, s4
                  srl          s1, s1, s8
                  sra          ra, a4, t4
                  fcvt.s.w     fs0, s5, rmm
                  fsub.s       fs8, fa5, ft1, rup
                  and          t5, s7, t3
                  ori          s2, a3, -716
                  lui          s5, 442338
                  fsgnjn.s     fs0, fs6, fs7
                  add          s11, t2, s7
                  fcvt.w.s     a1, ft8
                  or           s7, tp, tp
                  addi         s7, a3, 275
                  sub          t2, zero, t5
                  sltu         a7, a4, s2
                  srai         a7, s10, 27
                  fdiv.s       fa5, ft11, fa5, rmm
                  fsgnj.s      fs4, ft6, fa6
                  remu         a4, s11, a3
                  fsgnj.s      fs10, ft9, fs10
                  srl          a0, a6, a7
                  fcvt.wu.s    a7, fa1, rne
                  xori         s1, t1, 1012
                  or           t1, zero, s10
                  and          tp, s11, t3
                  or           s11, t2, s4
                  or           s3, s4, t3
                  fmul.s       fs7, ft9, ft1
                  fsgnjx.s     ft7, ft2, ft7
                  sltiu        a6, ra, -1488
                  fsgnjx.s     fs1, fa4, fa3
                  fadd.s       ft3, fa5, fs7, rtz
                  div          a5, s5, a7
                  mul          a0, tp, s4
                  fmv.x.w      s0, fs2
                  sltiu        t0, s6, 734
                  and          a7, tp, a0
                  fcvt.s.w     ft3, a6
                  fclass.s     a0, ft6
                  fmv.w.x      fa7, tp
                  or           s5, s5, a4
                  slli         a7, a7, 16
                  or           a0, tp, s6
                  slli         tp, s8, 2
                  add          t1, a0, s2
                  feq.s        s2, fs4, fa5
                  fcvt.s.wu    ft1, a5
                  slti         s1, t0, 476
                  mulh         ra, s0, gp
                  ori          s0, t6, 1
                  remu         a6, s4, a4
                  sltu         s7, t4, gp
                  slli         s11, t6, 22
                  slti         s0, s1, -1357
                  fcvt.s.wu    ft0, s6, rup
                  nop
                  and          t4, s5, s9
                  sltiu        a6, s6, 761
                  fsub.s       ft11, fs0, fs6, rtz
                  srai         s7, s1, 1
                  fmul.s       ft9, ft0, ft10
                  fsqrt.s      fa4, fa0, rtz
                  sub          t4, s8, ra
                  fcvt.w.s     s4, fs8, rmm
                  andi         t4, ra, -613
                  slt          gp, s1, s11
                  rem          ra, s2, t0
                  andi         s10, tp, 978
                  or           a4, t3, t0
                  rem          a7, tp, t2
                  fsgnj.s      fs11, fs5, fs0
                  fsgnjn.s     fs8, fs7, fs8
                  feq.s        t6, ft2, fs7
                  addi         s1, zero, -218
                  mulhsu       s10, a0, s1
                  xori         t2, s3, -436
                  slti         gp, s6, 753
                  fclass.s     s11, fs9
                  mul          gp, t1, a1
                  auipc        s5, 872541
                  fsgnjx.s     ft4, fs4, fs0
                  flt.s        a4, fa5, fs5
                  fsqrt.s      ft5, fa7
                  xor          s3, s5, a2
                  fle.s        s4, fs4, ft0
                  srl          s1, s7, sp
                  fsub.s       fs1, ft8, fs2
                  fsub.s       ft10, ft6, fs2
                  fsgnj.s      fa7, ft5, ft1
                  srl          tp, s8, t0
                  mulh         a7, s5, a3
                  lui          t0, 242992
                  fclass.s     t1, ft0
                  fsub.s       fa1, fs4, fs0
                  mulh         t3, a1, s7
                  xori         ra, s5, 670
                  mulhsu       a3, s6, a3
                  fmax.s       ft8, ft3, fs1
                  slti         s4, a0, -1369
                  or           s5, a2, s11
                  auipc        t3, 616877
                  fmin.s       ft6, fa0, ft4
                  sra          gp, s0, t4
                  slli         t4, s5, 10
                  mulh         t1, s2, sp
                  fmv.x.w      a5, ft7
                  or           a4, t5, s10
                  slli         s11, t0, 30
                  xori         a4, s4, 1856
                  nop
                  fmax.s       fs1, fs7, ft0
                  slt          a4, gp, s2
                  mulhu        gp, s1, s7
                  fsgnjx.s     fs4, fs9, fa1
                  mulh         ra, s11, s11
                  fcvt.s.w     ft4, a7
                  flt.s        a3, fs7, fs11
                  fcvt.s.w     ft3, a7
                  fsqrt.s      fa3, fa6, rmm
                  fclass.s     s3, fa3
                  fsub.s       ft7, fa3, fa7, rmm
                  sll          s9, zero, zero
                  divu         sp, t4, s0
                  srl          s10, s3, s10
                  fmv.x.w      a5, ft3
                  fcvt.w.s     zero, fs5, rmm
                  mulh         tp, s1, s0
                  fclass.s     a6, ft10
                  rem          s2, a2, s6
                  fmv.w.x      fs5, s0
                  xor          t1, ra, s8
                  mulhu        a6, zero, s10
                  sll          s9, s7, a6
                  sltiu        s10, a4, 787
                  feq.s        t4, ft10, fs1
                  fsgnjn.s     ft1, fs4, fs3
                  xori         a7, a4, -1994
                  fle.s        s2, fa4, ft3
                  srli         t4, ra, 29
                  andi         t1, t3, 87
                  srl          a1, a2, s8
                  divu         a6, t0, s9
                  mulhsu       s1, t3, s10
                  srli         s9, t0, 16
                  ori          t2, s8, 1496
                  fmv.x.w      t4, ft11
                  sra          zero, tp, t6
                  fsub.s       fs5, fs9, fa5
                  feq.s        a4, ft10, fa2
                  sra          ra, s0, s9
                  sll          a5, a0, a0
                  fcvt.w.s     a3, fa3, rup
                  srli         s5, t2, 18
                  fsub.s       ft0, ft10, ft10
                  add          t0, s1, s10
                  fmv.x.w      s10, fa4
                  div          a5, ra, s11
                  ori          t4, s9, 1082
                  fcvt.wu.s    a4, fs0, rne
                  fmv.w.x      fs1, t1
                  fcvt.s.wu    ft2, s3
                  div          a3, s10, t2
                  fsgnj.s      fs8, ft9, ft1
                  xori         a0, t6, 177
                  flt.s        s1, ft3, fs6
                  mulhsu       s7, s4, zero
                  fclass.s     s0, fs1
                  srli         t2, zero, 7
                  divu         s3, s2, t5
                  auipc        s7, 645034
                  andi         a0, s10, -646
                  fclass.s     t0, ft11
                  fsub.s       fa3, fs5, ft11, rtz
                  nop
                  fmul.s       ft5, fa3, ft6
                  and          a4, s2, a1
                  fdiv.s       ft3, ft2, fa4, rdn
                  sltiu        a6, t5, -1616
                  add          a5, t6, ra
                  add          s3, t2, t4
                  fsgnjx.s     ft1, fs4, ft10
                  fmul.s       fs5, fa4, fs1, rmm
                  fmv.w.x      ft1, t0
                  sll          s0, tp, s6
                  slli         t2, t6, 23
                  fmv.x.w      s3, ft0
                  fsub.s       fs4, ft4, fs0, rdn
                  srai         s3, t5, 27
                  fdiv.s       fa7, ft6, ft5
                  fcvt.w.s     s10, fa6
                  nop
                  div          a5, a2, a0
                  fclass.s     t0, ft4
                  div          s0, t3, s11
                  fmv.w.x      fs2, s7
                  sll          s10, tp, t5
                  auipc        a0, 847637
                  auipc        t4, 381207
                  fmax.s       ft3, ft1, fs5
                  slt          s9, a0, t6
                  rem          zero, a4, zero
                  slt          s2, s8, s2
                  fmax.s       fa1, fs4, fs10
                  srli         a4, t1, 27
                  lui          ra, 825188
                  srli         gp, a6, 10
                  addi         gp, s8, -1309
                  fmv.x.w      a1, ft10
                  fsgnjn.s     fa3, fs5, fs7
                  rem          s2, t0, zero
                  mulhu        s5, a1, s11
                  sub          a0, ra, t0
                  mulhsu       s5, zero, t5
                  flt.s        a4, fs5, fa6
                  andi         t4, a5, -611
                  fmul.s       ft8, ft4, fa7
                  ori          s7, t1, -493
                  fsgnjx.s     fs8, fs7, fs0
                  fle.s        s7, fs0, fa6
                  fsqrt.s      fs6, fa2, rup
                  mulhu        a5, a5, a4
                  sltu         tp, zero, s1
                  sltiu        s10, s0, -1794
                  srai         t0, s2, 27
                  slt          s3, s0, s6
                  andi         a6, s4, -657
                  add          s9, s6, a0
                  lui          t5, 482102
                  fadd.s       ft10, fs9, fs8
                  addi         tp, a3, -542
                  fmax.s       ft7, fs10, fa0
                  remu         s10, s2, s8
                  fcvt.w.s     s3, fs4, rmm
                  fsgnj.s      ft5, ft7, ft9
                  divu         t1, a0, s1
                  xori         s10, t4, 1553
                  or           t0, s8, s7
                  sltu         s11, zero, a5
                  fmv.x.w      t0, fs5
                  fmin.s       fs0, ft10, ft4
                  fmax.s       fa5, fs1, fa4
                  srl          s9, sp, s1
                  slt          t0, t1, a7
                  feq.s        s9, fs7, fa4
                  sltu         s11, gp, a6
                  rem          a7, s4, s6
                  slt          tp, tp, a1
                  fcvt.w.s     tp, ft4, rup
                  fsqrt.s      fs8, ft4
                  fle.s        s2, fa3, ft3
                  sltiu        s2, a3, -192
                  xor          a6, s2, s1
                  fdiv.s       fa5, fs5, ft10
                  rem          t3, s7, t5
                  fcvt.s.wu    fa2, s1, rdn
                  xor          a0, a6, t5
                  fle.s        s9, fs8, fa0
                  andi         a1, a2, 1325
                  sltiu        ra, a5, 2036
                  fcvt.wu.s    t1, ft5, rmm
                  sltu         t4, s4, s2
                  fmul.s       fa6, ft10, fa1, rdn
                  sra          t0, s8, s11
                  sltu         s5, s4, t2
                  remu         s0, a0, s2
                  mul          a6, a6, t5
                  auipc        s4, 49562
                  fclass.s     a7, ft8
                  remu         a3, a6, ra
                  slt          a4, tp, t5
                  fmax.s       fs10, ft3, fs10
                  fmax.s       fa3, ft5, fs6
                  fmul.s       fa3, ft8, fs9, rne
                  add          a4, zero, s10
                  fsgnjx.s     fa2, fs9, ft3
                  auipc        a5, 810911
                  fcvt.wu.s    t2, ft4, rmm
                  fmv.w.x      fs1, a5
                  fmul.s       fa1, fa4, fs1, rtz
                  and          zero, s11, a3
                  fcvt.w.s     zero, ft4
                  ori          t3, s3, -510
                  fcvt.w.s     a7, fa5, rmm
                  xor          a1, a0, sp
                  divu         s2, a6, t2
                  fsgnjx.s     fs10, fs10, fs3
                  mulhu        zero, a3, zero
                  sll          ra, a2, s3
                  xori         a5, s9, -1339
                  addi         s7, a2, -742
                  feq.s        t5, fs6, ft11
                  ori          a7, t6, -1247
                  and          s5, t1, s0
                  slti         s5, s11, 578
                  add          a7, s11, s0
                  fmv.x.w      s2, ft8
                  fcvt.s.wu    fs5, s11, rmm
                  slli         a0, a3, 12
                  fmin.s       fs1, fa7, ft10
                  ori          s2, s1, -1385
                  sltu         s4, a1, s9
                  flt.s        t6, fs4, fs4
                  slti         a7, s6, 442
                  mulhu        s4, s10, ra
                  sra          s9, a2, t2
                  fmv.w.x      ft9, tp
                  addi         a5, s7, 241
                  ori          a1, t4, 750
                  fsqrt.s      ft6, fs2
                  auipc        a1, 695421
                  fmax.s       ft10, fs1, fs5
                  fadd.s       fa0, fs9, fs2
                  xor          a0, t5, a7
                  and          a3, a4, a1
                  fadd.s       fs8, fa1, ft0
                  andi         a4, s3, 1181
                  flt.s        s3, ft0, ft6
                  fclass.s     t2, fa7
                  mulhsu       gp, a1, zero
                  auipc        s2, 574688
                  srai         ra, s8, 14
                  slti         t3, s6, 86
                  auipc        a6, 356441
                  fclass.s     ra, fs1
                  fsgnjn.s     ft6, fa6, ft0
                  or           a7, a7, a1
                  rem          s3, zero, sp
                  sub          t4, t1, t0
                  slti         a6, a7, 1398
                  flt.s        a4, ft8, fs11
                  fmin.s       fs1, ft6, fs8
                  mul          s9, s8, a3
                  divu         s0, s7, t4
                  andi         s7, a7, -1073
                  slli         t3, a7, 26
                  remu         s11, s1, a3
                  fdiv.s       fs7, ft2, fs7
                  auipc        ra, 805008
                  rem          a4, s8, s9
                  ori          a7, ra, 34
                  andi         a5, t0, 97
                  fle.s        sp, fs6, fs8
                  sra          a5, t4, a1
                  fclass.s     a3, fa1
                  fle.s        t1, ft3, fs0
                  fadd.s       fs0, ft0, ft11
                  mulh         t5, a7, t3
                  fadd.s       ft7, fa3, ft2, rup
                  addi         sp, s1, 778
                  fmv.w.x      ft7, a1
                  feq.s        a6, ft8, fs3
                  nop
                  sltu         s11, s2, gp
                  or           s7, t0, a6
                  rem          tp, s5, ra
                  nop
                  fmax.s       fs5, fa6, ft5
                  fsub.s       fa5, ft5, ft2
                  auipc        a4, 346157
                  divu         a0, t6, s6
                  rem          s4, s11, s6
                  sltiu        s4, s3, -964
                  fmul.s       fa7, fa5, fa6
                  sub          s0, a7, t1
                  and          a6, sp, s1
                  slli         t1, a0, 3
                  mulhsu       s11, s8, zero
                  mulh         a1, a5, gp
                  fmax.s       fa7, ft4, fs1
                  slt          a5, sp, ra
                  fsgnjx.s     fa4, fs6, fs3
                  fsqrt.s      fs5, ft9
                  srai         tp, s9, 11
                  fcvt.w.s     a3, fa4, rdn
                  remu         ra, s4, sp
                  sltiu        ra, s0, -905
                  mulhu        s11, a5, s7
                  rem          t5, s3, t1
                  fmv.w.x      fs1, s6
                  feq.s        t6, ft5, fa0
                  flt.s        t5, fs2, ft4
                  fcvt.s.wu    fa2, a3
                  fsgnj.s      ft5, ft5, ft5
                  fsqrt.s      ft9, fs1
                  fclass.s     s11, fs1
                  slli         t0, t1, 26
                  mulh         s0, s8, t6
                  addi         t5, s6, 1884
                  xor          gp, a3, tp
                  fmv.w.x      fs8, s9
                  ori          a5, a4, 1997
                  fclass.s     a1, ft0
                  srai         t0, t6, 3
                  fcvt.s.w     ft5, t1, rup
                  slt          s3, tp, s1
                  andi         t1, s7, -1596
                  mulh         s3, s2, a4
                  sra          s3, t6, s1
                  sll          s1, zero, t3
                  fsgnjx.s     ft7, ft1, fs7
                  flt.s        a7, fs10, fa1
                  andi         a3, a7, -895
                  flt.s        sp, fa7, ft4
                  div          sp, s1, a2
                  fsgnj.s      fs0, fs5, fs8
                  fsqrt.s      ft10, ft6
                  fcvt.s.wu    ft9, a0, rtz
                  srli         t6, a3, 29
                  xor          s1, t3, gp
                  fadd.s       fs2, ft6, ft8
                  mulhu        t0, sp, t6
                  mulh         t4, a4, a2
                  fdiv.s       ft7, ft4, ft5, rtz
                  slt          s2, s0, tp
                  flt.s        t4, fa0, fa0
                  fmax.s       fs0, fs4, fa0
                  feq.s        s7, fs3, ft10
                  auipc        s11, 848316
                  div          s5, a2, a4
                  fsgnjn.s     ft11, fa5, ft11
                  fdiv.s       fs4, fs10, fs1, rne
                  remu         a6, a6, s6
                  auipc        zero, 705199
                  xori         s1, s9, -1525
                  divu         t6, t0, sp
                  mulh         t4, a2, t0
                  rem          s4, a1, t1
                  add          s4, t2, a3
                  andi         s3, a2, -453
                  fle.s        s9, ft8, fa6
                  fcvt.wu.s    a5, ft0
                  addi         gp, sp, 1959
                  fdiv.s       fs10, fs7, ft0
                  fmin.s       fa1, ft9, fs11
                  auipc        sp, 716342
                  fcvt.s.wu    ft11, s2
                  sll          a1, tp, a0
                  add          gp, s11, t5
                  fmv.x.w      a3, ft9
                  fmul.s       fa6, fs10, fs3, rdn
                  sltu         a4, a4, a1
                  xori         s10, zero, 501
                  fsgnjn.s     fs4, fs2, ft1
                  sub          s10, tp, s11
                  andi         s11, s10, 1208
                  flt.s        a6, fs8, ft1
                  fmv.w.x      fs1, t6
                  fclass.s     s4, fa6
                  mulhsu       a6, t1, s10
                  and          t6, a4, tp
                  fmul.s       fs0, ft7, fs8
                  remu         s10, a7, t5
                  feq.s        a0, ft2, ft6
                  fcvt.s.w     ft0, s4
                  flt.s        zero, fa2, fs5
                  sub          t6, zero, s9
                  fsqrt.s      ft11, fa4
                  flt.s        tp, ft9, fs1
                  addi         a4, tp, -454
                  fcvt.w.s     gp, fs8
                  andi         s9, t2, -1950
                  div          t3, a1, t0
                  lui          s3, 474683
                  xor          t2, s8, ra
                  xori         s2, s7, 38
                  fmax.s       ft9, fs8, ft0
                  rem          t5, ra, gp
                  slt          a4, a7, a5
                  and          a7, t4, s10
                  or           s7, t5, sp
                  remu         a1, s7, zero
                  mulhsu       s2, s5, s7
                  srl          t2, a1, s10
                  srli         s1, a6, 24
                  addi         t6, a3, 695
                  fle.s        s4, ft3, fa2
                  slli         gp, t3, 27
                  or           s9, s11, t1
                  fsgnj.s      ft9, ft1, fs0
                  srl          a0, s6, t5
                  fmul.s       fs8, ft2, ft3, rup
                  rem          t3, s7, a1
                  mul          a6, a3, s4
                  divu         tp, s6, t2
                  sll          s1, s10, t1
                  fmul.s       ft7, fs11, fs11, rup
                  div          gp, zero, t3
                  sra          a0, s0, t4
                  slt          s1, zero, s1
                  sltu         t0, t1, s10
                  fsgnjn.s     fs9, ft4, ft4
                  fsqrt.s      ft2, ft7
                  remu         tp, t2, a0
                  srl          t5, ra, zero
                  fle.s        sp, ft11, fs4
                  slt          tp, a0, s8
                  feq.s        a3, fs7, fa2
                  sub          gp, s5, s2
                  slli         ra, a0, 5
                  sll          s7, a7, s7
                  slt          t3, t4, a0
                  mul          ra, t4, t4
                  nop
                  feq.s        t5, fa5, fa4
                  fdiv.s       fs6, fs11, ft9
                  nop
                  fdiv.s       ft7, fs1, fa6, rne
                  sltu         s7, t3, tp
                  fmax.s       fa7, fa0, fs3
                  srli         t4, t5, 17
                  fmv.x.w      a0, fa2
                  lui          ra, 636168
                  lui          s3, 1020567
                  xori         t0, tp, -468
                  flt.s        t1, fa5, fa6
                  fdiv.s       fa3, fa6, ft5, rtz
                  sra          a6, a0, t4
                  divu         s9, s10, t3
                  sra          s2, s11, t4
                  nop
                  fmv.x.w      s10, fa6
                  flt.s        t2, fa7, fs8
                  andi         a1, t1, -1101
                  flt.s        a1, fs3, fs11
                  ori          s7, t1, -380
                  auipc        a0, 857026
                  mulhsu       t5, t1, ra
                  srli         s10, s8, 11
                  fle.s        a7, fa0, fs7
                  fmv.x.w      s3, fs7
                  fmv.x.w      ra, ft6
                  nop
                  feq.s        t0, ft8, fs0
                  nop
                  fmin.s       fa7, ft10, ft9
                  fcvt.s.wu    ft9, tp, rup
                  fsgnjx.s     ft1, ft7, ft0
                  flt.s        a5, ft7, fa5
                  mulhsu       t5, a4, t6
                  fsgnjx.s     fs4, fs10, ft4
                  fsgnjx.s     fs11, fs8, fs10
                  fsgnj.s      fs0, fs9, fs6
                  fsub.s       ft3, ft7, ft6, rmm
                  sltu         t1, s10, tp
                  fcvt.s.w     fs10, a0
                  fsub.s       fs6, fs6, fs3, rdn
                  divu         s2, s5, s5
                  fcvt.wu.s    s7, fs9, rdn
                  fcvt.w.s     s4, ft7
                  mul          t2, s0, a2
                  mul          sp, s2, t4
                  xori         a5, t4, 1189
                  nop
                  xor          a7, t0, s8
                  add          s3, gp, t6
                  div          t3, a1, s4
                  divu         ra, s7, s1
                  sra          a5, s8, a3
                  mulh         s10, t2, s7
                  slt          a5, a7, ra
                  fsqrt.s      ft0, fa0
                  rem          zero, s11, t5
                  fsgnjx.s     fa0, ft5, ft10
                  fmax.s       fs10, fs3, fs1
                  remu         a3, s5, s9
                  fsub.s       fs11, fs0, fs2, rmm
                  fle.s        s7, ft6, ft7
                  fmv.x.w      t1, fa7
                  or           ra, a2, t4
                  add          t4, t1, s6
                  fsub.s       fa1, fs3, ft10, rmm
                  sub          a3, s1, t1
                  or           s2, tp, t4
                  feq.s        s1, fa3, fs2
                  fcvt.w.s     t4, ft10, rtz
                  nop
                  auipc        t4, 717900
                  div          sp, s5, t2
                  fcvt.w.s     s11, ft4, rne
                  slt          s7, s2, s11
                  div          a6, sp, s10
                  mul          a0, t0, t2
                  slti         sp, ra, 1642
                  div          a6, zero, s5
                  srai         s9, t3, 20
                  xori         a3, a0, -1499
                  sub          s9, s3, sp
                  fsgnjn.s     fs11, ft7, fs5
                  xori         t0, a1, -1300
                  fcvt.w.s     s2, fs1, rmm
                  remu         s3, gp, a3
                  fcvt.wu.s    s2, fs7
                  sltiu        a4, t3, 1024
                  fcvt.wu.s    s11, fs10, rdn
                  mulhsu       s4, t3, gp
                  lui          t2, 544743
                  fsgnjn.s     ft11, fs3, fs5
                  feq.s        a3, ft1, ft7
                  srai         tp, s6, 29
                  sltu         a7, a6, s11
                  sltiu        s2, t3, -1983
                  srli         s9, s2, 15
                  fsgnjn.s     ft1, ft2, ft6
                  fmul.s       fa5, fa3, fs2
                  mulh         zero, t1, s6
                  mul          a6, t5, s0
                  srli         s4, a2, 24
                  or           s4, s3, a2
                  sltu         s4, s4, s0
                  fle.s        t4, fa2, ft4
                  sll          s3, s2, a6
                  srl          s5, a1, s9
                  mulhsu       gp, gp, gp
                  auipc        ra, 657905
                  fmul.s       fs9, fa5, fs2
                  sltu         tp, zero, t5
                  lui          ra, 603659
                  mulhu        t5, ra, a1
                  fsub.s       ft1, fs6, ft7, rdn
                  sub          a6, t0, t4
                  fcvt.s.w     ft2, s4, rup
                  srli         a7, s2, 0
                  divu         t3, s2, a7
                  fcvt.w.s     t2, fs1, rtz
                  xor          a6, t6, a0
                  fclass.s     s7, fs3
                  fmv.x.w      a1, fs9
                  srl          s4, sp, t6
                  fmin.s       ft3, fa7, ft3
                  fsqrt.s      fa5, ft5
                  fmv.w.x      fa2, t4
                  nop
                  feq.s        a1, fs9, fa3
                  nop
                  div          s0, t5, a7
                  fadd.s       fs3, ft1, ft1, rtz
                  lui          a4, 426901
                  xor          a1, gp, t4
                  mulh         s4, a2, s6
                  or           s1, s11, s0
                  sub          ra, zero, s0
                  mulh         s9, s8, s5
                  sra          s2, s11, gp
                  sltiu        t2, gp, 1215
                  fclass.s     a4, ft6
                  fcvt.s.wu    fs1, ra
                  srai         a1, t1, 3
                  fmv.w.x      ft7, s6
                  srli         s3, s3, 8
                  nop
                  fmin.s       fa3, fs7, ft11
                  fcvt.w.s     t6, fs5, rtz
                  andi         a5, a3, -498
                  fsgnjx.s     ft4, ft3, fs0
                  fmv.x.w      s4, fs0
                  ori          t1, s4, 1650
                  sub          a6, s5, a3
                  nop
                  rem          s7, t2, sp
                  feq.s        a5, fs5, fs5
                  andi         gp, a3, -16
                  fdiv.s       fa6, ft2, ft6, rtz
                  fadd.s       fs2, fs8, ft1
                  srai         a1, s3, 14
                  fmin.s       fs10, fs9, fs4
                  addi         s11, a6, 1025
                  fcvt.wu.s    s4, fs0
                  xori         a0, t4, 1341
                  sra          a7, s8, s4
                  mul          sp, tp, a0
                  srl          a3, t4, s6
                  fdiv.s       fa2, ft5, fs7
                  fle.s        gp, fs2, ft6
                  slt          gp, a5, a0
                  fclass.s     t2, fa3
                  sra          t1, a5, t2
                  or           tp, t1, s10
                  fclass.s     a7, ft2
                  auipc        a6, 117416
                  fmax.s       fs7, fs0, ft0
                  flt.s        a7, fa3, ft9
                  nop
                  srli         s1, s7, 9
                  sltiu        tp, t0, 1706
                  rem          t3, s3, s2
                  fsgnjn.s     fs11, fa5, fs5
                  mul          gp, a6, a0
                  sltu         s7, t0, t6
                  fsub.s       fs10, fa5, fs6, rmm
                  andi         a5, a2, 616
                  add          s2, gp, s3
                  fclass.s     gp, fs3
                  slti         a0, s3, 1456
                  fcvt.s.w     fs9, tp
                  fmv.x.w      a1, ft9
                  div          t6, sp, a7
                  mul          s10, a7, t0
                  fsub.s       ft3, fa1, fa5, rtz
                  ori          s9, s11, -68
                  fdiv.s       ft0, fs0, ft4, rtz
                  fcvt.s.w     fs3, a4
                  sll          s3, a3, sp
                  fadd.s       ft9, ft0, fa4
                  lui          s10, 769013
                  remu         s9, a3, t1
                  auipc        tp, 515599
                  div          a4, t1, a1
                  xori         a7, s10, 189
                  fclass.s     s10, ft7
                  add          zero, a5, s10
                  addi         a7, s4, 1814
                  slti         s5, a1, 1044
                  fsgnjn.s     fa3, ft2, fa6
                  rem          gp, sp, tp
                  sltiu        tp, tp, -1454
                  fsgnjx.s     ft7, fs6, fs0
                  fmv.x.w      s2, fa7
                  mulh         s11, s8, s1
                  sub          t1, s10, gp
                  fmv.w.x      ft2, s11
                  remu         s4, a4, a4
                  addi         s9, gp, 367
                  remu         a7, a6, ra
                  or           a5, t3, t3
                  slt          a5, t0, sp
                  xori         a7, a7, 825
                  xor          a1, s5, a6
                  mulh         t3, t6, a0
                  srli         a1, t0, 20
                  fle.s        zero, ft9, fs10
                  div          s4, sp, s0
                  mulh         t0, a1, s5
                  fsgnj.s      fs11, fs6, fs2
                  slli         a0, s7, 3
                  and          a4, a2, s0
                  feq.s        t2, fs11, ft8
                  divu         a5, a5, s9
                  sltiu        t3, s8, 40
                  fadd.s       fa2, fs3, ft9
                  remu         s10, t4, a4
                  srli         a1, s6, 23
                  auipc        a4, 669503
                  mulh         a0, ra, s6
                  addi         s9, s4, 1732
                  fcvt.wu.s    s1, fs8
                  fcvt.s.w     fa4, zero
                  or           a5, a6, gp
                  fsqrt.s      fa6, ft2, rtz
                  addi         s11, t2, -1551
                  sltu         s1, s7, s8
                  lui          t5, 76852
                  and          t5, t0, zero
                  fsgnj.s      fs0, fa2, fa2
                  mulh         a7, t3, a0
                  mul          s1, t5, s9
                  nop
                  fdiv.s       ft10, fs2, ft10
                  rem          s0, s0, t4
                  sub          sp, a2, s5
                  fle.s        gp, ft11, ft3
                  slt          s4, s7, tp
                  flt.s        a7, fs5, fs6
                  sll          s7, a3, s1
                  fsgnjx.s     fa7, ft2, fa7
                  fmin.s       fa3, ft1, fs5
                  xori         gp, t3, 1169
                  fcvt.s.wu    fa4, ra
                  fmv.x.w      s5, ft8
                  rem          zero, t0, a6
                  xori         s0, s0, -279
                  fsgnjn.s     fs0, fa6, fs11
                  sltiu        s0, sp, 426
                  auipc        a6, 829510
                  fmul.s       ft11, fa0, fs5
                  flt.s        a7, fa5, fs5
                  fsqrt.s      fs11, fs5, rup
                  xor          t0, s10, a6
                  slti         t0, a2, 1073
                  srai         s1, ra, 16
                  add          zero, t0, gp
                  lui          s10, 580487
                  divu         tp, a1, s1
                  fmul.s       fa6, ft9, fa5, rdn
                  fsqrt.s      fa5, fa7
                  div          sp, t2, s4
                  fcvt.wu.s    a3, fa6
                  fsqrt.s      fa4, fs4, rmm
                  fsgnjn.s     ft2, fs4, ft1
                  sra          t3, t0, s5
                  fmv.w.x      fs7, s3
                  or           t5, zero, s8
                  lui          a5, 365671
                  slli         a6, s10, 15
                  fsub.s       fs6, fa4, fs5
                  fcvt.wu.s    s5, ft8, rmm
                  fmv.x.w      t4, fs9
                  mul          s4, a5, s2
                  fdiv.s       ft8, fa4, fs0
                  and          s11, s5, a1
                  fclass.s     t4, fs11
                  fcvt.wu.s    s1, fs6
                  and          s4, t0, zero
                  fcvt.w.s     s1, fs4, rne
                  srli         s5, s0, 4
                  flt.s        zero, fs6, fs6
                  slti         t6, gp, -1338
                  srl          t2, tp, s6
                  sltiu        t1, s4, 1437
                  nop
                  fmin.s       fa5, fs8, fs5
                  fsgnjn.s     ft3, fa1, fs9
                  mulhsu       t2, ra, a5
                  fmax.s       ft3, ft0, fa5
                  slt          a4, tp, a3
                  fclass.s     t1, fs10
                  fsub.s       fa7, fa5, ft6, rmm
                  lui          s10, 178986
                  fdiv.s       fs9, fa5, ft10
                  srl          sp, ra, t5
                  mul          s7, s7, s6
                  fsgnjn.s     fs0, fs10, ft4
                  fmv.w.x      fa5, s1
                  remu         s4, s5, t1
                  fcvt.w.s     t5, fs2
                  srl          s10, a5, t4
                  srl          a7, s6, a6
                  mul          a7, gp, t6
                  feq.s        t6, fa6, fa7
                  fdiv.s       fs0, fa4, fs8, rdn
                  sub          s1, ra, a0
                  slti         t1, t1, 1657
                  sltiu        t1, s4, -1276
                  fsgnj.s      ft0, ft4, ft6
                  fsgnjx.s     ft3, fa3, fa6
                  andi         a7, s8, -666
                  ori          a5, s10, 1458
                  ori          s3, t2, 632
                  slli         a0, t6, 11
                  flt.s        a1, fs6, fs8
                  nop
                  fcvt.w.s     s4, ft1
                  auipc        t2, 796847
                  fadd.s       fs8, fs11, fa3, rmm
                  fcvt.s.wu    fs10, tp
                  sltu         s1, tp, sp
                  mul          s9, s2, a3
                  and          t6, a1, a0
                  div          s10, t3, t1
                  fclass.s     s2, fs10
                  srl          sp, s10, a5
                  slti         a7, t6, -1852
                  fcvt.s.wu    ft8, a0, rtz
                  addi         s4, s10, 633
                  and          s3, a6, a5
                  flt.s        s9, fs0, fa7
                  fmin.s       fs6, fs1, ft10
                  sltiu        a5, a7, -565
                  fcvt.s.w     ft4, s4
                  auipc        s2, 731112
                  andi         a3, a6, -1895
                  mulh         s7, t2, t5
                  slti         s9, s6, -191
                  sra          a1, s7, a3
                  srl          s3, s3, tp
                  fdiv.s       fs1, fs9, fs2, rne
                  auipc        a0, 146837
                  fmv.x.w      a0, fs9
                  or           a0, zero, t6
                  sll          s1, zero, a2
                  and          t2, s0, ra
                  fmin.s       fs8, fs11, fa3
                  sra          s5, s11, s10
                  lui          t1, 592677
                  srl          s4, t2, s5
                  fcvt.s.w     ft8, s11
                  addi         a5, t0, 426
                  fle.s        t4, ft9, ft4
                  fcvt.wu.s    a0, fs11, rne
                  fle.s        t6, fa6, fa0
                  sltu         a5, s6, t0
                  fsgnjx.s     fa6, ft11, fa5
                  mulh         s2, s6, t2
                  fmv.w.x      fs1, s9
                  or           s2, t6, t6
                  srai         s5, sp, 14
                  srl          a4, ra, s4
                  fmv.x.w      s1, fs3
                  sltu         a0, a7, a7
                  srli         a6, zero, 22
                  lui          t3, 630838
                  fmv.x.w      t3, ft5
                  fsqrt.s      fs5, fs0
                  auipc        a5, 126820
                  auipc        s9, 151548
                  nop
                  sltiu        s5, gp, -1869
                  fcvt.w.s     s9, fs5
                  mul          t1, a7, s7
                  fmv.x.w      a0, fs11
                  xor          zero, t3, s7
                  fsgnjn.s     ft9, ft2, ft9
                  sra          t1, a5, t0
                  slt          t4, tp, s8
                  ori          t6, t6, -601
                  fsub.s       ft8, ft1, fa3
                  fclass.s     a1, ft6
                  fdiv.s       ft7, fs9, ft7
                  fsgnj.s      fs3, fa5, fs1
                  fsgnj.s      fs4, ft0, fa1
                  mulh         s0, s1, gp
                  fsub.s       ft5, fs11, ft2
                  fmin.s       ft10, fs0, ft10
                  fsgnjn.s     ft2, ft4, ft11
                  xori         a3, s9, 1649
                  nop
                  nop
                  mul          a5, t1, s8
                  mulh         t3, s3, t6
                  fmul.s       fs6, fa6, fs10, rup
                  sra          s2, gp, a2
                  sll          s11, t1, gp
                  addi         ra, t0, -224
                  fdiv.s       fs5, ft9, fs7, rmm
                  lui          s2, 229964
                  fmul.s       fs2, ft8, fa5
                  divu         sp, s1, t4
                  feq.s        s0, fs3, fa1
                  sltu         t6, a5, a1
                  fclass.s     a4, fs11
                  fcvt.w.s     t6, fs5
                  andi         t6, tp, 549
                  fcvt.wu.s    s7, fa7, rtz
                  fsgnj.s      fs4, ft1, fs9
                  slti         s3, t4, -1193
                  slli         t3, zero, 21
                  rem          tp, t3, s9
                  fmv.x.w      a1, fs9
                  remu         zero, zero, s10
                  fmax.s       fs6, fs5, ft2
                  add          s2, s10, a6
                  sub          gp, gp, a1
                  andi         gp, a1, 1096
                  mulh         t6, a4, s4
                  fsgnjn.s     fa3, fa0, fa1
                  sra          s11, t3, t1
                  mul          t3, s11, s4
                  fcvt.s.wu    ft5, s2
                  fcvt.w.s     a7, fa6, rdn
                  fcvt.s.wu    fs2, gp
                  sll          tp, tp, s5
                  feq.s        a1, ft5, fa0
                  mul          a1, s8, s1
                  andi         t3, a5, 733
                  fsgnjn.s     fa6, ft1, ft8
                  fsgnjx.s     fs0, fs11, ft0
                  andi         a4, a2, 1773
                  sub          s5, t0, s4
                  slt          s2, s9, a3
                  fclass.s     s7, fa4
                  fsqrt.s      fs8, fs7
                  auipc        t3, 618353
                  rem          s5, s9, s10
                  fmax.s       ft3, ft3, ft4
                  slli         s7, a6, 16
                  fcvt.w.s     t5, fs0
                  fcvt.w.s     t4, fs2, rmm
                  rem          s9, s5, s9
                  rem          t2, t4, zero
                  ori          t2, s2, -1913
                  fmin.s       ft8, fs1, fa7
                  slli         tp, a7, 7
                  ori          a1, s7, 2010
                  slli         s0, t3, 13
                  fmv.w.x      fa6, t4
                  fcvt.w.s     a7, fa2, rne
                  remu         s10, a1, s10
                  fsub.s       fa5, ft0, fs5
                  sltu         t2, a0, s4
                  remu         t6, zero, s1
                  fcvt.w.s     s11, fa1
                  rem          a7, a1, tp
                  divu         s4, a6, a5
                  fmin.s       fs11, fa7, ft0
                  div          t1, t6, s8
                  andi         t4, s8, 830
                  fadd.s       fs3, fs7, fa0
                  fsqrt.s      fs3, ft4
                  slt          s7, s7, s3
                  fmv.w.x      fs1, s9
                  div          a1, t6, s11
                  slt          tp, s10, s7
                  sll          s4, s5, s1
                  fcvt.wu.s    sp, fs2, rtz
                  fmv.x.w      zero, fs3
                  fmin.s       ft6, ft6, fs3
                  fclass.s     a1, fa6
                  add          a1, a5, a5
                  srli         s9, a5, 27
                  fmv.x.w      s4, fa4
                  mulhu        a1, s4, ra
                  sll          ra, s0, s0
                  remu         s5, a6, s2
                  sltiu        t5, a7, 260
                  fsub.s       ft0, ft0, fs2, rne
                  fcvt.s.wu    ft4, tp
                  feq.s        s5, fs1, fa4
                  fmv.x.w      a3, fa6
                  fmul.s       fs9, fa1, fa3
                  or           ra, t3, ra
                  add          zero, a1, zero
                  fsgnj.s      fs10, ft7, ft8
                  feq.s        a0, fa0, ft10
                  srl          t6, t3, s7
                  sltiu        gp, t2, 1369
                  rem          t6, s5, a5
                  divu         s5, t0, ra
                  srli         a3, s8, 4
                  sra          zero, s7, a7
                  fsqrt.s      ft4, ft0
                  auipc        t1, 201359
                  fcvt.w.s     s4, fa4, rdn
                  add          a6, gp, a5
                  mulhsu       s10, gp, a5
                  fsub.s       ft6, ft9, ft1, rne
                  addi         t6, s2, 325
                  fmv.x.w      zero, ft3
                  sltiu        tp, a1, 343
                  fsqrt.s      fs4, fa3, rup
                  xori         a4, s11, -857
                  mulh         t4, ra, a3
                  fcvt.w.s     tp, fs6, rne
                  sltu         s10, s4, t4
                  lui          t1, 28063
                  sltu         a0, s1, t3
                  sltiu        a7, a7, -1881
                  xor          t2, t0, a7
                  slli         s7, s2, 19
                  slli         a7, s1, 21
                  and          s9, a7, a4
                  fadd.s       fs7, fs2, ft10, rdn
                  and          a5, t4, a0
                  nop
                  fdiv.s       fs1, fs0, ft3
                  fmin.s       fs8, ft3, ft9
                  or           s4, s5, s6
                  fmv.w.x      fa4, s11
                  fcvt.wu.s    a3, fs9
                  flt.s        t6, ft1, fa4
                  fmax.s       ft3, fa1, ft4
                  ori          sp, gp, -1666
                  fmin.s       fs7, ft3, ft2
                  sll          t1, s10, a2
                  mulh         s7, sp, s1
                  mul          s11, s7, a2
                  fcvt.s.w     fs9, a3
                  remu         t6, s2, a1
                  rem          a1, s2, a2
                  mulhu        t4, a5, s5
                  sra          s11, zero, t1
                  addi         s5, t5, 504
                  fcvt.s.wu    fs0, a6
                  slli         s5, a0, 18
                  sltu         s1, s3, s9
                  div          t1, s8, sp
                  sll          t5, ra, t5
                  fcvt.s.wu    fs11, s1
                  mulhu        s1, s2, s6
                  xori         t1, sp, -1233
                  srl          s5, t6, t6
                  srai         s10, s2, 25
                  fmin.s       fs1, fs1, fs7
                  fcvt.wu.s    t0, ft1, rdn
                  fle.s        a0, ft9, ft5
                  ori          t3, s10, 144
                  div          sp, t5, a0
                  nop
                  fdiv.s       fs1, fa1, ft8, rup
                  mulh         t0, s0, a4
                  nop
                  xor          t3, ra, s11
                  mulhu        s4, t2, s0
                  slti         t5, tp, 2043
                  fmul.s       fs8, ft7, ft4
                  ori          s7, s6, -1047
                  mulhsu       t0, s2, s8
                  fsub.s       fa6, fa6, fa4, rne
                  sub          a7, a5, s7
                  fcvt.s.wu    ft2, t6
                  sltiu        t6, t4, -16
                  fclass.s     t4, fs9
                  or           s11, a0, a6
                  fmax.s       fa0, ft1, fs1
                  div          s2, a1, a2
                  sltu         s0, t0, s10
                  mulhsu       t1, a2, t0
                  sltu         a7, a2, t1
                  fdiv.s       fs9, ft10, ft10, rdn
                  fcvt.w.s     gp, ft6, rne
                  flt.s        t2, fa2, ft10
                  div          s7, s1, ra
                  lui          t3, 221496
                  mulhu        s7, a5, gp
                  fclass.s     t5, ft7
                  feq.s        s3, fs4, fs8
                  fmul.s       ft2, ft2, fs8, rne
                  fsub.s       fa7, ft9, ft9, rne
                  fadd.s       fs6, fs4, fs11
                  slt          t4, s0, s3
                  slt          t3, sp, t1
                  fsqrt.s      fa3, ft2, rmm
                  fmax.s       fs3, fa3, ft7
                  fmul.s       ft5, ft11, fs10
                  mulhu        t4, s0, s5
                  ori          a3, t2, 1547
                  addi         a4, t4, -1409
                  mulhsu       ra, t2, a3
                  feq.s        t4, fa0, ft6
                  sra          s2, t6, t4
                  feq.s        a0, fa5, fs8
                  mulh         t0, t6, gp
                  slt          s10, a7, a5
                  srl          s3, ra, sp
                  fclass.s     s0, fa3
                  fdiv.s       fs0, fs6, fs3
                  addi         s0, t4, -1428
                  srl          gp, s11, a4
                  remu         s0, gp, a0
                  fsgnjn.s     fa7, fs2, fs11
                  sub          tp, s5, a6
                  fsgnj.s      fa2, fa2, ft10
                  andi         a7, s0, -215
                  srai         t0, s4, 10
                  mul          t0, a0, s11
                  fmin.s       fs11, ft5, fs11
                  lui          gp, 487709
                  and          s11, s3, s10
                  fcvt.wu.s    t1, fa6
                  sra          s4, a0, s7
                  xor          s3, s4, s8
                  xor          s4, s6, ra
                  or           gp, a1, gp
                  fsgnjn.s     fs11, fs5, ft6
                  fsqrt.s      fs0, fa1
                  slt          t6, a2, gp
                  fsgnjx.s     fs9, fa2, fa6
                  fsqrt.s      ft3, fs4
                  div          s3, gp, s0
                  sra          s3, tp, s4
                  and          s1, a1, a2
                  fsgnjn.s     fs1, ft11, ft8
                  fcvt.s.wu    ft1, s3
                  fclass.s     tp, fs4
                  mul          a6, a1, t0
                  nop
                  fcvt.s.w     fs4, a6
                  feq.s        t5, fa3, ft2
                  divu         s2, t6, a7
                  slti         t2, t3, -312
                  fclass.s     s0, fs9
                  srl          a4, a7, s6
                  fcvt.s.w     ft0, t0, rdn
                  slli         a4, s4, 2
                  sra          a7, s6, s11
                  mulh         t1, s3, s10
                  slt          a6, a6, s11
                  sltiu        a0, a2, 1922
                  srai         s2, tp, 15
                  mulh         s5, s9, s5
                  fcvt.s.w     fs7, t3, rdn
                  slt          s3, s2, sp
                  fmin.s       fs8, fs11, ft7
                  slt          t1, s0, t0
                  div          s10, s1, a1
                  fcvt.w.s     a5, fa5, rne
                  fmin.s       fa7, ft5, ft6
                  ori          gp, t2, 1676
                  fmv.w.x      ft5, t0
                  mulhu        a6, t6, zero
                  srli         a3, a5, 19
                  nop
                  sra          s1, t5, a1
                  fsgnj.s      fs5, fs7, fs11
                  fcvt.wu.s    zero, ft8
                  ori          gp, s6, -1247
                  mulhsu       t2, s4, t5
                  sub          gp, t4, s3
                  fsgnjx.s     fa7, fs10, fa0
                  fsgnj.s      ft8, fs4, ft1
                  fmax.s       fa2, fs4, ft6
                  slt          t0, t4, t4
                  sll          t6, s8, s3
                  fsgnjx.s     fs9, fs9, fs2
                  xori         a0, t4, 2017
                  mulh         s10, zero, a0
                  fcvt.s.wu    fs10, a4, rup
                  slti         s0, tp, -2031
                  sltu         t2, s0, s2
                  fcvt.s.w     fa6, zero
                  fsgnjx.s     fa6, ft6, fa6
                  addi         s4, t6, -84
                  srl          a4, t4, s3
                  fdiv.s       fa5, fs9, ft10
                  fcvt.s.w     ft1, zero
                  slli         s3, t5, 3
                  fcvt.wu.s    a4, fs10
                  srli         a1, s6, 29
                  fsgnjx.s     ft0, fa1, fs2
                  fle.s        t6, fa6, ft7
                  mul          s9, s2, s7
                  sltiu        sp, a0, -1671
                  or           s3, s7, s11
                  fcvt.w.s     s11, ft6, rup
                  sub          a3, a3, a5
                  flt.s        s7, fs11, ft0
                  slt          s0, a1, a4
                  auipc        t1, 911742
                  feq.s        t0, fa3, ft0
                  sltiu        s1, s6, 1511
                  mulhsu       a1, t3, s0
                  mulhu        sp, a2, t3
                  and          s1, s11, s11
                  mulhu        a7, a6, a3
                  srli         s2, s2, 1
                  and          tp, a7, t5
                  divu         s3, a4, s1
                  sltu         a6, a7, s7
                  fle.s        a7, fs9, fs11
                  sll          zero, s4, a4
                  sra          a6, a3, t6
                  remu         ra, s0, sp
                  xori         s1, gp, -705
                  srl          t0, s6, s5
                  fsgnjx.s     fa5, fs11, fs10
                  fmv.x.w      t3, fs3
                  xori         t1, a0, 1979
                  add          t2, a4, s11
                  feq.s        s10, ft0, fs7
                  flt.s        s7, fs8, ft5
                  xori         t4, a1, 365
                  slt          gp, t1, a1
                  feq.s        s10, fs1, fs8
                  and          a3, t3, s6
                  fsqrt.s      fs3, ft0, rdn
                  flt.s        s7, fs2, ft5
                  xori         t5, s2, 42
                  flt.s        a6, fa7, ft9
                  sltiu        s9, s6, 495
                  fdiv.s       fs6, ft8, ft1
                  xor          tp, s6, t3
                  andi         gp, t2, 494
                  addi         s4, t5, -243
                  fclass.s     s1, ft0
                  fsgnj.s      fa7, ft4, fa0
                  fcvt.w.s     a5, fs4
                  mul          gp, t0, s10
                  fsgnj.s      fs4, ft2, fa3
                  fsgnjn.s     fs2, ft4, fs2
                  fsub.s       fa4, ft7, fa5
                  sltu         t1, s3, t5
                  fmv.w.x      fs2, s1
                  sll          t5, a1, t6
                  fmv.x.w      a4, fs7
                  ori          a5, a0, 967
                  mulhsu       tp, tp, s3
                  srli         a1, t3, 9
                  sll          s1, t0, t3
                  sll          a0, s0, tp
                  sltiu        a0, a5, -1783
                  mulhu        t1, s0, s9
                  fsgnjn.s     fs6, fa2, fs9
                  fcvt.s.wu    fa0, t5
                  auipc        a4, 936257
                  fsqrt.s      fa5, fs10
                  fdiv.s       ft9, fa6, fa7
                  sltiu        a0, t6, -970
                  srai         a6, s7, 9
                  fclass.s     t6, fa7
                  divu         a6, sp, s5
                  slli         t2, ra, 7
                  sub          t0, s11, s4
                  nop
                  nop
                  xori         t3, s5, -712
                  andi         zero, a2, 1951
                  rem          a6, s7, a6
                  remu         s3, gp, t6
                  divu         s9, s1, s4
                  sra          s7, sp, t0
                  lui          a5, 167669
                  sub          s9, ra, sp
                  fsgnj.s      fs0, fa1, fa6
                  fclass.s     a3, fs1
                  addi         s4, s2, 1235
                  fcvt.s.wu    fs5, s1
                  fle.s        s0, ft9, ft0
                  sll          s11, s4, a4
                  fsqrt.s      ft8, fs4
                  or           ra, sp, a5
                  lui          tp, 93798
                  divu         s0, s9, a3
                  feq.s        s0, fs1, fs1
                  remu         s5, s11, t5
                  srl          t6, s9, s9
                  slt          a6, s7, s2
                  fadd.s       fa2, ft1, ft2, rdn
                  fmax.s       fa6, fs4, fs8
                  addi         t0, t0, -287
                  fsub.s       ft3, fa5, ft7, rmm
                  fmv.x.w      ra, fa2
                  andi         s5, zero, -1047
                  ori          s11, zero, -643
                  fcvt.s.wu    ft10, s5
                  fsgnj.s      fs0, fs4, fa0
                  addi         t2, t1, -246
                  fcvt.s.wu    ft4, a5
                  sra          s7, s11, s0
                  mul          t3, t3, a4
                  ori          s5, t0, -2023
                  fsub.s       fa7, fs6, ft9
                  fle.s        ra, fs8, fs11
                  flt.s        t3, ft0, fa1
                  fdiv.s       ft3, ft3, fa1, rmm
                  srli         s0, tp, 27
                  fmv.x.w      a1, ft11
                  div          sp, s10, s6
                  mul          t2, s1, t3
                  fdiv.s       ft1, ft8, fa4, rdn
                  slti         tp, s6, -1005
                  fmul.s       ft4, ft6, ft0
                  fcvt.s.w     ft7, t0
                  sltiu        tp, s3, 1574
                  fsgnj.s      ft1, ft4, fs5
                  slt          a4, a7, gp
                  addi         a5, a3, 1976
                  or           s4, t2, t3
                  sltiu        t4, a7, 1941
                  fcvt.wu.s    a7, fs7
                  fmin.s       fs4, fs1, ft1
                  fsqrt.s      ft6, fa7, rne
                  sra          a1, t0, t4
                  sra          s9, s2, s2
                  mul          t2, a6, a6
                  fmv.x.w      s9, ft8
                  fmin.s       ft3, fs10, fa7
                  fmul.s       ft6, ft3, fs9
                  fclass.s     s5, fs7
                  fmin.s       fs5, fs0, fs1
                  srli         s11, a2, 7
                  mulh         gp, s7, t3
                  nop
                  fsgnjn.s     fa6, fs8, ft4
                  remu         a4, s8, t4
                  fadd.s       fs5, fa5, fa5
                  fle.s        a7, fa6, fa2
                  fle.s        zero, ft7, fs7
                  feq.s        t6, fs3, fs8
                  or           s10, gp, a5
                  fcvt.wu.s    t6, ft9, rdn
                  auipc        t0, 367762
                  fle.s        t0, fa5, fs9
                  or           a7, sp, a0
                  fmin.s       ft0, ft9, ft2
                  fcvt.s.wu    ft8, t0
                  rem          s7, t1, a0
                  auipc        a7, 446598
                  xori         s1, s4, -733
                  xori         a7, t4, 414
                  fsgnjx.s     ft3, fs10, fs10
                  or           t2, sp, s7
                  fdiv.s       fs10, fa4, ft9, rmm
                  slt          tp, t0, s11
                  fcvt.wu.s    tp, ft10, rdn
                  slt          gp, t1, s6
                  xor          a3, s0, t5
                  and          a7, s9, s6
                  mulhsu       a6, ra, s6
                  fcvt.w.s     s1, ft6
                  nop
                  mul          zero, s6, gp
                  sub          a6, t4, a6
                  slli         s1, t2, 5
                  add          s10, s10, s9
                  srl          a5, a6, t3
                  mulhu        t4, a5, s2
                  auipc        a7, 662034
                  sltiu        t1, t5, -1618
                  fdiv.s       fa2, fa6, ft7, rmm
                  slli         t0, tp, 15
                  nop
                  sltu         t6, s11, t0
                  srli         t2, s6, 0
                  fcvt.wu.s    s5, fa2, rdn
                  divu         gp, t5, a7
                  sub          t6, a1, s9
                  mul          zero, a7, s5
                  fmax.s       ft8, fs5, fs9
                  fadd.s       fs11, fs9, fa1, rdn
                  fclass.s     a7, fs5
                  mulhsu       a4, a2, a7
                  nop
                  rem          t1, a6, s10
                  flt.s        t5, fa3, fs7
                  srl          s7, t1, a3
                  fcvt.w.s     t3, ft8
                  fsqrt.s      fs9, fs11, rdn
                  fclass.s     t0, fa6
                  sub          a4, sp, t2
                  fadd.s       fs1, ft6, fa5
                  ori          t2, s11, 976
                  slt          s2, zero, t1
                  ori          s4, s2, 704
                  fsgnj.s      fa4, ft11, fa0
                  slt          s0, a5, t6
                  fcvt.wu.s    a4, fs6, rne
                  slli         s4, s3, 30
                  fmv.x.w      a4, ft8
                  fmax.s       fa1, fs2, fa6
                  sub          a6, s6, a5
                  xor          a0, t1, a5
                  sra          a6, a1, sp
                  divu         a1, gp, s0
                  rem          zero, s9, a4
                  feq.s        a1, fs10, fs10
                  xor          s1, zero, a2
                  fmv.w.x      ft4, a2
                  fsgnjn.s     fa6, fs7, fa5
                  or           gp, a7, t6
                  sltiu        t4, t0, -11
                  rem          s11, sp, gp
                  xor          a1, sp, t5
                  div          s9, s3, s7
                  fcvt.s.wu    ft8, s6
                  fmv.w.x      ft2, t0
                  mul          gp, s1, s7
                  fsgnj.s      fs8, ft2, fa2
                  fsgnjx.s     ft9, ft6, fs6
                  addi         s3, s7, -1990
                  ori          zero, s9, -725
                  fsub.s       ft4, fs6, fa1
                  slli         s9, ra, 20
                  divu         s5, a0, a4
                  mulhsu       zero, s7, a5
                  or           t4, a1, t0
                  nop
                  slti         t5, t1, -717
                  div          a6, zero, s2
                  srli         t4, a0, 6
                  fdiv.s       fs7, fs3, fs3, rtz
                  srai         t6, t1, 6
                  add          s3, a6, s10
                  slt          t3, a6, zero
                  xori         gp, t5, -1362
                  xori         t0, a3, 1986
                  feq.s        t2, ft2, ft2
                  fsgnjx.s     fa3, ft11, fa3
                  fcvt.s.w     fs8, s2
                  fcvt.wu.s    t2, ft2, rtz
                  flt.s        zero, fa0, fa1
                  andi         a6, a3, 854
                  srli         a5, t2, 26
                  srl          s5, s2, t1
                  or           t6, s11, a7
                  fmv.w.x      fs4, t1
                  fsqrt.s      fa7, ft5, rdn
                  rem          s4, tp, s6
                  slt          t2, a2, s10
                  mulhsu       zero, s2, s2
                  or           s3, a4, s0
                  sll          s11, t3, sp
                  fsgnjn.s     fs2, ft10, fs11
                  divu         s5, t6, s4
                  div          s0, zero, s9
                  lui          ra, 781861
                  fsgnjx.s     ft10, ft2, fs3
                  div          a7, t0, t5
                  div          gp, t4, a4
                  flt.s        zero, ft3, fs8
                  fcvt.s.wu    ft8, s3, rup
                  srai         s11, t2, 8
                  fcvt.w.s     s11, fa5, rup
                  fsgnj.s      fs4, ft6, fs1
                  lui          s4, 1028143
                  mul          gp, s2, zero
                  flt.s        t5, fa1, ft0
                  fdiv.s       fs0, fs7, fs2, rtz
                  slt          zero, a7, zero
                  slt          ra, s11, a5
                  lui          s0, 484131
                  fadd.s       fs4, fa6, fs2
                  addi         a4, s6, 1946
                  slti         s9, s1, -527
                  fcvt.s.wu    ft8, t4
                  fle.s        s0, fa2, fs3
                  sltiu        ra, gp, 1533
                  sltu         a0, s2, s11
                  remu         t4, s4, a2
                  fle.s        tp, fs11, ft8
                  sra          s3, s4, s10
                  fmv.w.x      fs11, s11
                  fmv.x.w      t3, fa5
                  mul          s4, s2, s1
                  sltu         t6, s2, s10
                  remu         t2, t6, s2
                  srai         s11, s6, 0
                  slt          a7, s8, t3
                  slt          a7, s9, sp
                  andi         t6, s3, -1382
                  xor          s5, ra, a1
                  srai         t0, zero, 17
                  auipc        a6, 898324
                  fcvt.wu.s    s4, fs11
                  fsgnj.s      fs1, ft10, fs5
                  andi         gp, a3, -1042
                  or           t6, t6, tp
                  fclass.s     a1, ft6
                  fcvt.s.wu    ft8, sp, rmm
                  mulhu        s0, t4, gp
                  fsgnjn.s     fs4, fs6, ft5
                  add          a7, s4, a5
                  nop
                  nop
                  mulh         s10, s7, a3
                  divu         sp, s11, a7
                  feq.s        gp, ft4, ft3
                  slt          a0, t5, a3
                  nop
                  ori          s4, a3, 1484
                  fcvt.wu.s    a6, fs3, rdn
                  remu         t2, s0, t6
                  xor          s5, s0, t3
                  add          zero, s9, s10
                  fle.s        s10, fs6, fs6
                  mul          a7, a7, t2
                  add          s10, a7, s10
                  lui          zero, 433332
                  sub          s9, a1, s8
                  fcvt.w.s     t3, fa1
                  addi         a7, a6, -453
                  fsub.s       fs4, ft7, ft7, rne
                  xori         s9, s11, -1290
                  slti         a0, a7, 1527
                  sra          a6, s3, a4
                  fmv.x.w      a1, ft3
                  ori          s7, t6, -1447
                  xor          a0, t3, gp
                  nop
                  sll          a4, gp, a2
                  lui          s3, 606148
                  mulhu        t0, s9, s10
                  auipc        t4, 769362
                  add          ra, a2, s10
                  sra          t3, sp, t6
                  mul          s7, s10, a1
                  remu         t3, a7, ra
                  andi         s0, t4, 1766
                  div          s2, s0, t4
                  fmin.s       fs0, ft7, fs6
                  fmv.w.x      fs10, sp
                  srai         t2, t1, 29
                  sll          s7, ra, s6
                  srli         s7, s6, 7
                  and          a0, s7, a0
                  xor          t3, tp, a1
                  divu         t3, a2, t3
                  mulhu        t3, s10, s9
                  fsgnjn.s     ft7, fa1, fs1
                  or           s3, tp, ra
                  fcvt.s.w     ft10, a3
                  srai         zero, s7, 29
                  flt.s        a5, fa0, fa3
                  remu         a4, s9, a7
                  mul          t6, s2, a1
                  fclass.s     t5, ft7
                  fcvt.s.w     fs1, t4
                  div          t1, tp, t2
                  xori         zero, s1, -98
                  sltiu        sp, ra, 1896
                  fclass.s     a3, ft9
                  andi         tp, s11, -739
                  fsgnjn.s     ft9, fs7, fs4
                  andi         tp, a1, 570
                  add          s10, s9, sp
                  div          tp, a1, gp
                  slli         s2, t1, 28
                  srli         a7, a5, 13
                  mul          t0, s3, sp
                  auipc        s10, 369295
                  andi         a5, t4, -788
                  mul          sp, s4, s0
                  andi         s1, a2, 2030
                  slt          a6, a7, a6
                  fsqrt.s      ft11, fs0
                  or           t4, s1, ra
                  slti         sp, t1, 879
                  slt          ra, gp, zero
                  sra          a6, t1, sp
                  ori          s5, gp, 429
                  slt          sp, s0, t6
                  fsqrt.s      ft4, fs1, rup
                  ori          s1, a4, -1885
                  flt.s        s7, fs10, ft4
                  auipc        s3, 137510
                  divu         t1, a1, s8
                  fcvt.s.wu    ft8, a3, rmm
                  xori         t1, s6, -473
                  fsgnjn.s     fs0, fs0, fs10
                  fsgnj.s      ft7, fs9, ft5
                  slti         t4, s11, -680
                  fsqrt.s      fs9, fs1, rmm
                  fmv.x.w      tp, fs8
                  auipc        gp, 912072
                  fsgnj.s      fs6, fs7, fa7
                  lui          a6, 341335
                  sra          t3, s5, tp
                  fle.s        a0, fs4, ft10
                  fclass.s     a3, fa1
                  fdiv.s       fa4, fs1, fa7
                  slli         s5, a5, 20
                  fmin.s       ft9, fa7, ft10
                  andi         a5, s10, 40
                  fsgnjx.s     fa0, fs6, ft3
                  fle.s        s4, fs7, fa2
                  mulh         t0, s0, s9
                  fadd.s       fa7, fa5, fs9
                  sltu         a6, s1, ra
                  fadd.s       fs5, fs7, fa2, rdn
                  fmin.s       fs7, fs6, fa4
                  auipc        gp, 908152
                  fsqrt.s      fa5, fa1
                  xori         a3, zero, -1577
                  fcvt.s.wu    fa3, t2
                  fclass.s     a3, ft6
                  remu         zero, s1, s11
                  slli         tp, s2, 10
                  fsgnj.s      fa2, fa6, fa2
                  sra          s11, s7, tp
                  fmul.s       fs8, fs7, ft1
                  feq.s        a3, ft5, fa5
                  fsub.s       fs6, fs4, fa1
                  fmin.s       fs10, fa0, fa3
                  sub          t5, s3, s7
                  sra          a5, s2, a2
                  fcvt.w.s     s11, fs8, rmm
                  add          a1, t3, a7
                  fmul.s       fs10, fa7, fa6
                  srli         s2, a6, 18
                  fsgnj.s      ft2, ft7, ft0
                  remu         t4, s10, t6
                  fcvt.w.s     ra, fs10
                  ori          s3, a4, 1549
                  lui          ra, 548314
                  xor          s5, s6, s5
                  fsgnj.s      ft5, fs1, ft5
                  fcvt.s.wu    fa7, s2
                  div          a7, ra, s5
                  ori          t4, s3, 993
                  fmax.s       fs10, fs2, ft8
                  fcvt.s.w     fs8, a0
                  mul          s11, s2, s0
                  fsub.s       ft0, fa0, ft4, rtz
                  fcvt.w.s     s1, ft6
                  fcvt.s.wu    fs3, s6, rmm
                  slli         t4, a5, 21
                  andi         s5, a0, 764
                  feq.s        t5, fa7, fs11
                  fsgnj.s      fs2, fa4, ft6
                  slli         ra, zero, 26
                  fclass.s     t0, fa5
                  srli         t1, s11, 28
                  lui          ra, 120961
                  nop
                  divu         a0, t4, a5
                  sltu         s10, t3, a2
                  sltu         a6, s7, s3
                  fcvt.w.s     a6, fs10
                  fsgnjn.s     ft10, fa6, ft7
                  fmin.s       fa0, fs8, fa6
                  feq.s        gp, ft8, fs1
                  flt.s        s4, fs0, ft4
                  mulh         s4, s9, t1
                  fcvt.s.w     ft0, gp
                  rem          tp, a6, gp
                  srl          gp, a5, s9
                  fmv.w.x      fa6, t2
                  fmin.s       fs8, fa3, ft1
                  xori         t3, a5, 1596
                  fmv.w.x      ft3, sp
                  div          s10, gp, s8
                  fsgnjn.s     fs4, fa5, fs5
                  sub          a7, t0, s4
                  fmv.w.x      fa1, s9
                  fdiv.s       fa6, fa2, ft8
                  fmv.w.x      fs11, s4
                  div          t0, s8, sp
                  divu         s11, s1, a4
                  slli         zero, tp, 24
                  fsgnj.s      fa3, ft0, fs1
                  fmul.s       fa0, fs4, ft10
                  mulh         s11, t5, t5
                  mul          s9, a7, gp
                  fsub.s       fs4, fs9, fa5, rup
                  divu         zero, t5, s5
                  divu         zero, a7, s3
                  fmv.w.x      ft6, s10
                  fle.s        a3, fs10, fs3
                  addi         t6, a6, 976
                  fmv.w.x      ft2, a3
                  fcvt.wu.s    sp, fa0, rdn
                  feq.s        s2, ft9, ft9
                  sub          s1, t1, t0
                  slli         a3, t3, 26
                  srl          a6, a6, a1
                  mulh         s9, s4, zero
                  fcvt.wu.s    a5, fa3
                  sra          s7, s10, s4
                  sub          a4, tp, a4
                  and          s10, s3, a0
                  slt          gp, t4, a5
                  xori         t6, t2, -1479
                  fmax.s       fs8, fa1, fs7
                  remu         s5, s9, a0
                  srai         s11, t6, 13
                  xor          s10, a0, s1
                  fsgnjn.s     fs3, fs6, fs2
                  fadd.s       fs1, fs3, fa3, rtz
                  addi         zero, s6, -1754
                  nop
                  fmv.x.w      a4, fs7
                  fadd.s       fa7, fs4, ft6
                  fle.s        sp, fa2, ft11
                  mulhsu       sp, s0, ra
                  rem          s1, s0, t3
                  sltu         t0, ra, ra
                  fsgnjn.s     fs0, fs3, fs0
                  sltu         t3, ra, ra
                  div          t2, a5, t0
                  slt          a7, sp, t6
                  fsub.s       fs8, ft11, ft9, rdn
                  andi         s9, s8, -494
                  sltiu        s10, s1, -96
                  ori          ra, t3, 727
                  fsub.s       fs11, ft5, fs0
                  mul          a3, t3, s10
                  fmax.s       fa4, fs8, ft2
                  srl          t3, s0, a2
                  fadd.s       ft1, fs9, ft5
                  fmul.s       ft6, ft6, fs4
                  sltiu        t5, sp, -73
                  remu         s0, s8, a0
                  sltiu        s2, s4, -892
                  lui          a3, 778279
                  fmax.s       ft8, fs0, fa0
                  fcvt.s.wu    fs1, a0
                  fclass.s     t1, ft5
                  slti         s1, tp, -1204
                  sltiu        ra, t0, 287
                  fcvt.s.wu    fs8, s8
                  rem          a4, t1, t3
                  fmax.s       ft5, ft4, ft9
                  rem          t2, zero, s9
                  fsgnj.s      ft11, fa1, fs1
                  auipc        gp, 625003
                  nop
                  fcvt.s.wu    fa2, a4
                  auipc        s3, 811550
                  divu         s9, s9, t2
                  fmul.s       fs10, ft5, fa0, rup
                  fmin.s       fs7, fs4, fs2
                  nop
                  ori          s5, s1, 1370
                  fmv.w.x      fs10, s11
                  fsgnjx.s     fs8, fs3, fs4
                  and          s7, ra, a3
                  auipc        sp, 516680
                  rem          a7, a5, t1
                  slti         t1, t3, -1590
                  slti         t2, a1, 1248
                  fle.s        a7, ft10, fs6
                  or           a7, a6, s9
                  slt          a3, s9, s5
                  sra          t5, a7, t4
                  mul          a4, s11, a1
                  remu         t0, t0, s7
                  fsgnj.s      fs11, fs11, ft10
                  fmax.s       ft8, ft0, fs4
                  feq.s        s1, fs0, ft9
                  slti         t1, zero, 1131
                  mulhsu       s2, sp, a2
                  fsqrt.s      fs5, fa1
                  sll          s1, t0, t4
                  slti         s7, a1, 1586
                  fmv.x.w      s3, fa0
                  feq.s        s3, fa0, fs0
                  slti         tp, a1, 1758
                  add          zero, t4, s0
                  slli         a3, s0, 27
                  fcvt.wu.s    s1, fs6
                  slti         s2, s2, -23
                  fcvt.wu.s    t5, fa6
                  fdiv.s       ft2, fa2, fa5, rmm
                  fle.s        s4, fa0, ft11
                  srli         a0, s11, 19
                  mul          s1, t5, s9
                  sub          a7, s11, s3
                  or           s9, s3, a6
                  fdiv.s       fa4, fs5, fa7
                  nop
                  ori          t4, t0, -942
                  xor          gp, zero, gp
                  andi         t6, s0, -579
                  fcvt.s.wu    fs0, s3, rtz
                  fadd.s       fa4, ft9, fa5
                  divu         s4, a2, s4
                  fmin.s       fs10, fs2, fs8
                  fsgnj.s      fa7, fs7, ft5
                  ori          t1, t2, 857
                  srl          a3, s5, t4
                  fmin.s       fa6, fs0, fa2
                  srai         a5, t3, 10
                  sltiu        a7, t2, 1175
                  slt          s2, a7, a6
                  srai         t3, a6, 18
                  div          a3, s2, a6
                  fcvt.w.s     t2, fs11
                  fdiv.s       fs6, ft7, ft9, rtz
                  slti         a6, sp, 542
                  slti         a3, a4, -1841
                  rem          a3, t2, a5
                  sltiu        t4, sp, -845
                  fdiv.s       fa7, ft5, fs0, rdn
                  and          s2, t1, a0
                  xor          s3, t3, a1
                  lui          t0, 471994
                  fsub.s       fs11, fa5, fs4
                  slli         a5, a3, 21
                  sltiu        s7, s3, -846
                  fsgnjn.s     fs1, ft4, fa0
                  xor          zero, s9, zero
                  xor          a5, t3, s8
                  fle.s        t1, fs3, fs9
                  divu         sp, s2, tp
                  fcvt.s.w     fs11, s1, rup
                  remu         a6, a0, s0
                  fcvt.s.wu    ft0, sp
                  rem          s2, t4, t2
                  fsgnj.s      ft0, fs6, ft2
                  slt          a5, s5, t0
                  sll          ra, t5, t4
                  slti         s1, sp, 1136
                  feq.s        a4, fs3, ft7
                  sub          a3, t2, a3
                  fmin.s       fs0, fa7, fa5
                  remu         t6, s11, ra
                  fcvt.s.w     fs3, a4, rup
                  slti         zero, a2, -935
                  fcvt.w.s     t5, fs1, rne
                  fmin.s       fa5, ft4, ft0
                  fclass.s     a0, ft7
                  fmv.x.w      s3, fs0
                  divu         a6, sp, a0
                  fcvt.s.w     fa4, ra
                  sltiu        t6, t6, -1066
                  fdiv.s       ft5, ft10, ft8, rup
                  fsgnjn.s     fs0, fs7, ft10
                  flt.s        t2, fs6, fs10
                  fcvt.s.w     fs8, t5
                  feq.s        gp, fs8, fs8
                  auipc        a3, 675786
                  fsgnjn.s     fa7, fa5, ft8
                  fmul.s       fs4, ft10, ft7
                  fmv.w.x      ft3, a6
                  fdiv.s       ft7, fa1, ft6
                  fmin.s       fs3, fa3, fs3
                  srli         tp, s9, 27
                  fadd.s       ft2, fa3, fs11
                  divu         t2, s10, zero
                  fsqrt.s      ft10, ft4
                  fsgnjx.s     fs6, fs1, ft5
                  fadd.s       fa5, fa0, fa3, rdn
                  slt          t0, s8, s11
                  fdiv.s       ft10, fs10, fs0, rup
                  xor          gp, a5, t6
                  fcvt.w.s     gp, ft5
                  fsgnj.s      fa7, ft1, fs7
                  addi         a7, s3, -435
                  xori         t0, a5, -1227
                  fsgnj.s      ft7, fa4, fs11
                  xori         t3, s9, 680
                  srli         a0, s10, 27
                  srai         a3, s3, 12
                  fadd.s       fa6, fa6, fa4
                  mulh         a1, t4, a5
                  fclass.s     t0, ft2
                  ori          a3, s7, 1307
                  lui          s2, 542815
                  xor          a6, s5, s11
                  fdiv.s       fs1, fa7, ft11
                  mulhsu       sp, s5, s4
                  sll          tp, gp, s1
                  fmax.s       ft6, ft8, ft8
                  fle.s        t4, fa3, fa7
                  fcvt.wu.s    a6, fs7, rne
                  feq.s        t0, ft9, fs2
                  fmv.x.w      t0, fa0
                  mulh         a6, s8, s0
                  fdiv.s       ft5, ft4, fa2, rne
                  ori          t4, s6, 755
                  auipc        t1, 472476
                  fsqrt.s      ft2, ft10
                  nop
                  slli         t5, zero, 10
                  andi         s5, t2, -1693
                  fsqrt.s      ft8, ft11
                  and          t0, a7, s1
                  sltu         ra, s9, a0
                  fmax.s       ft11, fs7, fa0
                  fcvt.s.wu    fs0, gp
                  fmv.w.x      fs8, a6
                  div          s10, s7, a1
                  fadd.s       fa7, fs9, fs2, rmm
                  slli         a4, s4, 0
                  mulhu        ra, gp, s0
                  sub          a5, a6, sp
                  mulhsu       t2, t5, a0
                  fmin.s       fa2, ft5, ft4
                  xori         tp, s9, 1384
                  lui          s10, 582353
                  addi         s2, s2, -300
                  fmul.s       fs3, fa4, fa3
                  sll          s7, a6, t2
                  fdiv.s       ft4, ft0, fs6, rne
                  fclass.s     t5, fs0
                  nop
                  andi         a4, s9, -68
                  mulh         a5, s1, tp
                  fsub.s       fs7, fs4, ft5, rup
                  slti         a0, a0, -1432
                  add          a7, a6, t3
                  fadd.s       fs3, ft5, ft0, rmm
                  fmul.s       fs3, ft9, fs1, rtz
                  fmax.s       fs7, fs6, fs8
                  fmv.x.w      t4, fa6
                  div          a0, s10, tp
                  fsgnjx.s     ft1, ft9, fs10
                  mul          a7, s7, gp
                  flt.s        s7, ft8, ft11
                  div          a0, t0, t2
                  div          s11, s6, t5
                  xori         a5, zero, 1801
                  feq.s        a3, ft1, fs2
                  xor          s11, tp, sp
                  fsub.s       fs3, fs4, ft11, rup
                  fmin.s       ft3, ft11, ft6
                  div          s11, a7, s2
                  fclass.s     s1, ft5
                  fsgnjx.s     ft2, fs1, ft1
                  or           a5, s5, a0
                  fsqrt.s      fs8, ft0
                  divu         a7, s11, s11
                  mul          s9, a0, a4
                  slt          s11, a4, s4
                  fsqrt.s      fa2, ft6
                  mulh         gp, s5, t2
                  fcvt.s.wu    fs8, a6
                  fmv.x.w      s9, ft11
                  remu         ra, s7, s5
                  slli         sp, t0, 16
                  auipc        s2, 915544
                  div          s0, ra, a0
                  fclass.s     a0, fa0
                  fclass.s     t0, fs6
                  rem          s4, zero, a4
                  xor          sp, s0, s0
                  fclass.s     t1, ft6
                  rem          t4, s1, s0
                  mulh         t5, a2, t0
                  mulh         s5, s9, tp
                  slti         t2, s8, 830
                  fsgnjn.s     fa4, fs1, fs2
                  srl          tp, s8, t3
                  remu         ra, s9, s3
                  sub          t2, s4, a5
                  sll          s5, s5, a6
                  fdiv.s       ft8, ft5, ft8, rmm
                  add          s11, s5, s10
                  fcvt.wu.s    a7, ft8, rtz
                  fcvt.wu.s    s11, fs0, rdn
                  xori         tp, s2, 1681
                  remu         t4, a4, t4
                  fmv.x.w      s5, fs1
                  mulh         ra, a7, s9
                  slli         a7, t4, 18
                  flt.s        t5, fs8, fs0
                  rem          a7, s9, t3
                  slt          a4, s8, tp
                  fcvt.wu.s    a7, ft11, rne
                  nop
                  rem          tp, a0, a1
                  sltiu        gp, s3, -1824
                  andi         zero, a6, 1924
                  mul          a4, tp, t3
                  fsgnjx.s     ft8, ft4, ft1
                  fle.s        t6, ft0, fs8
                  fmax.s       fa1, fa5, fa6
                  nop
                  fcvt.s.w     ft11, sp
                  add          t5, s4, zero
                  fmv.w.x      fa0, t0
                  mulhsu       s0, gp, zero
                  fsgnjx.s     fa6, fs2, ft6
                  fcvt.w.s     t6, fs1, rdn
                  remu         s10, a6, t0
                  sub          s4, sp, a4
                  flt.s        gp, fs2, ft0
                  fadd.s       fs5, fa1, ft0, rup
                  xori         a0, s4, 24
                  fsgnjn.s     fs0, fs10, fs5
                  feq.s        a4, ft4, fs0
                  fsub.s       ft2, fs6, ft10, rtz
                  or           a7, s4, s9
                  fle.s        zero, fa7, fa7
                  nop
                  fsgnjn.s     ft8, fa5, fs9
                  srli         t3, s0, 10
                  fmv.x.w      sp, ft4
                  fmv.w.x      ft6, t2
                  fcvt.wu.s    a3, fs0
                  and          t2, s10, t0
                  divu         s9, t3, t6
                  fle.s        a0, fs11, fs8
                  div          s4, s6, s8
                  feq.s        s10, ft11, fs8
                  fcvt.s.w     fa7, a1
                  fsub.s       fs3, fs10, ft2
                  fmv.w.x      fa2, gp
                  mulhu        a0, a0, s2
                  fcvt.s.wu    fs0, a5, rdn
                  add          s5, s0, t6
                  fsub.s       fa4, ft3, fs4, rdn
                  fmul.s       fs10, fa7, fs7, rmm
                  or           a4, sp, a0
                  srai         s5, a5, 15
                  slt          zero, a1, gp
                  xor          t5, s8, s6
                  fsub.s       ft0, ft5, fs0
                  fclass.s     a5, ft0
                  fsub.s       ft8, fa4, ft4
                  div          ra, s2, a1
                  mulhu        a5, a1, a7
                  rem          sp, s10, tp
                  fsgnj.s      ft3, fa3, fa2
                  xori         t4, s6, 1483
                  srl          s0, t2, s1
                  fdiv.s       ft7, fs7, fs7
                  slt          s4, s1, t2
                  ori          s1, a0, -1359
                  slti         s5, s6, -601
                  fmv.w.x      fs10, s10
                  rem          s7, t5, t2
                  fadd.s       fs9, fa4, fa3, rtz
                  nop
                  lui          s10, 429657
                  fmul.s       ft7, ft4, fs5
                  and          s0, gp, t0
                  fle.s        t2, fa5, ft11
                  lui          sp, 656843
                  srai         s2, gp, 22
                  sltu         t3, s2, t5
                  or           s2, s9, s5
                  xori         t2, a2, 1302
                  fsqrt.s      ft9, fs4, rdn
                  ori          s0, t0, 290
                  sltu         t3, t5, a2
                  div          a5, s0, a1
                  srai         a7, t0, 24
                  divu         gp, a0, s2
                  mulhsu       a0, t1, t5
                  fle.s        s0, fa6, fa5
                  flt.s        s7, fs4, fs7
                  fmax.s       fa0, fs11, fs4
                  fmv.w.x      fs3, t3
                  fcvt.wu.s    a1, ft5
                  fmv.w.x      fs8, s5
                  srl          t0, a3, s11
                  mul          s10, a7, t1
                  mulhsu       a4, a1, t6
                  fcvt.s.w     ft3, s6
                  fsgnjn.s     ft6, ft6, ft8
                  slli         t1, s5, 29
                  fmul.s       ft0, fs11, fs1
                  mulh         s10, s8, s7
                  rem          s1, s7, t1
                  remu         a7, a4, ra
                  mulh         a7, t5, t2
                  fsgnj.s      ft6, fa3, ft10
                  slli         s11, t3, 6
                  nop
                  ori          t3, t5, -114
                  fclass.s     a5, fs3
                  fdiv.s       fa3, ft1, fa4, rmm
                  feq.s        t0, fs3, ft10
                  mul          t1, t5, t4
                  mul          a6, s4, t4
                  fmax.s       ft4, fa7, fa2
                  fmax.s       fa1, fs5, fs9
                  fsub.s       fs0, fa4, fs7, rup
                  mulh         gp, a7, a5
                  and          t5, t1, a0
                  fdiv.s       ft1, fs10, ft0
                  fmin.s       ft9, fs0, fs1
                  fsgnjn.s     ft6, fs7, ft10
                  fdiv.s       ft9, fs9, ft2
                  or           a0, a1, a2
                  fmin.s       ft11, ft3, fa5
                  fmax.s       ft8, fa2, fs5
                  sub          s5, s10, s7
                  sltiu        s10, a6, 1746
                  srai         s10, s5, 9
                  auipc        a5, 519665
                  slti         s3, gp, -1644
                  rem          s5, t3, s4
                  fcvt.wu.s    s3, ft11
                  fmv.x.w      t3, ft9
                  feq.s        s10, ft6, fa0
                  lui          t3, 1016153
                  fmin.s       fs10, fs2, fs5
                  fcvt.s.w     fa6, sp
                  fsgnj.s      fa0, fs0, fa3
                  fle.s        a0, fa5, fa1
                  fsgnjx.s     ft2, ft9, fs0
                  fmin.s       fs9, ft10, ft1
                  fmv.x.w      a7, fa0
                  srai         sp, s6, 31
                  sltiu        t0, zero, -473
                  ori          a1, a3, -250
                  fadd.s       fs8, fs0, ft3
                  lui          s5, 512831
                  slt          ra, t0, a4
                  fsub.s       ft8, ft11, fs2
                  xori         gp, s7, 1908
                  fcvt.s.wu    fa6, s11
                  mulh         s4, t4, ra
                  fdiv.s       ft1, fs4, fs8
                  or           a7, a7, s10
                  srai         zero, t0, 5
                  feq.s        tp, ft0, fa2
                  fmin.s       fa1, fs4, fs8
                  divu         s4, a0, sp
                  nop
                  fclass.s     s3, fa5
                  fdiv.s       ft9, ft1, ft9
                  sub          s4, t6, a7
                  fsgnjx.s     fs6, ft1, fs2
                  xori         sp, tp, -1629
                  sltiu        s0, t3, -314
                  sll          sp, s1, t5
                  slti         a3, t2, 981
                  flt.s        s4, fs5, fa7
                  xor          s3, a5, t1
                  mulh         a7, a4, a0
                  fadd.s       fs8, fs5, ft9
                  andi         s11, ra, -1835
                  fmv.x.w      s9, fs11
                  divu         t1, s8, sp
                  slti         gp, s10, 401
                  fcvt.s.w     fa1, sp, rne
                  fcvt.w.s     t5, ft5
                  slti         a7, a0, -1309
                  xori         t1, s11, 1883
                  mul          a7, s2, s0
                  fadd.s       fs8, fs6, ft3, rup
                  slti         tp, s8, 1488
                  fmin.s       ft11, fs8, fs7
                  slli         a6, zero, 20
                  slt          gp, sp, t6
                  mulh         s0, t0, s8
                  addi         gp, a6, 925
                  feq.s        s7, fs7, ft0
                  slti         t0, s0, -1865
                  div          t6, a0, s3
                  flt.s        t3, fa5, fa4
                  flt.s        t3, fa2, fs4
                  sll          t4, a0, t6
                  lui          s2, 152201
                  fle.s        a0, fs5, ft4
                  flt.s        s11, ft4, ft4
                  fclass.s     ra, ft0
                  slti         gp, s1, 135
                  lui          t4, 290455
                  divu         zero, s2, a6
                  andi         tp, ra, -1024
                  fsqrt.s      ft7, fa5
                  sub          t2, t2, s4
                  fcvt.w.s     t5, fs9
                  mul          ra, sp, s2
                  fadd.s       fa2, fa4, ft8
                  sltu         t3, s8, s0
                  divu         tp, t6, a0
                  mulh         s9, t1, s10
                  nop
                  srai         sp, a7, 10
                  div          sp, s4, a2
                  fsgnj.s      ft7, fa6, ft9
                  slli         s1, s0, 21
                  srl          a6, ra, zero
                  fcvt.s.w     fa3, s7, rdn
                  xor          t3, s6, s11
                  add          t0, s0, s8
                  remu         zero, t3, t0
                  xor          tp, a0, t4
                  feq.s        s0, fa4, ft6
                  sub          s4, t6, ra
                  sub          s4, t0, a4
                  or           s11, s8, tp
                  fmv.w.x      fs5, s3
                  auipc        gp, 669677
                  slt          zero, s3, a3
                  fmv.w.x      ft1, s2
                  srl          t5, tp, a2
                  fmv.w.x      fs4, s10
                  nop
                  fcvt.wu.s    t3, fs5, rup
                  and          s2, s2, t2
                  slt          s7, t2, s6
                  slli         t0, a7, 21
                  add          a4, t5, t1
                  flt.s        s0, fa2, ft5
                  srl          s1, t2, ra
                  rem          s3, a2, s9
                  remu         s2, t2, a3
                  fcvt.wu.s    s7, fa3
                  fdiv.s       fs9, fa2, fa4
                  fsub.s       fa7, ft0, fs4
                  slti         a7, s1, -199
                  rem          s11, s2, s2
                  fcvt.wu.s    s10, fs0, rne
                  fsqrt.s      fa3, ft5
                  mulhu        a6, s9, t4
                  fcvt.s.w     fs5, a4
                  auipc        a4, 771029
                  fmv.x.w      a0, ft1
                  fcvt.s.wu    fa6, a5, rmm
                  slti         t2, s8, 377
                  srai         a7, a1, 10
                  and          a3, s11, s6
                  fsub.s       ft1, fs10, ft3
                  sltiu        s9, a1, 1123
                  remu         a3, ra, t2
                  fdiv.s       ft6, fs3, ft0
                  fmv.x.w      s3, ft7
                  sub          s2, s4, t1
                  lui          t2, 253899
                  fmin.s       ft0, fs0, fa1
                  divu         s7, ra, s11
                  fsqrt.s      ft11, fs8, rmm
                  div          a3, a2, a7
                  auipc        t6, 478161
                  fmv.x.w      a0, fs0
                  slt          a5, t2, a5
                  fle.s        s1, fs3, fs9
                  fcvt.s.w     fs6, a4
                  mulhsu       s11, s0, a6
                  sltiu        t1, t6, -880
                  fsub.s       fs9, fs8, fa2
                  lui          s0, 1004769
                  flt.s        a5, ft11, ft4
                  srai         t3, gp, 23
                  auipc        a7, 417399
                  sltu         s7, t6, t0
                  xori         a3, a7, -719
                  fadd.s       fs6, fa7, ft0, rup
                  flt.s        a0, fa1, ft11
                  remu         s2, s7, a2
                  andi         a3, s3, 546
                  fmin.s       fa5, fa5, fa4
                  and          s3, s6, s9
                  sra          ra, zero, s1
                  mul          tp, gp, t1
                  fsqrt.s      fs11, fs3
                  mulhsu       a5, s11, a5
                  remu         t1, s9, t5
                  slti         t3, a5, 88
                  sltu         s2, ra, gp
                  or           a5, s7, zero
                  srli         s11, s3, 5
                  rem          sp, s11, a7
                  fmul.s       fa6, fs4, ft5
                  addi         t2, a3, -129
                  fsub.s       ft9, ft8, ft9, rdn
                  xori         t4, zero, 1191
                  sll          tp, t1, tp
                  fle.s        s11, fs7, fs11
                  divu         s0, t2, ra
                  slli         a4, s8, 25
                  sra          t2, t1, a0
                  sltiu        a5, s5, -425
                  xori         t4, a0, 851
                  mulhsu       t4, a5, t0
                  rem          a3, s9, a2
                  fmv.x.w      a5, ft8
                  fsqrt.s      ft4, fs6
                  divu         t2, s5, t3
                  fsgnjn.s     ft2, ft4, fs2
                  fle.s        ra, fa5, fs2
                  addi         a3, s1, -1438
                  fclass.s     s1, fa4
                  srli         s11, s1, 27
                  flt.s        s7, fs6, fs2
                  ori          sp, s0, 1682
                  sll          t1, t5, s1
                  mulh         s9, s8, a2
                  fmv.w.x      fs1, a5
                  div          a3, t4, s8
                  fcvt.s.wu    ft3, s7
                  flt.s        s10, ft3, fa0
                  fle.s        s9, fs11, ft10
                  srl          s4, t0, sp
                  ori          a3, zero, -1143
                  fcvt.s.w     ft11, sp, rdn
                  slli         a4, s11, 25
                  rem          ra, a2, a6
                  feq.s        t5, fs0, fa0
                  fsgnjn.s     fa3, ft6, fa4
                  div          s7, a2, s3
                  sub          a1, s8, tp
                  fcvt.s.wu    fa2, a4
                  and          s9, t0, s8
                  fcvt.s.w     fs2, s11, rtz
                  lui          s7, 245301
                  fle.s        s3, fs9, fs6
                  mulhsu       s4, t3, a3
                  fsgnj.s      fs10, fa5, fa4
                  fdiv.s       fs10, fa2, fa3, rup
                  sra          gp, t0, a4
                  slt          t6, a4, s4
                  fsgnj.s      fa7, fs11, ft9
                  sltu         t4, s4, sp
                  fdiv.s       ft6, ft5, ft6, rne
                  slt          s2, s9, zero
                  slti         ra, s7, 1932
                  slli         s11, s9, 30
                  add          a6, s11, s3
                  and          a5, s10, s11
                  fsqrt.s      fa5, ft4, rdn
                  sub          s9, t3, t6
                  xor          s3, s7, tp
                  mulhu        t3, t0, t2
                  fadd.s       ft1, ft9, ft3, rtz
                  divu         ra, t0, s3
                  fmax.s       ft9, fs9, fs9
                  sll          t3, ra, a7
                  fcvt.wu.s    t6, fs8, rup
                  fle.s        t0, fs3, fa1
                  lui          gp, 383693
                  mul          ra, s0, s6
                  fcvt.s.wu    fs4, gp, rmm
                  fsgnjx.s     fs6, fs1, ft10
                  remu         a0, s9, a7
                  sltu         t1, s11, gp
                  sltiu        s0, s6, -1613
                  nop
                  rem          t4, s0, a2
                  srl          s0, s2, t5
                  mul          ra, t2, t5
                  divu         t6, ra, s8
                  srli         s0, t2, 25
                  fmul.s       ft5, ft0, fa0, rne
                  lui          sp, 889898
                  fsgnjn.s     ft2, fs7, ft3
                  fsgnjx.s     fs6, ft6, fs1
                  fcvt.s.wu    ft6, ra
                  or           a6, a2, s9
                  srai         a1, tp, 3
                  fmv.x.w      s1, ft11
                  nop
                  fsqrt.s      fa0, ft11, rtz
                  fcvt.s.w     ft6, s7
                  slt          a7, s7, s9
                  sltiu        s11, gp, 132
                  sub          tp, ra, a1
                  add          t2, s8, tp
                  mulhsu       a3, a1, s8
                  slli         gp, gp, 21
                  fmax.s       ft8, fs1, fa5
                  fsqrt.s      fa6, fa7
                  xor          s9, s5, t4
                  fsub.s       fs2, fa6, ft11, rup
                  remu         a5, t2, s10
                  nop
                  fcvt.s.wu    ft7, sp
                  fsqrt.s      fs9, fs8, rne
                  xori         s11, t1, 1760
                  fcvt.s.wu    fa4, t1
                  div          s4, s6, s9
                  remu         s7, gp, t1
                  ori          t1, zero, 300
                  divu         t6, t6, t2
                  srl          a4, s2, a6
                  fsqrt.s      ft6, ft2, rne
                  fcvt.w.s     a3, ft0, rdn
                  srl          t5, gp, s6
                  fmv.w.x      fs1, a3
                  sra          a7, a7, s4
                  fcvt.s.wu    fa0, t2
                  sltiu        a4, s5, 1386
                  rem          tp, s8, a5
                  mulh         s5, t3, t6
                  remu         s4, t1, a0
                  fmin.s       fs1, fa3, ft0
                  fmax.s       fs0, fa2, fs0
                  mulhu        s5, s4, tp
                  mulhu        t4, s4, a4
                  fsqrt.s      fs8, fa1
                  rem          a0, s11, s4
                  sra          t5, t1, t5
                  srai         tp, a6, 18
                  fmv.w.x      fs3, s3
                  srl          t5, t6, s5
                  sltiu        a3, s6, 1022
                  fcvt.s.wu    ft5, t1
                  srl          s5, s4, s5
                  slti         s4, a1, 1328
                  srai         t4, a1, 7
                  sub          s0, s2, s2
                  add          s2, tp, s0
                  fcvt.wu.s    t3, ft1, rdn
                  sltu         a7, a5, zero
                  fmv.x.w      t1, fa6
                  fcvt.wu.s    sp, fs1
                  fsgnjx.s     fs8, fa4, ft10
                  slti         t1, t2, -1426
                  slt          s0, s11, t3
                  divu         s2, s11, a2
                  fmv.x.w      t4, fs2
                  rem          s1, s1, s1
                  slli         a0, a7, 1
                  addi         a4, t3, 1849
                  sub          a1, s1, a4
                  fmv.x.w      a5, fs3
                  srl          tp, s5, t4
                  mulhsu       s3, a6, ra
                  and          a1, sp, s7
                  fcvt.w.s     zero, ft9, rup
                  sltiu        t2, s1, -746
                  fmv.x.w      s1, fs1
                  lui          t4, 625071
                  fcvt.s.wu    ft8, a4
                  sub          sp, s0, t0
                  fsgnj.s      fs4, fs0, ft6
                  sltu         a0, t5, a5
                  lui          sp, 885965
                  xori         s4, s5, 599
                  fcvt.s.w     fs4, a2
                  mul          s9, t1, a7
                  mulhu        sp, s10, a5
                  flt.s        t3, fa4, ft6
                  fclass.s     t1, ft4
                  sll          t2, sp, a0
                  rem          a0, t5, t6
                  remu         tp, s8, s6
                  xori         t4, s11, 868
                  fsgnj.s      fa0, fa1, fa2
                  sra          a7, zero, s8
                  fsqrt.s      ft5, fa5, rup
                  xor          a1, s10, s2
                  fsgnjx.s     ft2, ft3, fs7
                  fsgnjn.s     ft8, fa0, ft2
                  fsgnjn.s     fa0, ft11, fs2
                  mulhu        gp, t6, s1
                  sub          t1, t0, s11
                  sll          t4, tp, a0
                  lui          s0, 402552
                  srl          sp, t0, ra
                  flt.s        s0, fa2, fs2
                  rem          a4, s1, s2
                  slti         s9, s4, 1188
                  fmul.s       fs8, ft11, ft0, rmm
                  mulhsu       s7, t1, s10
                  fsgnjx.s     fs1, ft6, ft9
                  sltiu        a1, s7, -180
                  fadd.s       fa3, fa6, fs4
                  flt.s        s7, fs8, ft2
                  fclass.s     a7, ft10
                  slli         zero, a4, 24
                  or           tp, t6, s8
                  mul          t0, a3, sp
                  fmax.s       ft6, fa4, ft11
                  fcvt.s.w     fs11, a2
                  fclass.s     a1, fa6
                  fsgnjx.s     fs6, ft8, fs1
                  remu         zero, a6, s6
                  fcvt.w.s     a7, fs6, rne
                  flt.s        zero, ft3, fa6
                  auipc        a7, 111552
                  fcvt.w.s     gp, ft7, rdn
                  srai         t2, zero, 26
                  divu         a6, zero, tp
                  auipc        a1, 624422
                  fmin.s       fa1, ft0, ft9
                  sra          t1, a2, a0
                  sra          a3, t3, sp
                  mulh         t1, a7, tp
                  slt          a7, s2, t3
                  fmin.s       ft8, fs5, ft5
                  fcvt.s.w     ft7, t3
                  sll          zero, s7, tp
                  sltu         t5, a3, s11
                  feq.s        tp, ft10, ft1
                  auipc        a1, 126344
                  srli         gp, s7, 31
                  mulh         zero, s7, s5
                  fsgnjn.s     fs9, fs7, fs9
                  fadd.s       ft7, ft4, fa4
                  nop
                  mulhsu       t3, a7, tp
                  mul          s10, s8, sp
                  fcvt.s.w     ft0, a1
                  fmax.s       fs9, ft4, ft6
                  feq.s        t1, ft10, fa7
                  mulhsu       ra, s8, a2
                  slti         a7, a3, 26
                  xor          gp, ra, ra
                  mulhu        t1, s1, s4
                  lui          gp, 63466
                  xori         a3, s8, -1803
                  fcvt.w.s     tp, ft4, rmm
                  slt          tp, s1, t2
                  xori         a0, t3, 1155
                  or           a5, t4, s0
                  div          t1, s1, sp
                  slli         s7, s1, 26
                  fcvt.w.s     a5, ft5
                  fcvt.w.s     s0, ft7, rup
                  srl          a7, s3, a3
                  mulhu        zero, a6, ra
                  slli         s4, s9, 30
                  fsgnjx.s     fa7, ft7, fs1
                  slti         a5, s0, -1810
                  mul          t4, s9, a5
                  sltu         t5, s2, s4
                  fcvt.wu.s    t5, ft8
                  fsgnjx.s     fs4, fa3, fa5
                  fsub.s       fa6, ft0, fa1
                  sll          s10, zero, s5
                  sll          a6, t0, s5
                  flt.s        a6, fs0, fa1
                  flt.s        t1, fs10, fs10
                  mulhu        t2, s2, s6
                  fadd.s       ft4, fs6, fa2, rdn
                  fadd.s       fs9, fa7, fs9, rup
                  mulh         s5, t5, s3
                  add          s11, s1, a2
                  fcvt.wu.s    s9, ft3, rup
                  fle.s        t6, fa5, fs5
                  slt          t1, s10, a3
                  slti         t1, tp, -635
                  fmv.w.x      fs9, s6
                  remu         a4, s3, tp
                  auipc        t5, 671088
                  fsgnjn.s     ft1, ft8, fa7
                  fsub.s       fa4, fa5, fa5
                  slli         tp, gp, 15
                  div          s10, a5, tp
                  sll          s1, s5, a5
                  fcvt.s.w     fa2, ra
                  divu         zero, s3, s4
                  fadd.s       ft6, ft1, fs11, rmm
                  fsqrt.s      ft6, fa7, rup
                  and          tp, a4, a2
                  fmul.s       fa6, ft7, fs7
                  fcvt.s.w     ft9, s5
                  fcvt.s.w     ft8, gp
                  feq.s        t1, ft8, fa1
                  fclass.s     t5, ft10
                  divu         s11, a5, t3
                  fcvt.w.s     t6, ft8, rdn
                  addi         sp, a1, -1787
                  auipc        sp, 1010221
                  sltu         s3, s4, a7
                  fsqrt.s      ft2, ft5
                  or           s1, s10, a2
                  fadd.s       ft6, fa7, fs7, rmm
                  mulh         s1, s1, s6
                  slt          s3, ra, gp
                  fmax.s       fs5, fa0, fs3
                  srli         t4, s8, 15
                  fle.s        gp, fa0, fa3
                  feq.s        a1, ft9, fa6
                  fle.s        a0, ft7, ft9
                  slti         t5, s11, 508
                  srli         zero, a1, 31
                  fle.s        t1, fs11, fa1
                  sra          t5, s0, s5
                  addi         s7, gp, -241
                  srl          a6, a4, t2
                  or           s2, s7, a5
                  slli         a4, t2, 28
                  mulhsu       t5, t6, s2
                  xori         zero, t5, 1413
                  slt          s0, t0, a5
                  sltiu        a0, t5, 169
                  fcvt.s.w     fs0, a6
                  fadd.s       ft8, fs5, fs4, rdn
                  fcvt.wu.s    s5, ft10
                  add          s5, a3, a2
                  fsgnjx.s     fs10, fa6, fa1
                  srl          t5, s6, s8
                  slli         s10, t1, 20
                  mulhu        t6, s10, t6
                  add          t0, a0, ra
                  sra          zero, s4, s4
                  fle.s        a3, fs1, ft11
                  fle.s        sp, fs8, fa4
                  mulhu        t3, a4, t2
                  div          t5, s4, s7
                  fmv.x.w      a4, fa1
                  fclass.s     zero, ft4
                  sltu         s7, a6, t4
                  fmin.s       fs11, fs9, fa6
                  ori          t0, a3, 1237
                  addi         a4, a3, 1642
                  fsgnjn.s     fa2, fs2, ft3
                  fadd.s       fa0, ft3, fa0, rmm
                  rem          s5, ra, t2
                  mulhsu       ra, a7, t2
                  ori          t6, t6, 386
                  fsgnj.s      fs8, fs0, fs6
                  fsub.s       fs3, ft3, fa4
                  fsgnjx.s     ft1, fa0, fa1
                  fcvt.s.wu    ft11, s1, rmm
                  xor          s2, t1, t0
                  fsqrt.s      ft5, fa4
                  sltu         s2, ra, s0
                  fadd.s       ft9, ft5, fa1, rmm
                  feq.s        a1, fa7, fs4
                  sra          zero, s0, t3
                  rem          s1, gp, t1
                  sltiu        sp, a6, -1765
                  fmin.s       ft10, ft0, ft5
                  fmv.w.x      fs11, s10
                  srl          s3, a4, s3
                  fsgnjn.s     fs6, fs0, fs11
                  fcvt.wu.s    tp, fa1
                  mul          zero, t6, s7
                  srai         t3, t6, 19
                  srl          t5, sp, a3
                  fmax.s       fa0, fs7, fs8
                  fsqrt.s      ft3, fs5, rmm
                  ori          zero, zero, 1684
                  mul          s7, t1, zero
                  fsub.s       fs8, fa6, fa4, rup
                  slt          t0, s7, ra
                  sltu         t5, s10, s4
                  mulhu        a5, a3, sp
                  slti         t3, tp, -1201
                  fmv.w.x      fa4, s5
                  mulhsu       zero, s1, s0
                  or           a1, gp, s9
                  fsqrt.s      fa3, fs5, rtz
                  fsub.s       fs9, fa0, fs2
                  lui          gp, 777374
                  or           t5, t4, a1
                  feq.s        s5, ft8, fs7
                  divu         s5, sp, s2
                  sub          a3, sp, sp
                  or           s1, a3, s6
                  fclass.s     s11, fa2
                  mulhu        t6, sp, s1
                  fle.s        s10, ft10, ft9
                  fdiv.s       ft1, fs11, ft2
                  andi         a7, ra, -1574
                  fcvt.wu.s    a3, fs5
                  mulhu        s1, a1, t0
                  addi         s11, a5, -845
                  srli         t1, zero, 17
                  fmul.s       fa1, fs9, fa5, rne
                  flt.s        s3, ft10, fs10
                  srli         a6, a6, 1
                  mulhsu       s2, a5, s6
                  fadd.s       ft2, ft5, fs7, rtz
                  sltu         s10, s3, s1
                  sra          t3, t3, a4
                  fle.s        s2, ft0, fa6
                  srli         a4, t0, 25
                  addi         t3, s4, -593
                  fmv.x.w      t1, fa7
                  fmax.s       fs9, fa3, fa3
                  fmul.s       ft5, fa4, ft3, rup
                  or           t4, tp, a6
                  or           s3, gp, s4
                  fcvt.wu.s    s5, fa4
                  mulh         t3, s9, a2
                  slti         a0, t5, 2022
                  fadd.s       fa5, ft10, fs5, rup
                  ori          a3, a5, -78
                  flt.s        gp, fs3, fa0
                  fmul.s       fa7, fs6, fs7
                  fsub.s       fs9, fa1, fs10, rdn
                  srl          gp, tp, a4
                  rem          a5, s8, a6
                  divu         s0, a6, t4
                  lui          a5, 45285
                  divu         a6, gp, a6
                  sltiu        a4, gp, 326
                  slt          gp, tp, t4
                  fmv.w.x      fa0, a4
                  fmul.s       ft8, ft6, fs7
                  div          t4, t5, s11
                  mulhu        s2, a0, t4
                  sltiu        sp, a2, 1389
                  fdiv.s       ft10, fs3, fs10
                  sra          s11, a4, a7
                  flt.s        a6, ft3, ft10
                  slt          a7, a5, a1
                  rem          t3, t0, s5
                  fsgnj.s      ft1, ft2, fa4
                  xor          t3, s5, a3
                  fmin.s       fs8, fa5, fa7
                  sll          t4, s11, a1
                  fmv.w.x      fs1, s6
                  flt.s        tp, ft9, fs0
                  rem          s5, s5, sp
                  fsgnj.s      ft1, fa0, fs9
                  nop
                  xor          t1, s4, a5
                  fmul.s       fa5, ft5, ft1, rdn
                  fsgnjn.s     fa2, fs4, ft5
                  mul          s7, ra, a3
                  ori          a5, t1, 109
                  and          a4, a4, s5
                  sltiu        a1, t2, 127
                  div          s2, s9, ra
                  lui          a6, 784624
                  sll          a1, a4, a2
                  add          s3, t0, s7
                  mul          s5, s2, zero
                  fsqrt.s      fs8, fs11
                  fsub.s       fs0, fa6, ft2, rup
                  fle.s        a3, fa7, fs4
                  sltiu        t4, s2, -1062
                  fadd.s       ft7, fs0, fs7
                  fmv.x.w      s3, ft4
                  auipc        a6, 822232
                  add          s9, s6, gp
                  fdiv.s       fs1, ft4, fs8, rtz
                  fsgnjx.s     ft10, fs1, ft1
                  fcvt.wu.s    a4, fs11, rmm
                  fsgnjx.s     fa6, fa2, ft11
                  srai         t6, s8, 7
                  fsgnj.s      ft3, fs1, ft3
                  slti         t0, sp, -2027
                  feq.s        t0, fs3, ft3
                  fcvt.s.wu    ft0, s5, rup
                  ori          t0, gp, -583
                  fcvt.wu.s    a0, fs5
                  sra          s11, s11, s9
                  srl          t2, t5, s4
                  fdiv.s       fs0, fs4, fs2, rdn
                  or           a5, s6, s0
                  fle.s        a4, fs4, ft4
                  flt.s        tp, ft9, fs6
                  fcvt.s.wu    ft7, tp
                  fmv.w.x      fa4, t1
                  fmax.s       fs3, ft3, ft2
                  auipc        s10, 300796
                  fmul.s       ft11, fa2, fa4
                  fclass.s     s5, fa6
                  divu         ra, a0, a4
                  fsub.s       fa1, fs9, fs9
                  xori         s3, t5, 2030
                  sub          t1, zero, s5
                  fmin.s       ft11, ft8, fs4
                  fle.s        s2, ft3, fs6
                  sra          a6, a0, t2
                  fsgnj.s      fs11, ft5, fa2
                  slli         tp, s7, 23
                  rem          gp, s6, s5
                  srli         a3, s6, 27
                  mulh         s5, s8, a3
                  fadd.s       fa1, fs8, fs8
                  sltu         s11, a7, s8
                  fmv.x.w      ra, ft0
                  remu         s11, s8, a2
                  srli         a0, a1, 23
                  fsgnjx.s     ft6, fa7, fs9
                  srli         s5, s11, 4
                  mulh         s7, a0, t0
                  feq.s        t3, fa1, fa2
                  xori         a5, s7, 185
                  mulhsu       s7, s0, a7
                  fclass.s     s5, ft8
                  flt.s        zero, ft6, fs1
                  fcvt.w.s     t6, ft6, rtz
                  fmax.s       ft2, fs0, fs10
                  div          a4, a4, a7
                  flt.s        t5, fa2, ft1
                  mulhu        s1, t2, t3
                  slli         a1, t0, 9
                  sll          t4, a5, t5
                  feq.s        a3, fa3, ft6
                  srli         s5, t0, 12
                  fmul.s       ft4, fa3, ft0
                  divu         s7, s4, s7
                  xor          t3, s9, t4
                  fcvt.s.w     fs7, t1, rdn
                  fadd.s       ft8, fs3, fs9, rup
                  sra          s1, s6, s3
                  slt          s9, zero, s5
                  lui          a7, 683546
                  fmv.w.x      fa6, t6
                  remu         s0, s3, s5
                  fclass.s     t2, fs0
                  sltiu        a5, t6, 1711
                  slli         t5, s10, 22
                  fclass.s     t5, ft11
                  rem          gp, t1, zero
                  nop
                  xor          a4, s4, a2
                  auipc        a5, 459734
                  fsqrt.s      ft6, ft10
                  fmax.s       fa7, ft2, fs11
                  sub          a7, t6, t2
                  auipc        a5, 508737
                  fsqrt.s      fs1, fs0
                  fmin.s       ft0, ft6, fs6
                  srl          a0, t5, t2
                  fle.s        s2, fa7, fs8
                  fmv.x.w      a5, ft0
                  fclass.s     ra, ft2
                  and          s2, t4, s0
                  slli         s9, ra, 13
                  fle.s        a0, ft1, fs10
                  or           a7, s1, a7
                  fle.s        t6, fa5, ft1
                  andi         a1, t4, 681
                  fmv.x.w      s7, fa6
                  fsgnjn.s     fs2, fs1, ft1
                  sltu         a5, a3, s0
                  xori         s10, a1, -75
                  fmul.s       ft10, ft1, fs9
                  mulh         s7, ra, tp
                  lui          s3, 122143
                  sub          a4, s5, s5
                  and          s9, a0, a7
                  fcvt.w.s     a0, ft7, rne
                  fmin.s       fs9, fa0, fa6
                  xori         s7, a6, -204
                  fcvt.s.w     ft2, ra
                  mulhsu       s9, a3, t5
                  fsgnjx.s     ft7, fs11, fa6
                  or           t4, s11, a1
                  sra          a6, s7, t1
                  fsub.s       fs7, ft1, ft7, rdn
                  ori          s0, a0, 46
                  sra          t0, gp, s10
                  fclass.s     s4, fs2
                  slti         s10, s0, 113
                  fmv.w.x      fs11, t2
                  or           a1, a2, ra
                  fle.s        a3, fa2, fs7
                  fmv.x.w      t6, fa2
                  ori          s1, a5, -1164
                  fsgnjn.s     ft4, fa6, fs1
                  mul          t1, s11, t2
                  sra          s9, s2, a2
                  lui          s0, 16862
                  fdiv.s       ft7, fs1, fa7
                  auipc        s11, 456995
                  andi         a0, s1, -1377
                  xor          a1, a6, s5
                  divu         gp, s11, a4
                  fsqrt.s      ft6, fs0
                  flt.s        a1, fs9, fs2
                  fcvt.wu.s    a3, ft0, rup
                  divu         a5, t4, a4
                  slli         a5, gp, 10
                  mul          a5, t4, t2
                  fle.s        sp, fs8, fa5
                  slt          ra, s3, a1
                  fmul.s       fs1, ft2, fs7, rdn
                  xori         gp, ra, 256
                  slti         a0, s11, 405
                  and          s2, s0, gp
                  fmv.x.w      a0, ft10
                  ori          t1, s8, 1327
                  mulhsu       a4, a0, s2
                  fsub.s       fs11, ft0, ft8, rne
                  sltiu        s9, s10, -1782
                  div          a0, t4, ra
                  slt          a5, s10, zero
                  fsgnjn.s     ft0, ft10, ft7
                  div          a7, s4, a1
                  divu         s11, ra, s6
                  mulh         t6, t6, s9
                  remu         a7, s9, a5
                  fsqrt.s      ft6, ft6
                  sub          gp, s0, s4
                  sll          s0, t3, t6
                  sltu         s0, a6, zero
                  fmin.s       fs2, fs0, fs10
                  srl          t0, a5, t1
                  srl          ra, s1, t5
                  fsgnjx.s     fs2, fs3, ft4
                  fmin.s       fa3, fs9, fs8
                  auipc        tp, 685146
                  fsgnj.s      fs3, ft9, fa0
                  fcvt.s.w     ft6, tp, rdn
                  slli         s3, s3, 23
                  fsgnjx.s     ft1, fs7, fa4
                  fmv.w.x      fs2, s2
                  fmul.s       ft6, fs5, fs11
                  divu         t6, sp, s2
                  fmv.x.w      a5, ft9
                  fsgnj.s      fa4, fs5, fs5
                  fmin.s       ft7, ft1, ft1
                  fmul.s       fa7, ft7, fs10
                  div          tp, t4, a5
                  slt          s10, tp, t6
                  fsub.s       fs8, ft6, ft5, rne
                  lui          s11, 841702
                  sra          s10, zero, s0
                  slli         t1, sp, 2
                  fmin.s       fa5, ft6, fs11
                  fcvt.w.s     t3, ft2, rtz
                  fmin.s       fa2, ft11, fs0
                  fdiv.s       fa4, fs11, ft5
                  addi         ra, s2, 2036
                  lui          s10, 309762
                  ori          gp, s7, 164
                  slt          s10, s10, s6
                  slli         s2, s3, 25
                  xori         t4, s10, -872
                  lui          s9, 1019765
                  xor          s0, s9, a0
                  fmul.s       fs11, ft3, fa2, rmm
                  fmv.w.x      ft5, s0
                  fsgnjn.s     fs2, fs5, ft7
                  srl          s11, a1, a1
                  remu         a1, t1, t3
                  ori          s3, a7, 156
                  srli         t1, t1, 21
                  fadd.s       ft7, fa2, fa7, rtz
                  fsgnjn.s     fs6, ft1, fs0
                  sltiu        a7, s11, 1758
                  mulh         s0, t4, s9
                  sltiu        t6, a3, -1264
                  srl          s4, a2, s3
                  fcvt.s.w     ft2, s1
                  nop
                  fsub.s       ft10, fa5, ft8
                  fsub.s       fa4, fa4, fa0
                  feq.s        tp, fs11, ft1
                  srai         a1, s1, 21
                  fle.s        t5, fa7, fa3
                  addi         t0, s2, 38
                  fsqrt.s      fs9, fs1, rne
                  fcvt.s.w     ft6, t3
                  sub          s1, s1, a1
                  slt          zero, a5, s0
                  xori         s11, t6, -203
                  rem          a1, a1, s10
                  rem          a0, tp, a1
                  nop
                  add          t0, s2, s2
                  andi         s9, zero, 2001
                  fmul.s       ft2, ft7, fs11
                  ori          a1, s4, -1151
                  flt.s        ra, fa7, ft2
                  fsgnjn.s     ft11, fs5, fs10
                  sll          a7, s8, a2
                  mul          s1, s7, s11
                  fsgnj.s      fs4, ft6, ft11
                  remu         sp, s4, ra
                  divu         s9, a3, ra
                  div          s7, s0, t5
                  addi         s9, s8, 1219
                  auipc        t3, 382193
                  divu         a4, a0, t4
                  fle.s        s7, fa0, fa2
                  sltu         s4, a4, t6
                  slti         sp, a6, 1302
                  fle.s        s9, fs5, fs5
                  remu         s5, s9, t5
                  fadd.s       fa6, fs4, fs1
                  or           zero, t5, t6
                  sltu         a3, t3, a4
                  srl          s5, s9, t1
                  mulhsu       t5, gp, t3
                  fcvt.s.w     ft9, t0, rup
                  fsgnjn.s     fs6, fs1, ft0
                  fmax.s       fa2, ft0, ft0
                  fdiv.s       fs5, ft5, ft7, rne
                  rem          a3, t5, tp
                  fdiv.s       ft9, ft0, fs3, rne
                  fcvt.s.w     ft6, t5, rmm
                  auipc        s5, 919308
                  fcvt.s.w     fs10, tp
                  fsgnj.s      fa3, ft10, ft6
                  fsgnjx.s     fa0, fs1, ft11
                  remu         s4, s10, a7
                  fsgnjn.s     fa1, fa7, fs3
                  fsqrt.s      fs8, fs2, rtz
                  remu         ra, a5, ra
                  and          t2, gp, a7
                  xor          s2, s6, a4
                  fsgnj.s      fa1, fa1, ft3
                  divu         s11, sp, t4
                  andi         a5, s8, 1391
                  ori          s0, t4, -1875
                  xor          t6, tp, sp
                  mulh         gp, s3, s4
                  fadd.s       ft4, ft7, ft0, rne
                  slt          s11, s7, t5
                  fcvt.wu.s    a7, ft1, rne
                  auipc        a6, 62334
                  slli         zero, s5, 25
                  nop
                  ori          tp, sp, 696
                  xori         tp, a1, 1292
                  slli         a7, t1, 29
                  fmv.x.w      a0, fs4
                  add          gp, a2, s5
                  fsgnjx.s     fs4, fs2, fs1
                  or           a7, a4, zero
                  feq.s        a7, fs3, fa0
                  sltiu        s9, t0, -611
                  xori         a1, sp, 413
                  feq.s        s3, fa1, fs4
                  fmul.s       ft10, fs8, fs7, rdn
                  fsub.s       fs6, fa7, fs6, rup
                  rem          s11, s4, a5
                  sub          s5, sp, s6
                  fsgnj.s      fa0, fa4, fa4
                  fclass.s     t1, fs0
                  sub          a5, zero, s10
                  fmin.s       fa5, ft1, fa2
                  sltu         s3, t3, a6
                  or           s7, a0, s1
                  rem          tp, a6, s6
                  fle.s        t3, fs0, ft6
                  feq.s        t5, fa2, fs9
                  xori         s7, gp, -401
                  or           s9, a7, s11
                  fmax.s       fa6, fs6, fa3
                  fcvt.s.wu    fa5, s7, rtz
                  addi         t5, s11, 1503
                  div          a7, s6, gp
                  fcvt.wu.s    t4, ft7
                  flt.s        s0, ft8, fa5
                  srli         sp, tp, 9
                  sll          s1, s8, s3
                  fsgnjn.s     fs8, ft10, fs0
                  mul          s3, s4, t5
                  fdiv.s       fa0, fs1, ft7, rtz
                  fmv.w.x      ft9, a4
                  xori         s11, s3, -31
                  feq.s        t6, fs6, fs7
                  srai         t3, s7, 13
                  fsqrt.s      fs0, fs3
                  nop
                  lui          t5, 709218
                  andi         zero, a0, -2040
                  div          s7, a5, t1
                  fmax.s       fa3, ft5, ft7
                  fclass.s     a3, fs10
                  srai         zero, s10, 20
                  mulhsu       s10, s8, a4
                  mul          a3, t6, s4
                  sub          ra, s5, t3
                  add          s5, s11, tp
                  fcvt.w.s     s3, fs11
                  mul          t4, s11, s9
                  lui          a7, 82779
                  or           s10, s10, a4
                  nop
                  div          s2, s7, a6
                  mulhsu       s10, s5, a6
                  srl          s0, s9, zero
                  ori          a6, s6, -1315
                  feq.s        ra, ft7, fs5
                  flt.s        zero, fa5, ft4
                  nop
                  remu         a1, a4, s9
                  fsub.s       ft5, ft5, fs7
                  fmax.s       ft2, fs8, fs10
                  fsqrt.s      fa2, fs1, rdn
                  mulhsu       t0, s4, s11
                  sltu         a5, s8, tp
                  fdiv.s       fa1, ft7, fa5
                  nop
                  srl          gp, sp, s9
                  flt.s        s1, fs5, fa2
                  fsgnjx.s     fa6, fs3, ft6
                  fcvt.wu.s    s10, ft5, rtz
                  fadd.s       fa6, fs10, fs9
                  slti         s7, a2, -1692
                  andi         s4, a0, 1278
                  mulhu        s2, s1, s2
                  xor          s0, s9, a5
                  fcvt.wu.s    sp, fs5
                  fmax.s       ft7, ft0, fs5
                  fadd.s       fs11, fs5, fs3
                  fcvt.s.wu    fs6, s8
                  sltu         a0, zero, a2
                  andi         gp, s2, 1421
                  mulh         s0, a7, tp
                  rem          zero, s10, a4
                  fmv.x.w      s10, fs8
                  and          a1, t6, a3
                  xor          a7, a2, a4
                  remu         a3, zero, t6
                  fmv.w.x      fa1, s10
                  srl          t6, t3, s9
                  fadd.s       ft0, fs3, fs3
                  fmul.s       fs2, ft8, ft3, rne
                  slli         ra, t0, 6
                  fsgnjx.s     fs9, ft8, fs7
                  fclass.s     sp, fs4
                  fmax.s       fs1, ft7, ft9
                  div          t1, s7, s4
                  andi         s9, s9, -277
                  sltu         a6, a2, a5
                  sub          s4, a5, gp
                  mulhu        s11, t0, s8
                  fsqrt.s      fa7, fs10
                  lui          s5, 1014521
                  mulhsu       s1, s10, s7
                  and          s3, s7, s5
                  fclass.s     s11, ft3
                  fdiv.s       fs7, fs8, fa5, rmm
                  sub          a3, t2, s2
                  or           t1, zero, a4
                  srl          s5, t5, a6
                  divu         t3, s10, s5
                  fclass.s     t5, fa3
                  srai         s10, tp, 2
                  fsqrt.s      ft9, ft6, rtz
                  fsgnjx.s     fs6, fa4, fs9
                  fsgnjx.s     fs4, fs0, fa1
                  srai         a1, s7, 3
                  fcvt.wu.s    ra, fs11
                  sll          t3, s5, a4
                  add          s10, zero, s4
                  fsgnj.s      fs8, fs3, fs8
                  andi         s9, t1, -25
                  xori         a0, a1, -427
                  nop
                  fmin.s       fs11, fs11, fa7
                  fmul.s       ft10, fs4, fs5
                  srl          t1, s11, s9
                  fcvt.w.s     ra, ft3
                  xori         a6, s2, 399
                  fsgnjn.s     ft1, ft0, ft4
                  fcvt.w.s     tp, ft2, rmm
                  flt.s        t0, fa7, fa4
                  nop
                  fle.s        t1, fa3, fs7
                  mulh         s10, a1, a0
                  fmin.s       ft1, ft8, fa5
                  fdiv.s       ft4, fs10, fs11, rne
                  fsgnj.s      fs8, fa6, fs6
                  sub          t2, a5, s5
                  rem          t3, s8, t2
                  fmv.x.w      a0, ft1
                  rem          s5, s2, gp
                  xori         a3, a6, 294
                  flt.s        s9, fs9, fa4
                  divu         a6, a6, a6
                  xori         s1, a4, 1746
                  xor          s7, sp, zero
                  nop
                  fsqrt.s      ft2, fa3
                  fle.s        a7, fs0, ft0
                  slti         a3, t6, -384
                  sltiu        t1, s5, -971
                  fcvt.wu.s    t6, ft8, rne
                  srli         s3, a4, 27
                  addi         t5, a3, 1106
                  fsgnjx.s     fa4, fa4, fs0
                  fmax.s       fa6, fs10, ft11
                  fdiv.s       fs10, ft1, ft4, rmm
                  andi         t0, s7, -277
                  div          s10, s7, t4
                  and          t1, s6, t4
                  fmul.s       ft10, ft5, ft9, rdn
                  add          tp, s9, a2
                  fsgnj.s      ft7, fs0, ft0
                  slli         s1, ra, 14
                  ori          s5, t6, 1035
                  sll          a6, s7, s1
                  ori          t1, s2, 1750
                  mulhsu       t1, a6, s8
                  sltiu        a0, a4, 1716
                  fmv.x.w      s1, ft1
                  mulhu        s5, s5, zero
                  fclass.s     a4, fa2
                  fmax.s       ft9, fa1, fs0
                  fmv.w.x      ft7, a3
                  div          t5, t3, t1
                  srl          s2, a7, a1
                  mulh         a5, ra, a6
                  mulhsu       s7, zero, s0
                  divu         s4, s5, a6
                  rem          s10, t6, t6
                  addi         a1, a3, 241
                  mulhu        a1, s10, a0
                  fsgnj.s      ft0, fs6, ft9
                  fmin.s       ft5, fs8, fs4
                  fcvt.wu.s    sp, fa3, rup
                  fsqrt.s      fa3, fs8
                  srli         t0, s0, 6
                  nop
                  fmax.s       fs7, fs5, ft9
                  divu         sp, a1, tp
                  feq.s        a7, fs11, fa2
                  lui          s7, 1029375
                  mul          s4, s3, t6
                  slti         s9, t4, 1929
                  fsub.s       fs2, fs9, fs3
                  sll          s1, tp, s7
                  or           s9, t0, t1
                  mulhsu       t6, s7, a0
                  feq.s        s5, ft5, fa6
                  add          s7, t4, a3
                  mulhsu       t6, s6, t5
                  andi         s0, s8, -1066
                  fmv.x.w      a6, fs7
                  xori         a1, tp, -1339
                  fcvt.w.s     t2, ft10, rdn
                  slli         t4, s8, 21
                  and          a1, s10, a1
                  nop
                  slti         s3, a7, -350
                  sltiu        s10, s10, 13
                  mulhsu       t5, s2, t4
                  andi         tp, s11, 1874
                  fdiv.s       ft6, fs7, fs2, rne
                  remu         t5, s1, t0
                  fcvt.w.s     s11, ft1, rne
                  fadd.s       ft6, fs0, ft9, rne
                  sub          t4, s5, s5
                  remu         a0, a3, a6
                  mulhu        a3, s2, zero
                  and          s9, t2, s11
                  fsgnjx.s     ft7, fs6, ft8
                  mul          s9, a0, s2
                  mulhsu       a1, ra, t4
                  fle.s        s10, fs11, ft0
                  fclass.s     s10, fs0
                  remu         t3, s11, a5
                  auipc        a5, 676958
                  sra          sp, sp, s6
                  fsgnjn.s     fs1, fs2, ft10
                  fcvt.s.w     fs8, s8, rmm
                  fcvt.s.w     fs5, a0, rne
                  slt          a1, s8, s1
                  and          a6, a7, a5
                  xori         t6, s9, -1728
                  fmv.w.x      fa3, t3
                  lui          s0, 436452
                  auipc        a3, 897841
                  ori          zero, a2, -426
                  fsqrt.s      fs3, fs4
                  flt.s        a0, fs4, fs9
                  slli         ra, ra, 23
                  add          s3, a2, s5
                  and          a3, s6, sp
                  fle.s        s4, ft5, ft7
                  fmax.s       fs7, ft7, fa7
                  fmin.s       fa0, ft10, ft4
                  mulh         zero, a6, s8
                  fmul.s       ft8, fs8, fs8, rtz
                  add          a1, s4, t0
                  flt.s        gp, ft0, fs5
                  feq.s        s5, ft6, ft8
                  fadd.s       fs9, fs7, fs3
                  or           s7, t6, s11
                  div          s11, s1, a4
                  sltu         gp, zero, s0
                  ori          a3, zero, 1173
                  fsgnjx.s     fa1, fa7, fs3
                  fmv.w.x      ft1, s10
                  feq.s        s5, fs1, ft11
                  sltu         ra, a2, t2
                  feq.s        a4, ft1, ft2
                  fmax.s       fs10, ft1, fa3
                  slti         t6, a2, -831
                  remu         t5, a0, t3
                  auipc        sp, 160187
                  sra          s7, s10, t2
                  srai         t6, t0, 20
                  sra          s1, s3, a2
                  ori          t5, s7, -1096
                  mulhsu       s10, s8, ra
                  fsgnjx.s     ft1, fs7, ft1
                  feq.s        s3, fs10, fa2
                  fmv.x.w      s0, fa6
                  divu         s1, zero, a3
                  sra          a5, a4, a5
                  fcvt.wu.s    s1, ft0
                  mulhu        a0, t3, t1
                  fsub.s       fa0, ft7, ft10
                  remu         ra, s10, a7
                  addi         t4, s1, 1986
                  fmax.s       ft11, fa1, ft11
                  and          zero, a2, s6
                  fmax.s       ft7, fa4, fs5
                  add          s5, gp, s7
                  slt          t6, s11, s0
                  fsgnjn.s     fs1, fs3, fa3
                  addi         t1, a6, -14
                  fmul.s       ft0, fs8, fa7, rup
                  and          tp, s8, s8
                  mul          s9, a6, s1
                  auipc        t0, 475655
                  fmv.x.w      a3, fs10
                  fmv.w.x      fa2, s4
                  fsgnjx.s     ft5, fs6, fs11
                  srai         s2, t0, 26
                  fcvt.s.w     fa2, a0, rdn
                  and          s10, t2, t1
                  fcvt.wu.s    t2, fs1
                  sll          s9, s0, s4
                  srai         s4, s2, 18
                  srli         a4, t6, 18
                  fle.s        s10, ft6, ft9
                  sra          s3, a0, s10
                  mulhsu       t5, t6, a2
                  feq.s        s10, ft6, fs2
                  mulhu        a6, zero, s5
                  sltiu        a5, sp, -1405
                  fsqrt.s      ft7, ft10, rmm
                  srl          t1, a6, t6
                  srli         zero, a3, 9
                  andi         a1, t2, 116
                  slti         s1, tp, 1058
                  auipc        s1, 817043
                  srli         s10, gp, 31
                  fclass.s     s0, fs3
                  andi         zero, t2, 114
                  sra          s10, t4, t2
                  auipc        s2, 10780
                  and          gp, s7, s5
                  fclass.s     s3, fs11
                  mul          t0, s6, s2
                  add          a1, s11, s11
                  and          a1, t4, s11
                  fsgnjx.s     ft1, ft6, ft11
                  feq.s        t6, fa5, fs11
                  mulh         t0, t5, s11
                  srl          zero, t0, a1
                  fsgnjn.s     fa0, fa2, fs0
                  remu         sp, s8, gp
                  slli         tp, s2, 18
                  div          s9, t0, s3
                  srl          t2, t2, s2
                  fcvt.wu.s    s3, ft0
                  xor          a0, s5, t6
                  fsgnj.s      ft9, fs7, fs2
                  srli         s9, a7, 8
                  xor          a0, t3, t1
                  xori         s0, ra, 1556
                  srai         s3, sp, 2
                  srai         a6, a3, 22
                  remu         t3, ra, s9
                  fsgnj.s      ft7, fa6, fa6
                  srai         s3, t3, 0
                  fdiv.s       fa0, fa5, fa2
                  xor          a0, a4, t6
                  fcvt.s.wu    fs10, s2
                  xor          t1, s11, s5
                  srl          s4, s2, s11
                  sub          tp, ra, s5
                  mulhsu       a5, s6, s1
                  fclass.s     tp, ft4
                  sra          t5, s6, t3
                  sltiu        s4, tp, -1482
                  sra          ra, a1, a4
                  srai         t5, t6, 6
                  sll          s10, s10, a1
                  fcvt.w.s     ra, fa2
                  lui          s3, 703523
                  fsgnjn.s     fs6, ft10, ft1
                  fmv.x.w      ra, fs2
                  mul          s9, s1, tp
                  sltu         a0, a1, s5
                  sub          s5, s5, s6
                  sll          tp, s7, s1
                  mulh         a6, ra, a1
                  fmax.s       fs1, fs7, fa3
                  fmin.s       fs11, fs3, fa2
                  mulhsu       zero, gp, t3
                  fmul.s       ft3, ft2, fa3
                  mulh         a6, s11, a4
                  srli         t1, a6, 17
                  fmin.s       ft2, fs2, fs1
                  fadd.s       ft0, fs0, ft7
                  and          s5, t2, t2
                  fle.s        s4, fa2, ft10
                  srai         s5, a0, 20
                  rem          s0, s2, a3
                  fmax.s       fa4, ft2, ft1
                  xori         t5, ra, 698
                  fsgnjn.s     fa5, ft3, fs11
                  slt          a6, a5, a3
                  fsgnjx.s     ft0, fs5, fs6
                  slli         gp, a1, 24
                  srli         s3, a1, 26
                  srai         t5, t0, 22
                  sll          s3, ra, s4
                  slt          a1, a4, s8
                  xor          a3, s11, s8
                  rem          sp, s11, s6
                  fdiv.s       ft8, ft11, ft9, rmm
                  fsgnjx.s     ft1, fa5, fs11
                  slti         a4, ra, -1965
                  rem          s3, a6, s4
                  sra          t6, s10, t1
                  srli         s10, s5, 12
                  fmin.s       ft5, ft6, fs9
                  fcvt.w.s     s10, fa6
                  srli         gp, s2, 15
                  fcvt.w.s     tp, ft8
                  fle.s        zero, ft11, ft1
                  nop
                  slli         s7, a7, 5
                  fcvt.s.w     ft11, a0, rup
                  div          gp, s5, a6
                  xor          ra, gp, t2
                  addi         sp, sp, 1388
                  fcvt.w.s     a7, fs5, rup
                  fsub.s       fs2, fs6, ft2, rtz
                  fmv.x.w      t1, fa7
                  remu         s7, t2, t5
                  fcvt.w.s     a3, fs7
                  fmv.x.w      s5, fs6
                  fmax.s       fa4, fa7, fa4
                  fmax.s       fs1, ft3, ft7
                  remu         a5, s9, zero
                  lui          s10, 692326
                  fmv.x.w      s5, fs4
                  fmax.s       ft5, ft9, fa4
                  fcvt.w.s     a5, fs3
                  mulh         s5, gp, a1
                  remu         s3, s5, s0
                  fcvt.w.s     s2, fs9, rmm
                  mul          s5, s10, ra
                  slt          s1, s7, t2
                  fsgnjx.s     ft8, fs6, fs7
                  divu         t6, s9, t3
                  srli         s3, s5, 7
                  fsqrt.s      ft4, fs0
                  fsgnjn.s     ft6, fa3, fa2
                  fmin.s       ft10, fs5, fa7
                  and          t0, s1, s11
                  nop
                  fcvt.wu.s    gp, fs6
                  srl          sp, a0, t2
                  srai         s10, s4, 16
                  fsgnj.s      fs11, ft9, fa0
                  fle.s        t1, fs10, fs3
                  feq.s        zero, fs10, fs7
                  fdiv.s       fs2, fs6, ft2, rup
                  andi         s1, gp, 1441
                  add          sp, ra, a3
                  sltiu        a5, t5, 1296
                  fcvt.w.s     s11, fa6
                  fmul.s       fa5, fs4, fs5
                  slt          a5, s4, a3
                  ori          s11, s6, 1637
                  fsgnj.s      fs9, fa2, fs6
                  xori         a1, a3, 1192
                  slli         s2, s8, 13
                  fsqrt.s      fs7, fa1
                  nop
                  lui          zero, 238339
                  fmul.s       ft10, fa3, ft1, rtz
                  sub          sp, s7, s6
                  lui          gp, 307867
                  fadd.s       fs0, fs5, fa0, rne
                  fsqrt.s      fs5, ft1, rtz
                  xor          s1, a7, t4
                  rem          s7, s1, t6
                  fsgnjx.s     ft9, fa1, ft3
                  mulhsu       zero, t4, s4
                  andi         a1, a2, 1769
                  fcvt.w.s     s7, ft7
                  add          a3, t5, ra
                  or           a1, s11, zero
                  nop
                  slli         s3, t5, 2
                  fsgnj.s      ft3, fs3, fs7
                  sll          a3, s4, a7
                  sll          a3, sp, t3
                  or           s0, s8, t5
                  fcvt.w.s     a1, fs10
                  sltu         s9, a2, a2
                  fmv.x.w      gp, ft0
                  or           t6, a6, a2
                  ori          s11, a4, -334
                  fsgnj.s      ft4, fs3, fs9
                  xori         zero, s11, -1562
                  xor          a4, s2, a3
                  slt          ra, a4, gp
                  nop
                  mul          a3, t4, a0
                  fmv.x.w      a7, fa4
                  remu         ra, a5, t4
                  fle.s        s10, ft4, fs11
                  fdiv.s       ft0, ft10, fs1
                  srl          t2, zero, t2
                  fmul.s       fa0, fs8, fs7
                  slti         tp, t6, 1723
                  sltu         gp, t1, tp
                  fadd.s       ft2, fa1, fs9
                  slli         t5, t6, 19
                  fcvt.w.s     gp, ft9
                  slt          a7, s11, t6
                  fmv.x.w      zero, ft7
                  and          t1, t3, tp
                  fsgnjx.s     fs3, ft3, fs4
                  ori          s1, a3, -513
                  mulh         t1, s2, zero
                  slli         a6, a5, 31
                  fdiv.s       fa4, fa6, fa1
                  sra          gp, t2, zero
                  auipc        a3, 140332
                  fsgnjx.s     ft6, fs2, fa7
                  lui          s9, 987249
                  slli         tp, s1, 10
                  fsgnjn.s     fs8, fs6, fs5
                  fle.s        t0, fs1, fa6
                  srai         a4, t5, 29
                  fsgnjn.s     ft8, ft11, fa6
                  fle.s        t0, fa6, fa6
                  fsgnjx.s     fs11, fs8, fa6
                  fle.s        sp, ft11, fa0
                  fadd.s       ft5, fs7, fs0, rdn
                  srl          a0, sp, s6
                  flt.s        s10, fa1, ft5
                  fmv.x.w      a4, ft0
                  rem          t6, a3, t4
                  fsgnjn.s     ft10, fa3, fs3
                  flt.s        t3, ft5, fs5
                  ori          a0, ra, 933
                  remu         a0, t0, ra
                  xori         s4, s0, 747
                  fcvt.s.w     fa7, a4, rdn
                  srai         s10, s6, 18
                  nop
                  fle.s        t2, fs0, ft4
                  mulhsu       a7, sp, t1
                  fmv.x.w      gp, ft2
                  fsgnjn.s     ft8, ft1, fs0
                  andi         s10, t0, -353
                  andi         s0, a4, 1127
                  andi         tp, s5, -1342
                  andi         t4, a6, -750
                  fdiv.s       fs10, ft9, fa0, rtz
                  fmv.x.w      s10, ft5
                  fcvt.s.w     fa0, t5, rmm
                  srli         t0, s6, 28
                  fsqrt.s      fa4, ft6, rdn
                  fcvt.w.s     zero, fs0
                  fle.s        ra, fs6, fs7
                  srai         t0, s2, 19
                  divu         s3, t0, a1
                  fsgnjn.s     fs9, fs11, fa2
                  mulhsu       t1, a4, a7
                  xori         a5, gp, -1854
                  fadd.s       fa1, ft9, ft9, rup
                  mulh         a7, t3, t3
                  fcvt.s.wu    fa6, s5
                  fadd.s       fa7, fs5, fs11
                  or           a4, s8, gp
                  fmin.s       fs6, ft1, fs8
                  srai         a1, t6, 31
                  fadd.s       ft8, ft7, ft2
                  mulh         s1, s6, tp
                  fmv.w.x      fa2, t3
                  fdiv.s       fs1, fs9, ft8
                  fmax.s       ft1, ft2, fa3
                  srli         s3, s6, 1
                  slt          s9, a2, a6
                  fcvt.w.s     s9, ft7, rdn
                  mulhu        s10, tp, s7
                  remu         s10, a1, s5
                  or           s9, s11, s4
                  fadd.s       fs6, ft8, ft10, rdn
                  divu         t4, s8, tp
                  sll          s9, a0, sp
                  sltiu        s3, s5, 1986
                  auipc        s0, 767202
                  fadd.s       ft3, fs3, ft3, rne
                  mulhu        a1, s9, t4
                  mulhsu       t3, zero, zero
                  fsqrt.s      fs10, fs11, rne
                  addi         s11, s1, 1265
                  mulhsu       s9, s7, t5
                  add          a7, sp, zero
                  srai         s1, sp, 4
                  rem          t1, s8, s3
                  fcvt.s.wu    fa4, t0, rne
                  mulhu        a5, a7, s0
                  mulhsu       a0, a7, t4
                  add          s11, s10, gp
                  slti         s11, s3, -1354
                  fmv.x.w      zero, fs4
                  mul          t1, sp, s6
                  auipc        a0, 373007
                  lui          s9, 581012
                  fcvt.s.wu    fa5, s2
                  srli         a6, t4, 31
                  andi         t6, s1, -872
                  andi         ra, sp, 1193
                  sub          a4, a6, a4
                  fsgnj.s      fa1, ft4, fs6
                  fcvt.s.wu    ft7, a3, rdn
                  fsub.s       fa7, ft1, fa6
                  fsgnjx.s     fa3, ft11, ft3
                  mul          t4, s1, s1
                  slli         zero, s2, 6
                  divu         t2, t2, s11
                  lui          a1, 213842
                  fcvt.w.s     ra, fa5, rmm
                  fsgnjn.s     fs0, fa1, ft11
                  fsgnjn.s     fs11, fa2, fa7
                  fsgnjx.s     fa2, fs8, ft9
                  divu         a4, s2, gp
                  sltu         s1, ra, s4
                  feq.s        s4, ft10, ft9
                  xori         s10, s9, -712
                  fclass.s     a1, ft9
                  fmax.s       ft4, fa1, ft0
                  xor          gp, s4, t4
                  fmin.s       fa4, fs8, fs2
                  fadd.s       fs0, fs11, fa6
                  or           zero, a0, a4
                  fle.s        t4, ft7, ft7
                  xori         tp, t0, -947
                  addi         s9, s9, -1453
                  sltiu        s0, s2, 0
                  mulhsu       sp, t3, s6
                  srai         t3, s0, 25
                  fcvt.s.w     fa5, s0
                  andi         a1, s0, -1255
                  ori          zero, a0, 353
                  srl          a5, t6, t6
                  fclass.s     gp, ft6
                  srli         t5, t6, 17
                  fsqrt.s      fs0, fs7, rup
                  fcvt.s.wu    fa2, a5, rtz
                  srai         s0, tp, 14
                  xori         s9, t3, 1232
                  fadd.s       ft3, fs3, ft10
                  or           s3, t0, s2
                  nop
                  fmul.s       fs5, fa2, fs1
                  feq.s        s0, fa5, ft1
                  fsqrt.s      fa5, fa4
                  fsub.s       fs1, ft8, ft1
                  mulh         sp, t2, s11
                  fsqrt.s      ft9, fs7, rne
                  srl          s0, s8, s10
                  feq.s        s0, ft4, fs3
                  fsub.s       ft8, fa7, fs3, rne
                  xori         a6, a5, 938
                  rem          tp, a6, a4
                  slti         s4, a4, -1285
                  srl          s9, s7, t0
                  sltu         s1, a5, gp
                  fmv.w.x      fs10, a2
                  srai         s10, s8, 5
                  fsub.s       ft11, ft1, fs7
                  auipc        s0, 976054
                  srli         s3, s6, 0
                  fle.s        s4, fs9, ft0
                  fsgnj.s      ft9, ft0, ft10
                  fmax.s       ft4, fs6, ft5
                  nop
                  fmin.s       fs1, fs2, ft2
                  feq.s        s11, fa4, fa0
                  remu         a5, t3, t4
                  slti         s11, ra, 1198
                  fdiv.s       ft10, fs0, fs6, rdn
                  slli         t1, gp, 11
                  fsgnj.s      fs4, fs7, fs4
                  fcvt.w.s     s5, ft6, rdn
                  mulhsu       gp, t4, a3
                  xori         gp, zero, -239
                  sub          s0, t5, ra
                  fmv.x.w      tp, fs9
                  fmax.s       fa2, fa3, fa3
                  add          t4, t0, a0
                  lui          s0, 939391
                  slli         a3, s9, 6
                  rem          a0, zero, a5
                  slti         zero, t6, 685
                  addi         t3, sp, 520
                  sltu         t1, a7, s0
                  slti         s7, s0, 770
                  xori         a1, a1, -1011
                  srli         t1, t0, 6
                  xor          t4, t2, s10
                  lui          a7, 584630
                  mulhsu       t4, t2, s10
                  slti         a4, t2, -855
                  mulh         zero, t5, a7
                  fsgnjx.s     ft2, fs2, fs4
                  rem          s5, s2, s5
                  mulhsu       s10, a6, s9
                  addi         a1, a0, 1455
                  and          a3, s8, s5
                  sra          t1, s5, a0
                  fclass.s     s7, fa7
                  slt          s10, t6, s10
                  and          t5, s5, t0
                  fcvt.w.s     a1, fs4, rup
                  add          s7, t2, s3
                  fsgnj.s      fs10, ft10, fs0
                  ori          s0, s2, -1947
                  xor          tp, s5, s9
                  xor          s4, t5, s11
                  rem          s1, tp, a1
                  nop
                  mul          ra, gp, s11
                  xor          sp, t0, s10
                  fsub.s       ft10, fs9, fa3
                  slli         s7, a6, 15
                  xor          s0, a1, a5
                  ori          gp, s0, -1404
                  fmv.x.w      t6, fs10
                  fcvt.wu.s    t5, fs5, rup
                  fdiv.s       ft11, fs6, fa5
                  slti         t3, s3, -368
                  fsgnj.s      fs11, fs1, fs1
                  ori          s11, a7, 1893
                  fsgnjn.s     ft1, fs3, fa4
                  fcvt.wu.s    t0, fs3, rne
                  srli         t2, a7, 31
                  feq.s        a4, fs8, ft4
                  fclass.s     sp, fs2
                  lui          t1, 755533
                  fcvt.w.s     s2, fa5, rdn
                  fadd.s       fa3, ft0, ft1
                  fsub.s       fs1, ft9, fs1
                  fsgnj.s      fa0, fa5, fa7
                  fmul.s       fs9, fa6, fs3, rmm
                  xori         t0, a3, 739
                  fmin.s       fs3, fa0, ft2
                  andi         a1, s9, -632
                  fcvt.s.w     ft2, s1, rtz
                  fcvt.s.wu    fs6, sp
                  ori          sp, ra, -680
                  fsgnjn.s     fa5, fs8, ft1
                  fclass.s     t2, ft10
                  slt          t1, t0, a7
                  feq.s        a0, ft8, fa7
                  fmv.w.x      ft8, s7
                  rem          t0, t2, s2
                  sra          a6, t3, s10
                  mulhu        s5, a1, s2
                  sll          t5, t0, a1
                  andi         t0, t5, 158
                  xor          t3, ra, t4
                  slt          s7, t0, a4
                  xori         s5, t4, -884
                  ori          s4, gp, -2
                  fsgnjn.s     ft8, fs1, ft3
                  divu         s1, a4, s8
                  andi         s10, t5, -1099
                  fadd.s       fa3, fa1, fs0
                  fsqrt.s      fa6, fs1
                  fcvt.s.wu    fs10, t0
                  fadd.s       fa2, ft5, fs4
                  ori          s1, a0, 974
                  addi         s9, ra, 1191
                  divu         s2, ra, s2
                  fcvt.wu.s    t0, ft11, rmm
                  srai         tp, s10, 24
                  fadd.s       fs3, fs6, ft0
                  fle.s        a0, ft0, fs2
                  xor          s7, t4, a2
                  srl          a0, t6, a3
                  feq.s        a3, fs9, ft5
                  srli         gp, a6, 25
                  fmv.w.x      ft6, s3
                  sltu         a5, s9, s11
                  srli         s0, a0, 2
                  mulhsu       tp, s4, zero
                  mul          t5, t4, s5
                  fsgnjn.s     fs0, fs5, fs1
                  or           s4, t1, a0
                  remu         s2, a4, s0
                  srai         t5, s11, 6
                  nop
                  fsqrt.s      ft7, fs1, rmm
                  srli         a7, s5, 4
                  fclass.s     t3, ft4
                  fdiv.s       ft0, fs0, fs2, rne
                  fadd.s       fa6, fa2, ft11, rdn
                  sltu         s9, a2, tp
                  srl          zero, t2, s8
                  sll          s7, a6, t6
                  fmin.s       ft8, fs9, fs6
                  auipc        a1, 28406
                  nop
                  lui          tp, 351329
                  mulhsu       a5, a2, gp
                  fle.s        a3, fs11, fs11
                  fmv.x.w      s5, fa4
                  fmin.s       ft0, fa5, fs0
                  fadd.s       fs1, fs8, fs7, rtz
                  srl          t2, a5, t5
                  fdiv.s       ft4, ft0, fa2
                  fmv.x.w      ra, ft1
                  slt          s3, s0, s5
                  mulh         sp, s11, s3
                  sltiu        t2, s7, 789
                  fcvt.wu.s    t6, fs8, rdn
                  feq.s        ra, fa0, fs1
                  fadd.s       fs2, ft6, ft4, rmm
                  fadd.s       fs10, fs11, fs2, rup
                  mulhu        t6, s5, t4
                  sub          a5, t6, s5
                  mulh         s10, a1, a1
                  or           t6, s8, t1
                  sltiu        a1, s7, -565
                  or           a3, tp, t1
                  divu         s7, s6, s11
                  fcvt.wu.s    t3, ft0, rtz
                  fclass.s     gp, ft2
                  feq.s        t2, ft0, ft8
                  mulhsu       a0, a6, s2
                  xori         a7, t4, 1434
                  srl          s5, zero, t1
                  fsgnjx.s     ft3, ft1, fs8
                  mul          s7, a7, a4
                  nop
                  fcvt.wu.s    s3, fs1
                  fmul.s       ft10, ft1, fs11
                  nop
                  fmv.w.x      fs2, a0
                  fdiv.s       fs6, fs8, ft4
                  and          s10, a4, s4
                  slli         a3, s4, 23
                  slti         a1, gp, 1467
                  fcvt.s.wu    ft0, t1, rdn
                  auipc        s0, 170365
                  sra          t4, t3, s10
                  fmax.s       fs0, fs3, fs5
                  xor          t1, s3, s9
                  slt          t3, s4, s11
                  add          tp, a4, s10
                  fcvt.s.w     fa4, s10, rmm
                  divu         a1, s6, zero
                  slt          a1, s0, s2
                  srai         s0, t4, 8
                  xori         s11, t4, -30
                  auipc        s3, 39475
                  fsub.s       fa5, fa0, fs11, rtz
                  slli         a4, t3, 0
                  flt.s        t6, ft1, fs0
                  slt          a6, s4, s8
                  or           s0, zero, s0
                  fmin.s       fa0, fs7, ft5
                  fsgnj.s      fs9, fs6, ft9
                  or           s1, s4, t4
                  fclass.s     s3, ft7
                  remu         t6, a5, s2
                  fmv.x.w      s10, ft7
                  remu         t5, sp, s4
                  mulh         a0, s5, s3
                  xori         tp, gp, 1238
                  fdiv.s       fa1, fa4, fs0, rup
                  fle.s        a0, ft5, fa4
                  srli         s4, gp, 27
                  fcvt.s.w     ft3, s10, rtz
                  fcvt.w.s     a7, ft7
                  ori          s10, a4, 251
                  slli         s9, s10, 25
                  xor          t4, s4, t0
                  flt.s        sp, ft10, fs5
                  sltiu        t6, t3, 1023
                  fsgnjx.s     fs2, ft9, fs4
                  fadd.s       fs11, ft9, fs7, rup
                  fadd.s       fa1, fs10, fs4, rtz
                  addi         a0, t3, 904
                  sub          s5, a1, ra
                  fadd.s       ft0, ft11, ft8, rmm
                  addi         t4, t5, -1515
                  fle.s        s10, ft10, ft6
                  fadd.s       fs2, fs1, ft11
                  ori          zero, s10, -1983
                  fmv.x.w      a5, fs3
                  fsgnjx.s     fs6, ft8, fs6
                  fclass.s     a4, ft2
                  slt          s0, a2, a1
                  fsgnjx.s     fs11, fa2, fs0
                  slli         s3, s9, 17
                  fsgnjn.s     fs2, ft2, fa3
                  or           gp, a5, s10
                  remu         a5, s6, a7
                  fcvt.wu.s    a0, fs0, rne
                  fmax.s       fs5, fs3, fs3
                  sra          s9, s10, a3
                  nop
                  srai         s9, s5, 5
                  fmin.s       fs6, fs8, fa4
                  xori         s10, a7, 179
                  addi         gp, a7, 1419
                  slli         sp, s1, 0
                  xor          s3, tp, s8
                  add          a4, a0, tp
                  fsub.s       ft3, fa2, ft2
                  fclass.s     s1, fa5
                  sltiu        s5, t5, -1940
                  fsub.s       fa3, fs11, ft0
                  slli         a3, t1, 20
                  fcvt.wu.s    s7, fs1, rdn
                  srli         ra, zero, 8
                  divu         t2, a5, s11
                  fmv.w.x      ft7, s10
                  lui          s3, 291519
                  xor          a0, s8, t4
                  mulh         s1, t5, t2
                  mulhu        t4, t6, t4
                  srli         a7, s9, 0
                  fmin.s       ft0, ft1, ft4
                  div          s11, a0, s8
                  mul          s10, ra, t0
                  sra          a1, s2, a6
                  xori         s4, s3, 1309
                  sll          t2, gp, s10
                  sltiu        s10, t1, -782
                  sltu         s7, s4, a7
                  andi         s11, a7, 218
                  add          ra, s2, gp
                  slti         s7, t0, -1726
                  fcvt.s.w     fs8, a5, rup
                  mul          a5, s1, s7
                  flt.s        s9, fs0, fa2
                  fclass.s     s5, ft11
                  fmv.w.x      fa6, a3
                  xori         a3, s5, -1617
                  xor          tp, t4, a7
                  fsgnj.s      fs7, fs11, ft4
                  fdiv.s       fs2, ft10, fs1
                  srli         ra, s9, 23
                  fmin.s       fs5, ft0, fs4
                  fmv.x.w      s5, fa2
                  fsub.s       fa0, ft1, fs6, rmm
                  fcvt.wu.s    s9, ft3
                  nop
                  fcvt.w.s     tp, fa4
                  xori         s1, s10, 1589
                  fsgnjx.s     ft1, ft2, fs11
                  srai         a7, a6, 2
                  mul          s0, t6, t5
                  fmax.s       ft2, ft0, fs2
                  fsgnj.s      ft3, fs11, fs2
                  andi         a6, t3, -1201
                  mulhu        sp, a5, t1
                  sltiu        a3, gp, 57
                  fclass.s     a6, ft6
                  flt.s        s1, ft11, ft3
                  mulhsu       s0, s3, t3
                  fmin.s       ft4, fa3, fs6
                  and          t1, a5, s10
                  fmin.s       ft2, fa6, fa5
                  add          a0, a0, t4
                  fmin.s       ft8, fs5, fa0
                  divu         s1, t3, s10
                  fmax.s       ft11, ft11, fs8
                  fsqrt.s      fa5, fs4, rmm
                  slt          t4, gp, s8
                  and          s7, a1, t3
                  add          tp, s7, s5
                  fsgnjn.s     fa0, fa4, fs0
                  fmax.s       ft5, ft9, ft8
                  ori          gp, s11, -1782
                  fle.s        ra, ft4, ft5
                  fmv.x.w      a6, ft3
                  fcvt.s.wu    fa0, tp
                  fdiv.s       fs9, fa2, fs5
                  fmin.s       fa0, ft4, ft5
                  fsqrt.s      ft4, fs10
                  xori         t3, a0, 1260
                  srl          s1, s10, tp
                  andi         t0, s1, 1045
                  fmv.w.x      fa0, t5
                  lui          a6, 758804
                  xor          t5, a0, s2
                  sltu         a1, a7, s6
                  fdiv.s       ft2, ft11, ft7
                  sub          zero, s11, s9
                  fsqrt.s      ft8, ft4
                  mulh         s5, sp, sp
                  slti         zero, sp, 219
                  fsgnjx.s     fs9, ft1, fa6
                  fsgnjx.s     fa7, fs6, ft1
                  xori         s0, t5, 1400
                  feq.s        t6, fs9, fa4
                  fmin.s       fa1, ft4, fs1
                  fadd.s       fs8, fa0, fa4, rmm
                  and          s4, tp, s0
                  fsqrt.s      fs3, fa0
                  fcvt.s.wu    fa3, s7
                  or           a0, t3, s6
                  div          t0, s8, t2
                  div          s3, a0, a1
                  mulhu        s11, s3, t3
                  add          tp, t4, t4
                  fmin.s       fs1, fs8, ft5
                  flt.s        a5, fa4, ft0
                  srl          s4, a7, t1
                  srai         s10, s3, 2
                  flt.s        t6, fa1, fs8
                  feq.s        s7, fa4, ft6
                  sltiu        t1, sp, 1333
                  fcvt.wu.s    t3, fs8, rmm
                  flt.s        a3, ft7, fs8
                  fmax.s       ft0, fs9, fa4
                  sll          t6, s0, s11
                  fsub.s       fs0, ft6, fa4
                  sra          t1, s11, s0
                  rem          s7, s5, a7
                  fmul.s       fs9, fa5, fs0
                  mulhsu       a1, s8, a4
                  srai         s0, a7, 5
                  addi         s11, a2, -973
                  fmv.w.x      fs3, s5
                  ori          t4, t5, 509
                  sltiu        t2, sp, -776
                  srai         zero, t6, 3
                  fclass.s     s0, ft9
                  add          s4, gp, a5
                  andi         s5, a6, 1392
                  or           s7, a3, t1
                  fsqrt.s      fs6, fa1
                  flt.s        ra, fs6, fs1
                  fsqrt.s      ft5, fs5, rmm
                  fmax.s       fs8, fa6, fs3
                  xor          s0, a6, s11
                  slt          a4, s5, s10
                  mulhsu       s4, t5, a3
                  ori          s7, a0, -1342
                  fle.s        s7, fa7, ft6
                  fclass.s     s10, fs7
                  xori         a4, s2, -263
                  feq.s        s7, ft1, fa2
                  slt          sp, s2, s8
                  feq.s        t1, fs2, ft2
                  srl          t3, zero, a5
                  fmv.x.w      s9, fs5
                  sltiu        tp, t6, 1477
                  xor          a0, t2, s6
                  rem          a4, s2, a1
                  nop
                  divu         t3, s0, t1
                  fsub.s       fa4, fs7, ft0
                  mulhu        s5, s1, s7
                  sub          s7, a7, t6
                  fadd.s       fs5, fs10, fs7, rdn
                  andi         ra, t6, 1549
                  fmul.s       fs8, fs4, ft7, rdn
                  fsub.s       fa0, fs1, fs10
                  slti         t5, a2, -770
                  fsgnjn.s     fa4, ft11, fs7
                  andi         a3, s0, -1895
                  fadd.s       ft8, ft8, fs1, rtz
                  fsub.s       fs9, fs1, fa1, rup
                  feq.s        a0, fs11, fs9
                  fmin.s       ft9, fs10, ft4
                  fmin.s       fs7, fa4, ft7
                  ori          zero, a1, -1469
                  sltu         t4, a6, s1
                  sub          a1, s11, gp
                  andi         s7, tp, 1478
                  mulhsu       a7, zero, s1
                  srl          t0, s10, a1
                  fcvt.s.wu    ft9, t5, rne
                  fclass.s     zero, fs8
                  addi         t5, s3, 94
                  mulh         a0, a7, s7
                  srai         s2, s1, 22
                  fmax.s       fs1, ft8, fs3
                  fcvt.w.s     s3, fa0
                  div          s2, s1, t2
                  fsgnj.s      fs8, fs4, fs1
                  slt          s4, s10, a5
                  flt.s        t3, fs7, fs5
                  fmul.s       fs2, ft11, fs4, rup
                  fle.s        a5, ft10, fs1
                  fclass.s     s9, ft1
                  div          sp, a2, sp
                  add          s1, t0, a0
                  feq.s        tp, fa3, ft11
                  srli         s1, t3, 16
                  slli         s1, s8, 1
                  fcvt.s.wu    fs4, t1
                  sub          s3, ra, t2
                  sll          s9, t4, s10
                  sra          s3, a4, t2
                  div          s7, s10, sp
                  srai         s7, a4, 24
                  flt.s        t2, ft8, fa2
                  add          ra, s7, s8
                  or           s7, s6, s2
                  sub          t2, gp, a0
                  auipc        a1, 789103
                  fsgnj.s      ft2, ft2, fa4
                  fsgnjn.s     fs10, fs4, ft1
                  fcvt.wu.s    t1, fa3, rtz
                  lui          t5, 159512
                  fmax.s       ft0, ft5, ft5
                  srli         s7, s8, 30
                  fmin.s       fs1, fs6, fs8
                  slli         t3, s10, 27
                  slti         t2, s0, 1793
                  nop
                  srli         t2, zero, 25
                  sra          sp, a5, t4
                  feq.s        a7, ft5, ft1
                  ori          t2, t5, 152
                  xor          t0, a5, a3
                  add          t4, tp, tp
                  ori          t4, t4, -1156
                  divu         a5, gp, s1
                  addi         zero, sp, 1179
                  mul          a7, a1, sp
                  mulhsu       a4, s9, t5
                  fcvt.w.s     s0, fs9, rdn
                  sra          t2, t0, a2
                  fcvt.w.s     t6, fa6
                  fcvt.s.w     fs11, tp
                  fle.s        s2, fs6, fs7
                  sra          a4, s0, a3
                  andi         s2, s8, 880
                  sltiu        zero, a0, 1041
                  andi         s1, s7, -1341
                  div          t1, a2, a1
                  fdiv.s       fs8, ft4, fa1, rdn
                  addi         a4, a6, 864
                  fdiv.s       fa0, ft3, fs7
                  sll          a6, a7, s8
                  fmin.s       fs1, ft9, ft5
                  srl          s0, tp, a6
                  auipc        a3, 370711
                  xor          t0, s2, a5
                  fmul.s       fs7, fa3, ft8, rup
                  srai         t0, s10, 8
                  sltu         s4, s5, sp
                  mulhu        a3, s9, s5
                  nop
                  fcvt.s.wu    fa0, a1
                  fmax.s       ft7, fs0, fa2
                  and          sp, s11, sp
                  fclass.s     s9, ft8
                  fsgnjn.s     ft3, ft5, fs6
                  slli         zero, a7, 31
                  mul          s3, ra, a5
                  fsub.s       fa1, fa0, ft6
                  add          gp, s0, a6
                  nop
                  sltu         s5, s8, tp
                  fsgnjx.s     ft3, fs0, ft4
                  fmv.w.x      ft0, a2
                  fmax.s       fs7, ft0, ft1
                  fdiv.s       fa4, fs1, fa3
                  remu         a4, a6, s11
                  fsqrt.s      fa7, ft3, rup
                  fmul.s       fa3, fs2, fa1
                  addi         s2, a1, 1352
                  fle.s        s9, ft4, ft8
                  fsgnjx.s     ft7, ft3, ft6
                  fmv.x.w      a6, fs2
                  fcvt.s.w     ft3, gp, rmm
                  fsub.s       fs8, ft8, ft9
                  fsqrt.s      fs4, ft2
                  fle.s        s10, fa7, fa1
                  fmul.s       fa6, fs1, ft2, rdn
                  andi         s9, s7, 1356
                  fcvt.s.w     fa2, t0
                  slli         t6, a7, 29
                  mulh         t1, s3, s1
                  mulh         t4, s4, s8
                  nop
                  fmul.s       fs3, fs8, ft3, rtz
                  addi         s11, t4, -542
                  sltu         a1, a1, s8
                  mulhsu       s1, a7, s6
                  fadd.s       ft4, fs11, fs0, rne
                  mulhu        s4, t4, gp
                  divu         t3, gp, t5
                  flt.s        s11, ft3, fs11
                  mulh         s5, s0, s5
                  sll          t3, ra, a0
                  slt          tp, s4, s4
                  fsgnjx.s     fs1, ft10, fa6
                  fmax.s       ft8, ft2, fs0
                  feq.s        s2, fs8, ft9
                  fcvt.w.s     t6, fs8
                  divu         s1, s6, a7
                  slt          t1, s5, zero
                  or           tp, t0, a6
                  fclass.s     s4, fs2
                  andi         t1, s4, -1528
                  srli         s5, s0, 2
                  srai         t6, a1, 31
                  fmin.s       ft5, ft3, fa4
                  fcvt.w.s     a4, fs8
                  fmul.s       fa1, ft11, fs4, rtz
                  remu         t1, ra, s10
                  mul          t1, a5, sp
                  fcvt.s.w     fs9, t1, rdn
                  lui          t0, 734122
                  fcvt.wu.s    a4, fa7, rtz
                  fsgnj.s      fs3, fs8, fs1
                  fadd.s       ft6, fs2, fs2
                  fcvt.wu.s    a5, fs11, rmm
                  fsqrt.s      fs0, fa0
                  lui          a5, 881433
                  fmv.w.x      fa1, zero
                  lui          a5, 361803
                  feq.s        a1, fa7, fs10
                  srl          s1, s10, a6
                  fmax.s       fs10, fs2, fa5
                  xor          sp, s5, t5
                  fadd.s       fa6, fs11, fs9, rup
                  slli         t4, s7, 15
                  andi         a6, s0, -1141
                  sltu         a3, tp, t2
                  fmv.w.x      fs8, zero
                  divu         sp, s6, s8
                  xor          zero, s6, s5
                  slti         s1, a4, -1034
                  fsgnj.s      ft8, ft10, fa2
                  sra          s1, s11, a6
                  fsqrt.s      fa2, fs3, rtz
                  fle.s        a0, fa6, fa5
                  srl          a0, s3, s7
                  fcvt.wu.s    tp, ft4
                  xor          t1, a1, s2
                  ori          sp, sp, -710
                  fcvt.s.w     ft3, t1
                  xori         s7, s6, -318
                  fle.s        a3, ft9, ft2
                  xor          a0, a5, t4
                  fmv.x.w      t0, ft1
                  fsgnjx.s     fs0, fs2, ft5
                  fsgnj.s      fa5, fs8, fa5
                  div          s2, s2, zero
                  xori         s0, tp, 880
                  fmv.w.x      fa7, s0
                  or           s1, t1, s5
                  fmax.s       fa4, ft9, ft0
                  mulhu        sp, tp, tp
                  remu         a6, t6, s0
                  fmin.s       fs2, ft1, fs6
                  fmv.w.x      fs7, ra
                  sll          s10, s8, a7
                  fcvt.w.s     t5, ft0
                  fcvt.w.s     a5, ft7
                  fmax.s       ft1, ft11, fs7
                  xor          ra, tp, s3
                  fsgnjx.s     fs9, fa5, fs6
                  srl          s1, a1, ra
                  srl          s7, t2, a6
                  fdiv.s       fa7, fs2, ft10
                  srai         t4, s2, 22
                  fcvt.s.wu    fs9, s4
                  flt.s        a5, ft10, ft3
                  fsqrt.s      fs9, fa6
                  or           a1, s11, s1
                  flt.s        zero, fs9, ft9
                  fcvt.w.s     s7, fs1, rdn
                  and          tp, a4, s10
                  fcvt.wu.s    a0, ft3
                  nop
                  mulhsu       t2, gp, s6
                  fcvt.wu.s    t2, ft8, rup
                  fclass.s     s0, fs5
                  and          t1, t6, tp
                  fclass.s     t4, fa0
                  fmv.x.w      sp, fs1
                  nop
                  srli         a3, s0, 16
                  sra          tp, s5, t5
                  fsgnjn.s     ft5, ft0, fs3
                  fadd.s       ft10, ft3, fa5
                  fmv.w.x      ft2, ra
                  or           s4, s0, a4
                  nop
                  fdiv.s       ft7, ft10, fa2, rup
                  fmax.s       fs11, fs11, ft4
                  fclass.s     t0, fa0
                  and          a1, a1, tp
                  div          s11, ra, s11
                  slli         a5, t3, 10
                  fmul.s       fs8, ft9, fs8
                  lui          a4, 205837
                  fmv.x.w      t4, fs0
                  fcvt.w.s     s3, ft1
                  fsgnjx.s     ft10, fs11, fs0
                  mulhu        a5, s1, s3
                  rem          s10, a7, a0
                  lui          t0, 921194
                  fmax.s       fa0, fs10, fa7
                  andi         zero, s8, 1356
                  fcvt.w.s     t0, fs10, rtz
                  lui          t5, 372789
                  divu         s5, t5, s10
                  slli         a1, s9, 10
                  fdiv.s       fa2, fs1, fs2, rmm
                  sltu         a5, a5, s5
                  auipc        s10, 190355
                  fle.s        t3, fa4, ft8
                  fle.s        t2, ft0, ft8
                  mulhu        sp, s5, t0
                  sra          t2, s2, s5
                  fmv.w.x      fs10, s8
                  fmul.s       fs6, fa5, ft8
                  srai         a1, a2, 17
                  sub          t5, tp, a4
                  ori          a0, a1, -1520
                  fcvt.wu.s    a6, fa5, rmm
                  nop
                  rem          s4, s2, s5
                  mul          a1, s9, tp
                  slti         s10, t2, 620
                  mulhu        t3, t5, s9
                  slti         s3, s3, -679
                  slt          a5, a3, s10
                  srai         sp, a4, 8
                  sll          a3, t1, t1
                  fmv.w.x      fs4, s0
                  fmax.s       fs3, fs2, fa6
                  fcvt.s.wu    fa5, s8
                  srl          zero, s5, a6
                  mulhsu       a7, t1, s6
                  fmv.w.x      ft11, sp
                  lui          zero, 370085
                  sra          gp, s3, a0
                  fmax.s       fs11, fa3, fs9
                  mulh         s7, a2, s4
                  addi         s11, a1, -565
                  lui          a7, 1000446
                  fadd.s       fs1, fa4, ft1, rtz
                  fsgnj.s      fs1, ft4, fs9
                  xor          s2, tp, gp
                  fclass.s     t4, fa5
                  addi         s11, a5, -479
                  fmul.s       ft9, fa5, ft7
                  divu         a6, s7, s2
                  sltiu        s2, s4, -1662
                  fdiv.s       fa7, ft6, ft0, rdn
                  and          a0, s9, t1
                  fclass.s     s11, ft10
                  or           a5, a5, t0
                  fcvt.s.w     fs9, t1
                  fmin.s       fs7, ft9, fa1
                  sltiu        tp, zero, -2018
                  fsgnj.s      ft7, ft10, fa2
                  slli         t6, t1, 20
                  fcvt.s.wu    ft10, a6, rne
                  fsgnj.s      fs11, fs5, ft1
                  fcvt.w.s     s9, fs8, rup
                  fadd.s       fa5, ft10, fs5, rup
                  fadd.s       fa6, fa5, fs4, rdn
                  fsqrt.s      fs6, fs6
                  divu         sp, a6, s2
                  fmin.s       fa0, fa5, ft8
                  xori         t6, s10, 1210
                  xori         a7, s7, -175
                  srli         s0, ra, 26
                  sra          a4, s5, s5
                  mulhu        t4, s3, t0
                  xor          s3, s4, t2
                  fclass.s     a6, fs3
                  divu         ra, a0, s4
                  addi         gp, a5, 552
                  fsub.s       ft2, fs1, fa0
                  srl          a0, a0, s8
                  sltu         a3, a2, a6
                  fmax.s       fs1, ft2, fa5
                  slli         s7, s9, 7
                  fmin.s       fs1, fs5, ft3
                  fsgnjx.s     fs8, ft11, fa2
                  fsgnjx.s     fs7, ft7, fa3
                  srai         zero, s4, 25
                  slti         ra, a6, 151
                  fmv.w.x      ft5, a3
                  lui          ra, 155949
                  slli         s10, gp, 13
                  sra          s2, a6, s10
                  slt          s3, a7, a0
                  add          sp, s5, a1
                  fcvt.s.w     ft2, tp
                  xori         s2, a1, -431
                  slti         s4, t4, 1172
                  fcvt.wu.s    gp, fs6
                  fsgnjx.s     fs6, ft0, ft2
                  fmax.s       fs5, fa1, fa1
                  lui          a7, 465280
                  fsgnj.s      fs6, ft6, fa6
                  fmul.s       ft0, ft9, ft8, rtz
                  fsgnjx.s     fa6, ft11, ft5
                  fsgnj.s      fs2, fs6, ft9
                  sltu         a1, s11, s5
                  fsqrt.s      fa5, fa7
                  fmv.x.w      sp, fs3
                  remu         s11, a5, a3
                  divu         t3, t1, gp
                  remu         zero, a6, a3
                  mul          s5, s8, s11
                  fle.s        s1, ft0, ft5
                  addi         tp, t0, -800
                  fmv.x.w      a0, ft5
                  fmul.s       fa6, ft7, fs3
                  slti         t1, t2, 1813
                  sltu         t5, s11, s11
                  fcvt.s.w     fs9, s11
                  fsgnjn.s     ft5, ft0, fa3
                  lui          a7, 353074
                  fsqrt.s      fs7, fs5
                  srli         t3, gp, 17
                  srl          ra, t6, s10
                  sra          s5, s9, t4
                  slli         s11, t2, 30
                  and          t2, a7, s0
                  fcvt.s.wu    fs5, s0, rne
                  slli         t6, gp, 19
                  fmin.s       ft9, fs4, fs1
                  mulhu        a7, s3, s2
                  or           t4, s1, t4
                  add          gp, ra, a6
                  fsqrt.s      ft7, ft11, rup
                  fmin.s       fs9, fs6, fs0
                  add          s9, a4, ra
                  slli         zero, a7, 10
                  fcvt.s.wu    fs5, s0
                  nop
                  divu         a1, t4, s7
                  rem          tp, a5, s8
                  mul          s3, s5, s3
                  srai         t3, tp, 21
                  sltiu        s1, s8, -2004
                  remu         s10, s10, t5
                  auipc        s11, 205631
                  srli         ra, s3, 23
                  fclass.s     a4, fa0
                  addi         tp, a0, -689
                  fcvt.s.wu    fa6, ra, rdn
                  ori          tp, a7, 980
                  fmv.w.x      ft6, ra
                  slt          tp, a3, a5
                  fdiv.s       fa5, fs11, fa1
                  sltu         tp, s2, s0
                  xor          s9, zero, t2
                  andi         t2, t1, 338
                  fsgnjn.s     fa2, fs11, fs8
                  sltu         a3, s0, tp
                  fcvt.s.w     fs9, s5
                  rem          tp, a4, gp
                  ori          sp, s5, -251
                  srli         t3, s9, 11
                  feq.s        a0, ft2, ft11
                  mulhu        a7, s8, s2
                  xor          t0, sp, s1
                  sll          t5, t3, s6
                  srai         t4, s1, 21
                  fmv.w.x      fs9, s3
                  ori          s1, a0, -956
                  srl          s2, s4, tp
                  add          t6, a1, s3
                  mul          s0, s8, t3
                  slti         a5, t2, 1176
                  xori         tp, gp, -649
                  fsgnj.s      fs4, fa0, fa4
                  sll          zero, a0, t4
                  remu         t0, s5, t1
                  fsub.s       fa6, fa2, ft8, rtz
                  mul          t4, t3, s4
                  fmv.w.x      fa6, sp
                  rem          s10, a5, t3
                  mul          sp, a3, tp
                  auipc        s4, 700548
                  slti         a1, s4, 1501
                  fmax.s       ft9, fa0, ft4
                  mulhu        tp, t2, a4
                  sra          s3, s11, s11
                  feq.s        s4, fs2, fa4
                  fsgnjx.s     ft6, ft3, ft11
                  mulhu        a6, a3, gp
                  fclass.s     s3, fs6
                  fmv.w.x      ft11, s8
                  fadd.s       fs8, fs11, ft5
                  lui          s10, 355122
                  rem          tp, s0, s1
                  srli         t0, t4, 6
                  feq.s        s5, fs0, ft4
                  fclass.s     a3, fa3
                  auipc        t4, 426549
                  srai         a7, a4, 20
                  sra          a6, a1, s6
                  remu         s7, t3, a0
                  flt.s        s3, fa5, fs1
                  div          a7, gp, s2
                  addi         t5, s7, -962
                  fcvt.wu.s    tp, fs0, rmm
                  add          s5, t0, zero
                  fsgnjx.s     ft10, fs4, fa7
                  slti         a6, a4, 340
                  add          s0, s5, s9
                  sll          sp, s9, s5
                  fmv.x.w      s11, fa2
                  nop
                  fcvt.w.s     a1, ft2, rne
                  sltiu        s4, a1, -1827
                  sub          s0, tp, sp
                  addi         tp, s6, 1761
                  fle.s        zero, fs8, fa6
                  mulhu        t2, a4, s1
                  fclass.s     s10, ft1
                  or           s7, t4, s5
                  srli         t3, zero, 18
                  mulhu        t2, zero, s2
                  fsgnj.s      fa7, fs4, ft9
                  srl          t3, a3, a6
                  xor          a5, s2, s1
                  auipc        t0, 915106
                  ori          s0, t1, -79
                  ori          s3, a1, -605
                  slt          s9, s6, t1
                  nop
                  rem          a4, a0, t0
                  fmul.s       fs8, ft3, fa0, rup
                  divu         a1, s4, t4
                  ori          a7, s0, 1292
                  mulhu        a5, s10, gp
                  sltiu        a6, t4, -706
                  nop
                  addi         a3, s2, 148
                  slli         s11, a3, 12
                  and          t6, a0, t0
                  fle.s        a3, ft11, fa0
                  fcvt.s.wu    fa2, t0, rmm
                  sra          s2, a0, t4
                  addi         a1, s10, -1130
                  fmul.s       fs0, ft2, ft5, rmm
                  slti         s10, s1, -669
                  srli         t3, t1, 30
                  fsgnj.s      fa1, fa5, ft2
                  fmax.s       fs7, ft1, fs3
                  or           a1, t2, s5
                  rem          t1, t0, s3
                  xori         gp, t1, 838
                  feq.s        t0, fa2, ft3
                  div          t4, s2, s9
                  add          ra, a5, t6
                  fcvt.wu.s    t5, ft0, rdn
                  mul          zero, zero, s8
                  sltu         t4, tp, s2
                  fadd.s       ft10, fs6, fa2, rtz
                  fsqrt.s      ft4, ft6, rtz
                  mulh         a7, zero, a3
                  fcvt.w.s     s1, ft4
                  fle.s        tp, fs3, fa7
                  fcvt.s.wu    fs5, a6
                  and          zero, a5, s5
                  fmv.x.w      zero, fa6
                  fclass.s     t2, fs7
                  fle.s        a1, fs1, ft5
                  feq.s        a0, ft3, fs3
                  xori         s2, s1, -359
                  ori          s7, t6, 1768
                  slti         s4, a5, 1672
                  xor          s11, a2, s6
                  mulhu        a4, s9, s3
                  fcvt.s.w     ft4, s10
                  div          t3, tp, a7
                  fmul.s       ft7, fa3, ft4
                  xori         t1, s1, -1062
                  fmin.s       ft11, ft10, ft11
                  addi         s3, sp, -464
                  fmul.s       fs5, fa7, fs5
                  fcvt.wu.s    s2, fs9
                  fcvt.s.wu    fs2, a4, rdn
                  auipc        sp, 629498
                  xori         t5, s0, -543
                  sub          a7, a7, ra
                  mulh         t5, t5, s0
                  fsgnj.s      ft10, fs7, fs8
                  fdiv.s       fs5, ft9, fs8, rmm
                  slli         s2, a5, 15
                  or           ra, s7, s9
                  or           t5, t3, s2
                  srl          s3, t2, s1
                  mulhu        t4, s8, s5
                  addi         a4, a2, -1038
                  div          a4, t1, a1
                  fsgnj.s      ft4, fs11, ft8
                  nop
                  fcvt.wu.s    a5, ft3, rup
                  sll          a6, t0, t5
                  auipc        a1, 854196
                  fmul.s       fa6, ft1, ft5, rmm
                  fmax.s       ft7, fa1, fs0
                  sra          s7, a3, s11
                  fmv.x.w      a3, ft9
                  feq.s        zero, fs11, ft4
                  flt.s        s3, fa7, fs4
                  and          s3, s11, t0
                  fle.s        s11, ft10, ft0
                  slli         t1, a1, 26
                  feq.s        s2, fs9, fa1
                  fle.s        s11, fs1, ft0
                  fmv.x.w      t6, fs3
                  mul          a3, gp, sp
                  mul          t1, s3, t3
                  or           sp, s2, a1
                  sltiu        ra, t5, 1997
                  feq.s        s4, fs8, ft8
                  sll          s2, t3, s10
                  fmul.s       fa4, ft5, fs11, rmm
                  xor          s1, s6, s0
                  fmul.s       ft0, fs5, fs10
                  srli         t2, t4, 21
                  sltu         s1, a7, s4
                  fcvt.wu.s    s3, ft1
                  feq.s        s11, ft8, fs6
                  feq.s        s2, fs9, ft7
                  mul          a4, t4, a3
                  slt          t5, a7, s10
                  fsgnj.s      ft3, ft5, ft0
                  fsqrt.s      fs2, fs2, rdn
                  mulh         t0, a0, t5
                  srli         s11, a7, 29
                  nop
                  sub          s4, sp, t4
                  fmul.s       ft11, ft0, ft9, rmm
                  lui          t5, 656290
                  or           sp, s9, s10
                  sra          s5, s0, s1
                  fcvt.s.wu    fa0, s3, rup
                  fmin.s       fs10, fs8, fs9
                  mulhsu       sp, sp, s0
                  feq.s        s1, fs9, fa0
                  fclass.s     gp, ft9
                  sub          t2, a7, s4
                  fle.s        s0, ft8, fa0
                  mulhsu       s10, s8, t5
                  auipc        s0, 225231
                  div          gp, s8, a6
                  fadd.s       fs8, ft8, fa6, rne
                  fmul.s       ft2, ft4, ft3
                  mulhu        s3, s0, a7
                  rem          t1, s3, tp
                  ori          s1, t3, -1768
                  sub          s11, s8, a7
                  addi         a6, s9, 911
                  mulhsu       s9, t1, t6
                  mul          s4, zero, s1
                  fcvt.s.w     fa7, s7
                  fmax.s       ft5, ft5, fs0
                  fsgnjx.s     fs9, fa6, ft10
                  sltiu        s11, t0, -23
                  fcvt.s.w     fs7, s1
                  fcvt.w.s     a7, ft7, rne
                  mulhu        s1, s8, a1
                  sra          t5, s4, s10
                  divu         sp, t5, a7
                  sltu         s0, s9, t4
                  remu         s3, s3, a0
                  div          s0, t1, t1
                  feq.s        t0, ft7, fa6
                  fcvt.w.s     sp, fs1
                  fmax.s       ft7, fs10, fs3
                  lui          s0, 655121
                  addi         t1, a4, -719
                  fclass.s     zero, ft8
                  or           a7, tp, t3
                  srl          sp, a5, t3
                  fcvt.s.wu    fs4, a1, rne
                  fcvt.s.w     fs6, t6
                  fclass.s     s7, ft3
                  fmax.s       ft4, fs0, fs8
                  fsub.s       fa2, ft7, ft7, rup
                  fsqrt.s      ft4, ft2
                  fcvt.w.s     ra, ft5
                  divu         t0, zero, a7
                  sltiu        s3, s11, -1911
                  fclass.s     s4, ft6
                  fsgnj.s      fs10, ft9, fa0
                  addi         s4, a4, -1892
                  fsub.s       ft0, ft2, ft6
                  fsub.s       fs3, fs5, fs4
                  sltiu        s7, tp, 1742
                  sra          t1, a1, s8
                  div          a5, t5, tp
                  add          t4, a4, gp
                  slli         t6, t1, 31
                  fclass.s     s0, fa5
                  fsub.s       ft5, fs11, fs0
                  fdiv.s       fs10, ft3, ft4, rtz
                  srl          a3, t5, a3
                  andi         a5, t3, 1697
                  div          sp, a5, s4
                  or           gp, t2, s1
                  and          t3, a4, s4
                  lui          t0, 631930
                  fcvt.s.wu    ft4, tp
                  fdiv.s       ft4, fs5, fs11
                  flt.s        s10, fs4, fs8
                  fmv.w.x      ft8, s2
                  sltiu        gp, s4, -1364
                  sll          s10, s1, s5
                  slt          tp, s10, s1
                  fcvt.s.w     ft9, s11
                  ori          s10, a2, -1112
                  slt          s7, s1, a4
                  sll          s9, t2, sp
                  fsgnjn.s     ft8, ft7, fa1
                  add          s10, a6, a4
                  srli         a0, s3, 14
                  sra          s1, s7, s3
                  fadd.s       fa4, fs9, fa5
                  fsgnjx.s     fs0, fs5, ft11
                  fcvt.s.wu    ft0, a7
                  fcvt.w.s     t0, fa7, rne
                  mulhu        s2, t2, s11
                  fclass.s     gp, ft11
                  fle.s        a4, fs11, fs11
                  fdiv.s       fa2, fa0, ft8
                  xori         s10, s11, -317
                  srl          t0, t6, s9
                  fcvt.s.w     ft1, a5
                  or           s9, t1, t5
                  lui          s3, 1782
                  fmin.s       ft2, fs9, fa2
                  slli         ra, t3, 30
                  fcvt.s.wu    ft2, s0
                  remu         t4, a3, s5
                  divu         a4, s11, a0
                  div          s2, s11, s7
                  fcvt.wu.s    t1, fs3
                  divu         tp, t1, s2
                  addi         t4, s8, -579
                  mulhu        s4, t0, s0
                  fmax.s       fa2, ft4, fs11
                  and          t6, a6, a6
                  fle.s        sp, fs6, fa2
                  fadd.s       fa1, fa7, ft9, rup
                  sra          a5, a1, s6
                  mul          a3, zero, s6
                  mulh         s7, tp, a1
                  mul          t6, t4, s3
                  srli         a1, t6, 16
                  and          t5, gp, t0
                  mul          t2, a4, t1
                  or           s1, s2, a0
                  sltiu        s10, s2, 744
                  rem          s3, ra, s4
                  fle.s        a3, fa4, fs3
                  sra          t1, sp, t0
                  mulhsu       s4, t3, ra
                  fclass.s     a0, ft0
                  fle.s        t5, fs2, ft2
                  fmv.x.w      s10, fa3
                  fcvt.wu.s    s2, ft0, rtz
                  fcvt.wu.s    a7, ft4, rne
                  fsgnj.s      fa0, fs6, fa3
                  or           s3, sp, a3
                  slli         s7, s4, 31
                  fdiv.s       ft10, fs7, fa3, rdn
                  fmv.w.x      ft5, tp
                  mulhsu       t3, s1, a1
                  mulhsu       t2, s5, s4
                  fdiv.s       fa5, ft7, ft3
                  nop
                  fsgnjn.s     ft7, ft2, ft2
                  fmin.s       ft2, fs11, ft10
                  sra          a7, s10, sp
                  fmv.w.x      fs6, s6
                  mul          t6, t2, s4
                  fsgnj.s      ft8, fs10, fs10
                  div          tp, t0, t5
                  div          gp, t1, a3
                  add          ra, t2, t2
                  nop
                  fmv.w.x      ft7, s9
                  fsgnj.s      fa3, fs4, ft10
                  fmul.s       ft8, fs10, ft5, rup
                  slli         t1, s5, 8
                  flt.s        a5, fa2, ft1
                  andi         a7, a1, -941
                  mulh         a3, s11, a2
                  addi         a0, t2, -1045
                  srl          a5, a3, t6
                  lui          a7, 510321
                  sltiu        sp, t5, 1737
                  sra          s3, a4, a0
                  xori         tp, s5, -292
                  ori          gp, sp, -377
                  add          a4, t2, s6
                  mul          s11, a4, s0
                  fsgnjx.s     fs3, ft11, ft5
                  fcvt.s.wu    ft4, s3, rup
                  sltiu        a3, a2, -1366
                  fclass.s     s10, ft8
                  fsqrt.s      fs6, ft8, rdn
                  mulhu        gp, s0, a3
                  fmin.s       fs1, ft5, fs0
                  remu         s0, s7, gp
                  rem          a5, s4, tp
                  fsgnj.s      ft7, fs4, ft5
                  lui          a7, 224395
                  sub          s7, t2, t2
                  div          a6, s11, s4
                  mulhu        t0, a7, a0
                  sll          s7, t5, t3
                  sll          ra, t6, t0
                  sltiu        t1, t3, -598
                  fclass.s     t1, ft4
                  lui          ra, 908780
                  srli         zero, s4, 5
                  fmul.s       ft3, fs3, fa4
                  fsqrt.s      fs8, ft10, rup
                  fmv.x.w      s10, ft1
                  fadd.s       fs6, ft5, ft2
                  rem          a0, zero, t2
                  sll          s7, ra, t5
                  addi         tp, s10, -1523
                  ori          a7, a7, 1404
                  feq.s        s5, fs11, ft6
                  or           t5, a0, s3
                  divu         t2, a2, s3
                  sra          s2, t4, a0
                  rem          a4, s10, s4
                  fle.s        t0, ft6, fs8
                  slt          s5, a7, s5
                  srli         t2, t6, 7
                  rem          a0, gp, a7
                  and          a3, s4, sp
                  srai         a0, a0, 28
                  fclass.s     a6, ft1
                  fmul.s       fs3, fs10, fs11, rne
                  mulh         t1, tp, s4
                  fsqrt.s      fs4, fa6
                  mul          ra, t6, t6
                  flt.s        t5, fa7, fa0
                  sltiu        s2, tp, 1349
                  lui          ra, 718754
                  fsqrt.s      fs10, ft11
                  mulhsu       zero, s11, s4
                  auipc        t0, 858874
                  fclass.s     s5, ft9
                  fmin.s       fs4, ft8, fs5
                  fsqrt.s      fs6, fa7
                  xori         s4, s1, -360
                  feq.s        s9, ft6, ft1
                  xori         a5, s9, 448
                  xori         a4, a4, 345
                  srli         tp, a6, 8
                  mulhu        s1, s8, s0
                  fmin.s       fs5, fs7, fa4
                  slt          s7, s0, s1
                  sra          s10, s0, t5
                  add          s1, t3, s5
                  add          tp, a5, s8
                  mulhsu       s10, a3, s0
                  srli         t1, a3, 12
                  fmul.s       fa4, ft0, fs0
                  mul          a7, t3, a6
                  xori         a3, s11, 1052
                  sltiu        a5, s8, 1915
                  addi         zero, t6, 1461
                  xori         a5, tp, 985
                  nop
                  and          s9, s4, s9
                  div          a7, sp, a5
                  xori         s3, t2, -1579
                  divu         s7, ra, s3
                  remu         a5, a0, s6
                  fmul.s       fs2, ft7, fs11
                  and          a5, s8, s0
                  lui          a3, 267834
                  div          a6, a6, s5
                  fadd.s       fa4, fs5, ft6, rtz
                  feq.s        s3, fa3, ft7
                  ori          sp, t0, 1854
                  lui          t6, 938268
                  sra          sp, a0, s6
                  lui          gp, 618252
                  fcvt.s.wu    fs5, zero, rne
                  lui          sp, 548978
                  sub          s3, sp, s0
                  fmul.s       fs1, fs3, ft0, rmm
                  xori         zero, s2, -954
                  addi         s4, s2, 1009
                  mulhsu       t4, sp, sp
                  lui          s9, 724193
                  nop
                  fmin.s       fa4, ft2, fs11
                  fsgnjn.s     fa7, fa5, ft7
                  fmin.s       fs2, fa0, fa4
                  fsgnjn.s     fs11, fs8, fs0
                  flt.s        tp, fs7, ft8
                  remu         zero, s7, t2
                  sll          s9, a0, s1
                  addi         t3, s0, 1826
                  xori         s2, a4, -288
                  slt          a5, t4, t2
                  mulhsu       s9, s8, t3
                  srai         sp, a2, 18
                  fsgnjx.s     ft11, fa1, fs7
                  slli         s5, t4, 11
                  fcvt.w.s     t1, fa6
                  fmv.x.w      a7, ft0
                  and          t3, zero, t5
                  fcvt.s.w     fs0, t6
                  fmv.x.w      ra, fs3
                  mulhsu       gp, s2, s9
                  srl          s0, t2, s10
                  ori          a7, s8, -995
                  rem          zero, a0, sp
                  fcvt.s.wu    ft10, sp, rup
                  slli         t6, a4, 7
                  slti         a0, a1, -1529
                  srai         zero, s9, 13
                  mul          ra, s4, a5
                  slli         a0, t4, 30
                  fle.s        t5, ft11, fs5
                  andi         t1, tp, 146
                  slli         s5, s11, 28
                  lui          s10, 440283
                  and          ra, t0, s7
                  divu         t3, t0, s5
                  fcvt.w.s     s1, fa3
                  fcvt.s.w     ft7, a6
                  fcvt.wu.s    a5, fs1
                  mulhsu       t5, a6, s2
                  srai         s1, sp, 21
                  sltu         s10, zero, s2
                  slti         s9, s9, -1525
                  fsgnj.s      fs7, ft2, ft4
                  srli         t0, s4, 2
                  fmv.x.w      t4, ft7
                  sll          a6, s9, s3
                  xori         s10, zero, 841
                  fcvt.s.w     fa2, ra, rtz
                  addi         a6, a1, -1946
                  fmax.s       ft5, fa3, ft1
                  fadd.s       fa1, fs7, fs1, rmm
                  nop
                  fmin.s       fs7, fs10, ft10
                  divu         t6, s6, a1
                  fcvt.wu.s    s3, ft3
                  rem          t2, s5, s0
                  fcvt.s.wu    ft8, s8
                  addi         tp, s11, 1517
                  auipc        s11, 192929
                  srli         a7, s4, 28
                  slli         t2, s7, 8
                  andi         s2, a1, -1114
                  addi         s5, s3, 1362
                  mulh         zero, zero, a0
                  fmax.s       fs5, ft0, fa6
                  lui          s9, 256599
                  srai         s7, a4, 0
                  fmin.s       fs1, ft5, fs4
                  fsub.s       ft7, fs9, fs0
                  fmv.x.w      a7, ft11
                  fcvt.s.w     fa0, a4, rup
                  fsgnjx.s     fs1, fs9, fs11
                  remu         s10, ra, ra
                  mulhu        s0, a1, tp
                  fadd.s       ft6, ft0, ft0, rne
                  fsub.s       ft9, fs9, ft3, rtz
                  flt.s        s4, fa4, ft2
                  div          t0, t0, a1
                  addi         a7, s0, 2036
                  or           a7, tp, t3
                  srai         s1, ra, 24
                  slt          a0, a0, s7
                  addi         a5, s11, 1615
                  and          t2, s6, s3
                  fclass.s     a6, fs0
                  fmin.s       fs0, ft6, ft4
                  slt          tp, t6, gp
                  mulh         s10, s4, s6
                  fmv.x.w      s4, fa5
                  srai         s7, t1, 12
                  mulhu        a1, s1, t2
                  div          s11, s5, sp
                  srli         t2, a5, 27
                  srli         a1, t3, 7
                  fsub.s       ft1, ft10, ft5
                  mul          a0, a7, s2
                  divu         a0, a1, a7
                  ori          t2, gp, 1692
                  fmax.s       ft3, fs0, ft8
                  fsgnj.s      fs6, ft9, ft3
                  remu         tp, t3, t3
                  fsgnj.s      ft3, ft4, ft5
                  sltiu        a3, t2, -542
                  srl          s1, gp, s8
                  fcvt.s.wu    ft8, ra
                  fcvt.wu.s    a7, fa6
                  fcvt.s.wu    ft11, a2, rmm
                  fcvt.s.wu    ft10, s4
                  fadd.s       ft7, ft4, fa6, rmm
                  ori          s7, a4, 1189
                  nop
                  slt          t5, a7, t4
                  flt.s        a0, fs5, ft6
                  addi         gp, t0, 1432
                  addi         s0, s9, 218
                  sub          s1, a0, s2
                  ori          s2, t2, -738
                  ori          t5, s7, 599
                  fclass.s     s5, fs10
                  srai         a3, a7, 8
                  srl          a4, a5, s9
                  flt.s        a4, fs8, fs3
                  andi         t6, sp, 1118
                  sll          t2, sp, s2
                  xor          t6, t3, a5
                  fmax.s       fs11, fa6, ft8
                  fsub.s       ft8, fa3, fa7
                  fmax.s       fa3, fs4, ft5
                  slti         s1, sp, -279
                  fmin.s       ft7, ft1, ft5
                  rem          tp, s11, sp
                  slti         t1, s5, -1063
                  fsgnj.s      fs1, fs1, fa6
                  rem          t6, a5, s1
                  sra          s1, s11, t0
                  nop
                  slti         a6, tp, 832
                  flt.s        ra, fs11, fs6
                  fmax.s       fs3, fa6, fs1
                  mulhsu       gp, s6, t5
                  srai         a0, a6, 20
                  div          s0, s9, t0
                  fmv.x.w      s11, fs0
                  nop
                  ori          s5, a2, -1412
                  andi         zero, a5, -1996
                  nop
                  addi         a7, s1, 225
                  add          s2, s9, t6
                  add          s10, s0, zero
                  ori          s3, s6, 777
                  remu         s2, a7, t5
                  mul          a5, t4, tp
                  sub          t5, t6, s1
                  sltiu        s5, s5, -1877
                  ori          s1, t5, -1083
                  fcvt.w.s     s4, ft7, rtz
                  fmul.s       ft10, fs3, fs0
                  sll          t4, a7, s8
                  fmul.s       ft0, ft5, fa1, rdn
                  srl          a0, t0, t1
                  srl          s11, s6, ra
                  fcvt.s.wu    fa1, s2, rmm
                  fle.s        s1, ft11, fa7
                  fdiv.s       fa2, ft3, fs3, rdn
                  mulh         t5, s7, a2
                  ori          ra, a2, 1817
                  div          s3, t0, s0
                  fmin.s       fs11, fa4, fs9
                  fle.s        a5, fs0, fa7
                  sltiu        a0, s2, -1130
                  rem          sp, a1, s3
                  xor          t5, a7, t1
                  or           ra, sp, s7
                  fcvt.s.wu    ft2, s0
                  xori         tp, s3, 1371
                  add          s2, s4, t4
                  div          a7, a7, ra
                  slti         t3, s2, 1563
                  slt          s7, a3, a1
                  fle.s        s3, fs4, ft6
                  feq.s        a4, fs11, fs3
                  fadd.s       fs2, ft6, fs0, rmm
                  sra          a0, t0, a7
                  auipc        t4, 276052
                  xori         a4, s0, -1774
                  sra          t2, t3, a2
                  mulhu        s11, s11, s9
                  fcvt.w.s     t3, fa1, rne
                  srli         zero, t6, 26
                  lui          a0, 53050
                  xori         t2, s7, 1552
                  ori          t6, s4, -1419
                  and          s9, s7, s3
                  fmv.x.w      a7, ft3
                  mul          ra, s5, s10
                  mulhsu       ra, s1, s5
                  auipc        t5, 145874
                  rem          s9, t3, a1
                  fle.s        s11, fs7, ft2
                  mulh         t6, t5, s3
                  fmv.x.w      a7, ft5
                  feq.s        t6, ft10, fs10
                  remu         s5, s0, a6
                  div          t1, a2, a6
                  lui          t1, 593140
                  div          s9, a5, s5
                  slli         a6, a1, 9
                  srli         s5, t6, 17
                  add          gp, sp, s11
                  sll          s5, zero, a1
                  slti         a6, t6, 595
                  mul          a3, tp, s1
                  fmax.s       ft1, ft0, fs9
                  xori         s0, s3, -1499
                  and          s5, ra, ra
                  fdiv.s       fs10, ft11, ft5, rmm
                  mulhsu       s3, s9, s0
                  sll          t5, s8, s1
                  fmul.s       fs6, fa4, ft8
                  slt          tp, s3, s9
                  divu         t6, t3, a3
                  slti         s1, t5, -1065
                  fsgnjx.s     fs8, fs2, ft8
                  sub          zero, s8, s11
                  ori          s7, a6, -1214
                  srai         s7, t4, 27
                  fsgnjx.s     ft0, fa3, fs3
                  fcvt.wu.s    s2, fs8, rne
                  divu         s11, s5, s10
                  fsub.s       fs5, fa6, ft7, rup
                  flt.s        t4, fs4, ft8
                  ori          s3, gp, -1472
                  xori         s7, s10, -202
                  sll          s1, t3, s7
                  fmul.s       ft2, fa2, fa3
                  slt          s7, sp, s4
                  fle.s        zero, ft10, ft0
                  fcvt.wu.s    t5, fa0
                  fmv.x.w      a6, fs3
                  divu         s2, t3, a7
                  fmul.s       ft4, ft10, fs7
                  xori         a4, gp, 1682
                  addi         a7, t1, 420
                  slli         a7, a1, 15
                  sra          a6, a3, s11
                  feq.s        t5, ft1, fa4
                  mul          t3, s11, zero
                  srl          s3, s10, a6
                  sub          a1, t4, a2
                  fmv.w.x      fs10, a2
                  srl          a7, t4, s2
                  fsgnjn.s     fa1, ft0, fa2
                  add          a1, t2, ra
                  srai         a3, t6, 18
                  fclass.s     s10, fs11
                  fadd.s       fs10, fs11, fs10, rup
                  remu         a0, s6, s6
                  rem          s3, t0, s11
                  mulhsu       a7, s5, zero
                  xori         t0, s1, 673
                  fle.s        s10, ft4, ft1
                  lui          a7, 525513
                  fmv.x.w      s10, fs10
                  fadd.s       ft2, fa5, fa1, rtz
                  fsqrt.s      ft2, fa5, rdn
                  fcvt.w.s     s10, fs5, rdn
                  fcvt.s.wu    fs3, t5
                  divu         t4, tp, sp
                  or           s11, s0, t5
                  auipc        sp, 411466
                  mulhsu       s1, s6, s7
                  fcvt.s.wu    fa1, a3, rup
                  fsub.s       ft10, ft3, fs0, rne
                  srai         a3, a4, 29
                  andi         a4, a1, 590
                  fmin.s       fa3, ft9, fs5
                  fsgnjn.s     ft5, fs3, ft10
                  fsqrt.s      fs6, ft9
                  slti         ra, t0, 580
                  fsgnj.s      fa4, ft0, fs8
                  fmv.w.x      fs3, s4
                  slli         s0, t5, 11
                  fmul.s       fs2, fa2, fs5
                  fclass.s     t3, fs9
                  flt.s        s5, ft6, ft3
                  rem          zero, t1, s3
                  lui          gp, 773214
                  remu         a3, s9, s3
                  srli         t5, s8, 1
                  lui          s11, 404565
                  and          t5, t0, s1
                  sltu         sp, s11, s4
                  and          t1, s3, a7
                  sra          t5, t1, a2
                  fsgnj.s      fs3, fs11, fs10
                  fcvt.s.wu    fa3, s2, rmm
                  ori          s2, s3, 685
                  rem          t0, a7, s6
                  and          s4, t0, a5
                  fsgnj.s      fa1, ft8, fs10
                  slti         t6, a3, -1605
                  fsub.s       ft11, fa2, ft8
                  auipc        a3, 780299
                  fle.s        t0, fs6, fs5
                  lui          t0, 912592
                  mulhsu       s10, t0, t5
                  divu         s5, ra, a2
                  auipc        s1, 843315
                  addi         t2, s4, -1164
                  xor          t6, a1, s2
                  sltu         t6, tp, a4
                  sub          sp, s0, gp
                  srl          a0, a2, t1
                  sub          sp, zero, s8
                  mulh         a3, s11, t5
                  addi         s2, a7, 1980
                  nop
                  fsgnjn.s     fs5, ft5, fs9
                  fmax.s       ft4, fa3, fa0
                  remu         t2, s7, s2
                  fsub.s       fa4, fs4, fa2
                  lui          a0, 819914
                  nop
                  fsgnjn.s     fs3, fa5, ft5
                  fsqrt.s      ft4, ft8, rup
                  sll          s5, s10, s7
                  ori          a3, t0, 1184
                  addi         a6, s3, -1145
                  fsgnj.s      ft9, fs3, fs8
                  sltu         s0, t4, s8
                  slti         t0, t1, 35
                  xori         t2, a3, 1583
                  andi         a0, s4, 1959
                  mul          s4, t1, s4
                  add          zero, a4, s8
                  flt.s        s5, fa3, ft5
                  sltu         s10, a7, t4
                  sub          a3, a6, s4
                  mulh         a3, s4, t3
                  lui          a0, 669047
                  add          s4, sp, t3
                  fsgnj.s      ft1, fs6, ft11
                  fcvt.s.w     fs0, s5, rmm
                  auipc        a5, 20559
                  fsub.s       ft1, fs4, fa0, rtz
                  remu         t4, t1, a7
                  addi         t1, t5, -1402
                  and          s9, s9, t1
                  addi         s10, a5, -779
                  fle.s        t0, fa1, fs9
                  fsub.s       ft4, fs1, fa4
                  fcvt.w.s     s9, ft11
                  nop
                  nop
                  slt          zero, tp, a2
                  srai         t3, t6, 6
                  sra          t0, s1, a7
                  fcvt.s.wu    fa0, s9, rdn
                  mulhsu       ra, s10, a0
                  sltu         s1, t5, tp
                  slti         t3, a2, -1862
                  srli         zero, a2, 30
                  fdiv.s       ft2, ft9, ft3
                  fsgnj.s      ft4, ft11, fa1
                  feq.s        a7, fa0, fa5
                  fsqrt.s      ft1, fa2
                  fmul.s       fs8, ft0, fs7
                  lui          a5, 223467
                  mulhu        s9, zero, a5
                  fsub.s       fs3, fs3, fs8, rdn
                  slti         a3, s7, -1871
                  fcvt.s.wu    fs7, a0
                  add          a7, s3, zero
                  mulhu        s2, a3, a0
                  fmax.s       ft8, fa2, ft8
                  remu         a6, s4, s1
                  addi         sp, s5, -166
                  or           s0, a7, s0
                  auipc        a6, 849275
                  mul          t5, s0, gp
                  xori         a0, a0, 1175
                  fmv.w.x      fa3, a7
                  flt.s        s10, fa7, ft6
                  sra          s11, tp, t6
                  sltiu        s4, s9, -929
                  fmin.s       ft7, fs7, ft4
                  lui          s10, 4474
                  fmul.s       fs4, fs3, fa0
                  fcvt.wu.s    a4, fs2, rne
                  mulhu        zero, t0, s3
                  sub          ra, t4, t5
                  remu         t1, sp, t6
                  fle.s        s11, ft7, fs4
                  xori         s11, s10, -1108
                  fsub.s       fa0, ft11, fs11
                  fmin.s       fs3, fs5, ft8
                  fmv.x.w      s0, ft7
                  nop
                  srli         s11, a2, 5
                  nop
                  remu         t1, t2, a2
                  fmv.w.x      fa6, s9
                  fdiv.s       ft2, fs1, fs7, rup
                  fsgnjx.s     fs4, fs7, fs10
                  fcvt.w.s     s3, fs10
                  mulhsu       t6, s9, s4
                  addi         s2, a3, -1899
                  sltu         zero, t1, a4
                  sltu         s9, zero, t6
                  remu         s10, s8, s5
                  sltiu        s0, a3, -698
                  fsub.s       ft8, ft0, fa7
                  feq.s        a5, fa0, fa6
                  and          s2, zero, s7
                  fmul.s       ft10, fs11, fs1
                  fmv.x.w      s2, fs3
                  fle.s        t4, fs4, fs7
                  sltiu        s3, tp, 94
                  ori          t5, t2, 821
                  xor          tp, tp, gp
                  fmul.s       fs3, fs4, fs0, rmm
                  fcvt.s.w     ft0, t5
                  addi         t2, s1, -1070
                  srai         a5, a5, 28
                  srai         s5, s9, 1
                  fmax.s       fs2, ft3, ft2
                  slli         ra, a6, 22
                  fsgnjx.s     fs2, fa5, fa3
                  sll          t1, s4, t0
                  sub          t1, s8, a6
                  xori         t4, gp, -566
                  fmin.s       fs0, fs8, fs7
                  sra          s9, a2, s4
                  fmul.s       fa2, fs10, fs9, rmm
                  sub          s9, s9, t5
                  sltiu        t6, a7, 319
                  sll          s2, s0, ra
                  divu         t1, gp, s5
                  xori         gp, tp, -135
                  lui          t0, 950308
                  fsgnj.s      fa7, fa1, fs10
                  mulh         s9, t6, ra
                  auipc        t1, 867619
                  ori          t4, a7, -399
                  xor          a5, s0, s0
                  fclass.s     s9, ft1
                  fsgnj.s      ft11, ft9, fs6
                  fmax.s       fs7, fa0, fa0
                  lui          a6, 232709
                  fmin.s       fs5, fs10, fs3
                  rem          gp, s10, t2
                  srai         a1, s1, 28
                  flt.s        a6, fs11, fa6
                  fcvt.w.s     s3, ft10
                  slt          a6, a1, t1
                  sltu         s5, a1, a3
                  mulhsu       a3, s10, t1
                  fcvt.s.wu    fa1, gp
                  nop
                  rem          a6, zero, s3
                  xor          tp, t2, t4
                  fsgnjx.s     fs5, fa4, ft2
                  fcvt.s.wu    fa2, a2
                  fmul.s       fs7, fa3, fa0, rdn
                  fdiv.s       fs5, fs5, ft5, rmm
                  fsub.s       fs0, fa5, fs4, rne
                  fmax.s       fa3, ft4, fs10
                  sltu         s9, s7, t1
                  srl          s5, t2, a1
                  mulhu        a7, t6, gp
                  slti         t6, t6, 1547
                  fcvt.wu.s    s5, fs6, rup
                  flt.s        s9, fs5, fs7
                  xori         a1, t1, 773
                  xori         a7, t5, 993
                  fmax.s       ft9, fa2, ft9
                  or           t1, s10, a4
                  fle.s        s9, ft10, fa7
                  nop
                  fmul.s       fs6, ft5, fa0
                  fcvt.wu.s    s3, ft6, rdn
                  fmax.s       ft10, fs10, fs7
                  sll          a3, t6, s2
                  mul          s1, a3, s9
                  srl          t5, zero, s1
                  sltiu        s3, a7, -1951
                  srl          s9, t3, a3
                  xor          t4, a5, gp
                  fcvt.s.w     ft7, a7, rne
                  auipc        a6, 297893
                  add          s0, t1, zero
                  mulhsu       t4, s2, ra
                  mulhu        s7, a3, s8
                  xori         s10, t5, 1646
                  sub          a4, s5, t6
                  fclass.s     a5, fs11
                  fsgnjx.s     fs3, fa4, fa0
                  nop
                  rem          t4, s10, s0
                  fsgnjn.s     fs8, fs6, fs9
                  fle.s        a6, ft6, fa3
                  sll          a3, t0, sp
                  slli         s10, s3, 8
                  slti         ra, s4, 1350
                  fmax.s       fs3, fa7, fa1
                  fsqrt.s      fs10, ft1
                  slt          a6, t0, tp
                  fle.s        s4, ft10, ft3
                  fmv.w.x      ft10, t4
                  fclass.s     s7, ft6
                  and          a5, s1, s5
                  add          s7, s3, s11
                  fmul.s       fs10, fa1, ft1
                  nop
                  fsgnj.s      fs3, ft0, fa7
                  fmin.s       fs8, fs0, ft4
                  slti         sp, zero, 1780
                  or           s7, s6, s0
                  fmv.w.x      fs1, zero
                  mulhsu       t3, s7, s11
                  and          s10, a2, sp
                  sltiu        s0, sp, 605
                  div          s2, t3, a4
                  addi         s9, s6, 471
                  addi         a4, sp, 1931
                  slli         t5, t2, 23
                  fmin.s       fs6, ft6, fs3
                  fsub.s       fa3, fs8, fs6
                  fcvt.s.w     ft8, t1, rne
                  sra          ra, s2, s8
                  xori         a3, a5, -1973
                  xor          t0, s4, t0
                  lui          t0, 543159
                  nop
                  fsgnjn.s     fa6, ft1, fs6
                  rem          ra, s9, t2
                  srl          sp, s2, s11
                  fcvt.w.s     tp, fs5
                  addi         s1, s4, -1267
                  fmin.s       fs6, ft7, fs11
                  fclass.s     a5, ft5
                  sub          a0, s9, s6
                  fadd.s       ft4, fs6, fa3
                  fsub.s       ft3, fs8, ft11, rup
                  fmin.s       fs4, fs7, ft8
                  fle.s        a1, fs4, fs5
                  fcvt.w.s     t3, fs9, rne
                  fsgnjn.s     ft0, fa3, fa0
                  remu         t1, t5, s0
                  xori         s9, s6, -1797
                  feq.s        a4, fs5, ft4
                  srai         tp, s0, 19
                  xor          s10, s10, tp
                  auipc        s3, 12617
                  and          gp, s10, a6
                  fcvt.s.w     ft9, s9, rup
                  and          s0, s4, a0
                  lui          t6, 413298
                  sub          t1, s2, s4
                  or           a1, s10, a1
                  sub          t6, a1, s5
                  fsgnjn.s     fa7, fs1, fs11
                  sub          ra, gp, a2
                  fmv.x.w      a1, fs5
                  divu         s7, a1, a5
                  nop
                  ori          t2, t3, 186
                  divu         a7, ra, t5
                  srli         t6, s1, 28
                  fle.s        ra, ft9, fa2
                  fsqrt.s      ft0, ft7
                  addi         s2, t1, -1566
                  sub          s4, a2, t4
                  fsqrt.s      fs11, fa7
                  and          s0, s4, gp
                  slt          s7, a2, t1
                  fcvt.s.wu    fa7, gp
                  sub          a4, s4, s10
                  fcvt.w.s     t5, ft4
                  fmul.s       fa3, fs1, fa4, rtz
                  xori         tp, t1, -37
                  fclass.s     t0, ft6
                  mulh         t1, s6, a1
                  xor          gp, s6, t3
                  srli         a6, a6, 31
                  fmv.w.x      fs2, gp
                  add          t3, s6, t6
                  sub          ra, s2, tp
                  fmv.x.w      a3, ft7
                  slt          s10, gp, a4
                  slt          a1, t6, t2
                  rem          sp, s6, s5
                  or           t4, t2, s4
                  fsgnjn.s     fs9, fa5, fs6
                  and          a1, s10, s6
                  div          t4, s2, s10
                  fsgnj.s      fs7, fs1, ft4
                  div          s11, s3, zero
                  srai         a7, gp, 19
                  fsgnjx.s     ft9, ft9, ft10
                  fmv.w.x      fs3, a3
                  fsub.s       fa7, fa4, ft9
                  slli         s0, s2, 17
                  fmv.x.w      a3, fs9
                  fmv.w.x      ft10, t1
                  feq.s        gp, ft0, ft10
                  fmv.x.w      t3, ft2
                  or           s10, a6, s11
                  sltu         zero, t4, t3
                  or           t4, s11, s4
                  xor          s11, s3, s4
                  xor          a4, s5, s4
                  lui          s11, 201077
                  nop
                  srl          s1, s6, s8
                  lui          s3, 1044944
                  rem          sp, gp, t1
                  fcvt.s.w     ft0, t5
                  slt          a6, t3, a5
                  rem          a1, tp, s3
                  fsgnj.s      fa3, fs8, fs10
                  fmin.s       ft9, ft11, fa2
                  fsqrt.s      fs0, ft0, rup
                  fmv.x.w      t5, ft2
                  flt.s        sp, ft11, ft9
                  fmul.s       fa4, fs7, fs4
                  lui          a3, 989862
                  fsub.s       fs6, ft1, fs6
                  sltiu        s4, s5, 641
                  or           sp, t5, a3
                  xor          t1, a5, a6
                  fcvt.s.wu    fa2, s0
                  mulh         t4, t4, a1
                  fadd.s       fs8, ft8, ft4, rne
                  fmul.s       ft6, fa7, fs4
                  slli         s1, a7, 23
                  fsgnj.s      ft9, ft8, fa0
                  slli         ra, t1, 3
                  srai         t0, s6, 0
                  fsgnj.s      ft6, ft0, ft1
                  or           t2, s1, s5
                  div          a1, s4, s9
                  fmv.x.w      s11, fs1
                  remu         s4, a2, s5
                  fle.s        s7, ft11, fs0
                  fmin.s       ft4, fs6, fa2
                  sub          t6, a7, t4
                  sra          s5, s6, t5
                  rem          a4, a2, a5
                  andi         a7, t5, 1460
                  slli         t6, zero, 12
                  fmv.x.w      s1, ft4
                  auipc        t3, 1001815
                  srai         t4, gp, 13
                  divu         t2, a5, a6
                  fmul.s       fs8, fs5, fs9
                  divu         s10, a5, s0
                  addi         s2, t6, -661
                  srai         t5, a2, 31
                  fcvt.s.wu    fa5, s11, rmm
                  rem          a7, s4, a6
                  fcvt.w.s     s5, fa4
                  mulhsu       a1, s6, s1
                  and          a7, s6, s9
                  fcvt.wu.s    s0, fa7
                  ori          t4, s11, -1963
                  rem          s10, a6, a4
                  nop
                  andi         t3, a3, -1946
                  sltiu        t4, tp, 1607
                  add          a4, t0, t3
                  sub          s7, t4, a3
                  lui          t6, 397869
                  xori         s5, t5, -1926
                  mulhu        s11, zero, a0
                  fcvt.wu.s    s2, ft6
                  sltiu        s5, s9, 50
                  sub          a7, a3, s1
                  mulhsu       s3, s10, a3
                  xori         t4, sp, -980
                  mulhsu       s7, s6, t0
                  sll          s0, s0, tp
                  slt          a3, a0, t4
                  addi         t0, a6, -641
                  fdiv.s       ft4, fs2, ft7, rdn
                  andi         s11, s7, -1686
                  fcvt.s.w     ft2, t2
                  sll          tp, a4, a3
                  sltiu        t2, s8, -1459
                  slt          a1, s8, gp
                  add          t3, gp, a1
                  lui          t5, 759840
                  sra          s1, tp, t0
                  sra          s5, s1, gp
                  sltu         t1, s3, s9
                  fcvt.s.w     fs7, t4
                  rem          a1, a3, s2
                  srai         s0, s8, 1
                  fclass.s     a0, fa5
                  fsgnjn.s     fs1, ft1, fa7
                  rem          t2, s0, tp
                  slli         t3, s0, 6
                  fsgnj.s      fs3, ft9, ft11
                  nop
                  remu         a7, a0, s7
                  xori         a0, a1, -542
                  mul          a5, a5, a7
                  srl          s10, s10, t6
                  sra          ra, a3, zero
                  sub          t2, tp, s11
                  addi         a4, s5, -894
                  rem          a4, s2, s5
                  nop
                  fsgnj.s      fs4, ft9, fa6
                  fsqrt.s      fs8, fa3, rne
                  andi         ra, s3, -676
                  srli         t2, a7, 21
                  srli         a4, s7, 23
                  mulh         s9, s3, a7
                  div          a0, s9, ra
                  fcvt.w.s     a1, fa3
                  andi         t1, s0, -1195
                  slti         a6, s1, 1815
                  fcvt.s.w     fs3, ra
                  flt.s        a6, fa4, fs9
                  mulhu        s11, sp, a5
                  mulhsu       zero, a4, s4
                  fcvt.s.w     fs10, s2
                  mulhsu       s7, t1, t5
                  or           s11, s5, ra
                  divu         t6, t2, s7
                  slt          a3, a0, a1
                  rem          t4, a5, s2
                  andi         t6, t3, 939
                  or           a0, s8, s9
                  fcvt.s.wu    fa5, t6
                  feq.s        s0, fa0, ft8
                  fclass.s     s0, fa0
                  slli         a0, t6, 1
                  xori         t6, a6, -1444
                  add          zero, ra, a2
                  fadd.s       fa1, ft5, fs2, rdn
                  andi         s2, t4, -665
                  fclass.s     sp, ft9
                  add          t5, a3, a3
                  divu         s3, s11, a5
                  addi         s3, t1, -1489
                  slti         ra, t4, 604
                  fmul.s       fs0, fs10, fa4
                  srai         t3, a3, 9
                  remu         tp, a0, a0
                  or           t4, s1, t5
                  fsub.s       ft11, fs11, fs4, rup
                  mul          a7, t3, a2
                  fsgnjx.s     fs3, ft6, fs9
                  fclass.s     s0, ft3
                  fsgnjn.s     ft4, ft5, fa0
                  srli         s11, t3, 1
                  sra          s5, t2, a2
                  xor          t5, sp, s11
                  fcvt.w.s     t6, fs8, rne
                  div          tp, s5, s10
                  fdiv.s       fs7, fs6, fs10
                  auipc        a1, 478871
                  fsqrt.s      fs11, fa6
                  fmul.s       fa1, ft0, ft5, rtz
                  fsub.s       ft4, ft9, ft7, rmm
                  nop
                  slti         a4, s10, 177
                  fadd.s       fa3, fs6, fa3, rdn
                  srli         s10, t2, 0
                  fdiv.s       fa1, fs7, fs0
                  fmul.s       fa0, ft8, fs7
                  feq.s        s0, ft4, fa3
                  fsgnj.s      ft3, ft8, fa3
                  sll          a1, tp, sp
                  slti         s9, a4, -120
                  fmv.x.w      ra, fa2
                  rem          s0, s10, a3
                  mulh         t0, s0, s4
                  auipc        t1, 70723
                  fmv.x.w      a1, fs8
                  sub          s9, s8, s4
                  fclass.s     gp, ft3
                  fmul.s       fa3, fs6, ft5, rtz
                  fsqrt.s      ft11, fs7, rtz
                  mul          gp, ra, s5
                  div          gp, a7, t6
                  sra          a5, s4, zero
                  fsgnjx.s     ft5, fs10, fs7
                  add          t4, t1, a7
                  divu         zero, s11, s6
                  fsgnjn.s     fa6, fs9, fa5
                  div          s3, sp, t6
                  fcvt.s.w     fa4, t6
                  slti         t3, s0, -319
                  mul          s2, t4, a4
                  lui          s7, 601992
                  and          a4, a7, s11
                  rem          t4, s3, a3
                  fmul.s       fs4, fa3, fa7, rdn
                  fsgnjn.s     fs11, fs6, fs6
                  sltiu        a3, s2, -1532
                  fsgnj.s      fs1, fs0, fs1
                  slt          a4, t2, s0
                  auipc        s9, 552199
                  fmul.s       fs11, fa3, fs3, rtz
                  fmul.s       fs9, fs3, fs7, rtz
                  fsgnj.s      fa4, fs11, fa3
                  fmul.s       fa7, fa5, fs3
                  fmax.s       fa6, fs8, fa3
                  auipc        t5, 1025063
                  mulhsu       s2, s2, s0
                  nop
                  and          s1, s1, t1
                  nop
                  or           a0, t6, s6
                  fmul.s       fa0, ft5, fa3
                  divu         s9, a7, s0
                  auipc        s11, 119516
                  feq.s        t0, ft4, fa4
                  and          s1, zero, s10
                  fmul.s       fa0, fs11, ft4, rup
                  or           a1, a6, t3
                  xor          t4, a6, a5
                  fclass.s     a5, fa0
                  srl          sp, s1, a1
                  fsgnj.s      fa5, fs5, ft4
                  ori          a5, s3, -1552
                  fcvt.w.s     a6, ft5, rmm
                  flt.s        t5, ft0, fs7
                  mul          zero, s3, s0
                  xor          s10, s0, gp
                  fsgnjn.s     fs0, fa3, fa3
                  srai         sp, sp, 1
                  mulhsu       sp, t5, s7
                  fsgnjn.s     fs3, ft7, ft7
                  fclass.s     gp, fs11
                  slti         t0, t0, -1419
                  addi         t6, a6, -1503
                  remu         t1, ra, a1
                  fclass.s     s0, fa4
                  sub          t5, a3, s9
                  fcvt.wu.s    tp, fs1
                  fcvt.s.wu    fa1, a2, rup
                  fsgnj.s      fs5, ft11, fs9
                  fclass.s     a6, fs0
                  divu         a7, s5, s11
                  sra          t4, tp, t0
                  sltu         t6, a6, s0
                  fsub.s       fa3, fa4, fa4
                  srai         s2, sp, 2
                  srli         zero, s11, 30
                  slti         s1, t4, -1016
                  fcvt.wu.s    s3, ft1
                  xor          a6, t2, s10
                  fadd.s       fs5, fs7, fs6
                  sltu         a6, a7, gp
                  or           tp, s4, a7
                  auipc        t6, 269868
                  remu         s10, s0, a3
                  srl          s0, gp, a4
                  fsgnjx.s     fs2, fs10, fs2
                  mulhsu       s4, a1, s0
                  or           t6, gp, gp
                  mul          a5, s8, a4
                  ori          s2, t2, 312
                  ori          t6, ra, 1243
                  fcvt.s.w     ft7, s5, rtz
                  feq.s        a5, fs1, fs4
                  fcvt.s.wu    ft8, s8, rne
                  mulhu        t6, s3, a6
                  sra          a4, t2, a0
                  xor          s11, s1, a1
                  slt          a0, t4, sp
                  slli         tp, a3, 27
                  srli         sp, t2, 17
                  srai         a3, t3, 4
                  sub          zero, a3, t2
                  xor          a3, s10, a7
                  fdiv.s       fa3, ft0, fs9
                  fmul.s       fa6, fs1, ft8
                  divu         zero, zero, gp
                  sltiu        sp, a7, 727
                  slli         a0, a5, 20
                  fmv.x.w      ra, fs11
                  fmul.s       fs9, fa7, fs8, rmm
                  mul          t4, s7, s9
                  addi         sp, sp, 468
                  flt.s        s1, fa4, ft8
                  xor          t2, t1, a0
                  srli         s7, t1, 19
                  or           t0, s10, s10
                  sltiu        tp, t3, -1547
                  slli         s5, sp, 5
                  auipc        a3, 749816
                  mulhsu       a7, s11, a5
                  remu         s2, a1, s9
                  divu         s1, tp, s3
                  fmax.s       ft0, fa2, ft8
                  fmin.s       ft10, ft5, fs2
                  ori          t2, t6, -366
                  div          tp, s11, t2
                  fmax.s       ft0, ft3, fa0
                  fdiv.s       fa0, fs9, ft3
                  slli         s4, t1, 25
                  sltiu        s5, s2, 566
                  fmax.s       fa1, fs2, fa4
                  slli         s2, a5, 6
                  fsgnj.s      ft11, fs6, fs11
                  slt          t5, s10, s6
                  addi         s1, a4, -1799
                  fmax.s       fs1, ft3, ft3
                  fcvt.w.s     t2, fa3, rdn
                  or           gp, s9, t0
                  fdiv.s       ft6, fa3, ft11
                  ori          s3, t5, -1220
                  lui          gp, 16511
                  mulhsu       sp, a5, t1
                  nop
                  div          tp, s6, s8
                  ori          s10, a7, -965
                  fadd.s       fa0, fs11, fs8
                  slti         t6, a7, 1699
                  addi         s7, s2, -1444
                  fle.s        s10, ft8, fa4
                  ori          t2, s5, 1102
                  sll          s10, a2, a1
                  fmv.w.x      fa1, a4
                  xor          tp, a0, t5
                  fle.s        tp, fa6, fs11
                  add          s0, s8, a0
                  sltu         s2, s0, t6
                  srli         a3, s3, 4
                  fcvt.w.s     s7, fs8, rup
                  feq.s        s1, fs7, fs6
                  mulhu        zero, t2, s0
                  feq.s        s11, ft9, fa7
                  fclass.s     a4, fa2
                  fmv.w.x      fs10, t0
                  fmax.s       fs10, ft0, fs9
                  xori         a4, s4, -1618
                  slti         t5, t6, -586
                  div          s5, s6, s1
                  fcvt.s.wu    fs11, s7
                  sltiu        zero, s7, -1778
                  fmax.s       fs5, fs2, fa5
                  fsgnj.s      fs11, ft10, fa1
                  slli         s9, a0, 7
                  mul          a0, t5, a3
                  mul          a0, a1, t0
                  fmul.s       fa7, ft9, ft3, rmm
                  remu         s5, zero, ra
                  add          t2, s6, tp
                  slti         a0, s0, -1513
                  sltiu        s10, zero, 1972
                  fsgnj.s      ft2, ft6, fs4
                  srli         ra, a2, 24
                  auipc        zero, 142565
                  fadd.s       fa0, fs8, fa2
                  sltiu        t5, a6, 1828
                  mulhsu       t4, s10, s8
                  sub          s9, ra, a6
                  srl          tp, gp, zero
                  sub          s11, a5, s3
                  and          t2, a4, ra
                  sltiu        s5, s0, -1990
                  fmv.w.x      fs2, s11
                  divu         s3, s2, a4
                  fsgnjx.s     fs8, fs0, ft2
                  fmv.x.w      s7, ft5
                  sub          a7, s2, tp
                  mulhu        ra, gp, s2
                  fmv.w.x      ft8, a2
                  div          a1, t6, gp
                  fsgnjx.s     fa5, ft6, fs8
                  mul          ra, s9, ra
                  ori          s7, t4, 1893
                  fmv.x.w      a5, fa1
                  addi         s1, a7, -1115
                  sltiu        s11, a2, -1192
                  fmin.s       fa4, fa1, ft10
                  ori          t1, t6, -108
                  mulhu        a5, s1, t6
                  fadd.s       ft8, fs5, fs6, rne
                  fmul.s       fa5, ft1, ft0, rne
                  andi         s10, s10, 1477
                  slli         a5, t4, 9
                  add          t0, a1, s11
                  fmul.s       ft11, fa2, fs6
                  fmin.s       ft4, fa7, fs8
                  sra          zero, s2, a5
                  fsub.s       fs1, ft9, ft0, rup
                  xori         s9, t0, -968
                  addi         ra, a2, -1511
                  andi         ra, s11, 522
                  fcvt.s.wu    fs3, s6, rup
                  nop
                  sltiu        t4, s10, 1934
                  fle.s        a5, ft3, fs10
                  xor          s11, t0, a0
                  mulh         sp, t5, t3
                  fmin.s       fs9, fs3, ft4
                  fcvt.s.wu    fs5, a5
                  fadd.s       fs7, fs4, fs9, rmm
                  fsgnjn.s     ft2, fs8, fa6
                  mulhu        tp, s3, s4
                  flt.s        a5, ft9, fs9
                  divu         s2, s11, s4
                  mulhsu       s0, s3, a4
                  sub          t1, t6, gp
                  feq.s        t5, ft11, fs2
                  fmul.s       ft4, fa0, ft9, rdn
                  or           t0, a4, s10
                  fcvt.w.s     s7, ft9
                  srl          s1, t0, s1
                  mulhsu       a1, a5, a4
                  fmul.s       ft7, fa0, fa1, rne
                  fmv.x.w      s10, fs2
                  fadd.s       ft9, ft10, fa3
                  fcvt.s.wu    fa6, zero, rmm
                  addi         s11, s11, -206
                  remu         a3, s9, a0
                  ori          gp, a1, 184
                  mul          t3, s6, sp
                  fmin.s       ft6, fa7, fs9
                  fmv.x.w      a4, fs4
                  rem          s9, a7, s10
                  divu         a5, s2, a7
                  fcvt.s.w     fs0, s7
                  mulhsu       sp, ra, s2
                  fmin.s       fs6, ft10, ft11
                  fadd.s       fa6, ft0, fa1
                  fcvt.s.wu    ft3, zero, rne
                  sltiu        sp, s9, -203
                  addi         t4, s6, 266
                  xori         s3, a7, -142
                  fmul.s       fa1, ft8, fs9, rtz
                  ori          t5, tp, 148
                  fsqrt.s      ft10, fa1
                  fmin.s       ft8, fs0, ft5
                  fcvt.s.wu    fa1, t0
                  addi         t1, t6, -795
                  mulhsu       a1, s6, t2
                  rem          a1, s0, t2
                  fsub.s       fs5, fs11, fs3, rne
                  and          s0, s10, s8
                  fmul.s       ft8, ft6, ft7
                  divu         t3, t2, s5
                  fmv.x.w      t5, ft5
                  sra          s0, t2, gp
                  mulhu        t6, t3, s8
                  andi         a0, a0, -1480
                  feq.s        s0, ft8, fa7
                  slli         a5, s10, 4
                  fsub.s       fs2, fs3, fa3
                  mulhsu       s2, s8, t3
                  sltu         zero, tp, s2
                  xor          s2, a0, ra
                  fle.s        a1, fa2, fs11
                  fdiv.s       fs1, fs4, ft9, rmm
                  lui          a6, 651361
                  mulhu        t6, s10, t5
                  sltu         s4, t4, ra
                  fdiv.s       fa3, ft5, fs8
                  sub          a3, s1, s6
                  fcvt.w.s     t2, fs11
                  srl          a1, s5, t3
                  fmul.s       fs5, fs8, fs3, rne
                  slt          t5, a2, t0
                  fadd.s       fs0, fa0, ft8
                  fsgnjn.s     ft2, ft9, ft5
                  div          a0, t4, t3
                  fsqrt.s      ft8, fs9, rne
                  flt.s        a1, fs7, ft6
                  fmv.w.x      ft1, t5
                  fsgnjx.s     ft7, fa5, fa4
                  rem          t5, t6, t2
                  fsgnj.s      fs3, fa7, fs3
                  flt.s        s3, fa4, fs9
                  xori         s4, s9, 1296
                  fmin.s       fa1, ft7, fa3
                  srl          zero, t3, a6
                  mulhu        a3, a2, s4
                  fsqrt.s      fa3, fs2
                  xor          t0, s10, a5
                  fmax.s       fa4, ft5, fa2
                  fmv.w.x      fs3, s6
                  fcvt.s.w     ft8, tp
                  fadd.s       ft0, fa4, fs10, rne
                  fle.s        a7, ft1, fa7
                  mul          s2, a2, s7
                  mulhsu       s10, a2, a2
                  fsqrt.s      ft11, ft3
                  auipc        s4, 474253
                  rem          t1, s4, s7
                  fadd.s       fs0, fs1, ft8, rdn
                  sltu         s0, s3, s2
                  sub          t4, s9, s10
                  fsgnjn.s     ft2, fs9, fa7
                  mulhu        t5, zero, t0
                  fsgnj.s      fa4, ft3, ft8
                  srai         t6, s7, 28
                  fle.s        t3, ft0, ft2
                  mulhsu       s9, sp, t3
                  and          tp, s6, s6
                  add          t1, s5, tp
                  fcvt.w.s     s9, ft0
                  sltu         s7, s7, s4
                  fmin.s       ft6, ft6, ft6
                  mulhu        a0, t0, s5
                  addi         t4, t4, -671
                  fle.s        a6, fa5, fa1
                  sltiu        s3, s8, -855
                  fsgnj.s      fa0, fs7, ft2
                  fdiv.s       fs3, fs6, fs7, rdn
                  sra          gp, s7, s2
                  slli         t2, s0, 15
                  nop
                  divu         a3, t6, zero
                  feq.s        s4, ft8, ft5
                  fclass.s     t1, fs0
                  fsub.s       fa7, fs5, fs11, rdn
                  srai         tp, t5, 15
                  fcvt.s.wu    ft7, a6, rdn
                  sltu         zero, s10, a2
                  nop
                  srl          a1, s0, t1
                  feq.s        a0, fa2, ft2
                  slti         s3, t6, -521
                  fle.s        a3, fa1, ft6
                  fcvt.w.s     zero, ft10
                  srai         s1, sp, 25
                  xori         t3, s9, 806
                  mulhsu       t3, zero, zero
                  mulhu        t5, t3, s2
                  div          s10, a0, s0
                  sll          zero, a1, zero
                  div          a6, s11, s11
                  sra          a4, a6, a7
                  xori         s2, s0, -1969
                  lui          s7, 457060
                  fdiv.s       fs8, fs6, fa5
                  sll          s10, a7, t4
                  remu         s7, gp, s4
                  fcvt.s.w     fs10, s10, rup
                  fmul.s       ft9, fs3, ft11, rne
                  mulhu        a6, a5, t0
                  slti         tp, t3, -949
                  rem          a6, t3, s9
                  slt          a6, t2, gp
                  fsgnj.s      ft3, ft10, fs0
                  fclass.s     s10, fs3
                  remu         s2, s5, t2
                  or           a0, t6, s7
                  slli         s5, s4, 24
                  sll          t0, gp, s6
                  mulhu        a6, t1, s1
                  mulhu        s1, t2, a5
                  and          ra, t2, s10
                  srai         t1, t3, 21
                  sltiu        gp, t5, -127
                  fmv.x.w      s11, fs9
                  srai         tp, ra, 14
                  srl          ra, s4, t6
                  fsqrt.s      ft1, fa2, rdn
                  fcvt.wu.s    t3, fa2, rne
                  mulhsu       sp, t0, a6
                  remu         a0, s10, s4
                  andi         ra, t6, -1025
                  and          gp, s1, sp
                  auipc        tp, 111105
                  fsgnjx.s     fa6, fs8, fa5
                  mul          s2, a7, zero
                  fcvt.w.s     t1, ft2, rtz
                  or           t5, s9, zero
                  fdiv.s       fs7, fs3, fs3, rdn
                  addi         tp, a7, -1325
                  xori         s9, s6, 577
                  fcvt.wu.s    a5, fs4
                  mulh         a1, t0, sp
                  fadd.s       ft3, ft0, fs2, rne
                  flt.s        a3, fs2, ft5
                  feq.s        s5, ft10, fs3
                  fsqrt.s      fs8, fa4
                  fsqrt.s      fs9, fs4
                  divu         t3, t0, a2
                  divu         s3, s1, t4
                  feq.s        zero, ft8, fs6
                  slli         s0, s3, 16
                  and          s7, s5, a5
                  fmin.s       ft10, ft2, fs4
                  sub          s0, s3, ra
                  fmax.s       ft9, ft2, fa2
                  slti         s3, s9, 1177
                  remu         sp, a4, s7
                  srl          a1, ra, t2
                  fmv.x.w      s11, ft8
                  sltiu        a5, s4, -2030
                  fcvt.s.wu    fs6, s9, rdn
                  fcvt.w.s     zero, fa0, rdn
                  sltiu        a1, t1, 611
                  srl          zero, t2, s1
                  and          t3, s1, s2
                  fadd.s       ft8, fs7, fs3
                  fsub.s       ft9, fa3, fa4, rmm
                  sub          a7, s2, a4
                  feq.s        t3, fa2, ft0
                  slli         s2, t6, 2
                  fclass.s     a4, fa2
                  mulhsu       t0, s5, a6
                  and          t5, a5, tp
                  fdiv.s       fa0, fs8, fs1
                  sltiu        t2, a7, -1225
                  fdiv.s       fa4, ft11, fs8
                  mulhu        zero, a1, t3
                  fcvt.w.s     t1, fs0
                  fsgnjn.s     ft10, fa3, fs5
                  div          tp, a1, s1
                  fsgnjx.s     fs8, fa7, fs1
                  feq.s        a7, ft4, ft9
                  ori          a3, a4, 1018
                  srli         a4, a6, 4
                  addi         a1, s7, 1207
                  slt          tp, a6, sp
                  fdiv.s       ft4, fs7, fs0, rmm
                  div          t4, t4, t2
                  rem          s5, s4, s7
                  and          tp, a4, t0
                  and          s3, sp, gp
                  fcvt.s.w     fa3, sp
                  mulhu        gp, ra, s1
                  lui          s1, 733442
                  fcvt.s.w     ft9, a7, rmm
                  fmul.s       ft7, fs5, ft0, rtz
                  fadd.s       ft0, fs9, fa5
                  fsqrt.s      fa5, fs0, rmm
                  mulhu        t3, s0, t5
                  mul          t1, sp, s6
                  add          s7, a5, s7
                  fsub.s       ft5, ft4, fs9
                  fcvt.w.s     t4, fs3
                  mulhu        t1, t5, a0
                  add          s3, t0, t2
                  fsgnj.s      fs2, ft10, fs9
                  remu         t2, s11, a3
                  slli         s4, a0, 25
                  xor          s2, a2, a2
                  and          t2, t6, sp
                  add          a0, tp, a0
                  rem          tp, s10, t3
                  srai         a4, s5, 3
                  div          a4, a7, a5
                  fdiv.s       fa3, ft1, fs2
                  mulh         sp, gp, a4
                  divu         s2, s4, s1
                  ori          s5, s5, 2025
                  fsub.s       fa1, fs6, fa7
                  rem          gp, t0, t2
                  fcvt.s.w     fa4, s5
                  fmul.s       ft7, fs11, ft5
                  or           tp, s0, s0
                  sltiu        s1, t3, 1448
                  auipc        s10, 860864
                  nop
                  mulhsu       s11, s10, s2
                  fcvt.s.wu    ft9, a1, rne
                  srl          s4, s1, t3
                  fcvt.wu.s    t5, fs5
                  nop
                  xor          gp, s6, t4
                  fsgnj.s      fs0, fs9, ft5
                  slli         t6, s4, 20
                  srli         a7, t4, 4
                  fmv.x.w      t6, ft4
                  slti         t1, t2, 1119
                  xori         a4, a5, -1202
                  rem          a7, s5, a7
                  srl          t3, zero, t5
                  srli         ra, s1, 8
                  mulhu        s7, tp, zero
                  remu         s2, t6, t0
                  fcvt.s.w     ft0, s0
                  mulh         t4, s0, s1
                  remu         s0, a7, t4
                  divu         s1, s4, zero
                  or           a3, t0, s11
                  sll          tp, a4, t3
                  fmv.x.w      s1, ft11
                  fclass.s     t4, fs0
                  andi         s3, s3, 1257
                  div          s2, s10, a5
                  sltu         t5, s9, s9
                  mul          s2, a1, a1
                  remu         t3, sp, s6
                  feq.s        a6, fs9, ft7
                  fclass.s     s11, ft8
                  fsgnj.s      fa1, fs9, fa7
                  sltu         a5, s2, s1
                  flt.s        s7, ft3, ft9
                  fsgnjx.s     fs9, fs0, ft1
                  mul          t0, a7, s10
                  divu         a4, t2, t1
                  fsqrt.s      fs9, fa2
                  sltu         s5, sp, s3
                  nop
                  mul          t2, s11, s0
                  mulh         a7, ra, a7
                  sll          s10, s11, a6
                  sub          t6, s0, s4
                  fmin.s       ft2, fa6, ft7
                  slt          a1, sp, s4
                  fcvt.w.s     zero, ft9, rne
                  fmv.w.x      fs3, s1
                  fcvt.s.w     fa3, s0, rne
                  rem          t4, s2, s11
                  fmin.s       fs0, ft4, ft7
                  fmv.x.w      a0, ft2
                  add          a3, s6, ra
                  slti         t2, a2, -454
                  fcvt.wu.s    t0, fs5
                  fdiv.s       ft3, fs1, ft11, rmm
                  slli         a3, a5, 21
                  fcvt.wu.s    t5, ft9
                  sll          s11, t1, a1
                  fle.s        t3, fa2, ft5
                  sub          s2, s0, s2
                  and          s10, a7, t4
                  srl          s11, s0, gp
                  add          t5, s9, a5
                  remu         ra, t1, s0
                  xori         s0, s2, -590
                  fsub.s       ft2, fs0, ft10, rdn
                  slti         s0, zero, -504
                  feq.s        s10, ft6, fs10
                  add          s4, s2, zero
                  or           s5, zero, a0
                  remu         s11, sp, s3
                  sra          s11, s1, a0
                  addi         zero, t4, 431
                  fmul.s       fs10, fs5, fs5, rtz
                  fsgnjn.s     ft8, fa4, fa0
                  feq.s        t2, fa5, fs0
                  fadd.s       fa3, fs4, fs0, rdn
                  fsub.s       ft4, fs0, ft4, rne
                  fcvt.s.w     fs4, s6
                  andi         a4, s8, 1167
                  sub          a7, s6, s9
                  fsgnjx.s     fa7, fs8, fs6
                  addi         s2, a2, -344
                  sltiu        a4, s5, 662
                  fadd.s       ft10, fs2, fa3
                  srli         s1, s5, 22
                  xori         s3, t1, 1298
                  fcvt.wu.s    s4, fs5
                  andi         a4, s6, 278
                  sll          s10, s7, s4
                  fadd.s       fs2, ft4, ft1
                  slli         zero, t1, 1
                  xori         s9, a7, 315
                  feq.s        a5, fs1, fa3
                  xor          s11, s9, s3
                  fle.s        tp, ft7, ft6
                  fsgnjn.s     fa6, ft6, fs1
                  andi         s9, a0, 1133
                  addi         a6, s2, -1712
                  fclass.s     t2, fs1
                  fsgnjn.s     ft3, fa0, ft3
                  mul          zero, a5, t6
                  fmv.x.w      gp, fa3
                  fcvt.wu.s    a4, fs0, rtz
                  andi         s2, ra, -1604
                  sltu         t5, a6, s0
                  andi         a4, a5, -684
                  fclass.s     a7, ft10
                  fmv.x.w      a6, fs11
                  mulhsu       s7, a4, s3
                  fsgnj.s      ft5, fs11, fa7
                  fmax.s       fs4, ft1, fa5
                  nop
                  fsgnj.s      fs7, ft5, ft3
                  sra          t5, sp, s5
                  sltu         t4, sp, s7
                  fsgnjx.s     fs11, fs10, ft1
                  fsub.s       fa3, fs7, ft9, rmm
                  mulhsu       a1, a2, s11
                  fsqrt.s      ft11, ft9
                  xori         s4, t3, -1133
                  divu         ra, s3, s6
                  slti         a3, ra, -1795
                  srai         a7, s5, 26
                  mulh         s5, s8, t6
                  remu         s3, s10, t4
                  mulh         s7, ra, ra
                  sltiu        tp, t5, 813
                  fsqrt.s      ft3, ft3, rtz
                  fcvt.w.s     zero, ft2, rtz
                  xor          t0, t5, a1
                  fcvt.s.w     ft3, t2, rup
                  fclass.s     s4, ft4
                  fsgnjx.s     fs4, fs11, ft0
                  fsqrt.s      ft4, fs4
                  or           a1, gp, s7
                  slt          t2, a7, tp
                  slli         a4, s3, 15
                  slli         s7, s3, 14
                  slti         t2, tp, -1872
                  fcvt.s.w     fa3, a0, rtz
                  sra          s9, t4, t6
                  fsub.s       fs11, fs0, ft1
                  fclass.s     t3, ft0
                  sll          a7, zero, t6
                  lui          tp, 234947
                  slli         s1, s5, 16
                  div          a6, a0, t1
                  srli         s4, s2, 22
                  fdiv.s       ft5, ft1, fs2, rmm
                  fsub.s       fa3, fs7, fs3, rtz
                  fdiv.s       fs8, fa3, fa2, rup
                  sra          t2, s0, s2
                  fcvt.s.wu    fs2, zero
                  mulhu        a6, sp, ra
                  addi         t3, ra, -897
                  div          s11, s5, zero
                  sub          a0, a6, a0
                  xor          a3, s7, s3
                  fmin.s       ft11, fs0, fs9
                  mulhu        a3, t0, s0
                  addi         a1, a6, -387
                  fcvt.w.s     s7, ft11, rmm
                  fdiv.s       fs4, ft2, fs2
                  flt.s        a4, fa5, fs0
                  xor          a6, a3, a6
                  rem          s9, a7, ra
                  sll          t0, t4, a7
                  flt.s        a3, ft8, fs7
                  and          s1, s9, tp
                  ori          tp, a0, -833
                  add          s5, sp, s6
                  feq.s        t0, fs7, fs0
                  remu         t0, t6, a6
                  fcvt.w.s     s11, fs8
                  fclass.s     s2, ft7
                  xor          a6, a7, gp
                  fcvt.w.s     sp, ft2, rmm
                  addi         a0, s5, -648
                  fsub.s       fs3, ft4, fs8
                  andi         a5, s11, -1476
                  ori          s1, gp, -402
                  sll          s2, s0, ra
                  slli         s5, gp, 1
                  flt.s        s9, ft9, ft5
                  fle.s        t2, fa7, fa4
                  fmul.s       fs7, ft4, fa5
                  srli         ra, s8, 0
                  fmax.s       fs5, fs1, fs1
                  fmin.s       fs9, ft10, ft0
                  fcvt.w.s     t4, fa0
                  mulh         t5, t5, a7
                  fsub.s       fa3, ft0, ft10
                  addi         a1, s0, 675
                  rem          tp, s9, t0
                  fmin.s       fa6, fs10, ft11
                  sltu         a6, s11, t1
                  mulhu        a4, s11, s3
                  fsgnjn.s     fs3, ft9, fa2
                  fcvt.s.w     ft4, s10, rmm
                  fcvt.wu.s    s10, fa3
                  fcvt.s.w     fa3, ra, rdn
                  fsgnjx.s     fa0, ft6, fs6
                  mulh         ra, a7, gp
                  fcvt.s.wu    ft6, t5
                  ori          t2, a7, 1795
                  fcvt.wu.s    t5, ft9
                  div          a0, s1, t1
                  fclass.s     s10, ft10
                  slti         s4, t6, -606
                  fmax.s       fa2, ft11, fa3
                  fsgnjx.s     fs4, fa1, fs7
                  remu         s11, zero, t2
                  sra          s0, a5, a2
                  feq.s        t6, fa0, fa5
                  xori         a5, s2, -1441
                  lui          a7, 397705
                  fcvt.s.wu    fa0, zero, rup
                  srl          s4, s5, s10
                  fmv.x.w      a4, ft0
                  fsub.s       fs3, fs8, fa1
                  mulh         a6, s2, t2
                  fmul.s       fa4, fs7, ft5
                  fsqrt.s      fs10, ft6
                  and          s5, a1, zero
                  mulhsu       s9, t5, t3
                  slt          a6, t1, s7
                  fsqrt.s      ft8, fs2, rmm
                  fmin.s       fs1, ft11, ft4
                  fmv.w.x      ft6, a5
                  srl          s9, ra, a2
                  mul          a4, zero, a6
                  xor          a5, s11, gp
                  slt          t1, a1, s11
                  or           s9, t3, s1
                  slti         a6, t0, -179
                  sll          gp, t2, t3
                  auipc        s11, 732861
                  xori         s10, s0, 1912
                  remu         a5, s2, s3
                  fcvt.wu.s    s1, fs5, rne
                  fsgnjx.s     ft0, fs6, fs7
                  xori         zero, a5, 926
                  xori         a5, tp, -933
                  remu         a6, a0, s4
                  fsgnj.s      ft1, ft8, ft5
                  flt.s        a6, fa1, ft9
                  slt          a0, s9, s7
                  srai         zero, s9, 3
                  remu         sp, s8, t4
                  fsgnjn.s     fs0, ft3, fa4
                  or           s4, a6, tp
                  xori         s1, s7, 416
                  nop
                  ori          gp, a3, -1362
                  sltu         t2, ra, s9
                  srai         t2, t0, 22
                  srai         s5, t1, 24
                  rem          a5, s3, a6
                  fmv.x.w      gp, fa5
                  srli         a0, s3, 16
                  fmv.x.w      s5, ft6
                  srli         tp, gp, 30
                  ori          s1, a6, -1070
                  srli         sp, s7, 28
                  mul          a0, a1, sp
                  ori          t1, s10, 919
                  fle.s        t0, ft0, fa5
                  srli         a0, t0, 15
                  sub          s11, a1, t4
                  xori         s0, s0, 478
                  remu         a0, s7, s7
                  fsgnj.s      fa1, ft0, fs8
                  slli         s2, a6, 31
                  fcvt.w.s     ra, fs8, rdn
                  fdiv.s       ft6, fs11, fa1
                  mulhsu       ra, s3, a4
                  sltiu        t1, a6, 402
                  mulhu        s2, s2, tp
                  nop
                  xori         s5, t2, -184
                  remu         s3, sp, zero
                  fsgnjx.s     fs7, ft7, ft9
                  fsgnjn.s     fs1, ft11, fa3
                  fcvt.w.s     a5, ft1, rup
                  sll          s0, a3, s2
                  feq.s        t0, fa6, ft11
                  fle.s        a0, fs6, fa3
                  divu         t4, t6, tp
                  sltiu        t2, s2, -1549
                  lui          gp, 1030480
                  fmax.s       fa2, ft7, fs7
                  flt.s        zero, fs1, ft8
                  andi         t1, a0, 1202
                  fsqrt.s      ft11, fs0, rtz
                  fcvt.wu.s    ra, fs0
                  fmv.w.x      fa0, tp
                  srl          t0, a6, a2
                  sltiu        s11, a0, -1442
                  xor          a0, s0, t2
                  auipc        s0, 477851
                  fcvt.wu.s    a4, fa3
                  sra          a1, t0, a5
                  xori         s0, a2, -655
                  fadd.s       fa0, ft0, fs3
                  mulhsu       s9, t0, s8
                  srl          tp, t6, s10
                  mulhu        s1, a0, s0
                  mulhu        s3, s4, a5
                  fsgnj.s      ft8, fa5, fs10
                  fmin.s       fs5, fa6, fa5
                  fsgnj.s      fa0, ft6, fs5
                  fmin.s       fs8, fa3, fa1
                  ori          zero, s2, -321
                  ori          t5, a5, -1964
                  rem          a4, t4, ra
                  fsgnjn.s     fa1, fa7, fa7
                  mul          gp, t6, t3
                  fsqrt.s      ft11, fa4, rmm
                  fcvt.w.s     sp, fs9
                  fmul.s       fs5, fa1, ft7
                  fsqrt.s      fs1, ft9
                  fadd.s       ft5, ft0, ft7, rne
                  fle.s        t1, ft6, fa0
                  fdiv.s       fs10, fs9, fs0, rdn
                  andi         t3, a7, 1262
                  xori         s7, a6, 1725
                  mul          t5, ra, t3
                  fmin.s       fa6, fs7, fa5
                  ori          s10, t2, 463
                  xor          a1, t0, t0
                  flt.s        ra, fs3, fs2
                  fadd.s       fs7, ft2, ft0, rdn
                  nop
                  mulhu        a5, t6, s5
                  div          a4, s0, t1
                  fcvt.w.s     a5, ft3
                  xor          s9, gp, a3
                  andi         s7, gp, -972
                  auipc        s3, 509565
                  slli         ra, t6, 23
                  mulhu        t4, t1, s6
                  fsgnjn.s     ft5, fa7, ft6
                  fsub.s       fa4, ft1, fs9, rtz
                  fcvt.s.w     fs2, s4
                  feq.s        s9, ft9, fa6
                  fmv.x.w      s10, ft8
                  fmin.s       fa4, fa0, fs7
                  fsgnjx.s     fs1, ft4, fs5
                  fle.s        a3, fa0, ft5
                  remu         gp, t3, t5
                  mulhu        s9, s6, s0
                  fcvt.wu.s    sp, ft6
                  addi         a1, t4, -801
                  fmv.w.x      fa2, t4
                  srai         s4, s5, 26
                  remu         t4, ra, gp
                  fdiv.s       ft5, fs4, fs8, rup
                  flt.s        a5, fs7, ft3
                  fmin.s       ft2, ft10, fs11
                  slt          s5, s3, tp
                  or           ra, zero, sp
                  fdiv.s       ft5, fs1, fs5
                  fsub.s       fa0, ft4, ft3, rne
                  fsub.s       fa1, fs6, fa3, rne
                  div          a1, t6, t3
                  fdiv.s       fs4, fs1, fa7
                  fsgnjx.s     ft7, fs10, fs3
                  slli         a7, a1, 9
                  auipc        a0, 354855
                  mulhsu       sp, a0, s4
                  fcvt.s.wu    fa5, s9, rtz
                  addi         gp, a4, 1350
                  fmin.s       ft7, ft11, ft1
                  flt.s        s5, fs10, fs8
                  sra          s2, a6, s0
                  div          ra, s2, s2
                  fadd.s       fs1, fs3, fa0
                  fsgnjx.s     fa0, fa1, fs5
                  fcvt.w.s     t2, ft8
                  srli         s2, s7, 3
                  andi         a5, a3, -798
                  fadd.s       fs5, ft11, fa5
                  fsub.s       ft1, fs5, ft6, rup
                  srli         s0, zero, 15
                  fmax.s       ft8, fs2, fs9
                  andi         a6, ra, -96
                  nop
                  xori         a0, a4, -1151
                  feq.s        a0, fs10, ft9
                  fsgnjx.s     fs11, fs11, fs7
                  fmv.w.x      ft5, s7
                  fclass.s     a4, fs2
                  mulhu        t2, tp, s0
                  xor          t6, ra, t2
                  mulhu        s3, s3, a0
                  sra          a7, s10, s0
                  xor          s3, tp, t3
                  fsgnjn.s     fa1, fa2, ft6
                  feq.s        s2, ft10, fs4
                  mulh         a0, t6, s11
                  rem          s10, a5, a0
                  sltu         a7, s7, a6
                  srai         a6, zero, 24
                  add          s10, s11, a0
                  sll          t6, s9, s9
                  feq.s        s4, ft1, fs11
                  sll          t1, gp, a0
                  sra          gp, t6, a2
                  remu         ra, s6, t5
                  fmv.x.w      a3, fs5
                  fmv.w.x      ft4, a5
                  srai         s11, tp, 27
                  div          t5, zero, s7
                  nop
                  fsub.s       ft6, fs9, ft3, rne
                  sub          a6, s2, t5
                  mulhsu       s10, s2, s0
                  fsub.s       ft10, ft6, ft5
                  addi         s11, s10, -653
                  lui          a4, 238184
                  auipc        s11, 312335
                  andi         s5, a0, -1652
                  sll          s2, s3, tp
                  mulhsu       t2, s2, gp
                  fdiv.s       fs0, fs0, ft1
                  sra          s3, a0, ra
                  fcvt.w.s     a5, fa7, rtz
                  ori          t4, gp, -1997
                  srl          s1, t0, a1
                  fcvt.wu.s    a0, ft2
                  fsgnjn.s     ft1, fs0, fa3
                  slt          s10, a6, s10
                  fsqrt.s      fa3, fa5, rne
                  mulh         t0, t2, t1
                  mul          s1, a5, a7
                  addi         s9, s9, -895
                  sltu         t0, s7, s6
                  mulhu        s3, s6, s5
                  mulh         t4, ra, t3
                  remu         a3, tp, s8
                  divu         a4, a7, t5
                  mul          a7, s2, a6
                  fsgnjx.s     fs4, fa2, fa0
                  slt          a4, s0, a4
                  sltu         a1, a5, s5
                  fmax.s       fa3, fa3, fs1
                  fsgnjx.s     fs2, fs10, ft2
                  fcvt.w.s     ra, ft4, rne
                  slt          s7, s10, t2
                  mulhsu       s1, t1, t1
                  fmin.s       fa4, fs9, ft11
                  sub          s10, s8, tp
                  fcvt.s.wu    fa7, a4, rne
                  fcvt.w.s     a7, fs4
                  fmv.w.x      fa1, s7
                  mul          s9, t4, t3
                  fmv.x.w      s7, ft2
                  sltu         gp, t0, s8
                  fmul.s       fs0, fa6, fs8, rdn
                  add          tp, a5, t1
                  fmin.s       fs9, fs4, fs2
                  srai         s7, a2, 7
                  andi         t5, s2, -435
                  slli         s10, a0, 29
                  flt.s        s11, fs0, ft7
                  fadd.s       fs8, fs3, ft5, rmm
                  mul          a1, a0, t1
                  sub          sp, s9, s6
                  slti         s10, s7, -1529
                  fmv.x.w      gp, fa2
                  srl          s1, a4, t1
                  add          a0, s9, s3
                  div          a4, s8, t1
                  fmax.s       fa2, ft6, ft6
                  fmv.x.w      ra, fs7
                  fmul.s       ft0, fs2, fs0, rup
                  srai         s5, a6, 12
                  fdiv.s       ft3, fa7, fa1, rtz
                  fclass.s     s2, fs11
                  srai         t4, a2, 20
                  fadd.s       ft6, fs11, fs9, rne
                  fadd.s       fs3, fs10, ft9, rup
                  mul          t2, s9, tp
                  fsub.s       fs1, ft6, fa0
                  flt.s        a1, ft3, fs11
                  fsgnj.s      fs8, fs6, fa3
                  fcvt.s.wu    ft1, t2
                  or           t5, s10, s7
                  mul          a7, tp, s0
                  and          gp, s8, ra
                  sltiu        t3, a7, -1119
                  srli         s10, a2, 10
                  fdiv.s       fs2, ft1, fs7
                  fmul.s       fs0, ft7, fa7
                  slti         s10, t1, -1956
                  fcvt.s.w     ft6, s5
                  sltiu        sp, ra, -1313
                  fmul.s       ft9, fs6, ft7, rup
                  fmax.s       fs4, ft7, ft3
                  and          ra, s10, t0
                  fadd.s       ft5, fs4, fa5
                  auipc        s11, 723723
                  fsub.s       fs5, fa6, fs7
                  div          a7, s4, t1
                  fclass.s     a7, ft5
                  xor          s10, t2, s3
                  remu         a3, t2, s6
                  auipc        a4, 765990
                  or           ra, s5, s4
                  mul          t6, t1, s10
                  fcvt.s.w     ft4, sp
                  xor          a6, s6, t3
                  fdiv.s       fs5, ft7, ft6, rup
                  div          a6, a7, s9
                  andi         t6, a1, 1740
                  add          sp, s7, a5
                  fmv.w.x      fs5, tp
                  fsgnj.s      fs0, fs8, fa5
                  or           a0, tp, s10
                  fcvt.s.w     fs3, s9, rmm
                  fclass.s     tp, ft7
                  fsub.s       ft0, fs2, ft9
                  rem          tp, s7, t6
                  feq.s        a4, fa6, fs4
                  fcvt.s.wu    fs10, a2, rne
                  slt          a1, s11, a7
                  srli         t6, a7, 9
                  sub          tp, s2, a2
                  addi         t6, t4, 902
                  addi         s1, t2, 1079
                  fadd.s       ft1, ft0, ft3, rdn
                  fclass.s     a1, fa4
                  sll          t6, t5, a5
                  addi         s1, s7, 1411
                  slti         s7, t0, -2032
                  sll          s10, s11, a2
                  and          s11, ra, s9
                  fsgnjn.s     fa3, fa1, fa7
                  srl          zero, a4, ra
                  slt          s3, gp, t0
                  fdiv.s       ft3, fs0, ft9
                  rem          sp, s0, s5
                  fmv.w.x      fs4, s7
                  fmul.s       fs4, ft0, ft5
                  ori          t5, t4, -1632
                  mulhu        s2, t5, tp
                  fclass.s     s10, ft4
                  fle.s        s10, ft3, fa2
                  fsgnj.s      fa4, ft7, fs9
                  fcvt.s.wu    fs9, s7, rtz
                  srl          a7, ra, a6
                  fsgnj.s      ft5, fa3, fs5
                  andi         a7, s10, 570
                  mulhsu       s4, a6, s7
                  lui          t6, 627178
                  slt          s4, t3, s7
                  div          zero, s8, a7
                  fsgnjx.s     ft10, fa1, fa6
                  srai         a4, s2, 16
                  sltu         s0, s6, s7
                  fmul.s       ft5, ft6, fs10, rdn
                  auipc        sp, 1039298
                  slt          t2, t6, tp
                  srl          a7, s2, t0
                  fdiv.s       fs4, ft8, fs4, rne
                  srai         s9, t0, 1
                  mulh         s5, s5, zero
                  divu         sp, t5, gp
                  and          tp, s2, s0
                  fle.s        a4, ft5, fs2
                  and          t0, s11, t5
                  fcvt.w.s     t3, fa2
                  xor          s3, s8, a7
                  fmax.s       ft0, ft11, fs1
                  sub          s2, sp, s4
                  srli         s5, a5, 5
                  fsgnjx.s     fa4, fs8, fs1
                  fdiv.s       fs10, ft0, ft0
                  addi         s7, a6, 1886
                  fsub.s       fa5, ft2, fs7, rtz
                  rem          s5, ra, t0
                  fdiv.s       ft1, ft11, fa5
                  fsgnjx.s     fa2, fs0, ft9
                  sltu         a0, gp, a3
                  divu         s2, s2, gp
                  lui          s3, 174385
                  sltu         t2, s5, s2
                  fsgnjx.s     ft11, fa3, fa7
                  nop
                  sra          s10, gp, s8
                  addi         t4, s8, 177
                  fdiv.s       fs4, ft2, fs11, rtz
                  srl          a5, t1, ra
                  fmv.x.w      t1, fa1
                  mulhu        s4, t0, s9
                  xor          a3, a3, s1
                  fmax.s       ft6, ft8, ft11
                  srli         t4, s6, 17
                  sub          s3, t3, a2
                  flt.s        t4, ft5, ft7
                  mulhsu       t4, s0, a7
                  auipc        a6, 805377
                  slti         s11, s6, 1648
                  sra          t0, s4, s3
                  feq.s        t5, ft5, fa7
                  fsgnjx.s     fa3, ft0, fa1
                  and          s11, t0, s6
                  fsgnjx.s     fs9, fs5, fa3
                  fsgnj.s      fs3, fs10, ft1
                  divu         s0, s9, a2
                  sub          zero, a7, a0
                  mulh         tp, a4, a4
                  remu         a4, s2, a2
                  slli         s4, s0, 18
                  lui          s5, 497762
                  nop
                  sltiu        a1, s3, 1134
                  srli         s0, s4, 14
                  fsgnj.s      ft3, fa0, fs3
                  fmv.x.w      a7, ft5
                  mulhu        t6, gp, s4
                  sltiu        s11, zero, -491
                  addi         t0, s4, -242
                  andi         s7, s5, -177
                  mulh         ra, s4, tp
                  div          zero, s7, t1
                  divu         t0, t5, a7
                  srl          t1, a3, ra
                  fcvt.s.wu    fs6, t1, rne
                  addi         t2, s9, 693
                  nop
                  fsub.s       fa0, ft8, fa0
                  sra          t2, a6, t1
                  srl          t0, a7, t2
                  fcvt.w.s     ra, ft2
                  add          s5, ra, s11
                  xor          t1, zero, t2
                  sra          s2, zero, a3
                  slli         gp, s8, 11
                  sltiu        a6, s1, -1576
                  sltiu        s0, s5, -1734
                  fsqrt.s      ft8, ft2, rne
                  sltiu        s2, a6, -501
                  srl          a1, s5, t5
                  fcvt.w.s     a1, fa5, rne
                  add          t1, t0, a2
                  fsgnjx.s     fs6, ft4, fs9
                  sra          s1, t3, s0
                  add          s1, s2, a0
                  addi         s9, s0, 1772
                  remu         a0, t5, s0
                  fadd.s       fs2, fs7, fs10, rup
                  slli         a1, t4, 28
                  flt.s        s2, fa1, ft0
                  slt          t0, s7, a7
                  auipc        a7, 196490
                  slti         s0, t6, 1534
                  sltiu        s10, s11, 2003
                  fmul.s       ft10, ft4, ft0
                  and          s1, t6, t5
                  auipc        zero, 8596
                  fadd.s       fa4, ft0, ft0, rdn
                  fcvt.w.s     s11, fa5, rup
                  sltiu        s9, sp, 571
                  fcvt.s.w     fs7, a0, rup
                  fsgnj.s      ft11, fs8, fs6
                  slti         a3, s6, 1671
                  or           sp, s11, s0
                  mulh         tp, a6, t3
                  or           s3, s10, s11
                  add          s5, a6, s0
                  sub          s2, tp, t5
                  addi         t4, s5, 96
                  fclass.s     s5, ft7
                  divu         a6, s5, tp
                  sltu         a0, gp, a6
                  mulhu        a4, t1, tp
                  fcvt.w.s     a6, fa1, rdn
                  srai         gp, a5, 1
                  fsgnjn.s     fs2, ft2, fs6
                  feq.s        a6, ft3, ft6
                  fadd.s       fs6, fs5, fs7, rdn
                  mul          t5, t1, a4
                  fcvt.w.s     s7, ft11
                  fle.s        a7, ft10, fa2
                  sra          s1, t2, s6
                  fdiv.s       fs8, fs3, fs10, rtz
                  slti         s4, s1, 1855
                  fcvt.s.wu    fa7, s6
                  lui          t6, 833514
                  rem          gp, a7, sp
                  or           s5, t4, a2
                  fadd.s       ft9, fs0, ft4, rup
                  fcvt.w.s     t5, ft9
                  andi         t0, s0, -171
                  auipc        s11, 212891
                  fsqrt.s      fa3, fa2
                  fmax.s       ft0, ft3, fs0
                  fcvt.wu.s    s7, fs9
                  fmul.s       fa5, fs3, ft11
                  slt          s3, a5, a6
                  sltu         s5, s10, s0
                  fsgnj.s      fa7, fa1, fs6
                  fsgnjx.s     ft10, fs3, fs10
                  sll          a0, s10, s4
                  fmv.w.x      fs3, ra
                  fsgnj.s      ft11, fs7, ft1
                  fmul.s       fa4, fs8, fs5, rtz
                  xori         s4, t4, -1818
                  or           s5, t5, s5
                  mulhu        tp, s5, a4
                  sltiu        a6, s4, -1216
                  sra          t6, s2, s2
                  fmul.s       fs11, fa3, fs9
                  divu         a6, a0, a7
                  srai         a7, tp, 11
                  lui          t6, 774871
                  nop
                  mulhu        t4, ra, s11
                  fcvt.w.s     a7, fa0, rdn
                  fmin.s       fa6, ft8, ft1
                  mulhsu       sp, s5, s8
                  slti         s7, ra, 1797
                  div          a6, s2, t4
                  srli         sp, t2, 24
                  srai         s7, s3, 8
                  feq.s        tp, ft8, fa2
                  sub          a7, s9, a4
                  fdiv.s       fs7, fa6, fs6, rne
                  srl          t4, t0, t5
                  remu         t2, zero, sp
                  fsgnjn.s     fs8, fs11, ft2
                  fsub.s       ft4, fa2, fa4
                  fadd.s       fs6, ft10, fa4
                  fdiv.s       fs6, fs5, fs6, rmm
                  fsqrt.s      ft6, fa7
                  fmul.s       fs1, fa1, ft10
                  remu         s10, s10, tp
                  srli         sp, a0, 21
                  nop
                  fsqrt.s      fa2, fa3
                  fle.s        t1, fs0, fs1
                  mulh         t0, s0, s5
                  mulhsu       t4, s9, a7
                  srai         t0, gp, 10
                  fclass.s     s1, ft3
                  add          s9, sp, zero
                  sltiu        s2, s0, 709
                  sltu         a1, t4, a2
                  auipc        a0, 1045972
                  mulhu        a1, a6, a3
                  fsqrt.s      ft5, fs1
                  srli         t2, s3, 1
                  rem          a1, a6, a7
                  auipc        a3, 221276
                  mulhu        s10, s3, s7
                  mulhsu       s7, a2, a5
                  sra          tp, t6, zero
                  sll          s11, s8, s6
                  fsub.s       ft6, fa2, fa2, rmm
                  fadd.s       fs7, fa6, fs8
                  slti         t2, a3, 1738
                  fdiv.s       fa5, fs6, ft10
                  fsgnj.s      fs5, ft3, fs9
                  nop
                  and          t3, a0, t2
                  sra          t3, s4, t0
                  andi         t4, t1, -1236
                  and          a1, a1, t6
                  fmax.s       fs2, fs7, fs10
                  sll          a6, a3, s0
                  fsgnjx.s     fs2, fs0, fa3
                  fsgnjn.s     fs0, fa2, fs6
                  fmv.x.w      sp, ft5
                  andi         zero, s1, -530
                  fclass.s     gp, ft1
                  sub          a7, s4, s6
                  slti         zero, a7, 702
                  fsgnjn.s     fs9, fs7, ft2
                  srli         a4, a2, 31
                  srli         s10, a4, 30
                  fsub.s       fs8, fs3, fa3, rmm
                  fsqrt.s      ft0, ft1
                  remu         t3, sp, a7
                  slt          s10, s3, t1
                  slli         a0, s5, 8
                  sltu         s2, zero, tp
                  fsub.s       fs11, ft9, ft11, rup
                  fcvt.s.wu    ft5, a2, rup
                  feq.s        t6, ft11, fs1
                  fclass.s     s2, fa3
                  fcvt.wu.s    gp, ft8
                  fmul.s       fs3, fa6, fa0, rmm
                  srai         t6, s6, 6
                  slli         tp, gp, 3
                  fadd.s       fa3, fa3, ft0
                  add          s5, a3, sp
                  add          s0, s7, a5
                  slt          gp, s1, t2
                  fle.s        t1, fa1, fs5
                  fcvt.s.w     fa5, s0, rup
                  slt          ra, t1, a6
                  feq.s        sp, fs2, fa1
                  flt.s        s9, fs0, ft7
                  or           s9, s9, t6
                  rem          s9, s11, s3
                  ori          s7, s10, 679
                  add          s1, s10, tp
                  divu         a5, t0, a5
                  remu         t0, a6, t0
                  remu         a1, a5, s0
                  fsgnjx.s     ft6, fs10, ft4
                  fsgnjn.s     ft7, fa5, ft11
                  xor          s2, t1, s10
                  fsgnj.s      fs8, fs1, ft4
                  flt.s        s2, fa0, fs3
                  fadd.s       ft7, ft9, ft4
                  and          a5, s3, s10
                  srai         a6, a4, 26
                  fsgnjx.s     fs10, ft6, fs9
                  sltu         t1, s11, t0
                  mulhsu       s0, a0, s5
                  srli         s5, a3, 28
                  srai         s4, a7, 31
                  srl          t3, s6, s6
                  srli         ra, s11, 3
                  fsgnjn.s     fs9, fa5, fa3
                  andi         gp, s9, -1452
                  mul          a6, t0, t4
                  mulh         s10, s7, tp
                  fmin.s       fa2, fs9, ft7
                  flt.s        ra, ft8, fa6
                  xor          t2, a4, t0
                  mulh         s9, a4, a3
                  srl          t0, t1, gp
                  divu         s7, ra, a2
                  and          gp, s6, t2
                  fsgnj.s      fs6, ft0, fs5
                  sltiu        a6, a5, 2039
                  fcvt.wu.s    ra, ft1
                  fmax.s       fs5, ft4, ft11
                  xori         s0, t6, -1079
                  mulhsu       t1, t2, a6
                  fsgnjn.s     fa1, fs4, ft6
                  mulhsu       ra, s2, t6
                  fmv.x.w      s0, ft8
                  auipc        a0, 958429
                  fmv.w.x      ft1, zero
                  mulhu        s5, ra, t0
                  fsqrt.s      ft6, fs2, rdn
                  fdiv.s       fa5, ft10, ft6
                  ori          t3, t2, -1714
                  rem          a0, a4, t2
                  srl          tp, t1, s8
                  auipc        a5, 877191
                  sra          s9, a3, a7
                  fmv.x.w      t3, ft0
                  fcvt.w.s     s0, fs0
                  srai         t5, a0, 24
                  mulh         a6, s11, s7
                  lui          s5, 685445
                  and          s7, tp, s4
                  feq.s        sp, fs2, fs3
                  sra          a1, gp, s8
                  lui          t1, 189005
                  sll          sp, a3, s0
                  sltiu        a4, s8, -171
                  add          a1, a4, s11
                  slti         s3, a2, -1807
                  fmin.s       ft10, ft11, ft7
                  fcvt.wu.s    a1, fa2
                  srai         gp, t2, 25
                  fle.s        s11, ft0, ft8
                  fmin.s       fs3, ft5, fs6
                  fsgnjn.s     fs10, fa3, fa0
                  fsqrt.s      ft8, fs8
                  sltu         t1, s11, s1
                  divu         s5, gp, tp
                  div          t3, s5, zero
                  rem          a3, a3, a4
                  fmax.s       ft11, ft1, fs4
                  srl          s1, t0, s3
                  fmul.s       ft6, ft0, ft11
                  auipc        a1, 815221
                  srli         s9, t3, 0
                  lui          a5, 126059
                  fle.s        t2, ft7, fa1
                  slt          s2, s4, tp
                  sra          t1, t6, s3
                  ori          a0, s2, 1209
                  div          t1, ra, zero
                  fcvt.w.s     a3, fa2, rdn
                  fsub.s       fa7, fa0, fs10, rtz
                  auipc        sp, 343775
                  slt          s2, gp, s3
                  fclass.s     a4, fa5
                  remu         a7, t3, s5
                  sll          zero, s2, s6
                  fsub.s       fa6, ft0, fs9, rdn
                  remu         s5, a3, tp
                  sra          s7, s8, t3
                  fcvt.w.s     tp, fs2, rdn
                  fmin.s       ft1, ft4, ft6
                  srli         a0, s9, 22
                  fsqrt.s      fs9, fs4
                  nop
                  mul          t0, s10, t6
                  mulh         ra, s8, s3
                  fcvt.s.wu    fa1, s4
                  fcvt.w.s     s5, ft3
                  mul          zero, a4, t4
                  feq.s        s3, fa4, fs8
                  divu         a5, s5, sp
                  rem          a5, s1, a4
                  fsgnj.s      ft6, ft0, fa5
                  fle.s        s0, ft10, fs6
                  srai         sp, s3, 8
                  feq.s        s4, fa4, ft11
                  sub          zero, gp, tp
                  sll          t0, t4, s11
                  fmul.s       fa7, fa6, fa6, rmm
                  nop
                  fmin.s       ft9, fs11, fs4
                  fmv.x.w      a6, ft2
                  sub          s10, a3, a0
                  rem          s3, t6, s8
                  sltiu        s9, zero, -1292
                  fcvt.s.wu    fa0, s6
                  fmv.x.w      gp, fs5
                  fsqrt.s      ft0, fs2, rtz
                  lui          a6, 743245
                  sltiu        s9, t5, 693
                  fsgnjx.s     ft6, fa1, fs7
                  fmax.s       fa5, ft11, ft10
                  fmax.s       fa6, fs7, fs0
                  addi         s9, a2, 1141
                  srl          a6, a3, t4
                  remu         sp, s10, t5
                  fmv.w.x      fs9, a1
                  andi         zero, t1, 639
                  slti         s10, a4, -1453
                  feq.s        s4, fa5, ft8
                  fcvt.s.w     fs8, s6
                  sll          t0, t5, a1
                  mulhsu       s0, gp, s5
                  xor          a1, zero, s4
                  fsgnjn.s     fs5, fs0, ft8
                  nop
                  fmul.s       fa3, ft9, ft8, rup
                  mulhu        a6, t6, t3
                  fmin.s       ft8, fs2, fs0
                  fsgnjn.s     fs0, ft1, ft1
                  fsqrt.s      fs11, fa4
                  sub          a5, s8, s2
                  srli         t4, s1, 8
                  div          ra, zero, s10
                  mulhsu       t2, tp, s11
                  sra          a4, t5, t4
                  lui          s9, 481991
                  fsub.s       fa1, ft0, fs0
                  fsub.s       fs9, fa4, ft1
                  fsqrt.s      ft9, fs5, rne
                  sltu         s5, s11, s8
                  slti         s4, s9, 241
                  xor          a4, a0, a2
                  div          s1, t4, t2
                  sll          t1, s4, t1
                  or           t2, s11, s9
                  sub          s1, zero, a7
                  rem          a3, s1, s2
                  slti         t1, t1, 443
                  divu         t4, ra, zero
                  sll          s11, s2, t6
                  fdiv.s       ft0, fs7, fs10, rmm
                  fsgnj.s      fa5, fs10, fa1
                  fadd.s       fs4, fa3, fa6
                  andi         tp, ra, 1290
                  slti         a6, t0, 1513
                  xori         a6, s2, -928
                  slli         a6, t0, 10
                  divu         a5, a2, zero
                  fadd.s       fa2, ft3, fs9, rtz
                  sll          a1, s1, t0
                  srai         s5, t5, 26
                  auipc        gp, 220301
                  mulhsu       t6, a0, s9
                  slti         a4, s1, -718
                  fadd.s       fa5, ft3, fa2, rup
                  fsub.s       fs8, ft4, fs6, rmm
                  fcvt.s.wu    fs4, tp
                  xori         tp, a5, 817
                  nop
                  div          s1, sp, s7
                  addi         gp, a6, 1703
                  fclass.s     t4, ft9
                  flt.s        t6, fa7, fa1
                  slt          a4, zero, s6
                  remu         a1, t3, s1
                  fcvt.w.s     t6, fa5
                  fcvt.s.wu    fs6, a7
                  xori         s4, a6, -987
                  slt          a3, a6, s6
                  mul          gp, a3, ra
                  srai         s7, gp, 20
                  fle.s        a6, fa6, ft4
                  fmax.s       fs3, fa0, ft3
                  fcvt.wu.s    s5, fa6
                  remu         s0, a5, t0
                  sltu         a1, gp, s5
                  sra          t6, a0, t0
                  fclass.s     s2, fs6
                  addi         a7, t0, -701
                  xor          s7, s11, a3
                  ori          t1, s11, -1744
                  auipc        t3, 895469
                  add          t6, s7, a6
                  sltu         zero, s10, s8
                  slli         a0, s3, 8
                  fcvt.w.s     s2, fs8, rup
                  fdiv.s       fs4, ft9, ft8
                  sub          s10, s3, ra
                  srli         a6, s4, 23
                  addi         s4, t5, 1696
                  fcvt.s.w     fs1, t6
                  srli         zero, a1, 25
                  mul          s5, a5, a5
                  fle.s        a7, fs7, fs7
                  fmax.s       ft9, ft3, fs1
                  feq.s        t5, ft2, fs9
                  mulhu        t4, s1, sp
                  fcvt.s.wu    ft4, s7, rtz
                  fsgnj.s      fs2, fs8, fs10
                  sub          t2, ra, s8
                  sra          s7, s3, s1
                  srai         t0, s2, 23
                  fmax.s       ft1, ft8, fs3
                  fcvt.s.wu    fs3, s1, rdn
                  fmv.w.x      ft5, s1
                  fclass.s     t0, fs5
                  fsqrt.s      ft4, ft1
                  auipc        t5, 307617
                  div          t6, a0, s10
                  fsgnjx.s     fa4, fs4, fa4
                  addi         tp, t2, 117
                  fmul.s       ft5, fs11, fs3, rdn
                  fcvt.s.w     fa0, gp
                  lui          t6, 575425
                  fmv.x.w      s11, fa0
                  sub          s5, gp, t0
                  fmv.w.x      fs1, a0
                  add          a7, sp, t0
                  srl          a3, a7, zero
                  fsub.s       ft8, fa4, fs9
                  andi         s9, t4, 1536
                  slt          a1, a3, s9
                  sra          s4, s9, s6
                  sub          s4, s3, s2
                  andi         zero, sp, 1913
                  mul          ra, t4, s2
                  fmv.w.x      ft11, t3
                  fsgnjn.s     fs3, ft2, fs6
                  sub          t4, t4, t5
                  slt          t6, s7, t6
                  fcvt.s.wu    ft3, s5
                  fsqrt.s      fa7, fs10, rdn
                  fsqrt.s      fa4, ft8, rmm
                  addi         a0, s8, -1005
                  srai         ra, s5, 28
                  fcvt.w.s     s2, ft8
                  srli         s4, tp, 25
                  fmul.s       fs10, ft7, fs2
                  mulhu        t5, t1, t0
                  sltiu        tp, s5, -1125
                  mulhsu       t6, s10, t4
                  feq.s        sp, fa7, ft9
                  fsgnj.s      fs1, ft10, fs8
                  fmax.s       fs8, fs9, fs11
                  nop
                  ori          gp, s5, -867
                  fmul.s       fa2, fs3, fs7, rmm
                  fdiv.s       ft9, fs9, fs5
                  mul          t0, t5, zero
                  fsub.s       fs6, fa7, fa6
                  auipc        a7, 257654
                  addi         gp, tp, -1286
                  slti         s7, t5, 1350
                  slt          s5, s1, a3
                  div          gp, a2, gp
                  fmax.s       ft1, fa2, fs0
                  or           a1, a7, a7
                  remu         t1, t3, t1
                  fcvt.wu.s    s5, ft1, rdn
                  fdiv.s       fs2, fs8, fs10, rne
                  fmul.s       ft9, fa6, fs7, rne
                  fclass.s     tp, fs1
                  slti         s4, t0, -21
                  addi         a7, a4, -1485
                  fmax.s       fs0, ft9, ft2
                  sltiu        a5, s6, 893
                  fadd.s       ft2, fs8, fa7
                  rem          s9, t1, tp
                  fsqrt.s      fs10, ft10
                  add          a7, a3, a4
                  sll          a7, s1, s8
                  mulhu        t5, t0, s4
                  sll          a5, s7, a1
                  addi         a3, a5, 776
                  mul          s4, s7, a6
                  sll          a0, t6, a7
                  fcvt.wu.s    gp, fs1
                  slt          s4, a2, tp
                  sra          t4, t5, a3
                  fmin.s       fa6, fa3, ft7
                  fcvt.w.s     s5, fs0
                  fdiv.s       fs9, fa2, ft10
                  divu         s10, a7, s6
                  divu         t2, gp, s7
                  mul          s4, s4, a6
                  fadd.s       fa7, ft10, fs7
                  slt          t6, s4, a1
                  feq.s        s7, fs8, ft7
                  fcvt.s.wu    fa6, gp, rne
                  remu         a7, gp, s0
                  mulhsu       t3, zero, a0
                  sll          t0, zero, a1
                  fsgnjx.s     fa3, fs6, ft7
                  slli         t2, s6, 30
                  slti         s4, ra, 913
                  slt          sp, s11, ra
                  divu         zero, t1, s8
                  fsub.s       fa5, ft2, fs9
                  fmax.s       fs3, fa0, ft0
                  fsgnj.s      fs0, ft3, ft11
                  xori         s1, t0, -390
                  fcvt.s.w     ft6, sp, rdn
                  lui          t5, 690987
                  fcvt.s.w     fa3, s11
                  ori          s0, s7, -929
                  addi         ra, sp, -814
                  sra          t2, a3, s6
                  xori         a5, t5, 1578
                  srai         sp, t1, 26
                  sra          s9, s10, t5
                  srl          ra, t6, a6
                  fadd.s       fa0, fs6, fa3
                  sub          a6, s2, t3
                  slt          s1, s0, a7
                  fcvt.s.wu    fs8, a4
                  xor          s3, t6, a3
                  fcvt.s.w     fs3, t0
                  add          t5, s6, a3
                  slli         a3, t5, 3
                  sra          tp, tp, t4
                  mulhsu       t3, s6, a7
                  fsqrt.s      fs4, ft0
                  fle.s        t0, fs4, ft10
                  fmul.s       ft6, ft5, ft11, rne
                  remu         a1, s9, t0
                  div          s0, a2, t5
                  srl          s10, s9, a6
                  mul          t6, a2, zero
                  div          s4, s5, a1
                  fmul.s       ft8, fa5, ft11
                  auipc        t4, 658247
                  fcvt.w.s     t6, ft6, rdn
                  div          t2, s4, ra
                  remu         s5, s2, ra
                  fdiv.s       fs1, fa1, fs1, rne
                  ori          s10, zero, 1205
                  fdiv.s       ft0, ft10, ft4, rne
                  fmv.w.x      ft0, s3
                  auipc        t3, 535375
                  divu         t2, s7, s5
                  srl          a3, a3, s6
                  or           t3, s4, a7
                  fmax.s       ft6, ft11, ft6
                  sltu         zero, s6, a1
                  fsqrt.s      ft8, ft0, rup
                  sltiu        s11, t3, 754
                  mulh         a5, a7, s9
                  slti         s2, tp, -1628
                  flt.s        t5, fa5, fa7
                  fsgnjx.s     fa0, fa0, ft8
                  fcvt.s.wu    ft11, s5
                  nop
                  sub          t5, t6, a1
                  fmul.s       ft9, fs0, fs0, rdn
                  andi         t2, a0, -1859
                  mul          a4, s7, a0
                  slli         t3, t0, 30
                  fmax.s       fs10, ft2, ft5
                  fcvt.s.wu    fs2, s4
                  xori         s11, s0, 561
                  fmul.s       fs5, fs11, fs8
                  addi         s1, s6, 1970
                  mul          s7, s6, s0
                  sltu         a4, a2, a6
                  fcvt.s.wu    ft1, a0
                  lui          zero, 150095
                  or           ra, t4, ra
                  xori         s10, a5, -1849
                  xor          t4, gp, a1
                  addi         s2, gp, -1384
                  or           s9, s5, gp
                  remu         a5, zero, gp
                  xori         a1, s1, -1345
                  lui          s10, 226554
                  fadd.s       ft7, fs1, ft8, rmm
                  slli         t4, s8, 26
                  sra          a1, t5, sp
                  flt.s        t5, fa0, ft6
                  sub          s11, s6, ra
                  fsub.s       fa7, fs5, fs1, rup
                  fmin.s       fs4, ft9, fa7
                  sll          s11, s0, s6
                  add          a5, s2, a6
                  sra          a6, zero, t6
                  fcvt.s.wu    fs11, s8, rne
                  xor          t4, sp, s9
                  srl          t5, t3, a0
                  sra          t1, ra, sp
                  sub          t0, sp, tp
                  fcvt.w.s     t5, fa7
                  mul          t0, gp, s5
                  fmax.s       fs1, fs8, fs9
                  fcvt.s.wu    ft0, sp
                  sltu         t4, a1, s2
                  remu         a6, s5, s5
                  and          ra, s1, a1
                  and          t5, a2, t6
                  mul          t5, t5, a1
                  fsqrt.s      fa6, fa2
                  flt.s        s9, ft2, fs1
                  xori         s4, s11, -720
                  flt.s        s10, fa2, ft3
                  divu         tp, a6, a6
                  fcvt.w.s     a7, fa1
                  sltu         s7, a7, gp
                  sll          s2, a5, s11
                  fcvt.w.s     s0, fs10, rtz
                  nop
                  fsgnjx.s     fs6, fs6, ft4
                  sra          a7, ra, a3
                  div          s2, gp, a2
                  mulhu        s1, a4, zero
                  slli         a4, t5, 22
                  fcvt.s.wu    fa6, s1
                  add          t5, zero, a1
                  add          a5, t0, t1
                  fsgnj.s      fs11, fs7, fa3
                  fsub.s       fa4, ft10, ft9
                  fcvt.s.wu    ft1, t3, rmm
                  fsgnjx.s     fs9, ft11, ft6
                  srai         s7, s10, 12
                  fsqrt.s      ft6, ft0, rtz
                  fsgnjn.s     ft0, fs11, ft2
                  fadd.s       fs2, fs9, fa0
                  sub          a6, s6, a2
                  fdiv.s       fs5, fs5, ft1, rup
                  andi         a0, s0, 588
                  fmax.s       fs2, fa1, fs9
                  sll          a4, t2, a3
                  fmv.w.x      fa4, t5
                  ori          s1, s11, 360
                  fle.s        t0, fa1, fa1
                  fadd.s       ft8, fs7, fa4, rtz
                  slti         s10, a4, 1861
                  or           s3, t0, a1
                  sll          tp, sp, a6
                  or           a5, s2, t0
                  fcvt.wu.s    t0, fs2
                  divu         a1, t1, a4
                  addi         s11, s4, -1441
                  fmax.s       fs7, fa3, ft11
                  xori         s1, s11, 1710
                  slli         s4, tp, 31
                  mulhu        tp, s3, a0
                  flt.s        s4, fa7, fa0
                  srli         s10, a2, 25
                  srai         a1, t2, 9
                  slt          a6, s0, a6
                  fcvt.wu.s    a5, fs5
                  fcvt.s.wu    fa3, tp
                  fcvt.s.wu    fs7, s1, rmm
                  fmv.w.x      ft11, s7
                  fcvt.wu.s    t4, fa1
                  fmin.s       fa3, fs10, fs6
                  andi         s2, s8, 269
                  fcvt.wu.s    a0, fs11
                  slti         a3, a7, -1414
                  andi         t0, t1, -1058
                  fadd.s       fa2, ft10, fs5
                  or           gp, ra, a3
                  sub          t6, s8, sp
                  and          s7, s3, a3
                  fsgnj.s      ft3, ft4, fs10
                  and          zero, t0, s4
                  divu         t5, a7, s1
                  fsgnj.s      ft5, fs9, fa4
                  sltu         s0, s4, t2
                  slt          t4, s0, t2
                  srai         t3, s11, 19
                  srai         t0, s7, 30
                  addi         a0, a1, -1415
                  andi         s2, s2, -982
                  div          tp, a2, t0
                  fdiv.s       fa4, fs0, fs9
                  fmv.w.x      ft7, tp
                  nop
                  fclass.s     t3, fs8
                  flt.s        s11, fs7, fs1
                  fdiv.s       ft4, fa7, fs9, rtz
                  fcvt.s.wu    fa1, s10, rtz
                  fcvt.wu.s    t6, fa0, rdn
                  fle.s        t0, ft11, ft4
                  fmul.s       fs2, fs9, fs3
                  xor          t2, t5, s8
                  srl          t2, a0, a0
                  fsgnjx.s     fa0, fa5, ft6
                  srl          t0, s11, gp
                  add          a1, a7, t1
                  fsgnjn.s     fa3, fa7, fs6
                  mulh         a3, s5, ra
                  fcvt.s.wu    fa1, a6
                  sltiu        s11, t5, 1610
                  remu         s9, a0, t6
                  slti         gp, s10, -775
                  fsgnj.s      fs4, ft10, ft9
                  sra          t0, sp, s4
                  sltiu        a5, t1, -1298
                  div          t1, s1, gp
                  rem          s3, t5, s2
                  sll          t0, s4, t6
                  xori         t3, s5, -780
                  sll          s3, s3, sp
                  xor          t6, t6, s8
                  or           a5, t6, s9
                  slt          a6, t5, s2
                  mulh         sp, t0, t1
                  xor          t3, t3, tp
                  feq.s        s10, fs5, fs5
                  srl          tp, s11, a4
                  slli         a4, a2, 14
                  andi         s2, t6, 1995
                  mul          s2, s8, s5
                  andi         t6, t0, -607
                  div          a4, s7, t2
                  srli         t0, ra, 4
                  and          t0, t6, s11
                  fcvt.w.s     t3, ft2, rmm
                  fcvt.wu.s    gp, fs3, rdn
                  fle.s        s1, fs7, fa0
                  sub          t0, a7, s1
                  fsqrt.s      ft0, fa2
                  addi         a3, t4, 1523
                  srai         a5, s4, 16
                  sltiu        s9, ra, -584
                  feq.s        t3, fa4, fa0
                  div          t1, t6, a5
                  or           tp, t1, t4
                  fadd.s       ft5, ft9, fa1, rup
                  fmv.w.x      fs8, t2
                  and          t3, a0, t5
                  fcvt.w.s     s5, ft8
                  remu         sp, tp, ra
                  srl          tp, a4, a4
                  lui          s3, 54131
                  sltu         t6, s6, s2
                  fcvt.wu.s    t6, fs9, rdn
                  xori         tp, tp, -1413
                  srl          t4, a2, s3
                  slti         t0, s11, 1192
                  remu         tp, s11, gp
                  srl          s0, t5, s9
                  mul          t3, a0, s8
                  lui          t1, 1024828
                  mul          s7, t3, s6
                  fcvt.s.w     ft2, a2, rmm
                  divu         gp, s7, t0
                  ori          ra, s7, 109
                  add          a5, s7, t5
                  fcvt.s.w     fs11, t2
                  fadd.s       fs1, fs2, ft0, rmm
                  sltu         tp, s5, a0
                  fmin.s       fa6, fa4, fs1
                  fclass.s     s7, fs5
                  feq.s        a4, ft5, fs4
                  mulhsu       gp, tp, a5
                  slt          s1, a0, t4
                  slt          a7, ra, sp
                  sltiu        s0, s4, 436
                  srai         a3, s3, 30
                  slli         a3, s11, 29
                  xori         a4, a1, -62
                  ori          t0, s5, -881
                  fclass.s     a7, fa3
                  sltiu        a4, sp, 380
                  divu         ra, a4, t0
                  fle.s        t2, fa3, fs2
                  mulh         t2, a3, s0
                  fclass.s     ra, fa3
                  srl          a5, s1, s9
                  fsgnjn.s     fa1, fa7, fs9
                  fclass.s     a0, ft11
                  lui          a7, 632620
                  srli         a0, a1, 27
                  andi         t3, sp, 1257
                  fsgnjn.s     fs6, ft5, fa0
                  andi         t5, s5, -1976
                  fmin.s       ft2, fs2, fs6
                  divu         gp, a0, a2
                  sra          t5, s1, s9
                  div          a0, s4, s11
                  fmul.s       fs8, fa2, fs1
                  fsgnjn.s     fs4, ft6, ft2
                  fcvt.w.s     s4, ft0
                  sltu         t2, t4, a7
                  fmin.s       ft1, fs4, ft0
                  andi         a1, t4, 1835
                  fadd.s       ft11, ft10, fs9, rtz
                  rem          s7, t0, ra
                  addi         gp, a4, -1013
                  rem          gp, t0, ra
                  fsgnjx.s     ft3, fs10, fa6
                  mulh         a5, a2, s3
                  fcvt.s.wu    fa5, a1
                  fsub.s       ft11, fs2, fs2, rdn
                  slt          a1, s4, a6
                  srai         s5, a5, 1
                  ori          s4, s1, -439
                  mulhsu       tp, sp, sp
                  xor          s0, a1, t6
                  or           t1, a7, t0
                  sub          t1, gp, t6
                  fsgnj.s      ft7, ft3, fs9
                  srli         s4, s1, 2
                  mulhu        s10, a1, s9
                  addi         s4, s10, 602
                  fmin.s       fa0, ft5, ft11
                  sll          s7, s2, ra
                  slt          a1, sp, t3
                  srli         a1, t2, 6
                  fcvt.wu.s    t2, fs6
                  fsgnj.s      fa4, ft6, ft7
                  fcvt.w.s     s10, fa3, rne
                  sub          s7, t4, a1
                  mul          a3, s2, s5
                  fadd.s       ft5, ft0, fs7, rdn
                  fclass.s     ra, fa5
                  fmv.w.x      fa1, zero
                  mulhu        t5, s2, s1
                  fadd.s       fa2, fs3, ft1
                  div          s11, t4, s8
                  lui          t0, 885419
                  slti         a4, a5, -959
                  fcvt.wu.s    ra, ft3
                  fsgnj.s      fa6, fs11, ft11
                  add          a1, t2, t5
                  sltiu        a3, zero, 850
                  mulhsu       t2, t4, t5
                  fle.s        a3, fa6, fa0
                  divu         sp, a0, t1
                  xor          tp, gp, s11
                  feq.s        t6, ft8, ft8
                  xori         s2, a0, -1516
                  fadd.s       fa7, fs1, ft7, rup
                  fmin.s       fa3, fs7, ft2
                  fsqrt.s      ft11, ft1
                  add          gp, a5, gp
                  sll          ra, a0, t0
                  fsgnj.s      fs3, ft4, ft9
                  andi         s3, s6, 1900
                  fmv.x.w      a1, ft6
                  fmul.s       fa1, fs0, fs8
                  fmin.s       ft4, ft6, fs6
                  fcvt.w.s     s10, fs9
                  mulhsu       s5, t4, s9
                  srli         gp, s4, 5
                  fcvt.w.s     a4, fa5
                  sll          s11, gp, t2
                  slti         s9, s11, -662
                  nop
                  divu         t3, t1, t5
                  fmv.w.x      fs4, s3
                  xori         zero, t6, -1632
                  fmin.s       fs4, fa6, fa2
                  sra          t4, a5, s10
                  ori          t2, s1, 879
                  fadd.s       ft4, ft9, fs4, rne
                  mulh         zero, t2, t6
                  fsgnjn.s     ft10, fa4, fs6
                  fsgnj.s      ft4, fs4, fa4
                  fmv.x.w      s1, ft2
                  rem          s2, s1, t5
                  slt          s9, t2, s1
                  mul          s10, s2, a1
                  slt          t0, t4, a2
                  srli         s10, a6, 20
                  fmin.s       fs1, fs6, fa5
                  fmin.s       ft8, ft7, fs1
                  fcvt.w.s     a4, ft2
                  mulh         s7, a3, sp
                  mulhsu       s5, t5, ra
                  fcvt.s.wu    fa3, t6
                  divu         gp, s6, s7
                  feq.s        s5, ft11, fs0
                  fle.s        a7, fa1, ft10
                  fclass.s     s10, ft10
                  fcvt.w.s     s3, ft8
                  fsgnjn.s     ft10, ft1, ft2
                  and          a4, s10, s7
                  flt.s        s9, fa6, fa0
                  fmin.s       fa6, fs10, ft2
                  fle.s        s9, fs2, ft8
                  fmul.s       fs11, ft7, ft6, rup
                  remu         a4, t4, t0
                  auipc        tp, 168570
                  xori         s3, s0, 1083
                  fcvt.wu.s    ra, fa3, rdn
                  fsgnjn.s     fs7, ft6, ft1
                  auipc        t2, 280173
                  slli         t1, s10, 18
                  slt          s10, s1, a2
                  fcvt.wu.s    t4, fa6, rup
                  nop
                  divu         t5, s9, a5
                  srli         ra, t5, 9
                  mulh         s4, s8, s0
                  fdiv.s       fs5, fs2, fs6, rup
                  mul          s4, t0, s0
                  fmv.x.w      a3, fa3
                  fsub.s       fs9, fa2, fs5, rne
                  fadd.s       fs11, fa0, fa0
                  fmax.s       fs10, ft6, ft5
                  slt          t3, s8, a4
                  mulhu        s2, a3, t3
                  div          t4, t4, s0
                  fsub.s       fs5, ft2, fa7
                  ori          s2, s4, -1394
                  or           t5, t1, a7
                  divu         s5, s10, a1
                  fcvt.wu.s    s3, ft1
                  addi         a4, s2, -1615
                  mul          t4, s2, s10
                  fmv.w.x      fa7, s3
                  fcvt.w.s     s9, fa1
                  sra          t2, s6, t1
                  sltiu        a3, a6, -1790
                  srli         s11, s11, 24
                  mulhu        t6, a3, a4
                  slt          a6, s3, t2
                  slt          s11, t2, t4
                  fmul.s       ft1, ft2, ft1, rtz
                  sll          t4, t5, s4
                  fsub.s       ft9, ft11, ft9, rmm
                  fsub.s       fs6, ft11, fs3, rup
                  add          a7, zero, a3
                  fclass.s     s7, ft2
                  fdiv.s       ft0, fa6, fs2, rtz
                  or           zero, a7, a5
                  fle.s        sp, fs3, fs11
                  andi         a1, s0, -953
                  fclass.s     a7, ft1
                  fsgnjn.s     ft11, fa4, fs4
                  addi         a1, a5, -1638
                  ori          a1, sp, -1938
                  slt          s10, s5, a6
                  mulhsu       a7, s10, ra
                  nop
                  remu         a6, a6, ra
                  mul          t4, ra, a4
                  sltiu        t0, tp, 1133
                  mulh         s5, a2, sp
                  flt.s        s7, ft2, ft9
                  sll          a4, s2, gp
                  auipc        s7, 963097
                  sltiu        ra, a6, -907
                  slt          gp, s5, t4
                  fcvt.s.w     fa7, a7, rtz
                  and          t3, sp, s8
                  srai         s9, s1, 11
                  fmax.s       fs3, ft2, fa4
                  addi         zero, t6, 1790
                  fdiv.s       fa0, fa6, fs4
                  sra          t5, s8, a4
                  fsgnjx.s     fs5, fs0, fs10
                  fsgnj.s      ft2, ft11, ft3
                  fmv.x.w      a6, ft9
                  fadd.s       fs2, fa3, fs4, rdn
                  fle.s        s9, fa2, fs2
                  andi         t6, a3, -190
                  sll          s10, s6, s7
                  mulh         s9, ra, t5
                  fadd.s       ft8, fs9, fa0
                  slti         a7, s9, 142
                  fle.s        s4, ft1, ft6
                  slli         t6, gp, 22
                  fsub.s       fa5, ft2, fs6
                  xori         gp, s8, -463
                  mulh         t5, a1, sp
                  xor          t1, a1, a4
                  remu         t4, ra, s11
                  slti         t5, t0, 1542
                  fsqrt.s      ft8, ft3, rmm
                  mulhsu       t5, a2, s8
                  sll          a7, a7, a1
                  mul          s7, a4, s4
                  andi         t0, a5, -1674
                  fmv.w.x      ft11, a6
                  addi         a3, s7, -287
                  add          s11, t0, t2
                  mulhsu       s5, a7, s1
                  xori         tp, a4, 1147
                  mulhu        s10, a0, t0
                  feq.s        t0, ft6, fa7
                  fmin.s       ft2, fs0, ft4
                  mulh         t4, t2, t6
                  fcvt.s.wu    fs7, s5
                  fsgnj.s      fa2, fa7, fs4
                  mul          a4, a0, a0
                  srli         t0, s3, 19
                  mulh         a6, s9, tp
                  and          s7, zero, t2
                  fclass.s     t2, fs5
                  fmv.w.x      ft10, s6
                  fmin.s       fs5, fs7, fs11
                  fdiv.s       fa7, ft0, fs3, rmm
                  fmax.s       fa1, fa1, fs6
                  sll          s0, gp, tp
                  srl          a1, t5, s10
                  fmin.s       fs11, fs2, fs9
                  rem          zero, s2, s2
                  fcvt.wu.s    a0, ft5, rtz
                  fcvt.s.wu    fs5, s3
                  fdiv.s       fs4, ft8, ft9, rmm
                  sltiu        a0, s0, -942
                  fle.s        zero, fs0, ft2
                  fcvt.s.wu    fs8, s10, rmm
                  or           t4, zero, t5
                  mul          s10, t5, t2
                  flt.s        t2, fa5, ft0
                  slt          a3, a6, a6
                  fdiv.s       fa6, fa3, ft10
                  ori          t2, s2, 1143
                  slli         a7, a4, 22
                  fmin.s       ft7, ft2, ft10
                  auipc        s0, 290843
                  fcvt.w.s     s7, ft8
                  ori          a4, s7, -1950
                  sll          t6, sp, a5
                  lui          s7, 999578
                  fcvt.s.wu    fa1, t3, rdn
                  fmv.x.w      a5, fs5
                  fmax.s       fs2, fa1, fs3
                  fsgnjn.s     fs8, fs6, fs7
                  srai         s11, t5, 17
                  fsqrt.s      ft9, ft6
                  xor          sp, tp, s8
                  fcvt.w.s     t0, ft5, rmm
                  srli         t3, t3, 31
                  addi         s5, s11, 207
                  flt.s        s2, fs8, ft2
                  sub          tp, a0, s6
                  fcvt.s.wu    ft2, t6
                  and          gp, s3, s9
                  and          a1, a4, t3
                  sll          s4, a3, t0
                  srai         s5, a4, 11
                  feq.s        t5, fa0, fa3
                  or           a6, t0, s3
                  fsgnjn.s     ft9, ft8, fs11
                  rem          a7, s4, ra
                  mulh         ra, a4, t4
                  lui          gp, 178227
                  slti         t1, s7, -1400
                  xori         t1, t1, -1662
                  fmin.s       fa1, fa0, ft2
                  fdiv.s       fa4, fs2, fa7
                  sltu         a3, t4, s9
                  add          t3, s4, a7
                  slt          ra, a5, t5
                  or           zero, s1, s3
                  add          a3, t0, a0
                  div          t6, a6, t1
                  fcvt.wu.s    zero, fs6, rdn
                  remu         a1, a2, sp
                  fmv.x.w      s10, fs1
                  addi         s11, s9, -1621
                  ori          gp, ra, 682
                  and          tp, s4, t2
                  add          t2, s1, t1
                  mul          ra, s11, s3
                  fsgnjn.s     ft7, fs9, fs4
                  auipc        s0, 725955
                  fle.s        s0, fs10, ft8
                  mulhu        a4, a5, a1
                  srl          s3, zero, s6
                  or           a3, s10, s6
                  nop
                  fadd.s       fa5, fa4, ft4, rtz
                  fcvt.w.s     s2, ft7
                  fle.s        t1, fs2, fa0
                  andi         t2, a6, 846
                  slti         a0, s1, 1724
                  addi         tp, zero, 590
                  srai         s4, t6, 23
                  fadd.s       fs11, fs11, fs8, rtz
                  mulh         s3, a4, sp
                  fmv.x.w      s3, fa2
                  fclass.s     s4, fs11
                  auipc        s3, 789179
                  xor          s0, a2, gp
                  sra          s4, s0, t6
                  fsgnj.s      fa0, fs0, ft1
                  mulhsu       a6, s6, zero
                  mulhsu       a1, s7, t0
                  fsqrt.s      ft0, ft9
                  fsub.s       ft8, fa3, ft5
                  fmv.w.x      fs6, a1
                  addi         zero, s3, 1263
                  fcvt.w.s     t4, ft8
                  mulhu        s3, s10, a5
                  srai         t2, s1, 11
                  div          s5, t4, a4
                  sra          s5, t2, a7
                  slti         s3, ra, -1036
                  fmin.s       fa6, ft11, ft11
                  or           a5, s8, t4
                  sll          a1, a3, a3
                  fadd.s       ft2, ft0, fs3, rmm
                  mulhsu       t0, t3, s8
                  srli         s3, t0, 11
                  mulh         s5, s3, a0
                  rem          s7, a1, s11
                  fmin.s       fs9, fs7, fa2
                  slti         gp, t3, 1084
                  remu         zero, zero, s7
                  xori         ra, a5, 1248
                  fcvt.w.s     a5, fs1, rtz
                  nop
                  slli         s11, s5, 15
                  sltu         s9, a0, s11
                  fsgnjn.s     ft10, ft3, fa1
                  fcvt.s.w     ft10, s3, rne
                  fclass.s     t4, fs3
                  rem          s10, s4, ra
                  fsub.s       ft10, fs1, ft10, rtz
                  fsgnj.s      fa5, fs10, fs9
                  sub          a6, s8, s6
                  fle.s        t4, fs11, fs0
                  addi         t6, t0, -230
                  fmul.s       ft2, ft3, fa0
                  lui          s11, 592472
                  fcvt.w.s     s11, ft5, rup
                  fmin.s       fs2, ft7, fs1
                  mulh         a4, ra, gp
                  fcvt.w.s     s9, fs5
                  div          a1, ra, zero
                  fsgnj.s      fs5, fa0, fs10
                  or           s3, t2, zero
                  mul          s1, zero, a0
                  slti         s0, t3, -988
                  sub          s4, s5, s0
                  sub          t3, gp, s10
                  andi         s9, s3, 549
                  srli         s11, s3, 19
                  sltu         s0, s8, t0
                  xor          t1, a6, s2
                  sltiu        t4, t1, 74
                  xor          t1, tp, s10
                  rem          a1, tp, t1
                  auipc        t1, 819209
                  xor          s1, a0, a2
                  rem          a1, s7, s8
                  mulhu        a7, ra, tp
                  feq.s        t1, fs4, fs7
                  flt.s        t6, fs0, fs6
                  feq.s        s2, fa5, fs11
                  andi         s7, tp, 330
                  auipc        a6, 744485
                  or           t0, s0, zero
                  fadd.s       ft6, ft7, ft8, rne
                  auipc        zero, 468081
                  div          a6, a1, s5
                  nop
                  fmv.x.w      ra, fs5
                  flt.s        s1, fs2, fa4
                  xor          s2, s8, s1
                  fmin.s       fs2, fa6, fa6
                  sub          a7, a0, zero
                  ori          t0, a0, -2014
                  srai         a0, s11, 4
                  lui          a6, 1044563
                  or           s2, tp, t2
                  slli         a3, t0, 13
                  auipc        tp, 111804
                  add          tp, s6, t2
                  lui          gp, 801312
                  xor          t6, t3, a7
                  div          t1, t5, tp
                  addi         t1, a2, 1960
                  mulhu        sp, s6, s9
                  slli         s2, ra, 18
                  addi         s2, a2, -1959
                  srl          s11, s5, a3
                  srai         t1, s4, 31
                  fcvt.w.s     t0, ft10
                  flt.s        a0, ft11, ft0
                  xori         t3, s11, 130
                  fsub.s       ft1, fs1, fa2
                  fmul.s       ft9, ft1, fa1
                  sll          a6, t1, a5
                  fsgnjx.s     fa2, ft7, ft8
                  fcvt.w.s     s3, fs6, rne
                  fsgnjn.s     fa7, fs11, ft7
                  fdiv.s       fs9, ft1, ft10
                  fadd.s       fs2, fs2, fs9, rmm
                  feq.s        s3, ft6, fs0
                  fsgnj.s      fa0, ft0, ft5
                  div          a4, t3, t2
                  addi         t0, zero, -1738
                  fmv.w.x      fs8, t0
                  fsgnj.s      fa5, fs4, fs10
                  sltu         s5, a4, a7
                  fmv.x.w      a5, ft4
                  fcvt.wu.s    a3, fa0, rne
                  divu         a1, a6, a7
                  and          t1, a4, s9
                  fsgnjx.s     ft11, fa7, fs8
                  remu         a3, sp, ra
                  div          a7, t4, s11
                  fmin.s       ft2, fs5, ft4
                  srli         t2, t2, 25
                  sltu         t2, t0, t2
                  fsgnjx.s     fs0, fs6, ft5
                  mulh         s1, t5, s5
                  fmax.s       fa7, fs9, fa4
                  or           sp, ra, s3
                  mulh         s1, t1, zero
                  fmv.w.x      ft11, a3
                  fadd.s       fs5, ft2, fs5
                  mulhsu       gp, a1, a0
                  flt.s        s2, ft2, fs11
                  fmin.s       fa5, ft9, fs9
                  fsgnj.s      fs11, fa1, fa2
                  slti         s0, ra, 539
                  fsgnjx.s     ft3, fs3, fa7
                  flt.s        a6, fa3, fa0
                  xori         s11, t4, -1121
                  fle.s        t0, fs11, ft0
                  flt.s        s2, fa0, fs6
                  fsgnjn.s     fa0, fa3, fa1
                  fsgnjn.s     fa6, fs2, fs9
                  and          s1, s1, s10
                  divu         ra, a1, t4
                  divu         s10, s8, a6
                  fmul.s       fs1, ft3, ft1, rmm
                  lui          s2, 9137
                  slti         s9, s5, -1042
                  addi         t5, sp, -386
                  divu         s4, s5, t3
                  fsgnjx.s     ft3, ft2, fa1
                  srli         tp, a0, 25
                  fcvt.s.wu    fs8, a7
                  sltu         s9, t2, t4
                  sltiu        t1, sp, -1665
                  nop
                  slt          s5, a0, a7
                  div          s11, a4, a6
                  fmin.s       fs3, fa0, fa3
                  fcvt.s.w     fa5, s6
                  fmin.s       ft9, fa0, fs5
                  add          t5, a5, a4
                  sll          s4, t1, a3
                  sll          a3, a7, s7
                  srli         a1, s1, 0
                  srl          s0, s7, ra
                  ori          a3, s6, 1195
                  xor          t3, t0, a6
                  nop
                  div          gp, s3, s11
                  andi         t6, t0, -2045
                  fcvt.w.s     gp, ft11
                  sltiu        ra, s6, -1474
                  sltiu        a0, s7, 1589
                  slt          s1, s0, a2
                  fmax.s       ft1, ft11, fa4
                  xor          a5, s7, t4
                  fmax.s       fa6, fa2, fs9
                  andi         a0, zero, -1290
                  fmin.s       fs6, fs10, ft0
                  div          t3, s2, ra
                  fle.s        t6, fs7, fs8
                  remu         s11, t1, a2
                  srai         t6, zero, 25
                  divu         s10, a7, t1
                  fmv.x.w      s0, fs8
                  srai         s7, t4, 25
                  fadd.s       fs11, ft4, fs5, rup
                  mulh         t2, s6, t0
                  fmul.s       fa0, fa1, fa2, rup
                  or           a3, s2, s9
                  srai         gp, a5, 3
                  mulhu        gp, a6, a0
                  fmv.w.x      fa6, sp
                  sub          a4, s1, s0
                  fdiv.s       fa6, fa5, ft4
                  xor          s1, t5, s7
                  slti         a0, a3, 471
                  sltu         s5, a4, t1
                  srli         a4, s3, 31
                  flt.s        a1, ft8, fs9
                  fcvt.wu.s    ra, fa5
                  sltiu        s4, tp, -535
                  div          t5, s2, t6
                  fmv.w.x      ft9, a7
                  fsgnj.s      fs5, fs8, ft5
                  sub          a1, s2, tp
                  fsub.s       fs11, ft6, ft0
                  fsgnjx.s     ft5, fs2, ft11
                  fcvt.s.w     fa3, s11, rne
                  sltu         s0, gp, s1
                  sltiu        s3, a0, -1829
                  ori          t1, a1, 885
                  slt          s5, a2, a5
                  mul          s10, ra, t3
                  nop
                  sub          gp, t2, t0
                  feq.s        s7, ft2, ft11
                  fcvt.s.wu    ft4, a4
                  div          t0, a4, s2
                  sltu         a0, a3, tp
                  fsgnj.s      fs6, fa4, ft5
                  or           s0, a4, tp
                  rem          s11, t1, a6
                  fmin.s       fa1, ft6, fa3
                  or           a7, a5, s10
                  xori         sp, s7, -1874
                  fsgnjx.s     ft5, fa1, fs0
                  mul          a6, ra, a4
                  nop
                  srl          s0, t3, a7
                  mulh         s2, s7, t0
                  nop
                  fsub.s       ft2, fs10, fs8, rdn
                  mulhu        t1, s1, t1
                  fdiv.s       ft6, fs3, fa1
                  fadd.s       fs11, ft9, fa6, rup
                  ori          t0, s10, 456
                  div          s4, gp, a2
                  add          t3, t5, s0
                  lui          t6, 164690
                  nop
                  fcvt.s.wu    ft6, a1, rtz
                  slli         s4, s6, 24
                  fmv.w.x      fs0, a4
                  sltiu        zero, s4, -1549
                  flt.s        s5, ft0, fs4
                  addi         t2, a4, 612
                  fcvt.s.wu    ft11, s3
                  srai         a1, a3, 25
                  fdiv.s       fs0, fs6, ft1
                  sra          sp, a7, s1
                  or           s3, s6, t1
                  mulhu        t3, s7, a7
                  sll          zero, s8, s3
                  fsgnj.s      ft1, fa4, ft7
                  and          s0, s4, s2
                  nop
                  addi         ra, a6, -905
                  srl          t6, a5, tp
                  srai         t4, a2, 18
                  slti         a3, a3, -2040
                  mulh         s3, s9, a6
                  xori         gp, s4, 1270
                  fcvt.s.wu    ft4, s8, rup
                  sub          a4, s0, s4
                  addi         gp, t0, 853
                  fmax.s       ft2, fa1, fs1
                  fclass.s     s2, ft5
                  fmin.s       fs11, fa5, ft3
                  andi         s5, t0, 1242
                  remu         zero, s6, a2
                  fsub.s       fs4, ft2, ft4
                  lui          zero, 811258
                  add          a1, t1, t3
                  fadd.s       fa2, fa6, fa6, rmm
                  auipc        s5, 757055
                  sub          ra, s2, a5
                  div          tp, s10, s6
                  nop
                  add          a5, a2, s6
                  sltu         a1, s7, a0
                  xori         a7, tp, -1043
                  fcvt.s.w     fa3, s8, rne
                  and          t2, a7, s10
                  div          t0, s9, t1
                  srl          t4, sp, s8
                  fmv.x.w      a6, fa3
                  fmin.s       fa0, fs3, ft1
                  fsqrt.s      fa2, fa3, rdn
                  sub          tp, s7, s7
                  srl          a0, t3, sp
                  fsgnj.s      ft10, ft1, ft7
                  fmv.w.x      fs7, t6
                  sra          s3, s6, s8
                  addi         a3, a4, 892
                  feq.s        zero, ft3, fa5
                  fmax.s       ft7, fa7, fs5
                  fadd.s       fa2, ft8, fs2, rtz
                  slti         a7, t2, -1088
                  sll          sp, s4, s8
                  srl          s2, t0, t5
                  xori         a3, s9, 314
                  flt.s        ra, fs9, fs8
                  div          a0, s6, s0
                  add          ra, s9, a3
                  fmul.s       fa3, ft4, ft6
                  srl          t2, tp, a7
                  and          ra, s3, s1
                  divu         s1, a4, zero
                  fsgnjx.s     fs4, ft4, ft9
                  fcvt.wu.s    t5, ft9
                  fsgnjn.s     fs8, ft10, ft4
                  div          s3, ra, s11
                  mul          s0, s3, s1
                  fcvt.wu.s    a0, fa7
                  fcvt.w.s     tp, fs8, rup
                  fadd.s       fs9, ft9, ft4, rmm
                  remu         t0, s0, a3
                  fsqrt.s      ft4, fa5, rdn
                  fcvt.w.s     s4, fa7
                  fmul.s       fa0, ft1, fa3
                  fcvt.w.s     s7, ft8
                  fsub.s       fs6, ft7, fs1, rdn
                  fdiv.s       fa0, fs9, fs10
                  fmul.s       fa5, fs4, fa1
                  fadd.s       fa7, fa2, fa6, rtz
                  feq.s        t2, fa2, ft2
                  remu         s3, s8, s3
                  fsub.s       ft7, fs11, fa1, rne
                  xor          s1, s7, s2
                  fsgnj.s      fa7, fs7, fs10
                  and          tp, zero, t5
                  addi         s10, s9, -71
                  sltu         a1, s1, a3
                  fmax.s       fa0, ft1, fs11
                  nop
                  fsqrt.s      ft2, fs7
                  fsqrt.s      ft4, ft8, rup
                  remu         s9, zero, s0
                  sltiu        t4, s5, 605
                  fsgnjx.s     ft4, fs5, fa2
                  feq.s        a4, ft2, fs1
                  fmv.x.w      s3, fs6
                  fsgnjx.s     ft11, ft2, fs10
                  xori         s1, ra, 323
                  addi         sp, a1, 553
                  fcvt.w.s     s10, fs10
                  fclass.s     s4, fs0
                  fmin.s       fa7, fs8, fs9
                  sll          zero, s0, zero
                  srli         s2, a6, 6
                  fclass.s     gp, ft1
                  fcvt.s.w     fs6, a1, rdn
                  srli         t4, s3, 16
                  mulhu        s4, s5, a5
                  sltu         t4, t1, s10
                  ori          s4, s3, -552
                  fsqrt.s      ft10, fa3, rtz
                  fclass.s     gp, ft6
                  xor          s2, a7, s1
                  fsqrt.s      fa5, ft9, rne
                  mulh         a7, zero, s7
                  andi         s11, s9, 25
                  fclass.s     a5, fa6
                  xor          t3, a2, a5
                  srai         s1, s0, 9
                  fsqrt.s      fa2, ft1, rtz
                  feq.s        ra, fs5, fa2
                  sll          s10, s6, t0
                  fcvt.s.w     fs3, s3, rdn
                  fsgnjx.s     fa2, fa2, ft8
                  flt.s        s9, ft2, fa5
                  fcvt.s.w     fs11, s8
                  and          t6, a2, t1
                  fmax.s       ft8, fs8, ft9
                  addi         a4, a0, 366
                  sltu         a7, zero, tp
                  fsub.s       fa3, fa2, fs3, rdn
                  rem          a5, t5, t6
                  fdiv.s       ft5, ft0, fa2
                  auipc        a6, 846899
                  slli         a1, tp, 11
                  fmv.w.x      ft11, s8
                  fdiv.s       ft0, fs6, fa3
                  lui          zero, 673752
                  slli         s7, a2, 27
                  sltiu        s1, a7, 375
                  srl          zero, gp, s0
                  fclass.s     s1, fs5
                  fsgnjn.s     fa6, fs1, fs0
                  fdiv.s       fs7, ft6, fs7
                  fcvt.w.s     s5, ft11
                  div          t6, a6, sp
                  add          a3, tp, a0
                  fadd.s       fs3, fs9, ft2, rup
                  flt.s        s10, fs6, ft3
                  fadd.s       fs2, ft0, ft9
                  fsgnjx.s     ft10, ft6, fa5
                  sll          s7, t5, t3
                  fcvt.s.wu    fs2, gp, rmm
                  divu         t1, t0, a3
                  fsqrt.s      fs0, fs9, rup
                  lui          t4, 699350
                  fmv.w.x      fa4, t1
                  slli         t3, t1, 4
                  sll          gp, s8, s0
                  fcvt.s.wu    fa2, s7, rne
                  fcvt.w.s     a5, ft6, rne
                  mulh         s0, s1, a4
                  rem          s5, s0, tp
                  sll          a3, s7, s3
                  sra          s0, a3, ra
                  flt.s        sp, ft9, fs7
                  sub          a7, t3, s3
                  sltu         s5, sp, t2
                  fmv.w.x      fa0, sp
                  slti         s5, s1, -706
                  feq.s        s10, fs2, ft5
                  fmv.x.w      a7, ft11
                  ori          t5, tp, -1754
                  xor          s3, t5, t2
                  auipc        s0, 531726
                  srai         s0, s5, 5
                  srai         a7, s8, 18
                  mul          t6, t5, t0
                  andi         zero, sp, -1109
                  fsgnjx.s     fs3, fa2, fa1
                  div          a1, s7, a6
                  rem          t2, s11, zero
                  fsub.s       ft5, ft2, fs7, rdn
                  addi         s11, s8, 942
                  xori         t6, gp, 919
                  srli         s2, t3, 0
                  fmin.s       ft7, ft1, ft4
                  add          sp, t5, s9
                  divu         t2, s7, s7
                  divu         t2, s3, a2
                  fadd.s       ft11, fa7, fs8
                  ori          s1, s0, -162
                  fcvt.wu.s    a5, ft6, rmm
                  srl          a0, t6, s0
                  srli         t2, a2, 8
                  fsgnjn.s     ft6, fa3, fa5
                  fsgnj.s      fs1, ft0, ft6
                  fsgnjn.s     fs0, fs3, ft8
                  flt.s        a7, ft4, ft5
                  fsgnjn.s     ft11, ft9, fa6
                  fmul.s       fs10, fa1, fs0
                  div          s0, ra, a3
                  fmul.s       ft5, ft1, fs11, rdn
                  fcvt.s.wu    ft1, tp, rtz
                  addi         a1, s3, 41
                  or           t0, a7, tp
                  remu         a3, s5, tp
                  remu         a5, t3, t6
                  remu         s7, s7, s11
                  remu         s11, s11, s1
                  and          a4, s7, zero
                  nop
                  fmv.x.w      s2, fs11
                  fmv.w.x      ft0, s4
                  fcvt.w.s     a1, fs2, rne
                  fsgnj.s      fa7, ft8, ft0
                  fdiv.s       fa4, fs11, ft3
                  xori         s9, s2, 364
                  add          t4, s6, s9
                  fadd.s       fs5, fs10, fs11, rup
                  srl          a3, s10, s11
                  sub          s9, t2, s3
                  sub          s3, zero, a2
                  sltiu        ra, t5, -1015
                  or           s3, s6, t4
                  fsgnjn.s     ft1, fa3, fa7
                  auipc        t1, 422025
                  xor          t0, s6, s4
                  sra          t6, s0, ra
                  fmv.w.x      fs11, s10
                  fcvt.w.s     t6, fs8
                  and          t3, s5, t4
                  xori         a4, s8, 1654
                  fsgnjn.s     ft2, ft7, ft6
                  fadd.s       fa7, fs1, fs3, rdn
                  xori         t1, s2, 522
                  fmul.s       fs4, fa0, ft1
                  fsqrt.s      ft5, fa6
                  div          ra, zero, gp
                  fle.s        s1, fa6, fa0
                  sra          t2, a2, t1
                  srai         s11, a3, 27
                  sra          s10, s1, a0
                  slt          zero, t5, a0
                  sub          a5, t1, ra
                  sltu         sp, a1, s8
                  fcvt.wu.s    t1, ft4
                  nop
                  ori          s7, a7, -2040
                  fsgnjx.s     fs7, fs3, ft9
                  slt          t1, a6, t2
                  div          a0, t3, a7
                  lui          a4, 918154
                  fsgnj.s      fs10, fs7, ft0
                  remu         a6, a4, t2
                  fadd.s       ft7, fa4, fs2
                  fcvt.wu.s    s10, fa5, rtz
                  and          s2, t3, tp
                  or           s0, a4, sp
                  srl          t3, t6, t0
                  or           zero, t6, ra
                  ori          s7, a4, -1021
                  fsgnj.s      fa7, fa3, fs10
                  sltu         gp, a7, t3
                  nop
                  fcvt.s.wu    fa0, t1, rup
                  andi         s10, t5, 2018
                  rem          a4, a3, t6
                  fmax.s       fs4, fs7, fa4
                  lui          s0, 424322
                  slli         s3, a2, 9
                  divu         s9, a6, a7
                  fcvt.s.w     ft2, t0, rdn
                  fmul.s       fs10, fs3, ft11, rne
                  xor          t1, t5, t3
                  srl          s1, zero, a4
                  addi         a0, a3, 1326
                  flt.s        a0, fs5, fs0
                  mulhu        t4, t1, t2
                  sltiu        s10, gp, -683
                  fmv.x.w      t2, ft11
                  fsqrt.s      fa1, ft2
                  srli         s3, s4, 24
                  mul          a1, s7, a7
                  srai         s3, t1, 4
                  mul          s4, a3, a2
                  mulhu        tp, zero, s8
                  fsgnjn.s     ft5, ft8, ft0
                  fmv.w.x      fs7, sp
                  feq.s        t0, ft2, ft8
                  fsgnjx.s     ft4, ft7, fa4
                  mulhsu       a3, a1, a5
                  slt          t3, t6, gp
                  sra          a3, a1, s6
                  divu         tp, s9, t5
                  add          a6, t3, a0
                  div          gp, s4, s2
                  slti         s5, t5, -1287
                  fadd.s       ft1, fa0, ft3
                  lui          s9, 862317
                  mulhu        t4, t6, gp
                  slti         s7, t0, 1127
                  sltiu        a4, s8, -1029
                  fmul.s       fs10, fs4, ft4
                  divu         gp, a3, a3
                  ori          s5, s3, -1769
                  fcvt.s.w     fs8, zero
                  rem          a7, sp, s11
                  sra          t3, s4, s3
                  and          s4, t3, gp
                  sltiu        a5, t6, 1728
                  lui          t5, 356173
                  nop
                  xor          t1, a5, a6
                  fclass.s     a5, fa5
                  mulhu        t2, s7, t6
                  or           s2, s0, a1
                  fcvt.s.wu    fs6, t0
                  fmin.s       ft7, fa0, ft2
                  fle.s        s5, ft11, fa3
                  feq.s        zero, fa2, fs7
                  fmax.s       ft1, ft3, fa5
                  slt          t4, s9, sp
                  add          t1, sp, tp
                  fsgnjn.s     ft0, ft6, fs6
                  fle.s        s1, fa6, ft2
                  sll          t4, t0, ra
                  flt.s        s1, fs4, fs10
                  fcvt.s.w     ft4, a6, rup
                  feq.s        s9, fs11, ft3
                  addi         tp, t1, -1651
                  nop
                  fclass.s     sp, fs7
                  mul          a3, a0, s8
                  lui          a5, 1046049
                  feq.s        t0, fs0, fs8
                  mul          a1, t6, s4
                  slt          s10, s10, t6
                  feq.s        a6, fs11, fs7
                  mulh         ra, s5, s7
                  div          gp, a0, t6
                  xori         t2, s11, -1946
                  lui          s2, 913555
                  mulh         a7, sp, zero
                  andi         a5, s1, -309
                  fsgnjx.s     fs5, fs0, ft1
                  mulhsu       tp, s9, s0
                  srli         s1, s2, 18
                  fadd.s       fa0, fa2, fs6, rup
                  fcvt.wu.s    t0, fa1
                  slt          zero, s5, a6
                  fle.s        s3, ft11, ft3
                  fsgnjx.s     fs9, ft9, fs3
                  srl          t4, s0, t3
                  mulhsu       s7, s8, s1
                  mul          t5, a7, a2
                  andi         a4, s3, 513
                  addi         a5, t2, -323
                  sub          a6, a4, s6
                  fmax.s       fa3, fs11, ft7
                  fmul.s       fs3, fa3, ft10, rne
                  srai         a1, a1, 15
                  lui          t5, 409598
                  lui          s7, 21098
                  add          s1, s9, t0
                  fsgnjx.s     ft1, ft6, fs10
                  srli         a7, a5, 30
                  xor          gp, t0, a7
                  mulh         s1, t5, t2
                  srl          s2, sp, s4
                  addi         s5, s3, -639
                  remu         a7, t1, s6
                  fmv.x.w      gp, fa6
                  xor          t2, gp, s10
                  div          t6, s0, gp
                  slli         s7, a2, 22
                  mulh         s1, a0, a0
                  fsgnjn.s     ft6, fa3, fs4
                  or           t4, s1, s0
                  div          s9, s9, s5
                  sltu         s3, s11, t3
                  remu         a7, a5, tp
                  andi         t0, a7, -131
                  mulhu        t6, t0, a0
                  sll          t5, a5, zero
                  and          s3, s2, t0
                  fdiv.s       ft3, ft6, fs8
                  auipc        gp, 123765
                  sltiu        s11, s4, 1901
                  rem          tp, s11, t1
                  mulhu        t2, t3, s9
                  sll          t2, s9, s5
                  xor          tp, t0, s4
                  divu         s1, a5, s0
                  lui          s11, 84233
                  nop
                  srai         s2, s8, 29
                  fsgnjx.s     fs2, ft5, ft4
                  fclass.s     zero, ft10
                  fsub.s       fa1, ft4, fa0, rdn
                  nop
                  or           s1, s7, t2
                  mulhu        t4, s8, s5
                  sltu         a4, s8, s2
                  fcvt.s.wu    fs2, t2
                  srl          a5, a6, a7
                  sll          s9, t2, s3
                  fmin.s       ft11, fa3, ft11
                  fsgnjn.s     fs1, ft10, ft11
                  slti         t3, sp, -857
                  slt          a4, t4, s9
                  fcvt.s.wu    fs6, a6
                  mulhsu       gp, sp, a5
                  fcvt.s.wu    fs6, sp
                  auipc        t3, 388163
                  xor          s3, tp, s2
                  fsgnj.s      fs5, ft10, ft6
                  fsgnj.s      fa3, fa5, fs7
                  addi         a1, s7, -1890
                  fsub.s       fs9, ft10, ft9, rdn
                  fmv.x.w      sp, ft3
                  div          t5, s3, t6
                  mul          gp, s4, t5
                  mulhu        s1, s7, a2
                  lui          s5, 551301
                  fmax.s       fa7, fs4, fs7
                  or           s1, t6, s3
                  sltiu        t3, s7, -2
                  xor          t2, t5, s2
                  fcvt.s.w     fa6, a1
                  sra          sp, gp, s0
                  sub          t1, s4, a3
                  xori         gp, s4, -1006
                  lui          s11, 1037814
                  auipc        s11, 470094
                  xor          s11, s0, a4
                  fsgnjn.s     fs3, fa1, fs6
                  fmv.x.w      t6, ft8
                  fsgnj.s      fa7, fs10, fs4
                  fle.s        s10, fs7, ft3
                  sll          s7, s4, s2
                  srli         gp, s5, 7
                  divu         t4, s6, s6
                  fle.s        sp, ft10, fs1
                  mulh         tp, a6, t5
                  fadd.s       fa5, ft6, ft11, rup
                  fmv.w.x      fa3, t6
                  feq.s        a7, fs2, ft6
                  sra          tp, gp, s1
                  nop
                  rem          t5, s4, zero
                  mulhsu       s11, t5, s11
                  fmv.x.w      t2, ft8
                  lui          tp, 674188
                  mulh         a3, s1, s9
                  xori         t2, a7, -1058
                  slti         a7, zero, -1921
                  auipc        a7, 106658
                  fmin.s       fs0, fs5, fa2
                  slt          s9, s8, tp
                  auipc        s9, 325508
                  fcvt.s.wu    ft10, a3
                  fmin.s       fs2, fa5, fa0
                  fcvt.s.wu    fs8, gp, rne
                  fsgnjx.s     fs4, fs5, fs6
                  fsqrt.s      ft9, fa3, rne
                  sll          s7, zero, t4
                  xor          t5, sp, s6
                  srai         a1, t3, 18
                  fmax.s       fa3, fs8, fa5
                  mulhu        t1, s0, s11
                  flt.s        t0, fs9, ft4
                  srl          s5, s5, s11
                  fsqrt.s      fa0, ft3
                  fmul.s       ft2, fs7, ft4, rup
                  divu         t1, ra, t4
                  feq.s        s1, fa2, ft3
                  sltiu        t3, s2, 91
                  mulhsu       a7, zero, t4
                  srl          t6, t5, t5
                  fcvt.s.wu    ft11, s2, rmm
                  fmv.w.x      fs6, s8
                  fclass.s     sp, fs6
                  remu         tp, ra, t4
                  add          s4, s5, a6
                  fmv.x.w      t0, fa7
                  fcvt.s.wu    fs5, s8
                  flt.s        sp, ft6, fa1
                  fclass.s     t2, fa3
                  fclass.s     a3, ft3
                  fcvt.wu.s    t3, fs8
                  fcvt.s.wu    fa1, t2
                  mul          a1, s6, a5
                  addi         s3, t4, -260
                  sll          s3, s3, s2
                  srai         s7, t5, 10
                  mulhsu       tp, s4, s6
                  nop
                  feq.s        t6, fs2, ft10
                  fcvt.wu.s    s11, fa0, rup
                  fcvt.wu.s    t0, fs11
                  fadd.s       ft11, fa0, ft1
                  flt.s        t2, fa7, fa2
                  srli         t5, a1, 26
                  remu         t5, s3, s4
                  nop
                  fsgnjx.s     fs8, ft3, ft1
                  mulhsu       s3, t5, t4
                  div          a4, a7, a5
                  mulhsu       s10, s4, a5
                  sll          s10, sp, t6
                  srai         a6, t3, 20
                  slti         s0, tp, 1053
                  fclass.s     gp, fs11
                  sub          s10, t1, a2
                  fmul.s       fs8, fa5, fs8, rdn
                  fmv.x.w      s0, ft4
                  flt.s        s7, ft3, ft7
                  addi         t1, t4, -15
                  fsub.s       ft11, fa3, fs6, rmm
                  fadd.s       fs0, ft7, fa2
                  mul          s3, t1, s3
                  flt.s        s3, fs11, ft4
                  fcvt.s.wu    ft5, s8, rup
                  feq.s        a3, ft2, ft7
                  fclass.s     gp, fa7
                  flt.s        t0, fs8, ft3
                  fadd.s       fa3, fa6, fs4, rtz
                  fsqrt.s      ft7, fs10, rne
                  lui          ra, 401228
                  ori          a5, s7, -753
                  add          t2, t1, s2
                  xori         a4, t4, -86
                  feq.s        s3, fa0, fs7
                  fmin.s       fa1, ft3, fs3
                  xori         a3, a1, 1954
                  slt          a0, t4, s1
                  xori         a6, s3, -927
                  fle.s        a4, ft8, fa1
                  fle.s        zero, ft1, ft9
                  slli         sp, a6, 2
                  fsgnjx.s     fs2, ft11, ft7
                  xor          a7, s6, s2
                  addi         s2, t6, -1341
                  fadd.s       fs9, ft1, fa6, rmm
                  mul          t0, s9, t3
                  add          ra, a0, s11
                  slti         t6, t1, -394
                  mul          a5, t4, t6
                  fcvt.s.wu    fa3, s2, rne
                  fsub.s       fs9, fs5, ft0, rdn
                  sltiu        a0, a3, -1326
                  mul          t6, s7, t3
                  fdiv.s       ft2, fa2, fa1
                  lui          t0, 343675
                  slli         s3, a0, 7
                  fcvt.w.s     a5, ft1, rtz
                  mulhu        sp, s8, s9
                  xori         t0, a6, 799
                  fsqrt.s      ft4, fs6
                  fsgnjx.s     ft5, ft5, fs2
                  andi         zero, sp, -1704
                  fsqrt.s      ft2, fs0
                  mulhsu       a5, s9, a7
                  fmv.w.x      fs4, gp
                  mulhu        tp, sp, a3
                  nop
                  divu         s9, t6, a7
                  mul          t5, sp, a1
                  srl          a3, s11, sp
                  divu         t2, s2, s2
                  addi         s10, a2, 1037
                  mulhu        ra, a4, t0
                  and          a4, t2, a0
                  fsgnj.s      ft5, ft4, fs3
                  fcvt.s.w     ft3, sp
                  fclass.s     tp, ft2
                  xor          s11, s7, s11
                  nop
                  fcvt.w.s     t4, fa6
                  fmul.s       ft4, ft2, fs5
                  fcvt.s.wu    fs0, t6, rtz
                  lui          s5, 822901
                  ori          a1, a3, 234
                  fsgnjn.s     fs3, fa1, ft8
                  srl          s0, s2, a3
                  remu         a7, t1, a1
                  div          a1, t1, a3
                  nop
                  fmax.s       ft11, fs1, fs8
                  srai         t0, t2, 10
                  xori         s1, a7, -17
                  and          a5, ra, a0
                  xori         a3, t2, 1339
                  or           a4, t0, a7
                  feq.s        s9, fs7, ft4
                  lui          t6, 194627
                  slti         t1, s4, -58
                  fsgnjx.s     fs10, ft8, fa6
                  fcvt.w.s     a5, fs8, rmm
                  fmul.s       fa0, fs0, fa2, rtz
                  lui          a3, 55187
                  fsqrt.s      ft0, ft6, rmm
                  fmv.x.w      s1, fa6
                  xori         s3, s7, 1151
                  srai         s0, s1, 2
                  fsgnjn.s     ft10, ft6, fs6
                  xori         s9, gp, -1425
                  slli         s11, s8, 28
                  or           a7, s2, s8
                  fdiv.s       ft8, ft2, ft4
                  fdiv.s       ft4, fs11, ft2
                  div          s1, s9, s5
                  div          t3, s8, s10
                  fmin.s       fa4, fs5, ft2
                  mulhsu       zero, s9, tp
                  fmax.s       fs3, fs7, fa4
                  fmv.w.x      fs2, zero
                  fsgnj.s      ft9, ft10, fs3
                  fadd.s       ft6, ft3, fa0
                  feq.s        t4, fs10, ft10
                  mul          s7, a6, sp
                  lui          a5, 244557
                  srl          a3, t4, t2
                  fsgnjn.s     fs5, ft2, ft9
                  mulhu        ra, s8, t2
                  div          s10, a1, a4
                  xor          t6, a6, t4
                  fsgnj.s      fa5, fs11, fs4
                  fcvt.w.s     t6, ft4, rne
                  fadd.s       fs3, fa3, fs3
                  div          s3, gp, t4
                  fcvt.wu.s    a0, fa1, rmm
                  fcvt.s.wu    fs0, s2, rdn
                  fsqrt.s      fa0, fs0, rtz
                  mulhsu       t0, s0, gp
                  mul          t0, s0, a6
                  and          s2, t1, s8
                  fadd.s       fs0, fa3, ft5
                  mul          t3, s0, a5
                  feq.s        s10, fs7, ft5
                  fcvt.s.w     ft1, s3
                  xori         t3, t3, 1991
                  fcvt.wu.s    s4, ft9, rdn
                  fadd.s       ft0, fa2, fa3
                  andi         s0, a1, -1109
                  slt          gp, s4, s9
                  sub          s5, a3, s1
                  srli         s2, zero, 25
                  auipc        t1, 61934
                  srli         sp, a4, 10
                  mul          s0, gp, s9
                  fcvt.s.w     fa5, a7
                  div          sp, tp, t5
                  rem          t3, s9, ra
                  remu         s7, s0, a5
                  fle.s        s1, ft4, fs10
                  sll          s4, s9, s11
                  auipc        t3, 161871
                  fsub.s       ft0, fs7, ft3, rne
                  slt          s2, sp, s9
                  xor          gp, s2, ra
                  fle.s        s9, fs2, fs6
                  lui          t1, 388276
                  fmv.x.w      sp, fs5
                  srai         a4, s0, 24
                  remu         s4, t2, tp
                  fclass.s     t3, fs11
                  fmv.w.x      fa1, s1
                  fmv.x.w      s0, fs7
                  fmv.w.x      fs6, t4
                  fmul.s       fs11, ft7, fa5
                  flt.s        s4, ft7, fs8
                  fsqrt.s      fa4, fa3
                  fmax.s       fa3, ft0, fs9
                  fsgnj.s      ft2, ft2, fs3
                  lui          a0, 850091
                  andi         t1, s11, 1576
                  andi         a1, a7, -755
                  slt          t4, s6, a6
                  rem          s1, s11, s3
                  fcvt.s.wu    fs2, s4, rup
                  ori          a1, a7, 1309
                  slti         t2, t0, 1001
                  slti         zero, sp, -729
                  fsub.s       fs2, fa2, ft4
                  sra          s0, a1, s10
                  fdiv.s       ft3, fs10, fa6
                  fadd.s       fs2, fa5, ft7, rmm
                  mul          s10, s2, t6
                  sub          s7, s0, a6
                  mul          tp, a4, tp
                  divu         t5, tp, s3
                  fsgnjn.s     fs2, ft8, ft7
                  fle.s        s1, fs10, fs11
                  mulh         s5, s10, s4
                  srai         gp, a6, 15
                  srli         s7, a0, 20
                  remu         tp, a3, s1
                  flt.s        s7, fs6, ft2
                  flt.s        t4, fs3, fs2
                  addi         s3, a4, -1103
                  sltu         s2, t5, a0
                  slli         ra, s7, 29
                  fmul.s       ft1, fs5, fs5, rmm
                  mul          tp, a6, a4
                  feq.s        t5, fa2, fa5
                  mulhsu       s9, s7, a4
                  fle.s        s9, fa4, ft2
                  sra          a0, a4, s2
                  ori          s9, a4, -1879
                  srai         s1, a6, 23
                  slli         a4, t6, 21
                  fsgnjn.s     ft10, ft10, ft2
                  fsub.s       fs4, ft6, fs6
                  flt.s        s4, fs11, fs5
                  srli         s7, s7, 18
                  fcvt.s.wu    fs2, a0, rne
                  rem          a5, zero, s6
                  fmax.s       fs9, ft3, fa2
                  fsgnjx.s     fs6, fs0, fs5
                  fsgnj.s      ft4, fa7, ft6
                  andi         s2, sp, 994
                  mul          s7, tp, sp
                  mul          s0, s4, s2
                  fcvt.w.s     s10, fa4, rtz
                  feq.s        s3, fa2, fa4
                  andi         a6, s6, 773
                  sub          t1, s10, a1
                  ori          gp, a7, 791
                  slli         t0, a5, 21
                  fcvt.wu.s    a3, fa4
                  mulhu        a0, a1, t4
                  sll          s11, gp, s10
                  sll          a7, s2, s9
                  fcvt.s.w     fs0, s6, rtz
                  fmul.s       fs6, fs10, fs3, rtz
                  sll          zero, a3, s1
                  feq.s        t2, fs5, ft6
                  srl          a0, s10, a6
                  sub          a3, t6, a3
                  andi         s0, t4, 1462
                  fclass.s     t6, fs9
                  fsgnjx.s     fs1, fs1, ft9
                  mulhsu       s9, a4, a4
                  ori          a7, a2, -1058
                  fle.s        zero, fs2, fa2
                  xor          a4, s10, zero
                  xori         s2, a4, -378
                  srai         t5, gp, 26
                  fclass.s     a7, fs9
                  fmv.w.x      ft8, t1
                  fmul.s       fs10, fa2, ft9
                  xor          tp, tp, s9
                  fsgnj.s      fs10, fs2, fs9
                  fmv.x.w      a3, ft0
                  auipc        t6, 956005
                  add          a0, a3, t2
                  fcvt.s.w     ft4, zero, rmm
                  sll          tp, a2, t2
                  mulhsu       gp, s0, a7
                  divu         zero, s5, t2
                  divu         a1, t5, t3
                  or           t1, s10, a6
                  andi         a5, s7, -1975
                  fsqrt.s      ft5, fs10, rup
                  slt          sp, a7, s8
                  fmv.w.x      fs3, sp
                  fmax.s       fs9, fa3, ft4
                  fle.s        s5, fs3, ft9
                  andi         t4, s8, 127
                  fmax.s       ft3, fs2, fs6
                  fcvt.s.w     fa1, s8, rtz
                  fdiv.s       fs7, fs3, fs0
                  srl          t5, s9, t1
                  fsgnj.s      fa2, ft10, fa2
                  sltiu        t6, s1, -645
                  srli         a0, a6, 20
                  fsgnj.s      fa4, fs1, fs8
                  xor          t4, ra, s6
                  or           ra, t1, s5
                  fcvt.wu.s    a1, fa1, rmm
                  add          t0, a3, sp
                  xor          s5, t6, t4
                  sltu         a4, s2, s5
                  mulhu        a4, s4, a2
                  fle.s        s11, fs7, ft3
                  andi         s1, a1, -1322
                  sltiu        s0, s6, -909
                  srli         s11, t0, 0
                  flt.s        tp, fa1, fs6
                  srli         s3, s5, 20
                  slti         s1, t1, 692
                  srli         a0, t3, 12
                  add          a0, ra, a5
                  div          t1, s1, a1
                  fmv.w.x      fa1, t2
                  div          gp, t2, s7
                  div          t1, a4, a2
                  sll          a4, a2, s11
                  slti         s7, t3, 1156
                  sub          sp, a4, t1
                  fcvt.wu.s    s5, ft6, rtz
                  rem          t4, s3, s10
                  or           t4, gp, s7
                  fadd.s       fs0, fs10, ft5
                  fsgnjn.s     ft0, fs2, ft11
                  fsub.s       fa6, ft1, fs6
                  fsub.s       fs0, fa2, ft5, rne
                  fcvt.wu.s    a0, ft3, rmm
                  fmax.s       fs6, fs2, ft7
                  slt          a7, s1, t0
                  mulhu        s10, s8, a7
                  nop
                  feq.s        zero, ft7, fa1
                  rem          s5, sp, a3
                  lui          s5, 924393
                  fsgnj.s      fs3, ft5, ft2
                  and          s9, s2, a3
                  or           a1, a0, s9
                  slt          a7, s9, gp
                  ori          s2, s2, -1468
                  lui          a1, 38692
                  fsgnj.s      fa5, fs9, fa1
                  ori          s10, t1, -1148
                  feq.s        s2, fs3, ft9
                  slti         t4, t2, 1995
                  mulh         s10, a6, s6
                  slt          t3, s5, ra
                  or           a1, t0, t0
                  srai         a1, s1, 5
                  auipc        tp, 356309
                  feq.s        s0, ft3, fa6
                  xor          a4, a1, t3
                  slt          a4, a1, t3
                  fsqrt.s      fa7, fs2, rne
                  fsub.s       ft2, ft5, fs0
                  fclass.s     a6, ft11
                  fsqrt.s      fs11, fs3, rdn
                  fcvt.s.wu    fa3, a7
                  fsgnj.s      fa1, ft2, fs4
                  mulhu        gp, s3, s10
                  sub          t0, s6, a0
                  sltu         s10, a4, t6
                  fmul.s       fs8, fs8, ft2, rdn
                  xori         s5, ra, -1431
                  and          a7, t6, t3
                  fsub.s       fs5, fa2, ft0
                  ori          s4, zero, 1272
                  fadd.s       fa2, fa4, fa1
                  fmv.w.x      fa5, s11
                  sltu         t3, a6, s6
                  fsgnjn.s     fs1, ft10, ft9
                  fmax.s       ft1, fa2, ft11
                  div          s3, s1, s6
                  fcvt.s.wu    ft11, t3, rdn
                  rem          s2, t2, t1
                  sll          tp, t6, tp
                  auipc        t2, 253423
                  fsgnj.s      ft1, fa4, fa2
                  srai         tp, a1, 28
                  xor          a1, a0, a5
                  ori          s1, s9, -690
                  xori         ra, a6, 1817
                  slti         s4, a1, -637
                  fcvt.w.s     t1, fa5, rmm
                  fmax.s       fs2, fa5, fa3
                  add          t6, s8, a4
                  slti         a6, a6, -743
                  divu         a1, zero, s4
                  fcvt.w.s     a1, fs7, rne
                  sltu         a7, a1, t4
                  lui          s11, 562467
                  and          a3, a1, t0
                  fsub.s       fs7, ft9, fa0, rne
                  fcvt.w.s     a3, fa1
                  fsgnj.s      ft0, fa6, fs8
                  fsqrt.s      fs9, fs8
                  fmin.s       ft9, ft2, ft6
                  slli         s3, a7, 23
                  feq.s        t2, fa3, fa7
                  fcvt.s.w     fa0, a1
                  fmin.s       fs10, fa0, fs1
                  remu         s2, a0, zero
                  slt          ra, a4, sp
                  fmv.x.w      a6, fa0
                  mul          t5, s0, a5
                  remu         gp, a4, ra
                  sra          s2, t3, s9
                  fcvt.s.w     fa3, s1, rmm
                  xor          s3, s9, a2
                  auipc        t0, 532946
                  srai         s11, t0, 18
                  rem          a7, s5, t3
                  mulhsu       s7, s1, a5
                  slli         gp, t0, 14
                  srai         t0, tp, 0
                  lui          t1, 430131
                  sub          a5, t4, s4
                  fsqrt.s      fs7, fs8, rtz
                  sltiu        t0, t1, 2015
                  fclass.s     s10, fs8
                  or           s3, s8, s7
                  fmax.s       fs4, fs5, ft3
                  sltiu        gp, tp, -1737
                  and          s0, s0, t1
                  add          a0, gp, s8
                  sll          a4, s9, s10
                  srli         s2, s4, 26
                  fmul.s       fa5, fs7, ft2
                  fdiv.s       ft1, fs11, ft5
                  fmul.s       fs5, fa1, ft6
                  sll          tp, t3, t1
                  sub          s0, t1, t0
                  mulhu        t2, a1, a1
                  slli         s9, s0, 28
                  remu         s4, s8, a5
                  fsqrt.s      fs10, fs7
                  rem          s0, a6, s8
                  mulhu        a0, s8, s4
                  mulhsu       s5, s11, s7
                  sltu         sp, t6, a7
                  fmax.s       fs10, ft10, ft6
                  feq.s        gp, fs6, fa5
                  fsgnjx.s     fa7, fs10, fs8
                  sll          s3, a6, t0
                  mulhu        tp, s0, s2
                  slli         a1, s2, 17
                  divu         s1, a7, t2
                  fsgnjn.s     ft9, fa5, fs11
                  sra          a1, a0, s5
                  srl          s0, sp, t0
                  remu         sp, s10, t4
                  srai         a1, a4, 9
                  srl          t6, tp, gp
                  add          s10, s3, a3
                  srl          s11, s5, s9
                  srai         t4, s1, 1
                  fcvt.s.wu    fa1, a5
                  andi         a6, ra, 1922
                  andi         a3, s8, -2038
                  mulhu        tp, s1, s7
                  fmin.s       fs11, fa6, fs0
                  sltiu        ra, s6, 1493
                  fmv.x.w      a5, fs6
                  sltu         s5, s8, t3
                  remu         a3, a2, s10
                  addi         t6, t5, -2008
                  mulhsu       zero, s0, s10
                  fsgnjx.s     fa4, ft7, fs0
                  ori          sp, tp, -590
                  fmax.s       fs9, fs1, ft6
                  srli         s2, t4, 24
                  sub          a7, t5, a7
                  xor          a3, s5, s4
                  sltiu        t5, t3, 467
                  fmin.s       ft4, fa7, ft0
                  srl          s7, t5, s9
                  xori         a1, ra, -1446
                  mulh         a7, zero, s11
                  fsgnj.s      fa4, ft11, fa5
                  feq.s        a7, ft6, ft3
                  ori          t6, s2, -1912
                  xor          gp, gp, a1
                  fsub.s       fs1, fa0, ft2, rdn
                  srli         a3, s10, 28
                  nop
                  srli         a1, t5, 28
                  sra          a1, a7, s3
                  slli         a1, t5, 23
                  xor          t4, t5, t3
                  sll          s2, t5, t6
                  srai         t5, s4, 18
                  fmin.s       fs11, ft7, ft7
                  addi         tp, a5, 1089
                  fle.s        t5, fa2, ft1
                  fmax.s       fa2, fs5, fa7
                  fcvt.s.wu    fa0, t3, rtz
                  xor          s9, s8, t3
                  mul          s0, a2, ra
                  auipc        s4, 699459
                  flt.s        t0, fs1, ft4
                  fmin.s       ft11, ft2, fs5
                  or           gp, gp, a2
                  divu         a0, a0, s11
                  fmax.s       fa2, ft5, fs0
                  fmin.s       ft4, ft10, fs3
                  sra          sp, sp, s2
                  sub          a0, s5, s6
                  fmv.x.w      s0, fs8
                  fle.s        a4, fs9, fs8
                  div          s3, t1, ra
                  fmv.x.w      s4, ft5
                  nop
                  srli         sp, s2, 30
                  rem          s2, a4, a4
                  fadd.s       fs11, fs5, fs5, rup
                  fmax.s       fs3, ft7, fs9
                  and          a6, s7, a5
                  fcvt.w.s     t2, ft0
                  sltiu        t3, s9, 969
                  addi         t5, t6, -1490
                  fmv.w.x      ft7, tp
                  xori         s3, ra, 330
                  fcvt.wu.s    a0, fa0
                  slli         s3, a6, 31
                  lui          a6, 472458
                  remu         s2, sp, a4
                  fmin.s       fa5, ft2, fa4
                  fmul.s       fa3, fs11, ft4
                  addi         s5, gp, -722
                  fle.s        a3, fs5, fs1
                  mulh         t5, a2, a6
                  sub          s11, t4, a7
                  fcvt.w.s     zero, fs8
                  div          ra, s5, s11
                  sll          s0, s4, t5
                  fadd.s       fa0, fs0, fa6, rtz
                  feq.s        a7, ft0, ft1
                  fle.s        sp, fs4, fs10
                  fmin.s       fs6, ft9, ft8
                  sra          tp, s7, t5
                  fsqrt.s      ft11, ft2
                  fcvt.s.w     ft6, s9, rup
                  feq.s        t3, fs4, fa3
                  xor          t4, zero, a5
                  fsqrt.s      fs9, ft8
                  auipc        s10, 752552
                  mul          s2, gp, t1
                  mul          t3, s11, s3
                  fadd.s       ft6, ft3, fs4
                  fmax.s       fs11, fa6, fs0
                  rem          t0, a7, a3
                  nop
                  auipc        a1, 761307
                  fsgnjx.s     ft3, ft2, fs6
                  remu         t5, a6, a5
                  fdiv.s       ft8, ft10, fs9
                  add          t1, gp, t6
                  or           sp, s6, s3
                  flt.s        t5, ft9, fs5
                  or           a1, s8, s1
                  rem          s0, s10, t6
                  fsgnjx.s     fs9, fa0, ft11
                  xor          t2, t3, t3
                  fcvt.s.w     ft3, a4
                  or           t2, ra, t4
                  lui          s3, 339355
                  sll          a3, t1, s5
                  mulhu        gp, s9, s7
                  nop
                  addi         s5, sp, -432
                  fsgnjn.s     fa5, ft10, ft8
                  flt.s        t3, fa2, ft8
                  slli         ra, a4, 22
                  srl          t5, a1, a7
                  nop
                  div          s4, a3, a3
                  sra          a6, s9, a3
                  add          tp, s11, s3
                  andi         a5, a2, 1631
                  fsqrt.s      ft1, fa7
                  fsgnj.s      ft11, ft7, fs0
                  ori          s5, s0, 1804
                  mulhu        tp, s9, s9
                  fclass.s     a4, ft6
                  andi         t6, a7, -1268
                  xori         t3, s7, 540
                  auipc        a4, 25809
                  lui          s0, 514729
                  fmin.s       fs9, fa0, fs7
                  sll          s7, s2, t3
                  lui          a3, 1000826
                  sra          s0, a2, s4
                  mulhu        s0, tp, a4
                  fsgnj.s      fa0, fs6, fs0
                  fsgnj.s      fs5, fa6, fs8
                  fle.s        a4, ft10, fs10
                  fclass.s     s1, fa4
                  slli         gp, ra, 22
                  xori         s4, sp, 1061
                  sltu         s4, s11, s6
                  flt.s        s3, ft2, ft11
                  andi         a4, a1, 314
                  slt          s3, tp, s10
                  mul          t0, t4, s7
                  flt.s        t0, ft10, ft4
                  or           s7, s10, zero
                  fcvt.wu.s    t2, fa5
                  add          a3, t6, ra
                  lui          a1, 296447
                  div          a4, tp, a0
                  mulhsu       t1, s5, tp
                  xori         s10, t2, 2024
                  flt.s        a0, fs1, fa6
                  fmin.s       ft10, fs6, fs7
                  ori          s10, a5, 1439
                  fmax.s       fs6, ft0, fs11
                  fcvt.s.wu    fa3, s8
                  fadd.s       ft6, fs7, fs10
                  remu         a7, t5, a3
                  fle.s        t1, fs6, ft0
                  fle.s        t1, fs8, ft7
                  fsgnjx.s     fa6, ft5, ft9
                  fsub.s       fs1, fs4, ft1
                  fcvt.w.s     tp, fa0, rup
                  mulhsu       a7, a0, zero
                  flt.s        sp, fs6, ft2
                  fsqrt.s      ft2, fs0
                  sra          a6, ra, tp
                  fsgnj.s      fa3, fs3, ft9
                  fcvt.wu.s    s10, fa5
                  addi         t6, s11, -1305
                  fsqrt.s      fs1, ft3, rdn
                  fmv.x.w      tp, fs9
                  add          t0, s11, ra
                  xori         a1, s11, 1862
                  feq.s        t0, fs0, ft1
                  ori          t6, t1, -1022
                  fcvt.wu.s    s10, fs3, rdn
                  fmax.s       fs1, ft5, ft11
                  xori         a7, zero, -253
                  and          tp, t3, s6
                  fmv.w.x      fa0, s7
                  mulhsu       t6, t2, ra
                  fmin.s       ft3, ft9, fa6
                  feq.s        t6, ft5, fa0
                  and          t4, gp, s6
                  or           t0, s0, s6
                  slt          s3, s7, t6
                  sub          t6, gp, s6
                  fsub.s       fa7, ft6, ft7, rne
                  xor          a3, s0, s6
                  divu         s0, t1, t0
                  slt          s7, gp, s9
                  lui          s5, 531977
                  fcvt.wu.s    a4, fs3
                  sll          s11, t6, t1
                  nop
                  remu         s4, a1, s8
                  remu         a4, t1, a2
                  fcvt.s.w     fs2, t5
                  srl          a3, ra, a0
                  sltiu        s9, t1, 221
                  fle.s        t5, fs9, fa4
                  fsub.s       fs10, fs7, fs2, rtz
                  sltiu        zero, zero, 1143
                  srai         s10, sp, 1
                  mulhu        s3, zero, ra
                  mulh         ra, s3, a0
                  srl          t1, a4, s9
                  fsqrt.s      fa4, fs3, rmm
                  fsgnj.s      ft9, ft8, fs3
                  remu         a3, a0, s5
                  fsgnjn.s     fa1, ft4, ft8
                  feq.s        t3, fa2, ft6
                  fclass.s     t4, ft4
                  divu         s5, zero, ra
                  fle.s        s4, ft4, ft8
                  xori         s5, s4, -1466
                  mulhu        gp, zero, t2
                  div          t0, s7, t6
                  auipc        a7, 622845
                  fsgnj.s      ft4, fs8, fs2
                  ori          s4, a6, -197
                  ori          t2, s7, -416
                  fmv.w.x      fa7, a0
                  mulhsu       ra, t2, t0
                  slt          t4, s7, a5
                  xori         t3, a1, -1483
                  fcvt.s.w     ft3, t3
                  lui          t5, 565614
                  lui          s1, 614207
                  fcvt.s.wu    fa0, t4, rtz
                  sra          t2, zero, s4
                  srai         ra, a5, 15
                  add          s0, t3, a0
                  mulhsu       t1, t1, t5
                  fsgnj.s      fs10, fa4, ft10
                  fsgnjn.s     fa5, fs8, fa1
                  sltiu        t2, t3, -1529
                  fdiv.s       ft0, fa3, fs9
                  fcvt.wu.s    s4, fs11, rmm
                  fclass.s     tp, ft2
                  fmv.x.w      s4, fa7
                  mul          t4, sp, a7
                  fsqrt.s      ft7, fa0
                  fsgnjn.s     fs8, ft4, fa2
                  slt          s7, t0, s6
                  auipc        a5, 280663
                  sub          a4, s0, s7
                  nop
                  add          t6, ra, s2
                  sltu         tp, a0, zero
                  fadd.s       fa1, fs11, ft8, rne
                  lui          gp, 1006149
                  feq.s        t3, fa4, fs1
                  fcvt.w.s     gp, ft5
                  fsgnjx.s     ft8, ft2, ft6
                  fadd.s       fs2, ft7, fs3
                  srai         t0, t6, 5
                  srli         s9, gp, 12
                  rem          s5, t5, zero
                  fmv.x.w      s9, fa6
                  sra          a0, a7, s3
                  and          sp, sp, a6
                  div          a7, a0, a4
                  fsqrt.s      fs2, fa6, rne
                  fsgnj.s      fs4, ft11, fs1
                  addi         s3, s7, 1586
                  fsgnjx.s     fs3, ft2, fa0
                  andi         gp, s4, -254
                  andi         a5, s4, 552
                  fsqrt.s      fs6, ft6
                  or           t0, s9, s5
                  mul          t0, t3, a6
                  sra          a7, s0, sp
                  xori         s7, s10, -1237
                  fcvt.s.wu    fs2, s6, rne
                  fmax.s       fs2, ft3, ft11
                  fmin.s       ft1, fs3, fs8
                  srli         s2, t3, 26
                  sltiu        s9, s1, 1405
                  fmin.s       ft1, ft4, ft9
                  remu         s11, gp, s2
                  add          t6, s1, a4
                  xor          s7, s10, t1
                  div          s0, tp, s3
                  auipc        t4, 706772
                  fmv.x.w      a0, ft8
                  srli         a4, t5, 2
                  and          t6, a6, t2
                  rem          a6, s5, gp
                  mulhsu       ra, t0, s8
                  fcvt.w.s     sp, fs7, rup
                  fdiv.s       fa4, ft4, ft3
                  fcvt.wu.s    t5, fs5
                  auipc        sp, 955413
                  srai         s4, t3, 9
                  slli         tp, s5, 31
                  sll          s0, s9, ra
                  sub          s5, s6, s10
                  lui          s9, 88045
                  mulh         a0, zero, tp
                  sll          t4, sp, t0
                  nop
                  fsgnj.s      ft1, fs1, fa0
                  fsqrt.s      ft2, ft10, rmm
                  rem          t0, s6, zero
                  slti         s5, ra, 233
                  slti         t1, s4, 1367
                  fsub.s       ft7, ft0, ft7
                  fsqrt.s      fs9, ft2, rmm
                  fmul.s       ft10, ft6, fs4
                  and          t4, a3, s8
                  fclass.s     t1, fs5
                  sll          t2, s10, t1
                  or           t5, t0, a2
                  divu         s0, s6, a2
                  fcvt.s.wu    ft11, s3
                  srli         tp, s2, 14
                  fle.s        s0, ft3, fs4
                  fcvt.wu.s    gp, fa3
                  remu         a1, s9, s4
                  remu         a1, t1, zero
                  fadd.s       fs8, ft9, fs0, rne
                  fmax.s       fs8, fa6, fs6
                  remu         tp, t3, t0
                  sub          s3, s8, a6
                  fcvt.s.wu    fa4, t3, rdn
                  fcvt.s.wu    ft7, s11
                  fmin.s       ft6, ft3, fa1
                  or           t0, t0, gp
                  add          t4, s0, gp
                  fmv.x.w      s1, fs4
                  fmin.s       ft9, ft11, fs4
                  mulhsu       t1, t1, s1
                  fdiv.s       fa2, fs1, ft10, rup
                  fsgnj.s      fs5, fs2, fs4
                  fsub.s       fs4, ft11, fs6, rne
                  fsgnjn.s     fa1, fa7, fa7
                  fmv.w.x      fs11, s8
                  add          s9, t5, s4
                  fsgnjx.s     ft8, fs2, ft0
                  remu         a1, t5, a2
                  divu         sp, s8, s8
                  mulhu        a5, ra, t2
                  add          gp, a6, s8
                  mulhsu       t3, a6, a3
                  auipc        t1, 788165
                  mul          t1, sp, s5
                  fsgnjx.s     fs5, fa4, ft6
                  fsgnjx.s     ft10, fa3, ft8
                  fmul.s       fs10, ft9, fa0
                  srai         tp, t2, 16
                  srli         a6, s6, 14
                  slti         a6, s2, -1087
                  mul          a1, a3, t1
                  mulh         t1, t0, s6
                  remu         s2, a3, a7
                  and          s2, a5, s0
                  addi         s2, zero, -1493
                  fmv.x.w      a7, ft11
                  fmv.x.w      a7, ft0
                  mul          s2, a7, t6
                  fcvt.w.s     t6, fs3
                  fcvt.w.s     tp, fa3, rmm
                  fle.s        tp, fs6, fs9
                  fsgnjn.s     fa1, ft2, ft4
                  andi         s2, s11, 1005
                  mul          t5, t0, s7
                  slt          t6, t2, zero
                  fcvt.wu.s    a0, fs2
                  sub          t0, gp, sp
                  add          sp, gp, t5
                  slt          a1, t1, s3
                  fdiv.s       fs7, fs0, fa4, rne
                  sub          s1, s4, zero
                  fmv.w.x      ft5, s9
                  add          t5, s8, t3
                  sra          a4, t4, a3
                  fclass.s     s11, ft5
                  fclass.s     a3, fs5
                  feq.s        s3, ft0, fs2
                  div          s1, zero, a6
                  slli         a4, sp, 14
                  slli         ra, s3, 30
                  sub          t2, s3, tp
                  div          s0, t2, s3
                  sub          a5, a1, sp
                  divu         s0, a0, s6
                  fdiv.s       fa2, ft3, fa2, rne
                  fsgnj.s      fs2, ft11, ft9
                  lui          t0, 352454
                  ori          t2, a0, 1311
                  feq.s        s5, fa3, ft8
                  and          t4, s2, s10
                  fcvt.wu.s    a5, ft0
                  fsgnjn.s     fa2, ft9, fa5
                  feq.s        t4, fs9, fa2
                  fadd.s       fa3, fs8, ft3
                  flt.s        t0, fs6, ft4
                  remu         t0, a0, t4
                  rem          s2, a6, s7
                  lui          t5, 764642
                  flt.s        s4, fs8, fa3
                  or           a0, t4, t3
                  rem          s2, a3, s8
                  sltu         a7, sp, s9
                  fmin.s       fs5, fa2, fa7
                  divu         sp, a0, a5
                  auipc        t3, 229379
                  fsgnjn.s     fs11, fs7, fs10
                  fmin.s       fs3, fs11, fs8
                  srli         a0, s8, 12
                  ori          s11, a7, 262
                  fcvt.s.w     fa1, t4, rup
                  fclass.s     s10, fs4
                  fcvt.w.s     s11, fa2
                  fcvt.w.s     s4, ft6
                  slli         t1, a1, 30
                  auipc        t0, 946735
                  fsgnj.s      fs1, ft6, ft9
                  mulhsu       s5, gp, a4
                  srai         t3, s8, 24
                  fsgnj.s      fa4, fs8, ft5
                  fmul.s       fa6, ft0, ft2, rup
                  divu         a6, zero, s5
                  sub          t0, t6, t0
                  slt          t6, t0, a2
                  fmul.s       ft3, fs11, ft0, rmm
                  divu         gp, a0, a7
                  fsqrt.s      fs5, ft4, rne
                  slt          t6, sp, a5
                  srai         gp, a2, 0
                  sltiu        t4, zero, -948
                  fsgnjn.s     ft10, ft9, fs0
                  lui          t3, 575074
                  sra          s5, s2, a3
                  slt          t2, a5, s7
                  fmin.s       fa7, fa5, fs3
                  fadd.s       fs2, ft9, fa1, rup
                  addi         s3, t0, 1000
                  fcvt.s.wu    ft4, t1, rne
                  fmv.w.x      ft5, t5
                  sltu         s9, s11, t1
                  mul          a7, s6, a1
                  fmv.x.w      s9, ft3
                  rem          s10, s11, s7
                  fdiv.s       fs5, ft8, ft10, rne
                  or           sp, zero, s5
                  remu         s10, a2, s3
                  nop
                  fmin.s       fs6, fs5, ft2
                  or           s1, sp, tp
                  slt          a7, s0, ra
                  fsub.s       fs0, fs6, fs5, rtz
                  flt.s        t4, fs0, ft3
                  flt.s        s10, fa1, fs4
                  sltiu        a5, s0, -1697
                  mul          gp, s8, s9
                  and          sp, sp, a4
                  div          tp, s6, t4
                  ori          s0, s1, -308
                  fmin.s       fs4, fs3, fa4
                  flt.s        s9, fs10, ft2
                  fsub.s       fs1, fs7, fs7
                  div          t6, t5, s9
                  mulhu        s9, t6, t0
                  flt.s        s9, fs2, fs6
                  flt.s        t2, ft11, fa0
                  fmv.w.x      fs1, s9
                  fsgnj.s      fa1, fa1, ft7
                  fmv.x.w      t1, fs7
                  fle.s        a3, ft4, ft11
                  divu         t4, s9, s11
                  fsgnjx.s     fa2, ft9, fs2
                  add          s5, a0, s2
                  slti         s4, s3, -1730
                  mulh         t1, s4, t5
                  fsgnjx.s     fs8, fa6, ft6
                  sub          s5, s10, s7
                  srl          t2, t4, s9
                  fcvt.s.w     fa1, s3, rtz
                  fmv.x.w      t0, fs8
                  mul          t6, a4, a5
                  xor          t6, s7, a6
                  sltu         a0, s4, s8
                  slli         t6, a4, 27
                  fmin.s       ft4, fs4, fa0
                  srl          zero, t4, t5
                  divu         s11, a0, t3
                  mul          s2, s11, s7
                  sra          t6, s5, a5
                  fsqrt.s      ft11, fs8, rne
                  or           ra, t3, a0
                  fsqrt.s      fs8, ft8, rup
                  feq.s        s3, fs3, ft4
                  fle.s        tp, fs11, fs9
                  divu         s9, s9, s7
                  xor          t0, a0, a4
                  fcvt.s.w     ft0, t3
                  andi         t5, s9, 382
                  srai         a3, s4, 8
                  slli         s2, s4, 5
                  mulhsu       s5, s10, a0
                  sra          s2, t5, a2
                  fcvt.s.wu    ft6, s0
                  ori          s2, s9, 1423
                  slli         s3, a1, 5
                  sltiu        a5, t3, 668
                  slt          s10, ra, a6
                  fmin.s       fa4, fa4, fs0
                  mulhsu       zero, a5, s1
                  ori          t1, t3, 421
                  fmax.s       fs3, ft1, fa3
                  slt          sp, gp, t6
                  fadd.s       fa0, ft10, fs7, rmm
                  sll          a6, zero, s11
                  fle.s        t4, ft8, ft1
                  fclass.s     s10, ft2
                  xor          ra, s4, t3
                  sltu         s2, a0, zero
                  mul          t3, a6, s5
                  slli         t4, t5, 24
                  addi         a5, s5, -542
                  sra          t0, a2, s9
                  sra          sp, s11, sp
                  lui          s5, 484409
                  fcvt.wu.s    s10, ft8, rne
                  rem          t3, t2, s0
                  sll          ra, s1, s6
                  divu         s10, t5, t2
                  fcvt.s.wu    fs8, a1
                  slti         a7, s11, 58
                  xori         zero, s4, -1017
                  remu         a1, a0, a3
                  slli         t4, s0, 17
                  fcvt.s.wu    fa6, t2, rmm
                  fle.s        a6, ft0, fs4
                  fcvt.s.wu    fs1, a7, rne
                  slti         s9, s7, -864
                  nop
                  fcvt.s.wu    fa5, a4
                  fsgnjn.s     fa4, fa7, fs3
                  fcvt.s.w     fs2, s2
                  fle.s        a6, fa6, fs1
                  fsgnjx.s     fs7, fs6, fa2
                  fsgnjx.s     ft3, fs5, fs7
                  fle.s        t6, ft11, ft9
                  mulhsu       s2, a7, s9
                  srl          t3, s3, tp
                  fle.s        a4, fs7, ft8
                  srl          sp, s7, sp
                  fdiv.s       ft8, fa3, ft5
                  fle.s        gp, ft9, fa6
                  nop
                  srai         t2, s1, 31
                  fmax.s       fa5, ft10, fs11
                  slt          a3, a7, gp
                  nop
                  rem          s5, a3, t1
                  fsgnjx.s     fs8, ft0, fa5
                  slli         sp, s10, 9
                  mulh         sp, s7, s8
                  slt          a4, s6, a0
                  mulh         a0, t3, t6
                  rem          s4, tp, t5
                  fsub.s       ft2, fs6, fs8, rtz
                  srai         t0, s6, 31
                  divu         t3, s2, s7
                  fsgnjn.s     ft2, ft10, fs8
                  slti         a1, s4, -409
                  feq.s        s3, ft5, ft9
                  mulhsu       s4, s8, t5
                  fmul.s       ft4, fa1, fs9
                  fsgnjx.s     ft10, fa3, fs0
                  fmul.s       fa1, fs11, ft7, rmm
                  fcvt.wu.s    t4, ft7
                  addi         s10, a6, -708
                  fcvt.w.s     s3, ft10, rne
                  rem          s7, a2, a6
                  fcvt.s.w     fa6, a6
                  fsub.s       ft5, ft4, ft8
                  fmax.s       ft9, fa0, fs4
                  fsgnjn.s     fs8, ft11, fs5
                  fdiv.s       fa3, fs11, fa5
                  mulhsu       s1, s6, a6
                  slti         t2, s6, -678
                  srl          s4, t4, s7
                  fsgnjx.s     fa4, fs6, fs10
                  mulh         s1, t4, s11
                  add          t3, tp, s11
                  ori          s1, s11, -1045
                  flt.s        s4, fa6, ft4
                  fsub.s       ft10, ft9, fa3
                  srli         s3, t5, 13
                  slti         a5, a2, -1948
                  sub          t6, s5, s2
                  feq.s        a5, fs9, fs7
                  feq.s        t6, fs10, fs6
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
mmode_intr_vector_1:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_2:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_3:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_4:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_5:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_6:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_7:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_8:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_9:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_10:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_11:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_12:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_13:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_14:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

mmode_intr_vector_15:
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  j mmode_intr_handler
                  1: la x24, test_done
                  jalr x0, x24, 0

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
                  addi x22, x22, -4
                  sw  x12, (x22)
                  add x12, x22, zero
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
                  add x22, x12, zero
                  csrr x27, 0x341 # MEPC
                  csrr x27, 0x342 # MCAUSE
                  li x31, 0x3 # BREAKPOINT
                  beq x27, x31, ebreak_handler
                  li x31, 0x8 # ECALL_UMODE
                  beq x27, x31, ecall_handler
                  li x31, 0x9 # ECALL_SMODE
                  beq x27, x31, ecall_handler
                  li x31, 0xb # ECALL_MMODE
                  beq x27, x31, ecall_handler
                  li x31, 0x1
                  beq x27, x31, instr_fault_handler
                  li x31, 0x5
                  beq x27, x31, load_fault_handler
                  li x31, 0x7
                  beq x27, x31, store_fault_handler
                  li x31, 0xc
                  beq x27, x31, pt_fault_handler
                  li x31, 0xd
                  beq x27, x31, pt_fault_handler
                  li x31, 0xf
                  beq x27, x31, pt_fault_handler
                  li x31, 0x2 # ILLEGAL_INSTRUCTION
                  beq x27, x31, illegal_instr_handler
                  csrr x31, 0x343 # MTVAL
                  1: la x24, test_done
                  jalr x1, x24, 0

ecall_handler:    
                  la x27, _start
                  sw x0, 0(x27)
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  la x24, write_tohost
                  jalr x0, x24, 0

instr_fault_handler:
                  add x12, x22, zero
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
                  add x22, x12, zero
                  lw  x12, (x22)
                  addi x22, x22, 4
                  mret

load_fault_handler:
                  add x12, x22, zero
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
                  add x22, x12, zero
                  lw  x12, (x22)
                  addi x22, x22, 4
                  mret

store_fault_handler:
                  add x12, x22, zero
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
                  add x22, x12, zero
                  lw  x12, (x22)
                  addi x22, x22, 4
                  mret

ebreak_handler:   
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x12, x22, zero
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
                  add x22, x12, zero
                  lw  x12, (x22)
                  addi x22, x22, 4
                  mret

illegal_instr_handler:
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x12, x22, zero
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
                  add x22, x12, zero
                  lw  x12, (x22)
                  addi x22, x22, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x27, 0x300 # MSTATUS;
                  csrr  x27, 0x304 # MIE;
                  csrr  x27, 0x344 # MIP;
                  csrrc x27, 0x344, x27 # MIP;
                  add x12, x22, zero
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
                  add x22, x12, zero
                  lw  x12, (x22)
                  addi x22, x22, 4
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
