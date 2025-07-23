.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x16, h0_start
jalr x0, x16, 0
h0_start:
                  li x11, 0x40001120
                  csrw 0x301, x11
kernel_sp:        
                  la x6, kernel_stack_end

trap_vec_init:    
                  la x11, mtvec_handler
                  ori x11, x11, 1
                  csrw 0x305, x11 # MTVEC

mepc_setup:       
                  la x11, init
                  csrw 0x341, x11

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x11, 0x3800
                  csrw 0x300, x11 # MSTATUS
                  li x11, 0x0
                  csrw 0x304, x11 # MIE
                  mret
init:             
                  li x11, 2147556580
                  fmv.w.x f0, x11
                  li x11, 2147483648
                  fmv.w.x f1, x11
                  li x11, 3765141749
                  fmv.w.x f2, x11
                  li x11, 2139095041
                  fmv.w.x f3, x11
                  li x11, 2139095039
                  fmv.w.x f4, x11
                  li x11, 2143289344
                  fmv.w.x f5, x11
                  li x11, 2143289344
                  fmv.w.x f6, x11
                  li x11, 2139095041
                  fmv.w.x f7, x11
                  li x11, 2143289344
                  fmv.w.x f8, x11
                  li x11, 2149725912
                  fmv.w.x f9, x11
                  li x11, 2139095040
                  fmv.w.x f10, x11
                  li x11, 2139095039
                  fmv.w.x f11, x11
                  li x11, 4194955
                  fmv.w.x f12, x11
                  li x11, 2147483648
                  fmv.w.x f13, x11
                  li x11, 0
                  fmv.w.x f14, x11
                  li x11, 2147483648
                  fmv.w.x f15, x11
                  li x11, 2139095039
                  fmv.w.x f16, x11
                  li x11, 2139095041
                  fmv.w.x f17, x11
                  li x11, 3795323632
                  fmv.w.x f18, x11
                  li x11, 4286578688
                  fmv.w.x f19, x11
                  li x11, 2147483648
                  fmv.w.x f20, x11
                  li x11, 2139095039
                  fmv.w.x f21, x11
                  li x11, 4286578687
                  fmv.w.x f22, x11
                  li x11, 2139095039
                  fmv.w.x f23, x11
                  li x11, 2152632821
                  fmv.w.x f24, x11
                  li x11, 2139095040
                  fmv.w.x f25, x11
                  li x11, 3761614217
                  fmv.w.x f26, x11
                  li x11, 2152207421
                  fmv.w.x f27, x11
                  li x11, 6274059
                  fmv.w.x f28, x11
                  li x11, 0
                  fmv.w.x f29, x11
                  li x11, 7332741
                  fmv.w.x f30, x11
                  li x11, 2143289344
                  fmv.w.x f31, x11
                  fsrmi 2
                  li x0, 0xfd5ede46
                  li x1, 0x4
                  li x2, 0x0
                  li x3, 0xed5f0cee
                  li x4, 0xf484ce49
                  li x5, 0xfd84f50a
                  li x7, 0x7d1bd7f9
                  li x8, 0xf3ed03de
                  li x9, 0xd
                  li x10, 0x0
                  li x11, 0xf35cfe6a
                  li x12, 0x80000000
                  li x13, 0x80000000
                  li x14, 0x1cc11bc7
                  li x15, 0xc85d68df
                  li x16, 0x80000000
                  li x17, 0xf74af1ed
                  li x18, 0x57235ab2
                  li x19, 0xfe512956
                  li x20, 0xfeeaa11b
                  li x21, 0x0
                  li x23, 0x80000000
                  li x24, 0x4
                  li x25, 0x0
                  li x26, 0xac9e54
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0xfe06a6d7
                  li x30, 0x4f1b2d62
                  li x31, 0xf43a1062
                  la x22, user_stack_end
main:             flt.s        s11, fa7, ft7
                  or           s11, t4, s9
                  xori         s9, s1, 1811
                  fmin.s       fa7, fs9, fa5
                  divu         a5, t0, t1
                  fcvt.w.s     t3, fs3
                  sltiu        t0, a6, 867
                  sub          s11, t3, s9
                  fsgnj.s      fa4, ft3, fs1
                  fsgnj.s      fa7, ft6, fs2
                  nop
                  and          s0, t5, s11
                  fcvt.s.wu    fa7, sp
                  mulhsu       s11, t4, s8
                  xor          a1, t6, a1
                  sub          s0, a2, s8
                  divu         s4, s1, zero
                  divu         t5, a6, t2
                  sltu         a4, tp, t2
                  sub          a5, t4, a0
                  mul          a1, s3, a0
                  sub          a5, s6, s4
                  srai         s8, s9, 2
                  fmax.s       fa1, fs9, fa6
                  fsgnj.s      ft1, ft4, ft10
                  xor          a5, s4, s8
                  sra          t2, t3, s6
                  auipc        t5, 753874
                  fadd.s       fa5, fs7, fs3
                  slti         s7, s2, -3
                  auipc        s9, 461080
                  mulh         a2, sp, t4
                  fcvt.s.w     fs8, ra
                  fcvt.w.s     s0, fs1
                  fmax.s       ft11, ft0, fs7
                  fmv.w.x      fs11, t2
                  slt          a2, a3, t4
                  fmin.s       fa7, fs7, fa4
                  feq.s        t3, fa0, fs6
                  mul          t6, a7, a7
                  fdiv.s       ft11, ft6, ft6, rne
                  slti         s2, s9, -1754
                  addi         s2, gp, 129
                  nop
                  xori         s11, s5, -1550
                  xor          s11, t5, sp
                  sltu         a2, t4, s6
                  xori         s5, s7, -1571
                  fcvt.w.s     a5, fs8, rup
                  mulhu        s8, a6, t6
                  auipc        s4, 443117
                  fle.s        s9, fa3, ft5
                  sltiu        s9, s4, -662
                  auipc        s9, 354924
                  add          s5, s11, a4
                  srli         a0, s8, 11
                  nop
                  andi         a4, sp, 2037
                  fcvt.s.wu    fa2, t1
                  slt          s2, s10, zero
                  fmv.w.x      fs8, s2
                  fsgnjx.s     fa7, ft1, fs11
                  fmul.s       fs2, fa3, ft9
                  fmv.x.w      sp, fa2
                  fcvt.wu.s    s4, fs6
                  fcvt.s.wu    fa3, s7, rup
                  fcvt.s.wu    ft9, s6, rtz
                  fclass.s     t2, ft9
                  fclass.s     t6, fa4
                  rem          s3, a3, s10
                  ori          s4, a3, 1294
                  mulhu        a5, s1, s7
                  sltu         s8, a1, s8
                  andi         s7, gp, 1047
                  fadd.s       fs3, ft10, ft1
                  fcvt.s.w     fs2, a6
                  fsgnjn.s     fs0, ft3, fs10
                  mulhu        a0, a2, s4
                  mulhu        s10, a2, s5
                  sra          s10, t4, a1
                  divu         s5, s6, s2
                  remu         a4, a4, s3
                  srai         s4, a1, 27
                  addi         t6, s7, -596
                  div          s1, zero, a0
                  mulh         t0, t5, a0
                  mulh         zero, s4, t2
                  fsqrt.s      fs8, fa5, rdn
                  srl          s11, s11, a0
                  fmv.x.w      s2, ft4
                  fmv.x.w      a7, fs1
                  fcvt.w.s     t5, ft9
                  mulhu        s11, t6, tp
                  flt.s        s5, ft7, fs1
                  xor          s3, a6, s9
                  fcvt.s.w     fa0, a0
                  add          sp, a2, t2
                  fadd.s       ft7, ft6, ft10, rne
                  remu         t2, s9, a7
                  fmin.s       fs10, ft8, fa5
                  srai         tp, sp, 11
                  fcvt.w.s     a0, fa5, rtz
                  add          s7, s11, s8
                  fmax.s       fa4, fs1, fa5
                  sltu         s7, t1, t6
                  fsgnjn.s     ft9, fs2, fs2
                  auipc        s5, 50304
                  sub          s10, a4, t6
                  fsub.s       fs7, fa5, fs10, rup
                  fcvt.s.wu    fs10, t0, rne
                  slt          s2, s3, s6
                  ori          s0, s0, 186
                  sra          a1, a1, s6
                  and          s9, s4, s8
                  ori          s3, a6, 893
                  andi         a0, t3, 1537
                  nop
                  flt.s        a0, fs11, ft7
                  srai         s2, t0, 2
                  rem          s3, a0, zero
                  and          gp, s11, s3
                  fadd.s       fs3, fa2, ft9
                  xor          s4, s9, gp
                  fcvt.wu.s    s1, fa7
                  fdiv.s       ft7, fs11, ft7, rup
                  fmax.s       fs7, fs10, ft0
                  fdiv.s       fs9, ft1, fa0, rne
                  xor          a0, t4, t6
                  fclass.s     s1, ft4
                  or           tp, t5, s0
                  fadd.s       ft8, fa7, fs10, rne
                  mulh         t3, s10, a6
                  auipc        s3, 140306
                  or           a7, t0, a6
                  auipc        t5, 26240
                  remu         a4, ra, t2
                  auipc        a2, 107774
                  rem          sp, s2, sp
                  remu         s3, a7, t5
                  slti         a2, zero, 883
                  fcvt.s.wu    ft2, s8
                  flt.s        a7, fa4, ft1
                  nop
                  ori          tp, s11, 914
                  slt          gp, a3, t2
                  fsqrt.s      ft11, fa1
                  lui          t0, 475480
                  ori          s5, a7, 380
                  add          t0, s11, a1
                  fsgnjx.s     fs10, ft5, ft3
                  fmin.s       ft0, fa2, fs3
                  slli         t3, a7, 27
                  fcvt.s.w     ft2, s11
                  fmin.s       ft3, fs11, fa3
                  fdiv.s       ft3, fa1, fa3, rtz
                  add          s9, a0, s10
                  sra          s4, s3, s5
                  slt          s5, tp, s9
                  or           a3, s7, a7
                  fcvt.s.w     fa4, s8, rup
                  srl          a4, s4, a2
                  sltu         s2, s10, tp
                  fclass.s     a0, fs10
                  fcvt.w.s     ra, fa3
                  and          a2, s11, t2
                  fsub.s       ft10, fa4, ft9
                  fmax.s       ft8, fs6, fs3
                  mulhsu       s9, t3, s0
                  srai         a0, s5, 23
                  fsgnj.s      ft7, fs11, fs9
                  feq.s        t5, ft7, ft2
                  sltiu        a7, t5, -431
                  fsgnjx.s     fa0, ft8, fs11
                  fclass.s     a0, fs2
                  mulhsu       s2, a5, s3
                  or           s5, ra, s3
                  auipc        s3, 304470
                  sra          gp, tp, tp
                  auipc        a3, 673246
                  flt.s        t6, fs5, ft6
                  sra          t2, a6, sp
                  sll          s7, s5, s8
                  fmin.s       fs2, fs9, fa2
                  rem          t4, s2, t3
                  sltu         s3, t4, ra
                  sll          gp, s8, tp
                  fcvt.s.wu    ft3, s10
                  ori          t2, s10, -1701
                  andi         gp, t5, 151
                  fmin.s       ft8, ft0, ft4
                  auipc        s5, 213225
                  sra          t6, s0, tp
                  sra          s8, s7, a1
                  sub          s5, sp, gp
                  fmv.w.x      fa5, a4
                  srl          s2, a7, t4
                  sll          a4, a1, t2
                  addi         s5, s3, -1775
                  fsgnjn.s     ft8, ft4, fa6
                  fsub.s       ft5, fa4, fa0
                  feq.s        a3, fs10, fs4
                  fmax.s       fa4, ft8, ft3
                  mulhu        t5, a6, s1
                  fsqrt.s      ft1, ft11, rup
                  fsgnjx.s     fa6, fs10, ft2
                  slt          zero, a3, t2
                  sub          a4, s11, a7
                  srli         s0, t1, 6
                  srli         s7, a2, 23
                  lui          a3, 206210
                  fmv.w.x      fs9, s11
                  srl          a4, s5, s6
                  sltiu        a5, a3, -1904
                  fsgnjn.s     fa7, ft9, ft1
                  addi         gp, t3, 1553
                  xor          s10, tp, ra
                  fcvt.s.wu    fa4, a4
                  srai         s5, s8, 6
                  fsgnj.s      fs1, fs11, ft3
                  fmax.s       fa6, fa7, fa6
                  fsgnjx.s     ft4, fa6, fa3
                  sltiu        t4, sp, -1659
                  fdiv.s       ft4, fs7, fs3, rmm
                  fsgnjn.s     ft9, ft11, ft11
                  fclass.s     t4, ft0
                  fadd.s       fs2, ft10, fa2
                  srli         zero, s6, 5
                  fdiv.s       ft2, ft0, ft6
                  slt          t2, t2, a2
                  slti         s3, s11, 771
                  fclass.s     a4, fs10
                  slt          s4, tp, a0
                  sra          tp, a6, s5
                  flt.s        ra, ft1, ft2
                  divu         t4, s0, gp
                  mulh         tp, s2, a6
                  fmin.s       ft7, fs3, ft11
                  fsgnj.s      ft1, ft5, fs3
                  fclass.s     a1, fa4
                  fsgnjn.s     fs11, ft10, fs2
                  fmin.s       fs0, ft9, fa1
                  sltiu        gp, a1, 1615
                  sltu         zero, s7, a3
                  addi         ra, s1, -196
                  fmv.x.w      a3, fa2
                  fcvt.s.w     fs4, a4, rtz
                  srl          s5, s11, s11
                  fmv.w.x      ft0, s2
                  add          s4, t3, t0
                  sra          s9, a4, s5
                  xor          ra, a1, t3
                  addi         t6, sp, 841
                  fcvt.w.s     s0, fa4, rup
                  sltu         zero, gp, t0
                  fmv.x.w      s5, fa4
                  fsgnjx.s     ft0, fs1, fa3
                  xori         a2, s9, -1249
                  srli         sp, a7, 7
                  fadd.s       fa1, fs5, ft9, rne
                  fcvt.s.w     fs6, s3
                  mulhsu       t5, t3, a1
                  fmv.x.w      a3, ft3
                  fsqrt.s      fs10, fs3, rdn
                  sltu         zero, s1, s2
                  fmv.w.x      ft5, t5
                  fcvt.s.wu    ft9, zero, rdn
                  or           t6, t5, a6
                  divu         gp, s7, s10
                  srli         t0, s11, 3
                  fmv.x.w      t2, ft9
                  fclass.s     t4, ft8
                  fsgnjn.s     ft3, ft4, fs3
                  ori          t4, sp, -1053
                  feq.s        zero, ft4, ft11
                  auipc        a2, 913170
                  fle.s        a3, fs4, ft11
                  div          s1, a1, a2
                  slti         gp, s5, -1550
                  nop
                  sltiu        s11, zero, -1538
                  lui          a2, 723337
                  div          s11, t1, s6
                  sub          a4, a7, t2
                  mulh         s4, a7, s4
                  sltu         s0, s9, t6
                  lui          s2, 927917
                  fle.s        t4, fs0, fa3
                  sltiu        s8, gp, 1667
                  fdiv.s       fs1, ft10, fs3, rmm
                  mulh         a5, sp, zero
                  lui          t4, 987198
                  sra          ra, t3, a2
                  srli         a4, t2, 18
                  sltiu        t0, a2, -1665
                  fmv.x.w      a7, fs4
                  mulh         t2, a2, s0
                  sll          t5, s3, a3
                  fmv.w.x      fa0, t6
                  addi         a2, a4, 1684
                  rem          t6, s10, a3
                  fmin.s       ft2, fs0, ft6
                  add          t2, s11, a7
                  fmax.s       fs9, fa7, fa3
                  fsgnjn.s     fs7, ft3, fa1
                  sra          s5, s0, s2
                  and          s5, t3, t0
                  srai         t3, gp, 5
                  fcvt.wu.s    sp, ft6, rne
                  fadd.s       ft7, fs2, ft10
                  sll          s0, a5, t6
                  srl          t3, t5, a6
                  fmv.w.x      ft10, t0
                  sltiu        a3, s6, 1982
                  addi         a5, s11, -542
                  or           a4, s10, gp
                  div          s7, s10, t0
                  sll          s2, a3, s8
                  fadd.s       fs4, ft6, ft0
                  or           s3, sp, a6
                  lui          s10, 5628
                  fcvt.s.wu    fs4, t4
                  slt          s2, a4, a3
                  rem          s0, s9, ra
                  divu         s8, s11, sp
                  slli         t3, tp, 5
                  andi         s4, s4, -1684
                  slti         tp, t4, 1436
                  fmul.s       fa6, fs1, ft4
                  sll          s7, ra, s8
                  fsqrt.s      fa3, fs10
                  mulhsu       s8, s3, s2
                  fmv.w.x      fa5, a7
                  andi         s3, s3, -1124
                  fle.s        a2, fs2, ft9
                  fadd.s       fs2, ft8, fa2, rne
                  feq.s        s9, fs3, ft0
                  add          t0, tp, s1
                  addi         tp, t0, -1209
                  lui          t4, 261032
                  fsub.s       fs5, fa0, fa4, rdn
                  fcvt.s.w     fa5, a6, rup
                  slt          t3, a4, s6
                  auipc        t4, 1039159
                  mulhu        s11, zero, s11
                  andi         s3, zero, -1410
                  fcvt.wu.s    s3, ft8, rne
                  fsqrt.s      fa0, ft2
                  and          t2, s5, t2
                  sra          a2, a4, t4
                  sll          t5, a7, s2
                  mulhsu       a7, t3, t5
                  fsgnjn.s     ft7, fs7, ft8
                  fsqrt.s      ft0, fs8
                  divu         zero, t5, a0
                  slli         s1, a7, 23
                  sll          a2, t1, s8
                  remu         tp, s9, tp
                  remu         s9, s9, s11
                  fmv.x.w      s2, fa2
                  fmul.s       ft2, ft5, ft10, rtz
                  fclass.s     t5, fa6
                  srai         s1, s6, 19
                  fmv.w.x      fa4, a2
                  mul          s9, s1, s6
                  mulhsu       a2, t1, s4
                  lui          t5, 815526
                  mulhu        a0, t3, t0
                  div          s8, t0, s0
                  srl          s2, t5, s4
                  fclass.s     s4, fs1
                  fsub.s       fs10, fa3, fs0
                  sll          s2, s3, t1
                  srai         a3, s5, 30
                  xor          s11, a4, t2
                  and          a7, gp, sp
                  remu         s11, a1, a1
                  div          ra, s7, s0
                  feq.s        sp, fa3, ft8
                  fadd.s       fa2, ft1, fa1, rdn
                  flt.s        s1, ft3, fa4
                  sll          s5, tp, a0
                  fmv.w.x      fs9, s3
                  fsgnjx.s     fa5, fs1, ft2
                  andi         tp, s4, 1511
                  sub          a1, s7, s1
                  addi         s0, t3, -648
                  mulhu        a7, a0, a4
                  srai         s7, a2, 10
                  fsub.s       fa7, ft6, fa4, rdn
                  fsqrt.s      fs7, fa7
                  flt.s        ra, fs8, fs10
                  sltiu        s0, s10, 1093
                  fdiv.s       fs1, fs2, fs6, rdn
                  fcvt.w.s     t3, fs10
                  lui          t3, 53768
                  xori         t6, s6, 173
                  srli         a5, s4, 0
                  remu         a0, s5, s10
                  fsub.s       ft9, ft2, ft3
                  slti         s3, t3, -1645
                  rem          t4, t6, t2
                  fsub.s       fs10, fs2, ft6
                  sub          s5, s1, a3
                  slli         a5, sp, 25
                  sltiu        t0, a5, -152
                  fmv.x.w      a0, fs3
                  fmin.s       fs11, fs4, ft6
                  and          a7, t3, a2
                  add          ra, s3, a6
                  sltu         sp, s1, s3
                  fmul.s       fs7, ft1, fs5, rdn
                  sltu         s0, t6, tp
                  addi         s5, a2, -1127
                  fle.s        gp, fa2, ft8
                  mulhsu       s3, sp, a7
                  feq.s        s1, ft3, ft10
                  fdiv.s       ft2, fa2, fs9
                  divu         t5, s7, s1
                  rem          a7, a3, s1
                  fmv.w.x      ft2, s1
                  sra          t6, t6, t5
                  auipc        a3, 370283
                  fcvt.w.s     tp, fs2
                  slli         t3, t3, 21
                  sub          s0, t2, t5
                  ori          s5, t0, 1092
                  fsqrt.s      ft1, ft2, rdn
                  fsub.s       fa1, fs8, ft10, rmm
                  slti         s7, a3, 1492
                  srl          gp, s4, s11
                  fsub.s       fa2, fs6, fa1
                  fmul.s       fs10, fs11, fa3, rne
                  mulhu        ra, a7, sp
                  mulhsu       a5, a4, s8
                  ori          s9, s9, 1241
                  srai         a7, tp, 10
                  remu         t0, s11, t0
                  auipc        t6, 408498
                  mulhsu       a7, t2, a7
                  mulhu        t0, a2, t4
                  mul          s1, sp, ra
                  fmv.w.x      ft6, s2
                  or           t5, zero, tp
                  sltu         s11, t4, a6
                  fsqrt.s      ft1, fs9, rup
                  fmv.w.x      fa5, s9
                  fsgnjn.s     fs0, ft5, fa2
                  fsub.s       fa1, ft5, ft9, rdn
                  flt.s        a0, ft6, ft4
                  remu         zero, a5, a5
                  auipc        s8, 979358
                  srai         a3, t2, 28
                  slti         gp, s2, -279
                  slli         t4, a3, 14
                  sll          s8, a7, a1
                  andi         s3, s0, -1251
                  fsgnjn.s     ft4, fs6, ft3
                  sltu         tp, t6, s10
                  fcvt.w.s     s4, fa6, rne
                  div          a4, t5, s7
                  fmv.x.w      a5, fa4
                  fcvt.s.wu    fs2, ra
                  fmax.s       ft7, fs11, ft8
                  rem          s8, a4, t2
                  fmv.x.w      t6, ft2
                  fcvt.w.s     t5, fa1
                  xor          a4, a5, t6
                  sub          a1, s10, s10
                  divu         a2, a3, s5
                  fdiv.s       ft10, fs6, fs11
                  mulhu        s9, gp, s9
                  sra          t0, a6, s8
                  fmv.x.w      s11, fs5
                  andi         tp, t5, -1533
                  feq.s        s8, fa1, fs3
                  fsub.s       ft4, fa6, fs9, rne
                  sll          s3, s5, a6
                  fsgnjx.s     fa6, fs0, fs6
                  fadd.s       fa5, fa3, ft7
                  xor          s5, a4, t1
                  fcvt.w.s     s1, ft5, rtz
                  srai         zero, s11, 19
                  fclass.s     t4, ft2
                  div          t0, s6, tp
                  fsgnjx.s     ft0, fs1, fs10
                  fsgnjx.s     fa4, fs2, fa1
                  mulh         s11, a2, t0
                  rem          t2, t0, a0
                  mulhsu       t2, a2, s9
                  fmv.x.w      s11, fa2
                  fmul.s       fs3, fa7, ft1, rdn
                  sra          a0, s9, ra
                  fsgnjx.s     fa4, fa4, fs4
                  nop
                  sll          s5, s4, tp
                  mulhu        t2, t4, a4
                  fcvt.s.wu    ft11, a3
                  andi         s0, s3, 213
                  fsub.s       ft7, fa0, fs8
                  sra          a3, a4, s6
                  srli         a4, sp, 28
                  addi         s0, a6, -837
                  fle.s        a3, fa4, ft5
                  fsub.s       fs10, ft11, fs8
                  nop
                  fsgnj.s      fa2, fa4, fs1
                  feq.s        s11, fa5, fs8
                  fadd.s       fa6, fs2, fs10, rtz
                  sltiu        s7, a5, 1277
                  remu         s7, a5, t6
                  or           t0, t6, s2
                  div          s1, s11, a0
                  feq.s        t6, fs8, fa7
                  fmax.s       ft10, ft0, ft7
                  fmul.s       fs3, fs3, fs8, rtz
                  fsub.s       ft0, ft5, fa5
                  sra          ra, s9, a1
                  div          t5, ra, a1
                  fcvt.w.s     ra, fa6, rmm
                  auipc        s5, 486484
                  fmin.s       fa2, ft0, ft4
                  fmax.s       fa1, ft1, fs9
                  div          gp, t5, a4
                  slti         a3, a3, 21
                  sltiu        a7, s1, 770
                  div          t3, t1, tp
                  andi         s9, ra, 2041
                  flt.s        s1, fs6, fa7
                  mul          t5, s8, s6
                  fsqrt.s      fs0, ft4, rup
                  sra          t6, s7, gp
                  fsgnj.s      fs0, ft10, fs8
                  srl          t2, a4, s10
                  slti         t0, a1, 608
                  fsub.s       fs6, fs8, fs10, rne
                  divu         s10, a4, a6
                  sll          t6, t2, s6
                  auipc        t4, 1628
                  fdiv.s       fs3, ft4, fs5, rdn
                  slt          t0, a5, s4
                  flt.s        s5, fs0, fa3
                  divu         s7, s3, t1
                  srl          t6, s3, gp
                  fcvt.s.wu    ft10, t5
                  mulhsu       t3, t0, t5
                  fclass.s     t2, ft10
                  mulhu        s0, s9, s0
                  mulhu        s8, s6, s8
                  fsgnj.s      fa7, fs7, fs4
                  fdiv.s       fa2, ft2, fa0
                  divu         t4, a6, a2
                  mulhsu       gp, s7, a5
                  fsgnjn.s     fs8, fs9, ft6
                  divu         s7, s8, s2
                  fsgnjn.s     fs4, ft6, fa3
                  sll          a2, t1, zero
                  fmul.s       ft4, ft3, ft9, rtz
                  fmul.s       fa0, fs4, fs11
                  fclass.s     t3, fa1
                  xor          a4, t1, s7
                  fsgnjx.s     ft11, ft6, ft4
                  flt.s        s3, fs5, ft10
                  mulh         s0, s2, a2
                  remu         t3, a3, s9
                  fdiv.s       ft11, fs8, fs4
                  rem          sp, s9, tp
                  fmv.w.x      fa5, s5
                  and          ra, t6, s3
                  ori          s10, a2, -1373
                  fcvt.s.w     fa7, s0, rup
                  fdiv.s       ft4, ft11, fa0
                  flt.s        a2, fa4, fs10
                  or           s10, a2, zero
                  srli         zero, s3, 28
                  lui          s3, 204111
                  nop
                  fmul.s       fs7, ft3, ft3, rup
                  lui          s4, 591786
                  nop
                  slli         s11, s1, 20
                  fcvt.s.w     fs4, a0, rup
                  sub          zero, s7, a7
                  div          t2, a6, a0
                  div          ra, s8, zero
                  divu         s9, a4, t6
                  sll          tp, s1, s4
                  fcvt.s.wu    fs0, sp, rtz
                  slli         s1, t4, 24
                  fcvt.s.wu    fs10, s9, rup
                  fsgnjn.s     fa0, ft1, fs2
                  and          s1, t5, zero
                  rem          t3, ra, a6
                  fcvt.s.wu    fs2, zero, rne
                  sub          sp, s3, t3
                  and          s1, s4, a5
                  srai         t6, zero, 10
                  mulhu        s7, sp, s7
                  fmin.s       ft6, fs5, ft5
                  fsub.s       ft11, fs8, ft6
                  xor          a7, t4, s5
                  slti         sp, tp, 639
                  mul          t4, s5, t0
                  slti         s2, t1, -1431
                  or           a0, a7, a1
                  sltiu        a2, s7, 1880
                  fcvt.wu.s    tp, fs10, rdn
                  divu         s5, s9, t5
                  andi         s9, s8, 1361
                  mul          ra, t1, t0
                  srli         s1, s8, 4
                  slti         t2, t5, 826
                  fmax.s       fs4, fa1, fa0
                  feq.s        t6, fs0, ft10
                  auipc        s7, 699545
                  fmax.s       ft10, fa2, fs9
                  xori         s9, t3, 1655
                  fsqrt.s      fs2, fs7
                  lui          tp, 930048
                  ori          t5, s5, 1368
                  fcvt.s.wu    fa3, a3, rtz
                  fcvt.s.w     fs0, t0, rdn
                  fclass.s     s4, fs0
                  mulhu        s7, a3, s11
                  mulhu        s11, s2, t5
                  fsgnjx.s     ft1, fs9, ft3
                  divu         s9, t5, s3
                  sra          a2, a2, tp
                  slt          s8, t0, a4
                  srai         a0, t1, 9
                  lui          a4, 884349
                  lui          tp, 309579
                  fsgnjn.s     ft5, fs3, fa4
                  remu         s3, a1, t2
                  sub          s4, s7, tp
                  div          s11, sp, s1
                  lui          s3, 398164
                  fcvt.s.wu    ft1, zero, rmm
                  fmul.s       fs2, fs7, fa7
                  divu         s5, zero, s9
                  mulhsu       tp, s1, a7
                  fsgnjn.s     fa5, fs6, fa7
                  fclass.s     s7, ft7
                  srli         t4, t3, 30
                  srai         sp, a3, 8
                  srai         t3, t2, 29
                  fmax.s       fa5, ft0, fs2
                  sll          t3, t5, s10
                  srai         s3, s0, 9
                  slt          t3, tp, a7
                  add          tp, s4, s2
                  mulhsu       s3, t5, gp
                  remu         t4, a3, a5
                  fle.s        s11, ft0, ft7
                  mulhu        a4, s9, ra
                  fclass.s     t6, ft7
                  rem          t6, a7, a4
                  xor          s7, a1, t4
                  fsub.s       ft5, fs11, fa5, rdn
                  flt.s        t5, fa5, ft5
                  fsqrt.s      ft6, fa2, rup
                  srl          a2, s5, t3
                  auipc        a7, 27717
                  fcvt.wu.s    s11, fs10, rdn
                  fcvt.wu.s    s9, fs6
                  mul          s7, s2, a1
                  fsub.s       ft1, fs3, fs8
                  remu         t2, s8, a4
                  ori          t0, a2, 634
                  feq.s        s7, fs5, ft1
                  flt.s        s8, fs0, fs7
                  addi         t4, ra, 828
                  fmv.w.x      ft7, a2
                  fsub.s       fs5, fs8, ft2
                  fmv.x.w      a4, fs5
                  rem          s11, s11, s0
                  xori         s10, s3, 769
                  fadd.s       fs5, ft5, fa1, rtz
                  add          a1, a4, zero
                  srl          s11, s10, s6
                  slt          s9, gp, s7
                  lui          a1, 936153
                  fcvt.s.wu    fs3, s5, rmm
                  fcvt.wu.s    a7, fa0
                  fsgnjx.s     fs3, fa2, ft2
                  sltu         tp, ra, s11
                  slli         s2, t1, 26
                  slti         a5, a3, 676
                  fsub.s       ft10, ft2, fa4, rdn
                  fcvt.wu.s    a1, ft11, rtz
                  lui          t2, 975180
                  fcvt.w.s     ra, fa4
                  sra          a2, a3, a4
                  nop
                  div          s8, s11, gp
                  mulhsu       t2, s2, tp
                  fclass.s     s3, ft8
                  fsgnjx.s     fs1, fs8, fa6
                  addi         zero, a4, 1449
                  fmv.w.x      ft5, gp
                  sll          t2, t2, t4
                  fcvt.s.wu    fa2, s7
                  sltiu        a0, s6, 411
                  fclass.s     a5, ft4
                  fclass.s     t3, fs6
                  sltiu        a0, s7, -1224
                  rem          s11, a1, t0
                  fmul.s       fs2, ft3, fs9
                  fdiv.s       fs11, fs2, fa1, rdn
                  ori          s8, ra, -817
                  fmv.w.x      fa6, s6
                  fsqrt.s      ft11, fs11
                  divu         t2, a5, tp
                  sll          a1, a3, a7
                  lui          a1, 522576
                  fcvt.wu.s    sp, fs0, rup
                  fsgnjn.s     fs8, ft0, fa0
                  andi         s0, t0, -576
                  add          t4, t0, s10
                  fsgnjx.s     fs11, fs8, ft6
                  fsub.s       fs11, fs10, fa6, rup
                  fadd.s       ft9, ft1, fs8
                  nop
                  fsgnjx.s     fa2, fs4, fs6
                  and          t2, t3, s5
                  fmax.s       fa0, ft1, fs6
                  andi         a4, s1, -480
                  srli         t3, s0, 5
                  sub          zero, s2, t4
                  srli         t6, t3, 24
                  fsgnjx.s     fa4, fs9, ft4
                  mul          s1, s9, s10
                  mulhsu       tp, a1, sp
                  div          s8, s0, tp
                  srai         s0, t6, 31
                  feq.s        s3, ft0, fa6
                  sltu         t5, sp, a2
                  sltiu        a1, s9, 1263
                  andi         s8, a6, -493
                  flt.s        tp, fs0, fa4
                  fmin.s       ft7, ft1, fa2
                  lui          a7, 395969
                  fsqrt.s      fa3, fs7, rne
                  fmv.w.x      fa1, a3
                  flt.s        s9, fa0, ft0
                  sra          a0, s10, a6
                  fsgnjn.s     fs11, fs10, fs8
                  srl          t3, sp, t6
                  slt          a0, t0, s4
                  add          s2, a0, s8
                  fsqrt.s      fa0, ft1, rtz
                  andi         s8, sp, -525
                  div          s11, s7, s2
                  and          s5, s4, zero
                  remu         s7, a2, a3
                  and          t6, s10, s4
                  nop
                  fclass.s     a2, ft6
                  remu         s1, s3, t3
                  fcvt.s.wu    fa7, tp
                  lui          a0, 796928
                  fle.s        s8, ft3, fs3
                  rem          t5, s0, s3
                  slti         s11, s1, 413
                  fadd.s       ft1, fa6, fs9, rtz
                  or           ra, t6, s0
                  nop
                  xori         a3, s9, 1651
                  slti         gp, s8, -333
                  sltu         a7, s9, s4
                  sub          gp, s5, s10
                  fmin.s       ft11, fa6, fa7
                  mul          s0, a5, s7
                  xor          t0, s2, a6
                  sltu         a4, s8, s7
                  rem          ra, s2, s1
                  mulhsu       s10, s4, a5
                  srai         t4, s6, 1
                  auipc        a0, 425508
                  and          s5, s5, a7
                  fcvt.w.s     s7, fs5, rmm
                  fmax.s       fs11, fa2, fs11
                  div          s1, s2, a6
                  fsgnjn.s     fs10, ft9, fs5
                  addi         ra, t4, -608
                  feq.s        t3, ft5, ft1
                  fmv.w.x      fa0, t4
                  srl          t6, s11, s10
                  addi         a7, sp, 1563
                  sub          s10, t4, a4
                  and          a3, a4, s5
                  sltu         a5, a7, s11
                  srli         s3, s7, 25
                  fsgnj.s      fs9, fa3, fs10
                  sra          sp, t2, s0
                  auipc        gp, 273480
                  feq.s        s4, ft6, ft6
                  flt.s        s0, fs10, fs3
                  add          s10, a4, s9
                  xor          s10, s4, t1
                  fdiv.s       ft4, fa0, fs5
                  divu         t2, s7, s2
                  or           gp, s1, a1
                  addi         t3, a4, -498
                  xori         t3, a3, 950
                  divu         a1, t4, s9
                  fle.s        a4, ft3, ft10
                  srli         s4, s6, 19
                  srl          a1, a0, a1
                  fmul.s       ft5, fs8, fa3
                  fsgnj.s      ft1, ft3, ft6
                  fcvt.s.wu    fa1, s6
                  nop
                  divu         s5, s6, s1
                  sltiu        t0, a3, 1828
                  fmul.s       fa4, ft7, ft9, rup
                  fadd.s       fs7, ft2, fa3, rne
                  srl          t3, s5, s6
                  fsgnjn.s     fs8, ft6, fs8
                  fsgnj.s      fa1, fa1, fs9
                  slli         s11, t3, 9
                  sub          t3, s4, t5
                  srli         zero, ra, 28
                  mul          s8, s11, a7
                  addi         zero, t1, 1066
                  fmv.x.w      ra, fa3
                  fsgnjx.s     fs8, fs2, ft11
                  remu         a5, gp, t6
                  sltiu        sp, s2, -198
                  fdiv.s       fs11, fs2, fa1
                  addi         s0, s11, -1854
                  auipc        a3, 146652
                  remu         t5, a4, a7
                  div          a1, a7, s2
                  slt          a3, a3, s2
                  rem          t4, s4, s1
                  and          zero, a0, s2
                  mul          s4, s8, s5
                  slt          s2, sp, a1
                  fdiv.s       ft10, ft6, ft10
                  or           s7, t1, a4
                  srai         a5, s2, 1
                  slli         s4, t6, 29
                  fcvt.wu.s    s10, fa1
                  slti         t4, t6, -1998
                  andi         s11, a2, -445
                  flt.s        a4, fs6, fs2
                  fmul.s       fs10, fa0, fa5, rmm
                  addi         t4, tp, -1983
                  srli         s7, t1, 21
                  andi         s2, s6, -265
                  auipc        s0, 992744
                  fsgnj.s      fs4, fs9, fs4
                  slli         gp, a0, 23
                  sub          t0, t3, a3
                  fsgnjx.s     ft8, ft3, ft2
                  fcvt.wu.s    t3, fs3, rmm
                  mul          gp, a6, s10
                  fcvt.s.wu    ft1, gp, rmm
                  fmv.w.x      fa4, s1
                  mulhu        a1, a6, a7
                  fsqrt.s      fs10, ft11
                  fsgnjn.s     fs5, fs1, ft4
                  fclass.s     s0, fs9
                  lui          tp, 66783
                  sll          a4, sp, s9
                  and          t0, s1, s10
                  srli         a7, a0, 18
                  div          sp, s3, s0
                  div          t4, t4, zero
                  fle.s        zero, fs0, fa3
                  fsub.s       ft11, fs11, ft1, rtz
                  fsgnjn.s     ft6, ft4, fa2
                  fmax.s       fa3, fs0, fa0
                  sltu         a2, t0, sp
                  srl          s1, s11, t5
                  fle.s        tp, fa4, fs11
                  remu         a4, t6, t1
                  mulhsu       a5, s7, a2
                  sra          t2, s4, ra
                  add          s7, s6, s4
                  lui          s4, 107523
                  fmin.s       ft0, ft11, ft7
                  addi         s10, s11, -777
                  srai         t3, a0, 14
                  fsgnjn.s     ft3, fs4, fs9
                  lui          ra, 311973
                  fmv.w.x      fs7, s4
                  fcvt.s.w     fa1, s0
                  nop
                  sltiu        t2, a6, -1661
                  mulhsu       a0, s10, t5
                  fcvt.s.wu    ft0, s2
                  fcvt.s.wu    ft7, tp
                  andi         a4, tp, 1132
                  sll          t5, a2, s6
                  fmv.x.w      a3, fs6
                  fclass.s     s2, fa7
                  fclass.s     gp, fs11
                  fsgnjn.s     fs0, fs7, ft9
                  xor          s5, t0, a4
                  fclass.s     s3, fa3
                  srai         tp, t6, 29
                  fsub.s       ft11, fa1, fs0
                  fadd.s       fs7, fs7, fa5, rtz
                  andi         tp, a7, -652
                  divu         s5, a4, s3
                  mul          t5, t2, tp
                  mul          s5, sp, tp
                  nop
                  slli         s8, a4, 24
                  slli         s0, t5, 4
                  xori         t5, a4, -331
                  nop
                  rem          s8, a5, s5
                  fle.s        t2, fs3, fs1
                  slti         tp, a3, 1116
                  xor          s4, zero, sp
                  addi         t0, t0, 1391
                  andi         t0, s7, 1345
                  slli         t3, ra, 29
                  fadd.s       fs11, ft9, fs0, rmm
                  fsqrt.s      ft1, fs11
                  sra          s8, s7, a4
                  fmv.x.w      t2, ft4
                  xori         a7, ra, -1793
                  fsqrt.s      fa5, fs0
                  slti         a5, zero, 127
                  feq.s        t0, ft9, ft9
                  slt          s5, t3, s11
                  fcvt.s.w     ft1, t3, rdn
                  fcvt.w.s     a1, fa5
                  auipc        a3, 15980
                  or           gp, s3, s11
                  rem          a7, s8, a3
                  rem          a3, s6, t5
                  slli         t5, ra, 28
                  sltu         s9, s3, s6
                  slt          a2, t1, s1
                  mulhu        a1, zero, s8
                  flt.s        ra, ft10, fs0
                  fcvt.s.w     ft0, s5, rup
                  ori          s0, s6, 1161
                  feq.s        s4, ft1, fa5
                  fadd.s       ft7, ft10, fs3
                  div          tp, t0, gp
                  srl          a4, s4, s5
                  mulhsu       s5, t4, a2
                  mulhu        s11, s3, a2
                  sra          a3, t2, a0
                  sltiu        a7, tp, 350
                  srai         t0, gp, 6
                  ori          zero, t5, -1194
                  sltu         a5, s9, t4
                  sra          s0, a4, s2
                  ori          t0, s2, 472
                  and          t4, s10, a6
                  mulhsu       s10, a6, a0
                  slli         t6, s4, 26
                  mul          s4, s1, sp
                  fsub.s       ft9, fs7, fs11
                  fcvt.s.wu    ft11, t3, rne
                  fcvt.s.wu    fs0, tp, rup
                  xori         a0, s6, -980
                  fsgnjn.s     ft9, ft2, ft11
                  lui          t4, 842497
                  flt.s        s9, ft8, ft3
                  fmax.s       ft5, fa2, fs5
                  div          s7, s6, s1
                  and          t5, t5, a5
                  slti         a5, a6, -531
                  fcvt.s.w     ft10, s11, rup
                  sub          s0, t2, ra
                  fsqrt.s      fa0, fs8, rup
                  sub          gp, s3, s11
                  fcvt.w.s     a1, fa2, rdn
                  fsqrt.s      ft3, fs2, rne
                  fcvt.s.w     fa3, t5, rtz
                  fsgnjx.s     fs2, fs2, ft10
                  fsub.s       fa5, ft3, ft2
                  fcvt.s.w     fa4, s9
                  mulh         s9, sp, s4
                  fcvt.s.w     fs10, sp
                  sub          s9, s8, s11
                  xor          s3, s1, sp
                  sub          a5, a3, s0
                  slli         t0, s0, 25
                  fsgnjx.s     ft9, fs1, ft0
                  fmul.s       fa4, ft10, fa4, rmm
                  mul          a5, t5, a7
                  divu         s2, s1, s4
                  fmul.s       fs9, fs2, fa0, rtz
                  ori          s2, ra, 1225
                  or           sp, s7, a1
                  flt.s        gp, ft0, fa3
                  fmul.s       fs1, fs4, fs3
                  mulhsu       s8, s11, s1
                  mulhu        a0, t4, a5
                  sub          s11, s9, a7
                  fdiv.s       fa3, fs4, fs10
                  lui          s1, 1001782
                  fmv.x.w      t2, fs2
                  feq.s        zero, ft3, ft9
                  fdiv.s       ft11, ft10, fs7, rmm
                  fmin.s       ft8, fs6, ft8
                  slti         s10, a3, -1336
                  fmax.s       ft2, fs0, fa7
                  flt.s        s11, fa3, fs11
                  addi         a5, t5, -1748
                  auipc        s4, 97957
                  fcvt.w.s     a0, ft9, rdn
                  mulhu        t2, t5, s8
                  fcvt.wu.s    a3, ft7, rup
                  divu         t5, s2, sp
                  sra          tp, s7, t2
                  add          s3, a6, s11
                  xori         s4, a3, 92
                  fmv.w.x      fs4, a0
                  and          t5, s8, a2
                  div          s8, s5, s3
                  xor          t3, s8, tp
                  auipc        s4, 377490
                  fsub.s       fa6, fa3, ft0, rtz
                  fle.s        ra, ft0, ft11
                  sltu         s3, zero, s6
                  fmul.s       ft7, fs7, ft9
                  fle.s        a7, fs4, ft7
                  fsgnjx.s     fa6, fs11, fs3
                  fle.s        t4, fa2, fa6
                  add          gp, t6, s6
                  fclass.s     t6, fa7
                  ori          s4, s5, 139
                  fsgnjx.s     fa2, ft0, ft3
                  flt.s        a1, fs4, fs8
                  rem          s4, tp, s9
                  mulhsu       s1, t2, a1
                  and          sp, t6, t6
                  div          a7, a0, t1
                  flt.s        ra, ft3, fs7
                  divu         s1, a2, s11
                  fmv.x.w      sp, fa4
                  fclass.s     t2, ft5
                  mulhu        s1, a2, gp
                  addi         t3, s9, 2044
                  remu         gp, s6, s6
                  mulhu        t0, s6, gp
                  fcvt.s.w     ft11, a5
                  fcvt.s.w     fa0, a6, rne
                  fmul.s       ft5, fs4, ft5, rne
                  and          gp, s4, a2
                  slli         s5, sp, 19
                  fcvt.wu.s    ra, ft7, rtz
                  sub          t0, t0, s10
                  fcvt.w.s     t2, ft10
                  fmin.s       fs9, fs0, fs1
                  fsgnjn.s     fa5, ft6, fs3
                  lui          a1, 191549
                  fsub.s       fs11, ft11, ft9
                  fcvt.wu.s    s7, fs1
                  ori          t5, t1, -1129
                  mulh         sp, s9, t3
                  div          zero, s10, a3
                  xori         tp, t6, -1848
                  mulhu        s7, s5, s4
                  xor          a1, s5, s6
                  divu         s10, zero, s10
                  remu         t5, s5, gp
                  mulhu        s10, a4, t0
                  remu         s8, a5, t2
                  fmin.s       fs8, fs2, fs1
                  fmul.s       fs11, fa2, fs6
                  add          t0, t2, t2
                  fsgnj.s      fs6, ft5, fs5
                  lui          t3, 342539
                  fmv.x.w      s2, ft8
                  srl          a7, s6, t2
                  mulhsu       a7, t1, t1
                  fsgnj.s      ft10, fa2, fs6
                  div          t6, t3, s11
                  fcvt.w.s     s1, fa0
                  or           s10, t6, s7
                  fcvt.wu.s    s3, ft9
                  mulhsu       t4, ra, gp
                  andi         ra, a6, -855
                  fsub.s       fa4, fa3, ft10
                  fmin.s       fs5, fa0, ft2
                  fsub.s       fs0, fa3, ft1
                  sub          zero, gp, tp
                  srli         s11, tp, 1
                  rem          s1, sp, t1
                  slli         s0, gp, 29
                  fmin.s       fa1, ft5, ft5
                  slti         s0, s7, 1086
                  fmax.s       fs5, ft2, fa2
                  nop
                  fsgnj.s      ft10, fs10, fa0
                  fcvt.s.wu    ft5, s0, rmm
                  fadd.s       fs2, fa5, fa7, rmm
                  addi         s0, s9, 543
                  ori          t2, a7, -846
                  sra          s9, s7, a2
                  fmax.s       ft1, fs7, fs8
                  fsqrt.s      fs11, ft7
                  fsgnjn.s     fa5, ft1, fa0
                  xori         s9, a6, -1899
                  feq.s        s4, ft0, ft9
                  mulhu        t4, ra, t3
                  fcvt.s.w     ft6, gp, rmm
                  fadd.s       fs4, ft11, fa1, rne
                  feq.s        sp, fs4, ft5
                  fmin.s       fa2, ft11, fa4
                  add          s8, s3, s0
                  srli         a3, a6, 28
                  fmv.x.w      zero, ft9
                  fle.s        s1, ft2, fs0
                  fcvt.w.s     t2, fs4
                  slt          t3, a6, a0
                  add          s1, t1, a5
                  xori         gp, t5, 379
                  fsub.s       fa6, fa6, ft4
                  ori          s2, s9, -1614
                  fmin.s       fa6, ft0, fs2
                  fsgnjn.s     fs7, fs11, ft2
                  addi         s0, a3, -843
                  fcvt.w.s     t2, fa4
                  sra          sp, a7, s11
                  rem          a4, s2, a6
                  slli         s4, ra, 22
                  sltiu        s3, t1, 617
                  div          t0, s9, s5
                  addi         ra, s9, 92
                  fsgnjn.s     ft1, fa2, fa2
                  fsqrt.s      ft3, fs2, rtz
                  auipc        s8, 338117
                  srli         a4, s9, 2
                  auipc        s3, 927552
                  fle.s        s1, ft6, fs8
                  sltiu        s5, s5, -928
                  sltiu        t3, t2, 1716
                  fclass.s     a7, fs11
                  fdiv.s       ft10, fa0, fs2
                  sra          t5, t0, a7
                  fsqrt.s      fa5, fs11
                  slt          s3, t3, s3
                  fcvt.w.s     a7, fs5
                  fsgnjn.s     fs10, ft8, fs7
                  andi         s9, t4, -358
                  fadd.s       ft3, ft2, fs9
                  slli         s7, s6, 22
                  sub          t2, t1, a7
                  fcvt.s.w     ft9, t1
                  lui          gp, 912207
                  fsgnjn.s     fs11, fa4, fs11
                  mulhu        s4, t1, sp
                  fcvt.s.wu    fs10, a6
                  fadd.s       ft1, fs9, fa7
                  feq.s        sp, ft4, ft11
                  and          gp, t1, a5
                  sra          a2, ra, t0
                  fcvt.s.w     ft10, s1, rne
                  sll          t2, s10, ra
                  mulh         tp, t6, s9
                  slti         t4, a0, -304
                  fsgnjn.s     fa6, fs3, ft9
                  fmul.s       ft5, fa6, ft1
                  fle.s        s3, ft7, fs2
                  xori         t2, t6, -291
                  sra          t4, t4, s11
                  xori         gp, a2, 466
                  fsgnjx.s     ft10, ft4, ft10
                  sltu         t3, ra, t1
                  sub          s2, a5, s0
                  addi         t5, t1, 1586
                  fcvt.wu.s    s11, ft0, rdn
                  fcvt.s.w     fs3, t3
                  fmul.s       ft7, ft11, fa7
                  rem          a1, s4, s11
                  fsub.s       fa5, ft2, fs11
                  fcvt.s.wu    fa4, s3, rdn
                  fsqrt.s      fa7, ft1, rdn
                  or           s2, s6, s9
                  fadd.s       ft0, fs7, fa4
                  fclass.s     a0, ft7
                  fclass.s     a0, fa7
                  mulh         a2, s4, gp
                  remu         s9, t4, t0
                  fdiv.s       ft0, ft10, fs0, rmm
                  fmul.s       fs10, ft11, fs8
                  fsub.s       ft6, fs7, fa4, rup
                  feq.s        a4, ft2, ft2
                  sll          t2, t3, t4
                  fcvt.w.s     gp, fs11, rup
                  fclass.s     s0, fa5
                  add          ra, t4, t3
                  fmv.x.w      s3, ft3
                  flt.s        t3, ft9, fa4
                  fclass.s     s1, fs7
                  remu         s7, s8, s9
                  slt          a7, s1, t2
                  lui          s10, 979436
                  addi         s11, gp, -680
                  fmv.x.w      s9, fa5
                  fsqrt.s      ft8, ft4, rne
                  fdiv.s       fs6, fs0, fa2
                  mul          s10, s11, s11
                  srl          a1, ra, s10
                  add          s7, t5, s3
                  slli         gp, a3, 14
                  srai         a7, zero, 30
                  fcvt.s.w     fa0, s8, rmm
                  nop
                  remu         s11, a2, tp
                  sltiu        ra, gp, -363
                  fsqrt.s      fa1, fs7, rne
                  xori         s7, a4, 1164
                  sltu         a7, tp, s7
                  nop
                  nop
                  fadd.s       ft11, fs2, fa1, rmm
                  fdiv.s       ft6, fs4, fa4, rmm
                  fmv.w.x      ft1, t3
                  slli         s5, a2, 18
                  addi         t4, s1, 1215
                  fmin.s       fs0, fa1, fs2
                  fclass.s     gp, ft3
                  fcvt.s.w     fs9, a1, rdn
                  slt          a7, s1, a1
                  add          t3, s10, t1
                  add          s1, a3, s5
                  slt          a1, a6, s3
                  and          s0, s5, t2
                  div          a4, s7, a1
                  addi         s4, a1, -898
                  srli         a3, s0, 4
                  sltiu        s5, t4, 1303
                  sll          t6, s2, s10
                  srli         a0, t2, 20
                  fmv.w.x      fs7, s7
                  xor          s1, a0, s10
                  sub          s5, tp, t6
                  fmax.s       fs10, fa0, ft3
                  sltu         s4, s9, t2
                  ori          a4, t3, -874
                  slt          s1, a5, s2
                  fcvt.w.s     t0, fa3, rmm
                  slti         t5, t6, -171
                  fsgnj.s      fs3, fa1, fs0
                  fsgnj.s      fs4, fs4, ft7
                  mulhu        a0, t1, s4
                  andi         s7, s0, 1369
                  fcvt.w.s     t4, fs8, rup
                  slt          s4, ra, t4
                  fmv.w.x      ft5, s9
                  fmin.s       fs10, fa2, fs0
                  slli         s8, zero, 12
                  slt          a1, s4, s2
                  addi         a1, s5, -1048
                  lui          sp, 624018
                  addi         a2, gp, 540
                  mulhsu       sp, t2, sp
                  fdiv.s       fs7, fs1, fs9
                  xori         zero, tp, 132
                  mul          t5, s8, ra
                  fsgnj.s      ft11, ft0, ft11
                  fsqrt.s      fa4, ft3
                  fadd.s       fs5, fs10, ft6, rmm
                  xor          a0, a5, gp
                  sll          a3, a4, t1
                  fsgnjx.s     fa3, ft11, ft10
                  slli         t0, sp, 3
                  sub          s7, ra, a6
                  xor          s2, s10, t4
                  srli         s5, s6, 23
                  fmul.s       fs3, ft9, fa7
                  fmin.s       fs2, fs5, fs5
                  addi         s2, t0, -737
                  srli         a2, s11, 4
                  sltu         s11, s9, s3
                  sub          s10, a5, a2
                  srai         s3, s9, 10
                  srli         t6, s11, 25
                  flt.s        a2, fa2, fs2
                  fclass.s     s5, fs6
                  mul          s10, t5, s5
                  fadd.s       fa2, fs9, fs1, rmm
                  sub          t5, tp, a6
                  sll          t4, a1, a4
                  rem          s0, s0, zero
                  srai         s8, a7, 8
                  fsqrt.s      ft1, ft4
                  sll          t6, s0, s2
                  sll          s10, a0, s10
                  fadd.s       ft10, ft9, fa1, rup
                  slli         a4, tp, 7
                  fdiv.s       ft4, fs0, fs11, rmm
                  divu         a2, a3, t3
                  fcvt.s.wu    fs8, tp
                  fsgnj.s      fa2, fs7, fs9
                  fcvt.wu.s    s11, fs4, rdn
                  fdiv.s       fs5, fs9, fa1, rne
                  sltiu        s5, a7, -617
                  andi         s8, s4, -1987
                  fcvt.s.wu    fs1, sp, rtz
                  flt.s        s0, fs2, fa3
                  fmul.s       fa4, fs3, ft7, rdn
                  slt          t0, t2, t6
                  mulh         t5, t6, s10
                  addi         a3, s3, 1576
                  fcvt.s.w     fs4, tp, rdn
                  fcvt.s.wu    ft0, t4
                  fmax.s       fs0, fa7, fa1
                  mul          a0, s8, zero
                  lui          tp, 733378
                  fmv.w.x      fs5, s7
                  fcvt.wu.s    s8, fs7, rdn
                  andi         gp, s10, -155
                  or           a3, a2, s2
                  fdiv.s       fs11, ft0, fa4
                  sltu         s9, s6, s7
                  fmul.s       fa5, fs2, ft2
                  auipc        t6, 534252
                  fsgnj.s      ft4, fs10, fs1
                  fcvt.w.s     s4, ft10
                  mul          sp, zero, s7
                  slti         s9, s11, 76
                  srl          s5, s0, s10
                  and          s8, tp, t3
                  mulhu        s8, s8, a0
                  feq.s        s5, fa7, ft1
                  or           s10, t2, a1
                  fcvt.s.w     fa5, sp
                  mul          t5, a2, a3
                  slt          tp, a0, s0
                  or           a5, sp, tp
                  remu         s5, a5, zero
                  ori          s4, s1, -784
                  sltiu        t6, s7, 1542
                  flt.s        t0, fs2, fs10
                  ori          zero, t6, -934
                  mulh         s9, s4, s4
                  and          t5, s1, tp
                  mulh         s0, t6, tp
                  fmul.s       fa5, ft10, fa3, rup
                  fadd.s       fs6, fa3, fs4
                  fsqrt.s      fs11, fs11
                  divu         t4, ra, t1
                  sub          a3, s4, zero
                  andi         t5, t1, 1514
                  sltu         t4, a1, s5
                  fdiv.s       fa5, ft7, fs3, rne
                  ori          t4, s0, 982
                  fadd.s       fs5, fs5, ft1
                  fmax.s       ft6, ft1, ft0
                  nop
                  mulhu        s11, t2, zero
                  divu         s0, t1, s10
                  sll          t4, tp, t3
                  fsgnj.s      ft2, ft7, fa2
                  fmax.s       fs10, fa5, fa7
                  auipc        s8, 292360
                  div          a2, t2, s11
                  mul          t4, t0, a2
                  srli         t6, tp, 30
                  addi         s3, s9, -1269
                  rem          s4, gp, t5
                  fcvt.s.wu    ft1, s0
                  fcvt.s.w     fs10, s9
                  fmul.s       fa0, fs5, fs0
                  lui          s8, 557653
                  fmv.w.x      fa6, a4
                  srli         s5, s8, 0
                  remu         s8, a4, gp
                  andi         s1, a2, 667
                  fcvt.s.wu    ft0, s7
                  mulh         sp, s11, s2
                  fdiv.s       ft2, fs8, ft6
                  fmax.s       fs10, fa1, fs9
                  fsub.s       ft10, fa5, ft3, rne
                  fsgnj.s      fa6, ft7, fs9
                  mulh         s0, s7, a2
                  fmul.s       fa2, fs4, ft3, rtz
                  fmax.s       fs11, fa7, fs9
                  or           s9, t3, a1
                  flt.s        a0, ft4, fs5
                  div          a4, gp, t2
                  fmin.s       fa2, ft7, fa1
                  fcvt.s.wu    ft0, s8, rtz
                  addi         ra, ra, 1578
                  srl          a3, s6, s8
                  fadd.s       fa3, fa5, ft2, rmm
                  fsgnjx.s     fa3, fs1, ft3
                  ori          t3, s4, -520
                  srai         t2, t3, 6
                  lui          zero, 325809
                  mulh         a3, t3, s0
                  srai         a2, a6, 21
                  fsgnjx.s     fs6, fs8, fs2
                  add          t0, ra, s10
                  fadd.s       fa6, fa2, fs1, rdn
                  sll          s4, s10, s11
                  fmax.s       fs5, fa3, ft6
                  fadd.s       fs10, fs11, ft8, rmm
                  fsgnjn.s     fs11, fs4, ft10
                  mulh         s5, sp, a5
                  xori         t2, a0, 178
                  mul          a1, s9, s10
                  fadd.s       ft4, ft1, fa3, rne
                  fsub.s       fs1, fa1, fa4, rtz
                  fcvt.wu.s    sp, ft1
                  xori         t0, t2, 695
                  div          t0, s2, a1
                  mulh         sp, sp, tp
                  mulh         a0, s2, zero
                  srai         s7, t3, 5
                  flt.s        s10, fs10, fs3
                  fcvt.w.s     s2, ft5
                  fmax.s       fs7, ft0, fa3
                  mul          s4, t5, t2
                  lui          tp, 139696
                  add          s3, sp, s5
                  fsgnjx.s     fs11, ft11, fs4
                  mulhsu       s11, t0, s2
                  fsgnj.s      ft3, fs2, ft10
                  fsub.s       ft11, fs5, fs0
                  mulhsu       zero, s11, a1
                  fle.s        tp, fs9, ft7
                  fcvt.w.s     t5, fs10
                  or           t4, s4, a2
                  and          a5, ra, t5
                  fsqrt.s      ft6, fa4, rup
                  xori         t5, gp, -1499
                  sub          t5, a6, a7
                  sra          s7, a5, t0
                  flt.s        ra, ft9, ft3
                  andi         sp, gp, 1989
                  fsgnjx.s     fa0, ft3, ft11
                  remu         s4, tp, t1
                  fsub.s       fa4, ft10, fa4
                  mulhu        t4, s2, s10
                  fmin.s       fa2, fa5, ft9
                  fadd.s       ft2, ft2, fa4
                  sll          t4, s9, tp
                  fsqrt.s      fs10, ft11
                  ori          s3, sp, -445
                  fsqrt.s      ft4, fa6
                  fmin.s       fs1, ft6, ft0
                  slli         s10, s2, 8
                  sra          a0, t3, s6
                  and          s5, t2, gp
                  fsgnjn.s     fa1, fs11, ft0
                  srli         t0, a6, 19
                  fcvt.s.wu    ft0, s10
                  add          s7, s7, t4
                  sll          t0, zero, t2
                  auipc        s2, 619698
                  mulhsu       t4, t0, t3
                  lui          sp, 194419
                  fcvt.w.s     a5, ft3, rtz
                  mulhsu       s1, a4, a2
                  srl          s5, t0, tp
                  fmv.w.x      ft3, s2
                  fcvt.s.wu    fa5, t5, rtz
                  slti         a0, t1, -1291
                  rem          t3, sp, tp
                  fcvt.s.wu    fa2, s7, rne
                  fmin.s       fs11, fa5, fa1
                  nop
                  mulhsu       t2, zero, s11
                  ori          a5, a2, -985
                  fmul.s       fa5, fs0, ft7, rdn
                  remu         s1, a4, sp
                  srl          a4, a1, ra
                  addi         a5, s2, 2000
                  remu         a3, t1, sp
                  sltiu        a2, a4, 1033
                  divu         s4, t0, t5
                  ori          a0, t1, 1056
                  sub          a5, s2, s6
                  or           s7, a3, a4
                  fmv.x.w      a3, fs2
                  fcvt.w.s     gp, fs9
                  add          s1, a3, a5
                  fmv.w.x      fs0, s4
                  fmul.s       fa7, ft2, ft3
                  slt          sp, a1, gp
                  rem          s4, s5, s9
                  fclass.s     t6, ft11
                  fdiv.s       fs11, ft10, fa3
                  lui          s2, 792916
                  srli         a7, ra, 11
                  srl          s1, a6, s2
                  slli         a0, tp, 8
                  sub          a7, ra, s3
                  mulhsu       a2, a0, s6
                  fdiv.s       fs0, fs3, fs3
                  fmax.s       fs10, ft2, fs2
                  fle.s        a0, ft11, fs2
                  auipc        a5, 178888
                  mulh         s8, t6, s11
                  sltu         tp, s4, sp
                  nop
                  mulh         a7, s8, a5
                  fmin.s       fa4, fs3, fa3
                  fmin.s       fs0, fs4, fa6
                  fmin.s       ft3, ft8, fs4
                  fclass.s     a1, fa5
                  fsgnjx.s     ft5, ft5, ft3
                  fsgnj.s      fs4, fa0, ft11
                  flt.s        a4, fa3, ft11
                  auipc        s7, 821611
                  and          s0, a1, a3
                  nop
                  sltiu        s10, t2, 145
                  fsgnj.s      ft3, fa4, ft2
                  fmv.x.w      s1, ft10
                  add          a2, t2, t6
                  and          sp, a4, t6
                  auipc        s5, 188783
                  remu         s8, s1, a4
                  fmv.x.w      a7, ft5
                  srai         s5, t0, 22
                  mul          s3, a7, t3
                  srai         a4, s11, 21
                  lui          ra, 623852
                  div          t0, a2, s8
                  nop
                  feq.s        a5, fs8, fa0
                  divu         t6, tp, s6
                  fsqrt.s      ft1, fs6
                  mulh         s11, t4, a3
                  fadd.s       fa6, fa5, fs3
                  fcvt.w.s     s4, ft6, rne
                  fsgnjx.s     ft6, fs1, ft9
                  fdiv.s       fs8, ft0, ft8
                  fmul.s       fs8, fs9, fa0, rup
                  fsub.s       ft4, fs1, ft8, rne
                  fcvt.s.wu    ft5, s4, rtz
                  sltu         a4, a5, a3
                  fmax.s       fa7, ft2, ft0
                  fcvt.s.w     ft4, s0, rtz
                  fsgnjx.s     ft10, fs2, fs0
                  lui          s11, 674276
                  fdiv.s       fs11, fs7, ft1, rne
                  slli         t6, t0, 25
                  fsub.s       fs10, fs7, ft8
                  addi         s5, gp, -910
                  rem          s0, s1, s11
                  sub          zero, a2, s0
                  fle.s        t0, fa4, fa1
                  ori          a7, s2, 1560
                  fmul.s       ft2, fa5, ft0, rmm
                  add          a2, s8, a0
                  fmul.s       ft8, fa2, fs5, rmm
                  fclass.s     tp, ft10
                  fcvt.wu.s    t0, ft9
                  xor          t2, a4, s5
                  fcvt.s.w     fa4, a1, rmm
                  rem          a2, a6, a0
                  fsub.s       ft8, fs5, fa6
                  rem          s0, a1, s2
                  fclass.s     s10, ft2
                  fsgnjn.s     fs9, fa6, fa7
                  fsqrt.s      ft7, fs5, rup
                  div          t4, a6, a3
                  and          s4, s4, tp
                  slli         t0, gp, 27
                  slt          t2, a6, t5
                  fmul.s       ft7, fs3, ft11
                  fcvt.wu.s    tp, fs2, rtz
                  fclass.s     s4, fa7
                  sltiu        s7, s6, 1273
                  slt          s9, a5, t0
                  fsqrt.s      ft3, fs8, rmm
                  nop
                  mulhsu       t4, t2, sp
                  slli         a0, s3, 29
                  remu         t6, a6, s3
                  slti         sp, a7, 2017
                  addi         a0, a5, -1437
                  slti         s10, s8, 1754
                  fclass.s     s2, ft0
                  andi         t2, s11, -1270
                  auipc        zero, 742885
                  fmul.s       ft0, fs10, fa2
                  fcvt.s.w     fs2, s4
                  fdiv.s       fs3, ft9, fa0
                  fsgnjx.s     ft8, fa3, fa0
                  mul          s3, a0, a2
                  slt          s4, s1, s9
                  fcvt.w.s     a5, ft10, rup
                  sltiu        a3, zero, -1264
                  sltu         a7, s10, s1
                  fmul.s       fs6, ft4, ft6, rmm
                  fsgnjn.s     ft10, fs8, fa0
                  lui          sp, 1037578
                  nop
                  fcvt.s.wu    ft2, s0, rdn
                  fsgnj.s      fs9, fa7, fs5
                  fdiv.s       fa1, ft10, fs8, rmm
                  slti         t4, a1, -74
                  fle.s        zero, ft2, fs5
                  sltu         s2, s10, s1
                  add          s8, s6, t2
                  slli         t5, a7, 23
                  fmv.w.x      fa4, t0
                  fsub.s       ft7, ft9, fa4
                  remu         a0, a3, ra
                  add          s4, t5, t3
                  fsgnj.s      fs8, fa5, ft0
                  sub          sp, a6, t6
                  fmin.s       fs0, ft10, fs3
                  mulhu        s11, tp, t4
                  fle.s        s9, ft1, fa1
                  fcvt.s.w     fs0, t0
                  fcvt.s.w     fs2, a5
                  slli         a1, t3, 8
                  flt.s        tp, fs9, fa6
                  fle.s        zero, ft2, fs7
                  fmin.s       ft6, fa4, fa3
                  slli         t0, s1, 9
                  xori         a7, sp, 972
                  xori         t0, s10, 815
                  mul          s5, t4, ra
                  div          t3, a2, s1
                  flt.s        a1, fs3, fa2
                  mulhu        s5, s4, gp
                  fcvt.s.w     fs6, s10, rtz
                  xor          a5, zero, ra
                  sra          s2, s1, t0
                  addi         gp, a3, 967
                  div          t3, s8, s10
                  and          s7, gp, s5
                  mulhu        t6, tp, s2
                  feq.s        a2, ft7, fa3
                  remu         s8, t5, t6
                  mulhsu       s8, a1, s9
                  fmin.s       fs1, fs6, fa6
                  mul          sp, tp, gp
                  ori          a2, s3, -1539
                  ori          tp, sp, -22
                  fmax.s       fs5, ft7, fs9
                  slti         s9, s2, 1921
                  fadd.s       fa7, fs11, fs2
                  sltu         s1, s0, s1
                  sltiu        tp, a0, -627
                  mul          s11, a4, tp
                  srli         a1, a1, 6
                  fmv.x.w      t2, fa7
                  fmin.s       ft5, fa0, fa0
                  div          tp, a7, s1
                  mulhu        t2, t2, s0
                  mulh         sp, a5, t4
                  mulhsu       t5, ra, t6
                  auipc        t2, 336638
                  fcvt.s.w     fs0, s11
                  sra          s7, s0, a0
                  auipc        s0, 855339
                  and          tp, t2, t1
                  fmin.s       fs4, fa5, fa3
                  fcvt.s.w     fa0, s4
                  fcvt.w.s     s7, fa3, rup
                  fadd.s       fs0, ft3, fs6, rdn
                  fmin.s       fs1, fs0, fa7
                  fcvt.s.w     ft6, s5
                  fsgnj.s      fa1, fa4, fs3
                  srai         s4, s11, 5
                  div          a5, a5, tp
                  mulh         s1, a5, gp
                  fdiv.s       fa6, fa3, fs8, rne
                  remu         s1, a5, s8
                  addi         t4, tp, -1488
                  sltiu        sp, a6, 1216
                  sltiu        s1, a6, -336
                  fcvt.w.s     a5, fa5, rup
                  nop
                  fsgnjx.s     fa1, ft3, fs8
                  fle.s        s5, fs6, fs2
                  fmv.x.w      sp, ft3
                  fadd.s       fa6, fs1, fs6, rup
                  fcvt.wu.s    t3, fs11, rtz
                  slti         a0, a7, -556
                  andi         a7, t5, -1471
                  fdiv.s       fs4, ft0, fa6, rtz
                  fsgnjx.s     fs4, fs7, fa7
                  fsqrt.s      fs8, fa2
                  fcvt.wu.s    a4, ft7
                  fcvt.w.s     a1, ft3, rdn
                  fdiv.s       fs0, fa7, fa0, rmm
                  sltu         a5, s1, s5
                  fdiv.s       ft7, fs3, ft8
                  fmv.x.w      t2, fs6
                  fmv.x.w      a2, ft4
                  slli         t6, zero, 9
                  fsgnjn.s     ft2, fa4, ft6
                  nop
                  fle.s        s4, ft6, ft0
                  srl          s7, t2, s6
                  fsqrt.s      ft3, fa2
                  fsgnj.s      ft4, fs2, fa5
                  addi         s1, s9, 774
                  andi         s4, a1, -1744
                  divu         t5, s7, a0
                  fsqrt.s      ft8, ft10, rup
                  slli         t0, s3, 0
                  sll          a4, s1, s1
                  srai         s4, a7, 22
                  remu         s0, s0, zero
                  fcvt.w.s     a5, fs5
                  fmin.s       fa2, fs7, fa3
                  sra          s11, s9, sp
                  slti         s7, t3, 893
                  or           a4, t2, a2
                  mulhu        t3, a4, s1
                  sub          t2, zero, s8
                  sll          a7, a1, s6
                  auipc        s4, 345077
                  fmin.s       ft1, fa5, ft1
                  div          s4, s1, a5
                  fsgnjn.s     ft11, fs9, ft5
                  sll          s5, a4, gp
                  mul          t3, t5, s0
                  slti         a3, s0, 794
                  xor          a3, a6, a0
                  srl          ra, zero, ra
                  lui          a1, 475514
                  sll          s7, t6, a4
                  fsgnjn.s     ft10, fs9, fs5
                  rem          sp, s2, t3
                  fsgnj.s      fa7, fs4, fs3
                  add          a0, t6, t5
                  fmax.s       fs9, fa3, fs6
                  fadd.s       fs11, fa6, fs1
                  fsub.s       fa1, fs2, ft1, rmm
                  fcvt.w.s     zero, fa6
                  srai         s3, s5, 30
                  mulhu        t2, s3, t5
                  fcvt.s.w     ft9, s5, rdn
                  fsgnjx.s     ft7, ft4, fa2
                  fsgnjx.s     ft0, fa4, fs1
                  andi         ra, a5, 413
                  fsub.s       fs3, ft8, fa0
                  fcvt.wu.s    t2, ft10
                  srai         s5, tp, 16
                  lui          s11, 359561
                  srai         s8, a5, 13
                  add          s7, a5, t6
                  mulhu        s5, t1, s0
                  fclass.s     sp, ft8
                  fmv.x.w      a1, fs10
                  fmax.s       fs8, ft7, ft7
                  fmax.s       ft5, fa5, ft2
                  sub          a2, a6, s11
                  fsub.s       fs11, ft4, ft6, rup
                  slli         t6, s8, 31
                  fmul.s       fa7, fa7, fs2
                  andi         ra, a6, -231
                  slli         a0, t3, 0
                  mul          gp, s5, t4
                  nop
                  fmul.s       ft1, fs11, ft11
                  and          tp, t0, ra
                  flt.s        sp, ft0, fs0
                  sra          s3, a3, a7
                  div          zero, zero, t0
                  mul          s8, sp, s6
                  remu         s3, t5, s0
                  fsgnjn.s     fs9, fs7, fs1
                  addi         tp, t4, 495
                  feq.s        s7, fa2, fs1
                  fsgnjn.s     fs0, ft8, fs11
                  srl          a5, t5, s9
                  fle.s        s4, fs8, ft0
                  fcvt.s.w     ft6, a1
                  fcvt.w.s     s5, fs2
                  sra          s5, a1, a1
                  fadd.s       ft1, fs0, ft10, rne
                  sub          t3, gp, s9
                  fmv.w.x      ft3, a4
                  divu         t2, ra, s6
                  slt          s5, t6, t4
                  fdiv.s       ft5, ft3, fs2, rup
                  add          t3, tp, s2
                  slti         t3, s1, -168
                  slli         s7, tp, 3
                  addi         a7, a1, 414
                  and          s8, s8, s4
                  sltu         a2, gp, a7
                  divu         t6, s4, s3
                  auipc        t2, 606236
                  fadd.s       ft5, fs6, ft0, rmm
                  fcvt.w.s     a1, fa0, rdn
                  sltu         a3, a0, t4
                  slti         t0, s5, 973
                  fmul.s       fa3, fs7, ft3
                  fmv.w.x      fs6, s3
                  fdiv.s       fa7, ft11, fs11, rne
                  or           s0, a5, t3
                  fsub.s       ft7, fs0, ft11, rup
                  and          t4, s1, s1
                  fcvt.w.s     s0, fs4, rmm
                  fsgnjx.s     fa3, fa6, fa5
                  fsub.s       fa2, fs8, fa2
                  feq.s        t3, fs2, fs0
                  mul          ra, t2, a7
                  fadd.s       fs11, fs9, fa2
                  slt          t6, ra, a7
                  slli         t5, s10, 21
                  rem          a3, s8, sp
                  fmax.s       fa0, fs1, ft10
                  fcvt.s.w     fa6, t2
                  nop
                  srl          s1, a6, a7
                  fle.s        a7, ft11, ft4
                  sltu         s7, s6, t3
                  addi         s9, s4, 615
                  fsub.s       fs8, fs6, fs8, rdn
                  fsgnj.s      fa2, fs8, ft5
                  add          s11, t1, t6
                  fclass.s     tp, ft3
                  fmul.s       ft9, fs4, ft0
                  xor          a5, a4, a5
                  fsub.s       fs0, ft9, fa5, rup
                  rem          a7, t2, t4
                  fsub.s       fs3, fs9, fs1, rtz
                  lui          t5, 342495
                  fsgnjn.s     ft2, ft5, fa0
                  nop
                  fsub.s       ft0, ft3, fs3
                  fadd.s       ft9, ft3, fs9, rtz
                  xor          a5, a1, s6
                  feq.s        s5, fa1, fa1
                  fclass.s     s2, fs9
                  remu         a1, s3, a2
                  fsqrt.s      fs9, fs5, rne
                  fadd.s       fs8, ft7, ft7, rdn
                  fmv.w.x      ft2, s0
                  remu         gp, s0, s2
                  fclass.s     s5, fa1
                  fsgnjx.s     fs3, fs2, fa6
                  divu         s5, t0, ra
                  fmul.s       fs0, ft3, ft0
                  fcvt.w.s     a4, fs11
                  lui          t6, 1038907
                  feq.s        zero, ft2, ft10
                  and          t3, tp, t5
                  mul          a7, s2, s6
                  sltu         a1, a7, t0
                  lui          a3, 517756
                  fdiv.s       fs4, fs2, ft1, rmm
                  srai         s5, t4, 19
                  fclass.s     s11, fa6
                  auipc        s11, 978686
                  addi         t2, s4, -1904
                  fle.s        t0, fs11, ft2
                  slt          a2, s11, s0
                  auipc        a0, 22617
                  remu         zero, a4, t2
                  feq.s        t3, fa5, fs5
                  remu         s4, s4, t5
                  xor          t4, s0, s5
                  fsub.s       fs2, fs2, ft5
                  addi         t4, a0, -642
                  mulhu        sp, a3, s5
                  slli         sp, s8, 5
                  mulhu        a1, t6, a4
                  andi         gp, s4, 591
                  remu         t2, a3, s10
                  sll          s7, a1, a5
                  fmax.s       fs0, ft7, fs1
                  and          s5, t3, s1
                  fcvt.s.w     fs8, s10
                  fmv.x.w      gp, fa5
                  fcvt.wu.s    t6, fa1, rmm
                  fsgnjx.s     ft5, fa5, fs11
                  fcvt.s.w     fa2, s9
                  rem          tp, sp, gp
                  feq.s        s8, fa3, fa7
                  fmv.w.x      ft10, s3
                  fclass.s     a0, ft8
                  mulhsu       s7, s6, ra
                  fsgnjx.s     fa7, ft8, ft0
                  fsgnjx.s     fs9, fa5, ft4
                  fcvt.w.s     s10, ft6
                  xori         t5, t0, -1173
                  slt          s4, a5, s5
                  fclass.s     t4, fs10
                  lui          a0, 12686
                  sltiu        s0, sp, -890
                  divu         t0, tp, s1
                  sll          a3, s0, s7
                  fclass.s     sp, fs7
                  auipc        a7, 216722
                  fdiv.s       ft1, fa3, fa4, rtz
                  fmv.x.w      s11, ft6
                  srl          s1, zero, s9
                  rem          a5, s1, t4
                  fmax.s       fs7, ft0, ft1
                  remu         a5, t5, tp
                  and          a2, ra, t1
                  fadd.s       fs9, ft2, ft6, rmm
                  auipc        a1, 103535
                  slti         zero, s8, 1966
                  fmin.s       ft6, fs0, fa4
                  sra          sp, s3, s7
                  sltiu        tp, a5, -754
                  xori         s4, a4, -1365
                  flt.s        s9, fa5, ft9
                  lui          a2, 758609
                  fcvt.w.s     s2, fa3
                  fsgnjx.s     fa1, fa7, fs6
                  sll          a0, gp, s9
                  fsqrt.s      fs1, ft4, rup
                  ori          s10, s9, -1748
                  fmv.x.w      s9, ft0
                  flt.s        s4, fs1, ft1
                  xor          a1, t1, a0
                  feq.s        t5, fa4, fa2
                  auipc        t3, 367891
                  ori          s5, t5, -691
                  add          t4, gp, t3
                  fmax.s       ft9, ft4, fs9
                  fcvt.w.s     t0, ft5
                  fmax.s       ft0, ft10, fa2
                  auipc        t5, 96426
                  slti         s1, t3, -1808
                  fcvt.wu.s    a1, ft1, rmm
                  fcvt.s.w     fa5, zero, rdn
                  sll          t0, t5, s2
                  fcvt.wu.s    a1, fs2
                  fmv.x.w      s2, fs1
                  div          sp, s3, gp
                  slti         s9, a4, 1977
                  divu         t5, s0, s1
                  fcvt.wu.s    a5, ft1
                  srai         s7, gp, 15
                  xori         a0, s7, 1088
                  flt.s        sp, fa2, fs5
                  lui          s8, 143705
                  fle.s        t0, ft5, fa3
                  fle.s        sp, ft11, ft6
                  remu         sp, t5, a1
                  fsqrt.s      ft3, ft0
                  divu         gp, t4, s3
                  sll          a5, a7, s7
                  fmax.s       ft7, fs10, fa0
                  nop
                  sltiu        s2, s10, 663
                  andi         sp, t5, -236
                  sll          t0, s3, s9
                  fsgnjn.s     fs11, fa6, fs9
                  fmin.s       fa4, fs11, ft9
                  and          gp, a7, s10
                  fcvt.wu.s    t3, ft9
                  flt.s        a2, fs11, ft11
                  fmv.w.x      ft4, s2
                  div          zero, s5, s4
                  fmin.s       ft11, ft6, fs0
                  sltiu        s1, zero, -1920
                  fadd.s       fs0, ft4, ft11
                  addi         s0, a0, -984
                  flt.s        a5, fs1, ft0
                  fmin.s       ft2, ft11, ft5
                  fmin.s       fs1, ft9, ft3
                  fmv.x.w      a1, fs4
                  fsgnj.s      ft6, fa7, fs6
                  add          s4, s6, a5
                  fdiv.s       fs6, ft11, fs2, rtz
                  fsgnj.s      ft11, ft5, ft5
                  and          t4, a1, t3
                  andi         s9, tp, 478
                  fsgnjn.s     fs2, ft2, ft9
                  auipc        t6, 762270
                  fsgnj.s      fs10, fs7, fs6
                  srli         gp, s10, 14
                  slti         zero, s4, -540
                  sltu         gp, a0, t4
                  fadd.s       fs5, fs8, ft4
                  srai         t0, t2, 14
                  addi         a0, tp, -1807
                  auipc        s11, 1004256
                  fmv.x.w      s5, fs7
                  auipc        s4, 989377
                  fcvt.s.wu    fs6, t4
                  fmv.x.w      s8, fs1
                  fmul.s       ft8, fa0, ft7
                  xor          t2, a7, t3
                  fsub.s       ft9, ft4, fa3, rdn
                  fcvt.s.w     fs5, t2, rne
                  nop
                  sub          s10, a3, tp
                  mulhsu       s7, s9, s11
                  fcvt.wu.s    sp, ft0
                  fmv.x.w      a2, ft7
                  srai         t0, a2, 9
                  sra          sp, ra, t4
                  slt          a4, t1, t2
                  mulhsu       s11, a5, s5
                  fcvt.wu.s    tp, fs0
                  andi         t2, t3, -822
                  fmul.s       ft6, fs4, ft0, rtz
                  xori         s4, s7, 1775
                  fcvt.s.wu    fs6, t2
                  fsub.s       fs10, ft4, fs10, rdn
                  sltu         t6, s1, a2
                  ori          s10, a6, 1802
                  andi         s8, a5, 95
                  auipc        t5, 541251
                  sub          s2, a2, a6
                  fsgnj.s      fa2, ft6, ft11
                  srli         a2, t5, 1
                  feq.s        ra, fs3, fs6
                  fsgnjx.s     ft7, fs7, ft8
                  addi         t4, ra, -853
                  xor          s11, ra, s5
                  nop
                  sltu         s7, zero, a1
                  fmv.x.w      s3, ft0
                  fmax.s       fs2, fs2, ft8
                  feq.s        t2, fa5, fs0
                  sll          s5, t1, s6
                  fcvt.s.wu    ft6, s6, rup
                  fclass.s     s4, ft5
                  fmax.s       fa7, fs9, ft8
                  srai         a5, s8, 29
                  fcvt.w.s     s8, fa3, rmm
                  srl          ra, t1, ra
                  slti         s2, a6, 148
                  sltiu        a3, a3, -605
                  srai         a4, a6, 24
                  div          a7, s0, t6
                  remu         s5, a3, sp
                  mulh         a1, t2, t6
                  fsgnjn.s     fa4, fs6, fs0
                  flt.s        t3, ft2, fa3
                  and          a7, a3, s9
                  fcvt.s.wu    fs2, a4, rdn
                  div          s8, s7, sp
                  fmul.s       ft10, fs4, ft6
                  srli         a4, a7, 20
                  remu         s10, ra, t0
                  slli         s0, s8, 17
                  and          t3, t0, t0
                  lui          s4, 886766
                  ori          s7, a5, -80
                  fcvt.wu.s    s5, ft10, rdn
                  feq.s        s1, ft6, fa6
                  fmv.w.x      fs0, t2
                  fmul.s       fs4, fs7, fs6
                  andi         t3, a0, 423
                  flt.s        a5, fs10, fs7
                  ori          t2, s8, -1156
                  fcvt.w.s     a1, fs9
                  fle.s        s2, fs9, fa6
                  fsqrt.s      fa1, fs8
                  divu         a7, s1, zero
                  feq.s        s8, fa2, fa6
                  or           s10, s3, ra
                  mulh         s7, s9, t5
                  mul          gp, t4, a4
                  sltu         a4, zero, s6
                  slt          t6, s3, t3
                  mulh         s11, s8, t5
                  fadd.s       ft9, ft10, ft4
                  fcvt.s.w     fa5, t0, rup
                  fmv.w.x      fs7, s0
                  mulhsu       s10, s7, a1
                  mulhsu       t3, a5, a6
                  srli         a1, a1, 9
                  fsgnjx.s     ft5, fs4, fs8
                  fcvt.wu.s    sp, ft1
                  fsgnjx.s     ft2, ft8, fs6
                  srai         t2, s8, 1
                  rem          t3, a4, ra
                  fmul.s       ft9, fa7, fs0
                  auipc        a3, 582372
                  lui          t5, 954063
                  fsqrt.s      fa5, ft6, rdn
                  div          a4, a1, s4
                  slti         s1, s3, -1455
                  fsgnjx.s     fs6, ft11, ft6
                  srli         s7, s7, 30
                  and          t3, s5, t1
                  slti         s10, a7, 1182
                  srl          t3, tp, s6
                  sll          a4, sp, s7
                  fcvt.w.s     zero, fs0
                  flt.s        s3, ft3, fs4
                  slti         s1, s1, -1256
                  fcvt.s.w     fa2, s6, rmm
                  fsgnjx.s     ft10, fs5, fs6
                  divu         a4, t6, a5
                  srli         a1, a0, 20
                  mul          s4, s3, t0
                  fcvt.s.w     fs8, a6, rne
                  nop
                  div          sp, gp, a3
                  mulh         t0, gp, zero
                  xori         a3, a6, 1116
                  slti         s5, a3, -1473
                  addi         a7, a3, -775
                  fsqrt.s      ft5, fs11
                  fcvt.s.w     fa0, s4
                  fmv.w.x      fa3, s5
                  fadd.s       fs11, fs9, fa7, rtz
                  fsgnjn.s     fs10, ft2, fs1
                  lui          t4, 739179
                  sra          a3, s6, s5
                  fmv.w.x      fs9, t2
                  fmv.x.w      s3, fs1
                  fcvt.w.s     t6, fa2
                  rem          ra, t1, t1
                  fmin.s       ft2, ft10, ft0
                  sub          a1, a6, ra
                  lui          s10, 622402
                  nop
                  fsqrt.s      fs11, fs1, rne
                  ori          s7, s7, 364
                  srl          a5, a2, s6
                  fsgnj.s      fa3, fs0, fa0
                  sub          a5, s7, gp
                  add          t6, t0, a2
                  srai         a5, t6, 22
                  div          sp, s2, s3
                  xor          s4, a2, s6
                  fdiv.s       ft0, ft6, ft11, rmm
                  mulhu        tp, t3, tp
                  fdiv.s       fa3, fa4, fs1, rne
                  fcvt.s.w     fs10, sp
                  fcvt.w.s     t5, ft9
                  auipc        a7, 141672
                  srai         t4, s4, 7
                  slli         zero, s11, 17
                  fcvt.s.wu    fs7, t0
                  nop
                  fsgnjn.s     fa6, fs10, fs1
                  fsgnjn.s     fs11, ft5, fs0
                  fclass.s     zero, fs10
                  div          a7, s4, gp
                  xor          a2, s0, t3
                  sltiu        tp, s8, 153
                  slt          s1, t3, a0
                  xori         a2, s11, -902
                  sll          t2, ra, t2
                  sltiu        sp, s11, -1056
                  slti         s0, t6, -1616
                  fadd.s       fs9, fs5, ft9, rtz
                  fcvt.w.s     a1, fs0
                  fcvt.wu.s    s7, ft11, rne
                  mulhu        a7, s2, t1
                  mulhu        zero, t1, sp
                  lui          s2, 202209
                  or           t5, a0, t1
                  fmax.s       fs5, ft2, fs1
                  fcvt.s.wu    fa4, s0
                  sltu         s2, a4, s3
                  fclass.s     a5, ft1
                  lui          s2, 410872
                  xor          a0, t1, s6
                  fadd.s       ft9, ft6, fs11
                  fsgnj.s      ft9, ft1, fs11
                  fcvt.s.w     fa2, a7
                  slli         s11, sp, 14
                  fdiv.s       fa1, ft7, fa5, rup
                  ori          s11, a7, 1534
                  addi         a0, s8, -1128
                  sra          s4, t3, sp
                  fmv.w.x      ft2, s8
                  div          a5, s8, sp
                  slt          t0, tp, s5
                  fcvt.s.wu    ft9, a0
                  fsgnjn.s     fs2, ft2, fs10
                  srl          a7, s6, s9
                  fmax.s       fs8, fs5, ft4
                  fsgnjx.s     fs11, fs6, ft0
                  ori          gp, a5, 1140
                  fdiv.s       fa1, ft1, ft9, rdn
                  srl          s8, s0, s5
                  xori         a7, a0, -1241
                  fmul.s       ft3, fs5, ft4, rmm
                  fcvt.s.w     ft2, s11, rmm
                  sltiu        a5, t6, -1031
                  divu         s5, a2, a7
                  fsgnjn.s     fa1, fs7, ft0
                  auipc        a4, 43546
                  fclass.s     a1, fa6
                  and          a2, s2, s5
                  fsqrt.s      fa1, ft7, rne
                  mulhu        ra, a5, t0
                  fsgnjx.s     fa6, fs8, fa1
                  feq.s        a5, fa2, ft8
                  flt.s        t2, fa3, ft8
                  mul          a2, t0, t2
                  fadd.s       fs3, ft2, fs6
                  and          sp, a3, s2
                  fdiv.s       fs0, fs7, fa4, rdn
                  fclass.s     s1, fa7
                  mulh         s3, a0, t0
                  slli         a5, t4, 13
                  fmv.x.w      t3, fa1
                  sltu         tp, t6, a1
                  slti         s11, t4, 1437
                  fsub.s       fs2, fa2, ft11, rdn
                  sra          a7, a7, s0
                  fmul.s       fa0, fa2, fs10
                  sll          a1, t2, a4
                  fclass.s     s8, fs3
                  xori         s0, s8, -842
                  fdiv.s       fs6, ft3, fs9
                  fmin.s       fa3, fs6, fa0
                  mul          s5, s1, s6
                  sltiu        t6, a2, 729
                  ori          t6, s7, 539
                  mulhu        s9, s3, gp
                  auipc        t0, 823855
                  fadd.s       fs3, ft1, ft7
                  or           a3, s11, s11
                  xor          s8, t4, tp
                  xori         t2, tp, -1877
                  fcvt.s.w     ft3, a3
                  fcvt.wu.s    t0, fs9
                  ori          s9, a0, 641
                  fmv.w.x      ft6, zero
                  and          gp, s8, a4
                  slti         a2, s7, 1942
                  fadd.s       fa0, fs0, ft5
                  fmax.s       ft7, fs9, fs4
                  mulhu        a5, ra, s8
                  add          zero, a4, a5
                  feq.s        s5, ft7, ft0
                  xori         t5, a3, 879
                  fcvt.s.w     fs4, a0
                  fdiv.s       fa0, fs10, fa4, rne
                  mulhu        a1, t1, a3
                  mulh         s4, ra, s8
                  fmul.s       ft8, ft1, fa0
                  mul          a4, ra, a7
                  remu         zero, a4, ra
                  add          tp, gp, t2
                  mulhu        t5, s11, s2
                  slli         sp, a6, 24
                  sra          s3, sp, s4
                  fmin.s       ft6, ft8, fs3
                  fclass.s     t2, fs8
                  fmax.s       fs6, fs0, fs2
                  xori         tp, gp, -1042
                  fcvt.w.s     a4, fa1, rmm
                  fsqrt.s      fs2, ft6, rdn
                  fdiv.s       fa5, ft8, fa0, rdn
                  nop
                  fsgnjn.s     fs8, ft9, fa4
                  fmul.s       fa3, ft4, fs5
                  srl          ra, a3, a7
                  fle.s        s0, fa5, ft0
                  div          gp, ra, s1
                  fmax.s       fs7, fa3, fs3
                  remu         a7, t4, gp
                  slt          a0, s9, s8
                  sltiu        a4, s5, -113
                  mulhsu       a7, s3, s11
                  fclass.s     s7, fs5
                  remu         a0, s2, a3
                  mulhsu       a1, s8, t1
                  mulhsu       a0, t1, s5
                  fcvt.s.w     ft3, a7, rne
                  slti         s1, s1, 1457
                  sltiu        s0, a0, 1967
                  add          s10, s7, s5
                  fle.s        s11, ft11, ft9
                  and          tp, a4, t3
                  mul          s10, t1, t5
                  fsgnjx.s     fs11, ft5, ft10
                  fmul.s       fa2, fa2, ft10, rtz
                  auipc        s4, 99305
                  nop
                  and          s5, zero, zero
                  rem          s8, a4, t5
                  fsqrt.s      ft1, fs7
                  fclass.s     a7, fs1
                  mulhu        s2, a6, s5
                  fle.s        a4, ft10, fs8
                  fcvt.w.s     s7, fs7
                  fmv.x.w      a4, fs9
                  fcvt.w.s     a7, fs7
                  sub          t4, a2, ra
                  sltiu        t5, s9, -1470
                  fsgnjn.s     fa2, fs0, fs10
                  lui          s4, 93447
                  sub          t0, t4, s0
                  div          t3, ra, s8
                  mulhu        s0, a3, s9
                  divu         s10, s7, s4
                  div          s10, s3, a6
                  divu         t0, sp, ra
                  mul          t5, t4, tp
                  mulhsu       s3, s1, a7
                  fclass.s     t0, fs4
                  add          a7, ra, s5
                  fmv.w.x      fs8, a4
                  fle.s        s11, ft5, ft9
                  fsub.s       fs1, ft6, fs11, rdn
                  fcvt.s.w     ft11, a7
                  and          s9, a6, ra
                  andi         t2, a1, 842
                  div          a7, a7, a3
                  xori         a1, tp, 1368
                  and          s8, a4, s5
                  fdiv.s       ft5, fa1, fs9
                  auipc        zero, 673959
                  mulhsu       t3, s3, t1
                  slti         s0, t6, 75
                  fmul.s       ft4, fs5, fa1, rdn
                  fmul.s       fa6, ft4, fs6, rdn
                  flt.s        a0, ft1, fs6
                  slli         s0, s9, 10
                  fsgnjx.s     fa2, ft2, fs9
                  fsub.s       fs11, fa1, fs3
                  andi         s9, s1, 1019
                  fmax.s       ft8, fs6, fs3
                  sll          s2, zero, zero
                  srl          s3, s6, a7
                  mulh         t3, s7, zero
                  fcvt.s.w     fa4, s5, rtz
                  fmv.w.x      ft4, s0
                  and          gp, zero, zero
                  lui          t4, 747248
                  slli         s9, a7, 6
                  feq.s        s9, fs6, ft9
                  div          s2, s3, t1
                  fmul.s       ft10, fs2, fa5
                  mul          a5, a6, s4
                  mulh         s10, s10, s1
                  fclass.s     s3, fs0
                  slli         s3, s11, 27
                  addi         t4, a6, 268
                  fsgnj.s      fs7, ft6, ft6
                  andi         gp, t0, 889
                  fcvt.s.w     fs7, t4, rtz
                  fsgnj.s      fs7, fs11, ft9
                  sltiu        zero, t0, -17
                  remu         s1, t5, tp
                  sltu         s2, s6, s5
                  mulhu        s11, s9, s0
                  fsgnj.s      fs6, fs0, fa3
                  fsub.s       fs3, ft4, fs4, rdn
                  lui          s2, 541111
                  sltiu        a3, t6, 1343
                  fsgnjn.s     fa4, fs7, fa1
                  and          s4, s3, s0
                  lui          tp, 94994
                  andi         s2, a1, 551
                  mulhu        zero, s2, a0
                  fcvt.w.s     a7, ft8, rtz
                  mulh         s8, a2, s4
                  sltiu        gp, zero, 236
                  fmin.s       fs2, fs4, ft8
                  ori          s0, s4, -725
                  fsub.s       fa4, fs10, fs0
                  add          a5, s7, t0
                  sltiu        t3, a1, -88
                  remu         a2, s1, s3
                  fmax.s       fs5, fa2, ft7
                  feq.s        t5, ft10, fs0
                  srli         t6, s1, 17
                  auipc        t5, 363644
                  sra          s4, s9, s8
                  fsqrt.s      fs1, ft10, rdn
                  sub          t3, a0, a6
                  fle.s        a7, ft9, fs9
                  auipc        zero, 635679
                  fcvt.wu.s    s4, fs10, rup
                  slli         zero, sp, 9
                  sub          s3, s10, ra
                  fsqrt.s      fa7, fs9
                  fcvt.wu.s    ra, fs11, rmm
                  fcvt.w.s     a3, fa5, rdn
                  fadd.s       fs9, fa3, ft7
                  fsgnjn.s     ft8, fs4, ft4
                  nop
                  feq.s        a3, fs6, fs1
                  mulh         s2, s8, t3
                  fsgnj.s      fa3, fa3, ft7
                  slli         t6, s4, 25
                  mulhsu       s8, s8, s7
                  srl          gp, s1, t6
                  div          t3, t4, s1
                  sra          t6, t1, s0
                  sltiu        t6, s8, 1785
                  fsgnjn.s     ft8, ft7, fa2
                  fmv.x.w      s3, fs1
                  mulhsu       t2, sp, t5
                  and          s3, s7, t4
                  slli         tp, s4, 2
                  fcvt.s.wu    fa2, s7, rup
                  feq.s        s3, fs2, ft8
                  remu         a4, t6, t1
                  fcvt.s.wu    fs3, a1
                  mul          a0, t5, t4
                  fcvt.s.w     fa6, s0
                  add          s10, a6, t2
                  mulhu        gp, zero, s10
                  slli         t3, a2, 8
                  slti         s7, s7, -477
                  fcvt.s.wu    fa3, s0
                  ori          sp, a1, 648
                  slli         t5, t2, 6
                  fsgnj.s      ft0, fa4, fs11
                  fcvt.w.s     t5, fa0
                  xori         t6, s0, -1762
                  or           s4, t4, s8
                  fsub.s       ft5, fa2, fs4
                  fcvt.w.s     s7, fa7, rtz
                  fcvt.s.wu    ft10, s3
                  fsub.s       ft6, ft6, fa3
                  slli         ra, s7, 10
                  feq.s        s8, fa1, ft11
                  fcvt.wu.s    s11, fa6, rdn
                  fsgnjn.s     fs10, ft11, ft4
                  srli         s2, a3, 12
                  divu         sp, gp, s2
                  fcvt.wu.s    ra, ft10
                  sltu         s0, a3, a5
                  addi         zero, s4, -1736
                  flt.s        a0, fs5, fs4
                  mul          t2, s9, s4
                  fsgnjn.s     ft5, fa7, ft8
                  fsgnjn.s     fa3, ft10, fs3
                  nop
                  fadd.s       fs11, fs5, ft1
                  xori         s4, a0, 1421
                  slt          s8, s7, zero
                  fmul.s       fs11, fs5, ft2
                  fmv.w.x      fa2, ra
                  flt.s        sp, ft2, ft3
                  mulhu        s9, s6, s0
                  fmv.x.w      sp, fa3
                  nop
                  nop
                  fle.s        zero, fs8, fs0
                  ori          ra, a2, -619
                  fmul.s       fs2, ft11, fs2, rmm
                  fmul.s       ft7, ft8, fs3, rtz
                  fclass.s     a4, fs2
                  fmin.s       ft10, ft8, fs7
                  mulh         a0, a1, a6
                  lui          t4, 96904
                  mulhu        sp, s8, a3
                  slli         s0, zero, 25
                  fsgnjx.s     fa6, fa7, fs6
                  fmax.s       fs4, ft0, fa0
                  fmv.w.x      ft6, s1
                  xor          ra, s4, s2
                  fclass.s     s0, ft0
                  addi         t6, t4, -1901
                  sltu         s3, a7, s3
                  auipc        s2, 620346
                  sub          t5, gp, a0
                  fsgnjx.s     ft10, fs9, fa5
                  fadd.s       fs0, fs6, fs11
                  fclass.s     tp, ft11
                  srai         t5, a6, 31
                  sra          s1, s9, a1
                  ori          a5, s5, 842
                  slti         sp, t4, 443
                  mulh         t3, s9, t6
                  fcvt.w.s     zero, ft5
                  fmul.s       ft2, fs11, ft4
                  fmul.s       ft4, fa3, fa2, rmm
                  mulhu        s3, a7, s9
                  fmv.x.w      a4, ft11
                  fcvt.s.wu    fs6, t2, rtz
                  mul          s8, ra, s5
                  slt          a1, gp, s10
                  sltiu        a5, s3, -1044
                  xor          t0, t3, s5
                  fle.s        a3, fs11, ft10
                  fmax.s       fa7, fs10, fs10
                  mulhu        t3, a2, s5
                  xori         sp, t1, 1300
                  ori          sp, s3, -1381
                  sub          a1, sp, s1
                  xori         s0, zero, 258
                  rem          t6, a6, s9
                  fclass.s     a5, ft2
                  mul          s10, t4, tp
                  slti         s8, s8, 1088
                  nop
                  lui          s4, 966015
                  sltu         t0, t4, a6
                  mulh         a7, s4, a6
                  feq.s        a5, ft1, ft3
                  sltiu        a0, t2, 602
                  feq.s        a1, fa3, fa7
                  slli         a4, a0, 25
                  xori         sp, t1, 1714
                  xor          t4, tp, a2
                  fclass.s     t4, fa0
                  fcvt.s.wu    ft11, ra
                  div          s3, t4, s7
                  fcvt.s.w     fs11, zero
                  slli         ra, s5, 12
                  fcvt.s.w     fs11, zero
                  fsqrt.s      fs4, ft2, rtz
                  mulhu        s4, t6, t6
                  mulhsu       s0, s8, t1
                  flt.s        s9, fs2, fs11
                  mulh         a3, zero, s5
                  nop
                  fsqrt.s      ft0, fs7
                  andi         t4, s0, -1522
                  slli         t6, a3, 15
                  slti         s0, a3, -1427
                  slli         t4, a7, 31
                  srli         a5, a0, 5
                  rem          a5, a0, s0
                  fcvt.s.wu    fs11, s11, rup
                  ori          a3, s0, 1858
                  fcvt.s.w     ft11, a0
                  mul          gp, a0, t6
                  and          a1, a3, a1
                  srai         a1, t6, 25
                  srli         a1, t2, 5
                  srl          s10, ra, t1
                  fmax.s       fs3, fs7, ft11
                  mulhu        zero, s3, s7
                  slti         a1, s2, 663
                  or           t3, tp, sp
                  or           gp, a2, t5
                  fsub.s       fs8, fs4, fa5
                  fsgnjx.s     fa7, ft7, ft6
                  fsub.s       fs3, ft8, fs3
                  srl          a2, s5, zero
                  srl          gp, a2, t5
                  sltiu        gp, t3, 993
                  fmv.x.w      gp, fa5
                  sltu         t2, s9, t2
                  mul          s2, s8, a6
                  or           s11, t4, s5
                  remu         ra, tp, t0
                  divu         a3, a1, s11
                  rem          a3, s1, t0
                  divu         t6, tp, t1
                  mulh         t0, t2, s8
                  fcvt.w.s     s10, fa1, rdn
                  sltu         t3, s11, s8
                  mulhsu       t3, s1, s9
                  srai         a5, t6, 17
                  xori         gp, a3, 1697
                  srai         s10, zero, 22
                  fsgnjn.s     fs9, fs3, fs11
                  fsgnjn.s     fs8, fs4, ft1
                  srli         t4, a2, 14
                  slt          a1, t3, s10
                  fcvt.wu.s    s0, ft6
                  fadd.s       fa4, fs10, fs3, rne
                  mulhsu       s10, t1, s8
                  srli         s2, s6, 6
                  fle.s        t6, ft6, fs11
                  sub          gp, s1, t1
                  fcvt.wu.s    s4, fa2, rdn
                  fmul.s       fa2, fs11, ft5, rup
                  flt.s        zero, fa0, fs5
                  auipc        t2, 530370
                  ori          s2, t0, 82
                  xori         t2, s6, 213
                  fadd.s       ft11, ft4, ft1, rne
                  mul          zero, s9, t2
                  mulh         a1, a3, s4
                  fclass.s     s10, ft2
                  sra          s11, a1, s6
                  fsgnjx.s     fs9, fs10, ft3
                  mulh         s11, s0, s11
                  slti         s9, s2, 294
                  fsgnj.s      ft7, fa4, fa1
                  fdiv.s       fa7, ft11, fs8, rup
                  fmin.s       fs7, ft1, fs6
                  fmul.s       fs5, fa1, fs5, rmm
                  flt.s        t2, ft1, fs7
                  remu         s8, sp, a0
                  andi         t2, a6, -2032
                  remu         tp, s1, a0
                  xor          t6, a4, tp
                  addi         ra, t1, 2028
                  fsub.s       ft7, ft11, fs5, rmm
                  div          t6, t1, s10
                  fadd.s       ft11, ft11, ft8, rne
                  fmin.s       fa4, ft11, fs1
                  sltu         a2, s10, ra
                  fcvt.w.s     t3, fs3
                  sltu         t3, a2, a6
                  mulhsu       t2, s2, t1
                  or           s5, s10, s11
                  nop
                  andi         a2, a1, 1693
                  sll          a1, t3, s7
                  sll          s1, tp, a7
                  fmul.s       fs7, fs1, fs4
                  srli         gp, a1, 6
                  srl          s3, s7, a2
                  mulh         tp, sp, t3
                  srl          t4, s9, t1
                  fcvt.wu.s    a4, fa4, rtz
                  auipc        s11, 913472
                  ori          a2, s3, 604
                  sltiu        gp, s3, -474
                  fsgnj.s      fs0, fs7, fs11
                  fsgnjx.s     fs0, ft11, fa1
                  fsgnj.s      fa1, fs0, ft10
                  auipc        t5, 855746
                  fcvt.wu.s    tp, ft11
                  slt          s8, a1, s7
                  fle.s        zero, fs3, fs8
                  fadd.s       ft3, fs4, ft10
                  sub          tp, t1, zero
                  slli         s1, t6, 1
                  fmv.x.w      t5, fs7
                  feq.s        s4, fa2, ft6
                  sltiu        t3, t4, -290
                  fsgnjn.s     ft3, fs5, fs1
                  divu         a1, t5, t0
                  sub          s10, a5, a7
                  fcvt.wu.s    s0, fs4
                  fsub.s       fs7, fs1, ft11, rup
                  sra          t0, sp, s4
                  sltiu        s10, s6, 771
                  flt.s        sp, fs6, fs11
                  rem          s11, a7, s3
                  fsgnjx.s     fs0, ft4, ft3
                  fcvt.s.wu    fa0, s11, rne
                  fcvt.s.wu    fa0, s11
                  fsgnj.s      ft7, fa3, fa0
                  mulhsu       a2, ra, ra
                  andi         a4, tp, -79
                  srai         s5, s4, 16
                  fcvt.wu.s    s9, fa4, rdn
                  addi         s1, t5, 772
                  mul          t4, s4, a4
                  fmax.s       fs0, ft2, fa6
                  sltiu        s1, ra, 1395
                  feq.s        sp, ft0, ft2
                  sub          t0, s10, s7
                  srli         s9, s9, 25
                  nop
                  or           tp, zero, t2
                  fmin.s       fs5, fa0, fs10
                  fsqrt.s      fs5, fs6
                  fsqrt.s      ft3, fa7
                  fdiv.s       ft0, fa0, fa3, rmm
                  mulh         a3, t6, s0
                  remu         s0, s9, a3
                  fmax.s       fs11, fa2, ft8
                  andi         a5, t6, -921
                  mulhsu       s10, gp, a3
                  fsub.s       fs0, fa5, fa1, rmm
                  mulhu        s9, a0, a5
                  fle.s        s9, fs2, fa6
                  fsgnjn.s     ft3, ft9, fs0
                  divu         t0, a4, a6
                  mulhsu       s10, s1, a1
                  sra          s7, s3, t2
                  fmax.s       fa4, fs9, ft5
                  div          ra, s0, a2
                  sll          s5, s8, a2
                  mul          t0, zero, s2
                  xori         zero, t2, -235
                  or           s2, t1, a5
                  fmax.s       fa0, ft6, fs10
                  flt.s        zero, fa3, fs1
                  slt          t4, s6, t5
                  srli         a2, t1, 16
                  andi         s8, s6, -1431
                  mulhu        s2, s5, t1
                  fmul.s       fs1, fs2, fs10
                  srl          t5, t2, sp
                  srl          s8, s9, a6
                  fsgnjn.s     fa2, fs3, fs5
                  andi         s11, s7, 899
                  srai         a3, s11, 21
                  fcvt.wu.s    tp, fs1, rdn
                  flt.s        s5, fa5, ft6
                  fmax.s       fs10, fa7, ft2
                  feq.s        t4, fs3, fa3
                  auipc        gp, 191866
                  sltiu        s7, s1, -664
                  auipc        ra, 1018470
                  or           s5, t2, a5
                  fadd.s       fa4, fs0, fa1
                  feq.s        zero, fs6, fs5
                  ori          a1, s8, 1562
                  mul          a4, t6, s4
                  mulhsu       a0, t5, a0
                  fclass.s     a4, ft1
                  fmul.s       ft7, ft6, fa4, rtz
                  flt.s        s9, fa1, fa1
                  fsqrt.s      fs1, fs4
                  mulhu        t0, a6, s3
                  fsgnjx.s     fa3, fs0, ft9
                  mulhsu       s7, t0, s0
                  or           s3, s11, a0
                  srl          s4, sp, a2
                  mulh         s10, s0, sp
                  fmv.x.w      s7, fs2
                  sltu         s4, s6, a6
                  mul          a0, s8, tp
                  srli         a1, s2, 4
                  flt.s        s8, ft0, ft1
                  sra          a7, sp, t0
                  or           s1, s11, s10
                  addi         zero, a4, -1358
                  fmin.s       fa5, fs6, fs8
                  srl          s8, t2, a5
                  add          s11, zero, a0
                  mulhsu       s3, t1, zero
                  fle.s        t5, fa7, ft6
                  divu         t2, s10, a4
                  fclass.s     tp, ft6
                  sra          t0, s0, zero
                  mulh         tp, s8, tp
                  fcvt.w.s     a1, fs9, rne
                  fadd.s       ft3, fs9, fs6
                  fcvt.w.s     tp, ft0, rup
                  fmul.s       ft7, fs4, ft11, rdn
                  fmax.s       ft0, fs9, fs9
                  sll          a0, t5, t3
                  fmv.x.w      a0, ft2
                  sltiu        s10, tp, 607
                  ori          a3, s11, 1165
                  fcvt.s.w     fs6, t1
                  xor          t3, t1, t1
                  xor          tp, a5, s11
                  fsub.s       ft10, ft7, ft6
                  sub          s10, s11, s1
                  mulh         s4, a4, zero
                  fdiv.s       ft9, fs9, fa6
                  ori          s9, s3, 1480
                  sltiu        s7, t5, 934
                  auipc        s2, 451507
                  andi         gp, s4, 1707
                  slti         t3, s0, 931
                  fmv.x.w      gp, fs6
                  fsqrt.s      ft6, fs0
                  fmv.w.x      fa6, zero
                  fle.s        s9, ft4, fs1
                  flt.s        a3, fa0, ft1
                  lui          a0, 330186
                  fsub.s       fs5, fs8, fs2, rup
                  mulh         a4, s8, ra
                  div          t2, a2, a7
                  addi         t6, ra, 89
                  addi         t5, s7, 802
                  fmin.s       ft9, ft1, ft0
                  fsqrt.s      fs0, fs3
                  fle.s        a0, fa1, ft0
                  andi         t0, gp, -1991
                  fcvt.s.wu    fa3, a3, rdn
                  fcvt.s.wu    fs10, sp, rne
                  fsub.s       fa2, ft6, fa1, rne
                  fmul.s       fa5, fs5, ft11, rtz
                  andi         t4, s2, -378
                  remu         tp, s3, ra
                  xor          t4, a0, s3
                  flt.s        s1, ft9, fa4
                  fsgnjn.s     ft8, fa2, ft5
                  fcvt.wu.s    t2, fa4, rne
                  fmax.s       fs0, ft8, ft9
                  addi         t2, s5, -664
                  add          gp, s3, s0
                  mulh         a7, a3, tp
                  srli         s4, a6, 7
                  fcvt.s.w     ft0, a0, rmm
                  fmax.s       fa0, ft4, ft7
                  sltiu        a5, s6, -565
                  rem          t3, s6, a3
                  auipc        a4, 755316
                  fmul.s       fs4, fa4, fs7, rne
                  slli         s10, s8, 3
                  sub          t3, t0, a4
                  fclass.s     ra, ft1
                  auipc        a1, 998643
                  rem          gp, t5, s2
                  addi         s0, s0, -1065
                  mulhu        t5, a4, t4
                  srli         a2, s5, 11
                  srai         tp, a2, 24
                  lui          s5, 920763
                  fsgnjx.s     fs7, fs6, ft10
                  srl          a2, t2, tp
                  auipc        t3, 846230
                  sltu         t5, a4, s6
                  ori          t6, s4, -1715
                  sltiu        s5, t0, -1727
                  and          s11, gp, a3
                  xori         gp, a2, -1490
                  fmv.w.x      ft0, a1
                  or           s5, t0, ra
                  slt          a5, s4, s9
                  sub          gp, a3, t3
                  add          s3, sp, a3
                  fmul.s       fa3, fa0, ft7, rmm
                  sltiu        t6, t0, -335
                  rem          s3, t1, s0
                  fle.s        t5, ft10, fs2
                  mulh         sp, tp, s1
                  mulh         t6, s0, s0
                  fmv.x.w      a7, ft4
                  fdiv.s       fs5, fs10, fs8
                  mulhu        a7, a3, a5
                  fadd.s       fa3, fs2, fa3
                  fle.s        s5, fa4, ft3
                  slt          gp, t1, s5
                  fcvt.s.wu    fs1, t6, rtz
                  fle.s        a4, fa3, ft6
                  fmv.x.w      t6, ft10
                  slt          s10, s9, a2
                  andi         s2, a1, 1595
                  fle.s        a1, fa6, fa2
                  ori          t6, a4, -1260
                  ori          s11, s2, 1501
                  fsgnj.s      fs8, fs7, fa3
                  fcvt.wu.s    s2, fa2
                  fmin.s       fa2, fa3, ft2
                  mulhsu       zero, t0, a1
                  andi         s0, a0, 183
                  srli         s5, s10, 1
                  fcvt.wu.s    a1, fs2
                  feq.s        a7, ft11, fa3
                  addi         a5, s11, 1150
                  rem          a3, t2, ra
                  fcvt.wu.s    a0, ft9
                  slt          t3, t2, a6
                  sra          sp, sp, a7
                  xor          s10, s9, ra
                  fsqrt.s      ft5, fa1, rne
                  fdiv.s       fa2, fs10, fa3
                  divu         a7, t5, s9
                  slli         t4, a5, 1
                  remu         t3, s2, zero
                  fsgnjx.s     fs8, ft10, ft11
                  srli         gp, tp, 1
                  sll          s9, zero, t1
                  fclass.s     a0, fs2
                  fsgnjx.s     ft3, ft0, ft6
                  mulhsu       sp, a0, s3
                  fcvt.s.w     ft11, gp
                  fcvt.w.s     sp, fs3, rne
                  fcvt.wu.s    s2, ft7
                  srl          t4, s11, s7
                  nop
                  fmin.s       fs1, fa6, fa6
                  xor          t5, t5, t6
                  fmv.x.w      s9, fs8
                  srli         t5, s6, 5
                  sltiu        gp, s1, 1604
                  srai         s8, s2, 31
                  nop
                  fcvt.s.wu    ft4, t2
                  srai         s0, s7, 16
                  add          a0, t4, s7
                  slt          sp, t3, a4
                  fcvt.s.w     fa1, t3, rup
                  addi         s5, s7, -1324
                  fsub.s       fa7, ft0, fa1
                  andi         tp, a7, -791
                  fcvt.w.s     s11, ft10
                  andi         gp, t1, 839
                  rem          s3, ra, s9
                  lui          ra, 925566
                  nop
                  sub          s1, t5, ra
                  and          s3, t0, s4
                  fsqrt.s      ft9, fs7, rup
                  mulhsu       a5, a1, s5
                  auipc        s10, 928058
                  srli         tp, s2, 21
                  sltu         t6, t2, s0
                  fsgnjx.s     fs0, fs11, fs5
                  feq.s        ra, ft6, fa7
                  mulhsu       s2, sp, t0
                  fsgnj.s      fs4, fs11, fa3
                  fsgnjn.s     fs2, fa7, fa1
                  fsgnjn.s     fa1, ft10, fs5
                  auipc        s0, 623929
                  xor          a1, s7, t2
                  fsgnjx.s     ft4, ft9, fs9
                  fsub.s       ft10, fs4, fs4, rne
                  mulhsu       t0, a3, a5
                  fdiv.s       fs0, fs3, fs7, rdn
                  or           t3, ra, s5
                  xor          s2, a4, s7
                  srl          t2, s1, a5
                  fcvt.s.w     fs10, ra, rtz
                  slti         gp, zero, -66
                  slt          s10, s8, s10
                  fmax.s       ft11, fa5, fa5
                  fadd.s       fa3, fa0, fs6, rup
                  fsqrt.s      fa2, fa7
                  feq.s        gp, ft3, fa5
                  fcvt.w.s     zero, fs4
                  add          t6, gp, s11
                  srli         t4, a1, 30
                  srl          ra, s8, t0
                  mul          t2, s8, a0
                  mulh         s10, a4, sp
                  fsqrt.s      ft1, fa7, rup
                  srli         a7, a0, 0
                  andi         gp, s3, 42
                  fcvt.s.w     fs3, s10
                  fmax.s       ft4, ft4, fs11
                  fcvt.s.wu    ft11, a5, rdn
                  fmax.s       fa2, fs11, ft8
                  fsub.s       fs3, ft5, fs8
                  divu         s4, tp, t2
                  add          a3, s10, a3
                  div          s2, s11, s8
                  andi         s2, a6, 1104
                  fsgnjn.s     fs8, fs10, fs6
                  rem          s2, t2, a3
                  srai         s11, a3, 10
                  or           a2, a2, t3
                  remu         s2, tp, a7
                  and          s8, tp, s3
                  srli         a4, a0, 3
                  flt.s        zero, fa6, fa4
                  fmul.s       fa0, fs4, ft0
                  mulh         a1, t1, a7
                  xor          s9, t3, t4
                  fdiv.s       fs11, fs2, fa7, rtz
                  remu         zero, t5, gp
                  fcvt.wu.s    a5, ft10, rne
                  fmax.s       fa5, ft1, ft9
                  fle.s        s2, fa5, fa2
                  fcvt.wu.s    s5, fs4, rdn
                  fmul.s       fs5, ft5, fa2
                  fdiv.s       ft1, fa3, ft6, rtz
                  slli         s10, t6, 15
                  flt.s        t5, fs4, fa0
                  ori          a3, s0, -259
                  fmul.s       ft11, ft7, ft3, rmm
                  sll          sp, s6, tp
                  sll          ra, a7, a1
                  fdiv.s       ft7, fs2, fs0
                  slt          a0, s11, s10
                  fcvt.s.wu    fa3, t3
                  fmv.w.x      ft3, tp
                  fmax.s       fa0, ft8, fs11
                  fcvt.w.s     s4, fs0, rmm
                  rem          s2, s2, t5
                  or           s8, s5, t5
                  fmax.s       fs9, ft1, ft1
                  slt          s10, s4, t4
                  fle.s        a5, ft10, fs7
                  addi         s11, zero, -1785
                  div          ra, a7, s6
                  fdiv.s       ft3, fs2, ft7
                  mul          t0, a7, a6
                  fmul.s       fs4, fs9, ft3, rne
                  slt          s0, t3, s7
                  fcvt.w.s     a5, fa2
                  slli         zero, s5, 31
                  fsgnj.s      fa1, fa7, ft11
                  mul          s5, t4, s8
                  addi         s5, a7, -1248
                  sub          s11, t2, s11
                  rem          s3, s0, s0
                  sltu         s8, t5, a3
                  fsgnjx.s     fa7, ft0, fa2
                  flt.s        s7, fs0, ft7
                  mulhsu       a4, s4, s8
                  flt.s        a5, ft9, fa6
                  fmv.x.w      a7, fs9
                  sltu         s7, t1, tp
                  sltu         t2, a5, ra
                  fsgnjn.s     fa2, ft6, ft4
                  sltiu        s0, tp, 1381
                  or           a3, tp, t2
                  slt          ra, a2, a2
                  nop
                  fcvt.w.s     ra, fa7
                  lui          t0, 79449
                  div          s5, a7, s7
                  srai         s9, t6, 6
                  fsqrt.s      ft2, fs10, rne
                  divu         a0, t0, s6
                  and          s10, ra, a3
                  divu         s8, s10, ra
                  fmax.s       fs1, ft9, fa5
                  flt.s        sp, fa7, fa5
                  fclass.s     t5, fa0
                  addi         s1, gp, -969
                  mulhsu       gp, a4, t5
                  nop
                  div          a1, s8, s6
                  xor          s5, s9, gp
                  xor          t0, tp, t3
                  fcvt.wu.s    t3, fa6
                  fcvt.w.s     a3, fs3
                  fclass.s     a2, ft2
                  divu         a0, s10, a5
                  fmul.s       fa3, fa4, ft6
                  fmul.s       fs2, fs3, ft9
                  fmv.w.x      ft9, a0
                  addi         ra, t4, 32
                  fclass.s     a0, fs5
                  ori          gp, s4, -508
                  fsqrt.s      fa2, fs6
                  auipc        a3, 438604
                  mulh         t6, a6, a3
                  mulhu        a3, s8, t0
                  fmax.s       ft5, fs5, ft8
                  slli         t6, s6, 12
                  xor          a1, tp, t1
                  divu         sp, s9, t0
                  addi         s7, a6, 986
                  addi         ra, a1, 828
                  sll          s1, a6, s9
                  srli         t3, tp, 7
                  sltiu        tp, s10, 1514
                  fsgnjn.s     ft5, fs4, fa2
                  sll          a3, a2, t4
                  srli         a1, t1, 1
                  lui          s1, 428630
                  slt          a0, t1, a3
                  fcvt.s.w     fs1, t3
                  fle.s        a3, ft9, fa1
                  flt.s        s11, ft7, ft4
                  rem          sp, gp, t0
                  xori         t5, t6, 2033
                  rem          t6, t5, t6
                  xori         a0, s9, -293
                  fmax.s       fs4, ft1, fa3
                  xor          a1, t3, t5
                  add          s9, sp, s5
                  fcvt.w.s     a1, fs8, rtz
                  slt          t6, t4, ra
                  mulhsu       ra, s8, s1
                  and          zero, tp, s1
                  feq.s        t5, fs10, fa1
                  auipc        s10, 1017616
                  addi         t5, s3, -1229
                  fmul.s       fs1, fs7, ft9
                  divu         s8, a4, a2
                  sltiu        s11, t5, -1009
                  fadd.s       fa0, fa0, fs7, rdn
                  fsqrt.s      ft11, fa1
                  flt.s        a5, fs10, fs8
                  fdiv.s       ft4, fs9, ft8, rup
                  slt          s8, t4, a0
                  or           t4, a7, a6
                  remu         t0, s8, a4
                  xori         t2, a0, 421
                  sll          t6, s6, t6
                  fsgnjx.s     fs0, ft11, fa0
                  andi         a7, a7, -1371
                  fsgnjx.s     fa6, fs3, ft11
                  ori          s8, a4, 22
                  flt.s        s7, ft9, fa7
                  fmin.s       fs6, fs7, ft3
                  fcvt.s.wu    ft3, s5
                  divu         zero, s2, zero
                  mulhsu       sp, a1, zero
                  and          t2, s5, sp
                  fdiv.s       ft9, ft11, ft4
                  fmax.s       fs7, fs5, ft5
                  fcvt.wu.s    a3, fs8
                  sltu         sp, t1, t5
                  fsub.s       fa5, fs4, ft10, rup
                  feq.s        a3, ft5, ft7
                  mulhsu       t4, t0, s8
                  fcvt.s.w     ft11, a4
                  remu         t0, a4, a2
                  fclass.s     gp, fs5
                  fmv.x.w      sp, fs3
                  flt.s        a5, fa6, fs4
                  fdiv.s       ft5, fa1, fs11, rtz
                  fadd.s       fs4, ft9, fa0
                  srai         s3, t0, 27
                  sub          t2, a1, gp
                  addi         zero, a5, -365
                  fmv.w.x      fa4, gp
                  slli         tp, s9, 7
                  mulhsu       a1, s10, s9
                  sub          t6, a3, a3
                  and          gp, t5, s5
                  sra          tp, t2, a5
                  fcvt.s.w     ft11, tp, rtz
                  fdiv.s       fs11, ft9, fs6
                  sra          a1, a1, s1
                  sra          t4, s2, a2
                  xor          a3, gp, t3
                  fcvt.w.s     a7, fa6
                  div          t3, t3, sp
                  fcvt.wu.s    s9, fs4, rne
                  mul          a7, s1, a5
                  slt          gp, s7, a5
                  fsub.s       ft4, fs1, ft0, rtz
                  fcvt.wu.s    s3, fs5, rmm
                  ori          sp, s0, -1530
                  fmin.s       ft9, fs9, fs9
                  fmv.x.w      zero, ft10
                  fsgnjn.s     fa4, fs3, ft0
                  fmv.w.x      ft1, s11
                  fcvt.s.w     fs7, a1, rdn
                  fsub.s       fs1, ft7, fs6, rup
                  mulhsu       s0, a6, a1
                  xor          s2, tp, sp
                  fle.s        zero, fs0, ft5
                  div          t3, t0, s1
                  flt.s        s8, fa3, fs8
                  fclass.s     t6, ft10
                  mulhu        a5, s3, ra
                  mulhu        a0, a0, a0
                  xori         s7, a0, 618
                  slti         a3, ra, 572
                  fcvt.s.wu    fs0, zero
                  auipc        a7, 411349
                  fmv.x.w      s8, ft7
                  fadd.s       fs8, fs9, ft8, rne
                  fclass.s     s0, ft2
                  mulhu        t2, t5, t1
                  mulh         s4, s0, s11
                  fdiv.s       fs0, fs2, ft0, rtz
                  srli         t5, a5, 23
                  sub          a2, t2, t5
                  fclass.s     s2, fs3
                  fadd.s       ft8, ft0, fs8, rdn
                  andi         sp, gp, 2023
                  slt          s0, s1, s1
                  fmul.s       fa5, ft2, ft2
                  mul          s9, t0, a1
                  xor          a4, sp, a7
                  mulhu        s1, tp, t4
                  rem          s3, s7, a2
                  fadd.s       fs3, fa0, fs1
                  fmin.s       fs0, fs1, ft0
                  and          t5, t2, s1
                  sll          s4, a4, t2
                  xor          zero, s7, s8
                  srli         sp, sp, 20
                  fmax.s       ft0, fs0, ft9
                  sll          s1, a7, s4
                  nop
                  sll          a0, sp, gp
                  fcvt.w.s     s7, fa3
                  fle.s        s9, fs4, fa6
                  rem          s10, t4, a0
                  sll          a3, t2, a4
                  mulhsu       a7, a5, t2
                  srai         s9, sp, 27
                  mulhsu       tp, t2, s4
                  fcvt.w.s     a1, fa4
                  divu         t2, s1, s2
                  mulhsu       s8, tp, s5
                  mulhu        t3, a2, a7
                  feq.s        a5, fa4, fa7
                  fclass.s     t4, fs6
                  div          ra, s10, s8
                  remu         gp, t2, s3
                  fcvt.w.s     a7, ft6
                  fmv.w.x      ft11, t4
                  sra          a1, s7, t6
                  or           s4, a7, s2
                  srai         t2, a4, 2
                  fsgnjn.s     fs11, ft0, ft2
                  mul          a4, sp, s4
                  sub          zero, s4, s6
                  xor          s0, s4, s11
                  fsqrt.s      ft6, ft11
                  fadd.s       ft5, ft3, fs1, rtz
                  and          ra, tp, s11
                  and          s9, s9, zero
                  fsgnjx.s     fa0, fa2, fs3
                  divu         s5, zero, a1
                  fmax.s       fs11, fa2, ft6
                  fsgnjn.s     fs5, fs5, fs8
                  flt.s        ra, ft4, ft1
                  xori         a1, a2, 177
                  fle.s        sp, fs11, fa7
                  mul          s10, a5, a2
                  andi         s2, a1, -277
                  fle.s        t4, fs9, fs10
                  fdiv.s       ft4, fa1, fa4, rdn
                  flt.s        t5, ft0, ft3
                  mulh         s1, t5, zero
                  slt          s1, a6, s7
                  remu         s0, a0, s3
                  srai         t3, s2, 15
                  xori         a7, s7, -1529
                  fsqrt.s      fa0, fs10
                  mulhsu       tp, s1, tp
                  fcvt.s.w     ft1, a2
                  or           s1, a2, s8
                  srli         s4, s2, 23
                  slti         tp, s9, 724
                  srli         s9, a2, 12
                  fclass.s     s11, fs11
                  xor          s7, s6, s8
                  or           s10, t0, a5
                  sra          t5, s5, a2
                  fcvt.s.wu    ft8, a6
                  sub          a7, s8, s3
                  fle.s        t3, fs5, fs5
                  ori          sp, t5, 289
                  andi         t3, a6, -1388
                  fcvt.s.w     fs0, a1
                  divu         sp, gp, s10
                  fdiv.s       ft9, fs0, fa5, rtz
                  and          s10, t4, s6
                  addi         s1, s5, -177
                  srl          a5, a6, s5
                  fsgnjx.s     fs10, fs6, ft10
                  auipc        s4, 955779
                  fsub.s       ft9, ft3, fs6
                  andi         ra, a5, 866
                  mul          s11, s11, s5
                  flt.s        s3, ft4, fs5
                  fadd.s       ft8, fs1, fs5, rmm
                  rem          a7, s3, a3
                  fcvt.wu.s    a5, ft6
                  flt.s        s7, fs8, ft6
                  fmul.s       ft4, ft3, ft9
                  fsgnj.s      ft9, ft5, fa2
                  fsqrt.s      fs4, fs6
                  sra          s0, sp, t3
                  divu         s5, a2, s11
                  div          s2, s6, t0
                  div          s0, t2, a1
                  mulhu        a4, s1, s7
                  sltu         a2, t4, a4
                  mulhu        a3, s7, tp
                  fmv.w.x      ft6, s6
                  mulhu        t4, t6, a3
                  fmv.x.w      s8, fs10
                  fmv.w.x      fs2, s10
                  fcvt.w.s     tp, fs10
                  fdiv.s       ft1, fs6, ft2
                  mul          a2, a0, t1
                  addi         s0, s7, 409
                  flt.s        s5, ft2, fs0
                  add          s10, a4, s8
                  slt          t2, sp, s0
                  sra          gp, a2, s9
                  nop
                  sll          s7, t2, a0
                  fmax.s       fa7, fa7, ft2
                  feq.s        t2, ft7, fa0
                  sltu         a1, s2, s6
                  xori         a5, s9, 1113
                  nop
                  addi         s10, t3, -1339
                  mul          s1, t4, a3
                  sra          a4, s2, t3
                  fmax.s       fs5, fa5, ft9
                  fmax.s       fa2, ft3, ft11
                  srai         a4, t2, 10
                  fsub.s       fa4, ft8, ft3, rmm
                  fcvt.s.w     fs10, t0
                  mul          t5, tp, a7
                  fcvt.wu.s    a0, fs6, rup
                  fmin.s       ft5, fs6, ft5
                  fsgnjx.s     fa7, ft3, fs5
                  sltiu        s9, a7, 1785
                  mulhu        s11, gp, a1
                  fmv.w.x      fa2, sp
                  fsqrt.s      fa6, fs9, rdn
                  div          s1, t6, s2
                  fsgnjn.s     fa5, fa5, ft3
                  or           s11, a6, a5
                  fmv.x.w      tp, fa7
                  auipc        s5, 559995
                  fmin.s       fs5, fa6, ft10
                  fsub.s       ft2, fa2, fa7, rup
                  fsgnjn.s     fs7, ft7, fs1
                  or           t0, tp, t1
                  auipc        a0, 319667
                  remu         s3, sp, s2
                  remu         t3, a3, t0
                  div          s10, a1, a3
                  feq.s        s9, ft1, ft9
                  auipc        zero, 184577
                  rem          a2, t6, t1
                  sll          s10, t1, s4
                  rem          s2, gp, a6
                  fle.s        a0, fa2, fs8
                  and          a1, a0, s5
                  slli         s11, a0, 5
                  fmax.s       ft7, ft8, ft8
                  divu         t6, s10, t5
                  fle.s        s3, ft5, fs4
                  ori          tp, s1, 1518
                  mulh         s3, t3, zero
                  remu         s2, sp, sp
                  add          t4, a6, t1
                  sub          s2, a4, s4
                  xori         t2, zero, -1754
                  fadd.s       fa7, fa0, fs3, rmm
                  sltu         t5, t1, t6
                  fmin.s       fs5, ft2, ft10
                  fcvt.wu.s    s11, fa0, rdn
                  auipc        sp, 285723
                  or           t3, a3, s10
                  mulhsu       s2, a3, gp
                  fcvt.s.w     fa6, t6
                  fclass.s     zero, fs2
                  div          s0, t6, s0
                  remu         a4, t3, a4
                  fclass.s     a7, ft8
                  fmul.s       fs10, fs3, fa7, rdn
                  auipc        tp, 151729
                  fadd.s       ft10, fs11, fa3, rmm
                  lui          a5, 403207
                  srai         tp, s9, 12
                  mul          a0, a3, a5
                  rem          a3, a5, t6
                  lui          s8, 226712
                  fmin.s       fa3, ft3, ft11
                  fcvt.s.w     ft3, s9, rdn
                  fcvt.wu.s    a4, fs2
                  fsqrt.s      ft10, fa5, rmm
                  xori         a2, s1, 736
                  auipc        s4, 933573
                  flt.s        s11, ft0, fs5
                  flt.s        s11, ft3, ft11
                  fmv.w.x      ft9, s0
                  fle.s        s9, fa2, fa5
                  sltiu        ra, gp, 1283
                  srli         a0, a6, 0
                  fmax.s       fa3, fa0, fs5
                  fcvt.s.w     ft7, a0
                  slli         s0, s2, 16
                  fcvt.w.s     s4, fs5, rmm
                  mul          gp, a6, a7
                  fcvt.s.wu    fs1, tp
                  sltiu        s10, t1, 79
                  rem          t3, s10, a4
                  fmv.w.x      ft3, a6
                  slli         t4, t6, 19
                  fmul.s       fs1, ft10, ft5
                  fsgnj.s      ft3, ft4, fa1
                  sltu         a7, s5, a1
                  slli         zero, s4, 19
                  xor          s7, s3, zero
                  fsqrt.s      ft5, ft3
                  fcvt.wu.s    s10, ft7, rdn
                  fcvt.wu.s    a3, ft4
                  mul          t3, t4, a7
                  rem          zero, a3, t2
                  slti         ra, s11, 1017
                  fcvt.s.w     ft3, s7, rtz
                  sll          a3, s2, sp
                  feq.s        s1, fs9, ft7
                  fsgnjx.s     fs2, ft9, fs2
                  mulh         s0, a0, sp
                  rem          a4, s8, s0
                  add          t3, s4, t1
                  mul          t0, sp, s3
                  xori         t3, s2, -1826
                  srl          t2, a5, s0
                  slli         t3, s2, 25
                  fsqrt.s      fs6, fa6, rdn
                  fcvt.s.w     fa2, a6
                  flt.s        s10, fa7, fs10
                  sra          sp, s6, s3
                  rem          t2, a3, s9
                  fclass.s     gp, fa5
                  fmul.s       ft7, fa7, ft9
                  srl          s2, t6, a6
                  sll          sp, a7, gp
                  or           ra, ra, a4
                  and          a7, gp, zero
                  and          s11, t1, a2
                  nop
                  slt          s8, a7, t2
                  remu         a3, a6, tp
                  mulh         zero, s6, s9
                  sll          s3, t1, s5
                  div          a2, t6, s9
                  nop
                  fcvt.wu.s    t2, fa5, rmm
                  remu         a5, t3, t6
                  slli         a0, sp, 10
                  slti         a1, s4, -1948
                  sll          s10, s1, a6
                  fcvt.wu.s    s4, fs6
                  mul          t5, s5, a2
                  addi         a3, sp, 695
                  remu         t3, s9, s11
                  fcvt.s.w     fa6, ra
                  fcvt.s.wu    fs5, s11
                  fcvt.w.s     ra, ft0
                  fmv.w.x      fs9, t2
                  fmax.s       fa7, fs5, ft11
                  addi         t2, s11, 1264
                  slt          t2, s0, a5
                  fsgnj.s      fa0, fa5, ft11
                  flt.s        a5, fs7, fa5
                  fcvt.wu.s    a7, fs0
                  fcvt.s.wu    fs5, a0, rmm
                  add          s11, a2, zero
                  srl          s8, a5, ra
                  srli         t5, t3, 25
                  fsub.s       fa1, ft5, fs6
                  divu         a4, t4, a7
                  srli         t3, a3, 17
                  and          zero, a4, t5
                  sltiu        s5, s6, -1091
                  sltiu        t5, a1, 204
                  fsgnjx.s     ft8, ft5, fs6
                  fmin.s       fs1, fs5, ft0
                  fmv.w.x      ft1, zero
                  and          s10, a2, gp
                  sltiu        tp, ra, -1618
                  and          t6, t6, t6
                  sll          gp, gp, a1
                  feq.s        a4, fs11, fs4
                  sltu         s11, s4, sp
                  rem          s1, a1, s4
                  fdiv.s       ft8, ft8, fa7, rtz
                  ori          a3, s2, 205
                  sra          t4, s5, s1
                  auipc        t3, 801941
                  fsgnjx.s     ft0, fa3, fa2
                  divu         gp, s1, s8
                  add          s5, s7, zero
                  fmin.s       ft2, fs8, fs4
                  xor          a1, sp, t0
                  fcvt.w.s     s3, fa5, rne
                  fcvt.s.w     fa4, a1, rdn
                  divu         s4, s10, s6
                  fclass.s     zero, fs1
                  sltu         s5, t3, sp
                  srl          a5, s5, t0
                  remu         a7, s7, zero
                  fmv.w.x      ft7, ra
                  sra          s2, gp, s11
                  sltiu        tp, tp, 1571
                  mulh         t3, s1, s5
                  fmax.s       ft1, fa1, fs3
                  or           s9, s10, s10
                  andi         s1, s4, -1793
                  slli         s11, s11, 0
                  ori          gp, s11, 1301
                  xori         tp, s4, -1515
                  lui          ra, 406501
                  mulhu        t6, ra, t6
                  rem          a7, s10, s3
                  fsqrt.s      ft3, fs5, rtz
                  fcvt.w.s     ra, fa4, rdn
                  fsgnjn.s     fs4, fa4, fa3
                  divu         ra, a4, t3
                  fcvt.s.w     ft11, sp, rup
                  div          sp, s11, a2
                  srl          s0, a2, a5
                  sll          s9, s0, sp
                  flt.s        a7, ft11, ft5
                  fmin.s       fa3, ft9, fs2
                  fsgnj.s      fs8, ft0, ft0
                  fmul.s       ft4, ft3, fs4, rne
                  fclass.s     s8, fa7
                  fcvt.s.wu    ft10, tp, rup
                  andi         a2, s9, 1308
                  srai         a3, tp, 1
                  xor          s5, a7, tp
                  srl          gp, s8, s8
                  mulh         s7, a7, s7
                  fdiv.s       fs2, fa3, fs4, rne
                  fcvt.wu.s    a7, fa2
                  sltu         a7, a7, tp
                  fcvt.wu.s    s10, fa4, rdn
                  fsgnjn.s     ft10, fs8, ft9
                  fsqrt.s      fs9, ft6
                  nop
                  addi         s3, a4, 289
                  sub          a7, sp, s9
                  slli         ra, t4, 23
                  or           t0, a3, s2
                  fsub.s       ft9, ft10, ft8, rmm
                  div          a0, a4, a1
                  sub          gp, s7, s2
                  fcvt.s.wu    fs0, tp, rne
                  fmv.x.w      s4, fs7
                  sltiu        t4, tp, 943
                  sltiu        t2, a1, 1181
                  or           s8, s10, t2
                  lui          a5, 185303
                  fdiv.s       fa5, fs10, ft0, rup
                  srl          a3, s0, a0
                  xori         a0, s8, 119
                  and          a7, s9, t2
                  fsub.s       ft10, fa7, ft10
                  fmax.s       ft8, fs11, fa7
                  fcvt.wu.s    s2, fs3
                  addi         s7, t5, 1015
                  srli         t3, sp, 23
                  ori          a1, a7, 1575
                  flt.s        s10, fs9, ft10
                  add          t6, s8, a4
                  lui          s7, 17822
                  xori         t2, zero, 602
                  fmv.x.w      s3, fa7
                  xor          tp, s6, t3
                  flt.s        s3, fa1, fa2
                  fcvt.w.s     gp, fs4, rup
                  slli         s0, t0, 18
                  fclass.s     a2, fs8
                  rem          a3, gp, t0
                  rem          sp, s11, s11
                  srli         s1, gp, 30
                  sltiu        sp, a0, -1259
                  auipc        a7, 490071
                  sub          s4, s6, t0
                  lui          s11, 453204
                  fsgnjn.s     fs10, fs1, fs2
                  fsgnjn.s     fs1, fs10, fa0
                  fsgnj.s      fs9, ft7, fa5
                  sltiu        a5, sp, 103
                  add          t4, a4, t4
                  fsgnj.s      fa1, ft11, fa3
                  lui          s4, 874370
                  add          a3, ra, a3
                  srli         s8, a5, 28
                  remu         s5, gp, a6
                  fsub.s       ft8, fs9, ft8
                  ori          a4, sp, -231
                  sra          t3, s1, gp
                  srli         gp, s9, 2
                  ori          t2, s4, -279
                  fdiv.s       fs10, fa0, fs5, rup
                  srl          a2, t6, zero
                  sll          t0, tp, s9
                  fmv.w.x      fa2, a0
                  auipc        a5, 904122
                  or           tp, a5, s7
                  rem          a4, s6, s9
                  and          zero, s11, a5
                  ori          ra, tp, 1499
                  srl          a0, t4, s0
                  lui          s5, 160871
                  or           a7, a2, a7
                  mulhu        a2, a5, a5
                  sltu         t2, a3, gp
                  mulhsu       a2, s6, a4
                  fmv.x.w      gp, fs8
                  fle.s        t3, ft6, ft5
                  lui          a5, 349490
                  fadd.s       fs7, fs4, fa2, rmm
                  remu         s5, s9, t2
                  andi         t2, s3, -16
                  nop
                  fsgnjx.s     fs0, ft10, ft6
                  feq.s        gp, fs2, ft3
                  and          s7, t1, a2
                  fsgnjx.s     fa5, fs7, fs6
                  ori          t6, gp, 2043
                  fle.s        t2, ft11, fs11
                  fcvt.wu.s    a7, ft5
                  fdiv.s       ft2, fs5, ft2, rne
                  fmin.s       ft3, fs2, ft9
                  sll          tp, a5, a2
                  and          s1, t0, t4
                  add          s2, s11, s0
                  divu         s3, t1, sp
                  fdiv.s       ft3, fs3, fa4
                  fclass.s     t0, fs1
                  feq.s        a7, fs1, fs10
                  fcvt.w.s     s5, fa3, rne
                  add          s1, gp, s0
                  ori          s10, t0, -209
                  sra          ra, t6, tp
                  sltiu        sp, s2, -1490
                  fsgnjx.s     ft8, ft1, fa3
                  add          s0, a4, a2
                  fadd.s       ft11, ft10, ft10, rmm
                  fdiv.s       ft8, fa7, fa3
                  fsgnj.s      fa1, fa4, fs9
                  fcvt.w.s     s2, fs3
                  or           a1, s2, t5
                  mul          t6, s0, t6
                  mulhu        a0, zero, s4
                  sll          a7, a5, a6
                  slt          s1, a0, s7
                  rem          sp, s0, s1
                  or           a3, tp, a1
                  div          zero, gp, s5
                  div          t0, a1, t3
                  fcvt.s.wu    ft2, t6
                  sltu         t6, s0, s3
                  fcvt.s.wu    fa2, s2
                  fle.s        s1, fa5, ft10
                  nop
                  xori         t0, sp, -1902
                  srl          s10, zero, t4
                  andi         s0, s11, -769
                  add          a3, ra, a0
                  mulh         a0, s8, s8
                  fmv.w.x      fa4, a2
                  fsqrt.s      ft10, fs5
                  slt          a5, a5, a4
                  slti         zero, s4, 353
                  fsqrt.s      fa7, fs9
                  fsub.s       ft1, fs5, fs6, rup
                  sra          a4, t4, a5
                  fsgnjx.s     fs4, fa0, fs2
                  fmax.s       fs9, ft9, fs4
                  or           a4, t4, a4
                  fsqrt.s      fa7, fa1
                  slli         a4, s6, 0
                  fsgnjx.s     ft8, fa3, ft2
                  nop
                  fmax.s       fs7, fa4, ft5
                  rem          s1, t4, t3
                  fcvt.wu.s    a3, fs1
                  srl          t5, tp, ra
                  mulhsu       t2, t4, s8
                  srai         t2, t6, 13
                  feq.s        t3, ft6, fs0
                  mulhsu       tp, a1, tp
                  divu         ra, a0, a1
                  add          t5, tp, a2
                  fcvt.wu.s    a0, fa3
                  srl          s1, a7, s5
                  xori         t6, t6, -858
                  sra          s9, s9, t3
                  fsub.s       ft11, ft8, ft2, rup
                  fmin.s       ft10, ft6, fa4
                  fsgnjx.s     ft7, ft7, ft5
                  fmv.x.w      s8, ft5
                  nop
                  lui          zero, 458449
                  sll          s2, sp, s8
                  divu         t0, t5, s9
                  fdiv.s       fa0, fa3, fa7
                  or           t4, t6, s3
                  sltiu        ra, s9, 197
                  and          t4, t4, s4
                  flt.s        gp, ft7, fs10
                  sra          sp, t6, s4
                  fsgnjn.s     ft3, fa7, fa3
                  mul          s9, zero, s0
                  mulhu        ra, a2, zero
                  andi         a4, sp, 117
                  slli         a7, a6, 20
                  slli         t4, s7, 10
                  auipc        t6, 283108
                  sltiu        a5, gp, 828
                  fsqrt.s      fa5, fs8
                  remu         a4, s4, s1
                  addi         gp, t5, 1968
                  fmul.s       ft1, fs8, fa7
                  ori          s9, t2, -584
                  fcvt.s.wu    ft7, zero, rdn
                  div          zero, s0, a2
                  add          t6, gp, t4
                  sll          s0, a7, s5
                  fsub.s       fs5, fa2, fa5
                  fsqrt.s      ft6, fa1
                  fsgnjx.s     ft2, fs10, ft7
                  slli         sp, s11, 18
                  slt          s9, s11, t2
                  remu         t2, s6, a6
                  fmv.w.x      ft9, s2
                  fsgnjn.s     fs4, ft3, fs0
                  fdiv.s       ft11, ft6, fa0, rne
                  fsqrt.s      fs9, ft6, rmm
                  xori         a0, t4, -83
                  flt.s        s9, ft7, ft4
                  sll          s1, a7, t0
                  fdiv.s       fs4, fs5, fs2, rup
                  addi         s10, s1, 1173
                  fsgnj.s      ft10, fa2, fs11
                  fle.s        a7, ft7, ft3
                  srli         s11, s8, 28
                  xori         s5, a0, -1226
                  srl          zero, a3, t6
                  flt.s        gp, ft6, ft1
                  srai         a0, a2, 27
                  mulh         tp, t5, s0
                  fle.s        s8, fs6, fa5
                  xor          a0, s10, a1
                  lui          a5, 125329
                  feq.s        t2, ft9, fa6
                  xori         a3, t2, -1474
                  feq.s        s2, fa0, fa2
                  fcvt.s.wu    fs0, gp, rne
                  mul          a1, t3, a6
                  slli         a4, s8, 21
                  fmv.w.x      fs10, zero
                  srl          tp, s10, ra
                  fsgnjx.s     fs0, fs11, ft4
                  fsub.s       fs6, fs8, fs11
                  and          t5, s0, a0
                  flt.s        s11, fs7, ft1
                  sra          sp, t0, tp
                  fcvt.wu.s    s10, fa6
                  lui          s2, 30810
                  fsgnjn.s     fa1, ft9, fs10
                  fmul.s       fs2, fs1, fs9
                  fmv.x.w      tp, ft11
                  fsgnjx.s     ft11, fa0, ft3
                  fadd.s       fs8, fs0, fa6, rmm
                  remu         s11, a3, gp
                  fsub.s       fs4, ft3, fs3
                  andi         s3, a4, 79
                  fadd.s       fs1, ft8, fs9
                  mul          t6, s11, t1
                  fdiv.s       fs4, fs11, fs9, rmm
                  mulhsu       t2, s2, sp
                  srl          t6, s0, zero
                  fsgnjx.s     fs7, fs2, ft5
                  fcvt.s.w     ft9, a4, rdn
                  slti         a7, t3, -493
                  slli         tp, t4, 10
                  divu         a4, s8, s7
                  nop
                  sll          s7, s2, a5
                  fsgnj.s      fs9, fa2, ft2
                  fadd.s       ft2, fa2, fa0
                  fsgnj.s      ft3, fa7, ft9
                  fdiv.s       fs3, ft11, fs7
                  mul          gp, t5, t4
                  fsqrt.s      fa1, fa1, rne
                  divu         t4, a2, t1
                  rem          t4, s9, sp
                  mulh         s3, s0, t5
                  srai         a4, a6, 15
                  fsqrt.s      ft6, fs4
                  and          ra, s9, s5
                  srli         s4, zero, 29
                  fsgnjn.s     fs2, fa3, ft0
                  addi         t2, a6, 1138
                  div          gp, gp, a7
                  fle.s        a7, fs8, fs1
                  addi         s3, a0, -1460
                  mulh         t6, s0, tp
                  add          s2, a6, t5
                  fmin.s       fa7, fs9, fa5
                  srl          a0, t3, s8
                  fdiv.s       fs8, ft3, fa6
                  fclass.s     a0, fa6
                  fmv.x.w      s1, ft0
                  fmin.s       ft7, ft4, fs10
                  auipc        t5, 861738
                  slti         t3, t2, 170
                  divu         ra, a1, s9
                  div          tp, s2, s4
                  fsgnjn.s     fa5, fa5, fs7
                  fcvt.s.w     ft1, a3
                  fclass.s     s7, ft10
                  addi         a7, s10, -1016
                  srli         a2, a4, 2
                  lui          s8, 31595
                  rem          t6, t3, ra
                  rem          sp, s10, t0
                  srli         s7, s2, 17
                  xori         s8, s3, -137
                  add          s7, t5, s1
                  slti         tp, s2, 559
                  srl          t0, tp, t6
                  xori         s4, zero, -1233
                  fcvt.s.w     fs2, a3, rmm
                  add          s7, a1, s0
                  fmv.x.w      a7, ft8
                  srli         s7, a3, 15
                  or           s7, t0, a2
                  srli         s1, a6, 21
                  fmul.s       ft6, fa1, fa7, rne
                  auipc        s10, 219230
                  fmv.x.w      a3, fs11
                  sll          gp, ra, a4
                  fcvt.s.w     ft4, s9, rmm
                  add          s11, s4, a0
                  ori          a7, t2, -121
                  auipc        t3, 63848
                  fsgnjn.s     ft8, fs4, fs10
                  fsgnjn.s     fa1, ft7, ft11
                  mulhsu       t4, t0, zero
                  sltu         zero, s4, zero
                  flt.s        gp, fa4, fa5
                  slt          t0, a2, t3
                  mulhsu       t5, s2, s1
                  fmul.s       fs3, fs11, fa2, rne
                  slti         zero, t2, 877
                  fsub.s       fs11, fs2, fs11, rdn
                  flt.s        t3, ft11, ft10
                  nop
                  sll          s4, zero, s11
                  mul          t6, a2, s6
                  fmul.s       ft6, fa2, fs3
                  fmax.s       fs7, fa4, ft0
                  fmul.s       ft5, ft6, fa6, rmm
                  and          t2, a4, a4
                  fsub.s       fs8, ft4, fs7
                  srai         s5, s4, 24
                  fmin.s       ft10, fa1, fs3
                  addi         t4, tp, 2016
                  add          ra, t2, s2
                  fsgnjx.s     fa3, fa5, fs7
                  fle.s        zero, ft8, fa2
                  sub          s10, t1, t6
                  lui          t0, 674448
                  or           t4, s9, a1
                  mul          sp, zero, s2
                  mulhu        a5, s7, s7
                  fsgnjn.s     ft6, fa0, ft6
                  srai         sp, t3, 2
                  xor          a7, tp, s5
                  divu         a2, a6, s10
                  ori          ra, s6, 900
                  fcvt.w.s     a5, fa2, rmm
                  rem          a0, t3, t1
                  fmv.w.x      fs7, a6
                  fmv.w.x      ft3, sp
                  slt          sp, a0, s8
                  fmul.s       fa2, ft3, fa5
                  sub          s2, t3, s3
                  auipc        s2, 1046761
                  flt.s        s7, fa5, ft9
                  srli         s9, s7, 3
                  fcvt.wu.s    t0, ft10
                  sltu         ra, t2, t4
                  rem          tp, ra, a2
                  mulh         s8, zero, s0
                  fcvt.w.s     t2, fs3, rmm
                  fsgnjx.s     fs8, fs6, fa2
                  andi         s2, a4, -1667
                  lui          a1, 604648
                  rem          s8, s3, s0
                  xor          a5, t3, t2
                  fmul.s       ft10, fs7, ft8, rup
                  mulhsu       s8, t5, s7
                  fmin.s       fs10, ft4, fs11
                  divu         s11, s7, a6
                  fmul.s       fs6, fs5, ft2, rdn
                  div          t3, s9, s10
                  andi         t6, s2, -1243
                  remu         a1, a4, a6
                  remu         a1, tp, t0
                  fcvt.s.wu    fs4, t1, rne
                  fcvt.wu.s    t2, ft6
                  srli         tp, s6, 17
                  fsub.s       fs8, ft3, ft7, rdn
                  fcvt.s.wu    fa1, t2
                  fsgnjx.s     ft10, fa0, ft0
                  fadd.s       fs2, fs0, fa7
                  ori          t5, s10, 794
                  fmv.w.x      fs11, gp
                  xor          a3, s11, s7
                  auipc        s10, 265814
                  srl          a1, s0, a0
                  slli         s2, a0, 14
                  fsgnjn.s     fa3, ft10, fa4
                  mulhsu       gp, t4, a5
                  ori          t5, s3, -991
                  rem          sp, s10, t6
                  flt.s        s10, fa5, fa2
                  fcvt.w.s     sp, ft7
                  mulh         t3, s1, s9
                  sltiu        ra, a1, 342
                  fmv.x.w      s11, fa7
                  srl          t4, s7, t6
                  fmax.s       ft3, fa2, fa6
                  fmv.w.x      fa5, s4
                  srai         ra, t3, 10
                  xor          s0, a2, s4
                  fmin.s       ft11, fa7, fs4
                  fclass.s     sp, ft4
                  fmin.s       fa3, fa3, fs7
                  fadd.s       fa6, fa6, fs1
                  slti         s8, t5, 1327
                  fcvt.wu.s    t0, ft3, rmm
                  slli         tp, a4, 26
                  mul          s3, tp, t4
                  mulh         s7, a5, s8
                  ori          s0, s6, 21
                  sub          t4, t1, a7
                  remu         s8, tp, a2
                  fclass.s     t2, fa5
                  sra          a7, a6, s1
                  fcvt.s.wu    fa7, s1, rup
                  fmv.x.w      t6, ft6
                  srai         a7, t2, 17
                  srai         a0, a2, 3
                  fsgnjx.s     fs3, ft0, fs1
                  fle.s        a0, fs5, fs7
                  srai         gp, t1, 24
                  sub          s9, s7, sp
                  fadd.s       ft10, fa1, ft11, rdn
                  fcvt.wu.s    s4, fs1, rmm
                  add          a4, s3, s1
                  fcvt.s.wu    ft11, s1
                  addi         a4, t1, 1901
                  sll          s7, s4, s7
                  add          s10, a4, t0
                  rem          t4, s6, a3
                  sub          t5, t5, a0
                  xori         t3, s3, 314
                  fcvt.s.w     ft10, a7
                  fsub.s       fa1, ft4, fa3, rdn
                  mulhu        s0, t5, a1
                  fcvt.s.w     fa2, zero, rmm
                  mulhsu       s10, t4, s7
                  andi         s5, s11, -252
                  remu         t4, s8, s5
                  and          a4, s5, t3
                  fclass.s     s8, fs11
                  fsqrt.s      ft11, fa7
                  fcvt.s.w     ft2, t4, rmm
                  div          a3, t0, ra
                  fmax.s       ft0, ft1, ft1
                  fsgnjx.s     ft11, ft3, fs2
                  fcvt.s.wu    fa0, a4, rne
                  sub          a0, t3, s11
                  fle.s        t6, ft11, fa3
                  slti         gp, s9, 627
                  mulhu        s7, a0, t4
                  fclass.s     tp, fs2
                  or           s7, t1, a6
                  sra          a2, gp, t4
                  sltiu        a3, s3, 831
                  sltiu        sp, a2, -45
                  slli         a0, t2, 11
                  xor          a5, a2, sp
                  fsub.s       fs6, fa6, fa2
                  and          a1, t2, s1
                  fsgnjn.s     fa4, ft8, fs2
                  auipc        t2, 967584
                  rem          s2, zero, t5
                  xori         a3, tp, 1230
                  mul          s5, a5, a2
                  or           s8, s8, s2
                  fsgnjn.s     fs10, fs11, fs7
                  srai         a3, t1, 4
                  ori          s3, s7, -1185
                  fdiv.s       fs5, fa0, fa1, rmm
                  remu         s1, s2, a5
                  fsub.s       fs3, fa5, fa0, rmm
                  slli         s4, t5, 22
                  fcvt.w.s     s3, fs6, rmm
                  flt.s        zero, fa4, ft10
                  fmin.s       ft8, fs0, fs1
                  or           zero, a3, s4
                  flt.s        s3, fs3, fs2
                  xori         s9, s3, -1388
                  sltu         s8, ra, s0
                  fsub.s       fs2, fa5, ft8, rmm
                  lui          s4, 298057
                  divu         gp, a6, s2
                  fclass.s     zero, ft10
                  or           tp, a2, s3
                  mulhu        gp, a2, s8
                  fdiv.s       ft0, fa6, fa7, rmm
                  fclass.s     a1, fs2
                  andi         s1, s11, -1585
                  addi         t5, t1, 779
                  fmin.s       ft11, fs9, ft11
                  rem          s4, a6, t3
                  srai         s4, s0, 10
                  mulhsu       a5, a5, sp
                  andi         a0, t3, -467
                  sll          t6, a3, s11
                  fmv.x.w      s10, fa5
                  fmv.x.w      a3, ft1
                  fsgnjx.s     fs8, fa3, fs6
                  fcvt.s.wu    ft3, a5, rtz
                  sltu         a7, s3, t4
                  remu         s4, s6, s6
                  andi         t3, a6, -241
                  fcvt.w.s     s5, fs11, rdn
                  fle.s        s9, fa1, fs3
                  feq.s        s8, ft10, ft2
                  auipc        a5, 313718
                  sub          t2, zero, s1
                  feq.s        s5, ft1, ft8
                  mulhu        s8, s3, s9
                  feq.s        tp, ft0, ft0
                  xor          s7, s11, sp
                  fmul.s       ft8, ft2, fs4
                  mul          s8, a6, t5
                  fcvt.s.w     fs4, gp
                  lui          s5, 804468
                  fmin.s       ft8, ft8, ft8
                  feq.s        t3, fs3, ft8
                  and          t6, a5, a4
                  fmv.x.w      tp, fs4
                  fadd.s       fs6, ft7, fs11
                  sll          t6, ra, gp
                  mulhsu       a0, s2, s4
                  auipc        a1, 750205
                  sltu         t6, a5, s5
                  mul          a5, t0, sp
                  fclass.s     s5, ft4
                  sltiu        t4, t4, -843
                  fcvt.wu.s    s2, fa6
                  andi         t2, a6, -1589
                  fclass.s     a3, ft10
                  fmv.x.w      t4, fs5
                  auipc        a7, 199298
                  sltu         t3, zero, a4
                  and          a1, t1, s8
                  mulhsu       a3, s4, a2
                  fsgnj.s      ft8, fs5, fs4
                  lui          t2, 88117
                  fsgnjn.s     fs5, ft10, ft10
                  sltu         s2, a2, a0
                  fcvt.w.s     s0, fs8
                  fclass.s     t0, fs11
                  mulhu        a4, zero, t0
                  fclass.s     ra, ft2
                  sub          t5, s9, a4
                  xori         a1, gp, -99
                  fmv.x.w      s2, ft10
                  div          ra, s0, ra
                  or           a4, s5, s9
                  xor          a7, zero, t5
                  mulhu        zero, t4, t6
                  rem          a4, a6, t4
                  fmul.s       ft0, ft2, fs9
                  fsgnjn.s     fa2, fs6, ft7
                  fsgnjx.s     fa4, fs1, fs0
                  div          s10, a5, a1
                  fcvt.s.wu    ft1, t4, rdn
                  addi         s7, s8, -1993
                  addi         s9, tp, 1814
                  addi         a5, gp, 1066
                  nop
                  divu         tp, sp, t1
                  mulh         a4, s7, t0
                  mul          a7, s9, s2
                  andi         gp, t0, -464
                  slt          t0, s8, a3
                  mul          s7, a0, t2
                  lui          ra, 124941
                  fcvt.s.w     ft6, s3, rne
                  xori         gp, s1, -170
                  slt          t3, tp, a5
                  xor          zero, a2, a6
                  mulh         a3, s6, s6
                  andi         sp, gp, -1142
                  add          zero, s1, a4
                  auipc        s4, 1044230
                  slli         a1, a1, 2
                  mul          t5, gp, tp
                  flt.s        a3, fs1, ft8
                  fmul.s       fa6, fs7, ft0
                  sltu         a3, a3, t5
                  auipc        a7, 348
                  remu         s8, s9, t6
                  auipc        t5, 443832
                  rem          t5, s6, s9
                  mulhu        a5, t5, sp
                  lui          t0, 36595
                  fsgnj.s      ft6, ft8, fs7
                  flt.s        s2, fs5, ft6
                  lui          ra, 50341
                  addi         t4, t3, 1154
                  mul          a2, ra, sp
                  ori          a0, t6, 216
                  mulhsu       ra, a5, s11
                  sra          s3, gp, t2
                  add          s1, a6, s8
                  remu         a5, ra, a0
                  and          s2, t3, t3
                  fdiv.s       ft7, fs7, ft7, rmm
                  divu         t4, ra, a2
                  fdiv.s       ft10, ft2, fa6
                  sltu         s2, s2, s1
                  feq.s        a4, fa4, fa6
                  addi         a5, a6, 190
                  srli         a5, a3, 10
                  fadd.s       fs10, ft7, fa3, rup
                  sra          s1, s0, a1
                  andi         s1, sp, -2010
                  div          a7, a2, s11
                  slti         a4, tp, 1685
                  fsgnjn.s     fs0, fa7, fs5
                  auipc        a3, 699721
                  flt.s        a0, fa0, fs6
                  mulhsu       a0, a0, sp
                  srai         s8, a2, 17
                  mulhsu       s9, s4, t3
                  fcvt.w.s     zero, fs3
                  remu         a4, a6, s10
                  sra          s8, t6, s1
                  fmv.w.x      ft7, s1
                  sll          s10, a6, t4
                  add          a3, t4, a3
                  slt          sp, s3, t3
                  mulh         tp, t6, t5
                  mulh         s2, t5, a7
                  rem          s1, a2, s10
                  mul          ra, s10, a2
                  remu         ra, a7, t1
                  sll          s9, s8, a7
                  xor          s11, t3, tp
                  srli         s2, s1, 20
                  srai         ra, a6, 18
                  sub          a1, s6, sp
                  fmv.x.w      s5, ft8
                  flt.s        t6, fs1, ft7
                  div          t4, sp, s7
                  feq.s        s2, fa7, fs10
                  remu         s10, t3, s9
                  slt          gp, a4, s7
                  xori         s11, s7, -347
                  ori          s0, zero, 1492
                  addi         t4, s3, -940
                  rem          s11, gp, sp
                  xor          s0, t4, s9
                  mul          s5, a1, s10
                  sub          zero, gp, s3
                  srai         t0, ra, 6
                  fmin.s       ft1, fa6, ft3
                  fmv.x.w      s3, fa0
                  fcvt.s.w     ft3, s5, rup
                  fmul.s       fa0, ft5, ft7, rup
                  auipc        a5, 500596
                  lui          gp, 692182
                  fmv.x.w      s3, fs9
                  fdiv.s       fs2, ft3, fs11, rmm
                  fcvt.s.w     fs0, a0
                  fsgnjx.s     fa5, ft1, ft8
                  mulhsu       t2, a2, t5
                  fclass.s     t4, fs0
                  srl          s3, t6, s10
                  slti         s2, s9, -1958
                  sub          a2, gp, t5
                  srai         s10, t4, 0
                  srl          t6, a5, s7
                  or           s2, t2, t1
                  sltiu        a3, s0, -969
                  fsgnjn.s     ft8, ft3, fs11
                  fclass.s     s8, fa2
                  slli         gp, s4, 9
                  flt.s        t2, ft5, ft5
                  fsgnj.s      fa6, fs7, fa6
                  fmul.s       fa1, ft0, fa4
                  or           a3, a7, gp
                  srl          s9, a5, t3
                  fmin.s       ft1, fa0, fs3
                  fdiv.s       ft9, ft2, fs0
                  slt          s10, a5, s11
                  fmin.s       fa3, ft10, ft4
                  sll          ra, s4, s8
                  sra          s2, s0, t5
                  auipc        s8, 932774
                  sltiu        t4, gp, -1081
                  fmv.w.x      fa0, a6
                  sltu         t5, a6, ra
                  slli         a1, s5, 7
                  andi         a2, s8, 1518
                  slli         s8, s5, 17
                  ori          s0, gp, 573
                  flt.s        a2, fs10, ft5
                  div          zero, s3, sp
                  lui          s10, 575103
                  slti         s8, t5, 242
                  fcvt.wu.s    t6, ft8
                  fmv.x.w      tp, fs5
                  auipc        a0, 351388
                  sltiu        t2, t3, 2007
                  addi         gp, sp, 1223
                  mulhsu       a0, s10, zero
                  fdiv.s       ft10, fa3, ft8, rup
                  fsgnj.s      fs11, fs3, fs0
                  fcvt.w.s     s7, ft3, rne
                  remu         s7, a4, s7
                  addi         s8, s4, -903
                  fmax.s       fs3, ft3, fs6
                  fle.s        s3, fs4, ft11
                  xor          zero, s11, t5
                  add          sp, t2, t0
                  fcvt.wu.s    s3, fa1
                  addi         t5, s2, 427
                  slli         t2, zero, 19
                  rem          s4, s0, s8
                  mul          s10, s1, a2
                  fsub.s       ft3, fs2, fs5
                  auipc        t5, 246964
                  feq.s        a1, fs5, ft5
                  remu         zero, t4, s0
                  fcvt.s.wu    fa0, zero
                  addi         a3, t3, 1224
                  fcvt.s.wu    ft8, a1, rne
                  feq.s        t3, ft7, ft9
                  or           a4, s11, s6
                  srli         s11, a0, 26
                  fcvt.wu.s    s1, fa7, rtz
                  remu         t2, t6, t4
                  fmin.s       fs10, fa6, fs0
                  fsgnj.s      ft5, fa3, ft5
                  auipc        s0, 526641
                  andi         s8, a0, 2043
                  flt.s        s7, fa1, ft6
                  xori         sp, t6, 1692
                  or           s10, a4, s11
                  feq.s        a1, ft5, fs2
                  fcvt.wu.s    ra, fs0
                  srl          s9, s2, t1
                  fcvt.wu.s    t0, fs9, rdn
                  mulhu        s7, t0, s10
                  fsgnjn.s     fs2, fs2, fs5
                  fsgnjx.s     fs5, fa3, ft6
                  fmax.s       ft9, ft8, fa4
                  div          a1, a2, a3
                  fsgnj.s      fa5, fa1, fa5
                  fcvt.s.wu    ft5, s8
                  fdiv.s       ft4, fs8, ft8
                  slli         t5, s6, 18
                  mul          a3, tp, t3
                  sltiu        a3, t6, -184
                  add          ra, a5, a3
                  mulhsu       s9, a0, s9
                  fsgnjx.s     fs6, fa1, fa1
                  srli         t3, s3, 25
                  flt.s        zero, ft2, ft0
                  sub          a1, t4, a6
                  add          s8, s5, sp
                  fsgnjn.s     fs5, ft7, fs2
                  or           a0, t4, s4
                  lui          s8, 120297
                  divu         s3, t3, a2
                  fsqrt.s      ft7, fs0
                  srl          a5, t3, t0
                  fcvt.w.s     gp, fs11
                  srai         tp, t5, 11
                  fcvt.wu.s    t2, ft4, rne
                  rem          s5, s1, gp
                  div          t2, ra, s6
                  sltu         s1, a6, s0
                  fdiv.s       fs7, ft0, fa0, rdn
                  and          sp, t4, s11
                  fclass.s     s5, fa1
                  fcvt.wu.s    gp, ft9, rup
                  and          s7, a0, a2
                  divu         s8, s4, s4
                  srli         a0, sp, 26
                  fadd.s       fa5, fs9, fs11
                  feq.s        s1, fs2, fa0
                  addi         s7, t3, -1873
                  fcvt.w.s     t0, fs9, rup
                  fsub.s       fa4, ft2, fa3, rtz
                  fmul.s       ft4, ft6, fs6, rup
                  div          s1, a2, s6
                  fcvt.s.wu    fs9, s8, rmm
                  sra          t4, s0, s10
                  fmv.w.x      fs1, s2
                  sub          s4, s0, s0
                  fmv.x.w      s4, fs5
                  srl          a7, ra, t6
                  or           a7, tp, t0
                  lui          t2, 994633
                  fsgnjn.s     fs5, fs11, fs9
                  sub          t5, s11, zero
                  xori         a3, a7, 733
                  fsub.s       ft8, ft7, fs11, rne
                  slli         s3, sp, 26
                  fdiv.s       fa6, ft9, fa0
                  feq.s        a5, fa7, ft0
                  srai         zero, t3, 22
                  feq.s        a1, ft8, ft8
                  mulhsu       t3, t2, t2
                  fsgnj.s      ft11, fa1, fa2
                  fdiv.s       fa7, ft10, fa6, rtz
                  fcvt.w.s     ra, ft10, rtz
                  srl          ra, tp, a0
                  lui          sp, 113808
                  xor          sp, s11, t1
                  add          s4, a1, tp
                  srai         gp, t1, 4
                  feq.s        a4, ft7, ft6
                  div          zero, a5, s4
                  feq.s        tp, fs4, fa3
                  fclass.s     s1, fa6
                  fmul.s       fs5, fa6, ft1
                  divu         gp, s10, s4
                  sltiu        t5, tp, -49
                  nop
                  slti         s0, s5, 1824
                  fle.s        s11, fa2, fs5
                  rem          s5, zero, zero
                  fcvt.w.s     a0, fs0
                  srai         s11, a6, 4
                  flt.s        t0, fa0, ft5
                  sub          t4, a4, zero
                  rem          s7, s2, a5
                  addi         s2, s2, 112
                  lui          a0, 790436
                  ori          s5, t5, 305
                  slt          a7, s1, a5
                  srl          s5, s2, s11
                  fcvt.w.s     a1, ft0, rmm
                  addi         sp, s7, -1181
                  sltu         t2, s2, s4
                  rem          gp, s7, a3
                  fsgnjn.s     fs5, ft6, fa4
                  sltu         s5, a6, s2
                  fclass.s     a2, ft9
                  fsgnj.s      ft5, fs4, fs8
                  slt          zero, s3, s4
                  fcvt.s.w     fs2, a1
                  fmul.s       fs2, ft3, fa0, rmm
                  xor          s9, sp, t5
                  lui          s0, 182439
                  addi         s0, s1, -93
                  fmax.s       ft2, ft0, fs0
                  addi         a2, t5, 1381
                  addi         ra, s5, -630
                  fcvt.wu.s    t3, fs10, rmm
                  fmax.s       fs6, ft1, fa0
                  slti         s7, s8, -970
                  remu         t6, gp, ra
                  fadd.s       ft1, ft1, ft3
                  andi         gp, t6, 1299
                  andi         s10, s9, -1276
                  fle.s        t2, ft7, ft11
                  fle.s        tp, ft9, ft2
                  fcvt.s.wu    ft9, a4
                  fsub.s       ft6, fs0, fa7
                  div          a4, t3, a2
                  mulhu        s3, t4, a7
                  divu         s0, t0, a3
                  addi         s1, a1, 113
                  andi         s9, s8, 1059
                  add          s2, s9, a4
                  div          a7, t2, ra
                  sra          a3, s3, ra
                  lui          gp, 205527
                  nop
                  sra          s10, s10, s10
                  lui          a4, 336736
                  sra          a5, t0, t4
                  fmul.s       fs7, ft2, fs0
                  mulhsu       a2, zero, s9
                  rem          t5, a1, t3
                  fcvt.s.w     fs5, s0, rne
                  mulh         t0, s11, t4
                  srai         s3, t4, 17
                  sub          a3, a0, t4
                  feq.s        s11, ft6, fa5
                  xori         a5, t2, 1978
                  sll          a2, t0, t3
                  divu         t6, ra, t3
                  fsqrt.s      fs7, fs3
                  or           s9, s5, zero
                  rem          a1, s2, s2
                  mulh         ra, t2, a2
                  fmv.x.w      s9, fs1
                  srli         s3, a1, 5
                  fle.s        s5, fs10, fa5
                  slli         s10, t4, 27
                  fmv.x.w      s8, fs1
                  lui          a2, 187664
                  add          s1, s0, a7
                  fmv.w.x      fa6, s10
                  fsgnjn.s     fs5, fs8, fa3
                  remu         s11, t2, s0
                  mul          tp, t5, s4
                  slli         a5, s4, 2
                  lui          zero, 280813
                  slli         s7, gp, 13
                  xori         zero, t5, 1352
                  srli         zero, a2, 0
                  mulhsu       t3, s1, a0
                  fmv.x.w      s9, ft9
                  lui          a0, 619579
                  fle.s        a4, ft1, fs11
                  addi         s8, s9, 807
                  or           ra, a0, gp
                  fcvt.wu.s    ra, fa7
                  fsgnjx.s     ft7, fs4, ft1
                  slli         s7, s10, 21
                  div          a1, t4, gp
                  flt.s        sp, ft0, fs8
                  flt.s        a1, ft3, ft11
                  srl          a2, zero, a0
                  fcvt.wu.s    ra, fs7
                  auipc        a5, 570740
                  addi         a2, s5, 664
                  mulh         zero, a0, t3
                  mul          t0, a5, t0
                  fsub.s       fs11, fs4, fs6
                  nop
                  fcvt.s.wu    ft5, a5
                  mulhu        s2, s6, s8
                  slti         a3, s11, 936
                  fcvt.w.s     a0, fa6, rup
                  fadd.s       fs5, fa0, fa4
                  sra          a7, a6, t5
                  fle.s        s5, ft5, fa5
                  fsqrt.s      ft5, fs11, rup
                  fclass.s     a0, fa5
                  sltu         a5, t4, s5
                  mul          s8, a1, zero
                  fmax.s       ft5, fs0, fa0
                  slti         s8, a5, -1120
                  fclass.s     sp, fs0
                  fsgnjn.s     fs0, fa5, fs0
                  xori         s1, gp, -400
                  fmv.x.w      s0, ft1
                  fmv.w.x      ft3, s0
                  mulhu        s0, t1, a0
                  fmv.x.w      a5, ft7
                  fcvt.s.w     fs11, s7, rmm
                  or           t0, t0, s10
                  fcvt.w.s     s3, fa2
                  fmv.x.w      t3, fs7
                  fcvt.wu.s    a0, fs4
                  lui          s1, 145714
                  feq.s        t0, ft6, fa4
                  or           t5, a4, s5
                  fmax.s       fa2, fs11, ft11
                  mulhu        s4, s10, s7
                  srl          t0, a7, t1
                  fsgnjn.s     fs3, fs10, fa7
                  xori         t6, s0, 316
                  andi         a4, zero, 880
                  auipc        ra, 329250
                  divu         zero, a4, a0
                  fmax.s       ft5, fs7, fa5
                  or           s9, s0, a3
                  fcvt.w.s     t0, fs9, rup
                  fadd.s       fa0, fs8, ft5
                  sra          s4, t1, t3
                  xor          a2, tp, t1
                  fmv.w.x      fa2, s4
                  sub          t2, s5, s6
                  fsgnj.s      fs11, fa2, fs2
                  fmv.w.x      ft7, a4
                  or           t5, a7, t0
                  sub          t0, s4, ra
                  fdiv.s       fs0, ft4, fs10, rmm
                  slt          sp, ra, a3
                  slti         s2, t4, 1626
                  sltu         a3, s7, a5
                  fadd.s       fs4, fa4, ft9, rtz
                  fmax.s       ft2, fs7, fa2
                  feq.s        s7, fs1, ft4
                  remu         sp, s11, t4
                  fcvt.wu.s    t4, fa0, rtz
                  slli         a7, t5, 21
                  xori         ra, s8, -84
                  fcvt.wu.s    s2, fa2, rdn
                  fsgnjn.s     ft0, fs4, fs3
                  add          a5, s4, s5
                  fmul.s       ft8, ft5, fs4, rdn
                  srl          s9, zero, s8
                  auipc        s2, 398341
                  auipc        sp, 1002366
                  div          t5, s1, s7
                  nop
                  mulh         s9, t0, a2
                  srli         s7, s7, 25
                  fadd.s       fa7, fs11, fs11
                  fmul.s       fs0, ft9, fa5
                  divu         a7, s8, s6
                  fsgnj.s      ft11, ft5, fa2
                  fcvt.wu.s    t6, fs5, rup
                  fmv.w.x      ft8, s3
                  srli         a7, s4, 20
                  fsub.s       fs1, fa3, ft5
                  fsqrt.s      ft9, fa1, rtz
                  sub          sp, s8, s7
                  xori         s1, s11, 305
                  fmv.x.w      a0, ft5
                  fmv.x.w      gp, ft6
                  sra          a1, a1, s2
                  mul          a2, s7, gp
                  fadd.s       fa5, ft10, ft3, rmm
                  flt.s        a1, fs0, fs10
                  and          t4, s10, s10
                  sub          s7, s3, t4
                  nop
                  nop
                  fcvt.w.s     a4, ft3, rtz
                  andi         t3, a3, 1879
                  add          s10, s11, a2
                  mulhsu       s1, t3, a3
                  fsgnjx.s     fa6, fs0, fa3
                  sra          s7, s0, s1
                  ori          t0, s10, 521
                  sll          a5, s9, zero
                  fsub.s       fs10, ft8, fs4
                  slti         s7, t5, 1198
                  slti         s3, s6, 439
                  fmin.s       fa1, fs11, ft0
                  fsgnjx.s     fs10, fs2, ft4
                  fdiv.s       fa3, fs2, fs5
                  mulhsu       a4, s11, t5
                  div          tp, t6, t6
                  xori         sp, s9, -881
                  fcvt.s.wu    ft5, a2, rmm
                  fcvt.s.wu    fa7, ra
                  mulhu        s10, t1, s3
                  mulhu        s0, t1, s7
                  rem          s10, a5, s5
                  fsgnjx.s     fs3, fa2, ft3
                  fdiv.s       ft11, ft4, fs0, rdn
                  ori          sp, t4, -1346
                  auipc        a5, 751448
                  fcvt.wu.s    t4, ft2
                  fmv.w.x      fs1, tp
                  fmax.s       ft2, ft4, ft0
                  sra          s11, gp, s7
                  sub          s7, t5, a2
                  fsgnjn.s     ft7, fa3, fa0
                  add          t3, s1, t5
                  remu         s1, sp, t5
                  fcvt.s.wu    fa6, zero
                  srli         ra, a1, 17
                  rem          s7, s3, a5
                  sub          tp, t6, s10
                  sra          tp, a3, zero
                  fmul.s       ft10, fs8, ft9
                  fclass.s     s4, ft4
                  srli         zero, t6, 23
                  xori         a3, s0, -455
                  xori         s9, s8, 242
                  sll          s1, t1, t0
                  divu         a5, s0, s1
                  mulhsu       s3, zero, sp
                  xor          t0, a3, t2
                  sltu         s5, a2, t4
                  fmul.s       ft0, fs11, fs11
                  fmv.w.x      ft7, a5
                  fcvt.w.s     zero, ft7
                  ori          t4, zero, 804
                  fsub.s       ft3, fs9, fa1
                  mulhu        s4, a4, s3
                  remu         a7, t3, s7
                  flt.s        zero, ft6, fa1
                  sltu         s10, t0, t0
                  nop
                  sra          t5, s3, t4
                  add          s2, s2, t3
                  fmv.w.x      ft9, tp
                  fcvt.s.wu    fa1, s9
                  fsqrt.s      ft8, fs4
                  sub          s9, s3, t5
                  fclass.s     s2, ft5
                  slt          tp, sp, s7
                  fle.s        t0, ft9, ft4
                  fmax.s       fs10, fa0, fs6
                  srli         t5, a3, 8
                  andi         t3, tp, -1691
                  slt          s8, a3, t6
                  sltu         gp, s10, zero
                  and          sp, s10, a5
                  sltu         gp, s0, s5
                  srl          a2, t5, t5
                  fsgnjn.s     fs3, fs10, fs9
                  fsqrt.s      fa5, fs1
                  slt          s10, s8, s11
                  fcvt.wu.s    s3, ft8, rdn
                  fdiv.s       ft3, ft7, ft10, rtz
                  feq.s        sp, ft2, fa1
                  addi         tp, s0, 1438
                  fcvt.s.w     fs11, s11
                  sll          s4, s6, gp
                  mul          s2, a3, s0
                  fcvt.s.w     ft0, a7, rup
                  fmax.s       fa4, fs6, fs11
                  fclass.s     sp, fs10
                  andi         s4, t4, -1131
                  fcvt.w.s     a7, ft9, rmm
                  slt          t4, sp, s2
                  fmul.s       ft2, fs5, fs8
                  mulhsu       s5, a2, s7
                  slti         s3, zero, -816
                  nop
                  auipc        ra, 81425
                  fcvt.s.wu    ft4, gp
                  xor          s9, a6, t1
                  lui          sp, 89555
                  fsqrt.s      ft1, fa2
                  fsub.s       fs4, fs7, fa2
                  rem          s0, ra, t6
                  auipc        zero, 500491
                  fcvt.s.w     ft3, a4
                  fmin.s       fs5, fa0, fs6
                  slti         s7, a5, -1028
                  sll          a2, zero, t6
                  auipc        a1, 1046241
                  or           zero, t0, s1
                  fsgnj.s      fa4, ft10, ft1
                  srli         s5, s5, 4
                  flt.s        s3, ft6, ft10
                  mul          s8, a3, a1
                  fcvt.w.s     a7, fa1
                  div          s3, s2, s11
                  ori          a4, t6, 746
                  fdiv.s       ft11, ft11, ft10, rup
                  and          s7, s9, s8
                  slli         s7, gp, 11
                  fadd.s       ft9, fa0, ft11, rdn
                  fmv.w.x      ft10, s1
                  sra          a7, t5, s4
                  fdiv.s       fs0, ft11, ft8
                  divu         a1, s3, s11
                  mulhsu       s3, t4, a7
                  divu         a0, sp, t6
                  fmul.s       fs7, fa3, fs5, rtz
                  fcvt.s.wu    fa3, s0
                  div          s10, t4, s3
                  fsgnj.s      ft11, fs3, ft9
                  lui          s11, 824064
                  flt.s        a1, ft5, fs11
                  fmul.s       fa0, fa6, ft11, rtz
                  fmul.s       fa1, ft8, fs5
                  fdiv.s       fs10, fs11, ft7
                  fmv.w.x      fa7, gp
                  mul          a3, zero, a2
                  srl          s3, s10, a6
                  fmax.s       ft3, fs11, fs2
                  mul          s8, s6, t4
                  fsqrt.s      ft1, ft11, rtz
                  fclass.s     zero, fs4
                  fsub.s       fa6, fa1, fa3
                  xori         t5, s3, -998
                  auipc        t0, 110504
                  fmv.w.x      fa5, a6
                  addi         s9, zero, 1459
                  addi         s8, t1, -1403
                  sltiu        ra, s3, 1013
                  mulhu        s7, a7, s2
                  fcvt.s.w     fa3, a6
                  xor          tp, s8, ra
                  remu         gp, zero, s0
                  fsgnjn.s     ft2, fs6, ft7
                  xori         a3, s3, 1346
                  xori         t0, a3, 826
                  srai         t5, t3, 9
                  and          t2, t1, t4
                  div          ra, s2, t3
                  fdiv.s       fs3, ft5, fs2
                  fcvt.wu.s    t2, ft0
                  auipc        ra, 78270
                  fsgnjx.s     ft7, fs10, fs10
                  fsgnj.s      fs4, fa5, ft1
                  fcvt.s.wu    fs9, sp, rtz
                  fmax.s       fs8, ft3, fs9
                  fsgnj.s      ft4, fs7, ft7
                  auipc        a0, 825265
                  fdiv.s       ft9, fs2, ft2, rdn
                  fmax.s       fa5, fs4, ft4
                  fsgnj.s      fs0, ft1, ft2
                  mulhu        s8, t6, a2
                  fcvt.w.s     t2, fs3
                  srai         tp, t5, 17
                  and          t2, t2, a2
                  add          t0, s2, s0
                  slt          s7, t6, a0
                  fdiv.s       ft6, fa3, ft10
                  sra          s11, s8, a0
                  div          t4, t2, zero
                  fmv.x.w      a1, ft2
                  srai         a7, a0, 30
                  slt          s0, s4, s5
                  fdiv.s       fa2, ft10, ft7
                  sltiu        zero, s0, -1725
                  srli         a5, t0, 0
                  divu         s5, s11, s9
                  sll          tp, tp, zero
                  mulhu        gp, a4, s3
                  fmul.s       ft4, fa0, fs4
                  mulh         s1, s10, s2
                  mul          sp, ra, t2
                  ori          t6, a2, -1927
                  sll          t0, s4, t0
                  mulhsu       s4, s0, a1
                  fmv.w.x      ft7, sp
                  fmv.x.w      s8, fa0
                  addi         s2, s9, 1471
                  srai         gp, t0, 19
                  fcvt.wu.s    a2, ft5
                  fmin.s       ft11, ft2, ft2
                  fsgnjn.s     ft1, ft10, fs4
                  srai         s1, t5, 24
                  slt          s9, a2, a6
                  ori          t5, gp, 624
                  feq.s        zero, fs4, ft9
                  addi         a4, s8, 1785
                  lui          s5, 289493
                  sra          a2, s0, s0
                  slti         s3, s2, -1164
                  divu         zero, t4, s4
                  sll          t6, gp, s3
                  sltu         sp, s9, a0
                  lui          s0, 2610
                  add          a1, t3, t0
                  fmv.w.x      fs6, sp
                  mul          s11, t2, s4
                  flt.s        s4, fs3, ft4
                  fsgnjn.s     fs4, fs8, ft7
                  fle.s        a4, fa1, fs7
                  flt.s        t3, ft6, fs11
                  mul          ra, s1, s0
                  xori         s8, t4, 4
                  fmax.s       ft4, ft8, fa5
                  sub          t2, t1, s1
                  addi         t2, s10, -1083
                  fsgnjn.s     fs8, fa3, fs10
                  mulhu        s11, s5, s2
                  sltu         s3, t5, s3
                  fmv.x.w      a1, ft2
                  add          s7, a6, s8
                  divu         a3, s10, tp
                  auipc        t0, 587320
                  auipc        zero, 524554
                  lui          ra, 650671
                  fsqrt.s      fa0, fa0, rdn
                  slt          t4, s4, t0
                  mul          s2, s10, t5
                  xori         t5, a7, -973
                  nop
                  fsgnjx.s     fa6, fs1, fs6
                  auipc        s0, 837642
                  fdiv.s       ft9, ft9, ft10
                  fmv.w.x      fs8, zero
                  sltu         s3, s10, s4
                  sltu         a4, s10, s2
                  remu         s8, s10, s4
                  mulhu        a4, t4, t1
                  mul          s8, s11, s1
                  xor          s8, s2, s11
                  fsgnjx.s     fs7, fs5, fs9
                  sll          s2, gp, t3
                  mulh         a5, s1, s4
                  fcvt.wu.s    a0, ft9
                  fle.s        a2, ft2, fa4
                  fcvt.w.s     sp, fs3
                  fcvt.wu.s    t2, fs8
                  xori         t4, t1, 1748
                  mulh         a5, t5, t3
                  fsqrt.s      ft11, fs6
                  fcvt.wu.s    t3, ft7
                  divu         t5, gp, tp
                  lui          s9, 514892
                  sltu         t6, s6, gp
                  div          t4, t4, t4
                  ori          a3, s8, 953
                  add          ra, s3, a0
                  fsgnjn.s     fa5, ft8, fs4
                  div          s0, s3, a1
                  xor          zero, a0, a6
                  lui          a1, 358426
                  fcvt.s.wu    fs10, s10, rup
                  fcvt.s.w     fa7, a1, rne
                  fadd.s       ft3, ft6, fs5, rne
                  fclass.s     s1, fa3
                  fsgnjn.s     ft9, fa0, fa6
                  fmv.x.w      sp, fs11
                  fmax.s       fs11, fs7, fs4
                  fclass.s     gp, fs11
                  sltiu        t2, a1, 1353
                  fsgnjx.s     ft4, ft5, fa4
                  srl          s10, gp, s9
                  slti         s3, sp, 899
                  fmax.s       ft3, ft10, fa7
                  xori         s10, t4, 636
                  div          a1, a1, s5
                  mulhsu       s0, a4, t1
                  xori         s9, a7, 2007
                  flt.s        sp, ft11, fs5
                  fadd.s       ft3, fs4, ft11
                  xori         s8, s5, -1742
                  feq.s        a7, fa3, fa7
                  fle.s        s9, ft2, fa6
                  mul          a3, s7, s6
                  flt.s        tp, fs1, fa0
                  sltu         s7, a5, a2
                  divu         t4, a2, zero
                  fle.s        t4, ft4, ft11
                  rem          zero, a3, ra
                  addi         s10, t5, 962
                  and          tp, gp, t2
                  xor          s0, s4, a4
                  srl          t0, t0, s9
                  div          s10, t1, t5
                  nop
                  srai         s11, s3, 24
                  fsqrt.s      fs2, ft4
                  add          ra, t5, t6
                  fcvt.w.s     s9, fs2, rup
                  fcvt.s.wu    ft5, gp, rmm
                  fmv.x.w      a7, fa5
                  fsgnjn.s     fs3, fa5, ft8
                  fdiv.s       ft0, ft7, ft6, rup
                  divu         s0, s9, t3
                  slt          gp, t3, t6
                  lui          sp, 350196
                  mulh         s3, a6, t4
                  or           s2, s2, ra
                  fmv.w.x      fs8, s6
                  sltiu        t6, s9, 1055
                  fsgnjn.s     fs2, ft8, fa2
                  slli         tp, ra, 6
                  fmv.w.x      fa1, s7
                  divu         tp, a7, s0
                  fcvt.wu.s    zero, ft3
                  sltiu        a0, ra, 1992
                  mulh         a1, s9, tp
                  xor          s4, s8, t2
                  or           a0, t0, a0
                  mulh         sp, s8, a7
                  srl          zero, t5, t5
                  fmul.s       ft6, fs10, fa7
                  srai         s1, t0, 30
                  fmin.s       fs11, ft10, ft7
                  fsub.s       ft7, fs3, fs6, rne
                  slti         s2, s11, -1900
                  sltu         a2, tp, ra
                  mul          tp, s3, t6
                  fsgnjn.s     fs9, fa4, fs6
                  fmv.x.w      s7, fa0
                  srl          s10, a6, s0
                  sltiu        s10, s6, -1799
                  sll          t0, t2, s10
                  mulh         s4, s0, s2
                  fsqrt.s      fa4, ft3, rne
                  mulh         a3, s9, t2
                  fcvt.s.wu    fa1, s1, rtz
                  divu         s3, ra, a2
                  remu         zero, a4, s9
                  fcvt.s.wu    ft1, a1
                  sub          a4, a7, a7
                  lui          s7, 74163
                  fmax.s       fs2, ft10, ft10
                  xor          a7, s9, t5
                  sltiu        t3, sp, 833
                  sra          a0, s9, t5
                  fsub.s       fa5, fa6, ft9
                  xor          a2, s10, s5
                  fclass.s     a5, ft1
                  auipc        tp, 1015164
                  sub          s10, s10, sp
                  ori          a3, s10, 1138
                  addi         t4, a2, -1034
                  fmul.s       ft6, fs0, fa3
                  xori         a4, s3, -449
                  sltu         s5, a4, t5
                  ori          gp, s3, -67
                  nop
                  srai         t2, s2, 29
                  fle.s        s10, ft1, fa0
                  remu         zero, s1, s9
                  nop
                  fdiv.s       fs7, ft8, ft1
                  fsgnjn.s     ft6, fs0, fa4
                  fmul.s       ft1, ft11, ft2
                  sra          t4, s6, t4
                  slt          s5, t2, t5
                  fmax.s       ft2, fa3, ft6
                  addi         t6, a0, -1437
                  fadd.s       fa3, fs4, fa4
                  remu         s7, a6, s2
                  nop
                  sltu         s5, s0, zero
                  fsgnjn.s     fs8, fs6, ft7
                  fmax.s       fa7, fs5, fs5
                  lui          s9, 715473
                  mul          t4, a0, s3
                  mulh         a2, t1, s10
                  fmv.w.x      fa0, s4
                  and          s2, s0, t4
                  sub          t4, s4, t1
                  fcvt.wu.s    a2, fs5, rdn
                  div          s10, t2, t0
                  fle.s        t3, fa0, fs2
                  flt.s        a3, fs6, ft3
                  feq.s        s10, fs6, fs1
                  sltu         s4, a7, a2
                  fcvt.wu.s    s3, fa0
                  srl          a4, t1, s9
                  div          a0, t3, a5
                  andi         s8, s1, 105
                  ori          a5, s3, -785
                  fclass.s     a5, fs6
                  fcvt.wu.s    tp, fa7, rdn
                  mulhu        s2, a4, s8
                  fcvt.s.wu    fs5, a7
                  fmin.s       fa1, fa7, fs11
                  fadd.s       fa0, fs0, ft3, rdn
                  srli         s3, sp, 30
                  fmul.s       ft4, fa6, ft9, rne
                  mul          s4, s0, ra
                  mul          a1, a0, s9
                  flt.s        t4, fs9, fa5
                  andi         t3, s11, -1159
                  fsqrt.s      ft2, fa0, rmm
                  fmv.w.x      ft6, t4
                  fclass.s     s7, fs9
                  remu         s3, s9, a1
                  srai         a5, s0, 5
                  sra          t3, a4, t5
                  ori          a3, s5, 389
                  lui          s9, 456175
                  xori         a0, s1, -1037
                  srl          s3, t6, zero
                  andi         s10, a0, -1547
                  slli         a0, t4, 2
                  fsub.s       ft5, ft0, ft7
                  fcvt.wu.s    t4, fs1
                  fmax.s       fs7, fs0, ft0
                  lui          a4, 566316
                  addi         s5, a3, -1708
                  fmv.x.w      s1, fs6
                  andi         a0, t4, 1075
                  sll          s11, s8, sp
                  mulhu        s8, gp, s1
                  xori         t5, s0, -1103
                  sltiu        a3, a4, 748
                  fsgnjn.s     fs1, fa6, ft1
                  fcvt.s.w     fa5, t5, rtz
                  slli         t4, s8, 21
                  srl          a1, s9, zero
                  remu         a0, a7, a0
                  flt.s        ra, ft7, ft10
                  mulhsu       t5, t4, t2
                  srl          s7, s1, s6
                  slt          s8, t1, a3
                  fsgnj.s      fs0, fa0, fs1
                  fsgnjx.s     fs2, fa7, fs10
                  div          t5, t6, a7
                  fsgnjx.s     ft2, fs1, fa5
                  fsub.s       fa2, fs0, fa7, rne
                  or           s9, a3, t3
                  remu         s5, gp, t4
                  add          s9, a2, s2
                  auipc        a3, 456504
                  mulh         s11, sp, s11
                  slt          t0, s2, sp
                  xori         a4, tp, 1811
                  flt.s        a5, fa3, fa6
                  fmul.s       fs5, fs10, fa2
                  fadd.s       ft4, fs3, fs5, rtz
                  slti         a5, s4, -69
                  and          sp, a3, tp
                  and          t0, t5, a3
                  sltu         ra, t6, tp
                  or           sp, s11, zero
                  fmax.s       ft9, fa1, ft9
                  fle.s        a4, fs3, ft0
                  srai         t6, s9, 29
                  xori         s11, s0, -19
                  fsub.s       fa7, fs2, ft7
                  fmax.s       ft5, fs0, ft2
                  slti         t5, tp, 1689
                  mulh         s10, s4, s5
                  fmv.w.x      fs10, a2
                  fadd.s       ft0, fa2, fa5
                  mulhu        s5, s6, t0
                  and          zero, a0, t2
                  slt          s10, s9, s9
                  sra          t2, a0, s11
                  fsgnjn.s     fs9, fs4, fs4
                  mul          s0, ra, a0
                  div          t2, s7, a5
                  mulh         s7, s5, t0
                  slti         a3, s7, -1950
                  slt          sp, t6, a1
                  and          zero, s3, s4
                  and          a7, s8, t4
                  addi         a0, s8, -872
                  mulhsu       gp, a6, s11
                  and          s7, gp, a3
                  add          a2, t6, t5
                  fcvt.wu.s    sp, ft8, rup
                  fdiv.s       ft10, fa5, fa0, rne
                  fadd.s       fs4, ft0, ft10, rup
                  fsgnjx.s     fs9, ft4, fs3
                  fmax.s       ft6, fs0, ft8
                  rem          s1, t2, t0
                  feq.s        a1, fa1, ft0
                  fsgnjn.s     ft6, fa0, ft3
                  sltu         s0, t4, s4
                  fmax.s       fa7, fs8, fs5
                  xor          a1, a1, a4
                  divu         a5, a1, t5
                  or           t2, t4, sp
                  fsub.s       ft2, fa6, fa6, rtz
                  ori          t3, t4, -1359
                  andi         s0, gp, 1829
                  sra          s1, t1, s8
                  slt          t3, s8, sp
                  sll          s10, t3, gp
                  fmv.w.x      ft4, ra
                  xori         s0, s5, -845
                  srli         s3, sp, 21
                  xori         t6, s9, -759
                  fadd.s       ft3, fs7, fs0, rdn
                  mulh         a1, s3, a7
                  srli         t6, a3, 26
                  divu         s8, s4, s10
                  ori          gp, a7, -464
                  fsqrt.s      ft4, fa7
                  sub          s9, a0, s10
                  fmul.s       fs6, ft9, fs0
                  mulhsu       a5, s5, t0
                  fmax.s       fa3, ft1, ft2
                  slt          s4, tp, s10
                  fmin.s       ft5, fs5, fs0
                  srl          s11, a7, zero
                  mulhu        a7, s11, s6
                  fcvt.wu.s    s1, ft4, rdn
                  fcvt.s.wu    fs9, t0
                  xori         a0, s3, 861
                  srl          t3, gp, zero
                  srli         s7, ra, 18
                  addi         ra, t0, -784
                  addi         a2, a0, -826
                  fsgnjn.s     fs8, fs8, ft5
                  fsqrt.s      fs4, fs3
                  fsgnjx.s     fa0, fa1, fa2
                  sub          s1, a3, s9
                  addi         a5, t2, 676
                  fsub.s       fs1, ft6, fs11, rmm
                  sltiu        t3, s2, 1463
                  sra          sp, s11, t5
                  or           zero, t4, s4
                  fclass.s     s3, ft3
                  nop
                  divu         a3, t3, a1
                  add          s11, s1, sp
                  sltu         s7, a0, a6
                  sra          a4, t4, s2
                  fcvt.s.wu    fa1, s4
                  or           a1, s1, a4
                  slti         s9, a1, -194
                  sltiu        a5, ra, 10
                  srli         s5, a3, 2
                  fcvt.s.wu    fa7, s5, rdn
                  and          a0, t5, s10
                  mulhsu       s7, a0, a1
                  fadd.s       ft5, fs6, ft8
                  feq.s        s4, fs10, fs5
                  fle.s        t5, fs9, fa0
                  ori          a0, s2, -778
                  fsub.s       fs2, fa2, ft2, rmm
                  mul          t6, a6, t6
                  sltiu        t6, a3, 1676
                  fcvt.w.s     t4, ft10, rdn
                  fcvt.w.s     s1, ft10, rmm
                  fmv.x.w      t2, ft3
                  ori          zero, s10, 387
                  fmax.s       ft5, fs8, ft2
                  lui          a1, 553134
                  slt          s1, s4, s4
                  ori          s8, a1, -546
                  sltiu        s3, a6, 888
                  slti         s11, t1, -709
                  mulhsu       s10, a4, t6
                  fdiv.s       fs2, ft6, fs4, rtz
                  andi         s10, s3, 1061
                  fmv.x.w      sp, ft6
                  fsqrt.s      ft10, fa4, rtz
                  or           a7, sp, s4
                  fmv.x.w      t2, fs2
                  mulh         s0, s1, s4
                  fle.s        a2, fs9, fs6
                  sra          s4, a2, t5
                  mulhu        s5, t0, s10
                  mul          s7, s7, t4
                  fmin.s       ft8, fs3, fs0
                  or           s10, s8, t3
                  fsgnjx.s     ft4, ft8, fa6
                  auipc        zero, 1001290
                  fcvt.s.w     ft6, s2
                  remu         zero, s11, a3
                  fadd.s       ft8, fs2, ft1, rne
                  fsgnj.s      fa1, fs10, fa2
                  fmul.s       ft4, fs6, fs7
                  and          t6, t0, s9
                  fmin.s       fs2, fs6, fs9
                  fsgnjn.s     ft0, fs6, ft0
                  lui          t2, 822348
                  addi         zero, s8, 1685
                  slli         zero, a3, 25
                  fcvt.s.wu    fs10, t6
                  fmul.s       fs11, ft1, fs8, rne
                  mulh         s8, a3, t2
                  addi         s4, t2, 1799
                  fcvt.w.s     a3, ft1, rdn
                  xori         t0, s10, -776
                  mulhsu       a1, sp, s5
                  mulhsu       t6, tp, a2
                  xor          ra, s4, ra
                  fsqrt.s      ft5, fs6, rtz
                  sub          s7, a6, t4
                  slti         s9, s5, 1217
                  fsgnjn.s     ft6, fa1, fs8
                  remu         s8, t5, s3
                  fle.s        t6, fs3, fa0
                  xor          s0, zero, s9
                  fcvt.wu.s    s0, fa5, rtz
                  fsgnjn.s     ft1, ft6, fs1
                  mulh         a7, s2, s7
                  mulhu        s0, a2, t2
                  add          s4, s1, t3
                  mulh         tp, a1, a6
                  srli         t5, s3, 1
                  fmax.s       fs2, fa7, fa7
                  fsgnjx.s     fa4, fa6, fa3
                  fmv.x.w      s8, fs0
                  fcvt.w.s     s4, ft8, rmm
                  nop
                  mulh         t2, t6, t1
                  srli         s3, t2, 14
                  feq.s        s0, fs1, fs5
                  rem          tp, s8, s9
                  nop
                  slt          s2, s4, ra
                  slli         a1, t1, 19
                  fcvt.s.w     ft2, s3
                  fclass.s     gp, ft7
                  fmv.x.w      s2, ft4
                  remu         s11, s0, s2
                  srli         s5, s3, 25
                  ori          a4, s2, 1342
                  rem          a5, t6, a2
                  srli         t3, t1, 21
                  srli         s0, s0, 0
                  fmin.s       ft5, fa4, fs3
                  sll          t3, zero, s9
                  fle.s        s11, fs1, fs1
                  addi         s9, s5, -1143
                  sltu         s10, a3, a3
                  fcvt.wu.s    tp, ft1, rdn
                  mulh         gp, a2, a5
                  mulhu        t0, t2, ra
                  mulh         sp, t5, t3
                  sra          s3, sp, s10
                  addi         s5, t0, -843
                  sltiu        s2, t2, 1993
                  fsqrt.s      ft4, fs3, rmm
                  fmin.s       fa7, fs3, ft0
                  mulhsu       t5, a1, s2
                  nop
                  rem          s0, s7, s8
                  slli         a1, s7, 4
                  fsub.s       fs3, fs1, fs1
                  fmax.s       fa0, ft5, fs7
                  sltiu        t6, s11, -106
                  ori          gp, s11, -1122
                  add          t4, s9, s6
                  div          t6, s9, a4
                  auipc        t0, 6829
                  div          t4, s6, a0
                  fcvt.s.wu    fs5, s2, rup
                  fcvt.s.w     ft9, s4
                  addi         t4, s1, -1391
                  fcvt.wu.s    s9, ft3, rtz
                  andi         a5, s1, -928
                  auipc        a4, 910097
                  slti         s1, t4, 1708
                  or           s7, t2, t2
                  fsgnj.s      fs8, fa0, fs6
                  fdiv.s       fs10, ft0, fa4, rne
                  fsgnjx.s     fa5, fs3, ft10
                  sll          s4, s8, sp
                  andi         t5, a6, 226
                  fmul.s       fs8, ft1, fs7
                  fadd.s       fs4, ft8, fs2
                  fdiv.s       fa6, fs5, ft5, rup
                  mulhu        sp, s0, t0
                  ori          ra, s4, 252
                  mulhsu       a3, s2, a2
                  fle.s        zero, ft7, fa3
                  fsqrt.s      fs3, fa1
                  fmv.w.x      fs9, t4
                  srli         a2, t0, 13
                  slli         s3, a3, 15
                  sltu         a7, s3, zero
                  flt.s        a5, fs2, ft1
                  div          a4, s8, ra
                  fmv.x.w      a1, ft6
                  fsgnj.s      fs2, fa3, ft9
                  fmv.w.x      fa5, a3
                  fmul.s       ft3, ft6, ft3
                  fdiv.s       fa5, fs9, ft6
                  sll          a1, t4, s9
                  auipc        sp, 434981
                  slli         sp, ra, 0
                  fadd.s       fa7, fs8, ft5
                  lui          t2, 502301
                  and          s2, t4, a1
                  fsgnjn.s     fa3, ft4, ft0
                  and          a5, t4, t2
                  fsub.s       fs1, fs11, ft1
                  nop
                  mulh         a3, t3, t5
                  sltu         s3, s2, s9
                  rem          tp, a6, s9
                  fmin.s       fs9, ft3, ft10
                  sub          a1, a6, s7
                  fcvt.w.s     zero, fa7, rne
                  xor          t3, s7, gp
                  slli         gp, s8, 14
                  fclass.s     s1, ft0
                  add          t5, t6, s3
                  slti         s8, s3, -623
                  feq.s        t4, ft1, fa4
                  sltu         t6, s11, s7
                  div          a5, s10, t5
                  fle.s        a7, ft11, fs7
                  sll          a7, a2, a2
                  fadd.s       fa0, fa7, fa5, rne
                  fcvt.w.s     s4, ft8, rup
                  sltiu        s10, t4, -1740
                  fcvt.w.s     a3, fs5
                  fmul.s       fs4, ft0, fa4
                  fcvt.wu.s    t4, fs4
                  addi         s3, s3, 1131
                  remu         t2, s8, a5
                  fsgnj.s      fa4, fs7, fs9
                  fcvt.w.s     zero, ft4, rne
                  fmax.s       ft7, ft11, ft0
                  divu         t3, t1, s11
                  mul          a3, a5, ra
                  mulh         s2, a5, s7
                  feq.s        a2, fs5, fa3
                  fcvt.s.w     ft5, s8, rtz
                  flt.s        s0, fa1, fs11
                  srai         s11, gp, 25
                  fsgnjn.s     fa2, fs3, fs4
                  fsqrt.s      fa1, fa2, rdn
                  srl          t0, sp, a3
                  srli         a5, s4, 29
                  sltu         gp, t6, t2
                  slt          s8, s9, a2
                  ori          s7, sp, -1892
                  slti         s4, t3, -849
                  fdiv.s       fa4, fs10, fa6, rne
                  and          sp, zero, gp
                  add          s8, s6, a0
                  rem          tp, ra, t5
                  sll          s10, t1, t2
                  sll          a2, s0, s2
                  slti         gp, s10, 1905
                  sub          ra, gp, a4
                  xori         s8, gp, 1617
                  sltiu        ra, t4, -18
                  mulhu        t4, s5, t6
                  fdiv.s       ft7, fa6, fa3, rne
                  fsqrt.s      fs2, fs1, rdn
                  fsqrt.s      ft10, fa1, rmm
                  fcvt.s.wu    ft7, gp
                  fmax.s       ft5, fa5, fs5
                  srai         s7, s7, 8
                  fmv.w.x      fs3, t1
                  fsqrt.s      ft4, ft6
                  add          s5, t1, t1
                  flt.s        a5, fa0, ft6
                  fmul.s       ft3, ft9, ft5, rdn
                  feq.s        t5, ft0, ft11
                  fdiv.s       ft9, fs4, fs9, rup
                  feq.s        a2, fa0, fs2
                  xori         s7, s2, -2032
                  and          s3, t4, s2
                  xor          gp, a0, s10
                  fcvt.w.s     t5, ft9, rmm
                  fmul.s       ft1, ft3, fs0
                  fdiv.s       fs1, fa1, ft0
                  mulhsu       a3, s9, a3
                  srl          sp, ra, s10
                  mulhu        t5, s3, s1
                  addi         a3, tp, 1095
                  sub          s3, t0, a0
                  add          t4, s3, zero
                  divu         ra, t0, a7
                  mulhsu       a4, a2, t5
                  sll          s1, a2, t2
                  divu         t0, t5, tp
                  andi         s2, s0, -433
                  fmul.s       ft2, fa5, ft0
                  div          sp, t5, a1
                  fadd.s       fs2, fa3, fs9
                  fsgnjx.s     fs10, ft0, fs1
                  fcvt.s.w     ft10, s9, rtz
                  sll          s0, a3, t5
                  fmv.x.w      ra, ft9
                  fsgnj.s      ft6, fs11, fa6
                  srl          s5, s10, t3
                  srli         ra, s4, 18
                  div          s11, s2, s10
                  flt.s        s2, fa1, fa1
                  and          s7, tp, s3
                  mulhu        s9, s10, a6
                  add          a0, a4, a2
                  mulhu        tp, s8, s3
                  divu         t4, t3, s2
                  fsgnjx.s     fs3, fa3, ft6
                  nop
                  add          a0, tp, a5
                  slli         t0, s1, 28
                  fcvt.s.wu    fs6, a4, rmm
                  fsgnjn.s     fs3, fs9, ft1
                  feq.s        tp, fa2, fs5
                  mulhu        a3, a6, s8
                  srai         sp, s8, 6
                  divu         t0, s1, gp
                  fmv.x.w      a4, fs5
                  sltiu        s8, s5, 1777
                  addi         a2, a2, 593
                  lui          s11, 343177
                  fle.s        gp, fs10, fa2
                  fsub.s       ft8, fa5, ft9
                  flt.s        s3, fs1, fs3
                  add          a4, s9, s8
                  xori         t2, s2, 1663
                  div          s10, t6, s6
                  sll          sp, t5, s3
                  fadd.s       fa5, ft10, fs11
                  div          t0, s2, s2
                  andi         a3, s2, -1574
                  fdiv.s       ft10, fs9, fs9, rne
                  add          s5, s9, t3
                  mulhsu       s0, zero, a2
                  sub          t3, sp, sp
                  sltiu        s9, tp, 1158
                  fsgnj.s      ft9, fs10, fs0
                  auipc        s1, 894812
                  fmin.s       ft0, fs1, fs1
                  fmv.w.x      ft6, s0
                  fmin.s       fa2, ft4, fa0
                  nop
                  fclass.s     t0, fs8
                  fcvt.wu.s    ra, fs0
                  sra          s9, s9, t6
                  fcvt.s.w     fs7, s3
                  mul          t3, a3, s8
                  nop
                  sltu         s8, s7, a2
                  sra          a0, a7, a1
                  fadd.s       fa5, fa2, fs3
                  fmul.s       fs1, fs4, fa0
                  nop
                  flt.s        s7, fa1, ft1
                  auipc        t6, 890672
                  mulhu        s1, s0, zero
                  mulh         s1, a4, t2
                  fmv.w.x      ft6, s9
                  fcvt.wu.s    s7, fs7, rdn
                  xori         s4, gp, -1542
                  fsub.s       ft11, ft3, ft10
                  sltu         a0, a4, t1
                  andi         s11, t1, 196
                  sra          a1, a4, s1
                  mul          s1, a4, s11
                  slt          tp, s7, a4
                  fcvt.w.s     t0, ft11
                  div          s3, a1, s11
                  slti         a0, t5, 436
                  fmin.s       fs1, fa5, ft1
                  sra          s3, tp, t2
                  fdiv.s       fs9, fs4, fs8
                  fclass.s     s11, ft10
                  ori          s7, a0, 922
                  fmax.s       fa1, ft9, fs7
                  sltu         t0, a4, s4
                  sltiu        zero, s2, -970
                  ori          t0, sp, 1508
                  slti         s10, s0, -460
                  ori          tp, t4, -1774
                  sub          t6, a0, a0
                  sltu         s1, a4, t5
                  rem          s0, ra, s8
                  slt          a7, a1, s0
                  fmin.s       fs11, fa5, fs3
                  srl          t6, s7, t5
                  divu         a7, s3, t5
                  fclass.s     tp, fs5
                  and          s7, s2, s6
                  sll          s1, s9, a7
                  ori          a2, a6, 1253
                  mulh         a7, a2, s3
                  flt.s        s11, fs11, fa5
                  fsub.s       fs0, fs1, ft6
                  xor          zero, s9, s7
                  fcvt.s.wu    ft7, a2
                  xor          a7, a0, gp
                  srai         ra, s11, 3
                  fsgnjn.s     fs10, ft6, fs6
                  sub          a2, zero, a7
                  fcvt.s.w     fs6, zero
                  fadd.s       fs2, fa1, ft10, rup
                  ori          s5, t3, 20
                  div          s2, t4, a1
                  add          ra, s1, s7
                  srl          s9, t5, s2
                  xori         zero, s7, -229
                  fsub.s       fs6, ft4, fs11
                  mulhsu       t6, t4, zero
                  sub          zero, s8, s9
                  mulh         gp, ra, t0
                  fclass.s     ra, fs0
                  sltu         a4, t5, s2
                  fsgnj.s      fa2, fa4, fa6
                  fcvt.w.s     a3, fa7
                  fcvt.w.s     t3, fs10, rmm
                  fmv.w.x      ft5, ra
                  fclass.s     a4, fa1
                  feq.s        s5, fs11, ft1
                  srl          a0, a0, s7
                  fmul.s       fs2, ft3, ft6
                  fmul.s       fs6, fs11, ft0
                  sra          sp, s0, s11
                  srl          t6, t3, s8
                  fmv.w.x      fs10, s5
                  div          t5, t5, s2
                  fsgnjx.s     fa1, ft0, fs5
                  fmv.w.x      ft8, s8
                  addi         t5, t0, -1217
                  fdiv.s       ft9, fa6, fa3, rne
                  srl          a7, s4, a5
                  fsub.s       fs5, ft4, fa5, rup
                  sub          t4, s8, s3
                  andi         t0, a5, 533
                  ori          gp, t6, -907
                  ori          ra, a0, -549
                  auipc        s2, 762241
                  sltiu        t2, s7, 1018
                  fcvt.w.s     s11, fs5, rdn
                  slli         s2, s11, 21
                  lui          a0, 49305
                  sltu         ra, t6, s3
                  fcvt.w.s     t2, fa7, rne
                  fle.s        a3, ft7, ft4
                  fmv.w.x      fs10, tp
                  fmv.w.x      ft6, a3
                  mulhu        a0, sp, s8
                  lui          s11, 940624
                  and          sp, s3, s7
                  fsqrt.s      ft0, fs4, rtz
                  remu         a3, a7, gp
                  slti         s7, s8, 60
                  addi         s7, ra, 638
                  fmv.w.x      fs5, a1
                  div          ra, a1, s2
                  nop
                  fmin.s       ft11, ft5, fa7
                  fsgnj.s      ft3, fa1, ft1
                  nop
                  nop
                  flt.s        ra, fa5, ft5
                  flt.s        s4, fs7, fs2
                  div          a7, t1, s0
                  srai         s7, a4, 4
                  fcvt.wu.s    s1, fs2, rtz
                  fcvt.wu.s    s3, ft2
                  ori          a0, s11, 1266
                  sltiu        a0, s8, 1049
                  fcvt.w.s     s10, fs7
                  fmv.w.x      fa6, s6
                  fcvt.s.w     fs11, gp, rne
                  fcvt.w.s     s5, fs2, rdn
                  fsub.s       ft4, fs7, fs2, rne
                  mulh         a5, a5, t2
                  srli         t2, zero, 2
                  fmul.s       ft8, fs0, fa4
                  div          a0, s11, s3
                  feq.s        sp, fs7, fs3
                  sltu         sp, zero, t5
                  srl          s8, s4, t5
                  fcvt.wu.s    ra, fs1
                  fsgnj.s      fs1, fs0, ft3
                  slt          s4, t4, a0
                  xori         a3, ra, 579
                  xor          a2, s3, s5
                  add          s1, a3, t5
                  fdiv.s       fs7, fs10, fs0, rmm
                  mul          t0, a3, s2
                  fsub.s       fa2, fa0, fa3, rmm
                  sltiu        a2, t4, 837
                  remu         a3, t3, s10
                  divu         gp, tp, a7
                  and          t3, t2, s5
                  fdiv.s       fs1, fs6, ft2
                  sub          s4, a3, sp
                  flt.s        a1, fs9, fs0
                  fmv.w.x      fs5, a7
                  or           gp, a2, s11
                  fcvt.s.wu    ft2, s8, rne
                  fcvt.w.s     s7, fa2
                  andi         s3, s8, -1768
                  add          t3, s6, a4
                  fle.s        t4, ft2, fs1
                  rem          sp, zero, s1
                  lui          s3, 867653
                  fcvt.w.s     a2, ft0, rne
                  srai         a7, s6, 11
                  fmax.s       ft6, ft0, ft10
                  fmv.x.w      tp, fs2
                  mulh         ra, t0, s10
                  sltiu        a1, s9, 1600
                  mulhu        gp, a7, a2
                  mul          t2, a0, s4
                  fsgnjn.s     fs0, fa5, ft10
                  mulhsu       a1, a7, s2
                  mulhsu       zero, s9, t0
                  fsub.s       fs2, fs9, ft3
                  xor          s1, s0, a1
                  sub          s3, s4, a0
                  fmv.x.w      s11, fs8
                  nop
                  feq.s        s3, fa2, ft7
                  andi         t6, gp, 889
                  fadd.s       fs2, fs2, ft10
                  fcvt.s.wu    fs8, t6, rup
                  srl          s5, t5, s8
                  flt.s        a3, fs10, fs5
                  auipc        a4, 166072
                  fmv.w.x      fs2, s1
                  divu         t0, sp, t6
                  fcvt.s.wu    ft7, s1, rmm
                  and          a7, a1, tp
                  sll          t5, s2, s5
                  slt          zero, s9, s10
                  fcvt.s.w     fs10, s1, rmm
                  srli         t0, s9, 24
                  fcvt.s.w     ft2, a1
                  slti         t2, t4, 2019
                  fcvt.s.wu    fa1, a4, rmm
                  or           tp, s3, t1
                  fsgnjx.s     fs0, ft9, fa1
                  fcvt.w.s     a7, ft2, rne
                  slli         t0, a1, 25
                  feq.s        s0, fa5, ft1
                  fsgnjx.s     ft2, fs10, fa2
                  mulhu        zero, a5, s5
                  mulhsu       s10, gp, s6
                  fcvt.w.s     s2, fa2
                  fadd.s       fs11, fs1, fa0, rne
                  fsub.s       fs3, ft3, fs10, rdn
                  fdiv.s       ft7, fs2, fa6, rtz
                  srai         s7, zero, 2
                  xori         t0, s7, -1850
                  mul          s5, s10, a3
                  flt.s        s3, fs1, fa4
                  slli         t6, s1, 6
                  fsgnjx.s     fs0, fa5, ft2
                  div          t5, t6, t2
                  fdiv.s       fa6, fs0, fs8, rtz
                  fmv.x.w      a1, ft4
                  fsub.s       fa0, fs3, fa0
                  fcvt.s.wu    fa0, s0, rtz
                  slt          t4, t0, zero
                  srli         t3, t0, 18
                  sub          s3, a2, ra
                  slt          a7, s4, a3
                  srl          s2, t3, s1
                  rem          s10, zero, s5
                  fcvt.w.s     t2, fs7, rup
                  fsqrt.s      fs0, ft1
                  andi         s5, tp, 901
                  fcvt.wu.s    s2, fs1
                  fsgnjx.s     fs0, fs10, ft11
                  ori          s11, a5, -533
                  fclass.s     a1, ft0
                  fsgnjx.s     ft10, ft3, fs5
                  mulhsu       t0, a5, s11
                  remu         ra, t4, a3
                  slli         zero, a3, 23
                  nop
                  xor          a4, a4, t5
                  fle.s        a5, ft9, ft10
                  auipc        t2, 890992
                  rem          gp, s11, t6
                  mul          t2, a6, s10
                  lui          a3, 702720
                  slt          a3, a1, t5
                  fdiv.s       fa1, fs5, fs4, rne
                  andi         t6, t0, 836
                  flt.s        a2, fs11, fa7
                  mulhu        s7, a7, s6
                  auipc        s4, 776215
                  fsqrt.s      fa3, ft4
                  fsgnj.s      fs10, fs9, fs0
                  sub          t2, a4, a4
                  sltiu        s10, s6, -720
                  sltiu        sp, s7, -1700
                  add          s1, gp, a3
                  xori         zero, t1, -959
                  divu         t4, tp, s2
                  srl          t2, t3, gp
                  fcvt.w.s     a7, fs4
                  fcvt.s.wu    fs9, t4, rtz
                  and          t6, s0, t4
                  sltiu        a5, s1, -827
                  sub          t3, ra, s10
                  mulhsu       s2, s1, a7
                  xor          s11, t4, a0
                  fmax.s       fa0, ft4, fa6
                  flt.s        sp, fa7, fs11
                  div          zero, s10, s1
                  or           a4, s3, s8
                  srli         s3, s3, 1
                  fcvt.w.s     t6, fs4, rdn
                  xor          ra, s11, s4
                  fsub.s       fs0, fa5, fa0
                  sra          a2, t2, s5
                  div          gp, s8, tp
                  fmax.s       fs6, fs2, ft11
                  mulhu        a7, s8, t1
                  flt.s        s5, fs5, ft5
                  and          s8, s7, t6
                  and          a1, gp, s4
                  feq.s        s0, ft2, fs11
                  slti         zero, s10, -2010
                  fsqrt.s      fs0, fs5
                  or           t5, s2, s7
                  slli         a7, s1, 28
                  mulh         s5, s6, tp
                  mulhsu       s7, s8, sp
                  fmv.x.w      t4, ft11
                  fsqrt.s      fa1, ft3
                  remu         a1, s7, s6
                  auipc        a1, 555178
                  srl          s5, a6, a0
                  div          a4, t6, a3
                  fsgnjx.s     fa3, fa5, ft8
                  rem          s5, ra, a7
                  mulh         t4, tp, s3
                  sub          t3, t6, a2
                  fmul.s       fs2, fs5, ft8, rup
                  fadd.s       fa6, ft11, ft7
                  andi         s3, a4, 575
                  srli         a1, t4, 29
                  srl          a7, t3, s4
                  fcvt.wu.s    t2, ft7
                  divu         zero, a0, t2
                  fle.s        s8, fs11, fs8
                  flt.s        s1, fs0, ft3
                  sltiu        a0, a3, -1622
                  sra          t3, t5, s11
                  ori          s5, t1, -1666
                  fsub.s       fs11, fs9, fa4
                  fadd.s       fa4, fa4, fs6
                  mul          sp, a2, s4
                  divu         s11, t0, a1
                  fmin.s       fa5, fs3, fs8
                  fdiv.s       fa6, ft10, fs11
                  sub          gp, sp, s1
                  fclass.s     a5, ft5
                  fsub.s       ft0, fa1, fs8
                  ori          a0, s9, -1571
                  fdiv.s       fs11, fs0, ft7
                  lui          a1, 218593
                  and          s8, s1, a1
                  fsgnj.s      ft7, ft5, fa3
                  fclass.s     s7, fa3
                  fadd.s       ft2, ft8, ft3
                  srl          ra, gp, s7
                  feq.s        a1, fa6, fs6
                  and          t2, s7, a7
                  add          s8, t6, zero
                  slt          s0, s9, sp
                  mulh         zero, s6, tp
                  mulhsu       t6, s11, t3
                  add          s9, a3, t1
                  sll          t4, s6, a6
                  fdiv.s       ft1, fs10, fa2, rtz
                  fcvt.wu.s    t6, fs3, rdn
                  remu         s0, a3, ra
                  flt.s        t2, fs3, ft9
                  and          a4, s5, s0
                  fmin.s       fa7, fs6, fs7
                  fcvt.s.wu    fs11, s3
                  ori          s8, s2, -39
                  srai         s10, s6, 26
                  sll          a4, s7, s6
                  divu         s7, ra, a6
                  nop
                  fle.s        s11, ft11, ft9
                  andi         ra, t5, -1461
                  slt          a0, gp, t1
                  divu         s8, s9, t6
                  mulhsu       s4, t3, s9
                  ori          s7, s0, -384
                  nop
                  slt          s2, s0, gp
                  lui          s4, 557801
                  auipc        a3, 545777
                  mul          s9, s6, gp
                  fdiv.s       fs10, fs7, fs0
                  addi         sp, s10, -266
                  ori          s11, t5, -1519
                  fmul.s       fa3, fa7, ft3, rdn
                  sll          s1, t5, s10
                  fsgnjn.s     fs8, ft2, fa2
                  ori          t0, s2, 1129
                  fcvt.wu.s    t0, ft4, rup
                  sra          a2, s4, t1
                  fmin.s       ft3, fs3, fs11
                  sll          s4, s7, s8
                  nop
                  slt          s7, s0, tp
                  srai         ra, s5, 24
                  sll          zero, t2, tp
                  fdiv.s       fa1, fs11, ft4
                  sltiu        ra, s0, -1623
                  feq.s        s7, ft1, ft5
                  fmul.s       fa4, fa0, fs2, rtz
                  sltiu        a5, a5, -1960
                  slli         sp, sp, 21
                  mulhu        s1, s1, sp
                  fmv.x.w      s11, fs3
                  xori         sp, a6, 1968
                  rem          s3, s8, t3
                  sltu         tp, s11, t6
                  fmv.w.x      ft3, a4
                  add          a5, s9, a2
                  fcvt.s.w     fa2, t4, rmm
                  fsub.s       fa2, fs2, fs7, rmm
                  srli         a4, t2, 3
                  mulhu        t4, s11, gp
                  rem          s1, s0, t0
                  fcvt.s.wu    fa2, t5, rne
                  mul          a2, t3, s8
                  div          s11, s10, t0
                  flt.s        a5, ft11, fs3
                  sub          a3, gp, s9
                  fmv.w.x      fs1, s5
                  fmv.w.x      ft7, s6
                  slt          s4, t1, s7
                  sub          s1, t2, sp
                  fcvt.s.wu    fa0, s4, rtz
                  slt          t4, s1, s11
                  divu         t4, zero, gp
                  andi         t4, a1, 917
                  srli         s11, t6, 13
                  slt          ra, a0, t0
                  srl          a2, s4, s5
                  flt.s        t4, fs5, ft4
                  fsub.s       fs1, ft4, ft0, rup
                  mul          t5, s0, zero
                  slti         t5, s7, -1862
                  addi         s7, t1, -468
                  and          a7, t2, t0
                  sltu         s3, s9, a2
                  srai         s10, s10, 4
                  fmv.w.x      ft5, a0
                  nop
                  mulhu        s7, t0, t5
                  mulhsu       t6, s11, zero
                  fmul.s       ft3, fs9, ft6
                  srli         t4, s9, 31
                  srli         ra, t5, 28
                  fmax.s       fs8, fs8, fa6
                  fcvt.s.w     ft8, a1, rup
                  feq.s        t6, fa7, fs7
                  fcvt.s.w     ft7, s10
                  rem          a0, sp, t6
                  fmv.x.w      t3, fa6
                  fmax.s       fa1, fa4, fs9
                  slti         s2, s5, -357
                  flt.s        t4, fs9, ft5
                  fmul.s       fs10, ft10, fa4, rmm
                  mulhsu       t3, zero, a5
                  flt.s        zero, fs5, ft11
                  fclass.s     a2, ft7
                  fadd.s       fs8, fs9, ft0, rdn
                  fclass.s     s7, fs9
                  and          t4, gp, s3
                  or           zero, s5, s2
                  mul          a4, s6, t6
                  sub          s4, a6, t6
                  ori          t4, s10, -844
                  fsqrt.s      ft8, fa2
                  sltiu        t2, gp, 1923
                  fmax.s       ft6, fs9, fa3
                  fadd.s       fa1, ft6, ft6
                  sll          t4, s5, s7
                  fcvt.w.s     a1, ft3, rne
                  mulhu        a7, sp, gp
                  mulh         s10, zero, s0
                  srl          t4, t5, s3
                  fsgnj.s      ft8, ft4, ft2
                  sll          s3, t6, s5
                  sltu         s0, t3, a2
                  sub          a1, gp, a3
                  fmin.s       fa7, ft5, ft5
                  sra          s8, t5, t1
                  sra          ra, tp, t1
                  remu         t4, s0, gp
                  fadd.s       fa3, fs8, fs2
                  sll          zero, a4, s2
                  fcvt.wu.s    a7, ft3
                  fcvt.s.wu    fa7, s2, rup
                  add          t4, t5, s2
                  fclass.s     ra, fa3
                  ori          t3, t6, -1537
                  fdiv.s       fa6, ft7, fa7, rup
                  fsgnjn.s     ft1, fs11, ft5
                  fmv.w.x      fs10, ra
                  auipc        t6, 88410
                  mulhsu       s10, s8, gp
                  mulhsu       s3, s0, a1
                  or           t2, zero, t4
                  xori         s8, a5, -1030
                  slt          zero, s4, t0
                  sra          a4, sp, a3
                  fmax.s       fa3, ft2, ft10
                  srl          s1, gp, a0
                  fsub.s       fa1, fs4, fa1
                  fcvt.s.w     ft11, s11
                  slli         s5, a7, 26
                  slt          t0, t1, a7
                  srli         zero, t4, 21
                  fcvt.s.w     ft9, t6
                  sub          a2, a4, t4
                  fdiv.s       fa5, fs11, fs2
                  fsgnj.s      ft5, fa7, fs7
                  sll          s8, s5, a0
                  fle.s        a2, fs4, ft6
                  fmax.s       fa3, fs2, ft10
                  sub          t2, t0, s6
                  fsub.s       fa5, fs10, fs4
                  mulhsu       sp, s5, s8
                  fmv.w.x      fs10, a6
                  fcvt.w.s     s1, fa7
                  fmv.w.x      ft4, t6
                  fmax.s       ft7, fs4, fs7
                  srl          s9, a3, s9
                  fmin.s       fs0, ft9, fs1
                  slt          sp, a7, sp
                  sltu         tp, s7, s2
                  fsgnjx.s     fs3, fs9, fs5
                  xor          t3, a1, a7
                  mulh         zero, sp, gp
                  fclass.s     gp, fs11
                  fdiv.s       ft5, fa6, fa1, rtz
                  mulhu        a7, t5, zero
                  fcvt.w.s     a7, fs11
                  feq.s        s0, fa7, fs1
                  rem          tp, s1, s5
                  fmax.s       ft4, fs6, fa3
                  ori          s11, t3, -1860
                  mulhsu       s2, t6, a7
                  slt          t0, t0, a5
                  fsub.s       fa7, ft1, ft1, rne
                  fadd.s       ft7, ft11, fs10, rup
                  mulhsu       tp, a7, a2
                  fsqrt.s      fa4, fs4, rdn
                  fcvt.s.wu    fs4, s11, rdn
                  fdiv.s       ft9, fs9, fa3
                  fcvt.w.s     s4, fs10
                  sltiu        s0, s10, 1271
                  fadd.s       fs4, fa1, ft11
                  mulhu        sp, t5, s11
                  xori         s5, zero, 752
                  rem          a4, s2, a5
                  fcvt.s.wu    fs1, s11
                  and          s3, a5, s5
                  and          t3, a2, ra
                  mulhu        sp, s5, s8
                  remu         s2, tp, t1
                  auipc        s10, 180269
                  sll          a1, t1, s9
                  div          t0, t6, s7
                  fcvt.w.s     t0, fs5
                  sltiu        s9, a3, 91
                  sub          s11, s5, s0
                  mul          tp, s8, s5
                  rem          t4, t2, s5
                  ori          s8, s9, -1530
                  andi         s10, s7, -1438
                  fcvt.s.w     fs10, s4, rdn
                  remu         s0, s5, s1
                  fle.s        s1, fs0, fs5
                  sub          s7, s8, s5
                  sra          t4, a6, a2
                  andi         a0, s11, -1992
                  slt          s8, a0, zero
                  lui          s3, 509649
                  addi         s10, s5, -86
                  fmax.s       fs8, ft2, ft3
                  or           s9, t1, a2
                  sra          s8, s0, ra
                  flt.s        zero, fs1, ft5
                  fcvt.s.w     ft6, s10, rmm
                  fsgnj.s      fa1, ft0, ft10
                  fadd.s       ft10, ft7, fs2, rtz
                  mulh         a4, tp, t0
                  feq.s        sp, ft2, ft0
                  fsub.s       fs1, ft7, fs8
                  fsgnjn.s     fs1, ft7, ft11
                  fdiv.s       fs7, fs4, fa6
                  fsgnj.s      fs9, fs8, fs4
                  xori         s7, s8, -475
                  fcvt.s.wu    ft8, a5
                  fmul.s       ft4, fs9, ft8, rdn
                  fmv.w.x      fs5, t5
                  addi         t6, s0, -1450
                  rem          t6, a6, s11
                  fsgnjn.s     fs1, fs10, fs1
                  rem          s3, s1, s6
                  mulh         t3, sp, a5
                  div          s8, s1, tp
                  remu         a5, t0, a1
                  sra          a1, a3, a7
                  mulhu        a2, a7, a1
                  srl          s8, a6, s0
                  fsgnjx.s     fa3, ft8, ft4
                  sll          zero, a3, a4
                  fadd.s       ft9, fa2, ft6
                  mulhsu       sp, t6, t4
                  fmv.x.w      a5, fs7
                  fsgnjn.s     ft9, ft8, fs10
                  auipc        s7, 278164
                  fmv.x.w      s11, fa2
                  mul          sp, ra, a5
                  slli         s11, a4, 26
                  slti         s2, zero, 961
                  sub          s11, t6, s9
                  fmul.s       ft11, ft6, fs7, rmm
                  addi         s9, sp, -351
                  fmv.w.x      fs1, t0
                  sltu         s7, tp, s0
                  mulhu        a7, s4, s1
                  mulh         s11, s5, s0
                  fsgnjx.s     ft2, ft9, fs2
                  lui          s10, 629540
                  fdiv.s       ft4, ft2, fs7
                  feq.s        a5, ft10, fs7
                  xori         s10, s10, 67
                  xor          s0, t2, ra
                  fclass.s     a0, fa4
                  fmv.x.w      ra, fs0
                  mulhsu       t3, s6, s3
                  slli         a4, ra, 26
                  xori         s4, a2, -1212
                  fsgnjx.s     fa7, fs0, fa1
                  lui          s7, 347765
                  andi         s0, t0, 1184
                  addi         a5, a7, 353
                  addi         s3, t5, -1601
                  or           a5, zero, t1
                  add          s4, s5, s9
                  or           tp, a4, sp
                  or           a0, ra, a3
                  lui          t2, 161034
                  remu         s2, s1, s7
                  or           s5, t6, t4
                  fsgnjn.s     ft5, fs1, ft8
                  addi         a5, t4, -1954
                  fcvt.w.s     a5, ft3, rup
                  fmv.x.w      a5, ft7
                  divu         t6, a1, a4
                  fsgnjx.s     ft10, ft7, ft6
                  or           s1, ra, s7
                  sra          t0, s10, a1
                  fle.s        ra, fs2, ft8
                  fsqrt.s      fa1, ft5
                  srai         s8, s10, 2
                  fmv.x.w      t3, fs4
                  addi         zero, s5, 1949
                  mul          sp, ra, t4
                  lui          s1, 475342
                  fmax.s       fa5, ft2, fs8
                  divu         t4, zero, a1
                  fle.s        s3, ft1, ft2
                  slli         t2, t5, 17
                  mulhsu       a2, s3, tp
                  fclass.s     t3, ft2
                  lui          ra, 1028539
                  mulhsu       tp, a4, t1
                  addi         gp, a6, -886
                  fadd.s       ft6, fa0, ft1
                  mulh         s10, a4, s1
                  or           s8, s1, a7
                  remu         s4, t0, s3
                  fmax.s       fa4, fa3, ft5
                  slli         sp, t0, 5
                  fsub.s       fs11, fs2, fs10
                  add          s8, s3, gp
                  mulhu        s8, t3, a2
                  divu         t6, zero, gp
                  slti         s0, t6, 834
                  fcvt.wu.s    t2, fs0, rne
                  fcvt.wu.s    a3, ft4
                  xori         s7, a1, 1656
                  srl          s10, s6, t3
                  ori          s11, s1, -682
                  fmv.w.x      fa5, ra
                  xor          s4, s6, s4
                  fmv.w.x      fs11, a1
                  fmin.s       ft4, fa2, ft0
                  remu         t5, zero, t3
                  divu         s2, t1, ra
                  fle.s        s2, fs8, ft7
                  fclass.s     a0, ft0
                  fmul.s       fa2, ft1, fs8, rtz
                  flt.s        ra, fa7, ft0
                  fdiv.s       ft10, fa5, ft9, rne
                  auipc        s4, 332392
                  slti         s11, a1, -1201
                  slt          s5, s8, t6
                  flt.s        a3, ft3, fs3
                  fle.s        s10, fa7, ft3
                  slli         t0, s11, 24
                  fadd.s       ft1, fs2, ft2, rtz
                  slli         ra, t3, 2
                  rem          s2, a4, s0
                  fclass.s     t3, fa0
                  mulhsu       sp, t2, s1
                  fcvt.s.w     fs5, t4
                  ori          a4, s11, -1409
                  fmv.x.w      a7, ft4
                  andi         t5, a2, 1631
                  slli         s2, a1, 3
                  sra          ra, s3, a3
                  sra          sp, a2, s10
                  fmin.s       fa6, fa4, fs3
                  fsub.s       fa0, ft10, fa0
                  srl          t5, s3, s11
                  fsgnjx.s     ft5, ft5, ft5
                  ori          zero, gp, 740
                  andi         s0, a1, 1450
                  fsgnjn.s     fs1, fs2, ft2
                  fcvt.w.s     gp, ft9
                  slli         t5, tp, 2
                  xor          a3, s3, t4
                  srl          t6, t1, s8
                  sll          t6, t1, gp
                  mul          a2, s5, s0
                  div          t6, a5, sp
                  divu         a2, t2, s10
                  mul          ra, s2, t4
                  fdiv.s       fs3, ft1, fs3
                  fle.s        t3, ft5, fs8
                  sll          a1, s11, a7
                  flt.s        tp, ft9, ft7
                  xor          sp, s9, a3
                  remu         sp, a3, a1
                  fcvt.wu.s    tp, ft5, rmm
                  fsgnj.s      ft5, fs4, fs1
                  srl          a0, t6, a3
                  fclass.s     s5, fs9
                  ori          a2, s11, -2021
                  slt          t3, s3, s6
                  fcvt.w.s     t3, fs0
                  fsgnj.s      fa2, ft2, ft10
                  slt          a5, a2, s7
                  fmv.w.x      fs11, a6
                  and          zero, a0, a0
                  or           s2, s6, s3
                  fdiv.s       fa6, fa6, ft9
                  flt.s        s8, ft0, ft9
                  auipc        s7, 506036
                  flt.s        s8, fa1, fs2
                  feq.s        a7, fs4, ft4
                  fcvt.wu.s    s11, fa6
                  sltu         a3, t1, s1
                  auipc        a1, 40722
                  remu         tp, s7, s9
                  fdiv.s       fa4, ft7, fs11
                  fdiv.s       fs7, ft1, fa6, rtz
                  xor          t2, s5, s11
                  fcvt.wu.s    t0, ft11, rne
                  fcvt.s.wu    fa7, s0, rne
                  mulh         s3, zero, s6
                  sra          tp, a3, s2
                  auipc        a3, 216084
                  mulh         s1, a5, a3
                  mul          t2, a0, a7
                  lui          s9, 462537
                  fdiv.s       fa7, ft0, fa4, rmm
                  slli         s1, a3, 24
                  fsqrt.s      fa2, fa3, rdn
                  slt          a0, a5, a2
                  andi         t0, t5, -1657
                  fcvt.s.w     fa4, zero, rmm
                  fdiv.s       fs10, ft3, ft7
                  srl          s2, s0, s2
                  rem          t4, s2, t2
                  remu         a3, s4, s4
                  fmin.s       fa2, ft8, fs9
                  fadd.s       fs10, ft0, fs5, rne
                  fmul.s       ft2, fa4, ft5
                  sub          t6, s0, gp
                  mulh         tp, zero, t4
                  rem          a1, t3, sp
                  sll          a3, s6, s11
                  mul          t3, a5, a4
                  divu         s4, t1, t5
                  fadd.s       fs6, ft2, ft9
                  div          t0, s10, t5
                  fcvt.s.w     fs11, t3, rdn
                  srl          a7, a2, s1
                  xori         ra, t6, -438
                  and          t6, t6, s4
                  fsqrt.s      ft1, ft9
                  fsqrt.s      ft9, fs6
                  remu         a4, s2, t5
                  srli         a5, a7, 18
                  addi         s3, s0, 1279
                  xori         s7, s4, -1283
                  andi         s10, s6, -1420
                  fsqrt.s      fs8, fs6
                  mulhsu       s3, a2, a0
                  divu         a3, s7, s2
                  fsgnjx.s     fa3, ft8, ft7
                  xori         s4, t0, -1909
                  or           zero, a4, sp
                  andi         t0, t5, 1337
                  fsgnj.s      fa4, fa7, ft9
                  fcvt.wu.s    a5, fs3, rdn
                  fadd.s       fa6, fs1, fs9
                  mulhsu       s10, a7, s5
                  fmin.s       fs8, ft0, fa2
                  fdiv.s       ft8, fa6, ft6
                  mul          s1, s7, s8
                  and          t0, s9, sp
                  fcvt.s.wu    fa2, s5
                  flt.s        s1, ft10, fs4
                  fsgnjx.s     fs6, ft1, ft8
                  feq.s        s5, ft5, ft7
                  xor          t0, s7, t6
                  fsgnjx.s     ft2, ft1, fa3
                  sltiu        gp, a0, 879
                  xori         s7, t0, -560
                  sltiu        s8, t4, 1495
                  fmv.x.w      s2, ft1
                  fle.s        s3, fs7, fa7
                  srai         a5, a0, 8
                  slti         s0, s3, 1246
                  fsqrt.s      fs7, fa0
                  srai         s0, zero, 23
                  rem          t4, s0, a4
                  xor          t3, a1, tp
                  srai         zero, s3, 22
                  mulhu        s11, s9, ra
                  or           s8, s3, s2
                  fmv.x.w      s7, fa6
                  mulhu        a5, a2, s10
                  fcvt.w.s     a7, fs0
                  flt.s        zero, fa7, fs3
                  slli         a3, s2, 3
                  sltu         s11, gp, t2
                  fle.s        a2, ft0, fa0
                  fclass.s     zero, ft8
                  fsqrt.s      fa3, fa3
                  add          sp, s3, s7
                  srai         t3, a2, 2
                  srl          s0, t4, s4
                  and          tp, s9, s9
                  fsub.s       ft11, fs0, fa2, rne
                  mul          t5, s5, s8
                  div          a7, a2, t5
                  sltu         gp, t5, gp
                  add          a0, ra, s6
                  add          s2, s9, a0
                  slti         t4, s6, 871
                  fclass.s     s11, ft9
                  mulhu        t6, t0, s10
                  sltu         t3, tp, a7
                  slli         t5, t3, 6
                  mulh         s10, a7, t2
                  fsgnjn.s     fs6, ft4, fa6
                  fmax.s       fa4, ft7, fa4
                  lui          a1, 382182
                  mul          s3, t3, s7
                  nop
                  divu         s4, a4, t5
                  slti         a0, t1, -1545
                  fsqrt.s      fs4, fa3
                  sll          t5, s0, a4
                  nop
                  srl          gp, s0, s0
                  srai         s1, t6, 9
                  and          s3, a7, t0
                  remu         t3, t0, s7
                  sra          sp, a5, t4
                  remu         tp, a0, s2
                  auipc        s7, 669160
                  fsgnj.s      ft3, ft7, fa1
                  fcvt.wu.s    t0, fs11, rdn
                  feq.s        a3, ft5, fs9
                  fcvt.w.s     t5, ft1, rdn
                  srli         s8, a1, 12
                  addi         s1, t6, 811
                  nop
                  fcvt.w.s     s1, fa1, rdn
                  slt          s1, t6, a5
                  srl          a0, s3, a1
                  or           t6, s8, gp
                  fsgnjx.s     ft5, fs4, fs3
                  fdiv.s       ft1, ft8, ft10, rup
                  andi         s7, a1, -2017
                  srli         s9, s4, 4
                  mul          gp, t6, a0
                  slti         s7, t3, 1624
                  fcvt.w.s     a0, ft8
                  fclass.s     tp, ft11
                  fcvt.wu.s    t3, ft8, rup
                  fsgnj.s      ft1, fs6, fs8
                  fmax.s       fs2, fs2, fs0
                  or           gp, s5, s5
                  fcvt.s.wu    fs6, tp
                  fcvt.s.wu    fs9, s6, rdn
                  fle.s        t3, ft9, ft1
                  fcvt.s.w     fs5, t3, rne
                  auipc        t5, 55590
                  and          ra, t2, t3
                  fsub.s       fs6, fs10, ft1, rdn
                  mulh         a0, a3, a7
                  add          t4, s11, a2
                  nop
                  divu         sp, a3, a0
                  and          s8, a3, s2
                  fmax.s       ft3, fs11, fs2
                  andi         s9, a6, -350
                  ori          s4, a3, -1925
                  fdiv.s       ft2, fs6, fs6
                  xor          a7, zero, sp
                  fcvt.wu.s    gp, fs8, rne
                  fcvt.s.wu    fa4, a3
                  fcvt.s.w     fs4, s8
                  xori         t0, s3, -1278
                  mul          a1, t6, t4
                  mulhsu       a1, ra, s6
                  andi         t3, t0, -1145
                  slt          s8, s2, t5
                  srai         s1, s8, 1
                  fadd.s       fs5, fa2, fa5, rtz
                  srai         a0, t4, 11
                  fle.s        zero, ft4, fa3
                  div          t4, a3, t1
                  srli         s11, s2, 19
                  feq.s        t5, ft2, fa7
                  fsqrt.s      fa4, fs3, rdn
                  fcvt.s.w     fs7, gp, rup
                  srli         t3, s10, 27
                  fsgnjx.s     fa0, ft11, fs5
                  sra          zero, a6, t0
                  mulhu        t5, a1, s0
                  xor          a0, s11, s8
                  sltu         t3, t1, s2
                  fcvt.wu.s    t0, ft9, rdn
                  mulh         t2, a6, t6
                  srai         t0, s1, 29
                  fcvt.w.s     ra, fa7
                  remu         s11, s3, s1
                  divu         s10, s7, s4
                  mul          a0, tp, tp
                  fsgnjx.s     ft6, ft7, fs9
                  slt          s5, s6, s2
                  add          s2, ra, t3
                  and          a4, t1, t3
                  fmv.w.x      fs6, ra
                  srai         a2, sp, 30
                  sltu         s9, a6, s11
                  xori         t6, s2, 733
                  feq.s        s0, ft4, fs0
                  fmul.s       fa4, fs11, ft2
                  flt.s        s3, fa5, fs11
                  srli         a0, gp, 26
                  sub          zero, a5, s7
                  slti         a5, ra, -6
                  or           ra, s3, t6
                  sll          t2, a0, s10
                  auipc        t2, 470914
                  slt          t3, s4, a7
                  flt.s        tp, ft6, ft5
                  fmul.s       fs1, fs7, ft2
                  fmv.w.x      ft8, a1
                  fsgnjx.s     fs0, fa5, fs2
                  sra          t5, t2, t4
                  fmv.w.x      fa1, s2
                  srai         t5, t2, 28
                  fsub.s       ft5, fs2, ft4
                  nop
                  fle.s        a1, ft9, fa1
                  fsgnjn.s     ft7, ft5, fs7
                  mulhsu       a0, ra, s1
                  andi         t3, a0, -316
                  sltiu        t3, t0, -648
                  fcvt.w.s     s2, fs3, rtz
                  mulhsu       t2, t2, ra
                  or           a3, a5, tp
                  ori          a5, t6, 1300
                  divu         s10, ra, t0
                  lui          t3, 699584
                  fcvt.wu.s    a0, fs2, rtz
                  sub          t4, s10, s5
                  fle.s        a0, ft0, ft11
                  srai         t6, s2, 8
                  slli         s7, a2, 27
                  fsgnjn.s     fa4, ft6, fa0
                  fsqrt.s      fs1, fa1
                  srli         tp, s9, 13
                  add          a2, s0, a3
                  srl          s7, gp, t2
                  fcvt.s.w     ft0, t4
                  fsqrt.s      fs11, fs9, rmm
                  fmul.s       fa6, fs9, ft8
                  and          s4, t0, a7
                  mul          t3, s4, tp
                  fle.s        a5, ft0, fa5
                  fcvt.s.w     ft11, a6, rup
                  fclass.s     s10, ft8
                  fsgnjn.s     fa4, fs0, fs7
                  sltiu        s3, ra, 1100
                  slti         t6, a2, -764
                  or           s5, t6, t1
                  lui          ra, 824898
                  div          s4, t3, s4
                  mulh         s8, a4, t5
                  srai         t4, a4, 23
                  fmul.s       ft5, ft1, ft11
                  auipc        s1, 291454
                  lui          t3, 83504
                  mul          a7, s5, s2
                  fsub.s       fa2, fs2, fa6, rne
                  fsgnj.s      fa0, fs2, fa6
                  fcvt.w.s     a1, fs11
                  divu         s2, t2, a3
                  fclass.s     t4, fa7
                  lui          ra, 445237
                  srli         ra, zero, 2
                  fsgnj.s      fs5, ft8, fs9
                  srl          a4, s10, a5
                  fsqrt.s      ft0, ft7, rup
                  srl          s9, a6, a2
                  mul          s7, a6, tp
                  mul          sp, ra, zero
                  mul          sp, t4, s9
                  slt          s8, t3, t6
                  xori         s2, t0, -1637
                  fsgnjx.s     ft9, fs1, fa4
                  mulhsu       t6, t4, a4
                  rem          s3, t4, s9
                  srli         a1, a5, 12
                  addi         tp, a7, -224
                  fsqrt.s      ft0, fs2
                  sra          zero, a4, gp
                  fmul.s       ft7, fs3, ft1
                  fle.s        t2, fs8, fa5
                  or           s0, t3, t2
                  or           a4, a0, sp
                  sub          t0, a2, t4
                  fclass.s     s7, ft0
                  fsub.s       fa0, fs6, fs7
                  fsgnjx.s     ft6, ft11, ft5
                  sra          s7, s2, s10
                  fsgnjn.s     fs8, fa7, ft3
                  xori         s0, t1, -1221
                  addi         t5, a4, -1092
                  nop
                  slt          a7, a3, zero
                  flt.s        t0, ft10, ft1
                  remu         s9, s7, s0
                  lui          zero, 440148
                  fsgnj.s      ft11, ft4, ft4
                  divu         a3, t1, gp
                  ori          s4, s9, -2004
                  lui          tp, 386212
                  fmul.s       fs10, fa5, ft1, rtz
                  fclass.s     tp, fa0
                  fsqrt.s      fa1, ft5
                  add          s4, gp, gp
                  srl          a5, sp, s11
                  fcvt.w.s     t4, ft4
                  xori         s5, s10, 1450
                  slt          t3, gp, a4
                  feq.s        tp, ft0, fs2
                  sra          t5, a7, a4
                  sltiu        tp, gp, -1164
                  sra          a0, s9, t6
                  fmv.w.x      ft1, s8
                  fmv.x.w      t0, ft0
                  remu         a5, ra, s0
                  fadd.s       fs6, fs8, ft3, rne
                  fcvt.w.s     a2, fs4, rne
                  divu         sp, a4, t0
                  fcvt.w.s     t0, fa7, rmm
                  auipc        s2, 948890
                  fle.s        t5, fs5, fs10
                  fsgnjx.s     fa1, ft0, fs6
                  fmv.w.x      fs11, a7
                  fsgnj.s      fs3, fs5, fs1
                  srl          sp, s10, a0
                  mulhu        s10, t3, t5
                  fadd.s       fa6, ft11, ft2, rne
                  rem          t4, s11, a6
                  fmax.s       fs6, ft10, ft10
                  sltu         s8, a7, t2
                  ori          t5, gp, 1191
                  lui          a5, 420008
                  sll          s11, t3, a5
                  srl          s0, zero, s10
                  div          s4, a2, s6
                  andi         sp, a6, 1169
                  or           a4, s7, t1
                  fmax.s       ft1, fs10, ft0
                  lui          s2, 907786
                  fcvt.wu.s    gp, ft4, rtz
                  fsgnjx.s     fa5, fa0, fs3
                  sub          t2, s8, s8
                  slti         zero, t2, 1776
                  fsgnjx.s     fa0, ft3, fs6
                  auipc        a1, 1044343
                  slt          t5, a4, t1
                  addi         t4, s9, 138
                  or           a4, a4, ra
                  lui          a4, 461660
                  sll          s4, s0, s6
                  ori          a2, a0, 590
                  fcvt.wu.s    a3, fa6
                  fle.s        tp, fs9, fs10
                  andi         t6, s8, -459
                  feq.s        sp, fs9, ft9
                  slli         a3, gp, 18
                  mulhu        s5, s6, a0
                  sll          tp, s10, t2
                  addi         a5, t2, 1713
                  fsqrt.s      ft6, ft2
                  slti         t3, s1, 1525
                  fdiv.s       ft3, fa2, fa0, rdn
                  srl          t2, a7, t4
                  fmv.x.w      a1, fs11
                  andi         a7, s6, 1998
                  sltu         t3, a0, t3
                  add          s9, t0, t0
                  nop
                  auipc        tp, 783167
                  srl          t2, s6, a4
                  add          s5, t2, a7
                  slli         t4, a3, 25
                  fmul.s       fa2, ft10, fa2, rmm
                  or           t6, s6, gp
                  xori         s0, t0, 704
                  fsgnjn.s     fs9, ft6, fs6
                  sltu         a3, s0, t2
                  fmv.w.x      ft2, s5
                  nop
                  rem          s7, t3, s7
                  fsqrt.s      fa2, ft3, rtz
                  mulhu        ra, s4, a4
                  sll          s10, a6, t0
                  add          t6, t3, t1
                  sub          t2, t6, s10
                  fcvt.s.w     fs5, s9, rmm
                  slt          ra, s8, a7
                  fcvt.s.wu    fs2, s5
                  fsgnjn.s     fs2, fa6, fs2
                  srli         s1, s3, 25
                  fmax.s       fs1, fa6, fs7
                  or           s0, s6, s7
                  fsgnjx.s     ft11, fa4, fa6
                  flt.s        s10, fs4, fa0
                  fmul.s       fs10, ft1, fa4
                  feq.s        s3, fs5, fs5
                  add          a5, zero, s3
                  div          a1, s10, t4
                  fsqrt.s      fs4, fs1, rup
                  div          a4, s9, s7
                  fsgnj.s      ft6, fs3, ft7
                  fsqrt.s      fa2, ft1, rne
                  sll          a1, t0, a0
                  fsgnjn.s     ft0, ft8, fs4
                  fsub.s       ft7, ft9, ft6
                  fclass.s     a0, fa0
                  slli         s3, t2, 15
                  fsgnjn.s     fs1, ft4, ft1
                  feq.s        tp, fa5, fs9
                  remu         a2, a1, t2
                  mulhsu       a4, gp, a5
                  ori          a5, t0, -792
                  fadd.s       fs0, fs10, ft2
                  fmv.w.x      fa1, tp
                  rem          s1, a2, s3
                  divu         a0, a1, a3
                  and          a7, tp, t1
                  srai         t3, a4, 27
                  fmv.x.w      a3, fs8
                  fsub.s       ft6, fa1, fa4
                  mulhu        s3, a6, s11
                  fadd.s       ft1, ft1, fs10
                  slt          a3, gp, t3
                  flt.s        t3, fs6, fs7
                  xori         ra, zero, -1229
                  lui          t3, 49058
                  nop
                  fclass.s     gp, fs9
                  fmul.s       ft11, fa1, fa6
                  add          a5, s9, s0
                  lui          s7, 20818
                  fcvt.w.s     s0, ft11, rne
                  mulh         s2, t6, t5
                  fmv.x.w      t6, fs11
                  mulhsu       s8, a6, a4
                  fmax.s       ft11, fs11, fa6
                  auipc        a3, 789688
                  sll          a5, t5, ra
                  fmv.x.w      t0, fa6
                  fmv.x.w      a2, ft11
                  mulhsu       t3, t3, zero
                  fmv.x.w      s0, ft0
                  sub          a7, t3, t4
                  sltiu        t4, t5, -434
                  fcvt.s.wu    ft10, s5, rup
                  fle.s        s5, fs0, fs1
                  remu         t4, t0, s1
                  slli         gp, s1, 17
                  srai         gp, s5, 0
                  fcvt.s.wu    fs4, s0, rdn
                  ori          a5, a3, -149
                  flt.s        a4, ft1, fs3
                  add          s7, s8, s1
                  rem          t4, a2, a0
                  or           s1, s1, s8
                  fsgnjx.s     fa0, fa5, ft6
                  nop
                  fcvt.wu.s    ra, fa5
                  srl          sp, a3, gp
                  mulhu        s11, a3, t1
                  mulhsu       a0, gp, s4
                  div          a1, a7, s6
                  fmul.s       ft10, ft2, fs6, rup
                  sra          s10, sp, s3
                  fle.s        t3, fa6, fa0
                  sll          sp, s10, s7
                  xori         s11, a6, -470
                  srai         t5, a3, 18
                  add          a1, zero, t1
                  andi         sp, t0, -245
                  fdiv.s       fa7, fs6, fs10, rne
                  fmin.s       fa0, ft1, ft2
                  fclass.s     s1, ft8
                  flt.s        a2, fa7, ft3
                  fdiv.s       fs3, fa7, ft10
                  sra          s5, s8, sp
                  auipc        gp, 464625
                  feq.s        s4, ft7, fa2
                  divu         s11, s11, t3
                  xor          s0, t6, s8
                  addi         a5, s10, 642
                  fcvt.s.w     ft3, a7, rup
                  nop
                  fmul.s       fs11, fs8, fs4, rup
                  lui          a1, 268110
                  slli         s3, a5, 11
                  or           s2, t6, t4
                  fmul.s       fs1, ft5, fa3, rmm
                  fmv.w.x      fs9, s4
                  rem          a5, s9, a6
                  sltiu        ra, a4, -1013
                  fcvt.s.wu    fs2, s5, rmm
                  slt          s9, s8, sp
                  and          a3, t6, s8
                  auipc        sp, 368787
                  divu         s3, a6, s2
                  fsgnjx.s     fs11, ft9, ft2
                  srai         s2, s5, 11
                  slti         s11, zero, -802
                  fmv.x.w      t3, ft6
                  or           t2, ra, t6
                  sra          s5, a5, s5
                  or           t4, s4, s1
                  mul          s11, a1, s3
                  div          a2, a7, a7
                  fmul.s       fs1, fa4, fs1
                  add          a0, t2, tp
                  srai         t4, s7, 17
                  fmax.s       fs7, ft3, fa0
                  andi         t6, ra, -1540
                  fadd.s       fs8, fa0, fs10, rmm
                  fcvt.wu.s    a2, ft5, rup
                  fmin.s       fa6, ft1, fs6
                  srli         a7, zero, 1
                  add          t2, s2, t0
                  fmv.w.x      fs5, s4
                  fsqrt.s      ft1, fs6
                  fsqrt.s      fa5, ft0
                  srl          s4, ra, s6
                  and          s8, gp, a6
                  fsub.s       ft9, fs1, ft6, rne
                  add          s3, t5, tp
                  add          t0, t6, a6
                  addi         t3, tp, 534
                  fmv.w.x      fs7, a5
                  mul          s4, s9, a2
                  fdiv.s       fs0, ft6, fa7
                  fle.s        a1, fs3, fa6
                  fsgnj.s      ft9, ft11, fs8
                  fmul.s       fa6, ft9, fa4, rtz
                  srli         t3, s0, 26
                  mulh         t5, s6, s9
                  mul          a3, ra, sp
                  auipc        a2, 992808
                  mulhu        s2, t5, a3
                  xori         t0, s9, 551
                  sltiu        s1, s6, -1744
                  sltiu        s9, a2, -810
                  fmin.s       ft5, fa6, ft9
                  fmin.s       ft9, fa3, ft11
                  fmin.s       ft2, ft7, ft4
                  fsub.s       ft2, fs2, fa2
                  srai         s2, t2, 4
                  add          ra, s2, s7
                  fmul.s       fs11, ft1, fs11
                  lui          t4, 579450
                  fmax.s       fa0, fa0, ft1
                  andi         s1, a6, -880
                  fmv.w.x      ft2, a5
                  xori         a7, zero, 286
                  or           t3, s6, a7
                  nop
                  fadd.s       ft9, fs9, fs11, rdn
                  sll          s10, tp, t4
                  rem          t4, s0, s6
                  and          s2, s7, a6
                  rem          a2, s10, s8
                  fmax.s       fa7, ft4, fa7
                  sra          sp, s6, s7
                  fmax.s       ft11, fa3, fa2
                  sra          s2, s6, a2
                  fsgnjn.s     fs3, ft6, fs10
                  slt          s5, s4, t5
                  fcvt.s.w     fs4, t3, rdn
                  flt.s        ra, ft4, fs1
                  andi         a3, zero, -222
                  fmul.s       fs1, ft1, ft7, rtz
                  fadd.s       fs2, ft7, ft1, rtz
                  addi         s5, s11, 1868
                  nop
                  fle.s        s7, fs3, fs9
                  auipc        a3, 297207
                  fcvt.wu.s    gp, ft7
                  slli         a0, a6, 3
                  add          a2, t6, t5
                  ori          s4, s8, -1091
                  xori         t2, s11, -915
                  sll          s9, a0, sp
                  fle.s        s2, ft9, ft1
                  fcvt.wu.s    gp, ft2
                  fclass.s     zero, fa3
                  fmv.x.w      s7, ft1
                  or           s3, s6, a0
                  slli         s8, t3, 6
                  srai         zero, a1, 13
                  addi         gp, s1, 721
                  rem          t5, a1, tp
                  srl          zero, ra, s0
                  div          s3, a1, s11
                  fcvt.s.wu    fa0, a3, rtz
                  divu         sp, s9, a5
                  fdiv.s       fa6, fa0, fa1, rdn
                  auipc        s2, 591289
                  fcvt.s.w     fa6, t4, rne
                  rem          t4, a0, a6
                  divu         sp, s10, s2
                  rem          a0, s3, a3
                  lui          s0, 811044
                  slt          a7, s10, s6
                  fmul.s       fs7, fa0, ft11, rtz
                  fmv.x.w      s4, ft1
                  srli         tp, s11, 9
                  fmul.s       fa1, fs6, ft0
                  sub          a1, a4, zero
                  mul          s2, a6, tp
                  xor          s10, t4, s6
                  fadd.s       fs4, fs3, ft11
                  remu         s4, s2, t2
                  fmax.s       fa2, fa6, ft9
                  fmul.s       ft1, fa7, fa6, rne
                  sll          s8, s8, a6
                  srli         a1, s9, 19
                  fcvt.s.wu    fa1, a6
                  lui          a4, 599974
                  slli         a7, s11, 18
                  fsgnj.s      fs2, fa3, fa1
                  srl          s0, s2, tp
                  sll          a2, s11, tp
                  fsgnjx.s     fa6, ft2, ft5
                  mulhu        s11, zero, s0
                  remu         s11, t1, t3
                  mulhsu       sp, s11, a2
                  and          s1, a4, gp
                  fmul.s       ft6, ft0, fs7
                  fmul.s       fs6, ft4, fs7, rne
                  fcvt.wu.s    s3, fs8, rup
                  fmul.s       fa4, fs5, ft5, rup
                  fadd.s       ft9, ft8, fa7, rmm
                  mulhu        s11, tp, t6
                  slt          ra, gp, a1
                  fsgnj.s      fs0, fs11, ft8
                  srli         s9, s4, 9
                  sub          t0, a6, a3
                  mulhsu       sp, s3, a1
                  mulhu        sp, a7, a0
                  fadd.s       fa1, ft5, fa5, rtz
                  fsgnjn.s     fa4, ft6, fa0
                  mulhu        a3, s1, a1
                  sltiu        gp, gp, 808
                  and          a4, t4, t4
                  remu         t0, a3, t4
                  slti         t5, ra, 1731
                  fcvt.wu.s    t2, ft2, rne
                  fsgnj.s      fs8, fs6, ft8
                  sll          s4, t4, s11
                  fclass.s     ra, fs10
                  fmv.w.x      fs7, a7
                  addi         gp, t5, -232
                  fsub.s       fs1, ft5, fa3, rne
                  mulhsu       s7, s10, t3
                  fcvt.s.w     ft7, s6
                  addi         a2, a7, 711
                  sub          a1, s0, a4
                  sub          s1, s9, s8
                  andi         sp, s8, -1825
                  xori         s1, t4, -1099
                  srli         a3, t0, 9
                  xori         s3, s11, -172
                  fmv.x.w      t0, ft5
                  rem          a7, s0, s1
                  sltiu        s2, a1, -1048
                  flt.s        s10, fa4, ft2
                  fsqrt.s      ft9, fs4, rmm
                  sltu         t2, zero, a0
                  mul          s10, s11, t4
                  nop
                  add          t3, a2, t4
                  srl          a4, t3, t1
                  add          a2, sp, s2
                  mulhu        a0, a7, s8
                  fsub.s       ft8, fs0, fa6
                  feq.s        s11, fa5, fa1
                  slti         s0, zero, -810
                  sltiu        a2, s7, 591
                  addi         s3, s11, -495
                  feq.s        s10, ft10, ft0
                  remu         s5, s6, t1
                  mulhu        a5, a7, s0
                  fclass.s     t2, fa2
                  xor          s11, ra, t4
                  fadd.s       fs11, fa3, fs10, rtz
                  fcvt.s.w     fs8, a3, rtz
                  sltu         a7, s2, s11
                  ori          t5, a3, -1180
                  fdiv.s       fs2, fs0, fs0
                  and          s9, s9, zero
                  sub          s7, a0, a5
                  and          s10, a7, ra
                  srli         zero, s9, 17
                  fclass.s     a5, ft0
                  sltu         s11, a1, s8
                  auipc        a5, 965059
                  fmul.s       fa2, fa3, ft2, rup
                  add          a4, t0, a7
                  srai         zero, s10, 3
                  sltu         s5, gp, t1
                  ori          s4, zero, -234
                  fcvt.s.w     fs5, s0, rdn
                  fsub.s       fs5, fa4, fa1
                  fmin.s       ft0, fs7, fa6
                  rem          s4, t0, zero
                  sltiu        s1, s10, 1675
                  srl          s1, t1, ra
                  fsgnjx.s     ft3, ft5, fs1
                  fsqrt.s      fs10, fs8
                  andi         t6, s4, -566
                  nop
                  rem          t4, a3, a5
                  fmv.x.w      s9, fs8
                  srl          s10, s9, s7
                  auipc        gp, 40666
                  rem          tp, s9, t6
                  fsqrt.s      ft11, fs8
                  nop
                  nop
                  sltiu        t6, s0, -1118
                  fcvt.s.wu    fs3, t2, rdn
                  mul          t6, s8, a7
                  slt          a5, s3, zero
                  lui          a4, 827943
                  sltiu        a1, a6, -771
                  rem          ra, a6, s2
                  fcvt.w.s     s1, fa4
                  fsqrt.s      fa3, fa6
                  rem          a1, a6, s2
                  slti         a7, t3, 1012
                  fsgnjn.s     fa3, fs0, fa0
                  fsgnj.s      fs11, ft8, ft5
                  divu         t0, s0, a1
                  fdiv.s       fs1, ft6, ft7
                  divu         gp, s2, a7
                  sltu         s8, gp, t2
                  fsgnjx.s     fa3, ft4, fs10
                  srl          a4, s2, s1
                  add          t3, s1, s0
                  fadd.s       fa2, ft6, fa3, rdn
                  fmv.w.x      fa0, a2
                  rem          t0, t6, t5
                  fdiv.s       ft7, ft2, fa2, rup
                  fsqrt.s      ft1, ft2
                  sra          s7, a4, a6
                  fmv.w.x      ft4, s7
                  fcvt.w.s     a7, ft10, rne
                  ori          a4, a1, 1467
                  sra          ra, s8, a1
                  fadd.s       fa3, fs1, fs8
                  srli         t6, a7, 24
                  sltu         t0, a6, s4
                  and          s4, t6, s6
                  and          t0, s8, sp
                  sltiu        t3, tp, 704
                  nop
                  fmul.s       fa2, fs7, ft0, rup
                  fsgnjn.s     fa3, ft4, fs0
                  fcvt.w.s     s10, ft5
                  fdiv.s       fs2, fa2, fs1, rne
                  fadd.s       ft10, fs7, fa5
                  fle.s        tp, fs6, fs2
                  slt          s8, sp, s1
                  sub          t3, sp, s6
                  fmv.w.x      ft7, t3
                  srl          s2, a7, s10
                  rem          a4, gp, s9
                  mul          a0, s8, sp
                  fsub.s       fs4, ft6, fa3, rne
                  srli         a2, t5, 21
                  fsub.s       fs1, ft4, fa5, rdn
                  fcvt.w.s     a2, fs5, rtz
                  xori         s2, t6, -1750
                  fmv.w.x      ft7, a2
                  sll          a2, s6, a1
                  divu         zero, a0, a2
                  xori         a5, sp, -1981
                  feq.s        s3, ft7, fs4
                  fdiv.s       fs8, fs5, fa7, rtz
                  mulhsu       s4, a0, t4
                  fmul.s       ft4, fs8, fs5
                  mulhsu       s8, a3, zero
                  xori         t0, a0, -1133
                  fsgnjn.s     ft2, fa1, fa6
                  slt          a7, s7, a3
                  xor          t3, a3, s8
                  fdiv.s       ft11, ft11, ft10
                  mulhu        t3, t3, tp
                  fcvt.s.wu    fs1, s9, rdn
                  fclass.s     zero, fa4
                  nop
                  mulhsu       sp, a0, a5
                  xor          t3, a3, a3
                  addi         tp, zero, 1435
                  rem          a4, a4, s8
                  xor          t2, s1, s4
                  fmin.s       ft4, fs2, ft3
                  xor          t6, s10, t0
                  mul          a3, s4, s1
                  rem          t3, a2, a5
                  ori          t5, a7, 1834
                  remu         s0, a6, s11
                  sltu         a1, t3, a3
                  mul          s1, s3, a2
                  rem          s1, a1, ra
                  srl          a3, a4, t4
                  fcvt.wu.s    a3, ft3, rne
                  fsgnj.s      ft0, fs7, fa5
                  fmin.s       fs0, ft2, fa0
                  remu         s4, a5, t0
                  fcvt.w.s     s5, fs10, rne
                  fadd.s       fa7, fs3, fa3, rup
                  sltiu        t4, a0, 1395
                  fcvt.w.s     s4, ft7, rtz
                  fmax.s       fs11, ft1, fa5
                  fsub.s       fs10, fa1, fa6
                  srai         gp, a6, 28
                  div          a7, s8, s9
                  fsgnjx.s     fs5, fa2, fa0
                  slli         s7, gp, 29
                  fmul.s       ft9, ft10, fs9, rtz
                  fcvt.s.wu    fa0, s4
                  srai         gp, ra, 23
                  fmax.s       fa4, ft9, ft5
                  rem          ra, zero, t5
                  srai         a3, a7, 12
                  mulhu        s1, s5, t1
                  lui          t0, 194728
                  add          t0, s5, s0
                  remu         t4, s2, s1
                  srli         s7, t0, 21
                  divu         a2, a0, t2
                  fsgnjn.s     fa1, ft8, fs2
                  auipc        t5, 350591
                  fcvt.w.s     a3, fs8, rmm
                  fsgnjx.s     fa3, fs0, fs7
                  slt          s2, s5, t4
                  fmv.w.x      ft4, s8
                  sll          s0, tp, s6
                  fmax.s       ft8, fa5, fs7
                  div          a1, s6, t1
                  fsub.s       fa3, ft2, fa4, rtz
                  div          s11, t4, t1
                  flt.s        s8, fs3, fa2
                  or           ra, t1, t0
                  sub          zero, t5, t2
                  auipc        a3, 171201
                  fcvt.wu.s    s8, fa4
                  fcvt.s.w     fa1, a7
                  mulh         t0, s4, zero
                  fclass.s     s1, ft6
                  fsqrt.s      ft1, ft1, rtz
                  fmul.s       ft5, fa3, fs3, rdn
                  andi         t5, s8, 363
                  slli         a5, tp, 25
                  add          a3, t0, a2
                  slti         zero, s8, -946
                  auipc        s5, 230540
                  slti         t5, t1, -1469
                  or           s7, s10, s1
                  fclass.s     t4, fs5
                  srai         ra, a1, 21
                  fsgnjx.s     fs10, ft9, fs1
                  fcvt.s.w     ft6, s1, rmm
                  mul          t5, a1, a7
                  rem          t4, a5, sp
                  rem          a0, a7, a1
                  fsgnj.s      fa0, fs11, ft4
                  fclass.s     s0, ft5
                  fcvt.s.w     ft7, s3
                  srai         a4, t0, 30
                  mulhu        s11, sp, s5
                  fsgnj.s      fa1, ft4, fs7
                  sltiu        ra, a6, -973
                  fclass.s     s7, ft9
                  auipc        a5, 557500
                  fcvt.s.wu    fs1, zero
                  mulhsu       s9, s1, a5
                  sra          a7, a7, t0
                  srl          s0, s5, s6
                  fsqrt.s      fs4, ft4, rtz
                  slli         a2, t2, 1
                  fcvt.s.w     fa7, a1
                  fmin.s       ft3, fs6, ft6
                  flt.s        a2, fs3, fs10
                  srl          s0, s3, a3
                  fmv.x.w      t2, fs5
                  slli         zero, s10, 5
                  fcvt.w.s     ra, fa1, rmm
                  sub          s2, s2, ra
                  fdiv.s       ft10, fa0, ft3, rtz
                  fsqrt.s      fa7, ft4
                  mulhsu       t0, t1, a1
                  fle.s        s2, fa4, fs3
                  fcvt.s.w     fs10, t6, rup
                  fmv.x.w      t4, ft6
                  fmin.s       fs8, ft4, fa2
                  sltu         ra, a4, sp
                  fcvt.wu.s    s8, fs4, rtz
                  sra          s2, a2, s2
                  slti         s9, tp, -1877
                  srai         a1, s5, 11
                  fmax.s       ft8, fs9, fs10
                  mul          a2, t1, t0
                  and          s4, a5, s6
                  nop
                  fclass.s     s0, ft2
                  fdiv.s       fs0, fa6, fs11
                  fmin.s       fa6, ft9, fs10
                  slt          a2, s1, a2
                  mulhsu       zero, s5, a6
                  fsqrt.s      ft5, fs0, rmm
                  fle.s        t0, ft9, fs6
                  xor          t0, t0, s5
                  fsgnj.s      fs0, ft3, fa5
                  fclass.s     t4, fs10
                  sltu         t6, t5, a5
                  srai         zero, t5, 29
                  fcvt.s.w     fs4, t4, rmm
                  xor          s7, t5, a1
                  fmin.s       fs8, fs10, fa4
                  and          tp, t3, s7
                  andi         t3, a5, -1044
                  div          s10, s8, t4
                  rem          t3, t2, t5
                  divu         a2, s7, s6
                  sltiu        a5, s4, -855
                  fmax.s       fs10, ft11, ft4
                  sll          t6, a0, a3
                  slli         a0, s11, 30
                  xori         s5, a5, 1069
                  srai         s2, a2, 28
                  flt.s        s10, ft2, ft9
                  sll          ra, s9, a4
                  slli         a2, a2, 22
                  fcvt.w.s     s7, fa1, rtz
                  divu         s7, s7, s5
                  andi         t5, s7, 1491
                  fmv.x.w      tp, ft9
                  fsgnjx.s     ft0, fs11, ft0
                  feq.s        a2, ft9, fs7
                  auipc        s11, 290214
                  fle.s        s11, ft11, ft11
                  sltu         s5, t3, t6
                  slli         t6, t3, 25
                  sll          a7, s7, a7
                  div          t5, t3, a6
                  andi         s2, s1, 261
                  slti         s11, a7, 108
                  mulh         ra, s11, s6
                  fdiv.s       fa1, fs11, fa2, rup
                  and          s0, zero, a6
                  fsqrt.s      ft7, ft8, rup
                  slt          zero, s11, t5
                  sltiu        ra, tp, -1447
                  fadd.s       fs5, ft9, fs8, rup
                  srli         t5, a0, 5
                  rem          s0, a7, s11
                  srli         s5, a0, 20
                  sll          a3, t0, tp
                  fadd.s       ft9, fs5, fs4
                  fsub.s       fa4, fa1, ft8, rdn
                  slt          t5, tp, a3
                  fsub.s       fa6, ft1, fs6
                  sll          s7, a6, s0
                  div          s8, s0, s1
                  mulh         t0, sp, a0
                  fcvt.w.s     t3, fs10, rup
                  srai         a1, s4, 10
                  fsgnj.s      fs10, ft9, fs1
                  fcvt.s.w     fs2, s0, rup
                  mulh         s7, a2, s4
                  sub          s5, ra, t2
                  srl          ra, a5, t5
                  fmax.s       fa2, fa7, fs4
                  sltu         s8, s9, s9
                  fclass.s     t4, fa7
                  or           gp, s4, gp
                  fcvt.wu.s    a5, fs8, rup
                  remu         t0, a2, s2
                  fmin.s       fs4, ft5, fs9
                  sltu         a0, s9, t4
                  feq.s        ra, fs6, ft6
                  and          a3, s11, s7
                  fsub.s       ft7, fa2, fs1, rup
                  srai         a5, t1, 9
                  srl          s4, s0, a6
                  sll          ra, sp, a6
                  srli         a0, a1, 16
                  fmv.w.x      fs5, a6
                  and          s10, s5, t3
                  fsqrt.s      fs11, fs3, rup
                  srl          a7, a4, a6
                  add          ra, a5, s6
                  fsgnj.s      ft0, ft5, ft9
                  srai         s7, gp, 21
                  fadd.s       ft2, fs11, fa1
                  srl          t6, a1, sp
                  divu         s4, s2, a3
                  mulh         zero, t4, s1
                  fsub.s       fs2, ft7, fs9
                  and          t3, a0, t4
                  fdiv.s       ft5, ft8, ft4, rne
                  fsqrt.s      fs4, ft7, rtz
                  fsub.s       ft5, fa4, fs2, rmm
                  fsgnjx.s     fa5, ft6, fs0
                  lui          zero, 801465
                  fmul.s       ft1, fs10, fs10, rdn
                  fmul.s       fa6, fs1, ft1, rdn
                  rem          tp, a4, zero
                  lui          s3, 494958
                  mulhsu       t0, t0, s7
                  fadd.s       fs8, fs10, fs1
                  sltu         t0, zero, a4
                  flt.s        a4, fs0, fa3
                  fsgnj.s      fs10, fs0, ft11
                  srai         zero, s9, 0
                  rem          t0, s11, s11
                  remu         s10, s0, a6
                  fle.s        s7, ft1, ft0
                  feq.s        s11, fs9, fs4
                  fclass.s     s7, ft8
                  mulhsu       t4, t6, a2
                  mulh         t4, a3, gp
                  addi         s7, tp, 1632
                  fcvt.wu.s    t5, fs10
                  mul          s0, t0, sp
                  srli         gp, a3, 17
                  fmul.s       fs1, fs10, ft7, rne
                  fclass.s     s10, ft0
                  or           s11, zero, s5
                  sltu         tp, a7, t1
                  divu         sp, s1, ra
                  slli         s3, a6, 27
                  fcvt.wu.s    a5, fa1, rup
                  sltiu        s11, s5, -1390
                  xori         s3, a7, 2033
                  slt          tp, s5, a1
                  fmax.s       ft9, fs2, fs1
                  feq.s        t2, ft5, fs1
                  fmv.x.w      t6, fs2
                  fsgnjn.s     fa3, fa5, fs3
                  sltu         s5, s0, t2
                  srl          a5, s1, s11
                  divu         s0, a6, s8
                  fsqrt.s      fs11, fa5
                  mul          zero, a6, a0
                  mulh         a7, a0, t1
                  fsqrt.s      fa2, fa7
                  fadd.s       fs10, fs0, fs10
                  divu         s5, s2, a1
                  slt          a3, s10, t4
                  addi         s9, s6, 1676
                  sll          s4, a1, a5
                  mul          s8, s3, s11
                  sltu         t3, a3, s10
                  fclass.s     s5, ft1
                  fcvt.s.w     fs7, s0, rmm
                  srai         s0, s7, 1
                  remu         zero, a6, t1
                  and          a3, a1, t6
                  lui          s4, 559826
                  nop
                  fadd.s       fs8, fs11, ft3, rmm
                  mulh         t3, t0, a1
                  sltu         a1, ra, s0
                  lui          t0, 1018647
                  slti         s2, ra, -372
                  sub          gp, s11, t5
                  fle.s        s2, fs1, fs6
                  fsgnj.s      fa2, fa1, fa3
                  fdiv.s       fa7, fs7, fa5
                  fmul.s       fs2, fa2, fs6, rtz
                  rem          t6, t1, t3
                  remu         a4, t4, a5
                  divu         t5, t5, s0
                  fmv.x.w      s10, fs6
                  srli         sp, t4, 25
                  add          gp, s6, a5
                  fcvt.s.w     fs5, tp
                  fmin.s       ft2, fa5, ft8
                  fcvt.s.w     fs10, a1, rtz
                  nop
                  div          t5, s7, t5
                  slti         a0, t4, 1134
                  xor          t4, zero, a4
                  slli         s5, a1, 17
                  divu         s0, t1, s6
                  fcvt.s.w     fa5, zero
                  fcvt.s.wu    ft6, s2
                  mulhu        s4, sp, a3
                  mul          tp, t1, s1
                  fsqrt.s      ft4, fa5, rmm
                  xori         s0, a2, -689
                  or           a7, tp, gp
                  mulhu        zero, s9, ra
                  ori          s3, s3, -914
                  lui          a1, 668160
                  fadd.s       fa3, fs9, ft7, rtz
                  fsgnjn.s     ft6, fa7, ft4
                  fsgnjn.s     fs3, fa5, ft10
                  div          s2, a0, tp
                  fcvt.s.wu    fa0, sp
                  fdiv.s       ft6, ft9, fa1, rmm
                  fsqrt.s      fs0, fa0, rup
                  fsqrt.s      ft1, ft7, rdn
                  fdiv.s       fs7, ft8, fa2, rtz
                  srl          s11, s2, s3
                  sll          s4, s8, s9
                  fcvt.wu.s    s10, ft7, rup
                  xor          s1, t5, a0
                  fle.s        s1, fa3, fs7
                  srli         a7, s9, 23
                  mulh         t5, tp, a3
                  mulh         t0, s8, s6
                  sltu         a0, t0, s7
                  feq.s        s0, fs7, fs10
                  srli         s4, a1, 16
                  srai         gp, a1, 23
                  fsgnj.s      fs0, fa3, ft3
                  slli         gp, a7, 13
                  fle.s        s7, ft9, ft6
                  fmin.s       fs4, fa4, fa4
                  fsgnjx.s     ft0, fa1, fs3
                  lui          zero, 509436
                  slli         s5, t3, 23
                  fmul.s       fa5, fa5, fa1
                  xori         a1, t5, -455
                  lui          a1, 779497
                  sll          a2, s10, a2
                  xor          t4, t6, a1
                  fdiv.s       ft0, fa6, fs5
                  slt          sp, t6, s5
                  srl          a1, s7, a1
                  xori         tp, s4, -1931
                  sub          s1, s5, a1
                  fsgnjx.s     fs6, ft1, fs8
                  xor          s5, zero, s7
                  fdiv.s       ft5, fs0, ft0, rtz
                  fclass.s     a4, fs8
                  slti         s11, a1, 70
                  xori         s4, s10, -1338
                  fcvt.wu.s    a2, ft6
                  mulh         tp, a1, s11
                  mulhsu       a2, t1, t0
                  or           a3, tp, tp
                  fcvt.wu.s    s11, fs0
                  ori          t6, s0, 1443
                  ori          a3, s3, -120
                  sltiu        t6, t2, 504
                  srai         gp, t0, 16
                  srli         t5, s5, 8
                  fle.s        t5, fs0, fs11
                  srli         s8, s3, 22
                  fsgnjx.s     ft5, ft0, ft9
                  andi         s0, t2, 284
                  fmv.w.x      fs1, a1
                  fmin.s       fs11, fs8, ft2
                  auipc        a2, 52784
                  sub          zero, s11, a6
                  or           t6, t2, a7
                  add          s1, tp, a4
                  fmul.s       ft10, ft5, fa4, rtz
                  slti         a2, a0, -437
                  srl          a2, a1, a3
                  feq.s        sp, ft8, ft10
                  srli         t3, a1, 0
                  fcvt.w.s     a3, ft1
                  fmv.x.w      s9, ft10
                  lui          s7, 717372
                  sub          s3, s8, s3
                  fcvt.s.wu    ft4, a7, rdn
                  fcvt.wu.s    a5, ft2
                  fsub.s       fs2, fs2, fs11, rtz
                  and          t6, a5, zero
                  mulhu        s2, a7, t5
                  fsgnj.s      fs9, fa5, ft0
                  fcvt.s.wu    fa0, s4
                  mul          s7, sp, gp
                  div          s8, a4, s8
                  mulhsu       s1, a7, tp
                  fsqrt.s      fa0, fa6
                  feq.s        gp, ft4, ft10
                  auipc        ra, 628915
                  srl          ra, a6, a2
                  xor          a1, t0, s1
                  sltiu        a5, t1, 341
                  feq.s        s3, fs9, ft1
                  slt          s4, t2, a4
                  xori         t0, s3, 658
                  fsgnjn.s     fs7, ft8, fs9
                  srli         s4, a1, 31
                  fdiv.s       ft4, fs7, ft11
                  srli         t3, s6, 27
                  or           a5, s4, gp
                  feq.s        t5, ft11, ft2
                  fmul.s       fa0, fs6, ft11
                  slli         a7, s4, 24
                  xori         t3, s10, -1844
                  fsgnjx.s     ft8, fs0, fa7
                  fcvt.w.s     s8, fa3, rup
                  fmv.w.x      ft2, s8
                  fcvt.w.s     s5, ft8, rtz
                  mulhu        a2, s0, s7
                  fdiv.s       fa2, ft11, fs3, rmm
                  fcvt.w.s     s10, fs0
                  fmv.x.w      s8, ft7
                  divu         s5, s6, s1
                  fadd.s       fa3, fa5, fa3, rmm
                  remu         s4, a1, t4
                  nop
                  xor          t3, s6, a2
                  fcvt.wu.s    a4, ft3, rmm
                  and          t6, s8, t0
                  mulhsu       s4, zero, s5
                  or           s8, a6, a5
                  ori          s5, tp, -966
                  slt          ra, a7, t4
                  srai         s10, a2, 0
                  slti         t3, s11, 175
                  remu         t2, tp, a4
                  fadd.s       fa5, fa3, fa0
                  or           s4, a4, s4
                  mul          a2, t3, s1
                  fclass.s     s9, ft2
                  sll          s10, a5, t2
                  fclass.s     s0, ft8
                  srai         ra, a1, 4
                  fmv.w.x      fs6, a6
                  nop
                  fdiv.s       fa3, ft4, ft2
                  addi         s2, s1, -393
                  div          t4, s1, t3
                  mulhsu       s8, s0, a5
                  remu         s3, s2, a2
                  rem          s8, s10, t3
                  addi         a7, t2, 667
                  sltu         a0, t4, a3
                  mul          t4, s5, s4
                  mulhsu       t5, s2, a7
                  fclass.s     a2, ft10
                  xori         t2, s5, -1057
                  mulhsu       s7, t1, s9
                  fsqrt.s      fs11, ft1, rne
                  fmax.s       fs5, fs8, ft5
                  add          s4, a2, a1
                  fcvt.wu.s    t2, ft10, rmm
                  slli         a7, a4, 23
                  mulh         tp, a4, s2
                  fdiv.s       ft8, fs4, fs9
                  fcvt.s.wu    ft0, ra
                  sltiu        t0, t6, 27
                  srli         a2, s10, 21
                  lui          a0, 715106
                  feq.s        s9, fa3, ft4
                  slli         tp, s8, 23
                  remu         t5, s8, tp
                  mulhsu       t3, a3, s11
                  divu         s11, s8, t6
                  fsgnj.s      ft4, ft6, fs6
                  fmax.s       fs2, fa7, fa2
                  mul          s11, s6, a2
                  slti         s3, gp, 571
                  and          t2, t3, t3
                  fsqrt.s      ft11, fa2, rne
                  sltu         s4, s6, a5
                  fcvt.s.wu    fa7, s6
                  fcvt.s.wu    ft4, t0
                  sra          s7, a4, t0
                  fcvt.s.wu    fa2, t3, rdn
                  xor          a1, s6, s6
                  and          tp, s4, s11
                  fcvt.s.w     fs6, s1, rne
                  fsgnj.s      fs3, ft1, ft8
                  mulhsu       t4, tp, s9
                  fcvt.s.w     fa4, t6
                  lui          s7, 754414
                  mul          zero, t1, t6
                  mulhsu       s9, a3, a7
                  addi         s10, s1, 1203
                  fsgnj.s      fs0, fs3, ft5
                  fsgnj.s      ft5, fa6, ft0
                  fle.s        a5, fs3, ft6
                  xori         ra, a6, -270
                  and          a7, s3, a6
                  divu         t3, a2, a5
                  mulh         a5, zero, s10
                  fcvt.w.s     s7, fs3
                  sub          s3, s6, s11
                  fadd.s       fa7, fs2, fs0, rmm
                  fsgnjn.s     fs9, ft1, fa7
                  sltu         t3, s4, tp
                  and          a0, a5, gp
                  fsgnjx.s     fa0, fs5, ft3
                  sub          sp, t4, s2
                  xori         ra, s6, 1348
                  fmax.s       fa5, ft11, fs5
                  fadd.s       fs9, fs10, fs3, rmm
                  sltiu        a0, s7, 1781
                  srl          ra, s6, a7
                  auipc        a2, 531589
                  remu         a4, t5, tp
                  slt          s8, s9, a7
                  add          s0, t1, t2
                  fsgnjn.s     fs10, fa1, fs3
                  fsgnjn.s     ft9, ft9, fs8
                  sltiu        s2, a4, -1922
                  slt          a1, s8, s2
                  fdiv.s       fa6, ft0, ft0
                  sltiu        s1, s8, -1797
                  fmul.s       ft5, fa0, fs4, rne
                  addi         s3, s2, -400
                  srai         a1, a6, 7
                  sll          a2, t1, t4
                  fcvt.w.s     s3, fa4, rup
                  fmin.s       ft8, fs8, ft3
                  fclass.s     s5, fs9
                  fsqrt.s      fs3, fs1, rtz
                  mulhsu       t3, t0, t0
                  divu         t4, ra, gp
                  fle.s        s4, fs8, fs2
                  rem          s7, gp, gp
                  fsgnjx.s     fa5, ft8, fa5
                  auipc        zero, 557506
                  fsgnjn.s     fs8, fa0, fa4
                  fcvt.wu.s    a7, fs3
                  srli         s9, t3, 25
                  xori         s10, a7, 298
                  mul          s5, zero, a6
                  addi         t3, gp, -51
                  fclass.s     s5, ft10
                  mulhu        s5, a4, a0
                  sra          s11, a5, s2
                  fmin.s       fa7, ft7, fs9
                  div          s5, s11, s7
                  rem          t3, s1, a3
                  fsub.s       ft1, fa6, fa4
                  div          s0, a4, s0
                  fsub.s       fs2, fs8, fa0, rup
                  ori          ra, s9, -145
                  fcvt.w.s     a2, fs4, rmm
                  xori         s9, tp, 237
                  slt          a2, s1, a0
                  fsgnjn.s     ft3, ft9, fs1
                  fsgnjx.s     fs10, fa2, fa3
                  mul          s4, t2, a2
                  slt          tp, s11, a1
                  fclass.s     a1, fs8
                  fmax.s       ft6, fs0, fa3
                  fsub.s       fs7, fa3, fs11
                  fle.s        s3, ft1, fs10
                  mul          t0, s8, s2
                  feq.s        s7, fs7, ft9
                  mul          a4, a1, s5
                  fmv.w.x      ft0, a4
                  fsgnjn.s     fa2, fs9, fs2
                  fsqrt.s      ft5, fs2, rtz
                  sra          a5, s2, t2
                  fsub.s       fs0, ft6, fs9
                  fsqrt.s      ft7, fa5
                  fsub.s       fs0, fs7, fs1, rtz
                  srl          s9, a5, tp
                  fcvt.wu.s    s8, ft10
                  srl          ra, s11, a6
                  add          s7, a0, zero
                  add          sp, t4, t3
                  srli         t0, a2, 16
                  fsub.s       ft4, ft1, ft7, rdn
                  fle.s        gp, fs1, ft11
                  fle.s        s10, fs6, fa7
                  fmv.w.x      fs9, sp
                  andi         a7, a2, 1045
                  ori          s11, a0, -713
                  fcvt.w.s     s3, fs6
                  fcvt.wu.s    a4, ft0
                  fsub.s       ft10, ft0, fa4, rtz
                  fmv.x.w      s0, ft5
                  fsub.s       ft8, ft3, fa4
                  addi         s10, s3, -119
                  slti         sp, s1, 1843
                  slt          t6, s2, s5
                  divu         s2, s3, s6
                  srl          zero, a4, a6
                  xor          sp, s2, s11
                  div          t3, s6, a5
                  flt.s        t5, fa3, fs11
                  add          a3, a3, zero
                  feq.s        s11, fs3, fa1
                  flt.s        s10, fa3, ft4
                  fclass.s     a3, fs3
                  fsgnjn.s     ft1, fa2, ft2
                  fsgnjx.s     fa6, ft8, fs7
                  fmul.s       fs3, fa5, ft4
                  sra          zero, s2, gp
                  sub          ra, s6, a6
                  fmv.w.x      fs5, t2
                  nop
                  fmv.w.x      ft7, t4
                  xori         t2, t6, -1737
                  fcvt.s.wu    fa0, s2
                  add          s10, t3, t2
                  nop
                  fmin.s       fs10, fa7, fs9
                  and          s9, s1, s7
                  fadd.s       ft6, fs5, fs1
                  addi         s10, s8, -835
                  xori         ra, a3, -1397
                  addi         sp, tp, 162
                  fmv.w.x      fa7, s8
                  fsqrt.s      fs7, fs5, rdn
                  add          a3, a0, ra
                  slti         tp, s3, -1742
                  rem          gp, ra, t2
                  mulhsu       zero, t0, s3
                  fsub.s       fa7, fa0, ft7, rup
                  fadd.s       fa6, fa5, fa1, rne
                  fsub.s       ft6, fa0, ft8
                  srl          t0, t3, zero
                  xori         s9, gp, 462
                  mulh         s5, t4, t0
                  fsgnjx.s     ft8, ft0, fa5
                  sub          s4, s0, s3
                  fmv.x.w      t2, fs9
                  slt          t6, t5, t2
                  and          t0, t3, a6
                  or           a0, s5, s5
                  sra          s1, a1, a4
                  xor          t4, s3, a4
                  fmul.s       ft3, ft3, ft9
                  mul          s2, t5, a1
                  slli         ra, a1, 1
                  addi         s1, t6, -45
                  fsqrt.s      fs8, fa1, rne
                  slt          t5, a3, tp
                  sltiu        t0, a0, 706
                  fsgnjx.s     ft3, fs9, fs1
                  fcvt.s.w     fs1, ra
                  auipc        s5, 342264
                  slti         s5, t3, 221
                  fmax.s       fa3, ft2, ft5
                  fsgnjn.s     fs9, ft4, fa1
                  ori          s10, t3, -1031
                  sll          sp, t4, s5
                  sra          s3, s7, t0
                  slli         sp, zero, 11
                  fsub.s       ft8, fa6, ft6, rup
                  srl          a5, s3, a1
                  ori          s5, s7, 55
                  andi         t6, a6, -1205
                  fmv.x.w      sp, fs2
                  remu         a2, s5, a3
                  flt.s        t2, ft9, fs10
                  remu         s0, s6, tp
                  ori          s3, s11, -371
                  mulh         t0, a4, a7
                  sltiu        gp, s4, 853
                  divu         zero, gp, s1
                  or           s2, s2, s3
                  slti         a7, s5, -1301
                  remu         s10, a3, a2
                  sra          gp, ra, s9
                  fsub.s       ft3, ft9, ft9
                  fsgnj.s      fa6, fa5, fs2
                  sub          s8, s10, t5
                  srli         s8, a6, 9
                  fsqrt.s      ft8, fs2
                  fmv.x.w      s5, fs6
                  flt.s        a5, fs1, ft10
                  sra          s10, ra, a7
                  sltiu        gp, s0, 1500
                  flt.s        a4, fa7, fa1
                  sll          t5, a0, t4
                  fcvt.w.s     s2, ft4, rup
                  or           a0, t0, a3
                  srli         t6, a2, 18
                  feq.s        gp, ft3, fs9
                  xori         s2, s1, -985
                  fcvt.s.wu    fs4, s10
                  addi         t2, s6, -1522
                  ori          a3, s9, -970
                  fsgnjx.s     fs9, fs2, fs9
                  fle.s        a2, fs3, ft8
                  xori         s10, s1, -749
                  fcvt.w.s     s3, ft6
                  sltu         zero, a6, s4
                  fmul.s       fs9, ft4, fa1
                  xor          s11, a4, a5
                  sltu         a5, s10, tp
                  nop
                  divu         s4, t3, a7
                  ori          a7, s5, 115
                  fmv.x.w      a4, fa2
                  fsgnjx.s     fs0, fs4, fs9
                  auipc        a3, 988096
                  xor          a3, tp, s8
                  slt          s8, a4, zero
                  fsqrt.s      ft6, ft8
                  fsgnjn.s     fs8, ft2, ft8
                  rem          a4, s6, ra
                  slti         s10, t3, -892
                  fcvt.s.w     fa2, a5, rdn
                  slli         s7, s2, 30
                  or           tp, s2, sp
                  lui          a1, 178098
                  srli         a4, t2, 3
                  fle.s        s0, ft2, ft6
                  fsqrt.s      fs8, ft8, rne
                  fcvt.s.w     ft2, s3
                  add          a5, a6, s10
                  flt.s        a0, fs0, fa1
                  and          s11, s8, tp
                  fsgnjx.s     ft5, ft5, fs7
                  slti         s1, a1, 1390
                  fcvt.wu.s    t5, ft2
                  addi         sp, t1, 2027
                  srl          t4, t0, a6
                  fmin.s       ft7, ft5, ft3
                  slt          s7, a6, a5
                  fsub.s       fs4, fa0, fa7, rmm
                  lui          zero, 437872
                  slli         s0, ra, 6
                  fadd.s       fs8, ft10, fs6
                  rem          a1, t2, s5
                  sll          s9, t2, a7
                  xor          sp, gp, s9
                  div          s9, s0, t2
                  srli         ra, a7, 26
                  andi         tp, gp, -1579
                  lui          tp, 998533
                  fsgnjn.s     ft3, fa3, fs7
                  addi         s1, t6, 103
                  mulh         zero, a7, a0
                  flt.s        t4, fs6, fa7
                  srli         sp, s10, 22
                  ori          a1, t4, -2011
                  feq.s        t2, fa5, fs1
                  fsgnjx.s     ft7, ft7, fa7
                  fcvt.s.w     fa6, s2
                  fsub.s       ft1, ft0, ft4
                  div          a4, t6, s6
                  slti         t0, sp, 1293
                  flt.s        t5, fs10, fa6
                  mulh         t3, a7, s4
                  fmv.w.x      fs0, a4
                  fadd.s       fs11, fs6, ft1, rtz
                  fsgnjx.s     ft10, fs1, fa7
                  slt          s2, a5, a5
                  fsgnjx.s     fs10, fs1, ft11
                  mulh         s3, tp, t4
                  flt.s        s2, fs6, ft0
                  nop
                  feq.s        s11, fs4, fa7
                  slt          a5, s4, s9
                  mul          s9, zero, s6
                  sub          s9, s10, a1
                  remu         t4, s9, t6
                  xor          s11, t4, t2
                  fcvt.s.w     ft4, a2, rtz
                  sra          s1, t6, s11
                  fmul.s       fs6, fs4, fa0, rne
                  xori         t5, zero, 71
                  sra          s0, t3, t5
                  fle.s        zero, ft1, ft11
                  add          s3, t2, zero
                  div          zero, a6, gp
                  fdiv.s       fs11, fa2, ft4, rne
                  sltu         s5, zero, s3
                  fsub.s       fa4, ft5, fa6, rtz
                  auipc        ra, 153067
                  srli         s3, ra, 25
                  mulhsu       s8, t4, a1
                  slt          ra, a4, s10
                  feq.s        zero, ft1, ft4
                  and          s10, s3, s6
                  sltiu        s10, a2, -311
                  mulhsu       tp, s10, a3
                  fmv.x.w      zero, fa4
                  fmv.x.w      t5, ft5
                  fmin.s       fa0, fs10, fa4
                  fle.s        sp, fs7, ft1
                  sltu         s11, t4, s8
                  lui          s11, 672855
                  andi         s8, t3, 1258
                  fcvt.wu.s    t5, ft2
                  fsgnj.s      fs10, fa6, ft8
                  fle.s        t5, ft2, fs1
                  and          s2, t1, s0
                  fcvt.s.wu    ft8, s5, rdn
                  fle.s        s8, fs7, fa4
                  sltu         a5, t5, s2
                  mul          s9, s11, t1
                  auipc        t5, 780768
                  mulh         s5, t1, s6
                  srl          s2, sp, t4
                  sll          a7, t3, t4
                  fcvt.s.wu    fs8, s3
                  sltu         a5, a5, a5
                  lui          s3, 729289
                  fcvt.s.wu    fa0, t5
                  fcvt.w.s     a3, ft6
                  and          t3, t6, t3
                  auipc        zero, 488550
                  lui          a5, 528505
                  sltu         s11, tp, s6
                  divu         a7, s4, a7
                  sltiu        a4, t5, -1912
                  srl          t2, s8, s1
                  mulhsu       s8, s4, sp
                  fmin.s       fa1, ft3, ft11
                  mulhu        a0, sp, s11
                  auipc        s11, 793185
                  auipc        gp, 258049
                  fmax.s       ft9, ft0, fs11
                  lui          s1, 488532
                  fcvt.s.wu    fs8, t3
                  flt.s        ra, fs0, ft10
                  rem          tp, t0, t4
                  fmin.s       fa0, fs9, fa2
                  srl          gp, t6, s4
                  mulh         a0, s5, t3
                  fmul.s       fa2, fs10, fs2, rup
                  mulh         s10, a6, zero
                  srl          t5, t6, s5
                  feq.s        a1, ft10, fs10
                  fsub.s       fs5, fs10, ft3, rne
                  slt          sp, s9, s11
                  fsqrt.s      fa3, fa0, rmm
                  fdiv.s       fa2, fs6, ft1, rdn
                  fsub.s       fa2, fs7, fs8, rdn
                  fmv.x.w      t2, fa3
                  mulhsu       s5, t6, s1
                  slti         ra, sp, 129
                  auipc        s3, 868077
                  fsgnjx.s     ft1, fa7, ft0
                  fdiv.s       fs7, fs8, fa7
                  xor          s9, s8, t3
                  srai         t6, t6, 6
                  fmv.x.w      t0, ft1
                  fmax.s       fs11, fa1, fa1
                  addi         gp, s4, 871
                  srl          ra, t2, s6
                  fsgnjn.s     ft3, fs5, ft0
                  fdiv.s       fs5, fs8, fa3
                  mulh         t5, s3, a0
                  rem          t2, a1, a1
                  addi         t6, t0, -192
                  sltiu        s3, ra, -1332
                  remu         a5, ra, t4
                  fsgnjn.s     ft9, fa5, fa6
                  fsgnjx.s     ft9, fa6, ft6
                  and          s3, s1, s2
                  fsub.s       fs1, ft11, fs10
                  fdiv.s       fa3, fs2, fa3, rup
                  fmv.x.w      s11, ft10
                  rem          t6, t1, a4
                  fcvt.s.wu    ft3, a7
                  flt.s        a5, ft7, fs8
                  srl          t5, sp, t2
                  mulhu        t3, t3, a7
                  srl          s9, t6, s3
                  fmv.w.x      fa7, sp
                  srl          sp, s10, gp
                  slt          s9, gp, t2
                  fmv.w.x      fs9, s1
                  and          sp, s10, t6
                  fsgnj.s      fs11, ft0, ft2
                  fclass.s     a1, fa7
                  mul          a7, t3, s4
                  feq.s        sp, ft4, fa7
                  fmv.x.w      a5, fs0
                  fmax.s       ft11, fs9, ft7
                  lui          t0, 33321
                  fsgnjx.s     fa6, fa3, fs0
                  addi         t2, a1, -1576
                  slli         t4, t5, 16
                  fcvt.s.w     fa1, t4
                  srl          s10, t2, zero
                  fmax.s       ft11, ft4, fa3
                  mulhsu       a0, t4, a1
                  lui          s1, 851517
                  sub          s2, s4, t3
                  andi         t3, sp, -1648
                  add          t6, t1, s9
                  srl          a2, a4, t2
                  ori          s8, a6, -1284
                  lui          t4, 352414
                  mulhu        t0, sp, s1
                  mulhsu       t0, s6, s11
                  fdiv.s       fa4, fa4, fa6, rtz
                  fdiv.s       ft2, ft2, ft6
                  fclass.s     t3, ft8
                  divu         s9, s5, a1
                  sra          tp, s1, t0
                  xor          s2, s1, tp
                  addi         t5, a3, 1479
                  div          t4, s5, t0
                  srl          s8, s5, s0
                  fmv.w.x      fs2, t5
                  mulh         zero, t2, s4
                  slt          s7, a5, tp
                  fcvt.wu.s    zero, ft2
                  sll          s1, a1, t6
                  srli         s7, a5, 9
                  fcvt.w.s     a4, ft4
                  flt.s        a0, fs2, fa4
                  fsqrt.s      ft10, ft3, rne
                  sra          s8, s4, s3
                  fmv.w.x      fs6, s4
                  sltiu        zero, s0, 619
                  rem          s5, a3, a0
                  mul          s8, t1, t2
                  fmv.w.x      fa5, a5
                  fcvt.wu.s    zero, ft8
                  fdiv.s       fs8, fs10, ft2
                  fmin.s       fa0, fa3, ft8
                  andi         t3, a5, 1644
                  sltu         zero, gp, s8
                  fdiv.s       fs8, fs0, ft11
                  addi         s10, a5, -747
                  ori          s11, a1, 1720
                  xori         t2, s11, 1871
                  xori         a7, s4, 1579
                  fsgnjx.s     ft10, ft7, ft0
                  or           t5, s6, a2
                  fmv.x.w      a0, ft9
                  fmv.w.x      fs9, a4
                  fsqrt.s      fa0, ft1, rne
                  slti         t0, tp, 1483
                  divu         a4, s1, t2
                  addi         a2, a6, -1743
                  fdiv.s       ft10, ft0, fs0
                  fmax.s       fa0, fs4, fs4
                  sub          s3, s4, t6
                  or           s7, s11, t2
                  sll          s9, t2, s7
                  fcvt.wu.s    s3, fs5, rup
                  fdiv.s       fs2, fs5, fs11
                  fmax.s       ft4, fs10, ft8
                  mul          t4, s4, t4
                  fmin.s       ft9, fa5, fs3
                  fmax.s       ft1, ft5, fs11
                  fmv.x.w      s5, fs4
                  fsgnjn.s     fa5, fs8, fs11
                  fsgnj.s      ft0, ft8, ft7
                  rem          a2, s5, t5
                  nop
                  srl          s10, s2, t3
                  sll          sp, gp, s11
                  fmv.w.x      fa6, sp
                  fmax.s       fa3, fs0, fa4
                  fclass.s     s7, ft0
                  fmv.x.w      s0, fs7
                  mulhsu       t5, s0, t5
                  fdiv.s       fs6, fa3, fa2, rtz
                  sltiu        t0, a5, 592
                  fclass.s     t5, fs11
                  auipc        t5, 452296
                  divu         tp, a3, s0
                  fsgnjx.s     ft11, fa6, ft1
                  fsqrt.s      fs9, fa1, rup
                  fcvt.s.wu    ft0, ra
                  div          t3, s10, a7
                  xor          tp, s4, s3
                  fcvt.s.wu    fa2, a2
                  rem          t0, a5, tp
                  fcvt.w.s     s2, fa0, rtz
                  add          s11, s11, a1
                  mulhu        s3, a1, s6
                  srli         t5, t2, 2
                  fsgnjx.s     fa3, fa0, fs5
                  fmax.s       ft11, fs0, fa7
                  slt          s1, a1, zero
                  rem          gp, s7, tp
                  fsub.s       ft11, fs10, fs7, rtz
                  srai         a1, a1, 26
                  mul          s5, ra, s2
                  fmin.s       fs1, ft4, ft9
                  mulh         s4, t2, t6
                  fadd.s       ft0, fs4, ft8, rup
                  fcvt.s.w     fa1, s8, rne
                  sll          s5, t2, s10
                  fmv.w.x      ft0, s8
                  mul          s7, tp, s2
                  nop
                  fmax.s       ft7, fs6, fs3
                  fcvt.s.w     fs5, a2
                  fcvt.w.s     t5, fs4, rdn
                  ori          s4, s11, -1667
                  sltu         s10, t6, t6
                  slti         s9, s5, -1589
                  mulhu        ra, t6, a1
                  fsqrt.s      fs7, fa3, rup
                  fadd.s       fs10, fa3, ft1
                  fsub.s       fa4, ft4, fs7, rup
                  nop
                  fadd.s       ft8, fs8, fs9
                  fmul.s       ft11, fs4, fs7, rdn
                  sll          s3, a0, gp
                  srl          a4, t0, s6
                  sub          ra, s0, t6
                  addi         t0, s3, -874
                  slti         a0, s8, -1191
                  divu         a4, zero, s1
                  auipc        s7, 381462
                  fsub.s       ft7, fs10, fa6
                  fdiv.s       ft10, fa3, ft9
                  feq.s        s8, fs6, fs3
                  fsub.s       fs4, fa3, fs6, rdn
                  fsgnjx.s     fa4, ft3, ft0
                  fsgnjn.s     fs8, ft5, ft0
                  add          t4, t2, zero
                  addi         s1, t6, -1601
                  nop
                  and          a7, a1, s10
                  fcvt.w.s     a4, ft4
                  andi         a5, t4, 652
                  div          a7, a5, s1
                  fmv.w.x      ft0, t5
                  mulh         zero, s4, gp
                  fmax.s       fs1, fs3, fs2
                  fcvt.s.w     fs5, t4
                  fmul.s       ft2, fs4, fs0, rmm
                  flt.s        ra, ft6, ft5
                  remu         gp, gp, s3
                  srl          t6, s11, s8
                  fsqrt.s      ft8, ft8, rmm
                  slli         t5, s6, 15
                  flt.s        t2, ft0, fs10
                  xor          s0, a7, gp
                  srl          t4, s0, a7
                  or           t2, s1, gp
                  fcvt.s.wu    ft1, s4
                  srl          a1, s7, a0
                  andi         t5, a1, -22
                  fcvt.wu.s    s0, fs4, rdn
                  srl          sp, a5, a4
                  mulh         a2, zero, a7
                  fcvt.s.wu    ft4, a2
                  fmin.s       fs11, ft6, ft0
                  div          s1, tp, t0
                  lui          s7, 154993
                  fsgnjn.s     ft8, ft11, fa0
                  fcvt.s.w     fa1, s1
                  xor          a0, t6, t3
                  srl          s11, t3, a5
                  andi         ra, a7, -474
                  sltu         a1, s2, s6
                  slli         sp, a5, 30
                  slt          sp, s7, a7
                  auipc        s4, 828180
                  addi         s2, s4, 1634
                  sltu         a2, s4, a5
                  sub          a0, sp, s6
                  xor          a7, s5, a2
                  fmv.w.x      fa3, s11
                  sltiu        t4, s7, -1183
                  sra          sp, a3, t1
                  auipc        t4, 524291
                  add          a5, ra, s10
                  auipc        tp, 457491
                  slt          a0, tp, s8
                  add          s4, ra, s8
                  fmul.s       fa7, fs8, ft0
                  fmin.s       ft1, fs1, ft11
                  fmul.s       ft6, fs6, fs3
                  div          t2, a5, zero
                  slti         a3, t1, 201
                  sltiu        s10, t6, -983
                  add          a4, t4, ra
                  divu         a1, a4, t5
                  feq.s        s8, fs4, fs5
                  div          s2, s5, sp
                  and          gp, s3, a7
                  fmul.s       fs11, fs7, ft3, rtz
                  fcvt.s.w     fs5, s3
                  fcvt.s.w     fs9, s8
                  nop
                  mul          s8, a5, s7
                  ori          s9, s9, -1434
                  div          a3, s10, s9
                  ori          t0, t6, 519
                  fsgnjn.s     fa0, fa3, fs2
                  fclass.s     s0, fa4
                  fsub.s       fa7, fa1, ft0, rne
                  xor          s0, s4, a5
                  andi         a1, s11, 969
                  fsgnj.s      fa0, fs8, fs6
                  fcvt.wu.s    a0, fa4, rmm
                  sltiu        t6, s7, -961
                  sltu         s11, t4, sp
                  fmin.s       ft1, ft0, fs2
                  mulhu        tp, t6, s7
                  remu         t3, s3, s4
                  auipc        ra, 321851
                  addi         a1, s4, 512
                  fle.s        a1, ft7, ft2
                  fsqrt.s      fs8, fs3
                  div          gp, a5, a4
                  sra          s0, t5, s2
                  ori          t2, a7, 1448
                  and          s3, t4, t3
                  auipc        s0, 124907
                  remu         a7, t2, t0
                  fcvt.s.w     fa5, t0, rmm
                  srl          s7, sp, a0
                  auipc        s4, 945088
                  srai         a0, s0, 9
                  fsqrt.s      fs1, fs6, rdn
                  srl          a0, a2, t0
                  srli         t2, t5, 20
                  fdiv.s       fs10, ft0, fs0
                  mulhsu       sp, a6, s7
                  mulhsu       s3, s7, s3
                  sltu         s2, s8, a2
                  fmv.x.w      s2, fs0
                  sll          s2, a3, ra
                  fmul.s       fa0, fs9, fs10, rdn
                  divu         s8, s5, zero
                  addi         s3, s2, 650
                  fmin.s       ft2, ft1, fs2
                  xor          s7, s10, a3
                  fdiv.s       fs5, ft1, fa3, rmm
                  slti         gp, a6, -1858
                  add          t4, a1, a3
                  feq.s        t2, fs1, fs0
                  fdiv.s       ft11, ft10, ft9
                  fdiv.s       fa0, ft5, ft0
                  feq.s        sp, fa1, fs6
                  addi         gp, t0, 324
                  slti         t5, t3, -120
                  slti         s7, s6, -260
                  andi         sp, s5, -1835
                  nop
                  fsub.s       fs6, fs8, fa3
                  mulhu        s7, a1, ra
                  andi         s3, a5, 62
                  fmul.s       ft2, fs11, fa7
                  fmin.s       ft9, fa1, fa0
                  fsub.s       ft9, fs7, fa5
                  fsgnjx.s     ft9, ft1, fs2
                  sra          t5, a3, gp
                  ori          s2, s3, 2003
                  auipc        a4, 503518
                  divu         t2, t1, t2
                  add          t2, s0, a5
                  sra          sp, a5, s6
                  srai         t0, t3, 15
                  fmul.s       fa7, fs4, fa4
                  fcvt.w.s     s2, fs2, rmm
                  ori          s1, s6, -80
                  fmv.w.x      fs9, s9
                  divu         zero, a1, t1
                  or           s11, a1, zero
                  mulhu        a7, t3, tp
                  feq.s        a0, fs0, fs4
                  fcvt.s.w     fs2, t3
                  remu         a4, a7, t2
                  sub          s11, a2, s9
                  fmul.s       fs2, fs7, fa7
                  fsqrt.s      ft1, ft5
                  mulh         a0, a2, s8
                  mulh         sp, s3, s8
                  mul          s11, s3, t4
                  auipc        a0, 35400
                  mulh         t0, zero, ra
                  or           s4, s9, a2
                  fcvt.w.s     a1, fa7
                  fcvt.s.w     fs9, a5
                  or           t6, s2, t6
                  sltu         gp, a7, s1
                  mulh         t2, s0, a5
                  mul          t4, gp, zero
                  fcvt.s.w     fa4, t0, rmm
                  fsub.s       fs7, fa5, fa2, rtz
                  fsqrt.s      fa5, fs4
                  sll          s1, a7, t2
                  div          s4, s9, s4
                  fclass.s     s10, ft3
                  feq.s        s2, fs7, ft11
                  fmax.s       fa0, fs0, fs11
                  lui          s5, 1038038
                  fclass.s     s2, fs8
                  srai         a7, s11, 5
                  srli         t2, a4, 26
                  feq.s        t4, fs10, ft9
                  sll          s0, a3, s4
                  lui          a0, 380188
                  auipc        s1, 677580
                  fmul.s       fs10, fs10, fs3
                  flt.s        s7, ft2, fs4
                  fmul.s       fa4, fs0, ft1, rdn
                  sra          s1, a0, s6
                  slt          s7, s6, a0
                  fsqrt.s      fa3, fs5
                  ori          t2, zero, 83
                  mulhsu       s1, a4, s1
                  slli         a5, zero, 26
                  fsgnj.s      fa5, fs3, ft6
                  fclass.s     s5, ft1
                  fadd.s       ft0, ft10, ft11, rne
                  addi         sp, s9, 786
                  sll          t0, s5, zero
                  remu         zero, t0, a5
                  mul          a5, s4, ra
                  fsub.s       fs3, fa6, ft8
                  slt          s9, s2, zero
                  add          s1, gp, s11
                  addi         a7, s9, -606
                  fclass.s     t2, ft10
                  fcvt.s.w     ft7, gp
                  fcvt.s.w     fs6, t6
                  divu         a3, s8, s4
                  and          t3, s7, s8
                  fmv.x.w      tp, fs11
                  sra          s4, a2, s9
                  sltu         s7, s7, s2
                  nop
                  lui          s7, 813657
                  or           a1, s10, s2
                  fcvt.s.wu    fs4, s0
                  srai         s4, t4, 26
                  sll          a4, gp, s10
                  lui          t4, 226626
                  or           a3, t1, t6
                  andi         ra, t0, -513
                  srai         s11, s6, 14
                  srli         ra, a2, 14
                  fsqrt.s      ft7, fa7
                  srl          zero, a4, a5
                  flt.s        t6, fs11, fs2
                  ori          gp, sp, -1003
                  fmv.x.w      tp, ft10
                  fle.s        a2, fa2, fs1
                  ori          s2, s6, -1672
                  fsgnjx.s     fs1, ft9, fa4
                  fsgnjn.s     fs5, fs7, fa5
                  fcvt.w.s     s8, ft8, rup
                  fcvt.w.s     s7, fs3
                  flt.s        gp, fs2, ft11
                  sltiu        s3, t2, -1724
                  div          t2, t5, s3
                  feq.s        s1, fs10, fa2
                  nop
                  fcvt.s.wu    fs2, s10
                  fcvt.s.wu    fs8, a7
                  fcvt.s.w     fs4, s6
                  slli         t3, t1, 24
                  fsgnj.s      ft4, fs7, fa5
                  flt.s        s11, fa0, ft4
                  and          t4, a7, s1
                  auipc        t3, 593109
                  sltiu        s3, t3, -1193
                  rem          s3, t5, t0
                  fsqrt.s      fs3, ft5, rtz
                  sltiu        s9, ra, -1942
                  lui          s2, 432988
                  slt          s10, t4, s2
                  fcvt.s.wu    fs8, a5, rmm
                  slt          s11, ra, t1
                  fsgnjx.s     fs9, ft6, fa1
                  fclass.s     s11, ft3
                  rem          a0, t6, s4
                  feq.s        gp, fs7, fs8
                  fmv.w.x      ft9, s10
                  xori         s5, t5, 260
                  srli         tp, a7, 16
                  fsgnjn.s     fa2, fs6, fa7
                  nop
                  fcvt.w.s     t2, ft7
                  fclass.s     s11, fa2
                  remu         a1, gp, a7
                  fadd.s       fa0, ft5, fa7, rdn
                  sra          a3, t6, s10
                  fsub.s       fa0, fs8, fa4
                  remu         tp, t3, s7
                  mulhsu       gp, t5, s7
                  fmin.s       fs2, ft1, fs9
                  mulhsu       zero, tp, zero
                  mul          zero, s5, sp
                  add          t3, t6, a4
                  fsgnj.s      ft3, fa5, fa3
                  fcvt.s.w     ft11, t3
                  feq.s        sp, ft11, ft10
                  srli         tp, s11, 29
                  fsgnj.s      ft11, ft5, fa7
                  andi         t5, s0, -806
                  fmv.x.w      s9, fs1
                  xori         s5, s3, -156
                  fle.s        t5, ft4, ft2
                  xor          a1, a7, t6
                  auipc        a4, 860487
                  nop
                  srli         s9, t4, 16
                  addi         a5, a2, -1427
                  xori         t6, t0, -926
                  addi         t5, a7, -1346
                  srli         s10, t5, 7
                  fcvt.wu.s    s3, fs6, rmm
                  sltiu        zero, a3, 718
                  sra          s11, s3, s1
                  addi         s1, s0, -387
                  fdiv.s       ft4, fs5, ft3
                  mulhu        zero, a0, ra
                  div          a3, a0, tp
                  fsub.s       ft10, fs8, fa0, rdn
                  slti         s10, s3, 178
                  addi         gp, a4, -1178
                  slti         a4, a0, -1136
                  fsgnj.s      fs0, fs8, ft9
                  feq.s        sp, fs7, fs4
                  andi         s3, t5, 1953
                  slt          sp, s6, s8
                  fsqrt.s      ft3, ft1, rtz
                  fsub.s       ft6, ft0, fa7, rtz
                  fcvt.wu.s    s4, ft1
                  sltu         t3, s1, a7
                  ori          a2, s5, -1863
                  auipc        zero, 195749
                  fmv.x.w      a4, fa2
                  andi         a2, a0, -1581
                  sub          t2, a5, gp
                  add          tp, s6, zero
                  fsub.s       fs6, fa0, fs8, rdn
                  fsgnjx.s     fs9, ft1, fs9
                  feq.s        s9, fs8, fs6
                  srai         t0, sp, 30
                  fsgnjn.s     ft8, fs6, ft11
                  slti         a0, s0, -881
                  sltiu        gp, s2, -1875
                  divu         s5, s3, a7
                  and          a7, a3, a1
                  and          s2, a7, s9
                  fcvt.w.s     t2, ft0
                  mul          zero, s3, s8
                  remu         a2, s6, s9
                  fadd.s       ft2, fa4, ft6
                  slti         a7, s7, 1813
                  flt.s        a4, ft2, ft3
                  auipc        t2, 313724
                  fdiv.s       ft9, fa7, fs10
                  or           a5, a2, s10
                  mulhu        s11, a4, s2
                  fmul.s       fs9, fs4, fa0, rmm
                  lui          s2, 308218
                  fcvt.w.s     t5, ft8, rmm
                  fmin.s       ft6, ft2, fa3
                  fcvt.w.s     a4, ft11
                  fmax.s       fs8, ft0, ft9
                  fdiv.s       fa4, ft1, ft7, rtz
                  fmin.s       fa4, fs4, ft9
                  sltiu        s9, s9, 1002
                  srai         gp, t5, 8
                  fmin.s       ft8, fa6, ft4
                  div          a7, sp, a5
                  ori          s9, s3, 2002
                  fclass.s     t3, fa4
                  fcvt.s.w     fa2, t6, rmm
                  divu         s5, gp, sp
                  fmv.w.x      fa6, a0
                  xor          t4, t4, a7
                  sltiu        s8, sp, 687
                  fsgnj.s      ft4, fs2, ft4
                  fmv.w.x      fs2, ra
                  fmin.s       fs5, fa4, ft9
                  fdiv.s       fa0, fs8, ft2
                  srai         t2, a2, 29
                  mulh         s8, a7, a2
                  fcvt.w.s     zero, ft4, rup
                  remu         s1, a6, t3
                  add          t2, t6, s5
                  addi         s5, a7, 1974
                  mulhu        s0, t1, a6
                  auipc        a5, 668525
                  div          sp, s2, a6
                  fmul.s       ft3, ft3, ft8
                  rem          sp, s3, s3
                  fmv.x.w      s4, ft5
                  srl          a4, zero, s3
                  fcvt.s.w     fs9, s10, rmm
                  sra          s11, s2, t0
                  sub          s3, s8, a6
                  srai         a3, a0, 2
                  fdiv.s       ft6, fs5, fa3, rne
                  fsgnjx.s     ft7, fs4, fs9
                  slt          zero, s8, s0
                  fmv.x.w      t4, fs5
                  nop
                  fsgnjn.s     fa0, fs2, ft1
                  lui          a5, 223697
                  fcvt.s.wu    fs9, s9, rne
                  sra          tp, s3, tp
                  fmul.s       fs2, fs8, fa5, rne
                  andi         a0, a7, 837
                  auipc        s2, 807134
                  xori         tp, t0, -77
                  srai         s8, t3, 17
                  fadd.s       ft7, fs8, fs1, rup
                  or           s8, a2, s4
                  and          a3, a3, s2
                  fsgnjx.s     fs0, ft6, fs5
                  xor          tp, s5, t6
                  sll          a2, a7, a5
                  fle.s        tp, fa7, ft6
                  andi         a5, tp, -1842
                  feq.s        s9, fs8, ft1
                  divu         t6, s4, s5
                  flt.s        a1, ft4, fs7
                  fmax.s       ft1, fa7, fs3
                  feq.s        s5, fs2, ft3
                  addi         s7, s7, -1497
                  mulh         s8, s1, a4
                  sub          t3, zero, s11
                  fmv.x.w      s4, fs1
                  divu         t6, t1, s10
                  sub          a5, s9, s0
                  fsub.s       ft8, ft5, fa6
                  slt          t2, t4, s11
                  xori         s4, tp, 1880
                  addi         s0, s6, -1789
                  mul          s7, tp, a1
                  mulhu        s4, s8, a5
                  fcvt.wu.s    gp, ft6
                  sltiu        t3, s11, 749
                  flt.s        t4, fs8, ft6
                  addi         a1, s3, 1963
                  xor          s11, s2, s11
                  fcvt.w.s     t3, ft10, rne
                  fsgnjn.s     ft2, fs6, fs6
                  fmv.w.x      ft4, s9
                  fmv.w.x      ft1, t2
                  rem          sp, a4, a0
                  fsgnj.s      ft10, fa2, fa4
                  srli         s2, s3, 16
                  auipc        t0, 109757
                  mulh         s5, a2, t5
                  addi         tp, s8, -1562
                  srl          t2, s8, s11
                  or           s8, s7, tp
                  fmin.s       fs11, fs6, ft8
                  slti         t5, t0, 576
                  fclass.s     sp, ft3
                  sub          t4, t3, a4
                  fmax.s       fs5, fa4, fs2
                  fsgnj.s      fa2, ft5, ft10
                  flt.s        tp, fs3, ft3
                  fsgnjx.s     ft7, fa4, ft8
                  lui          t5, 452831
                  fsqrt.s      fa2, fs5, rup
                  addi         s8, a3, -1858
                  srai         t4, s4, 9
                  mulhsu       s4, s11, t5
                  and          s1, a0, gp
                  srai         s9, t3, 8
                  fmax.s       fs7, ft11, ft6
                  mulhsu       s0, s1, t3
                  fsub.s       fa0, ft10, ft2
                  sra          s11, gp, ra
                  sub          sp, a7, a4
                  fmin.s       fs6, ft9, ft1
                  sltu         t2, s0, s2
                  fdiv.s       fs11, fa6, ft1
                  fsgnjn.s     fs10, fs3, fa4
                  srli         s4, t5, 25
                  nop
                  remu         s5, t5, s5
                  slli         s1, sp, 19
                  fcvt.w.s     t6, ft2
                  andi         a4, t1, -1022
                  rem          t6, a4, a7
                  or           t6, s4, a0
                  xor          s11, s8, a1
                  fcvt.s.wu    fa5, a3
                  srai         zero, t6, 31
                  xori         zero, ra, 1443
                  ori          a1, zero, -232
                  fsqrt.s      fs9, fa4, rdn
                  sra          t2, t0, s2
                  mulhu        a2, t0, s0
                  srli         s10, s10, 8
                  slti         s7, t4, 1342
                  addi         s9, a7, -97
                  mulhu        s9, zero, s10
                  slli         s7, a6, 3
                  mulhsu       a0, s3, a5
                  srai         s9, s1, 5
                  or           s1, s5, a5
                  fle.s        a1, fa3, fs6
                  fmin.s       fs8, fs8, fs5
                  fmv.w.x      fs5, s1
                  add          gp, t0, a6
                  divu         s3, t3, t5
                  fmin.s       ft7, fa0, ft3
                  fsgnj.s      ft0, fs1, fs5
                  fmin.s       ft7, fa4, ft6
                  slti         s11, a5, 1285
                  slt          s10, tp, a7
                  fmin.s       fa1, fs4, fs0
                  mulhu        a2, t5, t0
                  nop
                  lui          t0, 314635
                  div          gp, t6, gp
                  rem          a1, s9, ra
                  lui          t3, 403155
                  fsgnj.s      fa1, ft6, fa7
                  mul          s3, s7, a6
                  mulhu        a0, gp, tp
                  mulhsu       gp, a0, t4
                  sub          ra, zero, t3
                  div          s5, a1, t5
                  fcvt.s.wu    fa0, s11
                  mul          s9, t1, a1
                  remu         a0, zero, a0
                  srli         a2, a1, 14
                  add          s4, t1, t1
                  div          s7, tp, ra
                  fmv.x.w      s8, fs9
                  xori         sp, a4, 7
                  fcvt.w.s     s0, ft10, rtz
                  divu         a5, t3, ra
                  fmv.x.w      t3, fa4
                  fsgnj.s      fa7, ft6, fs4
                  fmax.s       ft1, ft9, fs9
                  addi         tp, s2, -547
                  fle.s        s8, ft9, fs7
                  ori          a7, a3, -1083
                  slt          a1, s9, a6
                  srai         s3, a0, 21
                  lui          s5, 732798
                  srai         s9, s10, 28
                  slli         a1, t1, 10
                  fcvt.w.s     t5, ft3
                  fcvt.w.s     s2, ft10, rtz
                  fmax.s       fs2, fs1, ft3
                  div          t3, s8, s0
                  slli         s5, t6, 9
                  mulh         s10, s3, t6
                  fdiv.s       fa7, fs8, fa6
                  fcvt.wu.s    s2, ft9
                  rem          t3, s2, ra
                  fcvt.s.wu    ft8, tp, rne
                  mulhsu       t3, a1, zero
                  lui          s0, 984844
                  slti         zero, t3, -135
                  fsgnjn.s     fa7, fs7, fs3
                  fle.s        tp, fs5, fs6
                  mulhsu       s7, t3, a0
                  fcvt.w.s     s10, ft5, rtz
                  auipc        s0, 105365
                  sltu         t0, t6, s7
                  fcvt.wu.s    t4, ft7
                  fcvt.w.s     s2, ft5
                  remu         zero, t3, gp
                  add          a2, s10, s2
                  add          t0, s11, a3
                  fle.s        t3, fs6, fs2
                  srai         s10, a2, 17
                  ori          a7, t3, -1335
                  sub          gp, sp, s6
                  fsub.s       fa2, ft7, fa2
                  slt          t3, a0, sp
                  srli         s4, t6, 20
                  fmv.w.x      ft0, s3
                  fmv.x.w      s4, ft8
                  xor          a5, a6, t2
                  fcvt.wu.s    s0, fa5, rne
                  addi         tp, a5, 652
                  lui          t6, 752293
                  srli         s0, s5, 20
                  divu         zero, a5, t6
                  xor          s0, t5, t5
                  lui          s7, 529501
                  fsgnjn.s     ft0, fs9, ft7
                  fcvt.s.w     fs7, s6
                  sltu         a0, a1, s9
                  srl          a3, tp, zero
                  mulhu        a7, t3, t1
                  fmul.s       fs8, fs2, ft9
                  remu         t2, tp, s7
                  addi         s7, a0, -1078
                  fmv.w.x      ft1, s3
                  fmv.x.w      s11, ft2
                  fmv.x.w      tp, ft11
                  fmul.s       ft7, fs1, fs8, rtz
                  slli         s10, s8, 6
                  fcvt.w.s     s7, fa4
                  fclass.s     t2, fs8
                  lui          t3, 600207
                  rem          zero, s10, ra
                  srl          a2, ra, s10
                  sra          s0, a2, a5
                  mulhu        s7, s2, s0
                  fmax.s       ft7, fs5, fs0
                  nop
                  fdiv.s       ft3, ft0, fs4, rdn
                  srl          a2, a3, t4
                  xori         a7, s4, 14
                  fcvt.w.s     s11, fs11, rmm
                  divu         s5, a7, t4
                  srli         s1, s4, 19
                  slli         sp, s7, 25
                  fmul.s       fa4, ft1, ft4
                  slli         s2, s5, 9
                  mulhu        t4, s8, tp
                  sra          s8, s11, t5
                  fadd.s       fs8, fs4, ft2
                  fsgnjx.s     fs10, ft11, ft10
                  fmv.x.w      ra, ft5
                  xor          t0, a0, s10
                  slt          t6, ra, s8
                  fsgnj.s      ft11, fs11, fs10
                  xor          a0, t3, t5
                  fclass.s     a7, ft1
                  add          t4, s9, a1
                  and          s11, s0, s2
                  mul          zero, s11, sp
                  xori         t0, sp, 1222
                  fsgnjx.s     ft9, fs5, fs1
                  srli         ra, a4, 23
                  fcvt.s.wu    ft5, s3
                  divu         t4, s11, a5
                  xori         s2, s4, 60
                  remu         t6, t4, s6
                  mulh         t2, t6, a1
                  andi         t3, t5, -361
                  or           s11, t1, s4
                  fcvt.w.s     t0, fs11
                  srai         gp, a1, 20
                  fsqrt.s      fa3, fs3, rne
                  sll          t0, zero, a5
                  fadd.s       ft5, ft0, fa5
                  fmv.x.w      ra, fs6
                  fsgnj.s      fs5, fs9, fs4
                  rem          t6, t2, s11
                  sub          s10, a0, s3
                  srl          a0, t1, gp
                  xor          t2, s7, t0
                  fle.s        t2, fs10, fa0
                  fmv.x.w      t2, fa0
                  fsgnjx.s     fa7, fs5, fs8
                  fmv.x.w      s3, fs8
                  or           s9, zero, t4
                  fsub.s       ft7, ft2, fs5, rmm
                  fsgnjn.s     ft7, ft0, fs3
                  xor          s9, s8, s3
                  slti         t4, t6, 191
                  and          s8, s0, a1
                  rem          t6, t3, a3
                  sra          a2, s7, s0
                  xori         a1, a1, -479
                  remu         a3, t5, a7
                  remu         s3, a7, s11
                  srai         a5, a0, 6
                  fle.s        a1, ft1, fa6
                  fdiv.s       ft10, fs7, fa7, rtz
                  mulh         tp, gp, t1
                  fadd.s       ft7, fs2, fs11
                  fsub.s       fs7, fa3, fs1
                  fmax.s       fs6, ft10, fs8
                  ori          a1, a4, -1232
                  auipc        t4, 707410
                  xori         t6, a3, -1217
                  fsgnjx.s     fa2, ft7, ft3
                  auipc        s8, 287584
                  slli         zero, s9, 17
                  fmin.s       fs2, fa7, fa6
                  fsqrt.s      ft5, fs0, rne
                  auipc        zero, 898252
                  auipc        t0, 226560
                  andi         s8, a1, -596
                  fadd.s       fs4, ft8, ft10, rdn
                  slti         s9, t3, -1034
                  mul          a1, s10, zero
                  fsqrt.s      fa7, ft4, rtz
                  mulhsu       tp, gp, a1
                  or           s2, s9, s3
                  add          tp, t3, t1
                  lui          zero, 752543
                  and          a0, t0, s3
                  slli         a0, t4, 16
                  flt.s        tp, ft6, ft0
                  fsqrt.s      ft3, fs0, rmm
                  slli         ra, zero, 4
                  fclass.s     a0, ft7
                  slti         s5, t0, 1820
                  mulhu        s1, a7, a6
                  fmul.s       fs5, fs11, ft0, rmm
                  fsqrt.s      fa5, fa1, rne
                  sltiu        s11, a2, 1135
                  fsqrt.s      ft3, ft9
                  fmax.s       fs7, ft1, ft8
                  fadd.s       fs10, fs3, ft3, rup
                  xori         a0, s2, 1403
                  divu         s9, a0, a1
                  fmin.s       ft4, ft8, ft0
                  sra          s3, t5, gp
                  flt.s        tp, fa5, fs3
                  sub          s5, s0, s5
                  sltiu        s3, t5, -1799
                  fcvt.s.wu    ft10, t2
                  remu         t3, t5, t3
                  fmax.s       fa0, ft8, fs9
                  xor          s4, t5, zero
                  sub          ra, s8, a6
                  fmv.w.x      fa5, t2
                  fsgnjx.s     fs9, fs10, ft5
                  mulhu        sp, s8, s5
                  slt          a1, t2, tp
                  add          s4, s6, t6
                  or           t3, s4, s5
                  slli         s8, t5, 6
                  auipc        a1, 428758
                  mulhsu       gp, a1, a0
                  fdiv.s       ft11, ft6, fa2, rmm
                  xori         t2, gp, -734
                  fmv.w.x      ft0, a0
                  and          s7, a0, t1
                  xori         t4, s6, -1727
                  sll          ra, t4, s2
                  fsqrt.s      ft1, fs7
                  fsgnjn.s     ft9, fs11, ft1
                  srli         a2, s10, 1
                  fmax.s       fa4, ft1, ft10
                  fsub.s       fs6, fs0, fs5
                  mulhsu       gp, gp, s8
                  div          t2, s5, a7
                  sltiu        a7, sp, -216
                  xor          zero, t6, a0
                  fdiv.s       fa2, fs8, ft11
                  sll          gp, a2, t4
                  fmin.s       fs1, ft4, fs3
                  sll          s1, gp, t0
                  slt          a0, t5, zero
                  mul          t6, s5, t3
                  fsqrt.s      fs2, fa6, rne
                  srl          s9, s8, t2
                  mul          t6, t4, a7
                  mulhsu       s5, t3, zero
                  fsub.s       fs11, ft9, ft9, rne
                  divu         s9, s9, s8
                  sub          t5, t1, a5
                  slli         tp, t1, 18
                  remu         tp, s2, s1
                  fsqrt.s      fs10, fa3
                  andi         a2, s1, 666
                  rem          s1, sp, zero
                  fmin.s       fs7, fs7, ft2
                  nop
                  fmul.s       fa6, ft11, fa2
                  fmin.s       ft3, fs2, fa4
                  srai         s8, t2, 22
                  div          a4, s2, a1
                  fcvt.w.s     s11, ft11, rup
                  rem          s1, s2, t6
                  fadd.s       ft9, ft1, fs1, rdn
                  div          s3, s2, a0
                  sltu         s9, a7, t6
                  sltiu        a0, s6, -1358
                  srli         ra, s5, 7
                  nop
                  fsub.s       fa2, fa7, fs4
                  fdiv.s       ft3, fs8, ft3
                  slli         s7, sp, 18
                  mulhsu       a2, a1, t1
                  slt          s11, t5, a2
                  slti         s2, t3, -493
                  sltiu        a7, zero, 1542
                  sll          a7, s4, s4
                  fmv.w.x      fs2, t3
                  fcvt.wu.s    s8, fs5, rne
                  slti         s8, a0, 949
                  divu         t6, a7, sp
                  fcvt.s.wu    ft9, t6
                  andi         a4, s1, -1056
                  sltu         t2, a5, s4
                  lui          a0, 378332
                  ori          a1, a6, 138
                  divu         gp, s1, s0
                  srli         a3, t1, 29
                  add          a4, a5, s5
                  rem          s5, tp, s1
                  slti         a7, t1, -1490
                  sltiu        s3, a1, 879
                  fsgnjx.s     ft4, ft0, ft6
                  sltiu        a2, a7, -372
                  fmax.s       ft2, fs9, fa4
                  fcvt.w.s     sp, ft1
                  feq.s        zero, fs7, fa4
                  fmv.x.w      s2, fa6
                  srli         t5, s5, 4
                  xor          s8, s9, s6
                  andi         a3, a5, 373
                  sltiu        zero, s9, 286
                  xor          zero, tp, ra
                  or           s1, s6, sp
                  xor          a7, t0, a0
                  lui          tp, 994758
                  or           a2, t3, t1
                  slti         a5, a2, 342
                  ori          t6, t6, -1651
                  fcvt.s.w     fa7, s2
                  feq.s        s4, ft9, ft4
                  add          gp, s0, a2
                  sltiu        s4, t2, -1145
                  slti         a7, zero, -1138
                  lui          t0, 836388
                  fmv.w.x      fs5, t3
                  andi         a0, a2, 804
                  fclass.s     t0, fa3
                  fsgnjx.s     ft0, fs10, fs11
                  slt          s1, t4, s5
                  ori          a5, a6, -1713
                  sub          a7, t2, t4
                  nop
                  mulhu        a3, s4, a1
                  ori          s4, s8, -1194
                  fcvt.s.w     ft8, t0, rtz
                  flt.s        s2, fa6, fa0
                  slli         s2, gp, 22
                  slti         tp, t2, 453
                  add          zero, a5, s11
                  or           t5, a3, t5
                  and          s4, t5, s0
                  fmin.s       fs8, ft7, fs7
                  slli         s11, s1, 14
                  flt.s        s4, fs9, ft4
                  feq.s        s4, fs0, fs3
                  fcvt.s.w     fs4, sp, rne
                  and          s5, t2, sp
                  remu         zero, a6, tp
                  xor          a2, a1, zero
                  fcvt.w.s     a2, fs10, rmm
                  and          a2, tp, sp
                  ori          s1, s5, -102
                  andi         s11, tp, -1859
                  fcvt.wu.s    tp, ft7, rne
                  nop
                  divu         t2, a1, t0
                  lui          t0, 401967
                  xor          t4, t3, a1
                  mul          gp, zero, gp
                  fdiv.s       fa2, ft5, ft11
                  flt.s        a3, ft5, ft10
                  andi         a2, a5, -1250
                  slli         s9, t5, 13
                  mulh         t6, a3, t4
                  fmul.s       fa2, ft2, fa0, rtz
                  xor          t0, s10, a0
                  mulhu        s1, a7, zero
                  div          s5, s0, t6
                  fsqrt.s      ft4, fs5
                  and          t2, t5, s6
                  divu         a0, s11, a6
                  srli         s10, s5, 15
                  mulhsu       s1, s5, s10
                  fsgnjn.s     fs4, fs10, fa2
                  feq.s        s9, ft6, fs0
                  sltiu        s2, t6, -533
                  nop
                  srli         gp, s0, 6
                  fmul.s       fs5, fa6, fa7
                  mulh         s11, a5, s2
                  add          tp, t1, a2
                  xori         s7, s10, -1145
                  srli         s5, a0, 7
                  sub          s1, s3, s4
                  fcvt.s.wu    fa7, a4, rtz
                  fclass.s     a5, ft7
                  fsgnj.s      fs10, fa5, fs5
                  add          t4, t5, s11
                  fdiv.s       ft1, fs8, fs8, rtz
                  feq.s        t6, ft9, fa0
                  fsgnj.s      fa7, fa5, fs2
                  fdiv.s       fs0, fa2, ft3, rup
                  fsqrt.s      fs9, fs4, rtz
                  flt.s        s3, fs10, fs0
                  ori          zero, s10, 411
                  slt          t2, t5, a0
                  slli         ra, s11, 31
                  fsgnjn.s     ft9, fs6, fs5
                  fmin.s       fa2, ft8, ft6
                  fmax.s       fs10, fs6, fs3
                  fsub.s       ft9, fa4, ft6
                  fadd.s       ft2, fa7, fa3
                  srl          t5, tp, sp
                  remu         t2, t6, t6
                  fmul.s       fa0, fs1, fa2
                  mulhsu       t0, s10, t6
                  lui          a7, 248882
                  flt.s        a1, fs9, fs3
                  andi         tp, s6, -376
                  fmax.s       fs2, fs7, ft4
                  flt.s        t5, fa4, ft3
                  fmv.x.w      s4, fa7
                  slli         s5, s4, 8
                  fmax.s       fa0, fs11, fs2
                  sub          t0, zero, t3
                  and          t0, t4, a3
                  mulh         zero, a6, s6
                  fmul.s       fa0, ft5, ft5
                  fmax.s       ft5, fs1, ft11
                  sll          t2, s9, a4
                  fmin.s       fs2, ft3, fs4
                  remu         a5, a7, t0
                  fcvt.w.s     s4, ft0, rne
                  addi         t6, a4, -478
                  fcvt.w.s     a1, fs4, rup
                  fadd.s       fs5, fa2, ft7, rtz
                  feq.s        gp, fs2, fs6
                  andi         a7, s7, 164
                  nop
                  fmv.x.w      s0, fs10
                  srl          zero, s10, s0
                  sub          s0, t6, t6
                  fsub.s       ft2, ft7, fs3
                  add          a7, t3, s4
                  fmin.s       fa6, fs0, fs8
                  div          a4, t2, zero
                  add          ra, s4, s9
                  fmv.x.w      sp, fa2
                  feq.s        t3, ft11, fa7
                  fmv.w.x      ft2, sp
                  feq.s        ra, fa5, fa0
                  sra          a3, a7, s2
                  fle.s        sp, fa5, fa3
                  feq.s        s1, fs1, fs8
                  fcvt.s.w     fs6, ra, rup
                  mulhsu       sp, s11, a1
                  slti         t0, tp, 384
                  auipc        sp, 989820
                  srai         t2, a0, 22
                  fsgnj.s      ft5, fs11, fs3
                  lui          t5, 938482
                  sltu         zero, s2, t3
                  fsub.s       fa0, fs4, fs8, rtz
                  srli         s2, a3, 18
                  fsgnjn.s     ft4, ft0, ft5
                  fdiv.s       ft2, ft5, fs2, rne
                  srli         s1, t6, 11
                  srl          t2, t3, s2
                  srli         s1, gp, 19
                  sra          a5, t4, a0
                  fadd.s       fs10, ft5, fs11
                  sltu         s5, t6, s11
                  srli         s4, a1, 20
                  fsub.s       ft2, fs11, ft1
                  fle.s        ra, fs10, ft9
                  div          a0, a2, s11
                  add          t4, s6, t5
                  slli         s9, s4, 12
                  lui          a7, 662391
                  fcvt.s.w     ft7, gp, rdn
                  fcvt.w.s     s3, ft11
                  sub          t2, s9, t4
                  fcvt.w.s     a4, fs9
                  auipc        a1, 424460
                  fsgnjn.s     fs5, fs4, fa3
                  sra          t6, sp, s2
                  fcvt.wu.s    t2, fs0
                  ori          s9, t0, -1001
                  addi         a3, s7, 1161
                  or           a2, s5, t5
                  fsgnjx.s     ft5, fa5, ft10
                  fle.s        t4, ft0, ft11
                  fmv.x.w      s8, fs3
                  mul          ra, ra, t5
                  fsgnj.s      ft3, ft3, fa1
                  slli         s5, zero, 30
                  lui          t0, 537359
                  fle.s        t2, fa2, fs9
                  xor          a0, zero, s8
                  andi         a2, t0, -1634
                  fclass.s     s1, fa2
                  rem          t0, a0, s1
                  srli         s0, s9, 19
                  fmv.w.x      ft3, s4
                  sll          a2, a7, tp
                  fcvt.s.w     fa2, s10, rtz
                  fcvt.s.w     fs1, t3
                  fmul.s       ft10, ft9, ft4, rtz
                  mulh         t2, a6, t5
                  fcvt.s.wu    fs2, a5
                  sll          t2, s10, t3
                  ori          tp, a0, -90
                  sra          a4, s6, ra
                  fmin.s       ft1, fa4, fs6
                  fclass.s     s11, fs0
                  srai         s0, ra, 11
                  fcvt.wu.s    a7, ft7
                  mulh         s5, s8, s5
                  or           s3, s2, t3
                  srai         s2, tp, 13
                  andi         a4, a7, 1549
                  sub          gp, s8, s5
                  fcvt.s.wu    fs5, a6, rdn
                  addi         tp, a0, -857
                  mulhu        t3, zero, a6
                  fmv.w.x      fa7, a0
                  fle.s        s1, fs10, fs4
                  auipc        t5, 619755
                  xor          s8, a5, a0
                  slli         s7, a5, 3
                  mulh         t4, s11, ra
                  xori         a7, s2, 1398
                  and          t4, t6, s0
                  srai         t6, a0, 22
                  addi         a1, a2, -1046
                  auipc        s9, 85500
                  srai         ra, s7, 4
                  mulh         a7, gp, s4
                  feq.s        t5, ft3, ft9
                  mulhu        t2, s10, t0
                  slt          ra, sp, a7
                  remu         a2, s7, s11
                  sltu         t2, zero, s10
                  fle.s        a0, ft5, fs10
                  fmv.x.w      s0, fa0
                  divu         a2, a6, zero
                  xori         a0, tp, 1882
                  fsqrt.s      fa2, fs5
                  fsgnj.s      ft8, ft8, fs4
                  fmin.s       fa0, fs2, fs3
                  fcvt.s.wu    fa0, a1, rup
                  fmax.s       ft11, fa1, fa6
                  xor          t0, zero, t4
                  srl          t2, gp, zero
                  and          s3, zero, t2
                  fcvt.s.w     fa3, s9, rtz
                  sltiu        s0, t3, -1489
                  sub          gp, a7, t2
                  remu         s11, a2, a7
                  mulhu        t4, s9, t5
                  div          s10, s1, s5
                  slli         a4, s2, 5
                  fsgnjx.s     ft8, ft1, fs7
                  sll          ra, zero, sp
                  fadd.s       fa3, fa2, ft9
                  fmv.w.x      ft11, ra
                  slli         ra, s10, 21
                  xori         ra, a7, 597
                  mulh         a0, a7, s6
                  fdiv.s       fa6, fa1, fa2
                  and          t5, a0, s1
                  mul          ra, tp, t3
                  fmv.x.w      t0, ft2
                  fsub.s       ft3, ft10, fs10, rmm
                  fsgnj.s      fs6, fs2, fs6
                  fmv.w.x      ft1, s8
                  xor          t6, s6, a1
                  mul          t2, s10, zero
                  srl          t4, t0, s11
                  mulh         s5, s0, s2
                  srai         t4, s5, 21
                  addi         a7, s10, 486
                  sltu         s0, t2, a7
                  fcvt.wu.s    s4, fs6
                  fsgnj.s      fs6, ft0, fs3
                  srli         zero, sp, 28
                  srl          s7, t5, s9
                  slti         sp, a1, 87
                  fsgnj.s      ft6, fs1, ft3
                  div          a1, s10, t5
                  slt          s8, t1, sp
                  fcvt.s.w     fs4, tp
                  fadd.s       ft6, fa4, fa5, rtz
                  fsgnjn.s     fa6, ft10, fs8
                  slli         s11, t2, 17
                  fsqrt.s      fs10, fa5, rtz
                  fsqrt.s      fs2, fa7
                  lui          s4, 75480
                  slt          tp, s4, s11
                  fadd.s       fs7, ft0, ft6, rtz
                  fle.s        a7, ft11, ft2
                  slli         a1, a3, 2
                  fsgnj.s      fa3, ft4, ft2
                  fcvt.w.s     t3, ft8, rmm
                  fle.s        ra, fs11, fs2
                  sltu         a1, gp, zero
                  flt.s        s3, fs0, ft5
                  divu         zero, a7, ra
                  xor          t2, s3, a6
                  slt          a4, s8, t4
                  slti         s11, s7, -716
                  fmin.s       fa7, ft11, fs5
                  srli         tp, t1, 22
                  fsgnjn.s     fs8, fs7, ft10
                  fadd.s       ft6, ft11, ft3, rdn
                  slli         t6, a1, 8
                  fmv.x.w      a7, fs9
                  srli         a3, s11, 12
                  sltu         t0, t0, tp
                  andi         t0, sp, -839
                  ori          s4, t2, 1847
                  divu         s9, t3, ra
                  sra          s1, s8, t2
                  andi         s7, a6, 1603
                  fadd.s       ft3, fa3, ft2
                  fmv.x.w      s0, ft0
                  fdiv.s       ft10, ft5, fa0, rup
                  xor          s11, a4, t6
                  sll          s7, s3, a1
                  or           t3, s6, a3
                  add          sp, a1, s9
                  addi         a7, t4, -439
                  fsgnjn.s     fa3, fs2, ft10
                  fcvt.wu.s    s1, fs6
                  mul          a3, s7, t5
                  nop
                  nop
                  fmv.x.w      a4, ft0
                  fmax.s       ft8, fs5, fs6
                  addi         s9, a0, -1150
                  sra          a0, s1, zero
                  addi         s10, s11, 102
                  fmul.s       ft5, ft9, fs7, rmm
                  fmv.w.x      fs2, s11
                  srl          s4, s8, tp
                  lui          s10, 41335
                  lui          t0, 985783
                  sub          t4, a4, zero
                  lui          a3, 846575
                  xor          zero, sp, a2
                  srl          s2, t3, sp
                  fcvt.w.s     a0, fs9, rdn
                  addi         t6, t5, 1052
                  fcvt.wu.s    s3, fs10
                  rem          zero, t4, s3
                  rem          zero, s7, a6
                  fsgnj.s      ft11, ft6, fs6
                  slti         tp, s4, -1968
                  fmv.w.x      ft8, t0
                  fsgnj.s      fs2, fa5, fs8
                  mulhsu       gp, a3, a5
                  and          gp, a6, sp
                  srli         a0, t4, 29
                  sub          a1, s6, s2
                  div          ra, t1, s11
                  srl          a3, s2, a6
                  fcvt.wu.s    gp, ft1
                  fmv.w.x      fs10, s8
                  fcvt.s.wu    ft10, s0
                  addi         s4, tp, -1552
                  fclass.s     a2, ft9
                  srl          s9, s5, a5
                  fadd.s       fs10, fa5, fa0, rne
                  fsub.s       fs10, ft11, ft1
                  fle.s        a5, ft3, ft4
                  fcvt.wu.s    s2, fa1, rtz
                  srli         a1, t3, 9
                  lui          a2, 379529
                  fsub.s       fa0, ft0, ft0, rtz
                  fadd.s       fs3, ft4, fa2
                  fclass.s     zero, ft3
                  feq.s        a5, ft7, ft0
                  sll          s4, sp, t4
                  sll          s1, gp, s5
                  sub          a3, a6, s6
                  fsqrt.s      fs4, fs8
                  fcvt.wu.s    zero, fs3, rup
                  fcvt.s.w     ft7, t4
                  sltiu        s1, sp, -925
                  fmul.s       ft5, fs11, ft4, rtz
                  fmax.s       fa3, fs8, ft6
                  fdiv.s       fs9, ft1, fs3, rne
                  sra          ra, tp, t1
                  fle.s        s1, fa5, fs5
                  srli         s11, t1, 19
                  remu         t4, t1, s2
                  srli         zero, a7, 24
                  fadd.s       fa1, fa4, fs10
                  fdiv.s       ft3, fa2, ft4, rup
                  sltu         s4, s10, gp
                  div          s9, sp, a7
                  fsgnjn.s     fs3, fs11, fa5
                  fcvt.wu.s    a0, fs3, rup
                  mulhu        t4, a6, s4
                  andi         a1, a6, 578
                  fsqrt.s      fs3, fs4, rtz
                  rem          s1, s2, t6
                  slli         t4, s10, 20
                  add          a3, a4, s0
                  slti         a4, t0, -926
                  fmax.s       ft3, fa4, fa7
                  sub          s11, a7, t2
                  mulhu        a2, tp, t2
                  and          t3, a1, s10
                  fmul.s       fs7, ft4, fa1, rmm
                  andi         s3, t4, -1393
                  fcvt.s.w     ft9, s11
                  xori         t3, a1, -1572
                  fmv.w.x      fs6, a3
                  feq.s        t3, fs7, ft9
                  lui          a1, 230138
                  add          a0, s3, a0
                  add          s9, t5, s11
                  fmv.w.x      fa3, s1
                  fcvt.w.s     s5, fa7
                  fcvt.w.s     zero, fs10, rne
                  fsqrt.s      fa2, fs1
                  sra          s9, a0, gp
                  fsgnjx.s     ft8, ft3, ft10
                  fadd.s       ft11, ft6, fs4, rup
                  fsgnjx.s     fa3, fa7, ft5
                  or           zero, s6, s2
                  fcvt.s.wu    fs5, s2
                  feq.s        ra, fa4, ft6
                  fadd.s       ft6, ft9, ft10, rup
                  andi         s4, a1, -209
                  fcvt.s.wu    ft6, t0
                  auipc        a0, 205207
                  fadd.s       fa0, ft0, fs3, rdn
                  sltiu        s3, s9, 241
                  xori         t4, ra, -1259
                  sll          zero, sp, s11
                  and          a4, gp, a4
                  and          t0, s4, zero
                  fsgnj.s      ft3, fa0, fs1
                  mulhsu       gp, a4, sp
                  sra          t4, t5, sp
                  andi         s4, s4, 61
                  xor          tp, s8, t3
                  srai         t2, s10, 4
                  or           s8, a0, s1
                  fmin.s       ft0, fa5, fs7
                  fsgnjn.s     fa4, fs6, fs11
                  fmul.s       fs1, fs7, fa2, rtz
                  fcvt.s.w     fa3, t0, rup
                  andi         ra, a6, 1546
                  slt          tp, a7, a3
                  slli         s3, t2, 13
                  xori         a5, s4, 203
                  fle.s        t2, ft10, fs9
                  fsub.s       fs3, ft8, fs2
                  mulh         a7, t3, a0
                  fmv.x.w      s1, ft0
                  auipc        s10, 1045119
                  fcvt.s.wu    ft6, t3
                  fmv.x.w      gp, fs2
                  sub          sp, a1, s4
                  sltu         t0, s5, sp
                  sltu         t2, a3, ra
                  mulhu        a4, a6, s9
                  fcvt.s.wu    fs9, a2
                  sll          s9, t4, s5
                  slt          a1, gp, t2
                  srli         s8, s1, 6
                  fmv.w.x      fs5, gp
                  remu         gp, s4, s4
                  add          s11, s4, s6
                  mulhu        t3, s2, sp
                  fsgnjx.s     fa2, fs1, ft9
                  fmv.w.x      ft10, s1
                  fsqrt.s      fs10, fs9
                  mul          s5, s1, s6
                  fcvt.s.w     ft8, t3
                  sra          s11, s11, a5
                  add          a3, s4, a0
                  fsgnjn.s     fs9, fa2, ft9
                  remu         s10, s3, s7
                  divu         a1, t1, s11
                  fdiv.s       fa2, fs3, ft2
                  or           ra, s1, t0
                  div          s8, s6, s0
                  sra          a0, s10, s8
                  fsqrt.s      fs11, fs10
                  fsqrt.s      fs1, fa6, rmm
                  fcvt.wu.s    s5, fs0, rtz
                  rem          s10, a6, s1
                  rem          s1, a5, a0
                  slt          sp, gp, s6
                  fle.s        s5, fs9, fs0
                  or           s2, s7, s6
                  fmv.x.w      s4, ft4
                  xori         s1, s8, 1756
                  fsqrt.s      fs8, ft4, rmm
                  xori         a2, s8, 67
                  divu         a5, s5, t3
                  nop
                  srli         t4, zero, 26
                  srai         s7, a2, 16
                  flt.s        t5, fa3, fs8
                  fcvt.s.w     fs7, s4
                  auipc        t2, 41217
                  fcvt.s.w     ft7, ra
                  mulhu        s8, a1, t1
                  mulhu        s2, t3, t1
                  add          s10, t2, s1
                  fdiv.s       fs6, fa7, fs3
                  fsub.s       fa1, ft6, ft2
                  mulh         gp, s3, a3
                  fcvt.s.wu    fs5, t0, rmm
                  slli         t5, a6, 10
                  fcvt.wu.s    a0, fa3
                  fclass.s     t3, ft8
                  fclass.s     s11, fs8
                  fsgnjx.s     fs7, ft9, ft6
                  sltiu        s9, t0, -845
                  srai         s7, s4, 4
                  lui          s9, 28995
                  flt.s        a5, fs5, fa6
                  fmv.x.w      s0, fs3
                  fdiv.s       fs11, fs7, ft8
                  fcvt.s.w     fs4, s2
                  fsqrt.s      fs11, fa6, rne
                  sra          t4, t3, s6
                  addi         a5, t4, -1811
                  sll          t5, s6, s11
                  fcvt.wu.s    s10, fs5, rdn
                  auipc        s2, 871694
                  lui          a3, 320200
                  andi         s8, s10, 120
                  xor          s1, s8, tp
                  mulhu        s5, ra, a5
                  fsgnjn.s     fa5, ft8, fa6
                  fsub.s       fa7, ft11, fa0
                  fmv.x.w      t4, fa1
                  fclass.s     a0, fs4
                  flt.s        gp, ft2, fa5
                  fdiv.s       fa6, ft8, fs10, rup
                  andi         t5, a2, -1574
                  flt.s        s2, ft5, ft2
                  and          a5, s3, a3
                  sll          t3, a3, s4
                  fclass.s     s10, fa7
                  mulhu        t5, s6, a4
                  srli         s1, gp, 25
                  fcvt.w.s     s3, ft10, rne
                  fsgnjx.s     fs3, fa6, fa7
                  mulh         a3, a0, ra
                  lui          sp, 493491
                  xor          sp, s0, gp
                  div          t4, s8, zero
                  fcvt.wu.s    s11, ft9
                  sltiu        s11, s8, -19
                  flt.s        a3, ft5, fa1
                  ori          s5, t6, -322
                  or           a5, s10, a6
                  fsgnj.s      fa0, fs10, ft11
                  fmul.s       ft2, fs2, ft5
                  slti         t5, s6, -1041
                  fmul.s       ft2, fa7, ft9, rmm
                  sltu         s8, t4, sp
                  andi         t6, t4, -1218
                  slli         s2, t3, 13
                  fdiv.s       fs1, fa2, fs9, rtz
                  fcvt.s.w     fs6, sp
                  feq.s        t5, fa4, fs11
                  lui          t2, 912471
                  or           s10, t6, t3
                  and          a0, a6, t3
                  divu         t5, t4, tp
                  fmv.w.x      fa2, s0
                  fcvt.w.s     tp, fs3
                  mul          a4, s3, t6
                  mul          s11, a4, a3
                  fmul.s       ft8, fs5, ft2
                  fmv.x.w      sp, fa1
                  srai         s9, s4, 16
                  rem          s9, zero, a2
                  slli         s11, s6, 11
                  or           t5, a4, t6
                  fclass.s     t0, fs4
                  srli         a7, sp, 29
                  slt          ra, a2, t6
                  sltu         a4, s9, s2
                  slti         s5, s4, -90
                  feq.s        s10, fs8, fs0
                  fsub.s       fs7, fs7, fa5, rup
                  fcvt.s.w     fs7, a1
                  srl          s8, s3, a7
                  fcvt.w.s     s11, ft5, rmm
                  and          a4, t0, s0
                  divu         a4, a6, t2
                  sltu         s8, t5, s7
                  ori          t3, s6, 290
                  andi         s4, sp, 1245
                  srli         s0, t2, 6
                  lui          a1, 671514
                  or           s5, s8, t5
                  andi         s9, t1, -556
                  fmin.s       ft1, ft1, fa5
                  or           t3, a5, sp
                  sltu         gp, s11, a0
                  fsgnj.s      fa6, ft2, fa2
                  fcvt.s.w     ft0, sp, rdn
                  mulh         s0, s10, t0
                  fdiv.s       ft7, fa1, ft9, rup
                  mulhu        s7, s8, gp
                  divu         zero, s10, a7
                  sltiu        a4, t3, -1503
                  fmv.w.x      ft6, t2
                  sltiu        a7, s2, 323
                  fmax.s       ft2, fs0, fs1
                  fmv.x.w      s4, ft1
                  lui          sp, 266154
                  xori         a5, s9, 1279
                  slt          s2, a2, s5
                  fmv.w.x      fs1, s8
                  fsgnj.s      fa6, ft6, fs1
                  mulhsu       t2, s5, s4
                  rem          s9, a1, a0
                  mulhsu       a1, a7, a2
                  sltiu        a3, s11, 589
                  nop
                  xor          t4, t6, s7
                  fmul.s       ft11, ft5, ft2, rmm
                  flt.s        a2, ft5, fa4
                  fmv.x.w      tp, ft6
                  mul          t0, s5, s4
                  slt          t2, s7, s2
                  sltiu        a0, a2, 220
                  fsub.s       ft3, fs1, fs4
                  fcvt.s.w     ft6, s8
                  srl          s7, gp, a0
                  sltu         s9, s9, s11
                  fmax.s       fa2, fa0, fs3
                  remu         a2, a2, a4
                  slt          t2, s2, a4
                  slli         a4, zero, 17
                  slt          zero, a1, a0
                  sltiu        a7, s11, -936
                  auipc        t0, 106159
                  and          gp, t3, s6
                  add          t6, s10, s10
                  fsgnj.s      fs2, fa1, fa3
                  xori         s7, ra, -871
                  mulhsu       a5, t0, t1
                  remu         a4, sp, s4
                  nop
                  flt.s        t5, fa5, ft6
                  ori          s5, s3, -463
                  fcvt.w.s     t6, ft9
                  fsub.s       fs4, fa3, fs10
                  mulh         s9, s9, s7
                  fsqrt.s      ft6, fs9
                  mulhu        s7, a2, ra
                  fdiv.s       ft0, fs10, ft5, rup
                  slt          s0, t3, t5
                  div          a2, a0, a3
                  fmin.s       fs1, ft4, fa5
                  mulhsu       a3, s5, t1
                  fsgnj.s      fa0, fs3, fs11
                  fsgnj.s      fa5, ft0, fa1
                  auipc        s10, 252807
                  fmin.s       fs9, fa7, ft4
                  fsgnj.s      fs6, fs2, fa0
                  fsgnj.s      ft0, fa4, fs5
                  fsgnjx.s     ft10, ft4, fs5
                  fclass.s     a0, fs11
                  fle.s        s3, fa0, ft4
                  srli         t4, sp, 7
                  divu         s5, s2, s10
                  mulh         s7, s10, gp
                  fsgnj.s      fs5, ft5, ft6
                  fmv.x.w      s8, fs11
                  flt.s        s10, ft2, ft0
                  fsgnjn.s     ft0, fa4, ft2
                  fsqrt.s      fs1, ft0, rtz
                  sltu         t5, s1, a4
                  slti         s4, s11, 1187
                  div          t6, tp, t2
                  slt          s1, t0, s1
                  flt.s        t3, ft8, fa5
                  ori          t3, t4, -338
                  and          tp, ra, s2
                  sltu         s3, s4, t3
                  fcvt.s.w     fa2, s4
                  slt          a2, t2, s0
                  slli         t6, s4, 23
                  fsgnjn.s     ft6, fa3, fs7
                  fsub.s       ft7, fs3, ft2
                  add          a0, s6, s8
                  sll          gp, s3, a4
                  lui          a3, 261321
                  add          s11, a3, t1
                  sll          s0, zero, s0
                  sltiu        gp, t5, -631
                  remu         s8, a6, ra
                  auipc        s10, 855100
                  srli         a7, a5, 15
                  fdiv.s       ft4, ft7, ft2, rtz
                  fmv.x.w      a2, fs0
                  fsgnjn.s     fa5, ft1, fa7
                  fsqrt.s      fs11, fs7
                  feq.s        a1, fs10, fa2
                  slli         t6, a0, 11
                  srl          s5, s10, a2
                  xor          t5, sp, a0
                  fadd.s       ft3, ft11, fs10, rup
                  slli         s8, zero, 23
                  slti         s5, s1, 996
                  mul          s10, t2, t1
                  srl          ra, t6, s11
                  fsub.s       ft6, ft4, ft10, rmm
                  addi         zero, s7, -1385
                  sub          sp, s9, t5
                  lui          sp, 824
                  and          s8, a3, s0
                  addi         s10, s4, -1889
                  fsgnjn.s     fs2, fa1, ft4
                  flt.s        a0, fs0, fa4
                  fsub.s       ft2, fs10, ft0, rup
                  mulh         s1, s1, a5
                  srai         s11, t2, 11
                  add          s10, s6, t4
                  or           tp, sp, s2
                  fclass.s     t0, fs4
                  mulh         s3, s6, a2
                  fsgnjx.s     fa2, ft3, fs5
                  fsgnjx.s     fa5, ft10, fs2
                  mulhsu       s11, tp, ra
                  fmul.s       ft5, fa4, fa6, rmm
                  remu         t4, t6, t3
                  fadd.s       fa5, ft5, ft1
                  fmin.s       fs9, ft5, ft11
                  nop
                  remu         sp, a1, ra
                  mul          t2, s0, s11
                  fcvt.wu.s    t2, ft5
                  fsub.s       fs4, fs9, ft1
                  fsgnjn.s     fs5, ft4, fs3
                  addi         zero, t1, -174
                  add          t2, s5, a0
                  auipc        tp, 102563
                  slli         a2, a6, 0
                  add          a7, s9, s11
                  lui          tp, 901231
                  flt.s        s1, ft3, fa0
                  slt          zero, s8, a4
                  andi         s2, sp, 1058
                  srai         s7, ra, 6
                  and          sp, s3, a7
                  mulh         a2, a0, a1
                  feq.s        t0, fa3, fa6
                  slli         a4, zero, 12
                  fclass.s     a5, fa1
                  fmul.s       ft4, fa5, fs10, rdn
                  fadd.s       fs11, fa6, fa7, rdn
                  sra          s3, a2, a6
                  slt          sp, a1, a6
                  fsub.s       ft8, fs6, ft2
                  feq.s        a4, fa7, fs5
                  sltiu        a4, t6, -375
                  mul          t2, s5, s10
                  sub          s9, s10, a5
                  slti         s2, t5, 408
                  or           s9, s4, s3
                  srl          t0, s5, s9
                  sub          t0, sp, t6
                  slt          s5, t3, t1
                  sltu         a3, s11, a1
                  div          ra, s0, zero
                  fmin.s       ft1, fa5, ft2
                  feq.s        t6, ft9, ft2
                  fmax.s       ft1, fs2, fs3
                  lui          s7, 272249
                  or           t0, s7, s4
                  fsgnjx.s     ft3, fa5, fs6
                  fmv.w.x      fa7, a6
                  add          a4, t2, s4
                  fsgnjn.s     ft10, fs2, fs9
                  fcvt.w.s     zero, fs0, rup
                  sltiu        s10, s7, 658
                  fsub.s       fs6, fs7, ft7, rmm
                  fclass.s     s9, ft11
                  div          a4, sp, sp
                  srli         s7, a7, 2
                  srli         gp, s10, 11
                  fle.s        s7, fs5, ft7
                  fcvt.s.w     fa5, s5
                  srl          t4, s5, t1
                  sltiu        a7, a5, -1741
                  feq.s        gp, fs5, fs3
                  fmin.s       fs0, fs11, ft1
                  lui          s1, 223271
                  fmul.s       ft11, fa6, fs2
                  srai         s3, tp, 26
                  fcvt.w.s     t2, ft0, rup
                  addi         zero, s4, 670
                  fcvt.w.s     s2, fs0, rup
                  slti         s5, t2, -1579
                  or           a4, t2, t4
                  fsqrt.s      fs5, ft1
                  add          s4, t6, tp
                  auipc        s0, 760261
                  fmin.s       fs3, ft3, ft8
                  remu         s8, s2, a0
                  fadd.s       fs9, fa7, ft9
                  mulhsu       zero, sp, t4
                  and          a3, s2, ra
                  fsgnjn.s     ft2, ft5, ft7
                  mulhsu       s7, s0, a1
                  fle.s        tp, fs4, fa7
                  auipc        s3, 989187
                  rem          a1, t5, sp
                  xori         t4, s4, 86
                  or           s5, a7, s11
                  srl          t3, t1, s6
                  fcvt.wu.s    a3, fs5, rup
                  andi         a1, sp, 1754
                  sra          s8, t1, t5
                  fadd.s       fs11, fs4, ft4
                  auipc        a0, 207599
                  fadd.s       fs7, ft0, ft3
                  ori          a0, a1, -1739
                  rem          s10, s5, s10
                  rem          s9, zero, ra
                  sltiu        s7, t5, 1549
                  mul          s10, t6, a4
                  fmax.s       fs8, fs3, fa6
                  mulhsu       s10, gp, s3
                  or           a5, a5, s4
                  fdiv.s       ft11, ft6, fs7, rmm
                  slt          s4, s10, a6
                  srl          t5, s4, a5
                  fmin.s       ft6, fs6, fs11
                  fle.s        t2, fa6, fs7
                  sltiu        zero, s5, -1613
                  fsub.s       ft9, fs10, fa2, rup
                  fdiv.s       fa2, ft5, ft7, rtz
                  div          sp, a7, s9
                  andi         s10, t5, 535
                  fcvt.s.w     fs10, gp, rmm
                  feq.s        a2, ft3, ft3
                  mulh         sp, s10, a6
                  slli         a5, tp, 6
                  fsqrt.s      fa2, fs11
                  flt.s        a7, fa0, ft7
                  add          zero, s1, a4
                  srai         a5, a1, 29
                  sltiu        zero, a2, -1230
                  fsub.s       fs0, ft7, ft7
                  fsqrt.s      fs9, ft1, rne
                  fsub.s       ft3, ft3, fa5, rtz
                  fcvt.s.wu    ft7, t0
                  srl          a1, zero, s3
                  fcvt.s.w     fs4, tp
                  slli         t0, a3, 0
                  and          s11, a3, t1
                  addi         s7, s1, -1635
                  sltu         a3, t6, a2
                  divu         ra, s5, t4
                  addi         s0, a6, -1967
                  andi         t3, a3, 1470
                  div          s2, a3, s1
                  fsgnjn.s     ft6, ft9, ft8
                  mulhu        s2, ra, t0
                  divu         s5, s7, s6
                  fle.s        zero, fs4, fs0
                  fmv.w.x      ft9, t4
                  fcvt.s.wu    ft10, s2
                  remu         a2, s7, sp
                  slt          ra, s8, s0
                  fmul.s       ft4, ft1, fa7, rdn
                  fcvt.wu.s    s5, ft6
                  add          gp, gp, a6
                  and          s0, s5, t2
                  srli         s8, a6, 2
                  or           a2, s6, s5
                  fmul.s       fs0, fs4, fs5
                  srl          a2, zero, a7
                  ori          s10, t1, 1300
                  srai         t0, s5, 13
                  fcvt.w.s     a7, fs2, rtz
                  slt          t6, zero, a6
                  fsub.s       ft0, ft7, fs3
                  sub          t4, s3, a6
                  feq.s        t0, fa7, ft3
                  fcvt.s.w     ft7, a4, rne
                  remu         s0, s6, s4
                  srl          s10, t0, a0
                  add          t2, s1, a6
                  feq.s        t4, fa5, fs1
                  fadd.s       ft8, fs4, fs11
                  fadd.s       fs8, fs3, fa0, rne
                  slli         a7, a2, 21
                  fsgnjn.s     ft8, fa5, fa6
                  fdiv.s       fa6, fs1, fs2
                  and          a4, t1, a0
                  mul          s1, a4, s1
                  slti         s2, ra, -749
                  nop
                  slli         s5, s6, 7
                  fadd.s       ft11, ft11, ft8
                  sll          gp, zero, t3
                  fmv.w.x      fa3, s6
                  sll          s1, a6, s3
                  slli         t3, s2, 15
                  add          t5, gp, a3
                  sll          t4, a4, s0
                  xor          t6, zero, a4
                  fcvt.w.s     zero, ft11
                  slti         s0, a0, 669
                  fcvt.s.wu    fs6, tp
                  fmv.w.x      fa7, a1
                  fcvt.w.s     t5, ft11
                  srai         ra, t5, 21
                  fmul.s       fs2, fa3, ft10, rup
                  srai         s8, t5, 15
                  sltiu        tp, s2, -1062
                  sub          t4, t0, sp
                  slli         t2, s3, 28
                  fmv.x.w      t4, fs4
                  fsgnjn.s     ft3, fa4, fa6
                  mul          a0, a0, s4
                  fle.s        s7, fs8, ft3
                  sub          zero, sp, t4
                  fcvt.wu.s    s4, fs6
                  fcvt.s.w     ft4, a4, rdn
                  mulhsu       s9, t5, s4
                  and          a3, s3, a5
                  divu         a5, a5, t0
                  fsgnjn.s     fs1, fs5, ft4
                  fmax.s       fs7, ft4, ft11
                  remu         a5, s4, s11
                  fmax.s       fs11, fa6, fs11
                  slli         s7, s5, 14
                  andi         a2, zero, -862
                  mulhsu       a7, t5, a6
                  and          a5, t6, gp
                  fle.s        ra, ft9, ft8
                  div          a3, s1, s6
                  fadd.s       ft11, fs4, ft5, rdn
                  remu         s11, a5, s3
                  or           a3, t3, gp
                  mulhu        a4, a7, s4
                  fmin.s       ft1, ft1, fs5
                  srl          s0, s8, a4
                  auipc        t5, 667358
                  srai         a2, s0, 25
                  add          a1, zero, s7
                  fdiv.s       fs3, ft5, fa5, rne
                  add          s2, s11, a4
                  sra          a3, s6, a3
                  fsgnjn.s     fs7, ft6, ft9
                  slti         s1, a1, -1342
                  sub          t5, s9, a7
                  fmin.s       ft2, fa6, ft3
                  divu         s7, a5, tp
                  rem          a2, gp, s7
                  fcvt.s.w     ft11, a5, rmm
                  fcvt.s.w     ft4, s11
                  feq.s        a1, fa0, fa6
                  andi         t2, sp, -1897
                  feq.s        t0, ft9, fa6
                  fsgnjn.s     ft4, ft11, fs6
                  and          a0, t2, s7
                  fsgnjn.s     ft4, fs0, ft9
                  slt          sp, s9, a2
                  fdiv.s       fs5, ft6, fs0
                  add          a7, tp, a6
                  sltu         t4, t1, s1
                  sltu         s9, s8, s3
                  fsgnjn.s     ft10, fs0, ft6
                  auipc        a4, 270900
                  rem          tp, s11, s0
                  and          s9, t2, s0
                  fmin.s       fs10, ft2, ft4
                  auipc        sp, 957598
                  sltiu        a7, ra, 1648
                  mulhsu       t2, sp, a6
                  mulhu        s0, a5, s4
                  mul          sp, a4, s6
                  mul          s9, a3, s9
                  fcvt.s.wu    fa6, s2, rmm
                  add          a4, s1, tp
                  andi         tp, a3, 314
                  fsgnjx.s     fa0, fs10, fs0
                  nop
                  srli         a0, s10, 6
                  srl          s3, gp, s0
                  slli         t4, s2, 6
                  fclass.s     a1, fs5
                  fclass.s     a4, ft11
                  fclass.s     s1, ft0
                  srli         t6, t4, 4
                  fcvt.w.s     t2, ft9
                  feq.s        s2, fa0, fs2
                  fcvt.s.wu    fa4, a3
                  fclass.s     tp, fa4
                  mulh         t5, s3, s9
                  fsub.s       fs4, fa4, ft3
                  fsgnjn.s     fs10, fs0, ft8
                  fsgnjx.s     fa3, fs4, fs6
                  sltiu        ra, t5, -1309
                  slti         s8, a3, 1148
                  remu         s7, s1, s6
                  fcvt.s.w     ft2, a6
                  fmin.s       fa0, fa7, fa3
                  xor          ra, s11, s6
                  fcvt.s.wu    ft0, a5
                  fsqrt.s      fa3, fs7
                  flt.s        s5, fa3, ft9
                  xor          s10, t4, s7
                  srl          s4, t5, s10
                  mulhu        sp, a1, t6
                  sra          tp, s3, s5
                  fsub.s       fs8, fa0, fs10, rdn
                  fcvt.w.s     s8, fa7, rdn
                  ori          s11, s7, -1758
                  fcvt.s.wu    fs0, a4, rdn
                  ori          a7, s9, -845
                  nop
                  fsgnj.s      fs1, fs3, fa0
                  fmul.s       fa2, fa2, fa3, rdn
                  fclass.s     s0, fs2
                  fmin.s       ft4, ft6, ft7
                  mul          s2, t4, a4
                  sub          s4, s9, t4
                  fle.s        s3, ft2, ft9
                  xori         a7, s6, -1613
                  fsub.s       fa2, fs2, fs6, rne
                  sltiu        a7, a1, 1198
                  fsub.s       fs0, fa7, fa3
                  fmax.s       ft4, ft1, fs5
                  mul          a0, a4, s2
                  addi         sp, zero, -243
                  mulhsu       gp, t1, gp
                  ori          t5, zero, 629
                  fcvt.wu.s    s11, fs7
                  nop
                  slti         a1, s6, -439
                  divu         a5, t2, sp
                  sltiu        s10, gp, -1890
                  sltu         t4, s7, t5
                  sltu         s9, s11, s5
                  sltu         a1, s2, tp
                  flt.s        s2, fs7, ft5
                  fcvt.wu.s    t6, fs6
                  srl          a1, sp, a1
                  fmin.s       fs9, ft11, ft11
                  fsqrt.s      ft11, fs4
                  sltu         s8, s3, t1
                  ori          sp, s5, -316
                  mulhsu       gp, sp, t6
                  fmv.x.w      t6, ft7
                  andi         sp, t4, -456
                  mul          s4, t0, a6
                  srli         s1, a5, 18
                  div          zero, t6, s10
                  mul          a0, t6, s9
                  flt.s        s7, ft2, fs3
                  xori         a1, s8, 833
                  fcvt.s.wu    fs6, t0
                  fcvt.s.wu    fa6, s7
                  flt.s        s9, fa5, fa3
                  lui          a3, 928413
                  lui          t0, 392815
                  sra          t4, s10, a6
                  lui          a1, 871062
                  fsgnjx.s     fa1, ft0, fa6
                  fmv.w.x      fs9, s2
                  slti         a7, a3, -927
                  fmv.w.x      fs6, a5
                  addi         s5, t6, -1244
                  mul          gp, a3, a0
                  fclass.s     s7, fa3
                  or           t5, s10, t2
                  sltiu        ra, t1, 308
                  mul          s11, a5, s7
                  fcvt.wu.s    t4, ft5, rne
                  mulhsu       t2, t0, tp
                  mulh         a5, a4, t5
                  fmax.s       fs7, fs7, fs6
                  div          s8, t5, s5
                  fdiv.s       ft10, fa1, ft6, rmm
                  fcvt.wu.s    s7, fa2
                  divu         t3, a5, a5
                  slli         t6, s1, 7
                  fadd.s       fa4, ft2, ft8
                  fle.s        s3, fs1, ft9
                  fmax.s       fs10, ft10, fs2
                  slt          gp, s5, s9
                  addi         a7, tp, 1464
                  mulhu        tp, t4, a0
                  divu         s0, sp, gp
                  ori          a2, s2, 1221
                  nop
                  srl          tp, a1, s6
                  fadd.s       ft4, ft10, fs2, rmm
                  fcvt.wu.s    t6, ft1
                  srl          a4, gp, a2
                  fmax.s       fa4, ft10, fs9
                  div          a7, t3, zero
                  divu         s9, s3, s0
                  fcvt.w.s     gp, ft1, rtz
                  sub          a1, sp, gp
                  divu         s3, s3, t6
                  srli         s5, t5, 4
                  xori         a3, s4, 53
                  sltiu        s8, t3, -987
                  mul          t2, zero, t2
                  fclass.s     s0, ft7
                  mul          a5, sp, a2
                  auipc        s1, 884890
                  add          s1, s5, a6
                  sltu         s5, ra, s4
                  fsub.s       fa3, ft9, ft4, rmm
                  slt          s8, zero, t5
                  fadd.s       fs4, fs1, fa0
                  fle.s        s5, fa3, fs7
                  srai         sp, ra, 14
                  rem          s1, zero, a4
                  fsqrt.s      ft10, fs1
                  mul          s9, s7, a6
                  mulh         sp, a6, a4
                  sra          a2, s4, a5
                  fclass.s     s10, ft11
                  auipc        a3, 1029970
                  fcvt.s.wu    fs3, a1, rup
                  fcvt.s.wu    fa7, t3, rmm
                  rem          a7, s11, s5
                  fsgnj.s      fs1, fa0, fa3
                  fclass.s     t4, fs2
                  mulhsu       t5, tp, s4
                  sltiu        s7, s5, -1876
                  lui          a5, 165780
                  srai         s5, zero, 6
                  fmv.w.x      ft7, gp
                  fmv.x.w      zero, ft9
                  flt.s        t6, fs9, fs2
                  fcvt.w.s     t6, ft0, rup
                  fmv.x.w      a5, ft7
                  rem          a5, s4, s5
                  and          a5, s9, t6
                  srl          a7, t6, a5
                  xori         ra, t2, -1623
                  sltu         gp, s11, s7
                  fcvt.wu.s    s0, ft3, rmm
                  xori         gp, gp, 156
                  srli         a0, a6, 20
                  andi         s9, a2, 1871
                  fdiv.s       fa1, fa3, fs0, rne
                  sltu         a5, s8, zero
                  mulh         t5, t2, s10
                  slli         a4, a3, 26
                  div          s1, s10, a3
                  fsgnj.s      fa4, fs3, ft5
                  fcvt.s.wu    fs6, a5
                  slli         s9, s10, 14
                  feq.s        sp, fa3, ft4
                  xor          s0, gp, s7
                  fclass.s     gp, fs8
                  fle.s        a1, ft9, fs4
                  or           s11, s11, s8
                  flt.s        s3, ft3, ft7
                  fmin.s       fa7, fa4, fa0
                  fsqrt.s      fs2, fa6, rdn
                  fadd.s       ft4, fs10, fs6, rne
                  ori          a4, s9, 298
                  fmul.s       fs10, fa4, ft6
                  ori          a0, s6, 1619
                  mul          t5, t3, s6
                  fsgnjx.s     fa1, ft4, fs11
                  fmul.s       ft5, ft2, ft10, rtz
                  sltiu        s4, a1, -60
                  sub          a0, s2, s0
                  srai         s3, a0, 12
                  divu         gp, s7, s5
                  mulhsu       ra, t5, a1
                  mulhu        s9, gp, a6
                  and          s8, t5, t3
                  sub          t6, t4, s5
                  fcvt.w.s     gp, fa2, rup
                  nop
                  andi         t2, s8, -1029
                  feq.s        s3, ft3, fs10
                  feq.s        s1, fs11, fs1
                  fclass.s     a4, fa5
                  slli         s3, s5, 25
                  feq.s        s5, fa0, ft4
                  flt.s        s2, fs1, fa2
                  fclass.s     t3, fs8
                  feq.s        a4, fa3, ft4
                  fmin.s       ft3, ft0, fa1
                  fmul.s       ft9, fa5, ft10
                  fsgnjx.s     ft6, fa3, ft4
                  fsgnj.s      ft0, fs4, fs11
                  or           gp, zero, t4
                  sra          a0, t1, s9
                  srai         t5, s2, 12
                  flt.s        tp, fs10, fs6
                  sub          s11, t6, t5
                  fcvt.w.s     a1, fs1, rmm
                  mulhu        a7, s2, s7
                  fle.s        a4, ft9, fs8
                  fmul.s       ft2, ft0, fs10, rdn
                  lui          tp, 567184
                  sub          t3, a1, a0
                  fcvt.w.s     s7, fs4
                  srai         a5, gp, 12
                  fdiv.s       fa4, fs5, fa1, rdn
                  slt          s3, s4, s7
                  or           tp, ra, s0
                  mulhsu       t2, a4, a6
                  add          a3, s10, a3
                  fdiv.s       ft3, fs10, fs1, rtz
                  divu         s1, a0, tp
                  fmax.s       fa6, fa0, fs6
                  fadd.s       fs3, fa5, ft10
                  rem          s3, s6, s4
                  rem          t2, t6, t2
                  or           s11, t2, a7
                  auipc        t0, 564218
                  sltiu        t6, s0, -658
                  srai         gp, a7, 19
                  or           a4, t1, t0
                  fmax.s       fs4, fa5, ft6
                  fmv.w.x      fs0, s0
                  add          a2, a6, a2
                  or           a1, t5, a3
                  fcvt.w.s     a7, fs9
                  fcvt.wu.s    a3, fs0, rtz
                  sltiu        a3, zero, -1331
                  feq.s        zero, fs4, fs9
                  xori         a1, t4, -647
                  addi         sp, a5, -201
                  fsgnj.s      fa1, ft5, ft5
                  remu         a1, t4, s1
                  add          s8, s5, t1
                  feq.s        a4, fs9, fs10
                  sltu         s2, s6, t3
                  srli         tp, a1, 6
                  sltu         s0, tp, tp
                  srli         sp, a5, 14
                  mul          a0, a5, a4
                  srl          t3, s9, s2
                  and          s9, ra, t1
                  fcvt.s.wu    ft0, s10, rne
                  fmul.s       ft6, fa2, fa0, rmm
                  mulh         s11, s7, a2
                  fadd.s       fs11, ft9, fs8
                  mulh         sp, a6, a2
                  xori         s0, t5, -464
                  fadd.s       ft6, fa2, fs3
                  flt.s        s5, ft7, fs7
                  divu         a4, s3, t5
                  rem          tp, a2, a7
                  feq.s        a2, ft0, fs8
                  fclass.s     t2, fs8
                  lui          a7, 379230
                  slli         t5, a2, 24
                  remu         tp, sp, s5
                  fsgnjn.s     fa4, fs1, ft9
                  fsub.s       fa7, fs2, ft7, rmm
                  srli         a5, t4, 1
                  auipc        a0, 771095
                  fclass.s     s2, fs0
                  fcvt.wu.s    s1, fs11
                  mulhu        t2, s8, s2
                  xor          s5, sp, gp
                  feq.s        s5, fa6, fs10
                  fclass.s     s9, fs3
                  slti         s3, s7, 136
                  sll          t6, t6, sp
                  mulhu        a4, a3, s7
                  fcvt.w.s     s3, fs3
                  srl          s2, t6, t1
                  remu         tp, ra, s2
                  fle.s        a1, fs5, fa4
                  sra          s7, s2, s10
                  xori         s11, s3, -945
                  div          sp, a6, s0
                  sub          a7, t2, s6
                  rem          gp, t4, s1
                  fmv.w.x      fs10, t4
                  fsqrt.s      fa1, fa2, rtz
                  sltiu        s3, t2, 1165
                  fmul.s       fa5, fs1, fs5
                  slli         ra, a7, 29
                  fsgnj.s      ft11, ft9, ft0
                  sltu         a0, gp, s5
                  mul          s4, s7, zero
                  add          a1, t4, a3
                  sll          t2, s5, s9
                  fcvt.s.w     fs6, sp
                  slt          a4, t4, ra
                  fmv.x.w      tp, fs7
                  fmax.s       ft1, ft1, ft11
                  feq.s        tp, fa7, ft2
                  xori         a3, t0, -783
                  fsub.s       ft9, fa4, fa2, rdn
                  fdiv.s       fa5, fa0, fa5, rne
                  fmul.s       fa6, fs0, fa3
                  fmv.x.w      s9, ft11
                  divu         gp, t1, t5
                  fmv.w.x      ft4, ra
                  fcvt.s.wu    fs2, s9, rne
                  xori         tp, sp, 522
                  fcvt.s.wu    fa4, a6, rmm
                  fcvt.s.w     fs3, t2, rdn
                  mulh         a4, s8, t4
                  and          sp, s10, t1
                  feq.s        s3, fs0, ft8
                  fmul.s       fs10, fs4, fa4, rdn
                  srli         s4, a3, 18
                  fadd.s       fs1, fs9, ft1, rne
                  fsgnj.s      fs5, ft9, fs2
                  fsgnjx.s     ft0, fa5, fa6
                  fdiv.s       ft0, fa7, fs1
                  flt.s        t2, fa3, ft5
                  fdiv.s       fs8, ft9, fs7
                  fsub.s       ft5, fa5, ft5
                  srl          s2, sp, tp
                  mulhu        s10, s11, s2
                  slti         a5, s1, 303
                  srai         zero, a0, 23
                  div          s9, a5, s0
                  fmul.s       fs2, fs4, fs3
                  fadd.s       ft9, fa6, ft4, rne
                  ori          t0, s8, -1094
                  sll          t4, t1, s6
                  andi         a7, a2, 318
                  fdiv.s       fa4, fa1, fs0, rdn
                  sra          t0, s3, a5
                  fadd.s       ft1, ft4, ft8
                  fmin.s       fs8, fs3, fa2
                  xori         a1, s8, 38
                  fcvt.s.w     fs0, a2, rup
                  remu         s11, a2, t6
                  fsgnjn.s     ft2, fa1, fa7
                  lui          a7, 785247
                  fsqrt.s      fs10, ft5
                  feq.s        t2, ft9, ft8
                  mulhsu       t3, ra, a0
                  sll          a0, a7, a2
                  sltu         s7, sp, s9
                  fsub.s       ft8, fs2, fs3
                  fmv.w.x      fs8, s9
                  lui          a0, 138555
                  sra          ra, s7, a7
                  rem          zero, a5, t4
                  slti         a0, ra, 416
                  auipc        s9, 884834
                  mul          tp, a2, t4
                  fmin.s       ft7, ft9, fa1
                  sll          s11, gp, t6
                  srl          tp, t0, a4
                  ori          tp, s1, -1218
                  flt.s        sp, ft9, fs6
                  fcvt.s.wu    ft11, a3
                  fsqrt.s      fs3, fa4
                  feq.s        t0, fa1, ft4
                  fcvt.s.w     fs8, gp
                  sltiu        t2, t1, 1060
                  sra          a1, a4, s2
                  div          t3, gp, a3
                  div          a4, a4, t5
                  mulhsu       gp, t5, a3
                  xor          a3, ra, t6
                  fsub.s       ft9, fs7, fs6, rdn
                  la x16, test_done
                  jalr x0, x16, 0
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
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_2:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_3:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_4:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_5:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_6:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_7:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_8:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_9:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_10:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_11:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_12:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_13:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_14:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

mmode_intr_vector_15:
                  addi x6, x6, -4
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  j mmode_intr_handler
                  1: la x16, test_done
                  jalr x0, x16, 0

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
                  sw  x22, (x6)
                  add x22, x6, zero
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
                  add x6, x22, zero
                  csrr x11, 0x341 # MEPC
                  csrr x11, 0x342 # MCAUSE
                  li x14, 0x3 # BREAKPOINT
                  beq x11, x14, ebreak_handler
                  li x14, 0x8 # ECALL_UMODE
                  beq x11, x14, ecall_handler
                  li x14, 0x9 # ECALL_SMODE
                  beq x11, x14, ecall_handler
                  li x14, 0xb # ECALL_MMODE
                  beq x11, x14, ecall_handler
                  li x14, 0x1
                  beq x11, x14, instr_fault_handler
                  li x14, 0x5
                  beq x11, x14, load_fault_handler
                  li x14, 0x7
                  beq x11, x14, store_fault_handler
                  li x14, 0xc
                  beq x11, x14, pt_fault_handler
                  li x14, 0xd
                  beq x11, x14, pt_fault_handler
                  li x14, 0xf
                  beq x11, x14, pt_fault_handler
                  li x14, 0x2 # ILLEGAL_INSTRUCTION
                  beq x11, x14, illegal_instr_handler
                  csrr x14, 0x343 # MTVAL
                  1: la x16, test_done
                  jalr x1, x16, 0

ecall_handler:    
                  la x11, _start
                  sw x0, 0(x11)
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  la x16, write_tohost
                  jalr x0, x16, 0

instr_fault_handler:
                  add x22, x6, zero
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
                  add x6, x22, zero
                  lw  x22, (x6)
                  addi x6, x6, 4
                  mret

load_fault_handler:
                  add x22, x6, zero
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
                  add x6, x22, zero
                  lw  x22, (x6)
                  addi x6, x6, 4
                  mret

store_fault_handler:
                  add x22, x6, zero
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
                  add x6, x22, zero
                  lw  x22, (x6)
                  addi x6, x6, 4
                  mret

ebreak_handler:   
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  add x22, x6, zero
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
                  add x6, x22, zero
                  lw  x22, (x6)
                  addi x6, x6, 4
                  mret

illegal_instr_handler:
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  add x22, x6, zero
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
                  add x6, x22, zero
                  lw  x22, (x6)
                  addi x6, x6, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x11, 0x300 # MSTATUS;
                  csrr  x11, 0x304 # MIE;
                  csrr  x11, 0x344 # MIP;
                  csrrc x11, 0x344, x11 # MIP;
                  add x22, x6, zero
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
                  add x6, x22, zero
                  lw  x22, (x6)
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
