.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x9, h0_start
jalr x0, x9, 0
h0_start:
                  li x30, 0x40001120
                  csrw 0x301, x30
kernel_sp:        
                  la x19, kernel_stack_end

trap_vec_init:    
                  la x30, mtvec_handler
                  ori x30, x30, 1
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
                  li x30, 0
                  fmv.w.x f0, x30
                  li x30, 2147483648
                  fmv.w.x f1, x30
                  li x30, 0
                  fmv.w.x f2, x30
                  li x30, 2139095039
                  fmv.w.x f3, x30
                  li x30, 2139095040
                  fmv.w.x f4, x30
                  li x30, 2139095039
                  fmv.w.x f5, x30
                  li x30, 2139095041
                  fmv.w.x f6, x30
                  li x30, 3338426969
                  fmv.w.x f7, x30
                  li x30, 2152642290
                  fmv.w.x f8, x30
                  li x30, 2139095039
                  fmv.w.x f9, x30
                  li x30, 2139095041
                  fmv.w.x f10, x30
                  li x30, 2139095041
                  fmv.w.x f11, x30
                  li x30, 2139095041
                  fmv.w.x f12, x30
                  li x30, 2139095040
                  fmv.w.x f13, x30
                  li x30, 2139095041
                  fmv.w.x f14, x30
                  li x30, 4286578687
                  fmv.w.x f15, x30
                  li x30, 4286578688
                  fmv.w.x f16, x30
                  li x30, 1785867
                  fmv.w.x f17, x30
                  li x30, 4286578687
                  fmv.w.x f18, x30
                  li x30, 4286578687
                  fmv.w.x f19, x30
                  li x30, 4286578687
                  fmv.w.x f20, x30
                  li x30, 3132707316
                  fmv.w.x f21, x30
                  li x30, 2139095040
                  fmv.w.x f22, x30
                  li x30, 2139095039
                  fmv.w.x f23, x30
                  li x30, 5864805
                  fmv.w.x f24, x30
                  li x30, 1623355341
                  fmv.w.x f25, x30
                  li x30, 2151519578
                  fmv.w.x f26, x30
                  li x30, 2139095039
                  fmv.w.x f27, x30
                  li x30, 2143289344
                  fmv.w.x f28, x30
                  li x30, 1866541
                  fmv.w.x f29, x30
                  li x30, 6730921
                  fmv.w.x f30, x30
                  li x30, 0
                  fmv.w.x f31, x30
                  fsrmi 2
                  li x0, 0x2
                  li x1, 0xf
                  li x3, 0x8fe1388e
                  li x4, 0x0
                  li x5, 0x80000000
                  li x6, 0xa
                  li x7, 0x0
                  li x8, 0xf3b38b3e
                  li x9, 0xb
                  li x10, 0x80000000
                  li x11, 0x80000000
                  li x12, 0xec7a2b55
                  li x13, 0xf
                  li x14, 0x4c4e4b89
                  li x15, 0x665868d4
                  li x16, 0x0
                  li x17, 0x0
                  li x18, 0x0
                  li x20, 0x76f63915
                  li x21, 0x80000000
                  li x22, 0xf4ca7579
                  li x23, 0xffedbcbd
                  li x24, 0x0
                  li x25, 0x80000000
                  li x26, 0x0
                  li x27, 0x0
                  li x28, 0x0
                  li x29, 0x50a98452
                  li x30, 0x6
                  li x31, 0x80000000
                  la x2, user_stack_end
main:             nop
                  addi         s5, ra, 318
                  mulhu        t4, t3, s4
                  add          t4, a0, a3
                  fdiv.s       fs8, fs11, fs1
                  sub          s0, gp, sp
                  fsgnjx.s     fs11, fs10, fs8
                  div          t1, s3, gp
                  slli         a6, s10, 23
                  mul          s10, t5, t0
                  srl          t2, s5, s10
                  mulh         a7, s4, t5
                  addi         s0, t2, -977
                  fmv.w.x      fs5, a5
                  nop
                  fmax.s       ft0, fs4, ft9
                  fmv.x.w      a1, fs6
                  fsgnj.s      ft7, ft2, fs2
                  fmax.s       ft7, ft5, fs0
                  srl          a0, a5, ra
                  sll          zero, gp, a3
                  fcvt.w.s     s8, ft4
                  mul          s8, s2, s11
                  fsgnjn.s     fs2, ft0, fa1
                  fclass.s     s9, fs3
                  divu         s0, t3, a0
                  sltu         a6, s8, t6
                  xor          ra, a1, zero
                  fdiv.s       ft2, fa7, fs10, rup
                  lui          t2, 216441
                  fcvt.s.w     fs0, s2, rtz
                  nop
                  fclass.s     s5, fa4
                  sub          gp, s6, a1
                  fsgnjn.s     ft7, fs2, ft11
                  xori         a0, s4, -525
                  sll          a6, t3, s4
                  divu         gp, s1, a1
                  mulh         s11, gp, s10
                  or           t5, a7, a3
                  fmv.x.w      s8, ft10
                  sltu         s10, a7, s11
                  xori         t1, a3, 1469
                  auipc        s0, 632388
                  mul          s10, tp, s2
                  fsgnj.s      fs2, fs6, fs5
                  sra          s11, s9, t3
                  fmul.s       ft5, fa6, fa5, rdn
                  fmv.x.w      a6, fa3
                  fdiv.s       fs7, fa7, fa3
                  divu         s6, a3, zero
                  fdiv.s       fa4, ft5, fs6
                  fmul.s       fs5, fa5, ft8
                  div          s2, a4, s5
                  fmin.s       fs1, ft0, fs7
                  mulhu        s4, a5, t3
                  fmax.s       fs3, fa0, ft1
                  slti         s11, a7, 1188
                  slli         a4, s5, 16
                  mulh         tp, gp, s5
                  fsub.s       fs4, ft4, fa6
                  sub          a3, s11, gp
                  fsub.s       ft6, ft0, fs7
                  auipc        a0, 515303
                  ori          s4, a3, 137
                  or           s7, a2, s6
                  fmax.s       fa5, fs10, fa0
                  fle.s        t1, fa1, fs6
                  fdiv.s       fs1, fa4, fa5
                  srl          a7, a0, s2
                  andi         s8, a3, -537
                  remu         s2, a7, a7
                  remu         t2, ra, s3
                  remu         gp, s0, s3
                  mulh         tp, s4, t1
                  sltiu        s4, t6, -941
                  sub          a4, s1, s6
                  flt.s        ra, fs0, ft5
                  nop
                  divu         s6, a4, a1
                  remu         s4, zero, a3
                  srai         a6, s6, 9
                  fclass.s     s10, ft4
                  fmin.s       fs8, ft2, ft1
                  fmin.s       ft9, fs3, fa1
                  mulh         a7, ra, s9
                  fcvt.wu.s    a0, fs8
                  fmin.s       fs5, ft5, fs0
                  xori         s2, sp, -616
                  nop
                  fsgnj.s      fs10, fs0, fa4
                  andi         t3, a2, 1396
                  remu         a6, s6, s1
                  fsgnjx.s     fa4, fa2, fs10
                  fadd.s       ft10, fa0, fs6
                  sltiu        s8, a0, -1907
                  addi         a3, t5, -371
                  div          s10, t3, s4
                  slti         t0, s0, -2007
                  xor          zero, s3, s4
                  mulhsu       s4, a5, s3
                  fclass.s     a0, fa1
                  sra          a6, s10, s8
                  fadd.s       fa1, fs4, ft4
                  ori          ra, s7, 1092
                  fle.s        t5, ft6, fs2
                  flt.s        s9, fs4, fs9
                  fdiv.s       fs4, ft4, ft7, rne
                  fcvt.s.w     fs4, a4
                  lui          gp, 56581
                  xor          s8, a1, a1
                  slti         t6, t3, 1126
                  andi         s10, tp, 853
                  fadd.s       fa4, ft3, ft9
                  sltiu        s0, a5, -1999
                  add          s7, t6, a7
                  srl          s2, a7, t4
                  or           s11, a2, a6
                  ori          t6, s5, 1058
                  nop
                  slli         a7, s5, 2
                  fcvt.s.wu    fs11, t5, rne
                  auipc        s4, 185848
                  sltiu        s6, a7, 199
                  addi         s11, s4, 1858
                  andi         t4, s7, -465
                  andi         t2, t3, -237
                  xori         s7, t3, 109
                  addi         s5, a3, -347
                  fclass.s     s5, fa3
                  or           s11, sp, zero
                  sub          s5, s7, s4
                  fsqrt.s      ft4, fa7, rdn
                  sub          s2, t6, t5
                  srl          a2, s2, s1
                  andi         s0, t2, -211
                  xori         t4, a4, 115
                  auipc        gp, 5999
                  fsub.s       fs9, ft4, fa0
                  ori          s0, t3, -986
                  fcvt.s.w     ft10, a6, rtz
                  fsgnj.s      fs7, ft9, fa6
                  fsub.s       fa6, fs4, ft0, rtz
                  slli         zero, a1, 10
                  mul          a5, a1, tp
                  feq.s        a1, fs1, fa3
                  feq.s        s4, fa1, fa2
                  slt          t4, s6, a2
                  fcvt.s.w     fa4, a5, rmm
                  srli         t6, s8, 19
                  auipc        s5, 105180
                  fsqrt.s      fs1, ft3
                  srl          s8, a7, s7
                  srai         s10, a1, 19
                  sra          a5, ra, s5
                  addi         s10, s7, 1647
                  slti         t3, a3, 1831
                  fmv.x.w      t3, fa7
                  fsqrt.s      ft10, ft8
                  addi         ra, sp, -1683
                  add          s6, a5, a7
                  sra          s2, ra, s2
                  fcvt.s.w     ft9, sp
                  mulhsu       s8, s0, a1
                  addi         ra, s5, -1674
                  fmin.s       fa2, ft1, fs7
                  remu         tp, t5, zero
                  slti         s9, ra, 1778
                  slli         s0, s4, 21
                  sll          s10, zero, s1
                  lui          s8, 289774
                  and          t6, s6, s3
                  fmax.s       fs3, fs9, fs8
                  sra          s4, s11, s8
                  fmax.s       fs7, ft3, fs6
                  lui          s7, 914996
                  fmul.s       fs11, fs8, fa2
                  sll          s4, a3, s10
                  srl          s7, gp, s9
                  fcvt.w.s     t3, fs3, rmm
                  addi         a4, t6, 1630
                  sll          a1, tp, s11
                  fmv.w.x      ft10, a0
                  divu         s9, t5, a3
                  nop
                  divu         a5, t0, a6
                  fcvt.wu.s    t0, ft9
                  sltiu        t0, a0, 253
                  slli         a5, sp, 13
                  fmv.x.w      gp, ft7
                  srl          t3, t4, a4
                  fmul.s       fa0, fs9, fa5
                  fsub.s       fs4, ft4, fs1
                  slt          zero, s0, a1
                  andi         gp, t3, 1880
                  mulhsu       a5, t1, sp
                  xor          s6, s1, t5
                  add          s7, t4, ra
                  slti         t6, a5, 1764
                  addi         s8, t3, 1863
                  fmin.s       ft5, ft9, ft1
                  fmax.s       fs2, fs0, fs8
                  and          a6, t6, s0
                  ori          s4, s9, 1210
                  srl          a4, a4, zero
                  fsgnjx.s     fs0, fa2, ft0
                  fsub.s       fs0, fa1, ft3, rmm
                  srli         s10, s3, 20
                  srli         s9, s5, 17
                  fmax.s       fa2, fs3, fs7
                  fadd.s       fa3, fs5, fs8
                  fle.s        s5, ft5, fa5
                  slt          t5, t4, t1
                  mulhsu       s6, a2, t1
                  sra          t6, a2, ra
                  remu         tp, t0, a2
                  srl          s5, t5, t6
                  fsgnjn.s     fa0, ft9, fs3
                  slli         a4, a1, 28
                  flt.s        zero, ft10, fs8
                  rem          s0, t3, s11
                  fmul.s       fs1, fs5, ft6, rdn
                  fclass.s     t6, fs11
                  srli         s8, s9, 4
                  srli         a2, t5, 3
                  div          tp, a7, s3
                  mulhsu       a5, tp, t5
                  xori         a7, t3, -1023
                  fsgnjx.s     fs8, ft3, fs4
                  addi         a1, s4, -90
                  fmul.s       fs2, fs11, fs2, rup
                  add          t6, s1, a2
                  fmin.s       fs5, fs5, fa0
                  xor          s2, s2, a2
                  sltu         s10, gp, a3
                  mul          ra, s2, a7
                  divu         a4, s9, s2
                  mul          s8, a4, s2
                  mulh         t5, s11, ra
                  fcvt.wu.s    s2, fs0
                  auipc        s10, 951028
                  div          s9, s9, s1
                  sra          gp, s9, s6
                  fmv.w.x      ft2, t3
                  fcvt.w.s     gp, fs9
                  fmax.s       fs5, ft5, ft0
                  fsqrt.s      fs1, fa4
                  xori         t4, s0, -2014
                  nop
                  mulh         tp, t4, s3
                  remu         s5, s1, a0
                  sltu         s5, s11, gp
                  slli         gp, ra, 21
                  fle.s        s0, ft2, fs2
                  and          s2, a6, a3
                  fmax.s       ft0, fs8, fa5
                  slli         t2, a4, 26
                  fcvt.wu.s    t2, fs5, rmm
                  remu         t3, zero, s4
                  nop
                  srl          a1, s8, s8
                  and          a7, sp, a4
                  xor          tp, t5, s11
                  remu         s8, s10, ra
                  slti         s4, s10, 1640
                  or           s7, t4, sp
                  sltu         t4, s3, a0
                  mulh         a7, a2, s2
                  or           s11, s2, a6
                  fsgnj.s      fa2, fa6, fs6
                  fcvt.wu.s    tp, fa1, rne
                  fmv.x.w      a0, fa7
                  fsgnjn.s     fs5, fs11, fs1
                  andi         gp, sp, -1251
                  xori         t6, s8, 383
                  remu         s5, s4, ra
                  xori         gp, s4, -928
                  fsqrt.s      fa0, fs9, rdn
                  fadd.s       ft7, fa7, fs5
                  fclass.s     s7, fa5
                  or           a5, t4, s4
                  mulhu        s7, a4, t4
                  div          t1, a5, s10
                  fcvt.w.s     t6, ft10, rmm
                  sltu         t1, a6, t3
                  fcvt.w.s     t3, ft9
                  nop
                  fsqrt.s      ft6, fs0
                  feq.s        s9, fs11, fa7
                  srl          s6, t5, s2
                  lui          t2, 332884
                  fsqrt.s      fs11, fa5, rdn
                  or           a3, tp, a5
                  fmv.x.w      a6, ft5
                  fsub.s       ft7, ft10, fs9
                  mulh         t4, t0, a6
                  xori         a4, t2, 498
                  fmul.s       fs4, fs5, fs8, rtz
                  srli         s4, a1, 30
                  div          a5, s6, t6
                  or           s11, a2, s1
                  xori         s5, s2, 1635
                  ori          a5, a2, 1872
                  fsgnj.s      fs0, ft2, ft3
                  xori         a4, t3, -627
                  div          a1, t5, a0
                  slti         t5, a7, -1938
                  divu         t2, ra, t6
                  mulh         s9, a6, sp
                  fcvt.w.s     a2, ft11, rup
                  fsub.s       ft4, ft11, ft3
                  fadd.s       fa0, fs0, fs2, rup
                  sltiu        a7, tp, -1042
                  fsgnjx.s     ft8, fs5, fa4
                  fsgnj.s      ft7, fa5, ft10
                  fsgnj.s      ft10, ft7, fa6
                  fmul.s       ft9, fa2, fs0
                  flt.s        a4, ft8, fs6
                  fcvt.s.wu    fs1, s7, rdn
                  divu         a6, a2, a5
                  slli         s7, s3, 9
                  mulhu        s6, s7, s11
                  slli         gp, s3, 0
                  and          t1, tp, s3
                  remu         t5, s3, t1
                  fmv.x.w      gp, fa2
                  nop
                  mulhsu       a6, t2, t0
                  ori          t3, a0, -278
                  fmin.s       fs0, fs10, fs0
                  add          s5, t4, t1
                  sltiu        a3, s1, -205
                  fsgnjx.s     ft10, fa4, ft6
                  fmul.s       ft1, fs9, ft3
                  fcvt.s.w     ft10, tp
                  fcvt.wu.s    t5, fa4
                  lui          a6, 559985
                  fle.s        t5, ft4, fs8
                  mul          a5, t1, s3
                  lui          s7, 341961
                  xori         s4, s8, 896
                  fclass.s     t3, fs6
                  xori         s0, s11, 1331
                  fcvt.s.w     ft3, gp
                  mulhsu       s7, a1, s9
                  fmv.x.w      t5, fa0
                  fadd.s       ft6, ft4, ft6, rmm
                  fmv.w.x      fs0, a3
                  fsgnjn.s     ft4, fs6, fa5
                  mulh         t3, t4, t1
                  lui          s9, 705734
                  fcvt.s.w     ft11, sp, rne
                  mulhsu       s2, s5, t3
                  xori         s11, s10, -940
                  mulhsu       t3, s8, s6
                  fclass.s     s6, ft10
                  xori         zero, s9, -171
                  slli         s10, s11, 13
                  divu         s4, ra, t2
                  feq.s        a5, fs11, fs7
                  nop
                  andi         zero, sp, -1695
                  sub          t6, t6, s10
                  fmax.s       ft7, fs2, ft5
                  ori          t4, s9, 2037
                  add          s4, t4, s0
                  mulhu        a7, s3, a1
                  sll          s0, a5, s6
                  addi         s2, a7, 1301
                  mulhu        s10, s6, ra
                  fmv.w.x      fs1, s10
                  feq.s        a7, ft0, fs2
                  div          s8, zero, t6
                  sltiu        tp, t2, -336
                  mulhu        a7, t4, t3
                  fdiv.s       fa0, fs11, ft3, rmm
                  sltiu        s0, t0, 1450
                  fcvt.wu.s    a4, ft10
                  fmv.w.x      ft9, t0
                  ori          s7, t0, -1761
                  mulh         s0, s5, a7
                  fmv.x.w      zero, fs0
                  and          a6, a6, t6
                  slli         s11, tp, 30
                  fmv.w.x      fs5, s0
                  sll          gp, s8, a4
                  flt.s        zero, fs2, ft7
                  fmv.x.w      a0, fs2
                  fadd.s       fs0, ft5, ft2, rup
                  fcvt.s.w     fs5, ra, rtz
                  fsub.s       fs9, ft9, ft6
                  auipc        a5, 975441
                  fcvt.wu.s    s5, fs3
                  sll          a2, a2, s1
                  or           s2, s0, s5
                  xor          t2, s5, s3
                  slti         a2, tp, -1071
                  fmax.s       fs9, fs2, ft9
                  slti         a2, t3, -519
                  remu         t2, s0, s7
                  rem          gp, s3, s9
                  fmax.s       fs1, ft4, ft7
                  mulh         a2, t2, t2
                  xor          t1, s6, t5
                  fmv.w.x      fs3, t6
                  fclass.s     t2, fs10
                  slli         t4, t2, 8
                  sltu         a6, s4, t0
                  fclass.s     t6, fs2
                  and          t6, s3, s10
                  div          tp, s1, s6
                  feq.s        a6, ft9, fs10
                  slti         s5, t4, -1399
                  fcvt.w.s     a6, ft2, rup
                  nop
                  fcvt.s.w     fs8, a4, rdn
                  or           s5, s3, t1
                  fmin.s       fs5, fs10, fs6
                  sub          t3, a3, s10
                  div          s5, t0, a2
                  flt.s        zero, ft9, fs7
                  ori          s10, s3, -1379
                  sub          ra, a0, t3
                  fmv.w.x      fs5, sp
                  fmin.s       ft6, ft2, fa7
                  fsub.s       fa6, fs3, ft8, rne
                  sll          a4, s2, t4
                  fsgnj.s      fs10, fa3, ft1
                  srai         a7, a6, 14
                  auipc        s4, 335732
                  fmv.x.w      s8, fs11
                  fadd.s       fs7, ft5, fa0
                  mulh         a5, t5, t4
                  slti         a7, sp, -25
                  mulhu        gp, a6, s11
                  fdiv.s       ft2, fs6, fa4
                  slt          s6, s10, s4
                  add          t4, a0, t4
                  mul          t4, s9, a0
                  mul          a6, s1, t1
                  auipc        s6, 494296
                  sltiu        s11, s11, 1859
                  rem          ra, s1, t4
                  fsgnj.s      fa5, fs5, fs9
                  xori         s4, t5, 421
                  sra          s5, s3, t4
                  fmul.s       fa2, fa2, fs10, rne
                  mulhsu       s7, t0, sp
                  fmin.s       fa0, fs5, ft3
                  and          t5, t4, t3
                  sra          s10, s3, t6
                  fmv.w.x      ft9, a2
                  feq.s        s2, ft11, fs1
                  slt          t5, a3, t4
                  fclass.s     s11, fs9
                  fadd.s       ft4, fs8, fs8
                  lui          t3, 292593
                  mulhu        s9, a2, s7
                  sltiu        s4, a1, 197
                  fclass.s     tp, ft1
                  or           s10, zero, ra
                  slti         t5, ra, 1801
                  fmv.w.x      fs4, a7
                  feq.s        s8, ft10, fa4
                  flt.s        a3, ft9, ft6
                  mulhsu       a0, t2, t0
                  srai         t0, a2, 9
                  feq.s        s2, fa4, ft4
                  and          ra, gp, s0
                  div          a6, s6, s10
                  fclass.s     zero, ft2
                  fsgnjn.s     ft6, ft11, fa3
                  srli         a0, t2, 6
                  ori          s5, gp, -1783
                  fmv.w.x      ft5, t2
                  fsgnjn.s     fs3, fs2, fa0
                  fmul.s       fs4, fs4, fs11, rmm
                  fmv.x.w      t4, ft3
                  srl          t0, s9, t1
                  andi         ra, a3, -1013
                  div          s11, a7, s1
                  fmin.s       fs5, fs9, fs7
                  sltiu        t4, a3, -1176
                  fadd.s       ft6, fs6, ft9
                  xor          ra, s9, sp
                  fsub.s       fs8, ft9, fs11, rup
                  remu         s4, ra, a2
                  slt          ra, ra, a7
                  nop
                  fmax.s       ft6, ft11, fa6
                  slli         s2, t4, 15
                  fle.s        ra, fa2, fs0
                  ori          t4, s5, -1848
                  fmul.s       ft4, fs1, ft10, rtz
                  and          s2, s9, s3
                  addi         t4, t6, -1443
                  andi         s11, gp, 1720
                  ori          a5, zero, 1840
                  fmv.w.x      fa7, s2
                  fcvt.s.wu    ft6, gp
                  fsqrt.s      fs0, fa7, rne
                  sra          gp, s11, a6
                  fcvt.s.wu    ft10, gp, rtz
                  sra          s7, s6, a4
                  add          s9, zero, zero
                  sltu         zero, a7, t3
                  xor          s0, s0, s1
                  sll          s8, ra, s1
                  and          t0, gp, t3
                  srl          t5, t2, tp
                  add          s9, a0, t4
                  ori          ra, tp, 1653
                  xor          s5, t4, a5
                  sub          a0, t3, t4
                  remu         s6, s11, s7
                  divu         ra, s4, s2
                  mulhsu       a4, s9, a2
                  add          t4, s8, t1
                  fmv.x.w      t0, fa2
                  fmax.s       fs5, fs5, ft1
                  fle.s        s10, fs0, fs3
                  fdiv.s       fs6, fa2, fa6
                  sub          s8, s11, tp
                  mulhsu       s0, s8, t5
                  fcvt.s.wu    fs0, s1, rdn
                  fsgnj.s      fs2, fa2, fa6
                  slti         s5, t1, 63
                  fsgnjx.s     fs3, fs8, fs9
                  sltu         a4, s2, s7
                  andi         ra, s10, -1296
                  fmul.s       fa1, fa4, fs1, rmm
                  ori          a1, s5, 1689
                  sra          s2, a2, s3
                  feq.s        gp, fa0, ft4
                  andi         s0, s2, 792
                  fdiv.s       fa1, ft0, fs4, rmm
                  fcvt.s.wu    fs5, t1
                  slt          a1, s4, t1
                  rem          s4, t2, s2
                  fsub.s       fs10, fs4, ft3, rtz
                  or           t2, a2, s0
                  sltiu        a4, t2, -1579
                  add          a1, s8, a1
                  fdiv.s       ft1, ft11, ft2, rne
                  fmax.s       fs0, fs8, fa2
                  fadd.s       fs9, fa2, ft6
                  or           s6, ra, s3
                  auipc        a7, 23139
                  fcvt.s.w     ft10, a4
                  fsgnj.s      fs11, fs11, ft11
                  fcvt.s.w     fa6, ra, rdn
                  add          t3, a7, t3
                  fmin.s       fa3, fs7, ft4
                  slli         a5, s11, 15
                  xor          a7, a0, t4
                  fcvt.wu.s    t3, ft0
                  fmax.s       fs0, fa1, fs9
                  fdiv.s       ft2, fs1, ft7
                  divu         a7, s7, a6
                  mulhu        a0, tp, ra
                  mulhsu       s9, a7, a3
                  nop
                  nop
                  mul          ra, sp, a5
                  fsub.s       ft1, fs5, fa3, rne
                  fmin.s       fa6, ft5, fa7
                  mul          ra, a4, zero
                  ori          s4, a2, 938
                  fcvt.w.s     s10, fa5, rup
                  srl          s10, s8, t5
                  sra          a1, a1, ra
                  andi         a2, s2, -486
                  fsgnjn.s     fs7, fa2, fa7
                  xor          t6, s0, t2
                  add          t3, a5, a6
                  nop
                  andi         t4, a0, 160
                  xor          a2, s0, s11
                  mul          t2, s5, t4
                  fdiv.s       fs5, fa7, fs1, rup
                  div          s6, s1, t4
                  xori         s0, s6, 1802
                  fmin.s       fa7, fa0, fa6
                  fsub.s       fs2, fs8, fa3
                  fmv.x.w      a5, fa6
                  nop
                  or           a7, s11, s5
                  srli         s5, t1, 19
                  fdiv.s       ft9, ft10, ft4
                  feq.s        gp, fs10, ft8
                  fsgnj.s      fa5, fs11, fa5
                  rem          s0, zero, a6
                  fsgnj.s      fs4, fa1, fs6
                  sltiu        a2, t6, -922
                  fsqrt.s      ft2, ft5
                  slt          s11, s0, s4
                  sltiu        t6, a4, 1949
                  flt.s        t0, fa0, fs9
                  andi         a4, ra, 1626
                  flt.s        a7, ft3, fa3
                  fcvt.w.s     s6, fs10, rdn
                  rem          t6, t0, s5
                  fsqrt.s      fa7, fs11
                  sub          s2, t4, s0
                  xori         t6, t1, -1326
                  fsgnjx.s     fa6, fa1, fs4
                  fmin.s       fs3, ft6, fs7
                  srli         a3, a5, 6
                  feq.s        t0, ft4, fs3
                  fmv.x.w      s6, fs4
                  ori          s6, tp, 1887
                  divu         t4, t4, ra
                  remu         a7, s11, s4
                  fsqrt.s      ft2, ft11
                  addi         a7, s8, 1639
                  slli         s11, sp, 4
                  mul          s0, tp, s3
                  mulhsu       s8, a2, a5
                  fsub.s       fs8, fa2, fa2
                  fcvt.w.s     ra, fa3
                  fsgnjn.s     fa3, ft4, fs6
                  and          t1, s7, ra
                  slli         t3, a3, 10
                  nop
                  srl          s4, tp, t3
                  fcvt.w.s     s0, ft2
                  fmin.s       ft2, ft8, fs11
                  fsgnj.s      ft2, fa2, fa2
                  srl          t4, a1, s10
                  feq.s        tp, fa1, ft0
                  fsgnjn.s     fs3, ft11, fa7
                  remu         t1, s4, t3
                  srl          t6, s9, s10
                  mul          a2, s4, s0
                  sltiu        s9, s0, 958
                  mul          t5, t1, s8
                  nop
                  fcvt.w.s     a4, ft11
                  slt          s8, t5, t3
                  divu         s10, a0, s2
                  fsgnjn.s     ft6, ft7, fs2
                  mul          tp, s3, s6
                  divu         a3, s11, t0
                  fclass.s     s6, fa5
                  divu         t5, t4, s6
                  add          ra, s8, t3
                  fadd.s       fs3, ft10, fs11
                  fmv.w.x      ft8, gp
                  addi         a4, t4, -1687
                  srl          s6, t0, ra
                  slli         ra, gp, 19
                  fclass.s     a5, fs0
                  fmv.x.w      gp, fs1
                  and          s2, gp, t5
                  fle.s        gp, fa4, ft8
                  sltu         t0, s0, s9
                  rem          gp, s8, s8
                  ori          a6, t2, -1775
                  fmax.s       ft2, fa4, fs2
                  fsub.s       ft8, fs3, fa3, rup
                  add          a5, s0, gp
                  sltiu        zero, s11, 391
                  mulhu        a1, zero, a1
                  rem          t2, s9, t4
                  xori         zero, s10, -1969
                  fcvt.s.wu    fa4, t5, rne
                  and          t5, s4, a0
                  remu         a5, a3, a1
                  andi         s2, sp, -483
                  fmul.s       fa1, fa5, ft3, rdn
                  mulh         s5, s10, t4
                  slli         s11, s4, 15
                  add          a2, s7, t5
                  ori          s2, sp, -334
                  addi         s0, t0, -347
                  srl          t1, t1, s1
                  fcvt.s.w     fs3, a1
                  sltu         t6, t0, sp
                  fmul.s       fs4, fa7, fa2, rdn
                  fcvt.s.wu    ft0, s9
                  rem          tp, s5, a5
                  xor          a6, a5, t6
                  fmv.w.x      ft9, s9
                  mulhsu       a6, t0, s0
                  andi         ra, s10, -1694
                  fle.s        a7, fs10, ft6
                  div          a2, s4, tp
                  fsub.s       fs6, ft6, fs7, rmm
                  fmv.w.x      fs6, s1
                  slti         t5, a7, -465
                  lui          a0, 886521
                  sub          a5, a0, t5
                  fcvt.s.wu    ft1, a3, rtz
                  auipc        s5, 910970
                  fmin.s       fs3, fs5, ft3
                  srl          a3, t6, a0
                  fcvt.s.w     fa6, s7, rtz
                  xori         t1, a6, -1257
                  fsqrt.s      ft6, ft4, rmm
                  srl          t2, s0, s7
                  fmv.x.w      s7, fs3
                  fsqrt.s      ft1, fa5, rup
                  fcvt.wu.s    s4, fa5, rne
                  mulh         s2, a5, a2
                  fcvt.s.wu    ft11, t2, rup
                  lui          s6, 27242
                  fmax.s       ft1, fa2, fs5
                  fdiv.s       fs10, ft0, fs10, rmm
                  sltu         s8, a3, s3
                  slti         s8, sp, -138
                  fsgnjx.s     ft8, fs6, ft1
                  addi         s8, s3, 966
                  mulhu        s0, s10, s10
                  feq.s        a4, ft5, fa7
                  fsgnjn.s     fs0, ft2, ft3
                  fsgnjn.s     fs2, fa0, ft4
                  sra          t3, s3, t0
                  fmin.s       fa6, fa4, fs11
                  remu         s5, t4, a5
                  mulh         s0, ra, s6
                  fdiv.s       ft8, fa1, fa1
                  fmax.s       ft2, ft7, fa0
                  divu         t6, s0, a1
                  srl          a1, a1, s3
                  mulhsu       a5, t0, s1
                  add          t1, t4, s4
                  fmul.s       fs0, fs9, ft7, rdn
                  divu         s10, s3, s9
                  ori          gp, t4, 1729
                  fmax.s       fa7, fa3, fs11
                  sll          a6, zero, sp
                  fadd.s       ft8, ft3, ft3, rtz
                  sltu         ra, a2, a0
                  fclass.s     s11, fa4
                  xori         s2, t5, -437
                  fsgnjx.s     ft2, fa1, fa4
                  sub          s7, s10, s5
                  xor          a2, s5, s6
                  fcvt.s.w     fa0, s1, rdn
                  mul          s5, s3, t5
                  slli         s2, t3, 5
                  fadd.s       fs9, ft0, ft7, rmm
                  fle.s        tp, ft9, fs10
                  fsgnj.s      ft2, fs10, ft2
                  andi         a2, a2, -52
                  and          tp, t1, a6
                  fadd.s       fs4, ft8, ft3
                  divu         s6, ra, s3
                  fsgnj.s      fa5, fa6, fs8
                  flt.s        t4, ft2, ft8
                  fmul.s       fs2, fa0, fs6
                  div          s4, s1, t0
                  mulhu        t1, t3, t4
                  slti         t5, a6, -1674
                  mulhu        s11, a2, t6
                  srai         t1, t5, 19
                  fcvt.w.s     s4, fa2
                  fsub.s       fs7, ft1, fs7
                  fadd.s       fa5, fa1, ft0
                  fcvt.w.s     tp, ft3, rdn
                  addi         s9, t0, 1528
                  andi         s5, s10, -1390
                  fsgnjx.s     fs11, fs10, fa1
                  nop
                  fadd.s       fs8, fa1, ft1, rmm
                  fsgnj.s      fa7, ft9, fs4
                  mul          t3, t0, gp
                  mulhsu       s4, s10, s9
                  addi         gp, s10, -684
                  rem          a0, t4, a2
                  fmul.s       ft6, ft5, fs9
                  nop
                  srl          a2, t3, s9
                  sltiu        a2, t4, -530
                  mulhu        s5, a1, s6
                  slli         gp, s4, 17
                  xori         t5, s6, -822
                  addi         s11, s3, -517
                  fmul.s       fa1, fa2, fs7
                  ori          t2, s7, 1238
                  andi         a6, a1, 1070
                  fsqrt.s      fs0, fs5, rdn
                  srl          t0, a0, t4
                  fmv.x.w      t4, ft1
                  srl          s4, t1, s8
                  fmul.s       ft4, ft6, fa5
                  sub          a7, s5, s9
                  fclass.s     t6, ft11
                  xor          a1, sp, s0
                  slt          t1, s10, a2
                  slt          ra, a7, zero
                  fcvt.w.s     t5, ft7
                  fle.s        t5, ft3, fa4
                  fcvt.s.wu    fs5, s10
                  sra          a5, tp, gp
                  remu         tp, t4, a2
                  fcvt.w.s     zero, fa6, rtz
                  sltiu        s7, s7, -960
                  auipc        s5, 664774
                  add          a3, zero, a4
                  fmin.s       ft11, ft6, ft7
                  fsqrt.s      ft2, fs8
                  fclass.s     t5, fs6
                  sll          a0, a4, s10
                  fcvt.s.wu    fa3, s2
                  fsgnjn.s     ft0, fs10, fs0
                  sra          a4, s8, gp
                  div          t5, t1, s5
                  rem          t4, gp, s10
                  sltiu        zero, s7, -1269
                  fsub.s       fs11, fs6, ft7, rmm
                  mulhsu       a1, s5, s0
                  or           s10, t4, s4
                  slli         ra, a5, 21
                  srl          s7, ra, a7
                  sra          a5, a1, t4
                  and          a2, a5, t1
                  fsgnj.s      fa7, ft3, ft7
                  fmax.s       fs3, fa3, fs10
                  fmv.w.x      ft2, s8
                  fsgnjx.s     fs6, ft0, ft4
                  addi         a4, t6, 1315
                  mulhu        t5, s3, a0
                  slli         a2, s7, 17
                  sll          a5, t6, t6
                  fsgnjx.s     fa1, ft8, ft0
                  srli         s7, zero, 24
                  fle.s        a4, ft5, ft8
                  remu         s8, t3, a3
                  feq.s        zero, ft7, fs2
                  mulh         t3, tp, a1
                  addi         a5, s4, -1012
                  fadd.s       fs8, ft4, ft5
                  slti         t1, a3, 1170
                  fcvt.s.wu    fa5, s11
                  fcvt.s.wu    fs8, t5, rne
                  flt.s        s5, fs0, fa1
                  mulhsu       s6, t4, a1
                  srli         t3, s8, 3
                  fcvt.s.w     fs5, a2
                  xori         s4, s10, 753
                  slt          t0, t5, s5
                  mulh         s4, a3, s5
                  sltiu        a6, t6, 1800
                  srli         t0, t1, 29
                  srai         a3, s0, 1
                  fcvt.wu.s    a5, ft6, rmm
                  slt          t3, s10, s9
                  sra          t6, t0, s11
                  fmv.x.w      t5, fs2
                  fmv.w.x      fs5, s11
                  mulh         s8, t6, s4
                  fsgnjx.s     fa4, ft10, fs0
                  and          a7, a4, a3
                  fsgnjn.s     fs11, fs10, ft4
                  fle.s        t6, ft2, fs2
                  auipc        t0, 416304
                  mulh         t4, tp, gp
                  fsgnjx.s     fa7, ft3, ft0
                  and          zero, tp, a0
                  fmv.w.x      fs0, s2
                  slti         t6, a6, -1566
                  and          s11, t1, t1
                  add          a0, s6, t5
                  andi         t1, s2, 1011
                  fsqrt.s      fa0, fs7, rup
                  feq.s        s9, ft0, fs6
                  sub          s9, s0, s9
                  fsub.s       ft4, fs2, fa5
                  fcvt.wu.s    a4, fs0
                  fmax.s       fa1, fs2, fs11
                  fcvt.s.w     ft4, t2
                  rem          t3, s5, s11
                  fmv.x.w      s0, ft6
                  fcvt.w.s     gp, fs8, rdn
                  mul          zero, a0, s11
                  fmv.x.w      zero, fs4
                  slti         s9, s11, -1020
                  fadd.s       fs2, fs11, fa2, rmm
                  sll          a6, t1, t4
                  slt          a3, gp, t0
                  sltu         s5, s5, tp
                  fmv.w.x      fs8, s10
                  mulh         a6, ra, t3
                  fcvt.s.w     fa3, s2, rtz
                  sll          t4, s1, s0
                  flt.s        t0, fs2, fs11
                  slli         a0, s7, 22
                  mulhu        s7, zero, s2
                  div          s4, sp, s11
                  addi         t4, a4, -597
                  slli         s4, tp, 7
                  srli         s8, t1, 18
                  fmv.x.w      a5, fa3
                  fmax.s       ft5, fa6, fs6
                  xori         t6, a5, 1922
                  and          a1, s1, a3
                  mulhu        ra, a6, a7
                  feq.s        gp, fs7, fa5
                  lui          a4, 415333
                  div          t0, a5, a1
                  flt.s        a5, fa1, fa4
                  fle.s        s7, ft4, fs1
                  fcvt.s.wu    fa4, a5
                  mul          s0, a6, s11
                  div          s6, t2, s3
                  slti         s8, s11, 1034
                  sltu         a3, t6, s8
                  flt.s        a0, fs1, fa1
                  sll          t1, s6, s10
                  srai         ra, a0, 4
                  auipc        a5, 515661
                  srai         t6, t3, 30
                  srli         s4, ra, 29
                  mulh         a7, a6, a2
                  or           s4, s3, a0
                  addi         a5, t0, -1998
                  mulhu        gp, t6, a5
                  fsgnjn.s     fs6, fs9, fs1
                  fcvt.s.w     fa4, a1
                  srli         s5, s9, 12
                  or           s7, s9, s4
                  auipc        t0, 818384
                  fcvt.s.w     fs8, s4
                  fclass.s     s6, fa4
                  mul          ra, s8, a7
                  fcvt.s.wu    fs6, s6, rtz
                  fmax.s       fs0, fa2, ft10
                  srli         t2, ra, 4
                  sub          s2, s4, t1
                  fcvt.s.wu    fa3, a7, rdn
                  ori          t5, s9, -1949
                  fsqrt.s      fs9, fs1, rmm
                  fmv.w.x      ft4, a7
                  fmv.x.w      a4, fa4
                  mulh         t1, s3, a7
                  divu         a2, s1, ra
                  sltu         t1, a4, s7
                  fsgnjn.s     ft7, ft6, fa1
                  slt          s4, a1, a2
                  fsgnjx.s     ft6, fs1, fs5
                  divu         s0, s8, t4
                  srl          s8, s2, s3
                  addi         t4, s1, -988
                  fclass.s     s4, ft2
                  fsgnj.s      fa3, ft6, fa6
                  auipc        a4, 217217
                  addi         a4, t6, -1961
                  fcvt.w.s     t3, fs7
                  sltiu        a6, s10, 390
                  fsqrt.s      fs10, fa2, rup
                  fcvt.s.w     ft10, a7
                  mul          a3, s1, a5
                  sltu         s8, a2, a3
                  slt          s11, ra, a1
                  fcvt.s.wu    fs6, s11, rdn
                  fsqrt.s      fs0, ft7
                  fmin.s       ft1, ft8, fs4
                  srl          a4, ra, t1
                  fcvt.w.s     a5, fs0
                  nop
                  srl          gp, t5, gp
                  slti         s9, s4, -1103
                  fle.s        t2, fs3, fa6
                  auipc        s8, 591853
                  fadd.s       fa4, ft5, fa2
                  flt.s        s8, fs2, fs10
                  srl          t6, t0, s9
                  fclass.s     t4, ft6
                  fclass.s     s7, ft9
                  ori          t5, a3, 1904
                  fsgnjx.s     fs7, ft11, fs10
                  andi         s7, s0, 428
                  fcvt.wu.s    a2, ft8
                  sub          s8, s0, t5
                  ori          s6, s8, -1204
                  fsgnj.s      ft0, fs8, fa7
                  srai         s4, s2, 31
                  and          a5, s1, s2
                  auipc        gp, 824200
                  fsgnj.s      fs6, fa1, fs10
                  slt          s0, a1, t1
                  fcvt.w.s     t5, ft0, rmm
                  mul          ra, s6, ra
                  mul          s4, ra, s3
                  sll          s4, t4, s2
                  slti         tp, a2, 291
                  mulhsu       a1, s6, gp
                  fsqrt.s      fa6, fa2
                  sltiu        a0, s4, -869
                  mulhsu       t2, s1, sp
                  mulhsu       zero, s6, s9
                  and          s4, a3, s8
                  fsub.s       fs5, ft11, fs3
                  xor          a2, s10, s4
                  slti         s7, s3, 529
                  fsub.s       fa0, fs4, fs5, rmm
                  xori         s7, s9, 140
                  fsgnj.s      fa6, ft3, fs10
                  sltu         s10, gp, t4
                  sll          ra, a4, t6
                  fadd.s       fa7, ft10, fa7
                  srli         s6, a0, 6
                  sll          a3, a2, s1
                  and          t5, s2, t0
                  fclass.s     a1, fs5
                  fsgnj.s      fa6, fs5, fs7
                  fcvt.s.wu    ft6, t4, rmm
                  srl          s5, a7, a1
                  sub          t3, s11, t2
                  fcvt.s.w     fa7, a7, rmm
                  fsgnj.s      ft9, fa0, fs0
                  srai         t4, sp, 19
                  add          s2, s1, sp
                  mul          a0, a7, a7
                  slli         a4, sp, 29
                  rem          s10, t5, s10
                  fmv.w.x      fa1, s10
                  feq.s        a3, fa1, ft6
                  fcvt.wu.s    s9, ft1
                  mul          t1, ra, t3
                  fsgnjx.s     ft11, ft1, fs3
                  srl          t4, a2, a2
                  fclass.s     s2, fa4
                  auipc        s10, 976377
                  sltiu        s4, t4, -1358
                  srai         zero, t5, 14
                  srli         s4, s2, 0
                  divu         s9, s6, s7
                  fcvt.s.wu    ft5, s10
                  fmv.x.w      s4, fs1
                  nop
                  fmv.w.x      ft6, t0
                  sub          a7, a5, a0
                  fsub.s       fa5, fs5, fs7, rup
                  fclass.s     a2, fa6
                  fmv.w.x      ft6, t4
                  fmul.s       ft9, ft0, ft1
                  slti         s7, a3, 1648
                  ori          s10, s1, 1347
                  flt.s        a7, fs6, ft3
                  fsqrt.s      ft8, ft10, rtz
                  slt          s8, t6, a5
                  fmin.s       fs5, fs8, fs10
                  fclass.s     s7, ft9
                  sub          a4, a4, t1
                  addi         s6, t2, -371
                  xor          s8, gp, t6
                  and          t5, s3, a1
                  srl          a1, a6, a7
                  addi         s2, t5, -1485
                  fsgnj.s      fs4, ft9, fs6
                  addi         t6, s5, -2010
                  fadd.s       ft10, ft1, ft4, rtz
                  slti         a5, s9, -912
                  flt.s        s0, fa1, fa0
                  ori          t1, s2, 158
                  sll          a1, t5, zero
                  xor          t4, a6, t6
                  remu         a6, a0, a2
                  div          gp, a5, a1
                  sub          a7, a0, sp
                  feq.s        a7, ft9, fs0
                  xori         s5, a3, 869
                  fcvt.w.s     t2, ft1, rdn
                  div          tp, s3, zero
                  andi         t4, a1, 1768
                  fdiv.s       fa6, fa3, fs5, rtz
                  sll          t6, a6, s8
                  flt.s        a7, fa2, ft1
                  fcvt.wu.s    t4, fa1
                  ori          t6, a1, 1330
                  fmax.s       fs1, fs8, ft11
                  fcvt.w.s     a7, ft9
                  fdiv.s       ft5, fs0, fa2
                  srli         zero, s3, 12
                  fmax.s       ft5, fs10, fa0
                  fle.s        s8, ft6, ft7
                  fle.s        s11, fs3, fs11
                  ori          t6, a2, 389
                  rem          s2, s11, t6
                  fcvt.s.w     ft0, a7, rne
                  divu         s11, tp, t3
                  fle.s        s4, fs0, fs11
                  remu         a1, a0, a0
                  mulh         s8, s7, tp
                  remu         s10, a5, s5
                  mulh         a2, t4, t2
                  srai         s8, t3, 26
                  sll          t4, a2, s8
                  fmin.s       ft0, fs5, ft1
                  mul          t6, s2, gp
                  fclass.s     t3, fa1
                  sltu         s2, sp, s11
                  fsgnj.s      ft11, fs2, fs8
                  fsgnjn.s     fa4, fa0, fs8
                  fadd.s       ft9, ft5, ft3
                  xori         a7, s6, 1723
                  sub          ra, a1, s8
                  mul          a6, t6, s3
                  fmv.w.x      fs6, s9
                  slti         a7, tp, -1926
                  sltu         t4, a4, a5
                  srl          t2, a1, t3
                  xor          s2, s11, s6
                  sll          a0, s6, a5
                  slti         s9, a5, -1637
                  flt.s        t4, ft4, ft10
                  slt          t6, s3, t5
                  feq.s        ra, ft0, fa2
                  or           gp, a0, gp
                  fclass.s     s6, fa1
                  fcvt.s.w     fs1, s2
                  feq.s        gp, fa4, fs7
                  or           t3, s8, s7
                  sub          t6, s7, gp
                  srli         a3, t1, 1
                  fmv.x.w      s8, ft5
                  fcvt.s.wu    ft4, a6, rdn
                  andi         zero, s4, 1214
                  addi         t4, s0, -1187
                  slti         t0, s8, 657
                  lui          s11, 557199
                  fmin.s       ft0, fs11, fs8
                  fcvt.w.s     s7, ft8
                  sub          s9, t2, a3
                  fmin.s       ft6, fa0, fs9
                  xor          t4, s5, a5
                  nop
                  fsqrt.s      fs5, fs7
                  slt          s8, s3, a5
                  fsgnj.s      fs6, fs4, ft2
                  slt          s11, a6, s3
                  srai         gp, s7, 9
                  mul          tp, t0, t4
                  fmin.s       ft0, fa7, fs9
                  slli         t4, a5, 30
                  sltu         a5, s4, a5
                  fcvt.w.s     s10, fa3
                  slti         t6, s5, -94
                  fdiv.s       fa1, fs11, fs3, rtz
                  sltiu        t4, t4, 1764
                  feq.s        t4, fs11, ft2
                  xor          tp, a4, a0
                  mul          gp, a5, t1
                  sll          s8, zero, t4
                  lui          gp, 29156
                  auipc        tp, 373283
                  lui          a4, 229002
                  sra          tp, sp, s5
                  fdiv.s       fs7, fa4, ft4
                  rem          gp, s3, sp
                  div          a7, s10, t4
                  sra          s0, a5, s5
                  ori          s2, sp, -1725
                  add          s8, s3, a6
                  fmin.s       fa2, ft10, fs10
                  fcvt.s.w     ft6, t4, rne
                  fsgnj.s      ft11, ft6, fs9
                  feq.s        s11, ft6, fs3
                  slti         t5, s1, 140
                  nop
                  sra          a0, zero, s6
                  xor          t5, t4, s8
                  rem          zero, a5, a3
                  lui          s10, 103985
                  lui          a4, 399522
                  fsgnjn.s     fa0, fs5, fs6
                  nop
                  add          a3, s6, t5
                  slti         s11, s7, 419
                  add          zero, s2, a5
                  rem          a6, s8, t3
                  fcvt.w.s     s2, fs11, rne
                  fsgnjn.s     fs2, ft0, ft0
                  addi         a6, s5, 1366
                  mulh         s4, t6, a6
                  add          s4, zero, s10
                  sra          a4, sp, ra
                  mulhu        s0, zero, s8
                  fmax.s       fs2, ft3, ft3
                  sub          t3, a7, t0
                  sll          zero, t0, a7
                  fadd.s       fs11, fs1, ft7
                  ori          gp, gp, 815
                  nop
                  fsgnjx.s     ft4, fa3, ft6
                  fclass.s     s4, fs3
                  srli         zero, a3, 1
                  slli         s9, s10, 7
                  mulhu        s8, zero, t5
                  auipc        s7, 693929
                  fsub.s       ft8, fa2, fa7
                  flt.s        s8, fs3, ft4
                  fdiv.s       fs5, fs7, fa6
                  rem          ra, s11, s2
                  fcvt.w.s     t1, ft7
                  fmin.s       ft5, fa1, fs7
                  fsgnjx.s     ft5, fs5, fs3
                  flt.s        a0, fa1, ft5
                  sub          t4, t1, t5
                  mulh         a0, s0, t6
                  mulh         t3, s10, s3
                  srli         a4, a0, 6
                  slt          tp, a7, s5
                  remu         t3, t0, s6
                  fdiv.s       fs6, fa0, ft10
                  add          a6, s10, sp
                  addi         s2, s9, 534
                  nop
                  fmax.s       fs3, fs11, fs4
                  sub          t3, a3, t0
                  fsgnjn.s     fs3, ft10, fs2
                  addi         gp, t5, -2010
                  fsgnj.s      ft5, fs5, ft3
                  sltu         a4, a2, a5
                  andi         a7, s9, -274
                  slt          s8, a7, t2
                  slli         t5, zero, 26
                  feq.s        t2, ft4, fs1
                  fcvt.w.s     tp, fa7, rmm
                  sll          zero, t4, a2
                  fclass.s     t3, fs8
                  mulhu        s6, s5, s4
                  mulhsu       a3, tp, s7
                  fmv.x.w      t2, fs1
                  mulhsu       a5, t6, s9
                  fcvt.wu.s    a1, fs6
                  sra          gp, t5, s9
                  sra          s11, t5, s10
                  fsgnjx.s     fa0, fs7, ft9
                  add          a5, s10, a4
                  fadd.s       fa3, fs0, ft4, rne
                  fmul.s       fs2, ft3, fa5, rmm
                  fle.s        gp, ft7, fa0
                  xor          a5, t6, s1
                  sra          s9, a0, t5
                  fsgnjn.s     fs10, fs1, fa1
                  fclass.s     a1, fs3
                  fsqrt.s      fs2, ft4, rne
                  fsgnj.s      ft6, fa4, ft1
                  addi         s4, a1, -42
                  fmin.s       fs5, ft2, fa3
                  sltu         s11, ra, ra
                  sra          s9, s9, gp
                  nop
                  fsub.s       fa0, ft4, ft8
                  srai         s2, t3, 31
                  feq.s        a6, ft6, ft1
                  fsqrt.s      ft3, fs4
                  fsqrt.s      fa3, ft4
                  srai         t4, s3, 28
                  fdiv.s       fs2, fa0, fa5
                  fsgnjn.s     fa6, fa4, fs5
                  and          a0, t4, s2
                  fadd.s       ft6, fs1, ft6, rne
                  mul          ra, a2, a7
                  remu         s11, zero, a0
                  fmin.s       fs10, ft0, ft2
                  fmin.s       fs7, fa7, fs9
                  andi         a6, t1, 1914
                  fcvt.w.s     s5, ft9
                  fle.s        a5, ft3, ft2
                  add          s2, t6, a6
                  fsgnjx.s     fs5, ft3, ft3
                  sltu         s7, t0, t2
                  andi         s0, a7, -1849
                  remu         s8, a7, a6
                  fcvt.s.wu    fs4, t3, rtz
                  flt.s        s6, fa7, ft9
                  addi         a5, s11, -1206
                  div          a3, zero, t5
                  mulhsu       a1, s5, s3
                  fclass.s     t2, fa6
                  fmul.s       fs11, ft11, fs5
                  slli         t4, a4, 11
                  fmin.s       fs6, fs9, fs0
                  auipc        gp, 451875
                  flt.s        s2, fs3, fa0
                  fmul.s       ft8, ft11, ft5
                  or           a3, a6, a0
                  fcvt.s.w     ft8, s0, rne
                  mulh         gp, s11, a1
                  feq.s        t3, fa0, fs5
                  fmax.s       fs8, fa0, fs7
                  feq.s        s5, fa6, ft8
                  div          gp, t0, s4
                  fclass.s     tp, ft4
                  mulhsu       s7, a0, s2
                  fsqrt.s      ft8, fs7
                  addi         s6, ra, -758
                  add          zero, zero, s11
                  add          s11, a5, a5
                  fsub.s       fa1, fs9, ft3, rup
                  andi         s9, t3, -247
                  srl          s0, t0, s2
                  sltu         zero, s4, s7
                  xori         t1, a4, -1011
                  xori         zero, s11, 15
                  div          t6, a5, tp
                  andi         s6, t1, 828
                  fsgnjn.s     fs7, fa5, fs2
                  fclass.s     a2, ft0
                  lui          ra, 962064
                  srli         a0, s3, 8
                  sltiu        a6, t2, 152
                  flt.s        s10, fs9, fa7
                  flt.s        s2, fa0, fs2
                  auipc        zero, 592290
                  nop
                  fsqrt.s      ft2, ft0
                  fdiv.s       fs1, fs11, fa5, rdn
                  fcvt.w.s     t0, ft11, rtz
                  slt          a0, s9, zero
                  mulhu        s2, t6, s6
                  lui          gp, 208403
                  fclass.s     s10, ft9
                  and          t1, a0, a6
                  fsqrt.s      fs2, fa6
                  slli         s4, s10, 28
                  andi         s7, sp, -723
                  fsub.s       fs5, fs0, fa3, rdn
                  sll          t6, ra, sp
                  slli         t4, t4, 23
                  slti         ra, a5, -866
                  fadd.s       fs7, ft10, fs2
                  mul          s2, s11, a7
                  and          s6, a7, tp
                  xor          a3, sp, s0
                  xori         gp, a1, 98
                  fmv.x.w      a0, ft5
                  fsub.s       ft7, ft0, ft0
                  sll          a4, tp, s2
                  xor          a5, t5, s2
                  fmv.x.w      s11, ft6
                  fsgnjn.s     fs3, ft5, fa6
                  fle.s        t6, fa1, fs5
                  remu         s0, s11, a0
                  srl          a2, a2, s2
                  fdiv.s       fs1, ft3, fs1, rmm
                  sltiu        s0, t3, 1884
                  sub          a2, t4, a5
                  fsub.s       fa3, ft3, fa1
                  fmv.w.x      fs3, sp
                  sub          gp, ra, a4
                  fcvt.s.wu    fs9, s1
                  fsub.s       fs1, fa5, fs8
                  srai         a2, t1, 18
                  fcvt.s.w     fa7, s7
                  fclass.s     a1, fs3
                  mulhu        s2, s6, a7
                  divu         t5, s9, s6
                  fdiv.s       ft6, fs11, ft7
                  fsgnjn.s     fa5, ft0, fa6
                  srl          t3, s0, s9
                  rem          s9, a7, t4
                  auipc        s10, 344056
                  ori          a5, a5, 1720
                  fmin.s       ft11, ft11, fs9
                  auipc        gp, 699632
                  fclass.s     t0, fs0
                  remu         s4, a7, sp
                  mul          s9, zero, s5
                  rem          zero, s0, s1
                  auipc        t3, 896763
                  fle.s        t2, fa0, fa2
                  auipc        a4, 113344
                  mulh         s6, a6, a0
                  sra          tp, s6, s2
                  fsgnjx.s     fs8, ft0, ft3
                  fadd.s       fs0, fs4, fs0, rne
                  fmul.s       fs10, fs1, fs4
                  srli         a5, gp, 17
                  fcvt.s.wu    ft10, t4, rmm
                  fmul.s       fa0, fs2, fs4, rne
                  fsgnjx.s     ft6, fa0, ft10
                  and          s8, t6, a3
                  auipc        a4, 17727
                  sra          s2, a5, sp
                  div          a2, s6, s11
                  fdiv.s       ft3, ft0, ft5, rtz
                  flt.s        gp, fa6, fs6
                  auipc        s6, 638911
                  sltiu        s11, sp, 31
                  fsgnjx.s     fs6, fs2, ft2
                  slti         t5, a7, -1918
                  slt          t3, s3, a2
                  fsgnj.s      fa6, ft11, ft5
                  fmul.s       fs9, ft4, fa1, rdn
                  sub          a0, s0, s9
                  add          t5, s0, t3
                  fmv.w.x      ft5, a6
                  fmin.s       fa7, fs5, fs10
                  feq.s        a7, ft3, fs2
                  divu         s7, a5, s1
                  fmax.s       fa5, fs7, fs1
                  sra          a1, t0, tp
                  fsub.s       ft6, ft5, fs4
                  fmv.x.w      s11, ft6
                  fmin.s       ft7, ft0, fa7
                  srl          a2, a3, a7
                  flt.s        s11, ft5, ft1
                  slli         t4, s1, 16
                  or           tp, s5, zero
                  slti         t3, s5, 670
                  srai         s7, a7, 18
                  fcvt.w.s     a0, ft2
                  fcvt.wu.s    ra, ft6, rdn
                  slli         s4, t1, 4
                  fcvt.s.w     ft3, a5
                  feq.s        s9, ft6, ft0
                  fle.s        s9, fa6, fa5
                  sub          a7, s7, t5
                  andi         tp, a2, 1708
                  srai         s11, s2, 29
                  addi         a4, t0, -1492
                  div          s10, t3, tp
                  srli         s11, s5, 15
                  fcvt.s.w     fa3, s11
                  sltu         zero, s8, a0
                  fsqrt.s      fs3, ft0
                  fsqrt.s      ft5, ft2, rdn
                  xori         ra, s10, 71
                  fsgnj.s      fa0, fs3, ft8
                  slt          t6, tp, a4
                  fclass.s     tp, fs10
                  and          t4, s1, a2
                  fcvt.wu.s    ra, ft6
                  sltu         a1, s11, a4
                  slti         t6, s6, 206
                  slt          a2, t6, s5
                  addi         s7, s9, -2037
                  mulhu        s0, s6, a1
                  fle.s        a6, ft7, fa4
                  fmax.s       fs8, fs2, fs4
                  srai         zero, tp, 2
                  mulh         tp, s1, t5
                  fmv.x.w      t6, ft4
                  fadd.s       fs9, fs11, fs3, rne
                  fmv.w.x      fs5, s1
                  and          a2, t1, t3
                  fmv.x.w      gp, fa1
                  slt          a7, s9, s5
                  xori         t3, s8, 1070
                  mulhsu       s2, t6, s1
                  rem          s5, t1, s11
                  andi         zero, s1, -1028
                  ori          a3, s7, 763
                  addi         t0, s10, -1710
                  fcvt.s.w     fa0, ra, rne
                  fsqrt.s      fa3, fa3
                  flt.s        s8, fs6, fs0
                  fsgnjn.s     ft5, fs1, fs0
                  andi         t1, a2, -1407
                  mulhsu       s2, s10, s7
                  mul          s2, t6, s10
                  fsub.s       fa5, fs4, fs4
                  srli         s2, s1, 20
                  xor          s9, t3, ra
                  div          t2, t4, a6
                  fmax.s       fs9, ft11, ft2
                  fle.s        zero, ft8, ft11
                  flt.s        s0, ft5, fa7
                  fmin.s       fa7, fa7, fa3
                  sub          s4, t3, t2
                  sltu         t6, a0, t5
                  fmul.s       ft3, ft8, fa7, rtz
                  fcvt.w.s     s11, ft0
                  or           t3, s4, s2
                  fsgnjx.s     ft1, fa4, fs6
                  fmul.s       ft5, ft8, fa1
                  sub          t0, s4, tp
                  slt          a6, s6, a1
                  fsqrt.s      ft4, fs0, rtz
                  fsgnjx.s     fs7, ft8, fs9
                  nop
                  srl          a2, s2, a5
                  div          s10, gp, a7
                  andi         s2, s5, -1955
                  fcvt.s.w     ft10, a1
                  fsgnjn.s     fs6, ft3, fs3
                  fcvt.s.wu    ft7, a0
                  srli         gp, ra, 20
                  fsqrt.s      ft8, ft4
                  andi         t5, tp, 416
                  fmul.s       ft9, fs7, ft8
                  fmv.w.x      fs9, s3
                  slti         s11, a5, -59
                  sltu         gp, s3, s10
                  fmax.s       fa4, fs2, fa7
                  sub          s8, sp, s5
                  and          s8, s10, tp
                  fsgnjn.s     ft9, fs5, fa2
                  divu         a6, s0, gp
                  add          s6, a4, zero
                  divu         s4, a7, a3
                  fdiv.s       fs9, fs0, fs11
                  slt          s7, s5, ra
                  srli         s10, s9, 25
                  fcvt.s.wu    ft1, s0
                  srli         t5, t0, 5
                  sltu         a7, ra, a5
                  sltu         a1, tp, s0
                  auipc        t2, 890759
                  srl          s2, s1, s3
                  sltiu        s10, t6, -1363
                  mulh         s6, s8, a4
                  mulhu        a1, s7, s5
                  sra          a3, s1, t0
                  and          t5, s3, a7
                  rem          t0, t1, t4
                  div          a0, t0, s9
                  fdiv.s       fa5, fs7, fs3, rdn
                  fcvt.wu.s    t1, fs9
                  mulhsu       zero, s11, s4
                  fsub.s       ft10, fa2, ft4
                  fcvt.s.w     ft11, a4, rmm
                  auipc        t4, 123282
                  fsgnjx.s     fs11, ft0, fs3
                  sltu         s7, t2, t4
                  fle.s        t1, fs6, fs7
                  ori          t5, s2, -590
                  fcvt.s.w     fs2, s11, rtz
                  div          zero, a5, s10
                  andi         a5, sp, -1933
                  fadd.s       fs3, ft1, fs9
                  srai         ra, s6, 7
                  rem          s7, t3, s0
                  rem          a2, a3, s11
                  sra          a5, s7, a5
                  fadd.s       fa5, ft11, fs8, rup
                  and          t3, s9, s8
                  slti         t6, s2, -553
                  and          ra, s2, t1
                  sltiu        s10, t6, -908
                  fcvt.w.s     t1, fs0
                  lui          s4, 844979
                  slli         a1, s2, 9
                  fmin.s       fs4, fs8, ft7
                  fmin.s       fs1, ft9, fs5
                  fle.s        t3, fa4, fa0
                  fmin.s       ft0, ft8, fs1
                  fcvt.s.wu    fa1, s9, rdn
                  sltiu        ra, ra, -1064
                  flt.s        t1, ft0, fs9
                  sll          s6, s2, s6
                  fmin.s       ft3, fa2, ft5
                  andi         s11, s6, 341
                  nop
                  fsqrt.s      fs3, fs0
                  sll          a1, s4, s7
                  fadd.s       fs9, fa4, ft10
                  mul          a2, s0, zero
                  fmv.x.w      s8, ft1
                  auipc        t0, 769937
                  srli         tp, s5, 27
                  or           s6, zero, tp
                  ori          s8, s10, 1802
                  fmul.s       ft2, fs4, ft2, rdn
                  rem          s7, t4, t3
                  remu         s7, a7, s9
                  fle.s        a3, fs4, ft6
                  fsgnjx.s     fa2, fa0, fs5
                  srli         s2, s11, 25
                  mul          a5, s1, a0
                  fsgnj.s      ft4, ft10, fs1
                  remu         a3, s6, s10
                  flt.s        a4, ft1, fa3
                  fadd.s       ft6, fa1, ft6
                  remu         a7, s10, s3
                  or           s11, zero, t4
                  ori          a2, t1, -1910
                  fmv.x.w      s4, fs7
                  remu         s11, s5, ra
                  fcvt.w.s     t1, ft4, rmm
                  fmax.s       ft8, fs9, fa4
                  fclass.s     t5, ft2
                  fsgnjx.s     fa1, fa1, ft3
                  remu         a2, a5, s10
                  fclass.s     gp, fs3
                  fsgnjx.s     fs1, fs8, fa7
                  xori         s11, a4, 2020
                  fsub.s       ft7, fs3, ft0
                  fcvt.wu.s    s6, fs2
                  slli         s10, t1, 27
                  xori         t2, t6, -343
                  fcvt.s.wu    fs9, t2
                  fmv.w.x      ft2, t3
                  srli         a2, s11, 16
                  mul          s7, t4, ra
                  addi         t6, t6, 1384
                  nop
                  remu         s11, s3, s4
                  slti         s4, ra, -1449
                  andi         t4, a7, -1053
                  andi         s6, t4, -265
                  div          t0, s0, t0
                  remu         t5, t4, a2
                  ori          s4, ra, 712
                  fcvt.s.wu    fs6, s11
                  or           s5, a2, a5
                  fmin.s       fs6, ft1, fs9
                  sra          a4, a0, s3
                  add          s8, t3, a0
                  andi         s8, s0, 1171
                  nop
                  fsgnjx.s     ft2, fa1, fs10
                  fsub.s       fa5, ft7, fa4
                  fcvt.w.s     t4, ft6, rup
                  nop
                  mul          s6, tp, t6
                  mulh         t4, t2, s0
                  fcvt.s.w     fs6, a4, rdn
                  add          t4, a5, tp
                  nop
                  xor          t2, s4, t2
                  and          s5, s1, a5
                  fsub.s       ft6, fs6, fs1
                  srai         s10, t6, 18
                  srai         tp, s2, 10
                  fsub.s       fa0, ft3, ft8
                  sltu         t0, s0, t4
                  fmv.w.x      fs8, s5
                  fadd.s       fs0, ft9, fa3, rtz
                  andi         t5, zero, 1646
                  mulhsu       a6, t0, s4
                  srl          t3, t6, s4
                  fcvt.s.wu    ft9, a7, rup
                  fdiv.s       ft5, fs9, fs9
                  fle.s        t5, fa0, ft7
                  fsqrt.s      fs8, fa5, rtz
                  rem          ra, a4, s2
                  fclass.s     a6, fs6
                  xor          ra, tp, t3
                  fcvt.w.s     zero, fa2, rne
                  srai         t6, s0, 29
                  remu         s8, t5, s2
                  srli         a7, ra, 17
                  fmax.s       ft5, fs10, ft1
                  fsgnjn.s     fa4, ft7, ft8
                  sra          t4, a7, gp
                  ori          tp, a6, 1071
                  srli         t6, s3, 3
                  mulhsu       t6, s3, a3
                  feq.s        t1, fa1, fs1
                  slti         t4, s10, 1024
                  divu         a0, s4, s7
                  sub          s5, gp, a1
                  fmin.s       fs0, fs1, fa4
                  lui          a1, 32910
                  fcvt.s.wu    ft1, s8
                  fsgnjn.s     ft10, fs10, fa3
                  mulhsu       s9, t0, s4
                  fmin.s       ft6, ft4, ft0
                  add          t3, t2, s2
                  divu         t0, gp, s5
                  nop
                  ori          tp, s3, 1350
                  fmul.s       ft0, fa6, fs2
                  srli         a1, t5, 20
                  slt          a2, zero, tp
                  sltu         s5, s6, s6
                  or           s10, s9, s6
                  srli         t3, gp, 22
                  fmv.x.w      s11, fs1
                  fmv.x.w      a2, ft10
                  divu         zero, a7, a4
                  remu         s4, s7, s8
                  mulh         a1, s5, s9
                  divu         s10, s2, s5
                  ori          t3, a4, -799
                  fsgnjn.s     fa2, ft7, fs9
                  slt          t0, a1, ra
                  fcvt.s.w     fs10, s3
                  fmv.x.w      s8, fs9
                  fmin.s       ft4, fa4, fs3
                  slli         t0, s3, 8
                  slti         s2, a0, 1461
                  and          ra, t4, s6
                  fsgnjx.s     fs11, fs6, fa6
                  xor          a3, sp, a5
                  mulhu        zero, t4, s3
                  fcvt.wu.s    a5, ft9, rup
                  auipc        zero, 258255
                  srl          a2, a4, s6
                  div          s10, a3, s2
                  fdiv.s       ft6, fs8, ft2
                  fsgnjn.s     ft3, fs8, fs7
                  mulhu        t2, s1, a6
                  divu         s9, t0, t0
                  feq.s        s11, ft10, fs9
                  ori          s6, s7, -406
                  srl          a4, sp, gp
                  rem          s4, s9, t5
                  feq.s        s4, ft10, fa4
                  mul          t5, s6, a1
                  fle.s        a5, ft11, fs9
                  sltu         a6, ra, s3
                  lui          s8, 610957
                  slti         s7, s1, 1434
                  fsqrt.s      fa3, ft6
                  sra          a5, a1, s3
                  slti         s8, s1, 717
                  fmin.s       ft3, fa3, ft0
                  sub          s2, s8, t1
                  fcvt.s.w     fs4, a0
                  nop
                  add          s2, a5, s5
                  mul          zero, a4, s4
                  divu         s9, s5, s3
                  mul          s8, t6, gp
                  fadd.s       fa2, ft8, ft2, rmm
                  sra          s5, s5, sp
                  andi         ra, s3, 486
                  fsqrt.s      ft9, fs5
                  xori         s0, s2, -420
                  fsub.s       fs1, fa0, fa7
                  fmin.s       ft5, ft10, fa6
                  fdiv.s       fs4, fs0, fs0
                  div          t4, sp, ra
                  ori          zero, s1, -1844
                  sub          t3, sp, a0
                  fdiv.s       fs1, fa0, fs5
                  srl          t0, s2, t4
                  mulhsu       t2, s2, a5
                  sltiu        a6, a0, -1337
                  fclass.s     t0, ft10
                  sll          s9, t5, a2
                  fclass.s     s5, fs2
                  andi         s8, s11, 873
                  fsqrt.s      ft0, fs10, rtz
                  lui          a3, 489171
                  sltiu        s9, a1, -1846
                  mulhsu       a2, a7, t4
                  fsub.s       fs2, ft10, fs10
                  fsqrt.s      fa0, ft2, rne
                  xor          a6, s7, zero
                  fdiv.s       ft2, ft10, fs1
                  lui          s5, 877273
                  srai         s7, s8, 23
                  sll          s11, s6, ra
                  and          a0, t4, s5
                  srli         t4, a0, 11
                  slti         a7, tp, 824
                  fmax.s       ft10, fs7, ft1
                  auipc        a0, 625038
                  nop
                  add          s7, t3, a3
                  addi         s2, tp, -759
                  divu         a1, s0, t2
                  srli         a0, ra, 30
                  sltu         a6, t1, t5
                  ori          t1, a0, -457
                  fmul.s       ft3, ft2, fs2, rne
                  auipc        t6, 485689
                  srli         s9, a4, 22
                  div          t2, t1, s1
                  div          t6, s6, s11
                  nop
                  divu         a3, t5, sp
                  divu         s0, s2, zero
                  fsgnjx.s     fa1, fa5, ft7
                  remu         a2, s3, a2
                  fsqrt.s      ft8, fa0, rup
                  nop
                  and          zero, s6, a5
                  srli         t1, a4, 4
                  xori         s5, a0, 2
                  fle.s        a5, ft8, ft7
                  sub          s7, a4, s4
                  fsgnjx.s     ft3, ft8, fa4
                  mulhsu       a6, s11, s3
                  fsgnjx.s     ft6, fs5, fa6
                  andi         t5, s10, 1797
                  sll          a2, s10, ra
                  flt.s        a4, fs5, fa0
                  auipc        zero, 141869
                  fcvt.s.w     fs2, a5
                  fcvt.s.w     fs6, ra, rtz
                  rem          s10, s7, a4
                  nop
                  xori         ra, a1, 1826
                  add          t2, s7, sp
                  sra          s9, a1, a3
                  rem          t6, a5, a0
                  add          t3, a3, s7
                  fmin.s       ft7, ft9, ft0
                  slli         a5, s11, 16
                  andi         a2, t0, 1914
                  fsgnjn.s     ft5, fa5, fs11
                  divu         s7, s8, sp
                  fsgnj.s      fs11, fa0, fa6
                  mulhu        a0, t5, t1
                  and          a1, s2, ra
                  sll          a6, a5, a0
                  fsub.s       fs5, fa3, fa0, rtz
                  div          a4, s2, a3
                  fcvt.s.wu    ft3, s9
                  flt.s        a5, fa1, fs9
                  xori         a6, a7, 1061
                  auipc        t4, 763549
                  fmax.s       fa6, fa3, fs2
                  fadd.s       ft5, fs11, fa3, rup
                  srl          s8, a7, t0
                  xor          s4, s0, zero
                  fmv.x.w      s6, fs11
                  xori         t3, s0, -1219
                  fle.s        t2, fs10, ft0
                  sra          t3, s7, s10
                  or           a6, tp, tp
                  fcvt.s.w     ft1, s2
                  fmin.s       fs2, ft6, fs8
                  sub          zero, s2, s6
                  mulh         t6, s2, a4
                  xor          a0, a6, s0
                  flt.s        a2, ft5, fa2
                  divu         a4, t2, a5
                  sub          t5, s6, a7
                  srai         tp, t4, 6
                  auipc        s6, 609256
                  mulhu        a1, a6, a1
                  and          gp, t6, a7
                  and          t1, a7, s2
                  slt          a5, s1, t3
                  fmax.s       fa3, fs1, fa3
                  srli         tp, a2, 10
                  fcvt.s.wu    fs3, s2
                  and          a1, t6, t1
                  slti         a1, s6, -1679
                  sra          s8, s1, t1
                  fsgnjx.s     fs0, fa3, fs9
                  fmv.w.x      ft1, s9
                  slli         t6, a1, 21
                  fle.s        t4, ft10, fa1
                  fmv.w.x      fs10, a4
                  fcvt.s.wu    fa1, t3
                  fsgnj.s      ft11, fs8, fs6
                  fmul.s       ft3, fs8, fs6, rtz
                  feq.s        a5, fs4, ft2
                  fmv.x.w      t6, fs10
                  mulhsu       s4, t5, zero
                  mulhsu       t0, t3, s1
                  flt.s        t6, fs4, fs0
                  sra          s10, s8, a4
                  div          a1, a3, sp
                  fcvt.s.w     fs4, t4, rne
                  sra          s4, t6, a2
                  flt.s        t2, fa0, fs3
                  divu         a0, t3, a6
                  slti         t3, t1, 1205
                  and          s9, s3, a4
                  auipc        tp, 414335
                  fcvt.s.wu    ft10, s6
                  srli         a0, s8, 10
                  fsqrt.s      ft2, ft4, rtz
                  fcvt.w.s     a1, fs3
                  fsgnjn.s     fs11, ft2, fs11
                  slt          tp, s0, t0
                  slt          ra, tp, t3
                  fmv.w.x      fa1, s10
                  fcvt.wu.s    s6, ft6, rmm
                  xor          s5, s7, s5
                  rem          t2, t6, gp
                  sltu         s8, ra, sp
                  slt          s6, s4, a7
                  rem          ra, s4, s9
                  add          t6, a5, s8
                  sub          t6, t2, a0
                  flt.s        s7, fs8, fs5
                  and          t3, t6, s9
                  slti         t2, s3, -634
                  rem          t1, s1, t1
                  rem          s11, sp, t6
                  sra          a6, t1, t1
                  sltiu        s7, a4, 442
                  fcvt.s.wu    ft2, sp, rup
                  fsgnjn.s     fs5, ft5, fs4
                  xor          t4, ra, a3
                  fcvt.s.w     fs9, t6, rup
                  srai         s10, s6, 0
                  fmin.s       fs5, fs0, ft3
                  fsgnjn.s     fs8, fs6, ft6
                  auipc        a7, 19695
                  fcvt.w.s     s7, ft9, rup
                  fsgnjx.s     ft9, fs1, ft11
                  fsgnj.s      ft11, fs4, ft5
                  remu         s6, a2, a3
                  andi         zero, tp, -90
                  srl          a5, s1, t2
                  fmax.s       fa7, fa5, ft6
                  mulhsu       tp, a5, zero
                  fdiv.s       fs0, fs11, fa4, rup
                  mul          s11, t1, t1
                  sra          zero, s11, t4
                  fsqrt.s      fs2, fs4
                  fmv.x.w      ra, fs7
                  feq.s        ra, ft10, fa3
                  slli         s11, t2, 16
                  fsgnjn.s     fs8, fs4, fs10
                  slt          a4, s2, a6
                  srai         t1, s2, 29
                  fcvt.s.wu    ft8, s5
                  sub          a3, t1, a7
                  fdiv.s       ft5, ft10, fs2, rup
                  flt.s        t3, ft3, fs2
                  fcvt.s.w     ft9, s8
                  slli         a7, s0, 9
                  sltu         a5, ra, t0
                  slli         ra, sp, 3
                  sltiu        a3, ra, 973
                  mulhu        a6, s0, a5
                  fmax.s       fa5, fs8, fa4
                  sub          a0, s0, gp
                  mul          t4, gp, t2
                  div          t2, t2, s3
                  srli         s4, t0, 8
                  fclass.s     t3, fa5
                  srai         s0, t5, 8
                  lui          s2, 50142
                  divu         a5, s10, t4
                  fmv.w.x      ft8, s0
                  fmv.w.x      ft11, sp
                  fcvt.w.s     s0, fa7, rne
                  fcvt.w.s     s5, ft3, rdn
                  fdiv.s       fs9, fs10, fs9, rne
                  slli         t6, t4, 4
                  nop
                  fcvt.s.w     fs11, t1
                  mulhu        t1, t3, s4
                  divu         a5, s11, a4
                  fmin.s       ft3, fs6, fs9
                  mulhsu       ra, s5, a5
                  fle.s        a2, ft3, fs1
                  slli         tp, zero, 8
                  slti         a6, s4, -605
                  fmin.s       fa0, fs0, fs8
                  feq.s        s5, ft7, ft11
                  fmin.s       fs5, fa7, fs9
                  mulhu        t1, t0, a3
                  andi         s8, a0, -856
                  remu         a1, s8, s9
                  feq.s        s4, fa1, ft10
                  fadd.s       fa1, fa1, ft10, rmm
                  ori          t0, a5, -2013
                  feq.s        a7, fs1, ft9
                  fsgnj.s      fs8, ft10, fa3
                  fsgnjx.s     fa5, ft9, ft0
                  fsgnjx.s     fs5, fs3, fs0
                  mul          a5, t5, s9
                  srl          t1, s10, s10
                  fclass.s     s0, fa3
                  add          a5, t2, t6
                  fdiv.s       fa1, ft11, ft3, rtz
                  mul          t5, s9, a6
                  fsqrt.s      fa3, fs6
                  fsqrt.s      ft0, fa0, rdn
                  andi         t6, gp, -1877
                  fadd.s       fa5, fa3, fs0, rne
                  fsgnjx.s     fs0, ft9, fs10
                  nop
                  fcvt.s.wu    ft10, t4, rdn
                  andi         t6, t3, 1379
                  andi         a1, a6, 373
                  srl          gp, a4, a1
                  remu         a4, t3, t4
                  nop
                  flt.s        t4, fa2, fs2
                  nop
                  srai         a4, a7, 11
                  slli         tp, sp, 2
                  fclass.s     a6, fs0
                  fle.s        ra, ft5, fa0
                  sltu         t2, a4, a3
                  fsub.s       fa3, fa2, fs9
                  mulhu        a4, s2, s9
                  fsqrt.s      fa4, fs2
                  fmv.w.x      fs9, t4
                  fcvt.s.w     ft9, t6
                  slti         t6, t5, -583
                  or           s9, a5, t0
                  fdiv.s       ft2, fa3, ft1
                  srai         t3, s8, 16
                  sltu         t3, gp, a5
                  fmax.s       ft3, fa1, fa3
                  srli         s7, t3, 31
                  lui          t0, 868423
                  mulhsu       t1, gp, s3
                  fmul.s       fs2, fs8, ft5
                  srli         s0, t3, 6
                  mulh         a2, a0, t6
                  rem          s5, gp, t6
                  fmin.s       fs9, ft2, ft9
                  or           s4, s5, s7
                  fmul.s       ft0, fa6, ft8, rtz
                  sll          t4, t2, t1
                  fsqrt.s      ft6, fs11, rne
                  lui          t4, 432030
                  fle.s        s10, fa7, ft7
                  fmin.s       fs4, ft0, fs11
                  xori         a5, gp, -583
                  or           a7, t4, a6
                  divu         gp, sp, s1
                  srli         a4, s7, 30
                  fsgnj.s      fa1, fa4, ft11
                  mulhsu       a2, s9, s5
                  slti         s7, s8, 1974
                  divu         zero, t4, a5
                  lui          s9, 334778
                  div          t5, s3, t5
                  divu         s6, s2, t0
                  xori         a2, a6, 1576
                  divu         t0, sp, s4
                  sll          s0, s4, t2
                  sub          t3, s5, a4
                  and          s5, gp, a4
                  mulhsu       s0, s4, t1
                  and          s7, a7, a2
                  fsgnjn.s     ft11, fs8, ft7
                  fsgnjn.s     ft11, fs4, ft1
                  xori         s6, s2, -1805
                  fsgnjx.s     ft6, fs7, ft4
                  fsgnj.s      ft5, ft1, ft3
                  fmv.x.w      s7, fa7
                  auipc        zero, 88048
                  add          tp, sp, t6
                  sltu         a7, ra, s8
                  slti         s4, gp, -1392
                  fmax.s       ft8, fa7, fs6
                  xori         s0, s11, -1852
                  fsub.s       fs6, ft2, fs0
                  fdiv.s       fs0, ft4, fs4, rdn
                  add          a7, sp, t5
                  sra          s10, t4, a0
                  rem          a1, s9, t6
                  rem          a2, a7, a4
                  fcvt.s.w     fs6, t1, rne
                  srai         t5, a1, 20
                  fmin.s       fs7, fa7, ft9
                  fadd.s       fa4, fa6, ft7, rmm
                  fsgnjn.s     fs7, fs6, ft5
                  sub          zero, t4, zero
                  mulh         t3, t0, s5
                  addi         s11, s8, 424
                  xor          a7, s6, a1
                  xor          t1, s3, t3
                  srl          s9, gp, t3
                  sll          a5, s10, t6
                  srli         s6, t5, 23
                  fsqrt.s      ft10, ft11
                  fcvt.s.wu    fs5, sp, rtz
                  auipc        zero, 1017754
                  fsgnjn.s     fs0, fa4, ft8
                  slli         t2, gp, 19
                  fmv.w.x      ft3, a4
                  sra          t1, t5, s8
                  remu         tp, t6, t5
                  xor          a3, a5, s3
                  fmv.x.w      t4, ft10
                  sltiu        a0, a6, 1183
                  slli         s9, a1, 9
                  ori          s11, a7, -572
                  feq.s        t2, ft7, fa0
                  sll          a4, s2, a1
                  remu         s0, a3, tp
                  srai         a6, s7, 23
                  fmv.x.w      s5, fs3
                  fdiv.s       ft5, ft4, fs2
                  sltiu        s11, s1, 1593
                  fcvt.wu.s    a2, fa7
                  sub          s11, s3, s5
                  ori          tp, s2, 1648
                  ori          t4, t6, -1940
                  mul          a3, a6, s5
                  fmin.s       ft10, fa3, fs0
                  mul          s6, a1, ra
                  fsgnj.s      fs9, ft2, fs9
                  remu         t2, t5, a2
                  ori          a1, a3, -1193
                  fmv.x.w      a7, fs3
                  andi         a1, t3, -397
                  fclass.s     a4, ft10
                  sra          s11, s11, a3
                  xor          s10, t3, a0
                  fadd.s       ft3, fs5, fa7
                  srl          a4, s2, a3
                  fmin.s       fa5, fa6, ft4
                  sll          a6, a4, gp
                  lui          t0, 717419
                  remu         a5, t1, s6
                  div          a2, s7, s6
                  andi         tp, t1, -1378
                  slli         a6, sp, 19
                  fadd.s       ft10, fs10, ft3
                  mulh         a1, sp, s5
                  andi         s10, t5, -1554
                  feq.s        a0, ft11, fs8
                  rem          a4, s5, s1
                  sll          a4, gp, a6
                  fcvt.w.s     a0, ft10
                  flt.s        s8, fa5, fa3
                  srli         a4, s8, 18
                  xor          s6, a1, a1
                  mul          zero, s7, s0
                  fsub.s       fs8, fs5, fs7, rmm
                  fcvt.wu.s    s11, fa3, rdn
                  fmul.s       fa0, fa4, fs8, rtz
                  sub          s5, s5, a2
                  mul          s11, t0, a6
                  remu         gp, a4, tp
                  fsgnj.s      ft11, fa5, ft5
                  fmin.s       fa1, ft3, fs6
                  sltu         t2, a1, zero
                  addi         a1, t5, 1581
                  nop
                  fmv.w.x      ft2, s1
                  fmin.s       ft2, fa0, ft1
                  sltiu        t0, s9, -576
                  ori          a5, a0, -1553
                  fsgnj.s      ft0, fs8, ft0
                  fsqrt.s      fa6, fa3
                  fmv.x.w      s6, fa1
                  mulh         t2, t5, s11
                  srli         s5, s10, 29
                  fsgnjn.s     fs2, fa2, ft7
                  fadd.s       ft6, fs3, fs9, rdn
                  fmv.w.x      fa7, s3
                  fmv.w.x      ft4, s6
                  remu         t4, a7, ra
                  sltiu        t5, s4, 491
                  rem          s5, a3, t1
                  fsqrt.s      fa0, ft8
                  ori          a2, t4, -37
                  and          zero, a4, zero
                  fmv.w.x      ft9, s1
                  sra          s10, s1, t4
                  xori         s10, a4, 1026
                  mulhu        s11, a7, s11
                  fmin.s       fa7, fs2, ft10
                  auipc        a4, 979019
                  andi         s10, a0, 656
                  ori          a6, s3, -37
                  fclass.s     tp, ft1
                  fsqrt.s      fs6, fs11
                  fcvt.wu.s    gp, fs6, rmm
                  fcvt.s.wu    fa0, t5, rup
                  fsgnjx.s     fs11, fs1, ft2
                  fsgnjx.s     fs5, fs5, fs10
                  fdiv.s       fs0, fs1, fs5, rne
                  sltiu        s0, tp, 1756
                  fmax.s       ft10, ft8, ft0
                  mulh         tp, s8, a0
                  slt          s8, s11, t5
                  srai         a4, a1, 14
                  mul          s6, s10, a2
                  mulhsu       a3, sp, t6
                  sltiu        zero, s5, 1683
                  fle.s        t1, fa0, ft7
                  slli         tp, a1, 19
                  fmul.s       ft2, ft10, fs10
                  mulh         s11, t6, a3
                  fsgnj.s      ft10, fa1, fs0
                  fsqrt.s      ft0, ft2, rtz
                  remu         a0, s2, t6
                  and          t6, t3, t0
                  rem          a0, a1, t1
                  sltu         a7, s5, s10
                  srai         t1, s3, 24
                  remu         gp, s5, a2
                  remu         t6, zero, s10
                  mulh         a3, s6, ra
                  fclass.s     s6, fs0
                  rem          s6, t2, t4
                  div          s10, a1, a3
                  or           t0, s4, a0
                  fadd.s       fa2, ft4, fs1, rne
                  fmv.x.w      s4, fs10
                  fmv.x.w      s0, fs11
                  auipc        s9, 448645
                  fadd.s       fa5, fs10, fa1, rne
                  fmv.x.w      ra, ft3
                  xor          gp, a6, s7
                  sltiu        a3, zero, 222
                  flt.s        t3, fa1, ft1
                  fcvt.s.w     fs6, s7
                  fsqrt.s      ft9, ft9, rne
                  mulh         s6, a5, s3
                  andi         s2, s8, 430
                  slli         s5, t1, 0
                  or           t1, ra, a1
                  fsgnjn.s     fs8, fs8, fs0
                  remu         a5, gp, s0
                  sltiu        s2, a1, -1468
                  mul          a0, t3, s6
                  fsub.s       fs5, fs0, ft7, rdn
                  andi         s6, s5, 1570
                  flt.s        ra, ft3, fs7
                  fmul.s       fs5, fa2, ft2
                  sra          a1, s9, s1
                  andi         a0, a7, -1892
                  addi         a6, gp, -98
                  fsgnjx.s     ft0, ft4, fs6
                  auipc        a6, 439761
                  andi         s8, a4, 1448
                  fmv.x.w      s2, fa4
                  flt.s        a2, ft11, fa1
                  sra          a7, a3, a4
                  flt.s        a0, ft2, fs5
                  sub          ra, a6, s7
                  divu         a6, s2, tp
                  mulhu        gp, s4, tp
                  sra          t3, t6, s8
                  xor          t0, a6, a7
                  sltiu        t4, s2, 1272
                  feq.s        s7, fs0, fa6
                  mul          t6, a4, s4
                  lui          t6, 842571
                  fadd.s       fs5, ft4, fs11
                  fcvt.wu.s    gp, fs5
                  add          s9, s7, a1
                  add          t3, t1, t6
                  slti         t2, s4, -520
                  xor          a5, s0, t0
                  fsgnj.s      fa3, fs5, fs4
                  fmv.w.x      ft1, s10
                  xori         s8, s11, -1389
                  ori          ra, a1, 1508
                  div          s5, t6, a3
                  lui          a2, 168151
                  xori         a1, tp, 743
                  remu         s5, s11, s6
                  srli         a1, a0, 24
                  slli         t2, t4, 28
                  mul          s10, s0, s7
                  fmax.s       ft4, ft2, fa5
                  fsgnj.s      fs8, fa7, fa4
                  auipc        s4, 661222
                  feq.s        s7, fs8, ft5
                  sltiu        s4, t5, -57
                  lui          s5, 705800
                  fmv.w.x      fs9, a1
                  fcvt.s.wu    fs2, t3
                  xor          tp, zero, zero
                  srai         s9, a6, 31
                  xori         s11, s10, -811
                  add          s5, a6, a5
                  fcvt.s.w     fa2, a4
                  slt          a6, s6, a0
                  srai         a1, t4, 29
                  mul          a3, tp, s3
                  fadd.s       fa1, fs3, fs6
                  feq.s        a3, fa2, ft10
                  fmin.s       ft2, fs0, fs1
                  divu         s6, a5, ra
                  and          s11, a3, t0
                  div          a4, a4, t4
                  andi         tp, ra, -22
                  fsgnj.s      ft5, fs11, fs0
                  divu         s7, s1, t0
                  nop
                  fcvt.w.s     tp, fa3
                  mul          a1, a7, a7
                  mul          ra, t4, t3
                  srl          t0, s1, s2
                  mul          s0, ra, s5
                  mulh         s7, s0, sp
                  mulhu        a3, sp, s3
                  rem          ra, a4, a5
                  feq.s        a3, fa7, ft6
                  flt.s        s5, fs2, ft5
                  fmv.w.x      fs6, sp
                  fcvt.wu.s    s10, fs2, rne
                  mulhu        s5, gp, t0
                  fsgnjx.s     ft5, fa0, ft9
                  srl          a0, t0, a1
                  feq.s        s5, fs3, fs1
                  xori         s0, s9, -843
                  srli         tp, s5, 5
                  fmv.x.w      s7, fs3
                  mulhsu       t0, a7, s9
                  mulh         a2, s3, s3
                  fcvt.wu.s    a4, fs1, rdn
                  fmul.s       fs0, fa6, ft10
                  mulh         a6, s9, t3
                  flt.s        a4, fs4, fa3
                  fsgnjx.s     fa0, ft10, fs2
                  sltu         s0, t5, a1
                  fsgnjn.s     fs9, ft6, fs6
                  fcvt.wu.s    zero, fs10
                  or           a4, s10, s0
                  sub          s9, t5, ra
                  slti         s5, zero, -836
                  fmin.s       fa3, fa0, ft1
                  addi         zero, s9, -1968
                  fcvt.s.wu    ft5, t6, rdn
                  fsgnjx.s     fs10, fs4, fa7
                  slti         a3, t6, 702
                  xor          t4, ra, t5
                  xor          t1, t5, a4
                  sll          t5, gp, s11
                  fsgnjx.s     fs5, fa7, fs11
                  mulhsu       t5, s0, s11
                  srl          a3, s7, a7
                  rem          t2, tp, t2
                  nop
                  slti         a6, t0, 1549
                  add          t1, tp, tp
                  add          a0, ra, t5
                  and          t4, a0, s9
                  xori         a3, a3, 1603
                  mulh         s5, t4, sp
                  fmul.s       fa3, fs4, fs7, rdn
                  mulh         s11, s11, s11
                  slti         a1, sp, 1475
                  or           t3, t6, t6
                  srai         t2, s10, 29
                  fsqrt.s      fs3, fs5, rmm
                  fsgnjn.s     fs7, fa4, fa5
                  sll          a6, t2, s4
                  fcvt.w.s     t3, fs11, rmm
                  srl          t2, gp, s4
                  sub          a6, s3, t1
                  mul          s10, a0, s10
                  addi         t5, tp, -1786
                  remu         s8, a3, t0
                  flt.s        t2, fs9, fa0
                  fmv.w.x      ft10, ra
                  srl          a2, t3, a5
                  lui          ra, 724025
                  fsgnj.s      ft7, fa0, fa5
                  fadd.s       fs9, ft0, fa7, rup
                  remu         a0, t4, zero
                  feq.s        s8, fs6, ft11
                  xori         s11, tp, 720
                  sra          ra, a1, a0
                  sll          s11, s2, a5
                  slt          t2, s8, a5
                  fsgnjx.s     ft9, fa7, ft1
                  addi         a0, a5, -1989
                  auipc        a0, 19514
                  fcvt.s.w     ft2, s10
                  fsqrt.s      ft10, ft3
                  fadd.s       fs4, fs6, fs1, rdn
                  fcvt.s.w     fs7, sp, rtz
                  fcvt.s.wu    ft2, gp
                  remu         s6, s11, t2
                  fsqrt.s      fa0, fa0
                  sra          s6, s9, sp
                  and          t3, s6, s4
                  lui          a6, 898799
                  slti         a5, a3, 1677
                  fcvt.s.w     ft7, t2
                  sll          a5, t3, s11
                  fsub.s       fs7, ft6, fs7
                  fcvt.s.wu    fa6, zero
                  feq.s        a1, ft9, fs3
                  fcvt.s.wu    fa0, s6
                  fclass.s     s5, fa4
                  mul          a7, a1, a4
                  fmv.w.x      ft11, t0
                  nop
                  fsub.s       ft4, fs5, fs3
                  flt.s        a1, fs2, ft10
                  auipc        a7, 169116
                  fclass.s     ra, ft7
                  fle.s        ra, fa6, fs1
                  fle.s        tp, ft0, fa1
                  slti         s0, s11, -411
                  fsub.s       ft9, fa3, fs6
                  sll          s2, a7, s2
                  auipc        a3, 330788
                  srai         a0, a7, 31
                  fsub.s       fa7, ft5, fs10, rdn
                  rem          a2, zero, s11
                  slli         s6, s11, 26
                  fcvt.wu.s    a7, fa5
                  fadd.s       fs3, ft11, fs2
                  sra          gp, s5, s9
                  fle.s        a0, fs4, ft2
                  div          s10, t4, a0
                  fsgnjx.s     fa6, ft0, fa1
                  fsgnjx.s     fs8, fs0, fs10
                  fsgnj.s      fa6, ft3, fs10
                  fcvt.s.w     fa0, zero, rup
                  fcvt.s.w     fs2, s11
                  srai         a4, t5, 18
                  fmv.x.w      a1, fs8
                  mulhu        t1, a5, a3
                  srl          s8, tp, gp
                  slt          t4, ra, s4
                  addi         zero, s0, 675
                  fsgnjx.s     ft4, ft5, fs3
                  fdiv.s       fs8, fa3, fa5
                  fle.s        a2, ft0, ft11
                  fmin.s       fa2, fs6, fs0
                  feq.s        t0, fs2, fs11
                  rem          t4, s2, ra
                  fdiv.s       fa1, fs5, ft2, rmm
                  slli         a2, t2, 30
                  sll          t4, t3, s3
                  ori          t6, s3, -1752
                  divu         a4, s8, a3
                  mulhu        s11, a5, s5
                  fmax.s       ft1, fa6, ft3
                  fle.s        t5, ft0, fa2
                  fcvt.wu.s    t1, ft6
                  slli         t4, s6, 22
                  add          s8, t6, zero
                  fcvt.wu.s    a0, ft4
                  add          s5, s4, s11
                  xori         s9, a5, 924
                  mulhu        t3, ra, s2
                  feq.s        t6, fs8, fs2
                  fcvt.s.wu    ft8, a5, rtz
                  fadd.s       ft2, fs8, fa6, rup
                  auipc        t1, 279821
                  fmax.s       fa4, fs1, fa6
                  fdiv.s       ft10, ft2, ft5
                  slti         s0, s6, 3
                  srli         t2, a4, 10
                  srli         zero, a7, 30
                  fmul.s       fs6, ft0, ft1
                  sltiu        s6, t1, -645
                  lui          s11, 262523
                  ori          s0, t4, 874
                  divu         a2, gp, tp
                  addi         a6, t5, 1772
                  xori         a4, s11, -1893
                  fmin.s       ft5, fa4, fs0
                  nop
                  ori          s5, a1, 328
                  fle.s        t2, fs6, ft7
                  remu         a2, gp, s7
                  fmv.x.w      gp, fa6
                  addi         tp, s10, 425
                  sltiu        s6, s9, -1456
                  fcvt.s.w     fs6, a6, rmm
                  slt          s10, a5, t5
                  nop
                  feq.s        a5, fs6, ft0
                  lui          s8, 462548
                  srai         a0, s10, 9
                  and          a4, a2, a2
                  ori          s7, s3, 925
                  fmv.w.x      fa4, s3
                  fcvt.w.s     a3, fa1, rne
                  fsqrt.s      fa4, fa6, rup
                  mulh         s0, zero, t4
                  fcvt.s.w     fs6, a7, rdn
                  sltiu        s7, s9, -376
                  mulhu        s8, t5, t0
                  flt.s        a6, ft4, fs7
                  fsgnj.s      ft8, fs4, ft10
                  and          zero, s10, a7
                  div          a6, t6, a5
                  fsgnjn.s     fa6, ft9, fa1
                  fcvt.s.wu    fs11, t0, rup
                  fadd.s       fs8, fa5, fs10, rtz
                  sltiu        t0, a1, 281
                  mulhu        tp, a3, gp
                  lui          a3, 947763
                  sltu         s11, t2, a6
                  fle.s        a4, fs5, ft2
                  fcvt.w.s     a4, fs4, rup
                  mulhsu       ra, s8, a5
                  addi         a0, s11, -963
                  fmul.s       ft0, ft6, fs2, rmm
                  sltu         s10, t5, s8
                  fmv.w.x      ft4, t6
                  fcvt.s.w     fs5, a1, rmm
                  fmin.s       ft0, ft7, fs5
                  mulhu        a5, t0, t3
                  sltiu        gp, a7, 915
                  mulh         t6, a7, tp
                  sub          t5, s1, t2
                  fmin.s       fs7, fa0, ft7
                  fsgnjn.s     fa4, ft10, ft0
                  fmv.x.w      t5, ft9
                  fsgnj.s      ft4, ft7, fa6
                  remu         a1, s10, sp
                  fsgnjn.s     fa4, fa2, fs6
                  lui          t4, 931284
                  fsub.s       fs9, ft0, fs3, rup
                  sltu         s6, a7, zero
                  srli         a0, t0, 10
                  fsgnjx.s     fs4, ft9, fs6
                  fcvt.s.w     fa2, a1, rmm
                  addi         t6, t1, -1614
                  fsqrt.s      fs11, ft6, rmm
                  fle.s        s9, fs3, fs10
                  remu         t6, s10, a7
                  mulhu        t1, s11, s7
                  addi         s7, t2, -767
                  slti         a5, a1, 721
                  fmul.s       ft8, fs7, ft10
                  feq.s        s0, fs5, fa4
                  fcvt.wu.s    s11, ft2, rtz
                  fsgnj.s      fa4, fs11, fs7
                  addi         t1, a3, -1713
                  fclass.s     ra, ft11
                  fsub.s       fa7, fs9, fs1, rup
                  fmv.w.x      ft0, s6
                  sll          s7, s2, a3
                  auipc        s5, 348417
                  mulh         t4, a5, ra
                  rem          s6, t6, s5
                  fsgnj.s      fa6, fs4, fa3
                  fcvt.w.s     s8, fs2, rne
                  and          s5, gp, s10
                  fmv.x.w      t3, fa6
                  add          zero, sp, sp
                  addi         s8, a5, 275
                  remu         s4, a4, s10
                  fmax.s       fa6, fs1, ft2
                  lui          s5, 715653
                  srl          s0, ra, sp
                  fcvt.s.wu    ft2, s8, rmm
                  and          s10, s0, s4
                  mulhsu       s6, s7, a7
                  lui          s4, 1036156
                  fmax.s       ft5, ft10, fs1
                  fsub.s       fs9, ft10, fa7
                  and          a0, t1, t1
                  nop
                  fdiv.s       fs7, fs7, fs8, rmm
                  fcvt.s.wu    fs11, a0, rup
                  lui          a4, 390688
                  or           s7, t6, a3
                  div          s6, s4, a5
                  lui          t3, 520579
                  fcvt.s.wu    fa0, zero
                  and          a3, sp, gp
                  fmv.w.x      ft9, s0
                  mul          s8, s10, t0
                  remu         s9, s9, a5
                  srl          a4, a7, s10
                  fsgnjn.s     ft6, ft0, fs4
                  add          a4, s11, s5
                  xori         t0, s0, -38
                  slti         s11, s6, -1607
                  srai         a0, a4, 12
                  addi         ra, tp, -1723
                  srai         zero, tp, 8
                  xor          a3, s11, gp
                  srl          s9, s2, s0
                  mulh         s0, t0, s3
                  fsgnjx.s     ft1, fa0, ft11
                  fsub.s       ft0, fs10, ft3, rne
                  fmin.s       ft0, fs9, ft3
                  and          s11, a7, s6
                  slli         a3, a2, 31
                  slt          a5, ra, s5
                  fmax.s       fa1, fs4, ft6
                  and          a5, t5, sp
                  rem          t1, ra, s8
                  add          t2, s4, a6
                  mul          t5, s2, a4
                  andi         s2, a0, -825
                  fmul.s       fs11, ft6, fs7, rup
                  fmv.x.w      s2, fa3
                  fsgnjn.s     ft6, ft7, fa2
                  fcvt.s.w     fa1, s1
                  slt          a2, a6, sp
                  remu         s9, a1, gp
                  feq.s        a2, fa1, fs5
                  addi         s10, a1, 384
                  add          a1, t0, zero
                  lui          t4, 1023596
                  divu         s7, s2, t2
                  auipc        ra, 921117
                  rem          gp, s10, t2
                  flt.s        a3, fa6, fs3
                  fcvt.s.w     ft9, s6
                  nop
                  lui          s8, 297023
                  xor          s2, s10, sp
                  or           a4, a7, zero
                  fsgnj.s      fa3, fs6, fa7
                  slti         s10, a2, -439
                  fmin.s       ft9, fs1, ft10
                  fmul.s       fa3, fa3, fa3, rtz
                  srli         t2, s6, 9
                  divu         s0, s5, gp
                  mul          s0, s2, a4
                  fcvt.w.s     s8, ft2, rup
                  mulhu        t0, t6, t3
                  srai         s6, s10, 10
                  addi         s8, t5, 892
                  sltiu        ra, s8, -675
                  fmul.s       ft0, fs8, ft7
                  remu         a1, t0, a3
                  fcvt.s.wu    fs9, s11
                  fclass.s     a1, fs8
                  nop
                  fsqrt.s      ft7, ft7
                  ori          t5, s7, -766
                  fsgnjn.s     ft0, ft6, ft1
                  xor          a6, t3, s10
                  fmul.s       fs5, fs5, fs6
                  div          s0, s0, sp
                  mulhu        s10, a6, t6
                  srli         a5, a6, 29
                  rem          a2, t1, s0
                  auipc        s6, 191917
                  fsub.s       fa1, ft0, ft4
                  sub          s10, sp, t6
                  flt.s        s0, ft8, fa6
                  sub          t6, gp, sp
                  fsub.s       fa7, ft6, fs5, rup
                  flt.s        s7, ft3, fa1
                  fcvt.s.wu    fa5, a3, rne
                  mulhu        a5, t3, t5
                  div          s2, s8, a3
                  fsgnj.s      ft11, fa5, fs10
                  lui          s10, 500728
                  fmv.x.w      a5, fs7
                  fmul.s       ft4, fa7, fa2, rne
                  slli         s0, s6, 20
                  and          a4, s1, tp
                  xori         s5, s4, 401
                  andi         a4, a3, -314
                  auipc        s2, 445560
                  fcvt.s.wu    fs0, s6, rdn
                  fcvt.s.w     ft10, gp, rne
                  fsqrt.s      fs10, fs8, rne
                  fdiv.s       ft4, fs11, fs6
                  fdiv.s       ft9, ft6, fa2
                  slt          s4, s7, s0
                  divu         a1, s3, tp
                  mulh         s2, s11, tp
                  divu         s0, a5, t3
                  remu         a2, s5, s7
                  fsub.s       ft1, fa5, ft6
                  and          t4, sp, t4
                  fcvt.s.w     fa5, a1, rdn
                  xori         gp, a5, 601
                  andi         t4, s3, -1616
                  srli         tp, sp, 1
                  fmin.s       ft2, fs1, ft4
                  addi         t4, ra, 1548
                  add          tp, s10, s6
                  fle.s        t2, ft3, fs1
                  mulhsu       s2, a4, a4
                  slli         a1, a4, 23
                  sltiu        t6, t5, -1052
                  or           t6, s9, t4
                  fle.s        a1, fs7, fa5
                  sub          s10, a6, t2
                  slli         a4, s5, 20
                  xor          t4, s3, s11
                  divu         t1, tp, a5
                  ori          a5, a7, -1124
                  slti         s4, t6, 397
                  fsub.s       ft9, fa4, fs4, rdn
                  fmin.s       ft3, fa2, fs7
                  fmv.w.x      fs8, s0
                  xor          s10, ra, s1
                  fclass.s     s9, fa7
                  lui          t2, 563293
                  fsqrt.s      fa7, ft4
                  fdiv.s       fs2, fs10, fa5, rtz
                  fle.s        t1, ft4, ft6
                  divu         a0, s10, t1
                  fsub.s       fa1, fs11, ft5
                  sub          s8, t0, t1
                  fcvt.s.wu    fs2, s0
                  mul          a4, t0, a7
                  remu         a7, t6, s8
                  nop
                  div          gp, s5, t2
                  fsqrt.s      ft9, fs3
                  slt          t1, s11, a2
                  mulh         s2, a1, a1
                  fmax.s       ft0, fa3, fa1
                  andi         ra, gp, -1004
                  fdiv.s       ft5, fs3, ft1
                  flt.s        s7, fa7, ft11
                  fmv.w.x      fa0, a0
                  auipc        a1, 376717
                  andi         a3, t5, 1040
                  fcvt.s.wu    fs9, s4, rmm
                  feq.s        s11, fs10, fs2
                  fclass.s     t3, fa1
                  fmul.s       fs3, fa3, fa4, rne
                  fmax.s       ft4, ft5, fs6
                  fmin.s       ft8, ft10, ft2
                  fclass.s     zero, ft3
                  addi         a7, s6, -565
                  fsgnjx.s     ft11, fs5, fs3
                  fcvt.s.wu    ft9, a1, rdn
                  sub          gp, a7, s11
                  slt          t1, a2, sp
                  slti         a3, s1, 189
                  add          s8, s9, s2
                  fle.s        a6, ft1, fs9
                  andi         a7, t0, -627
                  sltiu        s8, tp, 1117
                  fmv.w.x      fs0, sp
                  fcvt.wu.s    t6, ft5, rtz
                  mulhsu       a3, s1, t4
                  sltiu        s2, zero, -74
                  remu         a7, t6, a7
                  fadd.s       fs4, ft4, fa0
                  addi         a2, s2, 584
                  fcvt.s.w     fa4, s6
                  fdiv.s       fa2, fs11, ft3, rdn
                  slli         a1, t2, 8
                  fcvt.s.w     fs5, t4
                  rem          s5, s11, tp
                  feq.s        a1, fa0, fs1
                  fmv.x.w      s10, ft0
                  nop
                  fsgnjn.s     fs8, fs10, fa3
                  feq.s        t5, fa3, ft2
                  slli         a2, t1, 19
                  flt.s        a2, fa1, ft8
                  or           a0, a0, s4
                  nop
                  and          t5, a7, a5
                  fclass.s     s2, fs8
                  fcvt.s.wu    fs1, s0
                  div          s6, a5, a1
                  fcvt.wu.s    t4, fa1
                  fsgnjx.s     fa6, ft4, fs10
                  fmax.s       fa5, ft9, fs8
                  add          a7, sp, s11
                  fdiv.s       ft10, fs2, fa4
                  sll          s8, s9, s6
                  flt.s        zero, fs1, fs3
                  fcvt.s.wu    ft10, t6
                  mul          gp, s7, s4
                  andi         a0, tp, -1074
                  and          s10, a2, t6
                  srai         t1, s2, 12
                  divu         a5, a3, a7
                  rem          t4, a3, s6
                  srl          a0, s10, a5
                  srl          s11, s6, s1
                  sltiu        t3, t1, 1444
                  slli         s11, s0, 11
                  srli         a1, s0, 7
                  slli         a0, s6, 29
                  sub          a7, ra, s4
                  addi         s10, t6, 652
                  rem          s8, s11, s9
                  fsgnjx.s     fa7, ft0, ft7
                  or           t6, s7, s3
                  fcvt.s.wu    ft5, s0
                  andi         s4, t3, -360
                  fsqrt.s      fs6, fa5, rmm
                  srl          a0, a7, a6
                  fmul.s       fs5, ft11, ft1, rtz
                  sra          s10, s10, t3
                  add          a5, s6, a5
                  sll          gp, zero, s1
                  fmax.s       ft1, fs10, fs11
                  fmv.x.w      t6, fs2
                  mulhu        ra, a6, a2
                  srli         t1, t1, 6
                  mul          a7, zero, t3
                  flt.s        t5, fa3, fs3
                  slt          a7, a7, tp
                  fcvt.w.s     t0, ft3
                  or           s9, t1, a1
                  divu         t5, a3, gp
                  fdiv.s       fa1, ft7, fa1, rne
                  fcvt.wu.s    a3, fs11, rtz
                  andi         t5, a0, -723
                  fmul.s       fs0, ft6, fs5
                  fcvt.s.wu    fa4, zero, rne
                  fcvt.s.w     fs9, sp
                  nop
                  sub          a0, sp, s4
                  auipc        zero, 987192
                  fsgnjx.s     fs10, fs8, fs11
                  fadd.s       fs7, ft1, ft6
                  sll          ra, s1, s7
                  slti         a3, zero, -1856
                  fcvt.wu.s    ra, ft4
                  sra          s2, s7, gp
                  fcvt.w.s     s0, fa2
                  mulhsu       a3, a1, a4
                  divu         s7, t5, gp
                  feq.s        t5, fa0, fa7
                  fadd.s       fa7, fa6, ft0
                  fcvt.s.wu    fs4, t6, rmm
                  sll          a0, a2, s10
                  rem          a0, gp, s8
                  ori          a1, sp, 692
                  fle.s        s4, fa5, fa4
                  mulh         a6, a2, s3
                  fle.s        s2, ft4, ft10
                  mulh         t1, a7, s9
                  srli         t4, zero, 28
                  xor          a3, s7, a1
                  slti         s4, a5, -1651
                  sltiu        t3, s1, 223
                  fcvt.s.w     fs8, tp
                  fadd.s       fa0, fa7, ft0
                  srai         a0, s3, 17
                  srl          s8, a6, t2
                  fsgnjn.s     fs8, fs9, fa2
                  fsgnj.s      ft11, ft7, ft2
                  sra          s8, zero, ra
                  fcvt.s.w     fa0, a6, rup
                  nop
                  fcvt.s.wu    ft6, s7
                  fsgnjn.s     fs10, fa0, fs1
                  mulh         t4, zero, t4
                  lui          s9, 390297
                  srli         t5, s9, 31
                  fmin.s       fs1, ft2, fs1
                  fsub.s       fs7, fa3, ft3, rtz
                  add          s10, s0, s10
                  fsqrt.s      fa2, ft3, rne
                  mul          s7, s9, s7
                  slli         t0, s5, 3
                  fcvt.w.s     gp, ft9
                  sll          s4, s10, tp
                  and          a2, zero, t0
                  add          t5, t2, t6
                  mulh         t2, s1, a5
                  fmv.x.w      t6, fs3
                  srai         t4, ra, 28
                  fmv.x.w      s6, fs5
                  srli         a6, t6, 22
                  fsgnjn.s     ft6, fs8, fs9
                  fmv.x.w      s2, ft11
                  feq.s        s6, fa6, ft1
                  fle.s        s11, ft6, fa4
                  srl          s10, s4, a6
                  sltiu        a0, s6, 1029
                  srl          t5, a2, s11
                  addi         a5, s4, 255
                  srli         a2, s11, 16
                  sltiu        a4, s0, 1277
                  sub          t1, ra, s6
                  flt.s        a7, fs5, fs0
                  fmv.w.x      ft0, s7
                  sra          a1, t5, s0
                  slti         s11, a1, 706
                  fcvt.s.wu    fs11, s8
                  srli         a4, a1, 21
                  fcvt.s.wu    fs6, t6
                  fmin.s       ft9, fs3, ft0
                  slti         s9, s3, -602
                  srli         a6, s5, 11
                  fsgnjx.s     ft5, fs1, fs7
                  xori         s2, a2, -613
                  fmv.w.x      fs0, s10
                  sltiu        zero, a0, -1760
                  xori         s0, s3, 1322
                  and          s4, s10, s4
                  divu         t6, a0, ra
                  xori         s10, a5, 1000
                  remu         s5, a7, a3
                  mulhu        s7, ra, a3
                  mulh         a6, a2, a3
                  mul          s7, s2, a0
                  fsgnjn.s     fa0, fa6, ft5
                  fmv.w.x      fs6, gp
                  sll          t4, sp, s10
                  mulh         s7, s2, tp
                  xori         s6, t5, 308
                  or           s7, t2, a6
                  srai         a6, a1, 21
                  srli         s4, s6, 31
                  mulhsu       s2, s4, a6
                  addi         gp, t3, 8
                  andi         ra, tp, -1928
                  srli         t4, t3, 15
                  mulhu        s6, a4, t1
                  mul          a3, s8, a4
                  fdiv.s       fs4, fs5, fa3, rmm
                  fsub.s       ft2, fs9, ft11, rmm
                  sub          s9, s7, a1
                  remu         gp, s1, a4
                  ori          tp, t0, -724
                  mulhsu       t5, a3, gp
                  fdiv.s       fs6, fs7, ft2, rdn
                  slti         tp, a1, -16
                  fcvt.wu.s    a5, fs1
                  sll          t0, s0, a7
                  fclass.s     s0, fa3
                  fmv.x.w      t6, fa7
                  sll          s2, ra, s4
                  xor          s11, a3, a0
                  fdiv.s       fa4, ft0, fs5, rtz
                  fcvt.wu.s    tp, ft3, rtz
                  flt.s        s5, fs10, fs3
                  add          a6, s0, t3
                  xor          t5, a2, s5
                  fcvt.s.w     fs10, t6, rdn
                  remu         t6, a4, t2
                  sra          s5, s11, t1
                  fmul.s       fa1, fa2, fa5
                  fcvt.w.s     a6, ft4
                  andi         s8, s4, -988
                  sra          a5, t5, a1
                  sra          s5, t4, a6
                  lui          t3, 771700
                  fsub.s       fs10, fs3, ft10, rne
                  xor          s0, t6, a3
                  fadd.s       fs2, fa3, ft1, rup
                  slt          t0, t3, t2
                  fcvt.w.s     zero, ft1, rup
                  fmv.w.x      fs4, ra
                  srl          a4, s11, s2
                  xori         a0, s1, -689
                  mulhu        s7, gp, ra
                  fsgnj.s      fa4, fs0, ft2
                  xori         t0, t4, 227
                  and          a0, a2, t2
                  fcvt.s.w     fa3, a4
                  fsgnjn.s     fs5, fs0, fs9
                  srl          ra, a1, a1
                  fsgnj.s      fs11, fs7, ft10
                  remu         tp, t6, a6
                  auipc        t3, 902525
                  srli         s0, t6, 19
                  fmv.x.w      a5, fs10
                  auipc        t2, 158641
                  sub          t4, s9, t0
                  fle.s        s6, fa7, fa5
                  rem          t4, s6, t0
                  fadd.s       fa3, fs7, ft3
                  ori          s9, a3, -1574
                  fsqrt.s      fa7, ft9, rup
                  fmv.w.x      fa4, a6
                  fmv.x.w      t3, fs3
                  mulhsu       s5, ra, a1
                  slti         a1, ra, -1621
                  sub          s11, a7, s9
                  div          s7, ra, t5
                  fcvt.s.w     fs8, a1
                  srai         a0, s5, 8
                  sltu         s9, ra, a2
                  fclass.s     s6, ft5
                  fmin.s       ft3, fs2, ft10
                  rem          t3, s3, s7
                  fmv.x.w      s7, fa4
                  remu         s4, a6, a1
                  fadd.s       fs6, ft0, ft0
                  fmul.s       fs2, ft4, fs2, rmm
                  mul          a2, t3, s10
                  xori         s8, s3, -1902
                  or           a2, a6, s7
                  fcvt.s.wu    ft1, s6
                  div          a0, s4, s11
                  feq.s        s8, fa0, ft8
                  add          ra, s0, zero
                  slti         gp, t0, -820
                  rem          s6, s8, zero
                  ori          s5, a7, -212
                  add          t2, s6, a7
                  mulhu        t4, a3, a6
                  nop
                  xor          a3, t5, s9
                  fsgnj.s      fs6, fs3, ft5
                  flt.s        s2, fa3, fs10
                  divu         s2, a4, s2
                  rem          tp, s5, t3
                  andi         s2, s7, -577
                  rem          s10, s6, s4
                  mulhsu       a2, t2, ra
                  fmul.s       ft4, fs5, ft10, rne
                  fsgnjx.s     fs7, fs5, fa0
                  feq.s        t6, fa7, fs0
                  fcvt.wu.s    t4, ft10, rmm
                  auipc        t3, 618386
                  feq.s        t4, ft0, fa3
                  rem          a0, ra, s2
                  feq.s        s0, fs3, fs3
                  fadd.s       ft9, fs7, fa7, rup
                  sltu         t3, t1, s11
                  fmul.s       fs8, ft0, fs6
                  fcvt.wu.s    s10, ft3
                  flt.s        s10, fs1, fs2
                  fcvt.s.wu    fa6, a2
                  lui          a2, 68728
                  fsub.s       fs5, fa3, fs8
                  sub          s2, s5, a0
                  auipc        a0, 295137
                  srai         t3, t0, 7
                  xor          s4, zero, ra
                  add          a3, s6, s5
                  slti         t3, s1, -1582
                  divu         t1, sp, tp
                  feq.s        zero, ft6, ft8
                  fsub.s       ft6, fs3, fs2
                  fsqrt.s      fs9, ft3, rmm
                  rem          s8, tp, t0
                  flt.s        a3, fa3, ft2
                  fmin.s       ft8, fs4, fs8
                  fdiv.s       fa5, ft3, ft9, rup
                  slti         zero, s11, 1843
                  fadd.s       ft6, fs4, fa5, rne
                  nop
                  flt.s        a1, fs0, fs5
                  slt          s11, t6, a2
                  fsgnj.s      ft9, fs7, fa6
                  fmv.x.w      a5, fa2
                  srli         a2, t3, 31
                  and          a2, t0, t3
                  flt.s        s5, fa7, ft5
                  fmv.x.w      s7, ft3
                  xor          a6, s3, s0
                  div          a5, s10, s3
                  fmv.x.w      a4, fa7
                  slti         a6, gp, -425
                  slt          a0, s7, s7
                  sltiu        ra, a5, 881
                  fle.s        t4, fs3, fs0
                  fsub.s       fa4, fs0, fa3
                  addi         t0, s5, 679
                  or           a2, a0, s7
                  fmax.s       fa2, fs0, ft2
                  fsub.s       fs10, fs0, ft8
                  flt.s        a7, fs7, ft0
                  srl          s0, s3, tp
                  fsgnjn.s     ft5, fa6, ft5
                  andi         a4, s3, 1689
                  sub          a0, s9, t6
                  fcvt.s.wu    ft0, s4, rne
                  sub          gp, ra, s4
                  mulhu        ra, a1, s10
                  fcvt.wu.s    a6, ft10, rne
                  fadd.s       ft10, ft3, fa3, rup
                  slli         t6, a6, 10
                  fmv.x.w      a5, fs5
                  fmax.s       ft2, fa7, ft2
                  addi         s9, s2, -711
                  mulhsu       a0, ra, s5
                  sll          tp, s11, sp
                  fadd.s       ft0, fs8, ft10
                  fclass.s     t6, ft0
                  fmin.s       fs0, fs9, ft9
                  div          s2, a7, s9
                  add          a1, a0, s9
                  remu         s6, ra, tp
                  srli         s5, s10, 31
                  fsgnjx.s     ft2, ft5, fa1
                  andi         gp, ra, -710
                  fsgnjx.s     fs5, ft7, fa2
                  xor          a1, a4, t3
                  xori         s4, s6, 1472
                  slli         a7, t3, 0
                  divu         a1, s5, a2
                  sltu         t4, s0, a2
                  auipc        t0, 148134
                  fmax.s       fs2, fs1, fa3
                  nop
                  fsgnjx.s     fa0, fa1, fs7
                  xor          ra, t5, s1
                  sltu         t2, gp, a0
                  fsqrt.s      fa4, ft7, rne
                  fcvt.s.wu    ft8, t6
                  rem          t2, s6, s1
                  mulhu        a1, tp, t3
                  sub          a4, t3, t3
                  sll          s0, s6, s0
                  mulh         s8, s0, s11
                  fsqrt.s      fs11, fa7
                  slli         gp, a7, 0
                  fmin.s       fa5, fs11, fs8
                  xor          tp, s9, a0
                  fcvt.w.s     a1, ft0, rtz
                  fmax.s       ft11, fs0, fs7
                  rem          a5, s5, s9
                  slli         t3, a2, 22
                  ori          a2, t0, -1381
                  fmv.x.w      a0, fs6
                  mulhu        a7, t6, s8
                  fsub.s       ft2, ft6, fs9, rmm
                  ori          s11, s4, 1941
                  div          t2, t1, s0
                  srli         s7, s1, 18
                  slt          s2, t3, a3
                  ori          a7, t4, -319
                  fsgnjx.s     ft10, ft3, ft5
                  fmin.s       ft7, ft4, ft6
                  flt.s        ra, fa0, fs9
                  sll          s2, t5, gp
                  feq.s        t1, ft2, fs8
                  xor          t2, zero, s0
                  sra          a7, s11, ra
                  fmin.s       ft8, ft10, ft4
                  add          a0, s1, gp
                  sll          a3, s0, s10
                  mulhsu       a6, a4, gp
                  sltu         tp, tp, a4
                  mulhsu       s4, a7, tp
                  nop
                  fsgnj.s      fa7, fa5, ft5
                  rem          a4, t5, a2
                  xori         a3, s6, -1059
                  srli         s8, ra, 31
                  slli         t5, s11, 29
                  fcvt.s.wu    fs6, a0
                  sub          s2, t5, a6
                  slli         s5, s3, 4
                  add          s6, a4, a5
                  mulhu        tp, zero, a3
                  flt.s        s10, ft11, ft0
                  sra          a3, a4, s1
                  mulh         a4, s4, t2
                  sra          tp, t4, a0
                  addi         s9, a7, -841
                  andi         s10, s11, -643
                  mulhu        t0, s8, t2
                  and          a3, a0, t0
                  or           a6, s1, t5
                  mulhu        a6, s0, a0
                  andi         t2, zero, -1195
                  lui          s7, 378545
                  fmax.s       ft10, ft10, fa6
                  fmax.s       fs6, ft3, fa2
                  divu         a7, s10, a5
                  mulhu        a5, a3, s4
                  addi         ra, a5, -1998
                  fsgnjn.s     fs11, ft6, fa5
                  fsqrt.s      fs7, ft0, rmm
                  nop
                  fmax.s       fa4, ft4, fa6
                  flt.s        a5, ft6, fs1
                  sltiu        a2, s9, 312
                  sltiu        gp, s9, 1812
                  slt          s10, gp, a0
                  sltu         t1, s9, a0
                  fcvt.wu.s    gp, fa1
                  auipc        t2, 42275
                  ori          t4, a6, 1494
                  sltiu        gp, t2, 1833
                  fmv.x.w      zero, fs7
                  andi         a4, sp, -744
                  slti         t6, t3, 967
                  addi         s6, a7, -799
                  divu         zero, a7, s3
                  sub          s6, s11, a4
                  auipc        s5, 115398
                  fsub.s       fa3, ft5, fs4, rtz
                  xor          t5, a3, s11
                  fadd.s       ft1, fa2, ft4
                  fdiv.s       fa7, ft5, ft9, rtz
                  sltiu        s5, a2, 420
                  fsub.s       ft0, fs7, ft5, rne
                  mulhsu       s6, t1, s9
                  mul          a6, ra, a2
                  sll          s10, s7, a2
                  and          a3, a0, t0
                  ori          a3, a3, -1071
                  and          s7, a7, a6
                  sra          s6, a5, t5
                  or           s0, a1, s3
                  fmv.w.x      fs11, s1
                  andi         s7, s8, 575
                  mulhsu       s9, s5, s10
                  fmv.w.x      fa7, a7
                  fmv.x.w      a4, fs10
                  fsgnjn.s     ft7, fs9, fs10
                  mulhsu       a3, tp, t4
                  fcvt.wu.s    a5, ft10
                  fmul.s       fs3, ft7, fs0, rup
                  fmv.w.x      fa5, s0
                  ori          tp, s4, 797
                  xor          tp, a6, s4
                  slti         t0, t2, -1918
                  sub          a0, gp, s0
                  addi         t2, a0, 655
                  div          a4, a5, gp
                  sltiu        a0, s0, 124
                  fcvt.s.wu    fa6, s9, rtz
                  srai         s11, s9, 3
                  fmul.s       ft9, ft10, fs5
                  fmv.w.x      fs4, s1
                  mul          t1, s2, a5
                  flt.s        t0, ft9, ft11
                  fmv.x.w      s0, fa6
                  slt          s8, t0, a2
                  sra          s11, s8, s4
                  fcvt.w.s     a3, ft2
                  fmax.s       ft10, fs11, fs2
                  divu         s10, s6, zero
                  xori         t2, gp, -521
                  fcvt.w.s     t2, ft8
                  slli         s7, t0, 30
                  xori         t2, ra, -510
                  nop
                  mul          t0, a4, a2
                  fcvt.w.s     a6, fs4, rdn
                  ori          s7, a7, -1593
                  fmin.s       fs3, ft8, fs11
                  fcvt.s.wu    fs1, s10
                  fmin.s       fa1, fs11, fs11
                  fmv.x.w      a6, ft6
                  fmul.s       fs9, fs6, fa2, rup
                  xor          a0, s5, ra
                  fmv.x.w      t1, fs9
                  flt.s        a4, fs7, fa5
                  fcvt.s.wu    fa4, ra, rne
                  slt          a6, zero, s10
                  fcvt.w.s     a7, fs8, rne
                  add          a6, t3, s2
                  sll          zero, s10, s9
                  fdiv.s       ft2, ft10, fs3, rne
                  mulhsu       zero, s5, s0
                  slt          ra, s4, s7
                  andi         t1, t1, -1685
                  auipc        s11, 850083
                  flt.s        ra, fa3, fa7
                  rem          a4, s11, t4
                  slt          a3, gp, a2
                  fcvt.wu.s    ra, ft2
                  add          gp, s3, s4
                  slti         t1, a0, -1288
                  lui          s0, 822056
                  or           s11, s3, a4
                  remu         a1, sp, t6
                  xori         ra, sp, -1184
                  fmax.s       fa2, fa7, ft11
                  srl          a7, t2, t2
                  sltiu        s5, s6, 1774
                  sltiu        s2, s10, -729
                  fsgnjx.s     ft8, fa7, fs0
                  auipc        a0, 687832
                  sll          zero, s4, t5
                  fcvt.s.wu    ft2, s6
                  ori          s4, s5, -1211
                  fmin.s       ft7, fs4, fs8
                  sltu         t0, t5, gp
                  slli         a5, t2, 8
                  and          zero, s3, sp
                  fcvt.s.w     fs3, s2
                  srli         t0, a7, 18
                  mul          t4, t5, zero
                  fsgnjn.s     ft10, fs10, fs3
                  sub          a5, s5, sp
                  and          tp, a3, s3
                  fdiv.s       fs3, fs0, ft10, rtz
                  add          s7, zero, zero
                  fcvt.wu.s    t3, fs6, rmm
                  rem          a6, s10, t1
                  mulhu        a3, a7, zero
                  fcvt.wu.s    a2, ft3, rmm
                  and          a6, s0, s6
                  or           t3, a0, s4
                  fle.s        s2, fa5, fs10
                  fmul.s       ft4, ft6, fa3
                  fmax.s       ft3, ft7, ft6
                  fmul.s       ft4, fs7, fa6, rne
                  fdiv.s       ft1, ft7, fa4
                  addi         tp, s11, 1004
                  ori          s7, s1, 499
                  or           t5, a3, s1
                  sra          t5, s5, gp
                  mulh         t4, a1, a5
                  fsub.s       fa3, fa4, ft2, rup
                  nop
                  sub          a4, s3, a0
                  divu         t1, gp, t3
                  fsub.s       fa5, ft9, fa4
                  remu         zero, t3, a2
                  fmin.s       ft11, fs0, fs8
                  sub          t3, a3, a4
                  srl          s10, a0, s1
                  andi         a6, s9, 1728
                  flt.s        ra, fa0, fa1
                  fmin.s       ft1, ft10, fs3
                  andi         t0, a7, -1146
                  rem          s7, s4, a0
                  and          ra, s2, s2
                  sub          tp, a2, s3
                  fadd.s       fs11, fs1, fa7, rup
                  xori         s6, a3, 1542
                  sltu         zero, a3, gp
                  fmv.x.w      zero, ft8
                  fmv.x.w      a6, fa6
                  fsgnjn.s     ft1, ft7, fa7
                  srli         t6, t5, 15
                  xor          a1, t6, s11
                  or           t6, ra, s10
                  rem          s0, s4, t3
                  divu         s7, s6, t1
                  ori          t6, s11, -333
                  fclass.s     t1, fs9
                  sra          a6, a0, a3
                  fcvt.wu.s    s0, fs8
                  srli         s11, s8, 16
                  fcvt.s.w     fs11, s4
                  lui          s8, 918604
                  mulhsu       s4, zero, tp
                  fmin.s       ft0, fs2, fa5
                  fclass.s     zero, ft3
                  fsub.s       fa3, fa7, ft9, rtz
                  lui          a2, 784464
                  mulhsu       a3, t3, s8
                  fsgnjx.s     ft1, ft3, ft3
                  fcvt.s.w     fa0, a3
                  slti         ra, zero, -264
                  slt          a3, a1, s10
                  fdiv.s       fs0, fa2, fs2
                  flt.s        a4, ft4, fs11
                  divu         t1, zero, ra
                  add          s7, t0, t0
                  lui          s6, 679856
                  slt          s6, t3, gp
                  fmin.s       ft7, ft5, fs6
                  fmax.s       ft4, ft11, ft0
                  feq.s        a4, fs10, fa6
                  fadd.s       fs10, fa3, fs4, rtz
                  mul          s8, gp, s9
                  srai         t0, t1, 0
                  ori          a0, t2, -1185
                  fcvt.s.w     ft5, sp
                  and          s0, a7, t2
                  fmv.w.x      ft11, zero
                  or           t4, sp, tp
                  fadd.s       fa2, fa7, fs5
                  fcvt.w.s     zero, fs10, rne
                  feq.s        ra, fs7, fs7
                  feq.s        s9, ft8, fs2
                  fmv.x.w      zero, fa2
                  fcvt.wu.s    s4, fs11
                  mulhsu       s8, sp, t4
                  auipc        t0, 565221
                  feq.s        s7, ft4, fa5
                  fcvt.s.w     fs9, s10
                  fsgnj.s      ft3, ft9, fs1
                  fcvt.s.wu    ft0, s7
                  fsub.s       ft7, fs6, ft0
                  fsgnj.s      ft3, fa7, ft9
                  mulhu        gp, a4, s8
                  addi         s5, s5, 1032
                  fcvt.wu.s    a1, fs8, rtz
                  mulhsu       t5, s11, ra
                  fdiv.s       fs0, fs2, fs11
                  slli         s4, s10, 17
                  add          a2, a6, sp
                  fsgnj.s      ft9, ft10, ft10
                  fclass.s     t2, ft11
                  sltiu        s6, a7, 1731
                  fsqrt.s      fs2, ft0
                  slti         a0, s5, 526
                  sll          s6, gp, t4
                  mul          t3, t2, gp
                  fsub.s       ft1, ft2, fa4, rup
                  add          t3, s7, a1
                  mul          t5, a3, s7
                  slli         a0, a7, 27
                  fmul.s       ft9, ft11, fs9
                  fmv.x.w      a5, fs4
                  fdiv.s       fs6, fs1, fs3, rtz
                  mul          t0, s1, s2
                  fsqrt.s      fs1, ft8
                  nop
                  srai         t5, a7, 20
                  fsgnj.s      fs7, fs3, fs1
                  fcvt.s.w     fa3, s10
                  sltu         t0, t6, s6
                  fsqrt.s      fa4, fs9, rmm
                  fclass.s     s2, fa6
                  sra          s6, t2, t1
                  mul          s7, s7, s8
                  slti         s0, s10, 50
                  sra          a2, a1, s1
                  and          tp, t6, s10
                  fcvt.wu.s    ra, fs1, rmm
                  add          t2, a3, t1
                  sll          s11, s7, zero
                  fsgnjn.s     fs9, ft1, ft4
                  fcvt.wu.s    tp, ft6, rdn
                  mul          zero, sp, t3
                  srli         a7, s0, 17
                  sra          a3, a4, s3
                  slti         a3, a6, 1719
                  fsgnj.s      fs10, ft8, ft8
                  remu         a7, ra, a2
                  fsgnjn.s     fs5, ft10, fs2
                  fsub.s       fa2, fs2, fs4
                  rem          tp, tp, a4
                  fsqrt.s      ft9, fs7
                  fmv.w.x      fs1, t2
                  and          a1, a4, sp
                  mulh         a2, zero, a2
                  mulhsu       a4, a4, tp
                  sll          ra, zero, a7
                  andi         a2, gp, 211
                  ori          s10, t6, -261
                  fadd.s       fa6, ft7, ft9
                  div          s11, s10, a6
                  fmax.s       ft7, ft2, ft3
                  mulh         a4, s7, s9
                  slti         a7, s3, -735
                  mul          ra, s2, s3
                  xori         t3, s6, 1495
                  fsgnj.s      fs9, ft2, fa1
                  fmin.s       fs6, ft2, ft2
                  fcvt.s.w     fa3, s10, rdn
                  mulhsu       t6, s9, a4
                  slti         s9, t0, 252
                  fsqrt.s      ft10, ft0, rup
                  fsgnj.s      ft7, fa2, ft10
                  fle.s        s6, fa3, fs2
                  mulhsu       t0, s9, a4
                  fsqrt.s      ft11, ft4
                  mulh         s11, t0, t1
                  and          gp, s1, a4
                  xor          s6, s6, s2
                  fsgnjx.s     fs4, fs0, ft9
                  flt.s        s9, fs6, fa1
                  mul          a4, s0, ra
                  andi         s7, sp, 2045
                  srl          zero, t0, t6
                  andi         a5, s2, -1615
                  srai         a3, s8, 6
                  fle.s        t0, fs3, ft5
                  fmv.x.w      a2, ft8
                  sltiu        s10, sp, -782
                  rem          a5, zero, s0
                  fmax.s       ft5, fs9, fa6
                  lui          s5, 670078
                  srli         s11, a5, 10
                  fadd.s       fs1, ft5, fs2, rtz
                  sll          a7, a2, t3
                  addi         t2, t4, 1210
                  fcvt.s.wu    fa2, t1
                  mulhu        s0, s2, s2
                  fcvt.wu.s    a1, fs4
                  auipc        s4, 498046
                  fmv.x.w      ra, fs2
                  xori         a2, t3, 1329
                  and          t1, a1, t0
                  fmv.x.w      s2, fs8
                  fsgnjx.s     fa4, ft4, fs0
                  mulhsu       s2, s7, a1
                  divu         a2, s11, s11
                  feq.s        s0, ft7, ft3
                  xor          a0, s9, t3
                  remu         tp, s9, zero
                  div          s9, s11, tp
                  auipc        a7, 724516
                  fsub.s       fa3, fs3, fs3, rmm
                  fmv.w.x      fa5, s7
                  feq.s        a5, ft9, fs4
                  fmul.s       fs5, fa7, fs10, rtz
                  fmul.s       fs4, ft3, fa1, rtz
                  slli         s5, s3, 12
                  lui          s5, 992220
                  fsgnjx.s     fs0, fs6, ft7
                  ori          s4, t2, -80
                  auipc        s8, 522482
                  fclass.s     t6, fs6
                  fmax.s       ft10, fs4, ft6
                  and          t4, s9, t6
                  fmv.x.w      s11, fa7
                  mul          s4, s8, a1
                  mul          s8, s0, t6
                  fsgnjn.s     ft5, ft7, fs10
                  slti         a0, s2, -381
                  sub          s0, s6, a3
                  fsgnjx.s     fs9, fa6, fs9
                  fsub.s       fa4, fs7, ft1
                  div          s7, s0, s10
                  lui          s7, 277996
                  feq.s        t1, ft9, fs8
                  rem          t2, a3, s10
                  divu         s6, t4, a4
                  and          a1, sp, a7
                  divu         s5, t4, ra
                  addi         s8, a1, -699
                  fadd.s       ft6, ft7, fa2, rtz
                  fsgnjn.s     ft9, ft11, fs10
                  srl          tp, s6, s1
                  div          gp, a2, s11
                  add          t5, s10, s7
                  mul          a1, s3, s6
                  rem          s6, a7, a2
                  sltu         s0, t5, s9
                  slli         t4, t5, 17
                  flt.s        s5, fs7, fs4
                  xori         a5, a3, -734
                  sub          a3, zero, a0
                  div          a2, s9, s10
                  sltiu        s6, a6, 764
                  addi         ra, gp, 841
                  slt          t3, sp, s5
                  sltiu        t2, a2, 779
                  auipc        a7, 745706
                  or           a6, s5, a7
                  fcvt.wu.s    s0, fa7, rne
                  srl          s0, t1, t5
                  addi         t0, t0, 402
                  addi         s10, a2, -154
                  andi         s9, a4, 1531
                  srl          gp, t3, s2
                  slti         s4, t5, -1052
                  divu         t1, t4, s11
                  fsqrt.s      fs5, fs9
                  fdiv.s       fs10, fa5, fa4
                  mulhu        a6, a3, gp
                  sra          s10, a7, s1
                  slti         a4, ra, 1478
                  srl          t1, a4, s5
                  sll          t3, ra, a3
                  fcvt.wu.s    s2, fs8, rup
                  xor          a1, s2, s7
                  fcvt.s.wu    fs0, s1
                  sltiu        a4, s11, -192
                  sltu         tp, ra, zero
                  auipc        tp, 514743
                  remu         s5, s11, t2
                  fmul.s       ft9, ft10, fa5, rmm
                  sltu         t2, tp, a5
                  fsgnjn.s     ft4, ft4, ft7
                  fsqrt.s      ft4, ft0
                  slti         t4, t6, -73
                  xori         zero, zero, 1360
                  fadd.s       ft11, fs10, ft7
                  slti         gp, t3, 89
                  fcvt.s.w     ft6, s9
                  srai         s2, t2, 27
                  flt.s        a7, fa7, fs3
                  remu         s0, s7, a5
                  fmax.s       ft10, ft1, fs4
                  ori          s6, t2, 2031
                  div          s10, s6, a4
                  fadd.s       ft10, fa7, ft0
                  flt.s        ra, ft0, fs11
                  fsgnj.s      ft2, fa4, ft3
                  fsgnjx.s     fa5, ft7, ft11
                  andi         a2, zero, -1330
                  srli         a6, a6, 6
                  fmin.s       ft1, ft4, ft5
                  fmax.s       fs2, fs0, fs6
                  slli         t4, s11, 10
                  nop
                  sub          a5, s6, ra
                  nop
                  div          s0, s2, a4
                  andi         tp, t2, 1571
                  fdiv.s       ft8, fs10, fa6, rdn
                  feq.s        tp, fs6, ft10
                  slti         t3, a1, -1919
                  fsub.s       fa3, fs11, fs8
                  srai         t4, tp, 22
                  ori          a6, s7, -1974
                  sltu         s0, t2, sp
                  slti         s10, t4, 523
                  nop
                  feq.s        t0, fa4, fa6
                  div          tp, a3, a1
                  fdiv.s       fa1, fa5, ft1
                  fcvt.s.w     fs2, s8
                  fle.s        t4, fa4, ft9
                  mulhu        s10, s5, s2
                  or           ra, a2, s1
                  div          t3, s11, t6
                  fsgnjn.s     fa3, ft7, ft1
                  fsgnj.s      ft2, fa0, ft0
                  fcvt.w.s     zero, fs0, rne
                  fdiv.s       ft8, fs7, fa0
                  remu         a3, t2, s3
                  sub          t4, a7, s5
                  divu         a5, ra, ra
                  sub          t4, a6, s2
                  mulh         a0, t6, t5
                  mul          t4, a1, s10
                  fmul.s       ft2, fa3, fs5
                  slli         tp, s2, 14
                  fle.s        t5, fa3, ft5
                  feq.s        a3, fs5, ft5
                  sub          s9, s3, s3
                  mulh         t2, t0, s6
                  fsgnjn.s     ft5, fs5, ft0
                  fle.s        a3, fa2, fs3
                  slt          s8, a6, t6
                  rem          s4, a3, t2
                  lui          ra, 232923
                  fclass.s     a7, ft3
                  fmv.w.x      fs10, t6
                  xor          zero, s9, a2
                  nop
                  ori          zero, s5, -104
                  mulh         t5, t6, s6
                  divu         t1, t5, zero
                  fmax.s       fs11, ft7, fa6
                  fcvt.s.w     fs7, a3, rtz
                  fcvt.s.wu    fs1, a4, rmm
                  sub          s2, tp, s5
                  mulhsu       a2, ra, tp
                  fcvt.s.w     fs5, s0
                  sra          s8, s6, ra
                  fsgnjn.s     fs10, fs10, ft3
                  fmax.s       fa5, ft9, fs1
                  div          a0, s10, t0
                  fsgnj.s      fa7, fa5, ft10
                  fsgnjx.s     fs11, fs0, fa1
                  sub          t0, a4, s5
                  srai         s11, a5, 5
                  feq.s        t0, fs2, fa0
                  or           t4, a3, s3
                  sub          a2, tp, s5
                  sltiu        t2, t2, -448
                  fcvt.w.s     t2, fs10, rmm
                  flt.s        a1, fs4, fs10
                  divu         tp, t3, s4
                  slt          s10, t2, s4
                  divu         s8, s7, a7
                  slti         gp, sp, -908
                  fsqrt.s      ft2, fs8, rup
                  fsgnj.s      fs4, fs5, ft10
                  fsgnjn.s     fa5, ft10, fs8
                  fmv.w.x      ft2, s1
                  divu         t3, s7, t0
                  add          a6, t2, a5
                  div          a3, s7, gp
                  mul          tp, t5, t4
                  nop
                  slti         a7, tp, -312
                  div          ra, s1, s10
                  fcvt.s.w     ft3, s1, rup
                  fsgnj.s      fs5, ft0, fa2
                  slt          ra, a0, ra
                  remu         a7, t1, a2
                  divu         s4, t3, s4
                  or           s8, s11, a0
                  fmv.w.x      fa7, s10
                  mul          s2, t5, a3
                  mulhsu       t5, s7, ra
                  fsgnjn.s     fs3, fs2, fa4
                  fcvt.s.wu    fs7, s6
                  fsgnj.s      fa5, fs3, ft5
                  and          gp, s1, t3
                  remu         t6, t2, s5
                  mulh         t6, t0, s10
                  mul          t5, s9, s4
                  fcvt.wu.s    a3, ft1
                  sltiu        a0, s11, -197
                  fmax.s       fs0, fs2, ft10
                  flt.s        s2, fa0, fs2
                  xori         t2, a7, 1465
                  slli         ra, s3, 1
                  ori          tp, t2, 114
                  fcvt.wu.s    a0, fs9
                  slti         gp, t0, -455
                  srai         a1, s6, 4
                  div          s11, s7, s9
                  fclass.s     s11, fa3
                  flt.s        tp, fa0, fs6
                  nop
                  and          s6, t2, a4
                  fmv.w.x      ft0, s11
                  srl          ra, zero, s0
                  mulh         s10, a2, s7
                  xori         t1, s8, 1890
                  divu         a6, s5, s8
                  lui          tp, 431855
                  xor          s5, a3, s2
                  mulhsu       zero, tp, s11
                  fmv.x.w      t1, ft3
                  feq.s        t5, ft0, ft8
                  sltiu        a2, s10, -1864
                  slti         s8, s6, -381
                  feq.s        s4, ft10, fa6
                  slti         t4, s4, -364
                  fsqrt.s      fa1, fs11, rup
                  fcvt.s.w     ft7, zero
                  fdiv.s       ft5, fs10, fs3, rtz
                  fmax.s       ft6, fa3, fs5
                  srai         t3, s2, 20
                  fmin.s       ft11, fs10, ft5
                  div          s10, a0, a0
                  fsqrt.s      fs10, fs10, rup
                  sra          a0, a1, t3
                  or           t0, s10, s5
                  fsgnj.s      fs7, ft2, ft6
                  srai         a3, s1, 15
                  mulhu        a4, tp, s5
                  fle.s        t6, fs8, fs11
                  and          t0, a0, s0
                  fsqrt.s      ft8, ft4
                  xor          a6, t6, a3
                  fsub.s       ft11, ft3, ft1
                  fsgnjx.s     fs2, fs5, fa0
                  sll          a6, t6, s8
                  fmv.x.w      gp, fs8
                  fadd.s       ft10, fs4, fa7
                  sltiu        t2, t6, 350
                  fdiv.s       ft10, fs3, ft0
                  addi         t0, s6, -1929
                  fmv.w.x      ft8, s0
                  fadd.s       ft0, ft4, ft3
                  feq.s        t1, fs1, fs0
                  lui          tp, 547639
                  sll          a7, a0, ra
                  nop
                  fmax.s       ft3, fa3, fa4
                  sltu         t6, a2, a5
                  fle.s        s6, fs11, fa0
                  fsub.s       ft5, fs7, fa3, rup
                  mul          ra, s11, t0
                  fsgnjx.s     fa4, fs4, fs5
                  lui          gp, 746585
                  sra          a0, a5, s10
                  sltiu        tp, s10, -1864
                  sub          t0, t0, t0
                  srai         s2, t1, 6
                  or           s11, s8, s9
                  nop
                  xor          s2, gp, a5
                  fcvt.wu.s    a6, fa0, rup
                  fmv.x.w      s4, ft5
                  srl          a1, tp, a4
                  rem          s8, t1, a7
                  ori          t0, a1, 1559
                  mulhsu       s2, a5, s9
                  slt          t6, s7, t1
                  fcvt.w.s     tp, fa6, rne
                  sra          gp, s9, a5
                  fsgnj.s      ft3, ft10, ft10
                  auipc        a3, 510564
                  srli         gp, a5, 30
                  sll          a3, s0, t5
                  slti         t3, a3, 1466
                  fmin.s       ft0, ft2, fs4
                  fcvt.s.wu    fs1, t5, rup
                  fmin.s       fs7, ft7, fs5
                  sll          s5, a5, a3
                  xori         t0, t6, 757
                  fcvt.w.s     t0, fs5, rne
                  fcvt.s.wu    ft10, t3, rup
                  slti         s5, tp, -1544
                  fsgnj.s      ft5, fs11, fs7
                  fsgnjx.s     fs11, ft2, fs8
                  fcvt.s.w     ft2, s6
                  nop
                  div          t2, a5, a0
                  fmax.s       fa2, fa7, ft6
                  slt          t2, s2, a2
                  sub          tp, t3, a5
                  fsub.s       ft9, ft2, ft7
                  fsgnj.s      fa3, fs0, fs8
                  srl          a0, t0, a1
                  divu         s7, gp, s9
                  fcvt.s.w     fs4, s0
                  fsub.s       ft11, ft11, fs6
                  fadd.s       ft3, fa5, ft2
                  div          a0, sp, s0
                  slli         a2, a1, 31
                  fcvt.w.s     s2, ft11
                  fdiv.s       fa6, fa7, fa0
                  lui          s8, 865617
                  mulhsu       a1, t0, t2
                  fdiv.s       fs4, fa0, fs10
                  feq.s        a5, fs7, ft6
                  slt          zero, t2, t4
                  and          s0, s0, a4
                  fmin.s       ft4, ft2, fs6
                  mulh         zero, a4, s6
                  sltiu        t6, a7, 112
                  fcvt.w.s     a3, ft11, rmm
                  fsgnjn.s     ft3, ft6, ft11
                  fclass.s     gp, fs3
                  fsqrt.s      fs3, ft10
                  fmin.s       ft10, fs9, ft0
                  srai         t4, s10, 17
                  fcvt.s.w     fs6, a2
                  addi         a1, ra, 671
                  ori          a3, t1, -2032
                  auipc        a0, 417248
                  rem          t2, a4, s4
                  fle.s        gp, ft9, ft10
                  feq.s        a3, fs8, fs11
                  feq.s        t1, fs8, fs9
                  addi         tp, s1, -254
                  xori         t1, s0, 1289
                  mulhu        a5, t4, t5
                  fcvt.s.wu    ft0, sp, rne
                  fmv.x.w      t4, fs0
                  mulhsu       a5, s10, s0
                  srl          gp, t4, s9
                  mul          a0, s6, a7
                  fclass.s     t5, fs8
                  sra          tp, a1, s1
                  addi         s2, s5, -1442
                  sra          ra, zero, a2
                  fsgnjx.s     fs9, fs5, fa2
                  and          s9, s4, tp
                  fdiv.s       fa4, fa7, fs4, rdn
                  fmax.s       fs6, ft7, fs11
                  divu         ra, s9, a0
                  slti         t5, s0, 716
                  fdiv.s       fa7, ft7, ft9, rdn
                  mulhsu       s11, s2, s6
                  fmin.s       ft2, fs9, ft5
                  mulh         s6, a4, t5
                  sll          tp, s7, t1
                  fcvt.s.wu    fa2, s8
                  fcvt.s.wu    ft3, s9
                  mulhu        s2, t6, a0
                  fcvt.s.wu    fa2, s8, rup
                  mulhsu       a3, a6, s5
                  fclass.s     gp, ft7
                  add          s9, ra, t6
                  srli         a3, s11, 4
                  xori         a2, s8, -622
                  rem          s8, s5, t4
                  feq.s        a6, ft6, fa5
                  mulhsu       t4, s7, t5
                  div          s7, t0, a6
                  flt.s        tp, fs7, fs9
                  divu         zero, t1, t1
                  fadd.s       ft7, fs10, fs5, rdn
                  andi         s9, a3, -395
                  fmax.s       fa4, ft2, ft6
                  fsgnjn.s     fa4, fs8, fs3
                  fsgnjx.s     ft3, fs9, fs1
                  srli         a2, s3, 18
                  mulh         t6, t5, t5
                  fle.s        t1, ft3, fs1
                  fcvt.w.s     t5, fs11
                  ori          t5, a4, -263
                  or           t4, sp, a3
                  sltiu        s7, s2, 1807
                  fcvt.s.w     ft1, t1, rne
                  ori          t3, s0, -518
                  srl          zero, t1, s1
                  sltu         t2, t6, gp
                  mulhu        s6, t5, sp
                  fsgnjn.s     ft9, fa7, ft3
                  rem          s10, s1, a4
                  div          s6, s6, sp
                  and          a7, s5, s6
                  fmv.w.x      ft5, a6
                  xor          gp, a1, s3
                  fadd.s       ft6, fa7, fs3
                  fdiv.s       fs8, fa7, fs4
                  mulhu        a6, t4, a1
                  xor          s2, a6, a3
                  fle.s        a3, ft7, fa0
                  mul          s2, s8, s0
                  fsgnj.s      fs8, ft8, fs11
                  fsub.s       ft8, ft7, ft4, rdn
                  slt          s4, a7, s4
                  sra          s5, tp, tp
                  remu         t2, zero, t2
                  remu         s6, s10, s1
                  remu         s11, a2, a0
                  mulhsu       a4, s7, a5
                  fcvt.s.w     ft8, t5, rne
                  add          s7, t1, s1
                  srai         t1, s6, 14
                  lui          a7, 585709
                  sub          t4, s4, s0
                  lui          a0, 565110
                  slti         t0, a3, 1022
                  slti         gp, s3, -1264
                  addi         tp, s2, -703
                  fmul.s       fa7, ft5, ft2, rtz
                  addi         s8, a6, -610
                  and          s6, t6, t4
                  fmin.s       fs6, fs9, ft5
                  fsub.s       fs2, fs11, fs11
                  lui          t5, 649887
                  fmv.w.x      fs9, t0
                  fle.s        s2, ft1, fs6
                  nop
                  fcvt.s.w     fa3, s4, rup
                  fsgnjx.s     ft10, ft11, fs5
                  fmv.w.x      ft9, s3
                  fsub.s       ft5, fs3, fs4, rne
                  srl          a2, a7, a0
                  sltu         a1, t1, a1
                  remu         a3, a0, t0
                  fcvt.s.w     ft11, s2
                  mulh         t1, ra, a5
                  mulhsu       zero, s3, t4
                  slli         a6, a6, 30
                  lui          s8, 987293
                  slli         a5, a0, 6
                  fcvt.w.s     t5, fs11
                  fcvt.s.w     fs6, s1
                  slt          s8, a3, s5
                  fcvt.s.wu    fs2, a6
                  srl          s4, s5, a6
                  fadd.s       fs9, fs5, ft9
                  fadd.s       fs8, fa0, fs6, rne
                  lui          s8, 154221
                  or           s10, s7, s1
                  or           gp, t0, s7
                  ori          a4, t1, -1693
                  fadd.s       fs11, ft5, fs7, rdn
                  sll          s10, t3, t5
                  srl          t4, s1, a2
                  slti         s8, t5, -177
                  flt.s        t2, fs9, ft5
                  mul          zero, t6, s4
                  and          a5, zero, t2
                  xor          t3, s5, s11
                  divu         a0, t1, s7
                  remu         s6, t4, s2
                  sub          ra, a7, gp
                  fmax.s       ft6, fs8, fs9
                  fsgnjn.s     fa1, ft8, ft6
                  auipc        tp, 271954
                  fcvt.w.s     t5, ft10
                  slt          s4, s11, a5
                  sub          s2, a5, s0
                  fcvt.wu.s    t2, ft4, rdn
                  srai         a7, s2, 3
                  nop
                  remu         gp, a6, a5
                  div          s5, a3, s3
                  mulhsu       s2, s4, s0
                  or           a5, a4, s8
                  add          s11, s10, a5
                  mulh         a5, s10, t3
                  flt.s        zero, fs3, ft0
                  fclass.s     a7, fa4
                  fle.s        s8, fa4, ft9
                  mulh         s6, a5, s9
                  slt          gp, sp, a6
                  srai         zero, t4, 22
                  and          t2, t0, a4
                  fmul.s       fs4, ft0, fa1, rup
                  fmul.s       ft2, ft6, fs8, rne
                  fcvt.s.w     fs0, a1
                  fclass.s     zero, fa1
                  srli         t0, a2, 6
                  mulhu        s2, t3, t1
                  fclass.s     ra, fs8
                  fmv.w.x      fa5, a5
                  sltu         a4, sp, s9
                  fadd.s       fs11, fa2, fs0, rmm
                  fmax.s       ft9, ft11, fa7
                  remu         s2, s10, s10
                  sub          t5, s9, s7
                  fsub.s       fs11, ft4, fa1
                  fcvt.s.w     ft7, s10
                  sltu         s9, t0, a2
                  fmv.x.w      a1, fa7
                  and          s5, t1, s0
                  mulh         s10, a1, a6
                  slt          a3, s0, ra
                  fsgnjn.s     fs0, fs8, ft5
                  slti         s8, s7, 878
                  and          a1, s9, s0
                  divu         a4, t3, a0
                  slti         t6, t5, 223
                  mul          s4, s5, t6
                  rem          t5, s8, s11
                  sub          s10, t0, a3
                  xori         a3, sp, 558
                  div          a2, s5, a7
                  fmul.s       ft3, fs2, fs10
                  fcvt.s.wu    fa5, s9
                  xor          zero, t6, s3
                  fle.s        a5, ft1, ft4
                  mul          s9, a6, a0
                  mulh         s10, s9, s10
                  fsgnjn.s     ft4, fs7, fa1
                  rem          t3, s6, a1
                  xor          t2, gp, t3
                  fsgnjx.s     fs2, fa0, fa2
                  slli         t0, s0, 31
                  or           t4, t5, t6
                  fdiv.s       ft4, fa4, ft10, rup
                  feq.s        a1, fs2, ft10
                  lui          s10, 488100
                  fsqrt.s      ft7, ft6
                  fmul.s       ft11, fs7, fa7
                  srai         t6, zero, 0
                  sll          a1, s7, s11
                  and          t4, t5, sp
                  sub          s10, t5, t0
                  fdiv.s       ft0, ft3, fs10
                  and          s10, a4, s10
                  fmax.s       fs6, fs10, ft7
                  nop
                  fmv.x.w      a7, fs10
                  sltiu        s8, s6, -675
                  divu         t0, sp, s11
                  and          a5, zero, s0
                  auipc        a2, 645824
                  fmax.s       fs1, fa1, fs8
                  divu         s11, ra, zero
                  fsqrt.s      ft11, fa7
                  fadd.s       ft0, fs6, fs1, rtz
                  mul          a4, ra, s10
                  sltiu        t3, a4, 692
                  lui          a0, 592542
                  rem          s10, t6, t4
                  feq.s        t2, fa1, fs3
                  fsgnjx.s     ft4, ft1, ft7
                  mul          t6, a2, t4
                  xori         a0, a6, 204
                  fmul.s       fs7, fs1, fa4, rne
                  and          a7, t6, t2
                  fle.s        a2, ft10, fa2
                  sltu         s7, t6, s4
                  add          s6, sp, a7
                  mulhu        tp, a2, s1
                  sra          a3, a6, s11
                  fmul.s       ft8, ft7, fs7, rne
                  fmv.x.w      a1, fa2
                  xor          a4, a2, t6
                  mulhu        a4, a5, s11
                  fcvt.w.s     a6, fa6
                  fcvt.s.w     ft1, t0, rup
                  flt.s        t3, ft8, ft7
                  sra          a0, t0, t1
                  fmul.s       fs3, fs3, ft1, rup
                  fdiv.s       fa4, fs9, fs3
                  mulh         t1, s8, s5
                  srl          t0, tp, s1
                  mulh         a0, s2, s11
                  fsgnj.s      fs9, fa7, fs7
                  sltu         a7, s6, s6
                  fsgnjn.s     ft9, fs3, fa4
                  xor          t0, s3, sp
                  sll          t4, a2, tp
                  mulh         a1, a3, t0
                  fsqrt.s      fa5, ft5, rup
                  mulhu        t6, a1, a2
                  fdiv.s       fs8, fs0, fs5, rdn
                  xori         a2, t0, -1821
                  fsgnj.s      ft5, fs2, fs9
                  fcvt.wu.s    t1, ft5
                  auipc        zero, 826602
                  slt          a3, t1, a1
                  div          ra, tp, a1
                  mul          a7, s10, s10
                  fmv.x.w      s9, ft2
                  mulhsu       a1, gp, a1
                  flt.s        gp, fa3, fs2
                  mulh         t2, gp, a4
                  mulhu        a5, s3, s7
                  fmv.x.w      t6, fs11
                  div          a4, a3, a3
                  addi         a6, gp, -1472
                  fsqrt.s      fs9, ft3
                  fmv.w.x      ft1, s0
                  sltiu        t3, t0, 600
                  sltiu        a1, s8, 863
                  srli         s10, s5, 15
                  fle.s        t3, fs8, ft8
                  fsgnjn.s     fa2, ft2, fa0
                  sltu         s2, s7, t6
                  divu         a5, sp, t2
                  fmul.s       fs8, ft5, fs4, rup
                  srl          s8, a2, sp
                  lui          s6, 824434
                  fsgnj.s      ft6, ft8, ft9
                  ori          a1, a3, 1214
                  sltu         s5, a3, s8
                  sll          t6, a5, s9
                  srl          s11, zero, ra
                  fcvt.w.s     s2, fs0
                  fle.s        t0, fs0, fs4
                  srai         s10, s7, 11
                  sltu         a5, s2, a4
                  ori          s11, t5, -1526
                  sub          s8, t5, s2
                  sub          a3, s4, a7
                  mulh         tp, gp, a5
                  auipc        a0, 900134
                  divu         s2, t3, tp
                  mulhu        s5, s2, a2
                  fmax.s       fa1, ft2, fs9
                  or           a2, a0, t1
                  fcvt.s.wu    fs2, s8
                  remu         a5, s7, s11
                  fcvt.wu.s    t2, ft6, rmm
                  fdiv.s       ft3, ft0, ft0
                  mulhsu       t1, s5, s9
                  slti         s7, s3, -1938
                  rem          ra, tp, t4
                  sll          t6, t5, s3
                  add          s2, gp, a6
                  feq.s        a4, ft0, fa5
                  andi         t4, a1, -509
                  feq.s        a2, fa0, ft1
                  fsub.s       fa7, ft11, fa5
                  fcvt.s.wu    fs7, s1, rtz
                  div          gp, s2, sp
                  mul          a0, a3, s10
                  fdiv.s       ft5, ft11, ft9, rne
                  fdiv.s       ft11, ft7, ft7
                  add          t2, t3, s3
                  flt.s        zero, fs10, fs4
                  fcvt.wu.s    s2, ft4
                  srai         a4, a5, 27
                  ori          gp, a4, -233
                  and          s0, t2, s6
                  fcvt.s.wu    fs9, s0, rdn
                  srl          s7, s8, a6
                  feq.s        s4, fs9, fa7
                  feq.s        a5, ft4, ft5
                  fle.s        a0, ft8, fs9
                  fcvt.s.w     fs1, s2, rup
                  slli         s5, a7, 0
                  feq.s        s7, fs5, fs4
                  fmax.s       ft3, fs6, fa6
                  sub          a2, s3, tp
                  sll          t4, s6, s2
                  fsqrt.s      fa1, fs0
                  andi         a2, zero, -224
                  fdiv.s       fs11, fa3, ft5
                  lui          s0, 651198
                  sltiu        a3, tp, -1176
                  fsgnj.s      fa7, fa7, fs4
                  fcvt.w.s     a4, ft2
                  div          a7, zero, a2
                  sub          a1, t3, s7
                  mulhu        s6, a7, s0
                  fcvt.wu.s    t1, fa7
                  fsqrt.s      fa6, fs3
                  fdiv.s       ft10, fa4, ft7
                  xori         s7, t3, 1420
                  mul          s6, s11, s10
                  fclass.s     a4, fs4
                  nop
                  div          s9, s8, a4
                  slli         s10, s4, 25
                  fsub.s       ft4, fs9, ft6, rup
                  andi         a4, s7, 825
                  fmax.s       fs6, ft1, ft8
                  srl          a6, a6, t0
                  div          a0, a7, a6
                  fsgnj.s      fs9, fs9, fs8
                  lui          a6, 781925
                  sltu         s11, s1, s4
                  sltu         a6, t2, t4
                  div          t2, t6, t5
                  ori          s9, a0, 1350
                  feq.s        t1, ft8, fs9
                  mulhsu       s9, a2, zero
                  fcvt.wu.s    a7, fs3
                  srai         s4, s10, 17
                  remu         a5, a7, t3
                  sub          a1, s1, ra
                  sub          s0, s9, s1
                  fsgnj.s      fs6, fa7, ft10
                  fmin.s       fa4, fa1, ft4
                  fsgnj.s      fs5, ft4, ft11
                  fcvt.s.wu    fa1, t1
                  addi         s0, s3, 1811
                  fmul.s       fs1, fa1, ft2
                  fadd.s       fa2, ft10, ft4
                  mulh         a2, s0, t4
                  or           t0, gp, s11
                  andi         tp, s9, 972
                  fadd.s       ft3, fs11, fs2
                  lui          a6, 395986
                  sra          gp, ra, s10
                  rem          s4, a3, a5
                  nop
                  fmin.s       fs2, fa7, ft7
                  sra          gp, s10, t1
                  and          s8, s8, a0
                  xor          t2, gp, a2
                  srai         t1, zero, 9
                  fsub.s       fa3, fa3, ft9, rne
                  add          s7, s6, s3
                  remu         s8, t3, sp
                  fle.s        a3, fa2, fa2
                  mulhsu       s10, gp, gp
                  ori          ra, t1, -785
                  fcvt.w.s     s2, fs11
                  add          t1, t1, s1
                  rem          a4, s6, s3
                  srai         t3, a7, 29
                  fsgnj.s      ft10, fs11, fs3
                  fle.s        t0, fa2, ft0
                  mulhsu       s9, a7, s0
                  addi         s4, s6, 2036
                  mulh         s0, a3, t2
                  fmul.s       fs6, fa6, fa3
                  divu         t1, s10, gp
                  sltu         t2, gp, a7
                  fcvt.wu.s    t1, fa3
                  slt          a3, zero, zero
                  mulhsu       t6, ra, s6
                  sra          a0, s1, t2
                  and          t0, a3, zero
                  rem          a2, s6, s9
                  div          a2, t3, a0
                  fmax.s       fa3, ft4, fa2
                  sub          tp, a3, s3
                  fcvt.s.wu    fs7, t1
                  xori         s7, ra, -452
                  sll          t4, s4, s10
                  slli         s7, t6, 11
                  fmax.s       ft2, fs7, fs6
                  nop
                  slli         t5, a3, 22
                  fmul.s       fs6, fa2, fs6
                  fmin.s       fa2, ft10, ft0
                  srli         tp, s9, 13
                  feq.s        s11, fa2, fs2
                  sltiu        s4, a0, 1078
                  xori         ra, s9, 1310
                  fmin.s       fs0, fa2, fa5
                  srl          s10, a7, s8
                  srai         a0, t2, 9
                  rem          s10, s0, s1
                  and          t4, sp, a1
                  mul          t0, a6, s0
                  srl          a6, s2, s4
                  fdiv.s       ft0, ft8, fs0, rmm
                  and          t2, s2, s6
                  fmul.s       ft2, ft8, ft3, rtz
                  or           t4, zero, t2
                  rem          ra, a3, t4
                  fmv.x.w      a2, fa2
                  mulhu        a0, s7, s9
                  fsgnj.s      ft6, fa5, fa4
                  sra          ra, s8, a7
                  mulhu        a2, s8, ra
                  lui          s6, 1023305
                  fcvt.s.w     ft10, gp, rtz
                  fsgnj.s      fs9, fs2, fs10
                  sltiu        tp, a1, 1928
                  xor          s5, ra, s5
                  sub          a2, a4, a2
                  ori          s7, a5, -1360
                  fmv.x.w      s4, ft7
                  fsgnj.s      ft1, fs8, fs0
                  sltu         a2, t3, t6
                  fsgnjn.s     fa5, ft9, fa2
                  fsgnjx.s     fa3, ft8, fs10
                  remu         a3, s11, s6
                  mul          a1, a3, t4
                  mulhu        zero, t4, s7
                  sub          t4, a2, s6
                  and          s4, t3, s7
                  or           a3, t1, t3
                  xor          s0, ra, sp
                  fmv.x.w      a3, fa0
                  sra          t4, s11, gp
                  addi         t1, s2, 1933
                  addi         t0, s3, -1772
                  mulhsu       s5, s11, sp
                  divu         s8, t0, s5
                  div          s2, s4, s9
                  fsub.s       fs11, fa3, fs1, rne
                  fcvt.w.s     s11, fs5
                  slti         tp, s8, 971
                  fmin.s       fs4, ft10, ft10
                  divu         a1, s2, a3
                  rem          s11, t4, s5
                  fsub.s       fs6, ft5, fs8
                  fmul.s       fs0, fa3, fa7, rdn
                  fmax.s       ft4, ft4, fs4
                  mulhu        zero, t6, a5
                  mulh         a7, gp, sp
                  srai         t4, sp, 10
                  fmul.s       fs10, fs10, ft7, rmm
                  ori          ra, s6, 913
                  rem          s7, a5, s3
                  sltiu        t0, gp, -676
                  add          s9, t1, s1
                  and          s6, t3, t6
                  feq.s        t1, ft7, fs0
                  fsub.s       ft9, fs8, fs11
                  fdiv.s       ft7, ft2, fa2
                  and          tp, s7, s7
                  mul          s8, zero, a1
                  lui          a0, 52904
                  xori         s0, a0, -616
                  flt.s        zero, fa2, fs6
                  nop
                  div          s2, s8, s9
                  fmul.s       ft8, fa6, fs7, rup
                  addi         s9, a5, -246
                  fdiv.s       fa7, fs3, fs5, rne
                  fmin.s       fs3, fs1, fa6
                  fmv.x.w      zero, fs7
                  fcvt.s.w     fs8, s0, rmm
                  sltu         s0, s2, a2
                  addi         t6, gp, -248
                  remu         a0, t5, t2
                  srl          s9, t4, s11
                  mulhsu       a3, s7, s1
                  nop
                  andi         t6, sp, 786
                  slti         t1, s11, -1331
                  fsgnj.s      ft1, fs9, fs1
                  fcvt.w.s     s10, fa7
                  fcvt.w.s     s10, ft11
                  xori         t5, a7, 1918
                  fsgnjn.s     fs11, fa0, ft8
                  srli         s10, t0, 8
                  fcvt.w.s     s2, fa5
                  addi         a0, ra, 730
                  srli         s10, t4, 22
                  slti         s8, s0, 904
                  fcvt.s.w     ft0, s5, rmm
                  fmv.x.w      t1, ft5
                  nop
                  sub          a5, s0, s6
                  auipc        a6, 700808
                  slt          s9, a3, ra
                  fsgnjx.s     ft7, ft6, ft10
                  xori         t2, sp, -1454
                  sub          t6, s0, a2
                  addi         a3, tp, -1982
                  srli         zero, a1, 28
                  flt.s        tp, fs0, fs4
                  fmv.x.w      t6, fa3
                  divu         s10, t3, a1
                  sra          t6, zero, s2
                  sltu         s4, a2, s8
                  nop
                  mulhsu       a2, a5, t0
                  fclass.s     a1, fa5
                  slti         t0, t3, 1978
                  xori         s0, s8, -1802
                  mulhsu       tp, ra, s2
                  sub          t4, t3, s2
                  fcvt.s.w     fs9, t4, rtz
                  fmin.s       fa2, ft10, fs9
                  srl          t4, s6, s5
                  fcvt.w.s     s5, ft10, rdn
                  fsgnjn.s     ft4, fs5, ft5
                  andi         t0, s6, -315
                  fmv.x.w      s2, ft3
                  fcvt.w.s     a1, ft9, rmm
                  flt.s        t5, fa7, ft8
                  add          s5, t3, t2
                  sltiu        tp, s6, -1919
                  sll          s6, a5, t6
                  fsub.s       fs7, ft8, fa4
                  srai         s7, s0, 4
                  div          a6, s0, a7
                  divu         a0, s1, a1
                  srai         a0, t4, 17
                  nop
                  sltu         a7, t5, s8
                  nop
                  feq.s        a2, ft3, fs6
                  srai         a4, a1, 17
                  xor          a2, s7, a4
                  ori          s10, gp, 533
                  xori         t4, t6, -739
                  or           t4, a7, a5
                  fcvt.w.s     s6, fs6, rdn
                  feq.s        s8, ft6, ft5
                  sltiu        zero, t3, -767
                  fcvt.w.s     t1, ft1
                  mulhsu       tp, t2, a2
                  fmv.x.w      gp, ft4
                  flt.s        s5, fs4, ft0
                  srai         a5, s6, 16
                  mulh         s5, zero, s2
                  fcvt.s.wu    ft0, tp
                  sltu         s11, gp, a3
                  sra          t0, s1, t1
                  fsgnjn.s     fs5, fa5, fs8
                  fmax.s       fs6, fs9, fs3
                  fsub.s       ft0, ft3, fs8
                  div          t4, ra, s4
                  sltu         t6, s10, s8
                  fmax.s       ft2, fs9, fa6
                  lui          s11, 762374
                  sub          t5, zero, sp
                  add          s7, a7, tp
                  slti         a3, a0, 252
                  andi         a4, t5, -1846
                  or           t4, s11, a1
                  and          t6, t5, s11
                  fcvt.w.s     a4, fs5, rtz
                  addi         a3, tp, 1110
                  andi         a4, a6, -126
                  mulh         a6, zero, t1
                  andi         t3, s0, 2044
                  fcvt.wu.s    s2, fs11
                  srli         a6, a3, 5
                  div          a2, s11, t6
                  fcvt.w.s     s10, fa7, rdn
                  srai         a4, a7, 31
                  sltu         a5, gp, a4
                  sltiu        a6, t0, 454
                  fmv.w.x      fa1, a3
                  flt.s        s11, fs0, fa7
                  srai         a7, t3, 13
                  fmin.s       fa2, ft6, ft6
                  or           t1, s3, s3
                  nop
                  flt.s        t6, fa0, ft8
                  sltiu        gp, s10, 109
                  nop
                  rem          tp, a5, s1
                  fsgnjx.s     ft5, ft6, fa2
                  fsub.s       fs11, fs11, ft4, rtz
                  remu         t0, a2, a5
                  xor          t1, s4, t1
                  xor          s10, s5, s3
                  fclass.s     t0, fs9
                  mulh         s2, s6, sp
                  lui          gp, 885845
                  fsqrt.s      ft6, fs5, rne
                  srai         a1, s6, 24
                  mulh         s6, s5, a7
                  fmv.x.w      t0, ft4
                  sra          ra, ra, a0
                  and          gp, s8, s9
                  sra          a1, t5, s7
                  fdiv.s       fa1, ft7, fa6
                  fmv.x.w      t3, ft2
                  ori          zero, s10, -305
                  fle.s        a5, ft10, fa5
                  fdiv.s       fs1, ft10, ft7, rup
                  and          tp, a4, a5
                  div          s10, sp, t2
                  fcvt.s.wu    ft0, s1
                  xori         t4, t6, -379
                  slti         s7, s5, -1067
                  mulh         s10, s9, a4
                  auipc        gp, 751835
                  feq.s        tp, fs10, fs4
                  fdiv.s       fa4, fs8, fs8, rdn
                  sub          s10, s2, a2
                  rem          s4, a7, t6
                  slti         a5, s9, -1906
                  fmv.w.x      ft4, t1
                  mulhsu       s4, t3, s8
                  feq.s        a0, fs9, fs4
                  auipc        s2, 16262
                  fadd.s       fa2, ft2, fs3
                  div          s7, s11, t0
                  rem          a0, s0, t4
                  mul          gp, a5, ra
                  sltu         s11, ra, gp
                  slt          gp, t1, s6
                  fmax.s       fs2, ft1, fs2
                  fdiv.s       fs2, fs8, fs9
                  fmin.s       ft6, ft1, ft8
                  fclass.s     a3, ft11
                  flt.s        a6, fs5, fa4
                  lui          t2, 334903
                  addi         s4, s2, 914
                  lui          a4, 134454
                  fcvt.s.w     ft11, s11, rtz
                  slt          t4, sp, s6
                  and          t3, s1, s5
                  slt          s6, t6, s9
                  addi         t2, s3, -723
                  fle.s        t2, fs4, fa7
                  fcvt.s.w     fs11, s2, rup
                  fcvt.w.s     a7, fa3
                  slti         s0, s0, -1506
                  mulh         s11, s0, zero
                  remu         a4, a5, s4
                  fmv.w.x      ft11, s3
                  remu         s6, ra, ra
                  ori          s5, tp, 806
                  fcvt.wu.s    s11, ft3, rmm
                  mulhu        ra, s3, a4
                  auipc        a6, 551345
                  fadd.s       ft9, ft5, fa4
                  fle.s        a2, fa7, ft5
                  fsgnj.s      fa7, fs5, fs3
                  sltiu        a2, a1, 879
                  xor          s10, a2, s1
                  div          a7, a0, s8
                  sub          a2, s6, a0
                  fdiv.s       fa0, ft8, fa4, rdn
                  ori          s9, a1, 1304
                  fsub.s       ft2, fs4, ft0, rne
                  fmul.s       fs1, fa5, fs2, rtz
                  addi         a1, a1, -340
                  mulh         a3, a7, sp
                  sltu         s6, t6, a4
                  fsqrt.s      fs8, fs10
                  mulhsu       s2, s1, t1
                  srai         a7, t6, 17
                  fclass.s     gp, fs1
                  sub          s11, t0, a6
                  fcvt.s.w     fa6, t6
                  fcvt.wu.s    s6, fa0, rdn
                  mul          a5, a4, t2
                  ori          s5, t1, 1675
                  sll          a0, s6, a1
                  fclass.s     t3, fa3
                  sltu         t1, t4, a3
                  auipc        s5, 613453
                  mulh         s9, s9, s1
                  srli         a4, tp, 1
                  slti         s4, sp, 460
                  fsgnj.s      fa2, fs0, ft8
                  and          a1, s0, a0
                  fmul.s       ft5, ft9, ft1
                  slt          s6, tp, s9
                  srai         s9, s9, 7
                  addi         t3, a3, 1299
                  andi         t0, s9, -1614
                  fsgnj.s      fs1, fa7, ft0
                  add          s6, s4, s9
                  mulhu        s4, s7, a7
                  fclass.s     gp, fa4
                  fmin.s       ft0, fs1, fs4
                  fmax.s       fs2, fs11, fs10
                  ori          t1, t0, 176
                  fle.s        t6, ft5, ft10
                  mulh         tp, a2, s2
                  slli         a1, t1, 31
                  fcvt.wu.s    a6, fs1
                  lui          a2, 736331
                  srl          t3, s5, s10
                  mulhsu       s11, s6, zero
                  add          t2, s10, s9
                  add          a2, s9, t1
                  sltiu        a2, s4, 900
                  fclass.s     s8, fa1
                  mulhu        s4, s7, t2
                  fsub.s       fs4, ft4, ft5, rmm
                  fsgnj.s      fa7, ft8, ft6
                  rem          a4, tp, t4
                  srl          s0, s5, t4
                  fcvt.s.w     fs3, s5, rtz
                  fle.s        t4, fs2, ft9
                  remu         t0, t2, s6
                  divu         s5, t6, a1
                  sll          a1, t5, s2
                  divu         a0, s8, a4
                  ori          a1, s10, 235
                  div          t2, t3, t0
                  fsgnjn.s     fs9, fa4, fs8
                  fadd.s       ft2, fs10, fs4
                  xor          t2, gp, t6
                  mulh         s2, s7, t5
                  mulh         s7, s3, s0
                  flt.s        t5, fs1, ft1
                  fsgnjn.s     ft10, fs9, ft0
                  slti         a2, t5, 1523
                  xor          t2, tp, s7
                  fle.s        a7, fs4, ft1
                  mulhu        a2, ra, s1
                  fmax.s       fa4, fs10, fs7
                  feq.s        t0, fs0, fs3
                  slli         a6, t1, 19
                  fsub.s       fs8, fa1, fa7, rmm
                  fcvt.s.wu    fa6, a1, rup
                  fsgnjn.s     ft2, fs0, fs2
                  fsub.s       fa7, ft8, fs8, rne
                  fsub.s       fs2, fs9, ft3
                  xor          a3, t1, ra
                  mul          a6, t2, s1
                  fdiv.s       ft7, ft7, ft0
                  srli         a2, t6, 26
                  fle.s        s8, ft4, fs0
                  mulhu        s5, t4, s10
                  mul          t4, zero, t4
                  nop
                  addi         tp, t5, 1721
                  lui          zero, 225483
                  sll          a7, a0, a0
                  fcvt.s.wu    fs9, a7
                  fmul.s       fs11, ft1, ft0
                  fsub.s       ft1, fs4, fa5, rtz
                  slt          a6, t0, a5
                  fsqrt.s      fs5, ft9, rne
                  fmv.w.x      fs6, s9
                  nop
                  fsub.s       ft9, fs6, ft7
                  mulhsu       a3, a6, zero
                  addi         t3, s2, -608
                  fmv.w.x      ft4, t1
                  fadd.s       ft11, fs3, fa6
                  xori         s7, s5, -1603
                  sll          s10, t4, s11
                  sltiu        s11, t3, 1845
                  fmv.x.w      s10, fa4
                  andi         t1, s9, -775
                  feq.s        t2, fa1, fs0
                  fmin.s       ft9, ft5, fa2
                  addi         t3, t0, -108
                  fmul.s       fa5, ft3, fs9, rup
                  fsub.s       ft8, fs0, fs11, rmm
                  fsub.s       fs9, ft7, fs6, rmm
                  sra          a4, t6, sp
                  sub          a3, t2, s4
                  fclass.s     s5, fa0
                  div          t6, a2, t5
                  fcvt.wu.s    t0, ft0
                  sltu         s10, a3, zero
                  srai         tp, s10, 2
                  remu         t5, a3, t2
                  fsgnj.s      fa7, fa2, fs3
                  fadd.s       fa7, ft10, ft3, rup
                  rem          a4, a5, t1
                  fmv.w.x      fs3, s11
                  flt.s        a3, fs5, ft8
                  addi         s0, t2, -705
                  fmv.w.x      fs5, a6
                  srli         s10, a4, 27
                  fadd.s       ft1, ft2, ft9
                  mul          gp, t2, s7
                  mulh         s2, a5, a4
                  srl          t1, s11, zero
                  rem          t3, a0, a5
                  fcvt.s.wu    ft8, s6, rne
                  mulhsu       zero, t0, ra
                  fsqrt.s      fa3, fs10
                  div          a4, s7, t0
                  rem          a6, s5, t0
                  srl          a2, s10, s8
                  sltu         t3, s10, t6
                  fmin.s       fs10, fs6, ft3
                  mul          zero, a6, t0
                  divu         s8, s7, s2
                  fsgnjx.s     fa5, fa7, fa1
                  fmax.s       fs7, fs7, fa6
                  slli         s7, s9, 12
                  fcvt.wu.s    gp, fs3, rne
                  div          t1, t6, s0
                  div          s10, t2, s1
                  fcvt.s.wu    fa5, gp, rup
                  fle.s        a2, fa0, fa1
                  addi         t5, a1, -1860
                  div          t2, s11, tp
                  fmul.s       fs9, ft9, ft8, rmm
                  auipc        tp, 295022
                  auipc        a1, 128510
                  ori          t3, s10, 1646
                  fsgnjx.s     fs1, ft0, ft4
                  fmv.w.x      ft0, s11
                  fclass.s     a4, fs6
                  sll          a4, s0, t3
                  fsgnjx.s     fs7, fa5, ft1
                  fmv.w.x      ft7, a1
                  fmv.w.x      ft2, s5
                  div          t5, zero, t3
                  fcvt.s.wu    ft11, s10
                  fsqrt.s      ft10, ft7
                  remu         s11, tp, zero
                  sltiu        s6, a3, 554
                  mulh         t5, t4, s7
                  fsgnj.s      fs0, fa0, ft0
                  fdiv.s       fa5, ft11, fs11
                  xor          zero, s1, t5
                  ori          s7, a3, -1900
                  mulhsu       a2, s11, s4
                  or           t4, a0, t3
                  slti         gp, s0, -1105
                  fsqrt.s      ft4, fs5, rup
                  fmul.s       ft2, fs9, fa6
                  fmul.s       fa1, fs6, fs0, rup
                  addi         s7, t0, -1420
                  add          ra, s7, sp
                  andi         s9, s8, -1441
                  fsgnjx.s     fa7, ft9, fa5
                  andi         s9, s4, -1362
                  slt          a7, t0, a1
                  fle.s        s6, fs7, fa5
                  fmin.s       ft11, ft11, fa2
                  sltu         t0, s3, a6
                  slt          zero, s1, t5
                  fmv.x.w      ra, fs11
                  addi         zero, s1, 1612
                  srli         s6, sp, 28
                  fsgnjn.s     fa0, ft7, ft1
                  sll          a1, s6, a4
                  mul          t3, t5, a3
                  fsgnjn.s     fa7, ft10, fa1
                  slli         t1, s10, 7
                  fsgnjx.s     ft7, ft7, fs9
                  feq.s        s0, ft11, ft5
                  sub          s2, s7, a2
                  mulh         s9, s11, t4
                  mulhu        t4, zero, a0
                  fsgnjn.s     ft3, ft0, fa1
                  remu         t5, ra, a5
                  fmin.s       fs10, ft8, ft5
                  lui          a4, 642327
                  mulh         a2, a7, t3
                  rem          a2, a5, s3
                  srai         a6, t0, 5
                  srai         t3, s5, 26
                  slt          tp, a2, s7
                  ori          a0, a4, -636
                  fmv.w.x      fa6, t5
                  divu         s7, t4, a5
                  sltiu        s7, s3, -763
                  remu         s11, t5, zero
                  lui          t6, 468395
                  slt          t2, s3, t3
                  mulhsu       s9, s4, a0
                  divu         t0, a4, a4
                  fcvt.s.wu    ft0, t0
                  andi         t6, a5, 1781
                  div          t5, t2, s5
                  fclass.s     s2, ft3
                  fcvt.w.s     s5, fs7
                  fmin.s       ft1, ft5, fa1
                  fmv.x.w      t0, fa1
                  fadd.s       ft4, fs7, ft9, rup
                  fmax.s       fs10, fa3, fa7
                  fsgnj.s      fa0, fa1, ft8
                  fmv.x.w      zero, fa0
                  sltu         s9, s7, s10
                  fcvt.w.s     a2, fs11
                  auipc        s10, 878943
                  slli         tp, a7, 6
                  xori         s7, s0, -1286
                  sltiu        t0, t6, -1866
                  div          tp, s5, a6
                  flt.s        t5, fa0, ft0
                  srli         a4, s11, 27
                  auipc        s11, 235976
                  fmv.w.x      fs5, a6
                  ori          a6, ra, -377
                  srai         s0, a0, 6
                  fle.s        tp, ft7, fa7
                  xor          s7, s7, s9
                  mul          ra, s5, a1
                  slti         t4, gp, -96
                  and          s11, t1, t5
                  slli         s10, s8, 27
                  fsgnj.s      ft5, ft10, ft2
                  sll          s6, a0, s0
                  flt.s        ra, fs1, ft1
                  fcvt.wu.s    t5, fs4, rtz
                  fmul.s       ft10, fs3, fa4, rne
                  div          s4, s6, s9
                  addi         s5, s10, 163
                  fsub.s       fs10, fs7, ft8
                  xor          a2, s9, s10
                  srl          s5, s2, s11
                  xori         t0, s3, 65
                  fmax.s       fa7, fa1, fa6
                  fsub.s       fs8, fa1, fa3, rdn
                  sub          t2, a3, t0
                  flt.s        s6, fs0, ft6
                  addi         a1, zero, -429
                  slt          a2, s8, tp
                  xori         s8, a5, 1559
                  slti         t6, s9, -447
                  srli         s6, t5, 14
                  andi         a1, ra, -1971
                  sltu         tp, a1, s1
                  fsqrt.s      fs8, fa4
                  fmv.x.w      s0, fa5
                  slt          s0, t6, s0
                  div          s7, s8, s8
                  fle.s        s8, fs5, fa4
                  fsqrt.s      fa5, ft11, rup
                  fmul.s       fs3, fa5, fa2
                  lui          t0, 843200
                  add          t2, tp, a3
                  sra          s10, sp, s4
                  divu         t0, s10, gp
                  sltiu        s11, t0, -1502
                  fle.s        a2, ft8, ft0
                  fcvt.s.wu    fs2, a1, rmm
                  xori         s4, tp, -7
                  slti         s11, s7, 132
                  fcvt.wu.s    a6, ft2, rdn
                  and          zero, t4, a4
                  fadd.s       fs4, ft5, ft6
                  fmax.s       ft6, fa1, ft2
                  fcvt.wu.s    a6, fa3
                  fmin.s       ft9, fs2, ft3
                  fmul.s       fs1, fa3, fs4
                  fsgnjx.s     fs2, fs0, ft10
                  slt          s4, s4, t3
                  fsgnjn.s     fa6, ft10, fs8
                  srai         t0, s0, 19
                  ori          gp, s5, -841
                  fcvt.s.wu    ft5, a2, rmm
                  fcvt.w.s     a4, ft5, rmm
                  nop
                  lui          ra, 763620
                  fdiv.s       fa7, fa6, fs4
                  nop
                  flt.s        t1, fs10, ft1
                  slt          gp, a2, s11
                  fmax.s       fs0, ft7, fs9
                  fcvt.s.wu    ft1, t0
                  remu         a6, sp, s1
                  fsgnj.s      ft0, fa7, fa7
                  mulh         t0, s2, a6
                  srai         s8, s11, 27
                  fcvt.wu.s    t4, ft0
                  fdiv.s       ft6, fa1, fs11, rne
                  fle.s        t6, ft8, fa3
                  fsgnjx.s     ft10, fa0, ft0
                  feq.s        s10, fa6, fs3
                  andi         a0, t6, -1070
                  fsgnjn.s     fa6, ft0, fs5
                  slti         t5, a3, -105
                  fmin.s       fs5, fs11, ft10
                  mulhu        s10, t5, s6
                  sltiu        a2, s2, -1415
                  and          s8, ra, s1
                  and          a7, a6, t1
                  fdiv.s       ft3, fa0, fs7
                  fmin.s       ft3, ft1, fs8
                  fsgnjx.s     fa1, fa3, fa1
                  feq.s        ra, fs3, ft2
                  fmin.s       fa2, ft11, fs4
                  fcvt.w.s     t6, fa7
                  divu         s8, gp, tp
                  srl          zero, sp, a3
                  addi         a2, s9, -1833
                  fcvt.s.wu    ft3, a3, rmm
                  fcvt.s.w     ft6, gp
                  fmax.s       fs9, fa1, fa3
                  andi         a7, a5, -2004
                  sll          tp, a5, t0
                  fmul.s       fs8, fs6, fa5
                  sltu         t3, s6, s6
                  divu         a2, s2, gp
                  mul          a2, t0, a4
                  fsqrt.s      fa5, fa5
                  fmv.w.x      fs1, t1
                  xori         a2, a1, 1420
                  fsgnjn.s     fa2, fs6, fs3
                  fsgnj.s      ft0, fs11, fs8
                  sll          a0, s8, t1
                  mulhu        t4, a3, s0
                  feq.s        a7, fa0, ft6
                  flt.s        a1, ft2, fa4
                  nop
                  xor          t0, a4, t4
                  srai         a3, a4, 10
                  sltu         s7, ra, tp
                  xori         s2, t6, -1974
                  slli         t1, t4, 14
                  slti         a0, t4, 1898
                  sub          t2, s5, s1
                  xor          s0, sp, t2
                  or           a1, t1, t1
                  slt          t5, t2, a4
                  mulhu        ra, t2, t6
                  addi         a1, t2, -1844
                  slti         a5, t4, 1048
                  sub          s2, s5, a0
                  sltiu        s9, t1, -1965
                  slt          s6, a6, s3
                  mul          zero, s11, s10
                  mul          t0, t2, s3
                  addi         a0, a1, -125
                  sltu         t3, t0, a4
                  fclass.s     a5, fa5
                  fle.s        s11, fs1, fs10
                  fclass.s     s2, fa5
                  feq.s        t2, fs1, fs5
                  fcvt.s.w     fs0, a5, rmm
                  fclass.s     s6, fs10
                  and          t5, t4, a3
                  andi         t4, a1, -306
                  fsqrt.s      ft1, ft8
                  fcvt.s.wu    ft10, s0, rdn
                  fsgnjn.s     ft1, fs7, ft2
                  rem          s9, t5, a0
                  sub          a5, t6, a1
                  sltiu        s6, s9, 1798
                  fcvt.s.w     ft4, a6
                  fcvt.wu.s    tp, fs4
                  fcvt.s.wu    fa0, s6, rup
                  srli         s11, s1, 27
                  sra          t2, t1, a3
                  sltu         t5, s10, s8
                  mulhu        s9, s1, sp
                  mul          s4, a7, s3
                  slli         t0, t3, 28
                  sra          s4, t3, s4
                  fmin.s       ft5, fs2, fa7
                  fcvt.wu.s    a1, fs6
                  fclass.s     a1, ft1
                  fsqrt.s      ft7, ft5
                  div          t1, a3, t3
                  fmv.x.w      t1, ft11
                  sltu         tp, tp, s8
                  srai         t2, s10, 2
                  fmin.s       ft8, fs3, ft9
                  sll          s9, t6, a5
                  and          t3, a6, s3
                  fmax.s       fa6, fs7, fs2
                  srli         zero, a1, 19
                  fsqrt.s      ft6, ft3, rtz
                  sra          tp, tp, a0
                  xori         tp, s7, -916
                  fcvt.s.w     fs5, s9, rtz
                  remu         t4, gp, s10
                  sub          a5, t6, a4
                  fcvt.wu.s    t1, fs0
                  srl          gp, s11, gp
                  fsgnjx.s     ft2, ft11, ft3
                  slt          s4, s8, a0
                  auipc        gp, 425394
                  add          t6, s5, t2
                  add          a2, t6, s6
                  sltiu        a3, s5, 1620
                  sra          a7, s1, s5
                  slli         a0, zero, 11
                  div          t6, a5, zero
                  ori          a4, t6, 1706
                  fsgnjx.s     fa7, fa5, ft2
                  xor          t6, s5, s6
                  fcvt.s.wu    fs9, t2
                  sub          s10, t6, sp
                  fcvt.s.wu    ft8, s8, rdn
                  rem          s4, a2, a7
                  fmv.x.w      a1, fa0
                  mulhsu       s4, zero, a7
                  mulhsu       t2, t1, t0
                  divu         a0, a3, s4
                  fcvt.w.s     a6, fa5, rmm
                  fadd.s       fs0, fs6, ft8, rmm
                  and          a3, s9, s8
                  fadd.s       fs5, fs3, fa6
                  xor          zero, t1, t5
                  fmax.s       fs5, fa0, ft6
                  add          t5, t2, a2
                  sub          zero, t2, s9
                  flt.s        a5, ft4, ft5
                  fdiv.s       ft7, fs9, ft5
                  addi         a5, s7, -1324
                  sltu         a5, s6, a1
                  fmax.s       fa6, ft8, ft11
                  fle.s        s8, fa2, fa7
                  add          gp, s0, s1
                  slt          s7, a2, a5
                  sltiu        a5, s9, -252
                  sltu         s0, zero, s7
                  or           t4, a6, a5
                  mulh         t3, s0, t6
                  fadd.s       ft5, fs0, fs5
                  auipc        s6, 512351
                  srli         tp, s9, 18
                  slt          s4, t3, t5
                  fmin.s       fa2, ft11, fs8
                  ori          a4, s11, 1884
                  divu         s2, s3, gp
                  andi         gp, a2, 1698
                  fmv.x.w      s7, fs4
                  lui          a2, 93392
                  sll          a7, t2, t2
                  rem          s4, s4, s11
                  fsgnjn.s     fs3, fa1, fs10
                  fsgnjn.s     ft3, fs9, fs7
                  fmv.x.w      s11, fs4
                  fmv.w.x      fs10, t2
                  srai         t0, t1, 27
                  ori          a0, s2, 366
                  sll          a3, a5, a5
                  fmul.s       ft0, fs6, ft11
                  mulh         s8, t5, a4
                  add          a5, gp, s1
                  fcvt.s.w     fs11, s1
                  fle.s        a1, fs5, fs9
                  fsub.s       fs6, ft11, fs4, rtz
                  mulh         t3, a0, ra
                  fdiv.s       fs0, fs10, fs9
                  mulhu        a6, s1, ra
                  xori         s10, s11, 1559
                  srl          a1, t0, s0
                  rem          t1, tp, s6
                  fdiv.s       ft10, ft11, fs8, rtz
                  mulhu        s9, s5, s8
                  slt          a5, a0, a2
                  lui          a7, 20485
                  ori          a7, s8, 646
                  div          a0, zero, s9
                  fsqrt.s      ft2, fs3, rtz
                  fsqrt.s      fa5, fs4
                  fmv.x.w      t1, ft8
                  mul          a6, s4, s11
                  sll          t5, s8, s7
                  rem          a2, t0, t5
                  fclass.s     a1, fs9
                  mulhsu       ra, s7, a7
                  fsqrt.s      fa5, fa6
                  fmv.x.w      s8, fs1
                  fsgnjn.s     ft11, fs2, fs9
                  add          a6, a5, zero
                  mul          a2, a7, t6
                  fcvt.wu.s    s6, fa6, rmm
                  mulh         s5, s1, tp
                  mulhu        t5, gp, s8
                  fmul.s       fs0, fa7, ft5
                  fsgnjx.s     fs1, fa2, fa5
                  fsgnjx.s     ft7, fs9, fs9
                  sra          s11, a5, zero
                  fle.s        a4, fa6, fa7
                  fmv.w.x      fa6, tp
                  slti         s2, a5, -845
                  and          t0, tp, zero
                  remu         s7, a4, s6
                  mulh         gp, s6, t4
                  sltiu        t6, s1, -47
                  fmax.s       ft10, fs2, fa1
                  mulhsu       t5, s4, tp
                  sub          s9, ra, ra
                  fsgnjx.s     fs5, fa6, fa5
                  sra          a5, s5, a2
                  rem          s8, ra, s4
                  fsqrt.s      fa0, ft6
                  addi         s5, gp, 1633
                  sll          s11, t0, a4
                  fle.s        s10, fa2, fa2
                  fmin.s       fs5, fs7, fa1
                  fcvt.w.s     s10, fs3
                  slti         tp, s2, 305
                  sub          t0, t3, s5
                  fmin.s       fa5, fs10, ft4
                  srli         ra, a3, 21
                  fsqrt.s      fs9, ft11
                  slt          s4, s4, s10
                  feq.s        s8, fs11, fs10
                  fcvt.wu.s    a5, fa0, rtz
                  fsgnj.s      ft9, fa0, fs1
                  flt.s        a3, ft4, fa1
                  remu         t5, sp, ra
                  fdiv.s       ft10, fs3, fa2, rdn
                  fcvt.wu.s    t1, fa7
                  fmin.s       fs5, fs4, fs7
                  fcvt.s.w     ft5, t3, rmm
                  fcvt.w.s     t3, ft0, rdn
                  mulhu        s0, t6, tp
                  fcvt.wu.s    a1, fs10, rne
                  fcvt.s.w     fs8, s9
                  fsub.s       fa3, fs4, ft1, rup
                  sll          s2, a7, s10
                  srl          a3, ra, s5
                  sll          s5, s5, t3
                  fcvt.wu.s    a5, fa3, rne
                  fsgnjx.s     ft8, ft1, fs3
                  mulh         s2, a4, s5
                  fsqrt.s      fa2, fa4, rdn
                  ori          t0, s8, -367
                  add          s8, tp, s7
                  fmul.s       fs6, ft0, fa7
                  andi         t6, t4, 1007
                  fcvt.s.wu    fs8, sp, rup
                  lui          a0, 580114
                  slli         a4, s11, 12
                  mul          tp, s0, s5
                  andi         t2, a3, 1065
                  mulh         a6, s10, a4
                  nop
                  sub          a0, s10, s0
                  fadd.s       ft4, fa5, fs6, rtz
                  sltu         t0, sp, ra
                  srli         ra, sp, 24
                  fmv.x.w      s4, ft3
                  feq.s        a7, ft4, fs1
                  fdiv.s       fs9, fa1, fa6, rtz
                  div          t4, gp, s5
                  feq.s        ra, fa0, ft6
                  fdiv.s       ft0, ft4, fa2, rmm
                  xori         a2, t5, 1793
                  fsgnjx.s     fa3, fs5, fa7
                  div          s6, s6, a7
                  nop
                  fsgnjn.s     fa4, fa5, fa3
                  fcvt.s.wu    fs5, t3, rne
                  sll          ra, s11, a4
                  rem          t0, s4, a2
                  srai         gp, s8, 27
                  mulhsu       a3, s1, s7
                  fcvt.s.wu    ft10, a2
                  fcvt.wu.s    s8, fs7, rup
                  mulh         a6, s4, s5
                  div          s5, s0, s5
                  fcvt.s.w     fs5, t6, rne
                  feq.s        s0, fa6, fa6
                  add          s5, t2, a5
                  fadd.s       ft7, ft4, fa7
                  nop
                  xori         s7, a4, -1204
                  mulhsu       t2, s7, t0
                  lui          s8, 938715
                  fcvt.w.s     t3, fa3
                  rem          s2, t2, a3
                  fclass.s     tp, fa4
                  fdiv.s       fs11, fs6, ft0
                  addi         s10, s10, -437
                  srai         ra, t1, 4
                  slt          s4, sp, s9
                  fsgnjx.s     ft8, fs4, fa3
                  mulh         ra, s3, t2
                  xori         s5, s2, 1615
                  flt.s        s6, fs9, fs0
                  srl          tp, t0, s9
                  fdiv.s       fs7, fs8, ft1, rtz
                  xor          t2, a0, t5
                  fsgnjn.s     fs4, fs2, ft8
                  rem          s7, s5, s1
                  fmul.s       ft8, fa5, fs5, rne
                  ori          t6, s0, 1769
                  slli         s11, t3, 26
                  remu         s9, s11, a0
                  sltiu        s10, s11, -1487
                  flt.s        s0, fs5, fs5
                  fcvt.s.wu    fs5, t0
                  auipc        s4, 173098
                  flt.s        s11, fs3, fs5
                  remu         a5, s8, a2
                  lui          t4, 420099
                  slt          a4, t3, s10
                  fdiv.s       ft9, fs10, ft0, rtz
                  sub          s5, t1, t0
                  lui          gp, 272136
                  flt.s        a7, ft3, ft5
                  slti         a2, s1, 797
                  sltu         a6, t4, a1
                  fmax.s       fa7, fs3, ft11
                  sltiu        s10, a7, -1221
                  slli         a5, t2, 2
                  fsgnjx.s     fa3, fa0, ft6
                  nop
                  fsgnj.s      fs4, ft11, fs5
                  fcvt.w.s     a6, fs1, rne
                  add          s11, a6, t6
                  fle.s        t0, fs4, fs2
                  slli         zero, a7, 10
                  fsgnj.s      fa3, fa5, fa0
                  ori          a5, s2, -475
                  mulh         a7, t2, gp
                  remu         s9, sp, a2
                  slli         a2, t6, 16
                  sub          s7, s3, t0
                  fsqrt.s      ft5, ft9, rne
                  fmax.s       ft7, fa4, fa4
                  fmv.w.x      ft5, s9
                  and          s5, s3, s1
                  srli         t4, zero, 23
                  fmul.s       fs1, ft4, ft1
                  add          t5, s3, a6
                  rem          a1, s8, sp
                  sltiu        s9, s0, -156
                  flt.s        s11, ft9, fa6
                  slti         s10, s3, -1349
                  fcvt.s.w     ft6, a3, rne
                  fcvt.w.s     s10, fs6, rtz
                  sltu         a2, s1, s0
                  fadd.s       fs6, ft9, ft7, rdn
                  slli         ra, a1, 26
                  sra          a5, s3, t3
                  and          a5, t5, a2
                  srai         t1, a2, 24
                  slt          a2, t5, sp
                  xori         s7, s3, 1256
                  srl          s8, a2, s11
                  remu         t5, t2, a5
                  and          a7, s1, t2
                  nop
                  fsqrt.s      ft3, ft4
                  fmul.s       ft5, ft2, ft9, rmm
                  slli         s10, s9, 30
                  lui          a7, 524164
                  fsgnjn.s     ft5, ft2, ft3
                  srli         a6, t6, 5
                  fmv.w.x      ft10, a7
                  fle.s        s10, ft6, fa0
                  add          a6, s4, a7
                  nop
                  sub          t0, s11, ra
                  sub          a1, a0, gp
                  srli         s7, a2, 1
                  fmul.s       fs8, ft5, fs8, rne
                  fcvt.s.w     ft0, s6, rup
                  fmax.s       fa3, fa7, fs3
                  slt          s4, s3, t6
                  fcvt.s.wu    fa1, t3, rmm
                  fsgnjx.s     ft0, fa4, fs9
                  fsub.s       ft3, fs0, ft0
                  mulh         a6, s7, s7
                  fclass.s     a7, fs2
                  mul          s5, s6, s0
                  fsub.s       fa3, fs8, fa5
                  fcvt.wu.s    s6, fs11
                  fsub.s       ft9, fa2, fs0, rtz
                  fcvt.s.wu    fs4, a0
                  fsgnj.s      fa0, fs2, fs4
                  srai         s0, a0, 26
                  feq.s        s0, fs8, ft4
                  lui          t0, 269422
                  slli         t2, s8, 27
                  fmin.s       fs3, fs1, fs11
                  fmv.w.x      ft8, tp
                  fmax.s       fs9, fs8, ft5
                  auipc        s7, 756177
                  feq.s        gp, fa2, fs11
                  xori         s4, a2, -399
                  fmul.s       fs0, fa4, ft9
                  fadd.s       ft2, ft4, fa7, rdn
                  fsgnjn.s     fa1, fs8, ft0
                  andi         a3, a6, 1212
                  and          t3, t0, a3
                  fcvt.w.s     s2, fs9
                  fsqrt.s      fs0, fs10, rmm
                  srl          gp, t5, s7
                  sub          gp, t3, t2
                  srl          s0, t2, a3
                  remu         s8, s7, a4
                  sub          s9, gp, t5
                  slli         s11, a0, 29
                  divu         s2, s5, t6
                  sub          a6, t0, t0
                  mulhsu       gp, a2, t4
                  xor          a3, s3, s1
                  fsgnj.s      fa7, fa7, fa0
                  fclass.s     a0, fa6
                  or           t3, sp, t2
                  xori         a5, s4, 1516
                  fle.s        t0, fs10, fs7
                  sll          t0, a4, t5
                  fmin.s       ft11, fs7, fs10
                  fsub.s       ft9, ft2, ft3
                  sub          a7, s0, s6
                  sll          s4, t1, gp
                  slti         t2, s7, -1635
                  sltiu        t3, gp, 1685
                  div          a1, s3, s11
                  auipc        s7, 451320
                  fsub.s       fs9, ft9, fs0
                  fcvt.s.w     fs4, t3
                  srli         t0, a3, 13
                  fmul.s       fs8, fa4, ft2
                  sltiu        t4, t2, -352
                  srli         t2, s8, 14
                  xor          ra, t0, gp
                  div          s10, s0, tp
                  feq.s        a7, fa6, fs10
                  srl          a6, a2, t5
                  fmax.s       fs3, fs7, ft8
                  fmin.s       fa6, ft0, ft3
                  sltiu        t0, s0, -804
                  sra          s8, a6, t2
                  rem          a0, a0, sp
                  slt          a4, s9, s8
                  srl          s10, t4, a0
                  rem          t6, t3, s3
                  mulhu        t1, a0, a1
                  mulh         t0, s8, s5
                  lui          tp, 488301
                  fsub.s       fa4, fa1, fs9, rtz
                  fmax.s       fa3, fs4, fa5
                  sltiu        a3, t3, -1157
                  sltu         zero, s10, ra
                  fmv.x.w      a3, fs1
                  xori         a6, a3, -1960
                  srli         a7, s7, 14
                  sll          t6, a7, t0
                  fcvt.s.wu    fs6, sp, rmm
                  fmv.x.w      a3, ft2
                  lui          s2, 456313
                  sltu         t3, t3, a3
                  fsgnj.s      fs0, ft11, ft7
                  slt          s4, t4, t2
                  srli         s0, a6, 28
                  slli         t2, a7, 5
                  and          ra, t0, s3
                  add          t5, a4, t6
                  srli         a3, s10, 28
                  rem          t5, a1, ra
                  auipc        a6, 401122
                  andi         gp, a1, 1558
                  ori          a6, tp, 1066
                  fcvt.wu.s    s9, fa1
                  fmul.s       fs2, fs0, fa6
                  fsub.s       fs8, fa3, fs6, rmm
                  sltu         a1, t3, s6
                  rem          a2, s4, a2
                  fmv.w.x      fa6, s3
                  addi         a4, s6, -1754
                  fsqrt.s      ft3, fa7, rmm
                  fmv.w.x      ft2, s7
                  feq.s        a0, fs9, ft0
                  fsub.s       ft5, fa0, fa0, rne
                  fsgnjn.s     ft3, fs1, fs3
                  sll          tp, s10, tp
                  mulhu        a5, s11, s8
                  srl          t2, t6, t4
                  xor          a5, a5, a6
                  fcvt.wu.s    s10, ft8
                  fmv.x.w      a0, fa1
                  fle.s        t2, fa7, ft6
                  auipc        a6, 641745
                  mulhsu       s10, ra, t4
                  divu         a1, s2, s11
                  srl          s8, gp, a2
                  slt          a6, s10, a7
                  fcvt.s.w     fs9, s8
                  sub          s4, s4, tp
                  or           zero, t4, t4
                  rem          s6, s6, a6
                  slt          a3, s8, ra
                  divu         s4, gp, a1
                  fle.s        t5, fa6, ft11
                  sltu         a7, a5, t3
                  fsub.s       fa7, ft10, fs11, rup
                  fsgnj.s      fs8, fs7, fs3
                  fsqrt.s      fa1, ft4, rmm
                  fmax.s       ft9, ft7, ft11
                  remu         s7, sp, s1
                  srai         a1, s4, 13
                  andi         gp, s5, -1067
                  fadd.s       ft8, fs11, fa5, rup
                  fclass.s     s11, fs0
                  fsqrt.s      fa3, ft7, rne
                  xori         a4, tp, 966
                  fle.s        s9, fa3, fs7
                  sra          a0, s7, zero
                  fmul.s       fs2, fs4, fs6
                  fmv.w.x      fs7, s8
                  fmul.s       ft2, ft11, fa6
                  or           a3, s9, gp
                  or           a4, gp, t0
                  fmv.w.x      ft2, s4
                  fsgnjx.s     ft11, fs11, fa3
                  and          s2, s4, s2
                  fsub.s       ft11, fs1, ft2, rne
                  fdiv.s       fs1, ft3, fa3, rmm
                  mulh         s8, t1, t2
                  sltu         zero, a0, sp
                  fmul.s       ft7, fs9, fs5
                  auipc        s11, 903864
                  mulhsu       a4, t3, a7
                  divu         s5, ra, s0
                  andi         t5, t5, -435
                  fmin.s       ft11, fs0, fs11
                  divu         s7, zero, tp
                  mul          t5, t3, t3
                  nop
                  slli         a0, t2, 11
                  fdiv.s       fs10, fs2, fs5, rne
                  sltu         t6, zero, a3
                  fle.s        t2, fa0, fs4
                  sltiu        s5, s9, -1694
                  fcvt.wu.s    s6, fa0, rup
                  slt          s9, t6, a1
                  srai         s9, t5, 0
                  fmv.x.w      a1, ft3
                  mul          s11, t4, a7
                  mul          s10, s3, gp
                  fsqrt.s      fs0, ft11
                  fmv.w.x      fs1, a1
                  slt          a5, s0, a0
                  fsgnjx.s     fa6, fa0, fa0
                  ori          s7, a5, 1017
                  divu         t5, a0, s11
                  sub          s2, a5, a3
                  slli         s5, a6, 17
                  mulhu        tp, t4, s8
                  sll          t5, s3, t0
                  lui          a3, 814689
                  fcvt.wu.s    a4, ft2
                  fmv.w.x      fs1, s10
                  srai         t4, s3, 30
                  slli         s5, a7, 24
                  div          t4, a4, s1
                  rem          s6, t5, a6
                  fdiv.s       fs9, fa3, fs5
                  mulhsu       t6, a0, a0
                  fmul.s       fa5, fs7, fs0
                  fsgnjx.s     fs4, ft0, ft4
                  divu         a2, ra, zero
                  rem          t6, s0, a1
                  fsgnj.s      fa3, fa3, fs0
                  fsgnj.s      fs4, fa0, fa5
                  fsgnjx.s     fa3, fa5, fa0
                  nop
                  or           a6, a5, s3
                  fadd.s       fa5, fs2, fs1
                  nop
                  fsqrt.s      fa1, fs3, rup
                  fcvt.wu.s    a0, ft0
                  slli         a4, t1, 30
                  fsgnj.s      fs6, fa0, fa2
                  fcvt.s.wu    fa3, ra
                  div          s6, ra, s5
                  nop
                  fmv.x.w      t2, fa6
                  divu         a7, a3, a0
                  fclass.s     t2, fa3
                  sltu         t1, s5, ra
                  fadd.s       fa5, fs5, fs6, rup
                  slti         a2, s6, -715
                  srli         s11, a4, 4
                  slti         s11, t5, 1041
                  remu         a4, s11, t1
                  fmul.s       ft5, fa6, fa4
                  fsgnj.s      fa2, fs7, ft9
                  srli         ra, s7, 28
                  sub          a4, s1, zero
                  fsub.s       ft3, ft11, fs3
                  fdiv.s       fs0, ft4, ft11
                  slli         ra, tp, 6
                  fmv.w.x      ft7, t5
                  sll          a6, s1, tp
                  feq.s        s4, fs10, ft11
                  add          s8, a7, s0
                  mulhu        t6, s10, a5
                  fsqrt.s      fs5, fa2, rtz
                  fcvt.wu.s    s4, fa4, rdn
                  srl          a4, a5, a5
                  sltu         ra, s4, a7
                  xor          t1, a5, a7
                  srl          zero, ra, t0
                  nop
                  srai         s9, tp, 18
                  mulh         zero, s11, s7
                  srli         a3, s9, 12
                  sll          t6, a1, s9
                  fdiv.s       fa4, fa6, fs0, rmm
                  add          a7, t2, s10
                  fcvt.s.w     ft1, s3, rmm
                  sltu         tp, sp, s9
                  mulhu        t2, a4, s8
                  srli         s11, t3, 9
                  feq.s        a7, fa7, fs6
                  fmul.s       ft10, ft2, fs8, rne
                  andi         zero, t4, 1496
                  fdiv.s       fa2, fa5, ft2, rup
                  sra          s6, s1, t1
                  srl          ra, t1, tp
                  andi         a5, a2, -1570
                  fcvt.w.s     s7, fa5
                  rem          s7, tp, s10
                  andi         ra, t5, 1157
                  remu         s8, a0, ra
                  fcvt.w.s     s7, fs5, rne
                  fcvt.s.w     ft6, s6, rtz
                  fcvt.wu.s    zero, fs5
                  sub          t2, s4, t5
                  srl          s10, s11, t1
                  nop
                  sltu         s11, ra, zero
                  fclass.s     t2, ft6
                  mulh         zero, s6, t6
                  fdiv.s       ft5, fa0, ft10, rdn
                  srli         s10, s5, 10
                  mul          s9, t6, a0
                  mulh         s2, s8, s6
                  fclass.s     t3, fa7
                  fcvt.s.w     fs0, t1
                  fsqrt.s      fa3, fs4, rne
                  nop
                  nop
                  sltiu        t1, t3, 799
                  fmul.s       fa3, fs6, ft3, rdn
                  sll          a2, zero, t4
                  fsqrt.s      fa1, fa6, rdn
                  add          t3, a2, t0
                  flt.s        a7, fa3, ft2
                  fmin.s       fa2, ft7, ft0
                  sub          t3, a7, a1
                  sra          t1, s11, s10
                  sltu         a1, a5, a5
                  xor          a3, t1, a3
                  sltu         t2, tp, s5
                  lui          a4, 819185
                  slti         a4, s2, 1038
                  fsgnjx.s     fs6, fs1, ft2
                  flt.s        t2, fa7, fa2
                  fsub.s       ft6, fa7, ft8
                  and          t3, t2, s0
                  div          a1, a0, zero
                  fsub.s       fa0, ft5, ft2, rmm
                  auipc        t0, 60638
                  mulhsu       a1, s5, ra
                  or           s6, s2, t2
                  or           t4, a3, a3
                  fcvt.s.w     fs3, s2
                  fcvt.w.s     t1, fs10
                  div          s4, gp, s6
                  mulhsu       a5, s10, ra
                  fsgnjx.s     fs8, ft6, fs6
                  fmax.s       ft4, ft0, fa6
                  fsgnj.s      ft9, fs6, fs2
                  nop
                  fsqrt.s      fs1, fa7
                  andi         t3, a6, 272
                  remu         a7, zero, s6
                  fsgnjn.s     fs3, ft10, fs5
                  sll          s10, s2, a6
                  fsqrt.s      ft5, fs6
                  fclass.s     a7, fs1
                  fdiv.s       fa3, fs4, fa0, rtz
                  fsgnjn.s     fs0, fs10, fa7
                  mulhsu       s9, s11, a0
                  sltu         ra, s10, t6
                  ori          a4, t5, -1396
                  mulhsu       tp, ra, ra
                  fsqrt.s      ft9, fs1, rmm
                  fmv.w.x      fs0, a6
                  fmin.s       ft6, fs6, fs9
                  srl          a3, zero, a7
                  srl          s10, a2, s6
                  fsgnjx.s     fs10, fa4, ft2
                  ori          a5, s9, 1762
                  fmax.s       fs11, fa7, ft4
                  sltu         t4, a7, t4
                  or           s2, a1, s5
                  auipc        a2, 466454
                  fcvt.s.w     fa3, a1, rdn
                  remu         a4, s2, zero
                  divu         t1, ra, t4
                  andi         a4, a6, 1852
                  feq.s        tp, fs8, ft0
                  fsub.s       ft2, fs7, fa3
                  andi         s8, sp, -252
                  fcvt.wu.s    s10, fa7
                  flt.s        zero, fs0, ft5
                  fle.s        s2, fa7, ft2
                  fmv.w.x      fa4, s9
                  addi         a0, s5, -654
                  flt.s        s2, fa6, fa6
                  fsub.s       fa3, fa7, ft2, rne
                  slti         zero, s11, -1485
                  flt.s        s0, ft5, fs7
                  slli         a6, s1, 3
                  fmv.x.w      s11, fa1
                  fsgnj.s      fs5, ft5, fa1
                  fadd.s       fa6, fs10, fa7, rne
                  fdiv.s       fs10, fs3, ft2, rne
                  add          tp, a1, sp
                  lui          s5, 750514
                  rem          t3, s8, s11
                  lui          a4, 828981
                  fsub.s       ft11, ft5, fa1, rdn
                  xori         s7, s3, -981
                  rem          t1, s9, t1
                  ori          a2, ra, -535
                  andi         a0, t0, -1343
                  auipc        s0, 279077
                  fmin.s       fs8, fa6, fs7
                  auipc        s11, 269402
                  sub          gp, s9, a3
                  or           t2, t3, s2
                  fsqrt.s      fa4, fs9, rdn
                  and          t1, s2, s3
                  rem          a5, t0, t1
                  mulhsu       a1, t4, s4
                  slt          t3, s6, a4
                  srli         t6, zero, 14
                  nop
                  fmin.s       fs1, fa4, fs9
                  fmv.w.x      fa6, gp
                  srli         t2, a0, 26
                  xori         t0, s3, 1907
                  fclass.s     a0, fa0
                  and          tp, a7, a7
                  rem          a0, t2, a1
                  mul          s10, a5, a5
                  sltu         a1, ra, s7
                  fsgnjn.s     ft6, fa0, ft2
                  lui          t6, 242640
                  fsgnj.s      ft9, fa1, ft1
                  rem          t6, a1, a3
                  sub          s7, s8, gp
                  sll          t4, s7, s5
                  srl          s11, gp, t3
                  divu         a1, t5, a1
                  sltiu        s9, s6, 494
                  srai         t4, s10, 29
                  sll          tp, a2, t6
                  sltiu        a5, s4, 85
                  fsgnj.s      fa0, ft11, fa0
                  add          t5, gp, a4
                  fsqrt.s      fa2, ft4, rtz
                  auipc        t4, 702068
                  fcvt.s.w     fs10, s0, rup
                  fmul.s       fa2, ft9, fs5, rtz
                  andi         s4, a6, 1655
                  fdiv.s       fa5, ft2, fs3, rmm
                  fsgnjn.s     ft0, fs7, fa7
                  fsgnj.s      fs5, fs9, fa4
                  auipc        t2, 887294
                  xor          s8, t5, s3
                  fmv.x.w      s4, fs9
                  fmax.s       fs3, ft6, ft9
                  sltu         zero, s1, s0
                  fclass.s     a7, ft2
                  fsub.s       ft6, fs1, fs10, rdn
                  fdiv.s       ft4, fs1, fs10, rmm
                  mulh         a7, a3, s5
                  andi         t3, s7, 1518
                  sub          a6, s10, s3
                  fle.s        s2, ft2, fs4
                  or           s7, t5, s9
                  sub          a7, t2, a1
                  addi         ra, ra, 1016
                  fadd.s       ft3, fs2, fa0
                  sub          s4, a2, a0
                  srl          t1, ra, s7
                  or           a4, s10, a3
                  mul          t4, s11, a4
                  andi         t1, s9, -1735
                  srl          a1, s2, s7
                  remu         s9, t6, t5
                  fmin.s       ft6, fa5, fa6
                  fsub.s       ft2, fs9, ft4
                  fmv.w.x      fa4, ra
                  slt          s4, t6, s1
                  fsqrt.s      ft0, fa6
                  slt          a0, a4, s1
                  flt.s        t3, fs5, fs1
                  add          t3, s9, s8
                  flt.s        t5, ft3, ft8
                  and          ra, gp, s7
                  fmul.s       ft1, fa7, ft10
                  sltiu        ra, t2, 388
                  xori         s4, t0, 52
                  xor          tp, s2, gp
                  div          a6, s9, a2
                  fadd.s       ft0, fa6, fs2, rne
                  addi         s0, s4, 339
                  fsgnjn.s     ft0, ft0, fa6
                  slti         t4, s1, 522
                  addi         a6, s11, 549
                  fadd.s       ft4, ft5, fs4
                  or           a5, s0, a4
                  nop
                  mul          a7, t2, tp
                  sub          zero, a0, s11
                  slt          a3, a3, s10
                  sltu         s9, a5, a3
                  fcvt.w.s     s2, fs9
                  fcvt.s.wu    fa0, s9
                  mulh         t1, t2, a4
                  ori          s2, t1, -993
                  rem          s5, s11, s3
                  fsgnj.s      fs4, ft7, fs2
                  fle.s        a1, fs2, fs2
                  fmax.s       fs6, fs2, fa3
                  fdiv.s       fs5, ft2, fs3
                  mulhsu       ra, a4, s0
                  fsqrt.s      fs4, ft7, rne
                  sltiu        s5, a2, 337
                  fmin.s       fa6, ft9, ft4
                  nop
                  mulhsu       s10, t4, t6
                  srl          s6, s5, a1
                  nop
                  fle.s        s9, fs2, fs4
                  sltiu        t5, a7, -1197
                  sll          s5, gp, zero
                  fadd.s       fa1, fs4, ft10
                  div          s6, zero, s11
                  feq.s        t1, fs9, ft10
                  sub          s9, t4, a7
                  fmul.s       fs3, ft3, fs1
                  srl          t3, ra, a0
                  sltiu        t4, tp, 961
                  lui          t3, 564458
                  andi         t4, a2, 259
                  feq.s        t2, fa4, ft11
                  sltu         t5, gp, tp
                  fcvt.w.s     s5, fa5
                  sra          a3, s10, s6
                  fle.s        a6, fa5, fs6
                  remu         t6, a6, a5
                  xori         a1, s2, -1977
                  remu         t6, a6, a2
                  fsgnjx.s     fs7, fa5, fs3
                  fmv.x.w      s0, fa2
                  sll          s9, a5, s5
                  fsgnj.s      ft9, fs8, fa6
                  slli         t0, a2, 23
                  lui          a1, 458427
                  fsqrt.s      ft4, ft9, rtz
                  xor          t1, a6, s1
                  div          a5, s0, s0
                  divu         a7, s6, t6
                  or           a6, s11, tp
                  slli         a5, a7, 0
                  slti         s8, s6, 1465
                  mul          t3, s1, t2
                  fle.s        a4, fa1, fa7
                  srli         s4, a7, 27
                  sra          a5, s11, a0
                  rem          tp, gp, t0
                  or           a0, a3, s11
                  xor          a1, s3, t6
                  srl          a5, a4, t2
                  srli         s6, s9, 17
                  fsgnjn.s     ft3, fs2, fs8
                  mulhsu       s4, a6, a4
                  fsqrt.s      fs6, fa1, rdn
                  lui          s10, 351809
                  srli         a3, s8, 14
                  divu         a0, s9, a5
                  divu         t3, t5, s7
                  divu         tp, a0, a0
                  srl          s6, s1, s3
                  rem          a0, s1, a0
                  fsgnjn.s     ft2, fs0, ft5
                  fle.s        a1, ft7, ft1
                  fle.s        t3, fa3, fs4
                  fcvt.s.wu    ft1, s5
                  fmax.s       fs3, ft5, fs9
                  fsub.s       fs9, fs6, ft1, rtz
                  add          a7, tp, s8
                  fmax.s       ft7, fa1, ft4
                  fcvt.w.s     s7, ft5
                  flt.s        a6, ft7, fs6
                  fcvt.wu.s    t0, fa5
                  mul          a5, s5, t4
                  fsgnjx.s     fs9, fs10, ft1
                  fsgnjn.s     fa6, fs8, fs5
                  lui          s9, 862386
                  fsgnjn.s     ft5, fs3, fa7
                  nop
                  fdiv.s       fs2, ft8, fs11, rmm
                  fmax.s       ft6, fa0, ft8
                  flt.s        s8, ft7, ft8
                  lui          zero, 617027
                  mul          s8, s5, a0
                  mulhsu       t3, s4, a4
                  srai         t2, s10, 30
                  andi         s5, t1, -271
                  srai         s5, ra, 23
                  and          zero, zero, s1
                  fsgnj.s      ft3, fa2, fs6
                  feq.s        ra, fs4, ft10
                  sltu         t5, s0, s5
                  addi         t6, s1, -1870
                  rem          s4, a7, s3
                  fmv.x.w      t2, ft10
                  fle.s        a5, fs2, fs10
                  fmax.s       fs10, ft6, ft1
                  mulhu        t6, s7, s5
                  nop
                  xori         a0, s10, -590
                  and          s5, a5, a2
                  andi         s6, t6, 568
                  xor          s8, a7, a7
                  srai         a3, s7, 19
                  add          t4, t4, t4
                  fcvt.s.wu    ft6, t6, rup
                  fcvt.s.wu    fs1, t5
                  mulhu        zero, t3, sp
                  mulhsu       s7, ra, s1
                  slti         s11, s1, 69
                  fmax.s       ft6, fs4, fs10
                  slti         s9, t1, 531
                  mul          a5, tp, sp
                  xor          t4, s0, s4
                  slti         a2, gp, -272
                  fdiv.s       fa7, fs1, fa0, rne
                  flt.s        s9, ft11, ft5
                  sra          a4, ra, t2
                  mulhsu       s4, s3, t5
                  and          t0, s4, s3
                  andi         s10, t2, 889
                  xor          t3, s4, s4
                  mulh         s6, s11, t4
                  mulhu        t0, s7, t0
                  srai         s8, a2, 28
                  feq.s        t6, ft4, fs7
                  andi         a5, s4, -932
                  srai         s7, s1, 8
                  mulhsu       s7, sp, s5
                  flt.s        a7, ft8, ft1
                  mul          a6, s0, s8
                  sra          tp, s9, t2
                  fmv.w.x      fs5, a4
                  xori         a3, ra, -173
                  fsgnjn.s     fa4, ft11, ft3
                  mulh         a3, s8, t5
                  mulh         a6, s5, t1
                  mul          t2, s9, s1
                  remu         t3, zero, s5
                  slti         t2, t4, 1642
                  fcvt.wu.s    t5, fs2, rup
                  feq.s        s4, fs1, ft8
                  div          a5, t3, t4
                  lui          s4, 974757
                  divu         t0, t6, a6
                  divu         s11, s10, t3
                  fsgnjx.s     ft8, fs6, fs8
                  auipc        a2, 997766
                  fsqrt.s      fs4, fs5
                  fle.s        gp, fs4, ft11
                  fsub.s       ft1, ft10, fa5, rdn
                  srl          s2, t6, zero
                  add          a2, s2, a6
                  srli         t6, t5, 12
                  fle.s        zero, ft5, fs8
                  srai         t1, s5, 5
                  fadd.s       fa2, ft9, fa3, rtz
                  slli         s11, t3, 23
                  fmin.s       ft5, fs0, ft4
                  addi         s0, t3, 1440
                  lui          s0, 309143
                  remu         a5, a0, s10
                  fmv.w.x      fs3, t5
                  auipc        t4, 633804
                  ori          s7, t6, 530
                  fdiv.s       fs7, ft1, fa1, rdn
                  srl          s0, s1, a1
                  fmin.s       ft3, ft0, fs1
                  xor          t2, a7, s4
                  auipc        a0, 205019
                  mulhsu       a0, s2, s0
                  andi         tp, s8, -1290
                  fcvt.w.s     t6, fs8
                  div          a2, s4, a1
                  addi         zero, s1, 1068
                  fmv.w.x      fs4, zero
                  remu         t5, t0, a1
                  fsqrt.s      fa0, fa2
                  fcvt.s.wu    fs3, sp, rdn
                  divu         gp, a3, s8
                  mulhsu       a2, t4, s10
                  addi         t3, t1, 1777
                  fmv.x.w      gp, fs11
                  fcvt.wu.s    t1, fa1
                  fdiv.s       ft1, ft8, fa4, rmm
                  fsgnj.s      fs7, ft7, fa4
                  fmax.s       fa3, ft11, fs4
                  slt          s11, zero, tp
                  fsqrt.s      ft9, ft8
                  slti         a1, s4, 300
                  slti         a5, a3, -870
                  nop
                  nop
                  sll          a4, s10, t4
                  sub          s0, s2, t6
                  fmin.s       ft11, ft5, ft8
                  andi         t6, a5, 977
                  nop
                  mul          s9, sp, t0
                  fmv.x.w      s6, fs7
                  andi         s7, t1, 632
                  mulhsu       s6, s9, a5
                  andi         s6, t5, 1649
                  fcvt.w.s     a2, fs1
                  feq.s        s6, ft4, ft6
                  rem          a5, s5, a3
                  and          s0, s7, s11
                  div          t5, a5, s0
                  slt          s2, t1, t4
                  fmv.w.x      fa2, ra
                  fcvt.wu.s    s5, fs3
                  fcvt.s.wu    fs1, a6, rtz
                  auipc        t4, 422549
                  xor          t1, s11, zero
                  divu         t0, s2, a2
                  srl          s10, t6, t2
                  fadd.s       fa0, ft2, ft5
                  fsgnjn.s     fa2, ft3, fs6
                  feq.s        t1, fa4, fa2
                  flt.s        t3, fs2, fs4
                  slli         a3, t5, 21
                  feq.s        tp, ft6, ft1
                  fsub.s       fa2, fa3, ft3, rup
                  mulhsu       s0, s9, a5
                  fmax.s       fs4, fs10, fa2
                  fclass.s     a0, fs7
                  srl          t3, ra, s11
                  mul          s6, tp, gp
                  fadd.s       fa7, fs7, fs10, rtz
                  sltiu        t1, s9, -1794
                  srl          a5, zero, a1
                  fmin.s       ft3, ft8, ft3
                  auipc        t5, 84364
                  mulhsu       s6, ra, ra
                  fmul.s       fa1, fa2, fa7
                  fsgnjn.s     fs7, ft11, fs7
                  srai         s0, tp, 13
                  fsqrt.s      ft10, fs9, rtz
                  slti         s11, s0, -890
                  slti         t6, s4, 1697
                  slt          t0, a0, t6
                  remu         a7, a1, a7
                  srl          a3, ra, ra
                  or           s6, t4, t1
                  srai         a3, sp, 18
                  fmul.s       fs4, fs5, fs0, rtz
                  fsgnjn.s     fs4, fs0, fa1
                  fsub.s       fs6, fa7, fs0, rmm
                  fdiv.s       ft2, fs5, ft9
                  nop
                  xori         t2, a4, -466
                  divu         a4, tp, tp
                  slti         ra, t5, 1885
                  sltu         a5, s5, t6
                  mul          zero, s7, a6
                  slli         t4, tp, 10
                  fle.s        t3, fs4, ft11
                  fcvt.s.wu    fa3, a4, rup
                  srai         zero, t3, 18
                  fcvt.s.w     ft5, t4, rtz
                  fmul.s       ft2, ft3, fs7
                  fmul.s       fs1, fa7, ft2, rtz
                  fclass.s     t1, fs2
                  fle.s        t1, fs5, ft4
                  fcvt.s.wu    fs9, s10
                  fmul.s       fa3, fa3, ft5
                  auipc        s9, 700746
                  nop
                  and          t6, a4, gp
                  ori          ra, s6, 86
                  sltu         a3, s8, ra
                  lui          s4, 749485
                  nop
                  or           a1, a2, t4
                  fcvt.wu.s    a2, ft8
                  ori          gp, a1, -1681
                  fcvt.s.wu    fa5, tp
                  sltu         a0, s2, t3
                  mulh         a1, a4, t6
                  fcvt.s.wu    ft2, ra
                  and          s5, s9, gp
                  fsqrt.s      ft4, ft10, rne
                  rem          tp, s3, s0
                  xori         s6, a2, -2013
                  flt.s        s6, fa1, ft2
                  fcvt.s.w     ft1, s10
                  mulhu        a1, s2, s0
                  srl          t4, s1, a4
                  fclass.s     s2, fs3
                  andi         a4, t2, -498
                  or           a6, tp, a1
                  srai         s6, s6, 25
                  remu         t2, a2, t6
                  slti         a4, a3, -1426
                  remu         t5, a4, s0
                  addi         a5, a0, 1660
                  or           t2, s3, s1
                  mulhsu       t6, a7, t2
                  mulhu        s10, tp, a0
                  divu         tp, s8, s8
                  or           tp, a3, gp
                  feq.s        s6, fs2, fs5
                  fsgnjx.s     fs4, fs6, fa0
                  fle.s        t4, fa7, ft0
                  fsgnjx.s     ft3, fs1, fs11
                  sltiu        t1, sp, 1368
                  slti         s2, s10, -121
                  fcvt.wu.s    s0, fs9, rdn
                  fsgnj.s      ft0, ft11, fs10
                  flt.s        t6, ft4, ft10
                  addi         s2, s1, -332
                  fsgnjx.s     ft10, ft9, fs11
                  sltiu        a3, t0, 255
                  slti         s5, s1, 1683
                  fsgnj.s      ft11, fs3, ft8
                  mul          a7, s9, zero
                  mulhsu       s4, s4, s8
                  sltu         t3, t6, s1
                  fsgnj.s      fa3, ft1, fs9
                  sub          s6, a3, a1
                  fle.s        s11, ft9, ft8
                  add          s10, a2, s4
                  add          a3, t4, gp
                  srai         a0, s7, 19
                  fmv.w.x      ft0, gp
                  fsqrt.s      ft4, ft1, rmm
                  xori         a2, s7, 2017
                  fcvt.s.wu    ft6, s0
                  fadd.s       fa7, fa6, ft7, rup
                  fadd.s       fs5, fs7, fs7, rmm
                  fsub.s       fs9, ft1, fs9, rdn
                  mul          a5, zero, t0
                  xori         a5, a5, 1185
                  rem          s11, a5, s10
                  remu         t1, s6, a6
                  fsgnj.s      fa0, ft8, ft5
                  srli         t4, s3, 16
                  auipc        a2, 941184
                  or           zero, a2, zero
                  srl          s10, t5, s2
                  fdiv.s       ft6, ft3, ft2, rdn
                  slt          a6, ra, a6
                  mul          a4, gp, a7
                  slli         t3, a7, 18
                  mulh         a0, a1, s5
                  andi         a7, t1, -1769
                  flt.s        a4, ft10, ft3
                  slt          s2, s9, a1
                  fcvt.wu.s    s11, ft1
                  srl          t1, s1, a4
                  feq.s        a2, fs5, fa3
                  divu         t6, a5, zero
                  xori         s7, a2, -1769
                  fcvt.s.wu    fa3, s7, rup
                  fdiv.s       ft1, fa0, ft4
                  fle.s        a1, fs9, fs6
                  srai         s4, zero, 31
                  ori          t5, t0, -1803
                  div          t4, s3, a2
                  fsgnjx.s     fa4, ft2, fs6
                  add          a3, sp, t6
                  div          s4, s7, s0
                  fadd.s       fa1, fa3, ft11, rup
                  sltu         t3, s8, s7
                  mulhu        t0, s0, t1
                  remu         a7, t2, s3
                  auipc        t2, 610511
                  divu         s0, t1, t5
                  srai         a1, t6, 21
                  lui          s11, 291038
                  srai         t1, s11, 20
                  div          a5, s3, s7
                  fsgnjn.s     fs11, ft0, ft1
                  xori         s8, s0, 425
                  fsqrt.s      fa6, ft6, rup
                  fmv.x.w      s5, ft3
                  fcvt.w.s     a2, ft9
                  div          s9, s10, s3
                  or           s8, s1, s2
                  mulh         a5, s6, s2
                  and          s8, a2, s3
                  ori          s7, s7, -141
                  fsgnjn.s     ft0, fa5, fa6
                  remu         gp, t4, s6
                  sltiu        s7, t5, 737
                  feq.s        s8, fs10, fa6
                  fle.s        a1, fs1, fa4
                  slti         t5, s6, 1972
                  fle.s        a6, ft7, fs0
                  fmv.w.x      fa4, s3
                  divu         a4, s7, a7
                  fdiv.s       fa4, fs10, ft1, rtz
                  auipc        s10, 509277
                  fmv.x.w      s5, fa7
                  addi         s0, ra, 1935
                  mulh         a0, s4, tp
                  fsqrt.s      ft8, fs2, rup
                  auipc        a7, 922705
                  xori         a7, a2, 651
                  fdiv.s       fs7, fs3, fs4
                  fcvt.s.wu    fs2, a4, rdn
                  fcvt.s.w     ft11, zero, rne
                  fcvt.s.w     fs3, a3
                  add          t5, t5, a5
                  auipc        a5, 671788
                  mulh         t2, a4, s10
                  fsgnj.s      ft9, fs0, ft8
                  fadd.s       ft6, fs3, fs5
                  flt.s        s2, fs1, fs3
                  divu         a6, zero, s2
                  fdiv.s       ft7, ft4, fa1
                  mulh         a4, t5, s1
                  fmax.s       ft2, ft5, fa4
                  sltu         s10, t6, zero
                  fsgnjn.s     fa6, fs2, ft7
                  mulhsu       t2, a0, zero
                  fcvt.wu.s    t1, fs2, rmm
                  fclass.s     a2, fs3
                  fmv.w.x      fa2, s11
                  and          s8, a6, a5
                  nop
                  sltu         t0, t0, a4
                  lui          a7, 204737
                  fle.s        s4, fs8, fs2
                  mulhu        a3, s4, a2
                  slt          s2, t5, t4
                  mulh         t5, tp, s7
                  div          a2, t3, t1
                  fmv.w.x      fs4, t5
                  fcvt.s.wu    fs9, s8, rdn
                  fmv.w.x      ft5, s9
                  sub          s9, t2, tp
                  fdiv.s       ft10, fs5, ft2, rmm
                  mulhu        s6, s1, s10
                  mulh         t5, ra, a0
                  nop
                  fmax.s       fa5, ft0, ft1
                  srli         s6, a6, 14
                  fclass.s     t1, fa4
                  fle.s        a3, fs5, fa7
                  feq.s        a2, fs7, fa2
                  srli         t2, t2, 9
                  fcvt.s.wu    ft0, a4
                  rem          s0, s10, s3
                  ori          t0, a4, -368
                  feq.s        gp, fa1, ft9
                  flt.s        a0, fs10, ft1
                  fsgnjn.s     ft10, fa6, ft0
                  div          ra, sp, s0
                  remu         a0, ra, s4
                  flt.s        s7, ft5, fs9
                  fcvt.s.w     ft10, s4, rtz
                  fclass.s     a4, fa7
                  add          s5, a4, a3
                  xor          a0, s8, a6
                  fmax.s       fa4, ft3, ft1
                  andi         s5, s8, -1190
                  mulh         s4, a3, s2
                  sltu         zero, s6, ra
                  sltu         t5, a3, ra
                  xori         a2, ra, 1415
                  fsgnj.s      ft6, fs0, fa2
                  sltu         t1, a3, a7
                  fsgnjn.s     ft10, fa1, fs5
                  fmul.s       ft3, ft3, fs8
                  slti         a2, s1, -1101
                  addi         s10, s10, -1460
                  rem          t4, s1, gp
                  sra          s9, s2, t1
                  feq.s        t6, ft3, fs2
                  mul          zero, a6, t0
                  fle.s        s6, ft8, ft3
                  mul          s10, a0, a2
                  addi         s10, s8, 1648
                  srai         a6, a0, 7
                  auipc        a2, 250521
                  fcvt.w.s     ra, fs0, rmm
                  fmv.x.w      t4, fa5
                  fsgnjn.s     ft7, fs7, fs6
                  sltu         a3, a4, s0
                  mulhsu       s2, t1, t3
                  and          s2, t2, sp
                  fsqrt.s      ft1, ft8, rmm
                  feq.s        t4, fa1, fs0
                  div          t0, s10, a0
                  sltiu        a6, a2, 1472
                  sra          a1, t1, t5
                  or           a5, t0, ra
                  and          s10, a0, a4
                  fsub.s       fs1, fs11, fs0, rup
                  div          s9, a2, s5
                  add          s0, s10, s11
                  slti         s8, s11, 1509
                  srai         a7, t6, 2
                  fsgnjx.s     fs6, fa1, ft5
                  fmv.x.w      s8, ft4
                  and          a7, tp, t5
                  sltiu        a1, t6, -494
                  srli         a6, s3, 25
                  fcvt.w.s     a1, ft9
                  lui          ra, 543506
                  fmin.s       fs11, ft5, fs8
                  fmv.x.w      zero, fs2
                  fadd.s       fs6, ft2, fs1, rtz
                  fclass.s     a4, fa3
                  remu         a1, s1, a7
                  sltiu        s10, s2, 1419
                  fclass.s     a7, ft4
                  mulhsu       a0, a5, a0
                  nop
                  divu         s8, zero, t0
                  xor          a2, s8, s1
                  feq.s        a4, fs9, ft0
                  srli         s4, a6, 28
                  and          s4, s2, s2
                  sub          s0, zero, ra
                  fsqrt.s      ft5, ft4, rtz
                  fcvt.w.s     s8, ft6, rup
                  sll          s7, t3, s3
                  flt.s        s5, ft10, ft8
                  slti         t6, t6, -1729
                  fcvt.w.s     a4, fs3, rtz
                  xori         s5, s0, -1563
                  sll          s0, t5, t1
                  fsub.s       fa7, ft8, fa2, rtz
                  srli         tp, a4, 12
                  fsub.s       fs5, fa5, fs4
                  fdiv.s       fs5, fa1, ft5, rmm
                  flt.s        a2, ft10, fa6
                  fsub.s       ft10, ft2, fa7
                  mulhsu       s0, a4, t3
                  sltiu        a5, a0, -1184
                  fadd.s       ft4, fa4, ft11, rmm
                  fmul.s       fs9, fs4, fa7, rne
                  sltu         t2, t1, sp
                  fcvt.w.s     s8, fs7, rtz
                  fcvt.wu.s    zero, fa4, rmm
                  mul          a7, t6, s0
                  mul          s2, gp, s2
                  or           t5, t3, t2
                  fsgnj.s      fs7, fs1, ft1
                  xori         s11, gp, -21
                  fdiv.s       fs0, ft6, ft10
                  fcvt.s.w     fs9, t2, rne
                  add          s11, s7, s10
                  fsub.s       ft10, ft0, ft9, rmm
                  sra          s11, s6, s6
                  fclass.s     tp, fa5
                  sll          t4, s3, s8
                  fmax.s       fs5, ft7, ft2
                  fmin.s       fa7, ft10, fs7
                  slt          a0, t0, tp
                  add          a7, zero, t5
                  slt          s10, s5, s4
                  fadd.s       fs0, fs9, fs7, rtz
                  ori          a5, a2, -1925
                  xori         s9, s9, -494
                  fcvt.wu.s    s5, fa1
                  mul          a4, s4, s10
                  div          t3, a7, t1
                  mul          s6, a4, t6
                  sltiu        t1, s11, -1782
                  fsub.s       fs2, fa4, ft1
                  fdiv.s       fs4, fa3, fa6, rtz
                  fmv.w.x      ft7, zero
                  fcvt.wu.s    a2, fs6
                  fcvt.wu.s    zero, fs3, rdn
                  andi         t5, s3, 1080
                  slt          a4, s10, a1
                  fclass.s     s11, fs1
                  fmv.w.x      fa1, s3
                  mulhsu       t0, s1, s9
                  auipc        t0, 1018855
                  mulh         s6, t4, s2
                  xor          t2, s10, a1
                  srli         t1, ra, 18
                  andi         t5, t4, -1339
                  fle.s        a7, ft11, fa7
                  fsgnjx.s     fs1, fs7, ft2
                  fsqrt.s      fs5, ft5
                  fmv.x.w      t3, ft2
                  slli         s7, a4, 4
                  fmv.w.x      fs8, a1
                  fmv.w.x      fa6, s1
                  sub          t0, ra, t1
                  rem          t1, a7, sp
                  remu         a5, t0, s7
                  fsub.s       fa1, ft0, ft1, rne
                  fsub.s       fs10, ft9, fa3
                  fsqrt.s      fs5, fs10
                  fadd.s       fs5, fs6, fs4, rtz
                  feq.s        t0, ft1, fs9
                  mulh         t6, sp, s4
                  flt.s        s4, ft8, ft7
                  fsgnjn.s     fs6, fa5, fs4
                  fsqrt.s      fs9, fs11, rdn
                  mulhu        a2, a7, t3
                  or           t0, sp, s0
                  nop
                  fadd.s       fs3, fa0, ft0
                  slti         a1, gp, -14
                  srai         s10, gp, 6
                  fmul.s       ft11, fa0, fa3, rup
                  flt.s        s2, ft0, ft6
                  rem          t0, ra, a2
                  srli         t4, gp, 14
                  rem          s2, a3, a4
                  srli         s6, s0, 5
                  sltiu        t2, a1, -1579
                  divu         a6, t5, a6
                  sltu         t3, s0, s1
                  mulhsu       t4, t5, t6
                  sll          a0, s10, s2
                  fmv.w.x      ft10, a1
                  fcvt.w.s     s10, ft10
                  fsgnjx.s     fa1, ft4, fs8
                  fle.s        t0, fa6, fa5
                  fcvt.s.wu    ft2, t2
                  fadd.s       ft6, ft7, ft10, rne
                  slli         s0, t3, 20
                  addi         a0, t6, -1107
                  fcvt.s.w     ft0, s6
                  andi         s9, t6, 2000
                  slt          a2, gp, s11
                  fcvt.w.s     t5, fs10
                  sltiu        t5, t6, -1276
                  fcvt.s.w     ft8, t3, rtz
                  addi         s7, a6, 899
                  sll          s8, a4, a6
                  fcvt.s.wu    fa1, s5
                  fcvt.wu.s    a2, fs7
                  xor          t5, s9, a5
                  ori          s2, s2, 778
                  sra          s5, s9, s11
                  fcvt.wu.s    t0, fa3, rmm
                  fsgnj.s      fs0, fs1, ft8
                  srli         s2, a6, 4
                  mulhu        s4, s4, s10
                  fadd.s       fs9, fa3, ft7, rdn
                  fmul.s       ft10, fa2, ft4
                  sltiu        zero, t5, -977
                  xori         a4, s2, -183
                  fcvt.s.wu    fs3, zero, rtz
                  and          a1, gp, gp
                  fsqrt.s      ft5, ft7, rup
                  mulhsu       t4, s0, sp
                  fmul.s       fs3, fa7, fs8, rne
                  slli         t0, s1, 17
                  sub          t5, s7, a4
                  fmul.s       fs7, ft5, fa5, rdn
                  xor          s0, s6, a4
                  slti         t6, a5, -1416
                  lui          a7, 391766
                  fsub.s       ft7, fs5, ft11, rmm
                  sll          a5, a7, a7
                  fsqrt.s      fs6, fs1, rdn
                  srl          tp, s0, a7
                  sltu         s7, t4, a2
                  div          s8, a7, s4
                  fcvt.wu.s    s5, fs6, rup
                  fcvt.s.w     fa7, t3, rmm
                  sll          s8, a7, t5
                  feq.s        s0, ft8, fs2
                  srli         zero, a4, 20
                  xori         t2, a7, -385
                  sra          s0, a3, s8
                  remu         s0, t5, t2
                  add          zero, a6, t5
                  rem          a3, t6, s11
                  xori         a1, t5, -268
                  auipc        s11, 485732
                  fmin.s       ft1, ft2, ft4
                  srl          a5, s7, a7
                  fsgnj.s      ft0, fa4, ft8
                  fmax.s       ft9, fs1, fs3
                  fadd.s       fs11, ft5, fs2, rtz
                  fsub.s       ft10, ft4, fs6
                  fclass.s     t2, ft7
                  fmin.s       fs11, fa4, fa2
                  sltiu        a0, a0, -394
                  fmv.x.w      t2, fs11
                  fmv.x.w      t5, fs5
                  fmv.x.w      a5, fs6
                  sltu         s9, a1, t6
                  or           s0, s0, a4
                  fcvt.s.w     ft5, t1
                  sltiu        s2, a4, 564
                  srl          s10, t4, s5
                  fdiv.s       fs9, ft0, fs3, rmm
                  xor          s2, a7, s6
                  fsgnj.s      fs1, fs1, fa2
                  fsgnjx.s     fs1, ft5, ft7
                  mulhu        t1, s4, s10
                  slti         a4, s8, -521
                  fcvt.s.w     fa6, s0, rup
                  fsgnj.s      fs0, ft3, fs3
                  ori          s2, t2, -1095
                  xori         a0, a3, -479
                  fmax.s       fs3, fa1, ft7
                  fle.s        a0, fa7, fs8
                  sub          a6, s5, zero
                  srl          t1, s11, a6
                  fdiv.s       ft8, ft10, fa0, rmm
                  feq.s        s8, fs0, fa2
                  srl          s7, a2, ra
                  mulhsu       a4, a2, a1
                  slti         ra, s6, -577
                  fle.s        ra, fs11, ft1
                  and          gp, a4, s11
                  sltiu        a2, t0, 1705
                  fdiv.s       ft8, ft4, fs7, rup
                  flt.s        a6, fs9, fa7
                  xor          s11, s2, t3
                  slt          gp, a0, a5
                  and          a1, t2, ra
                  fmv.w.x      fs5, s2
                  fsgnj.s      ft3, fs11, ft4
                  fmul.s       fs3, ft6, ft3, rtz
                  sra          s8, a6, a5
                  fmax.s       ft6, fa0, ft4
                  fcvt.w.s     s6, ft2
                  fsub.s       fs2, fs1, ft3, rdn
                  srli         gp, s7, 19
                  fadd.s       ft8, fs2, ft10
                  feq.s        s0, ft7, ft3
                  divu         s9, s6, s7
                  fsqrt.s      ft11, fa2, rne
                  fcvt.s.wu    fa1, s9
                  nop
                  xor          a3, t6, sp
                  add          t4, zero, t0
                  mul          s11, s2, s6
                  srl          a4, s1, s9
                  fcvt.s.wu    ft9, t5
                  slli         t2, sp, 9
                  fcvt.s.wu    fa6, a7, rtz
                  srai         t0, s10, 2
                  divu         a7, a4, tp
                  and          a6, ra, t2
                  mulhu        a5, t3, a6
                  fcvt.w.s     s6, ft0, rne
                  fdiv.s       fa2, ft10, fa3, rmm
                  flt.s        a4, fa1, ft9
                  fsgnj.s      fs4, fs8, ft7
                  fmul.s       fa4, fa2, ft10, rmm
                  fmv.w.x      fs6, s6
                  fclass.s     s8, fs10
                  sltu         t5, gp, a4
                  auipc        s0, 370309
                  xori         gp, zero, -1637
                  or           t3, s4, s3
                  fcvt.wu.s    ra, ft9, rmm
                  fsgnjx.s     fa3, fs3, fa3
                  slti         zero, s7, -1015
                  fsgnj.s      ft2, fa6, ft6
                  fcvt.s.wu    fs3, t2
                  andi         a3, a1, 1071
                  mulhu        tp, t2, s11
                  remu         s4, t4, t5
                  fmax.s       fs4, fs0, ft3
                  fsgnj.s      fa0, ft1, fa5
                  slli         a5, s7, 6
                  xor          s11, s1, s11
                  xor          s10, ra, a6
                  addi         s9, t1, 1515
                  mulh         tp, gp, s3
                  fsub.s       fa2, ft2, ft0
                  fsqrt.s      fa3, fa5
                  fmv.w.x      fa1, s8
                  fsub.s       fa2, fs9, fa5, rup
                  mul          t3, s7, tp
                  auipc        a4, 309061
                  fdiv.s       fs4, fa4, fs8, rtz
                  feq.s        a1, fa2, ft4
                  fle.s        t1, fa4, fs2
                  sltu         s0, a5, gp
                  xori         t6, gp, -19
                  sub          a3, a5, s9
                  andi         a5, t0, 928
                  add          zero, s11, a5
                  ori          s11, gp, -158
                  fcvt.s.w     fs8, s2, rdn
                  sub          a2, s1, sp
                  feq.s        zero, ft7, ft6
                  and          s10, s1, a6
                  slti         ra, a4, -993
                  sra          ra, s6, a3
                  fadd.s       fs10, fa2, fa7
                  flt.s        t6, fs3, ft8
                  fsgnjn.s     ft3, ft10, fs6
                  fmin.s       fs2, fs3, fa0
                  remu         s0, s9, a0
                  flt.s        a6, ft5, fs3
                  div          s7, zero, t3
                  fsqrt.s      fs0, fa7, rdn
                  andi         t1, t4, -1570
                  fmin.s       ft9, ft4, ft8
                  fmax.s       fs8, fs8, ft7
                  fdiv.s       ft6, fa7, ft8, rup
                  slli         s7, s3, 5
                  fle.s        t0, ft9, fa0
                  mul          a1, t6, tp
                  fmv.x.w      s2, ft1
                  remu         t5, s9, s8
                  divu         s4, a0, s0
                  mulhu        zero, s5, s1
                  mul          t4, a7, s1
                  fsub.s       fa4, ft2, fa1, rdn
                  fsub.s       fs7, fs6, fs1
                  fadd.s       fa5, ft5, ft8
                  lui          a7, 486298
                  fsgnjn.s     ft11, ft1, ft5
                  divu         s5, s11, s1
                  sltiu        t6, t5, -236
                  srl          s9, zero, t1
                  fcvt.wu.s    s0, fs4
                  srl          a3, a1, a6
                  mul          a5, a3, s5
                  remu         t0, s0, a6
                  ori          gp, tp, -615
                  fdiv.s       fa0, fs8, fs7, rne
                  fsgnjn.s     ft4, fa2, ft11
                  lui          t5, 549772
                  mulh         a3, gp, s1
                  nop
                  fsgnjn.s     ft9, fs5, fs4
                  xori         a0, a3, 1031
                  sltiu        gp, gp, 224
                  sub          a7, s5, s0
                  slt          a0, a1, sp
                  and          t0, s9, a3
                  mulh         a3, s2, s8
                  fsgnj.s      fa5, ft0, ft4
                  auipc        s6, 407351
                  mulhu        s9, gp, s2
                  fmv.x.w      a2, fa0
                  lui          a6, 538106
                  slt          s9, a7, a7
                  fdiv.s       ft6, fa1, ft3, rmm
                  fclass.s     s4, ft0
                  divu         a2, s11, t0
                  fmv.w.x      ft2, a6
                  or           s11, t4, tp
                  fclass.s     s7, fs6
                  fmv.w.x      fs10, s1
                  srl          s8, s3, a6
                  rem          s6, t1, a1
                  ori          s6, s6, -1379
                  divu         s10, t2, s6
                  fmv.w.x      fa5, a1
                  fadd.s       fa6, ft8, ft8, rne
                  ori          s8, a5, 1365
                  fdiv.s       ft7, ft2, ft2, rmm
                  mul          s9, s10, s2
                  sra          s2, s0, t6
                  remu         a0, s6, s5
                  fcvt.wu.s    t6, fs3
                  sll          s11, s11, a0
                  mul          s8, t4, a2
                  flt.s        tp, fs7, ft5
                  fsgnj.s      fa7, fs4, ft10
                  fsgnjx.s     fs9, ft9, fs2
                  fle.s        s7, fs4, ft10
                  srl          a6, s9, s4
                  xor          a1, s3, s5
                  and          a0, t0, s0
                  fcvt.s.w     ft2, sp, rtz
                  slli         t0, a1, 9
                  fmv.x.w      s11, fa4
                  xori         s10, a2, -1193
                  srai         s11, s4, 14
                  flt.s        a3, fa6, ft9
                  fmv.x.w      s0, fs3
                  flt.s        tp, fs11, fa4
                  andi         a5, a1, 142
                  mul          t2, s8, s3
                  addi         a2, t2, 830
                  xori         a5, s10, -1482
                  sub          t6, a2, s6
                  flt.s        t6, ft6, fs2
                  fmax.s       ft5, ft11, fs4
                  fcvt.w.s     s2, ft6
                  ori          t2, t4, -190
                  addi         s6, a3, 1322
                  fcvt.s.w     ft11, t4, rmm
                  mul          a6, s9, t6
                  divu         zero, s5, gp
                  andi         gp, a5, -1899
                  fadd.s       fs6, ft6, ft7, rmm
                  mul          t4, s11, a3
                  add          s5, s9, s7
                  sltu         s9, s1, a5
                  fdiv.s       fs8, fa7, fa2, rdn
                  fsqrt.s      fa1, ft11, rdn
                  fle.s        a0, fs11, ft8
                  fadd.s       fa3, ft9, fs6, rup
                  fcvt.s.w     ft9, zero, rmm
                  fadd.s       fs7, fa2, fs11, rdn
                  fsub.s       fs10, ft1, fa0, rmm
                  sub          s9, ra, a7
                  srl          t3, a7, s5
                  sll          a5, a0, s10
                  slli         t3, s11, 1
                  rem          gp, t1, t0
                  xor          a2, t0, a4
                  fcvt.wu.s    t6, fs2
                  fsgnj.s      ft11, fs9, fs7
                  or           s11, a4, t2
                  sll          zero, s0, s10
                  lui          a4, 823795
                  flt.s        a4, ft7, fs2
                  sub          t3, s0, a4
                  fdiv.s       ft10, ft2, fs10, rmm
                  div          a3, a6, a2
                  sra          a3, s7, a2
                  sll          s0, t0, a5
                  fsub.s       fs5, fa6, ft7, rne
                  sll          t1, sp, a2
                  slti         a3, s10, 1481
                  mulh         a1, a0, s4
                  srli         ra, t2, 17
                  remu         s7, a7, t2
                  srl          s9, s0, s1
                  srli         t1, a4, 25
                  divu         a0, t3, s2
                  slti         a7, t0, -479
                  div          s7, a3, ra
                  fle.s        a6, fa7, fs10
                  sltiu        s8, s2, 2013
                  andi         s9, s6, 431
                  srl          s5, t6, s5
                  sra          s8, a6, s9
                  sub          t1, a1, gp
                  feq.s        a2, ft0, ft1
                  sub          t3, t2, s5
                  slti         t5, s7, 1704
                  fcvt.w.s     a2, ft0
                  fadd.s       fa4, ft9, fs6
                  fsqrt.s      fa3, fa5
                  sll          gp, s0, a5
                  fmv.x.w      s6, fa3
                  fmax.s       ft0, fa2, ft11
                  addi         s11, a7, 675
                  mulh         t2, a2, s1
                  fsgnjx.s     ft8, ft9, ft6
                  lui          a3, 890368
                  fdiv.s       fs4, fs1, fs7
                  xor          s9, s7, t4
                  slt          s5, s2, sp
                  nop
                  fsgnjn.s     fa7, fs0, ft0
                  mulhsu       s5, a2, sp
                  slt          s6, a4, a4
                  nop
                  addi         gp, a3, 314
                  slt          ra, s10, s11
                  mulhu        s8, t5, gp
                  add          t1, s1, tp
                  lui          s4, 681369
                  fclass.s     gp, fs1
                  xori         s2, a0, 1862
                  or           a2, sp, a4
                  sltiu        s9, a3, -968
                  mulhsu       t6, a5, sp
                  fsqrt.s      fs1, fs2, rdn
                  fsub.s       ft8, ft1, fs0
                  mulhsu       t1, s5, tp
                  fmin.s       ft7, fs10, fa1
                  fsgnjn.s     ft3, fa0, fs8
                  addi         s11, a6, 459
                  srli         a1, s10, 31
                  mulhsu       t6, t6, a1
                  fclass.s     t0, fa0
                  fmin.s       ft0, ft8, fa7
                  fsgnjn.s     fs7, fs4, fs9
                  fsgnjx.s     ft1, ft8, fs1
                  fmul.s       ft11, fs8, fa6, rne
                  fclass.s     tp, fs9
                  fdiv.s       ft3, fs9, ft3
                  fadd.s       ft4, fa2, fs6
                  or           t0, gp, s7
                  fcvt.s.w     fa1, s5
                  slli         gp, a1, 30
                  fcvt.s.wu    fs10, t1, rup
                  fdiv.s       ft2, fs6, ft4, rne
                  sltiu        a4, s3, 1857
                  mulh         a6, t5, s3
                  fmv.x.w      s4, fs9
                  fsgnj.s      fs6, fa4, fs1
                  srai         s6, s11, 11
                  fmin.s       fa6, fs10, fa0
                  div          t2, s3, a7
                  slli         a3, a2, 4
                  sltiu        a7, s1, 620
                  addi         a3, t3, 1229
                  slli         a5, a1, 14
                  fcvt.wu.s    s2, fs10, rmm
                  xori         s10, gp, -1189
                  andi         t1, t5, 1061
                  auipc        s0, 778437
                  mulhu        a3, s8, s7
                  sll          t5, s9, a4
                  sra          t5, gp, a5
                  fcvt.s.w     ft11, s0, rtz
                  fsub.s       ft10, fa6, ft5, rdn
                  nop
                  fsqrt.s      ft7, fs6, rtz
                  auipc        a2, 63241
                  mulhu        s4, t2, t2
                  div          s0, s3, t6
                  fmv.x.w      tp, fa2
                  div          s7, a7, s6
                  fmax.s       fs2, fs6, fa7
                  fcvt.s.w     fa1, a0, rtz
                  fcvt.s.w     fa6, a6, rdn
                  slt          a1, t1, t4
                  and          t3, ra, t3
                  fadd.s       ft4, ft11, fs5, rdn
                  divu         s10, t4, s7
                  srai         s5, a5, 2
                  xori         ra, a0, -1808
                  nop
                  andi         a5, gp, 269
                  flt.s        s7, ft2, fs2
                  xori         s6, sp, 1832
                  fsgnjx.s     fs10, fa6, ft1
                  mulhu        s6, ra, t2
                  fmax.s       fs11, fs9, fs2
                  srai         s10, a3, 11
                  divu         t0, zero, s3
                  xor          s0, a0, s3
                  div          s9, t0, a3
                  feq.s        t1, ft2, fs3
                  srli         a1, a3, 31
                  auipc        gp, 50803
                  mul          t3, s11, tp
                  addi         s8, a5, -712
                  rem          s8, t0, s6
                  mulhu        a0, t1, a7
                  fsub.s       ft2, fa0, ft3, rup
                  lui          t5, 830091
                  fsub.s       ft9, fa4, fs7, rmm
                  fmv.x.w      a2, ft2
                  fcvt.w.s     t5, fa3
                  fsgnjx.s     fs7, ft8, fa3
                  nop
                  fdiv.s       ft0, fs11, fs8, rmm
                  srli         a4, t2, 16
                  mulhsu       tp, s0, a1
                  fmin.s       fa2, fs4, fs4
                  xor          a0, t4, s11
                  fmv.w.x      fa4, t6
                  div          a2, tp, sp
                  fmin.s       ft8, fs6, fa6
                  fcvt.s.wu    fa0, s9, rdn
                  fsgnjn.s     ft3, ft5, ft11
                  mul          zero, a0, a7
                  and          ra, t4, s0
                  srai         t4, s11, 23
                  fmv.x.w      zero, fa6
                  feq.s        a3, fa0, fs6
                  mulh         a2, t5, s11
                  addi         a5, a5, -896
                  auipc        s8, 898537
                  mulhu        a0, s10, a6
                  feq.s        t5, ft3, fa5
                  remu         s4, a3, s10
                  xor          t6, gp, t5
                  fle.s        s6, ft6, ft7
                  feq.s        s10, fs4, fa4
                  fmul.s       fa6, ft10, fs9
                  addi         a0, s0, -341
                  auipc        s9, 741792
                  add          s4, t2, s0
                  mulhsu       t5, a3, s0
                  sltu         s2, s11, a1
                  feq.s        gp, fa1, fs6
                  fsqrt.s      fa6, ft4, rup
                  fmul.s       fs2, fs2, fs11, rtz
                  divu         s7, s7, t6
                  slt          tp, s6, t1
                  fmv.w.x      fs11, a2
                  fle.s        t1, ft1, fs7
                  fcvt.w.s     a2, ft9, rtz
                  srli         a4, s11, 3
                  slt          s10, t6, s8
                  slti         tp, a4, 762
                  xor          tp, a7, t1
                  fcvt.w.s     s2, fs7
                  fmv.w.x      ft2, a5
                  sltu         s8, s6, a4
                  fle.s        t3, fa5, fs11
                  sltiu        tp, gp, 1561
                  fcvt.w.s     gp, fa6
                  add          zero, s7, s9
                  lui          gp, 388959
                  fmin.s       fs5, ft7, fs6
                  remu         a1, a3, s7
                  divu         t6, s0, s8
                  fmin.s       fa3, ft1, fs2
                  slti         a4, sp, -417
                  slt          t6, t5, zero
                  nop
                  fmin.s       fs0, ft8, fa4
                  fmv.x.w      a5, fs4
                  nop
                  fmin.s       fa6, fs7, fs6
                  fdiv.s       fa6, fa7, ft7, rmm
                  andi         ra, a5, -1943
                  remu         t4, a3, a0
                  fsgnjx.s     fa2, fs9, ft8
                  lui          s11, 708106
                  fsub.s       ft4, ft10, fs9
                  fle.s        tp, ft5, fa6
                  rem          s9, t0, s4
                  fclass.s     s0, fa2
                  fcvt.w.s     s4, fa5, rtz
                  addi         zero, a6, -2038
                  fmul.s       fa5, fa5, fa5, rup
                  sll          t4, s1, t5
                  fmax.s       ft8, fa0, fs11
                  fmv.w.x      ft0, t4
                  fcvt.s.wu    fs6, s5, rtz
                  addi         tp, a2, -242
                  slli         s4, t1, 29
                  sra          s8, a6, t6
                  mul          gp, s0, a0
                  divu         s9, s6, s3
                  ori          s0, a1, 1606
                  feq.s        t2, fa2, fs5
                  mul          s2, sp, s4
                  srli         s7, t2, 5
                  srli         s4, t1, 26
                  andi         s5, a2, -1640
                  fle.s        t4, fs7, ft8
                  fsub.s       ft8, ft4, ft1, rne
                  andi         s4, s9, -160
                  fcvt.s.w     ft10, s1
                  fmin.s       fs3, fa1, ft2
                  fsgnj.s      fs5, fa2, fs7
                  fsgnj.s      ft4, ft5, fa5
                  fmul.s       fs1, ft5, ft11, rmm
                  feq.s        a7, ft6, fs7
                  fcvt.wu.s    s9, fa2, rtz
                  auipc        t2, 214949
                  fsgnj.s      fa7, fs7, fa1
                  auipc        a6, 412606
                  feq.s        a6, fa7, ft8
                  srl          s2, zero, t6
                  slti         s5, a7, -578
                  slti         s5, a2, -957
                  sltiu        t6, s0, 1399
                  fcvt.s.w     fa0, t4
                  remu         s6, t0, s6
                  auipc        t4, 450835
                  fdiv.s       ft5, fs5, fs3
                  and          a7, t0, t0
                  fdiv.s       fa5, ft11, ft11
                  ori          t2, a6, 2006
                  auipc        s0, 116735
                  srl          s8, s11, s2
                  mul          s11, s4, t0
                  fdiv.s       ft2, fa1, fa4, rdn
                  mul          s9, s0, t5
                  sltu         a1, t6, s7
                  divu         t2, ra, s1
                  fdiv.s       fs5, ft5, fs6
                  ori          s0, s11, 890
                  fcvt.wu.s    s8, ft1
                  fmax.s       fs6, ft1, fs8
                  srai         t6, s6, 2
                  fmax.s       fs2, ft8, fs6
                  fdiv.s       fa0, ft4, ft1, rup
                  auipc        tp, 225917
                  fcvt.s.w     fa0, t5
                  sub          s11, t6, s7
                  xori         s0, a4, 1375
                  fcvt.wu.s    a7, ft10, rdn
                  srai         s10, a6, 3
                  sub          tp, t6, a3
                  fdiv.s       ft1, fs7, ft8
                  fcvt.s.w     fs3, sp
                  sltu         a6, a1, a2
                  ori          a7, t0, 1432
                  mulhsu       a2, gp, s2
                  fsqrt.s      fs6, ft8, rdn
                  sll          zero, s5, gp
                  slt          a3, zero, t4
                  fcvt.s.w     ft8, a2, rup
                  mulhu        s8, a1, a6
                  fsqrt.s      ft10, fs8, rmm
                  mul          a2, s9, sp
                  fcvt.s.w     ft2, t6
                  nop
                  fsub.s       ft5, ft9, ft11, rtz
                  rem          t4, t2, gp
                  slli         zero, s1, 21
                  addi         a3, t4, -1811
                  slt          t3, a1, ra
                  andi         ra, t6, 1178
                  and          a7, s0, s7
                  auipc        zero, 481084
                  fmv.x.w      s6, fs4
                  fcvt.wu.s    a4, fa0, rtz
                  slti         a0, tp, 329
                  mulhsu       ra, t5, s1
                  mulhsu       a0, t0, s10
                  fsqrt.s      fa2, fa5
                  or           a4, s0, s3
                  feq.s        t3, fs6, fa7
                  fmv.x.w      s8, fs9
                  mul          s4, s8, s3
                  srl          t6, s2, s7
                  auipc        ra, 478159
                  fclass.s     s9, fs4
                  mul          tp, s1, gp
                  srli         t4, s6, 7
                  fclass.s     gp, fs2
                  sltu         s10, a1, sp
                  srli         s10, sp, 1
                  mulhu        s10, a1, a2
                  fmin.s       fs5, fs8, fa0
                  mul          a3, gp, a5
                  fmv.w.x      fa5, tp
                  fmv.x.w      a6, fs9
                  fmax.s       fs1, ft11, ft10
                  fdiv.s       fs8, fs7, fa5
                  fmax.s       fs7, fa2, fa4
                  mulhsu       t1, a0, a4
                  lui          a1, 22021
                  slti         zero, zero, 1547
                  fmv.x.w      zero, fs5
                  mulh         s7, s3, s7
                  mulh         t3, t4, a3
                  andi         t3, t1, 1356
                  auipc        a0, 396838
                  divu         s6, t5, a4
                  or           a2, zero, a6
                  lui          s11, 262500
                  fadd.s       fa7, fs5, ft9
                  rem          t4, s4, s5
                  fsgnj.s      ft8, fa6, ft8
                  fsgnjx.s     ft6, fa0, fs0
                  andi         s8, a4, -526
                  lui          t2, 972517
                  or           a7, t1, t4
                  fclass.s     s5, fa4
                  slti         s10, t6, 410
                  xor          t0, t6, s0
                  rem          gp, a4, a7
                  sra          s0, s7, t5
                  mulhu        tp, s6, t1
                  fsgnjn.s     ft1, fa7, fs6
                  xori         t6, s2, -565
                  mulhu        s10, s9, s1
                  fle.s        a4, ft2, fs6
                  sub          t0, t6, t2
                  sltiu        t4, t2, -1244
                  fadd.s       fa1, ft7, fs2, rmm
                  fadd.s       fs1, fa0, fs4, rdn
                  sltu         s4, a1, s6
                  xor          t0, a6, gp
                  fcvt.s.w     fs3, s9, rmm
                  lui          s11, 890080
                  rem          a7, s5, t4
                  xori         t3, sp, -967
                  or           a5, a3, a2
                  fmax.s       fs1, ft6, ft5
                  sll          s11, s5, s11
                  sll          t6, t0, s0
                  sub          t2, s10, tp
                  mulh         s2, s9, t2
                  fsgnjn.s     fs8, fs9, ft9
                  slt          t5, s6, a1
                  fdiv.s       ft0, fa6, fs2, rtz
                  fsgnj.s      fs8, ft0, fs6
                  nop
                  fsqrt.s      ft11, fs8
                  fmv.x.w      s10, fs11
                  srai         s6, s1, 16
                  or           a2, a1, gp
                  fle.s        s5, ft9, fs3
                  addi         a4, s10, -1807
                  and          s10, s1, tp
                  fcvt.wu.s    t6, fs3
                  fclass.s     s10, fs9
                  slti         t3, a1, -278
                  fsub.s       ft9, fa5, ft8, rmm
                  xori         a7, a0, -1817
                  andi         t6, a7, 1727
                  fdiv.s       ft7, ft8, fa7
                  fcvt.s.wu    fs6, t3, rmm
                  fadd.s       fs3, fa4, fs5, rdn
                  lui          s0, 895902
                  sra          t2, s3, t0
                  fsgnj.s      fa5, fs0, fa1
                  xor          t5, a4, tp
                  fcvt.wu.s    a0, ft7
                  andi         ra, a2, -839
                  auipc        a0, 648064
                  fsgnjn.s     fs10, fa6, ft9
                  rem          t4, t5, a0
                  fmul.s       fs0, ft9, fa3, rne
                  fdiv.s       fs9, fs2, ft0, rtz
                  fmul.s       fa4, fs1, fs5, rtz
                  xori         s9, gp, -1996
                  fcvt.s.w     fs1, sp, rtz
                  fmv.x.w      zero, ft1
                  fmv.w.x      fs5, t6
                  lui          s2, 827560
                  auipc        s8, 921219
                  mulhu        gp, s1, a2
                  remu         a4, gp, s11
                  srai         s6, sp, 26
                  andi         a7, a5, -910
                  auipc        s6, 3645
                  fcvt.s.wu    ft0, ra
                  sltiu        t5, a6, -1882
                  remu         s11, s7, s11
                  slli         tp, t4, 26
                  srl          zero, a5, ra
                  fdiv.s       fa3, fs2, fa0, rtz
                  slt          s11, tp, s6
                  xor          gp, s2, t2
                  sra          t5, sp, s0
                  mulhsu       s5, a1, t4
                  fmin.s       fs9, fs11, fs2
                  sltu         tp, s2, t2
                  mulhsu       a1, s5, t0
                  remu         s5, a2, a5
                  fsgnj.s      ft10, fa2, ft11
                  fle.s        a2, fa6, fa0
                  fdiv.s       fs1, ft3, ft5, rdn
                  mulhsu       t1, s10, a0
                  sll          a4, a5, s6
                  slti         s10, s0, -402
                  or           t4, s6, s0
                  srai         a6, a5, 4
                  addi         s10, a6, -1944
                  fcvt.wu.s    gp, fs6, rmm
                  fcvt.s.wu    ft9, tp, rmm
                  ori          t2, a6, -1655
                  fcvt.s.w     fs4, a1
                  fadd.s       fa0, ft10, ft6, rne
                  slt          t3, s0, gp
                  fmin.s       fs10, fs11, fs1
                  flt.s        gp, fa3, fs0
                  fsub.s       fa5, ft3, fs4, rdn
                  divu         a0, t3, t3
                  ori          s11, t0, -1936
                  fsub.s       fa3, ft7, ft4, rdn
                  xori         a5, s8, -607
                  srl          a0, s1, t1
                  slt          gp, s8, s2
                  fcvt.wu.s    t1, fa5
                  slt          t2, t5, s9
                  and          a5, t1, a3
                  fmax.s       ft3, ft10, fs6
                  slti         t3, a3, 1825
                  add          a2, s1, t0
                  addi         gp, t2, -429
                  auipc        s10, 983895
                  div          t4, t0, a3
                  mulhu        s8, s2, tp
                  add          s4, t5, s8
                  flt.s        s11, fs1, fs10
                  xori         s7, ra, 1724
                  xor          t5, a2, a0
                  srl          s2, a3, s11
                  fmul.s       fs3, fs8, fs3, rne
                  fdiv.s       ft3, ft9, fs1
                  sll          a2, a7, a7
                  fmin.s       fs0, ft4, fs6
                  rem          s4, a6, s6
                  fsub.s       fs10, ft1, fa7, rdn
                  srai         t4, s0, 24
                  ori          s6, s8, 987
                  fsqrt.s      fs4, fs11, rdn
                  fsgnjn.s     fs9, ft1, fs10
                  flt.s        gp, ft8, ft6
                  fclass.s     gp, fa5
                  fmv.w.x      fs10, s5
                  auipc        t5, 442880
                  remu         s7, a1, s2
                  slti         tp, t1, 1865
                  or           a3, t3, a2
                  fsqrt.s      fs3, fs7, rdn
                  sll          a5, t3, ra
                  mulhsu       a4, a7, t1
                  divu         a6, a6, t4
                  xori         t1, s0, 588
                  xor          t4, a5, ra
                  sra          a6, a6, a7
                  feq.s        a6, fa2, fa2
                  srl          s0, a0, s2
                  sub          s6, tp, t4
                  fmv.w.x      fs11, a4
                  sltiu        s6, a2, -375
                  fmin.s       fs0, fa5, ft4
                  sll          s8, ra, s2
                  mulhsu       t2, a1, s3
                  fcvt.w.s     t4, fa5, rdn
                  addi         s2, t3, 914
                  or           a6, a4, t4
                  or           s9, s10, t3
                  srli         s9, zero, 25
                  fsgnjx.s     fa4, ft3, fa7
                  sltiu        s0, zero, 574
                  fcvt.w.s     s11, fs10, rmm
                  sra          t1, a0, s11
                  ori          t2, a6, 246
                  slt          t2, tp, a6
                  fcvt.s.wu    ft6, s2
                  flt.s        t6, ft1, fs1
                  fsub.s       ft5, fs0, fs2
                  mulhu        a6, s7, s8
                  div          s7, s1, t2
                  fmin.s       ft5, fs9, fs4
                  mulhsu       t4, s0, s8
                  srli         t3, a6, 29
                  fmv.x.w      t3, ft8
                  or           s5, t3, zero
                  slt          s6, s3, s0
                  fcvt.s.wu    ft9, t2
                  fcvt.wu.s    ra, ft2, rup
                  remu         t2, t6, t0
                  fadd.s       fs0, fa7, fa1, rtz
                  fsgnj.s      fa3, ft5, fs2
                  fmul.s       ft7, fa7, fs0, rne
                  xor          s10, a6, tp
                  divu         s10, a6, t0
                  fsgnjx.s     ft5, ft4, fa6
                  fcvt.s.wu    fa0, a6, rdn
                  fsgnj.s      fa3, ft2, fa0
                  sltiu        zero, s7, -1722
                  sra          t5, s10, s11
                  sltiu        s11, t0, 1315
                  fmv.w.x      fs11, s11
                  fsqrt.s      ft9, fa6, rdn
                  addi         s0, s5, 1954
                  sltiu        a5, a3, 803
                  fsgnj.s      fa6, ft9, fs1
                  divu         a7, s4, s3
                  slti         s2, t4, 1649
                  fdiv.s       fa5, ft5, ft8
                  sub          a0, a0, s4
                  auipc        zero, 379451
                  mulhu        s11, zero, tp
                  sll          a4, s9, s3
                  srl          ra, a4, ra
                  remu         a7, a6, t3
                  fcvt.w.s     t3, ft0, rtz
                  slli         a0, t0, 1
                  fclass.s     ra, fa3
                  sra          zero, a3, s7
                  mul          ra, s2, s6
                  addi         a4, s1, 1821
                  fclass.s     a3, ft9
                  sub          t5, sp, s10
                  slli         gp, s3, 18
                  fdiv.s       fa6, ft11, fs6, rdn
                  fle.s        a1, fs5, fs4
                  and          s7, s9, a6
                  xori         t0, a7, -1116
                  fcvt.w.s     s11, ft6
                  fle.s        s11, ft0, fs1
                  fclass.s     t5, ft0
                  sltu         s6, s4, a2
                  sra          a5, gp, s1
                  add          t3, s6, a1
                  sltu         s6, s6, sp
                  flt.s        s4, ft1, ft4
                  mulh         a2, s4, a1
                  sltiu        gp, t5, 907
                  sra          t3, gp, s6
                  fclass.s     t3, fs0
                  or           t0, a5, t5
                  xor          a6, a5, s2
                  fclass.s     s8, fs11
                  andi         s11, t2, 673
                  fmin.s       fa7, fa1, fs6
                  fsgnjn.s     ft4, fa2, ft6
                  fsub.s       fs4, fa4, ft2
                  and          gp, tp, t3
                  fsqrt.s      fs3, fs2
                  fcvt.w.s     a1, fs4, rup
                  or           s6, s10, s5
                  fdiv.s       ft1, fs7, fs6
                  fcvt.s.wu    fs9, a6
                  rem          t3, s4, t0
                  slli         s8, s1, 0
                  sub          zero, s11, a1
                  remu         a7, ra, t1
                  sltu         t6, zero, a4
                  or           a3, a3, sp
                  mulhsu       a2, s10, a7
                  divu         zero, sp, s6
                  addi         s2, a6, 116
                  fclass.s     a6, fa0
                  sll          t5, t4, t2
                  sub          t3, a3, s2
                  fmv.w.x      fs2, sp
                  fdiv.s       ft0, fa0, fs11
                  sra          s5, sp, t5
                  mulhu        a2, s11, a4
                  slti         t5, t3, 9
                  addi         s4, t6, -731
                  andi         ra, s3, -138
                  mulhu        t6, gp, s3
                  xor          a1, t4, t2
                  remu         gp, t2, sp
                  fcvt.wu.s    s9, fs2
                  addi         t4, s7, 1221
                  slti         gp, t4, -865
                  fmax.s       fa4, fa2, fs9
                  fadd.s       ft1, fa1, fa6
                  mulh         s7, a3, zero
                  slli         a7, s7, 10
                  fmax.s       fs1, ft4, ft0
                  sll          gp, t6, t5
                  srli         a5, tp, 3
                  fsgnj.s      fa3, fs0, ft9
                  fmv.w.x      fs4, a7
                  fmul.s       fa0, fa6, ft2
                  fcvt.wu.s    tp, ft4
                  srl          zero, a5, t0
                  mulh         a7, gp, s4
                  fcvt.s.w     fa7, a1, rdn
                  sra          a1, zero, a2
                  sub          s10, t5, s3
                  sll          t3, s10, t4
                  fdiv.s       fa7, fs4, fs9, rmm
                  sub          s0, a6, s11
                  sltiu        a0, gp, -1274
                  lui          s10, 490282
                  nop
                  sltu         t4, s8, s0
                  mul          a7, a4, s5
                  flt.s        a1, fa1, ft0
                  srli         tp, s0, 23
                  fcvt.w.s     t6, ft0, rdn
                  fmv.w.x      ft11, s4
                  mulhu        t0, zero, sp
                  fsub.s       ft0, fa6, ft1
                  slli         a6, s8, 16
                  sll          a3, s4, s9
                  fcvt.w.s     s8, fs1
                  fdiv.s       fs9, ft11, fs10
                  slli         t5, a2, 0
                  fle.s        zero, ft11, ft11
                  fmax.s       fs2, fs4, ft10
                  sltu         a1, s7, a5
                  feq.s        t2, ft5, fs10
                  or           a1, t2, a7
                  fle.s        a6, ft7, fs6
                  feq.s        s9, ft11, fa2
                  lui          s5, 235118
                  auipc        s9, 937155
                  ori          t5, s9, 519
                  sub          s10, a2, tp
                  slti         s2, t6, 165
                  fcvt.s.wu    fs11, a6
                  xor          a0, a4, t6
                  fmv.x.w      s10, fa7
                  sltu         t5, a0, gp
                  divu         s11, s6, a4
                  ori          s7, s6, 1422
                  or           gp, t5, s8
                  mulh         s8, s0, a0
                  flt.s        s6, ft9, ft2
                  fmax.s       fs1, ft5, ft11
                  fcvt.wu.s    t4, fs2, rne
                  rem          s8, a1, a0
                  fcvt.s.w     ft0, t5, rtz
                  and          t1, t3, a7
                  or           s5, s5, a7
                  div          t1, sp, gp
                  slli         s2, t1, 5
                  addi         t3, a1, -520
                  mulhsu       a1, t1, tp
                  sltiu        t5, t2, 774
                  srli         t1, t0, 18
                  flt.s        t3, ft7, ft0
                  addi         s8, a1, 1486
                  fsgnj.s      ft4, fs7, fs10
                  fsgnj.s      ft10, ft1, fa7
                  fcvt.w.s     gp, fa5
                  ori          s7, t0, 1218
                  nop
                  mulhsu       a5, t1, t4
                  slt          a5, s10, a1
                  fmv.w.x      ft9, s8
                  fcvt.s.wu    fa7, t6, rtz
                  xor          tp, s5, s11
                  div          t3, s11, a4
                  sltiu        s7, a5, -1097
                  fsgnjx.s     fs3, ft9, fs4
                  fmin.s       fs1, fa5, ft5
                  sll          t3, a6, a3
                  fsqrt.s      fs10, ft2
                  fle.s        a1, fa3, fs10
                  sltu         a0, s8, t0
                  fsqrt.s      fs8, ft1, rmm
                  rem          gp, sp, s7
                  and          s11, a0, a4
                  fdiv.s       fs4, ft5, ft4, rne
                  sll          zero, s4, a6
                  rem          a6, s10, s4
                  remu         t2, s6, a1
                  fmax.s       fs3, fa2, fs11
                  sub          s10, s10, t4
                  flt.s        a1, fs6, fs11
                  fcvt.w.s     s2, fs5
                  fmax.s       fs0, ft3, fs11
                  xori         a6, a1, 671
                  addi         s0, a4, 1299
                  srl          s5, a2, s7
                  lui          a0, 511792
                  fcvt.s.w     fs8, s3, rmm
                  fcvt.w.s     a6, fs7
                  fdiv.s       ft10, fa0, ft0
                  srl          ra, gp, t2
                  slti         tp, s3, 929
                  fadd.s       fs0, fs11, ft3, rne
                  rem          s11, t1, gp
                  fcvt.wu.s    tp, fs8
                  xori         s5, a3, 1133
                  srai         t1, s4, 9
                  mulhsu       gp, s5, s3
                  srai         a4, a4, 23
                  and          s7, t0, s9
                  fcvt.w.s     s6, fs10, rup
                  divu         gp, ra, a0
                  xor          a2, a7, t1
                  sll          s6, t5, s1
                  fdiv.s       ft11, fs2, fs2, rmm
                  fsub.s       fs11, ft0, ft1, rtz
                  fsqrt.s      fa0, fs5
                  divu         s9, s6, s2
                  sub          t1, zero, t1
                  slt          s11, s4, s3
                  auipc        s0, 1032154
                  slt          a7, a3, a6
                  fdiv.s       fa6, fs2, fa3
                  rem          s9, s3, s1
                  fcvt.s.wu    ft2, a5, rmm
                  remu         s8, a0, zero
                  slli         s11, s3, 22
                  sub          t1, s8, zero
                  ori          s8, t0, 1939
                  rem          a6, t6, s6
                  srai         a5, t3, 21
                  and          t0, s7, a4
                  fmv.w.x      fs7, s10
                  fmv.x.w      a2, fs11
                  rem          a3, s2, s7
                  sltiu        a6, s7, -519
                  mulhsu       a0, s10, s11
                  fmul.s       fs1, fs11, fs1
                  fmax.s       ft6, fs0, fs8
                  fdiv.s       fs2, ft8, ft9
                  rem          s9, t4, s0
                  div          t5, s9, ra
                  fclass.s     s5, fa3
                  fmv.x.w      a3, ft9
                  mulhsu       gp, s0, zero
                  fclass.s     a1, fa3
                  mulhu        s2, s0, a1
                  add          s2, gp, t2
                  andi         s5, s10, -1331
                  and          tp, a3, t0
                  addi         s8, s9, 81
                  mulhu        t5, s2, ra
                  remu         s4, a7, s0
                  fsgnjn.s     fa3, ft6, ft10
                  fsgnjx.s     fa4, fa6, fa1
                  sll          a2, t6, a1
                  nop
                  fcvt.s.w     ft2, t4, rup
                  sra          s4, t5, t5
                  fmin.s       fs8, fs11, ft11
                  fmv.w.x      ft3, s4
                  mulhsu       a1, t5, t1
                  srai         a4, t4, 11
                  sltiu        t2, s3, 312
                  fclass.s     t1, ft0
                  fcvt.s.w     ft1, zero
                  sltiu        s7, sp, -1086
                  fsgnjn.s     fs1, fs0, ft10
                  remu         a2, t5, a4
                  sltiu        t3, tp, -1391
                  fdiv.s       fs11, fs0, ft0
                  fadd.s       fa7, fa1, fs9, rtz
                  or           s5, t3, gp
                  flt.s        a4, ft1, ft7
                  nop
                  fsgnjn.s     fa3, ft7, fs9
                  sltu         a7, t4, tp
                  slli         s0, gp, 4
                  ori          t5, s5, -665
                  srai         s8, s8, 10
                  fcvt.s.w     fs0, s7
                  sub          t0, ra, s5
                  srai         t0, gp, 4
                  fdiv.s       ft0, fs0, ft0
                  xori         t2, t4, 1787
                  slti         s6, s7, -894
                  slt          a5, s4, s3
                  fle.s        s0, fa3, fa6
                  auipc        s10, 110912
                  mulhsu       t2, a3, s3
                  mulhsu       gp, a1, t4
                  slt          s11, t3, a7
                  addi         a7, a7, -1049
                  srli         t1, t4, 9
                  mul          ra, s11, t3
                  addi         t4, t0, -1874
                  sll          a2, s1, t3
                  remu         s8, s10, a5
                  remu         tp, s3, s11
                  flt.s        t5, ft1, ft0
                  mulhsu       t5, s0, a3
                  fmv.x.w      a1, ft10
                  auipc        a6, 647359
                  xori         t2, s6, 729
                  sra          a6, a4, s8
                  add          s4, a4, a1
                  slli         t0, ra, 5
                  xor          s11, t3, s10
                  flt.s        tp, fs7, ft5
                  fsqrt.s      fs0, fs10
                  fmax.s       fs11, fa6, ft10
                  slti         a7, a6, -576
                  fcvt.w.s     s4, ft6
                  fadd.s       ft10, ft4, fs2, rmm
                  sltu         t1, t1, a1
                  auipc        s0, 396394
                  srl          s2, s6, a4
                  slt          s7, t6, t2
                  fcvt.w.s     gp, fs5
                  mulh         a7, a4, s11
                  or           s5, a6, s10
                  mulh         s10, t3, a6
                  addi         a1, t0, 1452
                  fsqrt.s      fa0, fs9, rne
                  div          ra, gp, a3
                  sltiu        t5, a1, 1125
                  fsgnj.s      ft5, fa1, fa7
                  sltu         a0, t0, a5
                  nop
                  xor          t5, s5, a2
                  mul          s2, s4, a0
                  mulhsu       t3, s4, s10
                  fmul.s       fs1, ft0, fs10, rdn
                  fdiv.s       fa6, fa7, fs3
                  fclass.s     s4, ft8
                  fsgnjx.s     ft10, fs2, fs6
                  fsgnjx.s     ft0, ft5, ft1
                  fmax.s       ft4, fs6, fa1
                  fmax.s       fs5, fs7, fa5
                  slt          t6, a6, a0
                  sll          t0, s4, s11
                  mulhsu       a4, a5, a7
                  fcvt.wu.s    t2, fs1, rdn
                  nop
                  rem          a3, s1, a1
                  feq.s        t4, fs8, ft8
                  addi         a0, s0, -652
                  fsqrt.s      ft1, fa2, rtz
                  rem          a1, a4, s11
                  fsub.s       fs2, fa7, fa4
                  fcvt.wu.s    ra, fa6
                  flt.s        t1, ft10, fs4
                  add          t1, t4, sp
                  feq.s        t2, ft5, ft2
                  sltu         a0, a0, s10
                  fsgnj.s      fs10, fs8, fs4
                  fcvt.wu.s    s0, ft5
                  fsgnj.s      ft0, ft9, fa2
                  addi         a6, t1, -657
                  mulh         s2, t5, s8
                  fcvt.s.w     fa5, s7, rup
                  slti         s9, a7, 1866
                  slt          gp, s7, zero
                  or           t0, a3, a0
                  nop
                  feq.s        gp, ft0, fa0
                  slt          zero, gp, a1
                  sltiu        s0, s10, 413
                  flt.s        a4, fs8, fs9
                  slt          s10, t3, a0
                  lui          s10, 69952
                  and          a5, s7, s11
                  remu         a0, tp, s6
                  srl          t2, t4, t3
                  xor          t0, s5, t3
                  xor          s9, s6, s5
                  slt          t0, t1, t2
                  sra          a7, s11, a7
                  flt.s        s4, ft10, fs4
                  fsqrt.s      fa3, fa3
                  or           s6, a3, a2
                  fsgnjn.s     fs1, fs11, ft3
                  fmul.s       fs10, fs11, fa5
                  remu         t2, s10, a5
                  fmin.s       fs11, ft9, ft3
                  mulhsu       t3, s5, a6
                  fmax.s       fa2, ft4, fs0
                  fsgnjx.s     fa4, ft0, fa4
                  fle.s        s8, fs4, ft9
                  fmv.w.x      ft1, a1
                  mulhu        t5, t4, s10
                  divu         tp, s8, s9
                  fsgnjn.s     ft0, ft7, ft3
                  flt.s        ra, fs3, ft4
                  sra          a0, a4, zero
                  fcvt.s.w     ft2, t2, rtz
                  fcvt.w.s     s8, fs0
                  slli         a7, a5, 2
                  slli         a4, t2, 0
                  remu         s0, a5, a4
                  xori         t2, s2, 1573
                  fle.s        a4, fa4, fs2
                  div          gp, s5, s4
                  sltiu        a7, s1, 1776
                  fle.s        s9, fs5, fa3
                  feq.s        a0, fs7, fs4
                  mul          t6, s7, ra
                  srli         s10, t1, 24
                  fcvt.wu.s    tp, fa1
                  slti         t0, s0, -1559
                  fsqrt.s      fs6, fa4, rtz
                  srai         t3, a0, 4
                  sll          a3, a3, s7
                  remu         t6, a4, s2
                  fcvt.s.w     fs11, t6, rdn
                  sltiu        s9, a3, -1187
                  fadd.s       ft11, fs3, fs9
                  fdiv.s       fs7, ft8, ft9
                  slli         t6, t2, 27
                  auipc        a6, 670373
                  xori         s0, s1, -1177
                  xor          t0, t3, a6
                  and          ra, t1, s5
                  srl          zero, a1, t0
                  fmax.s       fs3, fa4, fs9
                  fmv.x.w      s9, fs11
                  lui          t2, 838221
                  add          s9, t0, t5
                  fcvt.s.w     fs0, a3, rmm
                  fcvt.w.s     t1, ft11
                  fcvt.wu.s    gp, fs11
                  fsub.s       fa2, ft2, fa7
                  flt.s        s2, ft10, ft11
                  slti         t3, s8, 1985
                  fcvt.s.wu    ft10, t3
                  and          s4, s8, s4
                  sub          t5, t0, s4
                  div          a6, t2, t6
                  fsgnjn.s     ft5, fs6, ft9
                  divu         a2, a6, a4
                  fcvt.s.wu    ft2, a2, rne
                  slti         a4, t1, 1095
                  fmv.x.w      s0, fa0
                  andi         a6, s11, -1849
                  fsqrt.s      fa6, fs11
                  remu         s6, t5, a3
                  fmv.x.w      s8, ft11
                  fmv.x.w      s11, fa7
                  lui          gp, 982752
                  fmv.x.w      s11, ft3
                  fsqrt.s      ft4, ft2
                  fmax.s       ft0, fs3, ft9
                  fmax.s       fa1, fs6, ft5
                  fclass.s     a3, fs0
                  fdiv.s       fa5, fa4, ft1
                  sub          s9, s0, zero
                  mulhsu       s8, s6, s8
                  xori         a0, sp, -2032
                  remu         s9, a3, s8
                  divu         ra, a4, a6
                  slti         s10, a2, 1696
                  or           s9, s9, s7
                  fsgnj.s      fs6, ft0, ft9
                  xor          s5, a2, a1
                  slti         tp, t6, 973
                  fsgnjn.s     ft3, ft0, ft0
                  andi         a6, a0, -304
                  divu         s0, t6, s5
                  rem          s0, a7, s5
                  andi         s9, a4, 1387
                  divu         s0, zero, s7
                  div          t5, s10, t4
                  mulhsu       s6, s7, s7
                  fsqrt.s      ft1, fa5, rdn
                  add          gp, s11, t4
                  add          s0, t1, tp
                  addi         a0, t1, -1658
                  sltu         t2, s1, t3
                  slli         ra, t4, 29
                  andi         a7, s2, -1370
                  srai         t2, ra, 26
                  fsgnj.s      ft10, ft7, ft8
                  mul          a2, a0, s9
                  fdiv.s       fs10, fa1, fa5
                  nop
                  fadd.s       ft9, ft6, fa5, rtz
                  auipc        s6, 56804
                  fmv.w.x      fs2, s2
                  feq.s        t6, fa2, fs5
                  divu         a7, a1, a4
                  divu         zero, s0, tp
                  mulhu        a7, s7, s8
                  div          s0, s3, s3
                  fsgnjx.s     fa6, fa2, fs7
                  lui          t6, 421021
                  slli         gp, s5, 14
                  ori          t1, a6, 436
                  fle.s        s10, ft0, ft1
                  addi         gp, t0, -995
                  or           s6, s0, t5
                  fadd.s       ft10, ft2, fs4, rup
                  srai         s6, s4, 20
                  auipc        t3, 420738
                  fmv.x.w      s9, fa5
                  sll          a4, s0, a6
                  lui          t4, 577246
                  sltu         t1, s11, t1
                  and          a2, a1, a4
                  sll          t6, s11, s6
                  remu         a2, s6, t6
                  fsub.s       fs5, fs7, ft1
                  fclass.s     t1, fa6
                  slli         t3, gp, 31
                  sll          s9, tp, s10
                  ori          s11, t4, -1569
                  fsqrt.s      fs8, fs11
                  slt          s6, s11, t6
                  sltiu        t1, a4, 1196
                  fmv.w.x      ft6, t2
                  fadd.s       fs0, fs3, ft6
                  lui          s4, 538402
                  xor          s11, s4, s2
                  slli         s10, a6, 3
                  feq.s        t6, fa5, ft10
                  fmul.s       ft2, fs0, fa5, rmm
                  and          ra, t0, tp
                  lui          s9, 544541
                  auipc        s5, 80025
                  fclass.s     a3, fa6
                  fclass.s     gp, fa6
                  fle.s        s9, ft9, fs10
                  srl          tp, s3, t4
                  fadd.s       fa5, fs4, fs1
                  and          a1, a5, s3
                  sltiu        a4, gp, 1454
                  fadd.s       fa7, fa2, fs9, rmm
                  fcvt.s.wu    fs10, t1
                  srl          a7, a7, t5
                  andi         s8, a7, -1744
                  fcvt.w.s     t1, ft0
                  fmul.s       ft8, fa4, ft1, rmm
                  slti         a3, tp, -1108
                  mulh         t2, ra, a3
                  and          s7, t3, a0
                  fsub.s       fa3, fa5, fs6, rup
                  feq.s        s8, ft9, fa4
                  xor          t5, s1, a7
                  fmv.w.x      fa3, t0
                  slti         a2, s1, -1762
                  fsgnjx.s     ft3, ft5, fa4
                  remu         t6, s11, a3
                  fdiv.s       ft1, fs11, ft7, rmm
                  xor          t4, t1, t0
                  divu         s6, s10, zero
                  sltu         t0, ra, t6
                  mulhu        t4, t2, ra
                  fsub.s       ft3, fa1, fs0
                  mulhu        s4, gp, gp
                  flt.s        a5, fs4, ft2
                  fmv.x.w      t2, fa4
                  fmax.s       ft9, fa3, ft3
                  fmv.w.x      ft6, s4
                  fcvt.s.wu    ft7, t0, rup
                  sra          a7, s11, s6
                  fcvt.wu.s    a6, fs2, rne
                  fsgnjx.s     fs9, ft2, fs5
                  fclass.s     t5, ft1
                  fcvt.wu.s    gp, ft7, rup
                  add          t0, a2, s7
                  fadd.s       fa1, fs4, fa3
                  rem          a5, a3, s6
                  add          t3, a0, s5
                  fsgnjn.s     ft0, ft0, fa4
                  rem          a1, s8, zero
                  flt.s        s9, fs7, ft11
                  fmv.w.x      fa0, a4
                  fle.s        t2, ft10, ft4
                  fle.s        s10, fa1, ft11
                  xor          s2, sp, s9
                  ori          a5, a7, -55
                  sra          s8, t4, a0
                  flt.s        t4, fs2, ft2
                  sltiu        s7, a0, -1763
                  fsub.s       fa4, fa3, fs6
                  fle.s        a3, ft6, fs1
                  fsgnjx.s     fa5, ft10, fa0
                  nop
                  fsgnjx.s     ft10, ft11, fs10
                  fsqrt.s      ft3, ft6, rdn
                  sub          tp, t0, s0
                  mulh         s9, a3, s1
                  fadd.s       fs5, ft2, fs11, rmm
                  divu         t2, t6, a1
                  flt.s        a0, fs7, fs1
                  auipc        s2, 536878
                  feq.s        a2, fa0, ft1
                  fcvt.s.wu    fs4, s7
                  sltiu        zero, t6, 1169
                  fsgnj.s      fs1, ft0, ft9
                  sll          s9, tp, tp
                  mulhu        ra, t5, s8
                  fclass.s     t4, fs6
                  mulhsu       t0, s5, sp
                  lui          s7, 926724
                  andi         a4, s8, 551
                  sub          a4, gp, s3
                  fsgnjx.s     ft10, ft11, fs6
                  divu         a6, t0, zero
                  addi         a1, a7, -1488
                  slt          t0, a5, t0
                  andi         t6, a3, 118
                  mulhsu       a2, a7, a1
                  remu         s10, s5, a5
                  sll          zero, ra, s11
                  xor          s2, a0, t1
                  fle.s        a6, fs7, fa4
                  flt.s        t2, fa5, fs0
                  mulhsu       t5, t1, zero
                  xori         s8, t4, 782
                  addi         a5, tp, 580
                  feq.s        s10, ft4, ft4
                  srai         t1, s7, 26
                  mul          t6, s1, s9
                  or           t2, a2, a7
                  slt          a4, a5, t0
                  srl          s2, t5, a4
                  rem          t6, s4, t5
                  div          s7, s1, a2
                  slt          s4, t5, t4
                  mulhu        s11, s6, a4
                  sltu         a1, s7, s8
                  fcvt.w.s     a2, fs2, rup
                  add          s6, s10, s7
                  mulh         ra, a5, a4
                  fadd.s       fs0, ft11, fs9, rtz
                  mulhsu       s6, a4, s7
                  fmv.x.w      t6, ft0
                  fcvt.w.s     a2, ft11
                  slt          s4, s10, s6
                  or           a5, s11, a0
                  lui          t6, 548799
                  fsgnj.s      ft4, fs5, ft2
                  lui          s7, 867778
                  fclass.s     s10, fa7
                  divu         s10, s6, t2
                  div          t0, s3, a7
                  addi         s10, s0, -218
                  xori         t0, a3, 181
                  divu         s11, a7, t2
                  mulhu        a5, s4, s5
                  sltu         tp, s11, a5
                  srl          a0, a3, t0
                  sub          t5, s2, a2
                  fdiv.s       fa0, fs7, ft8, rdn
                  srl          s6, s4, s0
                  fcvt.s.w     ft1, s0, rdn
                  srai         s10, a0, 8
                  remu         t3, t1, t6
                  lui          t5, 649645
                  and          t6, s3, a4
                  srai         s0, t3, 16
                  div          a7, s3, sp
                  fsgnjx.s     fs5, ft10, ft6
                  fmax.s       fa2, ft5, ft3
                  divu         s6, a5, gp
                  fmin.s       fs4, ft8, fs11
                  fcvt.w.s     s6, ft2
                  fmin.s       fa0, fa1, fs7
                  lui          a0, 907026
                  sltu         tp, s2, a6
                  flt.s        t4, ft3, ft7
                  auipc        s2, 661576
                  srli         zero, gp, 7
                  add          tp, tp, a2
                  and          a2, s0, a6
                  sltu         a1, gp, a5
                  slli         s10, gp, 0
                  rem          s10, a5, s11
                  mulhsu       s11, zero, s9
                  mulhu        t2, t0, a1
                  fsub.s       fs8, ft8, ft8, rdn
                  fsub.s       fs0, fa3, ft0, rup
                  fdiv.s       fs7, fs6, ft0
                  fle.s        t6, fs11, fs2
                  srai         a0, a1, 24
                  add          s7, s7, ra
                  ori          t1, gp, 187
                  fsgnjn.s     ft2, ft8, fs10
                  or           s10, t6, a3
                  fsgnjn.s     fa3, ft6, ft10
                  sltiu        gp, ra, 473
                  ori          s0, t6, 1569
                  sub          t1, t0, s0
                  fadd.s       fa0, ft6, fa0, rup
                  divu         s7, a6, a2
                  fdiv.s       fa4, fs1, fa1
                  remu         s0, sp, s4
                  mulhsu       s2, s9, t1
                  fclass.s     t0, ft5
                  srl          a0, s7, s9
                  sub          a1, t6, s9
                  fsqrt.s      fa5, fs0
                  fmax.s       fs2, fa4, fs9
                  mulhsu       s9, s6, t1
                  lui          t3, 724143
                  sll          t0, s9, ra
                  ori          s5, s6, -462
                  fmv.x.w      s7, ft2
                  fsqrt.s      fs0, fa5
                  nop
                  sltu         s9, s7, t5
                  nop
                  fsqrt.s      fs3, fa3, rmm
                  fadd.s       fs0, fs11, fa0
                  rem          tp, s9, s10
                  remu         a1, gp, zero
                  andi         t0, a0, -1043
                  div          t1, a6, s11
                  add          t2, s10, t3
                  flt.s        s6, fs8, fs2
                  fmv.x.w      a4, fa5
                  fsub.s       fs4, ft10, fa4, rup
                  fmul.s       fs6, ft2, fs8
                  rem          a3, sp, t1
                  sra          ra, a3, t0
                  add          t5, s11, s0
                  lui          ra, 214720
                  divu         t4, t5, ra
                  mulh         t0, t5, s3
                  sltu         s0, s9, a2
                  flt.s        a7, ft10, ft5
                  fmv.x.w      a5, ft6
                  fdiv.s       fs9, fs4, fs0
                  flt.s        t2, fa7, ft1
                  xori         t6, ra, -1230
                  fsgnjn.s     ft0, ft3, fa0
                  sltu         t4, a1, gp
                  srai         s11, s3, 15
                  remu         ra, a4, a1
                  fsgnjx.s     fa0, ft4, fa3
                  sltu         a1, a0, t3
                  sltu         gp, t1, s7
                  fdiv.s       fs5, ft3, ft2
                  fclass.s     s8, ft3
                  fmax.s       ft5, fs5, fa6
                  lui          s9, 349551
                  auipc        s11, 625251
                  sltu         s8, t1, s2
                  xori         a6, s3, 1230
                  fsgnj.s      fs8, ft7, fa1
                  div          s5, tp, t3
                  fsgnjx.s     ft11, fs1, ft1
                  fcvt.w.s     s11, fs1, rmm
                  div          s11, s7, zero
                  andi         a6, t2, 832
                  sll          a2, t4, s4
                  fsqrt.s      fs6, fa6, rne
                  fmax.s       fs6, fs10, fa4
                  mulh         a6, s5, a0
                  or           a6, t4, a0
                  fdiv.s       ft8, fs8, fs5
                  sra          a5, gp, t6
                  rem          s4, sp, t2
                  fsgnjn.s     fs6, ft3, ft11
                  mul          t3, a1, s2
                  fle.s        s4, ft1, ft3
                  fclass.s     t5, fa3
                  rem          s4, t2, t0
                  or           t5, s7, a6
                  add          s7, t3, a4
                  sra          s9, s1, tp
                  or           tp, a4, s5
                  fmv.w.x      fa2, sp
                  or           a6, t3, s11
                  nop
                  fmv.w.x      fs3, s10
                  mulhsu       a7, a6, a0
                  fsgnj.s      fa2, ft9, ft11
                  flt.s        a0, fs3, fs1
                  srli         s8, t4, 20
                  fsub.s       fa5, fs4, fs1
                  mulh         t3, s0, a7
                  fclass.s     s0, fs10
                  slli         a1, t2, 15
                  and          a7, s9, a1
                  srli         s11, zero, 15
                  fsub.s       fa7, fs8, ft10
                  divu         zero, sp, a2
                  sltu         s11, t6, tp
                  slt          s4, a1, a1
                  fcvt.s.wu    fa5, a3, rmm
                  fdiv.s       fs10, ft11, fs8, rne
                  xori         s5, t4, -1910
                  sll          a6, s5, s1
                  sub          t4, a3, s0
                  mulhu        t1, s11, ra
                  add          s2, t1, a4
                  fsgnjn.s     fs0, fs9, fa2
                  mul          ra, s6, a2
                  fmul.s       ft6, ft11, ft6, rup
                  and          zero, s5, s1
                  remu         a6, s1, t2
                  divu         t2, s7, t6
                  srli         s6, s1, 29
                  mulhu        s9, s5, s6
                  sltu         a3, sp, t2
                  fadd.s       fs10, fs5, ft6, rtz
                  srai         zero, sp, 31
                  flt.s        ra, ft11, ft0
                  xor          s11, t5, a2
                  mul          s0, a3, a1
                  xor          t5, gp, s9
                  rem          ra, s3, t3
                  fclass.s     a1, fa5
                  sltiu        s0, t1, -483
                  and          s9, s6, sp
                  ori          a6, tp, 91
                  xor          t0, t4, s11
                  mulh         s6, s9, s9
                  srli         t0, s11, 13
                  fsqrt.s      fs3, ft10
                  sltu         a4, a6, a4
                  fle.s        s2, ft2, ft4
                  fdiv.s       fs8, fs1, ft5, rne
                  div          zero, a6, t1
                  slti         s4, s4, 300
                  fsgnjx.s     ft5, fs11, ft11
                  sll          a4, s9, t4
                  ori          a3, a6, 637
                  or           ra, s3, t4
                  and          s11, s10, s9
                  sltiu        tp, a7, 474
                  mulhsu       t0, a5, s4
                  lui          gp, 914616
                  fmv.x.w      t0, fa6
                  fdiv.s       fs11, ft4, fs1
                  slti         s9, s9, -449
                  fmax.s       fa1, fa6, ft9
                  fsgnj.s      ft1, ft5, fs1
                  add          a3, zero, s11
                  sra          s0, gp, s0
                  add          s6, s2, s8
                  fsub.s       fa6, ft8, ft1
                  fadd.s       ft8, fs2, fs5, rmm
                  mul          ra, a7, a2
                  and          a6, t2, t1
                  xori         a1, t2, -1696
                  srl          a5, s7, s0
                  sltu         gp, a2, s9
                  sub          t2, s1, zero
                  mulh         a7, s6, s0
                  sltiu        ra, t3, 1354
                  mulhu        tp, s1, a1
                  fmul.s       fs8, fs4, fs3, rtz
                  slli         a1, s8, 26
                  fcvt.w.s     s2, fa3, rtz
                  sra          s5, t2, s0
                  slti         s6, ra, 2044
                  mulhu        s11, t1, s2
                  fcvt.wu.s    ra, fs9, rdn
                  fmin.s       ft2, fa0, ft10
                  sltiu        t2, s0, 1828
                  div          a2, a4, sp
                  fdiv.s       fa2, ft3, fs4, rtz
                  mulhsu       s6, a7, s0
                  fdiv.s       fs8, fa2, ft5
                  sltiu        s5, s5, -1531
                  fmax.s       fa0, ft3, fa5
                  addi         a1, a1, -1878
                  sra          s4, s10, s8
                  rem          t3, zero, t3
                  fsgnj.s      fs2, ft9, ft7
                  xori         s11, t6, 735
                  fdiv.s       ft6, fa2, fs1, rup
                  fsub.s       fa1, fs9, ft7
                  fsgnjx.s     fs10, fa2, ft5
                  or           s4, tp, s5
                  flt.s        a0, fa3, fa0
                  fclass.s     t5, fa6
                  fcvt.wu.s    ra, ft10
                  nop
                  sll          s7, a7, t1
                  fdiv.s       fs9, fs6, fs8, rdn
                  fmin.s       ft3, fs7, fs8
                  xori         s6, a5, -1707
                  or           s4, a3, a7
                  feq.s        a3, fa1, ft8
                  sltiu        a4, tp, -1530
                  fadd.s       ft6, fa7, ft4, rtz
                  fsqrt.s      fs0, ft1
                  srl          t1, a7, s6
                  fsgnjx.s     fs0, ft0, fs3
                  addi         a2, s7, -1368
                  fmv.w.x      ft8, a5
                  flt.s        s11, fs3, fs1
                  fcvt.wu.s    ra, ft5, rne
                  mulhu        t0, t1, a7
                  sll          a7, t1, s3
                  or           s2, a2, a5
                  fsgnj.s      fs3, fa2, ft3
                  fsgnjn.s     fs11, fs10, fs9
                  flt.s        t1, fs10, fs0
                  sub          a2, s10, s3
                  sll          s10, s4, s1
                  sll          s9, a2, t1
                  lui          a6, 349938
                  sltiu        ra, s1, -1198
                  slt          s7, t5, s5
                  fsgnj.s      ft10, fs0, fa1
                  fmin.s       fs1, ft0, ft4
                  fcvt.s.w     fa0, t0, rtz
                  auipc        s8, 1032795
                  fmul.s       ft6, fa4, fa7
                  fcvt.w.s     a3, fs3
                  fmv.w.x      fs6, s6
                  fcvt.wu.s    s5, fs10, rup
                  fsgnjx.s     fs8, fa5, fs11
                  fclass.s     a3, ft4
                  feq.s        a6, fs0, fs10
                  fsgnj.s      fs6, ft5, ft8
                  mul          s10, s6, s10
                  sltu         ra, s10, s5
                  fsub.s       fa0, ft5, ft9, rtz
                  fmul.s       ft0, fs4, fs10, rne
                  slt          s8, s0, t0
                  srli         a1, s1, 2
                  div          s7, s4, t4
                  feq.s        s4, fa1, fs3
                  fmv.w.x      ft4, ra
                  sra          s10, ra, a6
                  mulh         t5, a1, t1
                  and          t4, t3, s0
                  fcvt.s.wu    ft6, s4, rup
                  xori         s7, t6, 412
                  lui          a2, 150244
                  mulhu        t1, s9, t2
                  xori         t6, s3, 43
                  fdiv.s       fs2, fs10, fs1, rup
                  srai         a1, t2, 17
                  srai         s0, zero, 0
                  xori         gp, s2, 174
                  remu         gp, t5, s11
                  fsub.s       fs8, fs3, fs2
                  mulhu        s8, a4, t1
                  fmax.s       fa6, ft4, ft0
                  add          a3, t6, a4
                  sra          tp, s9, t0
                  fcvt.w.s     s9, ft6, rdn
                  slti         s11, a1, 913
                  auipc        s5, 153267
                  sltiu        a6, s2, -625
                  sltiu        a6, t5, 454
                  flt.s        t4, fs2, fs0
                  fadd.s       fs2, fs3, ft11, rmm
                  mulhu        s4, t5, a6
                  sub          s9, t1, t2
                  mul          t1, ra, sp
                  fdiv.s       ft2, fs0, ft3
                  fsgnj.s      ft7, fa7, ft3
                  add          t2, a4, a5
                  fmax.s       fa7, fa2, ft0
                  fmv.x.w      s7, fs8
                  auipc        a1, 675169
                  or           t2, t2, a1
                  fmin.s       fs10, fs6, ft2
                  feq.s        s5, fs5, fa4
                  fsqrt.s      ft0, fs6, rup
                  divu         gp, t4, s4
                  srl          a7, s6, s10
                  ori          gp, s7, 1175
                  fcvt.wu.s    gp, fs2
                  andi         s7, t2, 1107
                  fle.s        tp, fs3, fa4
                  add          s5, t2, ra
                  remu         t5, sp, t2
                  slti         a0, a4, -1241
                  div          t2, a7, a7
                  ori          a0, t3, 1148
                  fsub.s       ft11, fa7, fs1, rdn
                  slt          a5, s9, t4
                  sll          ra, t3, t1
                  or           s9, s5, a5
                  srai         a2, s11, 19
                  mulh         s2, s3, a7
                  slt          a3, t2, t2
                  mulh         a1, tp, a2
                  rem          a7, s7, s5
                  mul          a4, t0, t2
                  fadd.s       fs5, fs2, ft1
                  mulh         s0, zero, s7
                  remu         zero, a5, s11
                  fcvt.s.wu    ft11, s2
                  mulhsu       a4, s7, a4
                  feq.s        t3, fa5, fs4
                  or           gp, a5, s8
                  fsgnj.s      fs9, ft11, ft1
                  slti         s6, gp, 1075
                  feq.s        s4, ft9, fa0
                  xori         s10, a5, 72
                  xor          s2, gp, zero
                  sub          a0, gp, a2
                  xori         tp, zero, 1879
                  ori          s7, s11, 599
                  mulhsu       s5, s9, t4
                  sltu         t1, a7, t4
                  fmax.s       fa1, fs7, fs10
                  fsgnjx.s     ft2, ft9, ft7
                  fmin.s       ft11, fs10, ft0
                  sltiu        s10, a3, 531
                  srli         t6, tp, 19
                  srai         s2, s3, 31
                  sra          s8, a6, a1
                  sll          t1, t6, s11
                  lui          s0, 817049
                  andi         a5, s2, 126
                  or           a5, s9, s0
                  mulhsu       a7, s6, a6
                  fsub.s       ft11, ft0, fa1
                  fclass.s     t6, fs7
                  fcvt.s.wu    fs2, t3, rmm
                  mulhu        ra, a1, s2
                  div          s10, s9, t4
                  fmv.x.w      s2, fa2
                  rem          gp, t6, s6
                  lui          a3, 207189
                  andi         s6, a3, -1635
                  slt          t6, s6, a2
                  srl          t6, a6, t5
                  nop
                  fsqrt.s      fs9, ft0, rmm
                  ori          a7, s11, -1847
                  andi         t2, s9, 1797
                  flt.s        s7, ft1, fs11
                  sltu         t6, s2, s6
                  mulh         gp, a6, s8
                  xor          t5, a4, a6
                  fclass.s     t6, fa5
                  or           zero, a2, s11
                  fmin.s       fs11, fs0, ft10
                  fmax.s       ft5, ft8, ft4
                  fmin.s       fs11, fs4, ft4
                  fmv.w.x      ft3, a6
                  fsgnjn.s     fs1, ft3, ft6
                  mulh         a7, t0, s6
                  or           t1, a2, a7
                  slti         s6, t3, -1747
                  sra          s11, a3, s5
                  fdiv.s       fs10, fs6, fs6, rdn
                  lui          s11, 651605
                  fmv.w.x      fs11, s10
                  sra          tp, zero, tp
                  add          tp, s0, zero
                  nop
                  slti         a2, zero, 124
                  slt          a6, s3, t6
                  andi         t3, s10, 1510
                  sra          gp, a2, s10
                  sub          a3, t6, s7
                  slli         t0, s2, 5
                  mulhsu       tp, a5, sp
                  sub          tp, t0, t0
                  srai         s0, tp, 7
                  sra          s2, a6, t0
                  divu         s7, a0, t0
                  fcvt.wu.s    a0, fs0
                  sub          s2, s7, t2
                  or           t3, t6, s5
                  fsqrt.s      ft11, fs3, rmm
                  fsqrt.s      fs3, fa3, rdn
                  fcvt.s.wu    ft8, t0, rmm
                  sll          zero, a4, a3
                  add          s6, tp, t3
                  sub          s6, a4, s10
                  add          tp, tp, s0
                  sra          s2, a2, s7
                  fmax.s       fa4, fs5, ft11
                  and          a3, s0, s3
                  lui          gp, 889348
                  lui          s0, 762919
                  fsub.s       ft3, fs3, fs6, rup
                  div          s11, t5, t3
                  fclass.s     s7, fa6
                  fmv.x.w      s7, ft2
                  fsub.s       ft0, ft9, fs9, rtz
                  rem          a2, s3, s7
                  lui          a2, 433536
                  fsgnjn.s     fa7, fs3, fs4
                  ori          t2, zero, 734
                  fsgnjx.s     fs6, ft0, fs7
                  addi         zero, s4, -373
                  xor          s8, s0, s5
                  mulh         t3, s7, s8
                  fsqrt.s      ft6, ft0, rne
                  fsqrt.s      fs7, ft10, rdn
                  fcvt.s.w     fa1, s6
                  slli         t2, t6, 30
                  xori         tp, t5, 1238
                  rem          s6, s6, t6
                  fdiv.s       fa7, ft8, ft6
                  rem          ra, ra, zero
                  fcvt.w.s     t1, fs4, rmm
                  fcvt.s.wu    ft4, t4, rup
                  fmv.x.w      zero, fs10
                  add          t4, a0, t4
                  fcvt.wu.s    s0, fa4
                  auipc        s2, 572945
                  andi         gp, a2, 561
                  sltu         s9, tp, a7
                  fclass.s     t2, ft0
                  or           t4, s5, a7
                  mulhsu       a6, tp, s4
                  srai         t5, s9, 12
                  remu         a2, t5, a2
                  sll          tp, s11, gp
                  mulh         t6, a0, s10
                  xor          a7, zero, s3
                  fsgnjx.s     ft7, fs4, fs3
                  fsgnjn.s     fa6, fa2, fa4
                  xori         ra, zero, 1956
                  srai         tp, s10, 5
                  fsqrt.s      fs8, ft9
                  sll          s2, a1, t2
                  mul          t5, s5, tp
                  or           zero, gp, zero
                  rem          a2, t2, t1
                  xori         s11, a6, -479
                  add          s8, a1, t6
                  fmul.s       fs2, fs9, ft1
                  fcvt.s.wu    ft10, t2, rne
                  mulhsu       a5, a4, s1
                  srai         t1, t6, 2
                  flt.s        s2, fs11, fs9
                  sub          s10, s6, t4
                  srl          s0, s9, sp
                  srli         s11, s0, 0
                  fcvt.s.wu    ft6, ra, rup
                  fsqrt.s      ft1, fa4, rup
                  lui          s6, 770002
                  andi         t5, s1, -1373
                  flt.s        s6, fs6, fa4
                  fcvt.s.w     fs4, s5
                  sub          a0, s10, s3
                  feq.s        t3, ft1, fs7
                  srl          ra, s7, s3
                  fadd.s       ft0, fs1, ft2, rmm
                  fsub.s       fa4, fs10, fa0, rdn
                  mulhsu       s6, s1, t0
                  and          t4, s4, a4
                  fmv.w.x      fs4, s5
                  slt          a1, s4, a1
                  slti         t2, t2, 530
                  fadd.s       ft5, fs4, ft5
                  fcvt.wu.s    a5, fs8, rmm
                  divu         a7, s5, a5
                  sub          s7, s7, a5
                  fmv.x.w      t1, fs8
                  ori          t4, s8, 1358
                  fsub.s       ft3, fa2, ft6, rtz
                  fcvt.wu.s    a1, ft3
                  fclass.s     s6, ft5
                  ori          s8, a0, -404
                  fmv.w.x      fs5, t0
                  andi         t1, t4, 699
                  sltiu        t0, s3, 1008
                  fadd.s       fa6, ft10, fa5
                  lui          s5, 814358
                  xor          zero, tp, sp
                  remu         a6, s5, s2
                  rem          tp, s0, s3
                  or           gp, s7, a3
                  ori          a4, s11, 783
                  fsqrt.s      fa3, fs7, rne
                  sub          t1, zero, tp
                  add          a4, a2, a5
                  fmul.s       fa5, fa5, fa6
                  mulhsu       tp, tp, a2
                  srai         t2, a5, 25
                  rem          a7, a2, zero
                  remu         t6, s5, tp
                  sub          t4, t3, a4
                  divu         s6, s0, a1
                  fsgnjn.s     fs3, fs11, fa0
                  mulh         a0, s1, t5
                  fmax.s       fs0, fs0, fs2
                  fsub.s       fs3, ft4, ft2, rmm
                  fcvt.s.w     fs7, ra
                  fle.s        t6, fs10, ft1
                  fmax.s       fs8, fa3, fa7
                  fsqrt.s      fs0, ft1, rup
                  slli         s0, t4, 9
                  feq.s        s11, fa3, fs0
                  fclass.s     s5, fa0
                  fsgnj.s      fs1, ft10, fs6
                  remu         a7, gp, gp
                  fsqrt.s      fs11, fa5
                  divu         t2, tp, s9
                  flt.s        s7, fs3, fs1
                  or           t1, t1, s5
                  feq.s        tp, ft0, fa0
                  srai         s5, s9, 3
                  auipc        a1, 119511
                  fmv.x.w      zero, ft10
                  mulhu        s8, a2, zero
                  fmul.s       ft11, ft9, fa1, rup
                  slti         s4, tp, -1301
                  sltu         a0, s6, gp
                  lui          a5, 526738
                  fcvt.s.w     fs7, s11, rtz
                  fmin.s       ft2, fa0, fa4
                  remu         t2, a2, s3
                  mulhu        t6, t2, s4
                  fsqrt.s      fa3, ft6
                  fmul.s       fs1, fa7, fs0, rmm
                  fcvt.s.w     fa0, s9
                  fcvt.s.wu    ft1, t2
                  fmin.s       ft2, ft9, fs10
                  or           s5, s0, s3
                  sra          s4, s7, s5
                  fcvt.w.s     t5, fa1
                  addi         a7, t0, 1095
                  fcvt.s.w     fs5, a3
                  mulhsu       t4, a0, sp
                  fcvt.wu.s    s7, ft10
                  fsgnjx.s     fa0, ft6, ft2
                  srli         t5, a6, 26
                  feq.s        t2, fs11, fs1
                  div          ra, s9, s2
                  fadd.s       ft3, fs11, fs7, rup
                  fsgnj.s      fa0, fs8, ft2
                  slli         a4, a7, 20
                  andi         a1, a5, 763
                  fmv.x.w      s7, fs10
                  mulhu        s4, s8, zero
                  fmul.s       fs9, ft5, fa2, rdn
                  rem          a4, ra, ra
                  slli         gp, t1, 29
                  fcvt.wu.s    a5, fa1, rmm
                  sra          s7, t0, s5
                  add          a5, s5, s10
                  divu         a0, a3, s9
                  mulh         s0, t2, s11
                  mulh         t4, a3, s1
                  mulhsu       gp, a4, s11
                  slt          tp, s2, s0
                  fmin.s       fs0, ft4, fs4
                  fsgnjn.s     ft3, fa4, fs2
                  mulhu        t3, a5, s3
                  sll          a0, ra, gp
                  mulhu        t5, gp, a5
                  divu         s9, ra, s5
                  slt          a2, zero, gp
                  xori         s0, a4, 1906
                  div          a5, t3, s11
                  add          ra, s1, t1
                  fle.s        a4, fa1, ft9
                  auipc        a0, 793632
                  fsgnjn.s     fs1, fs5, ft7
                  fcvt.s.wu    ft9, s2
                  andi         s9, t6, 993
                  addi         a7, a5, -1535
                  or           tp, s0, t0
                  fmin.s       ft10, fa7, ft6
                  ori          t1, t3, 1490
                  slti         s10, a7, 1185
                  fsub.s       ft2, fa6, fa7, rmm
                  or           t0, s3, s10
                  mulhsu       s11, s6, t2
                  sltiu        s10, a2, 1301
                  div          s8, s8, a6
                  srl          a3, t1, a2
                  sltu         a5, s9, t1
                  xor          a0, a2, t4
                  sltu         t5, gp, s7
                  flt.s        t1, fs2, ft6
                  fcvt.w.s     s10, fa7, rtz
                  fclass.s     s11, ft1
                  lui          s9, 921425
                  mulh         s7, s8, sp
                  fmv.w.x      fs8, s9
                  auipc        a5, 999196
                  sltiu        t3, s2, 998
                  divu         t2, a3, a6
                  lui          s8, 306221
                  addi         a7, s11, -819
                  fmin.s       ft0, ft1, fs6
                  andi         a6, s9, -1790
                  div          t2, s4, s10
                  mulh         s0, t1, s9
                  auipc        t1, 194741
                  add          ra, s8, a4
                  fclass.s     s2, fa7
                  fsub.s       ft8, fs9, fs2, rne
                  fcvt.s.w     fa1, s0, rup
                  xor          t3, t5, t4
                  andi         s7, s3, -1619
                  sub          s10, t2, a2
                  auipc        a0, 409030
                  mul          tp, s11, a0
                  fcvt.s.wu    fs8, s4
                  mulh         t3, a4, ra
                  fle.s        t5, ft4, fs5
                  lui          ra, 807086
                  feq.s        a0, ft7, ft6
                  xor          t3, a2, s2
                  fdiv.s       fs4, ft4, fa3, rtz
                  flt.s        t6, fs1, fa7
                  fmul.s       ft3, ft0, fs4, rup
                  feq.s        t0, fa2, fs5
                  auipc        a6, 1028549
                  fsub.s       fs3, fa1, fa5
                  fcvt.s.w     fs11, s6, rmm
                  feq.s        s2, ft9, fs0
                  srai         a4, s11, 5
                  fclass.s     t5, fs3
                  ori          s5, zero, -1660
                  fle.s        a3, fa2, fa5
                  slli         a3, sp, 24
                  fsqrt.s      fs7, fs8, rup
                  slti         s7, s6, -1279
                  fcvt.w.s     s7, ft2, rdn
                  fsgnjn.s     ft7, ft2, ft1
                  fmin.s       fa1, fs10, fs0
                  mulhu        s8, ra, s3
                  fadd.s       ft3, fs1, fa1, rup
                  feq.s        t2, fs2, ft4
                  andi         t4, s2, -1771
                  fmax.s       fs7, fs10, fs0
                  ori          a0, tp, 1194
                  add          t3, ra, zero
                  fsqrt.s      ft2, fs8
                  fcvt.s.wu    fs6, s1, rne
                  fdiv.s       fs5, ft8, ft8, rne
                  fcvt.w.s     s5, fa2, rmm
                  srl          s8, t5, t0
                  mulh         s7, s0, s7
                  fadd.s       fs7, fs8, fa7
                  sub          s6, zero, sp
                  fadd.s       ft6, ft8, fs11, rup
                  mul          t3, tp, s0
                  fdiv.s       fs8, ft6, ft9, rdn
                  mulh         s8, zero, s4
                  remu         t5, s8, t0
                  fmv.x.w      s9, fs7
                  fmv.x.w      s9, fa5
                  fsgnjn.s     ft9, fs1, fs0
                  slti         t6, t4, 1831
                  fcvt.s.w     fs6, a5, rne
                  fsgnjx.s     ft4, ft9, ft4
                  sub          a2, s7, a0
                  flt.s        a3, fs3, ft0
                  fsgnj.s      fs7, fs2, ft0
                  fmv.w.x      ft3, ra
                  slt          s9, s1, a0
                  divu         a4, ra, s9
                  mulhsu       t0, s0, sp
                  fcvt.wu.s    t4, fs8, rmm
                  fsqrt.s      ft2, fs9, rne
                  fsgnjx.s     fa3, fa2, ft9
                  lui          t5, 287640
                  feq.s        t4, fs3, fs10
                  fsub.s       fa2, fs0, fs3, rdn
                  auipc        t6, 657308
                  fmin.s       ft1, ft11, fa5
                  fcvt.s.wu    fa2, a4
                  fmv.x.w      a4, fs2
                  fdiv.s       fa1, ft6, fa3
                  fmax.s       fs5, fs7, ft0
                  div          s5, s5, s2
                  mulh         s10, a4, s7
                  srli         a4, a5, 10
                  ori          ra, s4, 377
                  rem          tp, t2, s1
                  fsqrt.s      fa4, ft2, rtz
                  add          a7, s8, a4
                  xori         gp, tp, 753
                  sll          t5, t2, s6
                  add          s11, gp, s8
                  sltiu        t5, s7, 1103
                  divu         gp, s1, a2
                  xor          t0, t6, a1
                  fsqrt.s      fs6, fs11
                  mul          s9, a1, s3
                  srl          t6, a2, t2
                  fmul.s       fs7, fs5, fa3
                  srl          a5, a4, s9
                  fsub.s       fa3, ft8, fs1
                  slti         t2, zero, 1800
                  fsgnjn.s     ft11, ft8, ft8
                  slti         s9, a5, 276
                  sll          s4, zero, s10
                  srli         s5, a3, 15
                  and          s9, a7, s0
                  mul          s5, s9, s1
                  sra          a1, t2, gp
                  andi         zero, a7, -1297
                  lui          s4, 611819
                  fmv.x.w      a6, ft10
                  mul          s10, s0, a5
                  add          t2, s6, t4
                  feq.s        t0, ft0, ft11
                  fsub.s       ft1, fa4, ft1
                  nop
                  div          t3, a4, zero
                  fsgnj.s      fs4, ft6, ft10
                  xori         tp, t5, -357
                  srl          s7, t2, s2
                  add          s10, a1, t5
                  remu         s10, gp, s1
                  nop
                  sub          a2, s11, tp
                  mulhsu       t6, s7, a2
                  sll          zero, t2, s9
                  fsgnjx.s     fs10, ft7, fa6
                  fsub.s       ft7, fs6, ft1
                  andi         t1, a4, -1245
                  fsgnj.s      fs9, ft9, ft5
                  divu         zero, t1, s11
                  fmv.x.w      s2, fs2
                  slt          t6, t3, t1
                  addi         a7, t1, -175
                  mulhsu       t6, s7, s8
                  mulh         s4, s10, t5
                  and          s11, s1, s9
                  add          tp, s3, s11
                  fsgnj.s      fa7, fs3, fa6
                  slli         s8, s0, 5
                  flt.s        s0, fs5, ft10
                  mul          a2, a1, a3
                  andi         s11, s4, -1525
                  fcvt.w.s     s7, fs10, rup
                  srai         t1, s0, 12
                  flt.s        s2, fs0, ft3
                  fmv.x.w      t4, fs7
                  mulhsu       gp, gp, t2
                  fmul.s       fs4, ft7, fs11
                  auipc        gp, 814595
                  remu         s8, tp, t3
                  and          t6, s4, a1
                  or           s10, tp, s3
                  xor          s6, s11, s2
                  sll          zero, a1, sp
                  slt          a1, a0, ra
                  fcvt.wu.s    a3, ft5, rdn
                  mulhu        s7, a1, s8
                  flt.s        s8, fs7, ft6
                  fsqrt.s      fs1, ft5
                  fmin.s       ft6, ft0, ft5
                  sltu         t3, t2, s6
                  fmv.x.w      s9, fa7
                  mul          tp, a2, t2
                  flt.s        s0, ft8, fs7
                  fle.s        zero, ft2, fa6
                  srai         a1, t5, 0
                  fcvt.s.w     fs2, s6
                  div          gp, s11, t0
                  fdiv.s       ft3, fs1, ft7
                  rem          s5, a2, a4
                  flt.s        t6, fs0, fa0
                  sltu         t2, s10, s10
                  sub          s0, a2, t2
                  mul          s8, s2, s6
                  fdiv.s       ft8, fs3, fa1, rmm
                  remu         tp, s7, s6
                  or           ra, t2, a1
                  sltu         tp, s9, s8
                  srl          zero, s1, t2
                  mulhu        a5, a2, a0
                  fcvt.wu.s    a2, fa5
                  xori         a2, s7, -1089
                  divu         t5, a7, t5
                  fcvt.s.wu    fa1, a5, rmm
                  srl          s5, s5, s4
                  mul          a6, a1, t6
                  slli         t2, s5, 9
                  fmv.x.w      s5, fs11
                  srl          t6, s11, t0
                  fmv.x.w      t5, ft9
                  fadd.s       ft4, fa0, fa5, rup
                  fsgnjn.s     ft2, ft8, fs10
                  mulhu        t5, a6, t6
                  fmin.s       fa7, fa6, ft8
                  or           t0, ra, a0
                  fcvt.s.w     fs4, s7, rmm
                  addi         s5, a0, -497
                  auipc        s6, 437462
                  srli         s6, t5, 21
                  sltiu        a3, s1, -1531
                  mulhsu       s10, s10, s1
                  divu         t0, a5, s5
                  fmul.s       ft11, ft4, ft7, rtz
                  srai         t5, sp, 7
                  fcvt.s.w     ft4, s11
                  fcvt.wu.s    s6, ft11
                  add          s2, t6, t2
                  fcvt.s.w     fs7, s11
                  add          s8, t4, s7
                  mulhsu       gp, t0, s1
                  andi         a6, s7, 59
                  lui          a1, 757243
                  srl          s8, t3, t1
                  fadd.s       ft7, fa2, fs8
                  sra          t0, a1, s7
                  fsgnjx.s     fs4, fs3, ft11
                  slli         t2, sp, 10
                  fsqrt.s      ft1, ft8
                  lui          s5, 496702
                  fcvt.s.w     fs6, t6, rmm
                  sra          a5, s4, t0
                  sltu         a1, a1, s0
                  xor          a2, a1, t5
                  sll          a2, s11, a0
                  fadd.s       fs3, ft2, ft3
                  auipc        s8, 842716
                  slti         a4, a5, -1852
                  sll          ra, s3, s6
                  fle.s        s11, ft6, ft1
                  sra          s9, s8, a4
                  slli         a0, a6, 24
                  divu         a3, s9, s4
                  ori          t4, s3, 898
                  fmul.s       ft2, ft3, ft4, rup
                  mulhsu       s11, tp, gp
                  xori         tp, a1, -1642
                  add          s11, s2, s11
                  add          ra, zero, a0
                  srli         ra, a3, 24
                  addi         a4, a1, -1119
                  divu         s2, s10, s8
                  mul          a2, zero, s1
                  sll          s11, a6, s0
                  fmv.w.x      ft0, s5
                  add          s10, s4, ra
                  fmv.x.w      s2, fa3
                  fmv.w.x      fs4, a1
                  slti         s8, t4, 47
                  add          t6, t6, s4
                  auipc        t5, 341487
                  fcvt.s.wu    ft11, s1
                  fle.s        gp, fs4, ft2
                  mul          s9, ra, a5
                  and          t1, s0, sp
                  fcvt.s.wu    ft6, s5, rup
                  fcvt.w.s     a3, fa3
                  fsgnjn.s     fa7, ft7, fa1
                  fclass.s     a5, fa5
                  lui          a6, 946820
                  mulh         s4, gp, a4
                  sub          s11, s9, zero
                  or           s6, s2, t2
                  fdiv.s       fs5, fa2, fa7, rmm
                  mulhu        s5, s11, t5
                  mulhu        gp, s8, a3
                  slli         t5, a0, 2
                  fcvt.wu.s    t4, fs10, rmm
                  feq.s        s7, fa0, fs10
                  addi         s4, a7, -504
                  fcvt.s.wu    ft7, a6, rdn
                  rem          s9, t5, t6
                  add          gp, s3, s8
                  fsgnjx.s     fs0, fs5, fa4
                  addi         s6, zero, -831
                  add          a4, s4, a6
                  div          a6, a5, zero
                  sub          s4, tp, t1
                  ori          s10, s1, -1931
                  auipc        s8, 106837
                  srl          t4, t0, t2
                  fmv.w.x      fs3, t3
                  fmul.s       fa0, fs1, fs7, rne
                  fmv.w.x      fs7, a0
                  sub          zero, t1, t2
                  divu         t0, a7, t1
                  feq.s        t3, ft6, fa0
                  or           t4, a2, s6
                  flt.s        a4, ft9, fs0
                  sll          a3, s7, s8
                  or           t2, a1, a3
                  fsgnjn.s     fs6, fs10, fa7
                  fadd.s       fs5, fs10, fs7, rup
                  fmax.s       fa6, ft10, ft0
                  flt.s        t0, fs8, fs8
                  sltiu        a0, s10, 1803
                  fclass.s     gp, fs1
                  fcvt.w.s     s9, fs3, rdn
                  fadd.s       ft1, fs4, fa7, rup
                  fcvt.wu.s    a2, fa3, rdn
                  fcvt.wu.s    s7, fa2
                  fcvt.w.s     a3, fa5, rup
                  sra          s11, s3, s8
                  divu         a7, a7, s5
                  slli         s10, t6, 26
                  mulh         a1, t1, t3
                  and          ra, s1, a2
                  mulh         t2, tp, t6
                  or           ra, s0, s6
                  mulh         t2, a1, a6
                  fsgnjx.s     fs0, ft11, fa6
                  div          ra, s11, s11
                  xor          a2, s11, sp
                  and          t1, t3, s0
                  fsgnjx.s     fa5, ft11, fs1
                  slli         s7, t0, 13
                  xori         s8, a5, -1653
                  mulh         s9, s10, gp
                  sll          ra, s6, t4
                  srli         t6, t1, 25
                  fle.s        a2, fs5, fs5
                  fmv.w.x      fa4, zero
                  fsgnj.s      fs4, fs1, ft0
                  or           t1, s1, zero
                  fsqrt.s      ft11, fs6
                  flt.s        a4, fa2, ft10
                  sltiu        t5, s8, 1314
                  fcvt.w.s     a7, fa5
                  fclass.s     t4, fs7
                  divu         a1, a7, s7
                  sltu         t6, s2, t2
                  fsgnj.s      fa0, fa5, fa4
                  andi         t2, sp, 264
                  sltiu        s5, s1, 1836
                  sll          a0, t5, ra
                  fmax.s       ft8, fa5, fs3
                  divu         s8, zero, a3
                  sra          gp, a2, s10
                  slt          s9, a0, t3
                  mulhsu       s7, a5, ra
                  slli         zero, ra, 15
                  srl          t1, t1, a3
                  feq.s        s9, ft1, fa5
                  andi         s4, a1, 1995
                  divu         t3, t3, a4
                  fmin.s       fs3, fs1, fs1
                  fcvt.s.wu    fs10, t4
                  div          t2, s1, a1
                  fsgnj.s      fa5, ft2, ft11
                  mul          s5, a3, s2
                  sra          a7, t2, a2
                  fsqrt.s      ft1, ft8, rne
                  srl          t3, a5, a7
                  feq.s        zero, fs1, ft8
                  lui          t2, 389096
                  mul          s11, s2, s8
                  sub          a7, s4, s8
                  mulh         a7, s1, s1
                  fmin.s       fs3, fs5, ft3
                  nop
                  flt.s        s9, ft8, fs6
                  slt          s11, a3, t2
                  mulhu        gp, a7, s9
                  rem          a6, a1, t3
                  xor          s5, t6, t5
                  fmv.x.w      a1, ft11
                  mulhu        a0, s9, s8
                  slli         t1, a5, 0
                  slti         s9, s11, 299
                  fsgnjn.s     fs7, fa0, ft4
                  slli         zero, sp, 10
                  fcvt.wu.s    t2, fa0, rtz
                  fsqrt.s      ft3, fa4
                  mulh         s0, sp, sp
                  srli         a1, s2, 16
                  div          s4, s11, s4
                  fle.s        s11, fa1, fs5
                  remu         tp, s2, a0
                  mulhu        a0, t3, a0
                  and          t6, s8, zero
                  srli         t3, zero, 11
                  remu         a4, s7, s9
                  fcvt.s.w     ft6, t3
                  slli         s6, t2, 22
                  fsub.s       fs0, ft2, fs9, rtz
                  slt          a7, sp, sp
                  auipc        a7, 259793
                  xori         s7, t1, -1177
                  andi         t4, s3, 1743
                  slt          ra, a1, s7
                  mul          a2, s1, t3
                  xori         a7, t3, -1055
                  mulhsu       ra, s10, s0
                  andi         a5, t2, -665
                  srli         t4, t0, 16
                  mulh         s0, s6, a5
                  slt          s6, s9, s10
                  addi         tp, s1, 783
                  ori          tp, sp, -173
                  fle.s        a4, fs3, ft9
                  feq.s        t1, fa7, fs1
                  xori         t3, ra, 1470
                  fcvt.s.w     fs5, a6
                  feq.s        ra, ft3, fs6
                  mul          t6, t6, t0
                  mulhsu       a7, t5, t1
                  fmul.s       fa3, fs11, fs5
                  fmax.s       ft6, ft10, fs5
                  fmul.s       fs9, ft2, fs7
                  mulhu        a7, a4, a3
                  xori         s7, s2, 1704
                  auipc        t2, 696940
                  feq.s        t0, fa7, ft5
                  slli         zero, t0, 18
                  fcvt.s.wu    fs9, t5, rdn
                  sltu         t5, a6, s1
                  sltiu        a4, a1, -209
                  fcvt.s.wu    fs3, s2, rne
                  fmv.x.w      a4, fa1
                  fmv.x.w      a7, fs7
                  fmul.s       fs1, fs2, ft6, rmm
                  fcvt.w.s     s8, ft1, rne
                  fmv.x.w      s4, ft5
                  and          s10, s7, tp
                  sltiu        a3, a1, 448
                  slt          t2, a4, s4
                  fmv.x.w      s0, fa5
                  flt.s        zero, ft1, fs8
                  fmv.w.x      ft2, tp
                  fsub.s       fs0, fa5, ft11
                  auipc        a7, 14341
                  slt          ra, t1, s11
                  sub          s10, a1, s0
                  add          t6, a7, zero
                  fadd.s       ft10, fs11, ft1, rdn
                  or           s7, t0, t1
                  mulhu        s10, a7, s7
                  fcvt.wu.s    a3, fs10, rdn
                  remu         s2, s3, s3
                  andi         s5, s0, 737
                  auipc        s0, 155437
                  mulhsu       a1, a2, t6
                  feq.s        s11, fa2, fs9
                  fcvt.w.s     a1, fs3, rne
                  fmul.s       fs2, fa4, ft9, rdn
                  fcvt.s.w     fs10, sp
                  xori         t4, s6, -65
                  fclass.s     s0, fs6
                  mul          a3, gp, a6
                  auipc        s8, 840803
                  andi         t5, t2, -574
                  sltiu        t3, zero, 1260
                  mulhsu       a5, zero, s8
                  mulhsu       t3, a5, a7
                  and          s5, s11, s9
                  xori         s8, a3, 909
                  fcvt.s.w     fs1, s8
                  sll          t4, a4, s10
                  fcvt.s.w     fs9, t5, rdn
                  nop
                  fclass.s     a6, ft10
                  srai         a6, s3, 5
                  sra          s6, ra, s3
                  sltiu        a3, s3, -329
                  fmul.s       ft9, fs8, fs10, rtz
                  mulhu        s0, t6, tp
                  sltu         ra, a2, a3
                  fmv.w.x      fs0, t0
                  fdiv.s       fa0, fs6, ft11, rdn
                  fadd.s       ft1, ft4, fs4
                  and          t5, sp, zero
                  sra          tp, a3, s0
                  sltu         t5, a4, s3
                  flt.s        t0, ft3, fs8
                  fmul.s       ft9, ft10, fs0, rmm
                  or           a6, tp, t2
                  sub          gp, s2, s1
                  fcvt.s.w     ft7, s9
                  ori          t0, ra, -1989
                  sll          zero, gp, s2
                  remu         s6, s10, t1
                  nop
                  ori          a5, t6, -1017
                  sub          t0, s4, t5
                  lui          s11, 1047811
                  div          s4, a2, t5
                  feq.s        a7, fs5, ft9
                  addi         t3, t1, 1662
                  srl          gp, gp, a4
                  sub          a4, t1, s0
                  flt.s        zero, fa0, fs9
                  xor          a5, gp, s8
                  flt.s        a7, ft10, fs0
                  addi         t0, t2, 609
                  slt          s7, t4, s7
                  andi         s11, tp, 707
                  mulh         t6, s2, a5
                  auipc        t1, 743471
                  remu         s11, t1, s7
                  fmv.w.x      fa6, t1
                  and          s9, s3, t0
                  ori          s2, s3, 23
                  srai         s0, t5, 29
                  fcvt.s.wu    fs4, t2
                  slli         s9, t0, 6
                  or           a0, t6, a5
                  feq.s        gp, ft0, fa2
                  slt          s9, s10, s1
                  mulhu        zero, s1, s5
                  fle.s        a1, ft0, fs10
                  slt          a5, s11, s0
                  sub          t2, s0, s3
                  mul          t5, sp, t3
                  fmin.s       fa6, fs10, ft4
                  fsgnjn.s     fa4, fs9, fa3
                  remu         tp, a2, s2
                  srai         gp, gp, 7
                  fmv.x.w      t6, fs10
                  andi         s10, t6, 1025
                  fclass.s     s6, fs5
                  fsgnjx.s     fa4, ft9, fa0
                  slt          a4, s2, s10
                  sub          t0, t1, gp
                  fmv.x.w      t2, fs7
                  divu         a4, t6, a2
                  fdiv.s       fa4, ft4, fs7, rne
                  xori         tp, t2, -984
                  sltiu        t5, s4, -1373
                  divu         tp, s0, s0
                  flt.s        tp, ft2, fs3
                  sltu         zero, tp, t6
                  sltu         a3, s2, tp
                  div          t5, s7, s11
                  sub          s6, s0, s6
                  srli         zero, t0, 16
                  sltiu        a7, s6, -1268
                  fcvt.w.s     t4, fs3, rdn
                  flt.s        a4, fa1, fs8
                  fcvt.w.s     gp, fs2
                  div          t0, s8, s5
                  ori          t2, s5, 651
                  fmv.x.w      t5, ft2
                  mulh         a7, s7, t4
                  fcvt.s.w     fs5, t0
                  slt          s10, t3, t5
                  remu         s9, s7, s5
                  rem          s8, s7, sp
                  auipc        s5, 1032589
                  flt.s        t0, ft7, fs4
                  sltiu        t2, s5, 673
                  fadd.s       ft4, ft5, fa1, rtz
                  xor          t2, t0, s5
                  nop
                  sltu         zero, s5, t5
                  srl          t1, s6, t1
                  fle.s        t4, fa4, ft5
                  fsgnj.s      ft1, fa6, fs10
                  slli         a2, a5, 17
                  fcvt.s.w     ft4, ra
                  slt          t3, s4, s3
                  divu         a5, zero, a7
                  or           s10, a4, a5
                  andi         s10, a5, 1591
                  fmax.s       ft6, fa6, fa6
                  fle.s        t5, ft8, fs3
                  fmv.x.w      s11, ft3
                  fmv.w.x      fs2, a3
                  srli         a2, s0, 18
                  fclass.s     gp, ft6
                  fsqrt.s      fs7, ft6, rtz
                  slt          s9, t5, a1
                  auipc        s2, 28834
                  fsub.s       fs4, fa2, fs6
                  fcvt.s.w     ft4, s4
                  divu         a1, s0, gp
                  fcvt.s.w     fa1, t5
                  fmv.x.w      s10, ft2
                  div          t6, s2, a2
                  divu         a0, a5, s8
                  fcvt.s.w     ft0, s0, rmm
                  flt.s        s2, fs8, fs10
                  fsgnjn.s     fs3, ft1, ft5
                  flt.s        s9, fs6, fa7
                  feq.s        s11, fs1, fs0
                  nop
                  fmv.x.w      zero, fs3
                  mulhsu       a4, a3, a6
                  xor          t6, s8, t0
                  fcvt.wu.s    zero, fs9, rne
                  fdiv.s       ft11, fs8, ft1
                  srai         a2, a2, 6
                  mul          s9, gp, a0
                  fmax.s       fa2, fs8, fa4
                  sltiu        s10, s9, 767
                  fcvt.wu.s    t0, ft11, rdn
                  feq.s        a6, ft0, ft0
                  slti         s6, t6, -565
                  fcvt.w.s     s8, fa4
                  fsub.s       fa2, ft7, fa7
                  ori          s2, s8, 1284
                  mulh         s7, t6, a3
                  fclass.s     t1, fs11
                  slt          gp, t2, t6
                  slti         a2, s6, -1767
                  fmv.x.w      s11, fs0
                  sll          s6, s8, a2
                  sub          ra, s10, s7
                  rem          s4, t4, s1
                  fsub.s       fs4, fa1, fs0
                  fclass.s     t2, ft10
                  mulh         ra, t5, sp
                  fcvt.s.w     fs1, sp
                  remu         s11, gp, t0
                  flt.s        a4, fa5, fs2
                  fclass.s     s6, ft9
                  srl          a5, t3, a6
                  slti         s6, zero, -248
                  ori          s10, t1, 244
                  and          a2, sp, s10
                  mulhu        s2, a3, a6
                  fclass.s     t1, fa4
                  or           s6, s8, s5
                  xori         t0, s0, -1232
                  fle.s        t5, fa2, fa7
                  fsgnjn.s     ft8, ft0, ft11
                  addi         t3, a7, 1586
                  fdiv.s       ft8, fs11, fs5, rdn
                  fsub.s       ft6, fs2, fs8
                  flt.s        t4, fa4, fs2
                  sra          gp, a1, s7
                  nop
                  fmul.s       ft10, fs5, fs8
                  srl          a1, ra, t1
                  lui          s7, 464151
                  sub          t4, s5, s5
                  fsgnj.s      fs2, fa7, fa3
                  fmax.s       fs10, fa5, ft8
                  addi         s6, a7, 456
                  fsgnj.s      ft11, fa7, ft2
                  fmul.s       fs9, ft5, ft1, rmm
                  sub          a5, t1, s8
                  sub          a5, t3, s10
                  fadd.s       fa3, fs9, fs5, rne
                  mulh         s11, a2, s7
                  remu         a4, s4, s8
                  fclass.s     t6, fa1
                  sra          s6, s7, a1
                  slli         ra, s3, 11
                  fsgnj.s      fa5, ft9, ft2
                  feq.s        s11, fs3, fs2
                  andi         gp, gp, -1489
                  sub          t1, t5, zero
                  fclass.s     s11, fs8
                  fcvt.w.s     s11, fs8
                  xor          s5, t6, ra
                  fsgnjn.s     ft2, fs4, fa2
                  xori         gp, zero, 131
                  addi         s4, s8, -1865
                  srai         t2, s8, 1
                  xori         s9, tp, 1447
                  or           s5, s8, t4
                  srl          a5, t1, a5
                  fmv.x.w      t1, fs8
                  mul          s4, gp, t1
                  remu         ra, ra, s6
                  slti         t1, ra, -1899
                  auipc        a7, 869713
                  fadd.s       fa0, fs5, ft2, rmm
                  sltiu        t4, s8, 1332
                  fmax.s       fs6, ft7, ft4
                  mulh         s11, s8, t1
                  fmin.s       fs0, fs2, fs9
                  fcvt.s.w     ft5, t2, rne
                  xor          s8, zero, s6
                  sltiu        a1, ra, 38
                  ori          t5, s0, -1828
                  rem          tp, s8, zero
                  fsqrt.s      fs3, fs8
                  remu         a0, s8, t5
                  fsub.s       ft8, ft3, ft0, rdn
                  feq.s        t6, fs5, ft0
                  srai         a1, t5, 21
                  fsgnjx.s     ft10, ft7, fa5
                  ori          s8, tp, 1691
                  addi         t2, t5, -1231
                  sra          a4, sp, a7
                  feq.s        s4, ft1, fs7
                  remu         t3, s9, zero
                  sltiu        t0, t4, -2015
                  fclass.s     s6, fs8
                  sltu         s8, a6, a4
                  mulhu        a3, zero, s11
                  xori         s8, tp, 1434
                  feq.s        a1, ft9, fs3
                  div          zero, a5, sp
                  add          s9, s1, a5
                  addi         s2, s2, 290
                  fcvt.s.w     fs10, t5, rmm
                  fsgnj.s      fs3, ft5, fa0
                  and          a0, ra, s0
                  and          s4, t5, s9
                  auipc        t6, 490822
                  ori          s6, s5, 1341
                  fle.s        s11, fs11, fs6
                  fmv.x.w      s11, ft10
                  rem          t4, a6, t1
                  ori          s11, s6, 525
                  remu         a2, gp, a0
                  srai         s2, ra, 20
                  or           s8, t1, t3
                  mulhu        s6, s2, s7
                  andi         s11, s10, -1502
                  rem          s10, s5, ra
                  sub          a4, s11, tp
                  add          s9, sp, s2
                  and          a7, s3, s0
                  mulhu        t6, s2, t3
                  fdiv.s       ft8, fs5, fa0
                  or           s7, sp, a4
                  slli         s0, t2, 17
                  add          zero, sp, s11
                  lui          t6, 429650
                  fmin.s       fs2, ft6, fs1
                  add          t4, s7, a7
                  mulhu        s6, s8, a5
                  fadd.s       ft6, fa6, fs2
                  slli         a5, s0, 28
                  andi         a0, t5, -15
                  rem          zero, zero, gp
                  add          t0, tp, a3
                  xor          s0, t0, t1
                  sub          zero, s7, s2
                  mul          a6, ra, t2
                  fcvt.wu.s    s10, ft5
                  and          s7, s10, gp
                  sll          tp, t6, s8
                  xori         zero, a0, -666
                  sll          a5, a3, zero
                  fsgnjn.s     ft8, fs1, fa4
                  fclass.s     t2, fa1
                  xor          a7, s1, s5
                  mulh         zero, sp, ra
                  fmv.x.w      s8, fs1
                  srli         gp, s6, 3
                  slti         s6, a1, -218
                  flt.s        a7, ft0, ft0
                  sub          t6, a7, ra
                  rem          s7, a0, a0
                  ori          t2, s7, 1332
                  sra          s5, t2, t5
                  srai         t4, a1, 7
                  fsgnj.s      ft1, fa0, fs3
                  fcvt.w.s     s2, ft6
                  div          s2, sp, t6
                  mul          t1, a5, a3
                  or           ra, t4, t5
                  fmul.s       ft11, ft7, fa1
                  mulhu        s6, t5, s6
                  fmin.s       fs0, fs7, fs3
                  mul          s11, s10, a6
                  nop
                  nop
                  fsgnj.s      fa6, ft4, fa5
                  add          a3, s4, s10
                  mulh         s11, s9, s6
                  sltu         a3, s11, t2
                  fsgnj.s      fs2, fa5, ft0
                  sltiu        s2, s5, -452
                  srli         s9, t1, 14
                  slli         s4, a7, 22
                  fcvt.wu.s    t2, fa2, rdn
                  flt.s        s10, fs2, fs1
                  srli         a0, a5, 11
                  xor          t6, a1, a4
                  divu         ra, s1, s4
                  slt          s2, t2, s5
                  slti         a3, s4, 970
                  fsub.s       ft8, fs4, fs5
                  slt          t5, s6, gp
                  ori          a0, a6, 82
                  fcvt.wu.s    t2, fs0
                  mulh         t2, sp, s9
                  fcvt.s.wu    fs4, ra, rup
                  fmv.x.w      a1, fa1
                  srai         t0, s11, 9
                  add          s7, t0, a1
                  fsqrt.s      fs10, ft9, rup
                  fsgnjx.s     fs6, ft7, ft3
                  fmv.w.x      fs6, s9
                  sll          t5, a3, s7
                  and          a4, s1, a7
                  slt          s11, a5, t1
                  sll          s8, a1, a1
                  fdiv.s       fs2, fa5, fa2
                  fcvt.wu.s    s10, fs0, rne
                  remu         a6, a7, tp
                  fsgnj.s      fs3, fa2, fs2
                  fmax.s       ft10, ft1, ft11
                  addi         s9, a2, 1291
                  or           a1, s5, s11
                  auipc        s11, 179338
                  fcvt.wu.s    t3, fs1
                  and          a2, s10, tp
                  fsgnj.s      fs10, ft4, fs0
                  mul          s9, a3, s9
                  andi         a1, s2, 1268
                  sub          t5, gp, s4
                  mulhsu       t4, t1, t0
                  fsgnjn.s     ft1, fa0, ft2
                  feq.s        a6, fa3, fs1
                  lui          t5, 855706
                  remu         t0, s7, t5
                  add          a1, s11, t0
                  slt          s10, s8, t0
                  nop
                  fsgnjn.s     ft5, fa6, fs7
                  fcvt.w.s     zero, fa6
                  mulhu        a4, s8, a5
                  fsqrt.s      fs5, fa6, rup
                  mul          s2, t4, t5
                  divu         a0, t1, s7
                  fdiv.s       fa0, ft6, fa0, rdn
                  fle.s        s8, ft2, fs7
                  fcvt.w.s     s5, fs3
                  lui          s8, 397886
                  nop
                  fadd.s       ft6, ft0, ft9
                  flt.s        a5, ft6, fa5
                  srai         s10, t1, 22
                  addi         s5, a3, 1534
                  fsgnj.s      ft8, ft10, fa3
                  rem          s9, a5, a3
                  divu         s10, ra, a0
                  mulh         tp, t1, s2
                  andi         s0, sp, -715
                  sll          s9, sp, s1
                  div          a2, s2, a5
                  divu         a6, sp, s6
                  fmin.s       ft3, fa7, fs9
                  fdiv.s       fs9, fa6, ft5
                  fsub.s       fs2, fs0, fs7
                  mulhu        s2, t5, tp
                  or           t5, s1, s4
                  fsgnjx.s     ft7, fa4, fs0
                  slti         t1, tp, -158
                  feq.s        s5, ft6, ft6
                  sll          s9, t2, s6
                  fmul.s       ft11, fs3, fa2, rne
                  slli         a3, t2, 17
                  mul          t0, s6, s8
                  fdiv.s       ft0, fa6, fa3
                  fmv.x.w      s4, ft0
                  addi         zero, a6, -781
                  slti         s4, s2, -123
                  slli         s6, a7, 20
                  xor          t6, a4, tp
                  auipc        a5, 244558
                  fadd.s       ft8, fa4, fa2
                  fsgnjn.s     fs8, ft1, fa1
                  fadd.s       fs7, ft2, ft11
                  sra          ra, s1, a0
                  xori         s8, a5, -1570
                  and          s5, s8, a5
                  srai         a7, a3, 0
                  fcvt.s.w     fs11, s7
                  mulhu        t4, a0, a2
                  and          a1, s7, a3
                  xor          a6, zero, s9
                  fmv.x.w      a0, fs9
                  slti         a4, t3, -128
                  add          tp, s7, a7
                  mulhsu       a7, s6, s8
                  fdiv.s       fs11, fa5, fs1
                  or           s4, t2, t5
                  fmv.x.w      t0, ft11
                  xor          a5, t6, t0
                  feq.s        s7, fa4, fa6
                  divu         s6, s7, s10
                  or           s10, s7, t1
                  xor          tp, s8, s5
                  srl          s2, s10, s4
                  srai         t0, sp, 0
                  xori         t6, a4, -2013
                  andi         a7, a5, 593
                  nop
                  fadd.s       fa0, ft10, fa7
                  fmin.s       fs9, ft10, fa0
                  slt          s5, s7, t4
                  slti         t1, s11, -681
                  slti         a5, s11, 1179
                  andi         s6, a7, 605
                  addi         t3, a7, 185
                  addi         a1, s5, 127
                  slti         gp, t1, 1212
                  slt          gp, s0, t1
                  xor          s8, a1, s2
                  mulhu        s8, a2, a0
                  sub          zero, s4, s1
                  fcvt.s.wu    fs1, zero
                  remu         s7, s6, t2
                  fcvt.w.s     s5, fa7
                  fsub.s       fs0, ft4, fs3, rdn
                  mulhsu       a0, s5, sp
                  slli         tp, tp, 1
                  srai         gp, s3, 15
                  slti         s0, a2, 1620
                  divu         s7, s8, s11
                  srli         t2, s11, 28
                  fsgnj.s      ft1, fa6, fs4
                  fmax.s       fs11, fs1, ft10
                  mulh         s7, s2, t3
                  div          s10, t0, s10
                  fmv.w.x      ft2, ra
                  rem          t3, a2, zero
                  fcvt.w.s     a1, fa3
                  sll          a6, tp, t2
                  feq.s        t3, ft5, fa7
                  fsgnj.s      fs2, fa0, fs10
                  fsgnjx.s     fa0, ft5, ft8
                  mul          ra, a6, t0
                  andi         a3, s1, 1797
                  srl          s10, s9, s3
                  fmin.s       ft4, fa7, fs0
                  mulhu        tp, ra, sp
                  fmul.s       fa6, fa2, fa7, rup
                  fmul.s       fs8, fa2, fa5
                  fmv.w.x      ft1, s0
                  fmv.x.w      s10, fa4
                  fclass.s     s9, fs8
                  andi         s7, t1, 1431
                  feq.s        s7, fs4, fs2
                  srl          t0, tp, s11
                  rem          gp, a7, s3
                  remu         t4, a7, s6
                  xor          s6, t5, a7
                  sra          t4, tp, s2
                  mulhu        a7, t1, t4
                  fsgnj.s      fs6, ft6, fs2
                  fdiv.s       fa3, ft6, ft2, rup
                  mulh         t6, zero, s7
                  or           s10, s4, s10
                  slt          a2, t1, s1
                  div          s7, t4, s6
                  sltiu        gp, a2, 1069
                  add          zero, sp, s6
                  divu         t6, t4, t1
                  feq.s        s5, fs3, fs6
                  remu         s7, t5, a4
                  fmul.s       fa3, fs5, fa2
                  divu         s2, t4, a6
                  fsgnjn.s     fa1, fa7, ft9
                  or           a5, zero, a3
                  slti         a3, a6, 1831
                  xor          a3, a0, t1
                  sltiu        s7, s7, 1915
                  addi         t6, s11, -1867
                  fmax.s       fa6, ft4, fa5
                  mulhu        s11, a5, a2
                  fcvt.s.wu    fs0, s3
                  fle.s        a2, fs3, fs2
                  fcvt.s.w     ft8, t4
                  rem          t5, tp, s3
                  sra          t5, t6, s11
                  andi         a6, zero, 665
                  xori         t1, s9, -1871
                  divu         a5, a6, a7
                  auipc        s6, 511726
                  fcvt.wu.s    t0, fs11, rmm
                  sra          tp, a3, s3
                  fsqrt.s      fs9, fa3, rne
                  sll          s6, s7, s10
                  xori         s6, s5, -1010
                  nop
                  fmv.x.w      t0, fs1
                  or           s9, a2, s0
                  fmv.x.w      a7, ft5
                  fcvt.s.w     fs2, a6
                  and          t6, t6, a0
                  slti         t2, t2, 476
                  feq.s        gp, ft2, fs9
                  sll          t6, a7, t5
                  fsgnjn.s     fa1, fs10, fs7
                  feq.s        gp, ft1, fa7
                  auipc        s11, 415498
                  sra          s6, a5, a5
                  fsgnjx.s     fa6, fa5, fa4
                  andi         t3, s2, 1177
                  flt.s        t1, ft2, fs0
                  fsgnjx.s     fs2, fa7, fs4
                  fadd.s       ft7, fs7, ft4, rdn
                  remu         t4, s1, s2
                  fsgnjx.s     fs11, fa6, ft3
                  div          a4, a1, s6
                  mulhsu       s2, tp, a1
                  sltiu        s7, a4, -82
                  slti         t0, s5, 1150
                  srl          tp, t0, tp
                  ori          ra, s8, -1291
                  divu         a2, s4, s6
                  mulhu        t1, s11, s7
                  and          s8, a0, s10
                  srli         s8, t2, 20
                  mulhsu       a5, a6, t1
                  mulhu        t3, zero, s6
                  and          t5, s1, t5
                  divu         a6, t3, s1
                  sltu         s6, s0, s9
                  sll          s7, s1, a3
                  fsqrt.s      fs0, ft7
                  fmul.s       fs9, fs6, fa6
                  sltiu        s2, s7, 1806
                  remu         a6, s0, tp
                  fcvt.s.w     fa4, s10, rup
                  fmax.s       ft4, fs11, fa4
                  fadd.s       ft1, fs10, fs4, rtz
                  fcvt.wu.s    s8, fs10, rdn
                  auipc        t2, 345979
                  fmv.x.w      a2, fs9
                  fle.s        a1, fa6, ft10
                  rem          s5, t0, s1
                  add          a3, a1, s11
                  nop
                  addi         a2, a5, 1170
                  srl          a6, sp, zero
                  srai         t1, gp, 7
                  sltiu        s7, t0, 399
                  or           zero, a7, s11
                  sltu         zero, s5, t2
                  mul          ra, t6, sp
                  remu         a5, s3, t6
                  fsgnj.s      fa7, ft0, fs10
                  add          zero, sp, s6
                  fmul.s       fs1, ft2, fs6, rdn
                  sub          a2, t3, sp
                  fmin.s       ft6, fs3, fs11
                  add          gp, s11, s7
                  nop
                  fcvt.s.wu    fs10, a1
                  sltiu        gp, s5, -929
                  flt.s        a4, fs4, fa3
                  fmul.s       fs9, fs3, ft10, rne
                  fcvt.s.w     fa6, s6, rmm
                  srl          a7, s10, tp
                  add          s6, s2, s4
                  feq.s        t3, fs4, ft2
                  fmv.x.w      t4, ft7
                  srai         s6, s1, 5
                  fsub.s       fs11, ft1, fs3, rmm
                  fmin.s       ft11, ft11, fs5
                  fcvt.s.w     ft11, a7, rdn
                  feq.s        s5, ft1, fs8
                  sub          s2, a0, tp
                  fmv.x.w      t6, ft5
                  sra          a3, a3, s0
                  fcvt.wu.s    t6, ft0, rup
                  remu         a0, s6, a3
                  fcvt.s.w     ft6, a4
                  srli         t4, s2, 10
                  fmax.s       ft6, ft6, fa6
                  addi         a7, a7, -1732
                  mulhu        zero, s9, s11
                  fle.s        a7, fs0, ft5
                  fsqrt.s      fs6, ft5
                  feq.s        s8, ft0, ft8
                  slti         a3, a2, 754
                  fcvt.s.w     ft3, t0, rne
                  remu         s8, t6, a5
                  divu         t0, s7, t0
                  sll          gp, s1, a5
                  srai         zero, s8, 15
                  slt          s4, a4, a0
                  fmin.s       fs10, ft5, ft2
                  feq.s        s8, fs11, fs0
                  or           s7, s6, zero
                  fmax.s       fs11, fs1, ft2
                  feq.s        s7, ft0, ft9
                  addi         t2, t2, 1384
                  fdiv.s       ft3, fs6, fs0
                  add          s4, a1, t0
                  fcvt.w.s     s2, fa4, rdn
                  fdiv.s       ft4, ft0, ft2
                  fsub.s       fa3, ft8, ft5
                  flt.s        a2, fa5, ft5
                  or           a2, s10, s3
                  sltiu        a5, s2, 1980
                  div          tp, s1, s9
                  ori          zero, t3, 1657
                  fclass.s     tp, fa4
                  addi         a0, a5, -808
                  srli         t5, s0, 2
                  srli         t5, a0, 4
                  remu         a4, t2, tp
                  divu         s7, s3, s5
                  mul          a4, a6, sp
                  and          a3, s5, sp
                  fcvt.w.s     t6, fs7, rdn
                  slt          t0, s6, s10
                  fmin.s       ft10, ft11, fs8
                  or           s4, zero, tp
                  or           gp, a2, s1
                  fcvt.s.w     fs5, tp, rtz
                  feq.s        s8, fs9, fs7
                  fdiv.s       fa7, fs2, fa1
                  sltu         s10, zero, s4
                  fsgnjn.s     ft2, fa2, fa1
                  fadd.s       fs11, fs0, fs5, rne
                  fsgnjn.s     fa5, fs11, fa6
                  divu         a5, t3, s6
                  fcvt.s.w     ft8, a1, rtz
                  or           s5, s0, s3
                  fclass.s     a0, fs3
                  lui          t6, 304720
                  auipc        t4, 155124
                  mulhsu       t2, tp, a7
                  divu         s11, ra, t4
                  fmax.s       ft6, fs3, fs4
                  fdiv.s       ft8, ft5, fs5
                  slli         zero, sp, 24
                  sltiu        t1, s11, 671
                  xori         gp, s9, 1356
                  slt          zero, s11, tp
                  slli         ra, s10, 30
                  divu         t0, a3, s0
                  nop
                  fclass.s     t0, fs0
                  rem          a2, t2, t3
                  feq.s        t5, fs5, ft5
                  sll          s5, s1, gp
                  sltiu        t2, s10, -1976
                  sll          s6, t6, a1
                  fclass.s     zero, fs0
                  fsgnj.s      fa6, fa4, fs2
                  sltiu        a3, a3, -1134
                  feq.s        s10, fa7, fs6
                  sltu         t4, a2, s8
                  auipc        s5, 791150
                  fcvt.s.w     ft6, a2, rdn
                  add          zero, s5, s7
                  fcvt.s.wu    ft7, sp
                  srai         a3, s6, 27
                  fmin.s       fa7, fs8, fs6
                  mulh         ra, a0, t4
                  sltiu        t0, a2, -1595
                  xori         s11, s8, 1233
                  rem          a0, sp, s2
                  fsub.s       fa7, fa4, ft0
                  fsgnjx.s     ft4, fs6, fs2
                  mulhu        s2, s10, t5
                  fsub.s       fs7, ft9, ft1
                  sltiu        t1, t1, -1398
                  srl          t1, t5, s2
                  fdiv.s       fs7, fs10, fs8, rdn
                  fmax.s       ft1, ft10, fa2
                  fclass.s     a7, ft1
                  fclass.s     zero, ft9
                  fsgnjn.s     fa3, fs9, fs10
                  ori          s2, a4, -945
                  remu         a3, a7, a3
                  andi         a4, s6, -741
                  fdiv.s       ft8, ft7, fs11
                  remu         t6, a6, ra
                  fsgnjn.s     fa1, ft4, fs8
                  xor          s4, t6, a6
                  fdiv.s       ft5, ft6, ft5
                  flt.s        s4, ft9, ft0
                  sra          s10, t1, t0
                  mulhsu       zero, ra, s0
                  mul          s6, a6, t6
                  nop
                  slt          s5, a3, t6
                  slt          t0, s5, a3
                  fcvt.w.s     a1, fs2
                  fcvt.wu.s    a5, fa3, rne
                  fmin.s       fs8, fs1, fa6
                  slt          t0, a0, s0
                  srl          tp, t5, s1
                  addi         a0, s4, -1694
                  fmv.w.x      ft8, t1
                  add          s2, s8, a6
                  fsgnjx.s     ft10, fs5, fs8
                  fcvt.s.wu    fa4, t2
                  xor          s11, s11, s11
                  or           t5, s4, a4
                  xori         s4, a7, 489
                  fmv.w.x      fs0, sp
                  rem          s11, gp, s11
                  mulhsu       s4, t6, s9
                  ori          a4, t4, -759
                  srl          zero, a7, a1
                  slti         s11, gp, 923
                  sltiu        ra, a1, -166
                  and          t6, a5, a4
                  fle.s        tp, fs3, fs9
                  fsub.s       fs4, ft5, ft1
                  srai         t2, tp, 4
                  fmv.x.w      s7, fa6
                  fcvt.w.s     a5, ft5
                  fadd.s       fa7, ft6, fs7
                  slli         ra, a1, 12
                  srai         t3, s8, 5
                  nop
                  remu         s9, s6, a5
                  sll          s9, t1, t5
                  xori         t5, s10, -1386
                  sra          tp, s2, a0
                  slti         ra, s11, 1411
                  fsgnjx.s     fs8, ft2, fa6
                  fsqrt.s      fa4, ft10, rne
                  flt.s        t1, fs0, ft5
                  fsgnjn.s     fs3, fs2, fs11
                  slt          a0, a1, gp
                  fcvt.w.s     t2, fs9, rup
                  andi         a4, s10, 1382
                  fdiv.s       fa0, ft2, fs4, rtz
                  addi         a1, t3, 451
                  mulhu        s5, sp, ra
                  fmul.s       fa7, fs2, fs7
                  div          a3, s11, s6
                  sub          s11, gp, s9
                  sltu         t3, s2, zero
                  fsub.s       fs3, fs8, fa1
                  slti         t2, sp, 522
                  lui          gp, 657977
                  div          t3, s10, s8
                  feq.s        t4, fs5, fa5
                  fsgnjn.s     ft9, ft2, fa5
                  mulhsu       s11, s3, t2
                  andi         tp, s2, 77
                  xor          s8, sp, s0
                  sll          s9, s10, gp
                  ori          t2, s0, 524
                  fmul.s       ft3, fs0, fs6
                  xori         a5, s5, -345
                  sll          s4, s7, a1
                  fcvt.w.s     s5, fs5
                  fmax.s       fs8, fs7, ft10
                  sltiu        a6, a4, -1201
                  nop
                  lui          a3, 845073
                  flt.s        ra, fa5, ft10
                  fmul.s       ft5, fa1, ft4
                  xori         a0, tp, 1662
                  fcvt.w.s     t2, fa7, rdn
                  divu         t6, a2, a5
                  fmv.w.x      ft5, a6
                  sltu         a2, s4, a5
                  sltiu        a3, sp, 689
                  srl          s0, s1, a0
                  fmv.x.w      a7, fa7
                  fsub.s       ft6, fa4, fa6, rtz
                  xor          s4, a2, s11
                  nop
                  nop
                  fsqrt.s      ft6, ft6, rtz
                  fmv.x.w      t6, ft4
                  divu         s0, t3, tp
                  srai         t5, a2, 26
                  fmul.s       fs10, fa3, ft5
                  fmul.s       ft3, ft8, ft7, rne
                  feq.s        a4, fs2, fs8
                  fsgnjx.s     ft9, fs10, fa7
                  fcvt.s.w     fa6, a0, rmm
                  fmin.s       fa5, fa1, ft11
                  fsqrt.s      ft11, fa6
                  add          s10, tp, gp
                  sltiu        t4, s0, 1739
                  fsqrt.s      fa3, ft8
                  fsgnj.s      fa1, ft6, fs5
                  sll          a4, ra, a0
                  sltiu        t3, t3, 1785
                  add          zero, t6, s8
                  fsgnjx.s     fs8, fs9, ft1
                  fsqrt.s      fa3, fs11, rdn
                  fmv.x.w      zero, fs4
                  mulhsu       s4, a4, sp
                  add          t1, gp, s4
                  lui          s4, 2601
                  slli         t6, gp, 21
                  mulh         a6, t6, t3
                  slli         s7, s2, 11
                  sra          s7, a7, s3
                  fmv.w.x      fa3, a1
                  fcvt.s.wu    ft3, zero, rne
                  fcvt.w.s     a0, fa4, rdn
                  nop
                  fclass.s     a2, ft2
                  and          t0, a5, s11
                  add          a5, s9, t4
                  sll          s2, a7, s4
                  fmv.w.x      ft3, s9
                  flt.s        t5, ft7, ft1
                  mulhu        a6, a3, a0
                  sll          tp, s7, a3
                  fsub.s       fa4, fs8, fa3, rne
                  sll          a1, s9, t6
                  slti         a5, tp, 244
                  fadd.s       ft0, fa0, ft2, rmm
                  fcvt.s.wu    fs0, sp
                  fclass.s     a7, ft6
                  auipc        ra, 247555
                  sra          t6, s9, t1
                  sra          s5, a0, s4
                  fadd.s       fs11, ft0, ft2
                  fcvt.s.w     fa4, t4, rdn
                  xori         tp, a0, -409
                  slt          tp, s10, a7
                  sub          gp, zero, a4
                  fmul.s       fa6, fa7, fa4
                  divu         a0, gp, tp
                  fcvt.s.wu    ft4, a6
                  xori         s4, s9, 2006
                  fmul.s       ft4, ft1, fa5
                  mul          t2, t3, t0
                  or           s6, s6, a0
                  div          a4, s10, t5
                  slt          s6, ra, t1
                  fadd.s       fa1, fs3, fs8, rtz
                  nop
                  sra          s0, a3, a5
                  div          t5, gp, s1
                  addi         t3, a0, 229
                  nop
                  mulh         s8, s0, s9
                  sltiu        s6, s3, 1567
                  mulhu        a0, a7, a4
                  slti         s2, tp, -246
                  sra          s4, s0, s2
                  fmv.w.x      fa2, t0
                  slt          a3, s5, a2
                  mulh         t6, s1, t2
                  mulhsu       ra, a7, t6
                  rem          s6, a6, s5
                  fsub.s       ft10, fs9, fs6, rtz
                  srli         s4, a3, 8
                  fcvt.s.wu    ft2, t1
                  add          t2, s8, tp
                  and          t0, a6, ra
                  fsqrt.s      ft11, fa1, rup
                  fcvt.s.wu    fa3, a4
                  remu         s0, s6, a0
                  fdiv.s       fs3, fa4, fs0, rmm
                  sltiu        ra, a5, 1124
                  and          s8, s1, s6
                  rem          a3, s3, a7
                  fsgnjn.s     fa7, fa6, fa0
                  slti         ra, s4, -1761
                  lui          a7, 863493
                  div          a1, tp, a4
                  auipc        a7, 487041
                  flt.s        tp, fa1, fs10
                  slli         s5, zero, 14
                  sltu         t6, a1, a6
                  fsgnj.s      ft5, fs1, fa4
                  fcvt.wu.s    t0, fs6
                  andi         t6, a3, 2004
                  srl          s6, a3, a2
                  rem          s2, s11, zero
                  srli         t6, t5, 25
                  fsgnjx.s     fa7, fs10, fs0
                  sub          tp, s8, t1
                  srai         s4, t0, 7
                  add          a0, a0, t1
                  mul          s9, s5, t3
                  mulh         s8, t4, gp
                  lui          t6, 445290
                  srli         s10, ra, 19
                  and          s2, s2, s5
                  remu         t2, s8, a5
                  fsqrt.s      fs2, fs0
                  fsgnj.s      fa4, ft1, fa6
                  fmax.s       fs2, ft6, fs4
                  sltu         a1, t4, t2
                  fsgnjx.s     ft6, ft10, fs4
                  or           t1, s9, sp
                  fsgnj.s      ft11, ft10, ft2
                  fcvt.wu.s    t6, ft10
                  nop
                  lui          s2, 588342
                  fsqrt.s      ft2, fa6
                  feq.s        tp, ft4, fa5
                  fsub.s       fa7, ft2, fs5, rup
                  remu         a1, tp, a0
                  lui          zero, 781685
                  add          gp, s10, s11
                  slti         gp, s11, 1847
                  remu         s0, a2, zero
                  mulhsu       s2, s3, a2
                  fcvt.wu.s    t4, ft11
                  lui          t3, 924470
                  fcvt.w.s     s4, fa4
                  fclass.s     t5, ft1
                  sll          gp, s0, t0
                  sra          s5, t6, t3
                  div          s7, zero, s3
                  nop
                  fclass.s     s5, fs1
                  srli         a3, t6, 26
                  srai         zero, t4, 18
                  and          s10, tp, a0
                  rem          t0, t3, s11
                  sra          t5, s6, a5
                  nop
                  sll          t4, s3, a6
                  fsgnjn.s     fs8, fa2, fa4
                  feq.s        s8, fs11, ft10
                  fdiv.s       ft4, ft11, fa2, rmm
                  mulh         a2, s5, s8
                  mulhsu       s8, zero, s0
                  fadd.s       fa5, fs5, fa3
                  rem          t2, s6, a1
                  and          t1, s7, s4
                  mulhsu       a3, s6, s0
                  nop
                  fsgnjx.s     fa3, ft9, fs2
                  fclass.s     gp, fs6
                  mulhu        a7, t3, s8
                  fcvt.s.wu    fs10, a4, rup
                  fdiv.s       ft3, ft8, fs6
                  fadd.s       ft10, fs3, ft8
                  sra          t2, a4, s6
                  fsgnjx.s     ft11, fs5, fa3
                  slt          a1, s6, t3
                  fsgnjx.s     fs9, fs11, fs11
                  fmul.s       fs5, fs7, ft8
                  sub          a5, ra, a0
                  sub          zero, s4, t5
                  fmv.w.x      fa2, t3
                  feq.s        t6, fa5, fa7
                  fmv.w.x      ft0, t5
                  srli         a2, s0, 31
                  fsgnj.s      fs11, ft4, ft9
                  mulhsu       t6, a6, sp
                  addi         a3, s0, 981
                  or           s10, a0, t0
                  sll          a7, a0, t1
                  rem          t6, sp, zero
                  and          t2, a4, sp
                  fmv.w.x      fs3, s3
                  auipc        t4, 1011298
                  fmax.s       fs1, fa3, fs6
                  sra          s4, ra, t5
                  divu         a4, s9, ra
                  fsgnjx.s     fa0, ft0, fa6
                  auipc        t0, 655861
                  srai         s11, a2, 5
                  fmul.s       fs7, fa7, fs8
                  fsub.s       ft4, fs7, fs0, rtz
                  mulhsu       gp, tp, t4
                  fclass.s     s11, ft2
                  andi         gp, t0, 1496
                  feq.s        a4, ft1, ft2
                  divu         s6, s3, gp
                  srli         t6, s3, 31
                  sltu         t4, s3, tp
                  sll          a6, a0, t4
                  fcvt.s.wu    ft2, a3
                  ori          gp, gp, 1825
                  div          t6, s0, t3
                  fsgnjx.s     ft2, fs9, fs1
                  feq.s        t6, fs11, fa1
                  slt          s6, s11, a1
                  fclass.s     a6, fa6
                  xori         s6, s11, 790
                  slti         tp, tp, -170
                  add          a3, s1, s3
                  slli         t6, t6, 1
                  xor          s11, a4, ra
                  feq.s        t0, fs4, fs7
                  feq.s        a1, fs3, fs1
                  fcvt.s.w     ft1, s1
                  rem          a1, s1, a4
                  feq.s        s10, fs2, ft0
                  fmv.x.w      t1, fs1
                  flt.s        t1, ft5, fs5
                  srli         tp, a6, 0
                  fle.s        ra, fa0, ft6
                  feq.s        a0, fa7, ft0
                  fdiv.s       fs5, ft4, fa7
                  fsgnjn.s     ft1, fs7, fs6
                  srai         s9, a1, 2
                  sub          t0, s10, a3
                  fsqrt.s      fa2, ft8, rmm
                  fsgnjn.s     fa1, fs10, fs2
                  fmax.s       fs10, ft10, fs8
                  fmv.w.x      fs9, s6
                  fmv.x.w      a1, fs11
                  srli         a2, s2, 21
                  andi         a7, a4, 466
                  andi         a1, a1, 408
                  srl          t0, s4, t1
                  fmin.s       fa1, ft4, ft2
                  srai         s7, a7, 12
                  fsgnj.s      fs10, ft9, fa3
                  sll          t5, a7, gp
                  fmul.s       fa3, fa4, ft9
                  flt.s        s10, ft7, fa2
                  mulhsu       s11, a5, a1
                  sltiu        s11, s0, 731
                  nop
                  xor          a2, a5, s6
                  lui          t0, 779039
                  fcvt.w.s     t0, ft6, rmm
                  fle.s        s10, ft9, ft1
                  fle.s        a5, fa7, fs2
                  sltiu        a5, t5, 543
                  or           s5, t3, s1
                  feq.s        t0, ft9, fs4
                  addi         s7, s2, 466
                  xor          s11, a1, a5
                  slti         a4, s1, 952
                  div          a1, zero, s11
                  fdiv.s       fa4, fs7, fs5
                  feq.s        a3, fs10, fa5
                  add          s0, s8, a0
                  fcvt.s.wu    ft9, s7, rtz
                  fcvt.wu.s    t0, fa2
                  lui          zero, 714184
                  and          a6, t6, a0
                  xor          t2, s2, a1
                  sll          t4, s6, a5
                  rem          a3, a6, a5
                  rem          s4, a3, a2
                  fle.s        a2, fa7, ft0
                  fmul.s       fs3, ft5, fa7, rmm
                  remu         t3, s7, a3
                  andi         s10, a6, 1638
                  remu         a2, s8, s3
                  or           s4, s9, a7
                  fsgnjx.s     fs6, fa1, fs1
                  div          s7, s6, a2
                  fmax.s       fa2, ft5, ft8
                  fmv.x.w      t6, fs1
                  fmax.s       ft11, fs10, fs10
                  mulh         s6, a1, a2
                  fcvt.w.s     a7, ft11
                  mulhsu       a5, t0, s1
                  mul          s8, s10, a4
                  nop
                  addi         s2, t1, 1424
                  addi         t3, t3, -1100
                  fcvt.s.w     ft6, t4, rmm
                  remu         s11, s0, t1
                  mulh         a7, t3, a5
                  fcvt.w.s     s7, ft2, rtz
                  fsub.s       ft2, fs5, ft7
                  fsgnjx.s     fa7, ft8, fa6
                  remu         zero, s4, a2
                  slli         s5, a5, 24
                  divu         a2, a3, s8
                  xor          t6, s4, s9
                  divu         ra, s10, a6
                  srli         s4, t5, 14
                  remu         zero, s6, s9
                  sltiu        t3, a2, -387
                  xor          a7, tp, a0
                  fclass.s     t0, fs8
                  div          a3, t5, t3
                  fle.s        t2, fa7, ft5
                  fmin.s       ft4, fa7, ft10
                  slli         a7, s9, 2
                  fmv.x.w      t3, fs10
                  fmv.w.x      fs1, s3
                  mulhu        t0, s2, s0
                  rem          s2, s0, s6
                  or           zero, t1, zero
                  sub          a2, sp, t2
                  srl          t5, a3, a7
                  sra          t0, s0, t4
                  fsgnjn.s     ft9, fa0, fa3
                  ori          a2, a7, 305
                  mulhu        s6, a4, zero
                  flt.s        t4, fa5, fs8
                  ori          a6, s8, -388
                  flt.s        t6, fs8, fs2
                  fsgnjn.s     ft6, fs11, fs7
                  fsqrt.s      fs8, fa3
                  addi         t6, t6, -203
                  fclass.s     tp, fs1
                  sll          s8, t3, t2
                  fmul.s       fs9, fa3, fs2, rtz
                  slli         tp, a0, 6
                  fcvt.s.wu    fa1, t1, rne
                  srai         a1, s7, 26
                  fmv.x.w      t5, fs9
                  add          s7, a2, a4
                  fsqrt.s      ft2, ft6, rdn
                  srl          t6, a5, gp
                  xori         a3, gp, -466
                  fmax.s       fa7, ft3, ft9
                  mulhu        t5, t2, s5
                  rem          s5, ra, t2
                  auipc        s5, 127180
                  and          a5, s1, t4
                  divu         t2, a5, t2
                  slli         t6, a7, 5
                  mul          s11, s3, s5
                  remu         a1, tp, zero
                  or           t5, s8, t3
                  fmul.s       ft10, fa6, ft3
                  mulh         a2, a2, a0
                  addi         tp, s4, -1491
                  fmin.s       fa7, fa6, fs5
                  fcvt.s.w     fs9, s8
                  sll          ra, tp, zero
                  div          tp, a5, t0
                  sra          s9, s6, t0
                  or           t5, a2, a4
                  or           s2, s8, s2
                  sltu         s0, t2, t3
                  fsgnjn.s     ft1, ft3, fa1
                  feq.s        a7, fa1, ft4
                  fadd.s       ft5, fs9, fs8
                  fsgnjn.s     ft1, ft4, ft0
                  sltu         t0, zero, s4
                  fle.s        s0, fa0, fa0
                  fsgnjx.s     fs4, fa2, fs9
                  fsgnj.s      ft6, ft5, fs9
                  flt.s        s6, ft8, fs4
                  auipc        s9, 34884
                  mulhsu       gp, s8, a4
                  fclass.s     t2, fa6
                  sltiu        s6, sp, -88
                  srl          s10, t1, s5
                  slli         a6, s6, 23
                  fmax.s       ft9, fs0, fa5
                  sll          s2, s4, t6
                  sll          t4, t1, a2
                  fcvt.w.s     t6, fs11, rdn
                  srli         a3, s3, 30
                  fcvt.s.wu    fa6, ra, rtz
                  nop
                  slt          s2, sp, t1
                  sltu         t4, tp, s7
                  fcvt.s.wu    fs2, s11
                  fmin.s       fs5, fa5, fs2
                  remu         t3, a1, s8
                  fsub.s       ft11, fa3, fa2, rdn
                  sra          a2, s9, s5
                  slti         gp, zero, 1282
                  fmax.s       ft6, ft11, ft5
                  feq.s        gp, fs6, fa3
                  fsqrt.s      ft5, ft9
                  sltu         a2, a6, s10
                  mulh         ra, s11, s2
                  fcvt.w.s     gp, fa3
                  fsub.s       fa6, fs1, ft3
                  fmv.x.w      s11, fs5
                  fsgnjx.s     fs6, ft5, ft10
                  slt          a3, s8, a3
                  sltiu        t5, t0, 90
                  div          t4, tp, sp
                  fmv.w.x      fs8, a2
                  fclass.s     s10, ft7
                  fmul.s       ft10, fs4, ft2, rmm
                  flt.s        tp, fs9, ft4
                  divu         s6, sp, a0
                  fcvt.wu.s    s0, ft10, rmm
                  fsqrt.s      fa4, fs9, rne
                  andi         a0, t4, -537
                  fsub.s       ft1, fs2, fs8
                  andi         t4, s3, -256
                  srai         s7, t5, 11
                  fsgnjn.s     fa3, fs9, fa4
                  la x9, test_done
                  jalr x0, x9, 0
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
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_2:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_3:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_4:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_5:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_6:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_7:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_8:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_9:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_10:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_11:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_12:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_13:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_14:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

mmode_intr_vector_15:
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x9, test_done
                  jalr x0, x9, 0

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
                  addi x19, x19, -4
                  sw  x2, (x19)
                  add x2, x19, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x19, x2, zero
                  csrr x30, 0x341 # MEPC
                  csrr x30, 0x342 # MCAUSE
                  li x5, 0x3 # BREAKPOINT
                  beq x30, x5, ebreak_handler
                  li x5, 0x8 # ECALL_UMODE
                  beq x30, x5, ecall_handler
                  li x5, 0x9 # ECALL_SMODE
                  beq x30, x5, ecall_handler
                  li x5, 0xb # ECALL_MMODE
                  beq x30, x5, ecall_handler
                  li x5, 0x1
                  beq x30, x5, instr_fault_handler
                  li x5, 0x5
                  beq x30, x5, load_fault_handler
                  li x5, 0x7
                  beq x30, x5, store_fault_handler
                  li x5, 0xc
                  beq x30, x5, pt_fault_handler
                  li x5, 0xd
                  beq x30, x5, pt_fault_handler
                  li x5, 0xf
                  beq x30, x5, pt_fault_handler
                  li x5, 0x2 # ILLEGAL_INSTRUCTION
                  beq x30, x5, illegal_instr_handler
                  csrr x5, 0x343 # MTVAL
                  1: la x9, test_done
                  jalr x1, x9, 0

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
                  la x9, write_tohost
                  jalr x0, x9, 0

instr_fault_handler:
                  add x2, x19, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x19, x2, zero
                  lw  x2, (x19)
                  addi x19, x19, 4
                  mret

load_fault_handler:
                  add x2, x19, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x19, x2, zero
                  lw  x2, (x19)
                  addi x19, x19, 4
                  mret

store_fault_handler:
                  add x2, x19, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x19, x2, zero
                  lw  x2, (x19)
                  addi x19, x19, 4
                  mret

ebreak_handler:   
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  add x2, x19, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x19, x2, zero
                  lw  x2, (x19)
                  addi x19, x19, 4
                  mret

illegal_instr_handler:
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  add x2, x19, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x19, x2, zero
                  lw  x2, (x19)
                  addi x19, x19, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x30, 0x300 # MSTATUS;
                  csrr  x30, 0x304 # MIE;
                  csrr  x30, 0x344 # MIP;
                  csrrc x30, 0x344, x30 # MIP;
                  add x2, x19, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x19, x2, zero
                  lw  x2, (x19)
                  addi x19, x19, 4
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
