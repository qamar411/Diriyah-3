.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x23, h0_start
jalr x0, x23, 0
h0_start:
                  li x18, 0x40001120
                  csrw 0x301, x18
kernel_sp:        
                  la x2, kernel_stack_end

trap_vec_init:    
                  la x18, mtvec_handler
                  ori x18, x18, 1
                  csrw 0x305, x18 # MTVEC

mepc_setup:       
                  la x18, init
                  csrw 0x341, x18

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x18, 0x3800
                  csrw 0x300, x18 # MSTATUS
                  li x18, 0x0
                  csrw 0x304, x18 # MIE
                  mret
init:             
                  li x18, 4286578687
                  fmv.w.x f0, x18
                  li x18, 4286578688
                  fmv.w.x f1, x18
                  li x18, 2154605212
                  fmv.w.x f2, x18
                  li x18, 2172369404
                  fmv.w.x f3, x18
                  li x18, 2139095040
                  fmv.w.x f4, x18
                  li x18, 2143289344
                  fmv.w.x f5, x18
                  li x18, 4286578688
                  fmv.w.x f6, x18
                  li x18, 2147483648
                  fmv.w.x f7, x18
                  li x18, 4286578687
                  fmv.w.x f8, x18
                  li x18, 3874645037
                  fmv.w.x f9, x18
                  li x18, 2523138138
                  fmv.w.x f10, x18
                  li x18, 2139095039
                  fmv.w.x f11, x18
                  li x18, 2139095039
                  fmv.w.x f12, x18
                  li x18, 2139095039
                  fmv.w.x f13, x18
                  li x18, 4286578688
                  fmv.w.x f14, x18
                  li x18, 4286578687
                  fmv.w.x f15, x18
                  li x18, 0
                  fmv.w.x f16, x18
                  li x18, 2143289344
                  fmv.w.x f17, x18
                  li x18, 1319506009
                  fmv.w.x f18, x18
                  li x18, 4286578687
                  fmv.w.x f19, x18
                  li x18, 2029969402
                  fmv.w.x f20, x18
                  li x18, 0
                  fmv.w.x f21, x18
                  li x18, 1701854
                  fmv.w.x f22, x18
                  li x18, 2139095039
                  fmv.w.x f23, x18
                  li x18, 4286578688
                  fmv.w.x f24, x18
                  li x18, 2139095041
                  fmv.w.x f25, x18
                  li x18, 3084750742
                  fmv.w.x f26, x18
                  li x18, 2139095040
                  fmv.w.x f27, x18
                  li x18, 206057
                  fmv.w.x f28, x18
                  li x18, 2148445852
                  fmv.w.x f29, x18
                  li x18, 2143289344
                  fmv.w.x f30, x18
                  li x18, 2147483648
                  fmv.w.x f31, x18
                  fsrmi 1
                  li x0, 0x80000000
                  li x1, 0x7c468009
                  li x3, 0x0
                  li x4, 0x80000000
                  li x5, 0x1
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0x2
                  li x9, 0x1d33e613
                  li x10, 0xfdbbdcb2
                  li x11, 0x0
                  li x12, 0x80000000
                  li x13, 0xf8eb8143
                  li x14, 0xc
                  li x15, 0x80000000
                  li x16, 0x3
                  li x17, 0x0
                  li x18, 0x5ee3bee5
                  li x19, 0xfba14fb6
                  li x20, 0x80000000
                  li x21, 0x39c4ee87
                  li x23, 0x80000000
                  li x24, 0x20464980
                  li x25, 0x8
                  li x26, 0xf9853843
                  li x27, 0xd902907e
                  li x28, 0xf1d685e7
                  li x29, 0x76650161
                  li x30, 0x80000000
                  li x31, 0x6
                  la x22, user_stack_end
main:             addi         t0, a0, 502
                  mulh         zero, s1, s8
                  fadd.s       ft9, fa5, fa3, rne
                  fsqrt.s      ft10, fa0, rmm
                  fcvt.w.s     s1, fa2
                  slt          a6, tp, s10
                  mulh         gp, s5, s3
                  fcvt.s.w     fs4, s1, rne
                  srli         t6, zero, 23
                  sub          a2, t4, s5
                  fmin.s       fs4, ft7, fa4
                  rem          t0, sp, sp
                  fclass.s     t4, fs1
                  and          s8, s6, s3
                  srl          s5, s4, a1
                  fdiv.s       fa7, fs1, ft0, rmm
                  slti         s2, s7, -902
                  sltiu        a5, s2, -640
                  div          gp, s1, ra
                  srli         tp, a7, 2
                  fcvt.s.w     fa6, s0, rne
                  sll          s4, t5, s7
                  addi         s8, a5, 1665
                  fcvt.s.w     fa6, sp
                  sll          t5, a5, a3
                  sll          s3, ra, t2
                  fmin.s       fs11, fs6, ft0
                  slt          s2, t6, a0
                  remu         s4, gp, a1
                  sra          t0, a4, t6
                  add          s8, s11, a0
                  fadd.s       fs5, ft2, fa1
                  addi         s9, a5, 1775
                  srai         s4, ra, 30
                  div          t0, s9, tp
                  fmv.w.x      fa6, s9
                  fcvt.wu.s    t1, fs0
                  xor          s8, s4, s2
                  rem          t0, a4, tp
                  fsgnjx.s     fs4, fs7, fs6
                  fsgnjn.s     fa6, fa6, fs8
                  mulh         a3, ra, ra
                  flt.s        s8, ft9, fa0
                  fsgnj.s      fa1, fa1, fs0
                  fsgnj.s      fs1, ft8, fs3
                  mulh         a1, a2, a2
                  add          s1, s9, s0
                  fadd.s       fs11, fa1, fa4
                  addi         t6, t2, 1763
                  slli         a3, s3, 2
                  remu         s8, s9, a7
                  fadd.s       ft11, ft7, fs4, rtz
                  fcvt.w.s     s8, ft6
                  flt.s        a4, fs1, ft4
                  ori          s4, s3, -1352
                  sub          s10, t2, a5
                  fsqrt.s      ft3, fs1
                  xor          gp, a6, s3
                  fclass.s     a6, fa2
                  fmax.s       fs10, fa0, fa0
                  fmul.s       fs5, ft0, ft4, rdn
                  mulhsu       t6, a0, a5
                  and          s0, a3, t1
                  fcvt.s.w     fa3, a5
                  auipc        a7, 479674
                  andi         t2, tp, -1355
                  sub          s10, s8, a6
                  andi         t6, a0, 1510
                  lui          tp, 511348
                  fcvt.s.w     fs6, ra
                  sltiu        t5, s1, -592
                  addi         a4, ra, 238
                  slli         a1, t4, 7
                  fmax.s       fa2, ft11, ft8
                  ori          t5, t0, -11
                  slli         s5, s7, 11
                  fle.s        ra, fa1, ft7
                  sltiu        t6, t2, -589
                  sra          a7, a2, s6
                  fmul.s       ft6, fs0, ft2
                  fsgnjn.s     fs10, ft7, fs6
                  and          t6, s10, a4
                  sub          ra, a1, a6
                  mulhu        ra, t0, t6
                  mulhsu       t6, t1, t3
                  mulhsu       a4, s1, s2
                  rem          a3, s0, s2
                  fsub.s       fs6, fa2, fa5, rmm
                  nop
                  fmax.s       fa5, ft9, ft7
                  sltu         s4, s5, s11
                  lui          a0, 931780
                  sltu         a6, t0, s10
                  mulh         s1, s0, t1
                  sltu         a5, s9, s11
                  and          a6, a3, s7
                  fmax.s       fs4, fs8, ft6
                  fsgnjx.s     fa3, fs6, fa4
                  fcvt.s.wu    fs1, s5, rne
                  divu         a1, t6, a1
                  mul          t1, s4, s11
                  sra          s3, tp, a1
                  fclass.s     ra, fa7
                  fsgnjx.s     fa1, fs10, fa2
                  fcvt.s.wu    fa7, sp
                  xori         s3, s10, 870
                  remu         s1, tp, t2
                  fadd.s       fs2, fs1, fs11
                  mulhsu       gp, t0, s5
                  srai         a3, t5, 1
                  fcvt.s.w     ft4, s5
                  xori         t5, t4, -1062
                  div          a2, sp, gp
                  fcvt.s.wu    fs7, s2
                  addi         s2, a2, -762
                  fcvt.s.w     fs3, s10
                  or           t5, t1, t6
                  sltiu        s3, t4, -1080
                  sltu         s3, a1, t2
                  mulhu        t6, s8, t1
                  sll          s8, s8, t1
                  fadd.s       fa5, fa5, ft6
                  sra          s3, t0, t5
                  fmax.s       fs2, fs11, fa5
                  fmin.s       fa1, fa7, fa5
                  srai         a2, t6, 29
                  mulhsu       t6, t5, s3
                  srl          s5, s5, t5
                  xor          t6, s5, s8
                  fmul.s       fs1, fa6, ft1, rdn
                  fsqrt.s      fs7, fs0, rne
                  xor          s1, s7, t6
                  lui          a3, 658056
                  andi         a3, t1, -476
                  fdiv.s       ft11, fs0, fs1, rtz
                  rem          a1, a2, a0
                  ori          t0, a0, -952
                  fsgnj.s      ft1, fa0, fs3
                  slli         a5, a6, 12
                  srai         gp, t0, 13
                  sra          gp, t1, a7
                  fcvt.s.w     fa2, t5, rtz
                  divu         s9, s11, zero
                  lui          a7, 3116
                  fsgnj.s      fa4, ft8, ft2
                  rem          a2, gp, s9
                  mul          s11, a3, s6
                  fcvt.w.s     s5, ft6
                  sub          s8, s7, gp
                  addi         a4, zero, 1372
                  mulhu        a6, s1, a6
                  add          t0, s10, t1
                  fmul.s       fs6, fa1, ft9, rdn
                  xor          s1, sp, zero
                  or           a2, a2, a4
                  fcvt.wu.s    a4, ft7
                  mulh         t4, sp, zero
                  srl          s1, s9, t3
                  fmv.w.x      ft2, s11
                  auipc        s3, 635195
                  fcvt.s.wu    fa2, a5, rne
                  fmin.s       fa5, fs11, fs2
                  rem          s4, t0, t0
                  srl          t3, t5, t1
                  fclass.s     a4, ft0
                  fcvt.s.w     fa3, t3
                  fcvt.wu.s    s1, fs1, rne
                  fsgnjn.s     fs9, ft3, ft9
                  fcvt.wu.s    s1, fa2
                  flt.s        a7, ft9, fs4
                  fcvt.wu.s    t1, ft5
                  andi         ra, zero, 1764
                  fdiv.s       ft2, fs2, fa6, rmm
                  flt.s        t3, fs11, fs6
                  sltiu        a0, t4, -1930
                  slt          t6, s3, s11
                  fclass.s     a2, ft5
                  fadd.s       ft6, fs4, fs1, rmm
                  fmin.s       fa6, fa3, fs4
                  andi         s3, t0, 1369
                  sltiu        s8, a2, 766
                  xor          a1, tp, tp
                  remu         t6, s3, t1
                  fmin.s       fs4, ft6, fs1
                  sra          s11, s7, t0
                  div          t3, t5, t6
                  fsgnj.s      fa4, ft7, ft2
                  fmax.s       ft9, fs9, fa0
                  auipc        t0, 34179
                  fsgnjn.s     fa1, ft0, fs5
                  fcvt.w.s     a2, fs11
                  fcvt.s.w     ft2, a0, rne
                  fmin.s       ft2, fs4, fa1
                  or           t3, s0, t2
                  mulh         t0, a4, s7
                  sltiu        s4, s9, 1395
                  fdiv.s       ft2, ft6, ft10, rmm
                  fmax.s       ft4, fa2, fs8
                  fle.s        s4, fa5, ft5
                  fmv.x.w      s10, fa0
                  fsgnjx.s     fs8, fs2, fs8
                  div          t2, s6, s3
                  fmax.s       fs2, ft4, fa3
                  fdiv.s       fs7, fs7, fs9, rdn
                  rem          t0, s8, a1
                  srli         t3, t0, 17
                  mulhu        s5, a0, a1
                  sltiu        s4, s2, 1969
                  fsgnjx.s     fa5, ft4, fa2
                  fclass.s     s2, ft2
                  srai         a6, sp, 3
                  nop
                  or           s11, t0, a0
                  srai         zero, s6, 16
                  sub          s2, s5, t5
                  auipc        t0, 403473
                  fsgnjx.s     ft5, ft3, fs1
                  mulhsu       s0, s3, t5
                  auipc        a1, 683997
                  xor          t6, t1, a6
                  and          a6, s0, a7
                  mulh         a7, s1, s3
                  fmv.w.x      ft7, s5
                  flt.s        gp, ft3, fs2
                  slti         a7, a2, 1468
                  slli         a5, s7, 3
                  divu         t3, zero, s8
                  srli         ra, ra, 4
                  slli         s1, t6, 1
                  remu         t6, s4, t6
                  remu         a6, s0, a5
                  ori          t4, zero, -221
                  fdiv.s       fa0, ft8, fs7
                  or           t1, s4, s1
                  flt.s        t1, ft5, ft7
                  auipc        s4, 991144
                  flt.s        t6, fs11, ft9
                  srai         s0, s5, 0
                  srai         t3, s3, 17
                  slti         t4, t4, 984
                  andi         t0, t2, 924
                  fsgnjx.s     fs11, fa2, fs10
                  fcvt.w.s     t6, fs2, rtz
                  sub          s3, t1, s1
                  xori         a1, t6, 2028
                  divu         t0, s9, a6
                  fcvt.wu.s    t3, fs7
                  fsgnjn.s     fs10, fs6, ft4
                  mulh         t6, s3, s3
                  fcvt.w.s     a4, fa4
                  and          t2, s3, s11
                  srli         a2, t2, 10
                  fmax.s       fs4, fs0, fs8
                  fmul.s       fs9, fs11, ft4, rne
                  fclass.s     t2, fs4
                  fcvt.w.s     t6, fs4
                  remu         a7, s3, a4
                  nop
                  mul          a5, t3, gp
                  fmv.x.w      t5, fs6
                  rem          gp, s2, a3
                  fcvt.wu.s    s1, fa5
                  srai         a0, t1, 7
                  andi         gp, t6, -1357
                  mul          zero, s1, t5
                  and          gp, a2, a5
                  fclass.s     a3, fs2
                  fsub.s       fa3, fs0, ft4
                  sub          t2, s8, t2
                  rem          a6, tp, t6
                  rem          s9, a4, tp
                  mulhsu       s5, s0, sp
                  fmul.s       ft10, fs3, ft5
                  sra          a0, gp, a1
                  fcvt.w.s     s1, ft3
                  fsub.s       fs10, fs5, fs11, rne
                  fmv.x.w      s4, fs10
                  andi         ra, a1, -1286
                  fsqrt.s      ft11, fs2, rmm
                  fcvt.s.w     fa1, s11
                  addi         a6, s5, -120
                  fsqrt.s      fa5, ft1, rne
                  divu         s2, ra, s4
                  rem          s0, a5, s3
                  srli         s4, a0, 7
                  nop
                  fsgnjx.s     ft9, ft5, fs5
                  ori          a0, s6, -806
                  srli         s9, s10, 16
                  fle.s        a7, fs7, fs11
                  slt          s4, zero, a6
                  rem          s3, zero, t2
                  xori         s5, tp, -1752
                  fsgnj.s      ft0, fs7, ft7
                  mulhsu       a5, t4, a0
                  sll          s10, s2, t1
                  xor          t6, sp, a5
                  srli         s11, a3, 19
                  rem          a6, t0, a5
                  fle.s        t4, ft1, ft5
                  slli         a2, sp, 7
                  andi         s1, a3, -1190
                  fmv.w.x      fa0, s11
                  fsgnj.s      fs8, fs6, fa2
                  fle.s        s8, fa7, ft5
                  fmv.w.x      ft9, a1
                  sltu         ra, t6, s6
                  slt          a3, t1, sp
                  fcvt.wu.s    zero, fs11, rup
                  lui          s11, 893353
                  mulhu        zero, t5, s10
                  sll          s5, zero, gp
                  fmul.s       fa6, ft5, fs4
                  remu         s2, a5, s11
                  mulh         s2, a6, s8
                  mulhsu       t4, a3, t4
                  fmv.w.x      fs6, a4
                  srl          zero, s7, a3
                  mulhu        t0, a4, a4
                  fadd.s       fs7, fa4, fa0, rup
                  srai         t6, t4, 18
                  sll          s1, tp, s4
                  fsqrt.s      fs7, ft7
                  fsub.s       ft5, fa5, fs1
                  fdiv.s       ft2, fs9, fa3
                  mulhsu       a3, s5, s3
                  sub          gp, s6, s0
                  fle.s        zero, ft5, fs0
                  add          s0, a7, s2
                  fsub.s       fs6, fa0, fa5, rne
                  fcvt.w.s     t2, fs5
                  fsgnj.s      fs0, fs5, ft3
                  sltu         s10, t1, a7
                  flt.s        s0, fs4, fa7
                  fclass.s     s0, fs7
                  sll          s1, tp, a0
                  sltu         s1, t4, s5
                  fmv.x.w      tp, fs0
                  xori         s0, a3, -427
                  addi         t2, gp, 2020
                  fle.s        a3, fa1, fa7
                  fsub.s       fs2, fs11, ft4
                  fsub.s       fa1, fs1, fs10
                  sltiu        a6, tp, -718
                  fsub.s       ft7, ft11, ft7
                  srl          a1, s1, s8
                  div          s4, a7, a2
                  divu         ra, a0, s0
                  slli         s2, s0, 5
                  fmin.s       fs3, fs10, fs5
                  mulhu        s3, s7, t3
                  fcvt.s.w     fs11, s7, rdn
                  feq.s        a0, fa4, fs11
                  ori          gp, t0, 1306
                  fle.s        s11, ft7, fa4
                  xor          t2, s3, a5
                  fmv.x.w      a5, ft3
                  fsgnj.s      fs4, fs8, fa7
                  andi         a1, s6, -2039
                  fcvt.w.s     a1, ft4
                  xor          s4, t4, tp
                  mul          s5, s1, s3
                  fcvt.wu.s    s11, fs2
                  div          t0, s3, t5
                  or           s4, zero, gp
                  rem          t4, s1, s3
                  remu         t6, t2, a1
                  fmax.s       fs3, fs0, fa2
                  sltu         t0, s0, sp
                  and          s0, s3, t4
                  sltu         a1, t4, t2
                  and          a4, t0, a2
                  fmin.s       ft7, fa0, fa3
                  srai         s11, a2, 25
                  fmv.w.x      ft1, a1
                  remu         ra, s1, t0
                  andi         tp, t6, 1991
                  sll          a1, t2, a4
                  mulh         s5, s10, s8
                  fsqrt.s      fa5, fs4, rmm
                  addi         t3, s1, 1595
                  srli         zero, ra, 3
                  mulhsu       a6, sp, a1
                  fclass.s     a4, fa0
                  srai         t1, s3, 27
                  fmv.x.w      s9, ft2
                  fdiv.s       ft1, fa3, fs3
                  mulh         ra, t0, s2
                  andi         t2, t1, -996
                  auipc        s1, 467719
                  fclass.s     s2, fs11
                  fmv.x.w      t2, fa0
                  fsgnjx.s     fa7, fa6, fs2
                  fcvt.s.wu    ft4, t2, rne
                  fmul.s       ft11, ft9, fa1, rup
                  fmax.s       fa1, ft10, ft8
                  fmul.s       fs10, ft6, ft1
                  fmin.s       fs4, ft3, ft0
                  fmin.s       ft6, fa6, fa1
                  rem          a4, tp, t5
                  feq.s        a0, fs11, fs8
                  xor          a3, a5, s4
                  fmv.x.w      a6, ft8
                  slti         t0, t2, 544
                  lui          s2, 519403
                  nop
                  addi         s0, s7, 1658
                  fcvt.wu.s    s3, fs6, rtz
                  fmv.x.w      a7, fs10
                  fmin.s       ft9, ft11, fa3
                  slti         s2, zero, -1606
                  fsqrt.s      fa0, fs10
                  fsgnjx.s     fa3, fs4, ft11
                  mulhu        s9, a0, t5
                  rem          s8, gp, a7
                  fclass.s     t1, fa5
                  slt          s5, t3, s5
                  fcvt.s.w     ft4, t4, rtz
                  fclass.s     a6, fs3
                  sltu         s9, s2, t2
                  xori         s8, t0, -852
                  lui          s11, 716054
                  xori         a4, t6, -361
                  and          s10, s5, t6
                  srl          s10, t6, ra
                  ori          a5, s2, -273
                  fsgnjn.s     fa6, fs6, ft10
                  nop
                  fmax.s       fa2, ft4, fa3
                  sub          t1, t0, a5
                  fsgnjx.s     fs6, fs8, fa5
                  srli         a7, a0, 17
                  sra          a7, a3, a5
                  fle.s        a1, ft10, fa1
                  mulh         zero, a6, s6
                  sltu         s10, s2, s5
                  srli         s2, t1, 30
                  mulhu        gp, s9, zero
                  andi         tp, t6, -679
                  fcvt.w.s     gp, fs0
                  lui          s0, 727314
                  fmv.w.x      fa6, a1
                  feq.s        t6, fs6, fs5
                  fsub.s       fa5, fa4, fa5
                  xor          t5, a2, s7
                  sltiu        a6, s8, -262
                  divu         t2, ra, s2
                  fdiv.s       fa3, fs11, fs2, rup
                  fcvt.wu.s    s9, fa7, rne
                  fcvt.wu.s    s3, ft6, rdn
                  fmv.x.w      s11, ft5
                  ori          ra, a3, 932
                  fsub.s       fs0, fa2, ft11
                  srl          s4, zero, t4
                  mulh         a1, s11, a3
                  fsgnj.s      ft9, fs5, fa2
                  srai         s3, s5, 14
                  mul          s8, t2, s4
                  slli         gp, gp, 31
                  fcvt.s.w     ft0, a0, rdn
                  fdiv.s       ft9, fa0, ft10
                  ori          t0, s7, -878
                  andi         a7, a2, -1236
                  fcvt.wu.s    s1, ft11, rne
                  fsqrt.s      ft0, ft8
                  fmin.s       fs8, fs0, fa4
                  sltu         s11, ra, s4
                  slli         tp, t3, 19
                  remu         zero, a5, s3
                  slli         a3, zero, 25
                  mulh         a7, gp, s0
                  andi         t3, a7, -655
                  fadd.s       ft3, fs11, ft10, rne
                  feq.s        ra, ft8, ft4
                  feq.s        a4, ft0, fa3
                  rem          t4, ra, a5
                  srli         a3, s0, 27
                  fcvt.s.wu    fs7, s9, rmm
                  fcvt.wu.s    a2, fa3, rmm
                  div          t5, sp, t6
                  fcvt.s.w     fa3, a6
                  auipc        t1, 776412
                  fmv.x.w      t6, fa6
                  fmv.x.w      zero, fs4
                  srli         s0, s0, 10
                  fcvt.s.wu    fs6, s4, rne
                  flt.s        s10, fa0, fa5
                  and          t4, t3, s0
                  mulhsu       s2, t2, s9
                  mulhu        a1, a6, gp
                  feq.s        s8, fa5, fs7
                  or           s0, a1, a3
                  fmin.s       ft2, fa4, fa5
                  fmin.s       ft10, fs8, ft0
                  slti         a3, tp, 823
                  fsqrt.s      ft0, fs11
                  fmul.s       fa5, fs11, fa7, rtz
                  andi         t2, s8, -1263
                  remu         a0, s0, t2
                  mulhsu       a7, s9, s1
                  fmin.s       fs0, ft6, fa1
                  mulhu        s0, a2, s11
                  fsqrt.s      fa7, fa5
                  slli         a7, t0, 13
                  nop
                  andi         t4, s6, 132
                  addi         s0, s3, 804
                  fmax.s       ft7, ft8, ft0
                  fcvt.wu.s    t4, ft9, rmm
                  slli         t1, s4, 12
                  slti         s2, t0, 1784
                  sltiu        a7, a6, 895
                  sub          gp, t1, a7
                  auipc        s11, 1040573
                  mulhu        t5, s6, s6
                  div          t6, t3, sp
                  auipc        s1, 14663
                  sub          s10, a2, s7
                  sltiu        a0, s4, -683
                  fadd.s       ft5, ft7, fs8, rne
                  remu         s8, s9, sp
                  srai         gp, s0, 3
                  slli         t3, t0, 4
                  fmul.s       fs4, fa3, fa7
                  fsub.s       fa3, fs10, ft11
                  sra          s0, t6, ra
                  nop
                  fdiv.s       fa3, fs0, fs11, rdn
                  feq.s        tp, fs6, ft9
                  fadd.s       ft3, ft11, fa1, rne
                  fle.s        a6, ft4, fs10
                  fsgnjn.s     fs9, fs8, ft1
                  auipc        a1, 608127
                  fsgnjx.s     fa2, ft3, fs3
                  mul          a7, t1, zero
                  and          tp, t5, s3
                  fmv.x.w      t0, fs4
                  srl          t4, a2, s10
                  srli         s11, s2, 29
                  div          t6, a0, t6
                  fmul.s       fs6, fa2, ft8, rup
                  sra          a3, s9, s6
                  auipc        a3, 445636
                  srl          s10, s0, t5
                  fsgnjn.s     fa3, ft2, fs10
                  fcvt.w.s     t0, fs5, rmm
                  xor          s8, a4, s6
                  and          a3, t4, zero
                  auipc        a7, 459456
                  auipc        t3, 454605
                  fsgnj.s      ft3, fs5, ft0
                  andi         s9, sp, -1324
                  fdiv.s       ft0, ft7, fa0
                  divu         s3, a6, s10
                  fadd.s       fs7, fs5, fa6, rmm
                  addi         a5, s2, 1565
                  fdiv.s       fs4, ft6, ft1, rdn
                  mulhu        s4, t6, gp
                  addi         s11, a1, -1818
                  srli         ra, tp, 28
                  slt          s5, t0, a2
                  mulh         t2, s10, t2
                  fmv.x.w      s11, fs2
                  sub          t0, s5, s1
                  srai         s3, t4, 18
                  fmv.x.w      s4, fa0
                  or           a0, a7, s0
                  div          t2, gp, t5
                  srli         t2, s3, 23
                  fclass.s     s5, ft4
                  mulhu        zero, s8, t4
                  nop
                  or           a3, s6, t4
                  slti         a0, gp, -130
                  add          a0, a3, a6
                  or           s11, s5, a0
                  fsgnjn.s     ft6, ft9, fs4
                  slt          s0, s2, s2
                  fmv.x.w      s11, fa7
                  sll          t0, s9, t6
                  srai         s3, s9, 5
                  fsgnj.s      fa7, ft8, ft0
                  fsub.s       ft2, fs1, fs8
                  feq.s        t3, fa5, fa5
                  and          s5, a4, ra
                  div          a1, s4, t0
                  sltu         t3, s11, zero
                  add          a2, s2, s4
                  addi         t1, s2, -1150
                  fadd.s       fs10, fa1, fa2
                  mulhu        s0, s3, t3
                  fle.s        s11, fs8, ft3
                  rem          t0, s0, a4
                  slt          a0, t5, a3
                  fsqrt.s      ft1, fs9
                  fmax.s       ft0, ft11, fs5
                  fle.s        a2, ft6, fs0
                  fsqrt.s      ft9, fs1, rmm
                  fcvt.w.s     s2, fa1, rmm
                  flt.s        t2, fs9, ft0
                  or           t0, sp, t2
                  srl          a5, t6, a4
                  fcvt.s.wu    fs6, a4
                  fcvt.s.w     fs7, ra
                  fcvt.s.w     ft3, t0
                  add          t5, s11, a6
                  rem          t4, t2, s8
                  fmax.s       fa6, ft5, ft1
                  fadd.s       ft9, fa6, fa6
                  srli         t0, s11, 18
                  slt          s3, s9, s0
                  slli         a4, t0, 29
                  nop
                  slt          zero, t1, a1
                  fle.s        t4, fs11, fa5
                  mulhsu       s9, s1, a2
                  auipc        s10, 37971
                  ori          t3, s10, 763
                  fle.s        a7, fs4, ft2
                  div          a2, s6, t6
                  slti         s0, s8, -1767
                  fcvt.wu.s    a5, fs11, rne
                  andi         a6, s9, 1826
                  fcvt.s.wu    fs3, a5, rtz
                  sra          t4, s11, a0
                  fmv.x.w      t0, fs5
                  fclass.s     t0, fs5
                  srai         t0, a2, 31
                  flt.s        tp, fs8, ft2
                  sltiu        t3, s1, -1126
                  sub          t5, a6, a1
                  mulh         a1, s2, t2
                  flt.s        t5, ft9, ft9
                  xor          t2, s9, t5
                  andi         s3, t2, 1121
                  rem          s11, t6, s6
                  srai         a3, s6, 30
                  add          t6, a0, s11
                  fmin.s       ft10, ft9, fs0
                  fadd.s       fs0, ft8, ft10, rne
                  sll          t1, a1, s4
                  mulhsu       s5, s2, s10
                  lui          t3, 840723
                  fle.s        s11, ft6, ft10
                  add          s9, a2, a6
                  div          s10, a6, s8
                  srai         ra, t2, 14
                  xor          s5, t6, s5
                  or           t1, a3, t5
                  fmax.s       ft9, fs5, ft11
                  sll          s5, s7, s9
                  lui          t4, 165088
                  fsub.s       fs5, ft6, ft2
                  flt.s        ra, fs5, fs3
                  xori         t0, s11, -751
                  fsgnjn.s     ft0, fa7, fa2
                  rem          t3, s9, s9
                  fcvt.s.w     fs2, t1
                  fsqrt.s      fa0, fa6
                  feq.s        s8, fs10, fa7
                  fmul.s       ft8, fa1, fs5, rdn
                  fsgnjx.s     fs7, ft1, fs5
                  slli         ra, a3, 6
                  fsub.s       fa2, fa4, fs4, rne
                  add          a2, zero, tp
                  and          a6, s5, tp
                  slti         t4, t5, 2015
                  div          a0, ra, t6
                  feq.s        s2, fa0, ft7
                  rem          t6, gp, t4
                  fdiv.s       fa2, fs7, ft5, rmm
                  and          a6, s3, a0
                  fsgnjx.s     ft5, fa5, fa1
                  fmv.x.w      a3, fs3
                  fmv.w.x      ft0, t6
                  slti         t1, a7, -1324
                  fmax.s       fa4, fs5, fs2
                  xor          a3, t5, tp
                  fsqrt.s      ft11, ft3, rup
                  fsub.s       fs9, fs11, fs4, rmm
                  sub          a0, s5, t5
                  mulh         t3, ra, a7
                  slt          a7, sp, sp
                  or           a3, s10, t3
                  slti         s9, s7, -1717
                  mulhu        a4, s1, a1
                  fcvt.s.wu    fs8, a3, rne
                  fdiv.s       ft2, ft6, fs6, rmm
                  slti         s0, s5, -1811
                  add          s11, s2, s9
                  fcvt.w.s     t1, fs3
                  divu         a0, s9, t3
                  fmul.s       fa4, ft8, fs1
                  fsgnjn.s     fs0, ft9, fs7
                  fmul.s       fa7, fs10, fs2, rup
                  fsub.s       fs5, ft4, ft11, rup
                  flt.s        a7, ft3, ft1
                  xor          t6, s8, tp
                  fadd.s       fs11, fa0, fs6, rup
                  mulh         s1, a6, ra
                  fcvt.s.w     ft4, t6, rdn
                  remu         a7, s7, s0
                  sra          a0, t4, s5
                  sll          s9, s3, s2
                  xor          a5, t5, s9
                  auipc        s5, 1035579
                  fcvt.wu.s    a5, fs5, rup
                  slli         s9, t3, 18
                  srai         t2, t0, 11
                  fsgnjn.s     ft10, fs10, ft9
                  and          t3, a3, a7
                  or           a7, s9, gp
                  sll          s1, a5, s8
                  slt          s9, a6, s3
                  fsgnjx.s     ft7, fs5, fs11
                  fcvt.wu.s    t0, ft3
                  sltiu        t1, s3, -554
                  fmax.s       ft9, ft6, fa1
                  sltu         t3, s9, s11
                  add          s10, s11, a4
                  fmax.s       ft9, fs6, ft11
                  fsqrt.s      fs0, ft3
                  fmin.s       ft5, fa1, fs8
                  addi         s10, ra, 1698
                  addi         s9, gp, 616
                  xor          a4, s9, s0
                  fcvt.wu.s    a6, ft7
                  flt.s        t1, ft4, fs6
                  ori          tp, s8, 1287
                  sra          t1, a7, s4
                  fadd.s       fs4, fs6, ft8, rne
                  mulhsu       s1, s8, a0
                  fsqrt.s      fs7, fs4
                  xor          t6, s0, a6
                  lui          t6, 104351
                  fmax.s       ft3, fs0, fs2
                  feq.s        a4, ft10, fa4
                  fdiv.s       ft7, ft6, ft8
                  sra          a4, t1, s3
                  slti         s4, a7, -1281
                  ori          s11, s2, 1503
                  flt.s        t4, fs5, ft5
                  mul          tp, t4, t1
                  mulhu        a4, t4, s3
                  srl          a5, s9, s6
                  feq.s        s2, fs4, fs2
                  slli         a4, t4, 1
                  slti         a2, t2, -695
                  fsgnj.s      fa4, fs4, fs2
                  auipc        s5, 196150
                  fcvt.wu.s    s11, ft5, rdn
                  or           zero, sp, a1
                  xor          a5, a0, t3
                  fclass.s     a3, fa1
                  fsgnj.s      fs5, fa7, ft4
                  mulhu        t5, s2, t2
                  fsgnj.s      fs2, ft0, fs4
                  addi         t1, t3, 649
                  slt          tp, t5, t2
                  fcvt.s.w     fs2, t0
                  fcvt.w.s     s5, ft9
                  xor          gp, a5, s11
                  ori          a7, s8, -1370
                  srl          s2, a4, s0
                  or           a3, a3, t5
                  sltiu        s0, t5, 1396
                  lui          s4, 923316
                  fcvt.s.wu    fa6, zero
                  rem          a4, t2, a2
                  sltiu        s5, t0, 1636
                  sll          s10, s9, zero
                  fle.s        t3, ft8, fs3
                  srai         t1, s7, 14
                  xori         tp, s0, 673
                  mulhu        a0, a0, s6
                  lui          a2, 366415
                  rem          a2, a1, s2
                  srli         a0, s3, 9
                  fmin.s       fs2, fa1, ft1
                  mul          t1, t4, t0
                  andi         a7, t3, 1390
                  sra          s2, t4, t6
                  sub          zero, sp, a3
                  rem          s4, s5, s3
                  srai         s5, s2, 18
                  flt.s        a3, ft1, fs8
                  fcvt.wu.s    tp, fs2, rup
                  mulhsu       s3, tp, s11
                  fcvt.wu.s    s2, fa5, rtz
                  fsgnjx.s     ft5, fs5, fs4
                  divu         s10, a6, sp
                  fle.s        s1, ft3, fs3
                  fmin.s       fa0, fs1, fs8
                  fsgnjx.s     ft5, fa6, ft0
                  fmin.s       ft11, ft8, fs8
                  divu         a1, a1, s9
                  or           s9, s8, zero
                  rem          s1, s3, a5
                  xor          s8, a7, s5
                  fmv.x.w      s4, fs1
                  srai         t4, ra, 16
                  fdiv.s       fa6, fa1, fs7
                  add          ra, a1, s6
                  addi         a6, gp, -534
                  remu         t4, t6, s9
                  slt          a1, s1, zero
                  or           ra, tp, a7
                  auipc        s10, 821150
                  ori          s3, s6, -244
                  fsqrt.s      fa7, ft9, rup
                  add          s9, a3, s9
                  fsgnjx.s     fs4, fa3, ft8
                  and          t6, s0, s5
                  add          zero, tp, s5
                  fsqrt.s      fs3, fs4
                  addi         a2, s5, -1997
                  fdiv.s       ft0, fs0, fa1, rmm
                  mulh         s0, s1, s3
                  fsub.s       fa1, fs0, fa4
                  flt.s        a6, ft10, fs10
                  fcvt.w.s     a2, fs11, rne
                  fsgnjx.s     fs7, ft4, fa6
                  fsgnjn.s     fs11, ft3, ft10
                  sltiu        a0, s9, -1554
                  remu         s11, s11, s10
                  slt          s8, s5, s0
                  div          a7, t3, s3
                  fsqrt.s      fa5, fs0, rup
                  fcvt.s.wu    fa3, s3, rmm
                  feq.s        s5, ft11, ft4
                  fclass.s     a5, fs7
                  fcvt.s.w     fs6, sp, rtz
                  slt          s8, s5, t4
                  xori         a1, a1, -147
                  fdiv.s       fs4, fs7, ft11
                  fcvt.s.w     fa7, a0, rup
                  srai         t3, a3, 25
                  fmax.s       fa0, ft0, fs9
                  fcvt.w.s     a3, fs0, rmm
                  sll          s3, t0, a6
                  nop
                  fmul.s       fa2, ft5, fa2, rtz
                  srl          a4, s1, a5
                  sub          a0, sp, tp
                  fsgnjn.s     fs0, fs2, ft10
                  fmin.s       fa5, fs1, fa6
                  slt          ra, t3, s4
                  fle.s        t5, ft0, ft2
                  fsgnjx.s     ft0, ft6, ft11
                  fsgnj.s      fs1, ft9, fa3
                  fmul.s       fs3, fs11, fs2, rdn
                  flt.s        s10, ft3, fa7
                  sra          a5, s10, t2
                  fmul.s       ft9, fa4, fs6
                  div          gp, s11, t3
                  nop
                  sltu         t5, a6, tp
                  xor          a7, a2, sp
                  and          s1, s0, s7
                  fcvt.s.w     ft7, t3
                  fsgnjn.s     fa1, ft11, fs10
                  add          s9, a7, sp
                  fdiv.s       fs4, fs8, fs10
                  and          tp, ra, sp
                  sub          s1, t5, a7
                  and          t2, sp, gp
                  mul          s4, t5, gp
                  lui          a5, 204482
                  divu         t0, a7, a3
                  rem          s11, a4, t5
                  fsgnj.s      ft9, fs8, ft10
                  srai         s3, t2, 11
                  fsgnjn.s     ft5, ft9, fs4
                  fsqrt.s      ft6, fs11
                  sub          a4, t4, s10
                  or           a0, s0, t4
                  sll          s4, s4, a1
                  xor          zero, s4, a2
                  and          a7, a7, t2
                  rem          gp, t5, a6
                  lui          s9, 677232
                  fclass.s     t4, fs11
                  sub          t5, s3, t4
                  or           s10, t5, a2
                  srl          t4, t5, s6
                  remu         s2, a7, s2
                  lui          zero, 951509
                  andi         ra, a1, -334
                  fmv.x.w      s4, fs6
                  srai         s2, a5, 13
                  andi         s8, zero, 630
                  fcvt.s.w     fs8, s2, rup
                  sra          a7, gp, s4
                  fsub.s       fs1, fa0, ft7
                  andi         ra, s10, -1576
                  or           s10, a4, s10
                  xor          ra, sp, sp
                  sra          s8, t2, t5
                  fsub.s       fs5, fs7, fa7
                  flt.s        a7, fs7, fs5
                  add          s2, a1, a0
                  mulhsu       a4, t5, s2
                  fsqrt.s      fa0, ft4, rtz
                  srl          ra, a7, t1
                  divu         t3, s8, s0
                  fsub.s       fs0, fs10, fs10, rdn
                  divu         a2, t5, s10
                  divu         s11, a5, s1
                  sra          s3, s0, a4
                  srl          t5, t6, s4
                  srl          a6, s8, s2
                  or           s8, a6, a3
                  or           a2, a1, t4
                  fdiv.s       fs4, ft1, ft5
                  mul          s9, a4, s3
                  fsqrt.s      ft1, fa4
                  feq.s        s4, fa6, fa2
                  sltu         t6, t4, s6
                  ori          a3, tp, -1493
                  xor          a0, a4, s8
                  fsub.s       fa2, fs7, fs11, rup
                  divu         s5, s10, sp
                  fcvt.wu.s    gp, fa5, rtz
                  sltu         s11, s6, t4
                  fmv.w.x      fs5, sp
                  fmv.w.x      fa4, a7
                  fmv.w.x      fa6, a2
                  divu         a0, s2, s0
                  sltiu        a6, a6, -724
                  divu         s11, sp, a0
                  fsgnj.s      ft1, ft2, fa4
                  fsgnjn.s     fs11, fs7, ft0
                  fclass.s     t5, fa4
                  or           zero, sp, tp
                  srai         s8, t0, 14
                  slti         a3, tp, 462
                  and          t2, a1, a4
                  fmv.x.w      s3, fa1
                  rem          s1, a2, t3
                  fcvt.wu.s    tp, fs7, rup
                  mul          gp, s4, s10
                  sll          s5, s8, s7
                  sra          a6, s10, t5
                  mulhsu       a1, t0, s1
                  fmin.s       ft1, fs6, fs10
                  nop
                  fsgnjn.s     ft2, fs2, fa5
                  div          s11, ra, t0
                  fle.s        ra, ft1, fa2
                  xor          t5, t3, tp
                  slti         s11, s2, 949
                  add          t3, s6, t6
                  slt          ra, s6, s2
                  fmv.w.x      fs9, t6
                  fcvt.w.s     zero, fs10, rmm
                  mul          t5, t4, a5
                  fsqrt.s      fs1, fs10, rdn
                  fmax.s       fs11, fa4, fa5
                  srli         s9, sp, 14
                  fle.s        s9, fa6, fs11
                  fdiv.s       fa0, ft6, fs6, rup
                  fcvt.w.s     s4, fa2, rmm
                  fdiv.s       fa3, fs1, fs11, rmm
                  srl          t2, a4, s10
                  sll          t4, s11, a1
                  mulhsu       s9, t6, t6
                  mul          t0, s10, ra
                  xor          t1, s3, s0
                  addi         t0, t4, 1058
                  mulh         a7, a0, a3
                  feq.s        a3, fs4, ft7
                  addi         s0, s8, 1047
                  fmul.s       fa2, ft9, fs4, rne
                  add          t5, a2, a4
                  auipc        s2, 777378
                  slt          s4, a7, a3
                  fcvt.s.w     ft0, s7, rtz
                  slt          s1, a5, s5
                  sll          ra, zero, s0
                  fsqrt.s      fa6, fa4
                  srai         s11, t2, 8
                  fsgnjn.s     fs3, fs0, fa6
                  fsgnj.s      fs1, ft2, ft4
                  rem          s3, t1, tp
                  sltiu        a4, s7, 386
                  or           t6, s7, s4
                  fsgnj.s      fs0, fs11, fa0
                  mul          a2, sp, t5
                  fmv.x.w      a5, fa6
                  fcvt.s.wu    ft8, tp
                  lui          tp, 137392
                  srli         s3, a0, 5
                  fcvt.wu.s    s9, fa2
                  fsgnjx.s     fa3, ft8, fa6
                  mulhsu       t6, a2, a3
                  add          a5, s1, a5
                  slli         s0, a6, 3
                  fmul.s       fs1, ft10, ft3
                  sub          s3, s4, s4
                  fdiv.s       fs4, fs5, ft1
                  srli         a1, s3, 12
                  auipc        a1, 123876
                  srl          a6, t4, t3
                  fcvt.s.wu    fs10, s10, rup
                  fle.s        s1, fs9, ft11
                  andi         s5, a4, -1240
                  fsgnjx.s     fs10, fs9, ft6
                  remu         s10, a6, s4
                  sltiu        a2, gp, -155
                  fcvt.wu.s    a5, fa7, rmm
                  mul          s11, a1, s6
                  sra          zero, zero, t5
                  rem          t3, s3, t4
                  divu         s10, s7, s3
                  fcvt.w.s     s9, fa2
                  fmv.w.x      fa6, a4
                  or           s1, t0, s7
                  or           a0, s2, sp
                  xori         t0, tp, 1715
                  xor          s1, tp, s11
                  addi         a4, tp, -1510
                  and          a5, s1, a3
                  rem          a0, s10, t1
                  mulhu        a7, s11, a3
                  lui          s3, 927499
                  auipc        ra, 961074
                  sltiu        t0, s9, 1449
                  sltiu        s10, s3, -1069
                  fmin.s       fa6, ft11, ft0
                  fcvt.w.s     a7, fs9, rdn
                  remu         a7, s11, a1
                  fcvt.wu.s    t4, ft10
                  mulhu        s0, s8, t6
                  sll          s8, s6, gp
                  xor          t5, s7, s11
                  srai         s3, s0, 6
                  sltu         s10, t6, t3
                  flt.s        s4, fs11, fs5
                  remu         ra, s7, s7
                  slt          a4, a7, s3
                  fmul.s       fa0, ft5, fa2, rne
                  and          gp, a7, t6
                  mulhsu       t1, sp, a3
                  mul          s3, s8, t5
                  fmv.x.w      s1, fa4
                  fcvt.s.wu    ft8, sp
                  mulhsu       t1, t2, a7
                  fdiv.s       fs10, fs8, fa2
                  srl          t6, s2, zero
                  fdiv.s       fs9, fs1, ft9, rdn
                  feq.s        gp, ft0, fs6
                  remu         a7, s5, a3
                  fcvt.w.s     tp, ft10, rup
                  feq.s        a2, fs7, fa4
                  add          s11, s1, a2
                  div          gp, tp, sp
                  sll          s10, s7, a2
                  sub          t2, a3, s7
                  fmv.w.x      ft9, a5
                  srl          s1, a0, s4
                  fsgnjx.s     ft7, fa3, fs6
                  srli         t0, a2, 2
                  slt          a0, gp, s8
                  andi         a3, tp, -618
                  fdiv.s       fa1, ft11, fa4, rup
                  addi         s2, a6, -525
                  divu         s5, s4, s5
                  xori         zero, s8, -39
                  and          t2, a4, a2
                  fmv.w.x      fa2, t6
                  sub          s2, a4, ra
                  addi         s11, a2, -796
                  fmax.s       ft0, fs9, ft11
                  andi         s3, a1, -1410
                  sra          tp, a0, s6
                  auipc        t3, 1039067
                  ori          t6, s4, 1357
                  fcvt.w.s     tp, fa6
                  addi         s5, ra, 925
                  lui          a5, 464282
                  auipc        s2, 456140
                  rem          t2, a1, sp
                  fsqrt.s      fs1, ft11
                  fmv.x.w      gp, fa6
                  lui          a3, 219322
                  addi         s3, gp, 336
                  mulhsu       s0, s9, t0
                  sra          s8, tp, ra
                  rem          a5, a6, a2
                  sll          a0, tp, s1
                  fsgnjn.s     fs6, ft0, ft3
                  divu         s5, sp, s5
                  sltiu        a1, s2, 1494
                  mulhu        s2, sp, s5
                  rem          s1, t4, t1
                  srai         a2, s0, 2
                  flt.s        zero, fs1, fs11
                  divu         a3, s0, a7
                  fadd.s       ft5, fs11, fa4, rdn
                  auipc        a2, 667711
                  or           s2, a3, t4
                  andi         s10, t0, 1050
                  lui          t5, 1021338
                  rem          s2, a7, s7
                  rem          a3, t1, s0
                  fmax.s       ft5, ft4, ft6
                  sub          t3, t6, s0
                  srl          a2, s4, tp
                  addi         zero, a1, -23
                  slt          t2, gp, s11
                  flt.s        t4, ft11, ft3
                  fcvt.s.wu    fa0, s7, rdn
                  fcvt.s.wu    fs2, s4, rmm
                  fsqrt.s      fs5, ft8, rtz
                  mul          a2, t4, gp
                  sll          t6, s4, s7
                  fcvt.w.s     a2, fs9
                  remu         s9, ra, t2
                  fcvt.s.wu    fa7, s0, rmm
                  fcvt.wu.s    s1, fs9, rtz
                  sra          a1, s10, a6
                  mulhu        t3, s11, s11
                  sltu         s9, s4, s6
                  fsub.s       ft10, fs6, fa6, rne
                  slt          s8, s4, s3
                  srli         gp, t5, 16
                  fcvt.wu.s    a1, fa4
                  remu         s2, s8, s8
                  fclass.s     s11, ft1
                  sltu         s9, a2, s9
                  mul          s5, a5, t5
                  nop
                  fmin.s       fa1, fs1, fs9
                  feq.s        ra, fa5, fa7
                  div          a3, zero, s11
                  divu         a6, t0, a7
                  fmv.w.x      ft6, a3
                  sll          s5, zero, s8
                  fsgnj.s      ft10, fs9, ft0
                  addi         t5, s7, 1533
                  xor          s3, s2, s7
                  fmul.s       fs4, fs8, fs2
                  lui          t4, 884504
                  andi         a5, a5, 308
                  fsgnjx.s     ft9, ft7, fs5
                  mul          t6, s4, t6
                  sll          ra, s2, s3
                  fcvt.s.wu    fa5, a5
                  fsgnj.s      fa5, fs4, fa0
                  fle.s        s4, ft5, ft7
                  fle.s        s3, ft4, fs3
                  feq.s        a5, ft6, fa2
                  sltiu        ra, gp, -999
                  flt.s        t0, fs9, fs0
                  fcvt.s.wu    fs1, s2
                  mulhu        s1, a6, a5
                  sltu         t5, a7, s2
                  or           zero, t5, s3
                  fmv.w.x      fa0, s10
                  mulh         a5, t5, s6
                  fadd.s       fs3, ft5, ft1, rup
                  fcvt.s.w     ft10, t0
                  and          s5, a2, a4
                  slt          a3, a4, s8
                  rem          t2, s0, zero
                  slti         gp, gp, -667
                  flt.s        a7, ft8, fa0
                  fcvt.w.s     t1, fa2, rup
                  sub          tp, s8, t0
                  nop
                  auipc        a3, 909732
                  fmv.x.w      s5, fs9
                  fcvt.s.wu    fa0, s10, rdn
                  sra          a2, t0, a7
                  fsgnjx.s     fa1, ft4, ft8
                  mulhu        s1, s10, s6
                  fdiv.s       fs4, fa1, ft8, rtz
                  fmv.x.w      zero, fa7
                  fcvt.w.s     t5, fs10, rup
                  fmin.s       fa2, fs10, fa1
                  mulhu        s9, a5, a4
                  fmul.s       fa6, fs3, ft3, rup
                  fclass.s     a6, ft2
                  fmul.s       fa6, fa2, fs8
                  srai         a1, gp, 19
                  xori         s11, s1, -1860
                  fmv.w.x      fa3, s6
                  fsqrt.s      ft1, fs7
                  fsgnjn.s     fs2, ft4, ft9
                  sltiu        t3, ra, -716
                  mul          s5, t0, a4
                  fle.s        t2, fs3, ft6
                  sltiu        tp, a7, 96
                  nop
                  fmul.s       fs3, ft4, ft5, rmm
                  fadd.s       fs0, fa4, fs11
                  fmv.x.w      a0, ft10
                  fle.s        s8, fs11, ft1
                  fmul.s       fs5, fa3, fa6
                  flt.s        t3, fa0, ft1
                  andi         zero, a1, -259
                  xor          s8, s1, s6
                  divu         ra, a1, zero
                  fcvt.s.w     fs9, a1
                  fsgnjn.s     fa5, fs6, ft8
                  divu         s9, t0, a2
                  slli         gp, s2, 22
                  fmv.w.x      fa5, a6
                  lui          t4, 852887
                  sra          t3, s3, s6
                  sll          tp, t2, t6
                  fadd.s       fs11, fs11, fs5
                  nop
                  sltu         s3, gp, t3
                  sra          t4, s4, a2
                  sltiu        s5, t2, 1379
                  sub          a2, s4, t5
                  xori         a0, a3, 966
                  sra          tp, s9, s6
                  divu         s10, zero, t4
                  fsgnj.s      fa2, ft1, fa6
                  ori          t1, t2, 1447
                  slti         s2, s5, -964
                  div          s10, a7, s2
                  auipc        t6, 39691
                  fadd.s       ft7, fs0, ft1, rmm
                  fsub.s       ft3, ft1, fs6, rne
                  slti         s11, s1, -1371
                  fcvt.wu.s    s9, fs11, rmm
                  fsub.s       fs8, fa2, ft6, rmm
                  addi         a2, t3, -367
                  fmv.x.w      s11, fa3
                  andi         s4, gp, 281
                  fdiv.s       fs7, fa5, ft8
                  lui          t0, 757362
                  rem          s9, a0, s6
                  fsgnjn.s     fa7, ft10, ft1
                  fsgnjx.s     ft7, ft6, fs0
                  xori         s10, t0, 783
                  add          zero, t4, a0
                  mulhsu       a1, a3, s0
                  lui          s10, 18213
                  fsgnjx.s     ft7, ft2, fs9
                  sltiu        t0, t6, 598
                  xori         s10, s2, -1029
                  divu         a3, a3, zero
                  xor          a5, t6, s3
                  rem          s0, a0, s3
                  fmin.s       fs6, fa2, fa2
                  rem          t6, t0, t6
                  xori         t1, t0, 1112
                  fle.s        a5, ft11, fa2
                  fle.s        t0, fs6, fs1
                  mulhsu       a3, s7, s8
                  fcvt.w.s     t5, ft10, rtz
                  fsqrt.s      fs3, ft3, rmm
                  andi         gp, a0, 1418
                  feq.s        s8, ft1, fa0
                  lui          t3, 842243
                  remu         s9, t3, tp
                  remu         gp, t6, a4
                  fmax.s       ft9, fs7, fa4
                  or           s5, s9, s8
                  fcvt.s.wu    fs10, s2, rne
                  fmv.x.w      s5, ft1
                  mulhsu       s9, a2, s9
                  fmax.s       fs7, fs7, ft11
                  srai         a2, a5, 26
                  xori         a2, s10, 785
                  xor          s5, s5, ra
                  xor          gp, a5, t0
                  fadd.s       fs3, fs9, fa2
                  fmv.x.w      a2, fa1
                  fcvt.wu.s    t0, ft3, rne
                  slti         s4, s5, -345
                  fsub.s       fs6, fa3, fa1, rne
                  add          ra, s8, t0
                  fcvt.wu.s    t6, fs5
                  sra          ra, a7, s1
                  andi         s5, a7, -1315
                  xori         t1, a4, 2005
                  fcvt.s.wu    fa3, a5, rmm
                  xori         s8, tp, -1126
                  sltu         s1, a6, a3
                  remu         s8, s3, s10
                  lui          s11, 327040
                  div          a3, t5, s6
                  fsgnjn.s     fa6, fa4, fs6
                  mulhsu       a3, a5, a3
                  fcvt.w.s     t0, fs10
                  fcvt.wu.s    t6, ft4
                  slt          a4, ra, t5
                  sltu         a4, gp, t1
                  fdiv.s       fs10, fa3, fa4
                  fmax.s       fa0, fa7, fa1
                  fmax.s       fa2, fa1, fa0
                  fsgnjn.s     ft5, fs9, fs10
                  fsgnjn.s     fs6, ft9, fs4
                  fsub.s       ft2, ft2, fa4, rtz
                  fle.s        t1, fa6, ft1
                  flt.s        t5, ft10, fa1
                  sra          t3, gp, ra
                  fcvt.wu.s    t0, ft2, rne
                  addi         t0, t0, 146
                  fsub.s       ft4, ft9, fs2, rtz
                  fmv.x.w      s10, ft1
                  rem          a6, t1, s0
                  fsgnj.s      fa0, ft7, fs1
                  fmv.x.w      s10, fs4
                  fmv.w.x      fa1, sp
                  fclass.s     a2, ft2
                  ori          a0, a7, -385
                  andi         t5, a5, 1974
                  xori         a6, zero, 1384
                  add          a4, t4, a2
                  or           s9, s6, s7
                  div          s11, s3, s4
                  rem          a5, t1, a6
                  divu         t2, a7, a7
                  fcvt.s.wu    ft4, t2
                  xor          a3, s5, a6
                  nop
                  fmv.x.w      a6, fa7
                  fle.s        a3, ft11, fs11
                  slt          s8, s1, s4
                  fcvt.w.s     s1, fs6
                  sra          s8, t2, t6
                  mul          s2, s2, s5
                  fsgnjn.s     fa6, fa5, ft7
                  mul          a6, t5, t6
                  sra          s8, a4, s9
                  sltu         s5, s4, s8
                  fmax.s       fa3, fs10, fa6
                  xor          t0, a7, s8
                  fcvt.wu.s    s0, fs2
                  and          t6, t3, s4
                  srli         s10, tp, 30
                  fle.s        s4, ft2, fs5
                  fle.s        s1, ft7, fa6
                  sltu         a4, s7, s3
                  fmax.s       fs3, ft3, fa5
                  mulhu        ra, s5, tp
                  or           t1, s10, s0
                  fcvt.s.wu    fa4, sp, rne
                  addi         t2, t4, -1128
                  xori         s1, s10, -1308
                  sltu         zero, a1, t4
                  sub          s10, a7, s10
                  divu         t6, a4, s0
                  div          a6, a0, sp
                  flt.s        a4, fa5, fs9
                  fsgnj.s      ft3, fs0, fs2
                  feq.s        a6, fa5, fa2
                  fmin.s       ft4, ft6, fs11
                  div          a7, tp, a3
                  fadd.s       ft0, fa6, ft4, rup
                  rem          a1, a5, t2
                  fmv.w.x      fs5, t6
                  fsgnjx.s     ft6, ft8, ft5
                  fsgnjn.s     fa7, ft11, ft0
                  fmv.x.w      gp, fs11
                  andi         t3, a1, 261
                  nop
                  sltiu        s9, a4, -2046
                  mul          t6, a2, t0
                  sltu         t4, a6, a0
                  fsub.s       fs4, fa7, ft4, rmm
                  fdiv.s       ft8, fs1, fs3, rup
                  ori          tp, t6, 1175
                  addi         a1, t2, 463
                  lui          s8, 33943
                  div          s5, ra, s9
                  sltu         t4, s4, s4
                  fle.s        s9, ft0, fs7
                  ori          a6, s10, 1248
                  div          a4, a3, a1
                  fsub.s       fs9, fs10, fa5, rmm
                  fsgnj.s      ft2, fs7, fs0
                  or           t6, sp, s11
                  sltiu        t4, a5, 857
                  fcvt.s.w     fs5, a1, rdn
                  slti         a7, t6, -1193
                  slti         a2, a0, 868
                  feq.s        s4, ft10, fa0
                  fmin.s       fa0, fa5, fs1
                  feq.s        a4, fs5, ft1
                  mul          s3, t2, ra
                  addi         s3, t1, -1735
                  fsgnjx.s     fa2, fs4, fs8
                  fmv.w.x      fs4, s1
                  flt.s        s8, ft4, fs11
                  remu         t6, t3, a2
                  sub          t5, s6, s1
                  add          zero, s3, a4
                  andi         s2, a7, 779
                  div          a6, a6, t4
                  sub          t3, s5, a5
                  sltiu        zero, tp, -1709
                  mulhu        a6, zero, a7
                  sltiu        a2, s6, -1900
                  feq.s        a4, ft9, fa1
                  andi         s1, s6, 1951
                  fmax.s       ft2, fa3, fa1
                  fsgnjn.s     ft5, ft8, ft5
                  slt          t2, s3, a2
                  srai         s4, s7, 25
                  srli         s2, sp, 11
                  feq.s        s9, fs11, fs7
                  mulh         s3, s8, a5
                  fmul.s       fs4, fs6, fs9, rne
                  xor          t1, zero, t3
                  srai         t5, s7, 29
                  auipc        t5, 831827
                  srai         t4, s7, 11
                  add          s8, t0, t6
                  fsub.s       fa5, fs2, fa1
                  sll          s4, a1, s7
                  srl          s10, t0, t0
                  fsqrt.s      fs3, fa0, rmm
                  srli         a5, s3, 21
                  xor          a6, t5, s2
                  mulhsu       t6, zero, a4
                  addi         a4, s2, 584
                  lui          t5, 614871
                  fcvt.s.wu    fa5, t3, rdn
                  auipc        gp, 25792
                  addi         a3, a0, 1909
                  slt          a6, s2, sp
                  mul          s0, s0, s4
                  mulh         t3, s10, t1
                  xori         a2, t2, -2045
                  ori          s9, s2, 176
                  slt          t4, s11, s4
                  lui          zero, 360697
                  remu         s11, s4, a0
                  sub          s8, s2, gp
                  addi         s9, s8, 832
                  sltiu        s3, t6, 2001
                  auipc        a0, 311451
                  fmax.s       ft2, ft5, ft0
                  remu         s3, a3, t2
                  andi         s1, s9, 1973
                  sub          t6, a5, s2
                  mulhu        ra, s5, a5
                  auipc        a7, 724145
                  sub          t1, a4, tp
                  fcvt.w.s     a5, fs4
                  flt.s        s11, fa6, fa4
                  srai         t6, t6, 13
                  fclass.s     a3, ft5
                  add          s3, gp, s10
                  andi         a0, s5, -69
                  mulh         s10, sp, s11
                  fmax.s       fs6, fa7, fs1
                  fmul.s       ft3, fa7, ft2, rtz
                  srl          s10, a2, a4
                  fclass.s     a0, fs7
                  addi         t4, a6, -837
                  fmin.s       fa5, fs5, fa1
                  xor          zero, s3, s3
                  fcvt.s.w     fa3, a7
                  lui          a1, 785360
                  fmin.s       fa7, ft4, fs6
                  flt.s        t0, ft5, fs11
                  fmul.s       ft5, fs4, fs11, rmm
                  fsgnjn.s     ft4, fa6, fs5
                  ori          t4, s0, -125
                  fcvt.s.wu    ft0, t1
                  flt.s        gp, fs10, ft11
                  mulhsu       s9, sp, t2
                  fcvt.s.w     fa5, t2
                  sltu         ra, a7, a3
                  slt          t1, t0, t2
                  fcvt.w.s     t0, fs1, rmm
                  slli         t3, t2, 2
                  fmin.s       ft11, fs8, fs8
                  fmv.w.x      fs2, t2
                  mul          s10, tp, a2
                  mul          t2, t1, s3
                  fcvt.wu.s    s0, ft10, rtz
                  fcvt.s.w     ft4, s0, rtz
                  sub          s11, a0, s10
                  flt.s        s10, fa1, fs2
                  mulhsu       a3, s9, a5
                  nop
                  divu         s0, sp, a2
                  sltu         t5, s2, s9
                  andi         s1, s5, -177
                  feq.s        t6, ft0, ft2
                  slli         s5, s7, 13
                  mulh         s5, tp, t4
                  xori         s2, s10, -871
                  feq.s        s4, fs2, fa0
                  fmv.w.x      fs2, a5
                  xor          t2, s0, s6
                  sltu         ra, t3, s1
                  xor          s11, gp, t0
                  lui          t2, 697405
                  fsqrt.s      fs6, fa6, rmm
                  fmax.s       ft7, fs3, fa0
                  srai         t2, t2, 25
                  fclass.s     t5, ft4
                  remu         a6, a0, a3
                  fmax.s       fs10, ft3, ft11
                  fsgnjx.s     fs2, fs0, ft10
                  mulhu        t5, t4, t0
                  auipc        s5, 672076
                  rem          t4, s8, ra
                  fclass.s     a7, fa2
                  fmv.x.w      tp, fa3
                  sltu         a6, t1, a0
                  auipc        a1, 501411
                  sltu         t3, a2, a5
                  fsgnjx.s     fa4, fa0, ft8
                  xori         gp, s3, -156
                  andi         a0, t1, 1102
                  auipc        t1, 791055
                  fcvt.s.wu    ft9, t6
                  fsgnjn.s     fs7, fa6, fs3
                  slli         tp, s11, 31
                  srl          s10, a7, s4
                  fmax.s       fs2, ft4, fa3
                  and          a0, s8, t6
                  slt          s3, a0, s0
                  rem          a7, s4, t0
                  slti         t5, a4, 895
                  fclass.s     gp, fs0
                  slli         a3, a3, 7
                  xori         zero, t4, 213
                  fcvt.s.w     fs9, t1
                  mul          gp, t2, s4
                  fcvt.s.w     fa4, a3
                  nop
                  fdiv.s       ft6, ft9, fs0
                  sll          s11, s4, s3
                  fclass.s     a1, ft5
                  andi         a0, a1, -852
                  fmv.x.w      s11, fs9
                  auipc        s8, 147098
                  lui          s5, 982486
                  fmul.s       ft7, ft6, ft11
                  fmin.s       fa0, ft11, fs10
                  fcvt.w.s     t4, fa7, rup
                  remu         t3, a4, t1
                  feq.s        s5, ft7, ft1
                  divu         t0, s6, s8
                  fdiv.s       fs2, ft1, ft1, rne
                  fmin.s       ft8, ft6, ft2
                  fsqrt.s      fs1, ft5, rtz
                  divu         a0, s10, s6
                  remu         gp, a1, a1
                  add          a4, s2, a5
                  or           s9, zero, a3
                  fdiv.s       ft5, fa1, fs6, rup
                  divu         a1, s1, tp
                  xori         ra, sp, 1244
                  srli         tp, t6, 1
                  sra          a7, s8, t1
                  fdiv.s       fs11, fs8, fs8, rne
                  fadd.s       ft3, ft5, fs4
                  addi         s3, t5, -14
                  mul          a1, a5, t4
                  mulhu        s8, t0, s4
                  fmul.s       fs7, fa1, ft3, rdn
                  fcvt.wu.s    s3, ft8
                  slti         s1, t3, 1630
                  nop
                  fsgnj.s      fs10, ft8, ft3
                  remu         a6, t5, s6
                  srl          a5, t4, s6
                  lui          s0, 79393
                  add          zero, t6, s0
                  sll          ra, zero, s5
                  fcvt.s.wu    fs11, s3, rne
                  divu         s4, s0, t6
                  fsgnjx.s     fa5, fs11, ft3
                  andi         t3, s4, 1378
                  auipc        t1, 891773
                  sll          s4, t4, zero
                  addi         a0, a2, -97
                  xori         a5, a0, -169
                  sll          a0, a5, sp
                  div          tp, s6, t1
                  addi         s10, a3, 1447
                  sll          t4, sp, gp
                  divu         a1, s1, s11
                  fcvt.s.w     ft11, t0, rup
                  sll          t5, s4, t6
                  slt          s4, s9, s7
                  fcvt.s.w     fa6, sp
                  fmv.x.w      s1, ft2
                  fmax.s       ft0, fa4, fs2
                  sra          s4, t3, t5
                  div          s11, s10, a5
                  mul          s4, t3, zero
                  flt.s        s1, fa5, ft5
                  rem          s1, a3, tp
                  and          s3, gp, a2
                  srli         s1, s4, 23
                  addi         gp, s6, 1523
                  fadd.s       ft9, fs2, ft8, rmm
                  fclass.s     a1, ft2
                  div          a6, a5, a6
                  fcvt.s.w     fs5, s3, rup
                  fadd.s       ft3, fs6, fs0
                  fcvt.s.wu    ft3, t2, rup
                  remu         t3, s9, tp
                  fmv.w.x      fs1, a2
                  srai         ra, a7, 4
                  fcvt.w.s     t6, fa0
                  mulhu        zero, s7, a0
                  fsub.s       ft10, fs7, ft3
                  slt          a1, s0, a5
                  srli         s10, a4, 0
                  fclass.s     zero, fs6
                  sltiu        a5, t4, -168
                  sub          s8, s2, s8
                  fle.s        s2, fs9, fs0
                  sub          s1, a1, t2
                  srl          ra, t5, s9
                  remu         a4, gp, t3
                  fclass.s     zero, ft4
                  slti         s9, s11, -1411
                  feq.s        a0, ft9, fs3
                  srli         a7, zero, 29
                  mulh         s10, s8, s8
                  xori         s8, t4, -1137
                  add          a1, a3, a7
                  fmin.s       fa5, fa3, fs10
                  fle.s        t6, fa0, ft2
                  lui          s2, 283609
                  fsgnjn.s     fa0, fa0, ft11
                  divu         tp, s9, a6
                  fmv.x.w      a2, fa2
                  fdiv.s       fs7, ft4, fs7, rtz
                  slti         s3, a0, 891
                  lui          t3, 546298
                  nop
                  fdiv.s       fs5, fa7, fs8, rtz
                  fmax.s       ft9, ft8, fs5
                  fclass.s     t6, ft7
                  srai         a1, a1, 21
                  xori         s10, gp, 10
                  fsgnjx.s     fs11, fs0, fs0
                  feq.s        s1, fs11, fa7
                  addi         ra, s11, 1914
                  fsgnj.s      ft10, ft0, fa1
                  sltiu        tp, t5, -900
                  sltiu        s11, a2, 184
                  slli         s0, s1, 15
                  fsgnjn.s     fa2, fs6, fs8
                  nop
                  slt          a5, s7, a6
                  mulhsu       gp, tp, s6
                  fle.s        s8, fa4, ft2
                  divu         s10, s3, gp
                  fcvt.s.w     fs10, s11
                  srli         s11, a4, 13
                  fle.s        a0, fa6, fs8
                  nop
                  fmul.s       ft1, fs7, fs10, rmm
                  fle.s        s1, fs1, ft10
                  auipc        ra, 1027389
                  fcvt.s.wu    fs11, t4, rtz
                  fmv.x.w      gp, ft4
                  xori         a7, t1, -704
                  and          t6, s6, t2
                  fclass.s     ra, ft7
                  sll          a7, zero, s2
                  fsgnjx.s     ft0, fs3, fs2
                  remu         s2, s10, s8
                  fadd.s       fa3, fs4, fs7, rdn
                  slti         t1, s6, -1005
                  div          a4, s2, s5
                  fsgnjn.s     fa1, fa3, ft0
                  mulhsu       s2, s10, s4
                  mul          s11, a4, tp
                  xor          t1, s1, t1
                  fmin.s       fs4, fs5, fs8
                  fmul.s       fa2, fa4, ft5
                  divu         s11, zero, s4
                  mulhu        a4, a0, s7
                  sltiu        s10, a3, -684
                  fdiv.s       fa1, fa0, fa6, rne
                  sltu         s1, a1, t4
                  div          a7, s10, zero
                  sltu         s9, s11, t1
                  fcvt.wu.s    a4, fs3
                  fclass.s     t2, fa3
                  xor          s8, t3, a5
                  or           t1, t3, s11
                  ori          a4, t0, -459
                  fmv.x.w      s2, fs11
                  rem          a4, t3, zero
                  slti         ra, s11, -1089
                  andi         a0, s2, -905
                  slli         a7, s1, 1
                  srai         s9, a6, 14
                  or           a2, s0, sp
                  fadd.s       fs9, fa4, fs2
                  sra          s11, a6, tp
                  remu         t2, a7, t2
                  rem          s5, s3, s8
                  and          ra, s4, a3
                  addi         a1, t0, 1631
                  fsgnjn.s     fa1, fa2, fs6
                  remu         s2, a2, a6
                  fcvt.w.s     a6, fs3, rtz
                  fsub.s       ft10, ft4, ft7
                  fle.s        a7, fs3, fa7
                  fcvt.s.w     fa1, t3, rne
                  feq.s        a7, fs6, fs11
                  remu         a5, a3, zero
                  mul          a2, s7, s10
                  fmul.s       fs7, fs8, fa7, rtz
                  rem          s3, t4, t1
                  fsgnjn.s     fs0, ft3, ft7
                  xor          t6, a6, t4
                  remu         a0, a7, t3
                  fle.s        zero, fa4, fa7
                  fmv.x.w      a4, fs5
                  and          s10, gp, s10
                  mulhu        s2, s11, s10
                  fmin.s       ft3, fa0, fs1
                  feq.s        s4, fa1, ft9
                  sltu         s4, a3, a4
                  fcvt.w.s     a5, fs0, rmm
                  mul          s0, s8, s8
                  fadd.s       ft7, ft6, ft7, rdn
                  slli         t1, s11, 23
                  nop
                  fsqrt.s      fa5, fs5
                  fle.s        s2, fs6, ft2
                  fmin.s       ft2, fs11, ft6
                  xori         a6, s6, -741
                  fmv.w.x      ft11, t3
                  slt          gp, a2, s10
                  sll          t5, t1, a7
                  add          zero, s6, sp
                  div          s8, s10, sp
                  mulhsu       t2, s6, s5
                  auipc        s1, 605160
                  addi         gp, s4, -625
                  auipc        a2, 369118
                  fmv.w.x      ft3, s6
                  fsqrt.s      fa4, fs7, rne
                  fclass.s     a7, fa6
                  rem          t5, s5, s4
                  fcvt.w.s     a1, ft5
                  slli         s2, s5, 31
                  fcvt.w.s     t6, ft4, rup
                  ori          s9, a1, 314
                  fadd.s       fa7, fa6, fa6, rtz
                  slti         t2, a4, -424
                  sltu         a3, a4, s6
                  fsgnjn.s     ft3, ft4, fs10
                  fcvt.wu.s    t2, ft4, rne
                  fmv.x.w      s4, ft7
                  div          a6, t5, t4
                  mulhu        a3, a4, a7
                  mulh         s5, t0, t0
                  fclass.s     s10, fs2
                  mul          t6, s0, a2
                  fcvt.s.w     fa3, s9
                  fcvt.wu.s    s5, ft8
                  fdiv.s       fs4, fa5, fs2, rdn
                  feq.s        a7, ft5, ft3
                  remu         gp, s9, tp
                  flt.s        a3, ft0, fs0
                  slt          t1, t2, a5
                  fmax.s       fa4, ft9, fs11
                  mulhu        a3, s1, a5
                  fcvt.w.s     a3, fa5, rne
                  fle.s        gp, fs9, fs6
                  mul          zero, a3, a4
                  fsgnjx.s     ft5, fs6, fa2
                  fmv.w.x      fs3, t4
                  fmv.x.w      a2, ft8
                  fmax.s       fs8, fs3, fs4
                  fle.s        s9, ft10, fs1
                  flt.s        gp, fs11, fs0
                  fmv.x.w      s11, fs3
                  feq.s        a4, fs2, fa0
                  srai         s1, s3, 8
                  div          s9, t1, a1
                  ori          t5, t4, -1306
                  fsub.s       ft4, ft3, fs3, rne
                  fdiv.s       ft10, fs6, fs1, rmm
                  lui          a6, 862221
                  sltiu        s3, a2, 1766
                  feq.s        t3, fs4, fa2
                  ori          a1, ra, 1169
                  slli         s5, t5, 23
                  sub          ra, t5, t5
                  fsub.s       fs2, ft9, fs9
                  sll          a6, a5, a2
                  xori         a5, s3, -498
                  remu         t4, a5, s0
                  fcvt.s.w     fa3, ra
                  and          s0, t1, s8
                  fcvt.w.s     s9, ft4, rmm
                  mulhsu       s2, t2, s5
                  srai         a0, s9, 4
                  divu         t5, a0, s7
                  auipc        s4, 986602
                  fsub.s       ft2, fs2, fs0
                  nop
                  auipc        s9, 963602
                  mulhu        s5, s3, s0
                  srai         s3, s3, 16
                  andi         s10, t3, -1833
                  sra          s1, a7, s7
                  fmul.s       fs10, fs0, fs1
                  fdiv.s       fa1, ft5, ft6
                  fmul.s       fs4, ft11, ft6
                  fadd.s       fs2, ft8, fs10, rmm
                  fsgnjn.s     fs5, fs4, fa7
                  flt.s        t6, fs8, ft6
                  mulhsu       a4, s10, s11
                  rem          t0, a4, a5
                  auipc        a2, 168609
                  xor          s5, s10, s3
                  sra          a2, s6, t3
                  fmin.s       fa7, ft5, fa4
                  addi         s3, s9, 880
                  add          s4, a0, s1
                  sra          s3, s6, a1
                  srli         s1, t6, 24
                  divu         s3, s4, s1
                  fadd.s       fs10, fs1, fs10, rdn
                  fsgnjx.s     fa1, ft4, ft0
                  fcvt.s.wu    ft1, gp, rne
                  ori          zero, tp, -1425
                  mulhu        s4, zero, a4
                  and          s3, s4, s2
                  or           s3, s6, s10
                  and          t0, s5, a6
                  mulhsu       s10, gp, t2
                  fmin.s       ft6, fa2, fa1
                  sll          s11, s3, a0
                  fcvt.wu.s    a1, fa5
                  srl          t3, a0, s6
                  add          s9, t6, s7
                  fcvt.w.s     s8, fs10
                  fsgnjx.s     fa5, fs9, fa7
                  fsqrt.s      ft2, fs10
                  and          a5, a7, gp
                  fadd.s       ft7, fa6, fs3, rup
                  fcvt.w.s     s10, fa3, rdn
                  slti         a2, t3, -521
                  fclass.s     t2, fs4
                  fsgnjx.s     ft4, ft10, fs8
                  fsgnjn.s     fa2, ft6, ft3
                  fadd.s       fs4, ft5, ft7, rne
                  feq.s        a0, fa1, fs4
                  xor          tp, sp, t6
                  andi         ra, s6, -1306
                  sll          s2, a3, t3
                  mul          s4, a0, a6
                  or           a3, sp, s0
                  auipc        t4, 526191
                  divu         t1, t6, s2
                  fdiv.s       fa1, fs2, ft8, rne
                  fsgnjx.s     ft1, fs7, fs2
                  fle.s        gp, ft10, fa3
                  fmin.s       ft2, fa4, fa3
                  rem          a1, s11, s9
                  lui          tp, 351320
                  fcvt.s.w     fa0, t2
                  xor          gp, s0, t3
                  fsgnj.s      fs6, ft9, fs0
                  fcvt.wu.s    t0, ft11, rtz
                  fsgnj.s      ft3, fa2, fs4
                  fcvt.wu.s    t1, fs9, rup
                  remu         a1, a4, sp
                  fcvt.s.wu    fs10, s0
                  fcvt.w.s     t2, ft6, rmm
                  sltiu        t1, s7, -1167
                  mulhu        s1, a1, s10
                  div          s4, a3, s7
                  mulhu        s8, s0, s4
                  or           t4, zero, a6
                  sll          s10, t5, ra
                  andi         s4, s1, -234
                  flt.s        a1, ft3, fs8
                  sra          t0, s10, sp
                  and          a3, a5, a4
                  fmv.w.x      ft7, t0
                  fcvt.wu.s    a7, ft11
                  fcvt.s.w     ft9, a3, rup
                  fsqrt.s      fa0, fa1
                  fclass.s     s5, ft1
                  fclass.s     s11, ft9
                  fcvt.s.wu    fs4, a1, rup
                  sltu         s3, a0, t0
                  add          s10, s5, t5
                  xor          s11, s2, ra
                  mulhsu       ra, s4, t5
                  srai         t3, s3, 23
                  mulhsu       t1, s10, s10
                  feq.s        t6, fs3, fa1
                  divu         tp, ra, a3
                  slti         a2, s3, 792
                  ori          s9, s10, -900
                  fsqrt.s      fa7, ft0, rne
                  sra          t1, sp, s10
                  fclass.s     a0, fa3
                  or           a0, sp, t2
                  fadd.s       fs0, fs6, fs6, rtz
                  fcvt.s.wu    fs2, s9
                  feq.s        s1, fa2, ft0
                  rem          a3, s8, s2
                  fmax.s       fa4, fs4, fa6
                  mulhu        a6, s11, t0
                  lui          s2, 546606
                  fmv.w.x      fs4, s10
                  mul          s2, s9, a7
                  nop
                  fsub.s       ft1, ft5, ft11, rdn
                  feq.s        t4, ft8, ft0
                  fsgnj.s      fa5, fa4, fs2
                  rem          s8, zero, s6
                  mul          a5, s5, t6
                  auipc        t4, 31367
                  fcvt.w.s     a4, ft6
                  srl          t5, a5, t1
                  fsqrt.s      fa5, fs4, rmm
                  flt.s        s8, ft6, fs2
                  fcvt.s.wu    fa1, t2
                  sra          ra, t2, t4
                  add          a5, t0, gp
                  srl          a4, a3, tp
                  fmv.x.w      ra, fa1
                  srai         a5, t0, 19
                  andi         a7, s10, -805
                  sltiu        t4, s5, 1260
                  andi         a4, t3, -2046
                  slli         tp, s6, 7
                  slli         s4, s1, 26
                  lui          s3, 67748
                  fclass.s     a7, ft8
                  fsgnjx.s     fa2, ft0, ft5
                  mulh         a6, t3, gp
                  slti         s2, s0, -1790
                  slti         a5, t5, 524
                  divu         s8, a5, sp
                  slti         a2, s0, 836
                  xori         zero, s0, 739
                  sub          zero, sp, ra
                  fsub.s       fa1, ft8, ft4, rmm
                  sltiu        a4, t2, -1960
                  fcvt.w.s     tp, fs11, rdn
                  sltu         a5, a7, gp
                  slli         a6, t1, 22
                  fsub.s       fa2, ft8, ft1, rup
                  fmax.s       ft1, fs11, ft6
                  andi         a1, t2, -1332
                  fle.s        t0, fa3, fa5
                  nop
                  or           t3, s7, a4
                  rem          s10, gp, s8
                  mulhu        tp, gp, s5
                  srli         s1, t4, 12
                  divu         s10, s2, t0
                  sll          a3, a6, a3
                  fmin.s       fs4, fa0, ft6
                  fmv.x.w      t3, fs9
                  fsub.s       fa7, fa3, fs11
                  fadd.s       fs9, ft8, fa7
                  feq.s        gp, fa7, ft8
                  div          t6, a5, s1
                  fsgnjn.s     fs10, fa1, fs11
                  fcvt.s.w     ft8, s6
                  fmv.x.w      s9, fs3
                  fsub.s       fs11, fa7, fs5, rtz
                  divu         t4, s10, s8
                  fle.s        ra, fa5, fa4
                  fsqrt.s      fs1, fa7, rtz
                  fcvt.w.s     s3, fa2, rtz
                  sub          s5, s2, a4
                  sltiu        a1, t3, 911
                  fmax.s       fa1, fs2, fa7
                  fmv.w.x      ft0, s6
                  fcvt.w.s     t3, ft6, rne
                  flt.s        a3, fs7, fa7
                  fcvt.s.wu    ft7, s4, rtz
                  fmul.s       fa1, fa0, fa5
                  fcvt.s.wu    fs1, a6
                  rem          gp, zero, a2
                  ori          a6, a2, -790
                  or           t1, s5, tp
                  mul          s2, s9, s2
                  ori          t2, s0, 955
                  fmv.w.x      ft5, t0
                  mul          t6, s8, a7
                  lui          a1, 978611
                  mulhsu       s3, gp, a5
                  fmv.w.x      ft1, s1
                  sra          t5, t6, t2
                  fsub.s       fs0, fs6, ft11
                  nop
                  fcvt.w.s     t2, fs0
                  andi         a2, tp, -1375
                  slti         s11, s7, -2046
                  fcvt.s.w     ft10, zero
                  flt.s        s10, ft11, fs9
                  and          s3, s7, s11
                  sll          t0, a7, t1
                  fmul.s       fs2, fs4, fs4
                  flt.s        s0, fs11, ft7
                  sltiu        a4, t4, 923
                  divu         a2, t1, s8
                  fsub.s       ft1, ft3, fs3, rmm
                  fsqrt.s      ft0, fs4
                  nop
                  and          t6, t1, a7
                  mulh         s8, s2, zero
                  slli         gp, s3, 5
                  remu         a0, s5, s4
                  remu         a3, t5, a4
                  fcvt.s.w     ft4, a1, rtz
                  fmax.s       fs10, ft6, ft3
                  mul          t2, t1, s0
                  fmax.s       ft10, fs8, fs1
                  sll          s5, t6, t1
                  fcvt.wu.s    s10, ft6
                  fcvt.s.w     ft1, s1, rtz
                  andi         s3, s5, 806
                  ori          s10, s5, 602
                  srl          t3, a7, ra
                  fsgnjn.s     fs8, ft11, fs2
                  slt          s2, s4, a5
                  sll          t5, s5, a4
                  rem          a3, t4, s6
                  fcvt.w.s     s0, fs5, rmm
                  fsgnj.s      fa4, ft9, ft5
                  sll          t0, s6, s10
                  fcvt.wu.s    s8, fa1
                  fcvt.s.w     fs3, a2, rmm
                  lui          tp, 455208
                  fmin.s       fs11, fs5, fa3
                  fsub.s       fs6, ft6, fs10
                  sll          tp, s3, a5
                  ori          s0, t1, 38
                  mulh         t0, sp, s8
                  fsqrt.s      ft10, fs4
                  fsgnj.s      fs10, fa1, fa0
                  fsgnjx.s     ft5, ft4, fs1
                  fcvt.w.s     t0, fs8, rtz
                  fclass.s     s11, ft6
                  addi         s0, sp, -1720
                  mulhu        t1, s4, gp
                  srai         a5, t5, 17
                  addi         t6, s10, 1474
                  fmv.x.w      a0, fs8
                  fcvt.s.w     fs5, s9, rtz
                  xor          a7, t4, a4
                  srli         tp, sp, 25
                  slt          t6, a4, s2
                  remu         t0, s1, t0
                  sltiu        t4, t0, -147
                  fadd.s       fa3, ft7, fs4
                  slt          t6, s5, s11
                  mulh         a1, ra, a2
                  fmv.w.x      ft5, s7
                  srai         t4, s1, 11
                  fadd.s       fs2, ft10, fa4, rup
                  fsub.s       ft9, ft0, fs6, rtz
                  srli         t4, t1, 21
                  slti         ra, a3, 1969
                  fcvt.s.wu    fa2, t6, rne
                  and          s1, t1, t5
                  fsgnjx.s     fs10, fs9, ft3
                  rem          a3, s4, t0
                  xori         a5, t2, -1307
                  and          t1, zero, a1
                  feq.s        a0, ft5, fs1
                  or           t3, gp, a6
                  fle.s        a6, fs0, ft1
                  fsqrt.s      fs6, fs5, rmm
                  sll          s5, s4, t5
                  remu         gp, t6, a1
                  sltiu        gp, t4, -615
                  fcvt.w.s     a5, fa0
                  fmax.s       ft8, fa1, ft5
                  fmv.w.x      fs10, s4
                  srl          t2, s7, s10
                  feq.s        s4, fs10, ft1
                  xori         ra, s5, -1853
                  fdiv.s       fa0, ft7, fs7
                  mulhsu       a7, t0, a3
                  fsgnj.s      fs3, fs8, ft2
                  slt          s2, a6, s10
                  or           s11, t0, t0
                  lui          t3, 577193
                  fcvt.wu.s    s1, ft3
                  remu         a3, zero, a4
                  andi         t3, a4, -306
                  mul          zero, t1, s4
                  fcvt.wu.s    s9, ft10, rmm
                  andi         t5, t0, 1041
                  add          s9, a6, s8
                  fcvt.s.w     ft10, s11, rmm
                  fadd.s       ft0, fs7, ft7
                  ori          t6, s7, -541
                  remu         t0, t2, t6
                  mulhu        t2, s5, t2
                  srli         a0, t2, 27
                  add          zero, gp, s8
                  divu         a4, a4, sp
                  mulhsu       a1, t3, t4
                  sltu         s0, s10, t1
                  mulhu        a3, s2, t2
                  mulhsu       a6, a3, s0
                  or           s0, s6, a7
                  fmv.w.x      ft11, t2
                  div          s2, sp, t0
                  add          s1, s5, s2
                  fdiv.s       fs4, fa0, ft8, rmm
                  fmin.s       ft10, fa7, fs10
                  fmv.w.x      ft11, sp
                  nop
                  xor          a4, s1, s8
                  sra          t6, a3, a2
                  sra          s4, s10, a4
                  fcvt.w.s     s0, ft6, rtz
                  feq.s        s5, ft11, fa7
                  nop
                  fmin.s       ft6, ft11, ft11
                  feq.s        t1, fs6, fa7
                  feq.s        a0, fs3, fa1
                  fmin.s       fa5, fa3, fa4
                  auipc        t2, 604671
                  slt          a2, s6, s9
                  fmin.s       fs9, fa5, fs7
                  div          t5, t0, s8
                  fadd.s       fa3, fa2, ft10, rtz
                  remu         s11, s2, a3
                  div          a7, s6, t2
                  add          s5, a7, t5
                  and          s8, t1, a1
                  slli         s11, tp, 6
                  remu         ra, a7, s4
                  fcvt.w.s     s9, ft7, rdn
                  rem          t4, s0, s11
                  fsqrt.s      fs11, fs0, rdn
                  fadd.s       ft7, fs4, ft8, rtz
                  fsqrt.s      fa0, fs3
                  mulhsu       s0, ra, s7
                  or           s2, a6, a4
                  sub          zero, a3, a0
                  and          s5, a1, t2
                  addi         a3, a2, -522
                  sub          a7, s0, a7
                  sltiu        s11, s4, -1515
                  slt          zero, t1, s9
                  remu         t5, t2, s11
                  sll          zero, a6, a0
                  fsqrt.s      fs11, fs9, rup
                  addi         s10, t4, -692
                  fclass.s     t4, ft3
                  andi         a6, s9, -960
                  fsgnjn.s     ft1, ft8, fa3
                  mul          t0, s10, gp
                  feq.s        s9, ft2, fs9
                  xori         t1, s1, -965
                  div          t4, tp, s7
                  auipc        a4, 624401
                  sub          s9, s0, a0
                  fsgnj.s      fs0, fs10, fa5
                  feq.s        t4, fs5, fa5
                  and          a3, s8, s2
                  fadd.s       fs5, ft10, ft4
                  slli         s11, s3, 6
                  mulh         a5, s2, a0
                  fsqrt.s      ft10, ft4, rmm
                  mulhu        a5, a1, a7
                  fmv.w.x      fa5, tp
                  add          t6, t5, s3
                  remu         t5, gp, a4
                  fle.s        s1, fa2, fs10
                  fmul.s       ft3, fa6, ft10
                  mul          ra, a3, t2
                  fcvt.s.wu    ft5, s11, rup
                  slti         t2, a3, 1645
                  div          s1, a4, s4
                  xori         ra, t4, 921
                  addi         a1, a6, -1327
                  fmax.s       fs6, fs11, fa2
                  fadd.s       fs1, ft11, fa3, rdn
                  fsub.s       fs8, fa0, fa5
                  xori         t1, a2, -139
                  sltu         s11, s2, t0
                  fsgnjn.s     fa2, fa0, fs3
                  xori         s2, s3, -919
                  addi         t0, s3, -1634
                  rem          a0, a3, a3
                  fcvt.w.s     t4, fs8, rup
                  fmv.x.w      s4, fa1
                  add          a3, t3, s3
                  fle.s        t2, fs2, fs1
                  fsub.s       ft9, ft2, ft7, rtz
                  srl          gp, t3, t1
                  fsgnj.s      fa6, fs10, fs1
                  fsgnjn.s     fa6, ft10, ft0
                  srl          ra, a4, s5
                  fsub.s       fs3, ft9, fs7, rmm
                  flt.s        t3, fa3, fs6
                  rem          s2, s11, t3
                  slti         t2, s4, 1932
                  remu         a2, t4, a0
                  remu         tp, s0, zero
                  fsgnjx.s     ft0, fa3, fa1
                  lui          gp, 1023632
                  or           s10, s0, s1
                  fmin.s       fs5, ft4, fs7
                  srai         s9, s0, 0
                  fmax.s       ft8, fa6, fa5
                  fdiv.s       fa1, fs5, fa0, rup
                  fsub.s       fs4, fs5, fs6
                  or           a6, sp, s11
                  andi         s10, t4, 1152
                  slt          s4, s6, s11
                  fcvt.s.w     fs9, t0, rtz
                  mulhsu       t4, s3, s1
                  fle.s        s8, ft6, fs2
                  divu         t5, zero, sp
                  or           s11, tp, t5
                  mulhu        s0, a1, s2
                  slli         t5, s9, 15
                  fsgnjx.s     fa3, fs8, fa6
                  rem          tp, s0, s4
                  fcvt.wu.s    t5, fa7, rne
                  sub          t6, s0, a1
                  fsgnj.s      fa4, fs11, ft8
                  mulhsu       t1, a4, t0
                  feq.s        gp, ft5, fs3
                  and          a3, a2, s7
                  fsub.s       ft8, ft0, ft1
                  ori          s10, s8, -1446
                  srli         s11, s6, 26
                  fmin.s       ft2, fa2, fa5
                  fmv.w.x      ft9, tp
                  fsgnjn.s     fa5, fs3, ft3
                  fcvt.s.w     ft2, t5, rne
                  fmv.w.x      fs11, t3
                  flt.s        s11, fs4, ft10
                  fcvt.s.wu    ft2, zero
                  flt.s        zero, fs3, fa2
                  slt          zero, a6, s3
                  xori         a2, t1, 728
                  feq.s        a5, ft7, fs4
                  remu         s3, tp, a1
                  fcvt.s.w     fs6, a0, rdn
                  sra          s5, a2, s2
                  fmul.s       ft2, fa3, fa0
                  add          s2, s10, t5
                  srl          s9, a3, s7
                  addi         t0, a2, -1320
                  nop
                  fcvt.s.w     fs11, a5
                  sltiu        s1, s6, 71
                  sub          t6, s8, a7
                  sub          a6, t5, s0
                  and          t5, s8, t0
                  slt          a6, t4, s10
                  fmv.w.x      fs11, s2
                  addi         s1, s8, 110
                  fsub.s       fs3, fa1, ft2, rne
                  slt          s9, s7, s1
                  sub          a0, a7, a0
                  lui          a1, 395337
                  fle.s        a1, ft9, fa3
                  fdiv.s       ft3, fa6, fs8
                  ori          t0, t5, -1447
                  slli         s0, sp, 22
                  fsgnjn.s     fa7, fs9, ft1
                  fsqrt.s      ft7, fa6
                  fle.s        t0, ft4, fs8
                  fclass.s     a7, ft0
                  auipc        t6, 328859
                  andi         t4, s11, -970
                  fmv.w.x      fa0, t6
                  xori         a0, s4, 2039
                  fmul.s       fs9, fa5, fa5, rtz
                  feq.s        t1, fa5, fs8
                  slli         t5, t1, 27
                  nop
                  or           s4, a4, a0
                  nop
                  or           s9, tp, zero
                  fcvt.wu.s    s10, fa1, rmm
                  sll          s8, s7, a0
                  xori         t1, a2, 122
                  fcvt.w.s     a0, fs4, rne
                  sra          s1, t2, tp
                  fsub.s       ft5, fs6, ft6, rne
                  fadd.s       ft9, ft9, fs1
                  fsgnj.s      fs6, ft7, fa4
                  lui          t1, 3522
                  remu         t6, a6, t5
                  sltu         s1, t3, t4
                  fdiv.s       fs10, ft4, fs6, rne
                  fmv.w.x      fa0, s0
                  sll          a1, t6, a4
                  fsgnjx.s     fa7, fs3, fa6
                  slt          t3, gp, a2
                  xor          a0, t3, s6
                  remu         s2, sp, s5
                  srli         s3, a6, 30
                  sltiu        t6, a3, -1264
                  and          zero, s10, s5
                  sub          t5, s5, a1
                  slli         s8, a6, 16
                  flt.s        a6, fs11, fa3
                  flt.s        a2, fa3, fa5
                  fmv.w.x      ft5, s3
                  sltiu        a0, t3, 901
                  sub          a1, t5, gp
                  xor          s1, t1, t0
                  mulhsu       a1, s2, s7
                  sltiu        a5, gp, -1535
                  sltu         t2, s5, s3
                  rem          s10, t0, t3
                  xor          s9, a2, s10
                  sll          s11, a0, s0
                  mulh         a6, a2, a4
                  remu         gp, s7, a0
                  rem          s0, s8, a0
                  sltu         ra, tp, s11
                  slli         a6, s8, 29
                  remu         s4, sp, s8
                  fmul.s       ft0, ft7, fs4, rne
                  sltiu        s2, tp, 1877
                  srai         s5, s6, 13
                  fadd.s       fs7, fa6, fs3, rmm
                  mulhsu       a2, s6, tp
                  ori          s1, ra, -731
                  fsgnjx.s     ft11, ft8, ft1
                  xori         s1, t6, -1296
                  slli         gp, a6, 1
                  srl          ra, t1, a3
                  srai         s1, t6, 3
                  sltiu        a0, s7, -674
                  nop
                  ori          a4, t3, 2026
                  srli         a7, t5, 16
                  mulhsu       s1, a4, a2
                  andi         a5, t1, -965
                  fcvt.w.s     s0, fs4, rtz
                  srli         t1, s9, 27
                  slli         s3, t6, 7
                  slt          t0, a7, s2
                  srai         a2, t6, 21
                  andi         s1, s3, -562
                  lui          t1, 534919
                  fcvt.s.wu    ft8, s0, rtz
                  sub          t1, a5, s11
                  fmax.s       fs8, fa2, fa2
                  fmul.s       ft0, fa2, fs9
                  slti         s8, s5, 241
                  addi         s5, a2, 563
                  fmv.x.w      s8, fs11
                  ori          a2, s10, 461
                  ori          s11, a3, 1919
                  fsgnjx.s     ft2, ft6, fs0
                  fcvt.wu.s    t4, fa5, rmm
                  fmv.x.w      a0, ft1
                  sltu         a6, t2, s3
                  fmv.w.x      ft2, t0
                  fmv.w.x      fa4, a5
                  sra          s2, s1, s11
                  fcvt.s.wu    ft4, s0
                  ori          t2, s3, 1758
                  div          s2, s11, ra
                  divu         s11, zero, a5
                  fcvt.w.s     tp, fa4
                  auipc        ra, 742590
                  remu         zero, t1, ra
                  fcvt.s.wu    fa5, s1
                  fdiv.s       fa5, fa6, fs7, rdn
                  and          s1, s0, s8
                  fsqrt.s      fa3, fs9
                  fsub.s       ft10, fs6, ft1
                  fcvt.s.w     ft11, a4
                  andi         a7, a0, -659
                  lui          a6, 566190
                  andi         t0, a2, 326
                  feq.s        t0, fa7, ft4
                  and          t4, a0, a2
                  fadd.s       ft3, fs6, ft4, rdn
                  mul          s4, t1, zero
                  auipc        s3, 156652
                  fclass.s     s10, ft6
                  fadd.s       ft0, ft4, ft0
                  sltiu        a5, zero, 1476
                  andi         s8, t5, -653
                  addi         t5, s8, 26
                  sll          ra, s10, s9
                  fsgnjx.s     fs11, fs3, fs10
                  srai         s2, s3, 27
                  or           t4, s7, s3
                  and          s4, s5, a5
                  fsgnj.s      ft11, ft7, ft1
                  fsgnjx.s     fs5, fs8, ft1
                  sra          a5, s1, t3
                  fclass.s     t3, fa6
                  srli         t4, t3, 23
                  slli         ra, s9, 3
                  lui          a1, 658352
                  fcvt.w.s     s4, ft11
                  andi         s8, a1, 1219
                  mul          a0, s6, s0
                  divu         a4, zero, s5
                  fmv.x.w      a5, fa6
                  fmax.s       fa6, fs11, fs2
                  sltiu        gp, a7, 1903
                  fmax.s       ft3, fs10, ft1
                  fmv.x.w      ra, ft6
                  sll          t1, s5, s11
                  nop
                  auipc        t5, 324811
                  or           a7, sp, s11
                  fmin.s       ft3, ft2, fs7
                  addi         t2, t0, 71
                  div          gp, t1, s7
                  fcvt.s.wu    fs0, a6
                  slli         t6, t5, 31
                  addi         a7, t4, 1987
                  sll          s10, s10, s5
                  fmin.s       ft8, fs10, ft5
                  sltu         s5, t5, s5
                  div          a6, t0, zero
                  fsqrt.s      ft1, ft6
                  sltu         t1, a7, s4
                  flt.s        tp, ft2, fs9
                  sra          t4, t6, s10
                  divu         s0, s4, t6
                  mulh         a6, a4, s2
                  mulh         s0, s3, a3
                  rem          s5, a7, t6
                  slt          s5, s4, s6
                  flt.s        t1, fa3, ft3
                  fcvt.wu.s    t0, fs7, rne
                  sltu         ra, a6, t4
                  fsgnjn.s     fa5, fa1, ft6
                  remu         a7, gp, t2
                  fsgnj.s      ft2, ft0, fs0
                  or           s2, t0, a1
                  auipc        a6, 265035
                  fcvt.s.wu    ft10, s7, rdn
                  fcvt.s.w     fa4, gp, rup
                  fcvt.wu.s    a1, fa4, rtz
                  fmax.s       fa7, fs1, ft5
                  fsqrt.s      fa1, fa4, rup
                  divu         s3, a3, t4
                  fmin.s       ft4, fs7, fs2
                  mulhu        s10, ra, s4
                  remu         t6, s9, t5
                  xor          s1, t4, sp
                  mulh         t4, t6, s6
                  fsgnjn.s     ft5, ft11, fs1
                  fmin.s       fa3, fs11, ft7
                  fsub.s       fa0, fs6, fs8
                  div          s9, tp, s2
                  xor          a6, s2, t6
                  lui          s1, 911296
                  flt.s        t2, fs3, fs7
                  mulhsu       a3, s7, s9
                  fmax.s       fa1, fa4, ft0
                  remu         s5, s8, a5
                  div          a0, s4, t1
                  slti         t6, s1, -1577
                  fmin.s       fs6, fs5, ft7
                  fcvt.wu.s    s4, ft0, rne
                  fsgnj.s      ft9, fs9, fs11
                  addi         a5, a1, 461
                  fcvt.s.wu    fa7, s6
                  slt          s4, s10, s8
                  and          t2, s0, t4
                  mulhu        zero, t0, t4
                  fmul.s       fs11, ft7, fs9, rup
                  add          zero, s3, a5
                  lui          s5, 44776
                  feq.s        s11, ft0, fs5
                  slti         s10, t1, 1853
                  and          gp, t4, s0
                  feq.s        a5, fa7, ft5
                  fmv.x.w      s0, fa2
                  srli         s9, a6, 15
                  divu         s10, sp, tp
                  fsub.s       ft0, ft1, fs4
                  slt          s5, s11, a3
                  and          s2, a5, s2
                  fmax.s       ft7, fa7, ft5
                  nop
                  sltiu        s1, s9, 672
                  srl          s3, a1, a1
                  srl          a3, s4, a7
                  fle.s        s0, ft7, fa6
                  mul          t2, a5, t5
                  fle.s        t4, fs4, ft4
                  fmv.w.x      fs10, s6
                  fmul.s       ft11, fa1, ft7
                  div          tp, a6, t0
                  fsgnjn.s     ft2, ft8, fa3
                  srai         s9, a4, 28
                  srai         tp, a1, 1
                  fsgnj.s      fa4, ft2, fa6
                  andi         gp, t6, 1119
                  slti         a5, t1, 924
                  fmv.w.x      ft11, t0
                  xor          s11, t0, a6
                  lui          t0, 384505
                  div          s1, t0, s5
                  fsgnj.s      ft0, fa2, ft7
                  sub          a1, s5, gp
                  and          tp, gp, a0
                  xori         tp, s7, 737
                  fle.s        t4, ft4, fa6
                  mul          s1, s10, a0
                  fmax.s       fs9, fa5, fa4
                  sll          a6, gp, a0
                  divu         a4, a1, zero
                  fle.s        s8, fa3, ft0
                  add          s10, t5, a4
                  xor          t1, a7, a5
                  fmul.s       fa2, fa0, ft2
                  sltu         s3, s2, t6
                  fmul.s       fs10, fs5, ft0, rdn
                  fmin.s       fs10, fs5, fa3
                  fmax.s       fs9, fs0, fa6
                  sra          a6, a7, zero
                  fcvt.w.s     ra, ft6
                  xor          t3, a7, a2
                  mulh         a1, s0, s5
                  fsgnjn.s     fs3, fs11, fs4
                  fcvt.s.w     fs10, s10
                  fadd.s       ft2, fs7, ft9
                  fclass.s     s0, ft10
                  fclass.s     a3, fs9
                  fcvt.wu.s    zero, ft10, rtz
                  sra          s0, t6, s6
                  mul          s5, a0, s3
                  fmax.s       fs10, fa2, fa0
                  fclass.s     s3, ft4
                  mulhu        t6, t6, s1
                  div          t5, a0, gp
                  lui          gp, 859884
                  fadd.s       ft4, ft9, fa7, rmm
                  fcvt.wu.s    t1, fs6, rup
                  srai         zero, tp, 10
                  fsgnj.s      ft0, fa0, ft1
                  srai         a7, s8, 28
                  sra          a7, s2, s1
                  feq.s        t0, fs1, fa4
                  sra          a2, a5, t4
                  mulh         ra, s7, s8
                  slli         a5, s4, 30
                  remu         s5, s0, a5
                  fcvt.w.s     t1, ft7
                  remu         s8, t2, a0
                  fmv.w.x      fa2, s11
                  add          t6, gp, a7
                  fmul.s       fa1, ft4, ft4, rmm
                  lui          a7, 331961
                  mulh         s0, s9, s7
                  div          t0, sp, s11
                  mulhsu       a4, t5, s3
                  fsqrt.s      ft10, fa1, rup
                  fmax.s       ft4, fa3, ft6
                  fmul.s       fs6, fs7, ft5
                  fmin.s       ft8, ft10, fs3
                  fsqrt.s      fs1, ft3, rne
                  ori          a5, t4, -864
                  slli         ra, s11, 21
                  fmin.s       fs10, fs7, fs6
                  div          s4, s1, s5
                  fcvt.w.s     t1, fa3
                  nop
                  remu         t3, s2, t1
                  fsgnj.s      fa3, fa1, ft4
                  fsgnj.s      fs6, ft5, ft6
                  fmv.w.x      fs9, t4
                  flt.s        a4, fa7, ft0
                  div          t1, s10, tp
                  slti         tp, s3, 1636
                  mulhsu       s0, s1, s0
                  sltu         s11, a7, t3
                  remu         zero, t2, a4
                  fsgnjn.s     fa0, fs2, fs7
                  mulhu        s3, s1, s3
                  mulhu        s2, s7, s8
                  mul          gp, s0, ra
                  andi         ra, s3, -1091
                  fmv.x.w      a4, ft7
                  rem          a1, zero, s9
                  add          a2, a1, s11
                  fcvt.w.s     s4, fa7, rdn
                  sltu         a7, tp, t1
                  fmin.s       fs3, ft1, fs3
                  add          ra, tp, t6
                  and          s11, gp, s6
                  fle.s        s8, ft0, fa2
                  fsqrt.s      fs5, ft10
                  addi         a7, a6, 1151
                  srl          gp, t0, a0
                  divu         s3, a2, t2
                  mul          s8, t2, t3
                  fsgnjx.s     ft9, fs11, fa7
                  remu         a4, t2, a1
                  sra          s10, a6, a6
                  nop
                  mulh         s9, s7, t2
                  div          t6, t5, ra
                  andi         tp, a3, 1878
                  nop
                  sub          a2, s10, a4
                  sltiu        s4, s7, 245
                  lui          s4, 930395
                  sll          s11, tp, gp
                  mulhsu       a5, s3, a0
                  fmv.x.w      t1, fa1
                  fcvt.s.wu    fs5, sp, rup
                  xori         s4, ra, -1586
                  fclass.s     s8, fa1
                  divu         a0, s10, s10
                  fcvt.wu.s    a5, ft11, rtz
                  andi         t0, s9, -587
                  sra          t5, t5, a7
                  srli         t5, t1, 19
                  srli         a2, tp, 17
                  sub          t6, a4, t6
                  fcvt.w.s     a4, ft2, rne
                  srai         gp, a2, 12
                  fmv.x.w      gp, ft9
                  nop
                  fsgnj.s      fs7, fs1, ft4
                  fmin.s       fa1, ft6, ft8
                  fadd.s       ft1, fa5, ft1
                  fadd.s       fa5, ft9, fa2
                  fdiv.s       fs1, fs9, fs7, rne
                  fcvt.s.wu    fs0, s11
                  fle.s        s8, fs4, fs2
                  fmv.x.w      t1, fs5
                  srl          zero, a1, t2
                  srl          t3, t3, s0
                  feq.s        t4, fa1, ft0
                  fcvt.s.wu    fs0, s5, rmm
                  sub          s5, s9, a5
                  fmv.x.w      s8, fa6
                  fsgnj.s      fs3, ft7, fa6
                  srai         gp, s3, 23
                  mul          s10, a7, s3
                  mulhu        a5, s1, a7
                  fclass.s     a4, fa1
                  fcvt.wu.s    s10, ft2, rdn
                  sltu         a4, t5, t6
                  sltiu        a1, gp, 296
                  sltu         a1, s1, a7
                  addi         t2, t4, 776
                  div          a1, s11, s11
                  sltu         a2, s10, ra
                  fle.s        t4, ft1, ft5
                  andi         s0, s4, -1255
                  fadd.s       fs7, fa3, ft7, rtz
                  feq.s        s9, fa4, fs3
                  fadd.s       ft2, ft2, fa6, rne
                  fcvt.s.wu    fs3, s9
                  fcvt.wu.s    t5, ft4
                  sll          tp, a1, a4
                  andi         s4, gp, 819
                  fsqrt.s      fa2, fs2, rne
                  add          t1, s7, s5
                  slt          s4, s8, a0
                  fmv.x.w      t6, fs10
                  rem          s9, s6, a4
                  fsub.s       fa3, ft10, ft0
                  slt          s2, a1, s5
                  nop
                  fsgnjn.s     fs5, ft4, fs4
                  addi         t4, s5, 821
                  sltiu        s3, s3, 977
                  fsgnjx.s     fa7, fa4, fs3
                  xori         s5, tp, -1079
                  fmax.s       fa0, ft3, fs7
                  mulhu        s3, zero, t2
                  sll          t0, s6, s8
                  mulhu        t1, s9, s5
                  sra          gp, a1, s1
                  mul          a7, s7, t0
                  xor          t4, s7, s6
                  fsgnjn.s     fs6, ft4, ft11
                  fmin.s       fs10, ft8, fs0
                  fsqrt.s      fs5, fs4
                  divu         t0, s1, s3
                  mulhu        a6, gp, s10
                  srl          t2, zero, s1
                  fmv.w.x      fs3, s3
                  slti         a1, a2, 30
                  fsgnjn.s     fs9, ft8, fs11
                  fmin.s       fa2, fa3, fa1
                  mul          t2, s7, gp
                  feq.s        gp, fs9, ft4
                  fcvt.s.w     fs6, t3
                  fmv.x.w      s4, fs4
                  mul          t6, a3, s7
                  sra          tp, s5, a3
                  fadd.s       fa7, ft1, fa3
                  srli         tp, tp, 15
                  fsgnj.s      ft0, fa2, fs10
                  slti         a2, s5, -721
                  fsgnjn.s     ft0, ft11, fs0
                  slt          a7, t6, s8
                  fsgnjx.s     fs4, ft1, ft0
                  fmv.w.x      fa3, s10
                  fdiv.s       fs0, ft5, fa5, rup
                  srli         s2, s5, 7
                  lui          gp, 303378
                  srl          a7, t6, s1
                  fcvt.s.wu    fs9, s10
                  slti         a2, zero, -186
                  mulhsu       t2, t0, tp
                  auipc        a3, 116964
                  mul          a5, s1, t5
                  fcvt.w.s     a5, fa0, rtz
                  fmv.w.x      fs10, a6
                  fcvt.w.s     t5, ft11, rmm
                  fmul.s       ft9, fs3, ft8
                  remu         gp, a4, s5
                  sll          t6, s2, t6
                  flt.s        gp, ft10, fa2
                  nop
                  xor          a0, a4, a5
                  slli         a5, ra, 13
                  mul          t0, s8, s9
                  auipc        a1, 573973
                  fmax.s       ft0, fs4, ft11
                  feq.s        a0, fa2, fa2
                  fsgnjx.s     ft7, fa3, fs9
                  ori          gp, s2, 881
                  fcvt.wu.s    t6, fs3
                  fmul.s       ft2, ft7, fa3
                  div          a2, a7, s11
                  srli         t5, a5, 25
                  mulh         s2, tp, sp
                  srai         s5, gp, 23
                  sll          s5, s7, t3
                  fcvt.s.w     fs6, s10
                  lui          a6, 422898
                  fmv.x.w      zero, ft6
                  flt.s        s0, ft5, fs4
                  fmul.s       fs6, fs1, fa3, rup
                  fsgnjx.s     fs6, fs1, ft3
                  fsgnjx.s     fs5, fs11, fa2
                  sll          s3, t2, s1
                  fcvt.w.s     a0, ft11
                  fmin.s       ft3, ft1, fs1
                  fcvt.s.w     ft10, a4, rdn
                  and          a1, tp, s6
                  fcvt.wu.s    s4, fs2
                  sltu         tp, a3, s7
                  lui          tp, 201226
                  andi         ra, s7, -668
                  sll          s9, zero, s11
                  fmul.s       fs6, ft4, ft7
                  fsqrt.s      ft6, fs2
                  fmax.s       fa7, fa4, ft3
                  fclass.s     s10, fs0
                  and          s4, s10, s11
                  fsgnjn.s     fs10, fs2, fs10
                  fcvt.w.s     a5, fs6
                  fsub.s       fs3, ft0, fs8
                  fsqrt.s      ft9, fs4, rdn
                  fdiv.s       fs3, fs0, ft1
                  add          t4, s6, a1
                  fsgnjx.s     fs8, fa2, ft3
                  slt          gp, s4, a6
                  srai         t5, s9, 10
                  fle.s        s0, fa2, ft2
                  fdiv.s       ft10, fs0, ft7, rdn
                  fmv.x.w      s11, ft8
                  srl          gp, a2, s4
                  add          a5, s4, sp
                  lui          t5, 56464
                  fsub.s       fa2, ft5, ft5
                  sll          s11, a4, sp
                  mul          t6, sp, s5
                  and          t4, s11, s1
                  fadd.s       fa4, fs4, ft6
                  fcvt.s.wu    ft7, a1
                  xori         t0, a6, 665
                  mul          a1, a2, a3
                  auipc        s1, 719666
                  feq.s        a6, ft0, fs11
                  mul          t5, a5, s11
                  slt          t6, sp, s0
                  nop
                  fsgnjn.s     fs5, ft2, ft11
                  fsqrt.s      ft9, fs6
                  sltiu        t0, a4, -20
                  fcvt.w.s     t0, fs10, rtz
                  and          s5, ra, a4
                  flt.s        s0, ft7, fa1
                  fmul.s       fa3, ft9, ft3
                  feq.s        t2, fs0, ft5
                  fsgnj.s      ft8, fs4, fs8
                  fcvt.s.w     ft6, t2, rne
                  fadd.s       fs1, fs8, fa1, rtz
                  feq.s        a5, ft6, fs4
                  xor          t1, ra, sp
                  sra          t6, s3, t2
                  mulhu        t0, t3, a2
                  sra          s10, sp, s4
                  sltiu        a5, a4, -1272
                  xori         s4, s3, -1377
                  feq.s        a7, fs1, ft6
                  srli         s0, s5, 16
                  fdiv.s       fs6, fs7, ft3, rdn
                  fmv.w.x      ft5, a6
                  slti         ra, t2, -1214
                  sltiu        s11, gp, 2027
                  fle.s        tp, fs10, fa6
                  ori          s4, sp, -1644
                  mulh         s4, s6, a0
                  fmax.s       fs9, ft1, fa4
                  fsgnjn.s     fs2, fs6, fs0
                  slli         s5, sp, 20
                  fmax.s       ft9, fa5, fa7
                  andi         a6, t5, -1691
                  fmax.s       ft2, fs4, fa3
                  sll          t4, a4, s6
                  sll          t4, s8, a4
                  ori          s11, tp, 1912
                  fcvt.s.w     ft3, t6
                  feq.s        a3, fs2, fa0
                  xor          s2, a7, t2
                  fcvt.s.w     ft0, ra
                  fsgnjn.s     fs4, ft3, ft6
                  sll          s3, s3, s2
                  xori         t0, s10, -1476
                  flt.s        t6, fs9, ft4
                  fcvt.w.s     s1, fa2
                  flt.s        t2, fa4, fa1
                  and          t6, a6, t3
                  srl          t3, t5, t5
                  lui          s9, 599320
                  fcvt.w.s     a0, fs2, rup
                  srl          ra, s9, t1
                  fdiv.s       fa3, fs9, ft11
                  fmax.s       fs9, fs7, ft9
                  fcvt.s.wu    fs8, a0, rdn
                  add          zero, t5, t5
                  slt          t5, s9, t2
                  xor          t6, a6, zero
                  fmv.x.w      a4, fa4
                  fmax.s       fs8, fa1, fs5
                  fcvt.w.s     t1, ft5, rtz
                  sltu         a5, s7, s8
                  srl          s10, a2, s11
                  fcvt.wu.s    s2, fs11, rup
                  xori         s5, s1, -694
                  sub          s8, t6, sp
                  fclass.s     a1, ft1
                  div          t6, s11, sp
                  slli         a0, a6, 27
                  mul          ra, s0, t5
                  fsgnjn.s     fs6, ft7, fs4
                  fsgnjn.s     fs9, ft2, fa0
                  fsgnjn.s     fs11, fa3, fa5
                  srli         a2, t5, 20
                  fcvt.wu.s    t2, fa1
                  slt          t6, a7, ra
                  fsgnjn.s     fa3, ft8, fs2
                  srai         s4, t2, 29
                  ori          s8, s0, 178
                  slti         a6, s6, -1124
                  or           s8, t5, tp
                  slt          s10, s8, a7
                  sra          s8, s10, t1
                  add          a7, ra, a4
                  mulh         s4, s2, a4
                  sub          a5, sp, s10
                  srl          a2, a6, s3
                  fcvt.s.wu    ft0, a1, rne
                  sltu         t4, s0, a6
                  fsgnj.s      fs6, fa6, fs10
                  srai         s8, t1, 21
                  sub          t1, sp, s11
                  fsgnj.s      fa2, fs11, ft10
                  mul          a1, s10, gp
                  srli         a6, t6, 16
                  fle.s        s3, fs1, fs1
                  sll          zero, s1, t0
                  xor          s8, t3, t4
                  andi         a0, tp, 475
                  fmv.x.w      t6, ft3
                  or           s11, t1, t5
                  fmin.s       fs6, ft6, fa5
                  andi         a5, sp, -1371
                  sltiu        zero, s1, -1899
                  slli         t4, s8, 22
                  and          s8, s7, s11
                  fmv.w.x      fs1, a7
                  sra          a5, s6, tp
                  nop
                  auipc        t2, 582057
                  fcvt.s.wu    fs3, s5, rdn
                  addi         tp, s9, 810
                  sltu         s4, s2, a4
                  srli         a1, t1, 21
                  fadd.s       fa7, fa2, fs8, rtz
                  fcvt.w.s     t3, ft10
                  mulh         s0, zero, a0
                  mulhu        a5, s8, s1
                  div          t0, a5, s7
                  fmul.s       ft11, fs10, fs2
                  ori          s11, s11, 1843
                  fcvt.s.w     fa2, a2
                  fsub.s       fs11, ft4, fs2, rdn
                  mulhu        a2, s0, a2
                  fcvt.wu.s    a0, fa0
                  mulh         gp, gp, t6
                  xori         tp, s0, -932
                  sltu         t3, sp, s4
                  sub          t0, a7, t6
                  mulhsu       a6, a6, s2
                  fle.s        a6, ft5, ft10
                  fmax.s       fs10, fa4, fs1
                  fcvt.s.w     fs6, s4
                  fmv.w.x      ft6, t1
                  auipc        s8, 499451
                  fmul.s       ft2, fs2, fs10, rne
                  mulhsu       s4, sp, s1
                  srai         t1, a5, 25
                  sub          s5, a3, s3
                  and          s5, a2, tp
                  or           ra, s9, s10
                  fsqrt.s      ft8, fa0, rdn
                  lui          t0, 926291
                  srai         s11, sp, 1
                  sll          s11, s11, t0
                  xori         s11, s2, -1284
                  fdiv.s       fs0, ft8, ft5
                  fsub.s       fa5, ft7, fa1, rmm
                  fclass.s     a3, fs5
                  flt.s        t4, ft11, ft4
                  sltiu        zero, a2, -1252
                  sll          s2, s4, s11
                  slt          s9, a7, a5
                  slt          zero, a3, zero
                  fsgnjn.s     fs8, fs5, fs3
                  fcvt.wu.s    s5, ft4
                  ori          a1, a7, -664
                  srai         t1, s3, 6
                  fadd.s       fs5, fs3, ft6
                  mulhsu       a3, t5, t5
                  srl          t0, t2, t1
                  slt          s2, t5, gp
                  fmul.s       fa5, fa2, fs7, rdn
                  fle.s        s4, ft10, ft10
                  fcvt.s.w     fs6, s7, rup
                  fcvt.s.w     fa7, a2, rne
                  sll          s9, t5, t6
                  fmv.x.w      a0, fs3
                  fadd.s       ft4, ft0, ft5
                  sra          t3, s0, a4
                  feq.s        s4, fa0, fs1
                  srl          a1, tp, a2
                  mulhsu       a6, t2, a0
                  and          s3, t0, a5
                  slli         zero, a4, 26
                  fmul.s       fa7, fs0, fs8
                  srl          tp, t2, tp
                  feq.s        t0, fs10, ft10
                  remu         s4, s5, a1
                  feq.s        s1, ft3, ft3
                  fsgnj.s      fa4, ft3, fs8
                  fcvt.s.w     ft4, a3
                  fsgnjx.s     fa6, fs2, fs1
                  mul          s9, s1, a2
                  fmv.x.w      a2, fa5
                  sub          s11, s9, tp
                  fcvt.wu.s    s4, fa5
                  slli         t3, a5, 1
                  slti         s8, s4, -1278
                  fmv.w.x      ft3, s2
                  div          a3, s6, a3
                  sltiu        s4, t3, -1596
                  sra          a2, ra, a7
                  fcvt.s.w     ft6, s8
                  fadd.s       ft1, ft11, fs3, rdn
                  ori          a0, a2, -1132
                  mulhu        gp, s5, t0
                  lui          t5, 32412
                  sltiu        s1, s2, 1588
                  fclass.s     a1, fa1
                  feq.s        s0, fs3, fs4
                  fle.s        t3, ft8, fs4
                  remu         s9, s11, s1
                  sub          tp, a7, t1
                  rem          s3, s3, t6
                  sltu         s1, t6, s3
                  auipc        t3, 925936
                  fsqrt.s      fa1, fa6
                  slt          zero, zero, gp
                  srl          a7, s3, s10
                  mul          s3, s10, gp
                  fmv.x.w      a3, fs7
                  add          t1, s7, s5
                  xori         gp, gp, -1479
                  auipc        a0, 793806
                  mulh         t0, sp, a3
                  nop
                  div          t4, s7, s2
                  mulhu        zero, a7, t2
                  fdiv.s       ft8, ft7, fs5, rdn
                  srl          t0, s7, a0
                  addi         s5, t1, -847
                  xori         t0, s10, 142
                  or           a5, t1, a5
                  and          s4, s4, s8
                  fmin.s       fa0, fa2, fs5
                  mulh         a3, s0, a5
                  ori          t4, a3, -241
                  fclass.s     a0, ft0
                  nop
                  or           s4, a2, s1
                  or           s4, s8, a3
                  fmv.x.w      t4, fa3
                  srli         t0, ra, 18
                  sll          s10, s9, s1
                  fcvt.s.w     ft7, s11
                  sub          a1, a1, s7
                  rem          tp, t1, ra
                  fmv.x.w      t3, fa2
                  srai         s0, sp, 1
                  fcvt.s.wu    fa2, s3
                  xor          a1, zero, a1
                  fdiv.s       fa6, fs9, ft5, rup
                  fmin.s       ft7, fs3, ft3
                  andi         t3, zero, -2000
                  divu         gp, t2, s7
                  xori         s0, s8, 1955
                  fmul.s       fs9, ft3, fa1
                  fcvt.s.w     ft8, ra, rne
                  fmv.x.w      s5, fs8
                  fmax.s       fa0, fs10, ft5
                  sub          s4, s8, gp
                  ori          s8, sp, 782
                  fmax.s       fs10, fs5, ft9
                  sub          gp, s0, s5
                  xori         s3, t0, -868
                  divu         a7, t6, s3
                  sltiu        a1, s7, 807
                  fadd.s       ft10, fs5, ft6
                  fmin.s       fs6, fs3, fs7
                  fle.s        a2, fa5, fs11
                  fcvt.s.w     ft6, a0, rne
                  flt.s        s1, ft9, ft9
                  mulh         t1, s2, s8
                  fadd.s       fa0, fs5, fa3, rdn
                  feq.s        s0, ft4, fs2
                  xori         s3, t2, 559
                  rem          a6, s11, t0
                  mulhu        t0, s10, ra
                  fmax.s       ft1, fs8, ft8
                  and          a7, t0, a7
                  fdiv.s       ft10, ft6, fs4
                  mulh         s3, s9, a1
                  sll          zero, s11, a7
                  rem          s1, t5, sp
                  fdiv.s       ft4, ft0, ft6, rup
                  fcvt.w.s     zero, ft4, rtz
                  slt          s4, ra, s1
                  fmul.s       ft9, fs8, fa7
                  sra          t3, gp, a4
                  auipc        a3, 441725
                  fmv.x.w      t1, fs6
                  srl          a7, t6, s11
                  lui          tp, 864752
                  mulhsu       ra, tp, a7
                  flt.s        a5, fs4, fs3
                  fmv.w.x      fs6, s9
                  fmin.s       fs3, fs8, fs1
                  fmin.s       fs3, ft2, fa1
                  slt          t0, t5, t2
                  fcvt.s.wu    fs0, s4
                  fmul.s       ft3, fs1, fa3
                  andi         a4, gp, 1934
                  nop
                  divu         t1, s10, t1
                  xori         tp, sp, 775
                  mulhsu       s0, t5, a3
                  fsgnjx.s     fs0, fs5, fs5
                  fmin.s       fa4, fs10, ft3
                  feq.s        t3, fs5, fs7
                  rem          t2, t2, t2
                  srli         s10, ra, 21
                  sltu         t1, a5, s11
                  fmv.w.x      ft10, tp
                  rem          t6, t1, a0
                  fle.s        gp, fs10, ft0
                  xori         s11, s6, -727
                  mul          s1, s2, s2
                  slt          a7, sp, s4
                  mulhsu       a2, t6, a1
                  fclass.s     s10, ft1
                  sltiu        s4, a7, -942
                  xori         s5, s10, -1833
                  fmax.s       ft3, fa6, fa6
                  slti         t0, s8, -1779
                  mul          gp, s5, a4
                  fclass.s     s8, ft0
                  srl          s5, a1, a5
                  srai         tp, a3, 12
                  feq.s        s3, ft10, fs7
                  or           s1, t6, s4
                  and          a2, a1, t1
                  srai         a7, tp, 14
                  fmin.s       ft6, fs4, fs5
                  feq.s        s10, fa4, fa6
                  fcvt.wu.s    a6, fa5, rup
                  fsqrt.s      fa4, fa4
                  or           s1, s1, t2
                  sll          ra, s8, t5
                  rem          t0, s3, s7
                  ori          a5, s6, 40
                  sltiu        s9, a1, -382
                  xori         a4, s11, 1909
                  fclass.s     s9, fs7
                  fcvt.s.wu    fs3, zero
                  mulhsu       s1, a7, sp
                  fmv.w.x      fa5, a2
                  slli         s10, s1, 15
                  sra          t0, s10, ra
                  fmv.w.x      fa1, a6
                  fle.s        a7, fs4, fs0
                  fsgnjx.s     fs7, fs6, ft6
                  nop
                  fclass.s     s10, ft11
                  fdiv.s       fs9, fa1, ft2
                  fsgnjn.s     ft9, fs6, fa7
                  fcvt.w.s     a4, ft0
                  nop
                  sra          t1, zero, s1
                  or           s2, s11, a1
                  div          a0, s3, a1
                  addi         a4, a1, -768
                  ori          a5, a2, 295
                  lui          s0, 625077
                  sll          s2, t3, a7
                  sra          t1, zero, s10
                  rem          s9, s10, sp
                  fdiv.s       ft5, ft5, ft9
                  sltu         a6, t6, a2
                  sltu         s5, sp, a5
                  fadd.s       fa3, ft3, fs0, rne
                  remu         a4, a1, t1
                  sltiu        t6, a7, 1600
                  mulh         a3, t4, sp
                  fmul.s       ft8, ft11, fs9
                  fadd.s       fs11, ft3, ft11, rtz
                  fcvt.w.s     s5, ft5
                  sra          s0, s11, a6
                  and          a2, s0, t1
                  div          t2, s7, ra
                  ori          zero, a4, 1020
                  lui          t6, 977876
                  sra          t0, a6, a0
                  remu         ra, s10, s4
                  fmax.s       ft2, fa0, fa4
                  fadd.s       ft4, fs9, fs2
                  mul          t4, s10, s2
                  fcvt.w.s     ra, ft8
                  sra          tp, s8, t5
                  sltiu        a4, tp, -1942
                  fmul.s       ft5, fs5, fa5, rup
                  divu         t6, s5, t4
                  fmin.s       fa5, fs0, fs4
                  add          a7, a3, t6
                  fcvt.s.w     fs9, t6
                  fmv.x.w      s3, ft3
                  fle.s        s10, fs10, fs5
                  xori         t0, s3, -840
                  slli         t0, s5, 7
                  fcvt.s.wu    ft8, a7, rtz
                  sub          s9, t2, s7
                  fcvt.s.w     fa3, s3
                  srli         s10, s0, 23
                  fclass.s     s3, ft9
                  flt.s        a2, ft1, ft5
                  fcvt.w.s     t3, fs4
                  sltu         s10, a6, s11
                  add          t1, s8, a5
                  fmul.s       fs1, ft10, ft2, rdn
                  fsgnjn.s     fs7, ft7, fa5
                  mul          tp, t0, s6
                  flt.s        a1, fs2, ft1
                  and          t5, s5, sp
                  slt          a6, a3, a1
                  rem          a2, gp, t1
                  fcvt.w.s     s2, ft4
                  fsgnjn.s     fs8, fs3, fa0
                  srai         s10, t6, 4
                  sra          s8, zero, a7
                  fsgnj.s      ft7, fs4, ft6
                  auipc        t5, 206123
                  fmv.w.x      fs8, s10
                  srli         s11, s10, 17
                  mulhsu       s8, s2, a5
                  fsqrt.s      fs2, fa6, rmm
                  xor          t2, zero, s8
                  fcvt.w.s     a0, fs5
                  remu         s8, a5, a0
                  srai         s10, gp, 7
                  fcvt.wu.s    gp, fs0
                  div          s2, a2, t4
                  addi         t5, tp, 623
                  fdiv.s       ft8, ft5, ft9, rtz
                  and          s10, s8, s2
                  fmin.s       ft6, fs8, ft9
                  xori         s9, t5, -964
                  auipc        s8, 899778
                  fsqrt.s      fs7, fs0
                  or           t3, s1, s1
                  fmin.s       fa6, ft0, fs4
                  fmax.s       ft10, ft8, fs4
                  sll          a1, s9, s0
                  mul          gp, s9, s3
                  fsqrt.s      ft0, fs11
                  fle.s        a4, fs5, fs0
                  fadd.s       fs10, ft1, ft1
                  slli         t2, a4, 12
                  mulh         t2, a4, a0
                  fle.s        s3, fs7, fs7
                  fcvt.wu.s    t3, fs5
                  flt.s        s4, fs2, fa3
                  fsgnjx.s     fa2, fs10, fa3
                  mul          a0, a4, s2
                  srai         s5, s4, 18
                  rem          t3, a5, a3
                  fmax.s       ft11, ft8, fs5
                  srai         s0, t5, 28
                  fcvt.s.wu    fs6, s11
                  fsqrt.s      ft7, ft3
                  sll          s4, a6, a6
                  fsgnjx.s     fs6, ft10, ft6
                  fclass.s     s10, ft10
                  fmin.s       fs11, ft3, fa7
                  fmax.s       ft10, fa7, fa1
                  fadd.s       ft5, ft4, fa5, rdn
                  mulhu        t2, a6, tp
                  srli         s8, s7, 13
                  addi         ra, a2, 145
                  fsgnjx.s     fs4, ft2, fa1
                  slti         s1, a7, 855
                  fadd.s       fa5, ft10, ft6
                  rem          t3, t1, zero
                  mul          s10, sp, t5
                  fcvt.w.s     s0, fs10, rne
                  divu         a3, a2, s9
                  div          s3, s6, s11
                  fdiv.s       ft8, ft3, fa6, rtz
                  mulhsu       gp, s8, t2
                  fcvt.s.w     ft7, s6
                  sll          a2, s8, s3
                  sub          a6, a6, s3
                  fmul.s       ft2, ft5, fa0, rmm
                  slti         t6, s5, -1989
                  fmin.s       fa7, ft1, fa4
                  feq.s        t4, fs1, ft8
                  fdiv.s       fa1, fa7, fs6, rdn
                  slt          s10, s11, t1
                  fsgnjn.s     ft4, ft8, fa4
                  fmax.s       fa0, fa5, fs4
                  fcvt.s.w     ft2, a4, rdn
                  or           t0, t2, a3
                  mulhsu       ra, a7, zero
                  fle.s        s11, ft3, fs9
                  fmul.s       fa5, fa5, fs0
                  mul          gp, s7, gp
                  flt.s        s3, fa1, ft0
                  fmax.s       fs3, ft9, ft5
                  andi         s2, s3, 1566
                  ori          s4, s5, 53
                  sll          s2, a7, s4
                  andi         a1, s10, 526
                  fle.s        s5, fs8, ft9
                  fle.s        s3, fs6, ft0
                  srl          a4, s0, a1
                  fclass.s     a7, fs8
                  sltu         tp, s9, t5
                  and          s1, t0, a1
                  xor          zero, s2, t6
                  sll          ra, a4, tp
                  fadd.s       fs8, fa0, ft2, rne
                  fsgnjx.s     fs10, ft4, fs3
                  fmv.x.w      tp, fa2
                  fsqrt.s      fs6, fs8, rdn
                  fsqrt.s      fa6, fa5
                  fdiv.s       fa7, fs1, ft3, rtz
                  fmax.s       fs11, ft4, fa7
                  div          t1, a3, t3
                  andi         a0, s11, -625
                  fsgnj.s      fs0, fs7, fs5
                  srl          s2, t6, a7
                  xor          a3, s8, zero
                  lui          a7, 589942
                  and          s8, s4, t1
                  fadd.s       ft10, ft5, fa2, rmm
                  slli         a4, a3, 3
                  divu         s9, s9, s6
                  fdiv.s       ft4, ft1, ft10
                  fcvt.wu.s    a4, fs11
                  fmax.s       ft0, ft8, fs6
                  fcvt.wu.s    t4, fs10, rtz
                  fsgnjn.s     ft10, fs11, fs7
                  fcvt.s.wu    ft9, t4, rup
                  fcvt.w.s     s5, fa1
                  srai         a6, t3, 17
                  srl          t5, t5, zero
                  fsub.s       fs2, fa1, fs8
                  fclass.s     s1, fs1
                  or           a1, a4, a0
                  srl          s11, s2, t5
                  fcvt.wu.s    s2, fs7
                  nop
                  fmv.w.x      fa7, t2
                  fadd.s       fs1, fs10, fs8, rtz
                  fsgnjn.s     fs2, ft9, ft10
                  fmul.s       ft6, fs4, fs4, rup
                  and          t1, s0, t1
                  fmv.w.x      fs7, a3
                  xor          t6, s5, a0
                  fsgnjn.s     ft1, fs3, fs5
                  xori         t3, a3, 829
                  mul          s3, t5, t5
                  mulh         s11, a3, a4
                  addi         t5, s5, 949
                  feq.s        t3, fs1, ft1
                  remu         a3, s8, t6
                  div          s3, s4, s5
                  or           zero, s0, t6
                  xori         a4, s4, 1083
                  fcvt.s.wu    fa5, gp
                  fsgnj.s      fa2, ft3, ft10
                  fmv.x.w      s0, fs2
                  add          t1, ra, a6
                  mulhsu       t1, s3, a0
                  slt          a1, s8, s4
                  mulhu        a3, t1, s10
                  mulhsu       a4, a5, a3
                  div          gp, t0, s9
                  sltiu        s4, sp, -1023
                  fsgnjn.s     ft1, fs6, fa4
                  ori          t3, s11, 1163
                  xor          t4, t1, s10
                  fmin.s       ft2, fs1, ft8
                  div          t4, ra, sp
                  slt          zero, s11, a4
                  mulhsu       t5, s2, s10
                  and          t6, a1, s3
                  mulhu        a7, t6, a2
                  sub          gp, s4, s6
                  auipc        s2, 632911
                  flt.s        s3, fs2, fs2
                  ori          a5, t6, 770
                  fcvt.w.s     s0, ft4, rmm
                  and          a5, t5, s7
                  srl          s9, t6, a7
                  mulhu        t4, s0, s4
                  fmul.s       ft7, fa0, fs0
                  divu         a4, a1, s5
                  fcvt.wu.s    a0, fa5
                  div          gp, a1, ra
                  srli         s4, t2, 18
                  sltiu        s10, a3, -994
                  fsgnjx.s     fs9, ft0, ft6
                  mul          a7, t1, s11
                  auipc        s10, 819003
                  fcvt.s.wu    fa0, sp, rtz
                  fdiv.s       fs1, fa3, ft3, rne
                  sra          a2, a0, a0
                  div          s2, t2, a4
                  fdiv.s       fs10, fs6, fs7, rup
                  mulhu        a1, t4, t6
                  slti         ra, s9, -484
                  fle.s        a1, fs4, ft4
                  srli         a7, s11, 2
                  fdiv.s       fs9, ft9, fs7
                  slli         s5, a3, 21
                  srli         s2, a4, 19
                  fsqrt.s      ft2, fs8
                  slti         zero, t3, 1455
                  or           t5, s4, a1
                  div          s2, a0, s7
                  feq.s        t1, fs6, ft7
                  xor          s8, a0, t3
                  or           s1, t5, s1
                  slli         s4, sp, 16
                  fsgnjx.s     ft7, fa1, fa1
                  rem          zero, t3, s5
                  remu         a5, t4, s6
                  and          a7, s8, s4
                  andi         t4, zero, 1779
                  sll          a0, s10, s4
                  lui          a5, 341795
                  srai         s11, tp, 13
                  div          t2, s8, s7
                  fmul.s       ft8, fs0, fa5, rtz
                  add          s5, a0, s1
                  fmin.s       ft7, ft11, ft3
                  fcvt.s.w     fs4, zero
                  mulhsu       a4, s4, s6
                  div          t5, t2, s2
                  mulh         t4, a4, s3
                  lui          tp, 165034
                  mul          a0, a1, s9
                  srai         s2, a2, 28
                  srli         a1, s6, 11
                  feq.s        s4, fs5, fa5
                  sltiu        a4, t2, 1464
                  addi         t3, a6, 283
                  xori         t2, zero, 1856
                  flt.s        s8, ft5, fs6
                  or           a2, t5, tp
                  fmul.s       fa7, fa3, fs4
                  lui          a2, 365933
                  fsgnjx.s     fs0, fs9, fa5
                  auipc        t0, 453363
                  fmv.w.x      fs2, s0
                  fadd.s       ft4, fs6, fs4
                  fle.s        t6, fs3, fa3
                  xori         a6, a4, -466
                  fcvt.s.wu    fs2, s8, rmm
                  fsgnjx.s     fa5, ft6, ft6
                  mul          s2, s10, a6
                  fdiv.s       fa5, ft5, fa7, rne
                  nop
                  mulhsu       s2, s5, t6
                  divu         t5, a0, t3
                  fmax.s       fa1, ft4, ft3
                  slli         t3, a0, 1
                  sltiu        a1, s7, 1611
                  flt.s        s3, fs3, fs1
                  sub          t6, tp, s6
                  sltu         s9, t0, s10
                  xor          a5, gp, s7
                  fsub.s       fs8, fs1, fa4, rmm
                  lui          t3, 57728
                  fsub.s       fa3, ft3, fs9
                  andi         gp, a6, -38
                  fcvt.wu.s    a6, ft5
                  sltiu        s9, t0, 338
                  fmv.x.w      zero, fs5
                  auipc        t6, 894820
                  fcvt.w.s     s0, fa2
                  sltiu        ra, t2, 707
                  divu         s11, zero, s1
                  fmax.s       fs10, fa3, ft4
                  mulhu        s1, s11, a5
                  fcvt.s.w     ft6, s7
                  mulhsu       s2, t4, s11
                  addi         s3, ra, -840
                  fmv.w.x      fs5, a7
                  and          s2, s4, s0
                  fmin.s       fs3, fs1, fs11
                  srl          zero, s2, gp
                  fsgnjn.s     ft2, fs3, ft4
                  mulhsu       s8, s2, s4
                  fmul.s       fs2, fa5, ft2
                  fclass.s     s0, fs8
                  fdiv.s       ft3, ft2, fa2
                  mulhu        s4, a6, a6
                  sltiu        t4, s10, -539
                  srli         t3, s2, 0
                  fsgnjn.s     fs7, ft3, fa4
                  mulhsu       t3, t1, t4
                  sub          t5, a5, a7
                  xor          gp, a1, s4
                  rem          a2, t1, sp
                  fmax.s       fs11, ft3, fs6
                  remu         zero, ra, s4
                  auipc        s10, 280477
                  fdiv.s       fs11, ft1, fs2, rmm
                  div          s5, s8, s8
                  sub          a1, s11, s9
                  flt.s        t5, ft9, ft7
                  fsgnjx.s     fs5, fs8, fa0
                  fsgnjx.s     fs9, fs2, ft5
                  sltiu        a2, s5, 1565
                  fclass.s     s3, ft9
                  nop
                  remu         t2, a0, t6
                  andi         s0, s0, 1557
                  sltu         a2, a7, t4
                  fsub.s       fs5, ft5, fs0, rdn
                  fmv.x.w      s3, fa5
                  slli         t3, s7, 7
                  fmax.s       ft11, ft5, ft9
                  fsgnjn.s     fa6, ft4, fs1
                  fsgnjn.s     fs0, ft3, fa6
                  divu         s10, a4, s2
                  srai         s9, t5, 24
                  flt.s        s5, ft6, fa3
                  or           tp, tp, t3
                  mulhu        s9, s7, sp
                  fsgnj.s      ft7, fa3, ft11
                  fle.s        s2, ft11, fa6
                  srl          a3, s8, s10
                  div          s11, a3, t5
                  divu         t6, s9, a7
                  fsgnj.s      ft8, fs2, fs7
                  sltiu        s1, s7, -192
                  fmul.s       fa5, fs7, fa6, rmm
                  slti         a7, s9, -1696
                  fsgnj.s      fs7, ft10, fa2
                  or           ra, zero, s7
                  fsgnjn.s     fs2, fs11, fs10
                  sltu         a5, s3, a4
                  fmul.s       fa0, fa0, fa6
                  mulhu        tp, s2, s3
                  slti         tp, t0, -1136
                  fmv.w.x      ft1, sp
                  flt.s        s11, fa0, ft9
                  auipc        a5, 509341
                  slt          s8, a5, a1
                  slti         s11, s8, -728
                  sltiu        s1, s4, 760
                  srai         a7, ra, 6
                  nop
                  fsgnjx.s     fs11, ft9, fa1
                  sub          s3, s0, gp
                  mul          s4, s3, a1
                  flt.s        a6, fs11, fs2
                  div          t2, t3, gp
                  and          s4, a1, ra
                  srli         s4, s0, 3
                  fmin.s       fa0, ft7, fa4
                  divu         t1, gp, s1
                  addi         a1, s8, 460
                  nop
                  fsgnjx.s     fs0, fa5, ft8
                  fle.s        s8, fs2, fa3
                  fsgnjn.s     ft8, fa3, ft4
                  mulhsu       a5, a4, s1
                  srai         t4, a3, 17
                  fle.s        t6, fs4, fa5
                  rem          t6, s6, t5
                  auipc        s0, 11802
                  andi         t2, s7, -1594
                  add          a1, a6, a5
                  fcvt.w.s     s1, fa4, rne
                  lui          s3, 708134
                  mulh         a5, a7, t5
                  lui          t4, 1024331
                  fmin.s       fa7, fa0, ft7
                  rem          a5, a5, tp
                  fcvt.w.s     s5, fs11, rmm
                  mulh         t4, t6, zero
                  sll          s8, t2, s1
                  slti         s3, t1, 1389
                  addi         gp, gp, -1214
                  add          a1, s5, s2
                  fmv.w.x      ft8, a0
                  xori         s1, t3, -781
                  slti         a2, s4, 1793
                  rem          t3, ra, t5
                  fmax.s       fs8, fs7, fa5
                  div          s0, t6, t2
                  fmin.s       fs5, ft10, ft10
                  or           zero, a6, a4
                  srl          zero, a7, s10
                  srai         t4, a7, 17
                  sltiu        t5, a6, -1429
                  feq.s        s11, fa1, ft10
                  xor          a0, t3, t6
                  fcvt.s.w     ft10, s7
                  sra          t4, s10, s6
                  div          zero, t0, s5
                  add          s10, zero, t0
                  andi         a4, s1, -1381
                  mulhu        a4, s5, ra
                  srl          s1, a6, s11
                  sltu         s4, gp, a0
                  mulhsu       s10, s6, s3
                  mulhsu       t0, sp, s10
                  sub          s1, a5, a3
                  fcvt.wu.s    a7, fa6, rdn
                  fmv.w.x      fs8, a5
                  slli         ra, a0, 19
                  sltu         gp, t1, s0
                  ori          s8, a1, 280
                  srl          a6, a2, t6
                  srai         a6, zero, 21
                  slti         a2, sp, -605
                  srli         a5, zero, 15
                  slti         a3, t1, 779
                  fsgnj.s      fs10, ft8, fs9
                  feq.s        a2, ft2, ft7
                  mul          a1, s7, zero
                  fmv.x.w      t6, fs2
                  remu         gp, s1, t4
                  fle.s        t6, fs7, fa7
                  sltiu        a2, s1, -98
                  mulh         tp, t0, s1
                  srli         ra, s11, 20
                  fmax.s       fa4, fs10, ft4
                  addi         s9, a7, -1179
                  mulh         a6, t2, s10
                  srai         t3, s1, 28
                  div          a1, t6, ra
                  fmv.w.x      fa4, t3
                  fadd.s       ft5, fa6, fa3
                  addi         a0, s11, 181
                  fsqrt.s      ft5, ft9
                  srl          s2, s11, t5
                  fmul.s       fa1, fa5, fa4
                  fsgnjx.s     fs9, ft3, fs0
                  sll          t2, t2, t3
                  fmax.s       fs7, fs11, fs6
                  fcvt.w.s     t6, fa2
                  mul          t5, a2, t4
                  auipc        a2, 806829
                  mulh         t6, a4, ra
                  fmv.w.x      ft9, a7
                  ori          s5, t5, -1177
                  fsgnjn.s     fa4, fa3, fa1
                  flt.s        a4, fs1, ft8
                  lui          a7, 529165
                  fsgnj.s      ft8, fa4, fa4
                  srli         t1, ra, 19
                  slli         a3, s8, 2
                  remu         s3, t4, sp
                  fclass.s     ra, fs6
                  fcvt.w.s     t0, ft10
                  srl          s5, ra, t2
                  fcvt.w.s     ra, fa3, rup
                  xori         s4, a0, -317
                  mulhu        a5, s9, a7
                  div          t2, a0, a5
                  andi         a1, s3, 1734
                  fclass.s     s9, fs5
                  mulhu        tp, t5, t3
                  ori          a7, s3, 721
                  sltu         tp, a4, s11
                  xor          tp, ra, t3
                  mulh         a2, sp, tp
                  remu         zero, a3, ra
                  sll          s1, ra, s4
                  slli         t3, t1, 28
                  fclass.s     t4, fa6
                  fle.s        s11, fs6, fa3
                  and          t0, t2, gp
                  mulhu        s0, a3, a4
                  slli         s2, gp, 14
                  fmin.s       ft6, fa7, ft10
                  mulhsu       t4, a3, s7
                  fsgnjx.s     fs2, fa7, ft8
                  fsgnj.s      fs0, fs6, fa1
                  fcvt.wu.s    s11, ft10
                  fcvt.w.s     s0, ft7, rmm
                  or           a1, a6, t6
                  fdiv.s       ft0, fs1, fs8
                  fmax.s       fs6, fs8, fa4
                  xori         s1, s3, -174
                  sltu         s0, t6, t4
                  feq.s        t6, fa1, fs6
                  mulhu        tp, s10, t4
                  nop
                  fmul.s       ft4, fs10, ft11, rtz
                  and          s3, a2, a1
                  or           a4, t6, s0
                  add          a3, s4, tp
                  fdiv.s       ft7, ft4, fa5, rmm
                  divu         t4, a5, t4
                  fmul.s       ft11, fa7, ft8, rne
                  fmv.w.x      fs8, gp
                  sltiu        gp, t4, 777
                  sub          s4, a1, zero
                  divu         t0, t5, tp
                  fsgnj.s      ft5, ft1, ft0
                  flt.s        s4, ft0, ft7
                  rem          zero, t6, t6
                  andi         s4, s11, 2031
                  div          a7, a6, tp
                  srli         t3, s9, 22
                  andi         gp, sp, 206
                  slt          t4, a4, s1
                  mul          gp, a4, a4
                  fclass.s     tp, fs11
                  sll          s3, a0, a1
                  srai         s9, a5, 27
                  srl          a2, a7, t2
                  nop
                  fclass.s     s11, ft5
                  add          t6, a3, s3
                  srl          s1, a2, t0
                  slt          t0, s5, s6
                  mulhsu       s2, s5, t4
                  fmin.s       fs10, ft5, ft11
                  mul          s10, t0, s10
                  fmv.x.w      t0, fa2
                  add          t5, s7, a0
                  slti         s0, s4, -982
                  divu         a4, s1, t1
                  fadd.s       fs10, fa6, fa4, rmm
                  fcvt.w.s     a3, ft6, rne
                  remu         t6, s10, t6
                  sub          ra, s11, a3
                  add          s1, tp, s5
                  fsgnjx.s     fs3, fa0, fs7
                  fmul.s       ft5, fa7, ft3
                  flt.s        s2, ft2, fs6
                  mulhsu       gp, s2, gp
                  mulhu        t4, a7, s11
                  sltiu        s11, s9, -1655
                  fsqrt.s      ft6, fa2, rmm
                  fdiv.s       fa0, ft6, fa4, rne
                  slli         a7, sp, 26
                  addi         t1, t4, 1193
                  srai         ra, t0, 12
                  feq.s        gp, ft4, ft7
                  fclass.s     s1, fs5
                  and          t6, a6, tp
                  slti         a2, a5, 175
                  srai         s10, s8, 24
                  or           s0, t4, s3
                  fclass.s     s4, ft8
                  addi         a3, t4, 357
                  slti         t2, ra, -771
                  fsqrt.s      fa3, fs0
                  fmin.s       ft9, fa4, ft0
                  div          a4, a2, a7
                  fmin.s       fs11, fa7, fs5
                  fcvt.w.s     t4, fa1, rtz
                  sltiu        ra, s0, 986
                  fcvt.wu.s    a6, fs3
                  lui          a5, 165799
                  remu         s9, gp, gp
                  xor          ra, t5, t6
                  flt.s        a6, ft2, fs0
                  fsub.s       ft7, ft4, fs4
                  xori         a1, s11, 2026
                  srai         zero, s4, 16
                  sra          t0, s7, a5
                  fmin.s       ft6, ft7, ft6
                  addi         a7, s7, -1646
                  xori         s10, ra, -939
                  sub          zero, a5, s5
                  feq.s        t2, fs4, fs2
                  ori          ra, s1, 1262
                  andi         tp, t0, -1020
                  fsgnjn.s     ft4, fs5, fa0
                  mulhu        s5, zero, s0
                  fcvt.s.wu    fs8, s9, rne
                  div          a5, t0, t4
                  slli         a6, t2, 11
                  fcvt.s.w     ft3, t4
                  fsqrt.s      ft4, fa5, rne
                  fmin.s       fa6, ft3, fs11
                  fsub.s       fs6, ft7, fs0, rtz
                  flt.s        t3, fa5, ft7
                  nop
                  ori          s2, a6, -209
                  nop
                  fadd.s       ft4, fa2, fs10
                  fadd.s       fs11, ft5, ft6
                  rem          s3, s10, s9
                  fsgnjn.s     fs2, fs9, fs1
                  sltiu        a2, s2, 1462
                  fclass.s     gp, fa1
                  fmin.s       ft10, fs4, fa3
                  mulhu        t0, s2, s6
                  xori         a6, a4, 1766
                  fcvt.w.s     t3, fs4
                  fcvt.w.s     s10, ft8
                  fclass.s     t5, fs3
                  mulh         a7, s3, s5
                  andi         s8, t0, 895
                  div          t2, a6, zero
                  fsgnjx.s     ft1, fs7, ft7
                  fmin.s       ft0, fs6, fs8
                  mulh         tp, s3, s0
                  fsgnjx.s     fs10, ft10, ft3
                  or           s9, s4, t0
                  or           t1, s1, s8
                  lui          t1, 882101
                  addi         a2, a2, 1514
                  fle.s        s5, fs8, ft5
                  sll          s9, t2, a0
                  fadd.s       fs5, fa6, fs9
                  mulhu        s5, a3, a4
                  fsgnj.s      fa6, fs4, ft7
                  and          a7, s6, t4
                  fmv.w.x      ft7, a1
                  ori          s2, s11, 1177
                  sub          s1, a0, s10
                  flt.s        s2, fa6, ft6
                  fcvt.w.s     a2, fa0, rmm
                  rem          a2, t5, a0
                  sub          s3, ra, tp
                  slti         gp, s10, 86
                  and          a2, a2, tp
                  ori          s11, a2, -1453
                  fcvt.s.w     fs4, t4
                  and          t5, a2, t2
                  addi         a6, t5, 1159
                  fadd.s       fs1, ft11, fa2
                  mul          gp, a6, a2
                  or           a3, a7, s2
                  mul          s2, a0, t1
                  fmin.s       fs7, ft0, ft4
                  sub          s3, a7, sp
                  mulh         gp, a4, a3
                  xor          t4, ra, s5
                  lui          t5, 535267
                  add          s11, t1, s10
                  fmv.x.w      s5, ft11
                  remu         a7, t1, sp
                  fcvt.wu.s    s2, fa2
                  mulh         a0, s1, t1
                  slt          s10, a4, t0
                  or           s5, a1, s5
                  sll          s9, t1, s9
                  fsgnj.s      fa2, ft10, ft1
                  mulhu        ra, a1, t6
                  fadd.s       fs7, ft9, fs11
                  ori          t3, s4, -1570
                  fmv.w.x      fs4, sp
                  fmul.s       fa4, fs4, fa2, rup
                  div          a1, t6, a2
                  xor          s1, tp, s8
                  xori         a2, s9, 619
                  fmv.x.w      t0, ft0
                  fclass.s     a0, ft2
                  fcvt.w.s     t4, ft11
                  sll          t3, s7, t3
                  rem          gp, t5, a5
                  slti         a0, a0, -1124
                  fcvt.w.s     t5, ft1
                  slt          zero, t4, zero
                  ori          t4, a7, 602
                  fsgnjn.s     fs5, ft0, fs6
                  div          s2, t5, a2
                  slli         a0, s8, 15
                  divu         ra, s6, s4
                  fle.s        s1, fs4, fs2
                  sltiu        tp, t6, 1148
                  feq.s        s2, fs5, ft8
                  auipc        s9, 590109
                  xor          s2, s1, a0
                  feq.s        zero, ft10, fs8
                  srli         t5, s4, 8
                  feq.s        a4, fa1, fa0
                  sub          t5, s11, s6
                  srli         gp, a3, 21
                  srai         a0, sp, 19
                  fsgnjx.s     ft5, ft6, fs4
                  fclass.s     tp, fs10
                  sra          ra, t1, s3
                  fmul.s       fs0, ft7, ft3, rup
                  rem          s3, a0, t1
                  sra          a4, t2, t0
                  fclass.s     s1, fs4
                  nop
                  feq.s        a2, fa4, fs1
                  srl          a4, t2, t2
                  fadd.s       ft6, fs2, fs11, rne
                  fsgnjx.s     ft5, fs7, fs6
                  slt          t2, a4, s5
                  fsgnj.s      fs4, fa3, fs0
                  fcvt.s.w     fs10, gp, rne
                  fle.s        a7, fs2, fa7
                  fsub.s       fs10, fs9, fs9, rdn
                  fmv.w.x      ft7, s2
                  remu         s1, a2, s2
                  fmv.w.x      fs2, t3
                  addi         t5, s8, -1533
                  srli         s2, s1, 22
                  mulhu        s0, a6, a3
                  srai         s8, t5, 10
                  xor          a2, s4, zero
                  fcvt.wu.s    ra, fs10, rne
                  divu         t1, tp, s8
                  fmin.s       fa0, ft11, fs4
                  divu         t0, a4, s7
                  fsgnjx.s     ft10, ft11, ft6
                  srl          a7, t3, s11
                  addi         a4, tp, 219
                  flt.s        t5, ft5, fs1
                  slli         s0, ra, 17
                  or           t1, tp, t3
                  sll          s8, t6, s1
                  auipc        a6, 962476
                  div          zero, s10, t2
                  feq.s        t5, fa3, fa5
                  fsqrt.s      fs11, fs10, rtz
                  feq.s        t1, ft0, fs1
                  sltiu        t2, ra, 821
                  fsub.s       fa4, fs10, ft8, rup
                  mulh         ra, s8, t6
                  mulhsu       s0, s6, s8
                  fclass.s     zero, fs0
                  lui          tp, 45597
                  sltu         t0, t0, s1
                  fcvt.wu.s    s10, fa6, rtz
                  feq.s        t6, ft8, ft7
                  srai         s10, t0, 25
                  fmv.x.w      s11, fa5
                  add          s2, a6, s4
                  rem          t5, s5, gp
                  fclass.s     s5, fs8
                  fsqrt.s      fa1, fs2
                  mulh         s3, a1, a7
                  sltu         ra, a5, s8
                  fsgnjn.s     ft3, fa0, fa5
                  fmin.s       fs1, fs11, ft1
                  or           zero, s11, s0
                  fmul.s       ft5, ft4, fs0
                  fsgnjx.s     ft7, fs2, fs2
                  feq.s        a3, ft10, fs4
                  fdiv.s       fa7, ft3, fs1
                  fmax.s       ft4, fa3, fs6
                  fle.s        gp, fs10, fs8
                  remu         t6, s2, t3
                  fclass.s     t4, fs5
                  fdiv.s       ft9, fs9, fs11
                  sra          t1, t3, t1
                  xor          zero, t4, a2
                  sll          a4, gp, t5
                  fsgnj.s      ft11, ft6, ft0
                  sub          s11, s4, t1
                  fmin.s       fs0, fa5, fs5
                  div          t2, s7, s9
                  srli         t5, s5, 19
                  andi         a4, a1, 288
                  div          s2, s3, t6
                  fmin.s       fa2, ft7, fs6
                  fmin.s       fs11, ft11, ft2
                  fsqrt.s      fa7, fa2
                  fdiv.s       fa7, fa2, fa5
                  fle.s        a3, fs5, fa0
                  sll          t2, sp, s5
                  fadd.s       fs6, ft3, fs9, rne
                  sra          a1, s6, gp
                  fsqrt.s      fa3, fa1, rup
                  fcvt.wu.s    s4, fa3, rne
                  fmv.x.w      t4, fa0
                  slti         t3, a3, -542
                  sltiu        a3, t5, -1425
                  sra          a2, sp, s5
                  srai         s10, s1, 12
                  auipc        t5, 416823
                  srli         s5, t2, 18
                  fmv.w.x      fs1, t5
                  fcvt.s.wu    fs5, gp
                  flt.s        s1, fa5, ft11
                  fdiv.s       ft2, ft7, fa1
                  sltu         a5, a1, s8
                  fmax.s       fa2, fa3, fa1
                  add          s9, gp, gp
                  fcvt.wu.s    s3, fa1, rmm
                  remu         t4, t0, sp
                  divu         s11, a0, t5
                  fdiv.s       fa1, fa1, fs11, rdn
                  fmul.s       ft5, fs10, fa5
                  and          t3, s5, a0
                  sll          t4, s3, t0
                  sub          s10, s2, t0
                  andi         a7, a2, 1134
                  fclass.s     s0, fa6
                  sub          s4, s1, a7
                  fsqrt.s      fa6, fs6
                  and          s9, a5, t0
                  fmax.s       fa1, fa2, fa3
                  mul          s8, a2, a7
                  lui          t1, 1037469
                  fmin.s       fa1, fa4, ft7
                  fclass.s     t6, fs10
                  slti         t3, s5, 1483
                  fcvt.wu.s    t2, fs5
                  fmv.x.w      a4, fa3
                  sltiu        tp, s11, -1773
                  sltu         s9, t1, s0
                  divu         t6, a6, t1
                  remu         s4, t2, s6
                  fmin.s       fa1, fa1, ft5
                  slt          s9, t6, t3
                  nop
                  mulhu        a4, sp, t2
                  fmv.w.x      fa4, t3
                  sll          s5, s1, t6
                  addi         a5, t5, 1715
                  fsub.s       fa1, ft5, fa6, rmm
                  addi         a7, s0, -318
                  sra          ra, ra, s5
                  fsgnjn.s     ft2, ft11, fs0
                  nop
                  xori         gp, s7, 111
                  addi         s0, a0, 1766
                  srli         a1, sp, 17
                  andi         a6, a2, -208
                  mulh         t3, s10, t1
                  fmv.w.x      fa4, s8
                  fmv.x.w      t5, fs9
                  fadd.s       ft11, fs1, fs10
                  sltu         gp, a2, t4
                  sub          s11, s9, a2
                  sub          a7, gp, s1
                  fsgnjn.s     fs6, ft7, ft7
                  rem          a3, s3, s8
                  fsub.s       fs8, ft0, fs2
                  fclass.s     s9, ft6
                  fcvt.s.w     ft7, a2, rtz
                  mulhu        zero, s0, s1
                  fcvt.wu.s    t5, ft1, rtz
                  divu         s0, a1, a1
                  div          s5, s7, s11
                  srli         s3, t3, 24
                  xor          t0, s3, gp
                  divu         t6, t1, s9
                  fsgnjx.s     ft4, fs9, fa6
                  auipc        s1, 63753
                  slt          a4, a6, s3
                  srai         a7, t0, 2
                  or           tp, zero, gp
                  fsgnjn.s     ft8, fa2, fs4
                  xor          s11, gp, a2
                  fmv.x.w      a0, ft6
                  fsgnj.s      fs4, fs11, ft7
                  sll          s0, a1, a6
                  mul          a4, s7, t1
                  fdiv.s       fs3, ft3, fs0, rdn
                  fcvt.w.s     s8, ft8
                  fsub.s       ft11, fs11, fa7, rtz
                  fsqrt.s      fa5, ft1, rtz
                  fcvt.w.s     a0, fa7
                  srli         tp, a7, 13
                  fsub.s       fs9, fa1, ft1, rmm
                  fmul.s       ft3, fs9, fs0
                  xor          s10, t2, a4
                  sltu         t3, s2, s10
                  remu         s11, t0, zero
                  sra          gp, s0, a4
                  mulhsu       s2, a1, s11
                  andi         t5, a2, -260
                  divu         a3, s10, s3
                  addi         a3, s9, -697
                  andi         gp, s7, -70
                  xori         t1, t0, 1939
                  mulh         t2, t0, t0
                  sra          s9, t3, sp
                  andi         a5, a5, -29
                  fmin.s       fa7, fa2, fs7
                  fsgnjn.s     fs0, ft5, ft4
                  fsgnjn.s     fs10, fs10, ft7
                  sra          t2, a2, tp
                  mul          t4, s10, ra
                  fcvt.s.wu    fs5, gp, rmm
                  slti         t3, t0, 1805
                  fdiv.s       fs11, fa1, fs4
                  fmin.s       ft8, fs6, ft11
                  fsgnjx.s     fa5, fa2, fs3
                  fmax.s       fs7, ft11, fa6
                  mul          t4, t1, a4
                  fsgnj.s      ft4, ft7, ft1
                  slli         a3, t4, 20
                  xori         s11, ra, -1776
                  fsgnjx.s     fa6, ft6, ft1
                  feq.s        a7, fa1, ft2
                  xor          s10, s2, t0
                  fmv.w.x      fa3, ra
                  fsgnj.s      ft7, fa5, fa7
                  slt          t5, t5, a0
                  sltu         a1, s2, s5
                  xor          s4, gp, t2
                  srli         s3, a0, 21
                  fmin.s       ft8, fs10, ft7
                  rem          a0, s3, a0
                  add          s4, sp, t6
                  fmax.s       fa4, ft3, ft3
                  fsgnj.s      fa4, fa3, ft6
                  fmul.s       fs6, fs7, fs6
                  srli         s4, t1, 29
                  flt.s        a2, fs3, ft0
                  fmv.x.w      s3, ft4
                  slt          t5, s9, t4
                  srl          a4, s3, s3
                  sub          s9, t0, a4
                  divu         t1, s8, zero
                  or           s2, t1, a0
                  fclass.s     s1, fa7
                  andi         s9, t0, -274
                  add          a2, s1, s1
                  andi         a1, zero, -1656
                  fsgnj.s      ft2, fa0, fa7
                  sra          s2, s1, s0
                  fmv.w.x      fs9, a7
                  or           t1, a0, s3
                  addi         s8, t3, -423
                  slti         a4, t2, -261
                  xor          s3, sp, gp
                  srl          s3, t1, t6
                  mulh         t4, tp, a5
                  slli         s8, t1, 31
                  slt          t3, t6, a6
                  slli         a0, s5, 6
                  fcvt.wu.s    s11, fa2, rup
                  fsgnj.s      ft1, fa3, fa6
                  or           t2, a3, s10
                  srl          a5, a6, a3
                  fmv.w.x      fs9, a1
                  srli         t0, s8, 19
                  fcvt.s.w     ft2, s8, rmm
                  andi         a5, s10, 78
                  sll          a3, a7, s9
                  add          s5, s11, s0
                  flt.s        a0, ft3, ft9
                  fadd.s       ft3, ft0, ft2, rup
                  xori         t2, a4, -283
                  mulhsu       a3, a6, s6
                  andi         s2, s3, 1733
                  fcvt.w.s     t6, fa7
                  fmin.s       fs0, fs5, fs11
                  fdiv.s       fs11, ft6, ft0, rtz
                  fle.s        t2, fs11, fa6
                  fsqrt.s      ft6, fs0
                  addi         t0, zero, -199
                  feq.s        t4, ft4, fa2
                  fsqrt.s      fs11, fs10
                  auipc        a3, 420913
                  fsgnjx.s     fs10, fa4, fs8
                  mul          s9, a1, s5
                  feq.s        a3, ft7, fa5
                  sltu         s10, a4, a3
                  fmul.s       fs2, fs10, fs8
                  fsgnjx.s     fs0, fs1, fs0
                  and          ra, s11, s5
                  divu         s11, a2, gp
                  andi         s2, a2, -1776
                  slt          t3, s9, t2
                  auipc        a7, 921400
                  srai         a5, s9, 28
                  lui          a7, 178616
                  mulhsu       a6, s9, a3
                  flt.s        s11, ft2, fa3
                  div          t2, ra, tp
                  rem          t3, s5, t6
                  slt          tp, a1, a6
                  fcvt.w.s     s0, fs0, rup
                  fle.s        s10, fs9, ft9
                  slti         ra, s9, -1748
                  sltu         t1, gp, a0
                  remu         a7, ra, s8
                  mulhu        t0, s7, s9
                  fsqrt.s      ft11, fa6, rdn
                  mul          s3, s8, s2
                  ori          t5, a4, -210
                  fsgnj.s      ft4, fa5, fa0
                  nop
                  sltu         s5, a1, a6
                  fmul.s       fa4, fs4, fs11
                  lui          t2, 839137
                  flt.s        t1, ft0, fs11
                  srai         s9, s4, 2
                  rem          t4, s5, s2
                  sub          t6, sp, s11
                  lui          t4, 69636
                  feq.s        t5, fs3, ft9
                  fmax.s       ft10, fa1, fs4
                  xor          a2, s8, a2
                  fsgnj.s      fa1, ft4, fs1
                  mulhu        a0, ra, s2
                  xori         s4, s8, 30
                  fcvt.wu.s    t1, ft10
                  sltiu        a4, a4, 752
                  add          a3, s3, s0
                  divu         a6, a0, s9
                  xor          t6, s6, a0
                  sub          t1, gp, s7
                  slli         s3, a1, 23
                  slti         ra, s3, -1191
                  fsgnjn.s     ft6, fs4, fs7
                  fmax.s       fs1, fs9, fs1
                  feq.s        ra, fs3, fs0
                  sra          s9, a3, s1
                  lui          s11, 313599
                  fmax.s       ft11, fs8, ft2
                  srl          s0, s6, tp
                  slt          zero, zero, a2
                  fadd.s       fs2, ft10, ft8
                  fclass.s     a5, fs3
                  add          s8, a0, a5
                  nop
                  sll          s11, a7, a1
                  fadd.s       ft5, ft0, ft0
                  sll          a2, t1, a0
                  fadd.s       fs3, fa7, fs1
                  fadd.s       ft0, ft11, fa2
                  flt.s        a5, fa4, fs3
                  fmul.s       ft5, ft5, fs1
                  slti         s9, s2, -757
                  mulh         s1, a3, s11
                  sra          a5, s10, zero
                  fmin.s       fs9, ft1, fs4
                  fcvt.s.w     fs8, t3, rmm
                  srl          t1, ra, s5
                  sltiu        s5, t1, -362
                  fmv.x.w      gp, fs3
                  srai         t3, s9, 12
                  addi         a2, a3, -599
                  srl          t6, s1, t2
                  sub          s1, s4, gp
                  remu         a2, s2, tp
                  xori         gp, zero, 1570
                  fsgnjn.s     fs4, ft11, fs1
                  add          t2, zero, a7
                  fcvt.s.w     fa5, a1
                  and          a4, s9, t0
                  mulhu        t6, t3, s7
                  slti         s3, t0, 878
                  fcvt.w.s     s5, ft9
                  xor          t0, gp, a3
                  addi         s0, a3, -473
                  divu         s11, a1, s5
                  xor          s4, t2, a2
                  srli         zero, gp, 16
                  fcvt.s.w     ft11, ra, rup
                  feq.s        t5, ft2, fs5
                  fcvt.s.wu    fs4, ra, rne
                  div          t5, s1, a0
                  fmv.x.w      s0, fs1
                  mulh         s3, s8, a2
                  lui          a4, 72132
                  fmin.s       fs5, ft4, fs6
                  sra          t1, a7, s8
                  mulhu        t6, gp, s3
                  fsub.s       fs11, fs5, fa3, rne
                  fmv.w.x      fa2, gp
                  sll          s8, s0, t1
                  xor          s8, a2, s7
                  nop
                  sub          a1, s0, a2
                  xori         zero, a4, -1098
                  fmv.x.w      s10, fs11
                  nop
                  xori         t2, t6, 291
                  sll          t3, a0, t0
                  fsgnjn.s     fs9, ft11, fa1
                  srl          s1, a6, zero
                  fcvt.w.s     t3, fa2
                  fsgnj.s      ft2, fa5, ft5
                  fcvt.s.w     fa4, t5
                  addi         a0, ra, 1154
                  fcvt.s.wu    fa5, s9
                  fsgnjx.s     fa1, ft8, ft2
                  fmul.s       fs4, fs4, ft11
                  fmv.w.x      ft5, a7
                  divu         t0, s4, a4
                  or           s2, s6, t2
                  ori          a1, zero, -1129
                  fsgnj.s      fs6, ft4, ft11
                  auipc        s8, 998954
                  mul          s1, a6, s6
                  sltu         a0, tp, t4
                  slti         t3, t2, 1520
                  add          a2, a6, a6
                  xor          t3, gp, t4
                  fcvt.s.w     fs10, s0, rne
                  flt.s        a1, fa6, fa2
                  xor          s5, a5, t3
                  srl          s0, ra, s7
                  sra          a1, t3, s0
                  nop
                  srli         s4, t5, 28
                  divu         s5, ra, a7
                  add          a2, s10, s0
                  fsub.s       fa7, fs9, fs1, rmm
                  slti         s4, t2, -49
                  addi         s9, t1, 706
                  feq.s        t1, ft5, fa5
                  sltu         a6, s6, s3
                  or           a0, tp, s7
                  or           t0, t3, a3
                  and          t6, a2, tp
                  fmv.x.w      t5, fs4
                  fsgnjx.s     fa6, fa0, ft5
                  ori          t3, a5, -53
                  lui          gp, 450477
                  fsqrt.s      fs0, ft7, rtz
                  mulhu        s10, s1, t0
                  fmax.s       fa7, ft10, ft8
                  mulhu        t6, a4, s3
                  nop
                  sra          t0, a4, a2
                  add          s5, a3, a1
                  divu         t4, s2, s8
                  sltiu        t6, t3, 1135
                  fsgnjn.s     fs6, ft3, ft5
                  slli         a5, s9, 0
                  fsgnjn.s     fs7, ft7, ft10
                  sltiu        a0, t6, 1450
                  and          a2, t6, a6
                  sub          a3, t0, s8
                  rem          s3, s1, a6
                  sub          s2, s0, a2
                  fmv.w.x      fa2, t2
                  fsgnj.s      ft10, ft1, ft0
                  fmv.w.x      ft3, t5
                  sll          a4, s10, s11
                  addi         a0, zero, 567
                  div          s10, a0, a6
                  add          zero, tp, t3
                  mul          a7, ra, a1
                  auipc        gp, 184307
                  andi         s8, t6, -901
                  fmv.w.x      ft2, s9
                  fmul.s       ft1, fa6, fa2, rtz
                  rem          s4, gp, sp
                  slti         s5, s10, 245
                  srli         zero, sp, 18
                  fsqrt.s      ft6, ft3, rne
                  fadd.s       fs4, fa1, fs7, rup
                  slti         a2, a0, -178
                  sra          s0, a4, t2
                  feq.s        t1, ft11, fa5
                  srli         s5, a3, 5
                  andi         zero, s5, 237
                  fadd.s       ft3, fa2, fa3
                  mulhsu       s11, s1, s11
                  fmin.s       ft8, fs9, ft8
                  auipc        s5, 642111
                  slli         a4, s7, 31
                  sltu         s4, s6, t6
                  fle.s        t1, ft2, fa5
                  ori          a7, a4, -1776
                  srai         ra, tp, 25
                  xori         a4, a4, -922
                  fmul.s       fa2, ft11, fs8, rmm
                  fsgnjn.s     fs0, fa1, fa3
                  srai         tp, t2, 15
                  mul          t4, t0, t3
                  srli         t5, gp, 19
                  auipc        gp, 271927
                  or           t0, gp, s0
                  divu         t5, gp, s6
                  divu         ra, s0, a0
                  fmul.s       ft11, fa5, ft11, rmm
                  addi         zero, a1, 880
                  fcvt.s.w     fs8, s3, rtz
                  sub          a0, t4, t0
                  sub          a6, a7, t3
                  sll          ra, t5, a3
                  fsgnj.s      fs4, ft9, fs8
                  fsgnj.s      fs4, fs8, fs11
                  sltiu        a6, s8, 948
                  sra          a5, t2, sp
                  sra          t3, s5, s0
                  flt.s        s3, fs0, ft9
                  andi         a6, s11, 1089
                  fsub.s       ft5, fs7, fs6, rne
                  sra          s8, a3, a3
                  rem          s0, s8, t4
                  fmv.w.x      fs9, s8
                  fmul.s       ft7, fs10, fa5, rup
                  srl          ra, s8, s2
                  andi         s2, zero, -759
                  sra          a5, a5, s11
                  sll          a7, s1, a6
                  xori         ra, t3, -1405
                  fsub.s       fa2, ft11, ft5, rmm
                  xor          s4, tp, t2
                  fsgnjx.s     fa6, ft0, ft4
                  fcvt.s.wu    fs1, s2, rmm
                  slli         a4, s0, 31
                  fcvt.wu.s    s2, ft9
                  lui          t0, 401210
                  nop
                  srai         s11, a6, 25
                  fmin.s       ft7, fa0, fs0
                  xori         s9, a1, -954
                  fmv.x.w      a2, fs11
                  sll          s5, sp, ra
                  divu         a3, a1, t6
                  mul          a1, a7, t1
                  fcvt.w.s     t3, ft11, rdn
                  flt.s        t0, ft9, fs9
                  mulhsu       zero, a7, t6
                  srli         a5, s8, 12
                  fcvt.s.w     ft8, sp, rmm
                  mulh         a1, s5, zero
                  lui          s2, 785315
                  slt          s9, a5, t5
                  slti         t5, a4, -1598
                  mulhsu       ra, s3, t1
                  ori          ra, a4, -394
                  mul          a3, s5, s1
                  sltiu        tp, t0, 497
                  sra          s5, zero, s10
                  sub          t2, sp, s11
                  fcvt.s.w     fs7, t1
                  fcvt.wu.s    a4, fs4, rup
                  or           t5, t6, t6
                  add          t2, ra, t2
                  lui          gp, 891368
                  andi         a2, t1, -2045
                  divu         zero, s5, a0
                  xor          a0, s5, sp
                  mulh         s2, zero, s0
                  fmv.x.w      s10, ft0
                  mulh         gp, s7, s10
                  slti         s1, s9, -531
                  srli         a5, gp, 6
                  fmv.w.x      fs11, t3
                  slt          t4, t5, s3
                  and          s4, gp, zero
                  fsgnjn.s     fs3, fs3, fa1
                  sltu         s11, s8, t3
                  divu         s9, a6, s1
                  fcvt.s.wu    ft5, tp, rmm
                  sll          ra, t2, gp
                  feq.s        zero, ft10, fs5
                  sub          s3, t5, a5
                  fclass.s     zero, fs11
                  fsgnjx.s     ft9, ft2, ft7
                  fcvt.s.wu    ft11, zero
                  slti         tp, s9, 1155
                  and          gp, tp, a1
                  nop
                  nop
                  or           tp, a6, t4
                  srai         s10, ra, 31
                  fsqrt.s      fa0, fa5
                  sltu         s5, zero, s4
                  fsgnj.s      fs10, fa4, fa2
                  fmv.w.x      fs5, ra
                  fcvt.s.wu    fs4, t3
                  fsgnjx.s     fs2, fa0, fa6
                  sltiu        a0, t6, 1311
                  remu         t6, s8, a5
                  srl          s8, s9, t3
                  divu         s1, s1, s11
                  mulhu        zero, a0, gp
                  nop
                  mulhsu       s5, t0, a1
                  srl          s0, a4, t4
                  fsgnjn.s     fa5, fs8, fa3
                  divu         a0, t2, a0
                  xori         t6, s0, -1290
                  xori         a3, t3, -547
                  and          a2, s3, a2
                  fmax.s       fa3, ft2, fs6
                  fmv.x.w      tp, ft1
                  sub          a7, s1, s5
                  rem          t6, s2, a2
                  sll          t5, t1, ra
                  fcvt.s.w     fs4, ra
                  add          zero, s11, t0
                  sll          s5, ra, s6
                  fsub.s       fs11, ft1, ft8
                  fmax.s       fs10, fa7, ft11
                  slli         s4, a7, 12
                  fsqrt.s      fs9, fs0
                  remu         t1, s4, t0
                  divu         a5, a6, s0
                  divu         t6, s11, s7
                  div          s8, ra, s0
                  srai         a7, t2, 15
                  or           t3, t1, s7
                  slli         a0, s1, 9
                  div          t0, sp, t5
                  fmax.s       fa7, fs2, fa3
                  srl          s3, s7, t0
                  sltiu        s8, s5, 18
                  xori         a3, a2, -719
                  fmax.s       fs4, ft0, fs10
                  slt          s5, t2, t5
                  rem          s10, zero, sp
                  fmv.w.x      ft10, s10
                  fsub.s       fa3, fs9, fs6
                  and          s5, s11, a1
                  slti         s8, a0, -905
                  feq.s        t5, fs3, fs6
                  mulhu        t1, t0, a4
                  fcvt.s.wu    fa5, a4, rup
                  fmin.s       fs9, fs3, fa7
                  rem          ra, s3, gp
                  slti         t2, a7, 1066
                  fclass.s     t1, fs4
                  fcvt.s.w     fs4, t5
                  fcvt.w.s     ra, ft9
                  fcvt.s.wu    ft9, a1
                  andi         a3, s6, 1362
                  fmv.x.w      t6, fs7
                  sll          t0, s5, s10
                  mul          a4, a6, s1
                  fmax.s       ft10, ft2, fs3
                  fsqrt.s      ft4, fs6
                  mulh         s11, s6, s4
                  feq.s        a3, ft10, fa6
                  mulh         a6, s7, a6
                  fdiv.s       ft7, fa5, ft4, rmm
                  fadd.s       fs3, fs7, ft9
                  feq.s        s8, fs11, ft11
                  mulhu        t3, gp, a2
                  auipc        a3, 379510
                  xori         s10, t5, -1786
                  fclass.s     ra, ft2
                  fcvt.s.wu    fa1, s6, rdn
                  divu         a6, t0, s11
                  fmv.w.x      ft2, a1
                  fsgnjx.s     fs8, fs10, fs9
                  sll          s9, a7, s11
                  srai         a0, t6, 12
                  nop
                  mul          t0, s1, a0
                  fadd.s       fs3, ft2, fs10
                  nop
                  divu         t0, s4, s5
                  fsqrt.s      fs0, fs6, rmm
                  mulh         zero, gp, t3
                  fadd.s       fa5, fa2, ft10
                  mul          s11, a0, gp
                  auipc        t5, 425876
                  srai         s10, a2, 18
                  mulh         t1, t6, zero
                  lui          a4, 653325
                  remu         s9, zero, t0
                  feq.s        s10, fs10, fs5
                  srl          s0, s6, a5
                  fcvt.wu.s    a5, fs3
                  feq.s        s0, fs8, fs6
                  mulhu        a3, s1, t3
                  nop
                  fsub.s       fs3, fa4, ft2, rmm
                  fmax.s       fs3, ft10, fs11
                  add          s9, s11, s9
                  auipc        t4, 22920
                  srai         a2, a3, 2
                  fcvt.s.wu    ft6, t1
                  auipc        s8, 740659
                  or           zero, a4, s10
                  fsgnjx.s     fa7, ft9, ft10
                  sll          gp, t6, t5
                  sub          t0, ra, t6
                  or           a3, a1, t0
                  sll          a3, zero, a0
                  sltiu        s8, s5, -1955
                  fcvt.s.wu    fa1, a2
                  andi         a4, s6, -1888
                  fcvt.wu.s    a6, ft6, rne
                  srai         zero, a7, 28
                  or           s3, s9, sp
                  sub          s8, s8, s1
                  sltu         a5, t6, ra
                  sll          zero, t2, a1
                  fclass.s     t5, fa4
                  xori         a3, zero, 1600
                  flt.s        s2, ft9, ft4
                  mulhu        s1, a6, gp
                  flt.s        s1, ft3, fs0
                  nop
                  sltiu        a6, t4, -129
                  ori          a7, zero, 139
                  fcvt.w.s     s5, fs11, rne
                  fclass.s     t4, fs9
                  sra          s0, a3, zero
                  fmax.s       fa0, fs6, fa5
                  fcvt.w.s     t3, ft6, rtz
                  fcvt.wu.s    a4, ft7, rup
                  fsgnjn.s     fs3, fa4, fs5
                  fadd.s       fa7, ft8, fs11, rdn
                  andi         s4, s1, 674
                  add          t5, a0, a3
                  fsgnj.s      fs11, fs5, fs7
                  fcvt.wu.s    s3, fs7, rne
                  fcvt.s.w     fa0, a6, rmm
                  srli         zero, ra, 20
                  sll          t5, s7, t6
                  slli         s1, s6, 31
                  sll          ra, s0, s11
                  add          s5, s5, gp
                  fmin.s       fa7, fs7, fa6
                  slt          s11, s3, t2
                  lui          a4, 687506
                  add          t1, t3, s6
                  fcvt.s.w     ft1, t3
                  fclass.s     s9, fs5
                  fsgnjn.s     ft4, ft8, ft3
                  and          t5, s6, s11
                  rem          t3, ra, a4
                  fmax.s       ft8, ft0, ft9
                  or           gp, s4, s9
                  xor          a1, s7, a3
                  add          a6, t5, tp
                  andi         s10, t1, 1999
                  ori          s3, t5, 1482
                  flt.s        t1, ft6, fs9
                  fmax.s       ft5, ft4, fs4
                  fcvt.s.wu    ft10, t6
                  mulhsu       tp, t1, s9
                  xor          s2, t3, s6
                  sll          zero, zero, t0
                  fmv.x.w      t2, fs0
                  slt          a0, t3, t5
                  auipc        s0, 152259
                  sll          t2, a0, a3
                  fsgnjn.s     ft8, fs5, fs7
                  slti         s8, t3, 1277
                  andi         s11, s3, -97
                  fcvt.w.s     tp, fa2
                  mul          a1, a5, t0
                  fle.s        a1, ft4, fa0
                  srai         s8, a6, 5
                  fmin.s       fs1, fa0, ft0
                  fle.s        gp, ft2, fs3
                  fcvt.w.s     t3, ft2
                  sra          t4, s11, gp
                  fsgnj.s      fa7, ft0, fa0
                  or           s10, s10, a6
                  and          a4, a1, a6
                  rem          s5, a2, a0
                  fsgnjx.s     ft1, ft1, ft9
                  or           t5, a2, s11
                  add          a0, s9, t4
                  slli         a2, a6, 25
                  fadd.s       fs1, fs5, fa7
                  fsub.s       fa1, ft7, fa1
                  nop
                  andi         zero, t0, -1898
                  xor          a3, a0, s8
                  fcvt.w.s     s0, ft10, rne
                  div          t5, s2, a3
                  fle.s        tp, fa4, fs5
                  slli         s9, s10, 3
                  sltiu        a7, a2, -975
                  sll          s4, ra, a2
                  fmul.s       ft9, fa7, fa3, rup
                  nop
                  fadd.s       fs5, fa2, fa1
                  xori         a3, gp, -140
                  sltiu        s9, s11, -314
                  fcvt.wu.s    a5, fs5, rdn
                  srai         a0, t3, 8
                  fmv.x.w      s11, ft7
                  fadd.s       ft11, ft4, fs4, rne
                  fsgnjn.s     fs9, fs5, fs11
                  fsgnj.s      ft5, fa6, fa3
                  sll          a6, t5, s6
                  fcvt.s.w     fa4, gp
                  fsgnj.s      ft6, fs1, fs8
                  sll          a2, a1, a1
                  srai         s3, s2, 8
                  mulh         a0, s1, t3
                  srai         a3, s11, 17
                  fle.s        t2, fa1, ft3
                  fmax.s       fs11, fs3, ft5
                  fmax.s       ft4, fs6, fs11
                  srl          a5, a0, s5
                  ori          s4, a3, -1954
                  sra          s2, t6, s0
                  and          a6, a5, zero
                  mulhu        a4, s7, s8
                  sub          t1, s11, t2
                  srai         s2, a2, 30
                  mulhu        t0, a7, t0
                  slti         s1, s10, -1549
                  fsub.s       fa5, fs4, ft7, rmm
                  sll          a3, a4, a3
                  sltu         t1, s9, tp
                  addi         s10, a2, 502
                  mulh         t2, s6, tp
                  mulhsu       s9, s3, s0
                  or           a0, s5, a3
                  divu         a6, s2, a5
                  xor          a4, s6, t5
                  fcvt.w.s     s3, fs6
                  fmul.s       fs10, fs2, ft6, rmm
                  fcvt.w.s     t4, fa7
                  mul          t3, s5, s4
                  sub          s8, t0, sp
                  fsgnj.s      ft6, fa5, fa2
                  fmin.s       fa5, ft6, fs3
                  and          s11, t6, t1
                  fmin.s       fa0, fs5, ft6
                  fsgnjx.s     ft11, ft3, ft0
                  remu         gp, s0, a2
                  mulh         a6, s2, gp
                  mulhsu       s9, a6, t3
                  divu         s9, s0, s2
                  nop
                  fle.s        a6, fs8, fs0
                  ori          s9, a5, 532
                  sra          ra, s4, s7
                  feq.s        zero, fa6, fa0
                  fsqrt.s      ft5, ft11, rmm
                  remu         t0, t0, s3
                  fmax.s       ft5, ft0, fs11
                  feq.s        t4, fs11, ft7
                  sltu         t6, s7, t1
                  sub          t4, sp, t6
                  or           a1, s11, s3
                  slti         t6, a3, 997
                  or           tp, a1, s6
                  fcvt.s.w     fa5, s9, rdn
                  fcvt.wu.s    a6, fs11
                  srl          t3, tp, a2
                  fmul.s       fa0, ft5, fs10
                  add          t4, s1, a1
                  fle.s        s8, fs0, fa4
                  slli         t2, zero, 19
                  fcvt.s.wu    fa7, a7
                  fcvt.s.wu    fs1, s5
                  feq.s        t1, ft4, fa3
                  srai         a0, s10, 21
                  fsqrt.s      fa3, ft1, rdn
                  mul          a2, s5, s4
                  fcvt.s.w     fs9, t1
                  andi         s11, a1, -1017
                  srli         s1, a5, 31
                  fsgnjn.s     ft2, ft0, ft3
                  flt.s        a4, ft5, ft4
                  nop
                  andi         a2, s4, -666
                  fsgnjn.s     fa5, ft1, fa3
                  fsgnj.s      fs8, fa4, fs0
                  sltiu        a0, sp, -831
                  fmin.s       ft4, fs8, fs4
                  fmax.s       fa3, fs11, fs3
                  slt          s3, s11, a4
                  add          a6, s10, t5
                  mulh         s9, s2, a2
                  sltiu        t0, sp, 1427
                  fdiv.s       ft6, fs2, fs5
                  remu         s4, a5, s3
                  fsgnjx.s     fs7, fa6, ft4
                  srl          a3, s10, t4
                  fle.s        t1, fa3, ft4
                  addi         s2, s11, 740
                  fadd.s       fs0, ft0, ft11, rdn
                  fsub.s       ft1, fs8, ft5, rne
                  remu         s11, tp, s11
                  fsub.s       ft7, fa3, fs5, rmm
                  fcvt.wu.s    s2, fs11
                  fadd.s       fs6, ft1, fs2
                  sll          a6, a4, s2
                  fsgnjn.s     fs7, fs6, fa4
                  div          a5, a5, ra
                  fcvt.s.wu    fa1, tp, rdn
                  mulh         t6, a3, a4
                  mulhsu       t6, t6, s9
                  fadd.s       fs1, ft10, fa0, rne
                  fcvt.s.w     fa1, s11, rup
                  mulhsu       s1, t2, zero
                  fsgnjn.s     fa2, fs2, ft4
                  slti         a6, s6, -1271
                  fcvt.s.wu    ft1, s9
                  sub          a4, s5, a0
                  fmin.s       fs2, fs7, fs7
                  fmv.w.x      fs3, t1
                  div          a7, a1, sp
                  fdiv.s       fs1, ft3, ft10
                  fsgnjn.s     fa2, fs10, ft7
                  fsgnj.s      ft10, fs4, fs10
                  add          t6, sp, zero
                  fsgnjx.s     fs10, fs5, ft5
                  fsgnjx.s     ft2, ft9, fs0
                  remu         t2, t5, a7
                  fmv.x.w      t5, fs7
                  sub          a1, s10, a2
                  mulhsu       s4, a5, a7
                  slli         a5, s1, 18
                  fmin.s       fs11, fs4, fs4
                  sltiu        ra, s8, 872
                  sra          t6, a4, s11
                  fsqrt.s      fs5, ft0, rne
                  fmax.s       fs9, ft0, ft11
                  auipc        a1, 374406
                  sll          s8, t6, t4
                  sll          a6, s6, t3
                  feq.s        t1, ft7, ft10
                  mulh         s11, ra, s9
                  fcvt.s.w     fs4, s6, rdn
                  sra          a3, s9, s6
                  mulh         a7, s3, s10
                  sll          a3, sp, s9
                  flt.s        s11, fs11, ft5
                  flt.s        a3, fa3, fa3
                  nop
                  fdiv.s       ft4, fs1, ft4, rtz
                  fsgnjx.s     fs1, fa5, fs1
                  srai         ra, sp, 24
                  div          s5, a7, a6
                  fclass.s     s9, fa3
                  ori          s10, a7, -1004
                  andi         t3, s6, 1370
                  srl          a5, a7, s10
                  ori          a3, t4, -1004
                  fclass.s     a2, ft4
                  fsub.s       ft4, fs7, fa0, rdn
                  sltu         s3, a1, s8
                  andi         a7, t5, 943
                  fmax.s       fs11, fs5, fs5
                  fmax.s       fa2, fa4, fa6
                  fsgnjn.s     fa2, fs1, fs6
                  slti         s8, s4, 1791
                  fsgnj.s      fa6, fa6, fa0
                  srai         t4, sp, 2
                  fsqrt.s      fs0, fs10, rne
                  fcvt.w.s     t0, fs5, rtz
                  fclass.s     s10, fs4
                  sll          zero, a2, s9
                  fcvt.w.s     a3, ft6
                  xor          s5, s2, s0
                  xori         a0, t6, -232
                  flt.s        t2, fa4, fs8
                  fcvt.w.s     t4, ft9
                  fsub.s       fs7, ft3, ft6
                  fmin.s       fa4, fs3, fs7
                  slli         a2, a0, 24
                  fle.s        t0, fs7, fs1
                  slli         s10, s2, 10
                  sltu         t1, a3, a2
                  fdiv.s       fa2, fs7, ft7
                  srli         a5, ra, 4
                  srli         t6, s11, 31
                  or           a2, s11, a3
                  sub          t3, s10, a1
                  srai         s2, s8, 4
                  slti         t0, t4, 1796
                  fclass.s     t0, fs4
                  fcvt.s.w     fa1, s1, rmm
                  sll          a2, s1, t2
                  mulh         tp, a4, t1
                  fcvt.s.w     fs0, s11, rne
                  srli         s11, t6, 5
                  srl          ra, t4, t4
                  fclass.s     ra, ft5
                  sltu         a4, a0, a6
                  fdiv.s       ft7, ft2, ft4, rmm
                  mulh         t6, s9, t1
                  fmul.s       fs1, fs1, ft5
                  rem          s0, ra, s5
                  fcvt.wu.s    a0, fs1
                  fcvt.s.w     ft3, a6, rdn
                  fmax.s       fs6, ft0, fa0
                  auipc        t1, 932035
                  divu         s1, t3, s9
                  divu         s3, a0, s10
                  fmv.x.w      s5, ft9
                  xori         tp, s8, -1792
                  sra          s4, s11, a2
                  rem          s11, s0, t1
                  and          a1, s0, zero
                  fmin.s       ft2, ft0, ft3
                  add          a1, s6, s7
                  mulhu        a2, a2, zero
                  lui          t1, 287923
                  fcvt.wu.s    a1, fa6, rup
                  slli         t1, a5, 14
                  fmv.x.w      t2, ft4
                  fmul.s       fs7, fa1, ft0, rdn
                  or           a4, s7, zero
                  fmax.s       ft8, ft5, ft2
                  fle.s        s5, ft0, ft3
                  srl          a7, s0, s5
                  fsub.s       ft6, fs4, fa1, rne
                  fmax.s       ft10, ft7, fa7
                  srl          s0, gp, s3
                  addi         s10, a6, -96
                  or           t0, t3, ra
                  nop
                  feq.s        a2, ft1, fa4
                  flt.s        t3, fs5, fs8
                  srli         t4, a6, 30
                  fcvt.s.wu    fa5, a6
                  sra          s5, t1, a3
                  lui          s2, 38379
                  fmul.s       ft10, fs9, ft8, rne
                  srl          a2, t3, s0
                  add          a4, s7, a4
                  mul          a1, s7, t6
                  add          gp, s9, a7
                  slti         tp, ra, 1176
                  fmv.x.w      s4, fs0
                  fmv.w.x      fs5, a0
                  fcvt.s.wu    fa7, sp, rup
                  fadd.s       ft6, ft11, ft8
                  fmin.s       fs6, ft4, ft2
                  srai         ra, a1, 21
                  slt          a3, a6, t6
                  sltu         t2, s9, s0
                  sltu         s10, a0, s4
                  mul          t0, tp, s9
                  add          a6, s10, s2
                  addi         s1, t5, 3
                  fadd.s       ft0, fa1, fa4, rup
                  addi         a5, t6, 1173
                  nop
                  xor          s9, s9, t2
                  fmul.s       fs7, ft5, ft1, rne
                  fcvt.wu.s    t4, fa7, rup
                  divu         gp, a1, sp
                  fcvt.s.w     fa1, a4
                  slt          s3, s2, s7
                  fadd.s       ft4, fa7, fs6
                  fcvt.w.s     a4, fs5
                  mulh         gp, s3, a3
                  xor          t6, sp, a3
                  mulhsu       a5, gp, a0
                  lui          gp, 502220
                  divu         s1, a7, s10
                  fmv.w.x      fs0, s10
                  xori         a0, ra, -1994
                  slt          s2, s7, s4
                  lui          ra, 403604
                  fdiv.s       fs5, ft5, fa4, rmm
                  sll          s3, t2, t2
                  nop
                  feq.s        s4, ft8, fs3
                  fclass.s     s1, fs0
                  fle.s        a5, ft7, ft0
                  fsgnjn.s     fs11, ft7, ft4
                  feq.s        ra, fs0, ft10
                  xori         t6, s5, 655
                  nop
                  sltu         s5, t4, s4
                  lui          t5, 570643
                  srai         s2, s4, 26
                  xori         a2, a2, 122
                  mul          s10, t5, s11
                  remu         t0, a4, a0
                  andi         s2, s11, 604
                  slli         t2, s10, 21
                  fmin.s       fa7, fa6, fs0
                  fle.s        t1, ft9, fa0
                  feq.s        a2, fs3, fa6
                  fsgnj.s      fs9, fa5, fa1
                  fsgnj.s      fs2, fs4, ft4
                  and          s2, t5, s11
                  fsgnj.s      fs10, ft11, fs1
                  fmin.s       fa1, ft11, fs6
                  xor          a1, s8, s0
                  mulhu        s3, a3, a5
                  slti         a3, t5, -1218
                  sra          t4, s0, a4
                  fadd.s       fs6, ft0, ft6, rmm
                  fsgnj.s      ft7, fs4, ft5
                  mulh         a0, ra, t5
                  addi         s2, s10, -4
                  lui          t4, 336099
                  divu         a3, tp, t5
                  fcvt.s.w     ft6, a3
                  mulh         gp, t4, s11
                  sub          s9, s5, a6
                  fsqrt.s      ft8, ft4, rmm
                  mul          s11, tp, a3
                  fclass.s     a3, ft0
                  srli         s5, a1, 19
                  fmv.x.w      t3, fa4
                  fsgnj.s      ft4, fa6, ft10
                  lui          t1, 873349
                  addi         s8, s2, -339
                  fmin.s       ft3, fa0, fs3
                  fcvt.wu.s    s0, ft3, rdn
                  fcvt.s.wu    ft1, sp, rup
                  fmul.s       ft4, fs7, fs0, rdn
                  fsgnjn.s     fs10, fs2, fs9
                  addi         s3, s8, -198
                  addi         a3, a5, 1422
                  fcvt.s.w     fs4, a2, rtz
                  auipc        ra, 800720
                  ori          t2, tp, -1491
                  fle.s        a2, fs10, fa5
                  div          s8, a3, t0
                  srli         t1, tp, 18
                  fadd.s       ft6, ft10, ft11, rmm
                  xor          t6, t2, s8
                  rem          t0, a3, t0
                  xori         s1, t3, -836
                  flt.s        t2, fa5, fs11
                  and          a6, s4, t5
                  andi         zero, s6, -1838
                  slli         t4, gp, 25
                  fsgnjx.s     fa4, fa3, ft10
                  ori          s10, t3, 1102
                  fmin.s       ft9, fa4, fa1
                  divu         s3, t1, a4
                  fsgnjn.s     fa7, fa1, ft1
                  sltiu        t2, s6, -664
                  andi         a0, t2, 123
                  fle.s        s5, fs5, fs7
                  fmv.w.x      ft3, a6
                  fadd.s       ft1, ft2, fs10
                  divu         a4, a4, s6
                  srai         s0, t3, 26
                  fsgnjx.s     fs6, ft7, fs10
                  fmul.s       ft3, ft8, fs11, rup
                  slti         a2, s11, 1057
                  feq.s        s10, ft6, ft9
                  addi         s11, s11, 1482
                  div          a7, s11, a3
                  fsgnjx.s     ft10, ft7, ft5
                  sll          t1, t4, a3
                  flt.s        s5, ft11, fa6
                  fmv.x.w      a7, fs9
                  mulhu        t5, a4, tp
                  slti         t6, t3, -1334
                  remu         s10, a5, t1
                  div          t4, ra, a0
                  mulh         a1, a7, a4
                  fadd.s       ft0, fs9, ft10
                  fmul.s       fs11, fs0, ft5
                  fsqrt.s      fs4, fs2, rtz
                  sub          t5, a1, gp
                  ori          s11, ra, -640
                  fsgnjn.s     fs11, fs9, fs9
                  and          t5, a5, a1
                  ori          t4, a3, 828
                  xor          a4, a1, gp
                  sra          s4, a5, s9
                  fle.s        s3, fa7, fs4
                  fclass.s     s9, ft6
                  sltu         a1, a4, s6
                  sltu         s2, s5, t0
                  mulhsu       a1, t2, a4
                  div          ra, zero, s2
                  fmv.w.x      fs4, t2
                  auipc        a2, 217296
                  sltu         a2, s10, t0
                  fmv.x.w      s2, ft4
                  and          a5, s2, s0
                  fmv.x.w      s4, fs9
                  mulh         a4, s8, t2
                  sll          tp, sp, s7
                  sub          a2, s6, a4
                  fdiv.s       ft11, fs11, ft4, rtz
                  fmax.s       fs11, ft3, fa4
                  flt.s        a5, fs7, ft2
                  and          s0, s1, tp
                  fclass.s     s10, fa0
                  fle.s        s4, ft1, fa3
                  fsgnjn.s     ft11, ft8, fa7
                  fcvt.wu.s    s0, fa0
                  slt          s1, zero, a5
                  lui          t6, 338548
                  fadd.s       ft6, fs4, fs11, rdn
                  ori          s2, a3, 1563
                  ori          t5, a4, 976
                  fadd.s       ft7, fa4, ft3
                  rem          ra, sp, s11
                  fmv.x.w      t6, fs8
                  nop
                  fclass.s     s4, fs11
                  lui          t5, 34784
                  sra          a6, t6, a7
                  divu         t2, s2, a7
                  lui          t2, 670708
                  fmax.s       fa1, fa7, ft11
                  feq.s        zero, fa3, fs6
                  fcvt.s.wu    fs3, a5, rtz
                  mulhsu       a4, s2, a1
                  lui          a7, 158413
                  sltiu        s3, s5, -772
                  fcvt.wu.s    t6, fs2, rdn
                  srl          t1, s9, a4
                  fsqrt.s      fs5, ft11
                  xori         t5, gp, -678
                  rem          a6, a5, t5
                  slt          t3, s10, t3
                  fcvt.wu.s    t6, fa2, rdn
                  fcvt.s.wu    ft11, a1, rdn
                  fadd.s       fs0, ft3, ft0, rne
                  fadd.s       fa3, fs5, fs9
                  remu         a4, s1, a6
                  sra          a2, a0, ra
                  fmax.s       fs8, fs4, ft2
                  fsgnj.s      fs2, fa5, ft8
                  add          t2, sp, zero
                  srai         t0, a7, 29
                  fmin.s       fs0, fa5, ft1
                  andi         s2, s9, -455
                  and          a6, a0, s1
                  ori          gp, a5, -387
                  fsgnjx.s     fa2, ft8, ft10
                  mulhsu       t1, s6, sp
                  sra          zero, s6, s2
                  fadd.s       fa1, ft9, ft5, rne
                  andi         tp, t2, -737
                  fsgnj.s      fs0, ft11, ft10
                  feq.s        s5, fs0, fa7
                  sltu         gp, s11, a1
                  mulhsu       s3, t0, t1
                  srl          t0, zero, a3
                  sltiu        tp, s2, 589
                  fmax.s       fs11, ft7, fa2
                  sub          t5, zero, tp
                  sll          a7, t5, s3
                  nop
                  slti         t0, gp, 1489
                  feq.s        a6, ft4, fa0
                  lui          t4, 1019864
                  or           a2, s9, s8
                  sub          t6, a1, a5
                  sub          s0, s8, a4
                  fcvt.s.w     fs4, gp
                  auipc        a6, 175345
                  fdiv.s       ft10, fa6, fs10, rmm
                  fmul.s       ft4, ft1, fs10
                  flt.s        s4, fa3, fs4
                  slti         t2, a1, 1878
                  fcvt.wu.s    s4, fs1
                  addi         s9, t6, -1940
                  and          t1, s6, t1
                  flt.s        t1, ft10, fs5
                  mul          s8, t5, a5
                  mul          t0, s0, s7
                  andi         s10, s7, -1414
                  fcvt.wu.s    t2, ft9, rmm
                  fcvt.w.s     a1, ft2
                  fsqrt.s      fs1, fs10
                  feq.s        a4, fs6, fs11
                  fle.s        gp, ft2, ft6
                  fcvt.s.w     ft10, a6
                  slli         s0, t3, 1
                  fsqrt.s      fs11, fa6, rne
                  fsgnj.s      fs10, fa2, fs9
                  nop
                  sltu         a7, t0, t3
                  fcvt.wu.s    a7, fa5
                  srli         s4, a5, 12
                  sltiu        t2, s5, -1821
                  divu         a0, gp, s10
                  andi         t2, s7, -1505
                  lui          a1, 77593
                  sra          ra, t4, a6
                  mul          t1, s7, s6
                  slli         gp, a4, 24
                  fcvt.wu.s    a6, fa2
                  remu         ra, a0, s9
                  fadd.s       ft7, ft3, ft8
                  nop
                  slli         t5, s3, 24
                  mulh         s11, s8, s7
                  add          tp, a3, a3
                  sltiu        s5, t5, 1823
                  srai         s11, a2, 29
                  div          t0, t0, a4
                  ori          ra, s5, -1895
                  srli         zero, a7, 15
                  fcvt.wu.s    t6, ft8
                  xor          a2, s0, a2
                  fle.s        s4, ft4, fs2
                  fclass.s     a0, fa3
                  slti         s1, s8, 1719
                  ori          s5, s4, -438
                  fcvt.s.wu    fa7, a5
                  andi         s4, s3, -43
                  rem          a1, t5, t2
                  sll          a2, ra, s2
                  nop
                  fsub.s       fa5, fa5, fa0
                  fsgnj.s      ft1, fa1, ft11
                  mulh         a2, a0, a3
                  add          s9, tp, t1
                  rem          s1, t3, t6
                  fdiv.s       fs9, fs10, fa0
                  xor          a2, a5, s8
                  fadd.s       ft1, ft3, fa3, rtz
                  srai         t1, s4, 15
                  fsqrt.s      ft1, fa6, rne
                  sra          a2, a7, sp
                  mulh         a3, a4, t4
                  rem          s4, a3, s8
                  fsqrt.s      fa0, fs0
                  auipc        zero, 404235
                  fcvt.s.w     ft6, t5, rdn
                  fsqrt.s      fa4, ft6
                  sra          zero, s8, ra
                  and          t4, s7, gp
                  auipc        s4, 685063
                  and          tp, a5, t5
                  sltu         a1, zero, a5
                  xor          t6, sp, t5
                  nop
                  div          s10, s9, tp
                  fcvt.s.w     ft6, a4, rup
                  lui          t2, 568872
                  xor          s2, t5, a4
                  mulhsu       a2, a6, ra
                  fdiv.s       fs10, fs3, fa1, rdn
                  auipc        t3, 342376
                  mulhu        s5, a1, a7
                  sra          gp, s0, s10
                  fsgnj.s      ft11, fs8, ft4
                  fsqrt.s      fa2, fs10
                  sub          a6, a7, s1
                  fmv.x.w      s11, fa4
                  divu         gp, s9, s10
                  sra          a1, tp, t1
                  mulh         t4, s6, s9
                  sll          s3, s4, sp
                  flt.s        gp, fs11, ft9
                  fcvt.w.s     gp, fa0, rtz
                  ori          a3, t1, -1162
                  fcvt.s.w     fs9, ra
                  div          a4, gp, s7
                  srli         tp, t4, 11
                  andi         s10, s5, 361
                  andi         zero, t6, -1703
                  slt          s4, s1, a3
                  remu         s8, a3, s10
                  fcvt.w.s     s10, fs7
                  mulhu        a6, s7, t5
                  sltu         s2, a2, t6
                  flt.s        t6, ft0, ft8
                  fcvt.wu.s    s5, ft6, rdn
                  slt          zero, s8, s3
                  fcvt.s.w     ft10, s5
                  fmul.s       fa3, fa2, fa1, rne
                  fcvt.wu.s    a3, fs5, rdn
                  xori         s1, gp, -943
                  or           a1, t2, s10
                  mulhu        s1, a2, gp
                  auipc        zero, 900212
                  fsqrt.s      fa1, ft11, rmm
                  sltu         gp, zero, t4
                  mulhu        ra, ra, a3
                  divu         t1, s5, a6
                  and          s5, t0, t0
                  fcvt.wu.s    gp, ft3, rtz
                  mulhu        t1, s0, t2
                  fadd.s       fs7, ft2, ft6
                  fsgnj.s      ft8, fs7, ft2
                  fcvt.s.wu    fa4, a2, rne
                  fsgnjx.s     fs6, ft10, fs10
                  ori          t2, t3, 1825
                  fcvt.w.s     tp, fs6
                  feq.s        t1, ft5, fa6
                  fmul.s       fs3, fs8, fs2
                  slli         s1, t2, 26
                  nop
                  add          s2, t3, s8
                  remu         a6, s3, t6
                  feq.s        s11, fs3, fs1
                  fcvt.w.s     t5, fs7, rmm
                  remu         a2, zero, s3
                  fsgnj.s      fa2, fs10, fs5
                  slti         zero, s1, 134
                  auipc        a0, 410127
                  remu         t2, s0, s10
                  fsgnjn.s     fs0, fs1, ft3
                  mul          s8, t4, gp
                  fdiv.s       fa3, fa2, ft1, rup
                  mulh         tp, s5, a1
                  xori         a5, zero, 580
                  slt          t2, t2, s10
                  fmul.s       ft1, fs5, ft10, rup
                  sltiu        s0, a2, 2017
                  srli         t0, gp, 16
                  fsgnjx.s     ft2, fa1, fs7
                  addi         a7, s10, 685
                  xor          s0, a6, a4
                  sub          t6, t5, s7
                  fmv.w.x      fa7, a4
                  remu         zero, s2, a3
                  srai         a2, a3, 26
                  srl          s2, sp, s8
                  sra          a0, a7, s10
                  fsub.s       fs6, ft5, fs8, rup
                  sll          t3, s5, t3
                  rem          t1, s1, s5
                  and          a5, t2, a4
                  rem          gp, t5, s4
                  fmv.w.x      ft11, s9
                  slli         a4, s3, 28
                  ori          t0, gp, -1594
                  fadd.s       fs6, fs3, fa1
                  remu         s8, a0, s5
                  andi         t1, s4, 317
                  slti         s4, s6, -1575
                  fmul.s       fs2, fa4, ft7, rtz
                  slli         t2, s0, 31
                  srli         t4, s10, 9
                  fsgnjx.s     fa3, fa6, fa3
                  fsgnjx.s     fs5, ft3, fa6
                  slt          s11, s2, sp
                  flt.s        t3, fs5, ft3
                  divu         s8, gp, s8
                  fmv.x.w      t4, ft5
                  auipc        s9, 1028910
                  fmax.s       ft11, fs2, ft2
                  sll          s2, a6, zero
                  slli         t1, t4, 11
                  srai         a4, s4, 4
                  sra          tp, a5, a2
                  mulhu        a6, s8, s9
                  slt          s9, tp, t3
                  and          s1, zero, s8
                  fcvt.wu.s    t6, fa1
                  fsgnjx.s     fs5, ft1, fa2
                  feq.s        a1, fa1, ft11
                  auipc        a2, 361641
                  srai         s8, a5, 31
                  ori          s3, t6, -1076
                  mulh         ra, ra, t4
                  fadd.s       fs8, fa5, fa5, rmm
                  fsgnj.s      fs6, fs0, fs2
                  fcvt.s.wu    fa3, a7
                  fclass.s     a3, ft9
                  fmv.x.w      t1, fs3
                  fmax.s       fs6, ft9, fs11
                  fmv.w.x      fs5, gp
                  and          ra, t2, sp
                  mulhu        t2, a7, s9
                  mulhu        t3, sp, s11
                  fmv.w.x      ft11, s7
                  mulhu        zero, a3, s0
                  fmv.x.w      s11, ft5
                  slt          t4, t1, sp
                  add          gp, a6, s1
                  fsgnjn.s     ft7, ft9, ft4
                  xori         s2, s10, -1568
                  fmv.x.w      s9, ft6
                  nop
                  slti         s11, s4, -274
                  or           a7, a5, s6
                  sub          s0, a3, a1
                  sra          t1, tp, s7
                  sub          t6, s10, t6
                  mulh         s11, s2, t3
                  remu         a2, s3, s4
                  fsqrt.s      ft4, ft11, rne
                  slt          t5, a3, t3
                  mulh         a7, t0, s0
                  slt          t3, s3, tp
                  divu         t5, s2, t2
                  div          s3, a0, s4
                  fcvt.s.wu    fa7, t0
                  fmv.x.w      s9, fs0
                  fsgnj.s      ft11, ft4, fa6
                  lui          gp, 239668
                  slli         s4, a1, 5
                  fclass.s     a6, fs6
                  and          tp, t3, a4
                  slti         s8, s10, 1142
                  fsgnjn.s     fa6, fa7, fa4
                  flt.s        a6, fa1, fa6
                  sub          a5, tp, s0
                  fsgnjx.s     fs5, fs7, ft3
                  slli         a7, s9, 25
                  fcvt.s.wu    fs2, s2
                  slli         s4, s5, 25
                  sltu         a2, zero, t3
                  flt.s        ra, fa1, fs10
                  and          a1, zero, s9
                  sltiu        a0, a6, -599
                  sub          s9, t4, a1
                  srai         s0, gp, 18
                  mulh         a5, s6, s10
                  fmin.s       fs3, fa2, ft11
                  fcvt.w.s     zero, ft4
                  slli         t4, a0, 17
                  auipc        s9, 801651
                  srai         s9, s8, 19
                  fcvt.w.s     s2, fa3
                  mulhsu       s1, s3, t3
                  fmv.w.x      fa3, a6
                  fsgnjx.s     fs9, fs3, fa3
                  mul          t0, a1, s10
                  mulhsu       t2, s3, zero
                  andi         s9, a7, -1056
                  ori          t5, s2, 1887
                  fcvt.s.w     fa7, t4, rmm
                  and          tp, s5, a3
                  sra          a2, s6, sp
                  xor          s10, s1, s9
                  andi         s8, t5, -1050
                  slti         s11, gp, -873
                  fcvt.w.s     t3, ft7, rup
                  sub          a6, a4, zero
                  sll          tp, s6, t3
                  add          t5, t4, s6
                  rem          t0, a3, s8
                  sll          t2, s3, s1
                  add          zero, ra, t5
                  mulhu        t5, s2, zero
                  fsgnjx.s     fs4, ft10, ft9
                  srli         s3, zero, 19
                  and          s0, s6, a3
                  fclass.s     s2, fs11
                  fsqrt.s      fs4, ft4, rdn
                  xor          s5, s10, s2
                  fmin.s       fs5, ft6, ft1
                  feq.s        a6, fs4, fs8
                  ori          a1, s3, -1917
                  mulhsu       s5, s8, t1
                  div          a6, s4, s6
                  slti         t1, s9, -1550
                  fsgnj.s      ft1, ft4, fs0
                  mul          a6, s9, t3
                  nop
                  fcvt.wu.s    a3, fa2
                  fmv.x.w      s9, ft0
                  fsgnj.s      ft2, ft6, ft9
                  slli         a6, t0, 21
                  lui          t4, 199027
                  srl          s2, t5, s3
                  xor          gp, t0, a7
                  auipc        ra, 983765
                  nop
                  fmv.x.w      s1, fa1
                  andi         s10, t1, -1107
                  rem          a3, s3, t6
                  fsgnjn.s     ft2, fs10, fa3
                  srli         t5, a3, 15
                  remu         s10, s1, sp
                  auipc        tp, 1044329
                  srli         s3, s5, 7
                  mulhsu       s4, s6, s9
                  mulh         t0, s3, ra
                  fsgnjn.s     fa2, fa6, fs9
                  fcvt.wu.s    tp, ft2
                  flt.s        a2, ft7, fa4
                  srli         tp, s9, 20
                  fmv.x.w      s8, fa2
                  fcvt.s.wu    fa6, s11
                  add          t1, s3, t4
                  srai         t5, t4, 8
                  lui          s4, 299146
                  fsgnjn.s     fa4, fs10, fa5
                  ori          a6, a1, 1353
                  ori          s8, a2, -1722
                  srl          s5, a1, t2
                  fcvt.s.w     ft9, s6
                  divu         s11, s4, s6
                  andi         t3, sp, -1845
                  fmin.s       fa3, ft3, ft4
                  fdiv.s       fa6, ft1, ft8, rtz
                  flt.s        t4, fs7, ft8
                  fle.s        s11, ft4, ft3
                  fclass.s     t0, fs8
                  fmax.s       ft0, fa7, fs7
                  fmul.s       ft0, ft2, fs9, rdn
                  or           a3, s5, tp
                  sltiu        a0, t2, 1171
                  flt.s        zero, ft2, fa1
                  andi         s5, t2, 1851
                  feq.s        s1, fa5, ft1
                  div          s11, a5, s6
                  xor          s4, a6, sp
                  sltu         a0, a5, s5
                  slti         t5, s11, 1456
                  xori         s11, s8, -361
                  srli         a1, a6, 9
                  rem          s5, s7, t5
                  sll          a4, a1, a6
                  fclass.s     s11, ft3
                  add          a4, t5, t4
                  addi         t1, s6, -54
                  fmv.x.w      t1, fa7
                  xori         a2, t5, -7
                  and          a1, t2, zero
                  ori          t6, gp, -350
                  xor          a7, t6, t4
                  fsub.s       fa1, ft1, fs2
                  fsgnjx.s     ft7, fa2, ft1
                  srai         s2, s3, 29
                  fsub.s       ft8, ft7, fs3
                  srli         a6, t2, 15
                  add          tp, t0, gp
                  flt.s        t1, fs9, ft11
                  fdiv.s       ft5, fa4, fs4
                  sltiu        t2, s2, 542
                  slti         a0, t3, -712
                  sltu         gp, t5, a4
                  sltiu        s2, sp, 1453
                  lui          a7, 956515
                  slti         s8, s3, -1865
                  nop
                  srl          a0, t3, s2
                  fsqrt.s      fs4, ft4
                  sltu         s5, a1, s3
                  fclass.s     t4, fa3
                  div          t0, s0, a2
                  fsub.s       ft1, fs7, fa7, rdn
                  auipc        s1, 553359
                  fcvt.wu.s    t0, fs1
                  slti         t4, a1, 438
                  slt          a3, t4, ra
                  fadd.s       fs11, fa5, ft6, rup
                  fmv.w.x      fa1, s2
                  fdiv.s       ft5, ft10, fa5
                  slt          ra, tp, a0
                  fmv.w.x      fs5, t1
                  fmv.x.w      ra, ft4
                  fcvt.w.s     t4, fs1, rdn
                  fmin.s       fs7, fa7, fs7
                  divu         a0, a1, sp
                  fcvt.s.wu    fa0, t2, rmm
                  fsgnjn.s     fs0, fa4, ft10
                  fmul.s       fa7, fa2, ft1
                  or           zero, t3, sp
                  addi         s3, s2, 196
                  sra          s1, s7, t4
                  and          t2, a4, s10
                  fmv.x.w      tp, ft1
                  srai         t4, a5, 20
                  sll          a7, a2, s5
                  fcvt.wu.s    a6, fs3, rdn
                  sll          a4, a0, t5
                  fsqrt.s      fs11, ft4, rdn
                  srli         t3, a4, 13
                  mul          zero, s1, t5
                  xori         zero, s3, 1896
                  fdiv.s       fa3, fa1, fs2, rne
                  fcvt.w.s     t0, fs7, rne
                  fmax.s       fs0, fa0, ft11
                  xor          t1, s2, zero
                  fcvt.s.wu    ft5, tp, rup
                  fsqrt.s      fs0, fs3
                  srai         t2, a3, 6
                  fsgnjx.s     fs2, fa2, fa3
                  and          a5, a1, t1
                  div          t2, a2, s10
                  lui          s9, 49839
                  fsub.s       fa0, ft11, fs11, rmm
                  srli         a3, s1, 8
                  mulh         t4, t0, s8
                  fmv.x.w      tp, fs9
                  addi         s0, t0, -1734
                  flt.s        ra, ft2, ft0
                  divu         a6, s6, s5
                  flt.s        s5, ft2, ft10
                  mul          s1, a3, t0
                  srl          a7, t3, gp
                  div          a4, zero, s2
                  fcvt.s.w     ft11, t3, rmm
                  fcvt.w.s     a4, fs4
                  ori          a2, s5, -369
                  mul          a4, gp, s5
                  fmul.s       fs4, ft11, fs9, rup
                  fcvt.wu.s    a2, fs6, rmm
                  fmul.s       ft10, ft3, fs1
                  mulh         zero, a4, zero
                  fle.s        s1, fs6, ft0
                  fmax.s       ft3, fs2, ft10
                  div          s0, s5, a0
                  lui          a4, 167046
                  slti         a6, s6, 389
                  xori         a5, sp, -1044
                  flt.s        t3, fa7, ft7
                  sll          t6, s6, zero
                  slti         s5, t5, 1869
                  fsub.s       ft10, fs2, ft5
                  fsgnjx.s     ft2, fs1, ft11
                  sltu         s1, s11, a1
                  rem          t0, tp, a2
                  ori          a4, zero, -100
                  and          s5, t0, t0
                  fdiv.s       ft1, fs2, ft5
                  fsqrt.s      fa5, fs2
                  fcvt.s.w     ft6, sp
                  nop
                  fsgnjn.s     fs9, fs11, ft5
                  and          s1, t5, a3
                  fcvt.w.s     s10, ft2
                  feq.s        t5, fa3, fa2
                  ori          a7, s0, 1177
                  sltu         t0, t4, s1
                  ori          t3, ra, -728
                  fsqrt.s      fs4, fs8
                  fmv.x.w      ra, ft4
                  slli         a6, ra, 31
                  lui          tp, 455923
                  fcvt.s.w     ft2, s0, rmm
                  andi         s3, a6, -455
                  fcvt.wu.s    a0, fa6
                  lui          t1, 396004
                  div          s8, s8, s3
                  addi         a1, s6, -1608
                  fcvt.wu.s    a5, ft7, rdn
                  fmax.s       ft0, ft2, fa3
                  srli         a6, s8, 3
                  flt.s        s1, ft8, fs6
                  ori          t6, s11, 241
                  fdiv.s       fs8, fs8, fa5
                  fsgnj.s      fa7, fs1, fa3
                  srai         s0, s5, 28
                  or           s4, s0, a5
                  lui          gp, 620879
                  fmul.s       fs9, fs7, fs10, rup
                  fsub.s       fs1, ft3, fs3
                  sltiu        gp, a3, -1453
                  divu         t0, s10, t1
                  slli         t3, t3, 20
                  sub          t4, a2, s1
                  and          s1, tp, a6
                  fmv.x.w      s0, fs1
                  sltiu        s10, s0, 1351
                  mul          gp, s0, a4
                  fcvt.wu.s    t0, fs10, rmm
                  fmax.s       fa7, ft4, ft11
                  lui          s1, 705698
                  auipc        t6, 953846
                  mulhsu       s9, t0, t5
                  divu         s0, a4, sp
                  mulhu        tp, t5, s5
                  mulh         t3, t6, t1
                  fcvt.wu.s    a5, ft4
                  fcvt.s.wu    fa3, s10
                  xori         s0, t0, -142
                  auipc        s9, 990908
                  fsgnjx.s     fs11, fs9, fs8
                  nop
                  fsgnj.s      ft9, ft10, ft1
                  fsgnjx.s     ft5, fa6, ft9
                  and          s3, zero, s11
                  fadd.s       fs5, fa6, fs5
                  auipc        zero, 905595
                  sll          t2, s9, sp
                  slli         s2, a2, 1
                  nop
                  fle.s        s10, fa2, fa2
                  mulh         s11, t1, t3
                  srli         s3, s7, 0
                  sltu         s1, t5, t3
                  fcvt.s.wu    fs11, a7, rtz
                  srai         a2, zero, 10
                  addi         s0, a4, -1591
                  sub          gp, s0, t5
                  mulhu        t5, s8, a5
                  fsgnjx.s     fa7, ft3, fa3
                  mulh         s9, t2, s1
                  fsgnjn.s     fa6, fs5, fs9
                  fmax.s       fs7, ft6, fs8
                  slti         t4, t1, 80
                  xori         t2, t6, -1582
                  divu         s9, s7, s9
                  xori         a4, s6, 1490
                  srl          a0, s10, a5
                  sll          t2, zero, s4
                  srl          a3, s0, s7
                  mulhu        a3, s9, s4
                  flt.s        t2, ft3, fs1
                  fmv.x.w      a7, ft0
                  sll          a2, t3, s9
                  fsub.s       fs3, ft5, fs6, rdn
                  fadd.s       fa2, fs7, ft1
                  lui          t2, 298178
                  feq.s        a5, fa7, fs11
                  div          a5, t2, a0
                  srli         a2, a0, 1
                  fcvt.s.wu    fs10, t6
                  fsgnjn.s     ft0, ft9, ft0
                  sll          s3, a5, sp
                  andi         a7, s10, 579
                  xori         t2, t1, -1494
                  mulhsu       t5, t0, s5
                  fdiv.s       fa4, ft8, fs9, rtz
                  sll          t5, a0, s5
                  fsub.s       ft2, ft11, ft1
                  or           s11, a3, t2
                  fclass.s     a2, fa5
                  sll          a0, a7, ra
                  slt          s9, s1, a7
                  srai         t0, a4, 10
                  feq.s        a4, ft6, ft11
                  fsgnjn.s     fs1, fa1, fa7
                  lui          t0, 594836
                  rem          a1, s4, ra
                  fsub.s       ft11, fa6, ft0
                  sltiu        zero, t0, 1971
                  and          t1, gp, t6
                  div          s10, s1, a6
                  div          t5, s11, a4
                  fcvt.wu.s    a5, fs7
                  xor          zero, t6, t3
                  mul          s8, t3, t5
                  fcvt.s.w     fs11, t0
                  fsgnj.s      fa1, ft11, fs11
                  add          a4, s7, a4
                  or           s10, s4, a0
                  fmv.x.w      s2, ft5
                  and          s3, a6, s5
                  remu         a1, a5, s9
                  ori          t4, a0, -1884
                  fmin.s       ft1, fs2, fa4
                  fmv.w.x      ft1, t5
                  auipc        s5, 828958
                  fmin.s       ft9, fs5, fa2
                  srl          ra, t2, a0
                  fadd.s       fs9, ft1, ft1, rmm
                  andi         s3, t3, 1087
                  andi         t1, s6, -1083
                  srli         a3, a7, 13
                  mulh         t5, a2, s6
                  sub          t3, t4, a5
                  fsgnj.s      fa2, ft11, fs7
                  add          s9, t2, ra
                  andi         a2, a3, 19
                  fcvt.wu.s    s4, fa7, rup
                  or           gp, t1, a7
                  ori          gp, a7, -984
                  xor          s3, s9, s9
                  rem          t1, a1, t2
                  fmv.x.w      s9, fs2
                  auipc        s0, 646745
                  fclass.s     a2, fs2
                  fcvt.wu.s    t1, ft9, rtz
                  mul          a7, s11, s1
                  remu         s8, s2, a2
                  fle.s        t2, fs9, ft7
                  sltiu        s9, s9, 1298
                  fadd.s       ft10, fs10, fs10, rdn
                  slt          t5, tp, gp
                  mul          ra, ra, t2
                  srli         a2, s4, 22
                  fcvt.w.s     gp, fs5
                  fsgnj.s      ft2, fs8, fa2
                  fclass.s     a1, ft1
                  mulh         s4, t2, a5
                  fmax.s       fa4, fa3, fs11
                  xori         t1, sp, -1588
                  fsgnjn.s     fs10, ft8, fa3
                  fadd.s       ft5, ft7, ft9
                  sll          s1, t4, s3
                  xori         ra, t6, 519
                  andi         s4, t5, -165
                  fclass.s     a7, fs9
                  slti         zero, zero, -1640
                  srli         a7, s7, 28
                  mul          s3, t2, t3
                  sub          tp, s4, s3
                  fdiv.s       fa1, ft10, fs1, rne
                  mulhu        t6, a4, a5
                  rem          s2, s9, s3
                  sll          gp, a3, gp
                  fsgnjn.s     fa7, fa4, fa1
                  nop
                  ori          t6, sp, -574
                  fsqrt.s      ft9, fa6, rup
                  flt.s        gp, ft0, fa6
                  fcvt.s.w     fa2, t2
                  sltiu        a4, s3, -1233
                  sll          t1, s5, s3
                  divu         s9, a3, s6
                  srli         a0, t1, 20
                  lui          a5, 655998
                  fcvt.s.w     ft6, zero, rup
                  sra          ra, ra, a0
                  fclass.s     t1, fs6
                  fdiv.s       ft7, fa7, fs10, rdn
                  sll          a6, s0, a4
                  fmul.s       ft3, fa4, ft11
                  fmin.s       ft0, fa6, fa0
                  fcvt.wu.s    s8, fs6
                  fcvt.s.wu    ft4, t3
                  fmv.w.x      fa6, s0
                  fmv.x.w      a5, ft3
                  srl          ra, s4, s9
                  auipc        t6, 123064
                  fsgnjn.s     ft6, fs4, fs2
                  mulhsu       a6, t2, t2
                  fsgnj.s      fa0, ft0, ft4
                  fmv.x.w      a7, fs6
                  fsgnjn.s     fs8, ft3, fa0
                  fsgnj.s      ft7, fs11, ft9
                  fcvt.w.s     a5, ft1
                  fsgnjn.s     ft11, fs6, ft3
                  nop
                  fcvt.w.s     s5, ft8, rup
                  sll          s8, sp, a6
                  fsgnjx.s     fs7, ft3, fs8
                  rem          a5, s2, a6
                  sll          t1, s11, s4
                  fcvt.w.s     a1, fs8, rdn
                  slti         t4, a1, 1061
                  or           s0, t3, t3
                  nop
                  mulh         a0, tp, s6
                  sltu         gp, a1, a0
                  auipc        s11, 427899
                  fsub.s       fs11, fs5, ft11
                  sub          t1, t2, s7
                  fmul.s       ft9, fs3, ft0, rtz
                  fle.s        a2, ft5, fs10
                  fclass.s     s9, fs10
                  sra          s8, a4, s2
                  xori         s10, s6, -378
                  or           tp, s7, s5
                  srli         gp, t0, 17
                  fsgnjx.s     fs10, fs5, fs9
                  sltu         s8, s4, s6
                  fmv.x.w      a6, fs4
                  remu         t4, a5, s1
                  or           t1, t6, s9
                  fsqrt.s      fs2, fa5
                  srli         s5, s5, 31
                  add          a6, s8, t1
                  auipc        t0, 890859
                  fsub.s       ft8, fa3, fa4, rdn
                  fle.s        a0, ft10, fs4
                  slli         s1, a4, 29
                  fsqrt.s      fs10, fs8, rne
                  add          a0, t3, t6
                  fsgnj.s      ft8, ft10, ft1
                  srai         a7, s9, 1
                  srl          s2, s9, t6
                  sltiu        s5, s11, 3
                  fcvt.s.wu    ft4, t0, rtz
                  srl          s2, t6, s11
                  remu         ra, t5, s6
                  div          t5, s3, s8
                  sltiu        a2, a3, 1008
                  fcvt.s.w     fs7, s7, rne
                  fdiv.s       fs6, ft5, fs2
                  add          s9, sp, s9
                  mulhu        s1, s10, t4
                  addi         t1, t3, -1176
                  srai         s3, a0, 30
                  fcvt.wu.s    a7, fa4, rtz
                  mulhsu       a7, s4, sp
                  sll          a3, a2, s1
                  srl          s9, s7, a0
                  fmax.s       ft1, fa2, ft10
                  and          s1, a7, t1
                  nop
                  feq.s        s0, fs1, fa3
                  fdiv.s       ft8, fa5, ft6
                  mul          t0, t5, a2
                  slti         s2, s9, -1872
                  sll          s9, zero, a0
                  flt.s        t4, fa7, fs0
                  sltu         t5, s1, s6
                  fmv.w.x      fs10, gp
                  fadd.s       fs11, fs8, fa2
                  srai         zero, s6, 16
                  ori          zero, s6, 702
                  add          s9, sp, a0
                  slt          s0, s9, s8
                  fcvt.wu.s    s0, fs10
                  remu         s2, s0, ra
                  fsgnjx.s     fa4, ft0, ft10
                  sltiu        a6, s2, -1179
                  sll          s9, s10, sp
                  auipc        zero, 54962
                  andi         t0, a7, 1490
                  fclass.s     s5, ft5
                  divu         gp, t0, t5
                  fclass.s     t2, fs8
                  fadd.s       fa1, ft0, fs11, rtz
                  fadd.s       ft8, fs0, ft2, rup
                  or           s3, s10, s2
                  addi         t3, a7, -71
                  fmax.s       ft6, fa3, fa5
                  fmax.s       ft0, ft6, fa3
                  fmv.x.w      s0, fa3
                  flt.s        s10, ft0, fs4
                  fsgnjn.s     ft9, fs1, fa6
                  fsgnjx.s     ft9, ft6, fs5
                  mulhsu       a6, gp, t4
                  srai         t1, t1, 9
                  fcvt.wu.s    a3, fs1, rmm
                  fclass.s     t2, ft7
                  fmv.x.w      a5, fa3
                  sltiu        gp, s8, 26
                  fsub.s       ft0, fa6, fs0
                  slti         t0, s7, 1218
                  fmax.s       fs1, ft7, fa7
                  xori         t3, s9, 799
                  fle.s        ra, fa2, fa2
                  or           s4, a3, gp
                  mul          t5, gp, tp
                  xor          a7, gp, s8
                  add          t3, a7, a4
                  sra          s2, a0, ra
                  fmv.x.w      t4, fs8
                  fclass.s     gp, fs7
                  and          gp, tp, s3
                  fmax.s       fa1, fa1, fs5
                  andi         t1, sp, 1817
                  fcvt.s.w     ft1, t2, rtz
                  fcvt.s.wu    fa4, tp, rup
                  srl          t4, t4, s4
                  xor          s3, a2, t4
                  sra          s1, s0, s4
                  fcvt.wu.s    zero, fa0
                  fcvt.s.w     ft5, s7, rne
                  mul          a2, s7, a2
                  mulhu        s10, a3, s4
                  fsqrt.s      ft3, fs7
                  div          s2, a7, a5
                  mulh         t6, s11, t0
                  fsub.s       fs8, ft3, ft6, rtz
                  mulhu        a2, s0, t3
                  rem          s5, a6, s8
                  nop
                  ori          a7, s11, -1929
                  divu         a6, s10, a4
                  fmv.x.w      s1, fs5
                  ori          s9, s8, -332
                  ori          a4, t5, 1490
                  mul          s4, t0, a1
                  slli         t2, s8, 30
                  or           t4, a7, t2
                  rem          a6, gp, s8
                  fcvt.s.wu    ft2, s2
                  mulhu        ra, a1, zero
                  fsgnjx.s     fa4, ft0, fs4
                  addi         t4, a3, -28
                  slti         s10, s8, -1403
                  feq.s        s2, fs0, ft2
                  srl          t3, s5, s10
                  mulhu        a5, s2, s5
                  addi         t4, s6, -809
                  lui          t5, 168490
                  mulh         t0, gp, a7
                  add          t1, s10, a3
                  fdiv.s       ft4, fs3, ft11, rup
                  sll          t2, s6, tp
                  mul          s8, s3, zero
                  remu         t6, a6, s2
                  divu         a6, s7, t4
                  fcvt.w.s     t5, fs6
                  div          s0, s0, s1
                  fmv.x.w      s1, fa7
                  fcvt.s.wu    ft5, t6, rup
                  ori          gp, s6, -187
                  add          a2, a4, ra
                  fsgnjx.s     ft2, ft0, ft2
                  andi         a7, a6, -994
                  fclass.s     s2, fa4
                  fsgnj.s      fa2, fs5, fa0
                  fmul.s       ft4, ft6, ft4
                  fsqrt.s      ft7, ft4, rne
                  slli         tp, s11, 18
                  remu         a0, s7, a3
                  fsgnj.s      fs9, fs10, fs8
                  mul          t4, t4, sp
                  fmax.s       ft5, fa6, fs6
                  fcvt.wu.s    s4, fa3, rup
                  srli         t0, s7, 18
                  sll          a2, s0, a7
                  fdiv.s       ft5, ft9, fs11, rtz
                  fcvt.w.s     s5, fs0, rmm
                  remu         s8, gp, ra
                  mulhsu       s5, t0, s11
                  xor          s8, a0, s5
                  sll          s8, s5, t5
                  feq.s        a0, fs10, fs0
                  div          gp, t5, zero
                  remu         s9, t2, s4
                  andi         a6, t1, -1444
                  fsgnjx.s     fs0, fs7, fs5
                  add          t2, t6, s8
                  fdiv.s       fs7, ft7, ft1
                  fsub.s       fs3, ft9, fa7
                  slti         a7, a4, -834
                  mulh         t5, s0, s5
                  nop
                  xori         s9, a3, 2027
                  fmul.s       fa7, fs11, fa1
                  sub          t0, s2, a4
                  feq.s        s5, fs10, fs8
                  div          a4, a0, a5
                  nop
                  srl          s2, a4, zero
                  sra          a3, a4, s9
                  xori         s10, s2, 1170
                  fcvt.wu.s    s0, fs9
                  fmin.s       fa2, fa4, fa2
                  andi         s5, s9, -433
                  nop
                  fadd.s       fs1, ft11, fs0
                  fcvt.w.s     s0, ft8
                  fsqrt.s      fs4, ft11
                  xori         a6, a7, -1942
                  slti         s2, ra, 1352
                  fsub.s       ft7, ft6, fa3
                  add          a5, tp, a4
                  flt.s        s0, ft1, ft8
                  or           s2, ra, s6
                  srl          ra, s2, t0
                  sub          ra, s8, s4
                  sra          s10, t3, s5
                  slti         a4, s4, 1847
                  xori         t4, t0, -1007
                  and          a5, s9, s3
                  sll          t0, t0, t2
                  srl          t1, t3, s6
                  divu         gp, sp, s1
                  fsub.s       ft7, ft5, fa2
                  addi         t4, tp, -943
                  fmin.s       fa2, fs10, ft1
                  mulhu        t5, sp, t0
                  addi         s2, a3, 2023
                  sra          t3, t2, s8
                  divu         t2, sp, s2
                  flt.s        zero, ft2, ft0
                  fclass.s     s0, fa4
                  fadd.s       fa5, fs6, ft2, rtz
                  fadd.s       fa6, fs11, ft6
                  fcvt.s.w     fa1, a4, rup
                  srli         a7, t3, 30
                  mulhu        t6, a4, a4
                  sra          a5, s10, a4
                  fcvt.w.s     a4, fs8
                  sll          gp, s11, a5
                  add          ra, tp, a7
                  lui          s4, 554782
                  fsqrt.s      ft1, fs4
                  sltu         t2, s6, zero
                  ori          t5, tp, 1447
                  auipc        t6, 935882
                  fclass.s     tp, fs0
                  srli         ra, s3, 28
                  fsgnjx.s     fa6, ft8, ft6
                  xor          a4, t6, t3
                  srli         a4, a1, 8
                  srai         a1, tp, 21
                  nop
                  slti         t0, s0, 239
                  fcvt.s.w     fs10, s3
                  sltiu        a4, s11, 605
                  fmax.s       fa4, ft9, fs9
                  slt          s9, s11, s6
                  remu         t0, s10, s8
                  feq.s        a5, ft7, ft10
                  slli         zero, s7, 16
                  rem          a1, ra, s5
                  fle.s        t0, fs2, fs2
                  mulh         a5, t2, a0
                  add          s3, a0, t1
                  fmax.s       fs4, fa2, fs3
                  xor          ra, zero, t6
                  fcvt.s.wu    fs3, sp
                  addi         a0, a0, -830
                  fcvt.wu.s    a5, fa3
                  fmul.s       ft4, ft6, fa5
                  srl          ra, t3, s9
                  feq.s        a6, ft9, fs3
                  sltiu        s9, s0, -1023
                  mulhsu       s11, zero, a6
                  fcvt.s.w     ft2, a5
                  remu         a5, a2, s9
                  div          s0, t4, t6
                  rem          s3, t0, s2
                  andi         t0, t0, -1223
                  and          a4, s7, t2
                  fmv.x.w      s0, fs6
                  fcvt.s.w     ft11, a7
                  fmin.s       ft2, fa1, ft9
                  remu         ra, s0, t2
                  mulh         s10, s8, s6
                  rem          ra, sp, a4
                  fmin.s       fs8, fs6, ft10
                  slti         a6, gp, -1217
                  or           t6, s5, s9
                  mulhsu       s10, t2, ra
                  fmax.s       fs9, ft10, fs2
                  andi         a2, zero, -358
                  auipc        t5, 193456
                  sub          t2, a6, t0
                  mulh         a4, t4, t6
                  srli         a6, a2, 29
                  fcvt.s.wu    ft5, t6, rup
                  addi         s8, t2, 1132
                  div          t3, s10, s8
                  fcvt.wu.s    t1, fs0, rne
                  fcvt.s.wu    ft9, s4, rmm
                  ori          tp, s8, -542
                  fsgnjn.s     fs6, fa2, fs5
                  auipc        s0, 975522
                  fcvt.s.wu    fs8, t3
                  fcvt.w.s     t3, fs9, rdn
                  fmin.s       ft5, ft4, fa0
                  fle.s        a6, fs9, fs6
                  xor          t0, s8, s11
                  srai         a3, t6, 28
                  nop
                  div          s1, s11, s1
                  feq.s        a3, ft6, ft9
                  fmv.w.x      ft1, sp
                  xori         s9, a3, 1891
                  fcvt.wu.s    t5, fs6, rup
                  slli         gp, a4, 16
                  mul          ra, s10, t6
                  rem          a2, a2, s2
                  fsgnj.s      fs4, fs7, fs3
                  fmv.x.w      a1, fs7
                  andi         t2, t0, -1345
                  fcvt.s.w     ft6, s10
                  srli         s11, zero, 7
                  or           ra, s0, s8
                  andi         s11, a2, -35
                  lui          t1, 822395
                  xor          a2, a5, ra
                  fcvt.s.w     fs6, t2, rup
                  auipc        s0, 163946
                  sra          t0, sp, s11
                  fmv.x.w      t6, fa5
                  fcvt.s.w     fs11, s10, rtz
                  fsub.s       fs7, ft1, fs0
                  sra          a6, a4, zero
                  fsgnjx.s     fs10, ft0, ft9
                  auipc        a1, 75660
                  fle.s        a5, ft2, fa2
                  fle.s        s9, ft1, fs6
                  fclass.s     a0, ft10
                  slti         s10, s8, 855
                  fdiv.s       fs2, ft7, fs6, rdn
                  sltu         a0, t5, zero
                  xor          s3, s5, t5
                  sra          a7, s11, s0
                  fcvt.w.s     s8, fa4
                  mulhsu       ra, t5, s6
                  fmv.w.x      ft2, s11
                  srl          s9, t1, s2
                  addi         a2, a4, 809
                  flt.s        t4, ft11, fs3
                  fclass.s     s2, fa4
                  fsub.s       ft6, fs0, fs8, rup
                  srli         ra, ra, 17
                  slt          gp, zero, t2
                  andi         s0, a2, 596
                  srl          tp, s10, s4
                  xor          t4, t5, a4
                  fmin.s       fs5, ft4, ft1
                  nop
                  mulhu        a6, s2, s10
                  sltu         s8, s7, a0
                  srai         s8, s7, 4
                  and          t0, s7, a5
                  flt.s        t6, fs7, fs11
                  srai         t3, tp, 13
                  xor          a7, gp, tp
                  fmv.w.x      fs8, s9
                  andi         a4, t5, 1240
                  fdiv.s       ft0, fs7, ft11, rmm
                  srl          a1, a2, s2
                  fadd.s       fs11, fs9, fa3
                  xori         t0, s8, -496
                  remu         t6, s2, t3
                  fmax.s       fs11, ft5, fs1
                  fcvt.s.wu    ft8, s7, rup
                  ori          t6, s2, -394
                  flt.s        s10, fs9, fs8
                  mulhu        t5, a3, s0
                  sub          a3, a4, a5
                  feq.s        s1, fa5, fa0
                  lui          t6, 1019871
                  slli         a0, a6, 1
                  fsgnj.s      fs9, fs1, ft6
                  fcvt.s.wu    fs7, s11, rmm
                  fsub.s       fs11, ft4, ft9
                  mul          a0, t4, t2
                  fmv.w.x      ft5, sp
                  lui          a5, 608297
                  div          tp, s9, s10
                  slti         a7, t0, -1622
                  divu         s9, s8, a5
                  slt          a2, t4, s6
                  and          a1, a4, s1
                  mulhsu       s4, ra, a5
                  fsgnjn.s     ft11, fs0, fa3
                  xor          s5, t2, s9
                  srli         s4, s4, 8
                  divu         t6, s9, t3
                  fclass.s     a4, fa3
                  fadd.s       ft5, fs9, fs10, rtz
                  fcvt.w.s     s8, fs2
                  sltiu        zero, a1, -987
                  and          s1, t4, t4
                  xor          a0, a3, s9
                  mul          gp, a5, s0
                  fadd.s       fa2, fs1, fs10
                  slt          s11, t2, t6
                  or           a3, a4, s2
                  slli         t1, tp, 29
                  fmin.s       fs1, ft11, ft6
                  mul          a5, sp, a3
                  fsqrt.s      ft0, ft10, rmm
                  addi         s2, s7, -1921
                  fsub.s       fs4, ft11, fs2
                  fcvt.w.s     s5, fa2, rne
                  xori         s0, s1, -1324
                  fclass.s     a4, ft0
                  fsqrt.s      ft5, fa5
                  rem          t6, t1, a1
                  addi         s3, sp, 1718
                  flt.s        s10, fa7, fs2
                  fcvt.s.w     fa2, a7, rne
                  mulhsu       t0, a7, tp
                  mulhu        s5, a1, s11
                  srl          s11, s9, s6
                  sltu         a3, t3, s9
                  add          a2, t4, s6
                  sltu         s1, a2, gp
                  ori          s0, t6, -2045
                  fcvt.w.s     s10, ft5
                  fsgnjn.s     ft7, ft8, fa6
                  auipc        a4, 661196
                  or           s1, t6, s8
                  slli         t2, s5, 14
                  fsgnjx.s     fa1, fs7, fs0
                  feq.s        a7, ft6, fs6
                  fmax.s       ft3, fs7, fs3
                  lui          a3, 945529
                  slli         s11, t4, 23
                  divu         t6, s7, ra
                  sra          s10, t1, sp
                  fmin.s       fa3, fa5, fa5
                  fmv.w.x      ft0, t1
                  and          a6, s1, a0
                  and          tp, s11, a5
                  sra          t0, t2, a0
                  and          zero, a3, s3
                  sltiu        a0, s6, 386
                  fadd.s       ft0, fa2, fa0
                  lui          t3, 1020311
                  and          s11, s1, t0
                  fsgnj.s      ft1, fa5, fa7
                  fmin.s       fs3, ft1, ft2
                  mul          s11, ra, a0
                  addi         a5, sp, -334
                  mul          s5, s3, a7
                  div          t4, gp, a1
                  andi         a3, t5, 153
                  xor          s2, a7, s9
                  sll          t6, a1, zero
                  div          gp, tp, t1
                  mulh         s0, a2, a6
                  sltu         t4, t6, t6
                  auipc        s8, 675547
                  srl          s2, zero, a5
                  or           s9, t1, ra
                  srai         s8, s11, 2
                  xori         a3, t5, 955
                  fsgnjx.s     ft3, ft2, fa3
                  and          a2, t2, s3
                  fsub.s       fa0, ft6, ft3
                  fsub.s       ft1, fa0, fa0
                  fmv.w.x      ft8, a4
                  fcvt.wu.s    a2, ft1, rtz
                  sra          t5, tp, s8
                  sub          a1, t0, a4
                  ori          s10, s11, -70
                  fmin.s       fs9, fs10, fs9
                  slt          s10, s6, s7
                  flt.s        a3, fs4, fs3
                  lui          ra, 49931
                  fsgnjn.s     fa2, fs5, ft3
                  and          a2, zero, a3
                  fcvt.s.w     ft8, s2
                  remu         s5, a2, s4
                  fsub.s       ft8, fs9, ft3
                  fmv.x.w      tp, ft4
                  fclass.s     a1, ft11
                  srl          s9, t2, a0
                  slt          s5, ra, s2
                  fcvt.w.s     s8, ft7
                  slti         s3, a6, -1099
                  fsgnj.s      fa3, fa3, ft10
                  mulh         s9, s2, s11
                  sll          s9, a5, a1
                  mulhu        s3, t0, s10
                  divu         s11, sp, t5
                  div          t2, a7, t2
                  xori         t2, gp, -379
                  div          a2, t0, ra
                  fsgnj.s      ft0, ft6, fs1
                  srl          a5, s10, s11
                  fmin.s       ft10, fs1, fs4
                  mulh         s1, s9, a3
                  mulhsu       t2, s5, s3
                  xor          a4, sp, sp
                  or           s2, s6, s6
                  fsgnjx.s     ft8, ft9, fs1
                  sltiu        s8, t5, 718
                  sltu         s1, a4, s11
                  nop
                  flt.s        a2, ft8, ft11
                  rem          t2, s3, t0
                  fmul.s       ft0, fa5, ft3, rne
                  sltiu        t5, s0, 1471
                  mulhsu       s9, s7, a1
                  slli         t3, s8, 30
                  sltiu        a3, s7, -967
                  lui          s1, 679592
                  fadd.s       fa1, fs7, fa0, rmm
                  auipc        s3, 316983
                  fmv.x.w      s9, fs2
                  divu         t2, s4, s4
                  fadd.s       ft6, ft3, ft1, rne
                  remu         t1, zero, a6
                  slt          s3, t2, s11
                  sra          s5, s6, t3
                  fadd.s       ft8, fs0, ft8, rne
                  rem          a1, gp, s6
                  sltiu        a5, t6, 920
                  fdiv.s       fs5, fs3, fs11
                  fclass.s     a7, fs1
                  fsgnjn.s     ft11, fs3, ft7
                  lui          a6, 167755
                  fcvt.s.w     fs7, a0
                  sltu         a3, s5, s3
                  fclass.s     s9, ft3
                  and          s2, s11, a3
                  flt.s        a1, fs8, fa0
                  fsub.s       fs2, ft5, ft11, rne
                  sra          gp, s5, t4
                  mulh         s10, t1, t1
                  andi         t6, a7, 893
                  slti         s8, t2, -1819
                  fsqrt.s      ft7, fs9
                  fmv.x.w      s11, fs7
                  mulh         s5, gp, a7
                  slt          a1, s0, s10
                  xor          ra, a2, s9
                  div          s1, s2, a2
                  fmin.s       fa1, ft5, ft4
                  fmin.s       ft10, ft10, fs2
                  fsgnjx.s     ft3, fa3, ft9
                  sltu         t3, s4, a1
                  mulhu        t2, s6, sp
                  remu         a0, t1, t6
                  div          a7, a6, zero
                  sltu         s10, a0, s2
                  fsgnj.s      fa1, fa0, ft1
                  fsgnj.s      fa4, ft2, fs4
                  sltiu        s1, a1, -1950
                  andi         s4, s4, 398
                  srli         gp, a2, 20
                  sub          a3, a7, t4
                  andi         gp, t0, -432
                  feq.s        s2, ft1, ft8
                  fcvt.s.wu    ft8, s8, rmm
                  sra          a2, t5, sp
                  xori         s4, sp, 412
                  fsgnjx.s     fs5, ft0, ft8
                  fsub.s       fs6, ft1, fs9
                  srli         t1, a1, 25
                  fcvt.wu.s    gp, fa2
                  fsgnjn.s     ft3, fs11, fs5
                  fcvt.wu.s    a6, ft2, rne
                  andi         s0, a4, -3
                  fsqrt.s      fa3, fa1, rup
                  fsqrt.s      fs0, ft2, rmm
                  fmul.s       fa3, fs5, fs5
                  flt.s        t3, fa5, fs5
                  fsgnj.s      ft3, fs6, fs2
                  fmin.s       fa6, fa4, ft2
                  sltiu        s0, s5, 349
                  fle.s        a0, fs10, ft7
                  sra          t2, t1, a6
                  sra          t5, t5, sp
                  lui          a5, 361053
                  divu         a2, s10, a0
                  srl          s11, s2, sp
                  auipc        zero, 160674
                  andi         s8, t3, 1845
                  xor          s10, a3, a3
                  xor          gp, sp, a5
                  div          a5, s11, s6
                  or           t3, a6, a2
                  fcvt.w.s     a0, ft5, rup
                  sll          ra, t2, s6
                  sub          s9, tp, s0
                  and          s9, s8, t0
                  nop
                  and          a2, t3, t1
                  slt          s10, ra, a4
                  sltiu        a4, tp, -45
                  divu         s4, a1, a5
                  rem          a2, t3, tp
                  flt.s        t5, ft11, fs5
                  slti         s5, a4, -1694
                  auipc        s3, 261492
                  sra          gp, a1, t6
                  remu         t1, a4, s1
                  nop
                  fmul.s       ft0, fs4, fa0, rdn
                  fsub.s       ft11, ft9, ft11, rdn
                  and          ra, s8, t2
                  srai         s4, s1, 23
                  xori         s5, s11, 150
                  remu         a4, s11, s5
                  slt          s4, a4, a2
                  fadd.s       fs8, ft11, ft8, rmm
                  feq.s        a6, fs6, fa6
                  or           s4, tp, a1
                  add          tp, s0, tp
                  rem          s2, zero, a0
                  ori          s8, s11, -1292
                  auipc        gp, 434204
                  fclass.s     a2, fa0
                  mul          t2, a5, s4
                  slti         a2, a5, 1085
                  addi         tp, t3, 829
                  fadd.s       fs9, ft6, ft5
                  divu         t3, t1, t6
                  andi         s3, a1, 965
                  fmax.s       ft2, ft7, ft7
                  fsgnj.s      fs11, ft0, fs8
                  fsgnjn.s     ft7, ft6, ft7
                  srl          a1, a7, zero
                  sltu         s11, s2, s3
                  sub          s0, s0, tp
                  nop
                  mulh         t2, t0, a2
                  rem          gp, t3, a1
                  fcvt.wu.s    t5, fa2
                  srli         s11, t4, 24
                  fmin.s       ft6, fa3, ft6
                  or           t0, a1, t4
                  fsub.s       fa0, fs8, fa1, rne
                  nop
                  sltu         tp, a1, a7
                  xori         zero, s1, -1761
                  fdiv.s       ft7, fa0, fs7
                  fsqrt.s      fa6, ft1, rdn
                  sra          a3, a2, s1
                  auipc        a6, 453562
                  fcvt.s.w     fa2, s8
                  lui          a6, 844685
                  nop
                  fcvt.s.w     ft2, s9
                  xor          t6, ra, t4
                  fmax.s       fs2, ft5, fa6
                  fle.s        t6, fs11, ft6
                  andi         s9, s4, -149
                  or           s8, ra, ra
                  ori          s0, sp, 1944
                  fmv.x.w      tp, fa1
                  andi         s9, a1, -1254
                  mul          a6, s6, s11
                  lui          s9, 916335
                  fsgnjx.s     fs2, fs2, fa0
                  fmax.s       ft7, ft7, fs11
                  addi         t6, s3, -1083
                  mulhsu       s1, s4, t0
                  fsub.s       fs0, ft5, fa0, rtz
                  srli         ra, t6, 26
                  mulhu        s10, zero, s0
                  mulhsu       s11, s4, a6
                  fcvt.s.wu    fa6, s1
                  fclass.s     t2, ft6
                  and          a3, t4, s5
                  feq.s        ra, ft9, ft4
                  fsgnj.s      fs6, ft10, fs0
                  fle.s        a5, fa2, ft6
                  sll          s2, a2, a3
                  fsgnjx.s     fa4, fa5, fs2
                  ori          a0, a5, 34
                  fmax.s       ft1, fs0, fs7
                  fmv.x.w      t3, fa3
                  fmax.s       ft5, fa0, fs7
                  lui          s11, 310368
                  addi         gp, zero, 2040
                  add          a4, a7, gp
                  fle.s        ra, ft4, fa7
                  sll          t3, s5, s9
                  divu         t0, a6, s2
                  flt.s        a1, fs7, fs11
                  andi         s5, tp, 1286
                  fmv.x.w      s5, ft1
                  ori          a7, s2, -646
                  fsgnj.s      ft9, fs5, ft1
                  divu         t5, s1, t1
                  sra          tp, s4, sp
                  flt.s        gp, fs7, ft4
                  div          zero, s9, a4
                  divu         t4, a2, s10
                  fmul.s       fs6, fs4, fa6
                  fle.s        ra, fs0, ft7
                  lui          s3, 489345
                  feq.s        s8, fs6, ft8
                  xori         tp, s10, 1242
                  sltiu        a7, s0, -1085
                  div          a5, a0, t1
                  fle.s        t1, fs7, fs3
                  fclass.s     s1, ft2
                  fdiv.s       fa1, ft9, fs10, rup
                  sll          s4, s1, s9
                  fcvt.w.s     a5, fs2, rdn
                  fsqrt.s      ft0, fa7, rtz
                  xor          s8, a0, a4
                  fsgnjn.s     fa2, fa4, fa7
                  srl          s2, s11, t2
                  lui          t5, 664125
                  fcvt.w.s     t4, fa1, rtz
                  slt          s4, s1, a5
                  srai         s10, t4, 20
                  lui          a2, 618985
                  or           a2, s2, t6
                  addi         s0, a1, -1583
                  sltu         s5, s7, t6
                  fclass.s     t0, ft0
                  addi         a5, a0, -901
                  fmv.w.x      ft4, zero
                  fadd.s       ft11, fa2, fs3, rne
                  andi         zero, s2, -1101
                  sub          a2, s2, t4
                  fcvt.wu.s    a6, fa4, rup
                  fsgnjn.s     fa6, fa0, fs11
                  fmv.x.w      s3, fs9
                  ori          a0, s11, -1936
                  slli         s4, a5, 18
                  fmv.w.x      fs3, s6
                  auipc        a2, 524904
                  nop
                  remu         t3, s0, s3
                  fsgnjn.s     fa0, fa4, ft11
                  fadd.s       ft2, ft6, ft6, rne
                  fsgnj.s      ft7, fs8, fs4
                  fsgnj.s      fa2, fs6, fs7
                  fclass.s     tp, fa5
                  fmul.s       ft3, fs7, fs6, rtz
                  sll          a3, tp, t5
                  mul          s9, s9, t6
                  mulhsu       s8, s7, s8
                  lui          gp, 725283
                  fcvt.w.s     zero, ft8, rne
                  ori          a7, s5, 1566
                  xor          t5, s7, t1
                  andi         t6, t6, 2004
                  fsgnjx.s     ft3, ft5, fs8
                  fmv.x.w      a2, fa0
                  mulhu        s9, s6, sp
                  fcvt.wu.s    s5, fs9, rup
                  mulhu        t6, a7, s8
                  remu         s9, t1, s0
                  srl          t3, sp, a4
                  nop
                  mulhu        s3, s7, a5
                  andi         t0, sp, 1562
                  fclass.s     s0, fs10
                  fclass.s     a1, fs0
                  sra          s8, t3, s3
                  fle.s        ra, fa7, ft1
                  fsub.s       ft6, fs2, fs6, rmm
                  fmv.w.x      fs8, a2
                  mulhsu       a7, s1, s1
                  slti         tp, s5, -1877
                  srl          t2, s11, t0
                  rem          t6, ra, s2
                  fmul.s       fs0, fa3, fa2, rup
                  auipc        s4, 339035
                  feq.s        ra, ft10, ft5
                  div          s8, t6, t4
                  fle.s        tp, fa7, fs2
                  div          a1, ra, a0
                  fsub.s       fs2, ft8, fs5
                  fcvt.w.s     t0, fs0
                  andi         s10, s3, 1446
                  srl          a5, a0, t5
                  fmv.x.w      s1, ft3
                  mulhsu       t3, s9, t6
                  nop
                  xori         ra, s4, -258
                  flt.s        s5, fa3, ft7
                  nop
                  fsgnjn.s     fs8, fs10, fs2
                  slt          a5, a0, tp
                  sub          t5, s5, s8
                  sltu         t0, s0, t0
                  rem          gp, s8, ra
                  mulh         s4, ra, t4
                  rem          s9, zero, s8
                  fsgnj.s      ft1, fa1, ft0
                  srai         s11, s2, 9
                  fsgnj.s      ft4, ft4, fs8
                  slli         t0, t1, 25
                  mul          gp, tp, s2
                  fsgnjx.s     fs3, ft4, ft1
                  sra          t4, s2, a5
                  mulh         s2, s11, a6
                  srli         a3, a2, 11
                  slli         a2, a7, 1
                  div          t0, t2, a2
                  sltu         s9, t5, s2
                  auipc        ra, 956908
                  fmax.s       fs1, ft5, ft0
                  fcvt.s.wu    fs11, t3
                  xori         s5, s9, -811
                  fcvt.s.wu    ft2, t6, rdn
                  fcvt.s.w     fs1, t1, rup
                  fclass.s     t3, fs3
                  mulhu        ra, s0, a2
                  fcvt.w.s     t1, fs11
                  fmv.w.x      fa2, tp
                  sub          t3, a2, s0
                  fle.s        s10, fs3, fa0
                  fle.s        s2, fs1, fs1
                  addi         a2, s11, 1683
                  fmv.w.x      ft4, t5
                  rem          tp, t2, t5
                  slt          a7, s10, a3
                  fle.s        t3, ft11, ft11
                  mul          t5, s6, s5
                  fmv.w.x      ft2, zero
                  fle.s        s1, fa3, ft4
                  fsub.s       ft9, ft3, ft6, rtz
                  sub          s8, s6, sp
                  add          a2, t6, s1
                  fcvt.wu.s    a3, ft2, rdn
                  srai         a3, gp, 17
                  div          s4, a2, t4
                  xori         t0, a5, -1801
                  fcvt.s.w     fs1, s7
                  and          tp, s2, s2
                  slti         s8, s10, -1240
                  mulh         s10, t6, zero
                  fcvt.s.wu    fs2, t2
                  slt          gp, s6, a6
                  fmv.w.x      fs6, a4
                  srai         s2, s6, 28
                  fsgnjx.s     fs9, ft8, fs5
                  andi         a5, s2, -1014
                  auipc        s10, 665630
                  lui          gp, 264972
                  feq.s        s1, fs11, fa1
                  divu         a2, s2, a0
                  fmax.s       fa3, fa7, ft9
                  fcvt.w.s     a3, ft8
                  divu         t1, tp, t3
                  and          gp, a0, s2
                  add          zero, ra, a5
                  fmax.s       fa6, fs5, ft10
                  fcvt.wu.s    t3, fs5, rmm
                  sub          s3, s11, ra
                  lui          s10, 99833
                  slt          t4, tp, gp
                  fadd.s       ft11, fs3, fs11
                  sra          s4, gp, t3
                  slt          t1, tp, a2
                  fmul.s       fs3, ft10, ft8
                  flt.s        s5, fa5, fa4
                  flt.s        a4, fs0, fa1
                  mulhsu       tp, a5, gp
                  fcvt.wu.s    a3, ft11, rmm
                  slli         a6, s5, 3
                  srli         s5, a2, 13
                  sltiu        a2, t5, 1810
                  fsgnj.s      ft6, fs10, fs8
                  ori          ra, tp, 1817
                  fmul.s       fs9, ft7, fs4, rdn
                  nop
                  fclass.s     s10, ft3
                  fmax.s       ft9, ft11, fs2
                  slt          s5, s0, a6
                  addi         a7, t0, 790
                  fsgnjn.s     ft4, fa2, ft4
                  fclass.s     s5, fa4
                  mulh         gp, a7, s4
                  fcvt.s.w     fs1, s5, rne
                  fmv.x.w      t2, fs11
                  fsub.s       fa3, ft10, fa0, rdn
                  divu         s11, s10, a2
                  srai         t1, gp, 12
                  fsgnj.s      fs1, fa3, fa3
                  ori          a0, s7, -1000
                  remu         a2, s5, t4
                  srai         ra, gp, 15
                  slti         t0, tp, -1822
                  fcvt.s.wu    fs11, t3, rtz
                  and          a3, zero, s9
                  and          s4, s6, s7
                  or           t0, a0, s8
                  sra          a5, tp, a1
                  add          s3, a4, t1
                  fdiv.s       fa1, fs10, fa0, rne
                  srl          ra, t4, ra
                  add          a2, a5, t0
                  fclass.s     ra, fs6
                  mul          tp, s4, t3
                  fclass.s     t1, ft1
                  fmin.s       fs6, fs6, fa1
                  slti         t3, t3, -849
                  fmin.s       ft3, fs6, fs5
                  fsqrt.s      fa6, ft5
                  addi         a2, s2, 1061
                  rem          s11, a1, tp
                  fle.s        a1, fa2, fa7
                  fcvt.s.wu    fa3, s6
                  or           t4, s5, t3
                  auipc        s5, 941508
                  fmv.w.x      fs3, ra
                  flt.s        s9, fs11, ft7
                  fmv.w.x      fs3, s8
                  fsqrt.s      fs5, fa3, rtz
                  slt          s3, a2, zero
                  fsub.s       ft9, fs8, fs1, rtz
                  fle.s        t4, ft5, ft3
                  mulh         s3, s2, s7
                  mulhu        t4, s5, tp
                  mulh         t3, tp, t6
                  fsgnj.s      ft3, ft6, ft3
                  add          s0, s2, t2
                  fmv.x.w      t6, fs9
                  slti         t0, t1, 631
                  fmv.x.w      t6, fs7
                  fcvt.w.s     a1, fa5, rne
                  add          s0, gp, a1
                  slt          tp, s3, ra
                  rem          a4, t6, s9
                  mulhu        ra, s7, a4
                  mulhsu       s5, zero, t1
                  fcvt.w.s     s5, fs8
                  andi         s5, a2, 1626
                  andi         a1, t2, 3
                  andi         t2, gp, 2011
                  fcvt.s.wu    ft2, s10
                  fcvt.s.wu    fs9, t5, rup
                  srai         ra, s7, 19
                  feq.s        a0, ft10, fs3
                  fclass.s     s0, fs10
                  andi         t1, a3, 951
                  fsgnj.s      fa4, ft1, fa3
                  fsgnjx.s     fa3, fs6, fs5
                  fsqrt.s      ft1, ft11
                  fsub.s       ft2, fs8, fs9, rne
                  slti         s10, gp, -261
                  xori         gp, s10, -797
                  fcvt.s.w     ft5, s11, rup
                  fmv.w.x      ft5, zero
                  fdiv.s       ft11, fs10, fs4, rup
                  divu         t6, t4, s1
                  srai         gp, s1, 7
                  sub          t5, s1, s3
                  srl          s0, s8, s11
                  fmin.s       fs8, ft9, ft5
                  fsqrt.s      fs10, ft8
                  slti         s9, s0, -1809
                  feq.s        a2, ft2, fs0
                  fcvt.s.wu    ft6, s2
                  divu         t5, s5, a3
                  mul          ra, t1, s4
                  mul          ra, s2, t3
                  div          t2, zero, sp
                  fdiv.s       ft3, fa6, ft0, rmm
                  divu         t5, s0, a5
                  flt.s        a6, ft10, ft4
                  srl          s9, a3, a3
                  or           s2, t4, s0
                  fsub.s       ft3, ft2, fs7, rdn
                  mulh         zero, s4, a0
                  srl          t2, s4, t1
                  sub          s8, s3, t3
                  fcvt.s.w     fs3, s6, rtz
                  andi         a7, s7, 1442
                  xor          a5, tp, s2
                  sub          tp, t6, a1
                  sltiu        ra, s6, -963
                  auipc        t2, 805852
                  fcvt.wu.s    s10, fa1
                  fsgnjn.s     ft0, ft9, fs0
                  fclass.s     s1, ft2
                  sra          s10, a0, s3
                  fsgnjn.s     fa3, fa3, fa4
                  feq.s        s8, fs2, fs1
                  xori         s2, s2, 1135
                  mulh         ra, zero, s8
                  feq.s        s9, fs1, fs11
                  mulhu        t5, s7, t3
                  fdiv.s       fa4, fs9, fs9
                  fmax.s       fs7, fa4, fa7
                  or           a7, a7, s5
                  mulhu        s2, s8, s0
                  fsgnjx.s     ft0, ft7, ft1
                  fmin.s       ft4, ft8, fs11
                  add          a0, s4, a0
                  srli         s1, s9, 17
                  mulhu        t5, ra, s2
                  mulh         a0, t6, s8
                  srli         a1, zero, 8
                  srl          ra, tp, gp
                  xor          s3, t0, a6
                  feq.s        tp, fs9, fs3
                  mul          t5, tp, s3
                  mulh         s9, a2, a4
                  fdiv.s       fs6, ft7, fa2, rtz
                  fadd.s       ft1, fa5, ft1, rup
                  flt.s        gp, fs7, fs11
                  srl          s10, t4, a1
                  slt          gp, s0, t2
                  and          a7, t1, s3
                  fcvt.s.wu    fs8, s1, rup
                  or           s5, a7, t6
                  add          a1, a0, a6
                  fsub.s       ft4, fs6, fs0
                  rem          a1, gp, sp
                  divu         a0, ra, a4
                  andi         t2, s5, -115
                  remu         a6, s3, t2
                  sub          a1, t1, s8
                  fsgnjn.s     fs8, fa5, fs0
                  sra          t2, s10, s0
                  slti         a7, a0, 1278
                  feq.s        s5, fs4, fs4
                  sll          a0, a3, s11
                  srli         a1, a5, 25
                  xori         t1, a4, 199
                  fle.s        s10, ft11, fa5
                  fadd.s       fs11, ft10, ft3, rtz
                  divu         s5, a7, t4
                  fcvt.wu.s    a6, ft9, rmm
                  fclass.s     a3, fa4
                  fsqrt.s      fa4, ft8, rdn
                  slli         a4, zero, 6
                  srl          t4, s7, s3
                  fcvt.s.wu    fs0, tp
                  addi         s9, zero, -1912
                  fmin.s       ft9, fs11, ft7
                  addi         a4, t0, -957
                  slt          s2, t4, a6
                  andi         zero, t1, 462
                  srl          s4, s9, s4
                  fcvt.w.s     t6, ft10, rdn
                  fmv.x.w      s5, ft3
                  mulhsu       tp, s9, a7
                  mulh         s11, s8, s11
                  lui          s11, 413176
                  auipc        s10, 805382
                  fcvt.w.s     a0, fs1
                  fdiv.s       ft0, fa4, ft11
                  sltiu        a7, s8, 203
                  fmv.x.w      s2, fa7
                  sll          a1, s5, tp
                  srl          a4, s6, ra
                  fcvt.s.w     fa6, s6
                  srl          a0, s9, s1
                  feq.s        s4, ft3, ft4
                  mulhu        ra, a1, s5
                  fclass.s     s5, ft8
                  fsgnj.s      fs2, ft5, ft3
                  sra          t0, tp, s3
                  fsub.s       ft1, ft4, ft3, rtz
                  fsgnjn.s     ft11, ft10, fs8
                  slt          gp, s7, a5
                  mul          a2, sp, a4
                  or           t5, tp, s10
                  fmv.w.x      fs9, a2
                  add          t2, a7, s1
                  fmv.w.x      ft3, a5
                  srai         s4, ra, 5
                  sub          s0, gp, a0
                  fadd.s       fs5, fa2, fs7
                  mulh         t2, gp, t5
                  fadd.s       fa7, fs2, ft2
                  andi         a6, t4, -741
                  xor          s4, s1, t0
                  fmv.x.w      a4, fa1
                  addi         a4, s11, -1018
                  fcvt.w.s     t1, ft6, rdn
                  and          s3, s2, a1
                  fmin.s       fa5, ft3, ft0
                  add          ra, t4, t4
                  fmin.s       fs10, fs1, ft0
                  andi         s0, s11, -697
                  fsgnjx.s     ft7, fs7, fs1
                  auipc        s11, 252431
                  xori         s5, s9, 1160
                  xori         t2, s6, 1121
                  fsub.s       ft8, ft2, fs6, rup
                  feq.s        a3, fs4, ft1
                  auipc        s3, 171620
                  divu         t4, s2, a3
                  srl          t5, t1, t5
                  fcvt.wu.s    s2, fa1
                  or           s4, t3, a3
                  fmul.s       ft10, ft3, fs8
                  slli         s3, s6, 0
                  or           t4, s10, s0
                  slt          ra, t0, t5
                  sltu         ra, a2, a0
                  mul          a3, zero, a1
                  mulhu        s2, a2, a2
                  xor          s11, s11, t3
                  slti         s9, s6, 1376
                  fmax.s       fs9, fs0, fs6
                  nop
                  srai         s11, t0, 16
                  rem          s3, s6, a6
                  mulh         t1, a0, a0
                  nop
                  div          s0, s7, s8
                  fsqrt.s      ft5, fs5
                  fcvt.s.wu    fs7, gp, rmm
                  slli         t3, t3, 11
                  and          ra, s9, s11
                  lui          t1, 684497
                  divu         t2, a2, s0
                  srl          s11, a6, t5
                  mulhu        t4, t5, s6
                  fmul.s       ft9, fs4, ft10
                  ori          t6, a1, 1979
                  fsub.s       fs10, fs1, fs6
                  feq.s        s4, ft11, ft0
                  sra          t6, a3, t2
                  fsgnjx.s     fs4, fs0, fa4
                  fmul.s       fa1, ft2, fs0, rmm
                  srai         a2, s9, 7
                  srl          s11, s7, s4
                  fcvt.wu.s    gp, ft6, rup
                  mulh         s11, t5, a7
                  fmin.s       fs0, fs9, fs9
                  flt.s        s2, ft11, ft3
                  fle.s        tp, fs11, fa7
                  fmv.w.x      fs4, a6
                  addi         ra, s9, 1563
                  fsgnj.s      ft6, fs9, ft9
                  fmax.s       ft5, ft1, fa2
                  slt          s3, sp, t3
                  mulh         s10, s3, a2
                  fcvt.s.w     ft0, s11
                  mulhsu       s9, a5, a4
                  fcvt.w.s     s1, fs7
                  fmv.x.w      a7, fs1
                  addi         t0, a1, 44
                  sra          s8, s6, tp
                  mul          t3, a1, a3
                  fmv.x.w      s0, fs8
                  fdiv.s       ft5, fs5, fs8
                  or           a1, zero, s1
                  div          t0, s3, s1
                  and          s3, s8, t1
                  fcvt.w.s     t0, fs1
                  mul          t2, s2, sp
                  sltu         t6, zero, a6
                  ori          s1, s7, -1140
                  fsgnjn.s     fa2, fs8, ft5
                  or           t2, sp, a4
                  srai         a4, a6, 6
                  andi         a1, t3, 1652
                  fdiv.s       fs6, fa2, ft9, rtz
                  fcvt.s.wu    ft1, a2
                  nop
                  nop
                  fclass.s     t3, ft9
                  fcvt.wu.s    tp, fs7
                  add          a3, a0, ra
                  remu         s3, s11, t1
                  add          s10, s10, a5
                  fsqrt.s      ft11, fs5, rup
                  or           gp, s7, a7
                  addi         t5, a6, -1517
                  fsqrt.s      fa6, ft9, rtz
                  fmv.x.w      t4, fa0
                  fcvt.wu.s    t0, ft6, rne
                  fclass.s     s0, ft10
                  xor          a0, s5, zero
                  fsgnjn.s     ft11, fs7, ft6
                  or           t4, s11, s7
                  xori         a5, a2, -799
                  fmul.s       fs2, fs0, fa2
                  fsgnj.s      fs9, fs4, ft10
                  slli         s0, t6, 5
                  rem          a6, zero, ra
                  auipc        s3, 986616
                  fmv.x.w      a5, ft1
                  fcvt.s.wu    fa1, s9
                  slti         t1, t5, 954
                  add          t6, s1, a0
                  xor          s1, a3, zero
                  fcvt.s.w     fs10, s8, rdn
                  fmv.x.w      ra, fa0
                  fcvt.s.w     fs0, ra
                  and          tp, ra, s8
                  fadd.s       ft5, ft3, fa5, rtz
                  or           s4, t1, s6
                  fsub.s       fs4, fs0, fs4
                  remu         t5, a3, s2
                  flt.s        a4, ft1, fs9
                  fmax.s       fs7, fs3, ft4
                  addi         s1, a2, 1398
                  sra          t2, s8, gp
                  sub          t2, s1, a3
                  divu         t4, a3, ra
                  feq.s        ra, ft4, fs7
                  fsqrt.s      ft4, fa5, rmm
                  divu         a0, t0, a7
                  add          s8, t2, a5
                  fmax.s       fa1, ft2, fs7
                  fdiv.s       fa4, fs6, fa1
                  mulhsu       a4, t6, ra
                  slli         a4, t2, 22
                  fclass.s     ra, fa2
                  slli         t3, a4, 10
                  slli         t0, a1, 22
                  remu         s3, s5, a1
                  rem          s1, s10, gp
                  fcvt.s.w     fs11, s9
                  fcvt.w.s     gp, fs5, rne
                  slli         t5, ra, 10
                  slti         a1, t5, 15
                  div          gp, a7, s1
                  div          s1, t6, gp
                  divu         ra, s1, s4
                  srli         zero, t5, 5
                  fcvt.s.wu    ft3, ra, rup
                  fsqrt.s      fa0, fs7
                  fadd.s       fa3, fs6, ft1, rtz
                  fmv.w.x      ft9, a7
                  lui          a7, 477969
                  nop
                  xor          a5, t5, s1
                  sltiu        a6, t4, 1228
                  fcvt.s.wu    fa3, s1, rup
                  fmin.s       fs4, ft4, ft3
                  fmv.w.x      fs1, t6
                  andi         s11, s7, 1210
                  fdiv.s       fa5, fa4, ft5, rmm
                  srai         t5, gp, 11
                  addi         s9, t5, -905
                  rem          a5, a1, t6
                  fle.s        s10, fs2, ft6
                  auipc        a2, 801615
                  addi         t0, zero, 1525
                  slli         t2, sp, 22
                  mul          a4, tp, t4
                  fsqrt.s      fs5, fs5
                  fsgnjx.s     fs3, fa0, ft3
                  fadd.s       fa4, fa1, ft0
                  lui          t4, 761653
                  flt.s        ra, ft10, fs2
                  addi         a6, s3, -1449
                  fcvt.w.s     s3, fs5, rmm
                  fmax.s       fs1, ft9, fs8
                  fmv.x.w      a4, ft9
                  xor          s5, s3, tp
                  slti         a1, t0, -1431
                  fcvt.s.w     fs4, t0
                  fcvt.w.s     a0, ft9, rmm
                  mulh         gp, gp, zero
                  sub          t3, a2, s0
                  xor          t1, t4, a3
                  fmax.s       fs7, fs8, fa1
                  fcvt.s.wu    fa7, a7, rup
                  slli         a1, t0, 3
                  or           gp, s5, gp
                  xor          s0, tp, s2
                  sub          a7, t6, s4
                  fmv.x.w      a5, ft3
                  srli         s1, sp, 11
                  fcvt.w.s     zero, fs8, rdn
                  div          t1, zero, ra
                  rem          t6, s1, s0
                  flt.s        gp, fa7, fa7
                  fmul.s       ft11, fa1, fs4, rup
                  divu         s10, a7, t3
                  fmin.s       ft11, ft11, ft10
                  div          a3, a2, t1
                  srai         t0, t4, 18
                  sltu         t5, sp, zero
                  mul          a1, t5, t3
                  remu         a7, a6, a7
                  mulhu        s9, t0, s8
                  fcvt.wu.s    ra, ft2, rup
                  sra          zero, t0, s0
                  fle.s        s8, fa2, ft6
                  fcvt.s.wu    ft3, t0, rtz
                  add          s8, ra, s6
                  slli         s5, s9, 18
                  fcvt.wu.s    zero, fa5
                  flt.s        a3, ft2, fa5
                  add          ra, gp, t6
                  feq.s        t3, ft4, fa0
                  fadd.s       ft9, fa4, fa6
                  auipc        a7, 385006
                  addi         s2, t6, -1301
                  fcvt.w.s     s10, fa2, rmm
                  flt.s        tp, fs9, ft3
                  auipc        s0, 189553
                  fmin.s       fs4, fs5, fa3
                  lui          s9, 804068
                  addi         s4, tp, 1046
                  and          s3, t0, tp
                  fsgnjx.s     fs8, ft1, fs11
                  sltiu        a4, ra, -1605
                  fcvt.w.s     t5, fa3, rup
                  addi         t4, a5, -1100
                  lui          zero, 591378
                  fsgnj.s      fs9, ft8, ft2
                  fcvt.w.s     a4, ft3
                  fsgnjn.s     fs2, fs8, ft0
                  mulh         s5, s3, t5
                  andi         t1, t3, 83
                  remu         a1, s6, t5
                  fmin.s       ft8, fs5, ft10
                  fcvt.wu.s    t1, fa1, rtz
                  ori          tp, a4, -601
                  srl          zero, s2, s11
                  fsgnj.s      ft8, ft8, ft9
                  fcvt.s.w     fa4, ra
                  feq.s        t6, fs10, ft0
                  fmin.s       ft2, ft11, fs1
                  srai         s10, t1, 12
                  flt.s        a1, fa4, fa6
                  sltiu        s3, s0, 1034
                  mulh         a6, s3, s5
                  sltiu        a7, s9, -413
                  fsub.s       fs6, ft6, fs0, rne
                  and          gp, s7, s7
                  fcvt.s.wu    fa6, s10, rne
                  fcvt.w.s     s11, fs7, rtz
                  and          s5, s0, s4
                  lui          t0, 12874
                  fsgnj.s      ft10, fs7, fs1
                  fcvt.s.wu    ft10, s8, rne
                  slt          gp, t2, s9
                  fclass.s     s2, ft3
                  xori         a0, zero, -1920
                  slti         s11, a0, 548
                  sll          a7, a1, a2
                  xor          a4, a5, zero
                  fclass.s     a2, fs10
                  auipc        a3, 104454
                  fcvt.w.s     a7, fa7, rup
                  rem          s1, s2, s3
                  fclass.s     t6, ft0
                  fdiv.s       fa2, ft2, fs3, rup
                  fmv.w.x      ft10, a2
                  divu         s10, sp, a7
                  nop
                  mulh         a6, a7, s2
                  fclass.s     a3, fs2
                  nop
                  srl          t1, t2, s9
                  div          tp, a6, a4
                  andi         zero, t0, -455
                  addi         t6, t2, -1586
                  sra          s0, t0, s6
                  fmul.s       fa0, fs2, ft5, rdn
                  slti         a5, s6, -1426
                  addi         a6, s1, 285
                  sltu         t2, a7, a2
                  srl          a6, a5, s9
                  srl          a3, s11, s2
                  fclass.s     t6, fa4
                  mulh         a5, t5, s5
                  srai         a3, a0, 0
                  slti         a6, a4, -1526
                  mulh         t4, s2, s4
                  slti         s5, a1, -1061
                  fsqrt.s      fs3, ft9
                  xori         a6, a1, 906
                  fsub.s       fa6, fs7, fa1, rtz
                  fsgnj.s      ft3, fs10, fa5
                  fsub.s       fa6, ft8, fs1, rup
                  mulh         t6, s5, s5
                  andi         s4, s7, 701
                  fdiv.s       ft11, fa3, fa5, rdn
                  srai         s2, a1, 25
                  rem          t0, a0, a0
                  divu         a5, s9, a1
                  slti         a3, a5, 547
                  fmin.s       ft0, ft2, ft11
                  slli         s2, a2, 12
                  and          ra, s7, s8
                  sll          ra, s6, ra
                  slti         s11, a5, -1409
                  fsgnjn.s     ft10, fa3, ft9
                  auipc        a1, 945920
                  fcvt.s.wu    fa3, a4
                  srai         tp, s0, 1
                  sltu         a6, s4, a0
                  mulhsu       gp, s3, t3
                  fmv.w.x      fs10, s3
                  slli         t6, s4, 15
                  fsgnj.s      fa7, fa1, fa7
                  fsgnj.s      ft1, ft11, fa6
                  sltu         t4, s10, a5
                  fmv.w.x      fs7, s2
                  and          s0, s4, t0
                  remu         t2, s3, tp
                  fsub.s       ft2, fs5, fs1
                  fmul.s       fa7, fa1, ft6
                  fmul.s       fa2, ft2, fs2, rne
                  fsgnjn.s     fa0, fs3, ft11
                  fcvt.w.s     t2, ft5, rup
                  mulhu        t3, a6, a6
                  auipc        s2, 366525
                  rem          s0, s0, ra
                  mul          s8, s9, t1
                  addi         t2, t2, 761
                  mulhu        a6, tp, a5
                  slt          s8, zero, sp
                  srai         s2, a4, 18
                  fcvt.wu.s    a5, fa5
                  mulh         s2, s5, t4
                  sltiu        t1, a5, 416
                  nop
                  fadd.s       ft11, ft5, ft4
                  srai         s10, tp, 22
                  and          a5, t4, a3
                  fadd.s       fs0, fs1, ft11, rmm
                  fcvt.s.w     fs8, a4, rtz
                  fle.s        s5, ft0, fs10
                  fsub.s       fs6, ft1, ft7, rmm
                  srai         a5, s3, 29
                  lui          s10, 916150
                  sll          a2, s7, t4
                  fcvt.s.w     ft5, a4
                  fle.s        a1, ft1, ft7
                  auipc        a7, 446554
                  fclass.s     t5, fa5
                  fadd.s       ft2, ft2, fs9, rmm
                  sub          a6, s2, a2
                  fadd.s       ft0, ft10, fs10
                  or           a6, t6, t2
                  auipc        t3, 484602
                  fsgnjx.s     ft7, ft10, ft8
                  mulhu        t5, a3, a4
                  fmax.s       fa2, fs3, ft10
                  slti         t1, s2, 1267
                  fadd.s       fa6, ft0, fa4, rdn
                  fsgnj.s      ft5, fa2, ft4
                  srli         t1, a5, 10
                  fsqrt.s      fs8, fa7
                  fcvt.wu.s    t4, fa5
                  nop
                  fsub.s       fa5, ft2, ft1, rne
                  fclass.s     s2, fs8
                  sra          zero, s4, s10
                  divu         s3, s1, a3
                  fcvt.wu.s    a4, ft11
                  xori         t0, s4, 246
                  fle.s        a1, ft3, fa2
                  feq.s        t3, ft0, fa5
                  sltu         a1, s5, t0
                  fmv.w.x      fa7, t3
                  rem          gp, t3, s8
                  lui          gp, 377762
                  srli         s0, s5, 14
                  sub          s11, t2, s7
                  nop
                  srl          s5, t2, s1
                  slt          s4, t3, s1
                  mulhu        s9, s10, zero
                  xori         tp, s2, -1579
                  or           zero, a0, s4
                  rem          t0, s1, s2
                  feq.s        t1, ft9, fs11
                  srli         a0, t5, 2
                  fadd.s       ft8, fa1, fa0, rtz
                  fadd.s       ft3, fs1, fa7, rup
                  fmin.s       ft3, fs9, ft1
                  rem          s5, ra, s9
                  fmv.x.w      s10, ft3
                  fsgnj.s      fa7, fs1, ft1
                  fsgnjn.s     fs3, fs0, fa4
                  fcvt.s.wu    ft2, a3
                  fadd.s       ft9, fa4, fs4, rtz
                  slt          t2, a0, s10
                  feq.s        a3, ft3, ft6
                  ori          a7, t6, -880
                  fsgnjx.s     fa0, fs1, fs2
                  fsqrt.s      ft1, ft10
                  sub          s0, s6, s10
                  fcvt.s.wu    fa1, gp, rmm
                  fmax.s       fs5, ft5, fa5
                  auipc        a7, 392390
                  sltiu        t1, t5, -1219
                  fsgnjx.s     fs3, ft9, fs2
                  srai         s8, s7, 21
                  fcvt.wu.s    s5, fa5, rup
                  mulhu        a6, a0, s0
                  slti         a3, a5, 1918
                  fadd.s       ft6, ft6, ft7, rup
                  rem          zero, s4, s0
                  feq.s        t6, fa5, fs5
                  mulhu        a3, sp, t0
                  flt.s        t4, fa2, fa4
                  xor          s11, t5, a3
                  fsgnjn.s     ft8, fs4, fa3
                  and          t3, s4, a2
                  remu         t4, s5, s2
                  fsub.s       fs9, fs6, fa5, rne
                  slt          a2, s11, s8
                  fle.s        s11, fa2, ft4
                  fmax.s       fs8, fa6, fa0
                  fcvt.s.w     ft4, s9
                  slti         t3, s11, -370
                  fmv.w.x      fa2, s11
                  feq.s        a6, fs10, fs3
                  slt          a1, t3, s0
                  fmin.s       ft11, fs10, fa7
                  fdiv.s       ft8, ft3, fa3, rdn
                  flt.s        s1, fs4, ft7
                  ori          s8, gp, -1906
                  fsub.s       fa2, fs3, fs8
                  fcvt.w.s     a7, fs2
                  nop
                  sub          s9, s2, a2
                  ori          s10, t3, 207
                  fsgnjn.s     fs4, fs10, ft11
                  ori          s11, a4, -1071
                  sra          s4, s10, s6
                  mulhu        s4, a1, t2
                  mulhu        a4, s5, sp
                  feq.s        s3, fs10, ft11
                  mul          s5, t1, a7
                  slli         s1, zero, 22
                  ori          t2, a2, 652
                  nop
                  ori          a5, a7, -1809
                  or           ra, s0, a1
                  fle.s        t1, ft11, fs5
                  div          a3, t3, s7
                  slt          a5, zero, tp
                  slt          t6, a6, a4
                  rem          a6, sp, s0
                  fmul.s       ft11, ft4, fa2, rmm
                  nop
                  fdiv.s       ft11, fs2, fa3, rtz
                  fmv.w.x      fs1, s10
                  add          t4, a4, t3
                  lui          s5, 95197
                  fcvt.w.s     a2, ft2, rmm
                  flt.s        t6, fs8, fa0
                  fcvt.wu.s    a4, fa1
                  xor          a1, s1, s9
                  fadd.s       fs7, fs11, fa4, rtz
                  div          a5, a4, s4
                  srl          a3, s4, s10
                  divu         t0, zero, t2
                  fcvt.wu.s    t3, ft9, rmm
                  fsub.s       fs1, ft1, fs11
                  fsgnj.s      fa1, fa3, ft7
                  fsqrt.s      fs2, ft9
                  mulhsu       t1, t4, t5
                  sltiu        t2, a1, -1468
                  fadd.s       fa2, ft10, fs3
                  fmv.w.x      fa7, s0
                  add          t0, t6, a4
                  add          t1, s7, s8
                  auipc        t0, 595132
                  sll          s9, s11, t3
                  mulhsu       a2, t3, a1
                  mulhu        s8, a5, s9
                  srl          s0, t2, t2
                  sltu         a3, t5, a3
                  fsgnjn.s     ft4, fs0, fs8
                  ori          s3, gp, -880
                  fmax.s       fs0, fa3, fa7
                  fmv.x.w      gp, fs1
                  slt          s10, s8, ra
                  fsub.s       fa7, fa3, fs9, rtz
                  slt          s11, a5, gp
                  slli         a4, s9, 31
                  slti         t6, a1, 1980
                  sltiu        s0, zero, 519
                  flt.s        s10, ft6, ft0
                  mulh         ra, s0, a1
                  xor          s10, s3, s4
                  srl          s3, t1, s0
                  andi         s9, s5, -1553
                  fsqrt.s      fs2, fa0
                  fsgnjn.s     fa0, ft7, fa0
                  srl          s0, t3, s10
                  fsqrt.s      fs4, fa7, rne
                  fcvt.wu.s    s11, fa3, rup
                  fmin.s       fs3, fs11, ft7
                  rem          a7, t3, s2
                  and          t2, s6, t2
                  feq.s        a6, ft11, fs0
                  slt          t2, s10, ra
                  flt.s        a6, fa7, fs2
                  fmax.s       fs5, fa7, fs5
                  rem          t2, sp, s5
                  feq.s        a7, fs4, ft3
                  srai         zero, tp, 24
                  remu         a1, t5, zero
                  sltiu        t2, tp, 1652
                  ori          s5, gp, -1083
                  srli         t0, a3, 12
                  mulh         s11, s9, s8
                  sltiu        a5, t4, 177
                  rem          s8, s7, s2
                  sub          s3, s2, s3
                  fmv.x.w      a3, fs1
                  fsqrt.s      ft10, fs4, rmm
                  ori          s2, t3, 1258
                  fcvt.w.s     tp, fs2
                  fmax.s       fa0, fa3, fs1
                  mulhsu       t2, s7, t3
                  fmul.s       ft3, fs7, ft1
                  add          s10, a3, s7
                  slt          a1, a3, s6
                  fclass.s     zero, ft0
                  fcvt.s.wu    fs7, s5
                  and          a6, zero, a6
                  fmv.w.x      ft8, t4
                  fclass.s     a4, fa7
                  slti         s4, s6, 1228
                  fmv.w.x      fa7, a7
                  flt.s        a6, fs0, ft5
                  remu         t4, s0, a5
                  srl          gp, a2, s2
                  auipc        s0, 918872
                  fmax.s       fs10, fa0, ft4
                  slti         a3, s11, -1265
                  srl          s2, s3, t1
                  fsub.s       ft11, fa4, fs7
                  fadd.s       fs11, ft1, fs0
                  fmv.w.x      ft9, tp
                  fsgnjx.s     fa4, fa5, fs5
                  mul          t4, t4, s7
                  fcvt.s.wu    ft9, ra, rne
                  xori         s4, gp, 42
                  sub          ra, s10, ra
                  fcvt.s.wu    ft4, t5
                  fmv.x.w      zero, ft8
                  fsgnj.s      fs1, fa5, ft3
                  fcvt.wu.s    t1, ft4, rtz
                  srli         t5, s4, 6
                  srai         a6, tp, 6
                  feq.s        t6, fs5, fa4
                  or           s3, s6, t3
                  fcvt.s.wu    fs9, s8, rmm
                  xor          s2, t0, a0
                  addi         s4, t1, -274
                  fsgnjn.s     fs8, fs6, fa0
                  fcvt.s.wu    fa5, a7, rne
                  addi         a3, ra, -783
                  sltiu        s9, s9, -836
                  nop
                  mulhu        s11, a2, s7
                  fsgnj.s      ft3, ft2, ft8
                  ori          t3, gp, 1632
                  fclass.s     gp, fs5
                  mul          gp, a3, a7
                  feq.s        t6, ft7, fs7
                  auipc        t3, 1044359
                  flt.s        ra, fa3, fa5
                  fmin.s       ft9, fs3, ft7
                  fle.s        ra, fs2, fa4
                  fmin.s       fa4, ft11, fs10
                  addi         zero, t3, -1327
                  xori         s4, t1, 54
                  slti         t4, s9, 1175
                  or           a0, a4, a3
                  xori         a2, s5, -963
                  andi         t0, s6, -104
                  sra          t4, t2, t1
                  flt.s        s8, ft2, ft0
                  fmv.x.w      s3, fa6
                  ori          t4, s4, 2034
                  auipc        s4, 489240
                  fclass.s     s5, ft11
                  mul          tp, a2, s6
                  fsgnjx.s     ft5, fs0, fa0
                  fclass.s     gp, ft2
                  auipc        tp, 846111
                  mulh         s8, a2, a5
                  fsgnjn.s     fa5, fs6, ft2
                  fclass.s     t0, fs6
                  flt.s        gp, fa6, fa7
                  lui          s5, 786361
                  sltiu        a1, a1, -1984
                  flt.s        a3, fa3, fa4
                  remu         a0, t4, a4
                  mulhsu       t2, s5, t6
                  fdiv.s       ft2, fa5, fs8
                  ori          a4, a1, -641
                  remu         t3, sp, t2
                  srli         a2, ra, 21
                  rem          t4, s10, s0
                  slti         t2, s6, 284
                  slti         tp, s5, -817
                  or           a4, s9, s8
                  slt          t0, t6, zero
                  fmax.s       fs10, ft0, ft1
                  fmv.w.x      fs5, a4
                  or           a0, a2, t0
                  add          s4, gp, s5
                  andi         s10, s1, -91
                  srl          a2, s2, s0
                  fmax.s       fs4, fs9, fa4
                  mulhu        t5, t3, t3
                  add          s1, a2, s10
                  fsgnj.s      fs6, fa1, ft8
                  slt          s8, t0, s9
                  auipc        s11, 223493
                  srai         a1, s8, 1
                  srai         gp, t2, 9
                  or           a7, a5, s7
                  mulh         gp, s8, s5
                  slli         a6, sp, 0
                  fmax.s       fa2, ft6, fa6
                  fcvt.s.w     ft5, t4, rmm
                  div          t5, s8, s3
                  fcvt.w.s     a5, fa0
                  fcvt.wu.s    a0, ft7
                  mulhsu       a2, s2, t1
                  and          ra, t1, s10
                  slt          t5, t4, t4
                  slt          t1, s4, s10
                  fdiv.s       ft10, fa0, fs8, rne
                  remu         t0, a4, a5
                  flt.s        t6, fs7, fa7
                  and          s9, a5, t6
                  mulhsu       s5, s9, s4
                  fmin.s       fa1, fs9, fs3
                  mulhsu       t6, s3, gp
                  mulhsu       s11, a5, s5
                  sra          ra, t0, a5
                  slli         tp, t1, 9
                  flt.s        s0, fs3, ft7
                  fcvt.s.w     fa1, s6
                  fcvt.s.wu    ft5, s3
                  sll          t6, a1, s2
                  fadd.s       fs3, fs3, fa0, rne
                  addi         ra, t0, 543
                  fle.s        a0, fa1, ft0
                  andi         a5, s4, -1645
                  andi         t1, a7, 149
                  and          s2, t4, s10
                  add          s3, gp, a4
                  srl          s8, t0, t0
                  slli         s10, t1, 6
                  slti         a7, zero, 792
                  fmin.s       ft11, fa3, ft4
                  fcvt.wu.s    a1, ft1, rmm
                  fadd.s       fs10, fs4, fs6, rup
                  rem          t2, t6, s0
                  fle.s        a5, fa4, fs1
                  add          s3, gp, s9
                  fmax.s       fa1, ft4, fa4
                  fmax.s       fs10, fs1, fa3
                  fclass.s     a6, ft5
                  rem          s1, t6, t4
                  and          s8, s7, s6
                  fmax.s       ft10, ft7, ft2
                  fadd.s       fs11, fs9, ft1
                  slti         tp, s6, -850
                  lui          a7, 196281
                  sub          t5, a3, s9
                  fmul.s       fs7, fa7, ft6
                  fsqrt.s      ft3, fs2, rdn
                  rem          t4, t0, tp
                  div          zero, a4, s3
                  mul          a3, a2, s9
                  fmin.s       fs1, fa0, ft9
                  and          a4, s0, a3
                  add          a0, ra, t0
                  fmv.x.w      tp, fa2
                  sltiu        ra, gp, -219
                  fsgnj.s      fs8, ft8, ft6
                  nop
                  slti         a4, t5, 1682
                  fcvt.s.w     fa6, s10
                  or           t6, s6, s9
                  div          t3, a0, sp
                  mulhu        s0, a1, t2
                  feq.s        s8, fs6, fs9
                  divu         s0, s7, a1
                  ori          t1, s9, 104
                  sltiu        a1, sp, -2007
                  fmv.w.x      fa3, s1
                  mulhsu       s3, s1, t1
                  fsgnj.s      fs9, fa7, fa5
                  xori         s5, tp, 709
                  fadd.s       ft6, ft2, ft4, rne
                  sub          zero, t2, a3
                  mulhu        s4, t1, t3
                  ori          ra, zero, 297
                  auipc        t6, 243469
                  fsub.s       fs9, ft4, fa6
                  fsgnj.s      ft10, ft7, fs7
                  fmul.s       ft6, ft9, fs9, rmm
                  fmv.w.x      fa0, t0
                  fmv.w.x      ft1, s0
                  or           t2, s10, zero
                  fmul.s       ft0, fa5, fs5
                  nop
                  fsub.s       ft8, fs8, fa1
                  fsub.s       fa2, fa5, fs6
                  mulh         a3, s4, a0
                  div          s2, t3, tp
                  fsgnjn.s     fs5, fs11, fa4
                  fsgnjx.s     fs8, fs4, ft3
                  remu         s0, a1, t5
                  slt          s10, a6, a0
                  slt          s5, t1, ra
                  fsgnjx.s     fs1, fa6, fa1
                  rem          s11, s2, a1
                  auipc        a4, 440762
                  lui          s10, 775989
                  fclass.s     a7, ft3
                  addi         t6, ra, 819
                  feq.s        s2, fs5, fs7
                  fsgnjx.s     fs7, ft4, ft3
                  xori         s9, a1, 1401
                  flt.s        a0, fa7, fa1
                  xori         t2, ra, 1076
                  fsub.s       fs9, fs9, fa7
                  fsub.s       fa0, fa5, ft6
                  fcvt.s.w     ft4, a0
                  slli         t5, t5, 3
                  divu         a7, zero, t5
                  fsgnj.s      ft1, fs9, ft5
                  fclass.s     a3, fa6
                  feq.s        tp, ft8, fs11
                  flt.s        tp, fs9, fs11
                  addi         a1, s3, 125
                  nop
                  xori         tp, t0, 684
                  sltiu        a1, t2, -1769
                  div          t1, a4, s5
                  srai         s0, s1, 5
                  mulh         t6, a2, tp
                  fmv.x.w      ra, fs1
                  fsqrt.s      fs9, fs2
                  fsgnjn.s     ft9, fa4, fs10
                  fcvt.wu.s    a0, fs4, rne
                  ori          s4, sp, -934
                  flt.s        t0, ft8, fs5
                  sra          s10, a3, a3
                  fmax.s       ft8, fa1, ft10
                  sra          a2, a0, t4
                  xor          gp, a0, a3
                  and          a1, a6, a0
                  slti         s9, a4, -1815
                  divu         t4, ra, t1
                  srai         gp, a4, 27
                  fdiv.s       ft4, fs6, fs5, rtz
                  or           zero, sp, s1
                  sll          a3, a2, s5
                  srl          a1, s6, gp
                  fsgnjn.s     fs4, fa7, fa7
                  srli         s5, a1, 7
                  sltiu        s1, s7, 183
                  slt          s2, s3, a6
                  fmv.x.w      s8, fs8
                  slli         t0, t3, 27
                  slt          a7, a1, s9
                  sltiu        a7, a0, 97
                  xor          a6, zero, a4
                  fmin.s       fs2, fa1, ft1
                  div          a0, gp, s9
                  sra          s10, a4, tp
                  slti         zero, s3, 1164
                  fsgnj.s      fa1, fs0, fs0
                  fdiv.s       fs10, ft4, fs9, rne
                  or           s0, t6, t0
                  sltiu        a0, sp, -90
                  ori          s1, a7, 837
                  fsub.s       fs2, fa5, ft4, rtz
                  xor          a7, s3, zero
                  fcvt.w.s     a1, ft11, rdn
                  fmin.s       ft3, fs1, fs11
                  fsgnj.s      fs0, fa7, fs7
                  slt          t6, a1, t4
                  rem          a7, a4, t1
                  mulh         a2, a3, s0
                  fclass.s     s9, fa0
                  add          t2, s2, a6
                  fclass.s     s4, ft7
                  div          t2, s4, t3
                  srl          s2, t5, t5
                  add          tp, t3, t6
                  nop
                  mulhu        a5, s5, s0
                  fmax.s       ft2, fa4, fs6
                  or           t5, a7, t1
                  div          t6, a0, a1
                  srli         a6, a1, 18
                  xori         ra, gp, -1201
                  remu         s9, t4, s10
                  feq.s        a4, fs11, fs11
                  srli         t0, sp, 21
                  or           t1, tp, a0
                  sltiu        t4, t0, -1749
                  sra          s9, s2, a1
                  fadd.s       fa7, ft0, ft2, rup
                  sub          s8, s0, t5
                  slli         ra, s5, 21
                  xor          a4, ra, s7
                  srli         s3, a4, 15
                  andi         a6, s2, 448
                  fmax.s       fa5, ft3, ft2
                  andi         s1, s0, 1213
                  fadd.s       fs6, ft11, fs4, rtz
                  sra          s1, s11, s11
                  mulh         s3, a5, t1
                  fsqrt.s      fs2, ft11
                  mul          ra, sp, s6
                  sltu         s2, s2, s11
                  sra          a1, s5, s9
                  sub          t1, ra, s0
                  slt          t1, s10, a3
                  mulhsu       s10, t0, t6
                  fle.s        zero, fs5, fs1
                  fcvt.s.wu    fa1, t4
                  addi         s5, s3, -10
                  sltu         s0, s6, s6
                  fsqrt.s      ft7, fa4
                  srai         a6, gp, 3
                  slt          gp, a3, a6
                  add          s2, a2, s3
                  sltu         s9, t2, s9
                  xori         t1, s10, -972
                  rem          t1, t3, s5
                  fsub.s       fs4, ft7, ft4, rup
                  andi         t3, ra, 583
                  fmin.s       fs0, fs0, ft7
                  sltu         s0, s8, s5
                  sra          s0, a0, t5
                  fmin.s       ft4, fa4, ft7
                  sltu         s3, t3, a2
                  fsgnj.s      ft5, ft1, fa5
                  div          a6, s5, a0
                  feq.s        s0, fa6, fs9
                  ori          a3, tp, -1188
                  fmax.s       fs9, fs11, fa3
                  fle.s        a5, fa0, ft7
                  sltu         s9, s10, sp
                  addi         s4, s0, 802
                  rem          a3, t1, s7
                  fdiv.s       fs1, fs11, ft6, rdn
                  or           a4, a6, a1
                  sltu         s3, ra, sp
                  sra          t1, t3, s3
                  and          tp, t0, s8
                  slli         a7, s9, 6
                  srai         t5, t2, 0
                  slli         zero, s5, 26
                  sra          s3, s4, t2
                  xor          a7, s1, zero
                  srai         s10, s5, 3
                  srl          gp, ra, t0
                  fsgnjx.s     fa2, fs1, fa3
                  fdiv.s       ft3, fs2, fa1, rmm
                  xor          tp, a4, t2
                  sra          s3, t1, s5
                  and          gp, t0, a7
                  fsqrt.s      ft3, fa4, rdn
                  ori          ra, a1, 405
                  rem          ra, a7, t5
                  fsgnjn.s     ft10, fa4, fa4
                  ori          gp, t2, -520
                  fcvt.s.wu    ft0, zero, rne
                  andi         s5, zero, 384
                  fle.s        s11, fs3, fa0
                  srai         a7, t4, 10
                  mulhu        t0, a2, s9
                  slli         tp, s5, 27
                  fsgnjn.s     fs5, ft4, ft2
                  fmul.s       ft1, fa2, fa5, rtz
                  fsgnjn.s     fa1, fa2, ft1
                  fsqrt.s      fs7, fs7, rmm
                  fclass.s     s5, fs0
                  fsqrt.s      fs2, fs0, rup
                  srai         s10, ra, 4
                  fmul.s       fs8, fs5, ft0, rdn
                  fle.s        tp, ft1, fs3
                  fsgnjn.s     fs11, fa2, fa0
                  feq.s        s1, fa4, fs4
                  remu         a7, sp, s8
                  fmul.s       ft5, fs7, ft10
                  add          s3, a7, zero
                  fcvt.s.w     ft2, t2, rup
                  fsub.s       fa6, ft10, ft5, rne
                  sll          t0, t5, t6
                  slli         s4, s7, 1
                  and          ra, a5, a6
                  addi         a4, a4, -1482
                  xori         s3, a3, 293
                  or           a1, t3, s9
                  fcvt.s.w     fs10, s11
                  sub          tp, s8, ra
                  fadd.s       ft8, fa2, fs1, rne
                  fsgnjn.s     ft5, ft8, fs8
                  fcvt.wu.s    a3, ft4
                  fcvt.wu.s    t0, fs1
                  ori          a5, s4, 500
                  fsgnj.s      fs7, fs6, ft6
                  addi         s2, ra, -58
                  xor          zero, gp, t0
                  fadd.s       fs9, fa1, fs7, rup
                  fcvt.w.s     t0, fs8
                  lui          a4, 702491
                  lui          a5, 817353
                  remu         a7, t5, t6
                  slli         gp, s0, 30
                  mul          s4, s9, a7
                  fmv.x.w      s3, fa5
                  mulh         s11, s5, s5
                  sll          zero, s7, s4
                  fmv.w.x      fa6, s3
                  fmin.s       fa6, fs0, fa5
                  xor          a3, zero, tp
                  xori         a1, a7, 1988
                  auipc        s3, 776266
                  remu         t4, a0, s11
                  nop
                  fsgnj.s      fa3, fa6, fs8
                  sll          s11, ra, s5
                  fadd.s       fa2, fs3, ft6
                  feq.s        a1, fs6, ft1
                  fsub.s       fs1, fs9, ft8
                  feq.s        gp, fs0, fs6
                  auipc        s5, 711651
                  fdiv.s       fs11, fs2, ft3, rup
                  rem          t1, s6, t3
                  fsgnjn.s     ft3, fs11, ft3
                  srl          a3, a2, a7
                  fsgnjn.s     fa6, fa1, ft2
                  srl          t0, a0, t2
                  fcvt.s.wu    ft0, a3
                  lui          ra, 66151
                  mulhu        s2, s7, s4
                  fmax.s       fs5, fa4, fs6
                  lui          s11, 159464
                  fcvt.w.s     a5, fa3
                  remu         a5, a2, t2
                  remu         t2, s6, t6
                  sltu         tp, s9, s2
                  fsgnj.s      fa6, ft9, ft5
                  slt          s10, s6, t3
                  sltu         s4, s1, s5
                  fadd.s       ft7, ft10, fs9, rne
                  rem          t4, ra, t3
                  slt          s3, t5, a3
                  fcvt.s.wu    fa0, t3, rup
                  slt          s11, t2, t3
                  fmin.s       ft5, fa0, fs7
                  sub          t1, s11, a7
                  lui          tp, 203631
                  fcvt.s.wu    fs0, tp, rtz
                  fsub.s       fa4, fa5, fs7
                  fcvt.wu.s    t5, fa4
                  fsub.s       ft8, fa3, ft7, rtz
                  fmv.w.x      ft4, t4
                  fdiv.s       ft3, ft8, fs0
                  add          s10, a7, s1
                  fsub.s       fs2, fs8, fa3, rtz
                  fadd.s       fs8, ft3, ft10
                  auipc        gp, 632459
                  fmin.s       fs10, ft2, ft7
                  fle.s        a5, ft7, fs10
                  rem          a2, tp, zero
                  fcvt.s.w     ft7, a1
                  xori         a3, t2, 1128
                  nop
                  or           t0, t0, s10
                  or           s4, s11, t0
                  fsgnjn.s     fs4, fa4, ft3
                  flt.s        s8, fa7, fa4
                  and          s9, s10, a1
                  nop
                  fsgnj.s      ft8, fs3, fs2
                  mul          ra, a6, s3
                  div          t6, s0, a7
                  mulh         s4, a4, a7
                  auipc        a3, 616768
                  fcvt.s.wu    ft10, s3, rtz
                  sltu         s11, t2, a6
                  fmv.w.x      fa3, tp
                  fmv.w.x      ft2, s8
                  fsgnjn.s     fs2, fa6, ft9
                  srli         s3, s9, 13
                  fmin.s       ft4, fa4, fa7
                  mulh         t1, s11, s3
                  div          t5, s8, tp
                  fcvt.w.s     s5, fa5
                  nop
                  fmin.s       ft8, fa7, ft2
                  addi         s9, s11, -309
                  addi         a1, t4, 1011
                  sll          s8, s5, s8
                  rem          a1, a1, t6
                  mulhu        a5, s1, s10
                  sll          t6, t0, ra
                  fcvt.wu.s    a1, ft8
                  slt          s8, s4, s7
                  sltiu        t6, t4, 1941
                  fclass.s     s3, ft1
                  xor          s9, a0, t3
                  fclass.s     t0, fa3
                  fcvt.s.w     fs7, t4
                  fdiv.s       ft11, ft5, fa7, rtz
                  fcvt.wu.s    s1, fa1, rup
                  mul          t0, a6, a3
                  fcvt.s.wu    fs0, s0
                  andi         t3, s3, -850
                  fmv.x.w      ra, fa7
                  fcvt.w.s     s0, fa2, rmm
                  sll          t0, s4, a7
                  mul          a7, t3, a4
                  fcvt.s.w     fs8, t0, rmm
                  fmv.x.w      a7, fa7
                  fcvt.s.wu    ft7, a5
                  fcvt.s.w     fa1, s10, rtz
                  srai         a0, sp, 14
                  fcvt.s.wu    ft7, s1, rmm
                  sra          s1, s3, s10
                  lui          a4, 355869
                  feq.s        a7, fs4, fa4
                  add          s5, t4, s11
                  fadd.s       ft3, fa7, fs8
                  fmax.s       fa2, fa4, fs10
                  fcvt.w.s     s5, fa0, rup
                  auipc        t3, 730056
                  lui          a4, 992210
                  fmv.w.x      ft5, a0
                  mulh         s8, s1, a7
                  addi         t5, a5, -1391
                  sll          t1, s2, a5
                  fmax.s       fs9, fa2, ft1
                  sll          tp, s4, a0
                  fsgnjn.s     ft9, ft5, fa0
                  sltu         a2, zero, sp
                  fcvt.wu.s    a2, ft1
                  slt          t4, t1, tp
                  srl          t6, sp, s0
                  slti         s2, a1, -1933
                  fcvt.s.wu    ft7, s9
                  fmv.w.x      ft5, t0
                  xori         t3, t1, -1481
                  sra          t4, t5, tp
                  remu         zero, ra, s1
                  fsgnjn.s     ft11, fa0, fa1
                  mulhsu       t2, gp, s6
                  fsgnjx.s     ft5, fs9, fs6
                  slti         s1, t2, -357
                  slti         t3, a6, -827
                  fmv.x.w      a1, fa6
                  rem          s8, s5, a1
                  sltiu        t2, s2, 1340
                  addi         t5, a1, 632
                  fmax.s       fs0, fs4, ft10
                  srli         t2, tp, 22
                  srli         t3, t6, 0
                  fmax.s       fs1, fs7, fa1
                  slli         s3, t6, 6
                  slli         t0, a2, 24
                  mul          a0, a3, ra
                  sra          a0, tp, sp
                  xori         s2, t0, -1184
                  slli         ra, s5, 27
                  xori         t4, t5, 983
                  fmv.w.x      fs1, gp
                  slt          s8, a1, s10
                  mulh         t1, s10, t6
                  slti         a7, t1, 38
                  fcvt.s.wu    fs10, t0
                  fadd.s       fa2, fa1, fa0
                  fmax.s       ft4, fs9, ft2
                  fcvt.wu.s    a5, fs4, rtz
                  fsub.s       fs1, fs11, fa2
                  slli         t4, a1, 19
                  mulhu        t1, s7, ra
                  or           t2, s3, s1
                  auipc        s10, 60165
                  mulh         s5, s10, s2
                  fsqrt.s      fs6, fs9
                  nop
                  fmin.s       ft0, ft4, fs11
                  fcvt.s.w     fs10, t6, rdn
                  slt          s2, t5, t0
                  slt          t6, s6, a2
                  div          gp, t6, s6
                  sll          s2, a4, t1
                  mulh         s11, s3, s7
                  fmul.s       fs3, fs11, fs9, rdn
                  fdiv.s       ft1, fs2, ft8
                  addi         t5, s3, 1532
                  fmax.s       fs2, ft2, ft2
                  fmv.w.x      fs8, zero
                  slti         a7, t4, -1620
                  fdiv.s       fs4, fs6, fs1
                  fmul.s       ft10, fs3, fs10
                  mulh         s8, s7, s9
                  slli         s0, t4, 16
                  fsgnjx.s     fs5, fs8, ft1
                  fclass.s     a6, fa5
                  and          s10, s4, a6
                  mulh         a7, s11, t6
                  fsgnjx.s     fa4, fs5, fa2
                  srli         s5, s0, 20
                  srai         a3, a5, 12
                  sll          ra, s4, s5
                  sub          s8, ra, s1
                  fclass.s     s9, fs9
                  mul          t5, ra, t3
                  fclass.s     a1, fa5
                  or           s11, t2, a0
                  mul          a7, t3, a4
                  fdiv.s       fs9, fs1, fa1
                  fmv.x.w      a2, fa0
                  fcvt.s.w     ft4, s4, rtz
                  remu         a0, t2, t5
                  lui          t5, 917050
                  fcvt.w.s     s10, fs5
                  slti         t4, s8, 916
                  fcvt.w.s     t0, fa3, rup
                  fsgnjx.s     ft6, fa1, ft1
                  srl          ra, t1, sp
                  fcvt.w.s     s1, fa6, rmm
                  sub          a2, s0, s10
                  flt.s        s2, ft4, ft1
                  divu         a2, s7, t2
                  or           s4, a6, t2
                  mulhsu       s4, s1, s5
                  div          s1, a1, a2
                  fsub.s       ft7, fs2, fa0, rdn
                  sll          gp, s7, t3
                  ori          a6, s1, 837
                  mulhsu       s11, ra, t3
                  lui          s5, 382225
                  rem          a1, s3, t2
                  fmin.s       fs9, ft9, fa4
                  fmul.s       fs6, fa2, ft1, rne
                  fmul.s       ft5, ft5, fa3
                  fcvt.s.wu    ft5, t4
                  fmul.s       ft8, fs5, ft6
                  divu         t2, s7, s11
                  fmul.s       ft7, fa6, fs6, rdn
                  sub          s2, t1, a0
                  srai         a6, s3, 21
                  fsgnj.s      fs6, fs10, ft2
                  fcvt.s.w     fs7, t6
                  fmin.s       fs4, ft1, fs10
                  slti         s2, t5, -427
                  flt.s        s2, fa6, fa3
                  fsgnjn.s     ft0, fs0, ft8
                  fle.s        s10, fs10, ft0
                  fmv.w.x      fs8, t2
                  fcvt.s.wu    ft9, s6
                  remu         t5, a4, a1
                  addi         t4, a4, 784
                  mulhu        s10, t1, s3
                  sra          t4, t1, s4
                  slli         s11, s2, 10
                  fcvt.s.wu    ft11, s9
                  srai         a4, t6, 23
                  addi         s2, s1, -1414
                  mulh         a6, a1, s5
                  mulh         t0, a2, zero
                  auipc        s5, 990977
                  divu         t1, a2, t0
                  slti         t5, s1, -586
                  fcvt.s.wu    ft10, s3, rup
                  divu         t2, ra, s7
                  fcvt.s.w     ft6, s2
                  fsgnj.s      fa0, ft6, ft10
                  addi         a1, t1, -1246
                  mulhu        s8, s0, s10
                  feq.s        s11, ft6, fa5
                  fsgnj.s      ft0, ft9, ft2
                  fcvt.wu.s    s5, fs6
                  rem          a4, a3, ra
                  fclass.s     zero, fs9
                  nop
                  fclass.s     a6, ft9
                  feq.s        a4, ft2, fs3
                  divu         s9, a4, s6
                  fmul.s       ft11, fa4, fs8, rup
                  flt.s        s9, fs5, ft8
                  mul          a7, s7, gp
                  sll          a4, t3, s6
                  nop
                  srl          s4, s4, a1
                  ori          s0, t4, 323
                  fle.s        t2, fa0, fs7
                  fsgnjx.s     ft2, ft8, ft10
                  fcvt.s.w     fs0, t2, rne
                  xor          s0, s3, t3
                  srai         s10, t2, 26
                  ori          s5, s3, -1986
                  srai         a3, s8, 5
                  fmv.w.x      fs1, t0
                  sltiu        t5, a6, -1082
                  sub          t0, a4, a0
                  srai         a7, a6, 10
                  rem          tp, a2, s4
                  sltu         t4, a3, t5
                  sltu         a3, t6, gp
                  sub          a1, s0, t2
                  divu         zero, s2, s4
                  divu         a1, s1, a3
                  remu         s2, a1, a5
                  mulh         s9, a5, t2
                  mulhu        t1, s7, t0
                  sra          zero, s2, a7
                  or           a3, a0, t0
                  nop
                  fsqrt.s      fa5, fa6
                  fle.s        a7, ft10, fa7
                  mul          t2, s1, t3
                  fsqrt.s      ft1, fs2, rtz
                  sltiu        zero, t0, 1762
                  fsgnj.s      fs4, fs9, fa3
                  flt.s        s11, fs7, fs0
                  fmul.s       fs4, fa4, fa5, rdn
                  fsgnj.s      fa0, fs6, ft7
                  mulhu        a4, a3, a4
                  mulh         t5, a1, gp
                  fcvt.wu.s    ra, ft7
                  fcvt.wu.s    t3, fa5
                  nop
                  fmax.s       fa6, fs9, ft8
                  or           t5, a4, a0
                  andi         a5, a3, 978
                  fmul.s       ft5, ft4, fa1, rup
                  fsgnjn.s     ft6, fs10, fs3
                  andi         s5, s1, -1128
                  srli         a0, t1, 30
                  fmax.s       fs4, fa6, ft8
                  fsub.s       ft7, fs7, fa5, rtz
                  mulh         zero, a3, s0
                  fmv.x.w      s4, fs6
                  srai         a2, s9, 18
                  srai         t6, s5, 31
                  fmul.s       fs4, ft0, ft6, rup
                  flt.s        s4, fa4, fs8
                  fmv.x.w      a7, fa5
                  fmv.w.x      fa7, s0
                  sub          a3, t6, s7
                  mul          a0, t0, t5
                  fclass.s     a3, ft0
                  rem          s5, s0, a1
                  srli         t2, zero, 6
                  div          a6, tp, s2
                  srli         s11, gp, 28
                  nop
                  andi         ra, zero, -658
                  fmin.s       ft3, ft5, fs6
                  fle.s        zero, fa5, fs4
                  fdiv.s       ft7, ft0, fa7
                  auipc        a0, 1028689
                  sltu         a2, s8, t0
                  fsqrt.s      fa0, fa0
                  addi         a7, t0, 450
                  fsgnjn.s     ft11, ft2, fa5
                  mulh         s3, s9, a5
                  fmin.s       fa1, ft7, fa7
                  fle.s        s9, fs10, ft2
                  andi         s4, s7, 278
                  ori          s4, t4, 798
                  mulhu        t3, s1, s10
                  auipc        t6, 6039
                  sltiu        s2, t2, -1678
                  fle.s        s1, fa3, fs4
                  fsgnjn.s     ft1, ft10, fs3
                  fsgnjx.s     fa0, fa1, fs0
                  mulhu        s5, a1, a2
                  and          s1, s4, s7
                  srai         a4, s3, 12
                  fmin.s       ft7, ft0, fs4
                  slli         t1, s10, 24
                  fle.s        s3, ft4, fs5
                  div          zero, s7, s3
                  fclass.s     t4, fa6
                  fcvt.wu.s    a0, fa3
                  fmv.w.x      fa7, s10
                  add          t3, gp, a6
                  slt          s9, tp, s6
                  fmv.w.x      fa1, s2
                  flt.s        t6, fs5, ft10
                  srli         s4, s7, 25
                  and          s2, a7, a4
                  fcvt.w.s     t3, ft4, rne
                  srai         s10, s11, 0
                  fclass.s     t2, fs5
                  lui          a7, 555406
                  srai         zero, t4, 20
                  srai         gp, s8, 2
                  fmul.s       fs10, fs11, fa4, rtz
                  fmv.w.x      fs8, t4
                  andi         a2, tp, -1237
                  nop
                  fsgnjn.s     fa3, fs6, fa1
                  fsgnjn.s     fs3, fs9, ft5
                  fmax.s       ft9, fa4, fs11
                  fadd.s       fa7, fs7, fs8
                  fcvt.w.s     tp, ft8, rmm
                  sll          t2, a4, s10
                  mulhsu       s10, s11, s8
                  fmax.s       fs8, ft4, ft8
                  fmv.w.x      ft4, s0
                  divu         gp, a5, a2
                  srl          ra, t5, a4
                  fsgnjn.s     fa3, fa2, fa4
                  divu         ra, s3, t5
                  fmin.s       fs3, fs1, ft4
                  srl          s8, t5, s10
                  fmv.w.x      fs1, t0
                  fsub.s       fa0, ft5, fs3, rmm
                  addi         s1, s0, -940
                  sltu         gp, a1, s7
                  slti         a5, a3, -1252
                  mulhu        tp, t6, sp
                  slt          s9, s9, s11
                  slti         s10, s4, -70
                  sltu         t4, t1, t4
                  slti         s9, sp, -797
                  mulhsu       t1, s5, a5
                  mulh         s2, t5, tp
                  srli         a4, a0, 2
                  div          a4, sp, a3
                  fmul.s       fa1, fa5, ft6
                  mulh         a1, s0, t5
                  fcvt.wu.s    t5, fs10, rne
                  remu         a3, tp, s9
                  fmin.s       fs10, fa1, fs2
                  div          s5, ra, s6
                  fdiv.s       fs0, ft6, ft7, rmm
                  fmin.s       ft6, fa7, ft2
                  and          a2, s1, gp
                  fsgnjx.s     ft4, fa0, fs0
                  sltiu        t1, sp, 1330
                  fmax.s       fs8, fa4, fs8
                  fsqrt.s      ft0, fs10
                  fmax.s       ft8, fs11, fs6
                  addi         t5, s3, -1108
                  and          t6, s11, ra
                  lui          a0, 828843
                  slt          a1, s5, gp
                  div          a6, s6, t4
                  sltu         tp, tp, zero
                  fdiv.s       fa1, fs6, fs4, rne
                  or           s4, a2, a5
                  fsgnjx.s     fa2, fs0, fa1
                  fle.s        gp, fs2, fs1
                  xor          t3, s10, t2
                  mulh         t1, t1, a6
                  xor          s4, a0, s4
                  fadd.s       fs1, fs5, fa2, rtz
                  fmax.s       fs3, fa2, ft5
                  flt.s        gp, fs10, ft4
                  fclass.s     ra, ft2
                  div          t4, t5, s8
                  fcvt.wu.s    t6, fs2
                  fcvt.s.w     ft10, t4
                  srai         a2, s10, 21
                  fsub.s       ft11, fs3, ft5
                  div          a6, s10, s11
                  fle.s        t3, fa2, fa0
                  mulhu        a7, s6, s9
                  fmax.s       fs7, ft11, fa6
                  fmul.s       fa0, fs0, ft1, rmm
                  mulh         s10, a0, s6
                  xor          s2, s9, s11
                  sltu         s4, s7, s8
                  fsgnjn.s     ft8, fs1, fa1
                  andi         a0, a0, -256
                  fsgnjn.s     fa4, fa0, fs3
                  fmax.s       ft8, ft7, fs10
                  srli         s1, s3, 7
                  srai         t6, t5, 3
                  remu         s5, a3, t6
                  xor          t5, s1, a6
                  addi         t3, s2, -1967
                  fclass.s     t5, ft6
                  xor          s4, a4, sp
                  fle.s        a6, fs4, fs2
                  fcvt.s.w     fs9, t6
                  sltiu        s2, ra, 1391
                  fmv.w.x      fs3, s3
                  srl          a1, a4, s5
                  or           t3, a5, s7
                  fsub.s       fs0, ft4, fs2
                  sll          s1, s10, a3
                  slt          tp, t1, a7
                  fmv.w.x      fs11, a3
                  fdiv.s       fs7, fs3, fs11
                  nop
                  or           s9, t6, s0
                  slti         t5, s5, 1040
                  fcvt.w.s     ra, ft5, rtz
                  slt          s8, t2, s9
                  fsgnjx.s     ft8, fs9, ft8
                  sltiu        a4, t5, 705
                  sll          a2, ra, s8
                  srai         s3, gp, 1
                  mulhu        t5, s4, ra
                  fmv.w.x      ft4, t1
                  fcvt.w.s     s10, fa5, rdn
                  slti         a0, s3, 189
                  fmv.x.w      t0, ft0
                  sra          s1, s7, t1
                  slli         zero, a0, 19
                  add          s9, s7, a7
                  rem          s3, s7, a7
                  fdiv.s       fa4, fs9, fs1
                  fdiv.s       fs2, fs0, fa2
                  fclass.s     tp, fs9
                  sub          a0, t1, a2
                  fmv.w.x      fs3, s7
                  remu         zero, t3, t5
                  srl          tp, s4, a3
                  flt.s        t5, fa2, ft3
                  fmul.s       fa0, ft0, fs11
                  sra          s3, t0, s10
                  srli         t3, s6, 17
                  fsgnj.s      fa4, ft5, ft7
                  sltiu        a5, a5, 504
                  divu         a3, gp, s10
                  sll          a1, s8, s8
                  sub          s2, s8, s4
                  srl          a2, a1, t5
                  fsqrt.s      fs3, fs6, rmm
                  divu         a2, a6, gp
                  fdiv.s       ft6, ft8, fs3
                  remu         a1, t0, a0
                  fcvt.wu.s    s5, ft11, rmm
                  fsgnj.s      fs11, ft6, fs8
                  mul          s5, s3, a2
                  feq.s        s3, fa5, ft6
                  sltu         t3, t2, t1
                  and          s10, a6, a6
                  sub          a5, t5, s8
                  srai         s11, gp, 27
                  remu         s4, gp, s8
                  fcvt.s.wu    fs4, s1, rmm
                  fmv.x.w      s2, fs0
                  mulhu        s3, s1, t1
                  slt          s0, gp, gp
                  fsub.s       fs1, fa2, fs0, rmm
                  fmin.s       fa4, ft4, fs8
                  fcvt.s.w     fa1, a2, rup
                  mulhu        s0, t6, a6
                  sub          a6, a7, t4
                  remu         zero, s9, a2
                  feq.s        a4, fs9, fs6
                  sub          t4, s5, a3
                  flt.s        a0, fa0, ft0
                  slti         a0, sp, 125
                  add          t3, a2, s11
                  ori          t2, t6, -1272
                  fclass.s     a2, ft10
                  mulh         s3, a2, s7
                  fle.s        tp, fs11, fs11
                  srai         a3, a7, 28
                  mulh         s3, a3, s9
                  sll          s3, s2, s8
                  div          s2, gp, a2
                  mulh         tp, s6, t0
                  slli         s9, t4, 13
                  fmax.s       fs9, fs9, ft8
                  fsgnjx.s     ft5, fa5, fs8
                  add          ra, a1, s7
                  mulhu        a7, t6, s6
                  mulhsu       s8, s0, tp
                  xor          zero, sp, s6
                  sll          s2, s2, t4
                  mul          a5, a4, s1
                  fsgnj.s      fs4, fa4, fs9
                  srai         a6, sp, 12
                  fdiv.s       fs2, fa3, fa2, rne
                  fle.s        gp, fa1, fs2
                  slli         a1, t1, 20
                  sltu         s8, s5, s9
                  slt          s0, s10, a2
                  srai         t1, s6, 0
                  fsgnj.s      fa5, fs6, fs7
                  rem          t6, s10, a2
                  fadd.s       fs0, ft2, fs0
                  mulh         t6, s11, t6
                  fdiv.s       ft4, ft7, ft8, rtz
                  fsgnjx.s     fs2, ft11, fa3
                  fmin.s       fs11, ft1, fs6
                  nop
                  sltiu        s10, s6, 661
                  ori          t6, a4, 1464
                  and          s4, s9, s0
                  auipc        s5, 646178
                  xor          a2, s10, s9
                  sll          a1, ra, t4
                  ori          t4, s8, 181
                  sll          s10, a0, t2
                  flt.s        a2, fs6, fs0
                  slli         tp, s7, 29
                  fmv.w.x      ft5, tp
                  rem          s2, s0, sp
                  fcvt.s.w     ft0, s8, rup
                  fclass.s     s8, fs6
                  sll          s8, a2, t2
                  fcvt.wu.s    a7, fa6, rmm
                  or           s1, a3, a6
                  fle.s        t1, fs10, fs11
                  fsgnjn.s     fs2, ft1, ft6
                  fsub.s       fs7, fs2, fa1
                  sra          t1, gp, ra
                  sub          s11, s4, t5
                  fmv.w.x      fa2, a1
                  srli         tp, a2, 4
                  fle.s        s4, ft1, ft1
                  nop
                  fcvt.wu.s    s9, fs11, rtz
                  srl          s11, s7, s2
                  slti         a6, s1, 1837
                  divu         s8, a0, t3
                  fclass.s     s10, ft11
                  sra          s5, s11, gp
                  fmax.s       ft8, fs4, ft0
                  add          t2, t6, s7
                  or           s9, s3, s7
                  mul          t3, t2, t1
                  srai         a1, a3, 31
                  fmin.s       fa0, fa6, ft2
                  fcvt.s.w     fs4, s8
                  fsgnj.s      ft3, ft6, ft10
                  xori         t5, s10, -1668
                  xori         zero, sp, 1272
                  mulh         s0, s11, ra
                  or           t5, s9, s5
                  divu         s1, s0, s5
                  fcvt.wu.s    a7, fs10
                  sub          s11, a6, a2
                  ori          s10, a5, -1801
                  lui          t4, 632873
                  srl          a6, zero, s9
                  ori          a7, a7, 1616
                  flt.s        a2, ft3, fa2
                  add          t6, s0, a4
                  fsqrt.s      ft9, fs0
                  addi         a6, gp, -1537
                  fsgnjn.s     fa0, ft2, fa1
                  mulh         t4, sp, s3
                  and          t1, s10, a4
                  fmul.s       fs0, ft8, ft10, rdn
                  srl          gp, ra, a6
                  slti         s9, a7, 872
                  fdiv.s       fs2, fs6, ft1
                  srli         gp, s7, 19
                  fcvt.s.w     ft6, a4
                  xori         t0, s4, -1442
                  sub          s3, a0, t6
                  mulh         gp, a4, a2
                  srl          a1, s8, a3
                  addi         s9, s4, 695
                  fsgnjn.s     ft4, fs4, fa6
                  fcvt.s.wu    ft11, t3, rtz
                  flt.s        a3, ft8, ft7
                  fsub.s       fs7, fs1, ft3
                  rem          s0, t5, s9
                  slti         a3, a3, -468
                  addi         s3, t1, -988
                  srai         a7, s5, 1
                  fsub.s       ft3, fa7, ft10
                  xor          a3, s8, tp
                  fclass.s     s5, fa7
                  xori         a0, s0, 735
                  mulhsu       t6, t4, t5
                  xor          s9, s9, s11
                  fcvt.s.wu    fs6, a6
                  fcvt.w.s     a2, ft4
                  auipc        a4, 921580
                  divu         a2, s2, s3
                  div          s4, t6, a7
                  fsub.s       ft0, fa3, fa1
                  xori         a7, t0, 1009
                  fcvt.s.w     fs6, s0, rne
                  fadd.s       ft3, fa5, fa3
                  fle.s        zero, ft2, ft2
                  add          a2, a5, a3
                  xor          ra, s0, s7
                  fdiv.s       fa6, ft8, ft3, rup
                  srai         s4, t0, 17
                  xori         a6, s8, -471
                  auipc        s0, 1038024
                  slli         a5, t1, 6
                  auipc        t6, 156382
                  fsqrt.s      ft0, fa2
                  fmv.x.w      t2, fa1
                  sub          t4, s7, a1
                  mulhu        s0, a1, s2
                  nop
                  fle.s        a0, ft4, ft10
                  and          t1, a5, a7
                  fle.s        s4, ft5, ft4
                  slt          a2, s5, s9
                  xor          t5, a6, a7
                  mulh         t1, t6, t5
                  div          s11, s9, tp
                  sub          t2, a0, gp
                  andi         s8, s4, -1245
                  fmul.s       ft10, fa6, fs4, rmm
                  fsqrt.s      fs8, fs1
                  fmul.s       ft3, fs8, fs0, rmm
                  addi         s0, t0, 2006
                  srai         t4, t2, 31
                  feq.s        s8, fa5, fa4
                  sra          s8, a3, s7
                  add          tp, s4, t5
                  rem          t5, a0, zero
                  rem          s10, t0, s4
                  flt.s        s3, fa6, fs0
                  fsgnjx.s     fs0, ft0, fa4
                  fcvt.s.wu    ft5, a4
                  mulhsu       gp, gp, a1
                  auipc        a0, 356561
                  sub          s11, a1, s4
                  sll          s5, s9, t6
                  fmul.s       fs6, ft2, fa3
                  fmin.s       fs8, fs4, ft7
                  fmul.s       fs6, fs9, ft7, rdn
                  xor          s10, s3, a4
                  fle.s        a7, fa7, ft3
                  rem          a7, t0, t1
                  divu         a2, s3, sp
                  mul          a0, t1, a3
                  divu         a2, s1, s3
                  fcvt.s.w     fa6, a5
                  sra          a4, zero, a3
                  mulhu        a7, a2, a3
                  slli         s2, ra, 5
                  slt          s5, s11, ra
                  remu         a2, t2, zero
                  fdiv.s       ft9, ft9, fa1, rne
                  nop
                  rem          s1, t2, t6
                  sra          a5, t5, tp
                  mulh         a5, s2, a2
                  rem          a1, t1, a0
                  or           s11, t5, s10
                  fsgnj.s      fa4, ft2, fs10
                  fsgnj.s      fa2, fs0, fs4
                  srai         a2, s11, 19
                  fmv.x.w      t5, fa0
                  fsgnj.s      ft10, fs8, fs11
                  sltiu        a7, t1, -1288
                  fmin.s       ft7, fa7, ft7
                  sub          a3, s0, a4
                  srl          zero, t0, ra
                  fclass.s     gp, ft8
                  or           t2, a5, a4
                  sll          t1, s9, s1
                  sll          a7, a4, a3
                  fsgnj.s      fs8, fa1, fs2
                  slti         s9, ra, 250
                  srli         a5, gp, 17
                  fsgnjn.s     ft11, ft4, ft10
                  xor          tp, gp, a1
                  xori         tp, s5, 547
                  addi         s10, s8, -1561
                  fsub.s       fs10, ft2, fa4
                  fdiv.s       ft5, fs10, ft2
                  fsqrt.s      ft6, ft9, rmm
                  fclass.s     a7, fa5
                  divu         s9, t1, s11
                  sll          tp, sp, a0
                  divu         gp, ra, s3
                  fsgnjn.s     fa6, fa7, ft3
                  mulh         a0, t1, t0
                  nop
                  add          gp, a6, s10
                  fcvt.wu.s    gp, ft3, rmm
                  rem          t5, s5, s0
                  mulhu        a3, gp, t3
                  sltiu        s11, a3, 379
                  mul          t2, s2, s1
                  ori          tp, s4, 1432
                  fcvt.wu.s    s10, fs1
                  fmv.x.w      t0, ft3
                  sll          s0, t2, a3
                  fsgnjx.s     fa3, ft9, fs5
                  rem          s2, s5, t4
                  nop
                  flt.s        s11, ft11, ft6
                  mulh         s2, t3, s7
                  sltiu        a5, s9, -1247
                  slli         t3, a4, 19
                  mulh         t6, s5, a7
                  fmul.s       fs3, ft6, fs9
                  remu         t2, a2, a2
                  fsub.s       ft7, ft6, fs4, rdn
                  slt          s8, t3, ra
                  addi         tp, a7, 239
                  fadd.s       ft6, fs4, ft5
                  fsqrt.s      ft0, fa2, rne
                  fdiv.s       fs0, fs8, fs7, rmm
                  fsgnjn.s     fs6, fs11, fs3
                  ori          s11, s0, 1772
                  andi         s9, s2, -1363
                  addi         s0, t4, -754
                  mulhsu       s2, s10, s11
                  fcvt.wu.s    s10, ft8
                  sltiu        s3, t1, -149
                  fcvt.s.w     ft7, s4, rdn
                  fdiv.s       ft11, fs7, fs0, rdn
                  fsub.s       fa1, ft4, fa0
                  feq.s        t6, ft11, ft9
                  fadd.s       ft1, fa7, ft6
                  fmul.s       ft1, ft7, ft1
                  mul          a1, s7, s5
                  fle.s        a0, fs8, fa0
                  flt.s        ra, fa4, ft7
                  fsqrt.s      fa3, fs7
                  or           a3, zero, t6
                  sltiu        t2, t5, -45
                  fdiv.s       ft0, ft10, ft3, rdn
                  sltu         gp, a0, t0
                  fadd.s       ft4, fa6, ft11
                  fmin.s       fa7, fs2, fa3
                  fmv.x.w      s11, ft0
                  fcvt.wu.s    ra, fs2, rmm
                  fmul.s       fs6, fs0, ft8
                  fclass.s     t2, fs2
                  fcvt.wu.s    ra, ft2, rdn
                  xori         a6, s1, -292
                  mul          s4, a0, t6
                  mul          s2, a6, t2
                  or           t3, t4, a2
                  fmv.w.x      fa1, a2
                  add          t4, t2, s4
                  fadd.s       fs10, ft1, fa1
                  mulhu        s2, a3, t2
                  fmv.w.x      fa3, s1
                  or           s11, s6, s5
                  slt          a7, s8, s2
                  fmul.s       ft10, fa7, fs1
                  sub          gp, s0, a0
                  fdiv.s       fs3, ft0, ft2, rne
                  and          t5, a0, zero
                  fsgnjx.s     ft0, ft8, ft9
                  xor          t4, t4, tp
                  div          t4, s8, s10
                  rem          tp, a4, t0
                  auipc        s1, 240998
                  rem          a7, a1, a6
                  andi         t6, t1, 1342
                  fadd.s       fs9, fs1, fs8
                  mul          ra, t6, a4
                  fcvt.s.wu    fa4, s11
                  mulh         t6, a7, s4
                  fcvt.wu.s    s9, ft5, rdn
                  rem          ra, t3, t6
                  and          s1, t2, t6
                  addi         tp, t1, -411
                  fmul.s       fa5, fs4, fs10
                  ori          a2, a4, 35
                  fadd.s       fs3, ft8, ft6, rdn
                  sll          a7, zero, ra
                  xori         s4, tp, -673
                  divu         a6, zero, a4
                  slti         ra, t1, 936
                  fcvt.wu.s    a5, fs5
                  lui          s0, 470543
                  addi         t1, s10, -141
                  fdiv.s       ft11, fa4, fs2
                  nop
                  fmin.s       fs9, fs1, ft2
                  andi         a5, a4, -577
                  addi         ra, ra, 1689
                  ori          s1, s6, -1490
                  mul          t1, s4, a1
                  xor          a6, s1, a1
                  fdiv.s       fs1, fs9, ft4, rmm
                  div          ra, t3, s10
                  divu         s1, gp, t5
                  addi         s0, s2, 582
                  fcvt.s.wu    ft10, gp
                  div          a5, s8, t3
                  slt          s11, s6, s11
                  fcvt.s.w     fs2, s10, rdn
                  rem          s2, s9, a6
                  mulhu        t0, s10, a1
                  sll          s5, t1, s1
                  auipc        s8, 440140
                  lui          t4, 26601
                  sltu         zero, s0, zero
                  feq.s        s10, fs11, fa6
                  slt          s5, t5, a6
                  flt.s        t2, ft6, ft9
                  fmv.x.w      s8, fs7
                  sll          t5, s9, a1
                  fsub.s       fs0, fs4, ft1, rdn
                  flt.s        tp, ft7, fs2
                  srli         t5, s0, 19
                  andi         s1, a2, 820
                  sltu         s5, s9, a4
                  slt          s11, a7, s6
                  ori          t1, a7, -315
                  slt          a5, s10, ra
                  and          s8, a0, s10
                  lui          s4, 739012
                  sltu         t3, a2, s3
                  mul          s0, s8, s11
                  fmin.s       ft10, ft3, fs5
                  sub          s3, s7, s0
                  fclass.s     s11, fs3
                  fcvt.wu.s    t1, ft3
                  mulhu        zero, gp, a4
                  xor          a6, t1, s3
                  fmax.s       fa3, fs10, fs3
                  srl          a0, t4, a0
                  flt.s        s10, fa0, ft0
                  sra          s5, a5, s10
                  fle.s        s11, fs11, fs0
                  fcvt.s.w     ft1, s7
                  srl          s1, s8, s4
                  fle.s        a6, fs3, fs8
                  flt.s        s5, ft3, fa3
                  auipc        s11, 259517
                  fsgnj.s      fs0, fs0, ft1
                  mulhu        s2, s3, s9
                  fmv.x.w      ra, fa7
                  xori         s4, s7, 555
                  fsgnjn.s     fs7, ft2, ft7
                  fmul.s       fa3, fa2, fs5, rtz
                  add          s9, ra, a2
                  fsgnjx.s     fs3, ft10, ft2
                  nop
                  fcvt.s.w     ft1, tp, rne
                  sltu         t6, t0, s6
                  fsqrt.s      ft4, fs8, rmm
                  feq.s        a7, fs8, fs0
                  fmul.s       fs7, fs4, ft8, rmm
                  auipc        a7, 807275
                  fsgnj.s      fs6, ft5, fa4
                  fclass.s     s5, ft2
                  fsgnj.s      fa3, ft7, ft1
                  sra          s4, t1, s7
                  fmin.s       ft9, ft4, fa0
                  fle.s        a6, fa2, fa3
                  fsqrt.s      ft5, fa2
                  mulhu        gp, t6, s5
                  fmax.s       fs8, fs3, fs0
                  nop
                  addi         s5, s5, 1233
                  sra          s1, s8, zero
                  fsub.s       fa3, fs4, ft11, rup
                  sltiu        s4, s7, -355
                  fmv.x.w      ra, fa0
                  divu         s4, s0, s8
                  fsub.s       fa4, ft2, fa2
                  divu         a5, s3, t3
                  fle.s        s5, ft10, ft1
                  feq.s        a5, fs0, ft0
                  fmv.w.x      fs2, a1
                  fcvt.wu.s    a5, ft5, rdn
                  slt          a3, a4, a5
                  srli         t0, a6, 7
                  mul          s2, t4, s8
                  addi         ra, s9, 1981
                  sltu         a5, ra, ra
                  andi         ra, s2, 1316
                  rem          t5, s6, s5
                  xori         s3, s3, -296
                  fsgnjx.s     ft10, fs6, fs3
                  fdiv.s       fa1, fs3, fa1
                  sltu         zero, zero, s10
                  fmv.x.w      t6, ft11
                  andi         s8, s6, 1675
                  mulhsu       a2, t4, s6
                  feq.s        a5, ft5, ft11
                  andi         a4, s1, -606
                  sra          s1, s7, zero
                  or           s4, s7, t3
                  auipc        s10, 871719
                  fsqrt.s      ft6, fa0
                  fclass.s     t6, fs3
                  fmin.s       fs11, ft3, fa1
                  mul          s9, a1, t1
                  fsgnj.s      fa0, ft3, fs3
                  auipc        a5, 275294
                  mulh         t5, a5, t1
                  mul          t0, s9, t4
                  fsgnj.s      fs4, fa1, fs0
                  add          t2, s1, s0
                  fcvt.w.s     ra, fs5
                  sub          a7, a2, gp
                  slt          t4, t3, t5
                  slt          tp, a3, a7
                  fsqrt.s      fs5, ft9
                  addi         t5, zero, -628
                  remu         s11, tp, s8
                  divu         a0, sp, t3
                  fmv.x.w      s2, fs9
                  mulhsu       tp, s1, a7
                  ori          s9, a0, -415
                  mulhsu       s8, a5, a3
                  sltu         a6, a5, s2
                  ori          a2, s5, -1804
                  sub          a3, t6, s11
                  fmul.s       fs4, fs10, fs1
                  fcvt.s.w     fs1, s11, rup
                  fsgnjn.s     fa6, fs1, fa1
                  sra          a0, t5, s4
                  rem          s5, s8, s10
                  fclass.s     a0, ft7
                  flt.s        s0, fs8, ft7
                  fadd.s       ft2, ft10, ft8
                  fmin.s       ft2, fa2, fs11
                  mulhsu       t4, t5, s8
                  xori         gp, t3, 1039
                  divu         t4, s11, s8
                  divu         t6, a6, sp
                  fmin.s       fs3, fs4, ft0
                  fcvt.s.w     fa4, s11, rup
                  addi         s2, s3, 1795
                  andi         s0, s5, 1506
                  slti         a0, s6, 477
                  feq.s        tp, fs3, fs1
                  flt.s        t4, fs2, ft8
                  or           s8, s1, t6
                  mul          a3, s0, gp
                  fcvt.w.s     gp, fs5, rne
                  fcvt.w.s     zero, ft6, rup
                  sra          s1, a5, s3
                  divu         a5, t4, s7
                  nop
                  slti         t0, sp, -195
                  ori          s8, s0, -1142
                  fsgnj.s      fa7, ft0, fa2
                  fcvt.s.wu    ft3, s3
                  mulhu        t3, t1, a6
                  fmin.s       fs0, fa7, fa0
                  ori          s8, s9, -401
                  srai         a1, ra, 21
                  sltu         a5, a3, t6
                  fmv.w.x      fs3, s7
                  sltiu        tp, s2, 1095
                  fmin.s       ft7, fa6, ft9
                  fmv.x.w      a4, fs7
                  div          zero, gp, t3
                  divu         s3, s4, a2
                  sltu         t0, s10, a2
                  addi         gp, a1, 593
                  slti         s3, s8, -1627
                  sltiu        s1, a2, -598
                  srli         s1, a7, 24
                  and          a7, t5, s8
                  sltiu        t4, a1, -1778
                  srli         s11, a6, 16
                  fcvt.w.s     t4, ft7
                  addi         s2, s8, -1688
                  and          a5, gp, s5
                  mul          t1, t1, s0
                  mulhu        s2, zero, a3
                  fmul.s       ft5, fs9, fa6
                  xor          t6, s0, a3
                  xor          s2, a3, s8
                  fdiv.s       ft10, fs6, ft8, rtz
                  fsgnj.s      ft7, ft3, fs10
                  div          s9, s3, s7
                  slt          ra, s9, a0
                  addi         a3, s5, -880
                  sltiu        s4, t6, -2030
                  srl          t6, t4, ra
                  fcvt.w.s     ra, ft1
                  remu         t1, t3, a5
                  sub          t4, s2, a3
                  slti         ra, a5, -347
                  xor          s0, tp, s7
                  fsgnjn.s     fs10, ft8, fs2
                  fmin.s       fs11, fa0, fa5
                  ori          t1, a2, -1178
                  nop
                  fsub.s       fs4, ft9, fa7, rup
                  fsgnjn.s     ft8, fa6, fs10
                  fle.s        t6, fa0, ft11
                  xor          s2, t4, t5
                  srai         a7, s7, 7
                  rem          a5, t0, s7
                  fmv.x.w      s10, fs0
                  sltu         t1, s10, a6
                  fsub.s       fa0, ft8, ft6, rne
                  mulhu        zero, s0, s1
                  slt          a3, t4, s4
                  auipc        t4, 117768
                  fmax.s       fa2, fa4, fs10
                  andi         t3, t5, 1307
                  fcvt.w.s     a5, ft1
                  sltiu        s1, t5, 1681
                  slt          s8, ra, t0
                  mulhsu       s9, s10, a3
                  fle.s        zero, fs7, fs11
                  srli         a2, t4, 5
                  mulhu        s9, a2, s7
                  and          s8, a6, s6
                  mulhu        s11, t4, t0
                  lui          s11, 955692
                  slli         tp, s4, 8
                  nop
                  sltu         zero, s0, a1
                  add          a1, t6, a7
                  fmax.s       fs0, fs4, ft9
                  remu         s9, t2, t1
                  fmul.s       ft8, fa6, ft5
                  div          s3, t0, t2
                  fsgnj.s      ft1, fa6, fs11
                  add          s11, s9, s1
                  fsgnjn.s     fa5, fs2, fa5
                  and          t4, t2, s3
                  fsqrt.s      fs11, ft5, rtz
                  sltu         s4, t4, t3
                  fmin.s       fa1, fs4, fs6
                  fmv.x.w      t0, fa6
                  andi         s4, a2, 1845
                  auipc        s3, 2229
                  sltu         s11, t4, t0
                  xori         a1, a7, 1279
                  srli         t0, s1, 13
                  sra          s0, s0, a2
                  mulhu        a5, t1, a5
                  slt          t0, gp, a0
                  xori         gp, s7, -1501
                  fsub.s       ft7, fs4, fa1, rtz
                  nop
                  fsub.s       fa1, fa7, fa7, rup
                  addi         s4, t4, -336
                  fdiv.s       fs10, fa1, ft3, rtz
                  fcvt.w.s     gp, ft2
                  xor          s4, a4, s10
                  fle.s        a1, fs9, ft7
                  sltu         tp, s2, sp
                  mul          s1, s2, s8
                  divu         t2, tp, sp
                  fcvt.w.s     s8, fs4
                  slti         s4, a3, -614
                  mulhu        s11, s2, sp
                  divu         s1, t0, a0
                  srai         a5, s2, 9
                  rem          s11, a4, s3
                  mulhu        s5, t5, s1
                  remu         t3, s3, a7
                  slli         t0, tp, 14
                  div          a1, s2, s11
                  and          s9, s3, s9
                  fcvt.w.s     s9, fa6, rmm
                  fsgnjn.s     fs10, fs9, ft4
                  fsgnjx.s     fa3, fs6, ft5
                  fsgnj.s      ft6, fa7, fa4
                  nop
                  addi         a4, a1, -1224
                  sra          a1, a4, s2
                  div          t3, gp, ra
                  fmul.s       fa5, fa5, fs5, rdn
                  sll          t4, s2, t1
                  andi         s2, s4, 946
                  div          t0, a0, t0
                  or           s5, gp, ra
                  ori          t6, zero, -1542
                  slt          a1, t5, s1
                  mulh         t5, a2, s10
                  srl          s4, s2, s4
                  nop
                  fsqrt.s      fs6, fs8
                  flt.s        s0, fs3, fs1
                  srai         s1, s2, 25
                  xori         a5, s0, 1780
                  sltu         s5, s1, s0
                  fclass.s     s9, fa6
                  and          gp, s6, a3
                  sltu         s11, s2, a6
                  sltiu        a6, s3, -1831
                  srli         s1, s11, 9
                  sll          t1, a5, s0
                  mulhu        t2, s1, s6
                  rem          t0, tp, s6
                  andi         tp, a4, -1341
                  fsqrt.s      fa7, fa1, rdn
                  fdiv.s       fa5, fa1, fs3, rmm
                  sra          zero, t2, t1
                  fadd.s       ft1, fa2, fs5, rne
                  fcvt.s.w     fa0, a1, rne
                  fcvt.s.w     fa6, gp, rmm
                  lui          t5, 851109
                  sra          t4, a4, s5
                  fmin.s       fs3, fs4, ft10
                  fadd.s       ft9, fs0, fa7
                  sub          a1, zero, a4
                  lui          t6, 637139
                  mulhsu       t5, ra, s2
                  fmax.s       fa6, fa3, fs1
                  add          zero, s7, t6
                  fsub.s       fa6, fs1, fs5
                  srai         t4, s4, 15
                  fclass.s     s2, fa2
                  fmv.w.x      ft11, gp
                  fmax.s       ft7, fs1, ft8
                  mulhsu       s5, zero, gp
                  fcvt.s.w     ft2, a1, rmm
                  sll          a7, sp, s6
                  fclass.s     gp, fa6
                  fcvt.s.w     ft2, t3, rmm
                  srai         zero, a6, 27
                  fmul.s       fs1, fa6, ft5
                  fcvt.wu.s    t4, fs10
                  mulh         t1, a6, s1
                  div          a2, s7, gp
                  mulhu        a6, tp, t3
                  fmul.s       fs5, fs3, fa3
                  lui          s0, 556253
                  and          a3, s5, s0
                  fdiv.s       ft10, fs11, ft5, rup
                  fdiv.s       fa7, ft9, ft10, rne
                  mulh         gp, t2, a5
                  sub          a2, t4, s7
                  fmv.x.w      s5, fs7
                  or           t6, a0, s10
                  ori          gp, t2, -1515
                  mulhsu       s11, s3, s11
                  remu         t6, a2, t5
                  xor          s4, s6, s3
                  fsqrt.s      fs8, fs10, rtz
                  sub          gp, s8, t4
                  and          a0, zero, s0
                  sltu         t1, t1, s0
                  add          s0, s6, s3
                  lui          t3, 395098
                  fcvt.s.wu    fa5, s9, rne
                  andi         s0, s4, -1647
                  fsgnj.s      fs4, fs2, ft5
                  fsgnjn.s     fs2, ft1, ft3
                  sub          ra, ra, sp
                  fcvt.wu.s    a0, fs11
                  slli         s0, t1, 31
                  xori         s4, a5, 137
                  sra          s4, a3, s0
                  sub          a1, s5, t2
                  fcvt.w.s     s11, ft0, rdn
                  sra          a6, t4, s4
                  fadd.s       ft2, fa7, fa4, rtz
                  fmax.s       fa7, ft4, fs6
                  fmul.s       fs6, ft2, fs7, rdn
                  fmax.s       fs7, fs2, fa2
                  xori         a6, s4, -301
                  add          s2, s7, t5
                  feq.s        s4, fs7, fs10
                  or           t1, s8, s9
                  fadd.s       ft4, fa0, fa1
                  flt.s        s1, ft7, fs5
                  fsub.s       ft5, ft6, ft0, rup
                  fsgnjn.s     fs3, fs3, fs1
                  fcvt.wu.s    a0, fs4, rmm
                  sll          t6, a7, s6
                  feq.s        ra, fa5, fs6
                  fle.s        s10, fs7, fs5
                  sll          a2, a4, s9
                  sra          a2, s7, a3
                  rem          s3, t6, s5
                  fcvt.s.w     fs6, t0, rup
                  sub          t2, t2, zero
                  fclass.s     a4, ft0
                  xor          s11, s10, s1
                  fdiv.s       fs0, fa0, ft7, rup
                  or           t4, t6, sp
                  fmv.w.x      ft0, s11
                  fsub.s       fa6, fs11, fs4
                  auipc        a4, 762777
                  fcvt.s.w     ft3, s1
                  divu         t0, s10, s2
                  sll          t2, a1, a1
                  fadd.s       ft3, fs8, ft3, rtz
                  fdiv.s       ft11, fs11, ft6
                  and          s1, s1, zero
                  sub          s5, a4, sp
                  divu         a2, a7, a5
                  slt          t5, t5, s10
                  rem          s0, a4, s8
                  ori          s2, t6, 969
                  auipc        t0, 86461
                  fcvt.w.s     t6, fs11
                  or           t0, a6, t4
                  fmv.x.w      a6, fa4
                  andi         a2, s4, 901
                  divu         a3, a0, s2
                  add          t0, s0, s1
                  fadd.s       ft1, ft11, fs2, rdn
                  andi         a4, ra, -731
                  and          gp, s2, t2
                  slti         s3, s5, 676
                  divu         a0, s3, a7
                  srl          t5, s8, gp
                  srl          t0, a7, t2
                  fle.s        a0, ft4, fs6
                  mulh         t3, s4, a6
                  fmv.w.x      ft7, t0
                  ori          tp, a4, 300
                  srli         s8, a0, 31
                  fdiv.s       ft5, fs2, fs1, rdn
                  sra          s1, tp, t2
                  fsgnjx.s     fa5, fs2, fa2
                  fmv.x.w      s10, ft1
                  add          s9, a4, s0
                  fle.s        t0, fa0, fa5
                  and          s8, t5, gp
                  fcvt.w.s     s10, fs4
                  add          ra, s0, s0
                  mulh         gp, t1, t3
                  or           s2, gp, s4
                  srai         tp, s2, 20
                  fcvt.wu.s    a7, fa5, rne
                  fmv.x.w      ra, ft1
                  addi         a1, t5, -1925
                  ori          a0, tp, 111
                  fsgnjx.s     ft4, ft8, ft4
                  divu         t0, a5, a0
                  fmv.w.x      ft5, s8
                  fsub.s       ft11, fa4, fa4, rtz
                  fmul.s       fa2, fs5, fs1, rne
                  srai         t4, a2, 28
                  fdiv.s       fs8, fs3, ft10, rne
                  addi         s8, a4, 1238
                  fmin.s       fs2, fs0, ft3
                  sra          zero, ra, a6
                  fcvt.s.wu    fs1, t5
                  xori         a5, t4, -698
                  fle.s        t1, fs7, fa5
                  sltu         tp, s10, t3
                  andi         t1, a1, -583
                  andi         s10, a0, 657
                  fmv.w.x      fa7, t1
                  fmul.s       ft6, fs10, ft1, rmm
                  flt.s        a1, ft8, fs2
                  fsgnj.s      ft10, fs4, ft4
                  andi         a2, sp, 747
                  fadd.s       fs2, ft8, ft0, rtz
                  or           t0, t5, t3
                  rem          gp, ra, t3
                  srai         s1, s8, 26
                  sll          a7, t1, s7
                  fsgnjn.s     fs3, fa1, fs2
                  divu         ra, t6, gp
                  xori         a6, t2, 540
                  fmin.s       ft10, fs11, fs9
                  xori         t4, ra, 747
                  fmin.s       fs9, fs2, fa2
                  flt.s        gp, fa3, fs10
                  xor          s3, a7, s3
                  andi         t3, sp, -1052
                  fmv.x.w      t5, fs3
                  slti         s8, tp, -54
                  srl          a0, t6, t0
                  rem          t5, s4, t3
                  srl          a6, ra, t6
                  fsgnj.s      ft0, fa7, ft4
                  mulh         s5, s4, s7
                  fcvt.s.wu    fa6, s4
                  fclass.s     gp, fa0
                  slt          t4, a2, a5
                  fmv.w.x      ft4, s5
                  sra          a6, zero, s6
                  fsgnjn.s     fs0, ft11, fs11
                  mul          s11, a5, a1
                  fmin.s       fs6, fa5, fa1
                  remu         t4, s3, a5
                  fmin.s       ft1, fs0, fa6
                  fmax.s       fa1, ft9, fa6
                  fdiv.s       fs9, ft6, fa3, rtz
                  fsgnjx.s     fs9, fs6, ft7
                  div          s4, s0, gp
                  addi         a0, a6, 1689
                  mulhu        t6, t4, s5
                  auipc        gp, 1000763
                  ori          a2, a2, -246
                  fadd.s       fa4, fa1, fa4, rup
                  xor          t4, a5, t2
                  mulh         t2, s5, sp
                  fsgnj.s      fs4, fs0, fs4
                  andi         tp, t0, -1941
                  fmax.s       fs3, ft8, fs11
                  fsgnj.s      ft7, fa3, fs1
                  fcvt.w.s     a0, ft4
                  fcvt.s.w     fs2, s4, rtz
                  fsub.s       fs2, fa6, ft7
                  fsgnjx.s     ft6, ft2, fs3
                  fsqrt.s      fa7, fs10, rmm
                  mul          t4, t2, a6
                  slt          gp, s4, s10
                  sltu         t0, s0, s7
                  slli         t1, s2, 11
                  srli         a7, s5, 27
                  sub          a6, zero, s2
                  sltiu        t2, s5, 1638
                  sltu         s5, s3, t3
                  fmin.s       fs11, fa1, ft10
                  addi         a7, s11, 1991
                  fcvt.s.wu    ft2, sp
                  srl          t0, a5, a3
                  sltiu        t6, s10, -1803
                  fcvt.s.w     ft8, s3, rtz
                  fcvt.w.s     zero, fs7, rup
                  lui          s3, 264095
                  feq.s        a3, ft3, fa5
                  sra          t3, t0, t6
                  fcvt.w.s     a6, fa1
                  slt          a0, s1, s9
                  feq.s        s3, fa0, fs2
                  sll          s3, s10, t5
                  fsgnj.s      fa0, ft7, ft11
                  slt          a7, t4, ra
                  auipc        s5, 352912
                  ori          s0, t5, -780
                  fdiv.s       ft5, fs6, ft5, rne
                  sra          a7, s10, a0
                  sltiu        a4, s10, -78
                  flt.s        s10, ft7, fs0
                  xor          s3, t0, zero
                  fadd.s       ft10, fs5, ft9
                  or           a1, s5, a1
                  slti         s3, a5, 1872
                  fsqrt.s      fs7, ft2, rtz
                  srl          ra, s3, a0
                  sltu         t6, s7, s9
                  sub          t2, s7, s2
                  fcvt.s.w     ft3, tp, rmm
                  sub          s9, t1, t4
                  fsgnj.s      ft0, fs3, ft4
                  mul          s9, t3, a4
                  sub          a2, t0, sp
                  sll          a6, s5, s1
                  xori         s3, t0, 115
                  fsub.s       fs4, fs9, fa3
                  nop
                  nop
                  fdiv.s       ft2, ft10, fa4
                  fadd.s       ft2, fs8, fs10
                  lui          gp, 599566
                  andi         gp, s9, -1369
                  ori          a4, s2, -56
                  fmv.w.x      fs3, t5
                  fcvt.wu.s    a5, fs9
                  andi         s8, a7, 530
                  sltu         s8, a1, ra
                  fcvt.s.w     fs9, s8
                  xor          a0, ra, a5
                  fmin.s       fs9, fa3, ft1
                  nop
                  fadd.s       fs5, fs5, fs3
                  auipc        s5, 598426
                  slli         t4, a4, 22
                  fle.s        t0, fa2, fs10
                  div          s5, sp, t2
                  srai         s4, a0, 11
                  fcvt.wu.s    s10, ft5
                  andi         s3, s9, -136
                  and          a3, a4, t2
                  remu         tp, ra, a0
                  slti         s4, t0, -47
                  fmv.w.x      ft10, a6
                  slti         t6, s11, -1506
                  ori          a7, s11, -739
                  flt.s        t2, ft8, fa6
                  nop
                  fcvt.w.s     t3, fs3
                  lui          a3, 657973
                  or           ra, t6, a3
                  mulhsu       zero, s5, s5
                  addi         zero, a3, -1474
                  fclass.s     ra, ft4
                  ori          a3, t0, 1948
                  mulhsu       tp, t3, a5
                  fcvt.wu.s    a4, ft11, rne
                  div          s9, s9, gp
                  srli         t6, tp, 3
                  fsub.s       fa5, fs6, ft11, rmm
                  fcvt.w.s     s5, ft2
                  sub          gp, t1, s1
                  div          a6, s8, zero
                  xor          a7, t3, a3
                  fcvt.w.s     gp, fs6
                  fdiv.s       fa1, ft4, fs1
                  srl          s3, t4, a3
                  fadd.s       ft11, ft4, fa7, rne
                  and          tp, s4, s8
                  sra          a6, s10, a1
                  fmv.w.x      fs4, a0
                  mul          gp, sp, a3
                  mul          s9, t2, s0
                  fmv.w.x      ft8, s8
                  mulh         t5, t2, t6
                  remu         s2, a3, a0
                  mul          tp, sp, t4
                  fle.s        ra, fs3, ft2
                  sltiu        s0, sp, -1164
                  fle.s        gp, fa1, ft0
                  add          t6, sp, t4
                  fsqrt.s      fa3, ft0, rtz
                  feq.s        t5, fa2, fs0
                  mulh         s4, s11, t1
                  sub          a1, s4, t0
                  lui          a4, 604847
                  xori         a4, a7, -251
                  fadd.s       fs1, ft3, fs7, rup
                  fle.s        s9, fa4, ft5
                  fsgnjn.s     ft7, fs0, ft5
                  fcvt.s.wu    fa3, tp, rne
                  auipc        s2, 1000894
                  or           t1, t4, a4
                  fsgnjn.s     fs4, fs7, ft10
                  rem          ra, s1, gp
                  slti         s4, a7, 909
                  fsgnjn.s     fs4, fs9, fs5
                  fcvt.s.wu    ft11, ra, rdn
                  div          s11, s6, s6
                  add          a0, s11, a1
                  fmax.s       ft5, fs1, ft3
                  slli         a5, s0, 0
                  fsgnjx.s     ft1, ft1, fa2
                  sltu         a6, s5, s7
                  fsgnjx.s     ft9, ft0, fs7
                  fsgnj.s      ft2, ft4, fa2
                  fsgnj.s      ft10, fs11, fs2
                  sub          tp, s7, s6
                  sub          a4, s9, s4
                  fdiv.s       fs8, ft8, ft1, rtz
                  mulh         s5, tp, a4
                  fcvt.wu.s    t5, fa4, rtz
                  fcvt.s.wu    fs9, sp
                  fsgnjn.s     fa2, ft10, ft6
                  srl          a2, s11, s2
                  fcvt.wu.s    a4, fa7, rup
                  sll          s2, t6, a6
                  div          t5, s2, t0
                  addi         a3, s7, -35
                  fsub.s       fs6, ft8, ft4, rtz
                  fmul.s       fs2, fs7, ft0
                  flt.s        a7, fs6, ft10
                  fmv.x.w      s2, fa3
                  slli         t0, a2, 15
                  srai         s5, gp, 1
                  xori         s8, t4, -270
                  sra          s9, t2, s3
                  flt.s        s11, fs1, ft1
                  slti         a7, s6, -1599
                  xori         s5, t4, -1236
                  auipc        a4, 486243
                  fclass.s     s10, fs6
                  slli         a1, a2, 28
                  xori         s5, s11, -560
                  rem          s9, s1, t2
                  fdiv.s       fs4, fa3, fs5, rup
                  xori         t3, gp, 636
                  fmv.x.w      s10, fa6
                  div          s0, s10, a3
                  fsqrt.s      fa5, fa6, rup
                  sltiu        ra, zero, -1610
                  fcvt.s.wu    fs2, t2
                  sltiu        t5, s2, -369
                  slt          a3, t5, s2
                  slt          s1, t5, s11
                  mulhu        gp, t2, s1
                  srl          zero, t2, s10
                  ori          a7, s9, 1986
                  fmv.w.x      ft8, t0
                  srli         s11, s8, 24
                  fmax.s       ft6, fs11, ft6
                  xor          t5, t3, s5
                  sub          a4, gp, t1
                  mulhsu       t1, a0, ra
                  sltiu        s3, zero, 85
                  fdiv.s       fs4, fs10, fa7
                  div          a4, a6, a5
                  div          a2, s0, t2
                  rem          gp, s4, s3
                  or           s0, s4, a7
                  mulh         a6, a1, gp
                  nop
                  fmul.s       fa0, ft5, ft7
                  slt          t1, t5, s1
                  fsqrt.s      ft3, ft8
                  fmv.x.w      ra, fs4
                  lui          s4, 701225
                  fle.s        t4, ft6, fa3
                  auipc        t2, 656067
                  xor          a7, s4, s0
                  and          gp, t3, s7
                  fcvt.wu.s    zero, fs9
                  or           t0, s5, sp
                  flt.s        zero, fa6, fs11
                  fsgnjn.s     fs11, fa3, fs9
                  divu         s2, t2, t1
                  and          a1, s4, a6
                  add          ra, a0, a5
                  fsgnjx.s     ft1, ft3, fa7
                  mulh         s5, s2, s1
                  fmax.s       ft8, fa4, fa4
                  fmin.s       ft9, fs10, fs4
                  mulhsu       a7, a1, ra
                  flt.s        s10, fs0, ft10
                  flt.s        a4, fs3, fa1
                  add          s4, gp, s11
                  slt          zero, zero, a0
                  mulh         gp, s6, t1
                  auipc        s2, 241819
                  slli         t4, t5, 11
                  fcvt.wu.s    a5, fs3
                  fclass.s     t4, fs7
                  slti         s8, s8, -1197
                  fsqrt.s      ft11, ft0, rne
                  addi         s2, a0, 988
                  rem          a1, a6, a7
                  remu         s3, s5, s3
                  fmv.x.w      t0, ft6
                  fsub.s       ft9, fs11, fs6
                  fmin.s       ft10, ft11, fs10
                  srai         a1, t4, 26
                  fsgnj.s      fs0, fa6, ft6
                  fsgnj.s      fs3, ft7, fa2
                  andi         s8, s7, 1461
                  fsgnjn.s     fa7, fa0, fs10
                  fsgnjn.s     ft4, fs8, ft5
                  fmin.s       fa7, ft9, ft6
                  fdiv.s       fa6, ft3, ft2
                  fcvt.s.wu    ft7, tp, rmm
                  sub          s3, t3, sp
                  fmv.x.w      t6, ft4
                  addi         t2, tp, 383
                  mulh         s0, gp, s8
                  andi         t0, t5, 1764
                  rem          s5, a6, s4
                  fmul.s       ft7, fs11, fa3
                  auipc        s10, 987647
                  sltu         a0, a6, s3
                  nop
                  addi         t5, sp, -1622
                  fsgnjn.s     ft5, fa2, fa7
                  fle.s        a5, fa5, fa4
                  fmv.w.x      fs10, t3
                  sltiu        a6, tp, -1143
                  rem          s8, t0, gp
                  add          s8, tp, s9
                  mul          s10, t2, a4
                  srl          zero, t6, t3
                  slt          t3, a7, t6
                  slti         s3, t4, -1412
                  mulhu        t1, a0, a5
                  fsgnj.s      ft3, fa7, fs1
                  ori          a7, a3, 107
                  fsub.s       ft3, fa6, ft1, rdn
                  mul          t3, s1, s0
                  divu         zero, t4, s0
                  andi         a6, t2, -175
                  xor          t3, s0, t1
                  lui          t6, 519442
                  ori          a0, s6, 140
                  fmv.x.w      tp, fs0
                  nop
                  fcvt.w.s     t4, ft9, rup
                  srl          a0, s3, s9
                  add          t2, s5, a4
                  fcvt.s.w     fs4, sp
                  remu         a6, a3, tp
                  fsgnjn.s     ft5, fs2, ft9
                  remu         t4, t0, zero
                  fdiv.s       fs9, fs10, ft6
                  lui          a6, 515435
                  andi         t3, t5, -60
                  feq.s        gp, fs10, ft3
                  or           s8, a6, gp
                  feq.s        s4, fs0, ft5
                  mulhu        t4, t4, t2
                  nop
                  fsgnjn.s     fs0, fs2, ft7
                  fclass.s     zero, fs11
                  srai         ra, s6, 11
                  fsub.s       fs3, fs8, fs1
                  srl          s9, t2, s3
                  srai         ra, s4, 12
                  div          s1, s11, s6
                  mulhu        s3, sp, t5
                  or           t0, zero, t3
                  feq.s        a6, ft7, fs0
                  or           tp, ra, t6
                  fmul.s       ft7, fs0, fa5, rmm
                  addi         zero, s11, -920
                  fadd.s       fs2, fa3, fs3
                  fcvt.w.s     t1, fs5
                  xori         a7, tp, -1500
                  feq.s        a7, fa6, fa2
                  fsgnjx.s     ft3, ft8, ft2
                  fmax.s       ft7, fs11, fa2
                  xor          a7, t5, a2
                  add          gp, s6, a5
                  fsqrt.s      fa0, fa6
                  fadd.s       fs4, fs10, ft9
                  sub          s10, a1, s7
                  mulhu        a6, t6, s8
                  andi         s9, s0, 1923
                  fsgnj.s      ft9, fs6, ft5
                  slli         s9, a0, 8
                  fcvt.s.wu    ft11, t4
                  fmul.s       fs9, fs9, ft1, rdn
                  fadd.s       fa3, fs9, ft2, rup
                  slli         t0, t1, 1
                  auipc        a4, 897942
                  fmin.s       fs8, fs4, fs2
                  srl          t5, s8, a2
                  andi         s0, zero, -828
                  mulhu        gp, s6, a0
                  and          a4, s7, s2
                  fmv.w.x      ft8, s8
                  sltu         s0, s5, sp
                  or           s8, s8, s6
                  fcvt.s.w     fs0, a7, rtz
                  fsqrt.s      ft11, fs9
                  fmax.s       ft6, fs3, fs4
                  sll          t4, sp, s1
                  flt.s        t2, fa2, fs6
                  sll          zero, tp, s8
                  addi         a2, sp, 78
                  fclass.s     t6, fa3
                  auipc        s11, 883360
                  nop
                  fdiv.s       fs0, fs11, fa0, rup
                  fcvt.s.w     fs7, s5
                  srli         t5, t4, 24
                  xor          s8, gp, s4
                  auipc        s2, 753793
                  auipc        s9, 803817
                  fcvt.wu.s    t6, ft10, rdn
                  sra          t4, s6, a6
                  fdiv.s       fs6, ft4, fs2, rtz
                  sltiu        t1, s3, -1297
                  rem          a6, tp, t3
                  ori          a7, s2, 1541
                  xor          t3, s1, t6
                  addi         ra, a0, -1111
                  rem          a0, s1, a0
                  fmul.s       ft9, fa4, fa2, rtz
                  fclass.s     s4, fs11
                  fcvt.w.s     t6, fs10
                  nop
                  srli         s11, a1, 0
                  div          t4, s4, s4
                  fadd.s       fa7, fs7, ft3, rne
                  slti         a4, t2, -1741
                  fmul.s       ft11, fs7, ft8
                  mulhsu       s9, t6, s3
                  fsgnjn.s     ft5, fs11, fs9
                  fsqrt.s      fs11, fa2, rne
                  remu         t3, a4, a6
                  xor          zero, t1, s7
                  rem          s11, s3, a0
                  mulhu        s8, a1, a6
                  fsgnj.s      fa4, fs7, fa3
                  sra          t0, s3, t3
                  mulhsu       a2, s4, t6
                  andi         s1, s9, -232
                  flt.s        s3, fs3, fs10
                  fle.s        s0, fs7, fa6
                  fcvt.s.w     ft4, s9, rtz
                  fsgnjx.s     fs11, ft8, fs5
                  rem          a4, gp, s3
                  fmax.s       fa6, fa7, fs3
                  fdiv.s       fs8, fs6, fs3
                  fmv.w.x      fa0, s3
                  fle.s        s3, ft2, fs3
                  divu         a5, ra, s2
                  fmax.s       fs0, ft3, ft0
                  addi         ra, s1, -1063
                  lui          t5, 326334
                  sltu         a2, a7, tp
                  fsub.s       fs4, fa5, fa2
                  fsqrt.s      fa3, fa7, rup
                  sltiu        a2, t3, 180
                  fsgnjn.s     ft0, fs4, fs6
                  fcvt.s.w     fs5, a2, rtz
                  remu         s9, t4, a4
                  add          gp, a3, t0
                  divu         s0, t4, zero
                  srl          t2, s6, a4
                  sltiu        ra, zero, 261
                  feq.s        t4, fa4, fa2
                  sll          a4, a4, a7
                  xor          s0, s5, s11
                  fsgnjx.s     fa4, fs1, fs9
                  mulh         a0, a5, s11
                  fmv.w.x      ft5, s1
                  or           s1, ra, s1
                  sltu         a1, a0, s0
                  slli         a1, zero, 31
                  remu         t4, t3, t5
                  xori         s3, s4, 108
                  fclass.s     s4, fs11
                  divu         s2, s2, ra
                  fmv.x.w      a5, fs0
                  nop
                  and          a3, a3, t2
                  fmv.x.w      a0, fa4
                  nop
                  lui          a3, 855084
                  andi         s11, s4, -2007
                  mulhsu       a4, s1, zero
                  nop
                  fcvt.s.w     fs10, a3, rdn
                  fmul.s       ft3, fs9, fs6
                  div          zero, a0, s6
                  slti         a6, t3, 2040
                  add          s4, a4, s1
                  slli         t4, tp, 11
                  andi         a4, gp, 88
                  fsqrt.s      fa2, ft5, rtz
                  fsgnj.s      fs8, ft3, fa4
                  rem          s0, t3, t5
                  lui          a6, 506267
                  fcvt.s.wu    fs5, s8
                  or           s4, a1, a0
                  slti         ra, s1, 1923
                  mulh         a1, t3, t0
                  srli         a6, t1, 13
                  remu         a5, s3, t6
                  nop
                  fclass.s     a0, ft7
                  andi         s11, s4, 329
                  and          t5, s8, a3
                  or           s9, a0, s3
                  fadd.s       ft9, ft8, ft5, rne
                  mulhu        s11, s3, tp
                  sltiu        t4, s10, -65
                  sltu         s11, a5, ra
                  slti         a2, s10, 470
                  mulhu        a4, s11, a0
                  divu         a5, s5, s10
                  xori         t0, t1, -820
                  fle.s        t1, ft3, fa2
                  slt          t6, gp, gp
                  slli         t1, a0, 3
                  fsgnjn.s     ft10, ft1, ft6
                  sltu         s10, a4, t0
                  lui          t5, 971237
                  fmv.x.w      s0, ft3
                  mulh         s1, a7, s0
                  xori         a5, t6, 1712
                  rem          s5, a5, s3
                  srl          s3, s5, a1
                  fsgnjx.s     fa1, fa3, fs0
                  sra          s0, t5, s6
                  fmin.s       ft0, fa2, fs6
                  auipc        t1, 227490
                  slt          a2, t5, s5
                  feq.s        t2, ft5, ft7
                  fsgnjx.s     fa3, ft9, ft5
                  fsgnjn.s     ft1, fs0, ft10
                  fmv.w.x      fs2, t3
                  fsub.s       fs0, ft6, ft4, rtz
                  fmin.s       fs4, fa6, fs1
                  xor          s11, a7, s5
                  srl          a0, s3, s8
                  mul          s4, t1, t5
                  xor          a1, a6, s3
                  mulh         s9, t3, s8
                  sltu         a1, s11, t0
                  nop
                  xori         t2, t4, 1574
                  sltu         t1, tp, s9
                  sltu         t3, a6, tp
                  mulh         t1, s6, t6
                  fadd.s       fa3, ft7, fs4, rmm
                  feq.s        s0, ft11, ft10
                  feq.s        t3, ft8, fs9
                  sll          a0, s2, t1
                  sra          ra, sp, a4
                  fadd.s       ft1, fa0, ft3, rtz
                  fsgnjx.s     fs11, ft5, ft2
                  sll          s1, a6, t0
                  nop
                  mulhsu       ra, a4, sp
                  sltu         a1, s7, a7
                  andi         s10, tp, 1504
                  lui          s2, 720418
                  fsub.s       fs5, fa2, fs6
                  fcvt.w.s     tp, fs6
                  xor          t1, s10, s5
                  mulhu        t4, t6, s4
                  fsub.s       fs0, fs4, fs11, rtz
                  fcvt.wu.s    t3, fa2, rup
                  mulhu        s1, t2, s5
                  fsgnj.s      fs9, ft7, fs3
                  mulhu        s4, t1, s2
                  addi         a1, a1, 1941
                  slti         s3, s7, -201
                  mulh         gp, tp, s11
                  xor          s3, t3, t4
                  fle.s        a2, fs0, ft6
                  mul          a5, a7, t3
                  xori         a7, s2, 1137
                  mulh         t4, gp, s8
                  xori         s1, s1, -251
                  fsgnjn.s     ft9, ft2, ft9
                  nop
                  fcvt.wu.s    a1, fs4, rmm
                  mul          s10, s4, t4
                  feq.s        s2, fs4, fs0
                  lui          a4, 450852
                  fle.s        a5, fs2, ft9
                  div          tp, t2, t3
                  srli         a2, a0, 22
                  xor          s9, s8, s9
                  fmv.x.w      s8, ft6
                  fmin.s       ft11, ft1, fa3
                  ori          zero, a4, 240
                  sltiu        a2, s6, 1053
                  srli         a4, s4, 4
                  srai         s3, s7, 12
                  fsqrt.s      ft11, fs3
                  fcvt.wu.s    ra, ft5
                  sltiu        s1, gp, -25
                  feq.s        t2, ft8, fs7
                  fclass.s     a3, ft11
                  slti         tp, t5, -1092
                  sll          a5, t0, s3
                  fmin.s       fa3, fs9, fa5
                  fsgnjn.s     fs7, fs0, fa0
                  mulhsu       s10, s1, s11
                  fmax.s       fa7, fa5, ft2
                  fsub.s       ft1, fa5, fa7, rup
                  fdiv.s       fs1, fa4, fs8, rup
                  feq.s        a6, fs3, ft5
                  fmul.s       fs3, fs6, fa5
                  fle.s        s2, fa1, fs5
                  or           a0, tp, t6
                  nop
                  sltu         t6, s3, a3
                  xori         a2, a7, 1029
                  slli         t1, a7, 13
                  slti         t5, a2, 1377
                  fsub.s       fs7, fs6, fa1, rne
                  fadd.s       ft4, ft11, ft4, rmm
                  fsgnj.s      fa6, ft4, ft2
                  fsqrt.s      ft4, ft2, rup
                  srai         a5, s2, 21
                  fsgnjn.s     fs6, fa3, fs7
                  mulhu        s11, t5, s4
                  slti         t2, a6, -1579
                  mul          a0, s2, s5
                  srli         s9, a3, 23
                  srai         s10, t0, 11
                  srl          s1, s8, s1
                  fsqrt.s      fs4, ft11
                  mulh         s8, t3, a6
                  and          zero, t0, s11
                  fmin.s       ft8, fa1, ft8
                  sltiu        t3, s6, 817
                  srli         s8, t1, 11
                  slt          t1, t1, a4
                  fmv.w.x      fs3, a0
                  fsgnjx.s     fa3, fs1, ft9
                  fclass.s     a6, fs10
                  slli         s10, s4, 25
                  feq.s        a7, fs0, ft7
                  mulh         zero, t6, ra
                  sra          s5, a6, s8
                  srli         a2, a4, 25
                  fcvt.w.s     s1, fa6, rtz
                  auipc        s8, 44784
                  fsgnjn.s     fs2, fa4, fs6
                  fsqrt.s      fs7, fs4
                  divu         t2, a0, a1
                  and          t2, s2, t5
                  andi         a7, t3, -312
                  fmv.w.x      fs9, a3
                  fmin.s       fa7, ft5, fs8
                  mulhu        gp, s8, a4
                  div          zero, t4, s11
                  fmul.s       fs6, ft5, fs10
                  sra          t5, s9, t2
                  sub          a1, t0, a3
                  divu         a6, t1, s4
                  xori         s0, s4, 332
                  sltu         s10, gp, t1
                  fcvt.s.w     fa5, s11
                  mulhu        a7, a0, sp
                  lui          t3, 986059
                  fcvt.w.s     a7, fs7
                  mulhu        a3, a5, zero
                  fdiv.s       ft8, ft4, ft9, rne
                  sltiu        t4, s11, 40
                  fcvt.wu.s    t1, fs8
                  fsgnjx.s     ft3, ft2, fa0
                  ori          t1, s7, -213
                  or           zero, a1, s4
                  sltu         a0, a1, t2
                  mul          s8, t6, a5
                  fsgnjn.s     ft8, ft3, fa0
                  fmv.x.w      ra, ft7
                  srl          a4, sp, s5
                  sltiu        gp, tp, -1776
                  fcvt.wu.s    a0, fa0, rup
                  xori         t6, t5, 1783
                  nop
                  and          s11, s8, t5
                  xor          zero, t3, a0
                  remu         t0, s8, a3
                  fdiv.s       fa4, fs0, fa3
                  divu         a2, t2, a5
                  add          t2, a7, gp
                  auipc        t0, 890667
                  sltiu        s4, s6, -1135
                  srli         a0, a0, 23
                  slli         a1, t5, 28
                  srai         s1, t3, 11
                  fsgnjx.s     fa4, ft11, fs0
                  fsub.s       fs4, ft11, fa5
                  auipc        a4, 96534
                  sltiu        t0, t6, 1616
                  sltiu        a3, s11, -163
                  remu         t2, t2, t1
                  fsqrt.s      ft11, fa2, rtz
                  xori         s8, sp, 1650
                  xori         ra, s0, 722
                  add          s1, a2, t0
                  fdiv.s       ft6, fa3, fs11
                  fsgnjn.s     ft1, ft0, fa6
                  fclass.s     a0, ft5
                  fclass.s     s0, fs2
                  mulhsu       t5, t4, s3
                  fclass.s     a1, ft9
                  fcvt.wu.s    t1, fs2
                  sltiu        s3, t0, 244
                  ori          t4, s7, -632
                  fsub.s       ft1, fs5, fa5, rtz
                  sra          t1, s3, tp
                  xori         s8, a5, -895
                  or           a5, t3, s1
                  div          a7, sp, t6
                  flt.s        s8, fs10, fa4
                  flt.s        s9, fa7, fa5
                  fmv.x.w      a0, fa4
                  fcvt.wu.s    s1, ft8, rup
                  fsgnj.s      fs3, ft11, fs5
                  fsub.s       fa6, fa6, fs0, rtz
                  slt          ra, s8, s9
                  slt          a5, a6, t3
                  fcvt.s.w     ft9, a0
                  div          a0, gp, a1
                  fsub.s       ft6, ft7, fs6, rtz
                  fsgnjn.s     fs1, fs3, fs1
                  slti         a6, t3, -1786
                  fcvt.s.wu    fs5, t0, rdn
                  fmv.w.x      fs0, s11
                  sltu         gp, a7, t4
                  fsgnj.s      ft0, fs2, fs6
                  srli         s5, sp, 6
                  fmv.w.x      ft6, t4
                  divu         s2, t2, s2
                  fle.s        a4, fs4, fa7
                  fsqrt.s      fa7, ft9
                  srli         tp, s1, 14
                  fmax.s       fa0, fa2, fs4
                  fsqrt.s      fa0, ft9
                  remu         a4, sp, a1
                  slti         s8, s2, -679
                  fadd.s       fa3, fs3, ft5
                  or           t5, a1, gp
                  rem          s3, s0, t3
                  xor          a2, s5, ra
                  or           ra, t3, t6
                  fmv.x.w      a2, fa5
                  feq.s        a6, fs11, ft0
                  mulhsu       t4, a3, t5
                  and          a3, s2, s9
                  fadd.s       fa5, fs0, ft11, rup
                  fmul.s       ft0, fs11, fs10, rne
                  slli         a2, t0, 17
                  lui          a1, 97413
                  rem          s9, a2, s3
                  fcvt.s.wu    ft8, s4, rtz
                  add          s5, a3, t5
                  andi         a7, a4, -1498
                  divu         a2, s8, s10
                  fsgnjx.s     fs7, ft9, fs8
                  fsub.s       fa5, fa5, ft10, rdn
                  fadd.s       ft4, fs9, fa4
                  fcvt.s.wu    fs0, a6
                  addi         a7, s4, -1087
                  sra          a7, s7, s2
                  srai         a5, sp, 9
                  slt          s10, sp, s2
                  fclass.s     s0, fa6
                  divu         a5, t2, s7
                  sll          a2, gp, a7
                  mulhsu       t1, s11, a7
                  fsub.s       ft9, fs11, ft0
                  lui          a4, 285054
                  fmax.s       fs9, ft1, ft11
                  fsub.s       ft4, fs11, fs1, rmm
                  fcvt.w.s     tp, fa3, rtz
                  fsqrt.s      ft11, fs7
                  fmax.s       fa5, fs1, fs10
                  fsqrt.s      fa7, fs7
                  sltiu        a3, s6, -580
                  ori          s1, ra, 1885
                  fcvt.w.s     a0, fs5, rmm
                  sra          s9, t3, s6
                  divu         s10, sp, s3
                  remu         ra, s1, a1
                  fdiv.s       fs8, ft3, fa1
                  fadd.s       ft4, fa1, fs3, rne
                  rem          s5, t4, s1
                  slt          t1, s3, a7
                  fsqrt.s      fa1, fa0, rmm
                  srli         s3, s4, 8
                  sra          t0, zero, zero
                  ori          a3, s6, 723
                  fmul.s       ft7, fs11, fs2
                  nop
                  fcvt.w.s     s10, ft4
                  add          t5, t6, t5
                  addi         tp, t2, -792
                  divu         a5, t3, s8
                  sltiu        s4, s10, -211
                  mulh         t3, s6, t5
                  fle.s        ra, ft3, fa0
                  fcvt.wu.s    t5, fs0, rmm
                  sltiu        tp, a7, -760
                  divu         s10, tp, gp
                  ori          zero, t5, -1869
                  divu         t2, gp, a4
                  addi         zero, a1, -1419
                  rem          t0, a0, t4
                  divu         zero, a6, s11
                  xor          t6, s6, a4
                  fsgnj.s      ft7, ft7, ft11
                  srai         a2, s8, 24
                  mul          a5, t4, a0
                  addi         ra, s10, 975
                  or           s5, a3, a4
                  fmul.s       ft3, fs0, fs1, rdn
                  fmin.s       fa1, ft0, fa1
                  fclass.s     gp, fs2
                  sll          s10, a3, s9
                  srai         a6, zero, 15
                  auipc        ra, 1018812
                  srl          s0, t1, sp
                  divu         s9, t1, s4
                  fcvt.wu.s    t0, fs10, rne
                  fsub.s       ft6, fa2, ft0
                  feq.s        gp, fa3, fs7
                  mulhu        a4, s6, t1
                  fmin.s       ft3, fa0, fa6
                  fmax.s       fa7, ft0, ft5
                  flt.s        s10, ft9, ft10
                  sltiu        s4, s3, -234
                  slli         s4, gp, 9
                  lui          t2, 829027
                  auipc        t6, 23446
                  div          a5, tp, a0
                  fdiv.s       fa6, fs6, ft9, rmm
                  div          gp, s0, t0
                  nop
                  divu         a2, s4, a6
                  ori          a5, t6, -707
                  div          zero, t2, a2
                  slli         a5, ra, 10
                  fsgnjn.s     ft4, fs9, fa7
                  fle.s        t3, ft8, fs11
                  fcvt.w.s     s11, ft3
                  slti         s11, t4, 1637
                  sltu         t1, ra, s3
                  fclass.s     s10, ft1
                  feq.s        a7, fs9, ft4
                  fdiv.s       ft6, fs3, fa4, rup
                  fmax.s       fs5, ft10, fa5
                  or           a2, a2, s1
                  fsgnj.s      fa5, fs8, fa4
                  add          a6, sp, s5
                  fsgnj.s      ft7, fa1, ft10
                  fmax.s       ft4, fs0, ft10
                  slti         t5, a3, -430
                  slli         s4, a2, 1
                  fdiv.s       ft6, ft11, fa5, rmm
                  mulhu        a1, t4, s0
                  flt.s        a6, fs3, ft1
                  add          t5, t6, a2
                  slli         a0, s10, 31
                  sra          t1, a0, t4
                  divu         t1, s7, t0
                  and          a7, t6, s0
                  mul          t4, t1, sp
                  flt.s        t2, ft9, ft7
                  rem          a4, s8, a4
                  fcvt.wu.s    s8, fa0, rne
                  fsgnjn.s     ft7, fs5, ft1
                  xor          s0, s3, gp
                  rem          s4, t4, a0
                  srli         gp, sp, 8
                  div          t4, s7, a6
                  fmax.s       ft11, fs7, ft10
                  srai         s4, a5, 10
                  fcvt.wu.s    zero, ft6, rmm
                  srai         t4, s3, 12
                  xor          t5, s2, a2
                  lui          s8, 906740
                  sltu         t5, t3, t4
                  rem          a7, a6, s6
                  fsub.s       fa3, ft10, fs0, rdn
                  fmin.s       fs5, fs7, fa2
                  feq.s        s4, fa0, fa7
                  fdiv.s       fa7, fs11, fs3
                  fsgnj.s      fa3, fs1, fa1
                  xor          tp, gp, s10
                  nop
                  flt.s        s8, fa7, fs2
                  slli         gp, t2, 19
                  fcvt.s.w     fs4, zero
                  feq.s        gp, fs4, ft1
                  fcvt.s.w     ft8, s3, rtz
                  la x23, test_done
                  jalr x0, x23, 0
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
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_2:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_3:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_4:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_5:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_6:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_7:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_8:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_9:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_10:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_11:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_12:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_13:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_14:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

mmode_intr_vector_15:
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  j mmode_intr_handler
                  1: la x23, test_done
                  jalr x0, x23, 0

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
                  addi x2, x2, -4
                  sw  x22, (x2)
                  add x22, x2, zero
                  addi x22, x22, -128
                  sw  x1, 4(x22)
                  sw  x2, 8(x22)
                  sw  x3, 12(x22)
                  sw  x4, 16(x22)
                  sw  x5, 20(x22)
                  sw  x6, 24(x22)
                  sw  x7, 28(x22)
                  sw  x8, 32(x22)
                  sw  x9, 36(x22)
                  sw  x10, 40(x22)
                  sw  x11, 44(x22)
                  sw  x12, 48(x22)
                  sw  x13, 52(x22)
                  sw  x14, 56(x22)
                  sw  x15, 60(x22)
                  sw  x16, 64(x22)
                  sw  x17, 68(x22)
                  sw  x18, 72(x22)
                  sw  x19, 76(x22)
                  sw  x20, 80(x22)
                  sw  x21, 84(x22)
                  sw  x22, 88(x22)
                  sw  x23, 92(x22)
                  sw  x24, 96(x22)
                  sw  x25, 100(x22)
                  sw  x26, 104(x22)
                  sw  x27, 108(x22)
                  sw  x28, 112(x22)
                  sw  x29, 116(x22)
                  sw  x30, 120(x22)
                  sw  x31, 124(x22)
                  add x2, x22, zero
                  csrr x18, 0x341 # MEPC
                  csrr x18, 0x342 # MCAUSE
                  li x4, 0x3 # BREAKPOINT
                  beq x18, x4, ebreak_handler
                  li x4, 0x8 # ECALL_UMODE
                  beq x18, x4, ecall_handler
                  li x4, 0x9 # ECALL_SMODE
                  beq x18, x4, ecall_handler
                  li x4, 0xb # ECALL_MMODE
                  beq x18, x4, ecall_handler
                  li x4, 0x1
                  beq x18, x4, instr_fault_handler
                  li x4, 0x5
                  beq x18, x4, load_fault_handler
                  li x4, 0x7
                  beq x18, x4, store_fault_handler
                  li x4, 0xc
                  beq x18, x4, pt_fault_handler
                  li x4, 0xd
                  beq x18, x4, pt_fault_handler
                  li x4, 0xf
                  beq x18, x4, pt_fault_handler
                  li x4, 0x2 # ILLEGAL_INSTRUCTION
                  beq x18, x4, illegal_instr_handler
                  csrr x4, 0x343 # MTVAL
                  1: la x23, test_done
                  jalr x1, x23, 0

ecall_handler:    
                  la x18, _start
                  sw x0, 0(x18)
                  sw x1, 4(x18)
                  sw x2, 8(x18)
                  sw x3, 12(x18)
                  sw x4, 16(x18)
                  sw x5, 20(x18)
                  sw x6, 24(x18)
                  sw x7, 28(x18)
                  sw x8, 32(x18)
                  sw x9, 36(x18)
                  sw x10, 40(x18)
                  sw x11, 44(x18)
                  sw x12, 48(x18)
                  sw x13, 52(x18)
                  sw x14, 56(x18)
                  sw x15, 60(x18)
                  sw x16, 64(x18)
                  sw x17, 68(x18)
                  sw x18, 72(x18)
                  sw x19, 76(x18)
                  sw x20, 80(x18)
                  sw x21, 84(x18)
                  sw x22, 88(x18)
                  sw x23, 92(x18)
                  sw x24, 96(x18)
                  sw x25, 100(x18)
                  sw x26, 104(x18)
                  sw x27, 108(x18)
                  sw x28, 112(x18)
                  sw x29, 116(x18)
                  sw x30, 120(x18)
                  sw x31, 124(x18)
                  la x23, write_tohost
                  jalr x0, x23, 0

instr_fault_handler:
                  add x22, x2, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x2, x22, zero
                  lw  x22, (x2)
                  addi x2, x2, 4
                  mret

load_fault_handler:
                  add x22, x2, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x2, x22, zero
                  lw  x22, (x2)
                  addi x2, x2, 4
                  mret

store_fault_handler:
                  add x22, x2, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x2, x22, zero
                  lw  x22, (x2)
                  addi x2, x2, 4
                  mret

ebreak_handler:   
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  add x22, x2, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x2, x22, zero
                  lw  x22, (x2)
                  addi x2, x2, 4
                  mret

illegal_instr_handler:
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  add x22, x2, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x2, x22, zero
                  lw  x22, (x2)
                  addi x2, x2, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x18, 0x300 # MSTATUS;
                  csrr  x18, 0x304 # MIE;
                  csrr  x18, 0x344 # MIP;
                  csrrc x18, 0x344, x18 # MIP;
                  add x22, x2, zero
                  lw  x1, 4(x22)
                  lw  x2, 8(x22)
                  lw  x3, 12(x22)
                  lw  x4, 16(x22)
                  lw  x5, 20(x22)
                  lw  x6, 24(x22)
                  lw  x7, 28(x22)
                  lw  x8, 32(x22)
                  lw  x9, 36(x22)
                  lw  x10, 40(x22)
                  lw  x11, 44(x22)
                  lw  x12, 48(x22)
                  lw  x13, 52(x22)
                  lw  x14, 56(x22)
                  lw  x15, 60(x22)
                  lw  x16, 64(x22)
                  lw  x17, 68(x22)
                  lw  x18, 72(x22)
                  lw  x19, 76(x22)
                  lw  x20, 80(x22)
                  lw  x21, 84(x22)
                  lw  x22, 88(x22)
                  lw  x23, 92(x22)
                  lw  x24, 96(x22)
                  lw  x25, 100(x22)
                  lw  x26, 104(x22)
                  lw  x27, 108(x22)
                  lw  x28, 112(x22)
                  lw  x29, 116(x22)
                  lw  x30, 120(x22)
                  lw  x31, 124(x22)
                  addi x22, x22, 128
                  add x2, x22, zero
                  lw  x22, (x2)
                  addi x2, x2, 4
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
