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
                  la x6, kernel_stack_end

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
                  li x7, 4286578688
                  fmv.w.x f0, x7
                  li x7, 2286933092
                  fmv.w.x f1, x7
                  li x7, 2139095039
                  fmv.w.x f2, x7
                  li x7, 4115300427
                  fmv.w.x f3, x7
                  li x7, 2139095041
                  fmv.w.x f4, x7
                  li x7, 0
                  fmv.w.x f5, x7
                  li x7, 2147483648
                  fmv.w.x f6, x7
                  li x7, 2139095040
                  fmv.w.x f7, x7
                  li x7, 5066804
                  fmv.w.x f8, x7
                  li x7, 4286578688
                  fmv.w.x f9, x7
                  li x7, 2147483648
                  fmv.w.x f10, x7
                  li x7, 2143289344
                  fmv.w.x f11, x7
                  li x7, 4286578688
                  fmv.w.x f12, x7
                  li x7, 966493881
                  fmv.w.x f13, x7
                  li x7, 2139095039
                  fmv.w.x f14, x7
                  li x7, 4286578687
                  fmv.w.x f15, x7
                  li x7, 4286578688
                  fmv.w.x f16, x7
                  li x7, 0
                  fmv.w.x f17, x7
                  li x7, 1405705282
                  fmv.w.x f18, x7
                  li x7, 0
                  fmv.w.x f19, x7
                  li x7, 4286578688
                  fmv.w.x f20, x7
                  li x7, 2966918
                  fmv.w.x f21, x7
                  li x7, 2139095041
                  fmv.w.x f22, x7
                  li x7, 2147483648
                  fmv.w.x f23, x7
                  li x7, 4286578688
                  fmv.w.x f24, x7
                  li x7, 2139095039
                  fmv.w.x f25, x7
                  li x7, 5696044
                  fmv.w.x f26, x7
                  li x7, 4286578688
                  fmv.w.x f27, x7
                  li x7, 2139095039
                  fmv.w.x f28, x7
                  li x7, 2143289344
                  fmv.w.x f29, x7
                  li x7, 2139095039
                  fmv.w.x f30, x7
                  li x7, 4286578687
                  fmv.w.x f31, x7
                  fsrmi 2
                  li x0, 0x0
                  li x1, 0x80000000
                  li x2, 0x80000000
                  li x3, 0x0
                  li x4, 0x0
                  li x5, 0x7
                  li x7, 0x0
                  li x8, 0xf152a850
                  li x9, 0x80000000
                  li x10, 0xf670f37c
                  li x11, 0xe69e2824
                  li x12, 0x80000000
                  li x13, 0x0
                  li x14, 0x80000000
                  li x15, 0x80000000
                  li x16, 0x80000000
                  li x17, 0x0
                  li x18, 0xbe9e9915
                  li x19, 0x12083653
                  li x20, 0x80000000
                  li x21, 0x7
                  li x22, 0x80000000
                  li x23, 0x4def3e56
                  li x24, 0x80000000
                  li x25, 0xcd80797e
                  li x26, 0x0
                  li x27, 0xc
                  li x28, 0xf16cc363
                  li x29, 0xfef9c374
                  li x31, 0x0
                  la x30, user_stack_end
main:             and          zero, s5, s11
                  nop
                  fsqrt.s      ft6, ft2
                  feq.s        t6, fa0, ft6
                  fsgnjn.s     ft4, fs2, fa3
                  and          s10, a3, ra
                  fdiv.s       fs5, ft3, fs4
                  mul          s8, s6, t4
                  fdiv.s       ft10, ft11, fs5
                  fclass.s     s4, fs5
                  flt.s        s1, fs10, fs5
                  sra          a2, a0, s2
                  mul          a1, a3, a1
                  flt.s        s2, ft10, fs2
                  fclass.s     a3, ft6
                  xor          ra, a0, t5
                  andi         s5, s1, 306
                  mulh         a7, t4, s11
                  slti         s10, a0, -1181
                  srli         a5, t3, 14
                  mulhsu       s11, ra, a4
                  auipc        ra, 949470
                  fsgnj.s      ft9, fa6, fa0
                  fcvt.wu.s    t3, ft6, rmm
                  div          sp, s0, a0
                  flt.s        s8, fa2, fs1
                  mulhsu       a1, s7, s5
                  sub          t6, s7, s7
                  mulhu        tp, zero, s7
                  mulhsu       a3, a1, s2
                  fmax.s       ft9, ft9, fs2
                  addi         a7, s2, 241
                  nop
                  auipc        gp, 849500
                  ori          t4, s8, 1019
                  lui          t4, 466092
                  fcvt.wu.s    zero, fs11, rdn
                  fcvt.s.wu    ft10, ra, rmm
                  mulh         a3, a6, a7
                  auipc        s11, 184237
                  sub          s9, s1, a5
                  slli         zero, s6, 2
                  srai         s6, a5, 8
                  fcvt.w.s     s1, fs4
                  fadd.s       fa2, ft3, fa1
                  mul          a1, s1, s10
                  fsgnjn.s     fa3, ft10, ft2
                  fadd.s       fa0, fs5, fs2
                  addi         s3, s4, -1711
                  fmv.x.w      s0, fs8
                  andi         a6, s11, 683
                  sub          zero, s7, t4
                  nop
                  sltiu        a2, zero, 1051
                  and          a2, s8, a0
                  fmv.x.w      t2, ft11
                  fcvt.s.w     fa5, s11, rdn
                  fcvt.w.s     zero, fa2
                  fmv.w.x      ft2, t1
                  slti         s11, s6, -296
                  sll          sp, a2, s5
                  fadd.s       ft9, fa5, ft3, rtz
                  fadd.s       ft6, fs11, ft0, rne
                  addi         s5, a0, -685
                  sll          sp, t4, t0
                  fclass.s     s1, ft11
                  fcvt.wu.s    t6, ft5
                  fmin.s       fa4, fa1, fa6
                  fcvt.w.s     a1, fa6, rdn
                  remu         sp, s8, s11
                  mulh         s4, gp, t6
                  fclass.s     a2, fs3
                  fcvt.s.wu    fa3, t5
                  fsgnjn.s     fs8, fs9, fa7
                  sub          s5, s7, s0
                  mulh         ra, zero, s7
                  sll          s0, sp, t1
                  mulhu        a5, s11, sp
                  fsgnjx.s     fs8, ft9, fs10
                  sltu         s4, s11, t0
                  add          a6, a4, s5
                  fsgnjn.s     ft3, fs11, ft3
                  srli         s10, a4, 24
                  mul          s4, a3, a3
                  flt.s        s9, fa1, fa1
                  fmax.s       fa2, ft1, fa2
                  remu         t3, a3, tp
                  sltu         t3, zero, s11
                  or           a4, zero, s8
                  and          s7, a5, a5
                  andi         t2, t3, 1838
                  fsub.s       ft5, fa3, fs3
                  fsgnj.s      fs7, fs4, ft11
                  fmax.s       fa1, ft10, ft7
                  ori          a6, a4, -46
                  sltu         s0, s2, s5
                  xori         a1, s10, 1552
                  fmax.s       fs9, fs5, ft9
                  fsgnjn.s     ft10, ft11, fa5
                  auipc        s10, 637015
                  slli         s3, s3, 28
                  rem          zero, zero, a7
                  fsgnj.s      fs1, fs10, fs1
                  fsgnjx.s     ft0, fs2, fs3
                  add          gp, a4, t0
                  or           ra, sp, s3
                  xor          gp, s5, a7
                  ori          a5, t5, -669
                  fdiv.s       fs0, fa5, fs4, rmm
                  remu         s2, s0, s3
                  ori          a0, gp, 1919
                  sll          s2, zero, s5
                  mulhsu       s9, t1, s3
                  add          s10, s8, s6
                  nop
                  sra          s2, s5, tp
                  slli         sp, a7, 19
                  mulhu        s9, s4, a6
                  fcvt.wu.s    tp, fa2
                  fmul.s       fa3, fa1, fs8
                  fmv.w.x      fa0, a1
                  srli         s3, t3, 0
                  fdiv.s       fa4, fs1, fs7, rdn
                  ori          ra, s8, -478
                  fdiv.s       ft7, ft5, fs1, rdn
                  feq.s        a2, fa4, fs1
                  add          a7, t1, tp
                  addi         sp, s6, -1541
                  sltiu        t6, tp, 48
                  lui          s0, 310716
                  mul          a6, t3, a2
                  sra          a6, t1, t3
                  fsgnjn.s     fs0, fa5, fa0
                  fsqrt.s      ft7, fa7
                  srl          s11, a3, a2
                  fsgnj.s      fa5, fa5, fa6
                  fsgnjx.s     ft0, ft7, ft2
                  fmv.x.w      s2, fs9
                  fsgnjn.s     fa5, ft4, fs10
                  add          s3, s8, s11
                  auipc        s2, 284774
                  ori          a0, t4, -1932
                  fsgnj.s      fa6, fs0, fs11
                  fcvt.w.s     s11, ft9
                  srl          t6, s7, a7
                  srai         a7, ra, 18
                  or           s2, a6, a7
                  divu         s3, a1, a1
                  fsqrt.s      fs2, ft9, rmm
                  sub          gp, s0, s8
                  srl          t2, s10, s6
                  sltiu        sp, s7, 783
                  rem          s10, s9, sp
                  div          t2, a6, a4
                  slt          sp, sp, a0
                  sub          s11, s5, s7
                  nop
                  lui          s5, 470012
                  or           a3, a2, s9
                  fle.s        s2, fs11, ft7
                  slli         t6, a0, 3
                  xori         s1, t0, -2019
                  ori          t6, t6, -1946
                  slt          s8, a4, s3
                  slt          a5, s8, a0
                  fcvt.s.wu    fa0, s1, rne
                  xor          s10, ra, s3
                  fsqrt.s      ft0, fa6
                  and          s6, t5, s7
                  fsgnj.s      fa6, fs4, fa3
                  fmin.s       fs2, fs11, ft3
                  fle.s        s0, ft7, ft9
                  fcvt.s.wu    ft3, ra, rup
                  mulh         a3, s3, s7
                  fcvt.s.w     ft8, a2
                  slli         s11, a7, 2
                  sltu         s5, t1, s2
                  mul          s3, zero, s7
                  remu         s9, a2, s3
                  fcvt.w.s     t4, fs3
                  srli         a2, a0, 26
                  sub          s10, zero, s2
                  ori          gp, t2, -1318
                  and          s4, t6, gp
                  mulh         s7, zero, zero
                  sll          s10, s2, s7
                  xor          a4, s11, a7
                  mulh         a0, s9, a6
                  mulhu        s2, s11, tp
                  mulh         a5, a2, t1
                  auipc        a1, 296567
                  lui          gp, 658591
                  fcvt.s.w     fa5, t4, rmm
                  fsgnj.s      fs2, fa0, fa5
                  slt          s5, t0, s5
                  add          ra, gp, t4
                  fsgnj.s      fs10, fa2, fa4
                  fmul.s       ft1, fa1, fs5
                  auipc        a2, 602033
                  fcvt.wu.s    a7, fs11, rmm
                  flt.s        t4, ft4, ft2
                  fsgnjn.s     fs2, ft7, fa4
                  fdiv.s       fa4, fs7, ft0
                  remu         tp, s1, a3
                  slt          t2, s2, s11
                  remu         s11, s2, tp
                  fmax.s       fa3, ft0, ft1
                  xor          s11, s7, s2
                  xori         s9, ra, -1958
                  feq.s        s5, fa3, fa4
                  xori         a3, s0, 1316
                  fmin.s       ft7, fa5, fs7
                  mul          a2, t1, s0
                  sll          a2, s2, a3
                  sltiu        a6, sp, 1139
                  fsgnjx.s     ft11, fs5, fs2
                  mulh         a3, s6, s7
                  srai         zero, s5, 21
                  srl          s7, a6, sp
                  fsgnjx.s     fs2, fs6, ft4
                  fmul.s       ft2, fs10, fs4
                  fmax.s       ft5, fs0, fa5
                  mulhsu       s8, t2, ra
                  fsgnjx.s     fs11, ft9, fa1
                  sub          t6, t0, t6
                  fmv.x.w      s4, fa1
                  ori          a1, a5, -1428
                  fle.s        zero, fa0, fa7
                  remu         t6, s1, s2
                  remu         s8, s3, a4
                  fsub.s       ft9, fs5, ft8
                  mulh         s4, t2, t4
                  nop
                  ori          tp, s5, 1007
                  fsub.s       fa5, fs3, fs0
                  sub          ra, t4, s2
                  slli         s8, t3, 9
                  ori          gp, s10, 871
                  auipc        s2, 44936
                  srl          a2, a4, tp
                  fmv.w.x      ft6, sp
                  sltiu        s10, s11, -1062
                  mul          s4, s5, s10
                  andi         s4, a7, -305
                  sub          gp, a5, a6
                  sltu         s10, a6, gp
                  mul          t2, tp, a2
                  sub          s11, s9, ra
                  fcvt.s.wu    fa4, t2, rne
                  fmin.s       ft3, ft3, fs2
                  fmin.s       ft7, ft10, fs1
                  fle.s        t4, fs2, fa6
                  mul          gp, s7, t4
                  and          s6, a2, a6
                  addi         a6, sp, -841
                  flt.s        t4, fa4, ft5
                  remu         a7, a1, t2
                  nop
                  divu         a6, t2, s3
                  srli         s3, t1, 23
                  and          s10, s1, s3
                  fsgnjx.s     ft0, fs5, ft1
                  rem          s2, s5, a7
                  divu         t6, sp, t2
                  fmv.x.w      a7, fs7
                  fdiv.s       fa0, fa6, ft4, rtz
                  fsgnj.s      fs1, ft5, fs10
                  fclass.s     a3, ft4
                  fcvt.wu.s    s3, fa4, rdn
                  auipc        a6, 542589
                  slti         t2, t2, 1238
                  fcvt.w.s     s8, ft8
                  divu         s6, s10, a2
                  addi         gp, gp, -667
                  fmul.s       fa6, fs5, fs4, rmm
                  fsqrt.s      fs11, ft0, rne
                  xor          s5, a2, s2
                  fcvt.w.s     s10, ft2
                  sub          ra, zero, s7
                  xor          s3, t4, s5
                  xor          s7, s6, a1
                  fclass.s     tp, fa4
                  fsub.s       fs11, ft9, fa4, rtz
                  fsgnj.s      fa0, fa4, ft8
                  add          gp, s6, t4
                  fsgnjn.s     ft7, ft7, fs2
                  and          s2, sp, s3
                  mulhsu       a4, t1, a4
                  sltu         s10, t1, t6
                  andi         a6, s5, 438
                  fsqrt.s      fs3, fa1
                  fmul.s       fs6, ft1, fa1
                  srai         sp, t6, 7
                  ori          gp, s2, 1532
                  xori         s6, t2, -847
                  slti         t4, t0, 69
                  divu         s7, s2, a2
                  sub          gp, s3, a5
                  fsgnjx.s     fa6, fa7, ft6
                  divu         s6, a2, tp
                  fcvt.s.w     fa3, a1, rtz
                  fle.s        zero, fs2, fa4
                  fsqrt.s      ft4, ft5, rne
                  srl          t4, a6, s11
                  xor          s1, t1, s6
                  andi         s10, s4, -1121
                  mulhsu       a5, s0, s5
                  mulhsu       a3, t6, t3
                  fsgnjx.s     fs8, fa4, fa5
                  fsgnjx.s     ft5, fa2, fa7
                  fmax.s       ft2, ft4, fs10
                  flt.s        a6, fs5, ft8
                  fsqrt.s      ft1, ft4, rne
                  remu         s10, a1, s3
                  feq.s        s8, ft0, ft2
                  and          a3, s11, s1
                  srl          a3, t1, s9
                  fmv.x.w      a0, fs3
                  andi         s5, a2, -467
                  fle.s        t3, ft3, fa5
                  fsqrt.s      fa4, fa7, rdn
                  slt          s4, ra, s8
                  mulhsu       t6, s6, s0
                  sltu         a3, s9, a6
                  div          zero, gp, ra
                  fmv.w.x      fs6, s9
                  andi         a4, tp, -1671
                  divu         tp, gp, s4
                  mulh         sp, t2, a3
                  div          a1, a2, t4
                  xori         t2, t0, -707
                  fdiv.s       fa1, fs10, fs5
                  or           ra, a4, t0
                  fmul.s       fs5, fs0, ft8
                  add          s11, s9, s1
                  mulh         s10, t3, t1
                  sltiu        a5, s2, 814
                  fmul.s       ft11, ft11, ft11, rdn
                  fcvt.w.s     a7, fa3
                  rem          s8, a1, s0
                  rem          s2, t5, a4
                  rem          sp, s0, s5
                  rem          a6, t5, a6
                  mul          t2, t1, tp
                  remu         s3, s5, t5
                  slt          s11, a5, a1
                  and          s5, sp, t1
                  sltu         t3, a0, a7
                  fcvt.s.w     fa1, t4
                  mul          s9, a3, ra
                  and          sp, tp, sp
                  sra          a6, t0, s1
                  fmin.s       ft2, ft3, ft6
                  fclass.s     t3, fs9
                  fsgnjn.s     fs9, fs5, ft1
                  fsgnjn.s     fa3, ft5, ft9
                  sll          s5, a2, a1
                  add          s4, sp, a7
                  fmv.x.w      t6, fs11
                  fcvt.s.wu    ft1, s1
                  sltiu        s9, ra, -1797
                  mulhsu       s7, s5, s4
                  ori          t6, s0, 1418
                  andi         s3, ra, 1684
                  remu         s4, a7, a6
                  fcvt.w.s     s1, fa1, rne
                  ori          t2, a7, 1848
                  fadd.s       fs8, fs3, fs4
                  fmax.s       fs1, ft9, fa3
                  srai         ra, s1, 11
                  fsub.s       fa3, ft4, fa0, rmm
                  srai         ra, a6, 2
                  flt.s        a1, fa4, ft10
                  fmin.s       ft3, fs10, fs3
                  fmax.s       fa0, fs2, ft11
                  fsub.s       ft5, ft0, fs8
                  remu         t4, t4, s5
                  flt.s        s0, fs2, ft4
                  add          s11, t3, t6
                  sll          a0, s7, t6
                  fdiv.s       fa7, ft8, fa6
                  div          a5, s6, a1
                  flt.s        t6, fs7, ft5
                  divu         s11, ra, s9
                  fmul.s       fs11, ft11, fs0, rtz
                  add          a1, a4, s10
                  srai         a3, s4, 2
                  slli         s6, s11, 21
                  sll          s10, sp, s3
                  flt.s        a7, fs7, fs2
                  sltiu        t3, a1, 1732
                  or           s7, s6, s5
                  srai         gp, s6, 29
                  and          zero, s3, t1
                  fmax.s       ft9, fs2, fs10
                  remu         a4, a0, s6
                  mulhsu       s3, s2, t2
                  flt.s        s11, fs6, ft1
                  andi         zero, t3, 714
                  rem          a6, t4, sp
                  sra          zero, t2, s5
                  mulh         a2, s2, zero
                  fmv.w.x      ft3, gp
                  fsgnjn.s     ft6, fs4, fs9
                  fmv.w.x      ft6, s0
                  nop
                  fsqrt.s      fa7, ft3, rup
                  fmin.s       fa4, ft2, fs3
                  srli         s10, t2, 1
                  addi         sp, s11, 358
                  fle.s        sp, fs6, fs5
                  fmax.s       fs9, fa7, fs6
                  srl          s3, a5, t3
                  slt          s11, s3, s0
                  fsgnjx.s     fs10, fa4, fs7
                  slli         a1, t5, 16
                  srl          a1, s2, a3
                  fcvt.w.s     s4, fa2
                  sltiu        s5, a1, 1388
                  srai         s0, t1, 15
                  andi         s2, a5, 1022
                  fsgnjn.s     ft1, fs11, ft3
                  slti         sp, tp, -746
                  slti         a4, t0, 2023
                  fmul.s       fs7, fa2, ft5, rup
                  lui          a5, 768608
                  fsgnjn.s     fa1, fa1, fs2
                  fdiv.s       ft11, fa7, fa2
                  xori         a1, s11, -846
                  flt.s        s6, fs3, fa6
                  nop
                  fdiv.s       fs5, fs4, ft7
                  and          t4, zero, s6
                  sltu         a5, s4, t2
                  and          s1, t0, s8
                  feq.s        s5, fs5, fs0
                  fsub.s       fs6, fa3, fs11
                  flt.s        t4, ft3, fs7
                  slt          t2, s6, s0
                  fsgnjn.s     ft5, ft9, ft5
                  fdiv.s       fs9, fs3, fs11, rtz
                  slli         a1, gp, 29
                  fsqrt.s      ft2, fa6
                  andi         t4, s4, -600
                  fmin.s       fs8, ft3, ft6
                  lui          a1, 160061
                  fmax.s       ft5, fs9, ft10
                  slli         gp, tp, 24
                  sra          a6, t2, s7
                  fadd.s       fs9, fs6, ft9
                  xori         s1, s9, -708
                  auipc        s9, 382509
                  fmul.s       ft5, ft0, fs5, rmm
                  remu         a7, s1, s5
                  auipc        sp, 319616
                  fcvt.w.s     t3, fa0
                  sltu         s5, s9, t0
                  fmul.s       fs1, fs11, fs11, rne
                  slti         s9, s11, 1025
                  nop
                  mul          s9, t4, s9
                  fdiv.s       fs11, ft8, fa5
                  fsgnjn.s     fs2, ft5, fs2
                  addi         a3, a7, -1823
                  sll          s7, s4, a6
                  remu         a0, s0, a0
                  fsgnjn.s     fa2, fs5, fa2
                  add          a0, a5, t6
                  fadd.s       fs10, fs2, fs10
                  fsqrt.s      fs11, fs9, rne
                  addi         a1, ra, 1745
                  feq.s        a7, ft9, ft7
                  fcvt.s.wu    ft5, s3
                  div          s5, t1, a2
                  fcvt.wu.s    s5, ft2
                  slti         s2, s9, 1835
                  addi         t3, s7, -648
                  fmin.s       ft10, fs0, fs8
                  fmv.x.w      s9, ft3
                  fsgnjn.s     ft2, fa5, ft2
                  fsgnjx.s     fa1, ft6, fa3
                  divu         s7, a6, s10
                  fdiv.s       fs4, ft8, fa3, rne
                  mulh         s0, a4, s0
                  and          s6, s5, a2
                  rem          a7, a1, s0
                  andi         ra, a4, -1853
                  mulhu        s1, gp, sp
                  fmul.s       ft8, ft10, ft10
                  ori          s6, s7, -520
                  div          gp, t4, tp
                  nop
                  remu         a3, s11, gp
                  lui          s1, 868655
                  fmv.x.w      s4, fs11
                  andi         a0, a2, 761
                  feq.s        a6, fa1, ft9
                  fsqrt.s      fs11, ft8
                  fle.s        t2, ft11, fa7
                  addi         s8, t6, 98
                  srl          s8, ra, a5
                  fsgnj.s      ft5, fs5, fs11
                  fmax.s       fs1, fa0, fs8
                  mul          ra, a2, a4
                  slt          s6, a3, s11
                  slt          a1, gp, t6
                  fmin.s       fa3, ft5, ft9
                  feq.s        a6, fa7, fa1
                  fmax.s       ft8, fa6, fa6
                  fcvt.s.w     fs6, s7, rmm
                  fclass.s     s9, fs8
                  sll          sp, s6, t0
                  srai         a7, s3, 22
                  mulh         s11, t6, gp
                  or           a1, tp, t2
                  xor          s2, s5, s10
                  xori         a7, t4, 667
                  auipc        s3, 554515
                  fcvt.s.w     ft6, gp
                  mulhsu       a3, t0, s2
                  and          t4, tp, ra
                  mul          s10, tp, t4
                  sll          s0, s3, t2
                  sra          ra, t3, t3
                  divu         s9, s8, sp
                  fsub.s       fa4, fs4, fa4
                  fadd.s       fs1, fs11, fs10
                  sra          a1, s2, s3
                  mulhu        s7, s1, t3
                  fcvt.w.s     t4, fa3
                  add          a4, zero, a0
                  lui          s6, 430886
                  sub          t3, ra, t4
                  fmax.s       ft9, ft0, fs5
                  div          gp, t0, s10
                  fsgnjn.s     ft5, ft1, ft10
                  srli         s0, t4, 8
                  fcvt.s.w     ft3, a7, rdn
                  addi         s2, s7, 972
                  srli         s0, a5, 4
                  fclass.s     s4, fa5
                  auipc        a7, 44220
                  fcvt.s.wu    fa5, s5, rne
                  fclass.s     a2, fa5
                  srli         a7, a1, 6
                  feq.s        a1, ft3, ft10
                  sltu         s6, s10, gp
                  andi         s1, s2, -855
                  fmin.s       ft0, fs5, ft10
                  fsub.s       fs0, ft9, fs2
                  fmul.s       fs7, fa5, fa4, rmm
                  sra          zero, gp, t4
                  slti         a4, s8, -253
                  fsgnj.s      ft10, fs4, ft6
                  fmv.x.w      s3, ft5
                  fsgnjn.s     ft4, fa6, ft8
                  fle.s        s7, fa0, fs6
                  srli         a1, s5, 20
                  fsgnj.s      fs9, ft2, ft2
                  srli         s10, s3, 10
                  mulh         s7, a2, t6
                  mul          sp, a0, t4
                  fmv.x.w      zero, ft10
                  slt          a1, s0, a0
                  fadd.s       fs11, fs10, fs7
                  or           zero, s2, s4
                  slli         ra, a3, 2
                  fle.s        tp, fs8, fs3
                  ori          a6, s3, -759
                  fmv.x.w      t2, ft6
                  div          s7, s1, tp
                  flt.s        s0, ft3, fa4
                  fsgnjx.s     ft2, fa2, fs7
                  fcvt.w.s     s3, ft9
                  remu         s6, s3, ra
                  fsub.s       fa7, fs9, ft8
                  fsub.s       fs1, fs7, fa5, rdn
                  andi         s8, t1, 1922
                  fmv.w.x      fs3, s11
                  fcvt.s.w     ft5, a2, rtz
                  fmax.s       ft10, fa1, ft9
                  srai         s11, t4, 4
                  slli         a3, s1, 20
                  fsgnjx.s     fa7, fs10, ft4
                  lui          a0, 110055
                  andi         s2, ra, 952
                  add          s2, s2, gp
                  sra          a0, s3, a3
                  fmin.s       fs6, fs4, ft9
                  sll          a5, s1, t6
                  fsqrt.s      ft1, fs1, rtz
                  add          s5, a5, tp
                  fclass.s     s1, fa2
                  sltu         t6, t4, s3
                  fcvt.w.s     zero, fs4
                  fclass.s     s10, fs0
                  fmv.x.w      s7, ft8
                  andi         s8, a0, 1053
                  fmv.x.w      a2, fa7
                  fle.s        a5, fs7, fs2
                  fmul.s       fs1, ft7, ft3
                  div          a1, s10, a1
                  fsgnj.s      ft7, fs3, ft8
                  slti         a0, a2, -1880
                  or           a6, sp, s5
                  fcvt.s.wu    ft5, t6, rtz
                  sltu         a3, s6, s11
                  auipc        t3, 181398
                  fcvt.s.wu    ft9, t0
                  feq.s        a0, fa2, ft11
                  fcvt.s.wu    fa5, t5, rne
                  flt.s        s7, fa4, fa4
                  fcvt.w.s     t3, ft2
                  sltiu        a5, t5, 931
                  add          gp, t1, t0
                  fle.s        t6, ft6, fs4
                  sub          a7, ra, tp
                  sub          tp, s0, s9
                  sra          t2, s10, s7
                  and          a7, t2, a4
                  srai         a1, s6, 6
                  fcvt.s.w     fs1, t0, rtz
                  fsgnj.s      fs7, ft8, ft5
                  xor          ra, t6, t6
                  fmax.s       ft11, ft7, ft1
                  srli         s1, t2, 2
                  fsgnjx.s     fa3, fs9, fs8
                  sra          a3, t1, s8
                  remu         ra, s9, s10
                  fmul.s       fs9, fa2, ft5
                  add          s1, s9, a5
                  fcvt.wu.s    s10, fs4
                  fcvt.s.wu    ft7, a0, rmm
                  fmax.s       fa0, fs1, fs8
                  fmin.s       ft0, fa7, fs2
                  fsgnjx.s     ft8, fa4, fa7
                  fdiv.s       fa4, ft4, fa2, rdn
                  sll          s0, a5, a3
                  lui          s6, 976210
                  mulhu        zero, t3, s4
                  remu         t2, s10, a1
                  fsgnjx.s     fa3, fs9, ft9
                  fmin.s       ft9, ft6, fs5
                  sltu         zero, s1, s4
                  slli         ra, s0, 8
                  rem          t3, s8, a3
                  or           s5, a0, s11
                  lui          ra, 773573
                  mulhu        s2, tp, s4
                  andi         ra, a2, -1936
                  flt.s        a4, fa4, ft1
                  fmul.s       ft10, fa2, fa4
                  lui          s2, 495524
                  fsgnjx.s     fs5, fs2, fs10
                  sra          s6, s8, s8
                  srl          a6, a0, s9
                  divu         t6, t4, tp
                  and          t4, a1, a2
                  srl          ra, tp, s9
                  fmin.s       fa1, fs5, ft3
                  fadd.s       ft7, ft10, fa7, rne
                  fdiv.s       ft3, fs8, ft1, rdn
                  nop
                  div          s7, tp, a3
                  auipc        a3, 644589
                  srli         tp, s10, 19
                  andi         sp, s4, -1450
                  sltu         a5, a2, t0
                  auipc        t2, 766490
                  fsgnjx.s     ft0, fs8, ft6
                  srli         a5, t4, 28
                  slt          a5, t5, s3
                  mulh         gp, t0, s5
                  fcvt.s.wu    fs3, s4, rne
                  slti         t4, s5, 84
                  fmin.s       fs9, fs7, fa5
                  add          ra, s6, s1
                  rem          s10, s11, zero
                  or           t3, sp, t0
                  rem          s4, t6, s10
                  fcvt.s.w     ft1, a0, rup
                  xor          s5, tp, t0
                  sltiu        t3, s9, -420
                  fcvt.w.s     sp, ft10
                  fadd.s       fa2, fa4, fs5, rne
                  fmv.x.w      a4, fa6
                  fsub.s       fa5, fs4, fs11
                  fle.s        t3, ft3, fs5
                  divu         t2, s8, t5
                  fclass.s     t2, fs6
                  slli         s3, s4, 9
                  addi         s11, a6, 231
                  fdiv.s       ft9, fs5, ft9, rtz
                  fsqrt.s      fs7, ft1, rne
                  mulhu        gp, s11, s0
                  feq.s        a2, ft5, fs9
                  sltiu        a7, s11, -745
                  sltiu        s1, t6, -346
                  and          s8, s0, t3
                  sltiu        a4, s0, -1533
                  mulh         t3, zero, a5
                  remu         s2, t1, t6
                  fmv.w.x      fa4, a6
                  xor          t6, s1, a7
                  fmin.s       fa1, fa4, fa2
                  fsub.s       ft0, fa4, fs6, rne
                  div          s0, t2, a6
                  ori          t3, t6, 1586
                  fsgnj.s      fs4, fs8, ft3
                  fmin.s       ft4, ft10, ft6
                  add          a6, s5, s6
                  andi         s5, zero, 1960
                  fmv.x.w      t6, fs9
                  fmin.s       fs5, fa2, fs3
                  sub          a4, ra, s7
                  fcvt.w.s     t6, fs4, rdn
                  divu         ra, a7, s1
                  fcvt.w.s     t3, fa1
                  fmax.s       fs5, fs8, fa3
                  auipc        s0, 836689
                  fcvt.s.w     fa7, s6
                  rem          t2, tp, s7
                  fmul.s       ft6, fs3, fs5, rdn
                  xor          a4, t4, s0
                  fmv.w.x      fa1, a3
                  divu         a5, s9, sp
                  slti         ra, t6, -1464
                  mulhu        gp, t1, s6
                  fclass.s     s6, fa4
                  mulhu        s0, a6, a5
                  auipc        sp, 534841
                  srl          sp, t1, t0
                  fcvt.w.s     t6, fs9
                  slli         sp, s3, 3
                  lui          a3, 676067
                  fsqrt.s      fs7, fa5
                  fmax.s       fa6, fs10, fs4
                  fdiv.s       ft1, fs6, ft0
                  xori         sp, t2, -735
                  fle.s        a3, fs1, fs8
                  fsgnjx.s     ft5, ft3, ft6
                  srai         a4, sp, 19
                  fcvt.s.wu    ft7, s7, rup
                  sll          a1, s6, sp
                  fcvt.s.wu    fa4, a3, rne
                  srl          gp, a1, t5
                  srl          s0, s10, ra
                  xori         s4, a4, -1305
                  fsub.s       ft5, fa6, ft5
                  sll          tp, t0, t1
                  flt.s        s6, fa1, ft11
                  flt.s        s10, ft8, fs2
                  fcvt.s.wu    ft6, a7, rdn
                  fmul.s       fs6, ft7, fa5
                  srl          a6, a6, s8
                  remu         s4, s11, a5
                  fcvt.s.w     ft9, s4
                  fmul.s       fs10, fa2, fs2
                  and          a3, a4, sp
                  or           s11, tp, s2
                  mulhsu       t4, gp, gp
                  srli         s5, sp, 10
                  fmv.w.x      ft7, ra
                  divu         s5, sp, a0
                  slt          t4, tp, s4
                  fmv.x.w      a4, fs0
                  div          t3, s3, gp
                  and          a2, t5, a6
                  addi         a2, s0, -1240
                  fadd.s       fs11, ft0, fs6, rdn
                  slt          sp, s10, s2
                  fsub.s       ft6, ft9, ft11, rup
                  fsgnj.s      fa3, fs2, ft11
                  fmv.x.w      s2, fa3
                  andi         a0, zero, 305
                  slli         s2, t5, 10
                  fcvt.w.s     s6, ft2
                  feq.s        a6, fs5, fs1
                  nop
                  fle.s        s11, fa4, ft5
                  mulhsu       s5, t5, s7
                  sub          a5, t6, s6
                  fsgnjn.s     fs1, fs0, ft7
                  xori         s3, s11, -955
                  xori         s1, t3, -558
                  feq.s        t4, ft0, ft1
                  fdiv.s       fa5, fs9, ft4, rup
                  andi         a3, s3, 1992
                  fcvt.s.w     fs9, s11, rup
                  sltiu        tp, s0, 602
                  fdiv.s       fs5, fa3, ft0, rne
                  mul          a0, s5, tp
                  fsub.s       ft1, ft11, ft11
                  lui          t3, 793858
                  slt          s9, sp, s6
                  rem          t6, a4, ra
                  srai         zero, s10, 28
                  fsgnj.s      fs4, fs5, ft11
                  slt          a4, t5, t3
                  auipc        t6, 138224
                  sub          t4, t6, s4
                  xori         s10, t0, 1028
                  fsub.s       ft9, fs4, ft4
                  add          a2, t6, s8
                  div          s8, t5, a7
                  fle.s        s4, ft6, ft5
                  slli         t2, t0, 19
                  fclass.s     s11, fs4
                  slti         t6, t5, -1763
                  mulhsu       a3, tp, zero
                  fsub.s       ft5, fa6, fs10
                  fsqrt.s      fa0, fs0, rne
                  fcvt.wu.s    a6, fs7, rdn
                  ori          s3, t1, 853
                  feq.s        a5, fa2, fa6
                  sltiu        a4, a2, -1691
                  sub          s3, a6, zero
                  fsub.s       ft11, fs4, ft7
                  sub          tp, s1, s6
                  fcvt.w.s     ra, fa4, rup
                  fmin.s       ft4, fa7, fs9
                  fsqrt.s      fa2, fs3, rdn
                  fsgnj.s      fa6, fa1, ft6
                  mul          s7, a6, s6
                  add          s5, t2, t5
                  mulhu        a1, t4, t0
                  add          a3, s2, s10
                  sra          s5, s2, zero
                  srl          s0, s7, t2
                  slti         sp, s3, -570
                  fclass.s     a6, fs1
                  mul          t2, a7, zero
                  lui          t4, 78212
                  ori          gp, t5, 807
                  srl          a5, a5, t2
                  mul          ra, a6, tp
                  srai         tp, t1, 6
                  nop
                  or           s8, a3, s4
                  mulhu        t4, a0, s9
                  fle.s        s11, ft7, fs10
                  auipc        t3, 599113
                  slt          t6, s3, s5
                  fcvt.wu.s    gp, fs6, rup
                  fsgnjx.s     fs6, fs9, fa6
                  andi         t4, a7, -217
                  mulhu        zero, a7, s0
                  auipc        t4, 77485
                  fmv.w.x      fa0, a7
                  fmv.w.x      ft5, t1
                  sll          s5, a3, zero
                  remu         a1, a3, a4
                  fcvt.wu.s    a7, ft10, rup
                  fsub.s       fa4, ft7, ft7
                  xori         t6, a4, -743
                  or           a2, t2, a3
                  auipc        t4, 228527
                  auipc        s7, 1046218
                  mul          s6, t6, s0
                  fmul.s       fs0, fs1, fs1, rdn
                  sub          sp, a2, s11
                  add          s8, t3, s0
                  slli         s3, s0, 17
                  sub          s7, a7, s5
                  slti         tp, s5, 1633
                  and          s7, a1, t0
                  fclass.s     tp, fs3
                  sltiu        a5, t3, 1958
                  sltiu        a3, gp, 2018
                  addi         a1, s9, 503
                  fsqrt.s      fs4, ft8, rdn
                  fmax.s       ft6, ft11, fs0
                  srl          ra, s6, a2
                  fdiv.s       fs4, ft9, fs8
                  fmv.x.w      tp, fs10
                  and          a2, s5, a1
                  fmv.x.w      t2, fs2
                  slli         a4, a3, 23
                  sll          tp, tp, tp
                  fcvt.s.wu    fs8, s5, rdn
                  add          s0, a2, a1
                  fadd.s       fs5, fs1, ft7, rne
                  srl          a2, t1, t3
                  ori          gp, zero, -872
                  div          a4, t5, s11
                  fmv.w.x      ft1, s7
                  fsgnj.s      fs11, fs5, ft6
                  fadd.s       fs2, ft11, ft9
                  fsqrt.s      ft3, ft4, rup
                  fmul.s       ft9, fs11, fa0
                  nop
                  srai         s1, a5, 7
                  slli         s11, a0, 11
                  remu         t6, t0, s3
                  fdiv.s       fs4, ft3, ft6
                  andi         gp, s2, 1590
                  sll          s10, ra, t4
                  mulhu        a2, s8, a0
                  fmul.s       ft9, fa5, fs2
                  xor          s3, t4, s9
                  srai         a4, a0, 25
                  fmul.s       fs4, fs0, ft0
                  rem          t6, t1, t0
                  fcvt.w.s     t4, ft6
                  fcvt.w.s     s1, ft2, rne
                  fsgnj.s      fs11, fs10, fs1
                  fmul.s       ft9, fs11, fs5, rtz
                  div          zero, s1, ra
                  sltu         t4, a7, t1
                  ori          s6, s3, -287
                  fmv.x.w      t2, ft6
                  fsqrt.s      fs10, fs7
                  fsub.s       fa5, fa3, ft3
                  fsub.s       ft0, fs5, fs6, rdn
                  sll          s4, tp, zero
                  xori         a6, a0, 362
                  fle.s        gp, fa5, fa3
                  fmul.s       fa4, ft6, ft0
                  sltiu        s4, s7, -972
                  fmin.s       fs7, ft2, fs8
                  andi         a0, zero, -79
                  div          t4, a4, a1
                  divu         gp, s6, s8
                  nop
                  fmax.s       ft3, fs1, fa6
                  slt          s5, t0, t0
                  srai         a0, a2, 28
                  sltiu        t6, t3, -525
                  srai         s1, s10, 6
                  fcvt.s.wu    fs3, t6
                  and          a4, s4, t3
                  fcvt.s.w     fa6, s9, rtz
                  fmin.s       ft2, fa7, ft6
                  fmin.s       fs10, fs8, ft1
                  flt.s        sp, ft11, fa1
                  srl          t3, s10, s5
                  flt.s        a0, fa1, fa1
                  fmv.x.w      t6, fa5
                  fmv.x.w      a6, fs10
                  sub          s8, t3, ra
                  fadd.s       ft0, fs7, fa3, rup
                  fcvt.s.wu    ft4, s1, rtz
                  slt          t4, a5, a2
                  srai         t2, s2, 10
                  srai         a3, t6, 1
                  fdiv.s       fa2, ft2, ft10
                  divu         a7, t0, a6
                  fcvt.s.wu    fa5, a7
                  fsgnjx.s     ft8, fs4, ft11
                  mulhu        ra, t6, s9
                  fsub.s       fs5, ft0, ft10, rdn
                  fcvt.w.s     t2, ft0, rne
                  fsqrt.s      fs5, ft6, rdn
                  srai         a2, gp, 3
                  srai         s10, s6, 10
                  slt          a1, a6, s4
                  slti         a7, s11, -826
                  fclass.s     ra, ft5
                  fsgnj.s      fs9, ft7, fs1
                  xor          s5, t4, s11
                  sltiu        zero, tp, 974
                  fsqrt.s      fs11, ft8, rne
                  sll          ra, t2, t0
                  slti         tp, a6, 1904
                  xori         s9, s4, -1642
                  addi         s0, t4, 1611
                  and          t2, s0, s0
                  xor          gp, a3, a6
                  andi         a1, s1, 1956
                  mulh         t4, ra, s9
                  sltu         ra, s1, s0
                  mulhu        s3, s8, sp
                  sltu         a7, s5, t5
                  mulhu        s3, tp, s3
                  div          t4, a1, s5
                  srai         t6, sp, 7
                  fsgnjn.s     ft3, ft10, ft7
                  fcvt.s.wu    fs9, t6
                  or           a4, t4, s1
                  fle.s        a5, ft4, fs11
                  xori         s4, s8, 766
                  fmul.s       fs1, ft6, fs6
                  fmax.s       ft10, fs3, ft2
                  slti         ra, s4, 1785
                  sltiu        gp, t1, -1616
                  fcvt.s.wu    fs8, t2
                  add          s3, a3, s1
                  fsgnj.s      ft0, fa7, fs4
                  lui          s3, 520357
                  slt          zero, t1, t6
                  fmul.s       ft7, ft9, ft7, rdn
                  fcvt.w.s     s11, fs2, rmm
                  fsgnjx.s     fs5, ft6, ft3
                  slti         t4, ra, 619
                  fmax.s       ft8, fa7, ft0
                  rem          a5, s10, a6
                  sll          a7, t2, a0
                  divu         t2, a7, zero
                  slt          t4, s9, t4
                  mulhsu       a0, a4, sp
                  fcvt.wu.s    a1, ft11, rmm
                  fmv.x.w      t3, ft4
                  sra          ra, t0, sp
                  srai         s11, s11, 9
                  feq.s        gp, ft5, ft7
                  fcvt.s.w     fs5, s2, rup
                  sltiu        s3, s11, -230
                  fdiv.s       fa7, ft3, fa6, rdn
                  remu         a2, a4, a1
                  fmin.s       fs7, fa7, fa7
                  fadd.s       fs7, fs8, fa5
                  or           a7, tp, s8
                  fcvt.s.w     ft2, a6, rup
                  sll          ra, t6, tp
                  mulhsu       s7, s2, a3
                  slli         a4, sp, 14
                  auipc        s1, 137299
                  sltiu        a3, s3, -1805
                  fcvt.w.s     s4, fs2, rne
                  sll          t3, t4, a7
                  addi         zero, s2, 27
                  remu         s7, t1, s5
                  div          sp, zero, s6
                  and          s11, s9, a5
                  fcvt.s.wu    fa2, s11
                  or           s10, t5, t0
                  srl          a6, s8, t0
                  srl          a4, s6, s6
                  fle.s        a1, fs7, fa4
                  fcvt.s.wu    fs11, a4, rne
                  sra          zero, s9, s4
                  fcvt.s.wu    fa0, a1, rmm
                  mulhsu       s1, s8, a7
                  addi         t4, ra, 583
                  auipc        s4, 427149
                  xor          a2, t4, t3
                  mulhsu       s3, t4, a7
                  fclass.s     s11, ft1
                  fmv.x.w      sp, fs11
                  mulhu        zero, s6, tp
                  or           s5, a7, s3
                  fsgnjn.s     ft3, fs3, fa4
                  fsqrt.s      ft6, fa7, rtz
                  fsgnjn.s     ft8, ft3, fs3
                  or           t2, t4, zero
                  fcvt.w.s     s2, fa4, rtz
                  sltiu        s11, sp, 1279
                  addi         a7, s8, 417
                  fmin.s       fs5, fs9, fs2
                  sltu         zero, s1, a4
                  fsqrt.s      fs8, fs6, rtz
                  auipc        ra, 786957
                  flt.s        s10, ft11, ft6
                  addi         s0, s7, -641
                  mulhu        a7, s6, s3
                  fdiv.s       ft8, ft0, ft9, rtz
                  sltiu        sp, s10, 428
                  fle.s        s3, fs5, fs7
                  flt.s        sp, ft4, ft2
                  slti         s8, s8, -1304
                  fsgnjx.s     ft0, ft3, fs0
                  ori          s1, t6, 645
                  remu         s0, t0, zero
                  fadd.s       fa4, ft10, fa2, rmm
                  mulhsu       t3, s4, a2
                  mul          a2, s1, sp
                  mulh         s7, s4, a5
                  ori          a3, t3, -1327
                  srli         a4, a4, 8
                  fsgnjn.s     fa2, ft3, ft2
                  addi         s8, gp, -1672
                  slt          a4, t1, t6
                  fmin.s       fs8, fa4, ft4
                  fle.s        gp, fa3, ft0
                  mulh         a3, s5, s4
                  fcvt.s.wu    fs5, s10, rtz
                  sub          s9, a7, t6
                  addi         s8, s9, -1182
                  fclass.s     s4, fs4
                  fmv.w.x      fa4, s9
                  fcvt.s.wu    ft11, a3
                  div          s7, gp, s5
                  and          s10, a4, zero
                  xor          s4, t6, t1
                  andi         s1, s2, -1350
                  mul          t4, s10, a1
                  fle.s        s3, ft8, ft7
                  mulhu        t2, s9, s5
                  flt.s        s7, fs6, ft5
                  add          a4, a5, a3
                  srli         s10, s1, 5
                  or           t6, sp, s3
                  addi         s3, a3, 920
                  fsub.s       ft8, fs2, fa6, rup
                  fdiv.s       fs9, fs1, ft1, rup
                  addi         gp, s0, 1586
                  xor          sp, s3, a6
                  fsqrt.s      ft10, fs5
                  fdiv.s       fa1, fs5, fa6
                  feq.s        s2, fs2, ft11
                  fcvt.s.wu    ft6, s0, rne
                  fmax.s       fs11, fa3, fs1
                  fcvt.wu.s    a4, fa7, rmm
                  ori          t2, a2, -1174
                  fmax.s       ft7, ft5, fa7
                  fcvt.s.wu    ft7, a4
                  xor          s4, a3, ra
                  fsgnjx.s     ft4, fs11, fs6
                  andi         t2, a7, 329
                  flt.s        a3, fa6, fs6
                  sub          tp, a3, s10
                  mulhsu       t6, a0, a3
                  fmv.x.w      t6, ft2
                  srl          a5, ra, s6
                  and          s7, s10, t6
                  fmv.w.x      fs1, sp
                  feq.s        sp, fs7, fs7
                  slli         s4, t1, 14
                  remu         s1, s4, a0
                  auipc        s6, 229850
                  srai         zero, s2, 19
                  or           s8, s8, s6
                  sra          s2, s3, t6
                  slt          a0, a4, t3
                  or           a3, sp, s9
                  ori          s0, ra, -861
                  fsgnjx.s     fa0, ft7, fa7
                  fmax.s       ft7, ft8, fs0
                  mulhu        gp, t1, s7
                  rem          s5, t2, sp
                  sltu         s10, s11, t3
                  sltiu        a7, sp, 415
                  fdiv.s       fs7, fa0, fs4, rup
                  remu         s5, a1, gp
                  ori          a4, sp, -1984
                  ori          s0, zero, -1629
                  mulhu        s1, t4, a4
                  srl          s2, ra, a6
                  mulhu        a6, s1, a0
                  slti         tp, t2, -142
                  mulhsu       a5, t4, a5
                  sra          s3, a4, t6
                  xori         t4, gp, 1314
                  mulh         sp, a4, ra
                  rem          s0, s11, sp
                  mulh         t6, s6, s6
                  andi         gp, s6, 1525
                  slli         a6, a3, 27
                  fmax.s       ft8, ft0, fs3
                  nop
                  srl          t3, s10, a0
                  flt.s        s3, fa0, fs9
                  srl          ra, t5, s4
                  fmax.s       fs8, fs10, fa4
                  rem          s5, t1, s4
                  divu         gp, zero, s5
                  auipc        a3, 14986
                  fsgnjn.s     fs11, ft8, fs2
                  nop
                  div          s9, a7, t4
                  sltu         a2, s2, a4
                  mul          a0, t2, t5
                  rem          s6, s0, s10
                  mul          a1, tp, t1
                  divu         a5, s1, s11
                  fsqrt.s      fs11, fa6
                  flt.s        t6, fs2, ft8
                  mulhsu       t6, s5, tp
                  ori          t4, tp, 1850
                  fmv.x.w      a5, ft10
                  nop
                  mulh         a3, t3, s2
                  fmv.w.x      ft4, t3
                  mulhsu       t6, s2, s11
                  mulhsu       t2, a2, gp
                  fcvt.s.w     fa6, sp, rup
                  remu         a2, t0, t2
                  nop
                  fmul.s       ft11, fs0, ft7
                  fcvt.s.wu    fa6, t4
                  fclass.s     a2, fa5
                  div          s7, s10, s4
                  fmul.s       fa6, fs6, ft7, rdn
                  fcvt.s.w     fa1, s1
                  and          gp, t2, a1
                  fsqrt.s      ft8, fs4, rup
                  srai         ra, s7, 3
                  slli         s9, t6, 11
                  fsub.s       ft4, fs4, fs5
                  fmul.s       fs7, fs8, ft6, rup
                  rem          s11, t4, a3
                  fmin.s       fa7, fs3, ft9
                  sll          s11, t6, s5
                  fcvt.w.s     s8, fs10, rne
                  sll          s9, t5, gp
                  ori          a7, t1, 592
                  or           a5, a7, t0
                  slti         t3, t0, 1719
                  add          s10, s7, a6
                  slti         s2, ra, 1883
                  feq.s        t2, fs6, ft9
                  mul          a4, a4, s9
                  sltu         s5, sp, zero
                  srli         a4, s2, 1
                  fsgnj.s      ft1, ft4, fs5
                  remu         s8, t1, t4
                  feq.s        t2, ft9, ft4
                  fsgnjn.s     ft6, fs7, ft6
                  xor          s7, s1, t4
                  fmax.s       ft0, ft4, ft9
                  feq.s        s8, fs6, ft6
                  mulhu        t2, s0, gp
                  nop
                  andi         t3, sp, 1762
                  flt.s        t2, fs8, fs7
                  mulhsu       ra, a6, a2
                  fcvt.wu.s    s4, ft7
                  fsqrt.s      ft11, ft5
                  and          ra, s7, a5
                  slti         t3, t1, -1502
                  sltiu        t6, s3, -1663
                  addi         t2, a5, 1058
                  fsub.s       fa5, fs1, fa0, rdn
                  fmin.s       ft11, ft8, ft9
                  fcvt.w.s     s8, ft11, rtz
                  andi         a0, t3, 556
                  and          s10, gp, t0
                  xori         a7, s2, 900
                  xori         t3, t3, 1934
                  fle.s        a3, ft9, ft9
                  fcvt.wu.s    a5, ft7, rtz
                  fcvt.w.s     s2, fs3, rup
                  srli         s9, s2, 23
                  fle.s        s5, fs10, ft3
                  auipc        zero, 976757
                  remu         s11, zero, s0
                  fdiv.s       ft10, fa5, ft3, rtz
                  rem          s8, s4, s5
                  addi         sp, s1, 758
                  fclass.s     a0, fs11
                  mul          s1, s6, a0
                  addi         s1, a5, 1415
                  divu         s9, tp, t0
                  srai         s9, a3, 21
                  addi         a4, ra, -1104
                  fmv.x.w      t6, fa0
                  fmv.x.w      s3, fs9
                  xori         s4, s10, 197
                  fadd.s       ft2, ft3, fs2, rmm
                  div          a5, s0, t6
                  fle.s        tp, fa6, fs11
                  fcvt.s.w     ft1, s6
                  nop
                  fmin.s       ft4, fs4, fa2
                  lui          gp, 76293
                  remu         a1, a7, s8
                  div          a0, a5, s11
                  mul          s11, a2, sp
                  fsqrt.s      ft1, fa2, rtz
                  slli         s7, gp, 1
                  nop
                  mulhu        ra, s10, s9
                  mulh         sp, s7, t6
                  fmin.s       ft8, fs5, ft6
                  and          zero, a3, s7
                  fsub.s       fs1, fs9, fs7
                  srli         s1, s2, 29
                  srai         t3, s10, 5
                  divu         sp, t1, a2
                  fmv.w.x      ft3, a4
                  mulhsu       s9, sp, t2
                  fcvt.s.w     ft7, t3, rdn
                  fsgnjx.s     fs4, fs5, fs7
                  sub          s4, t4, s3
                  slt          t6, s9, s8
                  ori          a1, a1, 1842
                  sub          ra, a1, t6
                  lui          a4, 383755
                  fmul.s       fa5, ft6, fs7, rdn
                  fle.s        a3, fs11, fs11
                  srli         s1, ra, 22
                  auipc        s2, 831279
                  fmax.s       fs0, fa7, fs3
                  fsgnjx.s     fs11, ft11, ft11
                  fsgnjn.s     ft0, fs5, ft8
                  fcvt.s.w     ft7, s0
                  srl          a0, s11, s9
                  fmax.s       ft3, ft5, ft7
                  fcvt.w.s     s0, fs4, rne
                  fcvt.s.w     fs8, gp
                  fmul.s       fs0, fs9, fs3
                  fsqrt.s      fa6, fs8, rdn
                  feq.s        s3, ft4, ft0
                  fcvt.s.w     fa1, s2, rup
                  auipc        sp, 1022025
                  lui          s5, 214365
                  sltu         sp, a1, t5
                  mulh         sp, t0, t3
                  ori          a7, t4, 657
                  fle.s        s7, ft11, fs2
                  fsub.s       ft10, fa2, fa1, rdn
                  fsgnjn.s     ft10, fs6, ft11
                  fsgnj.s      fa4, fs2, fs2
                  feq.s        a0, ft4, fs8
                  slli         s7, t0, 16
                  fmin.s       fa4, fs8, ft10
                  fle.s        s0, ft3, ft11
                  fmin.s       ft6, ft10, ft10
                  fsgnjn.s     ft3, fa6, fs3
                  remu         sp, ra, s0
                  fdiv.s       ft9, fs3, ft7
                  fmul.s       ft0, fa0, ft10
                  fle.s        s11, ft2, ft6
                  add          t4, a1, a7
                  fmul.s       fa4, fa1, ft6, rdn
                  fmv.x.w      a7, fs3
                  fdiv.s       fa5, ft3, ft0, rne
                  addi         s0, s1, 1837
                  sub          s11, a3, s9
                  srai         a0, s6, 30
                  slti         s8, gp, 1103
                  ori          a0, s7, 642
                  sltiu        a7, t2, 1062
                  rem          s3, s9, s5
                  add          a3, s11, s6
                  xor          s2, t2, a1
                  or           s9, ra, s2
                  fadd.s       ft4, fs1, fs1, rup
                  div          s4, s5, t1
                  andi         tp, t6, -196
                  slti         s4, s7, 552
                  srli         a1, t4, 15
                  fcvt.wu.s    s9, fa5, rup
                  sltu         a3, a1, a6
                  fcvt.s.wu    fs8, a0
                  fmv.x.w      s2, fs3
                  fsgnjn.s     fa1, fa6, ft7
                  fadd.s       ft6, ft2, fs5, rdn
                  slti         s11, zero, 488
                  fmul.s       ft2, ft6, ft2, rup
                  divu         t4, s4, t6
                  add          a7, a0, s10
                  remu         s4, a5, t4
                  rem          t2, s6, ra
                  srai         t2, s3, 0
                  sub          t4, s5, t6
                  fsub.s       ft11, ft2, fa1, rmm
                  or           s7, s5, s8
                  addi         zero, tp, -12
                  fadd.s       fs0, fa2, fs4, rdn
                  mul          t6, a2, a6
                  fmul.s       ft3, fa7, ft1, rmm
                  fsqrt.s      fa2, fs8, rtz
                  fsub.s       fa7, ft1, ft8
                  rem          a3, s4, zero
                  fmax.s       ft11, fs6, fa4
                  auipc        s4, 267568
                  and          a6, t4, a1
                  fsub.s       ft1, ft10, fa6
                  fsgnjx.s     ft5, fs9, fs3
                  mulhsu       ra, t2, s4
                  mulhu        a6, ra, a6
                  fcvt.wu.s    a2, ft1, rmm
                  fsgnj.s      fs2, fs8, fs9
                  mulhu        s10, ra, t5
                  fle.s        t2, fa5, fs4
                  slli         a7, ra, 11
                  xori         t6, s2, 974
                  fcvt.s.w     ft1, s8, rup
                  fsub.s       fs4, ft11, ft9, rdn
                  fsgnjn.s     ft8, fs7, ft6
                  feq.s        gp, fa2, ft2
                  fsgnjn.s     ft9, fa0, fs7
                  fmv.w.x      fs1, t6
                  ori          a7, s2, 1126
                  fcvt.w.s     t3, fs11
                  lui          s5, 361430
                  mulhsu       s6, a2, a5
                  fcvt.s.w     ft1, ra
                  addi         gp, s4, 1496
                  feq.s        s5, fs1, ft4
                  fadd.s       ft1, fs9, ft11, rtz
                  fadd.s       fa5, ft6, ft5
                  fclass.s     s0, fs0
                  or           s2, a2, t0
                  flt.s        s9, fa3, fs1
                  div          s3, s1, s8
                  ori          t2, a5, -1044
                  slli         t4, a6, 25
                  mulhsu       a4, s9, s11
                  ori          t6, s9, 1064
                  or           a3, s10, s4
                  xori         a6, s1, 1905
                  fmin.s       ft2, fa2, fs1
                  fclass.s     a2, fs3
                  fclass.s     s2, ft7
                  srl          s0, a7, a1
                  and          s7, sp, a3
                  fsqrt.s      fs8, fa3
                  slt          s7, a3, a3
                  flt.s        s1, fs3, fs2
                  fsgnjx.s     fa6, ft4, ft7
                  fcvt.s.wu    fa1, s1, rne
                  sub          a7, s11, s7
                  fsub.s       ft10, fa1, fs2
                  xor          a0, a3, tp
                  mulhsu       a4, s10, gp
                  nop
                  srli         s2, t5, 23
                  mulhu        a3, a1, s4
                  fmv.x.w      s4, fa1
                  sra          s3, s3, s2
                  fadd.s       ft2, ft8, fa4, rne
                  sll          a7, a4, a4
                  srli         a6, a6, 3
                  slti         t2, a0, 1902
                  divu         ra, s11, a4
                  mulh         t3, a4, a3
                  remu         t6, a7, t0
                  fmv.x.w      a2, ft6
                  or           gp, a4, s6
                  auipc        s10, 968116
                  mulhsu       a0, s0, t0
                  fdiv.s       ft0, fa5, fa1
                  feq.s        zero, ft5, ft11
                  fcvt.s.w     fa5, a1
                  div          s7, a7, a6
                  auipc        s8, 576698
                  fmv.x.w      s1, fs7
                  xori         s3, a2, 1027
                  lui          a2, 786650
                  mulhu        s8, tp, s1
                  fadd.s       fa2, ft0, fa5, rtz
                  remu         s10, a7, a3
                  fdiv.s       fa5, fs7, fs8, rne
                  andi         a0, a4, 687
                  sra          a5, s8, s5
                  fsgnjx.s     ft8, ft11, ft10
                  fadd.s       ft7, fa7, fs10
                  remu         a6, a0, s10
                  fdiv.s       ft11, fs0, fs10
                  fmax.s       fa2, fs0, ft10
                  feq.s        t3, ft5, fs4
                  mulhu        a4, t0, s10
                  divu         t3, a7, t1
                  lui          t4, 548519
                  add          s3, s9, gp
                  xor          gp, a6, s3
                  fcvt.s.wu    fa7, t0, rtz
                  fadd.s       fa3, fs10, fs6
                  sub          ra, s9, t2
                  sra          zero, gp, s2
                  nop
                  fmin.s       ft5, fs7, ft1
                  fclass.s     s10, fs9
                  fmul.s       fa7, fa6, ft7
                  fmin.s       fa0, ft8, fa5
                  divu         s2, t1, a5
                  fsgnjx.s     ft3, fs8, fa5
                  andi         tp, s6, 240
                  feq.s        a3, fs3, ft3
                  add          s5, tp, s6
                  srl          s3, ra, t3
                  flt.s        s2, fs8, fs3
                  fsgnjn.s     ft4, ft1, ft7
                  fcvt.s.w     ft4, a3
                  and          s7, zero, a2
                  fsgnjx.s     fs4, ft1, ft8
                  fclass.s     ra, ft1
                  feq.s        a1, ft5, fs11
                  sub          s4, t6, t0
                  and          s8, t3, s5
                  fsub.s       ft10, ft2, ft2, rne
                  or           s10, s5, a6
                  fsgnj.s      ft4, fa6, ft5
                  rem          s9, s8, t1
                  feq.s        sp, fa4, ft4
                  sltu         a7, a7, t3
                  rem          t6, t0, t6
                  srli         t4, t5, 1
                  fsgnjx.s     ft8, fa5, ft0
                  fclass.s     a1, fs9
                  fmv.x.w      zero, ft9
                  fsgnjx.s     fs2, ft3, fs0
                  auipc        gp, 353098
                  mul          a7, s4, s6
                  fsgnjn.s     fa3, ft3, fa6
                  andi         a4, s5, 512
                  fcvt.wu.s    t3, ft4, rtz
                  or           zero, a5, t5
                  fle.s        zero, fs3, ft3
                  fmin.s       fs2, fa6, fa5
                  fclass.s     tp, fs3
                  fcvt.wu.s    s0, fs8, rtz
                  lui          s10, 974001
                  fmin.s       ft0, fs8, fs4
                  nop
                  sltiu        s6, tp, 2017
                  auipc        s6, 574731
                  sltiu        s4, ra, -34
                  sltiu        s1, a6, 1818
                  div          a6, zero, t0
                  divu         s2, s3, a6
                  mulhu        a3, s4, s10
                  fadd.s       ft11, fs7, ft6, rmm
                  fmax.s       ft6, ft0, fa7
                  add          a2, a1, s1
                  flt.s        s2, fa6, fa7
                  add          a2, tp, s1
                  mul          sp, t0, zero
                  auipc        t4, 140209
                  fsqrt.s      fa6, fa3, rmm
                  remu         tp, a1, tp
                  add          s7, t5, tp
                  fle.s        s9, ft11, fs6
                  sltiu        s9, s0, -2036
                  fcvt.w.s     a5, fa1
                  div          a5, a4, sp
                  srai         s4, a6, 5
                  sub          s4, s3, a7
                  fsub.s       fs2, fs9, fs3
                  div          a2, ra, t1
                  fsub.s       ft6, fs7, fa5, rne
                  fmin.s       fs6, ft1, fs6
                  sltu         s6, t0, a4
                  fadd.s       fs4, ft6, fa6, rup
                  divu         ra, a2, s3
                  mulhu        t3, gp, a5
                  fcvt.s.wu    fa3, ra
                  fsub.s       ft4, ft4, fs11, rne
                  fmv.x.w      sp, ft6
                  fsgnjx.s     ft8, fs11, fa5
                  sltu         a0, a6, t3
                  sub          s8, zero, t1
                  or           s7, s4, s7
                  xor          s10, t6, t4
                  rem          s0, a3, t5
                  lui          s5, 36057
                  fmv.w.x      fs10, a3
                  nop
                  xori         s5, a6, 1502
                  ori          t3, a7, -1779
                  fmv.x.w      ra, fs5
                  sltiu        t6, t4, -456
                  sra          s10, a4, t1
                  sra          t2, s10, s9
                  fcvt.s.wu    fa1, t6, rup
                  sltiu        s11, a4, 1343
                  div          s5, t2, s2
                  xor          s9, a3, sp
                  addi         s6, s5, 1538
                  lui          s1, 760681
                  fsub.s       ft8, ft9, fa4
                  and          a5, s5, ra
                  ori          s5, gp, 147
                  fle.s        s10, fs5, ft0
                  sll          s9, t2, ra
                  mulhu        t6, zero, gp
                  feq.s        s1, fa2, fa4
                  mulh         a7, gp, s10
                  fle.s        a2, ft11, ft3
                  fsgnjx.s     fs5, ft5, ft10
                  slli         tp, t5, 29
                  slli         s4, sp, 10
                  sltu         t2, a3, a1
                  fsub.s       ft1, fs9, fs8
                  fadd.s       fs5, fs8, fs1, rdn
                  sltu         a0, sp, a1
                  fcvt.s.w     fs6, s6, rtz
                  fmin.s       ft9, ft4, fs1
                  auipc        s9, 901022
                  flt.s        t3, fs3, ft6
                  srli         s0, gp, 9
                  sra          s7, a1, t6
                  srai         s6, s1, 1
                  xor          s2, sp, s11
                  sll          s9, s7, gp
                  fsgnj.s      fs3, ft7, ft8
                  or           a1, s1, zero
                  xori         s11, t5, -214
                  ori          a0, gp, -49
                  sra          ra, t4, ra
                  and          s1, s7, s0
                  fmax.s       fa6, ft2, ft8
                  fsgnjn.s     fs9, fa2, fa3
                  sub          t2, s6, a6
                  slli         zero, sp, 29
                  fadd.s       fa1, ft3, fs1, rdn
                  xori         a5, zero, 494
                  remu         s2, a4, s1
                  add          s2, s7, s11
                  sltiu        s4, s10, -1775
                  add          s0, s1, t5
                  fsgnjn.s     ft9, fs1, fs4
                  div          tp, s11, ra
                  feq.s        t3, ft0, ft9
                  mulh         tp, s4, t1
                  fclass.s     s1, ft10
                  fadd.s       fs7, fa2, fs11, rup
                  fmin.s       fs3, fs8, ft9
                  fdiv.s       fs3, fs3, ft1, rdn
                  fmv.x.w      a5, fa5
                  lui          t3, 782198
                  nop
                  rem          t4, s4, a6
                  fcvt.s.w     fs4, s7
                  fmv.x.w      sp, ft2
                  fmv.x.w      s1, ft1
                  rem          s9, tp, a4
                  fsgnj.s      ft8, fa7, fs3
                  fsgnj.s      ft5, fs8, fa5
                  mul          gp, s9, a1
                  sltu         s0, a6, a3
                  srai         a4, gp, 13
                  addi         a7, a4, -1766
                  lui          sp, 964101
                  sll          s1, s10, a2
                  fmv.x.w      sp, fs10
                  fadd.s       ft7, ft11, fs4
                  sltu         s11, s7, a6
                  fcvt.wu.s    a5, ft5, rtz
                  fdiv.s       fa4, fa3, fs8
                  and          s6, t4, t5
                  xori         s11, gp, 700
                  fle.s        a4, ft1, fa6
                  fsgnjx.s     fa4, fs8, fa6
                  fmin.s       fs4, ft4, ft9
                  addi         ra, ra, -1039
                  mulhu        s5, a3, t1
                  addi         zero, a0, 1975
                  fmin.s       ft11, ft11, fs5
                  remu         s1, s11, t6
                  and          s6, s1, s6
                  fcvt.wu.s    s9, fa5
                  fmv.w.x      fs2, a1
                  auipc        t6, 691519
                  fsgnj.s      ft9, fs0, fa5
                  slli         t3, s0, 25
                  fsgnjn.s     ft11, fa7, ft3
                  slti         t6, s9, 1016
                  fcvt.w.s     zero, fa1, rdn
                  fcvt.s.wu    fa6, a2
                  xori         s6, a2, -1574
                  and          s2, a2, s11
                  sltu         s8, t0, t6
                  slt          s2, s2, s11
                  fmax.s       ft9, fa7, fs8
                  fsub.s       fa0, ft7, fs11, rmm
                  srai         ra, a6, 3
                  fmv.w.x      ft6, tp
                  slt          a2, t0, s8
                  fsgnjn.s     fa0, ft11, fs8
                  mulhu        zero, s0, a3
                  mulhsu       s6, t6, gp
                  fle.s        a4, ft1, fs7
                  remu         s10, t3, a3
                  ori          a4, s4, 470
                  fcvt.wu.s    sp, fa2, rdn
                  srl          s8, t3, s1
                  auipc        a3, 924770
                  slti         t2, a0, -131
                  sll          zero, a5, s9
                  srli         t2, t1, 11
                  sltiu        a1, s2, -375
                  fsqrt.s      fa4, ft1
                  fle.s        ra, ft0, ft7
                  flt.s        a5, ft0, fa6
                  fadd.s       fs9, fs3, fa4, rne
                  sll          ra, t0, a1
                  fmax.s       fs11, fa7, fa1
                  add          t6, t0, ra
                  fsgnjn.s     fa4, fa6, fs5
                  fsgnj.s      fs7, ft2, ft2
                  sltu         a3, s3, t2
                  andi         a1, t2, -437
                  mulhu        a7, a3, t3
                  auipc        t4, 848076
                  fle.s        t2, fs4, ft3
                  slli         t6, s7, 28
                  andi         a4, a3, -724
                  slt          a0, s8, a6
                  fcvt.s.wu    ft6, s11, rdn
                  fclass.s     s9, fs5
                  auipc        a7, 557380
                  fmv.w.x      ft8, a1
                  mulhsu       s5, s4, t4
                  xori         t4, a6, 1603
                  sub          a3, a0, ra
                  fdiv.s       fa3, ft2, ft5
                  srl          a7, t3, s0
                  fdiv.s       ft6, ft6, fs1, rmm
                  mulhsu       t4, a7, s1
                  mul          s1, t4, t6
                  and          s4, s7, a6
                  fmv.w.x      fa0, a5
                  fsgnjn.s     fa0, fs8, ft8
                  fmax.s       fa6, ft10, ft9
                  fmv.w.x      fa7, s2
                  fmin.s       ft0, fs1, fs1
                  sra          s10, t0, s8
                  mul          gp, s2, t0
                  fsqrt.s      ft3, ft5, rne
                  slti         s2, s4, -1616
                  add          s8, a5, s4
                  slti         gp, t1, -1714
                  sub          a4, s0, zero
                  slt          s4, a3, sp
                  and          a4, s10, a6
                  nop
                  remu         sp, s10, t6
                  fmv.w.x      ft11, t0
                  sltiu        a4, a4, 682
                  feq.s        zero, ft2, ft9
                  ori          s0, s6, -889
                  fmin.s       ft1, ft6, fs9
                  lui          sp, 500562
                  add          s2, s8, a2
                  srai         tp, sp, 19
                  flt.s        gp, fs9, fa7
                  ori          t2, sp, -1508
                  add          a7, a5, t6
                  remu         s2, s8, a1
                  fmin.s       fa7, fa2, fa5
                  fcvt.w.s     gp, fs5
                  div          s6, t4, s1
                  feq.s        s1, fa1, ft0
                  srl          ra, t4, s1
                  fcvt.s.wu    fa7, t3
                  mulhsu       a1, s5, a7
                  mulhu        s10, a5, t6
                  andi         a1, a5, 1594
                  sltu         s11, s11, sp
                  mulh         s9, a0, s5
                  fsgnj.s      fs2, ft7, ft8
                  divu         s8, tp, gp
                  flt.s        s1, ft6, fa3
                  sra          a6, a1, a0
                  fcvt.w.s     s3, ft4, rne
                  andi         s10, s9, -630
                  remu         s5, s4, s1
                  fmv.w.x      ft10, s9
                  fmax.s       fa6, ft10, ft7
                  xor          s11, s6, a6
                  lui          t3, 368432
                  fsub.s       fs1, ft5, fs4
                  nop
                  srai         s8, a3, 23
                  slti         sp, ra, -1421
                  sltiu        s2, s3, -1822
                  slt          s6, zero, t0
                  andi         zero, ra, -32
                  sra          zero, s9, t4
                  slti         s4, tp, 260
                  fmin.s       ft6, ft7, fa7
                  feq.s        a7, ft11, fs9
                  fdiv.s       fs6, fs0, fa0, rdn
                  addi         s4, s3, -325
                  fmin.s       fs5, ft2, fs0
                  srli         s8, a5, 9
                  mulh         tp, s11, s7
                  fsgnjx.s     fs5, ft4, fs8
                  andi         s8, a2, -1287
                  sra          s3, tp, s4
                  lui          s11, 598926
                  xor          a4, s0, s2
                  feq.s        gp, fa7, fs7
                  ori          s0, s3, 1471
                  flt.s        a2, fs6, ft2
                  nop
                  ori          t3, t5, -1710
                  fsgnjn.s     ft4, fs1, fa6
                  fclass.s     a3, fa2
                  add          s4, a0, s1
                  slli         s4, ra, 11
                  fmv.w.x      fs7, t6
                  fcvt.s.wu    fs5, s7
                  fclass.s     s10, ft0
                  divu         gp, a6, a2
                  srl          tp, t0, s8
                  fcvt.w.s     s11, fs11
                  fle.s        s0, fa2, fs11
                  mulhsu       a1, gp, s7
                  fmv.x.w      tp, ft3
                  sub          a3, s7, t6
                  fle.s        s4, fs6, ft2
                  fadd.s       ft9, ft9, ft0
                  feq.s        a3, fa4, ft4
                  fcvt.s.wu    ft3, zero
                  fmin.s       ft4, ft3, ft9
                  mulhsu       s3, a5, s9
                  srai         s8, a6, 28
                  fcvt.wu.s    s4, ft3, rmm
                  mulh         tp, t1, s11
                  divu         s0, s11, a2
                  fcvt.s.wu    ft5, t3, rtz
                  xori         a7, s11, 580
                  xor          s4, t6, t4
                  remu         zero, t6, s6
                  fmax.s       ft6, fa2, fs0
                  divu         a4, t3, a1
                  or           a4, a7, a0
                  fcvt.s.wu    ft4, a7, rmm
                  fcvt.w.s     s0, fa6, rmm
                  and          t3, a6, a1
                  sub          s6, t4, s11
                  fmax.s       fa0, ft8, ft1
                  srl          gp, s1, sp
                  nop
                  add          a5, a4, s1
                  fcvt.s.w     fs5, t6
                  andi         a0, a6, -2038
                  rem          t3, a4, sp
                  auipc        sp, 840433
                  sub          s9, s1, t2
                  fmv.x.w      sp, ft0
                  srai         a2, t0, 19
                  fsgnjx.s     ft11, ft1, fa3
                  fdiv.s       fa2, fa5, fs10, rtz
                  srai         s5, t6, 6
                  and          a1, s5, gp
                  remu         s11, s8, sp
                  fle.s        t3, ft3, ft1
                  fmv.x.w      gp, fs8
                  ori          s9, a6, -1699
                  srai         s1, t1, 27
                  add          s4, a6, zero
                  sll          a3, a6, s0
                  fmul.s       fs9, ft4, ft4
                  slti         s7, s7, -1363
                  srai         a3, s7, 27
                  xori         s4, t0, -1563
                  fcvt.s.wu    ft7, s6, rup
                  rem          zero, gp, s3
                  slt          t3, a5, a6
                  fsqrt.s      fa4, ft2
                  fsgnjn.s     ft10, fs5, fa6
                  xori         zero, ra, 880
                  fsub.s       fs7, fa4, ft8, rtz
                  fsgnjx.s     fs5, fs5, fa1
                  feq.s        a1, ft11, ft11
                  fcvt.wu.s    a4, fa3
                  fcvt.wu.s    a0, fa6
                  fmax.s       fs2, fs9, ft1
                  slti         t2, s4, -1804
                  fsgnjn.s     fs3, fs2, fa5
                  slli         s2, s7, 10
                  nop
                  rem          t2, s1, zero
                  fsgnjx.s     fs4, fs0, ft0
                  mulh         t6, s7, t0
                  fcvt.s.wu    fa1, s10
                  feq.s        gp, fs10, fa5
                  mulhu        a7, a4, t1
                  srai         s11, s9, 19
                  slt          s6, s2, s5
                  sra          t6, s0, t0
                  fadd.s       fa5, fs3, fs8
                  add          t4, a0, s9
                  ori          s9, a3, 1029
                  auipc        s5, 301884
                  divu         s6, s3, s7
                  mulhu        sp, s4, a2
                  ori          s8, t3, -164
                  fclass.s     s1, ft11
                  or           t3, gp, t5
                  sll          s8, tp, s10
                  fsgnj.s      ft1, fs11, fs1
                  fclass.s     t3, ft9
                  sra          t6, sp, a1
                  fle.s        a7, fs4, fa7
                  flt.s        s11, ft2, fa5
                  fmv.x.w      s5, fs8
                  fsgnjn.s     ft11, ft10, ft2
                  sll          s8, s2, a3
                  fle.s        gp, fs6, ft4
                  add          t2, s1, t1
                  fmul.s       fs10, ft10, fa7, rtz
                  fsgnj.s      fs2, fa5, fs6
                  sltiu        a4, s6, 53
                  auipc        a2, 924493
                  and          gp, tp, s10
                  fmv.x.w      s4, ft3
                  sra          a1, s3, a0
                  addi         s2, s4, 1470
                  mul          s2, s9, t4
                  nop
                  mulhu        zero, s3, s9
                  mul          a0, ra, s1
                  slti         s4, t2, -52
                  auipc        t6, 763833
                  andi         s2, a7, -896
                  srl          s2, s10, ra
                  xor          zero, t6, s9
                  mulh         ra, s11, a3
                  fsgnj.s      ft3, ft0, ft9
                  fcvt.s.w     fa1, a5
                  fsqrt.s      ft5, fs6, rne
                  sltu         s0, s7, a0
                  sltu         s4, s0, t0
                  slti         ra, tp, -1710
                  fmax.s       fa5, ft6, fa6
                  andi         t2, s3, -1120
                  xor          s8, a0, t4
                  flt.s        a0, fs1, fs6
                  mulhu        t6, s8, a5
                  fsqrt.s      fs10, fs3, rdn
                  slli         a4, a1, 0
                  fcvt.s.w     fa2, s7, rmm
                  feq.s        s2, fs0, fa5
                  sll          a3, a0, s9
                  fmv.x.w      t3, ft7
                  fcvt.wu.s    gp, fa6
                  mulhsu       s5, t4, s10
                  mulhsu       gp, s8, s3
                  fmv.x.w      tp, fs7
                  rem          s4, s2, t2
                  xor          gp, a0, a1
                  flt.s        a2, fs8, fa7
                  addi         zero, t4, 613
                  fmin.s       fa6, fs8, fs7
                  sub          a1, t5, tp
                  sll          tp, a6, a4
                  divu         a2, t1, t3
                  rem          tp, a5, t5
                  ori          t6, a3, -466
                  sll          s11, a5, s5
                  fclass.s     ra, ft7
                  sltu         a6, s3, t1
                  fsub.s       ft8, ft6, fs6
                  fclass.s     s7, ft5
                  div          tp, s2, a1
                  rem          zero, a2, a1
                  fmv.w.x      ft7, a3
                  fmin.s       ft5, fs11, ft10
                  rem          tp, s7, a7
                  xori         s9, s3, 382
                  fmv.x.w      a1, ft11
                  srli         s5, s6, 17
                  xor          s2, s7, t6
                  fmax.s       ft3, fa6, ft4
                  sra          s6, a0, t0
                  fdiv.s       ft5, fa4, ft6
                  fmax.s       fa2, fa5, ft10
                  fsgnjx.s     ft0, fa2, fa0
                  slli         a6, t6, 20
                  slti         a4, a0, 503
                  divu         s5, s8, s7
                  andi         a2, s9, 386
                  srai         s2, s8, 16
                  flt.s        s3, ft5, fs8
                  fsgnjx.s     ft8, fs9, fs3
                  sll          a6, a7, s0
                  sltiu        s3, s8, 308
                  slli         gp, t6, 28
                  fcvt.s.w     fs9, s1, rup
                  sltu         a2, t1, t2
                  fmax.s       fa0, fa7, ft3
                  auipc        s0, 728472
                  flt.s        t4, ft4, fs3
                  fcvt.s.wu    ft11, tp, rmm
                  sra          s2, t3, t4
                  rem          t6, a1, a2
                  xor          s6, ra, a6
                  fmul.s       ft8, fs6, fa6, rne
                  auipc        t6, 372951
                  or           zero, ra, sp
                  xori         a3, s4, 589
                  fadd.s       ft8, fs3, fs7
                  fcvt.s.wu    fs3, s4
                  fsub.s       ft7, fa6, ft4
                  fsgnjx.s     fa1, fa3, fa6
                  xor          a0, s10, t5
                  add          a2, zero, a5
                  mul          s7, s0, a4
                  slli         a1, s9, 30
                  fmul.s       fs10, fs3, fs4, rne
                  xori         t6, s5, 1535
                  fcvt.wu.s    gp, fa0
                  fmv.w.x      ft3, a4
                  mulhsu       t6, t1, a0
                  auipc        sp, 265229
                  div          a4, a2, a4
                  fsgnj.s      ft3, fa4, fs5
                  sltiu        gp, s2, 478
                  fcvt.s.w     fa4, zero, rup
                  fmin.s       fs6, fs1, fs9
                  mulhsu       s4, t6, t0
                  fsgnjn.s     ft10, fa2, ft1
                  divu         s2, s4, s4
                  sub          s1, t4, a6
                  ori          s6, ra, 798
                  fmax.s       ft3, fa6, fs2
                  fclass.s     t4, fs6
                  fmax.s       ft11, ft3, fa5
                  remu         s6, gp, a4
                  srai         s8, tp, 22
                  srli         a5, s4, 27
                  andi         s2, ra, -566
                  and          s0, tp, a2
                  ori          s0, sp, -669
                  slti         s7, zero, 856
                  fsgnjx.s     ft3, fs6, fa6
                  fcvt.wu.s    zero, ft4, rtz
                  fcvt.s.wu    ft2, t1, rmm
                  remu         s7, a5, s1
                  mulhu        s6, t2, s6
                  fmax.s       fs3, ft5, fs1
                  div          s4, s5, s11
                  xor          zero, t0, a7
                  fcvt.w.s     s2, ft8, rne
                  andi         a5, s0, -584
                  fadd.s       ft6, ft10, fs10, rne
                  ori          sp, a5, -433
                  mulhu        a0, gp, sp
                  rem          ra, ra, s11
                  remu         a6, s2, a0
                  slt          a2, a6, s7
                  fclass.s     t2, ft9
                  or           s2, sp, a7
                  feq.s        a1, fa6, fa3
                  fclass.s     s8, ft0
                  srli         ra, s10, 8
                  xori         s10, a5, -1278
                  fsgnj.s      fs7, fs3, ft8
                  lui          s9, 94132
                  slt          s11, t2, a2
                  add          s8, t1, a2
                  fsgnjx.s     ft2, fs4, fa2
                  slti         a2, t3, -601
                  div          a2, s4, s11
                  fmv.w.x      ft5, tp
                  fcvt.s.wu    ft1, t2
                  add          s11, s9, t0
                  fadd.s       fa0, fs9, ft10, rup
                  fcvt.wu.s    a1, fs6, rne
                  sltiu        t6, s0, -1635
                  fmul.s       ft5, fs4, ft5
                  fsgnjx.s     ft5, fs2, fa6
                  auipc        t3, 492463
                  lui          a3, 385267
                  mulh         a4, s10, s10
                  fmin.s       fa6, ft5, fs2
                  ori          s0, ra, 1719
                  mulhsu       s11, s5, a0
                  remu         s3, s9, t4
                  slli         ra, a4, 4
                  fmin.s       fs10, ft3, fa2
                  sltu         a7, a2, a0
                  fadd.s       fa1, fs10, ft6, rmm
                  sub          a4, a0, t0
                  mulhsu       s11, t3, a6
                  mulh         a7, s4, s2
                  srai         s9, a6, 18
                  xori         a1, s8, -282
                  fcvt.wu.s    a7, ft7
                  fsqrt.s      fs1, fa2
                  fadd.s       fs10, ft6, ft4
                  fmin.s       fa2, fs7, ft10
                  slli         a6, t3, 24
                  fcvt.s.w     ft8, tp, rne
                  sll          ra, s6, s11
                  sltiu        a4, a4, -1211
                  srli         s2, a2, 17
                  fsqrt.s      ft9, fa5, rne
                  srl          s5, s0, s7
                  feq.s        s3, fa4, ft2
                  sra          s5, a2, a2
                  sub          s4, s2, s5
                  fsqrt.s      fs7, fs10
                  fadd.s       ft9, fa5, fs1
                  or           a0, a6, t5
                  div          s7, s8, a5
                  auipc        s6, 970377
                  feq.s        a7, fs4, fs8
                  fadd.s       fs7, fs9, ft3, rup
                  and          s7, tp, zero
                  fsgnj.s      fs4, ft5, fa4
                  sub          a1, ra, a3
                  srl          t6, s2, s6
                  fsqrt.s      fa6, ft7
                  slti         a5, s6, -839
                  mulh         s3, ra, s5
                  fmul.s       ft9, fs7, fa7, rtz
                  rem          a0, a1, sp
                  slti         a3, t1, -1797
                  mulhu        t3, t3, s5
                  srl          a5, s10, s2
                  slt          a5, s1, s6
                  addi         ra, s3, -1562
                  feq.s        s0, fs11, ft9
                  sra          s3, zero, a2
                  addi         gp, tp, -1976
                  sll          a2, s8, t4
                  fsgnjn.s     ft5, fa6, fa6
                  addi         s0, s3, 1211
                  rem          a5, sp, ra
                  mulhsu       s7, t3, s9
                  fmax.s       fa3, ft10, ft5
                  fsgnjx.s     fs4, fa4, fa0
                  addi         ra, s7, 191
                  slti         s5, a2, 1399
                  sll          sp, ra, s7
                  xor          t2, s6, t2
                  sltiu        s0, t6, -1325
                  and          s1, a2, t4
                  mulhsu       s8, t6, gp
                  ori          gp, s4, 858
                  slti         s5, s11, -1748
                  xor          s3, s9, a6
                  fclass.s     s3, fs9
                  srli         t3, s11, 16
                  ori          s11, t0, 1477
                  fsgnjn.s     fs6, fs8, fs3
                  fsgnj.s      fs3, ft1, fs4
                  flt.s        zero, fs3, fa4
                  srli         s1, t4, 27
                  fadd.s       ft10, ft4, ft10
                  xor          s3, s3, tp
                  fcvt.w.s     a5, fa1
                  fmax.s       fs10, fa3, fs10
                  slli         t3, a7, 30
                  sltu         s11, s5, s0
                  divu         t6, t0, s1
                  feq.s        s2, ft2, ft7
                  sltu         tp, s8, t3
                  mulhu        s2, s7, a1
                  slli         s8, a6, 8
                  add          a3, s2, t2
                  fmul.s       ft7, fa1, ft10, rne
                  fmul.s       ft7, ft8, fa1, rtz
                  fmin.s       fa5, ft5, fa0
                  xor          a3, s4, t1
                  remu         s11, s2, s6
                  sub          t6, t0, s8
                  fmax.s       fs2, ft3, fs5
                  fmin.s       ft7, fs11, fa1
                  addi         s1, gp, -1257
                  div          t6, s1, t2
                  xori         gp, tp, -1093
                  fcvt.s.wu    fa6, s6, rmm
                  xor          ra, s6, a5
                  fcvt.s.w     fa6, s2, rdn
                  mul          a3, s11, a6
                  slt          s3, s8, a1
                  fdiv.s       fa7, ft4, ft9, rdn
                  srl          s7, a3, t5
                  addi         a5, s1, 2043
                  fsgnjn.s     fs5, ft2, fs7
                  sra          s4, t4, s0
                  andi         a2, s9, 1569
                  fmin.s       fs4, ft10, fs0
                  andi         a6, s5, -1650
                  srai         a3, s3, 12
                  fsgnjn.s     ft3, fs10, ft6
                  or           a5, s8, t1
                  xor          t2, a2, a5
                  nop
                  nop
                  fcvt.wu.s    s7, fs2, rne
                  fdiv.s       ft5, ft11, fs3
                  feq.s        a7, fa3, ft9
                  slt          s5, s0, s11
                  fdiv.s       fa2, ft9, ft8
                  or           s7, sp, gp
                  fsgnjn.s     ft10, fs0, ft4
                  sra          s6, t5, t2
                  slli         a7, s4, 27
                  mulh         s10, s9, s10
                  srai         a7, gp, 6
                  sra          a0, s1, t6
                  fclass.s     s3, fs2
                  fcvt.wu.s    s1, fs7, rdn
                  srl          s5, t5, t1
                  sltiu        gp, ra, 426
                  fcvt.wu.s    s6, fs1, rne
                  sub          a1, a6, a3
                  fmin.s       ft2, fa4, ft4
                  add          s5, s5, zero
                  auipc        t2, 700045
                  sltu         t3, t5, s5
                  srai         s8, t0, 21
                  sll          t2, s2, t3
                  fsgnjn.s     ft6, fa3, fa7
                  fclass.s     s1, ft9
                  slt          s3, a0, a1
                  andi         t4, sp, 1306
                  andi         s7, t6, -1859
                  and          s10, s3, gp
                  fsub.s       fs6, fs7, ft0, rdn
                  fdiv.s       fa3, fs1, ft8, rmm
                  fmv.x.w      s8, fa7
                  addi         a4, s11, -199
                  mulh         a1, t0, sp
                  srli         tp, a7, 18
                  and          s9, tp, a6
                  fle.s        a3, fs2, fa3
                  auipc        s9, 403988
                  fadd.s       ft1, fa1, ft9, rup
                  ori          s2, t0, -1643
                  fsgnj.s      fs1, ft7, ft7
                  xor          s4, s11, s7
                  ori          s3, s7, -789
                  divu         s2, s7, a3
                  flt.s        s4, ft9, fs10
                  fdiv.s       fa2, ft10, fs10, rtz
                  ori          a4, t6, -924
                  sll          a6, a7, t2
                  sltu         ra, s10, s11
                  fmv.x.w      zero, fs6
                  fsgnjx.s     fs10, fs1, fa6
                  mul          s2, s2, s4
                  mul          s7, s3, s1
                  fsub.s       ft9, fs0, fs0, rtz
                  mulhsu       t6, ra, a4
                  sltiu        a3, t0, 212
                  mulhu        a4, a4, s4
                  fclass.s     s1, fs0
                  sltiu        s0, t1, 1257
                  fcvt.s.wu    fs7, s1
                  sltu         a7, tp, s7
                  sub          s10, s9, a0
                  fmax.s       fa4, fa4, fs6
                  fsgnj.s      fs11, fs7, fs0
                  rem          a2, s1, t3
                  slli         s7, a0, 30
                  fmv.x.w      t2, ft4
                  flt.s        gp, ft5, ft5
                  srli         s2, s7, 6
                  fsgnj.s      ft7, fs3, ft4
                  add          s3, s4, s3
                  sub          a4, tp, t4
                  remu         a0, t4, a0
                  xori         a6, a0, -1502
                  fmin.s       ft3, fs11, ft9
                  nop
                  fclass.s     s5, fa3
                  srl          t2, s3, s8
                  fmin.s       ft8, fs2, fa3
                  srli         t4, s11, 1
                  slt          s1, t2, t6
                  slti         s1, ra, -1698
                  slli         a3, s10, 29
                  rem          s0, s3, s8
                  sltu         ra, t0, s10
                  fmin.s       fa7, fa5, fs4
                  andi         ra, gp, 1782
                  sub          a5, a4, s2
                  fsgnjx.s     fs6, fs1, ft9
                  lui          s4, 679625
                  auipc        s4, 304814
                  sub          a2, sp, s5
                  and          t2, a6, a2
                  remu         sp, s1, s10
                  fmin.s       fs2, fs10, fs7
                  fcvt.w.s     sp, fs0
                  lui          zero, 285324
                  sub          s0, a7, s11
                  div          s2, s2, zero
                  ori          s9, t0, 1958
                  mulhsu       sp, s1, s0
                  addi         a5, a2, 674
                  auipc        s9, 431753
                  remu         s9, a4, s3
                  slti         s0, a0, 605
                  sub          s9, t0, s4
                  fmul.s       fa7, fs5, fs3, rdn
                  fcvt.s.w     fs11, t3
                  fsgnj.s      fs1, fs10, fs10
                  flt.s        s10, fs5, ft1
                  ori          zero, s2, -1304
                  mul          a5, s0, t3
                  sra          a5, s11, a4
                  ori          s3, a3, -1168
                  fdiv.s       fa1, fs0, fs3, rup
                  andi         sp, s3, 550
                  add          s9, s10, a5
                  addi         sp, s6, -326
                  fmul.s       ft0, fa7, ft8
                  mulhsu       s1, s8, t5
                  fadd.s       ft9, ft7, fa0
                  fmul.s       fa4, ft8, ft3, rmm
                  fsgnj.s      fs11, ft5, fs6
                  srl          sp, a3, a5
                  fdiv.s       fs9, ft5, fs0, rmm
                  divu         s9, s11, t1
                  fmul.s       fs1, fs1, ft1, rtz
                  fsgnj.s      fa3, fa6, fa5
                  fsgnjx.s     fs4, fa0, fs4
                  slt          s8, s0, t2
                  fmv.x.w      a5, fs4
                  fadd.s       fa6, fs9, fs6, rne
                  divu         s3, sp, s10
                  slt          s4, s10, t4
                  sra          a0, s6, zero
                  sltu         t6, s9, s5
                  fsgnjn.s     fs3, ft3, ft11
                  fmul.s       fs4, fs4, ft11
                  fsgnjn.s     fs10, ft0, fs10
                  srli         s10, s4, 4
                  sltiu        sp, s5, 475
                  fmax.s       fa7, fs0, fa4
                  add          sp, t5, t3
                  fadd.s       fs2, ft8, fs10, rmm
                  fmv.x.w      a0, ft4
                  fsgnj.s      ft2, fs10, fs5
                  fcvt.s.w     ft0, s2
                  fsub.s       fs7, fa1, ft0, rne
                  feq.s        t4, fs2, ft0
                  flt.s        s3, fs10, fa2
                  sltiu        gp, a2, -914
                  fmin.s       ft1, fa2, fa4
                  sltiu        a1, t6, 661
                  remu         a5, t1, t2
                  add          t2, s7, a6
                  fmul.s       fs4, fs8, fa0
                  mulhsu       tp, t1, a0
                  slt          a1, s11, s6
                  fsgnjn.s     fs3, fa6, fs4
                  fmin.s       fa4, fa3, fs11
                  fcvt.s.wu    ft9, s0
                  fcvt.s.wu    fs7, s5
                  mulh         s1, gp, s3
                  fle.s        t4, fa2, fs0
                  slli         s7, s3, 2
                  fcvt.wu.s    a5, fa4
                  sra          zero, a7, s6
                  andi         t3, t4, -178
                  addi         t3, t3, -1399
                  fmax.s       ft7, fs11, ft7
                  xori         s8, s4, 1917
                  fcvt.s.w     fs4, s11, rup
                  mulhsu       a3, tp, a2
                  fsgnj.s      fs11, fs8, fs2
                  feq.s        s1, fs7, fa6
                  fsgnj.s      fa0, fs7, fa0
                  rem          s6, t0, a1
                  xori         a0, s10, 1476
                  fle.s        s2, fs7, fs7
                  lui          tp, 495636
                  fmin.s       ft9, ft7, ft11
                  mulhsu       a4, s8, ra
                  auipc        a7, 289050
                  fcvt.wu.s    t4, fs11
                  fcvt.w.s     sp, ft0, rmm
                  divu         s3, a7, a1
                  mul          s2, s2, s1
                  divu         zero, s5, t3
                  sltiu        s4, a1, -1582
                  or           a1, tp, s6
                  fmax.s       fs0, ft3, fs4
                  feq.s        zero, ft11, fa4
                  fsqrt.s      ft4, fs2, rup
                  fmul.s       fs10, fs1, fs1, rtz
                  fcvt.s.wu    ft1, a0
                  andi         tp, s10, 1938
                  fcvt.w.s     s3, ft7, rdn
                  flt.s        a0, fa5, fs7
                  srl          a4, s0, t3
                  mul          a2, s4, s4
                  xor          t2, s6, a4
                  or           a6, t4, t0
                  and          tp, tp, s5
                  ori          s5, s6, -1764
                  fadd.s       fs9, fa3, fa4
                  fsub.s       fa4, fs5, ft0
                  fsgnjx.s     fs11, fs5, fa5
                  fsgnj.s      ft7, fa0, fs4
                  fsub.s       ft6, fa7, ft2, rne
                  remu         gp, s9, s9
                  srai         s11, tp, 17
                  fmul.s       ft4, fa1, fs1
                  fle.s        s11, fs6, ft9
                  slti         a5, s9, -1021
                  fmv.w.x      fs9, t5
                  slt          a2, ra, ra
                  and          s2, t0, t6
                  fcvt.wu.s    t4, fa3, rtz
                  fcvt.s.w     fs11, a1, rne
                  slli         s8, zero, 9
                  fsub.s       fs4, ft1, fs6
                  and          zero, s5, t3
                  andi         zero, t2, -1396
                  fcvt.s.w     fs10, t0, rtz
                  srli         s10, zero, 24
                  divu         s2, s6, t5
                  and          gp, s2, s2
                  fsub.s       ft3, ft6, ft11, rup
                  mul          tp, t1, a6
                  srai         s5, s6, 12
                  ori          tp, gp, 899
                  slt          ra, a7, t6
                  fle.s        s1, ft11, ft2
                  fadd.s       fa2, fs5, fs11, rdn
                  slti         s5, t6, -733
                  srai         a2, t4, 21
                  fsub.s       fs3, fa5, ft7, rtz
                  rem          t6, t2, a1
                  fdiv.s       ft4, fa2, ft11, rdn
                  fsub.s       ft4, fs3, fa6
                  fsqrt.s      ft8, ft9, rup
                  rem          s4, a5, ra
                  fsgnjn.s     fa4, ft5, ft10
                  slti         a2, zero, 601
                  fsgnj.s      ft6, ft1, ft2
                  fadd.s       ft5, ft9, fa7, rne
                  fdiv.s       fs0, fa4, fa6, rdn
                  rem          sp, t5, sp
                  srl          t6, t3, a4
                  addi         a2, s10, -1043
                  fsub.s       ft3, fs11, ft3, rne
                  andi         s7, s11, -465
                  fsgnjn.s     ft2, fs10, fs2
                  mulhu        t2, s1, ra
                  slti         a4, t4, 1280
                  rem          s0, t1, s9
                  slt          a7, a4, t2
                  slli         a6, t3, 4
                  add          a1, a0, s0
                  rem          t2, s1, tp
                  fmv.x.w      a2, fs2
                  fsgnj.s      ft10, ft5, ft7
                  fcvt.w.s     s0, fs7, rdn
                  fclass.s     a2, ft8
                  mulhu        s9, s5, a5
                  slt          a2, s6, s4
                  fcvt.w.s     s11, fs0, rup
                  slt          a7, a5, s9
                  xor          gp, t5, s5
                  fcvt.s.w     fs0, s0
                  addi         t3, a3, -912
                  fmul.s       fa5, ft7, fa7, rmm
                  fmv.x.w      ra, fs2
                  xori         s9, t0, 89
                  slti         t3, s11, 73
                  sll          sp, s1, a1
                  slti         t6, t0, -1482
                  lui          zero, 140847
                  fclass.s     s5, fa4
                  slt          s4, t0, a7
                  or           s9, zero, t3
                  sra          s10, sp, s6
                  remu         s0, a0, a0
                  sub          s10, s8, ra
                  fcvt.w.s     zero, ft11
                  fmv.w.x      fs8, zero
                  or           t4, ra, a2
                  auipc        s10, 110444
                  fmin.s       fa4, fs0, ft1
                  div          s10, s11, s2
                  fsqrt.s      fs3, fa5, rmm
                  andi         tp, s5, -1918
                  fsgnjn.s     ft0, fs9, fa1
                  fcvt.wu.s    s0, fa1
                  srli         a4, t0, 1
                  nop
                  or           t4, a6, sp
                  auipc        s11, 574174
                  slli         a3, s8, 18
                  fmax.s       fa2, fa3, fs1
                  sll          zero, sp, a1
                  fdiv.s       fa0, ft4, ft11, rtz
                  fmin.s       ft8, fa6, fs8
                  rem          a0, gp, s8
                  feq.s        a4, ft11, ft3
                  slli         a2, s1, 1
                  fsqrt.s      ft2, fa0
                  auipc        sp, 1005713
                  remu         a7, s7, t0
                  div          s2, s7, a4
                  fmv.x.w      s1, fa3
                  sub          sp, a7, s9
                  fmv.w.x      ft0, sp
                  sltu         t3, s11, t6
                  fcvt.s.w     fa3, a2, rmm
                  sltu         a6, a3, t3
                  fmv.x.w      a4, ft1
                  fsgnjx.s     fs1, fs2, ft2
                  slt          a5, s5, s10
                  fdiv.s       ft10, ft9, ft10, rup
                  remu         s3, a0, s7
                  fcvt.s.wu    fa0, a6, rdn
                  ori          a3, s6, 1413
                  ori          s4, s11, 281
                  mul          s1, t5, a1
                  and          a7, s6, t3
                  fsgnj.s      ft10, fa4, ft3
                  sra          s10, tp, s1
                  addi         a6, s4, -900
                  slti         t3, t4, 290
                  fmul.s       fs4, ft5, ft2, rne
                  mulh         s4, sp, s9
                  auipc        a6, 601622
                  srai         sp, a3, 25
                  srai         a5, s10, 4
                  mul          a4, tp, t4
                  add          s3, t4, s4
                  fcvt.s.wu    fa4, sp
                  add          a6, t3, zero
                  divu         s9, s8, s1
                  sltiu        s1, t4, 89
                  slli         ra, a4, 1
                  fclass.s     a2, fa6
                  sltiu        gp, s6, -758
                  sltiu        s9, gp, -2013
                  fcvt.s.wu    fa0, s4
                  fsqrt.s      fa6, fs10
                  fmv.w.x      fs6, a7
                  mulh         zero, s0, t3
                  xor          a5, t5, s2
                  fsgnjn.s     ft1, ft1, ft5
                  xor          s7, t1, s1
                  fsqrt.s      fa0, fa0, rmm
                  fsgnj.s      fs9, fs3, ft8
                  sltiu        t2, s9, 1287
                  ori          a2, s3, -246
                  divu         s5, a0, s3
                  fsgnj.s      fa7, fs9, fs2
                  fsgnjn.s     ft0, fs0, ft6
                  flt.s        s6, ft8, fa7
                  mulhsu       s7, a4, tp
                  mulh         s6, s8, zero
                  and          a7, zero, a1
                  fcvt.wu.s    s9, fa3
                  slli         s6, t3, 11
                  mulhu        s7, a4, t0
                  fcvt.s.wu    ft7, s11, rmm
                  slti         s0, s3, 1494
                  xori         t4, t1, -1523
                  fsgnj.s      fa0, fa2, ft10
                  mulhu        t2, s3, sp
                  sltu         t3, s8, zero
                  srli         s2, sp, 23
                  xori         a4, t6, -1189
                  mulhu        s8, t3, gp
                  sra          t2, s2, t4
                  sub          s7, ra, gp
                  sra          zero, a2, s10
                  feq.s        s6, ft11, fs2
                  slt          a4, s6, s1
                  ori          gp, a2, 114
                  srai         tp, s11, 11
                  fmv.x.w      s5, fs8
                  fsgnjx.s     fa0, fa1, ft10
                  divu         s3, a4, a7
                  fcvt.s.w     ft9, t2
                  sltiu        a1, zero, -232
                  fcvt.s.wu    fa0, s2
                  mulhu        a3, tp, a6
                  and          a2, t6, s10
                  addi         s6, t4, 438
                  fdiv.s       ft4, fs4, fs1, rne
                  xori         t3, zero, 773
                  xori         s2, s5, 1826
                  fmv.x.w      s2, fs4
                  fmv.w.x      fs3, gp
                  srai         sp, s6, 2
                  fsub.s       fs9, fs1, ft8
                  sub          ra, t4, s6
                  and          s9, a4, t5
                  fmv.x.w      gp, fs4
                  fsgnjx.s     fa4, fs9, fs10
                  fadd.s       fa1, fs8, ft2, rmm
                  or           a6, t2, a4
                  andi         s4, a3, -310
                  lui          zero, 46570
                  andi         zero, a4, -1331
                  slt          s5, s5, s11
                  fmv.w.x      fs11, t0
                  mulh         a2, s10, s6
                  fmv.w.x      fs10, s7
                  feq.s        a7, fs9, fa3
                  divu         a1, a1, a7
                  fadd.s       ft8, fs9, fs2
                  fle.s        s5, fa1, ft10
                  sub          s7, gp, a5
                  lui          sp, 891402
                  fmul.s       fa0, ft2, fa4, rdn
                  or           a0, s8, s8
                  srli         s3, s0, 11
                  and          t3, a7, s7
                  xori         a2, s6, -984
                  mulh         s9, s7, t4
                  fcvt.wu.s    zero, fs8, rdn
                  srai         a4, gp, 12
                  fsgnj.s      fa6, ft1, fa3
                  add          a5, a5, s0
                  srli         s1, t6, 20
                  add          s5, gp, a3
                  remu         gp, zero, a2
                  fclass.s     s10, fa3
                  fadd.s       fs11, fa7, ft1
                  fcvt.w.s     s5, fs9, rtz
                  fmv.w.x      ft10, s8
                  mul          a5, a6, s0
                  srai         s2, t6, 7
                  fmv.x.w      tp, ft9
                  fmv.x.w      a0, fa1
                  and          a0, a3, a6
                  fmv.x.w      s11, fs7
                  sll          s3, t2, s0
                  and          t3, sp, s7
                  sltiu        s11, a6, 1686
                  fcvt.s.w     ft0, a5
                  sltu         t4, s0, ra
                  slti         t6, a3, 341
                  lui          tp, 526541
                  lui          t4, 666073
                  andi         s0, t5, -1917
                  fsqrt.s      ft4, ft2, rmm
                  addi         a4, s4, -1600
                  fmin.s       ft3, fs5, fs6
                  fmv.x.w      sp, fs3
                  and          sp, a2, s11
                  sltiu        sp, sp, -1335
                  slli         sp, a4, 19
                  fmv.w.x      fa0, s7
                  rem          a5, s9, s9
                  fmax.s       fs5, fa7, ft1
                  or           a3, a1, t0
                  fcvt.s.wu    fs2, t0
                  nop
                  fsgnjx.s     fs0, ft4, ft10
                  mulhsu       a7, s11, s5
                  fmax.s       ft1, ft1, fs9
                  feq.s        t2, fs7, ft6
                  sra          s8, t3, zero
                  fmul.s       ft3, fs10, fs2
                  sra          s0, gp, tp
                  fsub.s       fs3, ft1, fs5, rdn
                  fcvt.s.wu    ft3, s10, rup
                  fcvt.s.wu    ft4, a7
                  sra          t2, s4, a6
                  or           s4, a6, a0
                  sltu         t4, a3, s0
                  fmv.w.x      ft5, t5
                  fcvt.s.wu    ft0, t1
                  addi         s10, ra, -1725
                  xori         a4, a4, -881
                  mul          zero, a7, t2
                  addi         s6, t6, 2012
                  auipc        t2, 376580
                  fle.s        t2, fa1, fa2
                  fle.s        a3, ft3, fa5
                  andi         ra, a5, 1246
                  fsqrt.s      ft4, ft10
                  sub          s8, zero, a6
                  fsgnjn.s     ft3, ft1, ft5
                  xor          a4, s8, a0
                  srl          a6, gp, s9
                  sll          s2, t2, t2
                  lui          t6, 757763
                  fmul.s       fa3, fa3, fs5, rup
                  auipc        s11, 569715
                  xor          sp, a4, s9
                  fsgnj.s      fs4, ft2, fs5
                  fsub.s       fs1, ft0, ft4
                  fsgnjx.s     ft7, fs0, fs5
                  fmin.s       fs9, fs3, fs8
                  add          a2, s5, s10
                  fmul.s       ft5, ft1, fa4
                  fmin.s       fs3, fa1, ft2
                  ori          s10, tp, 1936
                  flt.s        t2, fs5, fs11
                  remu         s3, a4, s11
                  remu         t4, sp, t1
                  fmin.s       fa3, ft11, fa1
                  fmin.s       fs5, ft8, fs1
                  sub          s4, zero, a5
                  fcvt.s.wu    fa7, s4, rdn
                  slli         t4, a4, 4
                  fadd.s       fa6, fa4, fa6
                  fcvt.s.w     fa0, s10, rup
                  mulh         sp, tp, a5
                  fmul.s       ft11, fs8, fs4
                  srai         a0, sp, 19
                  feq.s        s11, ft8, ft9
                  fmax.s       fa1, ft6, fa0
                  slt          tp, a1, s3
                  feq.s        t2, ft9, fs0
                  sltiu        s1, sp, 287
                  fsgnj.s      ft5, ft9, ft1
                  fsub.s       fs11, ft2, fs4, rtz
                  mulh         sp, ra, gp
                  sltu         s2, s8, t1
                  fmv.w.x      fs9, a6
                  mulhu        a4, ra, a4
                  sll          ra, zero, zero
                  and          s6, t6, t0
                  sltiu        t4, s2, 382
                  fdiv.s       ft3, fs5, fs8, rmm
                  fadd.s       fa5, fa2, fs2
                  xori         t2, t2, 266
                  rem          t2, a0, t6
                  fmv.x.w      s4, fa3
                  fle.s        a4, fa7, ft3
                  sltu         ra, s8, s1
                  slt          a5, a2, s5
                  srl          a5, t0, a0
                  xori         a4, t2, 52
                  ori          t4, sp, 1904
                  sltu         s1, gp, gp
                  xor          zero, a3, s6
                  fsgnjn.s     ft4, fa7, ft9
                  slti         t3, t3, 774
                  fmax.s       fs9, fa0, fs3
                  sltu         s9, t1, a3
                  fmin.s       ft9, fa5, fs0
                  feq.s        s11, fs3, ft7
                  fcvt.s.w     fs5, a7, rmm
                  addi         s10, s4, -452
                  nop
                  auipc        s10, 70003
                  div          t3, a6, a2
                  slt          s0, t0, s9
                  fsub.s       fa7, fs8, fs5, rmm
                  ori          a7, t4, -1451
                  fcvt.wu.s    s6, fa4
                  fclass.s     a5, fs6
                  sltu         s9, s3, a0
                  slti         s4, a7, -1547
                  flt.s        s11, fs2, fs10
                  fsqrt.s      fs9, ft9, rdn
                  sltiu        t4, t5, 1225
                  lui          ra, 732210
                  fadd.s       fa3, ft2, fa4, rtz
                  fsqrt.s      ft9, fa7
                  fcvt.w.s     gp, fs1, rup
                  mulh         a1, a5, s5
                  remu         a1, a0, tp
                  div          zero, s0, a1
                  fmax.s       ft8, fs3, fs11
                  fmv.w.x      ft9, s2
                  fsgnj.s      ft7, fa0, fs0
                  sltiu        t6, s2, -1317
                  fcvt.s.w     fa1, s10, rne
                  lui          a4, 788867
                  xori         a6, a6, -805
                  sltu         s5, a1, s10
                  fsub.s       fa7, fs6, fs3
                  and          t3, s2, ra
                  xori         s6, s5, 146
                  fclass.s     zero, fa1
                  fle.s        s11, fa7, fa2
                  fcvt.s.w     fa2, sp, rtz
                  mul          a2, zero, t2
                  sltu         a3, tp, s2
                  mulhu        s1, s9, a2
                  div          s0, a3, sp
                  sub          a6, t1, a7
                  sub          t4, t6, a6
                  fmax.s       fa0, fa4, fa7
                  srli         s0, s10, 2
                  addi         t6, s5, -978
                  flt.s        s0, fs5, ft0
                  fsgnj.s      ft7, fs3, fa2
                  mulhu        a5, s9, t3
                  fcvt.s.wu    fs7, a5
                  auipc        a0, 267211
                  fmul.s       fs7, fs0, fa7, rdn
                  slt          t4, t2, a7
                  flt.s        s8, fs4, fs9
                  slti         t2, sp, -1325
                  sltu         a6, s2, s7
                  remu         s11, s10, a3
                  andi         s3, s6, 157
                  or           t6, s5, sp
                  srai         zero, a7, 10
                  fcvt.s.w     fa1, a4, rup
                  srai         a4, s2, 9
                  sltu         tp, a3, t4
                  fdiv.s       fs2, ft9, fs1, rtz
                  remu         a7, s7, s4
                  fmax.s       ft11, ft11, ft10
                  fsgnj.s      fa0, fa5, fs11
                  flt.s        a1, fa0, fs2
                  mulh         s8, t5, s6
                  fsgnjx.s     fs1, fa3, ft4
                  or           s6, a3, s6
                  xori         a1, t5, 702
                  flt.s        a5, ft6, fa0
                  addi         a5, s9, 373
                  ori          a7, a6, -1921
                  sltiu        a6, s1, -573
                  fsgnj.s      fa5, fs1, ft10
                  lui          s9, 585681
                  fcvt.s.wu    ft8, s9, rup
                  mul          s2, t2, a6
                  addi         tp, a7, 431
                  rem          tp, s10, s3
                  flt.s        a4, fs11, fs3
                  slli         s3, s9, 31
                  sltiu        sp, a2, 1333
                  lui          a2, 385815
                  and          sp, s3, t6
                  mulhsu       a3, s10, s9
                  div          t4, s3, a2
                  andi         sp, s10, 1693
                  or           s3, s3, t6
                  fsgnj.s      ft8, fs5, fa3
                  feq.s        s9, fa1, ft0
                  fsub.s       fa1, fa5, fs3
                  xori         s8, s10, 1514
                  fmv.x.w      s2, ft7
                  fcvt.s.w     ft0, t3, rtz
                  fsgnjn.s     fs0, ft9, ft10
                  and          a3, s3, s6
                  fsqrt.s      fa7, fs6, rdn
                  addi         a2, s3, -1874
                  fcvt.s.wu    fa3, a3
                  ori          a1, s2, 642
                  andi         s9, a6, 1774
                  srai         a1, ra, 4
                  auipc        s8, 730771
                  mulh         a1, sp, t1
                  remu         a6, s7, a5
                  remu         a6, ra, a1
                  mulhsu       sp, s0, t4
                  flt.s        s3, fa7, ft2
                  fsub.s       fa2, fa0, ft6, rmm
                  fmv.x.w      tp, fa4
                  fcvt.w.s     zero, ft7
                  sra          a5, s11, a0
                  mulhu        t2, t5, s7
                  lui          s8, 633932
                  and          s11, ra, s9
                  sll          s9, s11, tp
                  slli         s9, s3, 7
                  slli         a0, s3, 5
                  fsgnj.s      fs1, fs10, fs6
                  fcvt.w.s     gp, fa6, rdn
                  nop
                  slt          s2, s0, a2
                  feq.s        s9, fs9, fa3
                  sll          sp, s9, s1
                  xori         s1, zero, -1352
                  lui          s1, 135058
                  slti         s2, a7, 1789
                  nop
                  slt          t3, tp, t6
                  fcvt.s.wu    fs10, ra, rtz
                  fsgnjx.s     ft9, fa4, fs8
                  addi         a4, t0, -1669
                  sra          a3, ra, tp
                  fcvt.w.s     ra, ft4
                  slti         a1, t3, -1211
                  remu         a2, t1, zero
                  addi         s0, t4, 736
                  and          t2, t5, a4
                  fclass.s     a0, ft4
                  fmv.x.w      a3, fa3
                  fcvt.w.s     s8, fs11, rmm
                  andi         s6, t5, 1939
                  div          s2, tp, s8
                  flt.s        a5, ft11, fs9
                  auipc        a3, 329992
                  lui          s10, 493209
                  fmv.w.x      fs11, t6
                  slt          s5, a3, a1
                  lui          s8, 347709
                  fmin.s       fs6, ft11, fa3
                  and          a3, t1, s9
                  mulh         sp, a1, sp
                  rem          gp, t5, a0
                  mulhsu       s1, a2, a6
                  fmin.s       fa6, fa0, ft2
                  srl          gp, t2, s7
                  fcvt.wu.s    a2, fa3, rne
                  sra          s11, s9, ra
                  ori          s8, t5, 1348
                  sra          tp, s4, a5
                  feq.s        ra, fs0, ft0
                  srli         s9, a4, 19
                  feq.s        a7, fs10, fs3
                  sltiu        t6, s8, 483
                  fadd.s       ft3, fs5, fs4
                  lui          a6, 991986
                  ori          a4, s7, -953
                  mulhu        s6, a2, t5
                  fsgnjx.s     fs7, fa7, ft1
                  mulhsu       a6, gp, a7
                  fmv.x.w      a3, ft0
                  fsgnjx.s     fs11, fs2, ft1
                  add          a5, sp, s8
                  div          t4, t1, t0
                  fmax.s       ft6, fa1, fa3
                  or           s10, sp, s3
                  srl          s5, s7, t0
                  auipc        s8, 266867
                  fdiv.s       ft3, fs9, ft0, rne
                  divu         s4, t0, s10
                  rem          s3, a4, s4
                  fadd.s       ft9, ft1, ft1, rup
                  fdiv.s       fs8, ft7, fa0, rup
                  fmv.w.x      ft5, s11
                  flt.s        a4, ft8, fa6
                  sltu         s11, ra, zero
                  fadd.s       ft11, fs0, fs1, rmm
                  nop
                  fclass.s     gp, ft1
                  srl          s8, s10, a5
                  fcvt.s.w     ft6, t2, rtz
                  add          s2, a1, s2
                  fsqrt.s      ft0, fa0
                  srli         t6, s3, 29
                  add          s2, s0, a7
                  sra          s8, zero, s7
                  ori          s3, t6, 1835
                  mulh         gp, t0, t6
                  fadd.s       ft6, ft7, ft8, rne
                  sub          t2, t5, s10
                  mulh         t6, s8, s9
                  fsgnjn.s     ft2, ft10, ft6
                  feq.s        t3, fa5, fa1
                  fsgnjn.s     ft6, fs5, ft6
                  add          ra, t0, a6
                  add          a2, s1, a5
                  xor          s1, t0, s9
                  srl          gp, t4, a7
                  xor          s9, s4, t2
                  slli         s11, sp, 0
                  divu         s1, t1, s11
                  slti         s3, s10, 1343
                  lui          a4, 97671
                  fcvt.w.s     a0, fs1, rup
                  xor          s5, s7, t6
                  fle.s        a4, fa1, fs11
                  feq.s        t2, fa0, fa7
                  fle.s        a1, fs3, fs1
                  srli         a7, s11, 20
                  rem          s10, a1, t0
                  feq.s        s8, ft0, fs10
                  and          s1, s1, a2
                  fadd.s       fs10, fs7, fa5
                  srl          s3, s10, a2
                  sltu         ra, tp, s2
                  ori          a7, a4, -700
                  sra          s6, a6, t5
                  fdiv.s       ft4, ft1, fs3, rup
                  fsgnj.s      fa7, fs7, ft9
                  fcvt.w.s     s4, fa3, rup
                  fmv.w.x      ft9, s4
                  fcvt.w.s     s10, fs6
                  fclass.s     gp, fs6
                  addi         s4, s9, -1813
                  slti         gp, s10, -1805
                  fcvt.s.wu    fs1, a7, rmm
                  flt.s        s0, fa5, fs8
                  fsub.s       fs3, fs9, fa7
                  fmul.s       fs6, ft6, fs4
                  fmv.x.w      sp, ft6
                  fdiv.s       fs11, fs5, fs4, rup
                  srl          s1, gp, a7
                  srai         s11, s10, 20
                  fsgnjx.s     fs7, fs1, fa6
                  add          a6, a0, a5
                  fcvt.wu.s    a5, fs9, rdn
                  fle.s        t2, fs0, ft6
                  add          a6, a6, s4
                  rem          s1, a4, t6
                  andi         s0, a4, -1365
                  fsgnj.s      ft8, fs4, fa7
                  remu         zero, a0, s11
                  xor          s6, s1, a3
                  mulhu        a5, t4, s9
                  feq.s        s1, ft9, fa7
                  mul          gp, t1, t2
                  srai         s9, t5, 18
                  sra          t3, s7, t1
                  fclass.s     t6, ft11
                  fcvt.s.wu    fs7, t0
                  andi         a3, t5, -1576
                  sltu         a3, gp, a1
                  slti         s9, s1, 1511
                  sltu         gp, a0, s1
                  div          gp, s3, s5
                  srai         s2, s7, 12
                  fmax.s       ft8, fa3, fa0
                  fmv.x.w      a4, fs10
                  ori          s2, a6, 791
                  fsgnj.s      fs11, fs5, fa7
                  fcvt.wu.s    s0, ft5
                  fmul.s       fs4, fa4, fs4
                  mul          s7, s10, s4
                  mulhu        t2, s2, a1
                  fsqrt.s      ft5, ft9
                  sltiu        gp, ra, 960
                  slt          a1, t3, a5
                  fcvt.w.s     s1, fs9, rmm
                  srli         gp, gp, 6
                  fcvt.s.wu    ft1, zero
                  xor          s4, s8, t2
                  slli         a3, s5, 20
                  fle.s        a6, fa3, fs7
                  ori          s1, a7, -1140
                  remu         s5, t1, t5
                  auipc        gp, 927819
                  feq.s        s11, ft3, ft3
                  xori         a6, a0, -1834
                  fle.s        gp, ft3, fs4
                  remu         gp, a5, t5
                  fcvt.w.s     a1, fs1
                  lui          a5, 241336
                  sltiu        tp, s7, 774
                  sll          t2, a7, tp
                  fsgnjn.s     fs3, ft10, ft0
                  feq.s        a5, fa3, fa0
                  sltiu        t4, s1, -347
                  xori         t6, t1, 1023
                  mulhu        s2, s0, tp
                  slt          t3, s7, t6
                  slt          a0, a2, t2
                  slti         a2, tp, 1993
                  fmax.s       fs10, fs1, fs8
                  fsqrt.s      fs9, ft10
                  rem          s7, s10, s4
                  feq.s        gp, fs7, fs8
                  sltiu        s2, ra, 1964
                  auipc        t3, 625031
                  flt.s        zero, ft1, fa0
                  fsgnj.s      fa0, ft3, fs0
                  add          t2, a6, s2
                  fsub.s       fs6, ft0, fs2
                  nop
                  mul          a4, s10, s1
                  srl          t2, s6, sp
                  mulhu        ra, s8, a3
                  add          s0, t1, s0
                  sra          t3, t1, t6
                  sltu         s8, a3, a7
                  srli         a1, s1, 19
                  fsgnj.s      fs9, fa2, ft2
                  slli         a2, s0, 25
                  fmv.w.x      ft0, zero
                  fsub.s       fs5, fs4, fs10, rdn
                  fclass.s     zero, ft5
                  sra          a7, a1, a7
                  fsub.s       fs4, fa3, ft1
                  sltiu        s8, s0, 416
                  fsgnjn.s     fs10, fs0, fa4
                  or           s9, sp, a7
                  fsgnj.s      ft5, ft5, fs2
                  flt.s        t4, ft5, ft6
                  fmax.s       fa1, ft6, fa1
                  xori         a7, s3, 911
                  addi         a7, s7, -1216
                  sll          tp, t5, s1
                  fmax.s       fa1, fa0, fs1
                  slli         s8, s5, 8
                  fcvt.s.wu    fa6, a5
                  nop
                  slti         t2, a2, -1254
                  auipc        sp, 561845
                  ori          s7, s2, 958
                  and          s1, a4, s9
                  remu         t4, t6, s1
                  sll          t4, s2, ra
                  fcvt.s.w     fa4, a2
                  slti         s6, a5, 1249
                  auipc        a7, 929398
                  remu         t3, s3, s11
                  sltu         s6, t0, s9
                  slli         ra, s6, 29
                  slt          gp, a6, s6
                  lui          t2, 532860
                  addi         a5, s0, 219
                  or           s9, s3, s0
                  fmin.s       fa2, fa7, ft1
                  slti         a2, ra, -1897
                  remu         s5, t2, s2
                  fcvt.wu.s    gp, fa4, rtz
                  andi         t4, t6, 520
                  slli         zero, t3, 5
                  mulh         zero, a2, t4
                  flt.s        s4, fa2, ft4
                  fmv.w.x      fa7, s8
                  srli         a2, a2, 0
                  divu         s1, t6, a1
                  mulhsu       ra, a0, t6
                  srli         t6, a0, 17
                  fmv.x.w      t3, fa0
                  xor          a7, s11, t4
                  feq.s        s0, ft11, fs4
                  fmul.s       fs3, fs10, fa5, rup
                  fsub.s       ft4, fa7, fa6, rmm
                  addi         s5, a6, 2029
                  fsub.s       ft7, fa6, ft8, rne
                  fmin.s       fa3, ft7, fa6
                  fsgnj.s      fs5, fa1, fs5
                  fcvt.wu.s    s10, ft7
                  lui          a0, 722320
                  and          ra, a6, s2
                  mulhsu       zero, s6, zero
                  slt          s5, s6, a0
                  mulh         gp, a6, s3
                  fclass.s     s4, fa1
                  sub          s2, t0, zero
                  xor          s10, t4, a1
                  rem          t3, zero, a1
                  sll          s0, s1, s2
                  fcvt.s.wu    fs6, tp
                  mulhsu       t3, s8, s8
                  auipc        a4, 386701
                  lui          s2, 19501
                  rem          s9, a1, t4
                  auipc        s1, 883583
                  add          s2, t1, t0
                  mulh         tp, t4, s5
                  fmv.x.w      s10, ft7
                  fadd.s       fa3, fa3, fa0
                  fmv.x.w      s11, fs10
                  sll          s1, t1, t5
                  fmul.s       fs2, fa4, fs2
                  mulhu        a7, t2, t4
                  fcvt.s.w     fa1, t2
                  fmin.s       ft3, ft10, ft7
                  lui          s7, 619369
                  fmul.s       fs6, fs7, ft4
                  fsgnj.s      ft8, fs4, fa7
                  mul          sp, a0, zero
                  slt          a5, a7, gp
                  fle.s        s9, ft6, ft0
                  slti         a0, s5, 554
                  fmul.s       fa0, ft4, fs1, rup
                  ori          t2, t1, 1276
                  xori         a5, a7, -455
                  fsgnjn.s     fs5, fs9, ft10
                  feq.s        s2, fa7, fa6
                  fmv.x.w      gp, fs8
                  fcvt.s.wu    fa5, s5
                  fcvt.wu.s    a6, ft2, rne
                  slli         t4, s10, 31
                  fsgnj.s      ft0, fs4, fs4
                  fsgnjn.s     fa0, fa1, ft3
                  mulhsu       tp, t1, t1
                  fmv.w.x      ft9, t0
                  fmv.w.x      fa7, s3
                  fsgnj.s      fs5, fs7, fs9
                  ori          a6, a7, -1847
                  srli         a2, t4, 8
                  andi         t6, s0, 803
                  fcvt.s.w     ft1, t1
                  fsqrt.s      fs10, fa4, rdn
                  fclass.s     s0, ft0
                  xori         s7, a2, 1874
                  xor          t3, tp, a0
                  fcvt.wu.s    a2, fs2
                  sra          a7, ra, s6
                  fsqrt.s      fa1, fa2
                  fmv.w.x      fs9, a5
                  sub          t3, s10, tp
                  lui          s6, 346020
                  fmul.s       fs5, fs4, fs0
                  fmul.s       fs10, ft7, fs10, rne
                  flt.s        s11, ft3, ft6
                  sltiu        s7, gp, 2036
                  fcvt.s.wu    fs8, s11
                  ori          t2, a5, 1283
                  fdiv.s       fa7, fs5, ft0
                  fsgnj.s      fa3, fa7, fa2
                  mul          t6, zero, t2
                  div          s0, s5, a4
                  slti         zero, a4, 1006
                  add          a6, s5, a7
                  feq.s        s2, fa0, fa1
                  mulhu        s4, t2, sp
                  mul          s5, t5, ra
                  fmin.s       ft2, ft7, ft11
                  mulh         s4, a7, s10
                  srli         s9, t4, 16
                  fsgnjn.s     fa0, ft6, fs8
                  fcvt.wu.s    t6, ft9, rup
                  sll          a5, t3, s9
                  or           a7, t4, t4
                  mulhu        a3, t1, t2
                  fsgnjn.s     ft4, fs7, fs4
                  fadd.s       fs8, fs8, ft0
                  fmin.s       ft5, fa1, fa7
                  xor          a3, a1, ra
                  ori          a2, t4, 72
                  mulh         s3, ra, tp
                  sltiu        a7, s2, 956
                  srl          s0, t5, s6
                  fsgnjn.s     ft4, ft1, ft1
                  xori         a0, a3, -886
                  mul          t6, a4, s9
                  fsgnj.s      ft5, ft0, ft8
                  addi         a1, s6, 225
                  srai         s8, a3, 6
                  mulhsu       t2, t3, t1
                  flt.s        a1, fs3, ft0
                  and          s3, t1, sp
                  fmv.x.w      a0, ft2
                  divu         t6, t0, tp
                  fsub.s       fa5, fa7, fa7
                  fcvt.wu.s    s0, fs7
                  fmin.s       fa1, fs9, fs0
                  fcvt.w.s     s11, fa3, rdn
                  auipc        s4, 869424
                  mul          s4, t3, sp
                  fmv.x.w      s2, fs3
                  sltu         s6, t5, s4
                  rem          a3, t6, sp
                  fsgnjx.s     ft6, fa1, fa4
                  fmul.s       ft4, fa3, ft6
                  fmin.s       fs4, fs9, ft2
                  srli         a0, s2, 16
                  mulhu        t6, a0, t3
                  sltu         a7, s3, a7
                  slti         a6, zero, 1954
                  fmax.s       ft6, fa7, fs2
                  fsgnjn.s     fs3, fs9, ft2
                  div          s8, ra, s5
                  remu         s1, t3, s9
                  rem          a0, s11, s7
                  fsqrt.s      ft6, fa3
                  fsub.s       ft3, fa4, ft8, rtz
                  fcvt.wu.s    a2, fs7, rne
                  ori          ra, a5, -2043
                  fmax.s       fa1, fs5, ft9
                  fclass.s     t3, ft3
                  divu         t3, sp, a2
                  sltu         tp, a0, t2
                  mul          ra, s5, a2
                  auipc        sp, 800710
                  sra          t6, zero, a5
                  or           a5, s0, a4
                  remu         tp, t1, s8
                  or           a2, a3, s6
                  sltiu        a7, t3, 1869
                  lui          s0, 385689
                  fmin.s       ft1, fa0, ft8
                  addi         ra, a5, -1595
                  fmax.s       ft0, ft2, fs8
                  add          a7, s6, t2
                  flt.s        tp, ft3, fs4
                  divu         s10, s6, t1
                  lui          a6, 116530
                  fsgnjn.s     fs6, fs11, fs8
                  srl          s10, ra, ra
                  add          a6, t5, a3
                  fcvt.s.w     fs10, s11
                  div          ra, t4, t1
                  fcvt.s.w     fs10, t3
                  feq.s        s0, ft2, fa2
                  xori         zero, t1, -1541
                  andi         s1, a2, 1293
                  fsgnj.s      fs11, ft2, fa5
                  fsgnj.s      fa2, ft7, fa6
                  feq.s        ra, fa0, fa2
                  sltu         s10, a3, s8
                  fcvt.w.s     s1, fa5, rmm
                  addi         a2, a4, -1700
                  xori         ra, tp, 1127
                  fcvt.wu.s    s11, fs1
                  fsgnjn.s     fs5, fa4, ft7
                  feq.s        tp, fa3, ft10
                  fmul.s       fa6, fs0, fs0, rne
                  div          s5, a5, s4
                  div          a5, t5, t6
                  srai         s7, s3, 11
                  lui          ra, 635178
                  lui          zero, 686885
                  add          s7, s4, t6
                  auipc        t3, 83102
                  fmv.x.w      tp, fs3
                  fmin.s       ft6, fs8, fs0
                  srli         s1, s9, 23
                  mulh         tp, s4, s9
                  addi         t4, a0, -1132
                  ori          s1, s3, 1915
                  xori         ra, s1, 1510
                  addi         s5, s3, -139
                  fsgnjx.s     fs1, fa6, fs10
                  fmv.w.x      fa1, s11
                  fmv.w.x      fs10, s7
                  auipc        a6, 693797
                  xor          t6, a1, s11
                  flt.s        s9, fa4, fs10
                  and          a0, t1, a6
                  fclass.s     ra, fs4
                  ori          t6, t1, 1181
                  fmv.x.w      s7, fa2
                  remu         zero, t3, zero
                  or           a3, t3, s0
                  fcvt.wu.s    s9, fa6, rdn
                  mul          a7, s3, s7
                  fadd.s       fs10, ft2, fs6, rtz
                  remu         s9, s5, s4
                  nop
                  fcvt.w.s     a2, fa0, rdn
                  lui          a5, 180003
                  slli         s1, a1, 15
                  xor          s11, t3, gp
                  slt          a7, t6, ra
                  slli         t4, s0, 31
                  ori          s10, a3, -774
                  or           s6, t4, s11
                  fmv.w.x      ft9, s5
                  fdiv.s       fa2, ft7, ft1
                  fsgnj.s      fs11, fs6, fa3
                  fsgnjn.s     fa4, ft4, fs2
                  fclass.s     s1, fa7
                  sltu         s1, t1, t0
                  fdiv.s       ft11, fa0, fs2, rmm
                  lui          s7, 928034
                  flt.s        t3, fa0, ft7
                  divu         s0, t2, t6
                  fmin.s       ft7, ft8, fs5
                  flt.s        t2, ft8, ft3
                  div          a0, t2, sp
                  srai         ra, s3, 19
                  slti         a7, a5, 289
                  slli         s4, a2, 3
                  fsgnjx.s     fa5, fs6, fs8
                  srai         s7, a2, 15
                  sltiu        s3, tp, 523
                  fmv.w.x      fa4, t6
                  or           s10, s10, gp
                  divu         a5, gp, t4
                  slli         s0, gp, 23
                  fcvt.wu.s    s7, fs9, rtz
                  auipc        tp, 852412
                  rem          s9, s5, t5
                  fadd.s       fa3, ft10, fs10
                  fmul.s       ft9, fs2, fa3
                  mul          s2, s10, s9
                  srli         zero, t3, 31
                  xori         a1, a4, -52
                  fcvt.w.s     a4, fs0
                  xor          s3, s3, a6
                  div          s10, s6, a0
                  fsgnj.s      ft3, fa5, ft9
                  srl          t6, a6, t2
                  mulh         zero, gp, s10
                  div          sp, t5, a7
                  fmul.s       fa4, fs8, fa4
                  sltu         t2, s3, sp
                  srli         a2, s3, 30
                  fadd.s       fs5, ft7, fa3
                  fadd.s       ft1, fs7, fa7
                  fsgnjn.s     ft10, fs9, fs11
                  lui          a4, 860903
                  fclass.s     s10, fs2
                  fcvt.w.s     gp, ft0
                  fmin.s       fa2, fs4, fs9
                  srli         s7, a7, 13
                  fmv.w.x      fa0, s5
                  slt          s4, s10, zero
                  fcvt.w.s     a2, fs6, rne
                  fdiv.s       ft2, fa6, fs10, rup
                  andi         a6, a3, -424
                  fmv.x.w      a0, ft3
                  slli         a1, s3, 28
                  fmul.s       fa3, fs4, ft4, rtz
                  fcvt.s.wu    ft7, t6
                  fadd.s       fa5, fs11, ft3
                  fle.s        s9, fa2, fa1
                  feq.s        sp, fs4, fs2
                  mul          a5, s5, s7
                  srl          a5, a2, tp
                  fsqrt.s      fa4, ft4
                  sll          gp, s5, s2
                  mulh         a5, t0, s8
                  xor          s3, t1, tp
                  mulh         a7, s3, a0
                  flt.s        ra, ft1, fs1
                  mulh         a5, s1, s1
                  srl          s9, a6, a7
                  xori         a0, t0, -1399
                  and          zero, s3, a6
                  fsqrt.s      fa7, ft2
                  fcvt.w.s     s7, fa5
                  mulhsu       s10, a2, s7
                  fcvt.s.w     ft0, s10
                  fcvt.s.wu    fa5, a6
                  fle.s        s3, ft5, ft9
                  fsgnj.s      fa4, fa7, ft8
                  srl          zero, a7, tp
                  fcvt.w.s     t4, fa6
                  fcvt.s.wu    fa0, s0
                  feq.s        a0, ft8, fa5
                  auipc        s3, 498671
                  flt.s        a3, fs4, ft2
                  auipc        s11, 605097
                  srai         a7, s8, 6
                  fadd.s       ft10, ft4, ft8
                  divu         sp, a1, t5
                  and          s11, s5, s5
                  sub          tp, s9, zero
                  fclass.s     a3, ft8
                  slli         sp, sp, 17
                  fsgnjx.s     ft7, fa3, fa2
                  remu         s6, t5, zero
                  fle.s        s2, ft1, ft11
                  fmv.x.w      s0, fs4
                  sub          s3, s2, a3
                  xori         s10, s6, -546
                  addi         tp, a2, 1967
                  fmul.s       ft9, fa2, ft1
                  fsqrt.s      ft2, ft0, rdn
                  slt          zero, tp, a7
                  fmv.w.x      fs9, s7
                  xori         s6, s10, -1570
                  sll          a7, t5, tp
                  sltiu        s9, t2, -1057
                  flt.s        s10, fs7, fa4
                  fcvt.w.s     a7, ft1
                  nop
                  fsub.s       ft0, fs7, fs11
                  add          s10, s6, zero
                  addi         s5, t4, 1626
                  sub          a0, t3, s5
                  fmv.w.x      fs2, t0
                  fsgnj.s      ft10, fa7, fs2
                  fcvt.w.s     a3, fa5, rup
                  nop
                  fmv.x.w      s3, fa2
                  sll          a6, a2, s1
                  mulh         a1, s0, zero
                  sltu         s10, s8, t2
                  and          sp, a5, s7
                  srli         t2, tp, 22
                  ori          t2, a4, -548
                  fsqrt.s      ft11, ft0, rup
                  mulh         s11, a1, s1
                  srai         s6, s3, 3
                  fmul.s       ft10, fs0, ft1, rtz
                  divu         s6, s1, t1
                  divu         s5, s10, a4
                  sub          s8, tp, a5
                  fcvt.wu.s    t4, ft11, rmm
                  flt.s        t6, fa6, ft2
                  flt.s        s8, fs2, ft9
                  mulh         s2, t5, s3
                  sll          s3, s3, a1
                  nop
                  srai         s1, s3, 19
                  fsgnjx.s     ft11, fs4, fs3
                  slt          a4, s3, s0
                  fsub.s       fa7, ft5, ft8
                  slt          s3, a3, a1
                  rem          gp, sp, s4
                  fsqrt.s      fs7, fs0, rup
                  add          s1, s11, t1
                  sub          s9, t2, a5
                  fclass.s     a6, fa1
                  fcvt.s.w     ft0, ra
                  remu         s1, s9, t3
                  fclass.s     a6, fs7
                  srli         tp, t3, 12
                  fmin.s       fs7, fs5, fa2
                  divu         t4, zero, a3
                  fsgnjx.s     ft6, fs1, ft7
                  srl          s2, ra, s6
                  auipc        s10, 264685
                  nop
                  srai         s10, t4, 4
                  xori         sp, s6, -614
                  fcvt.w.s     a1, ft2
                  sll          a6, s4, a1
                  divu         a4, a7, s8
                  srli         s10, s10, 5
                  mulh         s2, gp, s6
                  fadd.s       fs0, fa2, ft2
                  ori          s0, s8, 173
                  fsqrt.s      ft5, fs0, rup
                  srli         s7, ra, 6
                  rem          s10, s3, t0
                  feq.s        ra, fs9, ft11
                  feq.s        sp, fs5, fa7
                  flt.s        sp, fs4, ft5
                  rem          s9, s6, s0
                  fadd.s       fs7, ft4, fa7
                  sltu         t3, sp, s5
                  addi         a3, s9, 1345
                  mulh         s0, a2, tp
                  ori          a4, a0, -354
                  slt          a2, s7, s1
                  fmv.x.w      a2, ft5
                  slt          s9, a3, zero
                  fcvt.s.w     fs0, s11
                  rem          t2, gp, a3
                  nop
                  fle.s        sp, fa3, ft2
                  div          a0, sp, zero
                  fsub.s       fs3, fs4, fa0, rtz
                  xori         s10, a3, 375
                  mulh         s11, s0, zero
                  sra          s8, s9, t5
                  lui          s6, 1044888
                  flt.s        a6, fa2, fs4
                  srli         a7, t6, 6
                  xori         a3, s8, 1409
                  fcvt.s.w     fs6, gp
                  fdiv.s       fs5, ft7, ft9, rmm
                  or           a1, zero, s2
                  fdiv.s       fa2, ft9, ft1, rtz
                  or           tp, s3, zero
                  srai         s2, t2, 15
                  sub          s0, s0, s1
                  sltiu        a0, t3, 1028
                  slli         a3, a1, 11
                  xor          a5, a6, s3
                  mulhsu       s8, a2, s0
                  rem          a2, s10, s9
                  feq.s        gp, fs6, ft8
                  slli         a2, t4, 1
                  fsqrt.s      fs8, fs10, rne
                  sltiu        s11, s9, 1495
                  srli         t4, s11, 16
                  sub          zero, tp, s8
                  fdiv.s       ft3, ft3, fs11, rne
                  fmul.s       ft3, ft11, fa7
                  mul          s11, a7, a6
                  mulh         s5, a3, t2
                  feq.s        s3, ft3, fs1
                  fsqrt.s      fs11, fa1, rup
                  nop
                  srai         a7, t4, 8
                  srli         t6, ra, 10
                  slt          s3, t4, gp
                  rem          s11, a3, t2
                  slli         ra, t3, 26
                  srai         s7, s8, 31
                  fmax.s       ft4, ft7, fs7
                  fsqrt.s      fa2, ft0
                  fle.s        s1, ft7, fa7
                  lui          tp, 192441
                  sltiu        a6, s3, -1244
                  fsgnjx.s     ft10, ft7, ft8
                  or           tp, zero, s5
                  slli         s2, t4, 17
                  fmv.w.x      fa1, a1
                  mulhu        a4, t3, ra
                  fcvt.s.w     fs8, t1, rtz
                  sltiu        sp, t5, -1110
                  xor          sp, a0, tp
                  sra          a2, zero, a4
                  fmin.s       fa4, fa0, ft9
                  remu         a3, a7, sp
                  feq.s        a2, ft8, fs4
                  ori          s3, s5, 1596
                  sltiu        a7, sp, -53
                  ori          s9, t4, 900
                  fmax.s       fa0, fs6, ft10
                  fdiv.s       fs1, fs4, fa5, rdn
                  srl          s2, s8, t1
                  fcvt.s.wu    fs4, a1, rup
                  fcvt.w.s     a1, fs6
                  flt.s        t4, fa0, fa0
                  fadd.s       fa6, fs5, fs3
                  fmin.s       fs3, fa3, fs8
                  slti         a6, a3, 882
                  fcvt.wu.s    s3, ft6, rup
                  sub          sp, a1, t2
                  auipc        s2, 273866
                  mulh         gp, s11, a0
                  andi         s9, t3, 469
                  xor          sp, t1, t1
                  mul          s11, ra, gp
                  rem          s2, tp, a6
                  fadd.s       fs11, ft6, ft0, rup
                  srai         ra, t6, 0
                  slt          s9, gp, s7
                  fsqrt.s      fa1, ft6, rtz
                  auipc        s4, 769123
                  sll          s2, t4, s10
                  mul          s10, t4, s9
                  sltiu        s11, s5, -467
                  nop
                  rem          a3, a0, s8
                  fsqrt.s      ft4, fa3
                  nop
                  rem          s8, t3, t6
                  fcvt.s.w     fs5, s2, rne
                  sub          s1, a4, t4
                  fcvt.w.s     t4, fs0
                  fmv.w.x      fs2, a3
                  mul          s11, t3, s3
                  fadd.s       fa1, fa2, ft8
                  sltiu        a3, gp, 258
                  div          s10, s6, s10
                  fadd.s       ft3, fs6, fa7
                  sub          ra, s1, a5
                  divu         s4, t1, a6
                  andi         s5, t1, 1859
                  nop
                  rem          s3, a0, t4
                  slti         s11, s1, 1959
                  remu         a3, t3, t4
                  srl          a3, ra, gp
                  fmul.s       fs4, ft8, fs0
                  srai         s8, a2, 12
                  xori         s9, a5, 917
                  flt.s        a7, fs2, fa6
                  fcvt.s.wu    fa4, a3
                  xor          s6, s2, a0
                  mul          s10, a0, s0
                  fle.s        a5, fa6, fs8
                  xori         s0, a4, -702
                  andi         sp, s0, -344
                  slli         s9, ra, 20
                  div          s9, t5, a6
                  fmin.s       fa4, ft3, fa2
                  fmv.x.w      s5, fs3
                  remu         sp, s11, s4
                  fsub.s       ft6, ft10, fs11, rdn
                  fdiv.s       fa7, fa3, fa5, rdn
                  divu         a0, t5, t6
                  xor          tp, s1, t6
                  fsqrt.s      ft7, fs10
                  divu         s7, t0, t6
                  fsgnjx.s     ft7, ft1, ft0
                  fmv.x.w      a1, fs1
                  fle.s        s3, fs5, fs4
                  fcvt.w.s     s3, ft8, rtz
                  lui          a4, 623536
                  fdiv.s       fs2, ft7, ft5, rmm
                  srli         a4, s4, 7
                  mulh         a6, s4, a4
                  auipc        s6, 1047522
                  srl          sp, s11, a7
                  fcvt.wu.s    a6, fa7
                  fadd.s       fs9, ft2, ft1, rmm
                  fsub.s       ft3, fs0, ft2
                  fsgnjx.s     fs2, fa6, fs4
                  mulhsu       gp, a3, s0
                  fcvt.wu.s    s8, fs0
                  xori         s1, s5, -1477
                  fmin.s       fs8, ft1, fa2
                  auipc        gp, 955494
                  fsgnjx.s     ft1, fs7, ft11
                  slli         ra, s3, 5
                  sltu         t2, a7, a5
                  mulh         tp, s10, gp
                  sltu         s1, a6, a2
                  srl          a1, zero, s6
                  fsqrt.s      fs10, ft6, rtz
                  fsqrt.s      fs11, fs11, rup
                  fcvt.w.s     tp, ft4, rtz
                  fcvt.s.wu    ft3, s3
                  sltiu        s10, a3, 1696
                  fsqrt.s      fa7, fa3, rup
                  sub          s2, s7, t4
                  xori         gp, t5, 1526
                  slt          s6, t5, t3
                  fmin.s       fa3, fs0, fa1
                  fclass.s     gp, fs3
                  xor          s10, t6, tp
                  addi         s2, s7, 993
                  fcvt.s.wu    fa4, t6
                  fsgnj.s      fs5, ft3, ft5
                  add          a4, s2, s0
                  fsgnj.s      ft9, fa1, ft2
                  srai         s5, sp, 1
                  slt          s4, s11, s0
                  or           s4, t0, t3
                  sltiu        t6, s9, 319
                  srl          s4, tp, t4
                  divu         tp, s1, t1
                  mulh         s2, s5, s2
                  div          sp, s0, a7
                  mulh         s10, s5, t6
                  auipc        t2, 518999
                  slt          s7, s10, a3
                  fsub.s       ft10, fs8, fs6, rne
                  slt          tp, tp, s9
                  div          gp, zero, t6
                  slt          a7, s11, t6
                  fmv.w.x      ft1, a6
                  fadd.s       ft0, ft0, ft4, rtz
                  fsgnj.s      fs1, fs3, fa3
                  fsub.s       ft10, fs4, fs3
                  srli         s7, s11, 21
                  slti         ra, s6, 1582
                  slli         a5, a4, 6
                  fsub.s       fa4, ft4, ft9, rmm
                  sll          ra, a6, s9
                  fle.s        s6, fa4, ft3
                  mulhu        s11, s9, s2
                  addi         ra, a4, 1203
                  slli         s1, s4, 6
                  and          s6, s3, s10
                  fsgnj.s      ft0, fs4, ft3
                  and          t2, zero, t2
                  sll          tp, ra, t1
                  sll          s4, s5, s9
                  xor          s11, t0, a1
                  fmax.s       fs2, ft3, ft4
                  srl          s5, a2, t6
                  srl          tp, s9, s1
                  fmv.x.w      a3, fs5
                  divu         t6, t6, gp
                  srl          s6, t4, a0
                  fle.s        s6, fs3, ft2
                  fclass.s     a5, ft10
                  auipc        a7, 958073
                  auipc        a6, 350950
                  fadd.s       ft11, fs2, fa4
                  sll          sp, s1, a1
                  sub          s8, s1, s9
                  sub          s10, ra, a5
                  fsgnj.s      fa2, fs2, fa0
                  sltu         s3, sp, t1
                  fsgnj.s      ft4, fa7, ft3
                  add          ra, a5, s3
                  feq.s        a7, ft6, fs1
                  auipc        a6, 555524
                  fsgnjn.s     fa2, fa4, ft1
                  fcvt.s.w     fs2, s11
                  fcvt.s.wu    fa3, a5
                  fsub.s       fs6, fs8, ft3, rmm
                  sll          s4, t4, a7
                  lui          gp, 467259
                  fsub.s       ft5, fs7, fs4
                  mulhsu       t2, s2, t5
                  or           t4, a2, a2
                  fcvt.s.wu    ft1, s5
                  slli         s7, s8, 26
                  lui          a5, 734242
                  mulhu        a6, s4, s11
                  slli         a0, s11, 31
                  fsgnjx.s     fs6, fs0, fs3
                  div          tp, a6, a0
                  andi         t2, t5, -839
                  xori         a7, s4, 1999
                  slli         s1, zero, 11
                  mul          s9, t5, a6
                  divu         s7, s2, s3
                  mulhsu       t4, s0, t6
                  sll          t6, a3, s10
                  fmin.s       fs8, fa4, ft2
                  sra          s1, s7, s7
                  div          s5, t5, s3
                  fcvt.s.w     ft2, s4
                  fsgnjx.s     fs4, fs4, fs2
                  sra          gp, a6, t5
                  fmv.x.w      s10, fa2
                  sub          zero, s3, t2
                  add          s1, t5, sp
                  auipc        t3, 221964
                  mul          s5, tp, t2
                  fcvt.wu.s    s7, fa6, rup
                  flt.s        s11, fs11, fa3
                  auipc        sp, 129156
                  sra          s4, a5, ra
                  slti         s11, gp, 335
                  rem          t2, s11, a6
                  fsgnjn.s     fa5, fs1, ft8
                  fmul.s       fa7, fa2, fa1, rtz
                  fcvt.s.w     ft0, s2
                  srli         s4, a3, 1
                  fsgnjx.s     fa7, ft0, ft7
                  remu         a4, s7, zero
                  fle.s        s5, ft4, ft9
                  mulhu        t2, a3, t4
                  mulhsu       s11, zero, t4
                  slti         t2, s2, 659
                  fadd.s       fs6, fs10, fa0
                  fsgnjn.s     fa2, fs9, fs5
                  mulhsu       a4, t1, s7
                  fsqrt.s      fa3, fs10, rdn
                  mulh         ra, s3, a2
                  sltu         t4, s10, s10
                  rem          gp, s10, s4
                  fcvt.s.w     fa3, s9
                  fsgnjn.s     fs3, ft4, fs10
                  slt          s8, s6, a2
                  slli         a5, tp, 12
                  and          t3, s7, s9
                  fsub.s       fa4, ft3, fa5, rdn
                  fmul.s       ft2, ft0, ft5, rdn
                  fmv.x.w      s7, fa2
                  and          t6, a2, a1
                  fle.s        s10, ft3, ft7
                  nop
                  div          a4, a2, t6
                  fcvt.w.s     a5, ft9
                  mulh         s9, gp, a4
                  fsgnjn.s     ft8, fs5, fs4
                  fmul.s       fs8, fa2, fs6, rne
                  sltiu        t6, t4, 1019
                  mul          a7, s9, s5
                  fcvt.s.wu    ft11, s6, rtz
                  sltu         s2, t6, t4
                  fsqrt.s      fa1, fs1, rup
                  ori          t3, t2, -432
                  andi         s8, a2, 250
                  fmul.s       fa6, fs5, fa4
                  fdiv.s       fa7, ft5, ft0, rne
                  flt.s        tp, fs6, ft3
                  fle.s        a5, fa2, ft3
                  fcvt.s.wu    fs11, t0
                  fsgnj.s      fa7, ft1, fs0
                  addi         a5, s3, 77
                  mulhu        gp, sp, t2
                  mulh         a0, tp, s9
                  fadd.s       fa2, fa1, fs10
                  div          s8, a4, s6
                  mulhu        t3, s7, t3
                  ori          s0, tp, -1269
                  srl          s4, s11, a0
                  auipc        s4, 673429
                  add          s4, zero, s2
                  rem          s6, s4, a5
                  fdiv.s       fa1, ft4, ft6
                  mulhu        gp, zero, s3
                  remu         s5, s6, s4
                  lui          s11, 476276
                  mulhu        a1, a1, s6
                  fsqrt.s      fa1, fs5
                  fmin.s       fa1, fa5, ft8
                  fmax.s       fs4, fs0, ft11
                  feq.s        t4, fs9, ft3
                  fmul.s       ft10, ft11, fs10, rmm
                  fmin.s       fa7, ft1, ft3
                  slli         a4, a3, 2
                  srli         sp, a5, 3
                  sub          a1, a6, s4
                  xor          s1, s1, sp
                  fmax.s       ft8, fs9, fa4
                  and          a7, s7, t4
                  srai         a0, s4, 0
                  sub          a5, s4, a1
                  fcvt.s.wu    ft7, a0
                  fsqrt.s      fa4, fs11
                  fcvt.w.s     s5, fs0
                  remu         t4, a1, t3
                  sra          s11, s2, a3
                  fcvt.w.s     gp, ft10, rdn
                  slt          t3, s2, a1
                  fdiv.s       ft4, fa0, fs2, rup
                  srai         a1, a2, 16
                  srl          a0, a5, s0
                  sll          s0, gp, t5
                  ori          t4, s10, 1825
                  fmin.s       ft5, fs3, fa1
                  slti         a5, s8, -2029
                  and          zero, a1, t3
                  mulhu        a1, a2, t2
                  fdiv.s       ft0, fs4, ft6
                  xor          s8, gp, gp
                  sll          t6, zero, s6
                  or           sp, s0, a5
                  fsgnjn.s     ft4, ft7, fs7
                  fcvt.s.wu    ft9, t3, rmm
                  addi         s11, a4, 971
                  sltiu        s2, s8, -295
                  srl          t3, s0, a7
                  fle.s        gp, ft3, ft6
                  slti         sp, s8, 1554
                  slli         s1, a1, 8
                  mul          a7, s11, gp
                  fsub.s       fa6, ft7, fs6
                  srli         a7, t4, 23
                  slli         t6, gp, 19
                  or           t2, s1, a2
                  sltu         a2, sp, s10
                  fsgnjn.s     ft0, fa6, ft8
                  sltiu        a7, t0, -1795
                  fle.s        a3, ft1, fs1
                  fsgnjx.s     fa0, ft7, ft11
                  mul          a3, tp, t0
                  fcvt.w.s     s8, ft9
                  sub          s8, s3, s0
                  mulh         s9, s9, t0
                  fclass.s     t6, fs10
                  sub          s4, ra, t0
                  fle.s        s1, fa5, ft0
                  remu         a6, a6, s10
                  slti         s8, s3, -397
                  fcvt.s.wu    ft4, gp
                  xori         s5, ra, 1059
                  fmax.s       ft9, fa7, fs10
                  mulh         s11, s7, t5
                  fdiv.s       fs3, fa2, fs0, rmm
                  fmv.x.w      s6, fs0
                  mulhu        zero, a3, s7
                  fsgnjx.s     ft2, fa3, fa5
                  flt.s        s8, ft9, fs0
                  fsub.s       fa4, ft3, fs0, rtz
                  fsgnjn.s     fa7, fs11, fs11
                  sub          a6, s11, t4
                  fmin.s       ft2, ft8, fs0
                  xori         zero, s11, -1198
                  srl          s2, a7, t6
                  andi         sp, a6, 1003
                  or           a0, s10, s9
                  srli         s1, s5, 31
                  and          t3, ra, sp
                  div          a4, a3, s6
                  flt.s        t3, fa4, ft11
                  addi         s1, s8, 1632
                  ori          a5, t5, -470
                  srli         s5, a6, 30
                  slti         s4, a5, -573
                  fmul.s       ft0, ft11, fs3, rup
                  slli         s5, t4, 28
                  and          a3, s10, s9
                  fmin.s       fa1, fa4, ft3
                  mulh         s9, a5, zero
                  add          s10, sp, s8
                  fmul.s       fs3, fs5, ft5
                  fsgnjx.s     fs2, fs7, fa5
                  rem          s5, a6, a2
                  andi         s0, zero, 1893
                  sll          s0, s7, sp
                  addi         a2, s10, -1698
                  nop
                  mul          gp, sp, t6
                  fle.s        s1, fs11, fs10
                  fmax.s       fa7, ft11, fs4
                  fsqrt.s      fa1, ft7, rmm
                  xori         a4, t5, -632
                  slt          s4, s3, a4
                  fsgnj.s      fs6, fa7, ft6
                  sra          s11, a7, s6
                  mul          gp, ra, a3
                  slti         a2, zero, -1426
                  fsgnjx.s     fs1, fa7, fs1
                  fmin.s       fs1, fa3, fs8
                  fsqrt.s      ft6, fa5
                  mulhsu       sp, s4, zero
                  nop
                  auipc        t3, 327976
                  mulhsu       a4, a0, a4
                  sltu         s3, a3, s4
                  fcvt.wu.s    tp, ft2
                  ori          a0, s7, -48
                  sll          t4, s4, t2
                  slli         tp, s6, 9
                  xori         t4, s5, 1699
                  slli         t6, s6, 20
                  fcvt.s.wu    fa4, a6
                  xori         sp, s0, -192
                  fsgnjx.s     fa0, ft8, fs9
                  flt.s        a0, ft2, ft6
                  nop
                  fsgnj.s      fs6, ft9, ft7
                  srl          a6, t3, a3
                  divu         a3, s11, a4
                  fmul.s       fs10, ft1, fs2, rne
                  mulhu        t2, zero, t1
                  feq.s        t3, fs2, ft5
                  sll          t2, s1, s4
                  fmv.w.x      ft10, ra
                  lui          t4, 1003624
                  fsqrt.s      fa1, ft8, rup
                  flt.s        t3, ft11, fs8
                  or           a0, gp, t3
                  mulh         s6, gp, a0
                  mulhsu       zero, a7, t0
                  lui          t6, 21528
                  fsgnjn.s     ft4, ft3, fs8
                  sltiu        s4, s3, 260
                  fcvt.s.w     fs6, tp
                  sll          s4, s2, ra
                  mulhu        s7, tp, s6
                  fsub.s       ft11, fs1, fs10, rne
                  srl          t4, s11, a2
                  srli         s0, s5, 8
                  lui          zero, 418250
                  add          s3, gp, t3
                  fmul.s       ft1, ft6, fs6
                  fsqrt.s      fa5, fs3, rne
                  auipc        s8, 399737
                  feq.s        s5, fs7, fs7
                  fclass.s     a2, ft1
                  fmv.x.w      a0, fs8
                  fmin.s       fa3, fs6, fa6
                  fcvt.s.w     ft0, t1
                  xori         s1, s8, 1430
                  fcvt.s.w     fs10, s0
                  fmul.s       ft11, ft8, fa4, rdn
                  fmv.w.x      ft3, t2
                  fcvt.s.wu    fs0, s10, rtz
                  fsgnjn.s     fa5, fa3, fs10
                  nop
                  fclass.s     s1, fs0
                  slli         s0, a2, 23
                  and          s0, a0, zero
                  fclass.s     a2, fs4
                  mulhu        a6, t2, s0
                  fdiv.s       fa5, fs8, fs6
                  fsgnjx.s     fs3, fs9, fa4
                  auipc        s7, 565015
                  add          s6, t4, a6
                  fsub.s       ft9, ft4, fs7, rup
                  sub          a7, s9, a2
                  slt          t3, s1, s8
                  ori          a2, gp, 1415
                  mul          a6, s0, a4
                  fmax.s       fa5, ft10, fs6
                  fclass.s     tp, ft10
                  fmv.x.w      gp, ft6
                  sltiu        s11, a4, -274
                  fsqrt.s      fa3, fs4
                  add          sp, s4, a7
                  sra          t2, t6, s1
                  fmin.s       fs10, fa4, fs7
                  andi         a2, s1, -1754
                  fcvt.s.w     ft1, a7
                  fmax.s       ft4, fs4, fs1
                  fmax.s       ft1, ft2, fa7
                  slt          t2, s5, s11
                  fadd.s       fs4, fa0, fs1, rdn
                  fadd.s       fa3, fa4, ft10
                  fle.s        a7, fs2, fs2
                  sra          s8, a1, s8
                  fsgnj.s      fs7, fa0, fa5
                  slti         s9, t0, 1599
                  xori         s7, s1, 1068
                  xor          gp, t0, s10
                  fsgnj.s      fa0, fa1, fs10
                  srl          s7, t3, a4
                  fdiv.s       fs1, ft6, fs9, rne
                  divu         t4, ra, a6
                  rem          s6, s9, ra
                  fcvt.s.wu    ft8, t6, rmm
                  sra          s5, s7, s11
                  fle.s        a5, ft5, ft4
                  srai         a4, ra, 4
                  addi         a3, s3, -540
                  flt.s        s3, ft8, fs6
                  sra          s4, zero, a1
                  mulhsu       s6, t2, s8
                  add          s7, a5, a2
                  fsub.s       fa2, fs10, fa6, rup
                  rem          s4, s2, s7
                  fmax.s       fs4, fa0, fa6
                  fdiv.s       fa7, fa2, fs11, rtz
                  slt          s11, a2, sp
                  slti         s9, a6, 1676
                  fmin.s       fa2, fs9, ft6
                  lui          t2, 850879
                  srl          t4, a0, sp
                  andi         t6, t0, -597
                  andi         s5, s5, -336
                  flt.s        s11, fs7, ft6
                  sra          s3, sp, t3
                  div          zero, tp, a3
                  mulh         s9, a5, a5
                  or           a5, a3, t3
                  fcvt.w.s     s0, fs5
                  fadd.s       ft7, fa2, fs6
                  divu         t6, s10, t4
                  div          s9, t1, a4
                  sub          s6, tp, s6
                  fsgnjn.s     fa2, fa1, fs9
                  fdiv.s       ft9, fa1, fs0, rne
                  xor          zero, s4, s11
                  fmul.s       fa1, fs11, ft8
                  add          a6, t1, s3
                  nop
                  sltiu        s9, s10, 620
                  sltiu        s0, a2, -115
                  slli         a7, a3, 29
                  nop
                  addi         s11, t4, -1210
                  lui          s1, 829003
                  sll          a0, zero, s5
                  sltiu        ra, s3, 604
                  srai         s0, a4, 8
                  srl          t3, s2, t5
                  div          s0, tp, tp
                  fmul.s       fs11, ft4, fs3
                  fsgnj.s      fs8, fs0, ft9
                  fcvt.s.w     fa4, tp, rmm
                  ori          sp, s11, -748
                  sra          s7, a2, a7
                  nop
                  fmul.s       fs8, fs11, fa0, rtz
                  xori         t4, s1, 1826
                  divu         a0, a3, t6
                  sll          s7, s5, gp
                  fsgnjn.s     fs9, ft4, fa0
                  lui          t6, 71924
                  nop
                  srli         s10, a4, 13
                  mulh         a4, s11, s11
                  srli         s4, t1, 22
                  fcvt.s.w     ft1, a4, rne
                  andi         gp, s3, 1526
                  div          zero, zero, t5
                  mulh         a3, t4, s11
                  add          a5, s6, a0
                  fmax.s       fs11, fs7, ft0
                  nop
                  fsgnj.s      fs1, fs3, fs5
                  feq.s        zero, fs8, fs1
                  sltiu        s8, a7, -1785
                  srl          s8, ra, s1
                  ori          tp, s9, -947
                  remu         s2, s0, a2
                  fdiv.s       fs5, ft9, fa5
                  fmin.s       ft1, ft2, fs9
                  lui          a4, 123799
                  fsub.s       ft4, fs0, ft3
                  feq.s        a7, fs0, fa7
                  lui          sp, 570832
                  slli         zero, a2, 15
                  mulhsu       ra, t2, s4
                  fsqrt.s      fs8, fa4, rdn
                  auipc        s4, 800229
                  sll          s7, a3, ra
                  sltu         a6, t3, t3
                  and          zero, s8, s4
                  feq.s        s6, fs1, ft10
                  fmin.s       fs5, fs10, fa0
                  fcvt.w.s     a0, fs3
                  remu         s1, tp, t5
                  fsgnjn.s     fs10, fs0, fs7
                  remu         s9, ra, s5
                  mul          s11, a5, t0
                  addi         a2, t1, 446
                  fmax.s       fa2, fa7, fa3
                  remu         s2, zero, zero
                  mulhu        s4, s4, s9
                  fmax.s       fa5, ft8, ft0
                  srai         s7, a6, 31
                  xor          s3, t6, s8
                  srai         s4, s6, 30
                  lui          t4, 375633
                  fmv.w.x      ft4, t2
                  fcvt.w.s     s10, ft8, rtz
                  xor          s9, t2, t6
                  fsgnj.s      ft6, fs3, ft8
                  xori         s8, s8, 458
                  mulhsu       a2, a4, zero
                  mulhu        t3, t1, t6
                  sra          a4, a6, zero
                  slt          a3, a1, tp
                  fcvt.s.wu    fa2, a4
                  fdiv.s       fa1, ft0, fs3
                  mulh         s9, s6, t2
                  xor          tp, sp, s4
                  mulh         gp, t2, s4
                  mulhsu       s2, s7, a2
                  flt.s        s1, ft7, ft3
                  fsgnjn.s     ft5, fa2, ft3
                  add          s11, s7, zero
                  or           s7, s11, t3
                  fadd.s       ft2, fs3, ft2
                  xori         s10, s10, 1515
                  fsgnj.s      fs6, ft8, fs5
                  rem          a4, s4, s5
                  fmv.x.w      a4, fa4
                  auipc        a6, 1006035
                  andi         t6, a5, -570
                  remu         s2, a5, a4
                  remu         a4, s7, s6
                  mulhsu       ra, s1, sp
                  addi         a7, a6, 1259
                  fmin.s       ft4, ft10, ft8
                  fcvt.w.s     a6, fa7
                  sll          s11, s7, a7
                  or           a4, t2, t3
                  slli         sp, s11, 9
                  andi         a1, a5, -1278
                  fmv.x.w      s3, fs3
                  sltiu        s9, s10, 253
                  fsub.s       fa2, fs8, fs7, rtz
                  sltu         s2, gp, t0
                  fdiv.s       fs1, fs9, fs3, rmm
                  xori         a6, s1, 1656
                  fdiv.s       ft11, ft5, fa3
                  fsqrt.s      ft2, ft4, rtz
                  divu         a4, s11, s9
                  or           a1, t6, s6
                  fclass.s     a7, fs5
                  fcvt.w.s     a2, fs5
                  srli         a2, sp, 11
                  divu         s2, sp, tp
                  fsgnjn.s     ft1, fa0, fs8
                  sub          s9, a5, t1
                  srl          s2, s3, s7
                  mulh         s6, s0, tp
                  div          s7, a4, ra
                  feq.s        s3, fa7, fs4
                  fmin.s       fa2, fs1, fs11
                  fsgnjn.s     fa4, fa1, ft6
                  sub          a3, ra, t3
                  fmin.s       fs7, ft1, fs7
                  fcvt.wu.s    a3, fa3
                  fcvt.s.wu    ft0, t2, rmm
                  fmin.s       fs6, ft8, ft3
                  auipc        s11, 556854
                  srli         s11, ra, 28
                  fcvt.s.wu    fs9, ra
                  fmv.w.x      ft6, t2
                  fsgnjx.s     ft10, fa6, ft11
                  mulh         a3, t3, a1
                  fmin.s       ft8, ft6, ft3
                  srli         t3, s0, 19
                  mulh         s3, a3, s5
                  mul          a6, t0, a6
                  sra          a3, s1, a1
                  fle.s        ra, fs2, ft1
                  sll          a4, s6, s6
                  srli         a4, a2, 1
                  add          a0, s8, s9
                  srli         s10, a6, 15
                  sub          a7, sp, t4
                  slli         a7, s8, 22
                  divu         a2, gp, tp
                  fcvt.s.w     fs8, a7
                  remu         zero, t6, s11
                  fmax.s       fs6, ft9, ft1
                  fmv.x.w      a3, ft6
                  andi         zero, a1, -219
                  fsgnj.s      ft10, fs6, fa1
                  feq.s        a3, fa3, fa2
                  add          a0, s6, s9
                  flt.s        a3, fa2, ft7
                  div          a4, s4, a7
                  slli         s1, a3, 17
                  xori         s8, s1, -1235
                  and          s1, t1, s3
                  nop
                  srli         gp, s0, 31
                  ori          a4, s3, -1631
                  lui          s9, 651040
                  fsgnjx.s     fa4, ft8, fs0
                  fcvt.w.s     s11, ft2, rdn
                  fsgnj.s      ft2, fs2, ft1
                  xori         s4, s8, 1446
                  mulhsu       t4, s10, a4
                  slli         s8, t6, 29
                  srl          s8, a5, s10
                  fcvt.s.w     fa6, s5
                  mulhu        s8, s3, a6
                  fmv.x.w      s7, fa2
                  srli         t3, a2, 21
                  nop
                  andi         s8, a1, -1183
                  fsgnjx.s     fs3, ft4, fs5
                  sll          a3, s7, a4
                  or           ra, gp, t2
                  srl          s4, gp, t1
                  auipc        tp, 577718
                  fcvt.s.wu    fs7, t4, rne
                  rem          ra, s2, gp
                  fmv.x.w      a6, ft1
                  and          s5, t3, s11
                  remu         s9, a1, ra
                  div          sp, a1, a1
                  nop
                  mulhu        s10, s11, s7
                  div          t3, zero, t1
                  fcvt.w.s     s1, fa6, rne
                  fmin.s       fs11, ft4, fa6
                  fsgnj.s      fs4, fs9, fs6
                  slti         t6, s5, 2022
                  feq.s        t3, fs9, ft6
                  fsgnjn.s     ft9, ft8, fs11
                  fmax.s       ft8, ft4, fs7
                  lui          sp, 348467
                  flt.s        s5, ft10, ft8
                  ori          a4, a3, 465
                  xori         a7, a2, -592
                  or           a1, a2, a1
                  mulhu        s5, sp, t6
                  fclass.s     s1, ft8
                  fmin.s       fa5, ft10, fa6
                  slli         tp, s8, 17
                  div          ra, s6, s11
                  fcvt.wu.s    a6, fa6
                  lui          s11, 524005
                  add          t6, a7, t1
                  mul          s2, s6, a2
                  fdiv.s       fs6, ft10, ft4
                  or           s9, s8, s1
                  fmax.s       ft10, fa5, fa3
                  fle.s        s0, fs4, fs10
                  ori          a0, a6, 304
                  rem          s2, s1, a1
                  fmv.x.w      s9, fa3
                  feq.s        gp, fs0, fs2
                  rem          s9, s11, s11
                  fmax.s       ft8, fs7, ft0
                  sra          s0, a6, t4
                  nop
                  fmin.s       fs10, fa6, fs6
                  fdiv.s       ft8, ft1, fa7, rdn
                  ori          s2, a3, -23
                  sltu         a7, t3, sp
                  fmv.x.w      a3, ft4
                  auipc        s11, 928833
                  and          tp, gp, s6
                  fmv.x.w      s2, fa7
                  andi         t6, t2, 1897
                  auipc        ra, 1009126
                  sll          s4, s3, s5
                  sub          gp, s9, a1
                  srl          tp, ra, ra
                  slli         sp, t2, 18
                  fcvt.w.s     s8, ft3
                  mulhu        ra, a5, a5
                  srl          a7, tp, a2
                  sltiu        s1, s6, -481
                  sra          s11, a0, s7
                  fmul.s       ft7, fa1, fs8
                  sltu         s2, s11, t0
                  xori         s8, a7, -73
                  fle.s        tp, fs0, ft7
                  fle.s        a7, ft10, fs5
                  or           s6, sp, a6
                  rem          t4, s6, s10
                  sra          sp, ra, s5
                  sltiu        a7, s2, 1656
                  div          t6, gp, s9
                  andi         t2, s6, -2042
                  fmax.s       ft11, fs3, fa4
                  sll          s7, tp, a7
                  fcvt.s.w     fa0, s4
                  fsgnjn.s     ft10, fs6, ft11
                  remu         a0, s7, s1
                  fcvt.wu.s    a3, fs0, rup
                  slli         s11, t4, 8
                  fclass.s     a4, fs6
                  fcvt.s.w     fs6, s6, rup
                  ori          zero, a2, -816
                  fle.s        a0, ft3, ft1
                  fmin.s       fa0, fs3, ft8
                  fle.s        a6, ft5, fs8
                  auipc        s4, 597285
                  sra          s11, zero, t4
                  fcvt.s.w     fa1, s0
                  srli         a4, s1, 5
                  sltiu        s9, t3, -1146
                  fsgnjn.s     fa1, fs2, fs2
                  sra          a3, t4, t6
                  andi         s5, s3, -704
                  div          a1, gp, s4
                  sll          t4, s10, s10
                  or           s0, tp, sp
                  fsub.s       fs1, fs11, ft0
                  fcvt.s.wu    ft0, t2, rmm
                  mul          gp, sp, t4
                  fle.s        zero, fa2, fa4
                  or           s6, a5, s11
                  sll          t2, a2, s2
                  remu         s8, s2, s1
                  lui          t3, 1044841
                  remu         t4, t0, a5
                  slt          t6, s4, s3
                  fcvt.s.w     fs2, a3
                  fcvt.w.s     s11, ft10, rdn
                  and          a2, a1, a4
                  xori         s10, tp, 465
                  mul          a1, t3, s6
                  fcvt.s.w     ft8, s4
                  flt.s        a5, ft0, fa1
                  fcvt.w.s     gp, ft3
                  fcvt.s.w     ft7, t4, rtz
                  mulhu        t6, a3, a6
                  sltu         a1, s5, s7
                  add          s6, t1, s0
                  fclass.s     s7, fs0
                  add          t3, zero, a1
                  mulhu        t6, t1, t2
                  sltu         s0, a1, a2
                  auipc        s0, 304978
                  slt          a2, s2, s1
                  mul          s1, t6, s2
                  xori         a5, t4, 1702
                  add          a3, s9, t4
                  remu         a6, s2, a7
                  fmax.s       ft9, fa2, fa5
                  fcvt.w.s     s10, ft2
                  ori          s6, s6, -149
                  xori         s0, t6, -1775
                  fcvt.w.s     s6, ft5, rup
                  fmin.s       fs11, ft7, fs5
                  srai         a1, a3, 28
                  feq.s        s6, ft5, ft4
                  fcvt.wu.s    ra, fs9, rtz
                  sltiu        t4, s11, 28
                  fcvt.w.s     a0, fs6, rmm
                  rem          s10, a3, s1
                  nop
                  fdiv.s       fs9, fs8, fs8, rmm
                  add          t2, zero, s8
                  addi         zero, s1, 957
                  nop
                  fmv.x.w      a3, fs9
                  fmin.s       fs6, ft1, ft10
                  fcvt.s.wu    fa7, t4
                  fsqrt.s      fa2, fs4, rdn
                  flt.s        s0, ft5, fs10
                  fclass.s     s11, fa6
                  xor          a6, s0, t4
                  slti         s0, t0, 1701
                  mulhu        sp, gp, t6
                  fcvt.wu.s    t3, fs7, rdn
                  rem          t2, a6, a4
                  and          t6, s2, s3
                  fle.s        t4, ft4, fs0
                  fle.s        a3, ft10, ft2
                  fsgnjx.s     fs3, fs7, ft9
                  fsqrt.s      ft11, fs3, rup
                  rem          s1, s9, zero
                  fsgnj.s      fs10, ft9, ft7
                  fsgnj.s      ft4, fa2, ft4
                  sltiu        a2, s1, -1810
                  and          a0, tp, a3
                  sra          a0, s4, s6
                  sll          s0, tp, s1
                  srai         a0, s9, 30
                  fmax.s       ft7, fa2, fa7
                  and          s3, s6, s7
                  lui          s10, 946865
                  remu         a3, a4, a3
                  sll          s2, s9, s3
                  srl          ra, s1, t0
                  srl          t4, s9, a0
                  mulhsu       a5, s9, t4
                  addi         a2, t3, 1636
                  fmul.s       ft11, fs5, fs7
                  ori          t3, t4, 0
                  mul          a7, ra, s2
                  fadd.s       fs7, fs0, fs9, rtz
                  slli         t4, a1, 10
                  xori         s8, s8, 1310
                  or           s9, t3, s5
                  divu         s8, s6, t0
                  slti         a5, zero, 1639
                  auipc        s10, 960515
                  nop
                  slt          a4, gp, s11
                  fcvt.wu.s    t4, fa7, rtz
                  andi         gp, a4, -1251
                  nop
                  flt.s        s1, fa1, ft4
                  remu         tp, a3, a7
                  divu         zero, ra, s2
                  srai         s5, a3, 10
                  addi         s3, s7, 338
                  rem          s7, s2, t4
                  sltu         t2, s6, gp
                  flt.s        s11, ft6, ft11
                  fmul.s       fs1, fa5, fa3
                  sra          t2, t6, t3
                  divu         a2, sp, a7
                  xor          gp, t2, zero
                  feq.s        s9, ft1, fs0
                  slli         sp, sp, 29
                  mulhu        s3, t1, a6
                  lui          t6, 5246
                  srli         s8, s6, 19
                  flt.s        s6, ft8, ft5
                  divu         s10, gp, t0
                  fcvt.s.w     fs11, t4
                  xori         ra, s8, 1255
                  fcvt.s.w     ft0, tp
                  fsgnjn.s     ft3, fs7, fs6
                  xor          ra, s3, tp
                  or           t6, s0, a5
                  slli         s3, a5, 14
                  rem          s11, sp, a6
                  fmin.s       fs7, ft2, fs2
                  remu         a2, a0, a6
                  fdiv.s       ft9, fs7, fs4, rdn
                  fmv.x.w      gp, ft0
                  slli         t3, s9, 6
                  fle.s        s9, fs6, fs7
                  fmv.x.w      s9, fa4
                  and          s0, a2, t1
                  ori          zero, sp, -288
                  or           s11, s2, t6
                  fsgnj.s      fs9, ft4, fs0
                  sub          a0, t3, s3
                  remu         a1, a0, s0
                  fsgnjx.s     fs4, ft5, ft7
                  mulh         t2, t2, a1
                  or           s7, a6, sp
                  and          tp, s9, s7
                  fmin.s       fs6, fa5, fa2
                  xori         t6, s11, -710
                  fcvt.wu.s    s8, fa4
                  fcvt.s.w     fa3, a7
                  fsgnj.s      fa7, fs9, fs7
                  srl          s10, t6, s7
                  rem          s3, a6, s2
                  mulhu        ra, a7, t6
                  sub          s10, t4, a0
                  fle.s        sp, ft2, fs8
                  remu         s10, a0, s11
                  add          a4, a2, a3
                  fmv.w.x      fs0, gp
                  xor          zero, a0, a6
                  and          s0, t4, sp
                  fdiv.s       fa1, ft8, fs5
                  remu         s2, a1, s10
                  fclass.s     a0, fs7
                  sra          s7, s2, t2
                  fsgnjn.s     fa1, fa1, fs9
                  mulh         s9, tp, s11
                  sra          a6, s1, s2
                  slt          a7, s5, a1
                  auipc        gp, 281123
                  nop
                  fsgnjn.s     fs7, fa2, ft4
                  fclass.s     a5, fs11
                  fsgnjx.s     fa4, fs5, fs1
                  srli         s7, s0, 7
                  fsgnjn.s     fs4, fs1, ft6
                  slt          t6, s3, zero
                  srli         t4, s5, 22
                  fsub.s       ft10, ft2, fa5
                  xor          ra, s4, s10
                  addi         s0, gp, -184
                  fcvt.s.wu    fs0, s11, rmm
                  slli         gp, a2, 6
                  fcvt.s.wu    ft10, s8
                  slt          s7, s10, a1
                  lui          s5, 69246
                  lui          s7, 585059
                  remu         a1, sp, a3
                  sltiu        s4, a1, -469
                  fmv.w.x      fs0, s2
                  flt.s        s0, fs8, fa1
                  and          s7, t4, s5
                  mul          s4, a1, a7
                  slti         s9, s0, 381
                  divu         tp, a0, s8
                  feq.s        s10, fs5, fs8
                  sltiu        gp, s11, -2041
                  srli         s2, t2, 0
                  slti         s2, a7, 1097
                  fmin.s       ft2, fa4, ft1
                  fmv.w.x      fs7, t3
                  auipc        s0, 719791
                  srai         a2, s7, 12
                  addi         s5, s4, -1887
                  fcvt.wu.s    t4, ft5
                  auipc        a3, 381759
                  slt          t4, a0, s4
                  sub          s9, gp, s8
                  addi         s1, s1, -1754
                  mul          a1, a2, gp
                  auipc        a5, 454940
                  fmul.s       ft5, fa0, fs0, rdn
                  rem          a3, sp, tp
                  auipc        s1, 795996
                  fcvt.w.s     a1, fs5
                  or           a4, a4, t5
                  srl          s6, a7, a5
                  div          s7, t0, s2
                  sub          tp, a1, s4
                  sub          t2, a1, s4
                  slli         gp, t4, 3
                  auipc        t3, 967914
                  fsgnjn.s     fa6, fa3, ft2
                  sub          t4, sp, t4
                  fsgnj.s      fs3, fs11, fs8
                  sub          ra, a2, a0
                  lui          s9, 172673
                  sltiu        s0, a5, 368
                  slt          s9, s6, t0
                  divu         s2, gp, s6
                  fsgnj.s      ft7, fs1, ft9
                  fcvt.s.w     ft4, a5, rup
                  fmin.s       fs2, fa0, fa3
                  srl          s2, a1, s7
                  mulh         a3, s5, t6
                  fcvt.s.w     fs3, ra
                  fmv.w.x      fs0, s3
                  fsub.s       ft0, ft4, ft8
                  mulhsu       t2, t4, s5
                  mulhu        s2, a0, t0
                  auipc        a6, 688506
                  slli         zero, s4, 30
                  srai         s3, t5, 13
                  fclass.s     zero, ft9
                  fadd.s       ft6, ft2, fs6, rmm
                  srli         t2, t2, 14
                  mulhsu       ra, a1, s11
                  mulhu        zero, s2, t6
                  rem          a6, s0, a7
                  remu         a5, t0, s5
                  xor          a7, a2, t5
                  sltiu        a3, s5, -614
                  andi         a6, zero, 1170
                  fle.s        zero, fa7, ft8
                  srli         s2, s6, 18
                  div          t6, t6, s2
                  mulhsu       s11, s0, a3
                  mul          a1, s4, gp
                  fcvt.s.wu    fa6, s10
                  fsgnjn.s     fs9, ft1, fa3
                  addi         s5, tp, -227
                  andi         a3, a0, -1409
                  sltu         t4, a7, a7
                  sra          s10, sp, a4
                  sub          s6, t4, s1
                  lui          zero, 631494
                  srai         s1, t1, 0
                  lui          a4, 873383
                  rem          s10, s6, a3
                  auipc        a7, 97658
                  remu         s11, s7, sp
                  remu         tp, s3, a6
                  srli         s0, s5, 21
                  fmin.s       ft1, ft4, ft5
                  fmax.s       fs4, fs2, fs8
                  add          s7, s10, s8
                  rem          s8, t1, sp
                  add          s4, t2, s2
                  fsgnjn.s     fa0, fs5, ft0
                  divu         s11, a1, t4
                  sub          ra, s8, a0
                  rem          s11, a1, a7
                  slt          tp, s5, tp
                  fsqrt.s      fs7, fa0
                  srli         t6, s2, 16
                  andi         s7, ra, -1550
                  fmv.x.w      t4, ft9
                  mul          t2, zero, a4
                  add          s3, gp, s9
                  nop
                  fsgnjn.s     fa4, fa0, ft7
                  srl          s2, t1, s5
                  feq.s        a5, fs1, fs7
                  divu         s1, s3, s2
                  mulh         s9, t4, t5
                  srai         t3, gp, 31
                  fcvt.w.s     a3, fs1, rdn
                  divu         t2, s3, ra
                  mulh         ra, s11, t4
                  fcvt.w.s     a2, fs2, rmm
                  xor          a4, a3, ra
                  sltu         a4, t1, ra
                  mulhu        a5, s11, s10
                  slti         s2, s8, -1081
                  fmax.s       fs6, fs10, fa4
                  fle.s        t6, fa2, ft6
                  sub          s11, s2, s10
                  mul          tp, gp, s0
                  fmin.s       fs8, fs5, fa5
                  fsgnjn.s     ft7, ft11, ft4
                  slli         a5, s2, 19
                  fsgnjn.s     fs2, ft9, ft0
                  rem          s1, t1, s5
                  fmax.s       fs10, fa4, fa7
                  rem          a1, a4, s5
                  slt          t3, t4, t6
                  fle.s        a5, fs2, fs11
                  divu         t3, s4, a3
                  mulh         s3, s2, sp
                  fdiv.s       ft5, fs2, fa3
                  xori         ra, a5, 403
                  fcvt.s.wu    ft8, t4, rtz
                  fsub.s       fs8, fs11, ft10, rdn
                  sltiu        a7, a6, -1012
                  or           a7, t6, t4
                  addi         s2, a1, -817
                  srl          t6, s6, t1
                  sll          a1, a5, t2
                  srl          a5, s3, s8
                  fsqrt.s      fs0, fa7, rtz
                  flt.s        s5, fs1, ft9
                  fsub.s       fs9, fs2, ft10
                  fmul.s       fa5, fa5, ft2, rdn
                  slti         s5, s5, -1662
                  sltiu        t2, a4, 733
                  auipc        s7, 928473
                  addi         t2, t4, 362
                  xori         a4, s11, 1226
                  slt          a4, a1, tp
                  slt          s5, t6, s3
                  divu         s11, sp, t4
                  fsub.s       ft4, ft5, fa4, rup
                  fcvt.w.s     s0, fs7
                  flt.s        t2, ft10, fs8
                  fdiv.s       ft6, fa5, fs9, rmm
                  fcvt.s.w     fs10, zero, rup
                  mulhu        a3, s2, gp
                  fsqrt.s      fs2, fs10
                  fadd.s       fs2, fa3, ft0
                  remu         a5, t2, s11
                  srl          s11, s6, t0
                  sll          s1, t1, s6
                  fmv.w.x      ft2, t5
                  fclass.s     s7, ft9
                  srli         s10, zero, 0
                  auipc        a1, 800516
                  slti         a0, s11, -1409
                  fmv.x.w      t3, ft9
                  fsqrt.s      fs3, fs3
                  fmax.s       fs10, fs1, fs9
                  sltu         s5, ra, s11
                  fadd.s       ft10, fs10, ft1, rup
                  fmin.s       fs3, fa3, fa5
                  mulh         a6, gp, s9
                  srai         s10, s11, 31
                  fsub.s       ft0, ft0, ft0, rup
                  mul          t4, t0, sp
                  mulhu        a0, s8, a7
                  addi         a2, a2, 10
                  fmul.s       fa3, fs8, fs8, rne
                  fmv.w.x      ft7, s0
                  fmax.s       ft8, ft11, ft6
                  fsgnj.s      fs9, fa2, fs9
                  fmin.s       fa7, fs4, fs0
                  fsub.s       fs6, fa0, fs8, rup
                  feq.s        s7, fs8, fs6
                  fcvt.s.wu    fs8, s7, rne
                  rem          a0, t3, a3
                  nop
                  fsub.s       fs2, fs2, fs9, rdn
                  nop
                  fclass.s     a5, fa5
                  fmv.w.x      fs0, s6
                  sub          s0, sp, s0
                  slti         s4, s11, -266
                  fmul.s       fs8, fs8, fs9, rup
                  xor          t4, s4, s11
                  lui          t4, 257076
                  add          a6, ra, a0
                  fmv.x.w      s3, fs10
                  fadd.s       fs7, ft6, fs9
                  fsqrt.s      ft5, fs2
                  feq.s        s11, fs8, ft4
                  sltu         t4, ra, gp
                  fmv.x.w      ra, fa3
                  div          s9, s7, s11
                  sra          a5, s2, s9
                  fclass.s     t6, fs7
                  fsgnjn.s     fa3, fs0, fs7
                  fmv.x.w      t4, fs4
                  fsub.s       fs0, ft11, fs11, rne
                  fcvt.s.wu    ft7, t5, rtz
                  srai         t4, s5, 5
                  xori         s11, s1, 1636
                  fadd.s       ft10, fa2, ft6
                  remu         a3, t2, s7
                  auipc        s5, 642971
                  rem          s10, a0, s7
                  sll          s0, a5, a2
                  fsgnjn.s     fa0, fs6, fa1
                  mulh         s4, gp, a7
                  rem          a2, s11, a7
                  fcvt.s.wu    ft10, s1, rdn
                  fsqrt.s      fs7, ft5, rtz
                  srli         s10, a5, 24
                  fsgnjx.s     fa4, fs0, ft4
                  flt.s        a0, ft2, fs6
                  fsqrt.s      ft7, ft6
                  fmul.s       ft8, fa3, ft3
                  addi         sp, gp, -1459
                  sltu         ra, s1, a7
                  srli         a5, ra, 0
                  flt.s        ra, fs9, fs3
                  and          t4, s1, t4
                  fclass.s     a3, fs3
                  fmin.s       fs8, fs10, ft2
                  fsgnjn.s     fs10, ft8, ft9
                  fmax.s       fs2, ft11, ft3
                  mul          tp, s2, tp
                  fsgnjx.s     ft7, fa4, ft2
                  addi         s4, s10, 1942
                  slti         s9, ra, -566
                  sltu         a7, a1, s11
                  fcvt.wu.s    a2, fs0
                  nop
                  flt.s        a6, ft10, ft10
                  fsub.s       fs1, fs9, ft9
                  and          zero, ra, a6
                  sltu         a7, s7, s5
                  srli         s1, t2, 11
                  rem          a4, s8, t5
                  fmin.s       ft8, fs2, fs4
                  fdiv.s       fs1, fa1, fs4, rtz
                  fmv.w.x      ft5, a0
                  xor          a2, t0, a4
                  mul          a6, s5, a0
                  sltiu        s2, t6, 1396
                  slti         t3, s9, -1150
                  remu         a7, a7, a6
                  auipc        a4, 492114
                  auipc        a7, 21812
                  fsgnj.s      fs7, fs5, ft9
                  fcvt.w.s     s7, fa1
                  xor          s3, s0, s5
                  sltu         s0, a4, a1
                  fmax.s       ft8, fa1, fs4
                  slli         t3, t1, 6
                  lui          a7, 511378
                  srl          a4, t6, ra
                  fsgnj.s      fa2, fa1, fs2
                  remu         a3, t6, s1
                  fsqrt.s      ft5, ft11, rmm
                  auipc        a1, 42931
                  mulhu        t2, s10, a1
                  srl          t6, s8, a6
                  auipc        sp, 220981
                  mulhu        sp, s1, t2
                  fdiv.s       fa1, ft4, fs0, rup
                  auipc        s11, 523396
                  fmul.s       ft2, fs11, fs5, rup
                  sltiu        a3, a2, -1010
                  fcvt.s.wu    fs8, tp
                  or           s2, zero, t1
                  fmin.s       fs6, fa3, fa1
                  fsgnjn.s     ft2, ft5, fa1
                  fmv.x.w      a6, ft11
                  fle.s        s4, ft3, fs10
                  fcvt.s.w     ft10, s7
                  add          a7, s5, a2
                  sltu         s7, s9, s11
                  mulhsu       t3, a4, t3
                  fmax.s       ft6, ft5, fs0
                  fcvt.s.w     ft9, s9
                  rem          s7, s11, s4
                  fcvt.wu.s    a6, fs11, rmm
                  fdiv.s       fs7, fa3, fs5
                  mulhsu       a4, t1, zero
                  srai         a2, a4, 21
                  slti         gp, s5, -564
                  fmin.s       ft3, fs10, fs5
                  slli         gp, s0, 12
                  sltu         t2, s9, s4
                  fle.s        tp, ft6, fs2
                  fmv.w.x      fs5, s11
                  fdiv.s       ft5, ft5, fa6
                  nop
                  flt.s        a2, fa5, fs9
                  fsgnjx.s     fs8, fs7, fs5
                  srai         s9, s2, 9
                  fcvt.s.w     fa2, s7
                  fsub.s       ft2, fa7, ft2
                  fcvt.w.s     s2, fa0
                  xor          sp, t5, a6
                  srai         s3, a2, 3
                  sltu         a4, a0, a1
                  andi         s8, s9, 1971
                  mulhsu       s1, s2, s6
                  fle.s        s2, fa6, fa1
                  fmv.x.w      a2, ft1
                  xori         s2, t3, 1305
                  fcvt.s.wu    ft8, a2, rdn
                  fsgnj.s      fs7, fs5, ft2
                  addi         s11, tp, 543
                  sra          s11, s1, ra
                  sltu         s8, s9, s10
                  slt          s2, s10, t0
                  mulh         s1, a4, s6
                  fsqrt.s      fs6, fs5, rup
                  add          a0, t4, t3
                  fsub.s       fs0, ft1, fa6
                  sltu         gp, s7, s4
                  fcvt.w.s     zero, fa4
                  flt.s        s3, fs8, fa5
                  mulh         s11, s8, s4
                  ori          s10, zero, 1948
                  sll          s8, t1, a6
                  divu         s1, s10, t6
                  fsub.s       ft0, fs4, fa0, rup
                  divu         t2, a3, s8
                  fcvt.s.wu    ft11, s1, rne
                  fsub.s       ft0, ft10, ft10, rdn
                  srli         a5, s0, 27
                  rem          s11, s10, s3
                  divu         zero, s9, s1
                  slt          s2, t1, t4
                  fsub.s       fs4, ft3, fs8, rup
                  div          s0, t3, a2
                  div          a0, a1, zero
                  srli         s6, s2, 1
                  fadd.s       fs0, fs8, ft9
                  fadd.s       fs9, fs8, ft9
                  xori         s8, a6, -1663
                  fle.s        t4, fs5, ft10
                  slt          a5, t4, ra
                  add          t6, a5, s7
                  fcvt.w.s     s8, fs1, rtz
                  auipc        tp, 774920
                  add          tp, s8, a6
                  or           tp, s7, s2
                  fsgnjx.s     fs2, fs3, fs2
                  slti         gp, t6, -1380
                  divu         s4, sp, s8
                  fdiv.s       fs10, fa0, ft1
                  auipc        t2, 419020
                  div          s1, s9, s0
                  sltu         a3, s3, s9
                  slli         gp, t3, 27
                  fcvt.wu.s    t6, ft5
                  flt.s        s5, ft6, fa1
                  fclass.s     s11, ft7
                  mulhu        a5, gp, sp
                  slt          a6, t1, a0
                  fsqrt.s      ft7, ft1
                  or           a2, t4, a1
                  andi         a2, zero, -651
                  sltiu        s1, s1, -1896
                  fclass.s     zero, fs4
                  fcvt.w.s     s5, ft11
                  fsgnjx.s     ft5, ft6, fs4
                  slti         a1, a7, 267
                  divu         s3, s3, s10
                  slti         s3, s10, -1375
                  sll          a2, tp, zero
                  fsgnjx.s     fs5, ft0, ft10
                  sra          t4, t4, t6
                  div          a0, t4, s6
                  srl          s3, a4, a5
                  feq.s        a0, ft5, fs7
                  sltiu        s8, s6, 400
                  nop
                  slt          a7, s4, a4
                  ori          gp, a5, -751
                  fle.s        a3, fs4, fa4
                  sltu         s6, a6, s1
                  or           s2, a5, t3
                  fcvt.s.wu    fa0, s6
                  mulhsu       s0, s4, s3
                  andi         s10, s1, 1654
                  fsub.s       ft0, ft1, fs0, rmm
                  fdiv.s       ft7, ft4, ft0, rup
                  fmul.s       fs2, fs3, ft8, rdn
                  fle.s        s2, ft3, fs10
                  fcvt.s.w     ft3, s7, rdn
                  and          sp, a2, t6
                  nop
                  nop
                  fclass.s     s6, fs0
                  fsgnjn.s     fa6, ft3, fs2
                  slli         a5, zero, 19
                  xor          a0, a4, a2
                  feq.s        s4, ft8, ft4
                  mulhu        s8, t4, t6
                  lui          t3, 52033
                  slt          t2, t0, t6
                  slti         s10, t1, -362
                  srl          a6, a6, s7
                  xor          a5, s10, s0
                  add          a2, a1, s11
                  sltiu        s8, s7, 1247
                  fmv.w.x      fa2, s3
                  mulhu        a2, s2, s8
                  fle.s        s4, ft7, ft9
                  fmv.w.x      fs4, a1
                  fcvt.s.w     fs8, s4
                  fmax.s       fa1, ft9, ft1
                  sll          ra, a1, t6
                  fsub.s       fs9, ft11, fa5
                  slti         s7, t6, -103
                  srli         a0, s5, 27
                  srli         a7, s0, 9
                  slt          t2, s9, tp
                  slti         t4, a5, 1282
                  nop
                  fdiv.s       ft10, fa3, ft5, rup
                  xor          a1, ra, s4
                  fmv.w.x      fa4, t2
                  mulh         a0, a3, a5
                  ori          t3, t0, -547
                  fmv.w.x      fs8, s2
                  fsgnjn.s     ft0, ft8, fa1
                  mulh         s11, a4, s9
                  mulhsu       zero, a1, a4
                  fadd.s       fs3, fs2, ft3, rne
                  sub          s8, a4, s5
                  sll          s9, ra, s2
                  fcvt.s.w     fs10, a4
                  lui          s2, 845770
                  fmv.w.x      fs4, a3
                  slt          s1, s7, a7
                  sub          s8, s1, a5
                  fcvt.wu.s    s11, fs4, rdn
                  div          s10, a2, gp
                  mulhu        t2, tp, s8
                  fmv.w.x      fs9, gp
                  srli         t4, s8, 1
                  fmv.x.w      a4, fa4
                  fmin.s       ft7, ft7, fa0
                  mulhsu       s1, s8, s1
                  slli         s8, ra, 12
                  fcvt.w.s     tp, ft0
                  auipc        s5, 584888
                  fcvt.wu.s    s8, fa6, rmm
                  xori         s4, a4, -1930
                  mulhsu       s1, t2, t2
                  rem          ra, s8, a6
                  fdiv.s       fs11, ft4, ft2, rup
                  sltiu        s2, gp, -1482
                  srl          s5, t4, s9
                  fcvt.wu.s    s5, fa1
                  fcvt.wu.s    zero, fa2
                  srli         s10, s9, 16
                  fle.s        t2, fa0, fs10
                  or           sp, s6, s1
                  fle.s        s5, fa1, fs7
                  fclass.s     sp, fa2
                  fcvt.wu.s    sp, fs7, rne
                  mulh         a1, s8, tp
                  fdiv.s       fs3, fa4, fs0
                  xori         t2, s8, 567
                  fsub.s       ft10, ft3, ft1, rdn
                  xor          s4, t3, t3
                  auipc        a6, 358588
                  sra          s10, s6, t1
                  mul          t6, s7, s2
                  add          s3, a7, s8
                  auipc        s11, 945597
                  divu         s10, s2, gp
                  fsub.s       fa3, fa6, fa4
                  and          a5, a5, s8
                  xori         s6, s11, 1480
                  fsgnjn.s     fs6, fs11, ft3
                  sll          a0, s1, s7
                  fmin.s       ft7, fs6, fa2
                  fcvt.s.w     fs11, t1, rup
                  add          zero, a7, s0
                  addi         s3, t4, -1866
                  or           a7, t0, tp
                  slt          t3, t4, s5
                  srl          t6, a7, zero
                  sll          s3, gp, gp
                  fle.s        s2, fs8, fa1
                  ori          s1, s2, -1194
                  ori          s4, t4, 1791
                  sra          sp, gp, s4
                  remu         t2, s8, a6
                  fmv.w.x      fs1, t6
                  and          s1, s2, ra
                  fmax.s       ft11, ft11, ft11
                  srl          a3, t3, t0
                  mulhsu       s8, tp, s9
                  sltu         s1, a5, s10
                  srl          s9, t6, sp
                  divu         a0, s4, t3
                  fmv.w.x      ft6, a1
                  fclass.s     a6, ft4
                  and          s6, a2, s11
                  ori          s4, sp, 1498
                  or           t6, s2, a1
                  div          tp, s3, s1
                  sub          tp, ra, a2
                  auipc        s3, 836437
                  fmul.s       fa7, ft4, ft2, rdn
                  andi         t3, s11, 523
                  slli         s11, s2, 9
                  sltiu        s0, ra, 803
                  fcvt.w.s     a2, ft4
                  fsgnjx.s     ft9, fs10, ft0
                  auipc        s11, 362940
                  div          s2, t3, s3
                  sll          a4, s6, gp
                  fclass.s     zero, ft6
                  srli         a1, t2, 3
                  xori         t4, s11, -927
                  fsgnjn.s     fa1, ft9, fs7
                  mulh         s11, t4, t6
                  remu         s10, a5, s3
                  fcvt.w.s     a7, ft4, rne
                  mulhsu       s4, s5, s8
                  srli         s1, gp, 23
                  slt          s1, t0, t4
                  sltu         zero, t3, s6
                  sra          t3, t4, s5
                  slti         s5, s0, -1266
                  fadd.s       fs3, fs3, fa7, rdn
                  fsgnjn.s     ft0, ft8, ft2
                  xor          s8, t2, s8
                  nop
                  nop
                  auipc        s9, 715569
                  mulhu        a7, s7, s11
                  fsgnj.s      fa4, fa0, ft10
                  mulhsu       s9, s1, s3
                  fmv.x.w      tp, ft0
                  sltiu        a5, t2, -740
                  nop
                  flt.s        tp, fs6, ft10
                  andi         gp, s9, 1626
                  rem          t2, sp, tp
                  fsqrt.s      ft9, ft10, rne
                  srai         a6, t1, 25
                  flt.s        s0, fa4, fs5
                  slti         t3, t4, -316
                  rem          s0, s5, s10
                  or           a2, t5, zero
                  divu         t6, t5, a4
                  slt          sp, s4, sp
                  fsqrt.s      ft3, fa5
                  add          s5, ra, s4
                  mulhsu       s6, t1, sp
                  xor          a2, t2, t4
                  mulhsu       a0, a6, s6
                  fdiv.s       fs0, fa5, ft2
                  sra          s9, a6, a4
                  fmin.s       fs2, ft11, ft3
                  fsgnj.s      fs3, fa4, ft7
                  fmul.s       ft2, fa6, ft8
                  addi         t6, s8, 1052
                  slli         s1, zero, 27
                  fmax.s       ft4, fa2, fs3
                  mulhsu       tp, zero, a7
                  andi         tp, sp, -621
                  sra          t6, a5, tp
                  slli         a6, a5, 30
                  fcvt.s.w     fs2, sp, rtz
                  remu         a6, a0, a6
                  fsgnjn.s     fs6, fs4, fs5
                  fsgnjn.s     fa4, ft3, ft7
                  mulh         s7, t0, s2
                  sltiu        t3, s5, -75
                  xori         s0, a5, -538
                  fcvt.s.wu    fa0, s1
                  flt.s        ra, ft1, fs4
                  auipc        s1, 1003778
                  ori          s6, a6, -1379
                  flt.s        gp, fa0, ft10
                  fsqrt.s      ft2, fa0
                  flt.s        gp, fs9, fs6
                  feq.s        ra, fa1, fs4
                  fdiv.s       fa1, ft6, ft5
                  fclass.s     s0, fa3
                  fsub.s       fa3, fa2, fs2
                  srli         s0, s0, 19
                  fmax.s       ft1, ft9, ft11
                  slti         a3, a5, 1175
                  mulh         s4, t4, a1
                  and          s0, t5, s0
                  fsgnjx.s     fs0, ft1, fs5
                  and          a6, ra, s1
                  rem          s1, s8, s4
                  flt.s        sp, ft11, fa5
                  slti         s11, t3, -2041
                  mulh         s6, s6, a0
                  fsgnj.s      ft8, ft1, ft10
                  and          s6, s1, t2
                  srai         s6, s7, 27
                  feq.s        s10, ft10, ft1
                  fcvt.s.wu    fs9, s10
                  slt          t4, a7, s8
                  ori          a0, tp, -709
                  fsgnjx.s     fs10, ft0, ft0
                  add          s1, ra, t4
                  fcvt.s.w     fs3, a4
                  fle.s        a6, fs6, ft11
                  srli         gp, a3, 6
                  mulh         s6, a4, a3
                  fcvt.s.wu    ft11, s1, rdn
                  srai         t6, a6, 23
                  lui          s0, 98323
                  add          a0, a6, ra
                  sltiu        a1, s9, 1854
                  fsgnj.s      ft1, fs1, ft10
                  remu         s8, zero, s0
                  feq.s        t6, fs6, ft6
                  sltiu        a3, s6, 1553
                  ori          s9, s4, -1123
                  srli         s5, t5, 31
                  fmv.x.w      s4, fs4
                  sll          ra, s8, t1
                  xor          s6, a6, a1
                  and          t2, s8, s11
                  srai         a4, t3, 1
                  flt.s        gp, fs10, fa5
                  fmin.s       fs1, fs6, ft6
                  slt          a6, s8, tp
                  fsqrt.s      fs3, fa2
                  fmv.w.x      fa0, s3
                  fmv.x.w      t4, fa7
                  flt.s        s4, ft6, ft1
                  fmv.w.x      fa3, t5
                  add          s4, s3, a1
                  divu         t4, s1, a7
                  fcvt.s.w     ft3, a6, rdn
                  fcvt.wu.s    gp, ft3
                  fle.s        s8, fs0, fs3
                  mulhsu       a4, ra, a0
                  fsgnj.s      fa3, fs2, fs10
                  mulh         s1, gp, a4
                  fmin.s       fa1, fs1, ft6
                  slt          a6, t2, s6
                  sra          t3, s1, t2
                  fmin.s       fa6, fs0, fs10
                  andi         s9, s9, -897
                  srl          s11, s2, a7
                  slt          a7, s1, s9
                  fclass.s     s1, fa6
                  divu         a3, s10, a4
                  xor          t4, t6, t3
                  fsgnjn.s     fs3, fs2, fs0
                  fsub.s       fs3, ft7, fa5, rup
                  sra          t3, s4, t6
                  mul          ra, s11, t5
                  xori         s5, s0, 905
                  fclass.s     s1, fs8
                  fclass.s     a7, ft7
                  lui          zero, 345127
                  sll          gp, s0, a7
                  fsgnjx.s     fs7, fs1, fs8
                  mul          s8, a1, a0
                  fsgnj.s      fs2, ft0, ft5
                  div          s5, t5, t1
                  sra          s2, s2, a1
                  fmul.s       ft10, fa7, fa2
                  fadd.s       fa4, fs5, fs9
                  fsqrt.s      ft0, fa2, rup
                  fmul.s       ft5, ft0, fs7
                  fadd.s       ft7, fa4, fs9
                  and          a4, a0, s6
                  slt          a3, s4, s11
                  fsgnjn.s     fa1, fs5, fa2
                  slti         gp, a5, -54
                  fcvt.s.wu    ft2, s0
                  fsub.s       fs10, ft11, fs3, rup
                  remu         s11, a1, s2
                  slt          a7, s1, sp
                  lui          a1, 919288
                  fmv.w.x      ft8, s11
                  feq.s        a3, ft11, ft5
                  fcvt.s.wu    ft9, t6, rup
                  sll          a7, s11, t5
                  fmin.s       ft9, ft3, fs7
                  slt          zero, s1, s6
                  mulhsu       a7, s8, s4
                  fclass.s     s8, ft7
                  and          s7, a2, tp
                  fdiv.s       fa6, ft5, fa7, rdn
                  fcvt.w.s     a3, ft2, rup
                  sll          a2, s11, t5
                  slti         s8, a4, -471
                  or           t2, s7, gp
                  mul          sp, t6, a3
                  fmin.s       ft1, fs2, fa5
                  fsub.s       fa3, fs11, fs4
                  fcvt.s.w     ft7, t1, rdn
                  fmv.w.x      fs1, sp
                  fdiv.s       ft11, fs6, fa2
                  mul          a2, a3, s11
                  slli         a1, a5, 16
                  fmul.s       fs1, ft2, fa7, rdn
                  or           t4, s1, a0
                  fsgnj.s      fa3, ft7, ft8
                  srli         s2, s3, 16
                  fsub.s       ft6, fa1, fs8
                  fclass.s     s1, fa5
                  fmul.s       ft7, fa7, ft0
                  sltiu        t3, ra, -785
                  fclass.s     s10, fa7
                  sll          s8, t3, t5
                  fcvt.s.wu    fs10, t4
                  sltu         a5, t5, a2
                  fadd.s       fa6, fa1, ft10, rmm
                  xor          a0, s7, s11
                  fsgnjx.s     ft4, fa7, fs1
                  slt          t6, ra, gp
                  mulh         t4, a2, t4
                  srl          s9, s2, s9
                  slt          a2, a2, t5
                  mulhu        t2, a0, s2
                  slt          tp, a1, a7
                  sub          t6, ra, s6
                  lui          s5, 372801
                  srai         a3, t4, 8
                  fsgnjx.s     fa1, fa6, ft8
                  fmv.x.w      s10, fs0
                  fmin.s       fa7, ft7, fa7
                  xor          s10, t6, zero
                  xori         s4, sp, 719
                  fsqrt.s      fs8, fs10
                  divu         a6, a5, a4
                  fclass.s     s9, fs7
                  sub          s8, s8, t3
                  feq.s        a4, fa7, ft1
                  addi         s0, a7, -1352
                  fsgnjx.s     ft9, ft5, fa4
                  xori         s1, a5, 189
                  fdiv.s       ft10, ft11, ft4
                  mulhsu       s3, s11, a2
                  fle.s        a5, fs6, fa5
                  fcvt.wu.s    a2, ft3
                  sll          tp, s5, t5
                  mulhu        zero, t0, a4
                  fcvt.w.s     s0, fa5
                  add          a7, t1, s9
                  fmv.w.x      fa7, a3
                  fcvt.s.w     fs2, a2
                  rem          s10, s8, a3
                  lui          zero, 349847
                  fcvt.w.s     ra, ft10
                  xori         s4, s2, 476
                  fsub.s       fa5, ft0, fa7
                  xori         zero, a4, -106
                  fcvt.wu.s    t4, ft4, rmm
                  fcvt.s.wu    fs0, s9
                  remu         a2, s9, ra
                  divu         s10, t6, t1
                  fmax.s       fs10, ft5, ft1
                  sll          sp, s8, tp
                  fmv.x.w      s7, fs5
                  ori          a4, a2, 1469
                  addi         s3, s8, -1627
                  fsub.s       fs10, fs11, ft9
                  sra          s2, a1, sp
                  fsqrt.s      fa2, fs4
                  feq.s        s5, fa2, fa2
                  fsgnjx.s     fs0, ft5, ft9
                  div          s11, t0, s5
                  div          a4, a6, t2
                  fmin.s       ft6, ft6, fs10
                  mulh         s6, zero, t6
                  fsgnjx.s     fs3, ft1, fs9
                  divu         s3, a6, a2
                  slti         s4, a5, -552
                  addi         gp, s3, 1935
                  mul          s10, t2, s6
                  sltiu        s7, t0, 785
                  fle.s        t4, fs0, fs11
                  rem          s5, t2, t6
                  or           a4, t3, t2
                  flt.s        s1, fa5, fs7
                  slli         a5, t0, 8
                  or           s8, ra, t6
                  fclass.s     a4, fs2
                  rem          s6, t0, s8
                  fcvt.s.wu    fs1, t3, rmm
                  mul          a7, a2, ra
                  srl          s7, t4, s7
                  add          s9, t1, s3
                  fsgnjn.s     fs4, ft1, ft0
                  mul          s2, t5, s3
                  rem          a4, a4, s7
                  sltu         s8, s10, t3
                  andi         s9, ra, 1830
                  slt          s9, a4, t1
                  slt          a5, a6, s8
                  slli         s1, s2, 8
                  fadd.s       ft2, ft1, fa5
                  slt          a2, gp, s11
                  fclass.s     s2, fa6
                  fmul.s       fs11, fs0, fs9, rne
                  andi         a4, a1, 359
                  fsgnj.s      ft1, fs6, ft7
                  slt          s6, t6, sp
                  xori         s5, zero, -140
                  div          s5, a1, s7
                  mul          t3, t0, a0
                  srli         s1, s7, 0
                  fsqrt.s      fa5, fs9, rne
                  mulh         s7, s1, t6
                  andi         s4, s2, 1163
                  nop
                  fclass.s     tp, fa2
                  fdiv.s       fs0, fs6, ft7
                  fmv.w.x      fa3, t3
                  divu         sp, s7, s3
                  fmv.x.w      a3, fs10
                  fcvt.s.w     fa2, a4
                  mulhu        sp, a4, s9
                  slt          t4, t2, t3
                  srl          a5, t4, a1
                  fsqrt.s      fa7, fs9
                  mulhu        s1, s1, t1
                  fadd.s       fs3, fs4, ft0, rmm
                  fadd.s       fs4, fa6, fs4, rdn
                  divu         a3, s5, t6
                  fcvt.wu.s    ra, fa5
                  sra          s2, a3, s9
                  and          s7, gp, s2
                  div          s8, sp, a2
                  sub          s6, s10, s1
                  fmv.x.w      s4, fa4
                  mul          s5, ra, s7
                  srl          s1, t2, s7
                  srl          s3, a2, a4
                  div          s10, s3, s3
                  srl          a3, s10, a0
                  flt.s        s7, fa3, ft11
                  and          a2, t2, s9
                  mulhu        a2, t0, a7
                  remu         a4, t5, a3
                  slli         a1, a1, 3
                  fmin.s       fs6, ft4, fa6
                  and          tp, a1, a6
                  mulh         a4, a6, s6
                  srai         t3, zero, 2
                  andi         zero, s10, 404
                  and          s8, s10, a2
                  and          s2, s6, a0
                  slli         a4, a1, 19
                  fcvt.w.s     gp, fs10, rup
                  add          zero, s1, s11
                  sll          a2, zero, ra
                  add          a1, tp, s10
                  srai         a4, s9, 23
                  fclass.s     sp, fa3
                  sltiu        gp, s6, 103
                  mulhu        a6, a2, t0
                  divu         s11, gp, s2
                  lui          a2, 1042184
                  sll          a6, tp, a5
                  nop
                  xori         tp, s6, -307
                  fcvt.s.wu    ft4, s11, rne
                  sltu         s3, a1, s10
                  srai         s5, s11, 30
                  nop
                  fsgnj.s      ft1, ft1, fs11
                  fcvt.w.s     t3, ft6
                  sll          a1, s7, gp
                  remu         a5, s9, t1
                  andi         t2, s4, -232
                  srli         sp, t5, 31
                  mul          zero, a3, a0
                  and          t3, s0, s2
                  slt          ra, t5, t0
                  mulh         a5, t2, s5
                  fdiv.s       fs6, ft0, fa5
                  xor          zero, t2, s11
                  sltiu        tp, zero, -1076
                  fmv.w.x      ft5, t5
                  srli         s10, t6, 9
                  fclass.s     s4, ft3
                  mulhsu       tp, t2, s1
                  auipc        a3, 412496
                  srai         t3, s1, 12
                  or           zero, a6, s8
                  and          t3, gp, zero
                  slti         a1, s9, -1491
                  sub          s2, a0, a1
                  nop
                  fcvt.s.wu    ft3, s7
                  fsub.s       ft3, fa3, fs5
                  srl          a5, ra, s1
                  auipc        s5, 320661
                  srai         sp, a1, 5
                  mulhsu       a4, s8, t1
                  fmin.s       fs2, ft9, fs7
                  mulh         t6, gp, a0
                  fsgnjn.s     ft10, fs7, fa7
                  andi         s11, s1, -1002
                  auipc        zero, 1025718
                  xor          t2, t5, s7
                  ori          s1, t0, 1388
                  andi         sp, s1, -306
                  srai         ra, s3, 31
                  xori         s2, s1, 173
                  fmin.s       fa7, fa4, fs3
                  remu         a5, s1, t5
                  fcvt.w.s     t4, ft3
                  fadd.s       fs8, ft7, ft11, rmm
                  xori         a6, s10, -268
                  fsgnjn.s     fa3, ft11, fa5
                  xor          tp, gp, s8
                  mul          s10, s2, gp
                  or           ra, s0, s5
                  fmax.s       ft0, fs11, ft2
                  slti         a7, t0, -524
                  fmv.x.w      gp, fa6
                  ori          t4, zero, 815
                  feq.s        a2, ft3, fa0
                  div          a6, s5, s1
                  fsqrt.s      ft3, ft5, rup
                  xori         t2, sp, -722
                  feq.s        ra, ft2, ft2
                  xori         zero, a3, 1240
                  addi         a3, s11, -883
                  fadd.s       ft2, fa2, ft9
                  fmin.s       fs4, fs10, fs8
                  fmul.s       fs0, fs11, fs2, rup
                  fcvt.w.s     t3, fs8
                  fsgnjn.s     fa3, fa0, fs0
                  and          s11, t6, t6
                  fmv.w.x      fs0, s9
                  and          a2, a7, a6
                  andi         a3, t6, -196
                  sll          a5, s4, a2
                  ori          a7, t1, -1914
                  fmax.s       fa2, ft2, ft6
                  or           s8, s1, a2
                  fadd.s       fa5, fa2, ft0, rup
                  or           s8, s11, a7
                  or           s5, sp, t2
                  xor          s6, s2, ra
                  fsgnjx.s     fa0, ft1, fa7
                  fsgnj.s      fa7, fs10, fs8
                  sll          s2, s2, t5
                  mulhsu       ra, a2, s11
                  andi         s8, s5, -66
                  addi         sp, s1, -603
                  andi         ra, s7, -1303
                  fcvt.s.wu    fs7, tp, rmm
                  feq.s        s8, ft7, ft11
                  sll          s9, a6, t4
                  divu         t4, s8, s1
                  xori         ra, a7, 1091
                  slt          zero, a7, s8
                  fsub.s       fa5, fs4, fs8, rmm
                  div          a6, a3, s5
                  add          a7, s2, t1
                  fmv.w.x      fs6, a0
                  mulhsu       sp, t5, s5
                  slt          s6, t4, a3
                  srl          s0, t4, s3
                  addi         a5, t3, 1195
                  flt.s        a2, ft5, ft6
                  sra          t6, s10, t5
                  srli         s3, t2, 3
                  fcvt.wu.s    a0, ft4
                  xori         t4, a2, -1321
                  ori          zero, a5, 703
                  fcvt.s.w     fs2, s3, rmm
                  xor          a3, ra, s1
                  srl          tp, s0, tp
                  flt.s        t6, fa4, fs1
                  flt.s        s0, ft1, ft9
                  fclass.s     sp, fs4
                  feq.s        t4, ft5, fa5
                  and          s4, s9, s1
                  mul          ra, a5, tp
                  slli         t2, a4, 21
                  rem          s7, tp, s4
                  slli         t4, tp, 8
                  sll          a6, a3, t0
                  fsub.s       fs2, fs5, fa0, rtz
                  sll          s1, s8, s8
                  lui          a4, 794890
                  flt.s        a2, fa5, ft10
                  slti         s1, t1, 545
                  fdiv.s       fa0, fs0, fa6
                  addi         s7, s7, 1846
                  or           zero, s6, s4
                  auipc        t4, 545874
                  fsgnjx.s     ft0, fs10, fs0
                  andi         sp, gp, 1186
                  sltiu        s9, a5, -1679
                  sltu         s3, a5, ra
                  fadd.s       fs3, ft10, fs10
                  xor          gp, s2, s3
                  feq.s        a4, ft11, fa6
                  lui          sp, 922929
                  sltiu        a2, s6, 1567
                  fsgnjn.s     ft1, fs11, fs4
                  addi         ra, t2, 153
                  feq.s        a6, fs2, fa1
                  andi         a3, s7, 586
                  sltu         s10, t1, tp
                  srl          a2, t5, ra
                  feq.s        s1, fa1, ft5
                  mulh         s5, t1, t4
                  sra          ra, a3, a1
                  mulhu        t4, s8, s7
                  fsgnj.s      fs3, fs7, fs4
                  srli         t2, t4, 19
                  mul          ra, ra, s5
                  fsub.s       ft4, fs1, fs8
                  sll          t6, a2, s10
                  fmin.s       fs10, ft3, ft0
                  sll          s7, s11, t3
                  nop
                  srl          a3, a6, s1
                  lui          a5, 127101
                  add          s3, s0, t3
                  addi         tp, s4, 350
                  fadd.s       ft0, ft5, fa0, rup
                  add          s10, s4, zero
                  sra          gp, s8, t1
                  fcvt.wu.s    s4, fs7, rne
                  fsub.s       ft10, fa6, fs0
                  and          t4, t1, a3
                  fmul.s       fs7, fs1, ft8
                  fle.s        a7, fs11, ft3
                  rem          a5, t0, s10
                  feq.s        a2, fa5, fa6
                  fmv.w.x      ft8, t0
                  fsub.s       ft3, fa6, ft7
                  fsgnj.s      fs0, ft8, ft0
                  sra          s0, s1, s8
                  slli         s9, s5, 25
                  fadd.s       fs9, fa2, fa7
                  flt.s        tp, ft9, ft2
                  ori          s5, s5, -1434
                  lui          gp, 85731
                  feq.s        a2, ft4, fs8
                  fcvt.s.w     fs8, s7
                  fmin.s       fa2, fa6, fs6
                  add          t6, gp, s5
                  div          t3, a7, t1
                  mulhu        s2, tp, t5
                  flt.s        a0, ft8, ft8
                  and          s0, s4, a2
                  lui          s5, 31238
                  fdiv.s       fs7, fs2, fs11, rup
                  slli         s10, t4, 15
                  fcvt.wu.s    s4, ft1, rtz
                  remu         s5, ra, t5
                  div          s9, a0, gp
                  fsqrt.s      fa1, fs2
                  fmv.w.x      fs2, ra
                  mul          gp, s5, a0
                  mulhsu       sp, s7, t5
                  auipc        s0, 18693
                  fcvt.s.wu    ft1, s0
                  sll          sp, s9, s4
                  slti         t6, t1, -1873
                  sub          a1, a5, t1
                  lui          zero, 1033248
                  add          t4, s10, s0
                  sra          s6, s9, s2
                  fmin.s       fs4, fa4, fa1
                  mulhu        s5, a2, s5
                  fsgnjn.s     fs6, fs6, ft9
                  srai         s10, s10, 22
                  divu         s3, a4, ra
                  fcvt.s.w     fs7, t1, rmm
                  fcvt.s.wu    fs2, tp, rdn
                  fle.s        a0, ft11, fs6
                  add          a2, t6, t3
                  fclass.s     tp, fa6
                  fsgnjn.s     fa7, fs7, ft2
                  srl          a5, t2, a0
                  fmul.s       fs9, fs4, fs1
                  fsgnjx.s     ft6, fs0, ft8
                  mulhu        s10, s1, s4
                  srl          a5, zero, gp
                  and          a6, t6, gp
                  mulhu        s6, s5, t2
                  nop
                  fdiv.s       ft9, fa2, fa5
                  fmv.w.x      fs5, gp
                  sll          s6, t3, t2
                  mulhu        a5, s1, gp
                  fcvt.s.wu    ft7, s2, rne
                  srl          t4, s3, a4
                  div          s8, t6, t4
                  mulhsu       a4, t3, t2
                  auipc        s0, 417665
                  fsgnj.s      fa6, fa1, fs7
                  divu         s9, t6, a6
                  or           sp, gp, s11
                  rem          gp, s0, a7
                  fle.s        t3, ft11, fs5
                  fsgnj.s      ft3, fs11, fa4
                  srai         s9, s1, 12
                  sra          s6, s7, s6
                  fcvt.wu.s    s11, fa2, rdn
                  flt.s        s10, fs9, ft2
                  ori          a0, a1, 1373
                  lui          s0, 459536
                  ori          a0, ra, 370
                  fclass.s     s5, fa4
                  ori          ra, tp, -932
                  nop
                  fsub.s       fs6, fs8, ft5, rne
                  mulhu        a4, s7, a1
                  slti         t2, zero, 1948
                  rem          t3, a4, s1
                  fadd.s       ft10, ft11, fa6
                  slt          s8, a1, s10
                  fadd.s       fs3, ft5, fs10, rup
                  sra          s8, s1, t4
                  srli         s1, s6, 8
                  mulh         ra, sp, s1
                  fcvt.s.w     fs0, a4, rdn
                  fsgnjx.s     fa4, fa6, ft1
                  fsub.s       fs7, fs11, fs8, rmm
                  slti         s10, ra, 1869
                  feq.s        a2, ft7, fs2
                  srli         s1, a4, 9
                  fmv.w.x      fs2, s0
                  fadd.s       fs1, fs2, ft5
                  lui          a6, 470140
                  and          s8, a2, s7
                  fsub.s       fs9, fs9, fa1
                  rem          t3, t0, a0
                  sltu         s3, s10, t6
                  fadd.s       fs8, ft11, ft3
                  fle.s        t2, ft11, fa4
                  div          t4, sp, sp
                  or           zero, t1, sp
                  fcvt.wu.s    s8, ft9, rne
                  xor          s10, a3, a1
                  slt          s10, a4, t3
                  xori         a0, t0, -1313
                  sltiu        s7, ra, 1348
                  fadd.s       ft0, ft8, ft0, rmm
                  fclass.s     s2, fa4
                  fcvt.wu.s    a0, fa3, rdn
                  srli         tp, a0, 6
                  addi         s1, a3, 1786
                  and          gp, s5, t4
                  sub          a6, s0, t6
                  fcvt.wu.s    t2, ft7
                  and          s0, a4, ra
                  div          s9, gp, s6
                  mulhu        ra, zero, s3
                  fsub.s       ft6, fs5, ft7, rne
                  fsqrt.s      fs8, fa2
                  fsgnjn.s     fs8, ft9, ft10
                  addi         zero, gp, -63
                  mulhu        s7, s0, s5
                  lui          s1, 466644
                  nop
                  slli         s8, t6, 18
                  fadd.s       ft0, fa6, fa4, rne
                  fmv.x.w      t4, ft9
                  fsgnj.s      ft11, fs3, ft9
                  fmin.s       fa5, fs4, ft8
                  fcvt.s.w     ft4, s9, rup
                  and          s6, a2, s4
                  or           sp, s6, a0
                  fsub.s       fa7, fa1, fs0, rup
                  srl          s2, t1, s6
                  flt.s        s4, ft9, fs2
                  fmul.s       fs11, fs9, ft5
                  divu         a7, t6, t1
                  fmin.s       fs11, fs2, fs3
                  fmv.w.x      ft6, t6
                  fmul.s       ft3, fa2, ft0, rup
                  fmv.w.x      fs3, sp
                  fsub.s       ft7, fa6, fa2
                  and          a6, t4, a1
                  add          s0, s6, s4
                  fmv.w.x      fs4, s3
                  andi         t6, gp, 1632
                  mul          s7, a3, a0
                  fmin.s       fs9, fa6, fs7
                  mul          a2, a1, s7
                  fmv.x.w      a6, fa7
                  fmv.w.x      ft6, gp
                  fclass.s     s7, fs10
                  xori         s10, a4, -402
                  mulh         a5, ra, t4
                  fsqrt.s      fa2, fs11
                  feq.s        tp, ft8, ft6
                  nop
                  fmax.s       fs3, ft7, fs8
                  fle.s        a2, fs5, ft3
                  fcvt.wu.s    a7, fs3, rtz
                  flt.s        ra, fa4, ft4
                  mulhsu       t3, t5, a4
                  mulhu        a2, t5, s11
                  fmv.x.w      s5, ft0
                  fmin.s       fa3, fs8, fs11
                  sub          s4, s1, t2
                  sltiu        gp, sp, 486
                  mulhsu       a1, ra, s6
                  fmv.x.w      s6, fa7
                  fmul.s       fa5, fs11, fs2, rtz
                  fsqrt.s      fs7, ft7
                  fmin.s       fa7, fa5, ft11
                  divu         a2, a6, t6
                  srli         s6, zero, 13
                  lui          a3, 537957
                  fsqrt.s      ft4, ft10, rtz
                  or           s1, t5, s8
                  andi         sp, t1, -312
                  auipc        a5, 917304
                  and          s3, s4, t6
                  fdiv.s       fa0, ft11, fs0, rdn
                  fclass.s     s11, ft2
                  xori         s8, t2, -1848
                  fadd.s       fa7, fs0, ft1
                  divu         zero, s4, s5
                  andi         s11, a4, 1530
                  feq.s        s8, fa0, ft2
                  slt          t3, t1, sp
                  rem          sp, s10, t0
                  fdiv.s       fa5, fa4, fs11, rup
                  addi         s1, a4, -960
                  fmv.w.x      fs1, t3
                  div          ra, t4, a7
                  srl          a7, zero, a1
                  div          s7, t5, s1
                  slti         s9, t6, -1552
                  rem          ra, sp, s1
                  xori         s8, t2, 1101
                  srli         t2, ra, 16
                  fdiv.s       fs2, fa0, ft1
                  fle.s        gp, fa2, fa3
                  fmin.s       fs10, fa7, fs7
                  rem          t4, a4, s5
                  fsqrt.s      fa5, ft9, rtz
                  fmin.s       fa1, fa6, ft8
                  feq.s        a6, fa3, fs4
                  mulhsu       s6, s6, a4
                  div          a2, a3, s0
                  fadd.s       fa4, fs6, ft10, rmm
                  fadd.s       ft10, ft1, fs0
                  fcvt.w.s     a1, fa3, rmm
                  fcvt.s.w     fs6, t3
                  slt          tp, gp, s1
                  nop
                  fmul.s       fs11, fs0, fs4
                  srli         s2, s11, 22
                  fmin.s       ft11, ft1, ft10
                  fcvt.s.w     ft0, gp, rmm
                  divu         s6, s9, t2
                  fle.s        s3, fs2, fa5
                  fmin.s       fs8, ft8, ft6
                  andi         s8, t5, 230
                  sra          s10, a6, s11
                  flt.s        a0, ft0, ft3
                  div          s9, s9, a1
                  fmv.w.x      ft0, s6
                  srai         s0, s4, 2
                  lui          t2, 624231
                  fsgnj.s      ft2, ft0, fs1
                  slli         a0, s0, 11
                  lui          t3, 341714
                  fcvt.wu.s    zero, fs4
                  xori         a3, gp, 318
                  feq.s        s5, fa0, ft11
                  divu         a4, t5, a7
                  ori          tp, tp, -1872
                  auipc        a5, 625718
                  sltu         s8, a3, s7
                  fcvt.s.wu    fa0, tp
                  auipc        s11, 632000
                  divu         s2, s4, s5
                  fsqrt.s      ft8, fs10
                  srl          ra, s4, a5
                  sll          a4, a0, a0
                  fcvt.s.w     fs3, s11, rne
                  slli         t4, a0, 5
                  div          s10, s2, t6
                  sra          t6, s11, t4
                  srl          s6, s5, s10
                  fcvt.s.wu    fs9, zero, rmm
                  div          s1, s6, s2
                  fcvt.w.s     s0, ft1
                  mul          s8, a2, ra
                  fdiv.s       fa6, fa5, fs6
                  srai         tp, a1, 11
                  fcvt.s.wu    ft0, t5
                  divu         gp, s8, s9
                  xor          a6, a3, a7
                  fmin.s       fs7, fs10, fs4
                  mulhsu       a1, ra, s0
                  sltiu        s5, t1, 1505
                  slti         sp, t6, -983
                  and          s10, s5, t5
                  flt.s        gp, fs4, fs4
                  fsub.s       fa2, fa6, fa3
                  rem          a4, t0, tp
                  fcvt.s.wu    fs5, s11
                  fcvt.wu.s    s6, fs8
                  mulhsu       tp, s3, t3
                  addi         s9, a0, 1610
                  sltiu        ra, a4, 663
                  rem          s0, s9, t3
                  andi         t2, s4, 127
                  fdiv.s       fa0, fs0, ft0, rne
                  srli         s2, t5, 23
                  sra          sp, a6, s1
                  fclass.s     s3, ft2
                  andi         s3, s8, -1622
                  fmv.w.x      fs4, s1
                  sra          s10, s4, s11
                  nop
                  auipc        s9, 591463
                  mulhu        a5, s10, a7
                  div          a3, t2, s4
                  fclass.s     s0, fa5
                  slt          ra, s2, s7
                  ori          t6, ra, 878
                  div          s11, a0, s7
                  fadd.s       fs5, fa6, fs0
                  fcvt.s.wu    fa7, a7, rmm
                  rem          s10, s3, a0
                  fcvt.s.wu    fs10, t1
                  fsgnjx.s     fa4, fa3, fs5
                  remu         a4, s0, s9
                  fsub.s       ft1, ft11, fs6
                  fsgnj.s      fa3, ft10, ft10
                  flt.s        s8, ft2, ft5
                  rem          a0, s4, sp
                  mulh         s7, a6, s11
                  divu         t4, s11, s6
                  sll          t3, gp, t0
                  fsgnj.s      ft8, fs3, fa1
                  mulhsu       t3, t4, s7
                  mulh         tp, s5, s2
                  fdiv.s       fs8, ft0, fs1
                  feq.s        s6, fs1, ft9
                  slti         s7, s2, -1169
                  slt          a1, t2, s3
                  sub          zero, s0, s6
                  divu         t2, sp, t0
                  mul          s5, s4, t2
                  fsgnj.s      ft4, ft1, fa5
                  lui          zero, 498050
                  srai         s1, s5, 17
                  and          ra, tp, s10
                  fcvt.s.wu    fs9, s7, rtz
                  fcvt.s.wu    ft3, ra, rne
                  fmin.s       ft9, fs10, fa2
                  addi         s3, a6, 141
                  srli         s4, t0, 8
                  fmv.x.w      a7, fs11
                  lui          t3, 34533
                  fmin.s       ft8, fa7, fs9
                  auipc        t4, 271383
                  rem          a6, gp, t6
                  rem          a2, a0, s7
                  and          t4, a0, t5
                  flt.s        s5, ft8, fa6
                  div          s0, s3, t1
                  fadd.s       ft7, ft11, ft2
                  or           s6, s0, a0
                  flt.s        a5, fs3, ft11
                  srai         a4, s1, 31
                  nop
                  fsgnjn.s     fs6, fa7, fa3
                  addi         s4, t0, -1997
                  fsqrt.s      fa6, fs7
                  xor          a6, t1, a0
                  or           s5, t6, sp
                  mul          t6, a4, gp
                  sltiu        s6, s7, -184
                  addi         t2, t4, -1470
                  fdiv.s       ft8, fs4, fa0, rmm
                  fcvt.wu.s    s3, fa2, rdn
                  srl          a2, a7, a4
                  sltiu        t4, a1, 567
                  fadd.s       ft3, ft6, fs11, rmm
                  xori         a1, ra, 661
                  sltu         a6, a1, zero
                  fsub.s       fa5, fa4, ft7, rne
                  xor          s11, t6, t0
                  flt.s        zero, fs3, ft3
                  andi         t3, a4, -1623
                  add          a0, ra, gp
                  fdiv.s       ft5, fa6, ft4
                  fsqrt.s      fs6, fs9
                  sll          t3, a7, zero
                  nop
                  fmv.w.x      fs9, t3
                  slti         a0, t5, -1568
                  fcvt.s.wu    fs0, s8, rdn
                  fadd.s       fa6, fa6, ft4
                  and          ra, tp, s2
                  mulhsu       s8, s4, s9
                  fmv.x.w      s10, ft8
                  fmul.s       fs0, fa1, fs11, rne
                  xori         s8, s3, 360
                  slti         sp, s6, -1611
                  feq.s        s9, fs2, fs4
                  xori         s10, t3, -654
                  add          a0, s0, t5
                  mulhsu       s10, s5, s9
                  slt          gp, s5, s9
                  fcvt.s.w     fs3, s7
                  srai         s1, a5, 22
                  mulh         gp, s2, ra
                  fsgnjx.s     ft11, fa1, ft8
                  andi         a1, a6, 1550
                  fcvt.w.s     a7, fa0
                  srli         a2, a0, 10
                  lui          zero, 1032551
                  sra          s6, s8, t4
                  fsub.s       fa2, fa3, ft0
                  fmul.s       ft7, ft9, ft5, rmm
                  fsqrt.s      fs2, fa0
                  remu         s0, a6, s5
                  sltiu        sp, s8, 947
                  xor          a1, zero, t4
                  rem          s4, s3, a3
                  nop
                  slli         ra, s8, 11
                  div          ra, t6, a2
                  fmv.x.w      s0, fs4
                  fsub.s       ft1, ft2, ft10, rdn
                  fclass.s     t2, fa4
                  fdiv.s       fs9, fs11, fa4, rmm
                  fmul.s       fs8, fs3, ft0
                  fcvt.w.s     a0, fs10
                  fmv.x.w      s0, ft6
                  fdiv.s       fa3, fa4, fs2, rmm
                  fmax.s       fa3, fs3, ft9
                  and          gp, a0, a0
                  fsgnjn.s     ft7, fa1, ft7
                  xor          a3, s5, t3
                  remu         a1, t1, t1
                  fmv.w.x      ft8, t1
                  remu         a2, a3, a3
                  xor          s0, s11, gp
                  slt          s10, t2, a6
                  fmin.s       ft8, fs3, ft2
                  srl          gp, tp, zero
                  srl          s11, a7, a2
                  rem          s0, s0, s1
                  sltu         a3, tp, s6
                  mulhsu       s0, t6, t4
                  add          a7, sp, s11
                  xor          a0, a5, s4
                  xor          a5, a3, s2
                  fsqrt.s      fs0, ft1
                  or           s1, a3, t2
                  mulh         t4, s4, t3
                  mul          s1, a0, s11
                  xor          a6, t1, ra
                  lui          a5, 715463
                  sub          sp, a1, zero
                  fsgnjx.s     fs3, ft4, ft5
                  fsgnjn.s     fa4, ft5, ft5
                  flt.s        t2, fa3, ft1
                  ori          a0, zero, -543
                  fcvt.s.w     ft7, ra
                  mul          tp, a6, s4
                  nop
                  fmul.s       fa1, ft2, fs10
                  addi         s10, s3, -45
                  sltiu        s6, tp, 98
                  fsqrt.s      ft3, ft3, rtz
                  xor          s10, t1, s11
                  mulhu        s10, t5, s0
                  remu         t4, t6, tp
                  fmv.w.x      fs6, s0
                  fsgnjn.s     ft10, fs7, fa6
                  andi         sp, t0, -1323
                  fdiv.s       ft9, ft7, fs1
                  addi         a3, a5, 813
                  and          a2, s10, t5
                  fsub.s       ft10, fs11, fs10
                  mul          t6, s7, s2
                  fsqrt.s      fs11, fs1, rup
                  xori         sp, s7, -741
                  nop
                  sltiu        s5, a1, 1505
                  fmin.s       ft7, fa3, ft3
                  mulh         gp, a6, sp
                  slli         a3, a5, 1
                  fsgnjn.s     fa5, fs2, fs0
                  flt.s        gp, fa6, fs7
                  sll          s4, zero, s10
                  fmul.s       ft2, fa5, fs4
                  fsgnj.s      ft3, fs0, fa7
                  fmv.x.w      gp, fs9
                  srai         t4, s10, 7
                  fmv.x.w      s4, fs6
                  and          a0, t0, a5
                  fdiv.s       fa5, fs1, fa6, rne
                  or           ra, t6, t6
                  div          s2, sp, a6
                  fcvt.wu.s    a6, ft11
                  div          a4, s0, a5
                  addi         t3, ra, 1300
                  lui          a7, 1001524
                  div          s4, s11, a5
                  fmin.s       ft2, ft6, fs1
                  fadd.s       ft7, fa3, fa0
                  srai         s1, a1, 6
                  fsgnj.s      ft6, ft1, fa1
                  fcvt.wu.s    s3, fa3, rmm
                  lui          s5, 980292
                  srli         s6, zero, 5
                  flt.s        s0, fs7, fa7
                  fmul.s       fs7, fa1, fs1, rtz
                  fmin.s       fs1, ft6, ft4
                  fsqrt.s      ft8, ft0
                  lui          a1, 886202
                  slti         s5, s3, 950
                  srli         s7, a2, 10
                  add          s2, a6, s6
                  fmv.w.x      fs4, t3
                  sra          s9, s11, tp
                  fcvt.w.s     t3, fs2, rdn
                  fdiv.s       fs1, fs7, fs11
                  srli         s11, s1, 6
                  fsgnjx.s     fs8, fs8, fs9
                  auipc        a1, 553577
                  fsgnjx.s     fs0, fs2, fa5
                  add          t2, t0, t0
                  remu         s10, s8, s0
                  slti         s8, s4, -388
                  flt.s        a6, fs1, fa6
                  mul          t3, s7, ra
                  rem          a0, s0, t6
                  fclass.s     a4, ft4
                  andi         a1, t1, 434
                  fmax.s       ft3, ft3, fs6
                  fsgnjn.s     fs4, fs5, fs5
                  sub          a3, tp, a1
                  xori         ra, sp, -782
                  andi         tp, s2, 1802
                  fle.s        a5, fs8, fa3
                  fsgnjn.s     fa2, fs0, ft9
                  rem          tp, a2, s6
                  srai         s11, a7, 26
                  andi         a2, s9, 1317
                  fcvt.w.s     t3, fa7
                  or           t2, s7, a2
                  fcvt.s.wu    fa3, t6, rne
                  mulhu        sp, t5, ra
                  fmv.x.w      tp, fs4
                  mulhsu       gp, a0, s2
                  srl          t6, tp, a1
                  fcvt.s.w     fs2, s10
                  fsgnj.s      ft6, fs0, ft3
                  fmax.s       fs7, ft8, fs0
                  sub          a5, sp, s6
                  srli         t2, s4, 17
                  divu         gp, s0, s10
                  fmv.x.w      s6, ft2
                  srli         sp, s5, 8
                  xori         t2, s0, 1552
                  sll          s0, a3, t6
                  xor          gp, s3, a5
                  fmul.s       fa1, fs8, fa6
                  div          s4, s6, zero
                  fadd.s       fs11, ft0, fs3, rmm
                  mulh         s9, t3, t1
                  srai         a7, s10, 15
                  ori          ra, s10, -1193
                  fmul.s       fs5, fs9, fa4, rdn
                  sltiu        s5, a0, 928
                  srl          t3, t6, t1
                  rem          t4, s10, t4
                  sub          s2, a5, s8
                  slli         s10, zero, 25
                  auipc        a4, 661887
                  slti         s3, s1, -973
                  fmv.x.w      s7, ft4
                  fdiv.s       fs1, fs9, fs2, rdn
                  or           s4, a6, a5
                  ori          s9, s9, -898
                  fsqrt.s      fa1, ft7, rdn
                  auipc        s0, 748059
                  lui          s4, 614301
                  xor          gp, s5, s3
                  srli         s11, a0, 26
                  fle.s        t2, fs6, fa1
                  div          s5, s3, t2
                  fcvt.s.wu    ft5, a6
                  sltu         tp, s11, s3
                  fmv.w.x      ft3, a1
                  fsgnj.s      ft7, ft8, ft6
                  add          a5, s2, t0
                  fle.s        t6, ft2, fs4
                  fdiv.s       fs10, fa5, fs2, rmm
                  ori          s9, t6, 910
                  fmin.s       ft10, fs2, fs11
                  mulhsu       a0, s11, s6
                  flt.s        t6, fs3, ft1
                  xor          t6, s11, s8
                  or           sp, a0, t3
                  fcvt.wu.s    t4, fa3
                  feq.s        a2, fs11, ft7
                  fmax.s       ft5, fa3, ft8
                  fdiv.s       fa1, fs6, fa3, rtz
                  mulhsu       s0, t0, zero
                  sub          s6, s0, s11
                  fsgnjn.s     ft1, ft2, ft8
                  fclass.s     a3, fs9
                  slli         a2, sp, 19
                  fclass.s     a6, fa5
                  mul          zero, t3, s10
                  auipc        a6, 595982
                  divu         s7, a5, a6
                  rem          s5, s1, t4
                  slli         s3, s2, 15
                  slt          zero, t4, a3
                  fclass.s     a5, fs9
                  and          s5, a2, s0
                  add          s4, t6, a4
                  fmv.x.w      s9, fa4
                  fadd.s       fa0, ft10, ft0, rne
                  slt          s8, s3, s5
                  srli         sp, a5, 9
                  fclass.s     s11, fs8
                  mulhu        s5, a1, s6
                  sra          s0, a4, t2
                  auipc        s4, 416476
                  fadd.s       ft1, ft4, fa4, rdn
                  andi         zero, s10, 1833
                  fsgnjn.s     fs3, ft6, fs9
                  fsub.s       fa1, fa6, fa2
                  xor          t4, t1, s1
                  mulh         a5, t6, s2
                  remu         s3, t1, s3
                  flt.s        t3, fa1, fa3
                  fcvt.s.w     fs10, s7
                  sltiu        a4, s8, -1329
                  fclass.s     t3, fa0
                  xor          s9, a2, s0
                  flt.s        zero, ft9, ft10
                  fdiv.s       ft4, ft4, ft4
                  fsqrt.s      ft5, fa1
                  fsgnjx.s     fs7, fa3, ft11
                  slli         a4, ra, 11
                  fsgnjx.s     ft4, ft3, ft4
                  fadd.s       fs4, fs3, ft6
                  remu         tp, a0, t6
                  nop
                  fsqrt.s      ft3, ft2, rdn
                  fsqrt.s      ft8, ft7
                  sra          a2, t3, s4
                  fclass.s     t4, fa7
                  mulh         a6, s2, s1
                  nop
                  fle.s        ra, ft10, fs6
                  fsqrt.s      fs1, fa7, rup
                  fcvt.wu.s    s10, fa4, rne
                  flt.s        sp, fa7, fs6
                  or           sp, s5, s2
                  fle.s        s7, fa3, fs7
                  fsgnjn.s     ft2, fa3, fs11
                  fsgnjx.s     fs9, ft4, ft7
                  fadd.s       fs10, fs9, fa3, rdn
                  divu         s4, s9, s4
                  slti         tp, a0, -1368
                  nop
                  slti         t3, t1, -1135
                  fsub.s       fa7, ft6, ft5, rtz
                  mul          a5, s7, a6
                  slt          zero, tp, s11
                  sltiu        gp, tp, 265
                  fsgnjn.s     ft6, fa7, ft11
                  srai         s7, s5, 2
                  rem          a0, s0, t6
                  addi         a5, zero, 1073
                  fsgnjx.s     fa6, fs0, fa1
                  lui          t6, 139097
                  srl          a4, t5, t0
                  fsgnj.s      ft2, ft4, fa0
                  fsqrt.s      fs9, ft8
                  remu         a6, s0, s2
                  remu         a1, t0, a2
                  xor          s2, t6, tp
                  feq.s        s0, ft11, ft2
                  or           a5, zero, a4
                  fmax.s       ft8, fs5, ft3
                  flt.s        a7, fs2, fa5
                  mulh         s10, t2, s2
                  fcvt.s.w     fs5, t6
                  nop
                  fcvt.s.wu    fa0, s6, rup
                  fsgnjn.s     fs7, ft8, fs0
                  fmul.s       fa1, fs0, fs3
                  fdiv.s       ft9, fs8, ft10
                  remu         s7, ra, a1
                  fsgnjx.s     fs10, ft4, fs2
                  addi         ra, t5, 1662
                  fmul.s       ft0, fs10, ft8
                  div          a4, s0, a3
                  fclass.s     t2, fa5
                  fle.s        ra, fs2, ft9
                  auipc        s3, 322659
                  fle.s        a0, fa7, fs5
                  ori          a0, a3, -1414
                  addi         s7, s3, 220
                  fsgnjn.s     fs7, fs0, ft4
                  remu         a1, t6, a5
                  mul          s9, a4, a1
                  srai         gp, sp, 3
                  addi         s7, a0, -876
                  fsgnjx.s     ft2, fa1, fs5
                  nop
                  fcvt.wu.s    s11, ft7, rmm
                  fmin.s       ft2, fs3, fa0
                  sub          a6, s1, a5
                  auipc        s2, 890623
                  ori          tp, s9, 1157
                  sra          s11, s11, s8
                  or           t2, a3, a1
                  mulhu        t3, s2, s5
                  fle.s        a4, fs11, ft5
                  auipc        s8, 953302
                  and          s2, s11, t5
                  remu         a4, s1, s6
                  and          a5, s2, s3
                  slt          s5, a4, a0
                  nop
                  flt.s        s9, fa6, ft4
                  or           ra, a3, s5
                  fdiv.s       fs1, fa7, fa2
                  slt          s1, s6, t0
                  rem          s9, s9, s0
                  nop
                  srli         s6, s11, 5
                  fle.s        s3, ft5, fa0
                  andi         s3, a3, -1054
                  fsgnjn.s     fs2, fs6, ft4
                  sra          a1, a6, t1
                  andi         t3, s9, 856
                  fsgnjx.s     ft2, ft7, ft3
                  nop
                  xori         a6, s3, 1130
                  fsgnjx.s     fs0, ft9, ft3
                  fdiv.s       fa6, ft5, fs11, rmm
                  slti         a7, t3, -550
                  fmul.s       fs10, fa6, ft5
                  lui          s4, 931429
                  mulhu        a4, tp, a6
                  sltiu        s1, ra, -449
                  fcvt.w.s     a0, fs6
                  lui          s8, 446110
                  flt.s        t3, ft1, fs0
                  xori         t2, t3, 211
                  srli         t6, a6, 21
                  sra          gp, s8, t5
                  fclass.s     s0, ft3
                  fmin.s       ft6, fa2, ft6
                  fcvt.s.wu    fs9, s11
                  fsgnjx.s     fa6, ft6, fa7
                  fadd.s       fs6, ft10, fs5, rtz
                  fclass.s     zero, ft0
                  and          s11, ra, t6
                  fmul.s       fs9, fs10, fa6, rtz
                  sra          s6, t0, s4
                  sltiu        sp, a4, 1396
                  mulh         t4, t0, a7
                  sll          t3, s2, s6
                  divu         t4, a5, s4
                  fclass.s     sp, fa3
                  rem          s2, s9, a6
                  or           s1, t0, gp
                  and          s11, s10, tp
                  slli         a3, ra, 15
                  add          s3, s1, s2
                  slti         t3, t6, 372
                  fsgnjn.s     ft4, fa3, fs4
                  mulhu        t6, s1, s5
                  fsgnj.s      fs11, fa1, fs10
                  mul          s3, t3, s8
                  fcvt.s.wu    fs6, t3
                  fmin.s       fa7, ft2, ft7
                  xor          s0, ra, a2
                  flt.s        t4, ft0, fs1
                  fclass.s     s11, fs0
                  remu         s8, s0, a1
                  add          gp, s3, a2
                  fsqrt.s      ft4, fs5, rdn
                  mul          s11, tp, s6
                  or           sp, tp, s7
                  and          a7, a6, t5
                  feq.s        s4, fa1, fa2
                  fcvt.s.w     ft2, a2
                  sltiu        a6, s8, -41
                  fclass.s     s8, ft7
                  slli         sp, t4, 13
                  srai         a0, s4, 16
                  remu         t3, s4, sp
                  auipc        a3, 675168
                  nop
                  fclass.s     s5, fs1
                  mulhsu       s11, t1, t3
                  slti         t3, s6, -642
                  fmul.s       fa4, ft7, fa4
                  fmul.s       ft6, fs7, fa5, rne
                  srl          a7, s8, a3
                  fle.s        s6, fs11, fa7
                  slli         ra, s10, 3
                  fcvt.s.w     fs11, t2
                  srl          s1, a2, t1
                  srl          ra, s7, s0
                  fsqrt.s      fs4, fa3, rtz
                  mulhu        s0, s7, a0
                  xori         s3, t1, 654
                  fsub.s       fa3, fs10, fs11
                  fsgnjx.s     fs7, fs3, fa0
                  fclass.s     s9, fs9
                  srl          t4, a6, s11
                  div          a6, s3, t4
                  sra          t6, s6, t1
                  andi         t6, a0, 1532
                  sub          s7, a7, t4
                  rem          tp, s5, s7
                  fmul.s       ft3, fs5, ft5
                  lui          s11, 815960
                  mul          s5, a1, a6
                  remu         a5, t1, t4
                  fdiv.s       ft9, ft2, fs6, rup
                  slt          ra, t2, s2
                  div          s7, a3, a7
                  remu         s9, t2, s3
                  flt.s        a6, fa4, ft10
                  add          sp, a4, s5
                  fmul.s       ft6, fs10, ft9
                  sltiu        a6, a5, -461
                  slt          s6, t5, s1
                  fmin.s       fa2, fs8, fa7
                  feq.s        s5, fa0, fa2
                  xor          a3, s7, s11
                  lui          tp, 975052
                  flt.s        a2, fs0, fs1
                  feq.s        s0, ft9, fs3
                  fcvt.w.s     a7, ft1
                  add          s3, t1, sp
                  fclass.s     s3, ft1
                  fmul.s       fa1, fa3, ft2
                  feq.s        s5, fs1, fs0
                  divu         s9, ra, s7
                  fsgnj.s      ft8, fs4, ft1
                  fsqrt.s      ft11, ft7
                  mulh         s2, s5, s9
                  fsub.s       ft3, fs11, fs2, rne
                  auipc        a6, 319278
                  divu         s10, ra, s3
                  fadd.s       fs9, fs0, fs5, rdn
                  nop
                  sltu         a2, a5, t0
                  sltu         s8, a3, a3
                  srai         s4, s8, 7
                  sltiu        s7, a7, -54
                  srai         s7, a7, 11
                  fsub.s       fa5, ft9, fs9
                  flt.s        t6, fs7, fs11
                  srl          s9, gp, zero
                  sll          ra, s5, s4
                  fclass.s     s2, ft8
                  mulhsu       t4, s2, s2
                  fclass.s     s3, fa5
                  and          s7, gp, s10
                  fmin.s       fs7, ft4, ft11
                  flt.s        ra, ft4, fa4
                  andi         s1, s8, 1202
                  fcvt.w.s     a5, ft10, rtz
                  auipc        s3, 912026
                  fclass.s     a4, ft5
                  slli         s6, a2, 30
                  mulh         tp, s7, s0
                  sub          a5, s8, t0
                  nop
                  fsgnj.s      fa5, ft2, fa4
                  div          s0, s6, ra
                  fle.s        zero, ft9, fs9
                  or           s9, s2, s7
                  rem          a6, a4, ra
                  fcvt.wu.s    s8, fa4
                  xor          t3, a0, zero
                  rem          sp, t3, gp
                  fadd.s       ft7, ft6, ft5
                  xori         s11, a3, -1706
                  fmv.w.x      ft10, s4
                  addi         s9, t2, 804
                  xori         a7, tp, -1234
                  mul          a2, s10, tp
                  feq.s        t4, ft10, ft8
                  xor          s9, s6, t1
                  andi         a6, s9, -204
                  fmin.s       fs4, ft2, fs1
                  fsgnjx.s     ft2, fa6, ft11
                  sra          s11, sp, tp
                  srli         zero, t4, 24
                  fsgnjx.s     ft10, ft2, fa3
                  lui          s1, 740941
                  fsgnjn.s     ft11, ft9, fa2
                  fcvt.w.s     s4, ft11, rup
                  or           s7, a2, s8
                  ori          a5, t2, -795
                  fcvt.s.wu    fa7, s11
                  fadd.s       fs3, fa7, fa4, rup
                  mul          a2, t6, sp
                  fsgnjx.s     fa0, fa5, ft5
                  fsqrt.s      ft3, fs1, rtz
                  srli         sp, tp, 9
                  fsgnj.s      fa7, fs11, fa7
                  or           t2, s2, s9
                  fmv.x.w      zero, fs5
                  mulhsu       s1, t6, sp
                  srl          s3, s7, s11
                  fmax.s       fa7, fs4, ft10
                  xori         sp, s5, 1161
                  fclass.s     s4, fs8
                  lui          s0, 547785
                  mulhu        t2, t1, ra
                  sra          s9, tp, t3
                  sltiu        s6, s2, 943
                  mulhsu       s5, s11, s4
                  fsub.s       ft9, fa1, ft6, rmm
                  sra          a4, s9, t1
                  fmv.w.x      fs3, s3
                  nop
                  fsub.s       fa3, fs11, ft10
                  fsqrt.s      fa3, fs7
                  rem          a0, zero, sp
                  fclass.s     t3, fa1
                  fle.s        zero, fs6, fs7
                  fsgnj.s      fa3, ft2, fs3
                  lui          zero, 934117
                  slt          s0, a6, t5
                  fcvt.s.w     ft11, t0
                  div          t4, a6, t0
                  divu         s6, s2, s3
                  sub          s11, t0, a5
                  srl          t6, t1, a1
                  sltiu        s11, s10, -1543
                  rem          sp, t6, t4
                  fmul.s       ft7, fs11, ft11
                  fcvt.w.s     s2, fs2
                  xor          s8, ra, s3
                  rem          s7, s1, gp
                  nop
                  fmax.s       fs9, fs7, fs8
                  slti         a0, t4, -124
                  fsgnjx.s     fs7, fa2, fa1
                  fmv.x.w      a3, fs3
                  fmax.s       fs10, fs8, fa4
                  sll          ra, s5, s7
                  feq.s        s8, ft4, fs0
                  srai         a2, t2, 3
                  add          zero, t4, t4
                  srli         s7, s9, 27
                  xor          a7, a2, s6
                  fcvt.s.wu    ft2, s10
                  auipc        t6, 165149
                  xor          s0, sp, sp
                  fsgnjn.s     ft4, fs4, fa5
                  mulhsu       s5, a1, tp
                  fsqrt.s      fs10, fs6
                  feq.s        sp, fa2, fs4
                  auipc        a6, 748492
                  lui          s9, 560451
                  and          s4, s9, s4
                  fcvt.w.s     t2, fa7
                  flt.s        s1, fa2, ft9
                  remu         s1, a2, s11
                  lui          s11, 119587
                  auipc        s4, 985921
                  fclass.s     zero, ft1
                  divu         sp, tp, t3
                  fsgnj.s      fa4, fa7, fs3
                  fcvt.s.wu    ft10, s10
                  fmin.s       fa0, ft3, fs8
                  srli         s8, tp, 25
                  fsub.s       fs1, fs4, fs11, rup
                  lui          s8, 124368
                  fsgnjx.s     fs2, ft10, fs8
                  remu         s4, sp, s1
                  fmul.s       ft10, fs4, ft7, rup
                  add          a3, s7, a2
                  fsgnjn.s     fa3, ft8, fs10
                  sltu         ra, t4, s4
                  mulh         a0, zero, gp
                  nop
                  mulh         s1, s1, a4
                  fmul.s       ft10, fa2, ft2
                  addi         a5, s4, 1765
                  fmv.w.x      fs7, s3
                  srl          tp, t0, a1
                  fcvt.w.s     sp, ft7
                  fmin.s       fs4, fa0, ft11
                  remu         t4, a0, ra
                  mulhu        zero, t1, t6
                  mulhu        tp, s2, s11
                  fsqrt.s      ft8, fa2, rtz
                  sltiu        a6, t4, 226
                  fadd.s       fa0, fs4, ft10
                  fmv.x.w      t2, ft10
                  fsqrt.s      fs8, fa3
                  rem          s8, a6, gp
                  xor          a3, zero, t2
                  fmin.s       fs3, ft9, ft10
                  divu         a4, a5, sp
                  sltiu        s7, a3, -1990
                  fclass.s     s9, ft8
                  fcvt.s.w     ft0, s3
                  rem          a0, s5, t4
                  fmin.s       fa6, fs10, fa1
                  sll          a2, s8, t0
                  addi         s8, s10, -72
                  fcvt.wu.s    a6, ft10, rtz
                  fsqrt.s      fs8, ft4
                  fdiv.s       ft9, ft8, fa0, rmm
                  remu         a0, s8, t2
                  srli         s0, sp, 5
                  fsgnjn.s     fa5, fa3, fa7
                  fcvt.s.w     ft3, t4
                  add          a6, s10, s10
                  sltiu        tp, s6, -1722
                  or           s10, gp, a4
                  fclass.s     a7, ft10
                  nop
                  sub          tp, s8, t2
                  fcvt.s.w     fa3, t3, rne
                  fdiv.s       fs4, ft7, fs8
                  fsgnj.s      ft6, fs1, fs0
                  andi         tp, t4, 200
                  fsgnjx.s     fs3, fa7, fa6
                  xori         a3, s5, 1159
                  fsub.s       fa7, fs11, ft8, rup
                  fmin.s       fs3, ft11, fa5
                  fmv.w.x      fs10, s3
                  fsqrt.s      fs8, ft9
                  fsgnj.s      ft7, ft10, ft2
                  lui          s6, 930364
                  mulh         s4, t2, a2
                  fdiv.s       fa6, fs1, ft3
                  srli         s6, a6, 25
                  srl          t3, s1, t2
                  fsgnjx.s     fa4, ft3, fs0
                  and          s4, s0, a0
                  nop
                  divu         tp, t0, a3
                  fadd.s       ft5, ft7, fs7, rdn
                  fsgnjx.s     ft11, fa6, fa6
                  ori          s6, s2, 628
                  sll          ra, a7, s3
                  srli         s11, t0, 15
                  feq.s        s1, fs8, fs11
                  fcvt.s.wu    fa5, s1
                  srl          a5, gp, a5
                  rem          a7, ra, t2
                  remu         s7, s10, s5
                  srl          s11, t1, t5
                  srai         s0, s0, 22
                  sub          s5, t5, a7
                  fmax.s       fa7, fa4, fs6
                  fcvt.w.s     t2, fs4
                  add          s5, t1, gp
                  sltu         s7, s2, s4
                  rem          a1, t6, t5
                  sub          t3, s7, t0
                  or           sp, s5, zero
                  sll          a7, s3, t4
                  fcvt.s.w     fs2, s3
                  fcvt.w.s     a6, fs3
                  ori          a3, a7, -1149
                  and          s0, a4, t6
                  srai         s1, s2, 3
                  fmul.s       ft2, ft8, ft6
                  flt.s        s5, fs3, fs10
                  sltu         s1, a2, s9
                  fmax.s       ft7, fa0, fs11
                  mulhu        t4, ra, a3
                  fmv.w.x      ft9, a3
                  or           sp, t2, t3
                  fmax.s       ft1, fs5, ft5
                  or           s8, a5, a7
                  srai         s0, s7, 21
                  mulh         a4, tp, s4
                  andi         t3, t0, 1642
                  fclass.s     a4, fa1
                  fsgnjx.s     fa0, ft10, fa6
                  xori         a5, s8, 836
                  andi         s0, t6, -1243
                  remu         a3, a3, ra
                  sra          s3, s0, sp
                  fsgnj.s      ft2, fs10, fa0
                  div          t6, s6, a7
                  and          s11, t1, t6
                  fsgnj.s      fa6, fa1, ft5
                  sll          s7, t2, s10
                  fadd.s       fs1, fs11, ft7
                  andi         s9, s4, 1605
                  and          s3, s1, t6
                  fmv.w.x      fa1, s1
                  srai         a5, a6, 26
                  srai         s11, a7, 15
                  lui          s3, 793171
                  mul          s0, gp, a2
                  fcvt.s.wu    ft2, zero, rup
                  divu         t3, a4, zero
                  fcvt.w.s     s3, ft6
                  fcvt.s.wu    ft5, t0, rne
                  mul          a2, t2, s10
                  mulhsu       s4, s6, s3
                  fmul.s       ft7, ft9, fs1
                  nop
                  addi         s9, s7, -187
                  srai         a7, s2, 5
                  feq.s        s2, fs2, fa0
                  flt.s        t6, fa5, fs11
                  srai         s0, t0, 21
                  and          t2, a7, t0
                  mulhu        s8, tp, a2
                  xor          t2, a6, ra
                  mulhsu       s3, s8, a0
                  add          a3, gp, t2
                  fdiv.s       fs3, ft8, ft7
                  remu         a5, s6, a0
                  fsqrt.s      fs2, fs3, rne
                  fsqrt.s      ft11, fs7
                  div          a4, tp, t3
                  fsgnjn.s     fs10, ft10, fs8
                  fmul.s       fs1, fs6, fs1
                  fmax.s       fa0, fs1, fs8
                  add          s1, s6, s11
                  srl          t4, tp, t5
                  fmax.s       fs4, fs4, fs8
                  fcvt.wu.s    s10, ft5
                  fle.s        t4, fa6, fs2
                  mulh         s6, a2, a7
                  mulhu        s8, a1, t4
                  fmin.s       ft9, ft3, fs6
                  ori          s0, tp, -1720
                  xori         ra, a5, -2010
                  nop
                  fcvt.s.w     ft2, a0
                  mul          a4, s4, s5
                  add          s7, a7, s0
                  rem          zero, sp, s0
                  slli         a5, s7, 22
                  or           s7, s1, a1
                  sltiu        sp, a1, -2011
                  fsgnjx.s     ft11, fs4, ft7
                  fsgnjx.s     ft11, fa7, fs1
                  fsgnjx.s     fs4, fa3, fa4
                  fsub.s       ft2, fs1, fs0
                  fmax.s       fa7, ft10, fs5
                  fcvt.s.w     ft8, t2, rtz
                  fsgnjx.s     fa6, fa7, fs11
                  fcvt.w.s     t6, fa0, rmm
                  fmax.s       fs2, ft8, fs8
                  ori          a1, a2, -847
                  sub          s11, tp, a6
                  srli         a0, t1, 16
                  xori         s4, s6, -1368
                  fsgnj.s      fs2, fs9, fs4
                  xor          a4, s1, sp
                  fle.s        a6, ft9, fs7
                  xor          s8, s8, a7
                  slti         a3, tp, -1268
                  fmax.s       fa1, ft9, ft11
                  fdiv.s       fs8, ft10, fs6, rtz
                  fsqrt.s      fa5, fs9, rup
                  andi         t2, a2, 1900
                  sltiu        s9, s11, -2000
                  div          s7, gp, a2
                  fsgnjx.s     fs9, ft6, fa0
                  fmin.s       fa1, fa0, ft8
                  fmv.x.w      t2, fs2
                  mulh         tp, t4, tp
                  fcvt.s.w     fa0, ra, rdn
                  fcvt.wu.s    s2, ft2
                  fmv.x.w      a4, fs9
                  fdiv.s       fs7, fa6, fs4, rmm
                  ori          t3, zero, 301
                  addi         gp, s2, -498
                  srli         s10, sp, 9
                  andi         a7, s1, 1795
                  fcvt.wu.s    s1, ft9, rup
                  mulh         s2, a3, s4
                  srl          tp, a7, a5
                  slli         s4, a5, 6
                  sub          s10, t6, ra
                  sub          s6, s6, a7
                  fsgnj.s      ft4, ft10, ft3
                  lui          a2, 268741
                  mul          gp, t0, t0
                  sub          a0, a1, s5
                  sra          t6, a3, s1
                  addi         s10, a4, -1852
                  fmul.s       fs6, ft1, fs10
                  fsgnj.s      fs4, ft9, ft0
                  add          s2, s4, s1
                  ori          s6, a0, -552
                  srli         ra, s5, 28
                  flt.s        s7, ft9, fa4
                  fmv.x.w      s6, fs5
                  mulhsu       a0, s7, a1
                  fsgnjn.s     fa5, ft5, ft11
                  flt.s        s0, fs7, fs8
                  fcvt.w.s     a2, fa4, rmm
                  feq.s        tp, fa2, fs10
                  fclass.s     zero, fs9
                  auipc        t6, 276536
                  srai         ra, a0, 8
                  fsqrt.s      fa4, fa0
                  or           s5, s10, a1
                  fle.s        s6, fs9, fa0
                  mul          a4, s10, t1
                  div          t2, t5, t5
                  sra          gp, t2, s1
                  fmax.s       fs1, ft0, ft9
                  rem          t2, a1, s11
                  andi         s5, sp, -784
                  fsub.s       ft9, ft7, ft4, rne
                  fmax.s       fa7, fa4, ft2
                  sll          a4, s8, tp
                  sub          a7, s11, s11
                  fmv.w.x      fs9, a2
                  addi         a2, a7, 1273
                  fcvt.wu.s    zero, fa7
                  lui          t6, 333751
                  div          s5, a3, t6
                  feq.s        s9, ft7, fs1
                  slli         a3, tp, 13
                  lui          a3, 318572
                  fsgnjn.s     ft8, fa3, ft1
                  or           s6, a1, s5
                  fcvt.w.s     sp, fs11
                  slti         a0, t1, -358
                  andi         s2, s11, -1836
                  nop
                  mulhsu       s4, a2, gp
                  fsgnj.s      fs1, fa7, fa4
                  fsgnjn.s     fa2, ft6, fa0
                  fcvt.s.w     fs0, a1
                  sltu         zero, s11, zero
                  divu         s3, t1, s3
                  and          s0, a1, s6
                  rem          ra, s2, a1
                  sra          a1, t4, s6
                  add          a0, a0, tp
                  or           s1, s9, s5
                  srli         s1, a7, 24
                  fsqrt.s      fs3, ft11, rtz
                  slt          a0, s3, sp
                  fsgnj.s      ft8, fa1, fs10
                  divu         s1, t4, s0
                  slti         gp, tp, -662
                  sltu         s1, s4, s11
                  fsub.s       ft3, ft0, ft8
                  fsgnj.s      ft11, fs4, fa1
                  fcvt.s.wu    ft3, s1
                  fcvt.s.wu    fs8, s3
                  fsub.s       fs7, fs4, fs8
                  fadd.s       fs7, fs1, fa1, rmm
                  xori         s2, a0, 499
                  flt.s        s9, ft3, ft4
                  fsub.s       fs11, fa2, ft3
                  sll          s2, s4, s3
                  srli         s2, zero, 16
                  fcvt.w.s     s11, ft9, rdn
                  addi         t4, s6, -747
                  fsub.s       fs3, fa5, ft9
                  xor          s3, t3, s1
                  fmv.w.x      ft0, a4
                  ori          a3, t4, 1314
                  divu         s6, a6, t5
                  add          t3, s11, zero
                  rem          a6, t4, s6
                  srl          t3, a2, t5
                  and          zero, a4, s10
                  fcvt.wu.s    s9, ft6
                  auipc        a7, 800899
                  ori          s9, s8, -1166
                  auipc        a2, 222342
                  mulh         tp, gp, s8
                  sll          t4, s11, a3
                  slt          s4, s10, ra
                  mulh         a3, a5, s1
                  fmul.s       ft1, ft10, ft4
                  andi         s11, s4, 315
                  addi         t3, s5, 2007
                  fsgnjx.s     fa2, fs7, fs6
                  mulh         s2, s6, t0
                  fclass.s     s9, fs1
                  srl          sp, s7, a6
                  fsub.s       fs10, ft2, fa0, rdn
                  mulhu        t3, t1, t6
                  mulh         s9, s0, zero
                  srai         gp, a5, 6
                  fmv.w.x      fs4, sp
                  fclass.s     s4, ft9
                  mul          t6, zero, t6
                  fsgnjn.s     fa3, fs8, fa5
                  mulhu        s9, gp, s10
                  fadd.s       fa3, ft8, fs6
                  or           zero, tp, t0
                  sltiu        sp, a5, 16
                  flt.s        ra, fs10, fs7
                  fmul.s       fs9, ft6, fa0
                  fcvt.s.w     fs6, s1, rmm
                  fmax.s       ft0, ft5, fa6
                  or           a6, a6, gp
                  fadd.s       fa3, ft9, ft1
                  feq.s        a1, fs3, fs7
                  fsgnj.s      fa3, ft6, fs0
                  mulh         t4, s2, s7
                  or           s8, s9, t6
                  sub          ra, t3, s6
                  fmax.s       ft7, fs10, fa0
                  sltu         gp, t3, t6
                  fmv.x.w      s8, fs7
                  fmv.x.w      s6, fs10
                  fcvt.w.s     a7, ft11
                  addi         a5, a3, 1079
                  sltiu        s4, s3, 1312
                  fsgnj.s      ft1, fs2, fa4
                  sltiu        s6, sp, 791
                  slt          tp, s4, zero
                  mulh         zero, s6, ra
                  fsgnj.s      ft9, fa2, ft0
                  fcvt.s.wu    fa4, s6, rtz
                  fadd.s       fa6, ft7, ft0
                  srl          s1, s9, sp
                  addi         gp, zero, -1338
                  mul          s1, t5, s9
                  fclass.s     t2, fs11
                  or           a1, t1, t3
                  fsqrt.s      fs5, fs5
                  fle.s        s7, ft5, fa6
                  mulhu        s0, t3, s0
                  divu         s0, a0, ra
                  sltu         s0, t5, t2
                  and          t3, t1, s10
                  fle.s        s8, fs0, fa7
                  fsgnjn.s     fs10, fa1, fa4
                  mulh         a0, s6, zero
                  fmv.x.w      s6, fs3
                  or           a6, gp, s1
                  fsgnjx.s     ft11, ft2, ft9
                  fsqrt.s      ft8, fs0, rup
                  fsub.s       fs11, fa4, fs5
                  rem          s4, s6, a3
                  div          a6, s2, s2
                  sub          zero, ra, ra
                  sltiu        a7, s11, 1098
                  sll          t3, gp, ra
                  slli         gp, zero, 5
                  or           a7, a5, a1
                  srl          a3, a5, s11
                  sub          zero, a3, a3
                  fcvt.wu.s    a1, fs10, rne
                  slti         a4, a1, -354
                  auipc        a5, 614488
                  fmv.x.w      s0, ft4
                  fcvt.w.s     ra, fa3
                  fmul.s       ft6, fs9, ft0, rup
                  sltiu        a3, a4, 1196
                  fcvt.s.w     fa3, a2, rdn
                  srl          a4, s1, t0
                  slt          s6, s7, s2
                  fmin.s       fs1, fa5, fs4
                  feq.s        a4, fa1, fa0
                  mul          tp, s3, s8
                  mulhsu       s3, sp, gp
                  nop
                  fmax.s       ft10, ft1, fa3
                  sltiu        a7, s5, 1033
                  andi         s5, a0, -810
                  fle.s        s10, fa6, ft2
                  or           a1, t3, t5
                  remu         s8, zero, gp
                  fmv.x.w      s5, ft8
                  fsgnj.s      fs4, fa2, fs0
                  fcvt.wu.s    t6, fa7
                  slti         a4, t4, 927
                  fmv.x.w      tp, fs6
                  xor          a3, a7, s10
                  divu         t2, s11, s1
                  slt          a1, a0, ra
                  rem          zero, sp, t4
                  srl          a4, sp, t0
                  mulhu        t6, s11, t4
                  fsgnjn.s     ft2, ft3, ft8
                  div          s11, t2, a5
                  fclass.s     sp, fs10
                  slt          tp, a0, t5
                  xor          sp, s11, tp
                  fsgnjn.s     fs1, fa4, ft8
                  srl          t2, s5, gp
                  and          s8, t6, s4
                  sub          zero, a2, s4
                  fcvt.w.s     tp, fs11, rtz
                  auipc        s2, 970837
                  slti         a6, s4, 224
                  remu         a7, s10, s5
                  fcvt.s.wu    fs2, s10, rtz
                  feq.s        s4, ft5, ft2
                  divu         s6, t5, t4
                  fcvt.s.w     fs6, a0, rmm
                  andi         s1, a1, -1566
                  xori         gp, ra, 325
                  mulh         s7, a2, a4
                  slti         ra, s11, -940
                  srai         zero, t4, 14
                  fcvt.w.s     tp, fa1, rdn
                  sll          a2, t4, s5
                  fcvt.w.s     zero, ft11, rup
                  fmv.w.x      ft1, t3
                  and          zero, s11, s8
                  fcvt.s.w     fs8, s10
                  mul          t3, t4, tp
                  srai         s3, a4, 20
                  remu         t2, a0, a2
                  sll          s0, s1, s11
                  fcvt.s.wu    ft4, s2
                  lui          s0, 520299
                  remu         s6, t2, t1
                  addi         a5, t6, -1517
                  fmax.s       fa2, fs10, ft7
                  sra          s3, a6, s10
                  mulhu        a4, a3, a2
                  div          a6, s10, t6
                  mulhsu       s2, s5, a3
                  mulh         s0, a6, t4
                  fsqrt.s      ft8, fs8, rup
                  sub          t6, s1, t6
                  mulhu        a5, s10, a3
                  fcvt.s.wu    ft9, a1
                  sub          s1, t2, s5
                  srli         s1, s7, 28
                  mulhsu       t6, s5, s1
                  flt.s        ra, fs6, fs8
                  fcvt.s.wu    ft7, s3, rup
                  mulh         s8, s6, s10
                  fclass.s     t2, fs8
                  slti         a7, t4, 486
                  fdiv.s       ft2, ft7, ft0, rmm
                  fle.s        ra, fs0, fs9
                  fcvt.s.wu    fs7, t2
                  fsgnj.s      ft1, fs9, fa4
                  fcvt.wu.s    a6, ft2
                  ori          a1, a7, -818
                  rem          ra, s4, a6
                  auipc        s11, 1024904
                  sltu         s10, a5, s5
                  fdiv.s       ft7, fs7, fs11, rdn
                  fcvt.w.s     t4, fs3
                  fmin.s       fs5, ft2, ft3
                  fmv.w.x      ft9, s0
                  addi         sp, a3, 449
                  lui          s2, 577385
                  fdiv.s       fa4, fs3, fa0
                  sub          s5, t2, a2
                  fsub.s       ft3, fa7, ft4, rne
                  mulh         t3, a4, s11
                  div          t6, s3, t3
                  fcvt.wu.s    a7, ft3, rtz
                  mul          a6, s1, a6
                  slli         s0, s2, 1
                  add          a0, s3, a4
                  mul          a3, s9, s7
                  fmv.x.w      s11, ft3
                  fcvt.s.wu    fs4, t6, rne
                  mulhu        s3, a4, s1
                  slt          sp, tp, s0
                  or           s3, sp, t1
                  fsgnjn.s     ft0, ft11, fa6
                  divu         s8, s10, sp
                  sra          s10, s3, t0
                  fsgnj.s      fa7, fs8, fa0
                  fclass.s     ra, ft2
                  nop
                  slli         s3, t1, 13
                  srai         s6, sp, 2
                  and          s10, a6, s1
                  add          s9, s2, gp
                  or           a7, a6, s9
                  nop
                  sll          t4, a6, t3
                  slt          s6, s1, a4
                  auipc        s3, 630064
                  srl          s10, a4, zero
                  srai         t4, a0, 8
                  divu         a0, s0, a5
                  fle.s        s2, fa6, fa2
                  fmv.x.w      a6, ft3
                  andi         a2, s5, -147
                  mul          s6, a0, a7
                  fclass.s     a3, ft2
                  ori          s7, s4, 30
                  fadd.s       ft3, fa1, fs5, rtz
                  divu         s5, t6, t2
                  andi         t4, s8, -270
                  fmv.w.x      ft0, ra
                  fmul.s       ft0, ft10, fa1, rtz
                  fmul.s       ft6, ft2, ft8
                  mulhsu       a2, s2, s0
                  fsgnjn.s     ft3, ft4, fs10
                  slti         a2, s9, -821
                  xori         s10, a4, -1758
                  sltiu        s1, a5, 573
                  srli         t4, s11, 29
                  fsgnjn.s     fa2, fs10, fs3
                  auipc        a6, 577599
                  and          s0, zero, s0
                  slli         a6, sp, 2
                  sltu         s1, s7, s7
                  feq.s        s8, fs7, ft0
                  fmul.s       fs10, fa5, fs0, rup
                  fmv.w.x      fa2, s1
                  fmin.s       ft2, ft3, ft11
                  slt          s2, s7, s8
                  or           s9, t0, a3
                  remu         a3, zero, s0
                  slti         s8, t6, -170
                  fsgnjx.s     ft9, fa3, fs7
                  slti         s6, zero, 1629
                  fsqrt.s      fs7, fa2
                  mulhu        s3, s9, s6
                  srai         a7, a1, 8
                  xori         s4, a7, 352
                  srl          t6, s5, a4
                  add          s5, t4, s3
                  xor          s0, a3, a5
                  sub          s0, sp, a4
                  ori          a5, t6, -1726
                  add          s7, tp, a3
                  nop
                  sll          a4, a6, a0
                  srl          s2, s10, t5
                  fmax.s       ft4, fa1, fs1
                  fmin.s       ft10, ft9, fs5
                  xor          t4, tp, t0
                  rem          s7, t1, t4
                  sltiu        s5, s3, -1230
                  fcvt.w.s     a2, fa3, rtz
                  mulhsu       t4, s8, s8
                  mulhu        s2, s5, s4
                  srli         t3, s10, 1
                  add          s5, sp, t0
                  mulh         s2, s1, s4
                  fmax.s       fa7, fs5, ft0
                  xori         s9, s8, -914
                  xori         s0, t0, 607
                  sll          a4, a7, tp
                  srl          a1, s10, t4
                  mulhu        a4, t1, a0
                  fmv.w.x      fs10, s9
                  fcvt.w.s     t4, ft11
                  fcvt.wu.s    s0, fa0
                  sll          s3, s8, t4
                  auipc        s8, 91621
                  remu         s7, a6, t0
                  divu         s4, a6, s7
                  nop
                  slti         s5, a3, 1824
                  xor          ra, t6, s2
                  fcvt.wu.s    ra, fa3
                  mulh         s8, s10, a5
                  auipc        s7, 338930
                  fsgnjx.s     ft0, fs0, fa2
                  fsub.s       ft0, fa3, ft9, rne
                  fdiv.s       fa1, fs8, ft11, rmm
                  or           s2, a7, t5
                  xor          s0, ra, a4
                  divu         a0, s0, t2
                  fclass.s     s5, ft11
                  sltiu        s10, s5, -245
                  div          a1, s4, t4
                  fmul.s       ft6, ft3, ft3, rup
                  fmin.s       fa6, fs6, fa3
                  fsqrt.s      fa6, ft4, rne
                  fmin.s       ft3, fa6, ft10
                  slti         a6, s5, 910
                  fcvt.s.w     ft3, a7, rtz
                  divu         s8, s6, a4
                  fmin.s       fa7, fs3, fs0
                  sub          s2, t4, gp
                  feq.s        sp, ft10, fs10
                  fle.s        s7, fs3, fa0
                  srli         sp, s2, 1
                  divu         ra, gp, s4
                  fclass.s     a4, fs9
                  xor          s7, sp, s1
                  fadd.s       ft6, ft2, ft6, rdn
                  fdiv.s       fs3, fs5, ft6
                  fmax.s       fa4, ft7, ft10
                  remu         a6, s3, a5
                  fcvt.s.wu    fa3, t1
                  sub          s1, a3, t3
                  sub          t4, t6, a2
                  fsgnjn.s     fs0, ft1, fa2
                  xor          s4, s8, a5
                  remu         s11, t4, s9
                  mulhsu       s10, s8, a4
                  fcvt.s.w     fs7, a7
                  mulhsu       zero, a1, a1
                  nop
                  fsgnj.s      fs8, ft6, fs6
                  ori          a7, s2, 538
                  and          s4, t3, a4
                  div          ra, s11, s9
                  ori          s10, s10, -910
                  addi         a3, s7, -514
                  nop
                  remu         a1, ra, t4
                  flt.s        s9, ft5, fs10
                  srli         s9, t4, 19
                  slti         t4, ra, -1914
                  fsub.s       ft11, ft6, ft9, rtz
                  fmin.s       fs3, fa7, ft4
                  fle.s        sp, fs8, fs5
                  addi         s8, s6, -671
                  mulhsu       t6, a2, s11
                  fmv.w.x      fs2, a4
                  rem          s10, a1, t0
                  srai         s5, s9, 8
                  fsgnj.s      ft8, fs3, ft10
                  andi         s8, a3, -474
                  xor          s8, s7, sp
                  fcvt.wu.s    t4, fa5, rdn
                  ori          zero, s5, -1081
                  fsqrt.s      ft6, fs10
                  sub          gp, s6, t0
                  fdiv.s       fs7, ft11, ft6, rdn
                  flt.s        s8, fa3, ft10
                  fmul.s       fa1, ft10, fa0, rne
                  fsgnj.s      ft0, ft0, ft8
                  fsgnjn.s     fa6, fs4, fs1
                  fmin.s       ft2, fa2, fs4
                  mulhsu       s7, s2, a0
                  mul          a1, gp, sp
                  fle.s        a2, fa4, fs8
                  mul          s1, s0, tp
                  remu         a1, gp, t1
                  srl          a6, s7, s7
                  fclass.s     a7, fs3
                  xori         a5, s3, 1505
                  slli         a2, s10, 5
                  fmul.s       fs1, ft0, fs1
                  sltiu        ra, a7, 422
                  mulh         tp, s6, s11
                  fclass.s     s9, ft4
                  lui          s6, 364062
                  fsgnj.s      ft6, fs10, ft0
                  addi         zero, a4, -1135
                  slli         a5, a0, 17
                  fsgnj.s      fs3, fa0, fs1
                  mul          s6, sp, a3
                  fmv.x.w      s9, fa4
                  mulhsu       a7, s5, t6
                  sltu         s7, t2, s3
                  or           a5, s3, s9
                  feq.s        s6, ft11, fa4
                  xor          a6, s11, tp
                  fmin.s       fs9, ft8, fs7
                  fmin.s       fs7, ft7, fs6
                  or           a5, s1, s0
                  lui          s1, 969067
                  fsqrt.s      ft6, fa1
                  slt          a7, s0, s0
                  sltiu        s9, zero, 811
                  sltu         a7, s10, a3
                  fdiv.s       ft3, fs6, fa0, rne
                  andi         s0, a1, 1728
                  remu         s6, ra, s3
                  and          s2, s10, s2
                  fadd.s       ft9, ft4, ft4, rmm
                  div          ra, s11, s0
                  auipc        a7, 34600
                  fsqrt.s      ft8, ft1, rmm
                  sra          s7, t5, a1
                  lui          s1, 858292
                  fsqrt.s      ft10, fs11, rdn
                  fsub.s       fa5, fs6, ft7
                  fcvt.s.w     ft0, a3, rmm
                  srli         a5, a2, 14
                  fsgnjn.s     ft3, ft7, ft11
                  sltiu        t3, s3, -80
                  fmax.s       fa1, fs1, fa1
                  mul          a3, t2, gp
                  addi         s0, s1, 537
                  srl          zero, t1, tp
                  and          a3, t6, s8
                  sra          t3, s0, gp
                  sub          ra, t3, s7
                  fmin.s       fs9, ft6, fa4
                  fmv.x.w      gp, ft11
                  div          a7, s10, a7
                  fcvt.s.wu    fa7, a5
                  div          s9, s9, gp
                  fcvt.s.w     fs10, s9
                  div          a2, s5, s2
                  div          t4, a3, s6
                  fmin.s       fs0, fa2, ft1
                  nop
                  fmax.s       fs9, fa2, fa7
                  ori          s10, s6, 35
                  feq.s        t3, fa4, fs0
                  sltu         s11, t4, a2
                  sltiu        s10, s3, -1907
                  andi         ra, t1, -654
                  and          t4, tp, s7
                  slli         t4, s8, 1
                  srl          s7, t2, a7
                  or           s0, t3, a3
                  sll          s2, tp, t5
                  slt          s6, a5, t5
                  sltiu        s2, s0, 546
                  fle.s        a6, ft2, fs11
                  fsqrt.s      ft2, fs2, rne
                  flt.s        s11, ft8, fs1
                  lui          a4, 55824
                  lui          sp, 285583
                  fmv.x.w      s5, fs10
                  fmax.s       fs11, ft6, ft2
                  slti         t6, t6, 1901
                  fmv.x.w      s11, fs2
                  fcvt.s.w     ft1, s2, rne
                  sltiu        s11, s4, 1491
                  divu         t6, s1, zero
                  sll          a7, a1, s1
                  fle.s        ra, ft3, fa1
                  fmax.s       ft10, fa6, fs6
                  fadd.s       fa4, fs4, fa0, rup
                  mul          a1, s4, s6
                  sltu         s11, s10, sp
                  or           s10, s9, s8
                  fmv.x.w      s1, fs3
                  fcvt.wu.s    s4, ft4, rne
                  xori         s6, t6, -389
                  srli         a4, t4, 8
                  xor          s8, t4, t0
                  fmin.s       fa0, fs10, fa5
                  add          t6, s3, a2
                  slli         sp, s3, 26
                  fmax.s       ft7, fs10, ft6
                  xor          a5, t0, s1
                  fsqrt.s      fs0, ft5
                  mulhu        t3, t4, s4
                  sltiu        zero, sp, -126
                  sra          s2, tp, t4
                  addi         s8, s9, 883
                  srai         t2, s11, 5
                  sltiu        a6, s10, 1571
                  div          s9, zero, tp
                  srl          s4, t2, t1
                  fsgnjn.s     ft1, fs5, fs3
                  divu         a5, t1, t2
                  fsub.s       fs10, fs8, fs1
                  fdiv.s       fs11, fs9, ft6
                  mulh         s2, ra, t5
                  or           s11, s4, t0
                  fcvt.s.w     ft2, s8
                  fcvt.s.wu    fs10, zero
                  srl          t4, a5, t4
                  div          s4, a2, a5
                  addi         gp, s11, -1707
                  srai         s5, a5, 0
                  auipc        ra, 167259
                  nop
                  mulh         s9, a3, s7
                  or           t6, t5, a6
                  slli         a4, s8, 16
                  fle.s        s7, fs3, ft6
                  mulhsu       s10, s11, a1
                  fdiv.s       fa7, ft1, ft6, rmm
                  nop
                  sll          s11, s11, s7
                  addi         s7, t3, -1918
                  mul          s11, s3, s7
                  fcvt.s.w     ft4, a7, rtz
                  sltu         a7, t6, zero
                  ori          tp, t5, -800
                  fclass.s     a1, ft1
                  slli         a5, gp, 2
                  fmax.s       ft5, fs11, ft2
                  srli         a1, s3, 21
                  or           s2, t6, s8
                  sltu         s5, t6, ra
                  srl          tp, t4, s7
                  fmul.s       fs4, fs8, fs7
                  mulhu        a6, sp, a0
                  fmin.s       ft4, fs4, fs8
                  fmul.s       ft5, ft4, fs3
                  fsub.s       fa5, fs10, fs0, rmm
                  fsqrt.s      fa1, fa5, rup
                  or           ra, a0, tp
                  fmul.s       ft10, fs9, fa7
                  sra          a7, zero, t6
                  flt.s        s3, fs6, ft3
                  and          s6, s7, s3
                  fadd.s       ft11, fs7, ft0, rmm
                  addi         s7, s3, -1622
                  andi         s8, t6, -1597
                  fsqrt.s      fa5, ft1
                  fclass.s     a0, ft7
                  mul          a0, ra, t0
                  andi         a4, t3, 329
                  fsgnjx.s     ft0, fa3, fa5
                  fmax.s       fa2, ft2, fa7
                  fsgnjn.s     fs11, ft10, ft0
                  mul          a5, s9, s4
                  sll          s7, a5, s10
                  fsgnj.s      ft11, fa1, ft4
                  fmax.s       fa4, ft7, fa6
                  fsqrt.s      fs0, fa2, rtz
                  fmv.x.w      tp, fs4
                  sll          s1, tp, a0
                  fcvt.wu.s    tp, fs10
                  sra          s6, a1, t6
                  sll          s7, s10, t6
                  fcvt.wu.s    t3, ft0, rmm
                  andi         sp, s6, 216
                  rem          s9, s2, s2
                  sltiu        t4, a1, -203
                  auipc        s6, 5893
                  ori          s1, t6, 513
                  lui          s3, 679624
                  remu         s9, t6, t5
                  srai         s8, t4, 1
                  fmin.s       ft10, ft4, ft10
                  srl          a5, t5, a6
                  srl          sp, t6, s5
                  slli         ra, s3, 13
                  nop
                  div          s1, t3, tp
                  feq.s        zero, ft6, ft9
                  lui          s0, 425431
                  div          t6, s4, t3
                  rem          t4, a6, a0
                  sub          s4, s11, gp
                  fsqrt.s      ft11, ft4, rdn
                  add          s1, s3, s3
                  fsub.s       ft6, ft5, ft8, rne
                  fclass.s     t3, fs10
                  ori          t4, s2, -447
                  slli         s3, s10, 13
                  fmv.w.x      fa2, t1
                  nop
                  remu         s4, a6, a2
                  fclass.s     s8, fa4
                  divu         sp, a1, ra
                  sltiu        s7, a1, 1047
                  remu         a4, s2, t2
                  fcvt.s.w     fs7, s2, rup
                  sub          sp, a0, s3
                  fcvt.s.w     fa2, s1
                  slli         a0, s11, 7
                  srl          t3, gp, t5
                  rem          s9, a5, a2
                  fmax.s       ft4, ft2, ft9
                  xori         s0, a7, -1793
                  fsub.s       fa5, fa4, ft11
                  srl          s1, t0, gp
                  fcvt.s.w     ft3, t5
                  fcvt.s.w     fs7, s4, rdn
                  fsgnjx.s     fa2, fs7, fs0
                  xor          t4, s2, ra
                  sltu         a1, a1, t6
                  nop
                  fsgnj.s      ft1, ft1, fs2
                  fmul.s       ft8, fa3, ft8
                  srli         s7, a4, 25
                  mul          tp, a4, s1
                  fcvt.w.s     s3, fa4, rne
                  auipc        sp, 468028
                  slli         a4, a3, 22
                  nop
                  fsub.s       ft10, fa4, fs4
                  rem          a5, s9, s8
                  divu         t3, t5, t5
                  nop
                  fcvt.wu.s    s10, fs9, rtz
                  mul          t3, a4, t3
                  srl          s5, t3, s7
                  fmin.s       fa0, fs1, fs1
                  or           s9, s11, ra
                  fcvt.wu.s    s4, fs0, rup
                  fcvt.s.w     ft0, s2, rdn
                  xori         s7, s5, 364
                  lui          t6, 565172
                  slti         zero, t6, 1475
                  mulh         a1, s11, t1
                  slli         gp, s11, 19
                  slt          zero, a4, t1
                  divu         s1, s10, t0
                  fmv.w.x      fa5, t6
                  fcvt.w.s     s4, fa5, rup
                  fmv.x.w      a2, ft2
                  add          a7, s5, t1
                  fsgnjx.s     fa1, ft6, fa7
                  remu         a0, s6, s5
                  mulhsu       a6, a0, t0
                  slti         s11, s9, 1425
                  ori          gp, a1, 784
                  fsgnj.s      ft0, fs4, ft0
                  add          a3, s11, t2
                  xori         t4, s9, 1450
                  fclass.s     gp, fs4
                  srli         gp, t2, 7
                  slli         s2, s2, 18
                  div          s1, s9, a1
                  divu         s1, tp, a3
                  lui          t3, 154398
                  fclass.s     t2, ft8
                  nop
                  flt.s        a6, fs6, fs1
                  sll          t4, t3, s8
                  fsqrt.s      ft2, fs10
                  fadd.s       fs10, ft11, ft4
                  nop
                  feq.s        s0, fs7, fa4
                  slti         ra, t6, -1243
                  mul          a1, s9, a7
                  feq.s        s3, fs3, fa7
                  mul          a1, a7, a4
                  fcvt.w.s     s10, ft1, rne
                  xori         ra, t2, -1655
                  fmul.s       ft8, fs9, fs5, rtz
                  fmax.s       fa1, ft4, fa0
                  fle.s        s0, fs2, ft7
                  sra          s11, a1, ra
                  auipc        s2, 746049
                  fcvt.s.w     ft11, s6, rup
                  xor          s6, s5, s8
                  or           a3, t5, s8
                  srl          t4, t0, a3
                  xori         s4, s7, 1422
                  feq.s        s0, fs9, fa5
                  fcvt.s.wu    ft2, a7, rtz
                  flt.s        a6, ft9, ft2
                  slt          s0, s2, s6
                  sub          s6, t6, a4
                  fsqrt.s      fs3, ft9, rtz
                  fcvt.s.wu    ft1, a7
                  mulhsu       s6, s6, s10
                  fclass.s     s8, ft2
                  fclass.s     s3, fa1
                  addi         t4, s4, -1158
                  fsqrt.s      fa5, ft11
                  remu         s10, t1, t1
                  and          s3, s3, s6
                  sltu         a7, t6, s4
                  divu         a6, a1, s1
                  mulhsu       s6, t6, s7
                  nop
                  srai         a4, a4, 0
                  divu         ra, a4, a7
                  auipc        s7, 696587
                  rem          a7, gp, s5
                  fle.s        a1, fa3, fs3
                  fmul.s       fs8, fa1, fs2
                  xori         tp, s2, -965
                  slli         t4, s8, 15
                  mul          t2, s10, tp
                  slti         s0, gp, -1653
                  mul          t2, s8, t1
                  auipc        tp, 44256
                  div          s4, s7, a3
                  sra          a3, s0, t3
                  or           s2, tp, a3
                  fsub.s       fs4, ft5, ft7, rne
                  slt          s2, t2, a7
                  div          a6, a1, t3
                  feq.s        s9, fa3, fs9
                  fcvt.s.w     fs4, s1
                  fcvt.w.s     sp, ft2
                  xori         a1, a4, -1119
                  fadd.s       ft1, ft10, fs7
                  fle.s        s8, fa3, ft8
                  sub          t3, a7, t0
                  andi         t6, s8, -245
                  addi         t4, t3, -322
                  fsgnjx.s     fs8, ft2, fa7
                  xori         s2, t0, -731
                  srl          s7, s1, a1
                  fsgnj.s      ft2, fa5, fa3
                  sra          a6, a2, s5
                  mulhsu       s5, a2, zero
                  divu         a7, s6, a6
                  srai         t3, ra, 3
                  sra          s3, t3, s4
                  ori          t4, a1, -69
                  flt.s        s8, fs6, fs8
                  fcvt.w.s     a5, fs11, rtz
                  sltiu        s4, ra, -950
                  divu         ra, a1, tp
                  fmv.w.x      fs11, s1
                  auipc        ra, 797720
                  fmin.s       fa0, fs11, ft0
                  mulhu        sp, a5, s5
                  fcvt.wu.s    a1, fa6
                  fclass.s     a7, fs5
                  fsub.s       ft4, fa2, ft2
                  fsub.s       ft0, fs2, fa1
                  remu         s9, a7, t5
                  fadd.s       fs8, fs6, fa1, rne
                  fsgnjn.s     ft5, ft7, ft1
                  mulhu        s7, a3, s4
                  fcvt.s.w     ft8, gp, rne
                  fmul.s       ft1, fa7, ft2, rmm
                  fmax.s       fs1, fa5, fs5
                  slt          a5, gp, t6
                  fsgnjx.s     fa1, fa3, ft2
                  fadd.s       fs6, ft2, fs10, rmm
                  xori         zero, t0, 1861
                  fadd.s       ft4, ft1, fs0, rdn
                  and          s6, t5, t0
                  flt.s        s2, fs2, ft3
                  srl          gp, a1, zero
                  slti         sp, t3, -1345
                  fsgnjn.s     fa0, fs1, fa1
                  fcvt.wu.s    a3, fs3, rne
                  fsgnjx.s     fa4, fa4, fs3
                  add          sp, sp, s5
                  fmv.w.x      fa0, s1
                  auipc        a7, 514975
                  fsgnjn.s     ft10, ft5, fs0
                  fmv.x.w      a7, ft5
                  fsgnj.s      fa7, fs8, fs11
                  fsgnj.s      fs2, fa5, fs6
                  addi         a2, sp, -1156
                  fmv.w.x      fs4, t4
                  srai         s3, a1, 31
                  fsgnjn.s     fa7, fs10, fs5
                  fsgnjn.s     fs0, fs5, fs11
                  srai         a3, t1, 11
                  lui          t3, 220780
                  fclass.s     a7, fa3
                  auipc        s1, 387695
                  or           s3, ra, t3
                  mulh         s7, sp, sp
                  ori          s3, t6, -1049
                  ori          a1, s2, -933
                  nop
                  sra          a3, s6, s1
                  mulhu        s5, s11, t6
                  srai         s4, s0, 5
                  sltiu        a4, s0, -1948
                  fmv.x.w      t4, fa5
                  nop
                  fcvt.s.wu    ft6, t2
                  fclass.s     s9, ft11
                  mulhu        t2, s7, t6
                  mulhsu       gp, a3, t6
                  remu         a3, s1, s9
                  mulhsu       a4, s0, s8
                  remu         s9, t2, a1
                  div          a2, zero, s3
                  fadd.s       ft3, ft0, ft5
                  xori         tp, s3, -1836
                  fle.s        a1, ft10, fs10
                  sub          s5, zero, a0
                  fmin.s       ft3, ft10, fs7
                  slli         a3, t4, 3
                  lui          a1, 673640
                  rem          a5, t2, a0
                  fsgnjx.s     fs0, ft6, fa6
                  rem          t3, a1, s10
                  mulh         a2, t3, sp
                  fsqrt.s      fs5, fs2, rne
                  fsqrt.s      fa2, fa0
                  sltiu        s4, s3, -402
                  srai         s6, t0, 19
                  fsgnj.s      fs1, ft0, ft1
                  fmax.s       fa2, fa2, ft3
                  add          a7, s0, s4
                  fcvt.w.s     zero, fs1, rne
                  add          zero, s9, s6
                  or           s6, a5, t2
                  sll          tp, a5, tp
                  srli         s11, s4, 12
                  fmul.s       fa7, ft3, fa3, rdn
                  sub          s0, gp, a1
                  addi         s4, t0, 1316
                  fdiv.s       ft9, fs6, fs8, rup
                  srli         s10, s9, 30
                  addi         s1, s11, -1584
                  nop
                  andi         s1, s0, -172
                  slti         a2, a7, 106
                  sub          s9, s2, a2
                  remu         s1, a4, s4
                  fmul.s       fs9, ft4, ft0, rmm
                  or           a4, a3, s6
                  ori          a1, a6, -10
                  mulhu        s11, s1, a6
                  remu         sp, a5, s10
                  fmin.s       fs7, ft4, fa2
                  slti         s0, s7, -1671
                  remu         a3, s1, gp
                  srli         s7, a4, 15
                  fcvt.w.s     t4, ft3, rup
                  fsgnjx.s     fs5, fa5, fs5
                  or           zero, a3, s1
                  xor          gp, gp, s5
                  flt.s        t2, fa4, ft3
                  srai         a6, a3, 26
                  div          tp, tp, s3
                  fle.s        a1, fs1, fs7
                  xori         t6, tp, -183
                  fmax.s       fs5, fs3, fa7
                  fclass.s     t4, ft2
                  fsqrt.s      ft2, fa6
                  fcvt.wu.s    s6, fs7
                  add          tp, t4, a6
                  fsgnjn.s     fs3, fa5, fa4
                  xori         a7, gp, 1126
                  ori          a5, zero, -1486
                  fsub.s       ft2, fs6, fs10, rtz
                  fcvt.wu.s    a1, fa7
                  fmv.x.w      a6, ft3
                  add          t2, s2, tp
                  fsgnjn.s     ft4, fa3, fa5
                  fle.s        t4, ft6, ft7
                  sltiu        a6, s5, 1800
                  fcvt.s.wu    ft8, s2, rdn
                  lui          gp, 256514
                  and          a4, s0, a5
                  fmv.w.x      fs4, t5
                  fclass.s     tp, ft5
                  fmv.x.w      s5, fs6
                  fmul.s       ft11, fa6, fa7
                  srl          s10, s3, t2
                  mulhu        a4, s6, t1
                  addi         t4, t4, -185
                  fsgnj.s      ft7, fs1, ft5
                  fcvt.s.w     fa3, s10, rup
                  slli         a6, s5, 12
                  xori         s0, s10, 604
                  addi         a2, s7, 451
                  sub          a0, s9, sp
                  and          sp, ra, a7
                  remu         a0, a5, gp
                  srli         s11, tp, 12
                  divu         s3, s10, a3
                  or           s3, a5, a4
                  fcvt.wu.s    a0, ft0, rne
                  flt.s        s4, fa2, fa0
                  slli         s5, a0, 21
                  fmax.s       ft8, fs2, fa5
                  add          t6, t2, t6
                  fcvt.w.s     a5, ft0, rup
                  fsgnj.s      fs3, fs9, fa2
                  fmv.w.x      fs5, a5
                  mul          t2, s11, a2
                  and          s6, a1, a2
                  fmul.s       fs4, ft11, ft0, rup
                  sll          s1, s2, s10
                  slti         t3, s2, 924
                  addi         t2, s2, 318
                  srai         a1, a6, 17
                  sll          ra, s7, t1
                  srai         s7, a1, 10
                  or           t3, s7, s9
                  add          a4, a7, t4
                  srai         a7, s8, 19
                  fsgnjx.s     fs4, fa3, fs5
                  fsgnj.s      fs7, fa3, ft2
                  mulhu        s7, gp, t4
                  nop
                  fcvt.w.s     a6, fa4, rup
                  add          a2, t0, a2
                  srai         s2, s6, 7
                  srli         s8, a3, 30
                  sltiu        s8, t6, -309
                  sltu         a6, s0, t0
                  fsqrt.s      fs6, fs10, rne
                  xor          t2, s11, t3
                  divu         s9, s2, t3
                  sub          ra, t3, a2
                  divu         s10, s5, sp
                  fdiv.s       ft11, fs7, ft9, rtz
                  srli         t3, s7, 29
                  fsub.s       fa1, fs1, fs4, rmm
                  fmul.s       ft1, ft3, ft9, rdn
                  xori         a4, t2, 622
                  fsgnjn.s     ft3, ft3, ft10
                  fmax.s       ft3, fa3, ft6
                  sra          zero, s6, s9
                  fmul.s       fa4, fa7, ft5, rtz
                  lui          gp, 807032
                  fcvt.wu.s    s7, fs5, rdn
                  fcvt.s.w     fa5, t3
                  srai         a4, tp, 12
                  slli         a6, s4, 19
                  sra          ra, sp, t3
                  ori          s11, s3, -1936
                  fsub.s       ft5, fa5, fa3, rtz
                  mulhsu       s8, s6, tp
                  flt.s        a5, ft9, fa7
                  nop
                  slti         s6, t3, -58
                  fdiv.s       fa3, fa5, ft8
                  sll          gp, a0, s3
                  addi         a0, sp, -251
                  fsgnj.s      fs1, ft7, ft8
                  xor          t2, a5, sp
                  fclass.s     t6, fs2
                  div          a3, t6, a5
                  xori         s0, tp, 1924
                  srli         a4, s4, 16
                  fclass.s     a0, fs1
                  xori         s11, a4, -947
                  fsgnjx.s     fs3, fs1, fa4
                  lui          s1, 934579
                  xor          s11, t3, a2
                  fsgnjn.s     fa5, ft7, fs3
                  fcvt.w.s     s9, fa6, rdn
                  fadd.s       fa3, fs0, ft6
                  fsgnjn.s     ft6, fs1, fs0
                  mulhsu       s8, t3, s8
                  flt.s        s9, fs4, fs5
                  fsgnjn.s     ft3, fa0, fa2
                  divu         s9, t0, s10
                  mulh         tp, zero, s10
                  xor          s5, a0, tp
                  flt.s        tp, ft5, ft4
                  rem          a5, t6, t5
                  rem          a1, s1, s2
                  fsqrt.s      fa2, fa4
                  fmin.s       ft8, ft0, fs11
                  add          ra, s1, s7
                  fcvt.w.s     s3, ft5
                  fmv.w.x      fa0, a5
                  fdiv.s       fa5, fs9, fs0
                  divu         t3, s1, ra
                  xori         s11, s7, -1434
                  fdiv.s       fa0, fa4, ft5
                  auipc        a0, 361188
                  fsgnjn.s     fa6, fs1, ft6
                  and          s4, s11, t0
                  fmax.s       fa7, fs3, fs3
                  fadd.s       ft5, fs5, fa5
                  fmax.s       fs10, fs9, ft9
                  fsgnj.s      fs0, fs9, fs1
                  remu         t6, a2, s8
                  fcvt.wu.s    s0, fa0, rup
                  srai         t2, a3, 31
                  fsgnjx.s     fs1, fa3, ft5
                  xori         s6, s2, 383
                  srai         s3, t1, 2
                  fmv.x.w      a0, fs11
                  addi         gp, s7, -1489
                  remu         s8, tp, s8
                  slti         s8, a3, 676
                  fcvt.w.s     a3, fs5, rup
                  fsub.s       fs3, ft5, ft9
                  slt          a0, s6, a4
                  flt.s        sp, fa7, fs4
                  fmv.w.x      fa5, t1
                  srai         t3, s3, 31
                  mulh         s0, a4, t1
                  slli         a5, t2, 20
                  addi         a5, tp, -1090
                  fsub.s       fs1, fs2, fa5, rdn
                  fsgnj.s      fs4, ft3, ft3
                  sra          a7, gp, s1
                  slti         s10, s6, -622
                  fsgnjn.s     ft8, fs2, fa1
                  xori         a1, gp, 1904
                  fmin.s       ft0, ft5, fa6
                  nop
                  mulhsu       a3, t5, tp
                  fclass.s     t3, fs6
                  fcvt.s.w     fs2, s2
                  fle.s        s7, fs1, fs10
                  srai         ra, s11, 22
                  fsqrt.s      fs11, fs3, rup
                  fsqrt.s      ft6, ft7
                  sra          sp, a1, t4
                  fclass.s     a0, fs9
                  fsqrt.s      fs2, ft0, rmm
                  fsqrt.s      ft1, ft7
                  and          a7, s3, s8
                  rem          s11, s4, sp
                  sll          s3, a7, a5
                  fmv.w.x      ft4, s7
                  srl          a1, zero, a0
                  sltu         s4, s6, s3
                  ori          sp, s0, -1415
                  fclass.s     s9, ft5
                  fle.s        s5, ft6, fs3
                  fclass.s     t6, fs2
                  fmin.s       fa2, fs10, ft3
                  slti         t6, s4, 1052
                  fmin.s       fa4, fs6, ft6
                  srl          a0, a2, t4
                  fsqrt.s      fs8, ft8, rup
                  or           a1, gp, tp
                  fcvt.s.w     ft6, s2
                  fcvt.s.w     ft5, ra
                  andi         s11, t5, -1378
                  sra          s4, zero, a7
                  fsgnjn.s     ft11, fa6, fs1
                  fcvt.s.wu    fa0, t0, rmm
                  slti         t6, s3, 1700
                  fcvt.wu.s    s9, ft8, rne
                  remu         a4, s3, a7
                  fsub.s       fs8, fa1, ft2, rmm
                  nop
                  mulhsu       t2, s4, a3
                  add          s0, a1, s6
                  fmv.w.x      fa4, s6
                  andi         a1, t1, -1571
                  fsgnjn.s     fs4, fs11, ft9
                  slt          s4, s7, a6
                  fcvt.s.wu    ft7, s3, rne
                  div          t3, s11, a2
                  fcvt.w.s     a5, ft4
                  fmax.s       fs6, fa6, ft11
                  slli         s3, t0, 24
                  fle.s        a6, fa4, ft10
                  fdiv.s       ft6, fs4, ft9, rup
                  sra          ra, t4, a2
                  flt.s        a3, fa0, fa4
                  fsgnjx.s     ft1, ft7, fa4
                  fmin.s       fs4, fa4, ft4
                  mulhsu       a2, sp, a5
                  fmul.s       ft6, ft5, fa1
                  slt          ra, t5, t4
                  andi         a4, t2, -1732
                  fle.s        s5, fs2, fa7
                  mul          ra, a2, s6
                  xor          s4, s11, s7
                  sltu         s0, s11, t0
                  fsgnjn.s     fs11, fs2, ft7
                  sra          a7, sp, s1
                  andi         tp, ra, 1264
                  or           s3, s0, s9
                  mulhsu       tp, a1, t4
                  srl          sp, s4, s2
                  xor          s8, s7, t6
                  auipc        s5, 984904
                  nop
                  fclass.s     s11, fs3
                  addi         s10, ra, 1801
                  sltiu        t6, s8, -32
                  srai         t2, a7, 14
                  fcvt.wu.s    s5, ft0
                  fsqrt.s      fs2, fs10
                  or           zero, s4, s3
                  fmax.s       fs10, ft7, fa6
                  sll          sp, s3, a2
                  mulhsu       t3, a1, s0
                  andi         s11, s0, 49
                  addi         t4, s6, -480
                  or           s2, t5, sp
                  mulhu        t2, s0, s6
                  fclass.s     s2, fs8
                  fsgnjx.s     ft11, fs0, ft5
                  feq.s        sp, ft6, ft10
                  fsgnjn.s     ft5, ft8, fs11
                  mulhu        a4, a3, a5
                  mul          s0, zero, t4
                  sltiu        a5, zero, 576
                  fsgnjx.s     fs6, ft8, ft8
                  sll          s3, ra, t5
                  fsgnjx.s     fs5, fs10, ft3
                  fsub.s       fa5, ft2, fa6, rup
                  nop
                  fsgnj.s      ft6, fs11, fa4
                  srai         s10, a3, 5
                  and          s8, t1, tp
                  mul          s8, s6, a5
                  mul          s0, s3, s6
                  mulhsu       a7, s5, s7
                  rem          a3, s4, a2
                  sltu         a5, s4, a2
                  auipc        gp, 599680
                  fdiv.s       fa7, fs6, fs0
                  add          t6, a3, s3
                  fmv.w.x      ft4, a2
                  fsgnjn.s     ft8, fs2, ft2
                  flt.s        a6, fs3, fs8
                  slli         a1, gp, 16
                  nop
                  fsgnjx.s     ft10, fs7, fs6
                  fdiv.s       fs6, ft0, ft0, rdn
                  fmul.s       ft6, ft9, fs9, rne
                  fsgnjx.s     fa5, ft8, ft7
                  fsgnjn.s     fs11, fa2, fs11
                  sltu         zero, s10, s9
                  ori          t6, a5, 971
                  andi         s7, t3, 947
                  srl          s9, s1, s0
                  sltiu        sp, t1, 1207
                  andi         a1, t0, 131
                  divu         s7, a6, t3
                  srai         s5, s0, 1
                  rem          s0, a6, s10
                  fmv.w.x      ft9, s7
                  sltiu        ra, a5, 1754
                  fcvt.wu.s    s0, fa0
                  mulh         t4, t3, s5
                  add          t2, s6, s5
                  lui          a4, 877142
                  div          ra, s4, s9
                  divu         s8, s11, t6
                  fmv.x.w      a3, ft8
                  fmul.s       fa4, ft9, fs9
                  auipc        s1, 145541
                  fclass.s     s1, ft8
                  sra          s6, s10, s3
                  fsgnjx.s     fs3, ft6, fa4
                  fmv.w.x      ft6, s9
                  fdiv.s       fs3, ft9, ft9
                  fmul.s       fa0, fs0, ft0, rne
                  sltu         s7, a6, a3
                  nop
                  feq.s        zero, fa0, fs11
                  auipc        a4, 474890
                  andi         zero, zero, -192
                  fsgnj.s      ft3, fs8, fs7
                  slli         a7, t3, 8
                  auipc        t6, 859547
                  fmin.s       fs0, ft1, fa5
                  slli         a2, sp, 22
                  sub          zero, a0, s0
                  mulhsu       s2, s6, t0
                  sra          t2, t4, t3
                  mulhu        t6, s0, s4
                  and          t3, t0, t0
                  rem          a3, t1, gp
                  slt          a7, a3, s6
                  fle.s        zero, fa6, ft0
                  rem          s6, a7, s4
                  sltu         a5, t0, zero
                  fmin.s       fa0, ft2, fa2
                  nop
                  fsgnjx.s     ft0, fs11, fs4
                  rem          s1, s4, a2
                  sltiu        a0, t6, 1033
                  lui          s10, 916160
                  fsqrt.s      ft4, fa2, rdn
                  fsgnj.s      fs8, fa4, fs2
                  mul          zero, t5, tp
                  addi         a0, t2, -1162
                  sltu         gp, t1, a5
                  remu         a0, s4, a3
                  mul          s2, sp, t0
                  fsgnjn.s     ft4, fs7, ft6
                  fmin.s       ft7, ft8, ft11
                  lui          sp, 471921
                  fmax.s       fs8, fs6, fa3
                  fsgnjx.s     fs6, fs3, fs5
                  add          s3, s5, s4
                  fclass.s     s5, fs4
                  fcvt.wu.s    s8, fs6, rne
                  mulhsu       s11, a0, s5
                  srai         a3, a7, 5
                  srli         s0, s9, 11
                  fmv.x.w      s9, fa6
                  sltiu        sp, t6, -625
                  addi         s7, t3, -1000
                  div          a4, t4, s1
                  auipc        sp, 384713
                  fmv.x.w      sp, ft8
                  divu         a4, a6, a2
                  addi         a2, t4, -348
                  fsub.s       fs1, fa2, fa0
                  slti         a7, zero, -476
                  xori         a2, zero, 1625
                  divu         s6, a2, a4
                  fsgnjn.s     fs6, fa7, ft10
                  srl          s11, t5, t6
                  fsgnj.s      ft4, ft11, fs0
                  fcvt.s.wu    fa1, s8
                  fclass.s     a4, ft2
                  fcvt.w.s     a2, fs4, rne
                  slti         a6, s6, -1736
                  fle.s        a1, fa4, ft10
                  mulhu        sp, t0, s10
                  sll          s4, gp, t0
                  mulh         a4, s2, t1
                  fcvt.wu.s    ra, fa0
                  fsgnjx.s     ft6, ft8, fs7
                  fmv.w.x      ft1, tp
                  or           a3, gp, t0
                  xor          s8, s6, s10
                  fmin.s       fa0, fa4, fs5
                  fclass.s     sp, fa6
                  nop
                  fcvt.w.s     s6, ft2
                  fmv.w.x      ft9, s3
                  fcvt.s.wu    ft0, gp
                  fmin.s       fa5, fs5, ft6
                  andi         s2, tp, 379
                  fcvt.s.w     fs11, t5, rmm
                  nop
                  fmin.s       fs7, ft5, fs0
                  mulhsu       s2, s8, t0
                  mul          s11, t3, s2
                  fcvt.w.s     s1, fa0
                  fclass.s     s10, fa3
                  sub          t4, t5, t2
                  andi         gp, sp, 390
                  sub          zero, a7, t4
                  srai         s9, a1, 16
                  sll          s10, tp, a3
                  fcvt.s.wu    fs9, a6
                  nop
                  addi         zero, t0, 1094
                  fsgnjx.s     ft0, ft0, fa7
                  sltu         s9, gp, zero
                  fsgnjn.s     fa1, ft4, fa1
                  fcvt.w.s     zero, fa5, rtz
                  fclass.s     zero, fa6
                  fsqrt.s      fs10, ft1
                  fcvt.s.wu    ft7, zero, rtz
                  ori          s1, s3, 853
                  slt          a5, t3, a2
                  fmv.w.x      fa2, s6
                  addi         a1, a2, 1485
                  fcvt.w.s     s9, ft3, rdn
                  mulh         s6, tp, s3
                  slti         s9, a6, 888
                  mulh         s8, s0, s8
                  mulhsu       s0, t1, a5
                  fmv.w.x      ft3, s8
                  srl          s5, s11, zero
                  fdiv.s       fs1, ft3, fs8
                  feq.s        t4, fa1, fs3
                  slt          s2, a5, a0
                  add          a0, tp, s4
                  or           t3, s6, sp
                  auipc        s6, 78209
                  mulhu        a0, s10, s8
                  flt.s        s2, fa5, ft10
                  feq.s        s2, fs0, fa2
                  mulhu        t2, s0, s0
                  and          s1, s10, ra
                  fmul.s       ft1, ft11, ft10
                  divu         a2, t5, s11
                  addi         ra, t5, 163
                  fdiv.s       fa3, fs9, fs1, rtz
                  lui          t2, 58924
                  fmul.s       ft10, fa4, fa1, rne
                  xori         a6, zero, -174
                  addi         s7, s11, 1290
                  srl          a7, gp, s9
                  add          s7, t2, t6
                  mul          s8, t0, t6
                  mulhu        s0, s5, t4
                  div          s2, s0, s0
                  fle.s        ra, fa7, ft1
                  or           s0, s11, s4
                  addi         tp, s6, -1524
                  and          s5, a2, t0
                  add          t4, s6, a0
                  lui          s1, 309748
                  sltu         s6, sp, a1
                  and          tp, a0, s8
                  fadd.s       fa4, fs7, fa4
                  fclass.s     gp, ft5
                  sll          ra, t2, a4
                  fdiv.s       fa2, ft0, fs11
                  sltu         t6, a4, gp
                  fmin.s       fa3, fa0, ft2
                  fcvt.w.s     s0, fa2
                  fsgnjn.s     fa0, fa1, fs11
                  fclass.s     tp, fa2
                  fcvt.w.s     a0, fs9, rtz
                  srli         ra, a7, 30
                  slt          s11, s4, a3
                  fmin.s       ft0, fs2, fs1
                  sltiu        zero, a6, -759
                  divu         a7, tp, ra
                  sltu         a5, sp, t3
                  fmv.w.x      fs2, zero
                  ori          ra, sp, 1678
                  fsgnj.s      fs1, ft3, fa2
                  fsgnjn.s     fs11, ft10, ft10
                  xor          sp, s9, a5
                  xori         sp, a2, -431
                  fcvt.w.s     s1, fs1, rtz
                  fsqrt.s      ft7, fa3, rtz
                  div          gp, s0, a5
                  rem          s4, s10, s6
                  fsgnjx.s     ft6, ft6, fs7
                  add          s7, a1, s1
                  slli         gp, a3, 27
                  fclass.s     a7, fs10
                  divu         t4, zero, gp
                  sll          s4, sp, t0
                  fsqrt.s      fa7, ft2
                  mulhu        s11, s10, s2
                  sub          s8, a0, t2
                  fmin.s       ft10, fa1, ft9
                  fclass.s     s3, ft8
                  fsgnjx.s     fa0, fs0, fs7
                  ori          gp, a4, 1712
                  mulhsu       a7, t6, s5
                  mul          a5, s10, s1
                  fcvt.w.s     s4, fs11
                  and          sp, s8, t5
                  fsgnj.s      ft0, fa1, fs5
                  fsgnjx.s     fs10, ft10, fs10
                  and          t3, a7, a6
                  mulh         gp, a2, sp
                  srai         s1, a0, 4
                  fadd.s       fa2, fa0, fs0
                  lui          s2, 427015
                  sltu         s0, s3, s3
                  div          t4, gp, sp
                  rem          s3, t3, a4
                  feq.s        s2, fa7, fa6
                  xori         s2, s5, 55
                  srai         zero, a2, 11
                  fcvt.s.wu    ft1, s11
                  ori          s4, s2, -171
                  fmax.s       ft3, fs11, fs6
                  fsgnj.s      ft1, fs4, ft2
                  fsgnjx.s     fa6, fs6, fa7
                  fmul.s       fs8, fa2, ft2, rdn
                  fmax.s       fs0, fa4, ft8
                  fsqrt.s      fa0, fs5, rup
                  mulhu        ra, t6, ra
                  slli         tp, a6, 30
                  add          s3, s4, t3
                  div          s2, s5, t2
                  rem          t4, a5, a5
                  fmv.w.x      fa2, a7
                  mulh         s3, t0, zero
                  sra          zero, s6, t5
                  fsqrt.s      ft8, fs0, rmm
                  fsgnj.s      ft4, ft3, fa1
                  add          s9, a4, t0
                  rem          t2, a1, a2
                  fmul.s       fa0, fs2, fs11, rup
                  fmv.x.w      s8, fs0
                  fmax.s       ft4, fs2, ft1
                  sll          gp, s9, tp
                  slt          s8, gp, t4
                  fsgnjn.s     fs5, fs7, fs9
                  fsgnjx.s     fa2, ft3, fs2
                  sltu         sp, t4, a5
                  fmul.s       fa4, fs1, fs3, rup
                  fadd.s       fs3, fs7, fs4, rne
                  or           s1, s0, a5
                  addi         s11, a7, 1100
                  remu         zero, s11, a1
                  mulhu        s2, a1, gp
                  xori         a3, zero, 796
                  fsgnjn.s     fs3, ft7, fa7
                  andi         t4, s7, 839
                  fsgnjn.s     fa4, fa7, ft3
                  srl          a0, s10, s6
                  fsub.s       fs3, fa2, ft10, rtz
                  fsqrt.s      ft9, ft6, rup
                  lui          s1, 350309
                  andi         s11, a3, -1269
                  slli         s3, ra, 20
                  feq.s        a4, ft8, fs7
                  sltiu        s2, a0, -1894
                  fadd.s       ft9, fs2, fs3
                  fcvt.wu.s    tp, fs8
                  fmax.s       fa7, fa5, ft8
                  feq.s        t4, ft11, fs7
                  fmv.x.w      s11, fs5
                  addi         a6, t0, -1088
                  fclass.s     s7, fa4
                  fmin.s       fs8, fs7, fa7
                  slli         s8, t6, 19
                  fle.s        gp, ft0, fa7
                  sltiu        s6, gp, 140
                  slli         s10, s1, 17
                  fclass.s     s10, ft3
                  nop
                  fcvt.wu.s    a4, ft1
                  andi         a4, zero, 735
                  fmv.w.x      fs8, zero
                  div          s0, zero, s1
                  nop
                  fsgnj.s      ft11, ft8, fs2
                  fsgnj.s      ft10, fa4, fs0
                  fmul.s       fs4, ft2, fa3, rne
                  srli         s3, s7, 5
                  mulhu        a4, a0, s7
                  sra          sp, gp, a0
                  fsgnjx.s     fa0, ft7, fa7
                  mulhsu       t4, t0, t0
                  lui          tp, 462431
                  add          s1, ra, s11
                  srl          s9, s10, s10
                  sra          a6, t5, t0
                  sub          s10, s7, sp
                  fclass.s     a1, fa3
                  mulhu        a3, tp, tp
                  remu         t3, t4, s11
                  or           a4, s7, ra
                  srl          s6, t0, s1
                  xori         a2, t6, 1080
                  sll          s4, a3, s11
                  fsgnj.s      ft0, fs2, fa1
                  slli         s3, a1, 17
                  sltiu        s6, s1, 1153
                  mul          s4, a7, s7
                  sltu         a1, tp, s6
                  auipc        t3, 140766
                  fsgnjn.s     fa0, fs1, ft11
                  div          t4, ra, s6
                  slti         a0, s5, 1442
                  fcvt.s.wu    fs11, s9, rne
                  lui          a1, 433927
                  fcvt.s.wu    fs1, t6, rne
                  slti         s8, s8, -1422
                  or           s6, t1, t6
                  divu         s7, t3, s7
                  div          a3, t5, t6
                  sll          s9, s0, a6
                  sltu         gp, a5, t3
                  sll          a1, a7, t2
                  xori         a7, t4, 1997
                  fsgnjn.s     ft8, fs9, fs1
                  fsgnjn.s     fs7, ft9, ft11
                  xori         t3, t1, 349
                  rem          a7, t4, t0
                  and          a5, s4, a4
                  ori          s11, a1, 1730
                  ori          t3, s0, -1339
                  fdiv.s       ft8, ft10, ft3
                  mulh         a3, s6, t3
                  sub          s7, s8, a5
                  and          s7, t6, t2
                  div          zero, a4, s0
                  fmul.s       fa7, fs11, fs2, rdn
                  fsgnjx.s     fa4, ft1, ft2
                  remu         a6, gp, t4
                  flt.s        zero, ft7, fs9
                  slti         s1, tp, -431
                  fdiv.s       fs4, fs7, fs1, rmm
                  auipc        s11, 595203
                  sltiu        s2, t2, -1160
                  fdiv.s       fs11, ft5, ft9, rdn
                  divu         a2, s6, s4
                  fmv.w.x      fa2, s9
                  fmin.s       ft7, ft3, ft2
                  fmv.x.w      s4, fa0
                  fcvt.w.s     a4, ft8
                  nop
                  remu         a2, s8, s10
                  mulh         a3, s8, t6
                  fcvt.wu.s    s6, fs7
                  lui          s2, 643862
                  fmv.w.x      ft7, s8
                  slt          a7, gp, a7
                  fsgnjn.s     ft9, ft7, fs11
                  slti         a5, s8, 774
                  sltiu        s6, s3, 1199
                  fclass.s     a5, ft2
                  ori          t2, s9, 939
                  mul          s8, t4, s11
                  sll          sp, a1, t3
                  xori         t6, s7, -436
                  fsgnjn.s     fs3, fa1, fs2
                  feq.s        s10, fa5, fs0
                  divu         a6, t6, s1
                  and          a3, s9, s3
                  fmax.s       fs0, ft0, fa5
                  divu         a7, s6, s3
                  fcvt.s.wu    fs6, s11
                  or           a2, s1, t6
                  sll          s6, t3, t2
                  divu         t2, a5, t2
                  srai         a0, a5, 15
                  sub          zero, s9, t2
                  fsgnjn.s     ft9, ft8, ft8
                  fmax.s       fs10, fs11, ft0
                  and          gp, gp, s1
                  slt          s6, a5, s0
                  fmin.s       fa0, ft1, fa2
                  sltiu        s2, s10, -1363
                  sll          a3, a2, a5
                  fsgnjx.s     fa3, fs8, fs2
                  remu         a6, t6, a5
                  ori          t3, s10, -1219
                  srl          a7, s9, t6
                  fsqrt.s      fs9, fs9
                  fle.s        a7, fs11, fs7
                  slti         t2, zero, -1933
                  srli         a1, s3, 11
                  fle.s        a6, fs1, fs11
                  slli         s4, a6, 3
                  nop
                  srli         zero, s10, 3
                  mulhsu       t6, s8, a4
                  add          s11, tp, gp
                  fsub.s       ft4, ft9, ft7, rtz
                  xor          a6, t6, a7
                  slt          s11, t2, s5
                  sltiu        t3, a1, 2024
                  divu         a7, gp, a2
                  fclass.s     t3, fa1
                  fsub.s       ft1, ft11, ft8, rup
                  fcvt.s.w     fa6, a0
                  fsub.s       ft7, ft10, ft1
                  fle.s        t3, ft11, fa5
                  addi         sp, t6, 1325
                  fadd.s       ft10, fa1, ft3, rmm
                  fsgnj.s      fa6, fa4, fa5
                  fmv.x.w      gp, ft1
                  mulhu        s5, a7, t2
                  fcvt.s.w     fs5, t4
                  feq.s        tp, ft11, fa2
                  fcvt.s.wu    fs1, s8
                  ori          s7, t0, -1706
                  sltu         s4, gp, s2
                  fmin.s       fs9, fa3, ft11
                  div          s10, a2, t0
                  mul          gp, a2, s0
                  fmin.s       fs3, fs10, fs1
                  srai         t6, gp, 7
                  fsqrt.s      fa3, fs3, rup
                  lui          zero, 848966
                  fcvt.wu.s    s0, fa3, rmm
                  fadd.s       ft11, fa2, fs11
                  nop
                  sltu         s4, t0, t4
                  feq.s        s0, fs8, ft6
                  fclass.s     gp, fs5
                  add          t2, s11, ra
                  and          s5, a1, s10
                  fclass.s     s0, fa5
                  fclass.s     a4, ft5
                  slli         s6, t0, 2
                  mulhsu       s8, s8, a3
                  fmin.s       fa4, ft7, fs9
                  fsqrt.s      ft1, ft9
                  flt.s        s0, ft8, fs1
                  addi         zero, a5, -728
                  slti         s4, t3, -56
                  div          s11, a2, t4
                  fle.s        s5, fs7, fa3
                  remu         s4, t4, s5
                  srl          tp, s8, a5
                  fsqrt.s      ft1, ft9
                  fsqrt.s      fa4, fs5, rtz
                  srai         s3, s6, 28
                  rem          s3, t1, a1
                  sub          s8, s9, s5
                  feq.s        sp, fs9, ft4
                  flt.s        t4, fa3, fs8
                  and          t6, a2, ra
                  fcvt.s.w     ft8, s7, rtz
                  mulhu        s11, a2, t2
                  fcvt.wu.s    a6, fs9
                  div          s0, s10, a3
                  add          s4, a7, s8
                  xor          s9, s11, s4
                  fsqrt.s      ft8, fs3, rne
                  xor          s9, gp, a1
                  xori         zero, sp, -1602
                  fcvt.s.wu    ft4, s10, rup
                  fcvt.wu.s    s10, ft8, rdn
                  srai         s7, s3, 9
                  srli         s5, s3, 28
                  fsgnj.s      fa5, ft0, ft9
                  flt.s        t3, fs7, fs8
                  mulh         a1, a5, t4
                  and          s2, a1, s7
                  rem          s6, t2, a6
                  ori          s2, t4, -1316
                  slti         s10, ra, 959
                  fmin.s       fs9, fs10, fs0
                  divu         s9, tp, s5
                  nop
                  srli         a0, sp, 11
                  andi         tp, s5, 1290
                  mul          a2, s4, s10
                  fcvt.w.s     zero, fs7
                  srai         a0, ra, 30
                  sltu         s8, t2, a1
                  fdiv.s       fs4, fa2, ft4, rne
                  div          s5, sp, s11
                  slt          s7, tp, t0
                  fsgnjx.s     fs4, fs8, ft1
                  fsub.s       fs7, fa7, ft5, rdn
                  sll          s8, a5, a6
                  div          a2, a5, a4
                  srl          a3, s5, t1
                  addi         a1, s0, -1934
                  fcvt.s.w     fs1, s3, rdn
                  sll          t4, s9, t3
                  fsgnjx.s     fs0, fa6, fs1
                  and          s0, sp, a0
                  rem          ra, a4, s1
                  xor          s2, a5, a2
                  fsub.s       ft3, ft8, ft10, rup
                  fsgnjx.s     fs5, fs4, ft1
                  srai         s6, s1, 2
                  fdiv.s       fs3, fs2, fs4
                  fsgnj.s      fs11, ft11, ft3
                  sub          a7, t4, gp
                  ori          s11, a4, 1482
                  mulhsu       a3, t5, t6
                  feq.s        s4, fs4, fs8
                  addi         sp, s10, 708
                  xori         a5, tp, 713
                  divu         s7, s3, s2
                  or           a3, s2, s7
                  fmv.x.w      s1, fa6
                  auipc        s6, 608326
                  auipc        a7, 46615
                  srai         s5, a6, 30
                  slti         t6, a1, 1710
                  fmv.w.x      fa3, a4
                  slli         s6, zero, 17
                  feq.s        a4, fa3, fs9
                  flt.s        s5, ft7, fa4
                  xori         s6, gp, 1377
                  lui          s10, 793266
                  lui          s7, 1039323
                  fsgnj.s      ft8, fa2, fa6
                  fcvt.s.w     fs3, s4, rdn
                  fcvt.wu.s    sp, ft6
                  fsub.s       fa5, fs8, fs9
                  fcvt.s.wu    fs7, s10
                  fle.s        a1, fa7, fa4
                  div          s8, s3, a3
                  srli         s4, s3, 16
                  fcvt.s.w     fs3, t4
                  srai         t3, a4, 3
                  fcvt.w.s     gp, fs1, rne
                  auipc        a3, 45310
                  srl          s9, s2, a0
                  feq.s        tp, fs10, fa1
                  fdiv.s       ft10, fa0, fs1, rtz
                  slli         t4, s2, 10
                  lui          a1, 407184
                  fle.s        s11, fs2, ft4
                  addi         s0, s4, -115
                  xori         s6, s9, 644
                  fcvt.s.w     fs7, ra
                  and          a3, a7, a5
                  sll          s10, s9, s8
                  fsgnjn.s     fs8, fs3, ft4
                  mul          t6, a6, a7
                  nop
                  sltiu        s11, s5, 1902
                  fmv.x.w      s0, fs9
                  divu         a5, s8, s10
                  slli         s5, a4, 22
                  andi         sp, t3, -631
                  slti         a3, a0, 1882
                  and          ra, gp, sp
                  addi         tp, s6, -80
                  fle.s        ra, fs5, fs6
                  fmax.s       ft1, fa6, fs3
                  nop
                  fsqrt.s      fs10, ft0, rup
                  fle.s        a5, fs8, fs9
                  fsqrt.s      ft2, fs0
                  fmax.s       ft10, ft11, fs3
                  srli         t3, tp, 24
                  fmv.w.x      ft3, a1
                  mul          a4, a3, s4
                  auipc        a0, 636550
                  fclass.s     a3, ft1
                  fsgnjx.s     fa1, fs10, fa2
                  sll          s5, a5, s1
                  xor          t6, zero, s5
                  fcvt.s.w     fs0, s5
                  sub          a5, a6, a3
                  sll          a4, a5, a1
                  fadd.s       fs4, ft7, fs11, rmm
                  fsgnjn.s     fs2, fa3, ft8
                  xor          a3, gp, zero
                  fmul.s       fs1, ft8, fs1, rne
                  lui          t3, 902015
                  srai         s11, s6, 8
                  and          tp, s0, s9
                  sltiu        s2, t3, 702
                  mulhsu       a2, a3, s3
                  xor          s7, s6, tp
                  srai         a0, s0, 3
                  fmv.w.x      ft11, ra
                  fadd.s       fa5, fa6, ft3, rup
                  srai         a1, a3, 0
                  mul          s11, t1, t6
                  flt.s        s1, fs9, fa3
                  fmv.w.x      ft9, s4
                  fmax.s       ft4, ft2, fs10
                  slt          a2, gp, t1
                  fcvt.s.w     fa3, t5
                  or           s10, s9, s8
                  add          ra, t5, a5
                  srl          ra, zero, t3
                  fdiv.s       fs5, fa0, ft11, rmm
                  xor          t6, s6, s1
                  mulh         s3, a1, t6
                  fmv.w.x      ft0, ra
                  andi         s0, t6, -1802
                  fsqrt.s      fs4, ft11
                  divu         a0, gp, s8
                  sltiu        gp, s4, 82
                  mulhsu       a6, s7, s4
                  fcvt.s.wu    ft3, a0, rmm
                  mulh         a0, s9, s0
                  fdiv.s       fa7, ft10, ft9, rmm
                  fcvt.wu.s    tp, ft0, rne
                  fsgnjx.s     ft6, ft1, fs9
                  rem          t3, a6, a5
                  fmul.s       fa7, fs6, fs5, rtz
                  sra          a2, a0, a4
                  divu         zero, a4, t5
                  xor          s8, a5, s2
                  div          t3, t6, t6
                  div          a3, t4, a2
                  rem          a5, s6, t1
                  add          s3, s3, t2
                  fmv.x.w      t4, ft7
                  slt          a0, t6, a5
                  flt.s        a7, fa4, fa5
                  nop
                  or           s9, s7, t3
                  fle.s        tp, fs10, ft6
                  fsgnjx.s     fs1, ft8, fs3
                  fcvt.w.s     a5, fs0
                  sltiu        a4, sp, 942
                  fcvt.w.s     s6, fa2, rne
                  srai         s5, t0, 23
                  add          a4, s0, t1
                  flt.s        s2, fa4, ft10
                  mulhsu       s9, s10, a7
                  remu         s7, s3, s3
                  srai         a4, a2, 28
                  feq.s        s7, fs6, fs1
                  mulhsu       a6, s9, s11
                  nop
                  mulhsu       a2, sp, t2
                  fle.s        t2, fa3, fa2
                  slti         a5, t5, 1295
                  nop
                  ori          s2, t1, -1896
                  andi         s9, s4, 716
                  fcvt.s.w     fs2, t1, rtz
                  div          s8, t3, zero
                  fsqrt.s      ft8, fs10
                  div          a6, zero, s10
                  sltiu        t2, s4, -800
                  fsqrt.s      ft3, fa6, rne
                  fcvt.s.w     fa2, a5
                  sltiu        s1, a5, 1276
                  rem          a5, s1, s9
                  slti         s4, a7, 1785
                  div          t2, s10, a1
                  feq.s        s10, fs4, ft3
                  mulhu        a3, s11, s8
                  fsgnjn.s     fa6, ft11, ft10
                  fcvt.s.wu    fa7, s4, rmm
                  fsub.s       ft2, ft0, ft0, rmm
                  feq.s        s2, fs1, ft1
                  fle.s        tp, fa3, fs9
                  feq.s        s2, fs11, fa2
                  fsgnjx.s     ft5, ft8, fs10
                  auipc        a7, 1030839
                  lui          a6, 449240
                  nop
                  fle.s        a4, fa0, fs3
                  sub          s9, zero, t1
                  fsub.s       fs10, fs6, fs2
                  fle.s        tp, fs10, ft5
                  fsgnjx.s     fs7, ft2, fs5
                  fmul.s       fa2, fs3, fs1, rmm
                  fclass.s     t2, fa5
                  fcvt.wu.s    a3, fa7, rtz
                  fcvt.wu.s    a3, ft10, rmm
                  add          s10, s9, s6
                  slt          s5, a4, s7
                  fmax.s       ft0, fa1, ft3
                  or           a7, s7, s6
                  xori         gp, t4, -1162
                  fmv.w.x      fs8, gp
                  mul          s4, a3, s2
                  add          t6, gp, a2
                  addi         s0, a4, -961
                  or           a5, t2, s2
                  fsgnjn.s     fs1, fs6, fa2
                  auipc        s0, 533082
                  fsub.s       fa7, ft11, ft3
                  fadd.s       fs8, fs8, ft9
                  nop
                  fsgnj.s      ft5, ft9, ft7
                  fcvt.s.w     fa3, a1, rtz
                  nop
                  fmv.w.x      ft8, s2
                  fdiv.s       fa5, fs3, fs9, rdn
                  fmv.w.x      fa5, s2
                  fsgnjx.s     ft10, ft10, fs7
                  xori         s10, s11, 1573
                  lui          s4, 540859
                  lui          a3, 611490
                  fclass.s     s9, fs5
                  fsub.s       ft3, fs11, fs7, rtz
                  fmin.s       ft7, fs10, fa5
                  mulh         s7, s3, t3
                  remu         ra, s10, gp
                  srli         t3, a3, 26
                  fle.s        s11, ft2, ft2
                  slti         a0, a5, 654
                  add          s6, ra, s7
                  sltiu        a6, s4, 835
                  rem          s3, s7, zero
                  slti         t3, s3, 998
                  fsub.s       fa7, fs3, ft0, rne
                  slti         s3, a0, -110
                  sra          s4, s6, gp
                  fmv.x.w      s7, fs4
                  fcvt.wu.s    a7, fs7, rtz
                  sub          s8, s3, t4
                  fsub.s       fs3, fs5, ft1, rmm
                  ori          s1, s8, 406
                  fclass.s     t3, fa7
                  feq.s        s5, ft7, ft8
                  mulhsu       s2, s2, s10
                  mulhu        s9, s3, s11
                  mulhsu       a7, tp, s4
                  add          a5, zero, tp
                  slli         s3, a3, 16
                  flt.s        s11, ft4, fa6
                  fcvt.w.s     s2, fs4, rne
                  fsgnjn.s     fa5, fa0, fs11
                  fsub.s       ft10, fa1, fa6
                  fadd.s       fa0, fa4, ft9
                  fclass.s     a0, fs1
                  sra          zero, t2, gp
                  or           a3, t6, s4
                  slli         a2, a6, 2
                  fmv.x.w      a2, ft8
                  fmax.s       ft4, fs9, ft1
                  srli         t2, zero, 16
                  sra          s4, s6, t0
                  slli         a0, t3, 8
                  fmul.s       fs9, ft8, ft6
                  feq.s        s4, fa2, fs9
                  fsgnj.s      ft1, ft1, fs5
                  srli         s7, s8, 1
                  srli         s4, t4, 2
                  lui          s0, 999599
                  fcvt.s.wu    fs11, s1
                  mul          s8, s5, s2
                  or           a7, s6, s3
                  srl          s11, t1, s7
                  sub          sp, ra, s7
                  fmax.s       fs9, ft2, fs1
                  fsgnjn.s     fa0, fs3, fs4
                  fsqrt.s      ft3, ft8, rdn
                  add          gp, gp, s5
                  feq.s        s11, fs3, ft11
                  sltu         t4, a2, s10
                  fmv.w.x      fs9, s0
                  sra          a2, a1, a7
                  srli         s6, s1, 7
                  mul          a6, tp, s6
                  fdiv.s       fa1, ft0, fs5
                  sll          t4, a5, a4
                  fcvt.s.wu    ft3, t2, rup
                  fsgnj.s      fs11, ft5, fa1
                  fle.s        a7, fs6, fs7
                  mulh         t4, s8, t3
                  fcvt.w.s     s6, ft3, rup
                  fmv.w.x      ft8, gp
                  mulh         s1, a1, t2
                  nop
                  mulh         s7, gp, s8
                  sltiu        s3, t6, 729
                  sltu         s2, t3, s2
                  fmin.s       fs4, ft9, ft3
                  fcvt.s.w     ft5, s2, rmm
                  fle.s        s10, fa4, fa1
                  ori          a7, s9, 348
                  or           s5, s6, s8
                  lui          s8, 368932
                  fmin.s       fs2, ft5, fa1
                  fsub.s       fs0, fs6, fs10
                  fmax.s       ft6, fs11, ft11
                  srl          sp, ra, a7
                  fmin.s       fs7, fa6, ft8
                  slt          s0, a1, sp
                  fsgnjn.s     ft4, fs4, ft3
                  sra          a1, a7, s8
                  mul          a5, t3, sp
                  slt          a7, a0, tp
                  ori          a7, sp, -314
                  fadd.s       fa4, fs0, fs2, rup
                  mulhu        t3, s6, t2
                  fmax.s       fs5, fs9, fs2
                  fmv.w.x      ft2, s7
                  remu         a4, a4, sp
                  sltiu        t3, gp, 624
                  fmv.w.x      ft8, s8
                  andi         a7, a1, -626
                  xor          a2, sp, a1
                  slli         s6, a7, 18
                  fcvt.s.wu    ft6, ra, rdn
                  fsgnjx.s     fa7, fs9, fs10
                  srli         s8, s6, 15
                  fcvt.wu.s    s5, fs4
                  rem          a1, sp, s1
                  fmax.s       ft10, ft8, fa0
                  auipc        a7, 619828
                  slt          s10, tp, a6
                  flt.s        ra, fs6, ft6
                  ori          s3, s5, 236
                  div          s5, s7, s10
                  lui          s9, 947229
                  lui          s2, 571056
                  sub          s11, a3, a3
                  fmax.s       fs3, ft0, fs9
                  srl          a0, sp, t2
                  fsub.s       fa3, fs6, fs10, rmm
                  auipc        a3, 417726
                  remu         sp, zero, a2
                  mul          a0, s8, t0
                  add          s1, a1, a3
                  fle.s        s0, fs7, ft11
                  fdiv.s       fs6, fs4, fs9, rne
                  fclass.s     s7, fa7
                  fcvt.w.s     gp, fs6
                  fclass.s     sp, fa6
                  sll          a4, s1, a0
                  sub          ra, t5, s7
                  fsgnjn.s     fs9, ft1, ft7
                  mulhsu       s11, a0, t5
                  srl          zero, s4, t2
                  divu         s1, s7, s9
                  slt          a3, s8, s6
                  lui          s9, 648676
                  slti         s2, a5, 87
                  slti         t6, s3, 705
                  fmax.s       fs2, ft0, fa3
                  and          a0, ra, a7
                  nop
                  fsub.s       ft3, ft10, fs7, rtz
                  fmin.s       ft10, ft1, fs3
                  fdiv.s       fa7, fa1, fa4
                  nop
                  fle.s        ra, ft8, fs9
                  srli         s2, a2, 22
                  ori          s10, a0, 1185
                  fle.s        t2, fs2, fa3
                  slt          gp, s5, s3
                  xori         s9, a5, 1648
                  srl          t3, ra, a4
                  xori         s3, t2, -23
                  fsgnj.s      fa0, fs5, fs5
                  fmv.w.x      fa1, s6
                  fmv.w.x      fa4, s0
                  ori          s9, a7, -1667
                  remu         ra, t3, t0
                  lui          zero, 150010
                  slti         s6, gp, -2026
                  fsub.s       fs1, fa5, ft1, rne
                  fdiv.s       ft4, ft11, ft6
                  nop
                  fmul.s       fa6, fs8, ft11
                  andi         a4, sp, 900
                  fsub.s       fs3, fa5, fs2, rmm
                  fsgnjx.s     fs3, ft7, ft4
                  fsgnjx.s     ft7, fs3, fa0
                  fsgnj.s      fs8, fa5, ft10
                  auipc        sp, 909022
                  mulhu        s1, gp, a6
                  fsgnjx.s     ft10, ft5, ft4
                  add          a2, s10, s8
                  sltiu        s9, t1, -718
                  slti         ra, s10, 1822
                  div          a1, t6, s11
                  div          gp, a5, s1
                  sll          t2, s5, a0
                  andi         a5, t5, -1718
                  sra          a4, s8, gp
                  feq.s        s4, fa4, ft5
                  sub          s5, a7, t1
                  slli         s5, tp, 12
                  fcvt.w.s     s1, fs5, rne
                  lui          a0, 481210
                  fcvt.s.w     fs5, s5
                  xor          tp, t4, a5
                  sub          s9, s11, sp
                  flt.s        sp, fa5, ft4
                  sltu         t4, ra, a5
                  add          s11, t5, s7
                  fdiv.s       fa3, ft9, fs1
                  fadd.s       fs1, fa7, fs1, rne
                  fmin.s       fs7, ft10, fa1
                  mulh         ra, s9, s10
                  sltu         t6, zero, ra
                  flt.s        s1, ft4, fs2
                  and          s9, t4, t3
                  srl          t4, a3, tp
                  mulhu        s9, a3, t6
                  srli         t2, t6, 12
                  or           a0, a5, a0
                  lui          gp, 260530
                  srai         t4, t6, 3
                  sra          s5, a1, s1
                  slti         s2, ra, 1141
                  fcvt.s.w     fa7, ra
                  mul          s11, a3, a5
                  fcvt.s.wu    fa7, t5
                  srl          s6, a4, t6
                  fmv.x.w      a2, ft10
                  andi         a0, s10, -1111
                  srl          a5, a0, ra
                  nop
                  slt          t4, sp, t6
                  mulh         a6, s6, s2
                  lui          tp, 144187
                  srl          s10, t3, s1
                  fcvt.wu.s    a2, fs7, rmm
                  fadd.s       fa2, fs7, fa3, rtz
                  mulhu        a7, t2, s9
                  fsgnjn.s     fa0, ft8, fa5
                  mulhu        s8, a1, s4
                  fcvt.s.w     fs1, s1, rtz
                  rem          t6, s9, s10
                  fcvt.w.s     t3, ft4
                  sltiu        a6, gp, 223
                  slt          s11, t6, gp
                  srl          s4, s6, a3
                  mul          s3, a3, t2
                  slti         t6, a5, -693
                  mulh         t4, t3, ra
                  flt.s        a5, fa6, fa3
                  nop
                  auipc        a1, 853624
                  fle.s        sp, ft4, ft0
                  fcvt.s.wu    ft4, s10
                  andi         a4, s4, -897
                  feq.s        s11, fa2, fs8
                  sltiu        s10, gp, -800
                  fcvt.wu.s    a2, fs8, rtz
                  slt          t4, t5, s0
                  remu         a2, s2, t4
                  remu         tp, t3, t5
                  xori         s1, s2, 1171
                  andi         a7, tp, 1803
                  slt          s9, a2, t6
                  fmv.w.x      ft7, s1
                  mulhsu       ra, s10, t3
                  fcvt.wu.s    a6, ft6, rne
                  xor          ra, tp, s2
                  rem          gp, a4, s7
                  mulhsu       s1, s10, ra
                  and          s6, a3, s4
                  divu         t3, a1, a7
                  slti         s10, a3, -998
                  fcvt.s.wu    fs11, zero, rdn
                  xor          a1, s10, a3
                  fle.s        a4, ft2, ft6
                  fcvt.s.w     ft11, s0, rtz
                  fsub.s       ft7, fa6, fs3, rup
                  fcvt.w.s     a7, fs5, rmm
                  sra          a5, tp, zero
                  sltu         s3, s1, s2
                  mulh         a6, s10, tp
                  fsgnj.s      ft7, ft4, fa3
                  feq.s        t3, fs5, ft10
                  fclass.s     s9, fa7
                  or           gp, a3, t0
                  sub          a2, zero, s2
                  fsgnj.s      fa7, fs7, fa7
                  slt          s11, s1, s4
                  slli         s7, s5, 17
                  fmv.x.w      s8, ft5
                  xor          s8, s1, ra
                  sub          a3, s4, s11
                  lui          s7, 1017712
                  sltu         t2, a1, a0
                  sub          s6, s10, t1
                  auipc        sp, 950641
                  slt          s1, t2, s3
                  feq.s        t4, fs1, ft1
                  and          a7, t2, a3
                  feq.s        a5, ft8, fa5
                  remu         s4, t0, t2
                  sll          s3, t6, t1
                  mul          tp, t1, a4
                  sll          t4, a3, s6
                  fclass.s     s6, fa7
                  xor          t6, s11, a2
                  nop
                  slli         s6, s1, 29
                  mulh         a0, s11, a4
                  divu         s6, a5, a6
                  addi         s7, t4, 10
                  flt.s        s4, fa3, ft4
                  fle.s        t6, fa4, fs9
                  feq.s        a7, fa4, ft7
                  fcvt.s.w     fs2, s9
                  nop
                  ori          s0, s8, 1063
                  flt.s        zero, ft11, ft8
                  fdiv.s       fa3, fs0, fs2, rmm
                  mulh         s9, a6, s0
                  fmv.x.w      s6, fs10
                  slli         a1, a3, 19
                  xor          s9, a7, a1
                  fcvt.s.wu    fa2, s9, rne
                  sll          t2, s8, a7
                  or           s9, s3, zero
                  flt.s        t6, fs4, ft5
                  fsgnjx.s     ft0, ft4, fs2
                  srli         a2, t5, 29
                  ori          s5, a7, -1628
                  fsub.s       ft7, ft3, fa1
                  srli         t4, ra, 9
                  fle.s        s1, ft1, ft10
                  sltiu        a5, s1, 1762
                  slti         s1, t0, -868
                  sltiu        s3, ra, -49
                  sltiu        ra, s9, -1135
                  sra          s10, a1, a2
                  sra          s0, sp, a3
                  divu         s5, s11, s9
                  fadd.s       fa0, ft8, ft2, rmm
                  slti         s7, s5, -452
                  fcvt.wu.s    sp, fs8
                  xor          a3, t4, t2
                  fclass.s     gp, fs10
                  fmin.s       ft4, fs6, fs7
                  add          a0, s7, s7
                  fsgnjx.s     fa3, fs11, ft8
                  fmv.x.w      s7, ft3
                  fsgnjx.s     fa5, fa3, fs2
                  slli         a0, a2, 0
                  srli         a6, tp, 25
                  fle.s        tp, fa2, fa0
                  fcvt.w.s     a6, fa6
                  auipc        a7, 204265
                  fcvt.s.wu    fa5, ra, rmm
                  addi         ra, t6, -1529
                  fcvt.wu.s    s5, fs8, rmm
                  fmv.w.x      fa5, gp
                  slt          ra, a7, s7
                  remu         t6, s1, s11
                  feq.s        a6, fs5, fs3
                  div          s0, s2, sp
                  xori         tp, a4, -1910
                  fcvt.wu.s    a1, fs6
                  sub          s2, s1, a3
                  fclass.s     a7, ft4
                  fmv.x.w      s3, fs10
                  fsgnj.s      fs0, ft5, fa6
                  fcvt.s.w     fa5, t3
                  fcvt.wu.s    t6, ft8
                  slli         a2, t5, 15
                  and          a0, s1, gp
                  fcvt.w.s     a4, fs1
                  sltu         a0, s1, s8
                  fcvt.s.w     ft7, s8, rdn
                  srl          a3, t3, s0
                  slti         s9, gp, -1300
                  fmv.w.x      fs5, a0
                  rem          s5, s9, s0
                  addi         t2, t4, 1760
                  xori         a7, s2, 1874
                  fmin.s       fs9, fs0, fs5
                  fsgnjx.s     ft7, ft11, fa6
                  fle.s        s0, fa0, ft4
                  slti         t4, t3, -105
                  mulh         s7, a3, s5
                  add          s1, t6, a7
                  slti         s2, s5, -1125
                  sra          s11, t6, s11
                  fcvt.w.s     t2, fs2, rmm
                  or           a4, t4, a2
                  xor          s1, t2, zero
                  fadd.s       fa3, ft1, ft7, rmm
                  fmax.s       fa5, ft5, ft11
                  fcvt.wu.s    s1, ft10, rmm
                  fmv.w.x      ft10, a3
                  mulhsu       a6, t1, a0
                  fle.s        s9, fa5, fa7
                  mulh         s3, s0, zero
                  fadd.s       fa4, fa5, ft9
                  div          s7, zero, s4
                  fmv.x.w      a4, fs9
                  rem          s11, s3, t3
                  div          s8, gp, t2
                  sll          zero, ra, s8
                  sltiu        t3, s1, 553
                  ori          s8, s3, 1260
                  nop
                  auipc        t6, 294496
                  fmv.x.w      s3, ft1
                  sltu         s4, s7, s3
                  slt          s11, s8, s4
                  ori          tp, ra, -1553
                  xor          a6, s3, t6
                  fadd.s       fa1, ft6, ft4
                  lui          s8, 563545
                  fsqrt.s      fs10, fa0
                  divu         a1, t4, a1
                  fsgnj.s      fs1, fa2, fs2
                  mul          s5, t4, t1
                  div          a1, t5, ra
                  and          zero, s0, a2
                  slli         t2, s9, 15
                  slt          s6, t5, s1
                  andi         a3, s10, -1683
                  sltu         sp, sp, t0
                  mulhsu       t4, t4, s3
                  and          a4, s6, a3
                  fdiv.s       ft1, ft5, ft9, rdn
                  fsqrt.s      ft3, ft11
                  sll          t3, s7, s8
                  remu         t4, tp, a7
                  fclass.s     s1, ft8
                  add          a6, zero, t2
                  fmax.s       ft6, ft1, fa2
                  fcvt.s.w     fs3, t2, rmm
                  addi         gp, s2, -1714
                  srli         a2, s9, 11
                  mul          t6, s11, a6
                  lui          s11, 354716
                  fsgnj.s      ft9, fa4, fs0
                  fclass.s     tp, ft8
                  fcvt.w.s     t4, fa7
                  feq.s        s7, fs1, ft4
                  lui          s5, 131539
                  and          s5, t1, s3
                  mul          s8, s1, zero
                  andi         t6, s5, 2016
                  fsgnjn.s     fs4, fs3, fs9
                  mulh         s0, a7, t6
                  mulhu        gp, ra, t1
                  remu         a3, a6, a6
                  addi         a4, s10, 1072
                  rem          sp, s0, ra
                  fsgnjx.s     fs11, fa3, ft2
                  addi         s5, a4, -982
                  divu         s2, a3, t4
                  addi         s8, zero, 1603
                  divu         s10, s7, a2
                  nop
                  fmin.s       ft5, fa1, fa3
                  sub          a6, s2, t0
                  fmv.x.w      a1, fs4
                  ori          s11, t1, 384
                  fsgnjn.s     fs4, ft5, fs7
                  srli         a0, ra, 5
                  sub          s5, a5, a2
                  sll          tp, s5, t6
                  fcvt.wu.s    s5, ft0, rup
                  or           s7, a1, a3
                  fclass.s     a0, ft0
                  andi         s11, s1, 814
                  addi         a5, t0, -338
                  andi         s11, s6, -328
                  fdiv.s       fs9, fs10, fs5, rmm
                  nop
                  div          tp, t5, s2
                  srl          a1, s1, s6
                  fmv.w.x      ft7, s10
                  addi         s11, zero, -496
                  and          a7, a5, s10
                  srai         s8, a0, 28
                  fmv.x.w      a3, fa4
                  feq.s        s0, fs10, fs0
                  mulhu        sp, t2, a6
                  sltu         a4, zero, a1
                  fadd.s       ft3, fa4, ft8, rdn
                  xor          a3, a0, s4
                  slt          s2, s4, s0
                  addi         gp, s8, 1332
                  xor          a5, s11, tp
                  mulhsu       s8, t2, s2
                  fsgnjn.s     fs9, fa6, fs10
                  and          ra, s4, zero
                  addi         s5, t6, 70
                  div          sp, t4, s11
                  ori          ra, s9, 1254
                  fsgnj.s      ft7, ft4, fs3
                  xor          s3, s11, t0
                  fcvt.wu.s    t4, fs9, rdn
                  fsgnj.s      fs2, fs4, fs0
                  fsgnjn.s     fa6, fs4, fs4
                  fclass.s     gp, fs5
                  srl          s4, s3, a5
                  fcvt.w.s     s5, fs2
                  div          a6, s5, s7
                  fadd.s       fs2, ft8, ft7, rmm
                  andi         t3, a5, 588
                  srli         s6, zero, 4
                  slli         t2, t0, 18
                  lui          a6, 321309
                  fcvt.s.wu    ft4, a4, rmm
                  nop
                  fmin.s       ft11, ft11, fs6
                  sll          s6, t2, ra
                  flt.s        s7, fs11, ft6
                  andi         t3, t3, -1514
                  fmax.s       fs11, fs5, ft6
                  fdiv.s       fa1, ft8, fa6, rdn
                  fsqrt.s      ft11, fa1
                  fsub.s       fs1, fa2, fs11
                  sltu         a3, a1, s5
                  slti         a2, a2, 1184
                  sub          a0, a2, a5
                  fclass.s     a6, fa1
                  fcvt.s.wu    ft1, zero, rdn
                  fsgnjn.s     ft10, fs5, fs2
                  sltiu        s8, a3, -754
                  fsgnjn.s     fa7, fa3, fa7
                  slt          a2, gp, a7
                  slli         s1, s9, 13
                  sll          s6, s1, t5
                  srl          sp, a2, a4
                  sltiu        a6, s10, 1859
                  nop
                  ori          a1, s0, 1546
                  fmax.s       fs7, fa1, fa3
                  mulhsu       s8, t1, sp
                  srl          s8, a1, t2
                  fle.s        t6, ft5, ft7
                  srl          s7, ra, a2
                  fmax.s       fa1, ft6, fs6
                  sub          sp, ra, s1
                  fdiv.s       fs0, fs7, fa3
                  fsgnj.s      fa3, fa1, ft3
                  xori         s1, a4, -434
                  feq.s        t4, ft5, fs0
                  nop
                  nop
                  or           zero, s2, a1
                  or           a4, t4, t4
                  fadd.s       fs8, fs3, ft8
                  fcvt.wu.s    a1, fs5, rup
                  div          s11, s3, a6
                  fmv.x.w      t3, fs1
                  fmax.s       ft5, ft8, fa7
                  add          a6, a6, s2
                  fcvt.s.wu    ft7, s10
                  fsub.s       ft9, ft4, ft10, rtz
                  sub          sp, a6, zero
                  fadd.s       ft5, ft4, ft1, rdn
                  and          s4, s4, gp
                  fmin.s       fa1, ft4, fa5
                  sub          s11, a4, s6
                  fcvt.s.wu    ft2, s8
                  rem          sp, s6, s7
                  sll          t6, t1, gp
                  fsqrt.s      fa6, ft0
                  fsgnjx.s     fa7, fs0, ft8
                  fsqrt.s      ft10, ft10
                  slt          s1, s2, t2
                  fcvt.w.s     tp, fs6, rdn
                  fsgnjx.s     ft9, fa2, ft4
                  sltu         s5, a1, s11
                  sra          s9, a5, a0
                  fcvt.s.w     fa3, t0, rmm
                  and          s2, sp, s3
                  lui          a7, 493739
                  fmax.s       ft2, fs11, fa3
                  or           t6, t1, a2
                  divu         t4, a2, s10
                  rem          a7, t2, s9
                  and          gp, t4, t0
                  fcvt.s.wu    ft10, t4, rup
                  fadd.s       ft7, fs1, ft9
                  srl          gp, t2, s0
                  fcvt.s.w     fs0, s11
                  xor          ra, gp, s8
                  srli         t6, a2, 27
                  ori          ra, zero, -1127
                  slt          s2, s8, ra
                  mul          t2, a4, s7
                  flt.s        s10, ft3, fs2
                  mulh         t2, s0, s2
                  fcvt.wu.s    a7, ft4
                  feq.s        s11, ft2, ft7
                  fadd.s       fs1, fs5, ft3, rtz
                  mulhu        a2, t6, a4
                  andi         a5, zero, -464
                  sub          a5, t2, a4
                  flt.s        s2, ft5, ft4
                  fsgnjn.s     fs3, fa5, fa1
                  fsgnj.s      fa4, ft5, fa7
                  add          s3, a3, t5
                  lui          s10, 745708
                  srl          s0, t6, t1
                  slli         a2, s6, 30
                  or           t3, s7, t3
                  div          s8, t3, a7
                  lui          t3, 582409
                  fcvt.wu.s    ra, fa7
                  flt.s        a6, fa4, ft7
                  fle.s        s6, ft7, ft8
                  sltiu        t6, a5, -1648
                  rem          t4, s2, a3
                  fle.s        a4, fs5, ft6
                  fsub.s       fs5, ft4, ft11
                  mulh         sp, s0, t1
                  mulhu        a5, s2, s1
                  auipc        a1, 131799
                  fcvt.s.w     fs8, t0
                  fclass.s     s11, fa0
                  slli         s8, a1, 2
                  sub          s6, s7, ra
                  mulhsu       a4, zero, ra
                  fcvt.s.wu    fs0, a7
                  mulhu        a3, a1, s9
                  andi         s6, a4, 1448
                  divu         t4, a3, s5
                  addi         zero, ra, -1775
                  addi         a7, s1, 2020
                  fclass.s     t4, ft9
                  sub          s0, s9, a6
                  divu         s7, ra, s9
                  fsqrt.s      ft8, fs8
                  xor          s7, s5, a7
                  slt          a6, gp, zero
                  addi         sp, s8, 1552
                  feq.s        a3, fs7, fa4
                  feq.s        s3, ft6, ft7
                  fmin.s       ft6, ft4, fs10
                  div          s3, sp, zero
                  sra          a4, s6, s5
                  srli         a1, s7, 25
                  fle.s        a3, fa7, ft8
                  sub          s9, s7, s11
                  fclass.s     a6, ft0
                  flt.s        a4, ft2, fs5
                  fmax.s       ft9, ft8, fs0
                  fdiv.s       fs7, ft0, ft8
                  lui          a4, 234397
                  slt          s1, s2, a6
                  lui          s7, 998131
                  sll          tp, a6, t0
                  feq.s        s2, fa5, fs10
                  flt.s        s4, ft10, fs4
                  fcvt.wu.s    s6, fa6, rtz
                  div          s10, s0, s5
                  and          t4, tp, s10
                  fcvt.wu.s    t4, fs3, rtz
                  andi         a4, gp, -319
                  fadd.s       fs0, fs0, fs2
                  fmin.s       fa3, ft8, ft3
                  fcvt.w.s     s1, ft10, rdn
                  xor          a5, s5, s5
                  fdiv.s       fa2, fa6, ft3
                  sll          t2, s6, gp
                  mulh         a4, a3, s1
                  feq.s        s0, ft4, fs4
                  fmul.s       fs4, ft1, ft3, rmm
                  or           ra, a1, s0
                  fmax.s       ft2, fs7, fa4
                  sll          s10, ra, s3
                  mul          a3, s11, zero
                  fmin.s       fs8, fs11, ft6
                  and          s1, s1, a2
                  srai         tp, a3, 30
                  auipc        a7, 836832
                  mul          s5, t2, s0
                  fmin.s       ft6, ft3, ft3
                  fdiv.s       fs5, fa2, ft7, rne
                  and          s3, zero, s2
                  mulhsu       t6, sp, a7
                  fmin.s       ft11, fa4, fa0
                  sra          a4, gp, a3
                  slli         t6, s5, 2
                  sub          a1, a3, ra
                  ori          s4, ra, 1200
                  xor          s7, a1, s3
                  fcvt.w.s     a4, fs6, rmm
                  addi         s4, s3, 734
                  div          a2, a4, ra
                  slt          t3, s8, t4
                  fmv.w.x      ft2, s3
                  fmax.s       ft1, ft3, fs0
                  slli         a6, s2, 23
                  remu         s8, s1, s5
                  fmul.s       ft4, ft10, ft5, rmm
                  addi         s2, s4, 1028
                  feq.s        gp, fa4, ft3
                  fsgnjn.s     fa1, fs10, fa1
                  srai         s6, s10, 26
                  fmin.s       ft4, fs2, ft4
                  and          a0, s11, a1
                  fcvt.w.s     t3, fa0, rmm
                  sub          s4, ra, a5
                  ori          a0, t2, 1456
                  slt          s4, t5, s11
                  or           s1, tp, s10
                  fmin.s       ft7, fs5, fs0
                  mulhu        s0, t3, ra
                  fsqrt.s      ft8, fs4
                  and          a3, t3, tp
                  xori         s7, t3, 1946
                  fcvt.s.w     fs2, s11
                  sltu         a5, zero, s11
                  andi         s4, t1, -1286
                  nop
                  fsub.s       fs9, fs3, ft6
                  fcvt.wu.s    s10, ft9, rtz
                  or           s2, t4, a3
                  divu         a5, s0, s4
                  fcvt.w.s     s11, fs2, rup
                  srl          s8, t5, t0
                  sltiu        s4, s2, -1976
                  sub          s11, a0, a5
                  nop
                  lui          s4, 1003688
                  mulhsu       s2, a1, ra
                  sltiu        zero, t4, -1768
                  fcvt.wu.s    s8, ft8
                  sll          s2, a7, gp
                  div          a7, sp, s8
                  fmax.s       fs6, fs3, ft9
                  slli         a4, s9, 31
                  fsqrt.s      fs0, fa2
                  fmul.s       fa0, fa5, fa2, rne
                  ori          s11, ra, 313
                  mulh         s11, s5, s10
                  fcvt.wu.s    s10, fs3
                  fsqrt.s      fs6, fs7, rup
                  nop
                  srai         a5, a6, 7
                  fdiv.s       ft8, fs6, fs0, rtz
                  fmin.s       fs11, fs5, ft6
                  and          t4, s8, a5
                  and          a7, s4, a7
                  fle.s        s6, fa4, fs7
                  sltiu        t2, a5, -127
                  flt.s        s7, fs3, fa3
                  fclass.s     s7, fs2
                  xori         s0, s8, -1017
                  fmv.w.x      fa7, s10
                  remu         s11, t4, t1
                  nop
                  xor          t3, t1, tp
                  sltu         s6, t2, tp
                  fclass.s     a0, fs8
                  fmv.x.w      a3, ft5
                  auipc        a2, 816740
                  mul          a6, t4, s11
                  sra          tp, t5, s7
                  auipc        s1, 156699
                  xori         t4, a5, -91
                  srli         a1, t2, 10
                  rem          s5, sp, ra
                  ori          tp, t2, -596
                  srli         sp, s7, 0
                  fle.s        s7, fa6, fs8
                  slli         s9, s7, 13
                  fmin.s       fs9, fs0, ft2
                  srai         s7, zero, 18
                  sra          s6, a3, a3
                  fcvt.w.s     s0, ft9, rdn
                  sra          t2, t6, a7
                  slt          zero, s8, s9
                  lui          a0, 640591
                  add          a3, t2, s3
                  flt.s        s2, ft8, ft1
                  sltu         t4, a1, a1
                  fmax.s       fs8, ft10, fs6
                  mulhsu       s9, s6, sp
                  fsqrt.s      ft3, fs9
                  rem          a6, t5, a0
                  fcvt.s.w     fs11, s3
                  fsgnj.s      ft8, fa2, ft9
                  sltu         a6, s2, t5
                  lui          a6, 1040187
                  fle.s        a0, fs7, fs2
                  fcvt.s.wu    ft5, s0, rup
                  fmv.w.x      fa1, s7
                  and          a6, a2, s11
                  fdiv.s       fa6, fs11, ft8
                  fcvt.w.s     a4, fa3, rne
                  srai         a1, t4, 2
                  fsqrt.s      fs1, fs0, rne
                  xor          s3, t2, t1
                  addi         t6, t6, -1392
                  addi         a0, a5, -758
                  srai         a1, tp, 21
                  mulh         a6, s3, t4
                  fmin.s       fs6, fa4, fs10
                  srli         a6, s6, 19
                  sll          a0, s11, sp
                  remu         tp, s0, t6
                  andi         s10, s6, 60
                  fsqrt.s      ft4, fa4, rup
                  fsgnjx.s     fs11, ft0, fs5
                  fadd.s       fs11, ft10, fa2
                  fcvt.w.s     s6, fa7
                  andi         tp, t5, -1721
                  div          s1, s10, sp
                  fsqrt.s      fa0, ft2
                  flt.s        t6, fa2, ft6
                  fmul.s       fs5, fa1, ft6
                  fle.s        s7, fs9, fs11
                  xor          t2, t3, a5
                  feq.s        t6, ft3, fs4
                  andi         gp, s11, 416
                  sra          s11, s3, s1
                  mulh         s9, s3, t6
                  fsgnjx.s     fa0, fa7, fa3
                  and          s5, s9, zero
                  fsgnjx.s     fa0, fs3, fs9
                  sub          s10, s7, a7
                  add          s0, s7, a4
                  fsgnj.s      fa2, fa1, fa0
                  fcvt.s.wu    ft4, s5
                  fcvt.s.wu    fs3, t5
                  sll          zero, a5, t0
                  fcvt.wu.s    a7, ft6
                  sra          a6, a7, t6
                  fsgnjx.s     ft4, ft11, fs4
                  fcvt.w.s     sp, ft4
                  fsgnjx.s     fa4, ft6, fa1
                  fle.s        s8, fs6, ft4
                  addi         a3, a1, -352
                  fdiv.s       fs4, fs0, ft8
                  sll          a2, s11, a0
                  sltiu        a5, a6, 99
                  fsgnj.s      fs6, ft5, fs0
                  fcvt.s.w     fs3, s7, rtz
                  sltu         s2, a1, t6
                  mulh         s3, a3, s0
                  div          a2, a7, s2
                  mulhsu       s4, a7, t5
                  mulhsu       a4, a2, t6
                  mulh         a1, s1, t5
                  rem          sp, s1, t5
                  sltiu        tp, a6, -134
                  feq.s        s8, fa5, ft8
                  mulh         s9, a6, s2
                  and          s7, s1, a6
                  fsgnj.s      fs7, fs9, ft11
                  fmax.s       fs5, ft8, ft11
                  fmin.s       fa2, ft8, ft7
                  slti         s3, t0, -1747
                  andi         s5, s9, 1872
                  remu         s1, a7, a1
                  srl          s8, t6, t1
                  remu         s4, s0, sp
                  slli         sp, tp, 9
                  fsub.s       ft7, fs11, fs6
                  fsgnjx.s     fa0, ft3, fa0
                  lui          s2, 244615
                  sub          t4, s2, zero
                  fmax.s       fs4, fa2, fa1
                  fsgnj.s      fs1, fa3, fs1
                  andi         a0, s0, -412
                  fmax.s       fs0, ft10, ft6
                  andi         s1, a7, -1385
                  fcvt.w.s     s6, ft6
                  mulh         s5, s8, s9
                  remu         gp, a2, t2
                  feq.s        s3, fs4, fs9
                  slti         s1, gp, 1772
                  or           ra, s7, t1
                  fle.s        ra, ft1, fs3
                  fclass.s     a4, fs6
                  sltu         ra, s6, tp
                  sll          s5, s0, tp
                  mulhu        a5, s10, zero
                  sltu         s9, zero, t2
                  auipc        a2, 1045115
                  sll          s1, t6, s2
                  fmax.s       fa5, fs4, fs11
                  mulh         zero, a7, zero
                  add          zero, a7, gp
                  rem          a7, s1, s8
                  andi         s9, gp, -1199
                  sll          ra, tp, t1
                  add          s9, t1, ra
                  xori         a4, a6, -1081
                  fsub.s       fs3, ft6, ft0, rup
                  fmin.s       fs5, ft8, fa6
                  fcvt.w.s     s10, fa2
                  rem          a7, a3, s5
                  feq.s        s3, fa4, fa4
                  fsgnjx.s     fs1, fs1, ft2
                  mulh         s8, a0, s10
                  divu         s1, a2, a4
                  fmax.s       ft8, fs4, fa4
                  or           a3, sp, s8
                  rem          s11, gp, s5
                  slli         s11, sp, 14
                  srai         s0, a0, 12
                  mul          t2, ra, a1
                  srl          a0, t3, s2
                  fle.s        a3, fa3, fs11
                  fsgnjx.s     fa5, ft6, fa4
                  ori          s7, t1, -678
                  fsqrt.s      ft5, ft5, rmm
                  sra          zero, t6, s3
                  srli         t4, s1, 29
                  fcvt.s.w     fs1, t2, rdn
                  fadd.s       ft1, fs1, fa0
                  srai         tp, a7, 1
                  srl          t4, gp, s4
                  fmin.s       fs11, fa6, ft0
                  srl          a5, a1, t0
                  fmv.x.w      a3, fa2
                  or           s1, zero, tp
                  andi         t4, t4, 869
                  fmv.w.x      fa2, s2
                  andi         s3, a4, 1855
                  auipc        s7, 728955
                  nop
                  fdiv.s       fa3, ft8, ft0, rne
                  fle.s        s5, fs10, fa1
                  fcvt.wu.s    sp, fa1, rup
                  nop
                  fadd.s       ft0, fs2, fs9
                  sltu         s4, s5, s6
                  srli         s11, a7, 10
                  mulh         a4, a0, a3
                  srl          s5, a7, t4
                  mulhu        a5, a1, s0
                  remu         s10, s1, zero
                  fclass.s     s11, ft5
                  sltu         a4, s6, t6
                  fsgnjn.s     fa1, ft3, fa4
                  or           gp, a5, s1
                  fsgnj.s      fs1, fa4, ft7
                  andi         a1, a6, -3
                  srl          t4, zero, a3
                  sltu         s4, t1, s11
                  srli         s3, tp, 14
                  fdiv.s       ft9, ft5, ft6
                  divu         gp, s4, s6
                  slli         s5, a6, 23
                  fsgnjn.s     fs5, fa6, ft9
                  slt          s1, s3, s3
                  fsgnj.s      ft7, fs0, ft1
                  mulhu        a2, t4, s8
                  sub          s0, t6, a0
                  remu         s2, s4, sp
                  add          s2, a5, s5
                  lui          sp, 244948
                  fsgnjn.s     ft9, fs3, fa2
                  fcvt.s.wu    fa7, t2, rne
                  fmin.s       fa3, ft8, ft8
                  fadd.s       fs8, ft4, fs3
                  fmul.s       ft10, fa3, fs11
                  srl          s2, t4, s10
                  andi         a3, a3, -500
                  sltiu        s1, s5, 268
                  mulhu        s1, a1, s11
                  fsqrt.s      ft0, ft7
                  fmin.s       fs5, fa4, ft2
                  sll          t4, s0, s0
                  lui          a4, 221189
                  srl          a7, a5, s0
                  remu         tp, sp, a1
                  xor          s5, t6, a7
                  sll          gp, a7, t4
                  fcvt.w.s     a4, fa3
                  xori         zero, a5, 424
                  fmax.s       fs9, ft1, fa2
                  lui          s1, 22072
                  slt          s6, s1, s3
                  fle.s        t6, fs3, fs10
                  auipc        t2, 668854
                  sra          t3, s4, s11
                  fmul.s       fs7, ft6, fa7
                  fsgnjx.s     fs5, fa0, fa1
                  rem          s8, s4, sp
                  sra          s7, a2, s9
                  mul          s0, t6, ra
                  ori          a4, s9, 591
                  flt.s        s1, ft0, ft1
                  mul          s3, a1, s6
                  rem          s3, t1, ra
                  fle.s        a1, fs5, fa6
                  fclass.s     s9, fs0
                  slt          sp, s4, s8
                  sltiu        a6, s6, -1826
                  sltiu        a4, a3, 1685
                  xori         s11, tp, -2034
                  divu         s3, gp, a1
                  divu         a4, t4, s1
                  slt          a0, s3, a3
                  sub          t6, ra, a5
                  srl          a7, s6, s5
                  fmax.s       fa7, fa5, fs9
                  fcvt.s.wu    fs4, tp, rtz
                  fmul.s       fs4, ft2, ft7, rup
                  fmv.x.w      s5, fs8
                  fcvt.w.s     t4, ft8
                  addi         s0, a1, 761
                  feq.s        ra, ft6, ft0
                  slt          s1, s9, a2
                  mulh         s0, a7, t2
                  sltu         a3, s1, t4
                  xori         s1, a6, -1986
                  slt          s0, s0, t2
                  fclass.s     s3, fs1
                  fsqrt.s      fs0, fa0
                  rem          t4, a4, s4
                  sltiu        ra, t3, 1935
                  srli         a2, a0, 10
                  ori          s7, s8, 569
                  srai         a6, s7, 16
                  or           a5, s5, s10
                  and          a2, s8, t0
                  remu         gp, t2, t4
                  fmax.s       ft5, ft10, ft5
                  sub          s10, s11, t2
                  mulhsu       s9, t3, s4
                  and          t4, sp, s7
                  fle.s        s1, fs7, ft4
                  fmax.s       ft2, fa3, ft11
                  fsgnj.s      fs10, fs3, ft0
                  nop
                  fmax.s       fs8, ft9, ft3
                  srli         zero, a2, 2
                  flt.s        s9, fa6, fa6
                  srli         a6, ra, 3
                  fmv.w.x      ft9, s10
                  feq.s        s3, fa1, fs2
                  auipc        s10, 369062
                  feq.s        a6, fa3, fs10
                  auipc        a3, 172130
                  slli         a2, t5, 25
                  srai         s10, s7, 2
                  slt          s11, s9, s7
                  mul          t6, s2, a6
                  mulhsu       ra, s2, t5
                  fcvt.w.s     s8, fs8, rtz
                  mulhu        a7, a2, a2
                  srai         s9, a6, 14
                  flt.s        a6, fs0, fs1
                  andi         s4, ra, -1647
                  rem          a3, t6, s2
                  addi         a7, t3, 1497
                  flt.s        zero, ft4, ft5
                  xori         gp, s1, -1553
                  fclass.s     s0, fs1
                  sll          a4, s9, s4
                  sltu         s11, t1, zero
                  fsgnjn.s     fs4, fs3, ft7
                  ori          s6, t6, 876
                  fsqrt.s      fa4, fs1
                  slli         s7, t6, 8
                  fcvt.wu.s    sp, fs3
                  fsqrt.s      ft8, ft10, rup
                  fsgnjn.s     ft2, ft9, fa2
                  fmul.s       ft3, fs8, ft0
                  fcvt.s.w     fa6, s6
                  mulhu        a0, s8, t4
                  srl          tp, a2, zero
                  lui          a1, 161489
                  fdiv.s       fs9, fs0, fs11
                  ori          s9, t3, 383
                  fcvt.s.wu    fs1, t1, rtz
                  fmin.s       ft5, ft5, fs1
                  fmv.w.x      fs10, a2
                  srli         t2, s10, 20
                  fmv.x.w      s5, ft2
                  and          a6, gp, ra
                  srl          ra, s7, s9
                  srl          t2, a2, zero
                  div          zero, s1, a3
                  fsgnjn.s     fs2, ft1, ft10
                  srli         s9, a6, 22
                  srai         a0, s2, 22
                  fsub.s       ft4, fs8, ft5
                  sltu         sp, s1, a7
                  fsgnj.s      ft10, fs5, ft4
                  fmv.x.w      s1, ft8
                  fcvt.s.w     ft6, s1, rne
                  xori         t3, tp, 2012
                  fcvt.s.wu    fa5, s5
                  fsgnjx.s     ft0, fs0, fs9
                  addi         tp, s10, -1586
                  ori          s11, t5, 1486
                  fadd.s       fs7, ft8, ft9
                  fmax.s       fs11, ft2, fs3
                  sub          a3, a1, t1
                  fmax.s       fa4, fa2, fs5
                  add          t4, t5, s0
                  fle.s        zero, fa3, ft2
                  slli         a7, gp, 6
                  nop
                  fsgnjn.s     ft4, ft1, fs11
                  fmax.s       ft4, fa0, fa4
                  fcvt.s.wu    ft0, s5
                  fsgnj.s      fa2, fs0, fs5
                  flt.s        s9, fs5, fa5
                  sll          t4, s9, t4
                  fsub.s       fs8, ft11, fa6, rdn
                  remu         a2, s6, s5
                  or           a3, a1, t3
                  ori          t2, t1, -1851
                  fcvt.w.s     a2, fs7, rmm
                  xori         a2, s2, 1670
                  lui          s6, 88412
                  sra          a1, t2, gp
                  fsub.s       ft11, ft0, fs2, rmm
                  rem          s9, a2, a5
                  fsub.s       fs11, fa1, fs9, rmm
                  mulh         s11, t1, t1
                  lui          t6, 685629
                  fcvt.wu.s    t3, fs6, rdn
                  srli         a5, s11, 26
                  xori         s10, tp, -370
                  remu         s10, ra, a5
                  srl          s6, s9, a4
                  mulhsu       a1, t4, s0
                  fmax.s       ft2, ft9, ft3
                  fmv.w.x      fa7, a7
                  mulhsu       t2, s10, s10
                  auipc        s3, 65099
                  srli         ra, a0, 20
                  sltiu        s2, s8, -336
                  sra          s0, a7, a1
                  div          a3, ra, tp
                  or           s11, ra, t5
                  auipc        a1, 378077
                  fsgnj.s      ft6, fs5, ft0
                  sub          s1, a1, a6
                  sltiu        s7, a4, -1694
                  srai         zero, s7, 10
                  fmin.s       ft7, ft11, ft4
                  fcvt.wu.s    a5, fs6, rne
                  sltiu        s7, s10, -162
                  divu         s3, s10, t5
                  mul          a5, s10, t5
                  sltiu        a3, t1, 582
                  feq.s        s6, fa4, ft3
                  mulh         gp, ra, a5
                  remu         s9, t3, s10
                  divu         s7, a2, a3
                  fsgnjx.s     fs8, fs0, fa0
                  and          a0, s11, s7
                  fcvt.s.wu    fs9, s5, rne
                  xor          t4, gp, a2
                  srai         a3, s0, 11
                  sll          a0, t3, a7
                  slt          a1, s8, s5
                  fle.s        s6, ft8, ft0
                  fsub.s       ft0, fa1, ft11
                  fcvt.w.s     s11, ft7
                  fcvt.w.s     s5, fa7
                  sub          s9, gp, a2
                  auipc        s0, 707678
                  fsgnj.s      fs2, ft4, fs1
                  fsgnjn.s     ft7, fs5, ft5
                  fmax.s       fs9, ft1, fs1
                  fcvt.wu.s    a4, fa3
                  mulhu        ra, s10, a3
                  sub          s9, a5, t6
                  andi         s7, s10, -1134
                  rem          t4, a0, gp
                  mulhu        s4, a3, s10
                  div          a1, t4, tp
                  fmin.s       fs2, ft4, fs9
                  fsub.s       ft9, fs3, fs3
                  fsgnjn.s     fs7, ft8, fa1
                  fcvt.wu.s    sp, ft2, rup
                  mulh         ra, t2, s1
                  slti         a7, t1, 119
                  fdiv.s       fs6, fs2, fa6
                  slli         a1, a1, 12
                  and          s11, t3, s6
                  srai         a2, s7, 25
                  xor          t2, zero, t1
                  addi         s11, a6, 753
                  fsgnjn.s     fa1, fa4, fa3
                  fmv.x.w      gp, fs7
                  feq.s        a5, fs5, fs1
                  fmax.s       fs8, fa5, fs10
                  mul          t2, s9, s2
                  fdiv.s       fa5, fa1, ft3
                  sub          tp, sp, a5
                  slli         sp, t1, 11
                  xori         a1, a2, -750
                  fcvt.wu.s    ra, ft3
                  mulhsu       s5, t2, t0
                  nop
                  fclass.s     s2, ft8
                  mul          a5, gp, s0
                  mul          t2, gp, s6
                  fsub.s       ft1, ft0, fs0, rtz
                  srli         t4, s3, 14
                  fcvt.wu.s    zero, ft9, rmm
                  fmin.s       ft3, fa6, ft10
                  slt          s9, s3, s1
                  sra          s6, s11, t6
                  fcvt.s.wu    ft5, s7
                  fadd.s       fa1, fs7, ft6
                  srli         s2, t4, 4
                  flt.s        s3, ft11, ft6
                  div          t3, s0, t0
                  mulh         a3, t6, t6
                  fmin.s       fs5, ft0, ft9
                  sltu         a1, ra, a2
                  flt.s        gp, ft6, fa0
                  sub          a1, a5, t1
                  sll          a6, a4, s5
                  div          sp, s6, s4
                  sltiu        a2, s4, -307
                  div          a3, s8, s2
                  flt.s        s10, ft3, fs8
                  sll          sp, t5, s11
                  slti         tp, s3, -1214
                  slt          t2, t0, a4
                  srai         s10, s8, 23
                  lui          a2, 605536
                  fmv.w.x      fs4, s1
                  xori         s5, s1, 1190
                  mulhsu       zero, t3, t3
                  fsub.s       ft8, fa4, fa0, rne
                  fcvt.wu.s    s8, fs1, rmm
                  fmv.x.w      a2, fs5
                  fcvt.wu.s    gp, fs11
                  nop
                  remu         ra, s1, t6
                  fsgnjn.s     fa0, fs6, fs7
                  div          t6, a1, s2
                  fmv.w.x      fa6, sp
                  fsgnjn.s     ft10, ft9, fa1
                  sll          a0, zero, a5
                  addi         a7, s9, 366
                  slt          s7, t6, s10
                  fsub.s       fs1, ft8, fs0
                  sll          s6, t2, t6
                  fmv.w.x      fs4, a2
                  nop
                  sltu         s5, s11, s5
                  auipc        s11, 412857
                  fsgnjx.s     ft10, ft7, ft4
                  sltiu        a2, s3, -1266
                  fsgnj.s      fs6, fa6, fs10
                  fmin.s       ft11, fa5, fa4
                  sll          t6, a0, s7
                  feq.s        s2, fs6, fa5
                  slti         s2, s3, 1033
                  fsqrt.s      fs8, ft5, rmm
                  slti         s9, a7, -888
                  flt.s        s2, ft3, ft6
                  fcvt.s.wu    fs2, s10
                  srl          s6, zero, a6
                  add          s8, t5, t2
                  slti         s6, t2, -755
                  fsgnj.s      ft10, ft0, fs3
                  fcvt.wu.s    s0, ft5, rmm
                  fmax.s       fs10, fa5, fs1
                  rem          a4, ra, s5
                  or           gp, s3, a6
                  slli         a3, s0, 21
                  srli         t4, a3, 23
                  nop
                  fmin.s       fs0, fa7, fa5
                  fle.s        s8, ft2, ft10
                  fmul.s       fs9, fs3, fs5, rtz
                  sltu         t6, gp, a6
                  slt          s4, t2, s0
                  fle.s        s2, ft8, fs9
                  or           t3, a1, a0
                  fcvt.s.w     fa7, t4
                  auipc        s4, 165036
                  div          a1, a1, s8
                  srai         s9, s11, 19
                  flt.s        tp, ft0, fs1
                  mul          t2, t3, a6
                  fmin.s       ft8, ft1, ft9
                  fsqrt.s      fs2, fa5, rtz
                  fsgnjx.s     ft8, ft1, ft7
                  auipc        t6, 387299
                  ori          s1, s3, -1912
                  sra          tp, ra, a5
                  sra          s1, t1, t5
                  xor          a5, zero, t3
                  srli         s0, a3, 10
                  fsgnjn.s     fa0, ft9, fs0
                  flt.s        s7, fs7, ft7
                  fmv.w.x      fs9, s4
                  fcvt.w.s     s8, ft1
                  fsgnjx.s     fs4, fa4, fs9
                  fcvt.s.wu    ft5, zero, rup
                  lui          ra, 136143
                  fmul.s       ft9, fa4, ft10, rup
                  fsgnjn.s     ft5, ft9, fs5
                  slt          zero, a2, s5
                  xor          s3, s10, t5
                  sub          a6, ra, s5
                  fmv.x.w      s7, fs10
                  fmul.s       fs3, ft9, ft0
                  srai         t4, sp, 10
                  fmv.x.w      tp, fs11
                  srai         gp, s9, 26
                  div          s6, a4, s11
                  fdiv.s       ft10, fs1, ft0, rne
                  sra          t6, s10, zero
                  nop
                  andi         t4, t1, 1966
                  fmax.s       fa3, fs3, fa6
                  div          s4, t2, s6
                  sltu         s1, s3, t0
                  andi         s5, ra, 1569
                  feq.s        s8, fs2, ft10
                  mul          s8, a0, a4
                  fsgnj.s      ft9, ft7, fs11
                  feq.s        s2, fs2, fs6
                  andi         s11, a6, 1518
                  fmax.s       fs3, ft9, fs9
                  mulhu        zero, t5, s3
                  xori         s3, tp, -324
                  srli         gp, a3, 11
                  srl          a0, t2, s7
                  fmv.x.w      a1, fa6
                  slt          s6, a0, s10
                  fsgnj.s      fa3, ft1, fa0
                  ori          s2, a5, 1378
                  sub          s9, zero, s5
                  mul          s8, s1, a7
                  sltu         sp, t1, s9
                  fcvt.s.wu    fs10, s10, rmm
                  div          ra, gp, t4
                  srl          tp, s8, a7
                  xor          a5, s5, s9
                  and          a4, tp, zero
                  fsgnj.s      fs2, ft2, fa1
                  srli         s10, s4, 29
                  fcvt.wu.s    a7, ft3
                  sub          s4, t1, sp
                  fadd.s       fa5, ft7, ft4, rdn
                  divu         s8, s0, t6
                  fcvt.s.wu    ft6, t2
                  srai         t6, a3, 16
                  fmv.x.w      a6, ft2
                  fsgnjx.s     ft5, fs9, ft5
                  sra          t3, a7, a5
                  slt          t3, s1, s11
                  feq.s        a6, fs11, ft2
                  feq.s        t3, fs8, fa1
                  feq.s        s9, ft10, fs1
                  sltu         s3, s5, s10
                  fcvt.wu.s    a2, ft9
                  xor          s4, t1, t4
                  fcvt.w.s     a6, fa4
                  fclass.s     ra, ft11
                  xor          s3, a2, a2
                  auipc        t2, 916470
                  xor          a2, a1, s2
                  fsub.s       fs2, ft7, fs9
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
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_2:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_3:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_4:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_5:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_6:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_7:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_8:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_9:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_10:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_11:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_12:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_13:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_14:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  j mmode_intr_handler
                  1: la x5, test_done
                  jalr x0, x5, 0

mmode_intr_vector_15:
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
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
                  addi x6, x6, -4
                  sw  x30, (x6)
                  add x30, x6, zero
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
                  add x6, x30, zero
                  csrr x7, 0x341 # MEPC
                  csrr x7, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x7, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x7, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x7, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x7, x9, ecall_handler
                  li x9, 0x1
                  beq x7, x9, instr_fault_handler
                  li x9, 0x5
                  beq x7, x9, load_fault_handler
                  li x9, 0x7
                  beq x7, x9, store_fault_handler
                  li x9, 0xc
                  beq x7, x9, pt_fault_handler
                  li x9, 0xd
                  beq x7, x9, pt_fault_handler
                  li x9, 0xf
                  beq x7, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x7, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
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
                  add x30, x6, zero
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
                  add x6, x30, zero
                  lw  x30, (x6)
                  addi x6, x6, 4
                  mret

load_fault_handler:
                  add x30, x6, zero
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
                  add x6, x30, zero
                  lw  x30, (x6)
                  addi x6, x6, 4
                  mret

store_fault_handler:
                  add x30, x6, zero
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
                  add x6, x30, zero
                  lw  x30, (x6)
                  addi x6, x6, 4
                  mret

ebreak_handler:   
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x30, x6, zero
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
                  add x6, x30, zero
                  lw  x30, (x6)
                  addi x6, x6, 4
                  mret

illegal_instr_handler:
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x30, x6, zero
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
                  add x6, x30, zero
                  lw  x30, (x6)
                  addi x6, x6, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x7, 0x300 # MSTATUS;
                  csrr  x7, 0x304 # MIE;
                  csrr  x7, 0x344 # MIP;
                  csrrc x7, 0x344, x7 # MIP;
                  add x30, x6, zero
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
                  add x6, x30, zero
                  lw  x30, (x6)
                  addi x6, x6, 4
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
