.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x14, h0_start
jalr x0, x14, 0
h0_start:
                  li x6, 0x40001120
                  csrw 0x301, x6
kernel_sp:        
                  la x31, kernel_stack_end

trap_vec_init:    
                  la x6, mtvec_handler
                  ori x6, x6, 0
                  csrw 0x305, x6 # MTVEC

mepc_setup:       
                  la x6, init
                  csrw 0x341, x6

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x6, 0x3800
                  csrw 0x300, x6 # MSTATUS
                  li x6, 0x0
                  csrw 0x304, x6 # MIE
                  mret
init:             
                  li x6, 4286578687
                  fmv.w.x f0, x6
                  li x6, 2143289344
                  fmv.w.x f1, x6
                  li x6, 4286578688
                  fmv.w.x f2, x6
                  li x6, 2151545677
                  fmv.w.x f3, x6
                  li x6, 2143289344
                  fmv.w.x f4, x6
                  li x6, 2143289344
                  fmv.w.x f5, x6
                  li x6, 4286578688
                  fmv.w.x f6, x6
                  li x6, 6104420
                  fmv.w.x f7, x6
                  li x6, 0
                  fmv.w.x f8, x6
                  li x6, 2147483648
                  fmv.w.x f9, x6
                  li x6, 2143289344
                  fmv.w.x f10, x6
                  li x6, 2139095040
                  fmv.w.x f11, x6
                  li x6, 4286578687
                  fmv.w.x f12, x6
                  li x6, 3490313165
                  fmv.w.x f13, x6
                  li x6, 3285500029
                  fmv.w.x f14, x6
                  li x6, 4076425558
                  fmv.w.x f15, x6
                  li x6, 1099798
                  fmv.w.x f16, x6
                  li x6, 4005016
                  fmv.w.x f17, x6
                  li x6, 1154145
                  fmv.w.x f18, x6
                  li x6, 0
                  fmv.w.x f19, x6
                  li x6, 2139095040
                  fmv.w.x f20, x6
                  li x6, 4286578688
                  fmv.w.x f21, x6
                  li x6, 2139095041
                  fmv.w.x f22, x6
                  li x6, 2139095041
                  fmv.w.x f23, x6
                  li x6, 7175146
                  fmv.w.x f24, x6
                  li x6, 0
                  fmv.w.x f25, x6
                  li x6, 2147996425
                  fmv.w.x f26, x6
                  li x6, 2139095041
                  fmv.w.x f27, x6
                  li x6, 2267653989
                  fmv.w.x f28, x6
                  li x6, 4286578688
                  fmv.w.x f29, x6
                  li x6, 1755386
                  fmv.w.x f30, x6
                  li x6, 2143289344
                  fmv.w.x f31, x6
                  fsrmi 1
                  li x0, 0x0
                  li x1, 0x80000000
                  li x2, 0xfa42bedc
                  li x3, 0x9a05813d
                  li x4, 0x80000000
                  li x5, 0x80000000
                  li x6, 0x0
                  li x7, 0xf8f83308
                  li x8, 0x0
                  li x9, 0x3
                  li x11, 0x8
                  li x12, 0x80000000
                  li x13, 0x7
                  li x14, 0xfa20c96d
                  li x15, 0x80000000
                  li x16, 0xf0ffd710
                  li x17, 0xc
                  li x18, 0xfe0d1eb1
                  li x19, 0xf80f3881
                  li x20, 0x0
                  li x21, 0x0
                  li x22, 0xa
                  li x23, 0x0
                  li x24, 0x80000000
                  li x25, 0x0
                  li x26, 0x0
                  li x27, 0x2e093ae7
                  li x28, 0x0
                  li x29, 0xb
                  li x30, 0x88b3e0b8
                  la x10, user_stack_end
main:             srl          s7, s10, s2
                  fdiv.s       fa1, ft8, fs9, rtz
                  sltiu        ra, t3, 340
                  sll          s4, t5, t1
                  divu         s7, t2, s5
                  mulh         a1, a3, s0
                  rem          s11, s11, s6
                  fmv.x.w      a5, fs0
                  fadd.s       ft2, fs2, fa3
                  fmul.s       ft9, ft8, fs6, rdn
                  ori          a7, zero, -829
                  fsub.s       fs4, ft11, fs2
                  fsub.s       fa5, fs9, ft0, rne
                  mul          a1, t1, a5
                  sltu         zero, zero, t5
                  fcvt.s.w     fs2, t5
                  fmax.s       fs10, ft10, fa6
                  addi         s11, a1, -195
                  divu         s2, s9, t0
                  and          a5, s6, ra
                  fle.s        t0, fs7, fs8
                  slli         s3, s3, 17
                  or           s8, s6, s0
                  auipc        a2, 443581
                  sltu         zero, t3, s5
                  addi         s7, a3, 1482
                  fle.s        zero, ft3, fs9
                  srl          a3, a0, t0
                  fcvt.wu.s    a6, ft0, rdn
                  fsub.s       fs0, fs9, ft8
                  feq.s        s4, ft3, fa5
                  xor          t1, t0, a3
                  andi         sp, s9, -1011
                  slli         s9, t5, 0
                  add          ra, ra, a0
                  add          a1, a1, s5
                  or           sp, a6, s1
                  fmax.s       fs8, fs1, fs7
                  mulhu        s3, gp, tp
                  div          s11, t1, a1
                  fcvt.w.s     a7, ft10
                  fsub.s       ft6, ft6, fa0
                  mul          tp, t2, a1
                  nop
                  or           a5, sp, s6
                  mul          s5, a1, a4
                  ori          a6, s9, -1042
                  mulhsu       s1, t1, s5
                  sra          t4, s1, s5
                  sll          s8, a4, zero
                  sub          zero, s2, s8
                  srai         t3, zero, 15
                  fmax.s       fs8, ft11, fs11
                  slli         a2, a4, 1
                  feq.s        s6, ft3, ft3
                  slt          t4, t1, t2
                  remu         s10, s3, s0
                  sra          s0, ra, a0
                  slti         a5, gp, 1876
                  sltiu        t3, a6, -941
                  div          s7, a0, t2
                  sltiu        sp, t4, -1747
                  nop
                  slti         s2, a0, 1450
                  fsqrt.s      ft7, ft9
                  add          t0, a7, s7
                  srli         t2, gp, 20
                  fadd.s       ft10, fs1, ft0
                  fmax.s       ft6, fa3, ft6
                  lui          ra, 143231
                  div          a7, a4, t2
                  fcvt.wu.s    s8, fs2
                  xori         gp, a0, -405
                  fadd.s       fs4, fa7, fs11
                  srli         s2, s1, 15
                  lui          s6, 648686
                  andi         zero, s10, -311
                  fmul.s       fs1, fs4, ft5
                  slli         s3, sp, 29
                  fsqrt.s      ft10, ft2
                  srli         s5, a0, 16
                  flt.s        s7, fs5, ft1
                  fmin.s       ft2, ft2, fa0
                  slt          sp, t4, gp
                  srai         s0, s1, 19
                  slti         gp, t6, -1647
                  srai         s4, ra, 2
                  sltiu        s1, gp, 2039
                  flt.s        a7, ft4, fs6
                  ori          s0, t0, -1193
                  fcvt.w.s     zero, ft2
                  andi         s1, s11, 1538
                  remu         s3, gp, ra
                  auipc        gp, 492346
                  fclass.s     t0, fs4
                  and          t5, s3, t4
                  andi         a2, a4, -857
                  fsgnjn.s     fa3, fa0, ft10
                  srli         gp, sp, 14
                  srl          s10, a7, s6
                  andi         s1, a1, 1641
                  fsqrt.s      ft1, fs9
                  and          s7, s10, s6
                  slt          sp, a7, s4
                  srai         gp, t0, 18
                  mul          sp, t1, t0
                  fsgnjn.s     ft1, ft5, fs2
                  add          s5, s1, t1
                  fmax.s       fa0, fs3, fs9
                  fsqrt.s      fs10, ft7
                  nop
                  fle.s        t4, fs11, fs1
                  mulhu        a2, s6, s1
                  lui          t3, 825588
                  fcvt.s.w     fs6, s9, rtz
                  fcvt.s.wu    fa6, a6
                  sltiu        ra, s7, -1857
                  fsgnj.s      fa4, fs5, fs2
                  fsgnj.s      fs7, fs3, fs9
                  and          a2, s2, s0
                  fclass.s     s6, fs6
                  feq.s        a5, fs9, ft11
                  nop
                  add          a3, a4, a7
                  srli         s3, sp, 23
                  sll          zero, a0, s9
                  auipc        a5, 706591
                  auipc        s0, 750384
                  slli         s3, s3, 21
                  sub          a3, ra, a2
                  slti         t5, t0, 729
                  fsub.s       fs0, fs9, fs9, rne
                  fsgnjn.s     fs0, fa6, fa0
                  sub          s3, s0, t4
                  fclass.s     s6, fs5
                  sra          tp, t5, ra
                  fcvt.s.wu    fs5, a0
                  fsgnjn.s     fa3, fa1, fs9
                  div          t3, s3, t6
                  div          s5, a0, tp
                  auipc        s8, 942554
                  fsgnj.s      fa6, ft3, ft3
                  fsgnjx.s     fs2, ft5, ft2
                  fle.s        t1, fs7, fa1
                  fmul.s       ft1, fa5, ft11
                  mul          s9, s0, s2
                  fsgnjx.s     ft9, fs6, fs2
                  fmv.w.x      fs5, s11
                  divu         a2, a6, s10
                  auipc        s11, 409292
                  xor          s3, s11, a4
                  remu         gp, s7, s11
                  auipc        t5, 379633
                  xor          s10, t3, a5
                  sra          a3, a1, s7
                  mulhsu       t5, a6, t0
                  fcvt.wu.s    a3, fa5
                  rem          t1, t6, ra
                  or           s10, t4, s10
                  srl          gp, t3, t6
                  srl          s6, s2, a7
                  fsgnjx.s     fs10, ft0, fs2
                  fmv.x.w      s6, fs7
                  lui          gp, 854911
                  srli         a1, s0, 9
                  lui          s6, 207305
                  srli         t0, s3, 16
                  fmin.s       fs6, fa2, ft1
                  sub          s1, t3, t2
                  fcvt.s.wu    fa1, s0
                  fmul.s       fa4, fa0, fa6, rup
                  fdiv.s       ft0, fs11, fs9, rtz
                  srai         s2, s2, 28
                  sll          t1, ra, t5
                  fsgnjx.s     ft10, fs4, fa6
                  fsgnjx.s     fs4, ft5, ft11
                  sub          a5, s4, tp
                  sltu         s5, a3, a1
                  fsqrt.s      ft2, fa6
                  xor          t0, gp, s2
                  fsgnjn.s     fs1, ft1, ft1
                  fmul.s       fs4, fa0, fs8
                  and          t0, s9, a5
                  fcvt.wu.s    s1, ft10, rtz
                  fcvt.s.wu    fa4, gp, rtz
                  fmv.w.x      fa6, a0
                  remu         s9, s9, s10
                  fmul.s       fs11, fa7, fa1
                  sltu         s11, zero, t3
                  mulh         gp, zero, s1
                  fmin.s       fs4, ft10, fs2
                  mulhsu       s8, s10, a0
                  slt          t1, s9, s1
                  fdiv.s       fs3, fs1, ft8
                  lui          a2, 798692
                  fmax.s       fs1, fa2, ft11
                  slli         s7, t6, 23
                  slti         ra, t2, 1438
                  mulh         s9, s8, tp
                  fmv.w.x      fs0, a3
                  xori         t2, a2, -1952
                  auipc        s5, 516701
                  fsqrt.s      fs5, fs3
                  fadd.s       ft10, fs1, ft8, rdn
                  fadd.s       fa4, ft10, fs7, rmm
                  sltiu        s3, s6, 255
                  fmv.x.w      ra, fs6
                  remu         s9, a2, tp
                  srli         t2, zero, 24
                  fadd.s       fs11, fa3, fs4, rdn
                  slti         ra, a2, 605
                  fclass.s     a7, fs6
                  rem          t0, a3, t1
                  fadd.s       fs6, fs4, fa2
                  fcvt.wu.s    s9, fs3, rdn
                  srl          zero, gp, s5
                  and          s3, s3, t6
                  div          s7, tp, sp
                  slli         gp, a4, 23
                  fsgnj.s      ft10, ft7, ft9
                  add          zero, s0, s0
                  fmul.s       ft8, ft5, fs7
                  fmv.x.w      s9, fs6
                  srai         a3, a0, 24
                  srai         s3, s11, 17
                  rem          a1, a3, a4
                  fcvt.s.wu    fs4, a7, rtz
                  fadd.s       ft5, fs7, fa3, rtz
                  sll          gp, s1, t2
                  feq.s        t2, fa5, ft5
                  fmv.x.w      s10, fs10
                  ori          s5, a6, -975
                  srl          s0, s1, sp
                  mulhu        sp, a6, s1
                  xori         a7, a7, -1890
                  sltiu        ra, a5, 1093
                  slti         gp, s2, 1318
                  fcvt.wu.s    s0, ft6, rne
                  add          a6, a5, a0
                  andi         s8, s3, 1234
                  fcvt.s.w     fs11, a6, rmm
                  sra          s10, t2, s7
                  divu         s5, s8, zero
                  fsub.s       fs0, ft6, ft8
                  fcvt.wu.s    s1, ft2, rdn
                  fmax.s       fa4, ft11, fa0
                  fcvt.s.w     ft9, ra
                  flt.s        a1, fs10, fa4
                  div          s2, a6, t5
                  lui          s3, 792823
                  ori          s10, t3, -1302
                  slti         a2, t1, -1711
                  fsgnj.s      ft9, fs8, fs1
                  sltu         s0, s11, s5
                  fcvt.wu.s    s3, ft1, rdn
                  fadd.s       fs4, fs8, fs4
                  fsqrt.s      fs7, fs9, rdn
                  fsgnjx.s     ft9, fs6, fa7
                  sll          a2, a7, s7
                  fsub.s       fa1, fa6, fs6, rmm
                  add          t1, a6, t1
                  flt.s        zero, ft1, fs4
                  mul          tp, s9, a3
                  fsub.s       fs4, fs2, fs1, rdn
                  fle.s        t0, fa0, ft7
                  fcvt.s.wu    fa6, a7
                  feq.s        s5, ft2, ft11
                  mulhsu       s3, a2, s1
                  fmv.x.w      t5, fa2
                  divu         a3, s0, s5
                  fmv.x.w      s3, fs7
                  sltiu        s11, s6, 1672
                  flt.s        zero, fa4, fs11
                  fle.s        s9, ft9, fs3
                  srli         t3, t0, 20
                  rem          s9, s0, t4
                  fsgnjn.s     ft7, ft7, fs1
                  fmv.w.x      fa2, s2
                  fmul.s       ft9, ft9, fs6, rdn
                  fmv.w.x      fs5, s11
                  fsgnj.s      fs4, fa6, ft3
                  divu         s11, sp, t4
                  fadd.s       ft11, fs10, fa1
                  sltu         s5, t1, t2
                  fcvt.wu.s    tp, fs3, rtz
                  fle.s        a1, ft4, fs9
                  xori         t0, zero, 1945
                  slti         a3, t2, -42
                  sltu         a3, s11, ra
                  fmv.x.w      s7, fs11
                  nop
                  fsqrt.s      fa7, fa1
                  sltu         t1, s2, a3
                  mulh         t2, t3, s9
                  fcvt.s.wu    ft5, t2, rdn
                  and          t5, gp, t5
                  slti         t2, s0, 42
                  xor          zero, ra, a2
                  addi         s11, t1, -1739
                  sra          a2, sp, gp
                  fcvt.s.wu    ft7, s1, rup
                  rem          ra, t2, t4
                  and          t1, a6, a0
                  fsgnjx.s     fa0, fa3, fa6
                  auipc        tp, 931475
                  sub          s0, t2, a3
                  fmv.w.x      fs11, s10
                  add          s2, s3, s1
                  xori         gp, a4, 1979
                  srl          s0, a3, a1
                  divu         s8, a3, s2
                  auipc        s9, 827004
                  lui          a6, 310559
                  fclass.s     a7, fs3
                  ori          sp, s1, 1808
                  fdiv.s       fa7, ft5, fa1, rne
                  fmul.s       ft5, ft11, fs11
                  fdiv.s       fs9, fs9, ft8
                  xor          t1, a6, a2
                  srai         a3, s4, 17
                  flt.s        s3, fa7, fs6
                  and          s0, gp, tp
                  fsgnj.s      fa4, fs8, fa3
                  fcvt.s.wu    fs10, a3
                  xori         t2, t6, 260
                  srl          zero, t2, s1
                  slt          s1, t4, s9
                  fmax.s       fa2, fa6, ft9
                  addi         sp, s9, 1317
                  srai         s2, s7, 20
                  flt.s        t4, fs7, ft2
                  divu         s1, s8, s1
                  fcvt.s.w     fa6, s6, rup
                  mulhsu       a3, s0, a1
                  fsub.s       fs8, ft4, fa2
                  fadd.s       fs6, fa7, fa3, rne
                  srli         s7, s11, 8
                  or           s2, s4, t3
                  remu         zero, a1, a0
                  fmin.s       ft9, ft8, ft4
                  fmv.w.x      fs2, s4
                  fcvt.w.s     a7, fs10
                  flt.s        t1, ft8, fa3
                  addi         zero, t0, 218
                  rem          s1, t4, t3
                  feq.s        t5, ft6, fs11
                  fadd.s       fs6, ft8, ft10, rtz
                  fsgnjn.s     ft5, fs3, fa6
                  rem          s3, t4, t0
                  fsub.s       fs9, fs9, ft3
                  addi         s9, s1, -745
                  srai         s11, a7, 21
                  fcvt.wu.s    a1, fs3, rmm
                  fcvt.s.wu    fs1, s8, rup
                  sll          s4, s5, t3
                  and          a3, a3, t5
                  fsgnj.s      fs8, fa5, fs0
                  mulhu        zero, t0, s0
                  srli         s0, gp, 0
                  lui          a5, 359313
                  fcvt.wu.s    t4, fs10
                  slli         t5, s8, 15
                  fcvt.s.wu    ft9, a1, rup
                  ori          s9, zero, -309
                  slti         t4, a1, 1315
                  sltiu        s10, s11, 766
                  fmv.w.x      ft4, a0
                  xori         t4, a1, -1811
                  fsgnj.s      fs6, fs7, fs8
                  fsgnjn.s     fa4, ft8, ft10
                  andi         t4, sp, 1971
                  srl          sp, s3, a0
                  fcvt.s.wu    ft7, a2
                  add          t1, s4, s0
                  fcvt.s.w     fs1, a2
                  nop
                  mulhu        s11, t2, a0
                  andi         tp, tp, -684
                  xor          s4, t4, a1
                  mulhsu       zero, s3, s9
                  sll          t4, zero, s10
                  mulhu        a5, a7, s0
                  fmul.s       fs10, ft6, fs8
                  div          s4, a6, t6
                  fsub.s       ft10, ft7, fs0
                  andi         s1, s8, -1290
                  slli         a6, a7, 16
                  fcvt.s.w     fa3, s10
                  mul          s5, t0, ra
                  fsub.s       fa7, fa5, fs7, rne
                  fsgnj.s      fa0, fa0, fa6
                  flt.s        t1, fa4, ft2
                  fdiv.s       ft4, ft5, fs9, rmm
                  and          s7, s3, s5
                  slt          a6, s7, t5
                  mul          s8, zero, s9
                  fsgnjx.s     fs4, fs7, fa6
                  xori         s3, t4, -1211
                  mul          s11, t5, s0
                  fmul.s       fa4, fs8, ft4, rne
                  slt          a5, t2, t3
                  addi         a7, t4, -1575
                  andi         s0, a7, -1304
                  sltiu        zero, tp, 481
                  sltiu        a5, s3, -839
                  fsgnjx.s     fs5, fa4, ft2
                  fsgnj.s      fs6, ft4, fs11
                  addi         t2, a0, -160
                  fmv.x.w      t5, fs8
                  fdiv.s       fa6, ft8, fs8
                  nop
                  auipc        a7, 843513
                  and          s3, ra, a6
                  mulh         zero, s11, t2
                  or           s8, a0, a1
                  rem          s4, a7, s5
                  mul          a3, s6, s5
                  srli         a1, s8, 9
                  xor          s4, s1, a3
                  fcvt.s.wu    ft5, t1
                  slt          t0, s7, s6
                  fsub.s       fs7, fs0, fs9
                  srl          t2, t5, a6
                  fadd.s       ft4, fs4, fs0, rmm
                  mulh         t0, gp, t5
                  slli         s10, tp, 23
                  sll          t3, zero, s3
                  addi         s7, t1, 463
                  xori         ra, t5, 684
                  nop
                  fmv.x.w      s8, ft4
                  add          sp, s2, t4
                  fcvt.w.s     ra, fa7, rdn
                  fclass.s     s9, ft5
                  andi         t0, s2, -374
                  add          s6, t6, t2
                  fle.s        s9, ft4, fs6
                  fclass.s     s1, fs5
                  sra          t1, s9, sp
                  andi         t2, gp, -1490
                  nop
                  srl          t2, s2, tp
                  xori         s7, s8, -1906
                  fcvt.s.w     fs6, sp
                  sltiu        zero, s7, -1049
                  fclass.s     s0, fs11
                  mulh         s9, s0, a1
                  fcvt.wu.s    t2, ft10, rmm
                  fsgnjx.s     ft5, fa3, ft7
                  sll          s0, ra, a5
                  or           s10, t1, a4
                  fcvt.s.w     ft8, s4
                  fadd.s       fs7, fs4, ft6
                  fcvt.s.wu    ft3, a5, rup
                  fmax.s       fs10, fs0, fa1
                  or           t4, ra, ra
                  fsqrt.s      fs9, fs4
                  fadd.s       fs10, fs8, ft2, rtz
                  sra          ra, s3, s2
                  remu         a2, a7, a3
                  slli         s6, a0, 11
                  fsqrt.s      fa2, fs10
                  srai         s10, s4, 29
                  slli         zero, t0, 24
                  mul          s5, sp, t4
                  fmul.s       ft7, fa7, ft10, rup
                  sra          t3, t5, ra
                  fle.s        t1, ft11, fs9
                  slt          zero, s9, s11
                  and          a1, s2, s6
                  sltiu        s10, t1, -1439
                  andi         s4, t0, -1270
                  ori          t4, zero, 1563
                  flt.s        a3, ft2, fs6
                  sub          a5, t2, a3
                  fle.s        t5, ft6, fs2
                  mulhu        sp, a7, a7
                  ori          s5, t4, 1555
                  fcvt.wu.s    s6, fs0, rdn
                  slti         s2, a5, 1134
                  fclass.s     s1, ft0
                  fmin.s       fs10, fa4, fa5
                  fadd.s       fs2, fa3, fa4, rdn
                  fadd.s       ft2, fa0, fs5, rtz
                  mulhu        s7, t5, s10
                  flt.s        s7, ft8, fs6
                  sltu         zero, zero, a3
                  fsub.s       fs4, fa4, fa3
                  add          a6, sp, s8
                  mul          s8, s5, a5
                  mulhu        t3, t2, s5
                  rem          s5, t0, s1
                  fadd.s       ft2, fs1, ft2, rmm
                  mulhsu       s8, zero, a4
                  fle.s        s3, fa4, fa3
                  or           s7, s10, a0
                  andi         t5, s4, -681
                  fmax.s       fs1, ft1, fa7
                  fadd.s       fs2, fa7, ft2
                  mul          gp, s11, gp
                  xori         a2, ra, 637
                  and          t4, t0, tp
                  or           gp, s4, t3
                  addi         s9, s11, 1957
                  fsgnjn.s     ft1, fa2, ft3
                  fclass.s     sp, ft0
                  sltu         a1, a0, s5
                  fdiv.s       fs2, ft2, ft2
                  rem          s1, s8, a2
                  fsub.s       ft10, ft4, fs7
                  mulh         a6, tp, s1
                  fsub.s       ft2, fs8, fa5
                  fdiv.s       ft2, fs11, fs2, rtz
                  sra          s10, s3, s3
                  fmax.s       ft3, fs4, ft6
                  srl          gp, a5, s11
                  and          s5, a2, zero
                  mul          s6, gp, t0
                  fcvt.s.wu    ft1, ra
                  fsub.s       fs0, fs4, fs10, rup
                  fsgnjn.s     fs3, fa3, fs4
                  xori         ra, tp, -84
                  mulh         t2, a3, s1
                  fsqrt.s      fs11, fs11, rne
                  slt          ra, t0, s11
                  sltu         s5, t0, t2
                  rem          s9, zero, gp
                  sltiu        s4, a1, 269
                  ori          gp, a2, 16
                  fmin.s       ft5, ft3, fa3
                  sll          a6, t4, sp
                  mulh         s9, a1, a5
                  sra          a1, s5, s1
                  mulhsu       s9, a2, s9
                  mulh         s4, s1, a0
                  fdiv.s       fa5, fs7, fa0
                  xori         a7, s2, 250
                  srai         t1, a3, 6
                  fdiv.s       ft4, ft8, fs7, rne
                  ori          a3, zero, 1059
                  fmv.x.w      gp, fa0
                  fmul.s       fa3, ft3, fs1, rne
                  fmax.s       fs8, fa3, fs9
                  srai         s9, ra, 3
                  fmv.w.x      ft11, a5
                  fmv.w.x      fa2, tp
                  sltu         s4, a7, a6
                  fmul.s       ft6, ft5, fs1
                  mulhu        s3, s6, s7
                  slti         t4, s0, -1389
                  div          sp, sp, a0
                  mulh         tp, s0, t6
                  sra          s6, a2, s3
                  sltu         gp, a6, t4
                  mul          t4, ra, t0
                  fmax.s       ft2, fs5, fs6
                  remu         s9, t0, s6
                  fmax.s       ft3, fs0, fa7
                  fle.s        a5, ft7, fa1
                  sll          s1, t0, s0
                  xor          t0, a7, a7
                  fcvt.w.s     s7, fa3, rmm
                  remu         t0, a5, s9
                  sra          s7, t0, s7
                  ori          t4, s0, -1136
                  srai         t1, a5, 13
                  addi         s9, zero, -152
                  sltiu        s0, s10, 1221
                  mul          t2, s1, a6
                  fcvt.s.w     fs8, s7
                  srl          s7, s11, a7
                  sra          t2, sp, a7
                  mulhsu       s4, s10, t5
                  slt          t3, sp, s6
                  sltiu        s7, a4, 1008
                  fclass.s     t5, ft4
                  sra          ra, s8, tp
                  feq.s        a2, fs10, ft0
                  divu         s8, s5, a2
                  slti         t1, t6, -2026
                  lui          s9, 276974
                  sll          s1, a5, t3
                  srl          a1, s3, s3
                  fmin.s       fa0, fs6, fs10
                  div          a6, sp, t3
                  andi         a1, s6, 235
                  fsub.s       fa2, fa0, fs1
                  fsqrt.s      ft10, ft11, rup
                  fclass.s     s8, fa0
                  mulhsu       t0, a3, a4
                  fmin.s       fa0, ft9, fs4
                  fmv.w.x      fs0, s8
                  mulhsu       a5, a4, a6
                  mulhu        gp, t3, a0
                  add          s1, a3, a4
                  sll          tp, s9, zero
                  lui          gp, 468092
                  mul          s0, t3, zero
                  fmul.s       ft9, fs10, ft3
                  mulh         gp, tp, t1
                  fcvt.s.wu    fa7, s1, rtz
                  rem          a2, s4, s4
                  slli         t2, a7, 5
                  sra          s2, s3, s7
                  rem          a6, s9, s3
                  sub          s11, s4, a3
                  fsgnjn.s     fa5, ft3, fa7
                  divu         a1, a5, a1
                  xor          s6, s3, t2
                  slti         s7, s7, -1115
                  fcvt.s.wu    fs3, s5, rmm
                  feq.s        s5, ft3, fa3
                  or           t0, s7, s2
                  srli         t0, t2, 28
                  xori         s11, s3, 1543
                  rem          a5, a1, a3
                  nop
                  fcvt.s.wu    ft2, s6
                  flt.s        s9, fa1, fs6
                  fsgnjx.s     fs5, ft5, fa2
                  divu         s10, a4, s9
                  add          a6, ra, a5
                  fsgnjn.s     fa6, fa2, fs2
                  sll          s1, a4, s0
                  slli         s7, t1, 30
                  or           a5, t4, s8
                  sra          s5, sp, t2
                  mulh         s9, s0, ra
                  fmv.x.w      s4, ft11
                  fcvt.w.s     t4, ft2
                  sub          a1, s10, a2
                  fadd.s       fa5, fs0, fs1, rup
                  srli         t1, s7, 12
                  slli         tp, a4, 20
                  andi         t2, t6, -1549
                  sltiu        s8, tp, -1013
                  mulhsu       s2, zero, s5
                  nop
                  fdiv.s       fs8, ft10, fs11, rmm
                  rem          tp, s1, t5
                  add          tp, s11, tp
                  fsgnj.s      fs1, fa4, ft0
                  addi         s0, a3, 270
                  sra          t4, a0, s11
                  fmax.s       fa4, ft11, fs0
                  fsub.s       fs1, fs7, ft11
                  slli         a7, gp, 5
                  slli         a7, s2, 5
                  flt.s        s1, fs11, fs11
                  fcvt.w.s     s4, fa2, rne
                  fcvt.wu.s    a2, ft2, rne
                  sra          a3, a7, s9
                  mul          s1, t6, a7
                  sll          s3, s8, s5
                  fclass.s     t5, fs3
                  fcvt.w.s     zero, ft5
                  divu         sp, t4, tp
                  nop
                  slti         s0, s0, -1785
                  and          tp, s10, a7
                  flt.s        s2, ft10, fs10
                  mulh         a7, a5, s6
                  div          zero, t0, a3
                  sra          s0, t5, s11
                  fmv.x.w      s10, fs4
                  srai         a1, t2, 24
                  fdiv.s       ft10, ft2, fs5
                  sltiu        a3, zero, -426
                  ori          ra, a4, -462
                  and          gp, sp, a4
                  slti         s10, s7, -811
                  lui          s6, 647830
                  srli         s11, s10, 20
                  srli         s5, s11, 13
                  fcvt.wu.s    sp, fs3
                  remu         t0, a4, t1
                  srli         zero, t2, 29
                  fle.s        t2, fs0, fs7
                  sll          a1, s3, sp
                  fsgnjn.s     fa1, ft2, fs6
                  mulhu        t3, ra, t5
                  add          s10, sp, s10
                  fsqrt.s      ft2, fa5
                  xor          zero, a0, t5
                  or           zero, t4, a1
                  auipc        t1, 343060
                  or           s4, a1, a6
                  sltiu        s5, s3, 560
                  remu         s11, s1, a4
                  or           tp, a2, s11
                  mulhu        a5, a0, s10
                  fcvt.s.wu    ft8, a6
                  auipc        t0, 984772
                  fdiv.s       ft10, fa3, fa3, rup
                  rem          t1, s7, a0
                  fadd.s       fs6, fa5, fa4, rne
                  fcvt.s.wu    ft4, a5, rup
                  fmul.s       ft3, fs1, fs6
                  flt.s        t5, fs3, fa5
                  slti         s8, s2, -1880
                  mulhu        t2, a5, t0
                  rem          s8, s8, s3
                  fmv.w.x      fa2, t3
                  slt          s3, a5, a3
                  fsqrt.s      fs11, fa7
                  srai         gp, s8, 7
                  sltu         t4, t2, t4
                  mulh         s5, s9, s6
                  fdiv.s       fa0, fs4, fa7
                  ori          t1, sp, -328
                  xori         a5, s3, 1674
                  srai         a5, s10, 8
                  fdiv.s       ft5, fa2, ft3, rup
                  ori          s8, s10, 828
                  sra          a5, a3, t0
                  fcvt.wu.s    a2, fa7, rdn
                  fmv.w.x      ft4, s4
                  fcvt.s.w     ft2, tp
                  sltu         t0, s8, s6
                  lui          s0, 838492
                  slti         s5, a5, -618
                  fmax.s       fs1, fa2, ft1
                  mulhsu       s1, s3, ra
                  fmv.w.x      fa2, s8
                  auipc        tp, 477441
                  rem          t1, t0, gp
                  and          t3, t5, a6
                  sub          s4, s4, t4
                  sltu         ra, s0, s1
                  fcvt.s.w     fa3, s8
                  div          a1, t2, tp
                  flt.s        tp, fa1, fa7
                  fadd.s       fa4, fs9, fs1
                  srl          s4, s4, t1
                  lui          ra, 1025091
                  fsgnj.s      fs0, ft5, ft6
                  mulhsu       s2, t1, t0
                  srai         s4, s3, 9
                  sltiu        a1, ra, 1529
                  flt.s        s6, fs10, ft1
                  xori         tp, s7, 1721
                  fcvt.s.w     fs10, s0
                  sub          a3, s0, a6
                  or           t2, a2, s5
                  sll          zero, t5, s5
                  sra          a6, a0, t0
                  fmv.w.x      fa1, a2
                  slli         s4, t1, 18
                  mul          s9, t6, t0
                  slli         s0, t1, 25
                  andi         t5, ra, 1174
                  fle.s        s11, ft3, fa0
                  fclass.s     a5, ft4
                  fmv.w.x      fs4, a2
                  fsgnjx.s     ft10, ft10, fs2
                  fmax.s       ft3, fs2, ft10
                  fmv.w.x      ft1, s11
                  addi         s8, s10, -599
                  sra          s11, a4, t1
                  mulhsu       s5, t1, t3
                  mulh         a1, t5, gp
                  srl          s2, s8, sp
                  ori          a1, a7, -1942
                  sll          s11, t1, a6
                  ori          t5, tp, 1390
                  fcvt.s.w     ft10, s2, rdn
                  sub          tp, s0, a0
                  nop
                  fmax.s       ft2, fs9, ft5
                  slli         t5, t0, 26
                  div          a7, a7, s10
                  addi         s7, gp, -936
                  fmin.s       fa2, fa4, fa7
                  lui          s2, 726484
                  srli         s9, a0, 2
                  andi         t4, s5, 2040
                  mulhu        t1, s3, t3
                  addi         t5, a2, 1426
                  ori          s9, s6, -238
                  fadd.s       ft9, fa3, fs0
                  fsqrt.s      fa7, fs3
                  lui          tp, 580423
                  fsqrt.s      fs6, fs11, rup
                  mulh         s6, a6, t1
                  fsgnjn.s     fa2, ft11, fs7
                  mul          s7, a5, s9
                  fmin.s       fa5, ft1, ft1
                  fmin.s       ft11, fa4, fa7
                  ori          s10, s6, -1446
                  fcvt.wu.s    gp, ft11, rmm
                  fcvt.wu.s    gp, fs11
                  fmin.s       fs6, fa4, fa2
                  auipc        s4, 555841
                  mulhu        ra, t2, s11
                  or           zero, sp, s8
                  remu         s1, t3, s10
                  nop
                  fmax.s       fa2, fa0, ft4
                  fsgnjx.s     ft8, fs4, fa6
                  fsgnjx.s     fs6, fa6, ft10
                  div          t2, zero, sp
                  and          zero, t3, t5
                  sltiu        ra, a3, 1151
                  fclass.s     gp, fa3
                  div          s6, zero, s10
                  fmv.x.w      s0, ft2
                  feq.s        s3, fs4, fs7
                  sltu         zero, ra, t2
                  addi         a1, t6, -1860
                  fmv.w.x      ft8, a1
                  fsgnjx.s     fs9, ft0, fa2
                  srl          t1, s4, ra
                  sltu         sp, t1, s11
                  slt          t2, t4, zero
                  div          a6, ra, s7
                  slt          t5, s7, s11
                  mulhsu       sp, s4, a2
                  addi         s9, t1, 680
                  sltu         s4, a2, a5
                  slli         t0, t1, 8
                  mulhu        zero, s11, s7
                  and          t0, a6, a0
                  fmv.x.w      s7, fs8
                  fle.s        s11, fs6, ft10
                  fcvt.s.w     fs7, sp, rdn
                  sub          s5, s10, tp
                  mulhsu       s9, s6, a7
                  feq.s        a5, fs10, fa2
                  mulhu        s11, s5, sp
                  addi         a2, t6, -902
                  fmin.s       fa0, ft10, ft8
                  fclass.s     sp, fs6
                  feq.s        s11, fs7, fa7
                  fcvt.w.s     t1, fs0
                  fmul.s       ft0, fa3, fs7, rne
                  and          t2, a1, a0
                  srl          t3, zero, s6
                  fclass.s     s10, ft4
                  fsub.s       ft5, fs0, fa4
                  flt.s        s8, fs2, ft6
                  fmul.s       fs9, fa0, ft6, rmm
                  mulhu        t5, zero, t2
                  lui          t4, 772614
                  fle.s        s4, ft7, fa4
                  add          s2, a2, t3
                  sltu         sp, t0, s5
                  sltiu        sp, a1, -1742
                  fmin.s       fa5, ft5, fs5
                  fmul.s       ft2, ft3, fs11, rdn
                  divu         s0, t4, s4
                  flt.s        s7, fa4, fs10
                  fmax.s       ft10, ft11, fa0
                  mulh         t2, t4, s4
                  sltiu        s3, s1, 540
                  div          a3, ra, a5
                  fadd.s       fs5, fs7, ft7
                  flt.s        s3, fa7, fa4
                  fle.s        s4, ft10, ft3
                  divu         a7, s6, a4
                  fcvt.s.wu    ft1, t2
                  fsgnj.s      ft5, ft8, fa6
                  fmv.w.x      fa0, zero
                  xor          gp, s6, s7
                  and          s8, t3, s10
                  andi         a3, s4, -481
                  srl          t1, a5, t6
                  mulhu        gp, s1, t3
                  mulhsu       s6, a0, sp
                  slli         s2, s4, 30
                  addi         s9, s3, -1870
                  or           s3, s4, t5
                  slt          tp, s1, a1
                  rem          sp, s4, a4
                  fmul.s       fs2, fa7, fa2, rtz
                  fdiv.s       ft7, fs5, fs8
                  mul          a7, ra, t3
                  slli         s10, s7, 31
                  fmv.w.x      ft6, s1
                  slt          s1, s7, s5
                  fsub.s       fs1, ft4, fs7
                  mulhu        a3, s1, s5
                  or           a3, a1, s4
                  fmv.w.x      ft5, t2
                  nop
                  sltiu        a3, ra, 1312
                  addi         ra, s10, -1803
                  srai         t3, s9, 13
                  fmax.s       fs8, ft6, fs1
                  lui          s7, 437906
                  flt.s        s2, ft7, ft10
                  mul          s5, s0, t2
                  fmv.x.w      t2, fs4
                  fcvt.w.s     s7, fa6, rne
                  sll          s11, t3, a0
                  divu         zero, a4, a5
                  xor          t1, a6, t4
                  andi         s3, a5, 1043
                  slli         s0, a2, 12
                  nop
                  sll          s7, s11, gp
                  add          a1, t4, t6
                  slli         s5, t6, 5
                  slt          tp, t2, t2
                  xor          a1, t4, s0
                  fcvt.s.wu    ft4, s5
                  fcvt.wu.s    s1, fs1
                  divu         s3, s9, t3
                  fclass.s     zero, fs3
                  mul          gp, s0, tp
                  fsgnjx.s     ft1, ft2, fs4
                  or           t0, s6, t3
                  srl          s3, s11, s5
                  fsub.s       fs2, ft4, fa7, rup
                  divu         t3, s6, ra
                  srli         t3, s7, 19
                  mul          a2, s5, s10
                  addi         s10, a6, -1884
                  fcvt.s.wu    fa6, s3
                  div          t5, t2, t3
                  rem          s7, s9, tp
                  slti         s9, s9, -467
                  mul          ra, a3, s7
                  sub          a3, s1, s5
                  fsqrt.s      ft1, fs8
                  sltu         s6, t3, gp
                  fle.s        zero, fa3, ft6
                  fmul.s       fs5, fs4, fa6
                  xor          s9, s3, t4
                  divu         gp, a0, s7
                  addi         s3, a2, -1592
                  fsqrt.s      fs3, ft2, rtz
                  fsgnjn.s     fa4, fa3, fs3
                  fsqrt.s      fs10, fs10, rmm
                  fsqrt.s      fs7, ft7, rtz
                  xori         t0, t6, 798
                  remu         s11, a7, t0
                  fcvt.s.w     fs2, s4, rup
                  lui          a5, 422687
                  fcvt.s.w     fa6, s8, rdn
                  xor          a6, t3, tp
                  fmax.s       fs7, fa6, fs3
                  mul          t2, s2, t2
                  fclass.s     s0, fa0
                  mulh         gp, a7, zero
                  fmax.s       fa5, fs1, ft9
                  sra          s9, gp, s8
                  fcvt.s.w     ft11, t4
                  srai         s2, s9, 27
                  fmv.x.w      a3, fs0
                  div          sp, a4, s11
                  feq.s        a1, ft1, ft8
                  feq.s        s4, ft3, fa2
                  fle.s        sp, fs2, ft5
                  addi         s9, t1, -687
                  fle.s        a7, fa5, fs5
                  fsqrt.s      fa6, fs4, rdn
                  fmv.x.w      s6, fs10
                  fmv.w.x      fa2, t5
                  andi         a1, gp, -1512
                  fmin.s       fs4, fa3, ft5
                  fsub.s       fs3, ft6, fa2
                  fdiv.s       fa7, fs0, ft2
                  flt.s        s10, fa6, ft10
                  mulhu        s2, t1, s0
                  fsub.s       fs6, ft11, ft11, rtz
                  fle.s        a7, fs5, ft11
                  xor          s9, t4, gp
                  auipc        s4, 900273
                  srl          s7, sp, tp
                  xor          tp, a5, a4
                  srai         s7, s7, 17
                  fcvt.s.wu    ft5, a0
                  slti         t1, t4, 1394
                  srai         tp, t5, 12
                  fsqrt.s      fs9, fs7, rdn
                  andi         s0, gp, -1393
                  div          a6, a7, s0
                  fcvt.wu.s    t1, ft3
                  addi         s8, s6, 1171
                  fsgnjx.s     ft4, fs11, fa0
                  andi         a7, a3, -514
                  lui          a2, 887807
                  fmax.s       fa0, fa7, fa6
                  fsgnjx.s     fa0, fs9, fa0
                  add          a6, s5, s7
                  and          ra, s4, a3
                  sra          s2, sp, t6
                  fsgnjx.s     ft3, ft4, fa4
                  sra          a5, zero, s11
                  andi         s3, s5, 20
                  addi         s8, t2, 1614
                  slli         tp, t0, 20
                  feq.s        s11, ft2, ft10
                  fle.s        t4, ft6, fs4
                  fmv.w.x      ft10, t0
                  fsgnj.s      ft11, ft11, ft6
                  rem          s8, t6, s3
                  slt          s3, s10, a0
                  fadd.s       ft5, fa7, ft3
                  fmv.x.w      a2, fa2
                  fcvt.w.s     a1, fs5
                  divu         a1, s5, s4
                  div          s10, t3, s5
                  fle.s        tp, fs7, fs2
                  fcvt.s.w     ft4, s6, rne
                  srli         s0, t3, 31
                  remu         s11, s2, t2
                  lui          a1, 772833
                  fcvt.s.w     fs1, a4
                  fsgnj.s      fa6, fa7, ft5
                  sll          zero, s6, t1
                  mul          s11, t4, t4
                  fcvt.w.s     s4, fa0
                  fsub.s       ft2, fa3, fa2
                  fmv.x.w      zero, ft6
                  nop
                  sltu         s5, s2, t1
                  srli         s5, t4, 31
                  fsgnjx.s     fs9, ft1, fs5
                  auipc        s4, 723034
                  fclass.s     s4, fa2
                  div          s6, s0, gp
                  nop
                  rem          a7, a7, t1
                  feq.s        a2, fs3, fa3
                  sub          t0, a4, s8
                  fcvt.s.w     fs11, a3, rdn
                  fmax.s       fa5, ft7, fa6
                  ori          t4, s9, 770
                  add          s8, a7, zero
                  fcvt.s.w     ft2, s10
                  sub          t2, s10, s0
                  xor          a3, s11, s8
                  fsub.s       ft2, fa4, ft8
                  srl          t4, s4, a5
                  fmin.s       fs6, ft0, fa2
                  and          s4, a6, s9
                  fdiv.s       ft7, fs7, ft11
                  fcvt.s.wu    fs2, a1, rup
                  fmax.s       fs8, ft10, fs5
                  sltu         a5, s5, s7
                  fcvt.wu.s    s2, fa3, rmm
                  auipc        s4, 554848
                  fcvt.w.s     a5, ft9
                  lui          tp, 505566
                  fle.s        s10, fa5, fs9
                  fmin.s       fs1, fa3, fs8
                  lui          a5, 207151
                  srli         a7, s4, 27
                  fmv.w.x      fa4, a0
                  fsub.s       fa2, fs2, fs6, rdn
                  fmul.s       ft7, fs8, fa4, rne
                  feq.s        s5, fs4, fs9
                  mulhsu       gp, gp, sp
                  slt          s5, a4, s11
                  remu         s8, t3, s6
                  srli         t1, s10, 29
                  sltu         s0, s2, t6
                  fmv.w.x      ft10, s11
                  fmin.s       fs0, ft7, ft8
                  fsub.s       ft8, ft3, fs7, rne
                  auipc        s10, 20311
                  fmv.w.x      ft1, a5
                  fclass.s     a2, fs3
                  mulhsu       a3, a5, t2
                  fsqrt.s      fs1, fs3
                  fmv.w.x      fs2, s6
                  feq.s        s0, fs4, fs4
                  or           s11, t1, s3
                  fdiv.s       fs11, ft9, fa7, rmm
                  nop
                  fmul.s       fs8, fa0, fa4, rmm
                  fsgnjn.s     fs9, ft9, ft9
                  sltu         a5, ra, s7
                  mul          t2, s3, a1
                  fsgnjn.s     fa0, fa6, fs2
                  and          s5, a6, t6
                  remu         t1, s7, t0
                  or           zero, s10, s4
                  fsgnjn.s     fs0, fs6, fs1
                  fmv.w.x      ft9, t6
                  addi         t2, a1, 1419
                  addi         a7, a4, 1009
                  or           zero, s5, s7
                  fmin.s       fs10, fs3, ft8
                  xori         t3, gp, 962
                  fmv.x.w      s11, fa0
                  fcvt.wu.s    s11, fs6, rdn
                  fcvt.w.s     t5, ft10, rdn
                  andi         t0, sp, -103
                  sll          a1, a1, a0
                  srai         t5, s7, 0
                  and          s5, s2, a7
                  nop
                  sltu         t0, s8, s0
                  fmin.s       fa2, fs5, ft11
                  fadd.s       fs10, fa1, fs9, rup
                  feq.s        a3, fs10, ft8
                  fdiv.s       fa3, fa0, ft8
                  remu         gp, t3, a1
                  fcvt.s.wu    fa1, t4, rup
                  fcvt.w.s     s10, ft3, rmm
                  fmv.x.w      s7, fs9
                  xori         s1, t2, -1865
                  fcvt.wu.s    s8, ft8, rup
                  div          t4, s6, t4
                  fclass.s     s0, fs5
                  fcvt.wu.s    sp, ft4, rmm
                  mulhsu       a1, s0, s11
                  srl          sp, t3, t4
                  srl          t4, a7, s11
                  sra          s7, s0, t2
                  rem          gp, s1, t5
                  fmv.x.w      t0, fa5
                  fsub.s       ft5, ft8, fs1
                  or           s5, s4, a6
                  xori         a2, t1, 93
                  fle.s        t2, ft6, fa4
                  fsub.s       ft0, fs5, fs0
                  fcvt.s.w     fs0, s4
                  lui          t2, 588021
                  remu         t0, s8, s3
                  slt          t2, a5, s7
                  fadd.s       ft6, ft10, fs11
                  fclass.s     s0, ft0
                  fmv.x.w      s11, fs8
                  fclass.s     a2, ft1
                  lui          gp, 422438
                  slli         gp, s8, 13
                  andi         t1, t3, -56
                  fmv.x.w      s3, ft5
                  fmv.x.w      s11, fs10
                  slt          s0, a3, sp
                  srai         s1, s4, 29
                  remu         sp, ra, t1
                  addi         a2, a4, -604
                  add          s3, t1, a1
                  fmul.s       ft1, fs6, fs5, rdn
                  fdiv.s       ft8, ft10, ft5, rdn
                  auipc        s2, 44209
                  xor          a1, zero, s0
                  sub          gp, t3, zero
                  remu         s10, a3, a4
                  feq.s        a1, fs9, ft9
                  fcvt.s.wu    fs7, s6, rtz
                  sll          a6, a6, t5
                  mulhsu       s6, s3, s7
                  fsgnjx.s     ft1, fa5, ft7
                  fadd.s       fs3, fs1, ft7, rtz
                  xori         sp, a6, 1393
                  and          a6, s3, a6
                  fsgnjn.s     fa0, ft11, fs3
                  fcvt.s.w     ft10, tp
                  srai         t4, s4, 3
                  div          a3, s10, zero
                  nop
                  nop
                  fsqrt.s      fa6, fs2, rne
                  or           ra, t0, s2
                  fle.s        s9, fs6, ft2
                  mul          s10, t5, t1
                  srl          s8, s11, gp
                  fmin.s       ft10, fs5, fs3
                  fmin.s       fs2, fs0, fs9
                  fmax.s       ft10, ft2, fa0
                  srl          ra, a2, t3
                  fmv.w.x      fa5, t6
                  divu         t5, a7, a7
                  fsqrt.s      fa0, ft4
                  fle.s        s0, ft8, fs4
                  fcvt.s.w     fs3, t1, rup
                  or           s6, s11, t4
                  mulhsu       zero, t3, s4
                  fmax.s       ft0, fs6, fa7
                  fsgnjx.s     fa3, ft4, fs8
                  fcvt.w.s     t2, fa3
                  divu         t4, t3, t2
                  fcvt.w.s     s5, fa4
                  lui          t2, 999693
                  ori          t5, s3, 1136
                  fcvt.s.w     fa7, t5
                  xori         s4, s11, -125
                  flt.s        a5, fa1, ft5
                  mul          a6, s2, s3
                  auipc        gp, 682329
                  addi         ra, s5, -1124
                  fsub.s       ft7, ft3, ft6
                  fsgnjn.s     ft5, ft8, ft3
                  sll          s11, s3, a5
                  feq.s        s7, fs2, fs8
                  fmax.s       fa3, ft1, ft0
                  nop
                  mulh         a7, s9, a1
                  srl          t5, t5, s8
                  fmul.s       ft7, fa0, ft5
                  fadd.s       ft2, fa1, fa0
                  mul          a7, t0, t6
                  fmv.x.w      t2, fs1
                  fdiv.s       fs5, ft5, ft8, rtz
                  fmv.w.x      ft1, t3
                  add          a5, s5, s11
                  feq.s        a1, fs5, fa5
                  srai         gp, a6, 10
                  srl          sp, a2, s6
                  auipc        a6, 941052
                  srl          gp, t6, sp
                  and          s9, t5, s6
                  fle.s        s1, fs1, fs9
                  feq.s        gp, fs0, ft7
                  fsqrt.s      fa4, ft10
                  fsgnj.s      fs2, ft5, fs11
                  divu         a1, t1, ra
                  andi         a7, a1, -1223
                  nop
                  fdiv.s       ft8, fa7, ft0
                  mulh         s6, s4, a6
                  fmul.s       fs5, fs2, ft10
                  srai         s6, ra, 27
                  srli         s3, s11, 0
                  sra          s1, s6, s2
                  fsgnj.s      fs8, ft8, ft4
                  fsgnjn.s     ft0, fs9, fa0
                  fmv.x.w      s11, fs3
                  nop
                  fcvt.w.s     zero, ft10
                  fadd.s       fa5, fs9, ft11
                  fsgnj.s      fa1, fs8, fs11
                  fsub.s       ft9, fs1, fs5, rup
                  fcvt.s.w     fs3, a2
                  fcvt.s.w     fa4, tp, rdn
                  ori          ra, tp, 1004
                  xor          s6, s0, a2
                  mulhu        t2, a6, s5
                  xori         s8, s10, 901
                  xor          s8, s9, s3
                  lui          zero, 982528
                  mulh         a2, a4, a5
                  nop
                  mulh         t4, a4, a5
                  sll          zero, t2, t1
                  sll          s10, gp, a3
                  slli         t0, s3, 5
                  xor          s6, a0, ra
                  ori          t1, sp, 69
                  fdiv.s       ft1, fs2, fa1
                  div          s9, s6, a2
                  sltu         a6, a2, s1
                  fcvt.w.s     s6, fs8, rup
                  fadd.s       fs2, fa6, fs5
                  fle.s        sp, fa5, fs4
                  srl          s8, a4, s4
                  xor          gp, s5, a4
                  mulhsu       t2, s9, s9
                  srl          s8, t1, t5
                  fcvt.w.s     sp, ft6, rtz
                  fclass.s     t5, fs10
                  andi         a3, s1, 1780
                  divu         s2, a4, a1
                  xori         tp, t1, -710
                  sltu         t4, s5, t2
                  srli         s5, s7, 31
                  fcvt.s.w     ft9, a6
                  fsgnj.s      ft10, ft9, ft8
                  feq.s        s10, fa4, fs6
                  fcvt.wu.s    ra, ft6
                  remu         t5, t4, s2
                  fcvt.s.wu    ft2, s6, rne
                  fsqrt.s      ft1, ft6, rtz
                  or           s4, ra, s10
                  div          t0, t4, s8
                  lui          s2, 721306
                  fle.s        a5, ft11, fs2
                  fadd.s       ft7, ft10, ft7
                  auipc        sp, 660510
                  remu         s11, s11, t3
                  fsgnjx.s     ft2, fa2, fs3
                  addi         a1, s1, -1833
                  srai         s5, s10, 0
                  mulhsu       a5, s10, t5
                  or           s9, t0, a7
                  sra          s5, a5, a1
                  srl          s7, s11, t6
                  fmul.s       fa2, fs2, ft10
                  slli         s5, s10, 10
                  sra          s2, a7, s10
                  mulh         sp, a5, a7
                  rem          zero, a0, s2
                  fdiv.s       ft2, ft10, fs0
                  fsgnjx.s     ft8, fs8, fs6
                  fsub.s       ft3, fs8, ft8, rmm
                  flt.s        s1, fs9, ft5
                  xor          zero, t0, a2
                  mulhsu       t3, zero, s0
                  fmin.s       ft0, fs5, fa5
                  fadd.s       ft7, fs10, ft1
                  feq.s        s0, ft10, fs0
                  ori          s1, s6, -519
                  sll          s3, t1, s6
                  or           s9, a2, a7
                  sra          tp, s2, tp
                  or           s11, t3, a1
                  add          gp, s6, sp
                  divu         t4, ra, t1
                  fmul.s       ft3, fs8, fs1, rmm
                  srl          s4, gp, t0
                  fsgnj.s      ft7, ft4, ft7
                  rem          s7, s7, a3
                  addi         tp, s7, 826
                  fsgnj.s      fa6, ft4, ft2
                  fcvt.s.wu    ft7, s3
                  sll          s2, zero, a1
                  xor          a3, a0, a1
                  or           a6, t4, s6
                  mulh         s10, s4, a3
                  fsgnj.s      ft7, fs5, ft10
                  addi         ra, tp, -53
                  fdiv.s       ft3, fa3, fa6
                  div          s1, zero, t6
                  feq.s        s6, fs8, ft0
                  slli         s3, a1, 7
                  fle.s        a5, ft10, fs11
                  fcvt.s.w     fs8, s5, rtz
                  auipc        s0, 813305
                  mulhu        a7, zero, t3
                  add          s2, a5, a5
                  feq.s        t5, fs2, fs7
                  flt.s        s3, fa4, fs4
                  divu         t0, s11, a6
                  flt.s        s0, ft1, fs0
                  fcvt.wu.s    s5, ft6
                  andi         s0, a1, -569
                  srl          ra, s3, s4
                  mulh         a3, a0, s3
                  auipc        s0, 272987
                  mulhsu       s3, s11, a1
                  flt.s        s7, fa3, fa7
                  fsqrt.s      fs2, fs6, rtz
                  mulh         s8, t1, a6
                  fmv.x.w      a1, ft11
                  auipc        s1, 511470
                  fle.s        t5, ft4, fa6
                  fsqrt.s      ft9, ft4
                  slli         zero, s5, 4
                  fmax.s       ft9, fs7, ft10
                  fcvt.wu.s    gp, ft7, rmm
                  remu         a2, tp, a0
                  sltiu        s1, gp, 1952
                  sltiu        s2, gp, -633
                  sub          s4, zero, gp
                  auipc        s5, 679040
                  mulhsu       gp, zero, a5
                  fcvt.s.wu    fs4, s7
                  xori         a7, t4, -1727
                  mul          t4, tp, s0
                  fcvt.wu.s    tp, ft9, rmm
                  slti         s0, s5, 876
                  fcvt.s.w     fa1, tp
                  xori         t4, t5, -457
                  fsub.s       fs0, ft2, fs11
                  andi         a1, t6, 1854
                  mulh         t0, s6, s10
                  mulhsu       s7, a0, s0
                  mulh         t2, t4, a4
                  divu         zero, s11, s9
                  fmv.x.w      a6, fs8
                  slt          t2, tp, t0
                  slt          a7, a6, a5
                  fmv.w.x      fs0, tp
                  ori          gp, t6, -2
                  nop
                  srli         s8, s0, 24
                  xor          t4, s11, a0
                  fsgnj.s      fs0, fa5, ft11
                  nop
                  fsqrt.s      ft7, fs1, rdn
                  fmv.x.w      s11, fa2
                  mulhsu       a6, a2, s9
                  sltiu        t0, s8, -1007
                  fdiv.s       ft5, ft7, ft2
                  slli         s4, t3, 2
                  mul          t0, t6, s11
                  addi         a7, t4, 816
                  remu         s10, s11, a0
                  fcvt.s.wu    fa0, a0
                  fmax.s       fa2, fs6, ft6
                  andi         a3, a4, -13
                  fmv.w.x      fs3, s1
                  remu         zero, s3, s11
                  xori         a5, zero, -485
                  sltiu        s6, a1, 1504
                  sll          t2, s1, s9
                  xori         a7, s3, 940
                  sltiu        s5, a0, 1118
                  fcvt.w.s     a2, ft1
                  div          t1, ra, zero
                  fsqrt.s      fs11, fs10, rmm
                  divu         t3, s10, t5
                  slli         a5, s1, 2
                  add          s9, tp, s2
                  flt.s        s3, fa3, ft10
                  auipc        t0, 407787
                  andi         s4, zero, 926
                  fsgnjx.s     fs5, fs7, fs6
                  fle.s        s4, fs2, fa6
                  fdiv.s       fs9, fa2, ft4, rtz
                  feq.s        a3, fa4, fs3
                  nop
                  fle.s        t2, fs2, fs8
                  sltiu        s4, t6, 1401
                  srl          a1, a7, t4
                  nop
                  fmul.s       fs3, fa1, ft5
                  fcvt.s.w     fs0, s5, rmm
                  srai         a5, s0, 2
                  mulh         s4, s9, s7
                  remu         t5, s5, s11
                  or           s10, s8, t6
                  add          s11, a0, a7
                  slti         s6, gp, 535
                  and          t5, s10, s3
                  mulhsu       t2, a5, a1
                  sll          a1, s9, a0
                  fmv.x.w      a2, ft11
                  addi         a6, a7, -218
                  fmv.x.w      s9, ft11
                  fsgnj.s      fs4, fs11, fs11
                  or           t2, sp, s1
                  fsub.s       fs7, fs8, ft10
                  fsub.s       ft8, ft1, fa5
                  slli         s7, a1, 3
                  lui          s7, 355764
                  srl          s0, a6, s6
                  lui          s4, 53348
                  srai         s5, s5, 20
                  fle.s        s2, fs6, ft6
                  sltu         s5, s0, sp
                  add          s5, a0, s11
                  mulhu        a7, t2, s4
                  ori          s5, s4, -877
                  feq.s        s3, ft3, fs5
                  fcvt.w.s     a2, ft3
                  mulhsu       gp, s9, a7
                  mulhu        a5, s4, t1
                  addi         t3, gp, 38
                  or           t3, t6, s10
                  fsgnjx.s     ft5, ft1, ft6
                  fcvt.wu.s    s10, fa6
                  feq.s        sp, fa1, fs7
                  srl          tp, ra, s9
                  fsub.s       fa0, fa4, fs1
                  addi         t3, s3, 2018
                  div          a2, a2, a7
                  rem          s7, s6, tp
                  add          a3, s1, s4
                  slt          a7, a7, ra
                  xori         s3, s2, -313
                  srai         t2, s1, 12
                  mulhu        s9, s3, zero
                  slti         s3, a1, 1652
                  slli         s9, s1, 19
                  sltiu        s5, s7, -439
                  rem          a3, t6, s2
                  and          a6, tp, a1
                  mulhu        t0, ra, a3
                  fmul.s       fa2, fa2, fs6, rup
                  div          s6, ra, s2
                  fsgnj.s      fa4, fa3, ft7
                  fmv.w.x      ft10, s11
                  mulh         t1, s1, ra
                  addi         s8, sp, -1608
                  fcvt.s.w     ft6, s8
                  fmax.s       fs0, fs8, fs9
                  sltu         s8, t2, tp
                  slt          zero, t3, a6
                  slti         t5, t4, 1574
                  flt.s        s6, fa1, fs4
                  fclass.s     ra, ft2
                  ori          s8, s4, -1287
                  srl          s1, s0, a0
                  mulhsu       s6, gp, tp
                  fadd.s       ft8, fa3, ft3
                  auipc        s7, 942217
                  add          s1, ra, ra
                  mulhu        tp, s6, gp
                  srli         t0, a4, 1
                  fclass.s     zero, fs7
                  rem          ra, s10, a7
                  sltu         sp, s4, zero
                  feq.s        s8, fs10, ft0
                  fclass.s     s4, fa2
                  remu         s3, t0, s7
                  fcvt.wu.s    a3, fs10
                  mulhsu       a5, a2, s4
                  mul          gp, a4, s9
                  fsgnjx.s     fs11, ft5, fs3
                  mulhsu       s6, s7, s10
                  sltiu        s1, t3, 1776
                  fcvt.wu.s    s0, ft7, rmm
                  sub          a2, s11, s2
                  fsgnj.s      fs3, ft1, ft5
                  fsgnj.s      ft4, ft6, ft9
                  fmv.w.x      fs11, a3
                  sltu         t1, s10, a5
                  addi         t1, s11, -1005
                  fmul.s       ft10, fs10, ft8
                  slt          a1, t1, s3
                  fmv.w.x      fs2, sp
                  sub          s11, s9, a1
                  fsgnj.s      ft9, ft3, ft9
                  fcvt.s.w     ft4, a7, rmm
                  addi         a1, gp, -149
                  addi         zero, t2, -321
                  remu         sp, gp, t5
                  fmul.s       fs5, ft5, fs10, rne
                  sltu         s7, sp, a1
                  or           a2, gp, a4
                  fsgnjn.s     fs10, ft7, fs6
                  flt.s        t5, fs10, fa3
                  sub          s6, t4, t6
                  or           a1, ra, a6
                  div          s11, gp, a7
                  fle.s        t5, fs4, fs10
                  srai         s1, t0, 13
                  fsub.s       ft5, fa0, fs3, rdn
                  fsqrt.s      fs0, ft7
                  sltiu        ra, a1, -1830
                  sll          s7, t2, s1
                  mul          s11, a1, tp
                  fclass.s     a1, fs5
                  fle.s        t5, ft2, fa6
                  sltu         s10, s8, t5
                  fclass.s     t1, fs11
                  or           t4, t3, t1
                  rem          gp, s4, a2
                  xori         s6, s0, 1465
                  sltiu        s6, a7, 332
                  fmax.s       fs11, fa3, fa1
                  andi         t0, s9, 1543
                  srli         a5, s7, 11
                  addi         s8, a1, -1013
                  fdiv.s       fa0, ft10, fs0, rup
                  slti         a6, a1, -871
                  addi         s7, s1, -1680
                  sub          s6, a7, t4
                  or           a6, t3, s9
                  fcvt.s.w     fa5, s9
                  fcvt.w.s     s2, fs10
                  remu         s5, t5, s1
                  fcvt.s.wu    fs1, ra, rtz
                  addi         s4, t3, 1979
                  nop
                  auipc        s10, 555289
                  fsgnjn.s     ft10, fs10, fa4
                  sub          s8, s0, s9
                  sltu         s7, s3, a7
                  ori          a3, a3, -771
                  fmv.x.w      sp, ft3
                  sll          s4, a2, s5
                  fmv.x.w      s6, fa1
                  fadd.s       fa3, fa1, fs8, rtz
                  fsqrt.s      fa1, fa5, rtz
                  mulhu        s0, a0, a5
                  fle.s        s2, ft4, fa3
                  fmv.w.x      ft9, s3
                  mulhsu       sp, s2, gp
                  fmin.s       ft8, fa3, ft2
                  slt          s9, s8, s5
                  srl          s4, a2, tp
                  lui          zero, 728008
                  fcvt.s.wu    ft7, a3, rdn
                  xor          a1, s8, s7
                  addi         a1, a7, -1709
                  fcvt.wu.s    t5, fs1
                  sltu         s7, zero, t4
                  feq.s        a1, ft5, fa7
                  slti         a3, s6, -1532
                  fsqrt.s      fa7, fa6, rmm
                  fcvt.w.s     s1, ft3
                  remu         t4, s4, s9
                  fcvt.s.w     fa4, a7, rmm
                  mulhsu       sp, a1, s9
                  fmv.w.x      ft7, s3
                  fsqrt.s      ft11, fa0
                  slt          tp, s11, s6
                  fmax.s       fa7, ft9, fa6
                  fcvt.s.w     ft3, a7
                  rem          a6, gp, a4
                  fsub.s       fa4, ft2, ft9, rup
                  fsub.s       ft8, fs3, fa5, rup
                  slt          t4, gp, t5
                  slt          a3, s1, tp
                  mul          s5, t5, t1
                  addi         a2, a1, 1552
                  remu         t5, t4, t3
                  divu         sp, s2, a6
                  slli         t0, t0, 8
                  div          s11, a6, a6
                  fcvt.wu.s    t4, fs0
                  fmul.s       fa0, ft2, fs1, rup
                  fcvt.w.s     zero, fs0, rne
                  sll          sp, t0, t4
                  fcvt.wu.s    a3, fa1, rup
                  fclass.s     a2, ft1
                  rem          s5, ra, a3
                  ori          zero, sp, 1862
                  addi         s2, s3, -1011
                  add          s10, tp, gp
                  add          s2, s8, s3
                  fle.s        s8, ft3, ft6
                  nop
                  slt          t0, s10, a7
                  mulhu        s1, s6, t0
                  sltiu        s1, a0, 1660
                  sltiu        s0, a4, 384
                  fmv.x.w      a2, fs2
                  xor          a6, a6, s1
                  fdiv.s       ft0, fs4, fs8
                  sra          zero, sp, a4
                  mulhu        t3, s11, s3
                  sub          s2, t6, s8
                  srai         t5, zero, 10
                  fadd.s       fs8, ft0, ft0, rne
                  slli         t5, a6, 26
                  ori          s6, gp, -857
                  nop
                  slti         t0, s1, 1819
                  fsgnj.s      fa3, ft5, fs7
                  mul          a5, a1, zero
                  fcvt.wu.s    zero, ft6
                  or           s2, s3, t3
                  xori         a2, t5, -543
                  mulh         t4, t3, a5
                  addi         s8, t2, -59
                  fmv.x.w      s8, fs5
                  fsub.s       ft0, ft8, fa3
                  fsgnj.s      ft5, fa2, ft7
                  divu         s10, s5, s2
                  fmv.w.x      fs8, gp
                  fmul.s       ft8, ft8, fs7
                  mul          sp, a5, s10
                  srai         sp, a0, 10
                  fmax.s       fs1, fs7, fa6
                  add          s6, a5, t3
                  fclass.s     s8, ft3
                  andi         s1, a5, 1513
                  fmul.s       fs5, fs9, fs4, rup
                  slt          t1, t1, s6
                  fmv.x.w      ra, ft0
                  rem          a5, t1, s11
                  sub          s3, a1, sp
                  fsgnj.s      fa0, fs5, fs2
                  sra          tp, a1, s3
                  fmin.s       ft11, fs3, fs1
                  fmax.s       ft0, fs8, ft9
                  xor          s1, a2, s11
                  fsgnj.s      fs4, fa1, fa0
                  fcvt.s.wu    fa2, t6, rne
                  addi         tp, a5, -1987
                  srl          s8, t6, zero
                  fdiv.s       ft4, ft4, fa2
                  mulhsu       a5, t3, s0
                  fsqrt.s      fa0, fs11, rup
                  fadd.s       ft6, fs9, fa0, rmm
                  fsgnjn.s     ft3, fs11, ft7
                  div          s5, s5, sp
                  srl          s3, a5, a5
                  sltu         a7, t3, s10
                  mulhu        t1, a7, t3
                  fmax.s       fs5, fa5, fa6
                  slti         a1, s7, -1886
                  slli         t1, t6, 24
                  feq.s        t3, fs6, fa0
                  mulhu        s4, s7, t4
                  feq.s        a1, fs10, fa7
                  fmv.w.x      fa1, s7
                  fmul.s       fs7, ft4, fs1, rdn
                  sll          ra, s6, s8
                  fclass.s     s11, fs8
                  fcvt.w.s     s8, ft2
                  slt          gp, a6, tp
                  mul          t4, s9, t2
                  srli         sp, a4, 17
                  mulh         s0, a7, tp
                  slti         sp, s5, 434
                  fmv.x.w      t5, ft10
                  ori          t2, t2, -767
                  mul          s6, a1, ra
                  fmv.w.x      ft5, sp
                  fmax.s       fa5, ft0, fs0
                  mul          t5, s2, t5
                  fsub.s       ft7, fs4, fa5
                  nop
                  mulh         t3, s4, s8
                  sltiu        a1, a5, -1389
                  fsub.s       fa6, ft1, ft4
                  fmv.w.x      fs9, s5
                  lui          s9, 278656
                  fcvt.s.wu    fs9, s1, rne
                  addi         a7, s8, 883
                  fadd.s       ft0, fs4, fs9, rdn
                  fcvt.wu.s    a3, ft11, rdn
                  mulhsu       zero, s10, a3
                  auipc        t3, 889572
                  addi         a6, t0, 1198
                  sub          s5, t2, a4
                  rem          t1, s0, t0
                  divu         a1, ra, sp
                  fmul.s       ft0, fa6, fs11, rdn
                  slti         t4, s0, -1922
                  fmin.s       ft3, ft7, ft7
                  feq.s        t2, fs5, ft5
                  sub          s3, a7, s0
                  slt          a5, tp, a0
                  fmul.s       ft11, ft6, fs3, rmm
                  and          t4, a0, s9
                  sll          gp, t0, t4
                  sll          t1, s11, s1
                  andi         sp, gp, 1062
                  xori         a7, s10, 1427
                  flt.s        t2, fs9, ft8
                  xori         s10, s4, -841
                  xori         zero, a5, 1996
                  lui          s2, 435707
                  xori         s2, t6, 1090
                  sltiu        s8, s7, 712
                  lui          s1, 658904
                  or           t1, a1, a5
                  auipc        a7, 948898
                  remu         a5, a3, tp
                  rem          ra, a6, s8
                  fmv.w.x      fs7, t1
                  rem          a5, s6, s5
                  mulhsu       a2, gp, s0
                  fmv.x.w      s6, fa3
                  auipc        s5, 764603
                  fcvt.s.w     fs4, a5
                  fcvt.s.wu    fs11, t3, rup
                  remu         s0, s9, s0
                  fcvt.w.s     a5, fs6, rmm
                  sub          sp, s1, s1
                  addi         t2, a5, 839
                  slti         tp, a7, -686
                  remu         a5, s9, s5
                  fmv.w.x      fs7, a7
                  fsgnj.s      fa5, fs9, ft10
                  fmv.x.w      a7, fa3
                  rem          t5, s10, a7
                  sll          a5, t4, s9
                  slli         tp, s9, 12
                  fsgnjn.s     ft4, fs9, ft8
                  xor          t4, s4, a0
                  fmax.s       ft11, ft3, ft5
                  fsgnjx.s     fs10, fa4, fa7
                  ori          a7, s7, -902
                  feq.s        a2, fa1, ft10
                  div          zero, t1, s9
                  auipc        a7, 104369
                  sra          s11, s4, sp
                  fdiv.s       ft3, ft7, ft11, rdn
                  fcvt.s.w     fs8, t3
                  fcvt.wu.s    s3, fs3
                  sra          a7, s0, a6
                  fmin.s       ft0, ft10, ft5
                  flt.s        gp, ft10, fs10
                  sltu         t1, s2, a7
                  fadd.s       fs5, fs3, ft0
                  fadd.s       fa4, fs8, fa0, rne
                  feq.s        s3, ft10, fs1
                  fsgnj.s      ft8, fs8, ft10
                  sub          s8, s11, s0
                  div          s8, a0, ra
                  feq.s        t5, ft11, fs1
                  xori         ra, t1, -624
                  fcvt.s.w     fs2, s8
                  nop
                  fclass.s     s7, ft3
                  slli         ra, t2, 15
                  slt          t2, a3, s1
                  divu         a1, s1, s3
                  sltiu        s7, t4, 951
                  fcvt.wu.s    s4, fs7
                  fadd.s       ft1, fs9, ft5, rmm
                  fsgnj.s      ft7, fs2, ft0
                  fsgnjx.s     fa2, fs11, ft9
                  or           t4, s2, a2
                  xori         s9, a5, 671
                  sll          s3, s10, t0
                  fcvt.s.w     ft11, s8, rdn
                  fcvt.w.s     tp, ft5, rtz
                  xori         t2, s4, -134
                  fmv.x.w      s9, fa5
                  addi         s8, s11, -1415
                  fmv.w.x      fa4, t1
                  fmv.x.w      a5, ft6
                  divu         s11, t6, t6
                  fsqrt.s      ft6, ft7, rtz
                  fsgnj.s      ft2, fs1, fa0
                  sltiu        s9, s11, -1073
                  fsgnjx.s     ft5, fs0, ft5
                  add          s10, t0, a4
                  fmv.w.x      fa7, s9
                  xor          s5, gp, zero
                  feq.s        a1, ft2, fs3
                  sltiu        s4, zero, 712
                  slti         s5, s0, 1730
                  divu         gp, s5, t1
                  srli         zero, a5, 15
                  mulhu        tp, t1, s5
                  fmv.w.x      fa2, t3
                  fmv.x.w      a6, fa5
                  xor          s10, a2, s11
                  sub          s9, t4, gp
                  fmin.s       fa3, ft7, fs3
                  or           s5, s8, t1
                  fclass.s     s11, ft11
                  andi         s5, s6, 2013
                  xori         s7, s8, 506
                  divu         s5, t4, t2
                  fadd.s       fa5, fa3, fa0
                  fmul.s       ft1, fs1, ft10
                  fsgnj.s      ft0, fa7, ft1
                  xor          t5, s11, a6
                  or           a1, s9, t4
                  sub          tp, s2, a3
                  fsgnj.s      fs7, fa4, ft6
                  flt.s        s3, fs4, ft5
                  and          s0, s10, s9
                  fsub.s       fs1, ft1, fs3, rmm
                  sltu         a1, s4, t1
                  fcvt.s.w     fs10, s11, rdn
                  srl          ra, t0, t6
                  fcvt.s.wu    fs5, a5, rtz
                  fmv.w.x      ft7, a5
                  lui          a1, 82598
                  fmul.s       fa0, fs5, ft8, rne
                  sra          a2, a7, s7
                  sll          s8, a4, s8
                  fmv.w.x      ft2, gp
                  fcvt.s.wu    fa7, zero
                  srli         s8, a2, 13
                  sub          ra, s3, t2
                  or           sp, s4, t1
                  feq.s        ra, fa2, ft0
                  fclass.s     t4, fa7
                  andi         s5, a3, -825
                  nop
                  and          s3, t3, zero
                  feq.s        a6, ft4, ft10
                  fsgnjn.s     fs1, ft6, ft1
                  auipc        t2, 523340
                  fcvt.w.s     a7, ft10
                  feq.s        zero, fs10, fs1
                  fcvt.s.w     ft3, sp
                  slti         t4, a0, -1404
                  andi         a5, t5, 444
                  fcvt.s.w     fs6, s6, rne
                  fcvt.w.s     s5, fa4
                  sub          tp, t6, a5
                  addi         s5, a5, -806
                  or           sp, s0, a0
                  sra          t2, ra, s2
                  addi         a1, t4, 201
                  sub          a2, a6, s1
                  and          s3, a3, a7
                  srai         ra, s9, 0
                  sra          sp, t4, a2
                  slt          s2, t2, s8
                  xor          s9, sp, a5
                  srli         s2, a6, 7
                  mulhu        s6, s11, s3
                  fsgnj.s      ft5, ft10, ft6
                  fcvt.wu.s    s7, fs8, rdn
                  fsqrt.s      fs4, ft3
                  sltiu        sp, s2, 688
                  lui          s3, 284696
                  fdiv.s       ft8, ft8, fs4, rne
                  mul          a6, t2, s0
                  fcvt.wu.s    s6, fa5, rne
                  mulhu        s2, t2, tp
                  fsgnj.s      fs0, ft9, fs7
                  sltu         ra, tp, s4
                  lui          sp, 669872
                  flt.s        tp, fs8, fs1
                  slti         sp, t3, -1386
                  fmax.s       fs11, ft4, ft6
                  ori          a7, t2, -590
                  and          a6, a6, t5
                  fdiv.s       ft7, ft9, fa3
                  fcvt.s.wu    ft2, t4, rtz
                  fsgnj.s      fa7, ft4, ft8
                  fcvt.w.s     s7, fa1, rmm
                  auipc        tp, 270887
                  fsqrt.s      fs9, fa1, rne
                  slti         sp, s3, -550
                  sra          t0, s0, s9
                  fle.s        t4, fa5, ft2
                  fclass.s     t1, ft0
                  slt          t1, a7, s0
                  slti         s9, a3, 30
                  fcvt.wu.s    sp, fs3
                  andi         s6, t2, -898
                  and          s2, t3, a2
                  srli         a2, s0, 21
                  mulhsu       t1, a1, sp
                  fmul.s       fa2, fs0, fa6, rdn
                  or           zero, t3, t3
                  fle.s        t2, fa5, fa5
                  srli         a6, t5, 10
                  mulhu        zero, t6, s5
                  fsgnjx.s     ft3, fs7, ft9
                  fadd.s       fs6, ft4, fs10, rdn
                  mul          t3, tp, t3
                  fsgnjx.s     fs5, ft10, ft3
                  sltu         a7, s4, s10
                  slti         t3, a0, 1622
                  add          t4, ra, s8
                  mulhu        a3, a2, s10
                  fcvt.s.wu    fs5, s6
                  rem          t2, a7, tp
                  auipc        sp, 359249
                  srli         s2, zero, 21
                  div          s0, t1, a0
                  slli         t5, s11, 25
                  fsgnjn.s     ft8, fs1, fa4
                  fsub.s       ft2, fs4, fs0
                  fmv.x.w      a5, fa6
                  mulhsu       t0, a7, gp
                  srl          tp, s0, a2
                  fmul.s       ft3, ft11, fs4, rne
                  auipc        s0, 778555
                  fcvt.w.s     s9, fs11
                  fcvt.wu.s    t2, ft3, rup
                  remu         s3, t6, a2
                  mulhsu       s3, t6, t5
                  rem          t1, t4, s11
                  flt.s        t3, fa0, fs10
                  fsgnjn.s     fs10, fs7, ft10
                  divu         t4, sp, a1
                  xor          tp, t4, s4
                  mulhsu       s8, gp, gp
                  sltu         t0, t4, s6
                  fcvt.s.wu    fa1, s9
                  flt.s        t5, ft0, fs11
                  lui          a1, 749231
                  sltu         ra, s0, s3
                  ori          s5, t3, 1786
                  fmv.w.x      fs5, s2
                  fclass.s     a3, fs0
                  fsgnjx.s     fs11, fa0, ft10
                  sub          s0, a2, s5
                  fmv.x.w      t2, fs6
                  fclass.s     t3, ft0
                  fcvt.s.w     ft5, s0, rdn
                  fadd.s       fa0, ft9, ft7
                  and          s6, s10, a1
                  slli         a6, s3, 18
                  divu         t5, t6, a1
                  xor          s2, s4, gp
                  fmin.s       fs0, ft0, fa5
                  feq.s        a2, fs4, fs4
                  addi         a7, s11, 981
                  nop
                  xor          s8, s0, ra
                  xor          s3, s3, a4
                  sub          gp, s5, ra
                  fmul.s       fa5, ft1, fs4, rdn
                  fmin.s       fs11, fa2, fa1
                  fcvt.w.s     sp, ft8
                  and          a6, s3, s2
                  fsub.s       fs6, ft9, ft7, rne
                  fcvt.wu.s    a1, ft8
                  fcvt.s.wu    fs0, t3
                  fsub.s       ft6, fa5, fs9, rtz
                  fsgnj.s      fs1, fa3, ft0
                  fmv.x.w      gp, fs3
                  flt.s        s9, fs8, fa4
                  slli         a5, a7, 17
                  sub          s6, s4, ra
                  auipc        a6, 104664
                  fcvt.w.s     t4, ft11
                  nop
                  xor          tp, gp, t3
                  divu         s10, tp, s0
                  feq.s        t5, ft5, fa4
                  fsgnjx.s     ft2, fs4, fs11
                  fle.s        t5, fs4, ft5
                  and          t3, a6, a2
                  mulhu        s4, gp, zero
                  fle.s        zero, fs2, ft1
                  slli         sp, a3, 6
                  fsqrt.s      fs1, fs4, rdn
                  fclass.s     a3, fa2
                  and          t5, t6, s5
                  fcvt.wu.s    ra, fs2, rne
                  rem          s10, s3, s2
                  fle.s        a5, fa6, fs2
                  sra          s10, a4, tp
                  slli         a1, sp, 23
                  nop
                  mul          t5, a0, t3
                  slti         a5, a4, -1607
                  srl          sp, s3, t3
                  xor          zero, sp, s5
                  andi         s5, t5, 582
                  srli         t2, ra, 22
                  fcvt.w.s     t5, fa4
                  nop
                  feq.s        a2, fs10, fa1
                  fmul.s       ft3, fa4, ft9, rne
                  sll          s3, s2, s2
                  fcvt.s.w     fs1, t2, rne
                  fmax.s       ft5, ft1, fa7
                  nop
                  fadd.s       fa0, fa7, ft5
                  fle.s        s8, fa3, ft4
                  or           ra, s10, t2
                  slli         t5, t5, 26
                  mulhsu       a7, s0, sp
                  srli         sp, s8, 18
                  flt.s        a2, ft1, ft4
                  mulh         t4, s11, a6
                  andi         a6, s11, 211
                  ori          t2, s6, 172
                  rem          a5, a3, s2
                  fcvt.s.wu    fs5, s0, rdn
                  slt          s9, s11, s0
                  srli         a3, t5, 12
                  fclass.s     s0, fa6
                  sub          t2, a0, t4
                  remu         ra, gp, t2
                  lui          t4, 543603
                  fsqrt.s      fa6, ft8, rtz
                  ori          s10, a1, -85
                  or           t2, s9, s3
                  sub          s7, t2, sp
                  fcvt.s.wu    fs4, s8
                  xori         t2, s1, -1573
                  fdiv.s       ft5, ft4, ft10
                  fcvt.s.w     ft6, a7
                  auipc        t3, 863909
                  fdiv.s       fs8, fa7, ft4, rmm
                  fsgnj.s      fs4, fs10, fs0
                  sltiu        s3, s1, 549
                  ori          s10, a4, 1339
                  xori         a6, a1, -1661
                  add          t5, t0, s11
                  add          s7, sp, t2
                  fclass.s     t1, ft5
                  xor          t2, s7, sp
                  fsub.s       ft3, fa7, fa4, rtz
                  fmin.s       fs1, ft4, fs4
                  fmul.s       fa0, fs7, ft8, rtz
                  lui          s8, 638099
                  nop
                  fmv.w.x      fs1, zero
                  fcvt.wu.s    t2, fs6, rtz
                  fsub.s       fa7, ft2, ft4, rmm
                  andi         a2, a6, -680
                  sra          a5, s7, a7
                  fsgnjn.s     fs2, fa6, fa3
                  fsgnj.s      fs6, ft6, fs2
                  fsgnj.s      ft0, fa6, fs4
                  add          s2, t5, s0
                  fle.s        a6, ft10, fs10
                  fcvt.wu.s    a6, fs7
                  mul          a6, s0, zero
                  fmv.w.x      ft0, s4
                  fcvt.s.wu    ft8, s1, rup
                  fdiv.s       fa3, fs11, fs6, rne
                  fsqrt.s      fa5, ft8
                  feq.s        zero, ft10, ft11
                  mul          t0, a6, zero
                  divu         t5, a5, a1
                  fsgnjn.s     fa1, fs10, fa6
                  slti         s3, s6, 366
                  fcvt.w.s     a3, fs3, rdn
                  xori         a5, s6, 1378
                  srl          tp, t2, s10
                  auipc        s3, 913194
                  fmul.s       fs0, ft4, ft2
                  fclass.s     s8, fs2
                  fclass.s     s11, ft0
                  andi         t1, s8, 730
                  fsub.s       fa7, ft8, fs3, rup
                  fsgnjx.s     fa5, fs2, fs4
                  divu         a3, s5, s2
                  fmin.s       fs3, ft0, fs3
                  mulh         s7, t0, gp
                  div          s6, s8, s11
                  rem          a7, s1, a2
                  fmin.s       ft11, fa1, ft1
                  rem          tp, s0, ra
                  fcvt.s.wu    fs6, ra
                  xori         tp, t0, -615
                  fmul.s       ft4, ft11, fs1
                  divu         tp, t0, a3
                  and          tp, s4, s6
                  flt.s        s9, fa7, ft8
                  rem          a7, a1, tp
                  fmin.s       fs5, ft10, fa7
                  sra          sp, zero, a0
                  and          t0, a6, ra
                  sub          zero, s2, sp
                  mulhu        s8, s10, t5
                  fmax.s       fa5, fs7, fa4
                  fcvt.s.w     ft7, a5, rdn
                  mul          t2, t4, a6
                  fsub.s       fs7, fa6, fs5
                  xori         s5, a7, 657
                  divu         t3, s11, s11
                  fdiv.s       fa4, ft5, fs7
                  fle.s        a7, fs5, ft7
                  fclass.s     t0, fa4
                  andi         t5, s9, -1849
                  fsub.s       fs5, fa7, fa6, rup
                  slli         tp, t5, 1
                  srli         a6, t0, 12
                  sltu         t3, t5, s1
                  fsgnj.s      ft4, fs10, fa1
                  addi         t4, gp, -1530
                  fsub.s       fa1, fs2, fs6
                  fle.s        a2, ft7, fa4
                  sub          t1, a4, s3
                  flt.s        s2, ft2, ft1
                  xori         t5, t5, 1985
                  fclass.s     s3, ft5
                  mulh         s1, t5, t6
                  sub          s8, zero, a7
                  slti         tp, ra, 1375
                  add          t5, s0, t1
                  fsgnjn.s     fa2, fs10, fs0
                  andi         tp, s3, 299
                  fle.s        tp, fa4, fs5
                  slli         s5, a7, 1
                  mul          t5, s5, ra
                  xor          t4, t2, a5
                  srai         s6, zero, 2
                  feq.s        a5, fa6, fs11
                  ori          t3, ra, -1653
                  sltu         t5, t0, s10
                  feq.s        s8, fa5, fs11
                  fclass.s     a6, fs10
                  fcvt.s.wu    ft4, t2
                  sub          sp, s4, t2
                  srl          a2, ra, s3
                  sltiu        s11, a3, 1224
                  fmax.s       fa0, fa4, fs5
                  mulh         s6, s4, a2
                  rem          t2, t3, s1
                  fcvt.w.s     t5, ft6, rtz
                  fmin.s       ft1, ft9, ft6
                  mul          s9, tp, s1
                  mulhu        s2, s2, s8
                  fcvt.s.w     ft3, s3, rne
                  mulhsu       a7, t1, tp
                  mulhu        a6, gp, s8
                  fle.s        s8, ft5, ft8
                  slli         a1, t1, 1
                  fcvt.wu.s    t2, fs0, rmm
                  srl          a7, a6, ra
                  sltiu        t3, t4, 745
                  fmv.x.w      s8, fa5
                  fadd.s       fs1, ft9, fs2, rup
                  fsqrt.s      fs10, fa7, rne
                  rem          t1, gp, s10
                  fle.s        gp, fs1, ft2
                  fcvt.s.w     ft5, zero, rmm
                  slt          s3, s10, s9
                  xor          ra, tp, s11
                  or           a7, gp, zero
                  mulh         ra, sp, t3
                  sub          tp, a5, a2
                  sub          tp, gp, s11
                  sltiu        s7, a5, -1858
                  fcvt.s.w     ft5, a4
                  add          t1, s9, sp
                  and          a6, sp, zero
                  fsgnjx.s     fa2, ft11, fa1
                  lui          a1, 844271
                  and          s1, t1, zero
                  fmul.s       fs3, fa3, fs8
                  fsqrt.s      fa7, ft2
                  sub          s10, s3, a5
                  slli         s5, t2, 22
                  srli         t5, a3, 22
                  fcvt.s.wu    fs2, zero
                  fle.s        gp, ft4, ft2
                  sra          s8, t1, s10
                  mulhu        zero, t2, s6
                  fadd.s       fs5, fs5, fs11
                  or           t4, a0, a6
                  fle.s        s1, fa5, fs7
                  nop
                  auipc        s9, 463473
                  xor          s0, s2, s3
                  fsgnjn.s     fs5, ft11, fa2
                  fmv.x.w      a6, fa7
                  sra          s7, s7, s5
                  add          s6, tp, a5
                  fclass.s     a3, ft6
                  divu         a2, t2, s7
                  addi         gp, s3, 1810
                  mulhsu       s0, t3, t0
                  remu         t0, ra, t2
                  addi         gp, a4, -93
                  fsqrt.s      fs9, fa3
                  fsgnjn.s     ft8, ft2, fs2
                  sltu         a3, ra, s6
                  and          s10, s7, a6
                  mulhsu       s2, a1, a7
                  andi         t0, t0, 1622
                  fcvt.s.w     fs4, a4, rmm
                  xori         a6, ra, -116
                  and          s0, a0, a3
                  slt          s0, s10, a7
                  andi         s11, sp, 1711
                  mulhsu       s2, s8, t3
                  sub          s2, t5, s0
                  nop
                  fcvt.w.s     t0, fs7
                  addi         s11, gp, -578
                  andi         s8, s8, -1617
                  xor          a2, t2, ra
                  fmul.s       fs11, ft5, fa6
                  mulhsu       s6, t6, t3
                  sll          t0, s3, a0
                  sra          t3, ra, sp
                  fmv.x.w      t1, ft4
                  ori          tp, a3, -774
                  div          ra, t4, a6
                  fclass.s     tp, fs7
                  fcvt.w.s     s1, ft1
                  feq.s        ra, ft0, fs1
                  slti         t2, a0, -1113
                  fsqrt.s      fs11, fs10
                  sltu         tp, gp, tp
                  fsub.s       ft6, ft11, ft5
                  mulhu        s4, tp, a6
                  fle.s        zero, fs5, fs0
                  srli         ra, t3, 2
                  mulhsu       s6, s4, gp
                  feq.s        t2, ft1, fa2
                  andi         a1, zero, 593
                  add          s6, ra, a1
                  sltiu        t4, t3, -1610
                  feq.s        s6, fa7, fs3
                  add          t0, zero, gp
                  div          zero, s10, zero
                  ori          t0, s9, 986
                  fsgnj.s      fs5, fa1, fa3
                  mul          s5, t4, gp
                  fsgnjx.s     ft1, fs10, fa1
                  fcvt.s.w     ft8, a6
                  fcvt.wu.s    t5, fs2
                  fcvt.s.wu    fs0, t0, rup
                  fmul.s       ft1, fs10, ft0, rmm
                  lui          a3, 460667
                  fmin.s       fs3, ft2, fa6
                  fsqrt.s      fa7, fa2, rtz
                  fle.s        s2, ft11, ft10
                  fcvt.s.wu    fs5, a1, rtz
                  rem          s2, s5, a2
                  fsgnjn.s     fs2, fs4, fa6
                  fmul.s       ft10, ft1, ft3
                  nop
                  fmin.s       ft8, fs5, fs8
                  divu         a1, s1, zero
                  srai         s2, a1, 22
                  rem          t1, s5, t2
                  fle.s        a1, fs4, fa1
                  ori          ra, s9, -1216
                  auipc        t3, 430942
                  or           s6, s0, ra
                  fmax.s       fa7, fs7, fa4
                  srli         t1, a3, 4
                  fdiv.s       fs8, fs0, ft7
                  auipc        s5, 961266
                  lui          t5, 309482
                  remu         a5, s4, a2
                  srl          a3, s0, t6
                  fadd.s       fa4, ft8, fs8
                  sltu         s9, tp, a3
                  ori          s11, t2, -267
                  rem          a5, s5, t3
                  slli         t1, s5, 17
                  remu         t2, a4, a0
                  fcvt.w.s     s1, fa4, rtz
                  auipc        s0, 253215
                  auipc        gp, 276820
                  fsub.s       fs8, fs2, fa2, rdn
                  addi         t3, a7, -2038
                  lui          t5, 318916
                  sra          tp, a0, t1
                  rem          zero, t5, t0
                  fmv.x.w      s2, ft3
                  fcvt.wu.s    t3, fa5
                  auipc        s2, 355997
                  fmul.s       ft3, fa3, fs8, rne
                  divu         t0, s4, zero
                  fdiv.s       ft2, fa2, fs5
                  fsqrt.s      fs10, fa5, rne
                  fadd.s       fs3, fs11, ft3
                  slt          a3, sp, t1
                  feq.s        s11, ft9, ft3
                  sub          t2, a4, t5
                  sltiu        t5, tp, 918
                  rem          t4, s5, s8
                  fle.s        s7, fa4, fs3
                  auipc        s8, 962025
                  fmin.s       fa0, fa0, ft2
                  xor          gp, a3, s7
                  slt          ra, t2, zero
                  auipc        t0, 443731
                  divu         a3, t1, sp
                  fmax.s       fa5, fs3, fs6
                  sll          s9, t1, sp
                  fmul.s       fs3, fs10, fa3, rdn
                  mulh         s5, a4, t2
                  srl          t5, a4, ra
                  xori         s3, t6, 142
                  sltiu        gp, a0, -1400
                  fdiv.s       ft11, fs3, fa2
                  lui          t4, 981618
                  fmul.s       fs0, fa7, ft4
                  feq.s        a3, ft7, fa4
                  fmul.s       ft0, fa5, ft2
                  addi         s11, zero, -837
                  fsub.s       fa4, ft0, fs6
                  sra          s0, s7, tp
                  andi         a3, a4, 1022
                  addi         s5, gp, -1988
                  flt.s        s1, ft2, fa6
                  sll          t2, a2, sp
                  sltu         s4, tp, zero
                  fmax.s       ft9, fa4, fa6
                  addi         a2, s7, -369
                  addi         s4, t6, -1937
                  fmul.s       ft8, fa1, fa4, rne
                  slli         a2, gp, 3
                  fmul.s       ft7, fs7, ft10
                  sltiu        t4, ra, -1217
                  fclass.s     s5, ft8
                  fmv.w.x      fs2, s3
                  fsgnj.s      ft5, ft4, ft11
                  fcvt.w.s     s10, ft1
                  rem          s5, a6, a0
                  remu         a6, t0, tp
                  sub          s11, a1, a5
                  fclass.s     t4, fs4
                  fmv.x.w      t4, fa3
                  add          gp, s5, s9
                  slti         t1, t3, -1575
                  fmv.w.x      fs7, s11
                  fsgnjn.s     fs10, ft7, fa0
                  fclass.s     tp, fs4
                  xori         a2, a5, 1963
                  fmv.x.w      t5, fa7
                  fsgnjn.s     fa2, ft8, fa4
                  addi         t2, t2, -286
                  lui          tp, 838454
                  feq.s        ra, ft2, fa3
                  fsub.s       fa1, fs9, fs10
                  div          a1, a5, t3
                  slt          s9, tp, s3
                  feq.s        a6, ft11, fa7
                  fmin.s       fs10, fs10, fa4
                  nop
                  fdiv.s       ft0, fa2, ft5
                  add          t0, s2, sp
                  lui          s4, 779873
                  fclass.s     a7, ft8
                  fdiv.s       fa1, ft5, fa6
                  fmv.x.w      a3, fs7
                  div          s1, t0, s8
                  lui          a7, 1044544
                  rem          s10, t4, t6
                  fle.s        s4, fs8, fs5
                  fmv.w.x      fs10, s5
                  div          t4, zero, s8
                  fcvt.wu.s    s8, ft2
                  fsgnj.s      fs8, fs6, fs8
                  srai         s9, a7, 28
                  srai         t4, a7, 6
                  fmv.w.x      ft5, sp
                  fdiv.s       fa0, fa2, fa4, rtz
                  lui          a1, 672674
                  srli         a1, a1, 22
                  slli         zero, ra, 8
                  sra          a6, s8, a0
                  fadd.s       fs7, ft2, fs10, rmm
                  div          s8, s6, s0
                  or           t3, a1, t4
                  fsgnjn.s     fa0, fs1, ft7
                  and          ra, a1, tp
                  srli         zero, s4, 19
                  fsgnjx.s     ft9, ft3, fs9
                  lui          s11, 1113
                  fcvt.w.s     s10, fa3
                  fsgnj.s      fa1, ft6, ft5
                  fcvt.wu.s    s9, ft1, rup
                  fsgnj.s      fa1, fs6, fs2
                  fmin.s       fs1, fa0, fa7
                  fsgnjx.s     fa2, ft11, fs9
                  fclass.s     t1, fs10
                  rem          t2, t4, s0
                  sltu         s7, ra, a6
                  fclass.s     sp, fa6
                  lui          s6, 12782
                  div          gp, a7, s7
                  fsgnjx.s     fs2, fa0, ft4
                  fle.s        a1, fa6, fs4
                  addi         s4, a6, -1990
                  lui          s5, 23502
                  fmv.w.x      fs3, s4
                  fsgnjx.s     fa3, fa1, ft0
                  addi         t5, a1, 137
                  fmul.s       fs3, ft5, fa7
                  sra          ra, s8, gp
                  sltiu        zero, ra, -1236
                  fclass.s     a7, fa6
                  fcvt.s.wu    fs2, s7
                  sltiu        t1, s0, -241
                  andi         s1, s6, -24
                  lui          gp, 55661
                  mulhu        gp, t6, s6
                  mulh         s2, a7, gp
                  xor          s9, a3, s7
                  fadd.s       fs7, ft10, ft11, rmm
                  mul          a6, a4, s8
                  sra          a2, gp, s5
                  sltiu        s2, s3, 418
                  rem          s11, s6, s5
                  lui          tp, 43986
                  ori          sp, tp, 839
                  srl          s4, a2, tp
                  flt.s        s3, ft4, fs8
                  srl          t4, a2, a1
                  mul          s4, a2, s10
                  and          s0, zero, s0
                  srl          t4, t6, a4
                  fclass.s     ra, ft10
                  fcvt.s.w     ft2, s11
                  fsub.s       fs4, fs5, ft6
                  sra          a2, s0, s6
                  sltu         zero, a5, s9
                  fmv.x.w      a3, ft9
                  mulh         a3, s3, s9
                  fsgnjn.s     fs4, ft10, ft5
                  fmax.s       fa3, ft8, fs0
                  nop
                  fcvt.s.wu    fs9, t4, rup
                  srai         a2, tp, 21
                  fmax.s       ft3, fa4, fa7
                  srli         t4, s3, 25
                  srl          s8, a3, s10
                  mulhsu       t0, a3, a0
                  fcvt.s.w     ft8, a1
                  remu         tp, s7, s6
                  fsgnjn.s     ft11, fa0, fa1
                  fmv.w.x      ft3, zero
                  flt.s        t3, ft0, ft4
                  add          s6, a6, s8
                  fle.s        t2, ft4, ft1
                  fsgnjn.s     fs11, fs4, fa4
                  mulh         t0, a0, a0
                  auipc        a6, 712624
                  fadd.s       fs0, fa4, fa2, rtz
                  auipc        s0, 169407
                  sltiu        a2, t4, 1801
                  fcvt.s.wu    fs4, a3
                  fcvt.s.w     ft10, tp, rmm
                  fdiv.s       fs0, fs7, ft9, rup
                  xori         s8, t4, -1066
                  mulh         s1, ra, s5
                  sltu         s11, s9, a2
                  fclass.s     t2, ft3
                  fsgnjn.s     fa3, ft11, fs10
                  fmv.w.x      ft9, a5
                  xor          s5, a1, t1
                  lui          s8, 30420
                  ori          s9, s1, -1348
                  fmv.x.w      s9, ft7
                  divu         a5, ra, t3
                  ori          s10, s9, -1051
                  xori         t3, s9, -1628
                  fcvt.wu.s    a6, ft2
                  mulhu        t3, s6, s3
                  addi         s1, ra, -270
                  sll          t1, tp, t1
                  fmax.s       fs11, fa7, fs9
                  addi         s8, a6, 39
                  slli         a5, a2, 2
                  xor          t0, a0, t1
                  lui          s0, 185150
                  slt          s9, a1, gp
                  sub          s3, s8, s5
                  fsgnjn.s     ft6, ft1, ft0
                  sltiu        s1, t1, 173
                  fmul.s       ft7, ft8, ft6
                  fcvt.wu.s    s10, fa1
                  xori         a5, t1, 273
                  srai         a6, a5, 9
                  fsub.s       fa2, ft5, fa3, rtz
                  div          s1, a1, sp
                  feq.s        a2, ft7, fs7
                  fmin.s       fa4, ft2, fs2
                  xor          s4, a3, a6
                  sltu         t2, a4, s0
                  mulhsu       s10, s3, tp
                  xori         t5, s3, 1282
                  rem          s3, tp, t4
                  fmul.s       fs0, fa2, fa3
                  fcvt.wu.s    ra, ft5, rne
                  mulhsu       t0, s3, sp
                  slt          s3, s7, a0
                  srl          s3, s7, sp
                  sltiu        s0, ra, 551
                  divu         t1, a7, sp
                  slt          a2, gp, a0
                  auipc        zero, 638586
                  sltiu        zero, a1, -248
                  slt          a6, s7, s0
                  xori         s10, t5, 464
                  mulhsu       t5, t1, a7
                  fmul.s       fs2, fa3, fa5, rtz
                  fle.s        a3, fs5, ft7
                  fmul.s       fa5, fa4, fs2, rup
                  fsgnj.s      fs8, fs8, fs8
                  mulh         t1, a3, a3
                  andi         gp, s3, -1851
                  fcvt.w.s     s10, fa1, rne
                  fcvt.w.s     t2, fa5
                  srli         s3, s0, 11
                  mulhu        s1, t0, s3
                  sll          a3, t4, s0
                  fsub.s       ft4, ft5, fs6
                  sra          t0, a6, s0
                  ori          t5, tp, 668
                  and          t3, sp, t0
                  sra          s7, s7, s6
                  fmul.s       fa3, ft11, fs2
                  fsgnj.s      fs1, fs11, fs0
                  sll          s5, t1, s2
                  remu         s3, a3, s3
                  fcvt.s.wu    fs0, s7
                  slli         t3, s11, 1
                  mulhu        s10, s4, a4
                  slt          a5, a3, a7
                  sltu         t4, t4, a1
                  auipc        s4, 1016735
                  fmax.s       fa4, fa0, fs11
                  nop
                  add          s5, a4, s0
                  sltu         s4, s5, t3
                  fsqrt.s      fs1, fs6
                  fmv.w.x      fs7, s6
                  fdiv.s       fs3, ft4, fa2, rtz
                  mulhsu       s9, t6, sp
                  slti         sp, a7, -2010
                  xori         s9, a4, -260
                  feq.s        ra, fs9, ft1
                  fsgnjn.s     fa1, fs6, ft4
                  slt          a3, s5, t5
                  feq.s        zero, fs5, fs8
                  fcvt.s.wu    fa1, a2
                  rem          s8, a0, ra
                  fsqrt.s      fa4, fs1
                  feq.s        t3, ft7, ft6
                  fmul.s       fs9, fs1, fa1, rdn
                  remu         s9, s7, s6
                  andi         t0, zero, -683
                  slti         gp, s9, -425
                  mulh         t3, a2, t0
                  fcvt.s.w     fa4, s0, rdn
                  mul          ra, a4, a2
                  slt          s2, s4, ra
                  ori          s11, a4, 1821
                  flt.s        gp, fa0, ft2
                  slt          s3, s8, a1
                  fmul.s       fs6, fs9, ft0, rtz
                  fsgnjn.s     fs4, fa2, ft7
                  auipc        t2, 66799
                  addi         t1, s10, -88
                  flt.s        s1, fs6, fa2
                  mul          s3, t6, a6
                  sltiu        s3, sp, 943
                  sltiu        s0, s10, -1287
                  fsgnjx.s     ft9, ft7, ft0
                  srli         zero, zero, 16
                  fmv.x.w      s7, fa3
                  feq.s        t3, fs5, fa2
                  fsqrt.s      fs4, fs10
                  slti         s3, s9, -1727
                  add          s5, t1, s4
                  nop
                  sltiu        a6, s5, 853
                  fcvt.s.wu    ft0, s10, rne
                  fsqrt.s      fa5, fa6
                  fmin.s       ft3, fa4, ft9
                  srli         sp, a2, 4
                  div          tp, a5, t4
                  fsgnjx.s     fa0, ft11, ft3
                  fmv.w.x      fa0, s7
                  div          s0, t2, s5
                  and          tp, s4, a0
                  fsgnjx.s     ft6, fs9, ft3
                  andi         a3, s0, -297
                  auipc        s3, 151453
                  fsgnjx.s     fs7, ft11, ft5
                  fmv.x.w      s2, ft10
                  or           a7, s4, a2
                  add          a3, gp, zero
                  sra          s0, s0, s2
                  mulh         zero, a6, s7
                  remu         t3, s9, ra
                  fcvt.wu.s    s7, ft2, rmm
                  fcvt.wu.s    t0, fa4, rne
                  srai         a2, s7, 30
                  fmax.s       fs2, ft3, fa0
                  srl          s9, sp, a7
                  or           a7, s9, zero
                  fclass.s     gp, ft4
                  fsgnjx.s     fa5, fa3, fs2
                  flt.s        t1, fs11, fa0
                  slt          t2, s7, t0
                  fle.s        zero, ft6, fs10
                  fle.s        a3, fa6, ft1
                  andi         t2, s0, 1547
                  sltiu        s3, t3, -526
                  sltu         ra, s10, ra
                  fsqrt.s      fa4, fs1
                  fsqrt.s      fs10, fs1
                  fmul.s       ft4, fs6, ft3, rtz
                  sub          t4, a3, t3
                  srl          a5, a3, a0
                  add          s1, a0, t6
                  fsgnjn.s     ft5, fs5, fs11
                  slli         t1, s5, 27
                  lui          a2, 664700
                  ori          t5, a1, -829
                  remu         s1, s5, s2
                  fsub.s       ft6, fs9, ft3
                  slti         s11, s1, 786
                  fsgnjn.s     fs1, fs7, fs6
                  sltiu        s6, t5, -1892
                  fmin.s       ft7, ft5, fs10
                  ori          s0, gp, 1104
                  andi         a3, t5, 475
                  and          s4, s8, ra
                  sll          s10, a7, a2
                  fcvt.s.w     fs11, t6, rup
                  fcvt.w.s     gp, fs7
                  slti         a5, a5, -186
                  flt.s        s9, fs6, fa0
                  or           s8, t4, a0
                  xori         s6, a5, -569
                  fmv.x.w      t0, ft7
                  sltu         a7, s2, s4
                  fsgnjn.s     ft7, ft10, fa4
                  addi         gp, sp, 2037
                  nop
                  sltiu        zero, s2, -291
                  sub          a5, s11, a4
                  fmv.w.x      fs3, s3
                  sll          s11, s1, a3
                  lui          ra, 315641
                  sltiu        zero, s7, 2014
                  xori         a1, t6, -1186
                  flt.s        s10, fa6, fs2
                  srai         t1, a6, 22
                  fcvt.w.s     t3, fs8
                  auipc        t0, 662480
                  fcvt.s.w     fs9, a0, rne
                  fadd.s       fa2, fa3, fa6, rdn
                  fdiv.s       ft7, fa4, ft2, rup
                  slli         tp, a4, 21
                  fadd.s       fs10, fs2, fa0
                  addi         s2, t6, 2010
                  fmul.s       ft0, ft10, fa7
                  fsgnj.s      fs7, ft1, fa3
                  fcvt.s.wu    fs3, a6
                  slt          s11, s8, s0
                  fmin.s       fa6, fs5, fs2
                  fcvt.wu.s    s0, ft8
                  auipc        a1, 603924
                  divu         zero, s8, a6
                  mulh         a1, a2, t0
                  sltiu        a5, s4, -2013
                  fsgnjn.s     ft3, ft4, fs10
                  slli         s5, t0, 17
                  andi         gp, s10, 609
                  flt.s        s6, fa6, fs0
                  sltiu        a7, a0, -320
                  sub          t0, a1, tp
                  divu         s4, a1, t4
                  srl          s3, t3, t2
                  mulhsu       s2, s0, s9
                  fmax.s       fs5, fa1, ft3
                  andi         s7, s5, 446
                  slli         t5, s4, 8
                  fmax.s       ft8, ft6, fa6
                  mulhu        sp, a6, t0
                  or           s10, a1, a6
                  fcvt.s.wu    fa0, s0
                  or           s7, s2, s10
                  slli         s9, ra, 3
                  fclass.s     sp, fs4
                  addi         a2, s2, 946
                  lui          s0, 863610
                  andi         tp, gp, -377
                  fclass.s     s1, fa2
                  xori         s10, s2, 711
                  fcvt.s.w     ft0, a4, rdn
                  sll          s8, s7, t0
                  fle.s        a5, ft9, ft8
                  flt.s        s3, fa2, fa4
                  addi         t0, s10, 740
                  mulhsu       a1, tp, s8
                  fcvt.w.s     t1, ft5
                  add          t1, s11, tp
                  srai         s6, s6, 0
                  fcvt.s.w     fs4, s10
                  slti         t2, gp, -156
                  nop
                  mulhu        t5, a1, s11
                  lui          t5, 179901
                  addi         s10, a2, 187
                  auipc        ra, 583091
                  fdiv.s       fa7, fs2, ft2
                  fsqrt.s      fs5, ft5
                  mul          s10, a7, s9
                  rem          t1, a7, t2
                  fmul.s       ft4, fs2, fa7, rmm
                  xor          tp, t5, sp
                  slli         s1, t4, 18
                  andi         t1, a5, -542
                  fsgnj.s      fa7, fa7, fa7
                  fcvt.s.wu    ft11, s2
                  and          ra, a1, s7
                  fsub.s       fa3, fs10, fs2, rne
                  ori          a1, s0, 1710
                  fsgnjn.s     fs6, fs5, ft5
                  ori          a2, s7, 1903
                  sltiu        gp, s7, 1999
                  sltiu        t4, a0, -1996
                  add          t0, s0, t3
                  andi         a2, a6, -627
                  sub          s1, s8, t0
                  lui          a1, 623338
                  fsgnj.s      fa6, fs7, fs7
                  sltiu        t0, s8, 1845
                  fmv.x.w      s11, fs1
                  sra          s1, s8, s4
                  fmin.s       fs11, fs5, fs1
                  fadd.s       ft2, ft0, ft7
                  feq.s        s6, fa2, fs10
                  fclass.s     s7, ft4
                  divu         t5, t1, s8
                  ori          s6, t0, -1492
                  xor          s9, t2, t0
                  fle.s        a6, ft4, fs9
                  fmax.s       fa6, ft1, fs3
                  fsgnjx.s     ft8, fs0, fs7
                  mulh         sp, t5, s7
                  ori          tp, zero, -1791
                  andi         s8, t6, -1028
                  andi         a1, t2, -1639
                  fclass.s     s9, fs3
                  fmin.s       fs4, ft10, ft2
                  fmv.x.w      gp, fs4
                  fcvt.s.w     fa3, a4
                  and          a6, t0, ra
                  or           s4, t5, s0
                  sra          a2, a1, s10
                  addi         s5, a5, -116
                  srli         s1, t0, 1
                  xori         tp, s4, -712
                  fmul.s       ft5, fs4, ft2, rdn
                  fmv.x.w      gp, ft2
                  fcvt.wu.s    s11, fs8
                  fcvt.w.s     s0, fa5, rup
                  srl          t0, s11, a0
                  fmv.x.w      t0, fs7
                  fcvt.wu.s    a2, fa0
                  add          s10, t2, sp
                  slti         s5, a3, -1561
                  nop
                  fsub.s       fa7, fa5, ft2, rup
                  xor          a6, a0, s0
                  fcvt.wu.s    s9, ft10
                  mulhu        t1, t2, s6
                  rem          t5, gp, a7
                  div          a1, t5, a2
                  sra          a5, a1, a4
                  or           sp, s6, s8
                  fcvt.s.w     fs9, s8
                  xor          t5, s1, a1
                  fmv.x.w      t0, fs0
                  fle.s        t1, ft6, ft7
                  divu         a7, sp, s10
                  sra          t3, ra, t1
                  auipc        s8, 967701
                  sra          ra, t3, a5
                  mulhu        s7, sp, s5
                  fdiv.s       fa5, ft0, ft10, rdn
                  fcvt.s.wu    fs6, s4
                  remu         tp, s9, s9
                  fsqrt.s      fa2, fa3
                  sltiu        s1, a4, -109
                  fadd.s       fs10, ft7, ft11
                  srli         s1, t5, 5
                  fcvt.s.w     fs11, t3, rtz
                  srl          t5, t4, t6
                  add          s5, ra, s9
                  srai         s9, a0, 25
                  srli         ra, s8, 15
                  fdiv.s       fa1, fs10, fa0, rmm
                  fadd.s       ft9, fs6, fa3, rne
                  fdiv.s       fa6, ft1, fs6
                  srl          s11, tp, t0
                  srl          s0, t3, tp
                  fle.s        t0, ft11, fs9
                  addi         t0, a6, 200
                  fsqrt.s      fs5, fs2
                  auipc        t0, 1036743
                  sll          s6, ra, ra
                  fmin.s       ft1, fs2, ft7
                  slti         a7, s10, -13
                  auipc        tp, 256806
                  andi         a2, s11, -1110
                  fsgnjx.s     fa3, ft5, fs8
                  fadd.s       ft3, fa6, fa5, rdn
                  ori          s10, gp, -361
                  mulh         a1, t4, a1
                  xori         s5, s7, 1749
                  srl          zero, a2, s9
                  feq.s        s4, ft9, fs10
                  slti         s11, t6, 880
                  ori          s2, s10, 460
                  fcvt.s.wu    ft6, t0
                  fcvt.s.wu    fa7, a6
                  div          t3, t1, t6
                  lui          zero, 391554
                  fsub.s       fs8, ft6, ft6, rmm
                  fcvt.s.w     ft2, a4
                  fmin.s       fs9, fs10, ft4
                  mulhsu       t0, s9, ra
                  sll          a6, s7, ra
                  sltu         gp, s1, a5
                  srai         t1, a1, 7
                  sltu         t1, t0, zero
                  fcvt.s.wu    fa5, s11, rdn
                  fdiv.s       ft10, fs3, fa4
                  fmv.w.x      fs5, s7
                  mulhu        a2, t1, gp
                  xori         s1, s2, -362
                  slti         t1, s3, 1765
                  fsgnj.s      fs3, ft5, fs3
                  slti         t4, a4, -1766
                  slti         a7, t0, -895
                  fsgnjn.s     fs0, fa6, fa1
                  xor          a6, s6, s4
                  srli         s8, s7, 27
                  fmul.s       fa2, fa5, fs10, rup
                  fmax.s       ft10, fs8, ft5
                  flt.s        s2, fs10, fa2
                  fmv.w.x      fs9, s7
                  sra          s4, tp, t4
                  flt.s        s2, fs0, fs10
                  fclass.s     s6, ft2
                  xor          zero, s7, t2
                  fcvt.w.s     t0, fs0
                  div          sp, t2, t0
                  fclass.s     gp, fs5
                  sub          s7, sp, s8
                  srli         s10, t6, 16
                  srli         s7, s5, 25
                  div          tp, a3, t2
                  sll          t4, a6, s1
                  remu         t5, a5, a5
                  fsgnjx.s     ft0, fa6, fa3
                  sll          a7, s8, t5
                  srli         s2, s11, 16
                  fsqrt.s      fs8, fs8, rne
                  fmul.s       fs3, ft5, fs5
                  flt.s        s10, fa3, fs7
                  fdiv.s       fs0, fa1, fa4, rmm
                  div          a3, a0, s8
                  fclass.s     s9, fa3
                  ori          a2, t1, 501
                  sltu         s4, s7, s9
                  auipc        a6, 786741
                  xori         a6, gp, -904
                  fcvt.s.wu    fa3, a3, rup
                  fcvt.s.wu    ft6, s3, rmm
                  and          t5, s9, s3
                  fcvt.wu.s    s3, fs9
                  fsgnjn.s     ft3, fs4, fa1
                  slti         s8, s5, 636
                  fsqrt.s      fs7, ft4
                  fmax.s       fa5, fs10, fa4
                  add          s4, t2, sp
                  mulhu        ra, t6, ra
                  sra          t4, a0, t0
                  fle.s        s3, fs3, ft6
                  fsgnjx.s     fa2, ft0, fa6
                  and          s8, a3, a7
                  addi         zero, a6, 1910
                  auipc        s4, 1041442
                  fadd.s       fs6, fa4, fa3, rtz
                  div          tp, zero, s0
                  fadd.s       fs3, fa4, fs7
                  fsqrt.s      ft3, ft3, rdn
                  srli         a6, t4, 8
                  fcvt.s.wu    ft0, s11
                  auipc        ra, 65405
                  slli         s8, s3, 8
                  xor          s4, t3, s6
                  add          a2, s7, t2
                  fsgnjx.s     fa6, fa5, fa2
                  div          sp, s1, s3
                  mulh         s6, tp, zero
                  feq.s        s9, fs10, fs11
                  fadd.s       ft3, fa7, ft11
                  lui          a3, 536380
                  slti         ra, s8, -452
                  srli         s7, a2, 21
                  mulhsu       sp, a1, t4
                  rem          a1, a5, t5
                  andi         a1, ra, 272
                  ori          s8, s0, -106
                  addi         a6, s1, 155
                  auipc        t3, 821360
                  sltu         s8, t3, t1
                  slli         tp, s8, 14
                  or           t0, s3, t6
                  fcvt.w.s     a1, ft9, rup
                  fadd.s       ft10, fa5, fs0, rdn
                  xori         a6, t1, -272
                  add          t4, s9, a7
                  feq.s        s2, fs7, ft1
                  fcvt.wu.s    s10, ft7
                  feq.s        s9, ft11, fa5
                  fmax.s       ft2, ft0, ft2
                  slli         a7, s0, 24
                  fcvt.wu.s    s2, ft2, rup
                  mul          s6, s3, gp
                  slti         s10, a1, -965
                  sub          ra, a1, s5
                  andi         s5, a1, -129
                  fsub.s       fs6, ft3, fs9, rup
                  fsub.s       fs6, fa3, ft9, rdn
                  fsgnj.s      fs1, fa3, fs0
                  fmv.w.x      fs4, s8
                  sltu         s10, a4, t6
                  fmax.s       ft9, ft3, fs0
                  fcvt.w.s     s8, ft7
                  fsqrt.s      fa6, ft0
                  sub          gp, t4, t5
                  xor          sp, t4, tp
                  mul          a6, t5, gp
                  mulhsu       s11, t1, t5
                  fsgnj.s      fa6, fa0, fs0
                  fadd.s       ft2, fa6, ft8, rup
                  srl          s8, a0, tp
                  mulh         t5, t4, s10
                  feq.s        t1, fs10, ft8
                  fsub.s       fs3, ft9, fs1
                  slti         a1, t3, -792
                  fle.s        s1, fs11, fs11
                  add          gp, s7, s8
                  mulh         s5, s4, s3
                  fcvt.s.w     fa3, s6
                  fsgnj.s      fa4, ft2, ft8
                  sra          a5, s10, a0
                  srli         t5, s11, 17
                  and          sp, s2, a3
                  fsub.s       fs0, fs8, fs5, rne
                  remu         a7, s2, zero
                  nop
                  andi         t0, sp, 1703
                  feq.s        t2, fs9, fs10
                  fcvt.w.s     a6, fa2
                  sll          t5, gp, s5
                  fmin.s       ft0, fs8, ft2
                  div          t4, t1, s5
                  rem          t0, t1, t3
                  slti         tp, a6, 1807
                  fmul.s       fa0, ft6, fa4
                  andi         a2, a1, 635
                  sub          t4, a2, s4
                  addi         t3, gp, -501
                  rem          sp, a0, t4
                  flt.s        s1, fa2, ft6
                  lui          a2, 772088
                  srai         s1, t6, 7
                  fmv.w.x      fa1, tp
                  slt          t2, s4, a1
                  fsgnjn.s     ft5, ft1, fs3
                  flt.s        s8, ft10, fa1
                  mulhsu       a6, tp, t2
                  fcvt.w.s     t2, fs0, rmm
                  sub          s0, s7, t1
                  fsqrt.s      fs9, fa0
                  mulhu        tp, ra, ra
                  sub          t2, t3, a7
                  slt          tp, t4, sp
                  auipc        zero, 488632
                  fmv.x.w      tp, fs6
                  ori          s2, zero, -447
                  fcvt.s.w     fs1, a2
                  fmv.w.x      ft9, s3
                  fle.s        a3, fa1, fa1
                  ori          s3, s3, 1401
                  srl          t2, s0, gp
                  add          tp, s4, gp
                  flt.s        t5, fs6, fs7
                  xori         ra, a3, -1351
                  fsgnjn.s     fs3, fs3, fa1
                  sltu         a1, s6, s11
                  fadd.s       ft9, fs0, fs10
                  xori         s0, t6, 1050
                  xor          a5, sp, t4
                  and          s9, s1, t3
                  sltiu        gp, t5, -1904
                  andi         s4, gp, -1111
                  fdiv.s       ft11, fs4, ft1, rmm
                  slti         s11, a1, -1768
                  fmin.s       ft0, fs8, fs8
                  and          t2, s11, t3
                  mulhsu       a5, a5, s9
                  fmv.w.x      fa7, s5
                  fmax.s       fa6, fs2, ft5
                  andi         s8, t2, -1136
                  srai         s7, a4, 28
                  fmv.x.w      a1, fs11
                  fmul.s       ft1, fa2, ft3
                  add          a6, t6, t4
                  fmv.x.w      s4, fa2
                  mulhsu       ra, s0, s8
                  sub          t5, a0, s2
                  srli         t4, t2, 18
                  fle.s        t5, ft4, ft8
                  srl          zero, s3, t3
                  feq.s        tp, ft3, fs4
                  ori          s4, s10, -39
                  sll          a1, s5, s9
                  fadd.s       ft9, ft6, fs3
                  srl          s7, t1, t6
                  srl          s5, s11, a7
                  sub          s2, s9, a5
                  fmax.s       ft5, fs2, ft8
                  fle.s        a2, fa3, fs3
                  fcvt.s.w     ft8, a2, rdn
                  and          s6, s11, gp
                  auipc        t0, 843805
                  fmv.w.x      fa6, ra
                  fsgnjn.s     fs2, fs0, ft3
                  mulh         t3, a0, s10
                  slti         s6, t1, 1414
                  mulhu        s10, s6, zero
                  sll          s1, a1, s0
                  fmax.s       fs10, fs5, fa1
                  fdiv.s       ft6, fs9, ft8, rup
                  xor          a1, s7, t4
                  mulhsu       s5, s7, t6
                  fsgnj.s      ft2, ft3, fs9
                  fclass.s     t2, fs5
                  fcvt.s.wu    fa0, a2
                  fmv.w.x      ft1, a1
                  fmv.w.x      fs4, s5
                  fmin.s       fs1, fa3, fs3
                  flt.s        a5, fa2, fs9
                  fmin.s       ft6, fa4, ft11
                  fmul.s       fs11, fs4, fs4, rdn
                  fcvt.w.s     t2, fa7
                  divu         t5, tp, gp
                  slti         s5, t0, 1478
                  fmul.s       fa1, fs11, ft10, rtz
                  sra          a2, s8, s0
                  xori         a1, zero, 8
                  sub          ra, ra, a4
                  srai         s1, t2, 16
                  sub          s9, t5, t1
                  sub          t4, s4, s0
                  and          a5, s3, a1
                  sltu         a7, s6, t4
                  mul          t4, t6, sp
                  fmv.w.x      fa7, a2
                  mul          tp, t5, a1
                  fcvt.w.s     s9, ft5
                  fsub.s       ft10, ft1, fa3, rup
                  fsgnjn.s     fs7, fs11, ft5
                  xori         s4, a3, -396
                  fmv.w.x      ft3, a0
                  srl          s3, a0, zero
                  fcvt.w.s     t4, ft1
                  auipc        s0, 935549
                  rem          a6, s3, t1
                  srl          s9, a7, a2
                  andi         s9, s0, 1220
                  sltu         s10, t3, s5
                  div          a3, a1, a7
                  sra          s2, s11, a2
                  auipc        t5, 761352
                  fcvt.w.s     s1, ft7, rup
                  fmin.s       fs8, fs1, fa6
                  ori          s9, t2, -1676
                  mulhsu       gp, ra, t4
                  srl          a7, s1, t1
                  fdiv.s       ft8, ft9, ft8, rmm
                  sltu         tp, a3, zero
                  sltiu        a6, t2, 1750
                  srl          s6, s9, sp
                  fcvt.s.w     ft0, a6, rdn
                  fcvt.s.w     ft3, s0
                  andi         s9, t4, 1141
                  div          s6, s5, s9
                  fmv.x.w      s8, fs8
                  addi         t2, s4, 1976
                  fmax.s       fa7, ft4, ft4
                  srl          s8, t0, sp
                  sltiu        s4, t5, 1246
                  fdiv.s       ft10, ft4, fs6, rne
                  sll          a7, s4, t0
                  divu         zero, gp, sp
                  and          tp, s10, s0
                  fclass.s     s4, fs11
                  addi         s5, a7, 1814
                  fcvt.w.s     ra, fs5
                  fcvt.s.wu    fa3, t4
                  sll          s7, t2, tp
                  feq.s        s6, fa1, fa0
                  srl          s0, t1, a1
                  fcvt.s.wu    fs2, s1, rne
                  nop
                  and          a2, a7, s0
                  and          sp, s2, s1
                  mul          t4, s8, a6
                  addi         a5, s8, 1409
                  andi         t0, t5, -852
                  srli         t5, a2, 10
                  fdiv.s       fs4, fs9, ft6, rmm
                  slt          gp, a2, sp
                  fsub.s       fa0, fs8, fa4
                  fcvt.w.s     s3, ft5, rdn
                  fcvt.wu.s    s2, fs11, rup
                  sra          s3, s5, s5
                  mulhu        s9, sp, a6
                  xori         s8, tp, -308
                  fmul.s       ft5, ft0, ft2
                  slt          tp, a3, ra
                  fcvt.wu.s    a5, fs5
                  srai         t3, s5, 30
                  divu         s3, s2, a4
                  sra          t5, t0, t2
                  srli         a3, a6, 0
                  or           s3, a4, s11
                  or           s1, s2, s0
                  addi         sp, t1, 1713
                  mulhu        s1, s0, tp
                  rem          a7, a1, gp
                  fcvt.w.s     s10, fa7
                  fcvt.s.w     ft5, s6
                  xor          a6, s11, t5
                  sltiu        s3, a0, -1531
                  fadd.s       fs6, ft1, ft4, rmm
                  flt.s        ra, fa2, ft11
                  fdiv.s       ft0, fs0, fs10
                  and          s8, t5, t0
                  srli         a5, gp, 7
                  fmul.s       ft11, fs10, fa4, rmm
                  xori         a3, ra, -1449
                  mulhu        t0, t6, gp
                  fsgnj.s      fa7, ft2, ft1
                  feq.s        s9, ft8, ft5
                  addi         zero, s0, -190
                  xor          zero, s4, a6
                  srai         a7, s1, 11
                  sltu         s9, s3, s3
                  mulh         s4, t6, a4
                  divu         s11, t1, s6
                  div          t3, a2, s10
                  flt.s        t3, ft1, fa4
                  srai         t2, t1, 1
                  or           a5, a4, s7
                  fsgnjn.s     ft5, ft5, fa2
                  or           a5, t0, t4
                  mulh         t0, s10, a1
                  fsgnjx.s     fa4, fa2, fs5
                  fmv.x.w      s2, fa3
                  add          s3, s9, a6
                  fmax.s       fa5, ft5, ft0
                  sll          s8, a7, t0
                  sub          s7, s8, s1
                  xor          s0, s10, s0
                  xor          t1, s4, t3
                  add          a7, zero, a1
                  rem          t3, a5, a2
                  sll          gp, t5, s10
                  sltiu        t4, gp, -283
                  srli         zero, a5, 26
                  fmul.s       ft4, fa6, fs4, rne
                  slti         a7, sp, 1841
                  fsgnjn.s     ft10, ft9, fa1
                  fcvt.s.w     fs3, a6
                  srl          t3, t1, s3
                  div          s4, t4, a3
                  sll          s4, t6, sp
                  feq.s        a6, fa4, fs11
                  nop
                  fsgnj.s      fa3, fs3, ft9
                  slli         s3, t4, 22
                  fmax.s       fs2, fs5, fs5
                  auipc        t4, 397575
                  fmv.x.w      s4, ft10
                  fcvt.s.w     fa2, ra, rdn
                  sub          s9, t3, s1
                  fcvt.wu.s    a6, ft8
                  fcvt.s.wu    fs11, a5
                  fmin.s       fa5, fa2, ft1
                  fmv.w.x      ft3, t5
                  fdiv.s       fa7, ft9, ft4
                  fcvt.s.w     fs3, s8
                  fsqrt.s      ft8, fa5
                  fcvt.s.wu    fa2, t2
                  feq.s        s10, fs8, ft6
                  slti         s0, a0, 1043
                  mulhu        s0, s0, t5
                  mulhu        a6, a7, t5
                  andi         a2, a2, 390
                  fadd.s       ft0, fs0, fa0
                  feq.s        s10, fa5, ft4
                  rem          s7, t0, t3
                  and          t2, t1, s1
                  mulhsu       s7, a3, t0
                  fmax.s       ft2, fs11, fs11
                  fmv.x.w      ra, fa6
                  feq.s        s5, fs9, fa2
                  fmv.x.w      a3, fa7
                  slli         zero, s0, 13
                  divu         tp, t3, a0
                  srli         s3, s9, 31
                  slt          sp, a1, s4
                  fmul.s       ft7, fa1, ft5, rne
                  srl          t4, a5, a7
                  srl          s3, t5, a3
                  mul          s7, s8, a1
                  auipc        t4, 252182
                  srai         s0, s9, 8
                  add          t1, s7, t0
                  fsgnj.s      fs4, fs5, ft3
                  fmv.x.w      a5, fa3
                  sra          s9, a6, a0
                  sltu         a1, a1, s5
                  fmul.s       fs8, fs11, fs2, rtz
                  sub          a1, s7, s7
                  slt          a6, t2, t5
                  sltu         s7, s7, s9
                  auipc        s4, 121685
                  fcvt.w.s     sp, fa2, rtz
                  nop
                  fadd.s       fs1, fs1, fs6
                  fsgnjn.s     fs4, fs4, ft7
                  fcvt.w.s     s4, ft11, rtz
                  flt.s        a7, fa5, fs0
                  fcvt.w.s     zero, ft9
                  xori         s10, t2, -761
                  fmv.w.x      fs11, s5
                  ori          tp, t1, 436
                  fdiv.s       fa0, fs4, fa4, rdn
                  fle.s        s8, fa2, fs8
                  fmin.s       fa1, fa3, ft5
                  srl          a1, a0, s6
                  mulh         t0, t1, s4
                  sub          a1, t6, a6
                  fsub.s       ft7, fs1, fa1
                  mulhsu       s1, a1, a6
                  add          s4, s1, s7
                  fcvt.s.w     fs11, t3, rup
                  mulhu        t1, s5, a2
                  fsgnjn.s     ft5, ft8, ft1
                  fsub.s       fs11, fa4, fs5, rdn
                  fcvt.w.s     s10, fa5, rne
                  sll          s4, t4, ra
                  flt.s        zero, ft4, fs2
                  sll          zero, s9, a6
                  fadd.s       ft10, ft3, fs2
                  sltu         a5, a1, s4
                  fsub.s       ft2, fs9, ft11, rne
                  fle.s        a1, fs7, fa2
                  fle.s        s9, ft8, ft9
                  ori          a6, a7, 1595
                  div          s6, s4, s5
                  remu         t4, s4, gp
                  fcvt.s.wu    ft6, tp, rdn
                  fsqrt.s      ft0, ft1, rtz
                  xor          s8, a3, t1
                  or           s11, t1, s8
                  srai         a5, a2, 4
                  or           a1, t6, a0
                  and          a2, t0, s4
                  fcvt.wu.s    s2, ft6, rtz
                  slti         s9, a4, 90
                  fcvt.s.wu    ft4, t3, rmm
                  fadd.s       fa1, ft9, fa1
                  mulhu        t3, s4, a0
                  fdiv.s       ft11, fs3, ft2
                  slli         sp, sp, 9
                  fdiv.s       ft10, fa2, fs9, rdn
                  fmax.s       fa1, fs1, fs4
                  mul          s3, s8, t3
                  sub          s11, gp, s4
                  rem          t2, s4, s3
                  feq.s        s6, fs3, fs9
                  sub          s3, a2, s8
                  xori         s0, t3, 690
                  ori          s9, a1, 1721
                  fsgnjn.s     fa1, ft4, fa1
                  addi         s3, a7, -77
                  fmv.w.x      fa2, a4
                  fmul.s       fs9, ft3, fs11, rmm
                  sltu         zero, s2, a7
                  fmul.s       fs10, fa6, fs4, rne
                  fmin.s       fs3, fa5, ft7
                  lui          t0, 273683
                  srl          a3, t1, s1
                  div          s8, s9, t1
                  fsgnjx.s     fs6, ft3, fs7
                  sub          s9, t0, sp
                  fmul.s       fs5, fa6, ft0
                  fcvt.s.w     fa1, ra, rdn
                  div          s4, s9, s8
                  and          s7, t5, s4
                  div          s1, s11, t6
                  fle.s        t3, fs3, ft8
                  and          a1, sp, s11
                  fclass.s     s5, fa6
                  fcvt.s.w     fa4, s6
                  add          t4, a2, s7
                  xori         a1, a7, -1904
                  div          t0, a5, s2
                  fdiv.s       ft3, ft1, fa0, rdn
                  fsgnj.s      fa0, fa6, fs7
                  sra          t0, s3, a5
                  slli         s7, s2, 4
                  sltu         a7, s10, a5
                  slti         a7, ra, -530
                  sltu         a3, s11, t6
                  fsqrt.s      fa2, fa5, rne
                  fsgnjn.s     fa7, fa2, fs7
                  fdiv.s       ft9, ft3, fa1, rtz
                  sra          s11, s3, s5
                  mul          s7, s3, a5
                  sltu         s6, t0, zero
                  xor          ra, a5, a2
                  fcvt.s.w     ft9, s9
                  fsgnjx.s     ft11, ft11, fs8
                  fsqrt.s      fs0, fa7
                  sll          s3, tp, s3
                  auipc        sp, 730414
                  fle.s        a6, fs1, fa0
                  fmin.s       ft11, fa1, ft3
                  fmv.x.w      a2, ft8
                  flt.s        t0, fa5, fs2
                  fsub.s       ft0, ft3, fs1, rmm
                  remu         s9, a0, t6
                  srai         s11, t1, 8
                  andi         t1, t2, 126
                  fmin.s       fs1, fa0, ft4
                  add          s8, a6, zero
                  mulh         sp, t3, t4
                  flt.s        s8, fs5, fa6
                  fcvt.s.wu    fs1, t4
                  andi         a5, ra, -375
                  lui          a7, 121569
                  fsgnjn.s     ft9, fs8, fs7
                  mul          s2, s0, s3
                  fsqrt.s      ft10, fs5, rup
                  divu         t3, a2, a1
                  fcvt.s.w     fs1, t2
                  slti         tp, t3, 816
                  fmv.x.w      s1, ft6
                  auipc        zero, 252244
                  fcvt.w.s     s8, ft8
                  feq.s        t1, ft5, ft10
                  sltiu        s6, a4, -2034
                  and          t5, s1, zero
                  or           s11, a4, t5
                  fcvt.s.wu    ft4, a5
                  fadd.s       ft3, fa3, fa5
                  and          s3, s4, s11
                  slli         zero, t3, 31
                  srai         sp, s2, 4
                  fmv.x.w      s1, fa1
                  ori          zero, s9, 903
                  sub          t0, s8, s2
                  slt          a6, t0, s1
                  mulhsu       tp, s3, t0
                  fmax.s       fs11, fa6, ft3
                  or           t3, s0, s5
                  fle.s        a6, fs5, fa5
                  xor          s10, t4, s1
                  slli         s9, t1, 19
                  sra          s0, tp, sp
                  fmv.w.x      ft4, a7
                  div          sp, t1, t4
                  fsgnjn.s     fs11, fa2, ft1
                  auipc        s7, 512127
                  fsgnjx.s     ft9, fa5, ft8
                  fsqrt.s      fa6, fs2, rup
                  fmin.s       ft10, fs2, fs2
                  auipc        sp, 665336
                  sltiu        s4, s4, 1563
                  addi         a1, ra, 1454
                  fcvt.w.s     s0, fs9
                  fsub.s       fs10, ft10, ft9, rne
                  feq.s        t4, fs11, fa4
                  fsgnjn.s     fs4, ft1, ft9
                  sra          a5, zero, t2
                  slt          s2, gp, s1
                  fadd.s       ft7, fs0, fs9, rtz
                  fdiv.s       fs3, fs6, fs10
                  or           s0, s8, gp
                  flt.s        s4, fs8, ft2
                  fcvt.w.s     sp, ft4
                  and          s0, tp, a3
                  and          s4, ra, a7
                  divu         a2, t3, s3
                  addi         t1, a7, 1374
                  rem          tp, s9, zero
                  fcvt.s.w     fs0, t3
                  srli         t0, s7, 24
                  ori          t4, s3, -117
                  slt          s2, t5, s6
                  fmul.s       fa6, fs7, fa1, rtz
                  sub          t1, t6, a1
                  addi         t1, a7, -509
                  fcvt.wu.s    s8, fs0, rne
                  fsqrt.s      ft1, fs7, rdn
                  srli         s10, s5, 28
                  sltiu        a5, s3, -1826
                  srli         gp, s3, 19
                  slt          s11, a4, s10
                  srl          s5, s2, s7
                  mulh         s3, sp, t1
                  slt          a5, ra, s8
                  fdiv.s       fs8, fa5, fs3, rdn
                  fsgnjx.s     fs2, fa2, fa0
                  fle.s        sp, fs4, fs4
                  fsgnjx.s     ft3, ft5, ft5
                  auipc        s9, 407111
                  fmv.w.x      fs1, s7
                  fsub.s       ft1, fs2, fa3, rup
                  div          s5, ra, t2
                  remu         s0, sp, a5
                  slti         s6, s3, -797
                  sll          s4, s2, s0
                  fclass.s     t0, fs6
                  fcvt.w.s     s2, fa7
                  fle.s        a3, ft7, ft8
                  auipc        ra, 875413
                  feq.s        a2, fs10, fa4
                  fcvt.w.s     s1, ft10, rup
                  auipc        s5, 188911
                  and          gp, t4, a0
                  fcvt.s.w     ft11, s7, rtz
                  remu         a3, t4, tp
                  fcvt.wu.s    t4, ft7
                  fmin.s       fs4, fa5, ft11
                  mulhsu       t3, gp, s10
                  fclass.s     s8, fa2
                  sra          s2, s9, t2
                  slli         t3, t6, 7
                  srl          s8, s3, t6
                  slli         s1, s3, 27
                  flt.s        a2, ft8, ft10
                  lui          s8, 224982
                  feq.s        a5, fs2, fs9
                  fcvt.wu.s    a1, fs9
                  divu         s1, t1, zero
                  mulhsu       s4, a7, a5
                  add          s4, a1, s0
                  fmul.s       ft1, fs4, ft1
                  fsqrt.s      fs4, fs0
                  fdiv.s       fs4, ft0, fa0, rne
                  fsqrt.s      fs4, ft0, rtz
                  sltiu        t4, ra, -748
                  feq.s        a7, ft8, fa1
                  fcvt.w.s     sp, ft4
                  or           t5, sp, s3
                  sltiu        a6, a3, 944
                  auipc        s8, 119367
                  fcvt.s.w     ft5, s0, rmm
                  sra          t4, s9, s3
                  divu         a7, s11, s9
                  fle.s        a3, ft11, ft7
                  sll          s5, t3, a7
                  fmv.x.w      s1, fs6
                  flt.s        a3, fs10, fa7
                  slli         t2, s11, 11
                  sra          a7, tp, s3
                  xori         zero, a2, 1829
                  remu         t1, gp, t3
                  ori          s3, t2, -1099
                  xori         s0, a5, -1368
                  xor          s8, a2, s0
                  mulhu        s2, a6, zero
                  fmv.x.w      t3, fs8
                  fcvt.w.s     s0, fa1
                  fclass.s     a6, fa0
                  andi         a5, a0, 1365
                  andi         a7, s7, -1544
                  flt.s        t2, ft7, ft10
                  mul          s8, a6, tp
                  slli         sp, a1, 29
                  fadd.s       ft1, ft3, fs8, rdn
                  slli         t3, s1, 2
                  flt.s        s7, fs1, fs0
                  fmin.s       fs1, ft2, fa5
                  andi         a5, ra, 377
                  fsgnj.s      fa1, fs9, fa5
                  fmv.x.w      s9, fs1
                  slli         a3, s5, 9
                  fmul.s       fa1, ft3, fs9, rup
                  mulhu        s9, t1, t6
                  slt          t2, tp, t0
                  sll          sp, s10, s7
                  fcvt.s.wu    ft2, s10
                  addi         s9, a2, -1266
                  fsgnjn.s     fs3, fa6, fa2
                  xori         a5, ra, 1648
                  fclass.s     s5, ft7
                  flt.s        s5, fs7, fs10
                  fsqrt.s      fa7, ft10
                  addi         s4, t0, -73
                  fmv.w.x      fa2, a5
                  fcvt.s.wu    fs11, s8, rmm
                  lui          tp, 443196
                  fcvt.wu.s    t4, fa3
                  fmul.s       fa1, ft8, ft0, rup
                  slli         s0, s5, 25
                  auipc        s1, 769128
                  mul          sp, t5, gp
                  fclass.s     t1, fa2
                  fcvt.w.s     s9, fa2, rne
                  auipc        zero, 383097
                  fcvt.s.wu    fa6, a5
                  and          s7, t5, s8
                  srl          zero, t3, t0
                  slli         a7, ra, 23
                  sll          t5, a0, a7
                  fmul.s       fs0, fs10, ft1, rup
                  fmv.w.x      fa0, s5
                  mul          s4, a2, ra
                  fcvt.w.s     t2, ft11, rup
                  fsub.s       fs9, fs2, ft8, rdn
                  fsgnj.s      fs11, fs8, fs4
                  srai         a6, a5, 3
                  flt.s        t5, fs7, fa6
                  and          s6, s5, s4
                  fsub.s       fa2, ft7, fa2
                  mul          a7, s11, t3
                  or           s6, a4, sp
                  fclass.s     a6, fs10
                  mulhu        t4, s0, t2
                  mulh         s7, a1, gp
                  srl          zero, a0, s4
                  fcvt.wu.s    s11, ft8, rne
                  add          s10, a3, a7
                  fsgnjn.s     ft3, ft10, fa1
                  fmax.s       fs3, fa7, ft2
                  fle.s        tp, fs7, fs2
                  fsgnjn.s     ft3, fs3, fs2
                  xor          t0, t6, a7
                  andi         a6, a3, 152
                  srai         a1, tp, 25
                  divu         s7, s1, s7
                  slli         t0, s9, 22
                  fsgnjn.s     fs11, ft6, fs2
                  slli         a5, s9, 7
                  slt          ra, t3, s6
                  fsgnjn.s     fs9, fa6, fs5
                  fdiv.s       ft3, fs3, fs2, rmm
                  mulhu        gp, a0, gp
                  addi         s7, t6, 491
                  sll          sp, a2, a0
                  ori          t2, s0, -304
                  srli         s4, s2, 3
                  mul          t1, s0, s7
                  fsgnjx.s     fs10, ft3, ft10
                  fcvt.wu.s    t4, ft10, rmm
                  fmul.s       fs11, fs8, ft1, rne
                  srli         s1, gp, 9
                  fcvt.w.s     s3, fs9, rmm
                  add          ra, a5, t5
                  xor          t1, s2, s5
                  fcvt.wu.s    s0, fs0
                  fcvt.wu.s    s10, fa1
                  auipc        a1, 1003629
                  slt          t5, a0, t5
                  mulh         gp, t4, s5
                  fcvt.s.w     fs1, s4, rmm
                  fadd.s       ft1, fa7, fs11
                  fmul.s       fa6, ft9, ft2, rne
                  slt          a7, s3, sp
                  auipc        s0, 574872
                  xori         t1, s9, -781
                  fcvt.w.s     s0, fs2
                  fmv.w.x      ft9, s7
                  addi         a1, ra, 598
                  auipc        s11, 662959
                  fsqrt.s      ft5, fa2
                  nop
                  fle.s        a7, fs3, fs9
                  div          t2, s9, sp
                  ori          a5, s11, -1012
                  fmax.s       fs0, ft3, fa4
                  sltu         s3, t2, zero
                  sub          zero, s6, t3
                  divu         t3, s11, s10
                  ori          t3, s2, 641
                  addi         s8, a1, -176
                  sltu         a6, a6, s10
                  srl          s10, tp, s1
                  mul          tp, a1, s5
                  fcvt.s.wu    ft2, a6, rne
                  ori          t4, s5, 1171
                  fmv.x.w      a6, ft2
                  or           s0, a5, t1
                  andi         s8, ra, 2041
                  or           s7, gp, s4
                  fmv.x.w      s10, fa2
                  fsgnj.s      ft0, fs5, fa7
                  ori          s4, t2, -721
                  lui          s9, 541028
                  ori          t3, a6, -352
                  sll          ra, tp, s7
                  and          a1, s8, t3
                  feq.s        s7, ft6, ft5
                  srai         s6, sp, 17
                  mul          t5, t2, t0
                  sub          s11, s1, s9
                  slti         a7, s11, 1325
                  slli         s1, a6, 24
                  slti         t2, t3, -1217
                  slli         t5, s2, 0
                  mul          ra, t5, s6
                  srl          a6, s11, t6
                  fle.s        a3, ft7, fs8
                  mulhsu       s4, a0, t4
                  fcvt.s.wu    fs3, a7
                  ori          s5, t4, 354
                  sra          a7, s4, a0
                  fcvt.wu.s    a2, fs3
                  sub          s8, s5, t4
                  srli         t5, t0, 23
                  and          s1, a3, s2
                  fsqrt.s      fa4, ft3
                  fsgnjn.s     fs11, ft1, fs10
                  fsgnj.s      fs8, fs2, fa3
                  mulh         t0, s2, s10
                  fle.s        t5, ft2, fs0
                  sub          s10, a1, s7
                  fcvt.w.s     t2, ft0, rmm
                  mul          s6, s7, a4
                  flt.s        t5, fs5, fs2
                  sltiu        s9, t4, 182
                  fdiv.s       ft8, fs3, fa5
                  fmul.s       fs10, fa4, ft6, rne
                  fdiv.s       fs10, ft0, fs6
                  or           s0, s10, a4
                  srai         t0, s3, 12
                  slti         a1, a7, 647
                  fmin.s       fa0, fa3, fs11
                  srli         s0, a2, 21
                  fmax.s       ft11, fs11, fs6
                  srai         gp, s10, 19
                  srl          t5, gp, t3
                  feq.s        s9, ft8, fa0
                  fmv.x.w      zero, ft10
                  feq.s        sp, ft10, ft5
                  rem          s3, a1, s5
                  sra          s0, a1, s10
                  feq.s        s3, ft5, fs11
                  fmin.s       fa5, ft1, fs2
                  mulh         a1, a3, s3
                  fdiv.s       fs0, ft10, ft9
                  fadd.s       fs5, fs1, fa3, rup
                  fsqrt.s      ft7, fa3, rmm
                  srai         ra, s6, 1
                  fle.s        s6, fa7, fs6
                  div          tp, t4, s1
                  fcvt.s.wu    fa1, s10
                  feq.s        s7, fs7, ft4
                  mulh         s3, s7, s8
                  fsub.s       fs0, ft7, ft8, rtz
                  fsgnjx.s     fa6, fs8, ft3
                  slt          a7, s7, a4
                  sub          s10, s3, a2
                  div          t4, t2, s6
                  xor          s3, a2, sp
                  fmul.s       ft0, fs5, ft11
                  nop
                  rem          zero, ra, s9
                  andi         a2, gp, 2021
                  xori         s8, s0, 78
                  sub          a2, s3, a6
                  fsub.s       ft1, ft9, ft5, rup
                  remu         t1, gp, a7
                  fsqrt.s      fa6, fs0, rup
                  addi         a7, t0, 1291
                  fsgnjn.s     fa6, fs7, fs7
                  andi         t0, sp, -847
                  mulhsu       t4, a4, t5
                  feq.s        a3, ft8, fs2
                  xor          sp, a2, a3
                  fclass.s     a7, fa5
                  mulh         t2, a4, s3
                  mulh         s3, s11, ra
                  fmul.s       fa7, fa3, fs6, rdn
                  divu         s7, t0, sp
                  sltiu        s6, s3, 778
                  fmv.w.x      fa6, t6
                  or           s5, tp, s3
                  lui          sp, 978324
                  remu         s2, a7, t2
                  add          a5, t5, t5
                  fadd.s       ft3, fa0, fa5, rdn
                  add          gp, t1, s7
                  and          t5, a2, s2
                  nop
                  flt.s        a1, ft9, fa6
                  fmin.s       fs9, ft3, fs10
                  xor          s3, a6, s3
                  fcvt.s.w     ft1, s10
                  fsgnjx.s     ft10, ft11, fa7
                  fle.s        tp, ft3, ft5
                  xor          t4, sp, s11
                  mulh         s8, s2, sp
                  add          t0, a1, s6
                  fsgnjx.s     fa6, ft8, fs4
                  slli         t2, s1, 24
                  slli         t4, ra, 30
                  sub          a1, s11, a1
                  sub          t3, s5, t2
                  divu         t5, s7, s7
                  fmin.s       fa5, ft10, ft10
                  and          tp, a2, a2
                  mulhsu       t0, a4, a6
                  fle.s        tp, fa6, ft7
                  andi         tp, s2, -111
                  srl          a6, t4, t1
                  fsqrt.s      ft3, fs5, rne
                  mulhu        gp, s0, s10
                  divu         t4, s3, s6
                  sra          tp, t1, t3
                  add          s5, a5, s9
                  fmv.x.w      zero, ft7
                  xor          s9, zero, t5
                  srai         s0, s8, 6
                  fadd.s       ft8, ft5, fa1, rup
                  sltu         t1, s9, s7
                  fsgnjx.s     ft8, fs1, fa2
                  fcvt.w.s     a3, ft5, rmm
                  fmul.s       fa6, fs9, ft5
                  sltu         a5, t6, t3
                  srli         t1, s5, 25
                  flt.s        t2, fs5, fs1
                  remu         zero, t1, t4
                  lui          a2, 224419
                  fdiv.s       fs3, fs0, fs3
                  mulhu        s0, s8, s4
                  flt.s        a2, ft6, ft7
                  flt.s        tp, ft3, fa1
                  sub          t3, gp, s2
                  fmul.s       ft11, fs11, fs6
                  fadd.s       ft4, ft3, fs7, rmm
                  mulhu        s10, ra, s7
                  xor          s7, tp, s0
                  nop
                  xor          s9, t0, t3
                  fsqrt.s      ft4, fs6
                  fsub.s       fs11, fs11, ft4
                  rem          s8, ra, s6
                  fsub.s       ft5, fs7, ft2
                  flt.s        t0, ft7, ft1
                  fmv.x.w      a3, fs8
                  fsgnj.s      ft7, ft9, fs11
                  slti         a2, s5, 12
                  addi         t4, s11, 1741
                  srai         a1, t3, 6
                  sltu         t4, s5, a4
                  mul          s9, a6, s3
                  fsub.s       fa1, ft10, fa3, rtz
                  mulhu        t4, zero, gp
                  or           s5, a1, a2
                  fsgnjn.s     ft1, fs10, fs8
                  fle.s        tp, fa4, fs5
                  feq.s        tp, ft11, ft10
                  fsub.s       ft4, ft1, ft5, rtz
                  mulhu        a5, a6, s8
                  fdiv.s       ft7, fs11, fs9
                  fsqrt.s      fs5, fs7
                  fcvt.w.s     s5, fa4
                  slti         s11, t5, -105
                  addi         ra, a3, 435
                  slti         s6, s2, -104
                  sll          t5, s0, s2
                  slli         a5, s1, 5
                  srl          t1, t2, a7
                  srai         t1, t4, 7
                  mul          sp, s0, a4
                  mulhsu       a3, s3, s3
                  fsgnjn.s     ft3, fs10, ft0
                  slli         a7, tp, 0
                  auipc        a1, 844025
                  fsqrt.s      fa3, ft2, rtz
                  fsqrt.s      ft9, ft2, rup
                  fsgnjx.s     ft2, fa7, fs4
                  sub          t2, sp, t2
                  fsgnjn.s     fs5, ft9, ft10
                  fmv.w.x      fs1, a0
                  andi         a3, s4, 1645
                  fmul.s       fs2, fa5, fs3
                  flt.s        tp, fs8, fs4
                  fle.s        a3, ft7, fs3
                  lui          a6, 362344
                  mulhsu       t0, a2, a6
                  fsgnjn.s     fa1, fs2, ft10
                  ori          a7, t1, -1732
                  addi         s6, s11, -1770
                  slli         s9, s9, 2
                  slt          a2, gp, zero
                  mulhu        a3, s9, tp
                  fdiv.s       ft9, fs11, fa4, rdn
                  fsgnjn.s     fs6, fa1, fa2
                  fsub.s       fa7, fs9, fs1
                  remu         s10, s9, t5
                  fsgnjx.s     fs8, fs0, fs6
                  or           s0, s4, t2
                  fadd.s       fs4, fs3, fs9, rne
                  fle.s        t0, ft3, fa1
                  sub          s5, t2, t1
                  nop
                  sub          gp, s1, s2
                  feq.s        s7, fa4, fa7
                  fdiv.s       fs2, fs7, ft2, rup
                  fsgnjn.s     fs1, fs6, fs5
                  fcvt.s.wu    fa7, a2
                  sra          a6, t0, a6
                  slt          a3, ra, s3
                  fmv.x.w      a5, ft4
                  div          t0, s9, a4
                  xor          s2, s7, s2
                  sub          t0, s10, a5
                  slti         t3, s4, -1719
                  divu         t1, a7, t1
                  and          s3, ra, t4
                  fadd.s       fs9, ft5, ft10, rdn
                  slti         s4, tp, 837
                  ori          s4, a3, -397
                  add          s4, t0, ra
                  sltu         a5, s4, s1
                  feq.s        t3, fs10, ft4
                  div          tp, a6, s7
                  nop
                  fcvt.wu.s    t2, fa5
                  sltiu        t5, zero, -1126
                  fsgnjx.s     fs10, fs10, fa0
                  fadd.s       fs11, ft0, fa1
                  remu         ra, t1, a7
                  div          t1, a0, a0
                  fclass.s     t5, ft3
                  fsqrt.s      ft3, ft7
                  srl          a7, s7, t2
                  slt          a3, s2, t0
                  fcvt.s.wu    ft2, s4
                  sltu         s10, s11, t3
                  fclass.s     t1, fs3
                  add          gp, t4, a5
                  sra          s11, a3, ra
                  fclass.s     a1, fa3
                  flt.s        zero, fs0, ft5
                  fmv.w.x      fa4, s8
                  srai         s3, s8, 28
                  fcvt.s.wu    fs7, t6
                  mulh         t5, s4, t5
                  srl          s2, s3, t0
                  fdiv.s       fs7, fa4, ft4, rmm
                  fadd.s       fs2, fa4, ft8, rup
                  feq.s        a2, fs5, ft11
                  lui          a5, 1028835
                  sll          a5, a4, a2
                  feq.s        zero, ft8, fs8
                  fmul.s       ft0, ft5, fa1
                  fsgnjn.s     fs6, fa4, fa6
                  fle.s        a6, ft2, ft1
                  andi         gp, s9, 1054
                  fcvt.s.w     ft2, s5, rne
                  sra          t2, ra, a0
                  srl          zero, zero, s4
                  fsgnjn.s     ft10, fs2, fs7
                  sltu         s11, ra, s3
                  rem          gp, a4, zero
                  lui          s2, 890131
                  mulhsu       s7, t5, s3
                  feq.s        s10, fs5, fa4
                  addi         zero, t3, 1221
                  fsqrt.s      fs3, fs6
                  rem          t3, s3, s1
                  div          t2, a3, s3
                  fcvt.w.s     sp, ft10, rne
                  mulhu        t5, s8, gp
                  slli         t0, sp, 4
                  fmul.s       fs1, fa4, ft0
                  slli         s10, zero, 29
                  fcvt.s.wu    fa3, t5
                  fmul.s       ft7, ft2, fs4, rne
                  remu         zero, s9, a0
                  lui          zero, 815951
                  lui          s3, 614263
                  fmax.s       fa3, ft2, fa3
                  fsgnjn.s     ft10, ft8, fa1
                  mulhu        s11, zero, s0
                  ori          a6, s6, 1861
                  mulhsu       s11, s9, zero
                  fle.s        s0, ft7, fs8
                  fclass.s     tp, fs6
                  fcvt.s.wu    ft5, a3, rne
                  fsub.s       ft3, fs7, ft4
                  lui          tp, 232645
                  fmul.s       fs0, fs8, fs5, rtz
                  srli         a2, a7, 11
                  fsqrt.s      fa2, fs10, rup
                  sub          tp, s10, s0
                  auipc        s11, 163923
                  mulhsu       ra, a0, a5
                  slli         gp, t5, 17
                  lui          gp, 598164
                  fmv.w.x      fs10, t5
                  slti         a2, s11, 1036
                  slt          t1, a2, a4
                  mul          a3, zero, gp
                  add          sp, ra, t5
                  addi         a3, a1, 1948
                  nop
                  fmul.s       ft9, ft5, fa2, rup
                  nop
                  auipc        t1, 685262
                  srai         s9, t4, 22
                  andi         t1, t2, 1333
                  mul          a2, ra, s4
                  mulhsu       t1, s7, s3
                  fle.s        tp, fa6, fs3
                  div          a3, t2, a7
                  fsub.s       ft5, fa0, fs0, rup
                  sll          a2, t3, a3
                  srli         s5, s6, 29
                  mulhsu       s0, s3, a2
                  xori         a5, t2, -364
                  fsub.s       fs2, fa1, fa2
                  or           s8, a3, a4
                  fcvt.wu.s    a1, ft0, rtz
                  fmv.x.w      s10, ft11
                  andi         gp, a3, -276
                  flt.s        a3, fs6, ft10
                  nop
                  srl          a1, t5, a6
                  fmv.w.x      fa6, a5
                  fcvt.s.wu    fs8, t0
                  fmv.x.w      sp, fs5
                  fdiv.s       ft3, fa3, fa7
                  xori         t5, a1, 992
                  or           a2, t5, a0
                  fcvt.w.s     zero, fs9, rmm
                  mulhsu       s10, s8, s10
                  mulhsu       t5, t0, s0
                  fcvt.s.wu    fa1, t5, rmm
                  xor          s3, s9, a1
                  flt.s        a2, ft0, ft8
                  divu         a5, t2, sp
                  fcvt.w.s     t1, fs4
                  fsgnjx.s     fs6, fa2, fs7
                  auipc        zero, 59975
                  fcvt.s.w     fs3, s6, rdn
                  slli         t5, s8, 29
                  fmul.s       fa5, fa6, fa2, rdn
                  fcvt.w.s     s10, ft9, rne
                  sra          zero, s1, s10
                  srai         s0, ra, 6
                  fdiv.s       ft4, fa5, ft7
                  fmv.x.w      s9, fs0
                  add          s11, s2, t4
                  mulhu        s10, gp, t3
                  mul          t1, a1, a0
                  srl          s9, s3, ra
                  sra          t3, sp, zero
                  ori          s7, t5, -1335
                  fmax.s       fs1, fa6, fa3
                  feq.s        t1, fs8, fs1
                  mul          s10, s0, s9
                  fmv.x.w      tp, ft3
                  fadd.s       fs3, ft2, fa2
                  sltu         s7, s7, a5
                  fmin.s       fa1, fa1, ft6
                  sltu         a2, t4, a2
                  srai         t2, t1, 19
                  fmax.s       ft9, ft8, fa7
                  or           s11, t1, s9
                  fle.s        s5, fa6, ft11
                  mulhsu       s0, s0, t5
                  fsub.s       fs9, fa6, fs8, rne
                  srl          s4, t4, a1
                  mul          s4, a7, tp
                  or           a5, a4, t2
                  fcvt.s.w     fa3, t4, rne
                  or           s7, s6, s1
                  fsgnjx.s     fs2, fs5, fs9
                  fcvt.w.s     a5, fs4
                  lui          a7, 747731
                  fcvt.w.s     s8, ft11, rne
                  divu         a7, a6, s6
                  fcvt.s.wu    fa5, s2, rmm
                  fmax.s       ft1, ft1, fs7
                  fmul.s       fs11, fs9, fa2
                  feq.s        s8, ft8, ft2
                  add          t3, s3, t5
                  fsgnjn.s     fs10, fa7, ft9
                  sltiu        sp, s4, 1765
                  sltu         s4, s3, s0
                  fdiv.s       fa1, fs4, fa4
                  fmin.s       ft9, fs7, fs6
                  fclass.s     a6, fs10
                  srl          s5, s11, t1
                  div          a3, t3, s8
                  mulhsu       s2, s9, a3
                  addi         s9, gp, 659
                  remu         t5, s11, gp
                  nop
                  slti         a1, a5, -1943
                  fmax.s       fs2, fa7, fs5
                  fmv.x.w      s5, fa3
                  sll          a7, s9, gp
                  fmv.x.w      tp, fs11
                  fclass.s     sp, ft5
                  xor          t1, a5, a5
                  fle.s        t0, fs0, ft5
                  fsqrt.s      fa3, ft5, rne
                  fclass.s     s10, ft5
                  fsub.s       fs0, fs2, ft11
                  and          a5, t2, a6
                  sub          t1, s1, t1
                  div          s5, a3, s7
                  xori         s0, t0, 537
                  slti         a6, s10, -435
                  fsgnjn.s     ft11, ft11, fs7
                  remu         gp, a2, s10
                  fsgnjx.s     ft2, ft10, fa6
                  fmax.s       ft2, ft0, fs0
                  mulhsu       tp, s7, s4
                  mulhu        a6, sp, s9
                  mulhu        s2, t5, s7
                  lui          s9, 684132
                  lui          s11, 975553
                  xori         gp, s1, 1168
                  srai         s0, a6, 9
                  slli         gp, sp, 10
                  fsub.s       ft0, fa2, ft7, rmm
                  fsqrt.s      ft1, fs4, rtz
                  xori         a6, a1, -1063
                  or           s1, t6, a7
                  fcvt.wu.s    t4, fs5, rne
                  fsgnjn.s     fs7, ft8, fs4
                  fcvt.w.s     tp, ft11
                  sll          s2, s0, tp
                  sll          a2, t1, s4
                  add          s6, s7, s2
                  srl          s0, a2, ra
                  fsgnj.s      fs2, ft2, ft10
                  lui          gp, 109664
                  xor          t5, s10, t4
                  feq.s        s6, ft8, fa4
                  mulh         a6, s11, t6
                  slt          t2, s0, sp
                  srai         s7, s5, 4
                  srli         t5, ra, 31
                  xor          t5, a5, s3
                  fcvt.s.w     ft11, zero, rup
                  sra          a7, s4, s10
                  ori          t0, t6, 453
                  srai         zero, s3, 8
                  srai         s11, t0, 3
                  fclass.s     s4, fa5
                  lui          s10, 816557
                  sra          t1, a0, s4
                  fclass.s     s4, fs1
                  slt          a7, ra, a5
                  slli         s9, t3, 28
                  xor          s0, s0, gp
                  fadd.s       ft4, ft9, ft6, rdn
                  feq.s        ra, fa4, ft5
                  feq.s        s2, fa1, ft9
                  sltu         s7, s4, s2
                  fsgnj.s      ft8, fs4, fs9
                  sltiu        s1, a3, -2017
                  remu         tp, s8, t6
                  fcvt.s.w     ft7, zero, rtz
                  xori         ra, a3, -564
                  auipc        a3, 1010438
                  addi         a6, tp, 671
                  xor          a5, t3, s6
                  sll          a2, t1, s6
                  mul          t0, a0, s4
                  slti         a1, s8, 1059
                  fclass.s     s8, fa1
                  or           a6, s9, a6
                  fsgnjn.s     ft3, fs9, fa2
                  remu         s6, ra, gp
                  andi         s1, gp, -506
                  mulh         t0, zero, a0
                  feq.s        zero, fs11, ft7
                  sltu         zero, t0, tp
                  fsqrt.s      ft7, fa5, rne
                  sltiu        t5, s5, -335
                  mul          s1, s4, s3
                  fmv.w.x      fs10, a2
                  fdiv.s       fa4, fa2, fs4
                  xori         s6, s10, 1601
                  fmin.s       fs2, fs11, ft2
                  div          a3, t3, a3
                  fmul.s       ft4, ft11, fs1, rne
                  fmul.s       fa2, fs0, fa3
                  slt          gp, t6, a3
                  lui          s1, 46215
                  sll          t4, s11, zero
                  fsgnj.s      fs0, ft11, fa6
                  fmin.s       fs7, fa7, fs10
                  slli         zero, s8, 27
                  sltu         a3, s8, t0
                  flt.s        s11, fa7, fs5
                  rem          zero, s7, s7
                  mulhsu       ra, a2, s0
                  fadd.s       ft9, fa0, fs1, rdn
                  sltiu        s1, t5, -1065
                  fsgnj.s      fs0, fs10, fs11
                  remu         a3, t6, s0
                  fadd.s       fs8, fs11, fs7
                  flt.s        a2, ft2, ft5
                  fsgnjn.s     fs5, fs10, ft10
                  srl          a5, a0, tp
                  fcvt.s.wu    ft0, a7
                  fmv.w.x      fa4, sp
                  fmax.s       fs8, ft2, fa7
                  remu         a2, t4, s8
                  mul          s10, t5, s3
                  add          a3, t3, s10
                  fsqrt.s      fs6, fs4, rup
                  fmul.s       fs7, ft11, ft3, rne
                  fsqrt.s      ft9, ft3, rmm
                  fsqrt.s      fs3, ft0, rdn
                  fdiv.s       ft5, ft4, ft0
                  fsqrt.s      fs4, ft0, rtz
                  mulhsu       a5, a2, a3
                  feq.s        t3, fs7, fs7
                  fle.s        a1, fa7, fa6
                  slti         t5, s4, -98
                  fclass.s     s8, fa3
                  fsub.s       ft7, fs5, ft4, rtz
                  or           a7, s9, tp
                  slli         ra, t5, 29
                  srai         s3, s0, 6
                  divu         s9, sp, ra
                  nop
                  fmv.w.x      fa0, a1
                  ori          s2, t4, 1410
                  sll          a3, t0, sp
                  sub          s9, tp, gp
                  fmax.s       fs1, ft3, ft4
                  sub          a1, gp, t2
                  sltu         gp, a5, sp
                  add          s4, s4, s1
                  mul          s10, s5, tp
                  andi         t3, s10, 491
                  or           t0, a4, t1
                  or           t1, ra, a4
                  xor          t1, t1, zero
                  remu         s10, t1, tp
                  and          tp, t1, ra
                  fadd.s       ft6, fa5, fa7
                  slti         a6, s0, -275
                  fdiv.s       fa1, fs4, ft4, rdn
                  remu         t0, s10, t6
                  or           sp, s6, a7
                  mulh         gp, t2, s8
                  fmin.s       ft7, ft5, ft5
                  or           t2, ra, t1
                  nop
                  divu         s9, a2, s7
                  divu         t1, s9, s2
                  fcvt.w.s     s5, fs5, rtz
                  add          a7, s0, t5
                  srai         s0, s6, 26
                  xori         s3, sp, 33
                  or           a5, t5, a0
                  fcvt.s.wu    fs5, t5
                  add          s10, a1, t5
                  remu         s5, a6, s8
                  slt          t0, s3, a7
                  lui          s1, 712390
                  fclass.s     s2, fs1
                  sll          ra, sp, s3
                  fsgnjn.s     ft4, ft0, fs3
                  mulh         t5, zero, zero
                  xor          zero, a4, s4
                  sra          t2, t4, t3
                  xor          s6, a7, t6
                  sltu         s2, a5, a2
                  sub          a5, s9, s9
                  mulh         s2, tp, t5
                  sub          s0, s4, t0
                  fcvt.wu.s    zero, ft5
                  fsgnjx.s     fa3, fa2, ft2
                  fcvt.w.s     s11, fs0, rne
                  fle.s        s10, fa5, fs3
                  srli         s3, t1, 11
                  add          gp, s6, s5
                  mulh         t4, s6, a1
                  feq.s        a1, ft8, ft3
                  ori          zero, a4, -28
                  ori          s3, s3, -734
                  sltu         a5, s6, tp
                  xori         s5, s11, -1373
                  fdiv.s       fs9, ft8, fs3, rdn
                  slli         t2, t4, 3
                  fsgnjx.s     fs6, fs10, fs11
                  fsqrt.s      fs10, ft11
                  fsqrt.s      ft6, fa2
                  mul          t3, a1, t0
                  sltu         sp, a5, gp
                  and          s11, t4, tp
                  and          t4, s4, t3
                  mul          t4, t1, t6
                  fcvt.w.s     s9, fa5, rup
                  fmul.s       fa3, fs1, fs10
                  fsub.s       fs9, fa3, fs6, rtz
                  divu         a5, t3, gp
                  fclass.s     a7, ft4
                  fcvt.w.s     a5, fs4, rne
                  lui          s7, 191492
                  fmv.x.w      a3, ft9
                  fdiv.s       fs1, ft6, fs2
                  srli         a6, a2, 13
                  fsqrt.s      fs4, ft1
                  xor          t4, tp, s1
                  or           s3, a3, s1
                  fsqrt.s      fa6, ft7, rdn
                  srai         t2, t4, 13
                  sltiu        a1, s9, 710
                  div          a3, t1, a1
                  rem          zero, a3, tp
                  sltu         a1, s5, a0
                  fmax.s       fa7, fs11, ft10
                  fmul.s       fa0, ft8, fa0
                  sltiu        s9, s1, 1263
                  div          s3, a2, sp
                  fsub.s       ft7, fa2, ft11
                  sltu         a6, a0, t1
                  addi         a3, s7, 1480
                  fmin.s       fa3, ft11, ft11
                  mulhsu       s9, t6, s11
                  fsgnjx.s     fs4, ft5, fs9
                  fadd.s       fs2, fs0, ft7
                  fdiv.s       fs7, ft6, fa3
                  fmv.w.x      ft8, a0
                  nop
                  fsgnjx.s     ft0, fs6, fa2
                  fsub.s       fa0, ft11, fa2
                  lui          s9, 938278
                  fle.s        s5, fs5, fs0
                  fdiv.s       fs9, ft5, ft9
                  srl          t0, a5, s6
                  and          t1, a4, s4
                  srli         s3, a4, 13
                  sub          s9, t2, a5
                  fcvt.s.w     fs1, t3, rdn
                  sll          a2, gp, s7
                  or           a2, s0, a5
                  fsgnjx.s     ft1, fs1, fa4
                  fcvt.w.s     t4, fa2
                  fle.s        a3, fa1, ft4
                  flt.s        t1, fa1, fs4
                  fmax.s       ft7, ft4, fa6
                  fsgnjn.s     ft4, ft1, ft8
                  andi         sp, s9, -74
                  sub          s7, s8, s3
                  slti         tp, s4, 785
                  flt.s        a6, fa4, fs4
                  srli         s0, a4, 29
                  mul          zero, s3, s11
                  andi         s0, a7, 1071
                  and          a3, s10, tp
                  auipc        t4, 998663
                  xor          t1, t4, s4
                  and          s4, s1, s8
                  fle.s        s7, fs6, ft4
                  lui          a1, 916484
                  srai         t4, a0, 29
                  fmin.s       fa0, fs4, fa5
                  xor          s6, s1, a3
                  add          tp, s11, a2
                  fle.s        a2, fa4, fa1
                  mul          t4, s4, a6
                  mulhsu       s3, t0, s10
                  nop
                  mulh         tp, sp, tp
                  and          t4, t2, t0
                  sll          tp, s5, a6
                  mul          s11, s3, t1
                  rem          s2, a6, sp
                  rem          a2, t4, a4
                  fsgnj.s      fs9, ft11, ft4
                  sra          s8, a7, s2
                  and          s7, s11, t1
                  nop
                  fsgnjx.s     fs1, fa4, fs7
                  sll          t0, t1, ra
                  fle.s        tp, fa2, fs11
                  div          s5, t5, s3
                  fsqrt.s      fs10, fa6, rup
                  fclass.s     t4, ft2
                  xori         s4, s7, -752
                  fsqrt.s      ft2, fs2, rmm
                  sll          s3, s10, a3
                  fmax.s       fa5, fs5, fa4
                  mulhu        tp, s3, a1
                  fsub.s       ft2, fs0, fa6
                  fclass.s     a6, fs3
                  fadd.s       ft0, fs9, fs5
                  auipc        a7, 803046
                  fsgnjx.s     fs1, ft4, fs10
                  sltu         s2, a2, a1
                  divu         sp, t2, s10
                  sltiu        s4, a2, 1163
                  add          a2, t3, a7
                  andi         s0, a2, -1159
                  mulhsu       a7, t1, s4
                  and          t1, a6, s11
                  fmv.w.x      ft11, s1
                  fmv.x.w      a6, ft4
                  fdiv.s       ft2, ft9, fa1, rmm
                  mulhu        s9, s9, a3
                  fsgnj.s      ft5, fs2, fa0
                  flt.s        a6, fs0, fs7
                  sltu         a7, s10, a7
                  nop
                  ori          s6, ra, 429
                  xor          a5, a0, s7
                  fadd.s       ft5, ft0, fa4, rmm
                  mulhu        a7, t3, zero
                  addi         zero, s3, 1376
                  fmv.w.x      fa1, a0
                  fadd.s       fs7, fs5, fa0, rup
                  remu         t4, t4, tp
                  fsgnj.s      fs0, fs9, ft2
                  fmv.w.x      ft3, sp
                  mulh         t3, a4, s7
                  fsgnjn.s     fa5, fa4, fs2
                  and          s1, s1, s5
                  rem          s10, a1, t6
                  fclass.s     s0, ft10
                  flt.s        s5, ft1, fs11
                  flt.s        sp, ft2, fa0
                  div          t5, a4, zero
                  fmin.s       fa7, fs4, ft9
                  divu         s0, t3, a7
                  sra          ra, s10, t4
                  remu         t0, a4, t6
                  fcvt.s.wu    fa5, ra, rtz
                  ori          s10, s1, 919
                  feq.s        s10, fs2, fs3
                  slti         t5, s5, 192
                  div          s0, s6, t5
                  fcvt.s.w     ft9, s1, rdn
                  and          s8, s11, a6
                  fmax.s       fa4, fs8, ft6
                  fmin.s       ft0, fa3, fs9
                  auipc        t1, 820340
                  xori         zero, a7, -503
                  divu         t5, tp, s5
                  divu         s10, s3, s6
                  fmax.s       fs2, ft7, fs8
                  mulhu        s3, ra, a4
                  slti         s7, a0, 156
                  fsqrt.s      fs2, ft5
                  fadd.s       fa2, fa0, ft4
                  auipc        ra, 932336
                  auipc        a5, 141337
                  xori         a7, t5, 615
                  xori         s9, t6, -1443
                  sltu         s2, s2, t0
                  fsub.s       ft3, ft7, ft0
                  mulh         s7, a2, a4
                  fcvt.s.w     fs2, t0
                  fsgnjn.s     fs2, fa1, ft3
                  nop
                  mulhsu       s10, tp, s7
                  mulh         s0, t0, s5
                  addi         t1, zero, -1278
                  mul          s6, s10, t3
                  slt          a6, s5, tp
                  and          s9, t0, s9
                  and          sp, ra, t1
                  mulh         tp, s5, a7
                  srl          s0, s3, a6
                  sra          s0, s7, zero
                  fmv.x.w      a5, ft1
                  fmin.s       fa0, fs6, fs5
                  lui          s9, 258764
                  ori          s3, s7, -1846
                  nop
                  fsgnjx.s     ft5, fa6, fs5
                  sltiu        s5, a3, -1567
                  slti         a5, a3, -88
                  sra          s1, s5, s2
                  sltu         a3, s6, s4
                  mul          tp, t5, a7
                  fsub.s       fs2, ft10, ft5
                  xor          t1, a2, t3
                  sll          s3, sp, s2
                  ori          ra, s0, -1799
                  xori         s0, s7, 770
                  xor          a2, a4, s0
                  fsgnj.s      fa5, fa4, ft6
                  fmax.s       fs6, fa5, fs7
                  div          a7, s2, s3
                  flt.s        a2, fs5, ft0
                  fclass.s     ra, ft5
                  add          a5, a3, s6
                  flt.s        a7, ft9, ft11
                  fcvt.wu.s    s9, ft8, rtz
                  div          t5, t4, a7
                  fsgnj.s      ft5, fs7, fs2
                  sra          t3, a7, a7
                  sltu         s8, s7, a6
                  fmul.s       ft4, fs6, fs9
                  fcvt.s.wu    ft5, s8
                  slli         t0, s10, 1
                  fmul.s       fs8, fa4, fs9, rup
                  fdiv.s       fs2, fs8, fa1, rmm
                  fmax.s       fa1, fs2, ft2
                  fmul.s       fs8, ft11, ft9, rdn
                  add          a6, a6, a2
                  fdiv.s       ft2, fs11, fa3
                  fdiv.s       fa5, fs7, fs11, rmm
                  fle.s        s9, ft7, fa3
                  sll          s6, s9, s3
                  lui          t4, 779650
                  fmax.s       fs6, fs7, fs6
                  add          s5, a2, s5
                  fclass.s     s1, fs10
                  mulhu        gp, s6, s10
                  or           t0, s2, s11
                  fsgnj.s      fa3, ft8, fs8
                  feq.s        s10, fs8, ft10
                  fsub.s       ft9, ft7, ft10
                  fmin.s       fa7, ft4, ft11
                  fsgnjn.s     fa6, fa0, fa1
                  slli         ra, t3, 7
                  rem          t2, t2, t1
                  fsub.s       fa1, fa2, ft10, rne
                  fsgnj.s      ft1, fs2, ft8
                  lui          s11, 174673
                  sll          t2, t0, tp
                  sll          t4, s7, s1
                  xori         zero, s5, -921
                  mul          t2, a7, gp
                  srl          s2, s2, s7
                  fsub.s       fs5, fs4, fs9, rdn
                  and          s7, a3, t0
                  fsgnjx.s     fs4, fa2, fs9
                  flt.s        tp, fa2, fa3
                  fcvt.w.s     s10, ft9, rne
                  slti         gp, a5, -2010
                  divu         zero, gp, a0
                  mulhu        s5, a5, s8
                  slli         tp, s0, 5
                  andi         sp, s0, -1175
                  fcvt.s.wu    ft3, s10, rdn
                  sll          ra, t0, a5
                  fclass.s     s0, ft9
                  mulh         t4, s3, s6
                  or           s3, t3, s7
                  mul          a6, s7, s5
                  nop
                  xori         gp, a3, -1706
                  flt.s        s3, ft9, fa2
                  mulhu        s10, t4, a3
                  fmul.s       ft7, ft3, fa3, rup
                  divu         t1, t2, t1
                  fmax.s       fs7, fs7, fs9
                  sltiu        a6, a0, 395
                  auipc        gp, 181198
                  fsqrt.s      fa3, fa6, rtz
                  auipc        s8, 1001550
                  slti         t3, gp, 1867
                  nop
                  fsub.s       fa6, fs3, fs11
                  fcvt.wu.s    a2, ft7, rtz
                  mulh         s7, s7, sp
                  mulhsu       a7, a2, t2
                  srli         t2, s6, 2
                  and          s2, a3, s0
                  slt          t2, a5, s5
                  mulh         a5, s9, t6
                  lui          s4, 981684
                  srl          gp, s8, s9
                  divu         s6, t3, a7
                  flt.s        ra, fs2, fs11
                  srli         s7, s4, 1
                  or           s6, t6, t4
                  srli         s11, tp, 9
                  lui          s4, 144231
                  sra          s8, t2, s3
                  remu         s2, t4, s0
                  fle.s        a7, fs4, ft5
                  srl          gp, t4, a7
                  fmv.x.w      s4, ft10
                  andi         s3, s1, -1017
                  fle.s        t1, ft6, fa7
                  xori         ra, gp, 1370
                  sltiu        s9, s6, -219
                  fcvt.wu.s    s2, fa0
                  fsgnjx.s     ft6, ft2, ft10
                  fmax.s       ft5, ft9, ft5
                  div          s9, gp, s6
                  slti         gp, t4, 719
                  remu         t3, t2, s1
                  nop
                  mulh         a7, tp, t3
                  nop
                  nop
                  feq.s        s11, fs5, ft1
                  srli         a7, sp, 26
                  flt.s        s4, ft0, fs11
                  or           a6, sp, a2
                  sll          t1, s10, s7
                  sll          gp, t2, t1
                  srli         sp, a0, 11
                  fmv.x.w      s7, fs5
                  fmin.s       ft4, fa4, ft1
                  lui          s2, 360066
                  fmin.s       fs5, ft6, ft8
                  slt          t2, t1, a5
                  xor          t0, s5, t3
                  fadd.s       fs4, fa2, ft1
                  fsub.s       fs0, ft1, fa7
                  addi         s5, s7, 1961
                  fsgnjn.s     ft2, ft7, fs11
                  fsub.s       ft2, fa2, fs1
                  lui          a6, 529966
                  srai         s1, sp, 2
                  mulhsu       s6, gp, s1
                  flt.s        sp, fs9, fs9
                  srli         s6, s4, 5
                  fsub.s       ft4, fa1, ft6, rtz
                  sll          s9, s2, s11
                  fcvt.s.wu    fs7, t1
                  fmv.w.x      ft5, s3
                  fclass.s     t4, fs0
                  divu         zero, a0, s10
                  fsqrt.s      fs11, fs8, rup
                  mulhsu       s0, a6, t3
                  fdiv.s       fa2, fs11, fa0, rup
                  auipc        s11, 907020
                  flt.s        a6, fs4, ft9
                  fcvt.wu.s    s0, fs0, rne
                  flt.s        ra, fs5, fs9
                  nop
                  flt.s        s7, fa6, ft11
                  mulh         s4, a4, a6
                  rem          s10, s2, s1
                  fmv.x.w      t2, ft9
                  fcvt.w.s     ra, fs1
                  fsgnjn.s     ft3, ft6, ft1
                  auipc        s9, 168828
                  or           t0, tp, s0
                  fsgnj.s      fs10, fs3, fa0
                  andi         t3, s5, -1803
                  divu         t4, ra, s4
                  sltiu        t0, s2, 1153
                  or           s8, t4, s2
                  fcvt.s.wu    ft6, t3
                  ori          t2, a5, 165
                  ori          a2, t1, -1218
                  flt.s        s6, fs7, ft9
                  remu         s6, t2, gp
                  xor          a1, tp, a7
                  or           gp, s6, s2
                  fmul.s       fa7, fs1, fa1, rtz
                  lui          s9, 325106
                  xori         a6, gp, -435
                  sub          s2, zero, a6
                  slli         s8, t0, 27
                  slli         zero, t3, 19
                  addi         a2, t6, 357
                  sltiu        t1, t0, 748
                  fmv.x.w      tp, fs10
                  feq.s        t4, fa3, fa7
                  flt.s        a6, fs8, fa4
                  rem          gp, s11, s9
                  divu         t2, a7, gp
                  ori          s10, s5, 1370
                  ori          t3, s8, -684
                  sra          gp, s0, gp
                  nop
                  fsgnj.s      ft4, fs8, fs1
                  mulh         s5, s1, s5
                  fsgnjn.s     fa7, fa5, fs5
                  slt          t2, a2, t6
                  ori          tp, t0, 1153
                  divu         s3, a3, s11
                  fmul.s       fa2, fs6, ft1, rne
                  or           s7, a3, s11
                  add          s10, s7, tp
                  divu         a2, t6, s5
                  fsqrt.s      ft11, ft10
                  rem          s10, a6, a1
                  sll          s0, s11, a4
                  add          t0, a1, a3
                  fsgnjx.s     fa3, fa2, fs2
                  mulh         s5, a2, t6
                  div          zero, t5, t0
                  fsub.s       fs8, ft9, fa3
                  fmax.s       ft0, fa4, ft7
                  fmax.s       ft2, fa3, ft2
                  fmul.s       fs3, fa1, fs1, rne
                  fsqrt.s      fs6, fs0
                  srli         s5, a5, 9
                  xor          a3, s8, s11
                  xori         t0, s10, 1696
                  rem          s10, a3, t2
                  srl          t3, a1, a3
                  mulh         t2, zero, a7
                  mulhsu       a3, a7, t6
                  fmv.x.w      s8, fs6
                  addi         s10, t2, -874
                  slti         sp, t3, 808
                  mul          tp, a5, s7
                  sltu         a5, s10, s2
                  mulhu        s1, zero, t4
                  srli         t1, t1, 6
                  fsgnjn.s     ft0, ft7, ft7
                  slli         a6, t2, 26
                  fmv.x.w      a7, ft11
                  fadd.s       fa2, fs11, ft8
                  fsgnjn.s     ft2, ft7, fs2
                  feq.s        s11, ft10, fs1
                  mul          s1, sp, s7
                  nop
                  srl          t5, t3, s2
                  fmv.w.x      ft8, s0
                  fclass.s     s4, fs8
                  fmv.w.x      fs9, a1
                  and          t5, s8, a5
                  fsub.s       fa5, fa3, fa2
                  fle.s        t2, fs3, ft10
                  xori         sp, t4, -588
                  fmv.w.x      ft3, s0
                  fclass.s     s7, fa5
                  mulhsu       s2, a6, s11
                  srl          s2, s4, a7
                  fmax.s       fs11, fs10, ft4
                  sll          s8, s3, a5
                  auipc        a6, 984130
                  xori         a6, s9, -1244
                  nop
                  fclass.s     tp, ft0
                  srl          a3, t1, gp
                  slti         s10, t6, -88
                  and          a7, a1, s6
                  slli         t2, gp, 31
                  sub          s11, s8, t4
                  sll          t2, s6, t6
                  fsgnjn.s     ft9, fa1, fs11
                  addi         s5, a4, -1564
                  fsub.s       ft7, ft3, fs7
                  srl          t3, t6, t3
                  sra          t5, s5, s2
                  fmv.x.w      zero, fa7
                  fsqrt.s      fa0, fa2
                  srl          ra, a0, s2
                  feq.s        a6, fs0, ft6
                  fdiv.s       fs0, fs0, ft7, rne
                  mul          s1, s4, a7
                  fsgnj.s      ft2, ft6, ft9
                  remu         s8, s5, s3
                  srli         s4, t0, 14
                  srai         t0, t5, 23
                  fmin.s       ft6, fs10, fs2
                  nop
                  fdiv.s       ft10, ft9, ft1
                  ori          t0, t6, 1082
                  fmv.x.w      s0, ft5
                  sltu         gp, t4, a5
                  feq.s        tp, ft10, fs3
                  fcvt.wu.s    s4, fa4
                  fsgnjx.s     ft8, fs11, ft3
                  fdiv.s       fs5, fs5, fa0, rup
                  fmin.s       fa1, fs8, fs1
                  srl          tp, s1, tp
                  mulh         s0, zero, a0
                  add          t4, a5, s2
                  fadd.s       ft5, ft10, ft3, rup
                  fsgnjn.s     ft3, ft7, fa3
                  fmin.s       fs5, ft10, fs8
                  srli         tp, a5, 30
                  fsub.s       ft8, fa1, ft5
                  sltiu        a1, s6, 1152
                  sra          s10, s9, s3
                  fmv.w.x      ft6, s7
                  fsgnjn.s     ft5, ft1, fs9
                  fmul.s       fs9, fs7, ft9
                  mul          s5, t3, s0
                  feq.s        a6, ft10, fs3
                  xor          a5, t0, a5
                  addi         t0, gp, -866
                  rem          a7, gp, t0
                  fcvt.s.w     ft6, zero, rmm
                  add          s2, t6, a3
                  lui          t2, 484770
                  srli         t1, a7, 6
                  sltiu        t0, a0, -1297
                  sltu         a7, a2, s10
                  fcvt.w.s     sp, fa6, rtz
                  ori          a7, tp, -1780
                  srai         t3, a3, 1
                  flt.s        t3, ft11, ft11
                  fsub.s       fs5, fa3, fa0, rne
                  fdiv.s       fs5, fa7, ft6
                  srai         gp, a6, 3
                  or           a5, a6, a3
                  slt          s4, a6, t6
                  sra          s8, a1, a6
                  nop
                  sra          a2, s5, s9
                  fmin.s       fs5, fa1, fa2
                  slti         s5, s3, -98
                  fmin.s       ft5, ft3, fs2
                  xor          s8, s7, s7
                  lui          t0, 609201
                  fsub.s       fs10, fs1, ft9
                  srai         s10, s7, 14
                  fcvt.w.s     s10, fs3
                  srli         s8, t1, 5
                  addi         s0, gp, 159
                  fsgnjx.s     fs1, ft1, fs11
                  sltiu        t5, s11, 506
                  sra          t1, zero, s6
                  lui          a1, 154530
                  fmv.w.x      fs7, s10
                  sll          gp, t4, ra
                  fcvt.s.wu    fs7, a6, rne
                  fmul.s       fs7, fs0, ft4
                  sra          s4, sp, s5
                  fcvt.wu.s    a2, fa3, rdn
                  fsqrt.s      fa3, fa7
                  mul          s1, sp, t0
                  fclass.s     zero, ft10
                  andi         s11, a6, -979
                  flt.s        a2, fa6, fs7
                  sltiu        a3, a4, -729
                  fadd.s       fa5, ft10, ft4, rne
                  auipc        a2, 389155
                  ori          s7, sp, 695
                  fcvt.s.wu    fa4, s1, rtz
                  rem          s6, t2, s0
                  divu         s11, s9, a0
                  mulhu        s8, s11, a4
                  srai         s1, s5, 10
                  fmv.w.x      fs8, tp
                  andi         s5, s10, 1566
                  fmax.s       fs7, fs1, ft3
                  sub          s2, t3, a5
                  srli         t0, s5, 15
                  fcvt.s.w     ft6, s8, rmm
                  div          s1, t6, s3
                  mulh         s2, a1, t2
                  fle.s        a5, ft3, ft2
                  slti         s1, gp, 1574
                  sub          t3, s3, s0
                  sltiu        ra, t6, -1815
                  and          t2, gp, a2
                  slti         s1, gp, 2046
                  and          a2, s1, s7
                  fmin.s       ft0, fs9, fs9
                  fsgnj.s      fs11, fa0, ft11
                  and          s5, s10, a7
                  nop
                  mulhsu       s1, ra, t5
                  mulh         gp, s0, t1
                  sll          a6, s9, t0
                  fmax.s       fs5, fs8, ft11
                  or           t0, sp, a6
                  slti         a3, t3, 2001
                  addi         zero, s11, 835
                  srai         t2, a6, 12
                  srli         tp, t2, 29
                  fdiv.s       fs5, fs4, ft4
                  remu         t0, t5, t4
                  sll          s11, a6, a6
                  fcvt.s.wu    ft6, s6
                  fsqrt.s      fa5, ft4
                  sub          t5, s5, t2
                  slli         a6, s7, 29
                  fdiv.s       fs10, fs3, ft10
                  and          t2, s6, a1
                  fsub.s       fs8, fa1, fs1
                  xori         a2, s3, -755
                  addi         gp, s0, 1853
                  sub          a3, s7, s6
                  fclass.s     ra, ft8
                  srl          s5, ra, s11
                  fsgnj.s      fs0, fs8, fs0
                  or           s10, a5, t1
                  divu         s3, t1, a6
                  srai         a3, s4, 17
                  div          s10, t5, a1
                  and          a7, t0, s11
                  ori          s5, s10, -1767
                  fcvt.s.wu    fa1, t5
                  addi         t4, s3, -1063
                  ori          s8, a5, 1939
                  fsgnjx.s     ft0, fa4, fs8
                  sltu         s3, zero, sp
                  ori          s11, t3, -1052
                  fsub.s       fs4, fs2, fs10
                  mul          s5, s5, t4
                  fcvt.s.wu    fs3, gp
                  lui          s11, 399667
                  sub          s0, s1, ra
                  mulhu        s9, t0, sp
                  sltiu        s4, s11, 550
                  fcvt.s.wu    fs6, s8
                  fmul.s       ft9, fs0, ft6, rne
                  lui          ra, 348766
                  sltiu        s5, s6, -1525
                  nop
                  xori         a7, tp, -1857
                  fle.s        sp, ft6, fs6
                  mulhsu       a1, s11, s4
                  sltiu        s4, t4, -1320
                  mulhsu       s7, s4, tp
                  xori         t3, ra, -1879
                  feq.s        s3, fs11, ft9
                  fsub.s       ft1, fs0, ft11
                  sll          t0, t1, t0
                  fdiv.s       fs3, ft9, ft5
                  add          s10, s1, gp
                  lui          gp, 309391
                  xor          t4, a7, s8
                  nop
                  addi         s10, tp, -999
                  slli         a3, s3, 6
                  fsgnj.s      fs6, ft2, fs8
                  xori         t5, a6, 1786
                  or           t2, a3, ra
                  add          s6, t1, t0
                  div          t4, s11, t1
                  fmv.w.x      fs9, a5
                  ori          a1, s5, -1963
                  fcvt.w.s     a6, ft10
                  fsgnj.s      fs5, ft11, fa2
                  fsqrt.s      fa4, fa3
                  divu         s8, s1, s4
                  xor          s1, s4, s7
                  addi         t0, a1, -63
                  fadd.s       fs3, ft8, fa6
                  slt          s7, t0, a7
                  remu         ra, s2, s6
                  fdiv.s       ft4, ft2, fs0, rne
                  auipc        a2, 308323
                  flt.s        sp, ft9, fs7
                  slli         a5, a2, 1
                  divu         s0, s2, ra
                  fcvt.wu.s    t3, ft9
                  fmul.s       fs4, fa3, fs4
                  fmv.w.x      ft9, t1
                  fcvt.wu.s    gp, ft11, rmm
                  add          s0, t2, s5
                  or           s2, t0, gp
                  or           gp, t0, s0
                  srl          s9, t5, tp
                  fsgnjx.s     fa5, fa7, fs11
                  mulhsu       t2, a7, a6
                  lui          s3, 131556
                  add          zero, t2, s6
                  fmax.s       fs8, ft1, ft2
                  fcvt.wu.s    t5, ft8
                  fle.s        t5, fs4, fs1
                  rem          s2, a0, t6
                  mulh         a7, t6, a4
                  fmax.s       ft9, fs10, ft3
                  divu         s5, a6, zero
                  srl          t3, tp, s4
                  fsub.s       ft9, fa5, fa6, rne
                  mulhu        a5, t1, a4
                  mulhsu       s2, sp, sp
                  mulhu        s1, a6, t2
                  mulh         t5, tp, s1
                  mulhu        s5, t0, t0
                  andi         zero, ra, 1349
                  and          s7, s6, s2
                  fmul.s       fa7, ft6, fa5
                  feq.s        s9, ft7, ft1
                  sll          s4, s0, s11
                  slti         s9, s3, 1596
                  slli         t2, s11, 0
                  fmax.s       ft3, ft2, fs1
                  xori         a6, s1, 1808
                  fcvt.s.wu    fs5, s8
                  and          s2, t6, sp
                  fsqrt.s      fs9, ft9, rne
                  fsqrt.s      fs3, ft11
                  fsgnjx.s     fs6, fs11, ft1
                  div          t3, t1, s11
                  slt          t0, s11, t3
                  fsgnj.s      fa3, ft5, fa4
                  srli         a6, s4, 10
                  fsgnjn.s     ft7, fs5, fa3
                  rem          s5, a6, t2
                  feq.s        a3, ft2, fs8
                  or           s3, t6, s5
                  mulh         s2, s8, s5
                  srai         s10, t0, 17
                  fsub.s       fa3, fa6, fs9
                  fsgnj.s      fs3, ft7, fa7
                  remu         t0, a1, s5
                  addi         a3, s9, -1087
                  fmv.w.x      fs0, t5
                  slt          s0, s5, s10
                  fsqrt.s      fs2, fs11, rup
                  ori          a6, s10, -721
                  flt.s        s2, fs0, ft10
                  andi         t3, s10, -341
                  fadd.s       fs3, fs4, ft11, rtz
                  slt          t5, s11, s11
                  feq.s        s11, ft6, fs7
                  sll          t3, s1, s0
                  fmin.s       fa7, fa5, ft1
                  fsgnjn.s     fa2, fs1, fs6
                  fmax.s       ft8, fs3, fs9
                  andi         t1, t3, -918
                  fsub.s       ft0, ft3, fa4, rup
                  sra          s6, t4, s6
                  fsgnj.s      fa5, ft11, ft6
                  rem          t1, t4, s9
                  fcvt.w.s     s9, fs2, rtz
                  fcvt.s.wu    fs8, s11, rtz
                  fmax.s       ft6, ft10, fs6
                  fclass.s     t3, fa2
                  addi         gp, s3, 419
                  mul          s2, t6, t0
                  sltiu        a1, s7, 1065
                  fsgnjn.s     fa7, ft1, fs1
                  fclass.s     a6, fs5
                  div          s8, zero, t5
                  mulh         t5, gp, t5
                  fsub.s       fa7, fs10, fs10
                  fsgnjx.s     ft4, fs3, ft6
                  fsqrt.s      fs11, ft3, rmm
                  xor          s5, s0, s3
                  divu         sp, t0, a5
                  fsub.s       fs10, fa5, fs4, rtz
                  nop
                  fsgnjx.s     fa0, ft8, fs8
                  slti         s2, t1, 118
                  or           t5, s0, t3
                  or           a6, gp, s10
                  fmv.x.w      s0, ft10
                  fmv.x.w      t0, fa0
                  mulhu        zero, s8, tp
                  srl          gp, t1, s3
                  ori          zero, a5, -1893
                  fmax.s       ft2, fa5, fs9
                  fcvt.wu.s    s11, fs11
                  sltu         t1, a5, a4
                  fmul.s       ft7, fa3, fa0, rdn
                  slt          t5, t3, s3
                  sll          gp, a0, a2
                  div          a2, gp, ra
                  fmin.s       fs2, fa0, fs0
                  fdiv.s       fa3, ft10, fs7
                  or           s10, a4, s10
                  fsub.s       fs6, fa4, fs5, rne
                  srl          a1, t1, t2
                  or           ra, zero, t1
                  mulhsu       t3, t2, a6
                  fsgnjx.s     ft3, fs3, fs1
                  add          s0, t6, s9
                  slti         t4, s5, 24
                  fle.s        s3, ft5, fa6
                  div          a7, s7, t2
                  rem          a3, a5, a0
                  fmv.w.x      fs4, a0
                  fadd.s       fa0, ft8, fa6, rmm
                  srl          s1, ra, s6
                  fsub.s       ft8, ft4, ft5
                  nop
                  nop
                  xori         a3, t0, -221
                  or           sp, a5, a6
                  fmul.s       fs7, ft2, fs9
                  mulhu        a6, a3, a0
                  srai         s11, a0, 7
                  sltiu        s5, s8, -379
                  mul          a6, s11, t2
                  fmin.s       fa1, fs4, fs4
                  sub          ra, s10, a4
                  fdiv.s       fs1, fs7, ft2, rup
                  and          s2, s9, s10
                  fsgnj.s      ft2, fa1, fs7
                  ori          a2, a2, 2017
                  mulhu        t4, s5, ra
                  srai         t5, t4, 13
                  addi         s10, a5, 325
                  fsub.s       fs6, fa5, ft4
                  srl          s3, t2, s4
                  ori          zero, s9, -36
                  fsub.s       ft6, fa1, ft6
                  or           t0, ra, s6
                  xori         t3, zero, 1885
                  lui          a1, 523730
                  fmin.s       fs5, fs7, ft1
                  and          t5, a7, s4
                  slti         a7, a7, -117
                  slti         s9, t1, -1296
                  feq.s        a5, ft0, fs10
                  fmin.s       ft2, fs8, ft8
                  auipc        t0, 375646
                  fsgnjx.s     fs7, fs5, ft8
                  fmv.x.w      s10, fa6
                  add          gp, s1, a3
                  add          a5, sp, a3
                  divu         s5, t6, a2
                  flt.s        a5, fs10, ft2
                  mulhsu       s0, a7, a0
                  xor          ra, t1, s7
                  feq.s        s8, fs8, fs11
                  feq.s        t4, fs8, fa4
                  fclass.s     gp, ft0
                  mulhu        zero, sp, t6
                  fmax.s       ft8, ft4, ft11
                  fle.s        a5, ft8, fs9
                  sltiu        s2, a3, -1995
                  remu         s3, zero, s6
                  fclass.s     t0, fs3
                  fmax.s       ft9, fs6, ft9
                  fadd.s       fs9, ft2, fa2
                  div          s3, tp, t0
                  srai         s11, t5, 6
                  mulhsu       s1, s11, sp
                  fle.s        s4, fa4, ft6
                  nop
                  xor          ra, s11, t0
                  add          s6, a7, a0
                  add          t0, gp, sp
                  remu         t3, sp, a1
                  fcvt.wu.s    sp, fs9, rup
                  sltu         s0, t3, s6
                  feq.s        sp, fs0, ft8
                  fmul.s       fa2, fa6, fs9, rtz
                  mulhsu       sp, a2, s7
                  xori         t4, t3, -1444
                  rem          a7, s5, a7
                  add          a7, s8, s5
                  flt.s        zero, ft0, fa4
                  srli         a7, a2, 12
                  fcvt.wu.s    a5, fs11, rne
                  andi         t2, t2, 452
                  srli         sp, a0, 2
                  fcvt.wu.s    s6, fa5
                  and          t2, a2, s5
                  fadd.s       ft5, ft11, ft6, rne
                  fsgnjx.s     fs1, ft0, fa2
                  addi         a1, t6, 856
                  fdiv.s       fs2, fa7, ft4, rne
                  srli         zero, a2, 9
                  slli         s0, s9, 19
                  fcvt.s.w     ft0, t1, rup
                  fsgnjn.s     fs8, fs8, fs10
                  fcvt.wu.s    a5, fs7
                  mulhu        a3, t6, a1
                  fsgnj.s      ft3, ft6, ft5
                  flt.s        a3, fs6, fs9
                  mul          s4, zero, s4
                  fcvt.s.w     fa7, a2
                  fmin.s       ft0, fa2, ft8
                  xor          s9, a1, s1
                  flt.s        a7, ft3, fs6
                  add          t1, s7, a2
                  sltiu        t5, s1, -1596
                  feq.s        s9, ft6, fs5
                  xori         t1, t5, 79
                  fsqrt.s      fs5, fa6, rdn
                  rem          t4, tp, s3
                  fcvt.s.wu    fs3, s7, rup
                  fmax.s       fs1, fs2, fs2
                  fcvt.s.w     fs5, s1
                  xor          s11, a7, s11
                  mulhu        s4, a7, a4
                  sra          s3, s11, s5
                  sub          t4, s6, s6
                  xor          a3, t4, s1
                  mulhu        s10, zero, t3
                  fsub.s       fa1, fs7, ft3
                  feq.s        t1, ft11, ft5
                  sll          s8, s10, zero
                  rem          s4, s11, t2
                  fclass.s     sp, ft5
                  mulh         s10, s7, t1
                  div          sp, tp, s5
                  srli         s11, a4, 5
                  sltiu        gp, t3, -665
                  rem          s0, s10, a2
                  remu         s10, t1, gp
                  slt          t0, t2, s11
                  fcvt.s.wu    ft0, s0
                  or           a7, a7, a3
                  lui          s4, 999681
                  xor          gp, a6, gp
                  fcvt.s.wu    fs3, t0
                  mulh         s1, sp, ra
                  fsqrt.s      ft8, fa1, rne
                  fadd.s       ft1, ft4, ft4
                  rem          s7, a0, s0
                  fmax.s       fs2, fa2, ft5
                  slt          a5, s5, s5
                  xor          s1, gp, t2
                  sra          sp, a5, t4
                  fmax.s       ft2, fs5, ft3
                  fmax.s       ft5, ft3, fs6
                  fcvt.s.wu    fa3, a0, rtz
                  slli         t5, s3, 11
                  add          a3, s6, s8
                  andi         a7, a5, 1812
                  fsgnjn.s     fs4, fs0, ft0
                  ori          a6, s10, -508
                  mul          t5, s6, s4
                  div          ra, s0, gp
                  div          t5, a5, a1
                  addi         a1, s0, -220
                  fsgnjn.s     fs4, ft2, fa0
                  srli         ra, s0, 31
                  fle.s        a2, fa6, ft5
                  fmin.s       fa5, fa0, fs5
                  ori          a3, s4, -284
                  auipc        gp, 605979
                  fcvt.w.s     s11, ft4
                  sltu         t5, ra, t0
                  divu         s7, s3, s2
                  mulh         s10, a7, tp
                  fadd.s       ft8, fa3, ft0, rdn
                  fcvt.s.wu    fa6, a6
                  nop
                  fsgnj.s      ft4, ft4, fs11
                  fcvt.s.wu    ft0, tp, rmm
                  fclass.s     a1, ft1
                  add          s7, s7, t0
                  sltiu        s7, t3, 1205
                  fmul.s       ft10, fs6, ft7, rup
                  lui          sp, 591326
                  fle.s        s6, ft0, ft0
                  sll          s10, a5, t0
                  sra          s9, s3, t4
                  add          s11, t4, zero
                  fmin.s       ft6, ft10, ft5
                  rem          a7, t3, s11
                  xor          s2, s8, ra
                  sltu         s8, a3, t1
                  fcvt.w.s     s11, fs10, rne
                  sll          zero, sp, a7
                  fsgnjx.s     ft6, fa2, fs10
                  fcvt.s.wu    fs11, ra
                  xor          s2, s7, s9
                  nop
                  sltu         t0, t2, t6
                  ori          s7, s10, -2031
                  sltu         t5, t2, a2
                  sltiu        gp, t0, -1468
                  andi         a3, t4, -279
                  sltu         t1, a0, a4
                  fdiv.s       ft4, ft7, ft10
                  slli         s8, t3, 7
                  mulh         s6, a7, t0
                  fcvt.w.s     t5, fs7
                  or           t0, a1, a7
                  remu         t3, t1, s3
                  andi         s7, a3, -1485
                  sltu         a5, t0, t2
                  fadd.s       fs5, ft10, ft10
                  ori          t1, t1, -1965
                  fdiv.s       fs8, ft6, fa4
                  fsgnj.s      fa0, ft8, ft9
                  srli         ra, s3, 23
                  mulhu        a7, s11, t2
                  fcvt.wu.s    s6, fs7
                  fsgnj.s      ft7, fs0, fa4
                  slti         s5, t3, -1169
                  and          s6, s9, a3
                  fsgnjx.s     fs10, ft4, fs4
                  sltiu        s8, s8, -2031
                  slti         t0, s4, -550
                  mul          s7, tp, s5
                  andi         tp, t3, 1160
                  ori          s4, a1, -698
                  slt          tp, t5, a1
                  xor          s10, a1, a5
                  fcvt.w.s     a3, fs4, rtz
                  add          t3, s3, s8
                  nop
                  or           s11, t2, s8
                  fsub.s       fa0, ft6, fs1
                  add          s11, s7, t4
                  fdiv.s       fs0, fs0, fs10, rup
                  mulhu        a6, s7, s3
                  addi         t4, s5, 1449
                  remu         ra, s7, t0
                  sra          s8, t2, a1
                  fdiv.s       fs7, ft6, ft11, rne
                  xori         s0, gp, 32
                  fsgnj.s      fa2, fa1, ft5
                  sll          t2, s1, t4
                  slli         a3, sp, 3
                  sltu         t4, s3, a3
                  fmax.s       fs9, fs5, fa3
                  fcvt.wu.s    s3, fa3
                  slt          a7, t0, s0
                  fcvt.wu.s    t2, fs2, rdn
                  srli         t1, s1, 18
                  ori          sp, s2, -192
                  fsub.s       ft6, fa7, fs10, rdn
                  xor          tp, a7, t3
                  srl          a6, sp, s4
                  divu         s6, a7, a1
                  or           s1, s6, tp
                  fmv.w.x      fs5, a6
                  fsgnjx.s     fa4, fs2, ft8
                  fcvt.wu.s    zero, ft4, rne
                  srli         a1, t5, 8
                  fmv.x.w      gp, fs2
                  div          sp, s6, s5
                  fcvt.s.wu    fs8, t2, rup
                  fsgnjx.s     fa2, fs3, ft4
                  auipc        gp, 361916
                  mulh         zero, s1, tp
                  slti         a6, s6, -1068
                  fmv.x.w      t1, fa6
                  ori          t4, s7, 1623
                  fmv.w.x      fs9, s1
                  srai         s1, a3, 28
                  fdiv.s       fs1, fs5, fs2, rdn
                  srl          t4, s11, t2
                  and          s11, s10, a3
                  mulhsu       t2, s7, t2
                  sra          s6, a0, s11
                  mulhu        s11, s10, s4
                  xor          t3, sp, a2
                  divu         s2, t5, s6
                  fsgnjn.s     fs11, ft3, ft5
                  fmax.s       ft10, ft11, ft5
                  fcvt.s.w     fs6, s9
                  sub          s9, a2, ra
                  slti         t2, s10, -635
                  fdiv.s       ft4, fs3, ft0, rtz
                  andi         ra, s7, -1846
                  fcvt.w.s     s9, fa6, rmm
                  fsgnj.s      fa3, fs6, fs0
                  fsqrt.s      ft1, fs3
                  slti         a5, a0, 1568
                  fsgnjx.s     fs1, fs2, fs0
                  fmax.s       fs10, fa6, ft7
                  srli         s2, s5, 12
                  rem          s11, a4, s0
                  xor          s11, t5, tp
                  fcvt.s.wu    ft8, a7, rne
                  fsqrt.s      fs2, fa5
                  srai         tp, a4, 18
                  xori         a5, a6, 629
                  div          ra, a4, s2
                  remu         s7, a5, a7
                  fcvt.s.wu    ft4, a7, rdn
                  fmv.w.x      fs3, s2
                  feq.s        a6, ft6, fa3
                  fmv.x.w      s2, fa1
                  divu         t1, t2, a3
                  mul          t4, t5, a6
                  fmv.w.x      ft10, t5
                  fdiv.s       ft5, fa7, fs10, rup
                  divu         t0, s1, t5
                  sub          s5, s4, a3
                  fsgnjn.s     fs8, ft6, ft5
                  srl          t3, t0, a5
                  xor          t0, s2, s8
                  slli         s4, s0, 9
                  andi         s8, t1, -791
                  fmv.x.w      zero, fs4
                  ori          a5, sp, 444
                  fcvt.s.w     fs3, t6, rtz
                  auipc        t0, 604302
                  fcvt.s.wu    ft3, ra
                  fmin.s       fs1, ft4, fs9
                  feq.s        ra, fa2, fa2
                  mulhu        s4, t1, a6
                  divu         a7, a1, t0
                  rem          a1, zero, s9
                  sra          t2, a1, a3
                  fmv.w.x      fs8, a5
                  mul          s0, s3, a0
                  auipc        s6, 89552
                  sltu         t3, s2, t5
                  feq.s        a6, ft4, fs4
                  fcvt.s.w     fa2, t6, rup
                  fcvt.w.s     s7, fs10, rne
                  or           t2, s9, zero
                  fmv.w.x      ft1, gp
                  fdiv.s       ft3, fa1, fs4, rne
                  addi         s10, s11, 581
                  slt          sp, ra, s11
                  ori          t4, t6, 1391
                  divu         s9, s0, s6
                  divu         ra, s3, a0
                  srli         a1, s1, 23
                  auipc        t5, 44667
                  fmax.s       fa5, fa2, fs2
                  sltiu        zero, t1, 1573
                  feq.s        t0, fa6, ft7
                  fcvt.s.w     ft6, s0
                  xor          sp, gp, tp
                  srl          tp, s4, a0
                  fcvt.s.wu    fs8, tp, rmm
                  add          s8, t1, a1
                  slli         s3, t5, 16
                  fmv.w.x      ft1, a5
                  sltiu        a2, a4, -799
                  add          s0, s8, s5
                  andi         s10, t1, 2046
                  fadd.s       ft8, fs0, fs9
                  srl          t3, s4, a0
                  sra          a6, s8, t0
                  slli         s1, s10, 20
                  div          s6, t4, zero
                  ori          a7, a6, 1990
                  srai         s0, s0, 21
                  fsgnjx.s     fs10, ft10, ft10
                  slt          t1, t1, ra
                  slt          a1, s4, zero
                  fadd.s       fs10, fs0, fs8
                  sll          a1, a2, a5
                  mul          a5, a5, t3
                  fmul.s       ft11, ft9, ft9, rtz
                  feq.s        s4, ft2, fa5
                  fmin.s       fs0, ft9, fa4
                  div          ra, s3, s5
                  mulhu        t5, t2, ra
                  fmv.x.w      zero, fs5
                  slli         s0, a4, 6
                  rem          sp, sp, t6
                  addi         s6, t3, 1815
                  sltiu        t3, s10, -1657
                  xor          t5, a0, t3
                  xori         a3, zero, 257
                  srai         s11, a1, 2
                  div          s5, s6, s0
                  fmin.s       fa5, ft0, fa1
                  fsgnj.s      fs4, fa2, fs0
                  fcvt.s.w     fs10, a3
                  xori         s2, s9, -1177
                  fmv.x.w      gp, fa7
                  fle.s        s2, ft11, fs7
                  srl          t3, gp, t0
                  nop
                  mul          s2, gp, a7
                  fmv.w.x      fs9, s0
                  sltu         s11, a1, zero
                  feq.s        s2, fs10, fs8
                  sub          t5, zero, t3
                  fmax.s       fs6, ft8, fa0
                  xor          t0, a3, a7
                  fmul.s       ft2, fs8, fa2
                  fmv.x.w      ra, ft0
                  mulhsu       s5, zero, t2
                  mulhsu       s8, t2, s10
                  fclass.s     t0, ft9
                  ori          tp, a1, 221
                  sltu         a7, a1, t0
                  remu         ra, a3, s2
                  mul          s9, s6, t6
                  div          s1, ra, a0
                  sltu         s3, sp, s5
                  remu         a1, a0, zero
                  mulh         t2, s10, sp
                  remu         gp, sp, a3
                  mulhu        t3, a6, t1
                  and          a2, ra, s6
                  fclass.s     s3, ft2
                  rem          t0, s4, sp
                  sltiu        t4, a6, -878
                  fmul.s       ft10, fs4, ft6, rmm
                  fle.s        s8, fs6, ft8
                  fmin.s       ft4, fa3, fs0
                  srl          s6, a0, t5
                  andi         a3, s3, -1506
                  slli         t2, t0, 17
                  or           a7, s0, a4
                  mul          sp, s1, ra
                  mulhu        s2, s9, t4
                  mulhsu       t1, a0, s3
                  slti         s1, ra, 1216
                  fmul.s       fa5, ft8, ft5, rne
                  sltu         t2, a5, a6
                  addi         s3, s1, -424
                  fmv.w.x      fs5, t0
                  fmv.w.x      fs9, t5
                  fmv.w.x      fa0, s6
                  fclass.s     s7, fs0
                  fadd.s       fs1, fs5, ft3
                  flt.s        s1, fa7, ft6
                  sltiu        s5, t4, -953
                  fclass.s     t3, ft2
                  fmin.s       ft11, ft2, fs1
                  sub          t5, tp, a2
                  slli         s0, a5, 0
                  lui          ra, 785658
                  sltiu        s8, ra, -674
                  and          s1, ra, a6
                  mulhsu       a3, a6, a2
                  sra          s3, a3, a2
                  fsgnjn.s     fa1, fs2, fs6
                  sll          t1, a5, a7
                  flt.s        a2, fa1, fs3
                  fsgnjn.s     fa6, fa5, ft3
                  sra          t1, a6, s0
                  ori          zero, s4, 1459
                  fsgnjn.s     fs2, fs9, ft10
                  fcvt.w.s     gp, fa1
                  or           ra, s0, t2
                  div          a2, zero, a7
                  slti         a2, s5, -1589
                  lui          s0, 868435
                  fsgnjx.s     ft1, fs6, fs4
                  fdiv.s       fa6, fs1, fs0
                  sltu         t0, a2, s3
                  fmul.s       ft3, fa3, ft10, rdn
                  fcvt.w.s     t2, fa3
                  xori         s11, a3, 1352
                  fsqrt.s      fs11, fa1
                  sltu         sp, a0, s9
                  fsgnj.s      ft5, fa1, ft7
                  fcvt.s.wu    fa0, a6, rtz
                  addi         s6, t4, -1193
                  flt.s        t3, ft9, fs0
                  fsgnjn.s     fa3, fs3, fs4
                  fmin.s       fs6, ft6, ft3
                  sltu         s6, a4, a5
                  auipc        s5, 877961
                  fmul.s       fs7, ft11, fa2
                  sltu         s2, s4, s0
                  slti         a7, zero, 1992
                  nop
                  sltiu        zero, s10, 1585
                  fdiv.s       fs3, fa7, fs10
                  fmax.s       ft2, fa3, ft4
                  div          a5, a1, t3
                  flt.s        sp, fa5, ft6
                  srl          a3, a6, t1
                  fle.s        tp, ft7, fs1
                  sltiu        s2, t5, 881
                  xori         gp, t3, 873
                  fle.s        s10, ft0, fa7
                  mulh         a3, gp, s6
                  mulhu        s10, t5, a1
                  fsgnj.s      fa7, fs9, fa1
                  xor          a1, s6, gp
                  andi         a3, sp, -1707
                  fsub.s       ft5, fa7, fa2
                  fsgnjn.s     fs2, ft1, fs2
                  fdiv.s       fa6, fs3, ft10
                  fsgnj.s      fa3, fa3, fs0
                  divu         t1, t2, s0
                  and          s2, a7, ra
                  flt.s        a5, fs3, fs0
                  addi         t1, s6, -681
                  and          t5, a1, s6
                  auipc        a1, 734519
                  add          s11, a1, gp
                  flt.s        s7, ft1, fa0
                  fsub.s       ft4, fa0, fa1
                  lui          s0, 461082
                  fsgnjn.s     ft7, fa0, fa4
                  remu         s6, s10, a3
                  flt.s        a5, fs7, ft0
                  nop
                  and          tp, a6, t0
                  sltu         t3, s3, t1
                  feq.s        t0, fs0, ft10
                  fcvt.w.s     s11, fa6
                  fmul.s       fs10, fa7, fa4
                  srli         a3, s8, 15
                  fcvt.s.wu    fs6, a4, rne
                  slt          s5, a5, s3
                  div          s5, zero, a1
                  slt          ra, a4, s11
                  fcvt.s.wu    fs11, s3, rtz
                  auipc        t3, 540110
                  nop
                  fmv.w.x      ft0, s1
                  slti         a3, s0, -1997
                  fmin.s       ft7, ft5, ft0
                  slt          t1, sp, t5
                  srai         s10, s9, 10
                  xor          t0, t1, s10
                  slli         s5, s8, 2
                  mul          t0, a2, t4
                  sub          s8, t3, s10
                  mul          zero, t5, tp
                  fclass.s     s1, ft1
                  srai         a3, t0, 24
                  fcvt.w.s     s10, fa5
                  fle.s        tp, ft8, fa0
                  sltu         t0, s3, tp
                  add          a7, a1, tp
                  sra          t4, sp, s6
                  xor          t1, s3, a1
                  fmul.s       fs1, ft4, fs9
                  mul          s1, a0, sp
                  feq.s        sp, fs0, ft6
                  slti         s6, a0, 700
                  fmul.s       ft3, fs8, fa1
                  fcvt.s.wu    fs1, a1, rtz
                  fsgnjn.s     fs6, fs8, fa1
                  and          a7, t4, s8
                  add          s8, a0, a1
                  fadd.s       fa2, ft7, fa0
                  mulhu        t3, a2, s4
                  ori          s8, a2, 1938
                  fle.s        s11, ft8, ft3
                  fsgnjx.s     ft5, fa5, fa0
                  flt.s        s1, ft11, ft1
                  fcvt.wu.s    s6, fs5, rdn
                  flt.s        s10, fa0, ft2
                  fadd.s       ft11, fs5, fs11
                  fsgnjn.s     fa2, ft0, ft7
                  andi         s2, t2, 1808
                  fcvt.s.w     fs5, a3, rdn
                  addi         a3, s6, -825
                  mulh         s3, t5, a5
                  fmul.s       ft2, fs7, fs8, rup
                  fsqrt.s      fs6, fs2, rtz
                  fclass.s     a3, ft5
                  fsgnjn.s     fs2, ft10, fs7
                  or           gp, t3, s5
                  auipc        a1, 362753
                  mulhsu       t2, t0, a1
                  nop
                  fcvt.s.w     fa0, sp, rtz
                  slti         t1, s0, 1802
                  fdiv.s       ft4, fa3, ft7
                  sub          s6, zero, t3
                  fdiv.s       ft8, fa6, fa2, rne
                  fmv.w.x      fa2, a7
                  and          t1, t1, s11
                  divu         t5, s10, t2
                  slti         tp, a7, -96
                  fsqrt.s      ft8, fs0, rne
                  lui          t1, 648158
                  srli         tp, t5, 11
                  ori          s3, a6, -1501
                  mulh         a3, a6, tp
                  sltu         ra, t0, zero
                  div          s6, s9, t0
                  fadd.s       ft2, fa7, ft3
                  slti         s8, sp, 560
                  rem          s11, t6, s11
                  fsgnjx.s     ft9, fs9, fs1
                  srli         t5, s8, 27
                  lui          t1, 337666
                  sll          t4, s8, s0
                  fclass.s     a1, fa5
                  sub          sp, s9, s6
                  flt.s        ra, ft2, fa2
                  flt.s        s5, ft6, fs8
                  auipc        a5, 450601
                  rem          ra, s10, s4
                  mulhu        t2, t6, s2
                  fcvt.s.w     ft9, a5, rmm
                  xori         s8, s7, 361
                  ori          a3, t5, -1420
                  fclass.s     gp, ft4
                  nop
                  fcvt.s.wu    fs0, t2
                  sltu         t2, a4, tp
                  and          sp, a6, t3
                  mulh         s3, s6, s1
                  divu         s2, a6, ra
                  add          s6, t4, s7
                  fdiv.s       fa1, fs7, fs11, rne
                  rem          zero, t6, s8
                  fcvt.s.wu    fa0, a5, rdn
                  slt          t4, a6, a0
                  fle.s        s1, fa3, ft7
                  xori         t0, s10, 28
                  or           s2, tp, a4
                  fmv.x.w      s4, ft5
                  slti         s0, s7, -250
                  sltiu        s8, t1, -1817
                  addi         s1, s2, 1258
                  srl          s9, t4, a1
                  fsgnj.s      ft11, ft9, ft4
                  flt.s        t2, fs9, fs7
                  fsgnjn.s     ft9, fa4, fa4
                  fsub.s       ft10, fs5, ft0, rup
                  mulhu        s11, t5, s3
                  fmv.x.w      s1, fs9
                  mul          a1, gp, s10
                  fcvt.s.w     ft1, t2
                  mulh         a1, t0, a2
                  fle.s        a5, fa4, fs0
                  fclass.s     t5, ft11
                  fmul.s       ft10, fa1, fa2
                  fadd.s       ft4, fa2, fa2
                  divu         t2, s4, t5
                  fcvt.w.s     gp, ft1, rup
                  slti         a6, a5, 2017
                  fadd.s       fa3, ft6, ft8
                  addi         s0, a6, 1649
                  mulhu        a5, s6, a7
                  fle.s        a3, fa4, ft8
                  fadd.s       ft10, ft6, fs2
                  fclass.s     t0, ft11
                  andi         s11, s2, -110
                  fcvt.wu.s    s4, fs10, rup
                  mulhsu       a6, s5, t0
                  sltiu        t3, s0, 234
                  mulh         a5, s8, t4
                  lui          s9, 803425
                  srai         a5, s1, 28
                  sll          s0, s11, s10
                  fsub.s       fs11, fa3, ft1, rtz
                  andi         t5, a1, -1783
                  fcvt.w.s     s9, ft9
                  nop
                  addi         tp, s6, -1801
                  fmv.x.w      t3, ft9
                  sra          s1, s9, zero
                  auipc        s0, 996281
                  sub          a6, s7, zero
                  srai         t0, t2, 25
                  nop
                  fcvt.s.wu    ft3, s5, rmm
                  auipc        t1, 441077
                  srl          s7, s8, s8
                  and          a7, s1, ra
                  srli         tp, a3, 9
                  lui          t1, 821373
                  fadd.s       fs11, fs8, fa7
                  fmul.s       fa2, ft5, fs3
                  fsqrt.s      fs9, ft6
                  fmv.x.w      t0, fs7
                  remu         s4, a1, s0
                  or           s9, s7, s1
                  sltu         s3, t5, s4
                  srl          t5, a3, s9
                  sll          sp, t4, tp
                  feq.s        s0, fs6, ft1
                  fsgnj.s      ft8, ft4, fa5
                  srli         t0, s11, 21
                  fclass.s     s0, ft11
                  fsgnjx.s     fs3, fs5, ft4
                  xor          gp, a6, gp
                  fle.s        a3, ft5, fs6
                  fcvt.s.w     ft7, s10, rne
                  slli         s1, a0, 26
                  fadd.s       fs4, fs10, fs0
                  fcvt.wu.s    s5, fs4
                  mul          tp, t0, s5
                  fclass.s     t4, fa4
                  nop
                  slti         a1, s7, 1597
                  fmv.w.x      fs7, s4
                  fmax.s       fa3, ft6, fa4
                  sltu         t4, a5, tp
                  fcvt.s.wu    ft9, s2
                  xori         t2, sp, -159
                  div          a3, s1, s5
                  fle.s        s0, ft10, fa5
                  fmv.w.x      ft5, a5
                  sltu         t2, a6, s11
                  srai         tp, t3, 31
                  fmv.x.w      s3, fa6
                  div          t0, a0, s11
                  slli         zero, a5, 27
                  fsgnj.s      ft2, ft5, ft5
                  andi         a2, ra, 1329
                  fmax.s       ft6, ft4, fs1
                  fsgnj.s      ft5, fs10, fs9
                  xor          s3, zero, s10
                  srl          s1, s11, s6
                  div          a7, a5, s10
                  fsgnj.s      ft6, fs6, ft5
                  fmul.s       ft3, fs0, fs10, rne
                  ori          a6, tp, 820
                  fmin.s       fs5, ft3, fs2
                  mul          s2, s3, a4
                  xori         s7, ra, 1942
                  slti         s9, s6, 487
                  fmul.s       fs11, fs5, fs9, rne
                  fcvt.s.w     ft1, s5
                  slti         a2, s5, -1028
                  add          s4, s6, s8
                  fclass.s     s5, ft0
                  sltu         a1, t2, tp
                  mulhu        s5, zero, a3
                  srai         gp, a2, 22
                  fmin.s       fs11, fa7, fs3
                  div          a7, t3, a2
                  ori          s2, a3, 527
                  div          a1, s10, t3
                  sll          s4, s5, s4
                  ori          a5, tp, -1947
                  addi         tp, a2, 812
                  srai         s11, t0, 31
                  fdiv.s       ft3, ft9, ft11, rtz
                  srl          t0, a1, a1
                  divu         s11, a6, s5
                  fdiv.s       ft0, ft6, fs4
                  mulhsu       ra, t4, s8
                  flt.s        s9, fa2, ft1
                  nop
                  auipc        t4, 733529
                  fmv.w.x      fs7, t3
                  or           tp, tp, gp
                  sltu         t3, a2, a0
                  srli         a3, a2, 5
                  mulhu        t0, ra, t5
                  sub          a6, t5, a4
                  or           zero, t0, tp
                  fsgnj.s      fs1, ft7, fa7
                  fmv.w.x      ft2, t3
                  auipc        s8, 906477
                  add          sp, t6, a3
                  fdiv.s       fa5, fs6, ft4
                  fadd.s       ft7, ft1, ft5, rdn
                  sub          t0, s7, a0
                  andi         s10, s10, 1944
                  fcvt.s.wu    fa2, s6
                  add          s0, t6, t6
                  sra          s6, s6, zero
                  rem          s0, sp, gp
                  sub          zero, s6, s11
                  fmul.s       ft0, fa4, ft7, rne
                  fdiv.s       ft3, fs1, ft9, rmm
                  fsub.s       fa6, fs9, ft11
                  sub          s2, s9, s0
                  mulhsu       s3, a1, s6
                  fcvt.s.wu    fa0, s2
                  mulh         a5, s6, s6
                  fclass.s     t5, fs0
                  fcvt.s.wu    ft4, s6, rne
                  auipc        s8, 673556
                  addi         s9, s6, 53
                  mul          a1, s5, zero
                  remu         s4, a6, s3
                  fmin.s       ft11, fs6, fa5
                  and          gp, a5, s2
                  ori          t5, sp, 1585
                  fadd.s       fs2, fs8, ft6
                  fsgnjn.s     fs2, fs9, fa7
                  nop
                  srl          s7, s5, a3
                  div          t4, a4, tp
                  fmul.s       fs9, ft4, ft6, rne
                  flt.s        a5, ft10, fa3
                  xori         a7, a7, 769
                  slli         sp, s0, 7
                  rem          s0, s1, a5
                  fmv.w.x      fa3, zero
                  sll          tp, s9, s6
                  remu         a5, s8, ra
                  slti         s7, sp, -1809
                  fcvt.w.s     t4, fa5
                  fcvt.s.wu    fs5, t4
                  mulhu        zero, zero, s6
                  and          a5, a5, s7
                  fadd.s       fa1, ft3, fs5, rtz
                  flt.s        s10, ft10, fa0
                  srli         s11, s5, 16
                  sub          ra, zero, s9
                  auipc        gp, 531431
                  lui          t1, 566236
                  fcvt.s.wu    ft6, t6
                  slt          a6, a1, s7
                  srli         t5, s8, 13
                  slt          ra, t6, a7
                  fdiv.s       ft10, fa5, fs4
                  fmul.s       fa0, ft8, ft3, rtz
                  divu         a1, gp, s0
                  sub          a2, a0, ra
                  or           s4, s8, t4
                  srli         s4, t0, 3
                  add          t3, s2, gp
                  fmv.w.x      ft10, s6
                  mulhsu       ra, a4, t1
                  slti         s11, a6, -1626
                  slt          s10, sp, sp
                  sra          s2, s7, t4
                  fmax.s       ft0, fa1, fs10
                  fclass.s     sp, fa6
                  add          s6, s1, zero
                  fmax.s       ft8, fa2, fs4
                  fcvt.s.wu    ft1, a0
                  auipc        t4, 818208
                  srai         s2, s1, 29
                  slli         s1, a0, 20
                  fsub.s       fs7, fs3, fs3, rup
                  rem          s9, s9, t4
                  srli         s2, s10, 9
                  feq.s        s10, fa1, fs7
                  mulhsu       tp, zero, a2
                  fadd.s       fs11, fs2, ft9, rtz
                  fmin.s       ft6, fs11, fs4
                  fle.s        a7, ft1, fa5
                  sll          s8, s1, s4
                  fcvt.wu.s    s4, fs2
                  fmax.s       fs0, fa1, fs9
                  fmv.x.w      s0, ft8
                  fcvt.s.wu    fs2, a3
                  slti         s0, s6, -1679
                  or           a1, a4, a4
                  sltu         s7, s1, a6
                  slt          t1, a0, a6
                  srli         s2, s0, 28
                  slti         s8, t1, 1866
                  fsgnjn.s     ft2, ft7, fa5
                  fmin.s       ft10, fa4, fs7
                  srli         t0, t6, 31
                  fsgnjn.s     fs2, fa3, ft8
                  mul          ra, a4, s5
                  addi         t1, ra, 859
                  fmul.s       ft9, fs9, fs9, rup
                  fadd.s       fs8, ft3, fs8
                  fsgnjx.s     ft7, ft8, ft1
                  add          s7, a2, s1
                  sub          t3, s2, s9
                  auipc        zero, 457481
                  srl          a6, gp, zero
                  mulhsu       s11, t2, t6
                  fle.s        s10, ft8, ft1
                  srl          s7, a3, a4
                  fsgnjn.s     fs3, fa1, fa3
                  addi         t5, sp, 877
                  fcvt.wu.s    t1, fs4, rne
                  xor          s6, s5, s6
                  andi         s2, s5, -1976
                  srai         s1, tp, 7
                  sub          s9, t6, s0
                  ori          tp, s8, 1467
                  add          s6, s2, zero
                  flt.s        t2, ft1, ft6
                  rem          s8, gp, a7
                  auipc        a3, 845068
                  fcvt.s.wu    fs1, s5, rmm
                  flt.s        zero, fa5, fs3
                  and          s6, t0, s8
                  fle.s        a3, ft7, ft5
                  nop
                  flt.s        a1, fa3, fa1
                  div          t0, t1, s0
                  fsgnjx.s     fs9, fs7, ft6
                  feq.s        a6, fa6, fa6
                  xor          gp, a3, s9
                  fcvt.wu.s    a7, fs10, rne
                  sll          t1, tp, a5
                  fsgnjx.s     ft10, fs2, fs6
                  srli         a6, t3, 29
                  mulhu        ra, s2, t5
                  ori          s1, a5, -1355
                  fcvt.s.w     fs3, s10, rdn
                  mul          a7, ra, a7
                  sll          a5, t5, s9
                  fmv.x.w      a7, ft0
                  feq.s        sp, fa7, ft11
                  sll          s10, t5, s0
                  sub          s7, a5, a1
                  mul          t0, a5, a1
                  slti         s9, s0, 421
                  xor          s5, t5, s8
                  fsgnj.s      fs3, fs4, fs11
                  fcvt.s.w     fa4, a3, rne
                  fcvt.s.wu    fa0, a4, rdn
                  mulh         t0, s3, a3
                  slli         zero, s0, 7
                  fmin.s       fs4, fs8, fs3
                  fcvt.wu.s    s11, fs5
                  xor          s0, t3, tp
                  div          a3, s8, s1
                  mulhsu       a6, s9, t2
                  xori         gp, t1, -1695
                  srli         gp, t3, 13
                  fmv.x.w      t0, fa5
                  fcvt.w.s     zero, fs5, rne
                  fcvt.wu.s    s9, fa4, rmm
                  slli         a2, s4, 6
                  mulhu        a2, t2, s9
                  mulhsu       s2, s1, zero
                  fsub.s       fa5, fs9, ft9
                  sltiu        s11, a1, 1356
                  fle.s        sp, fa5, fs3
                  sra          s4, s6, sp
                  nop
                  slti         s7, s4, -123
                  divu         s11, zero, t4
                  flt.s        s0, fs10, fa0
                  fsgnjn.s     fs2, fa3, fa1
                  sra          t4, sp, sp
                  fsgnjn.s     ft9, fs7, ft5
                  lui          tp, 411714
                  srai         a2, a5, 12
                  fdiv.s       fa3, fa3, ft1, rdn
                  fmax.s       fs6, ft0, fs8
                  remu         s6, zero, t0
                  nop
                  slli         a1, a2, 14
                  div          t5, a5, t2
                  sra          s7, a6, a7
                  sra          t0, a3, s10
                  sltiu        s4, gp, 1804
                  fsgnj.s      fa3, fa4, ft0
                  fmul.s       fa5, fa3, ft3, rdn
                  srli         t1, a0, 28
                  andi         s6, a4, 1185
                  fsgnjx.s     ft4, ft8, fs6
                  nop
                  fle.s        s11, ft2, fa7
                  auipc        t1, 175386
                  fadd.s       fs0, fs6, ft0
                  ori          gp, s9, -207
                  fsqrt.s      fs3, fa2, rup
                  lui          s9, 628533
                  mul          a5, s7, gp
                  add          zero, a6, s11
                  fcvt.s.wu    ft2, s0, rtz
                  fmax.s       fa6, fa1, fs10
                  fcvt.s.wu    fa4, a2
                  fmv.w.x      ft0, t6
                  remu         t3, t2, t6
                  fsqrt.s      ft11, ft9, rdn
                  ori          gp, s11, -247
                  fsgnjn.s     fs0, fs11, ft2
                  fle.s        t2, ft8, fs9
                  divu         t2, s0, gp
                  fcvt.wu.s    s5, fa7
                  slli         s2, s8, 19
                  fcvt.wu.s    t2, fa6
                  fsgnjx.s     fs11, fs9, ft7
                  or           t3, s0, sp
                  fcvt.s.wu    fs2, t0
                  fmax.s       fa1, fa0, fs8
                  srl          ra, t0, s10
                  ori          sp, s1, -1041
                  rem          s4, s4, gp
                  fsgnjn.s     fa1, fs4, ft1
                  fmul.s       ft4, ft4, ft6, rup
                  andi         a2, s7, -879
                  flt.s        a7, fa1, fs9
                  fsub.s       ft7, fs1, fa7, rne
                  mulhsu       s2, zero, a6
                  add          t2, s4, t6
                  fcvt.w.s     a1, fs5, rup
                  rem          tp, t2, s10
                  slti         a1, t2, 1441
                  auipc        s8, 691716
                  nop
                  fcvt.w.s     a1, fa0, rtz
                  mulh         s5, s3, s1
                  sltu         t0, s11, a2
                  sub          s7, t4, a4
                  div          s6, s7, t6
                  xori         s6, s5, 40
                  fsgnjx.s     fs0, fs10, fa0
                  sltiu        s8, t5, 390
                  add          a2, t3, zero
                  sub          sp, s5, s8
                  mul          a3, s9, s11
                  ori          gp, a2, -2023
                  fmax.s       fs1, ft3, ft0
                  feq.s        a3, fa0, fs8
                  srl          a5, a0, t2
                  remu         tp, a4, a2
                  auipc        gp, 411012
                  slt          ra, s4, zero
                  mulhu        s7, t1, a3
                  mulh         s6, s9, s7
                  sltu         t0, s0, s7
                  mulhu        a7, a2, a1
                  remu         s10, s3, a2
                  sltiu        a1, ra, -1152
                  ori          a3, s0, -1964
                  slt          t0, a3, s2
                  fsub.s       fa4, ft8, ft1, rtz
                  slli         t0, gp, 12
                  fsqrt.s      fs5, fs0, rne
                  fsgnjx.s     fs9, ft2, ft11
                  lui          s1, 610460
                  mulhsu       s5, s9, s7
                  fcvt.w.s     t0, fs2
                  srli         tp, t1, 1
                  sltu         t0, s1, s6
                  fsub.s       fs7, fa3, fs5
                  div          s9, s3, t6
                  xor          s6, tp, t3
                  fle.s        s7, fs11, ft7
                  fcvt.w.s     a2, fs1
                  ori          s7, a0, -1853
                  and          t4, a6, t6
                  lui          s0, 627642
                  fmv.x.w      s10, fs0
                  rem          t0, t5, a3
                  fsqrt.s      fa6, ft0
                  fcvt.w.s     s5, fa1
                  xor          a3, t5, a4
                  andi         a6, a1, -629
                  fsqrt.s      fs2, fs2
                  div          a3, sp, s2
                  auipc        s3, 646856
                  fcvt.s.w     fs1, a7, rup
                  xori         a6, a1, -125
                  mulhsu       tp, t2, t3
                  fsgnjx.s     ft10, fs2, fs8
                  slt          a2, a2, a3
                  rem          a3, s7, t5
                  slti         t5, t1, 56
                  feq.s        s10, ft3, fa5
                  nop
                  srli         tp, a2, 14
                  mulhsu       a3, s2, s0
                  mulh         s0, s3, s3
                  sub          ra, s0, a6
                  fcvt.s.w     ft0, gp
                  sltiu        ra, a7, 753
                  lui          s3, 566268
                  fmax.s       fs3, ft3, fs8
                  slt          t0, sp, a1
                  sll          a2, a1, t4
                  mulhu        s2, t5, sp
                  slt          t3, s9, s10
                  xor          t3, s0, gp
                  mulh         s5, s5, sp
                  xor          zero, gp, s7
                  srai         ra, ra, 30
                  fsgnjn.s     fs3, fa7, fs10
                  sltu         tp, sp, s4
                  sra          s2, a3, t4
                  mulhsu       a7, t3, t1
                  fcvt.s.wu    ft5, a4
                  fcvt.wu.s    s5, ft10, rmm
                  fmul.s       fs0, fs10, ft5, rup
                  sub          t2, t5, s9
                  sub          t4, a1, t5
                  slt          t1, tp, t3
                  div          ra, s11, a0
                  and          s2, s6, t2
                  fcvt.wu.s    t4, fs8, rne
                  lui          a6, 374748
                  fcvt.s.w     fs10, t0
                  mulhsu       t5, a6, s5
                  srl          s4, s8, t1
                  fcvt.s.wu    ft0, s9, rtz
                  addi         t0, t5, 1393
                  sltu         s6, a2, a7
                  fsgnj.s      ft4, fs4, ft11
                  fsgnj.s      fs0, ft0, fs0
                  rem          tp, s9, s7
                  fadd.s       fs4, ft1, fs1
                  flt.s        sp, ft3, ft11
                  fsqrt.s      ft0, fs0
                  sll          s3, gp, s0
                  sll          a2, t6, t4
                  slli         s7, zero, 10
                  xor          s6, s0, s7
                  or           s0, t2, t1
                  remu         s6, s10, s0
                  mulh         tp, s10, s4
                  sltiu        a6, sp, 1288
                  fmv.w.x      fs9, s11
                  sltiu        s10, t3, 1656
                  mulhu        tp, s2, ra
                  slt          t5, s4, s0
                  mulh         t2, t0, s0
                  addi         t2, a3, 1004
                  fadd.s       ft7, ft9, fs10
                  or           t2, a4, s9
                  fmv.x.w      a1, ft3
                  srli         a3, s0, 11
                  add          s3, s0, t0
                  fmax.s       ft0, fs5, ft4
                  fcvt.s.wu    fs7, t4, rdn
                  flt.s        s0, fs10, fa5
                  auipc        a2, 219108
                  fclass.s     sp, fs8
                  auipc        s8, 895042
                  lui          a2, 1033322
                  sub          a6, a1, tp
                  fmv.w.x      fa4, gp
                  andi         a7, s5, -1796
                  fcvt.w.s     s6, fa1, rdn
                  fcvt.wu.s    t3, fa3
                  fmv.w.x      fs10, s0
                  fdiv.s       ft7, fs9, fa7, rne
                  sub          t3, ra, a3
                  mulhsu       s8, s1, s11
                  fmin.s       fs3, ft1, ft6
                  sub          a7, t3, t6
                  srli         s0, a0, 15
                  add          s1, s2, a0
                  sltu         t2, gp, t2
                  remu         t0, a3, sp
                  fmul.s       fa1, ft10, ft2, rup
                  div          s1, s3, s4
                  sll          ra, s10, a6
                  feq.s        zero, fa7, fs9
                  fmax.s       fa0, fs8, ft0
                  xori         a3, t3, -607
                  and          t1, a5, tp
                  addi         a3, a7, -570
                  fsub.s       fs10, fs5, ft2, rup
                  fcvt.s.w     fs7, a1, rdn
                  slt          a6, s2, s5
                  remu         a2, tp, a0
                  sltiu        s2, gp, 1664
                  fmul.s       ft3, fa1, fs10, rdn
                  fmv.w.x      ft10, t3
                  mulh         t4, s0, tp
                  addi         s0, s0, 113
                  fadd.s       fs3, fa6, ft8
                  fmul.s       fs8, fs5, fa7, rmm
                  fcvt.s.w     fs3, tp, rtz
                  mulh         t5, a7, a5
                  slt          t1, tp, t5
                  lui          s5, 810295
                  fsqrt.s      fa4, fs2, rne
                  sltiu        sp, s1, -554
                  fmin.s       fa1, ft4, fs0
                  slti         a7, t5, -1164
                  fsub.s       ft8, ft7, ft3
                  fsgnj.s      ft8, fs3, ft11
                  fdiv.s       fs6, fa7, ft1
                  lui          t1, 405733
                  rem          a1, t5, tp
                  ori          s11, t1, -727
                  sub          t2, t4, t6
                  slti         s10, a2, 535
                  fmul.s       ft3, fs1, ft7
                  rem          a5, s11, t0
                  sll          zero, tp, tp
                  xori         s0, tp, -2007
                  fclass.s     gp, fa1
                  feq.s        zero, ft3, ft6
                  auipc        a6, 302674
                  mulhu        a5, a7, s6
                  add          t5, s5, t2
                  or           s9, tp, t3
                  lui          t4, 496661
                  mulhsu       s10, a7, a2
                  sltiu        a7, t3, 991
                  slli         a7, a7, 0
                  mulh         s1, s7, ra
                  lui          sp, 50346
                  mulhsu       t5, sp, s5
                  auipc        s0, 597200
                  and          s8, t6, sp
                  fsgnjx.s     ft6, ft4, fs1
                  srai         t3, s9, 14
                  or           a2, a3, t2
                  sltiu        s3, tp, -1848
                  and          s6, t0, a2
                  slti         s5, a0, 292
                  fcvt.s.wu    ft2, s7
                  mul          a5, s4, sp
                  auipc        a1, 879130
                  sub          ra, a3, t0
                  div          s2, gp, zero
                  sra          s2, ra, s7
                  srl          t1, s1, s9
                  fcvt.s.w     fa6, s5
                  rem          s3, s4, t2
                  fdiv.s       ft11, fa5, fs0, rtz
                  xor          tp, s2, t5
                  fmv.w.x      fs10, ra
                  rem          s4, ra, a7
                  fcvt.s.wu    ft10, a4, rne
                  sll          s5, a2, s10
                  slt          a5, s5, sp
                  sub          s7, s1, gp
                  srl          t3, s8, s11
                  mulhu        zero, s10, sp
                  fsub.s       fs10, ft10, fs4, rmm
                  slt          t3, a0, a7
                  slli         s2, s0, 2
                  sra          ra, s3, s9
                  add          s11, t2, a0
                  nop
                  mulhsu       a3, s2, s11
                  divu         a6, s4, t3
                  sub          gp, s10, t3
                  and          a2, tp, s10
                  fle.s        zero, ft3, fa7
                  mulh         gp, a5, s10
                  sub          a6, tp, a5
                  fle.s        t5, ft9, fs5
                  srl          s10, t2, sp
                  fsqrt.s      fs7, fs2, rup
                  ori          t0, t2, 1394
                  sltiu        a5, s1, 224
                  divu         s2, s8, s10
                  fsgnjx.s     fa2, fa6, ft6
                  xori         gp, zero, 1042
                  slli         t5, s1, 0
                  fmul.s       fs10, fs2, fs6
                  lui          s1, 174444
                  slli         t4, s11, 6
                  auipc        s9, 13008
                  andi         a2, s4, -523
                  mulhu        tp, s4, gp
                  xori         t2, zero, 1044
                  fclass.s     s1, ft6
                  rem          t2, s11, s9
                  add          s3, s10, s2
                  fmul.s       ft8, fs7, fa3, rtz
                  sra          s10, ra, a3
                  fcvt.s.w     ft1, sp, rne
                  xor          a7, s9, t6
                  addi         gp, t6, -2031
                  sll          s0, a7, t1
                  ori          sp, s5, 1544
                  fsgnj.s      ft1, fa5, ft6
                  div          a1, sp, s10
                  nop
                  and          zero, a7, a6
                  andi         a6, s0, 1681
                  rem          s1, s10, t3
                  sll          a7, a0, s10
                  nop
                  divu         s8, a1, s1
                  auipc        t2, 754309
                  fsub.s       ft11, fs11, fa5, rmm
                  and          a3, s5, s6
                  fsgnjn.s     fa3, ft10, ft6
                  fmv.x.w      s11, ft4
                  srai         s11, ra, 10
                  fle.s        s11, fa4, fs10
                  slt          s6, t0, a4
                  auipc        gp, 102842
                  fsub.s       ft11, ft10, fs7
                  fcvt.wu.s    s5, fs5
                  fadd.s       ft3, fs1, ft1
                  xor          zero, s9, a1
                  ori          gp, t6, 238
                  fsgnj.s      fa3, ft5, fs0
                  fsgnjx.s     fs6, ft7, ft7
                  or           t3, s10, s8
                  sra          t3, tp, t3
                  auipc        gp, 793483
                  fle.s        a5, fs6, ft3
                  fmin.s       fa1, fa5, ft0
                  and          s10, s0, t6
                  sub          s2, a4, s7
                  remu         a2, a7, a4
                  mulh         a7, s10, t4
                  div          s1, t6, t4
                  mulhu        s1, t1, s0
                  nop
                  sub          s3, t0, a0
                  and          t3, a7, s8
                  slti         a7, s11, -262
                  feq.s        s6, ft2, ft10
                  ori          t0, a3, 419
                  srai         tp, a7, 16
                  slt          a7, s6, s9
                  auipc        s7, 497309
                  sra          a3, a3, tp
                  fmin.s       fs5, ft9, ft9
                  fclass.s     s6, fs2
                  slt          gp, a6, t0
                  lui          s2, 458006
                  auipc        s1, 834746
                  fsgnjx.s     fs1, ft0, ft8
                  fmin.s       fs1, fa4, fs0
                  sub          s0, a2, s4
                  andi         t3, s1, -1097
                  add          a3, s3, t6
                  add          a6, a4, t0
                  auipc        t3, 486907
                  addi         s5, tp, -810
                  divu         a1, s11, s3
                  mulh         a2, s8, a1
                  nop
                  fclass.s     a1, fa4
                  mulhsu       s9, t3, zero
                  fsgnjn.s     fa5, ft4, ft4
                  fadd.s       ft4, ft3, fs11
                  divu         gp, a6, a3
                  fcvt.wu.s    a6, fa7
                  auipc        s3, 853170
                  fle.s        s11, ft9, ft1
                  fle.s        s3, fa4, fs3
                  ori          t0, t6, -744
                  fmul.s       fs11, fa3, fa2
                  ori          zero, s1, 1127
                  and          zero, s0, s10
                  sltiu        t1, a4, 1339
                  fadd.s       fs9, fs1, ft6
                  xor          a6, ra, a7
                  srai         a6, s7, 27
                  fcvt.wu.s    t3, ft3, rmm
                  slli         s9, s6, 25
                  fsgnjx.s     fa3, fs4, ft11
                  sub          sp, s10, a2
                  ori          t1, a4, -581
                  or           t0, a7, s3
                  fmin.s       fs3, fs9, ft10
                  xor          a6, s5, s0
                  slt          s0, t2, ra
                  srai         tp, t6, 3
                  addi         s9, s2, 818
                  slli         s11, s11, 22
                  andi         s11, tp, 1094
                  fmv.w.x      ft6, gp
                  fsgnjx.s     fs5, fa1, fs0
                  fcvt.w.s     s6, fs11, rmm
                  fmv.w.x      ft10, t5
                  divu         a3, a1, a0
                  slt          a2, s4, s9
                  auipc        tp, 982328
                  feq.s        gp, fs0, ft8
                  fdiv.s       ft3, fs4, fs4
                  mulhsu       a5, tp, gp
                  divu         gp, s7, s3
                  fdiv.s       ft5, fa1, ft4, rtz
                  fadd.s       ft6, fs1, fa7
                  ori          ra, a2, 1674
                  fcvt.s.w     fa3, a0, rmm
                  fclass.s     gp, ft10
                  fmul.s       ft5, fs4, fa4
                  fcvt.wu.s    s5, ft3
                  fmv.w.x      fs8, t3
                  fsgnjx.s     ft7, fs6, fa6
                  srl          t0, tp, a1
                  andi         s5, t4, 984
                  slt          t4, a6, ra
                  nop
                  srl          t0, s6, s2
                  fcvt.wu.s    s3, ft1, rne
                  xori         s2, t0, 749
                  remu         s7, t2, a0
                  fcvt.s.w     ft9, t3, rup
                  fmul.s       fs4, fs3, fs2
                  srli         a6, s7, 28
                  div          a7, t5, a4
                  nop
                  mulh         t3, t1, s11
                  flt.s        a6, fs0, fa1
                  remu         t5, t3, s2
                  sub          s0, s3, a4
                  fcvt.wu.s    s9, fs6, rdn
                  addi         s8, t5, 1747
                  lui          ra, 843231
                  fcvt.wu.s    s9, fa7
                  div          a5, a6, a6
                  mulh         a2, s10, a0
                  fmv.x.w      s8, fa1
                  xor          a5, tp, s6
                  flt.s        a1, fs2, fs2
                  sub          t1, s5, t0
                  flt.s        a5, fs10, ft10
                  divu         tp, a4, a7
                  nop
                  divu         gp, s0, a1
                  andi         s0, t1, -668
                  sra          s0, s6, ra
                  rem          s8, a4, a5
                  auipc        s4, 318495
                  sll          s4, t2, s5
                  slli         t4, s2, 5
                  fmv.x.w      a3, fs1
                  fclass.s     t2, ft7
                  mulh         t3, s4, s4
                  ori          a1, t5, -1976
                  fmul.s       ft2, fa6, fs4, rtz
                  xor          ra, s9, s6
                  sra          zero, a4, a0
                  fadd.s       fa2, ft10, fa1
                  mulhsu       t2, t1, t3
                  fsub.s       ft2, ft9, ft8
                  fmax.s       ft10, fa5, ft7
                  addi         s9, s2, -1404
                  sra          a2, s1, t0
                  mul          s5, zero, s0
                  or           t5, s2, t6
                  mul          t5, s4, s11
                  div          t2, a3, s7
                  fmul.s       fa6, ft11, ft5, rne
                  sub          a2, a0, t2
                  fmin.s       ft3, fa4, ft3
                  andi         gp, t2, 101
                  fdiv.s       fa5, ft10, ft4
                  mulh         s3, gp, t0
                  mulhsu       s5, s10, a1
                  fadd.s       fa0, fa4, fs3
                  fsgnj.s      ft4, fs0, fa0
                  nop
                  rem          t5, a7, s7
                  fclass.s     s1, fs6
                  mulhsu       a3, s9, s4
                  slt          s6, s1, s10
                  fcvt.wu.s    a2, fs5, rdn
                  fcvt.s.wu    fa7, a2, rdn
                  and          s8, s6, s3
                  xori         t2, t3, 1884
                  srai         s9, s1, 11
                  rem          s8, ra, t5
                  fmul.s       fs3, ft11, ft0
                  fsgnj.s      fs1, fs10, fa0
                  auipc        s7, 101994
                  fsgnjn.s     ft2, fs1, fs5
                  xor          gp, t4, a7
                  fsgnjx.s     fs4, fa2, ft5
                  fcvt.s.w     fs8, s8, rmm
                  add          s3, s3, s9
                  slli         s6, s4, 5
                  fmin.s       fa3, fs3, ft11
                  mul          s3, s5, s6
                  fclass.s     s8, fa6
                  fdiv.s       fa6, fa0, ft8, rtz
                  fclass.s     t5, fs11
                  mulhsu       t2, s11, a5
                  addi         zero, s10, -822
                  fmv.w.x      ft5, s3
                  fadd.s       fs7, fa5, ft6, rmm
                  slti         s7, s3, 387
                  fmv.w.x      ft0, t4
                  flt.s        s0, ft5, ft11
                  divu         gp, s9, s2
                  auipc        zero, 771778
                  fsgnjx.s     fs0, fa7, ft4
                  srai         a7, s9, 6
                  andi         t1, gp, -61
                  fmul.s       fa7, fs5, ft7, rmm
                  sra          s4, s2, t0
                  fadd.s       fs8, fa7, ft9, rdn
                  fadd.s       fa0, fs1, fs1
                  fclass.s     t5, ft9
                  fcvt.wu.s    t1, fs7, rtz
                  fcvt.w.s     t5, fs0
                  divu         t0, t4, s8
                  nop
                  addi         a5, a0, 1152
                  fsgnj.s      ft3, ft5, ft8
                  srai         sp, t0, 22
                  fcvt.w.s     s6, ft11, rtz
                  fclass.s     s10, fs0
                  fcvt.wu.s    s3, fa0
                  xor          t2, tp, t3
                  divu         sp, s2, t2
                  andi         t1, s4, 746
                  sltiu        zero, s9, -746
                  fcvt.w.s     s2, fa7
                  and          a2, a3, s0
                  fcvt.s.wu    fa5, ra
                  xor          t0, ra, tp
                  fcvt.w.s     s10, fs11, rne
                  fclass.s     a5, fs8
                  sub          t5, zero, sp
                  mul          t1, t0, s0
                  slt          s10, a6, t3
                  srli         s4, s11, 23
                  ori          s3, a7, -545
                  slli         s1, a0, 16
                  nop
                  mulhu        a2, t4, t5
                  xor          a5, s9, a1
                  add          s3, t5, tp
                  remu         a2, a5, s2
                  add          a5, s5, sp
                  fmax.s       fs2, ft2, ft6
                  nop
                  fadd.s       ft10, fa2, fs2
                  flt.s        a6, fs6, fa3
                  fcvt.s.w     fs3, ra, rup
                  srl          s9, t2, a0
                  addi         t4, s11, 569
                  addi         t4, t6, 1541
                  mulhsu       s3, s1, s2
                  fmul.s       fs9, fa4, fs5
                  srli         sp, tp, 9
                  feq.s        s8, ft8, ft6
                  mul          a5, t6, a5
                  srl          a5, a5, s0
                  srli         s9, s8, 16
                  srl          a2, s7, s7
                  div          s9, s5, ra
                  slt          t0, s0, a5
                  fmul.s       fs7, fa2, ft10, rmm
                  fmv.x.w      sp, ft5
                  fmul.s       fs1, ft3, fs2
                  fmin.s       fs11, ft1, ft10
                  fadd.s       ft2, fs1, ft0, rne
                  fmax.s       fa2, ft7, ft9
                  mulh         s9, s0, s9
                  fmv.w.x      ft5, a4
                  fmv.x.w      ra, fs4
                  add          sp, a1, t4
                  fmax.s       fa0, ft3, fa0
                  div          zero, a0, s7
                  andi         s1, a4, -1685
                  fcvt.s.w     fs3, a1
                  fmul.s       ft4, fa2, fs0, rtz
                  fcvt.w.s     a6, ft4
                  divu         a5, a2, t4
                  fcvt.wu.s    a5, ft10, rup
                  fmv.w.x      ft3, s11
                  sub          s1, ra, s8
                  sltiu        s11, ra, -92
                  andi         s5, a0, 1225
                  fle.s        s7, fa0, ft2
                  fsgnjn.s     fs6, ft1, fa5
                  rem          ra, a2, t3
                  fmv.w.x      fa3, a7
                  mulhsu       zero, t5, s4
                  sltu         s6, sp, tp
                  fcvt.w.s     a1, fs4, rtz
                  slli         a1, gp, 21
                  mulhsu       a2, a3, gp
                  fcvt.s.wu    fs6, s2
                  add          s0, t6, t3
                  fsgnjx.s     ft6, fa4, ft11
                  addi         ra, s0, 445
                  srai         s0, t3, 5
                  sltiu        s8, zero, -1343
                  nop
                  mulh         a1, a3, a7
                  fclass.s     t2, fa0
                  fmv.w.x      fa4, a5
                  sra          s0, a7, t5
                  divu         s5, s3, a3
                  fcvt.wu.s    s7, ft8, rup
                  slti         s2, t2, 1931
                  fadd.s       ft8, fs6, ft4, rup
                  fmax.s       fs5, fa7, fa5
                  fcvt.s.wu    fs4, s10
                  fsub.s       ft4, ft1, fs7, rup
                  mulhsu       a7, t6, s4
                  fmin.s       ft7, fs8, ft8
                  div          s10, sp, t6
                  addi         s10, t6, 134
                  flt.s        sp, fs6, ft8
                  fcvt.s.w     fa7, s0, rdn
                  sra          ra, sp, sp
                  or           tp, s8, a3
                  sub          t0, tp, tp
                  fmin.s       fs4, fa2, ft9
                  fsgnjn.s     ft11, fs3, fs11
                  fdiv.s       fa1, fs0, fs9
                  sub          t4, s9, s7
                  remu         s2, a3, tp
                  fmul.s       ft5, fs11, fs10
                  mul          s0, s9, s6
                  fsqrt.s      fs11, fa2
                  divu         s11, s8, s4
                  xori         s8, s5, -1285
                  fclass.s     t4, fa3
                  sll          s10, zero, t5
                  feq.s        s5, fs0, ft8
                  fcvt.w.s     s7, fs7, rup
                  fsgnjn.s     fa6, ft2, fa2
                  slli         s6, s7, 12
                  feq.s        t1, fa0, fs2
                  add          s9, s1, a3
                  fmul.s       ft4, fa7, fa4
                  fcvt.wu.s    a6, ft0
                  fsgnjx.s     fa2, fa2, ft11
                  sll          s9, s2, s11
                  fmax.s       fa5, ft6, fs7
                  addi         s11, t5, -52
                  sra          ra, s1, a6
                  slti         s10, s6, 1013
                  fle.s        sp, ft0, fa4
                  fcvt.s.wu    fs10, a2
                  srai         a1, a6, 20
                  mulh         ra, s4, s4
                  srli         t5, a6, 13
                  fcvt.s.wu    ft0, t5, rtz
                  fcvt.s.w     fa7, s9, rmm
                  sltiu        sp, a5, 240
                  div          s5, s10, a0
                  fmv.w.x      fa3, s11
                  mulhsu       a6, t5, t5
                  fsqrt.s      fs8, fa2, rmm
                  fcvt.w.s     s9, fs10, rdn
                  sll          s6, zero, s2
                  mulhu        ra, s2, s9
                  fclass.s     s10, fs1
                  fmv.w.x      fa4, a3
                  fdiv.s       fa1, ft5, ft0
                  add          t0, s7, a6
                  fdiv.s       ft10, ft10, fs8
                  fcvt.w.s     t2, ft3
                  feq.s        s4, fa0, fs6
                  slt          gp, tp, t6
                  fsgnj.s      fs4, fa5, fa2
                  fsgnj.s      fs8, fs4, fa1
                  slt          t1, t4, s8
                  mulhu        a3, s11, s1
                  fcvt.s.w     fs2, t5
                  sra          s0, s5, s9
                  fcvt.s.wu    fa6, s10
                  mulhsu       sp, t5, a1
                  sltu         s5, s9, a4
                  sltiu        sp, s10, -172
                  fcvt.s.w     fa1, a5
                  fmin.s       fa1, fa6, ft3
                  auipc        s0, 200546
                  slli         s10, a6, 0
                  mulh         t4, zero, gp
                  sll          a6, t4, s1
                  andi         s11, gp, 1572
                  xor          a2, t4, t6
                  feq.s        s4, ft3, fs6
                  slli         t5, s5, 1
                  addi         a1, s6, -1637
                  fle.s        s8, ft0, fa5
                  sra          s8, s3, gp
                  lui          s4, 846577
                  sll          s8, s4, a3
                  sltu         t1, s4, t5
                  divu         s8, a7, s4
                  auipc        sp, 632270
                  fsgnj.s      fs8, fs8, fs6
                  fclass.s     s5, ft2
                  add          s3, s11, a1
                  divu         a2, s10, a5
                  xori         s0, ra, 599
                  xori         ra, a3, -1448
                  and          s11, a4, t4
                  rem          tp, s6, tp
                  sll          t1, sp, s4
                  fmax.s       fa1, fa4, ft2
                  sra          sp, s9, t5
                  fadd.s       fa4, ft3, fs5, rdn
                  mulhsu       s10, s6, sp
                  mul          a3, s7, t0
                  mulh         a7, sp, a6
                  srl          a6, s6, sp
                  slt          tp, sp, zero
                  srli         t2, s9, 27
                  fcvt.wu.s    s6, fs7
                  fmax.s       ft1, fs7, fs7
                  auipc        s0, 958299
                  sll          s3, s11, t5
                  fmin.s       fs0, fs11, fs6
                  fmul.s       ft9, ft11, fa3
                  fclass.s     t5, ft3
                  ori          a1, zero, 1715
                  mulhsu       s1, t2, t6
                  ori          s7, t0, -135
                  mul          zero, gp, a3
                  add          sp, s5, s9
                  and          a2, t5, t3
                  remu         a1, s9, s9
                  slli         gp, ra, 17
                  mulhsu       s11, sp, t2
                  srai         t4, s2, 12
                  fsgnj.s      fs10, ft8, ft8
                  or           gp, s2, a3
                  div          t5, s0, tp
                  feq.s        t5, fa6, ft9
                  mulh         a5, a1, s5
                  andi         ra, s1, 1875
                  sra          t5, a6, t3
                  fmax.s       fs3, fs1, fs10
                  fmin.s       fs10, fa0, fa2
                  divu         s2, ra, s1
                  slti         t4, a6, 148
                  slt          a5, t4, s5
                  sub          s6, s11, a5
                  divu         t0, tp, sp
                  ori          gp, tp, -277
                  andi         a1, s8, -1811
                  fcvt.s.wu    fs0, s5
                  fmul.s       fa6, fs6, ft11, rne
                  sra          a5, sp, a0
                  fsqrt.s      ft8, fa2
                  div          s9, a2, t0
                  fadd.s       fs1, fs6, ft7, rdn
                  fclass.s     t3, ft8
                  fcvt.wu.s    s5, fa2, rdn
                  srl          t3, a4, s4
                  slli         zero, s10, 11
                  fsgnj.s      fa6, ft10, fs0
                  fadd.s       fa1, ft6, ft9, rne
                  slt          t2, t3, a1
                  fclass.s     gp, ft7
                  slti         t1, s11, 1034
                  fsub.s       fs11, fs4, fs9
                  sltu         s0, t6, a6
                  and          s0, t3, t6
                  fmin.s       fs7, ft3, ft11
                  xori         tp, tp, 827
                  fcvt.s.w     fa5, a4, rtz
                  fsgnj.s      fa3, ft10, fs10
                  fmin.s       ft10, ft7, fs1
                  lui          s5, 928824
                  fle.s        s2, fs11, ft9
                  addi         gp, t5, -912
                  nop
                  addi         s4, s2, -1668
                  fadd.s       fa2, ft10, fa6
                  feq.s        tp, fs9, ft5
                  mulhu        s2, a4, gp
                  sra          ra, s3, t5
                  fsgnj.s      fs1, fa4, fa6
                  fsub.s       fa3, fs8, fa5, rup
                  nop
                  sub          a6, a4, t4
                  slti         a7, a7, 1714
                  sub          t4, zero, gp
                  fmv.w.x      ft10, s1
                  sltiu        s8, a1, 1692
                  fmin.s       fa1, fs2, ft0
                  add          ra, s10, t0
                  flt.s        s1, fa6, ft0
                  srai         t1, s7, 25
                  fcvt.s.w     fs8, s11
                  srli         s8, s0, 19
                  xor          a2, a1, t5
                  fmv.w.x      fs11, ra
                  fsgnj.s      fa3, fs1, fs7
                  or           s6, a2, s2
                  srli         t1, a0, 11
                  fcvt.w.s     a7, fs1, rne
                  sltu         s6, s5, a5
                  srli         ra, zero, 20
                  fmv.w.x      fa5, s5
                  fdiv.s       fs6, ft0, fs11, rup
                  mulhu        s11, a7, a6
                  or           a7, s1, sp
                  fmv.w.x      ft2, t6
                  slti         sp, a2, -786
                  feq.s        ra, fs6, ft11
                  fle.s        a6, fa2, ft4
                  sltu         zero, a4, a6
                  feq.s        s3, fs11, fs3
                  srli         s9, zero, 4
                  slti         a5, a7, -1806
                  fdiv.s       fs0, fa3, ft3
                  add          a5, s11, s2
                  fclass.s     a6, fs4
                  sltiu        s10, t0, 979
                  sltiu        a2, a2, 426
                  slti         s3, t1, 1788
                  sll          ra, tp, s4
                  or           a5, s0, a4
                  div          s5, t0, s8
                  fclass.s     t4, fa5
                  rem          a6, t3, t5
                  fcvt.w.s     tp, fs7
                  fle.s        s0, fs5, fa7
                  feq.s        t3, ft7, fs11
                  fadd.s       fs8, ft8, ft9
                  rem          t1, s6, a0
                  mulhsu       s9, a3, s9
                  mulhsu       zero, s3, t1
                  xori         s10, tp, 1237
                  sltiu        a6, t0, 1067
                  fmv.x.w      tp, ft8
                  sub          s8, a0, s9
                  sltu         s4, a4, zero
                  mul          sp, s4, zero
                  srli         ra, a7, 18
                  add          s8, s0, t2
                  srai         s7, a7, 30
                  xor          gp, t0, s9
                  slti         t0, s3, 378
                  divu         ra, s8, s5
                  mulhsu       s4, s6, zero
                  fcvt.wu.s    s8, fs3
                  sub          s3, s0, s4
                  fdiv.s       ft1, fs6, fa7, rdn
                  fcvt.s.w     ft3, zero
                  mulhsu       zero, a1, tp
                  fcvt.s.wu    fs3, a0, rdn
                  fsgnjx.s     fs9, ft2, ft0
                  xor          t5, sp, a7
                  fcvt.w.s     a1, ft6
                  fmv.x.w      s8, ft7
                  auipc        s11, 20164
                  fcvt.s.w     fs1, s8
                  rem          a6, s3, s7
                  fclass.s     a7, ft8
                  and          a6, s1, s8
                  slli         s5, t6, 23
                  sra          a2, a5, s6
                  auipc        s11, 842777
                  slti         a3, s3, -566
                  slti         t0, a5, -1108
                  fcvt.s.w     fs10, a3, rmm
                  slt          s7, t3, t3
                  and          ra, s2, s3
                  fle.s        s11, fs9, fa6
                  fle.s        a5, ft5, fa0
                  sub          a1, s0, s7
                  fmax.s       fs1, ft9, fa1
                  sra          s3, s9, t2
                  slli         a6, s5, 21
                  remu         t5, a2, sp
                  andi         t0, s2, -996
                  xori         s11, a2, 78
                  div          s2, t4, tp
                  andi         t1, s7, -1723
                  fsgnjn.s     fs5, ft6, ft5
                  fcvt.s.wu    fa3, s0
                  addi         s3, s1, -1688
                  lui          sp, 431429
                  div          s4, s6, s2
                  lui          a2, 629881
                  sltu         a6, a6, a4
                  fmv.x.w      ra, fs10
                  slti         ra, s2, 706
                  srl          a1, s0, s9
                  mulh         s6, s1, a3
                  sll          a5, zero, a0
                  fsub.s       fs2, fa3, ft5
                  auipc        t4, 194110
                  andi         s0, gp, 953
                  fcvt.wu.s    a7, fs3
                  fclass.s     sp, ft11
                  fclass.s     s2, ft9
                  fcvt.w.s     s9, fa2, rne
                  divu         t3, s5, t6
                  rem          s11, s3, s4
                  xori         t4, s5, -621
                  fcvt.wu.s    s1, fs11, rne
                  and          gp, s0, s2
                  and          s5, a5, s11
                  srai         tp, t2, 16
                  auipc        s5, 109956
                  fmv.x.w      s9, ft11
                  mulhsu       t3, a3, zero
                  sra          s3, t3, a6
                  slt          a5, s10, gp
                  fsgnjx.s     fa5, fs9, fa4
                  and          sp, a6, s5
                  fadd.s       fa6, ft5, fs1, rne
                  fmin.s       fs7, fs1, fs6
                  ori          t0, a4, -316
                  or           a6, a1, s4
                  sltiu        s11, a2, 1493
                  fclass.s     zero, fs2
                  fsgnjn.s     fa3, fs10, ft9
                  fmul.s       ft1, fa0, fs9, rdn
                  fsub.s       fa3, fs8, ft9, rtz
                  div          s10, s5, t6
                  fmax.s       fs7, fa1, fa5
                  fcvt.s.wu    fs9, t1
                  srl          t4, ra, s6
                  fsgnjn.s     fs2, fs3, fa6
                  fadd.s       fa1, fa6, ft4, rmm
                  srai         tp, sp, 21
                  mulhsu       s4, s2, s11
                  fmax.s       fa5, ft9, fa0
                  andi         t0, ra, 688
                  fmv.w.x      fa0, s9
                  ori          t1, s2, 33
                  ori          t4, s0, -1486
                  mulhsu       s4, s5, s0
                  ori          t4, t3, 1850
                  andi         a2, a0, 320
                  fle.s        s4, ft0, fa3
                  andi         t2, sp, -471
                  fsub.s       fs5, ft6, fa3
                  srli         a1, s7, 1
                  mulh         s10, s5, t6
                  fdiv.s       fs7, fa6, fs7
                  mul          s1, s1, t3
                  fmv.w.x      fs2, a2
                  slt          s8, s0, t6
                  mulh         a5, a1, t2
                  fmax.s       fa7, fs6, ft5
                  add          t3, s10, ra
                  lui          s10, 305602
                  add          t5, a6, s1
                  mulhu        tp, t1, s0
                  fcvt.s.wu    fa7, s9, rdn
                  fadd.s       ft11, fs6, fa1, rtz
                  fdiv.s       ft7, fs4, fs3, rup
                  rem          t5, s11, tp
                  divu         t2, s9, s10
                  mulhsu       ra, s2, t0
                  fclass.s     s1, fs1
                  fcvt.s.wu    fa2, t0
                  srl          t1, a4, sp
                  nop
                  fmax.s       fs4, fs3, fa4
                  lui          t0, 90292
                  lui          s3, 325358
                  fcvt.wu.s    zero, fa2, rup
                  fadd.s       fa0, ft7, fs2, rup
                  mulhsu       t5, a3, s2
                  fsgnj.s      fa6, fs5, ft5
                  slt          sp, t5, t5
                  fmv.x.w      gp, ft7
                  xor          a2, zero, gp
                  or           ra, a6, a1
                  fmax.s       ft11, fs11, ft3
                  add          a7, a1, t6
                  remu         s8, a6, s4
                  fmax.s       ft8, ft4, ft10
                  fsgnjn.s     fs9, ft9, fa4
                  fcvt.s.wu    fa3, a5
                  fle.s        s3, fa7, ft3
                  lui          s7, 862824
                  feq.s        ra, ft5, fs5
                  nop
                  divu         ra, a5, s9
                  xori         a7, s0, -1872
                  slt          s1, s7, t5
                  fcvt.s.wu    ft7, sp, rtz
                  add          s3, a4, t6
                  fmin.s       fs6, fs0, fs10
                  ori          s11, tp, 598
                  div          s5, ra, s2
                  feq.s        t4, fa3, ft2
                  sltu         s3, a5, t2
                  div          s9, s6, s6
                  slt          gp, s7, gp
                  srai         s3, t5, 16
                  lui          ra, 224901
                  fdiv.s       fa5, fs4, ft1
                  and          s9, t6, s11
                  fsgnjn.s     fa2, ft2, fs1
                  nop
                  andi         a7, s1, -1450
                  sra          a1, s3, ra
                  fadd.s       fs2, ft0, fs9, rmm
                  srai         a3, t5, 16
                  xori         t1, s3, 1595
                  fcvt.wu.s    t5, fa4, rmm
                  fmax.s       fs9, fs6, fa1
                  andi         s11, sp, 1565
                  mulh         a5, t4, t0
                  fmul.s       fs0, ft3, fa0, rmm
                  ori          t1, a4, -1442
                  or           s6, t3, a7
                  fcvt.s.w     ft10, s7
                  sltu         zero, a2, s1
                  xor          s1, s8, s4
                  mulh         s2, t0, t3
                  fmul.s       ft4, ft0, fa7
                  xori         t4, t6, -49
                  fmv.w.x      fs9, zero
                  ori          a1, s4, 96
                  mulhsu       a3, a5, t6
                  xor          a3, s10, zero
                  fmul.s       ft7, fs6, fs5, rne
                  sltu         s8, a1, s0
                  xor          tp, tp, t0
                  ori          a2, s2, -816
                  ori          s10, s1, -244
                  fcvt.s.wu    fa5, a7
                  xori         a7, t6, -68
                  fle.s        a2, ft7, fs4
                  add          a2, s2, s2
                  fcvt.s.w     fa2, a6
                  slt          a7, a0, a2
                  fmv.w.x      fs10, t4
                  fadd.s       fs10, ft0, fa4
                  nop
                  fsub.s       fs7, ft9, ft1
                  fsgnjx.s     fa7, fa6, fs10
                  addi         a7, s5, 1408
                  srli         tp, a3, 27
                  mulhsu       tp, t3, a4
                  lui          tp, 336971
                  add          s2, a0, s6
                  mulh         a6, tp, t3
                  fcvt.wu.s    s7, fa0, rdn
                  mulhu        t5, t1, s5
                  andi         s9, s10, 482
                  fsub.s       fs5, fs3, ft1, rne
                  fle.s        a5, fs9, ft2
                  fmv.w.x      ft5, tp
                  divu         a2, s3, t2
                  div          s2, ra, s11
                  flt.s        s3, fa7, fs10
                  flt.s        s8, fs11, fs9
                  fclass.s     ra, fa1
                  fsgnjn.s     ft3, fa6, ft4
                  rem          t4, s0, a0
                  fmin.s       ft0, ft7, fs1
                  fmv.w.x      ft1, zero
                  xori         s11, t0, -543
                  slti         a1, a3, 1664
                  sub          s4, t6, t5
                  slli         s8, s6, 0
                  srl          s5, t4, t5
                  fsub.s       fa4, ft2, fa7, rtz
                  fmul.s       ft0, fs10, ft8, rdn
                  fmv.w.x      fa4, s6
                  fle.s        s0, fs1, fs9
                  mul          t2, a1, s1
                  mul          t3, s9, gp
                  and          tp, s4, s9
                  fmv.x.w      a1, fs8
                  fcvt.w.s     s0, ft2
                  fsgnjn.s     fs2, fa2, ft4
                  andi         s7, ra, 1295
                  mulhsu       s7, s0, s1
                  fle.s        s8, fs0, fa2
                  fdiv.s       fa1, ft10, ft9
                  fclass.s     a5, fa4
                  srl          zero, t1, t3
                  fsgnj.s      fs0, ft5, fs3
                  div          s2, a1, t6
                  rem          s8, s8, a4
                  fdiv.s       ft6, fa6, ft3
                  slli         zero, s2, 30
                  fmv.w.x      fa6, a0
                  fmv.w.x      ft0, s11
                  fmv.w.x      ft0, s7
                  srli         a3, a3, 30
                  or           t3, ra, a2
                  fcvt.s.w     ft6, a5
                  sub          a7, sp, a2
                  addi         ra, t2, -230
                  fcvt.s.w     ft2, t3
                  sltiu        a7, s7, 1655
                  fmv.w.x      fs6, t3
                  fle.s        s8, fs5, ft9
                  fsgnjx.s     ft1, ft10, ft4
                  srai         a1, t1, 12
                  xori         s11, a5, -25
                  or           zero, t2, s0
                  fmax.s       ft9, ft11, fs0
                  fmax.s       ft3, fs4, ft9
                  mulh         s3, s10, t3
                  fsgnjx.s     fs11, fa1, fs9
                  flt.s        zero, ft10, fs7
                  slt          gp, t3, s10
                  fsgnjx.s     fa2, fs5, fs11
                  auipc        t4, 780727
                  fmv.w.x      fa6, t5
                  srli         t1, t4, 28
                  feq.s        a7, ft5, fa3
                  fsqrt.s      ft9, ft1
                  fcvt.s.wu    fa6, s11, rtz
                  rem          a5, s4, gp
                  sltiu        s9, s10, -1778
                  fmv.w.x      fs2, s7
                  slli         t5, tp, 3
                  mulhu        a2, a6, a7
                  fsgnjx.s     fa4, fs4, ft7
                  lui          s2, 199358
                  feq.s        t1, fs9, fa4
                  addi         s6, a6, -1063
                  feq.s        sp, ft7, fs3
                  fmv.x.w      a6, fs3
                  xori         t1, s10, 2025
                  sltiu        a7, s4, -922
                  srl          s3, sp, s2
                  sll          s1, gp, a0
                  sub          sp, s7, a3
                  fcvt.wu.s    t5, fs8
                  fcvt.w.s     a3, fs0, rup
                  fcvt.wu.s    a3, fa2
                  remu         s8, s10, s3
                  srli         a7, t3, 14
                  ori          gp, a2, -1192
                  fsgnjn.s     ft11, fs10, ft11
                  mulhsu       a7, s2, s9
                  lui          t2, 602769
                  fcvt.wu.s    zero, ft7, rmm
                  addi         a6, s11, 1751
                  fmax.s       ft10, fs1, fs3
                  fsgnjx.s     fa4, ft0, fa2
                  fdiv.s       fs1, fs8, ft7
                  fmax.s       fa3, fa3, fs8
                  srai         tp, s4, 23
                  slti         zero, a3, 1085
                  fcvt.s.w     ft7, s4
                  sltiu        a2, a1, -126
                  sltiu        t0, a2, -258
                  fdiv.s       ft3, fa4, ft0, rmm
                  fmin.s       fs2, fa5, fa2
                  slti         t2, a6, 57
                  fmv.w.x      ft8, s8
                  xori         a1, s2, 1176
                  fmul.s       ft8, ft3, ft3
                  srl          s3, s7, s3
                  sll          s7, a4, s0
                  slt          a5, a7, t2
                  fle.s        sp, ft3, fa3
                  feq.s        t1, ft11, fa6
                  divu         a7, s0, tp
                  fmin.s       fa2, fs5, fa2
                  srai         a1, a2, 19
                  fdiv.s       fa6, fs6, fs1, rup
                  fcvt.s.w     fa7, t3, rne
                  fmax.s       fs9, fa6, fs5
                  fmax.s       fa7, fs4, fs8
                  fcvt.wu.s    s9, fa0, rne
                  xori         s1, t6, -421
                  sub          t3, t1, sp
                  srli         a2, s7, 17
                  mul          gp, a6, t2
                  fcvt.w.s     t2, fs7
                  fsgnjx.s     fa6, fs5, fa7
                  add          t4, tp, t3
                  divu         t2, s8, ra
                  fcvt.s.w     fa6, a0, rup
                  fmv.x.w      t4, ft1
                  slti         s3, t3, -1449
                  lui          t2, 340866
                  mulhu        s11, s3, a3
                  fsgnjn.s     ft10, fa5, ft9
                  slt          gp, t2, s6
                  nop
                  xor          a7, s8, a5
                  srl          t4, a5, s3
                  divu         tp, a5, ra
                  sltu         t4, a5, tp
                  div          s10, s11, s3
                  div          t1, s4, s1
                  mulh         t5, s2, t6
                  slli         zero, sp, 0
                  fsgnj.s      fa1, ft6, fs5
                  srai         t2, s0, 2
                  mulhu        ra, s2, s4
                  nop
                  fmv.x.w      t5, ft6
                  fdiv.s       fs10, fs4, fa0, rmm
                  or           s4, a0, sp
                  slt          gp, a3, gp
                  slli         s2, s6, 8
                  add          tp, a1, sp
                  fcvt.wu.s    gp, fa4, rdn
                  fsqrt.s      ft7, fs7, rdn
                  srl          a1, s6, a3
                  lui          s7, 578890
                  fadd.s       ft1, fs10, ft8
                  feq.s        gp, fs8, ft1
                  div          t2, a6, s4
                  fsqrt.s      fs7, fs0, rtz
                  feq.s        gp, fa5, fs1
                  fsgnjn.s     fa2, fs10, fa7
                  rem          s11, gp, s10
                  xor          s11, t5, tp
                  fsgnjx.s     fs0, ft5, fs6
                  sra          a2, s1, s0
                  andi         s6, t3, 1093
                  remu         s8, s8, s6
                  srl          t0, s5, s5
                  fsqrt.s      fa1, ft0
                  auipc        a5, 434133
                  flt.s        tp, ft10, fs5
                  ori          ra, zero, 991
                  xori         s9, a4, -779
                  xori         s10, zero, 1763
                  fdiv.s       ft1, ft4, fs6, rmm
                  sltiu        a7, s10, 389
                  fsub.s       ft5, fa1, fs0, rtz
                  fcvt.w.s     t4, fa6
                  srl          t5, s11, s0
                  and          s1, t3, gp
                  fmul.s       fa6, ft11, ft5, rup
                  mul          zero, t0, s0
                  fmv.x.w      s9, fa7
                  xor          a3, t3, a2
                  fdiv.s       fs7, fs2, ft1, rdn
                  fcvt.wu.s    a3, fs1, rup
                  slt          s9, ra, s3
                  divu         s6, s10, s3
                  slli         s7, sp, 0
                  xori         s7, a1, -1289
                  div          t4, s8, a3
                  fcvt.s.wu    fa2, t0, rmm
                  remu         gp, a6, a4
                  slti         s2, a0, 330
                  slli         s3, a3, 31
                  nop
                  sltu         t2, s6, s9
                  fsgnjn.s     ft6, fs3, ft5
                  mulhu        s5, sp, a7
                  addi         t1, s2, -1527
                  fcvt.w.s     a2, ft9, rtz
                  add          t2, s9, s5
                  sra          s6, s5, s6
                  remu         s9, s8, t5
                  fcvt.wu.s    t1, ft1
                  mulhu        t1, t0, s2
                  or           t0, a4, zero
                  fsqrt.s      fs1, fa0, rmm
                  sub          a7, gp, zero
                  rem          s11, s5, sp
                  slti         zero, a1, 1130
                  fadd.s       ft6, fa2, fs9, rne
                  slli         s1, t2, 21
                  sltu         s9, ra, s1
                  fmv.x.w      s6, fa6
                  srli         ra, s9, 19
                  fsgnjn.s     ft2, fs3, ft0
                  fmax.s       fa5, ft0, ft6
                  fsub.s       ft11, ft8, fs4, rtz
                  lui          a7, 390771
                  fsgnj.s      fs3, ft11, fs8
                  sll          a5, zero, a0
                  mulh         s6, a7, s11
                  rem          s6, t4, s1
                  lui          s9, 959087
                  fmv.w.x      fs8, a5
                  fsgnj.s      fa1, ft4, fs2
                  sub          s2, a4, s4
                  mulhsu       t0, s7, s10
                  feq.s        t5, ft5, fs0
                  slli         a2, t0, 19
                  sltu         s4, t3, tp
                  mulhsu       s3, t2, s9
                  sltu         s11, s9, gp
                  slli         zero, t5, 0
                  fdiv.s       fs11, fs7, ft2
                  or           a5, s3, s5
                  remu         a6, tp, a7
                  fsgnjn.s     fs0, ft11, fs3
                  fsgnj.s      fa7, ft7, ft1
                  mulhsu       s2, a3, s4
                  srl          t4, a4, sp
                  and          ra, a5, t2
                  fsqrt.s      fa3, ft11, rmm
                  lui          s0, 465524
                  mulhu        sp, a3, a5
                  srl          s2, s6, a1
                  fcvt.s.w     fs1, a1, rne
                  sub          s3, s3, s11
                  sltu         a7, t4, zero
                  flt.s        s1, fs3, ft5
                  sltu         s1, s6, a6
                  mulh         s10, a7, t0
                  mulhu        a7, t6, a1
                  fmin.s       ft9, fa1, fs10
                  fcvt.s.w     fs5, a6, rne
                  srai         sp, s7, 0
                  auipc        sp, 184675
                  fmin.s       ft2, fs2, fa3
                  fmin.s       fs0, fa4, ft4
                  div          a5, t1, t5
                  sra          s9, s11, t3
                  xori         s2, s11, 1883
                  rem          s6, a6, t1
                  fle.s        a6, fa4, ft3
                  xor          t5, zero, t5
                  fmin.s       fa4, ft9, ft5
                  xori         t0, s5, 1770
                  nop
                  srl          tp, s3, sp
                  fsqrt.s      ft2, ft5
                  fcvt.wu.s    t5, ft8, rmm
                  lui          sp, 765504
                  add          t1, a6, s9
                  fmax.s       fs2, ft5, ft0
                  fmv.w.x      fs7, t3
                  srai         t5, s3, 8
                  auipc        s8, 221504
                  slt          a7, sp, a5
                  fmv.w.x      ft8, s0
                  fmv.x.w      s2, fs11
                  fsgnjx.s     fs7, fa1, ft1
                  and          s5, t3, s6
                  fsgnjn.s     fs7, fs1, ft4
                  add          s5, s2, s4
                  sltu         s6, tp, s9
                  fcvt.w.s     gp, ft11
                  srl          a3, s5, a6
                  nop
                  sltu         sp, s11, s5
                  fdiv.s       ft11, ft6, fa0, rtz
                  fsqrt.s      fs7, ft2
                  fsgnjx.s     ft1, fa2, fs3
                  or           t2, a6, ra
                  remu         s8, t4, s7
                  remu         s9, s7, t1
                  add          s0, t1, a5
                  srl          s10, s0, t5
                  fcvt.wu.s    s4, ft4, rup
                  mulh         s10, s5, a4
                  feq.s        t4, fs7, ft4
                  fcvt.w.s     t1, ft2
                  mulhsu       a3, a3, ra
                  ori          s8, s1, 837
                  sltiu        a1, s5, 1186
                  sra          s2, a0, t1
                  lui          gp, 849615
                  slli         tp, s1, 28
                  fsgnjn.s     ft11, ft1, fs9
                  fmv.w.x      ft7, t0
                  nop
                  fsgnj.s      ft2, fa5, ft5
                  ori          s0, s2, 716
                  auipc        zero, 275425
                  slt          s3, s2, t3
                  fmul.s       fs7, fs8, fs10
                  sltu         t5, ra, tp
                  srli         s4, s10, 3
                  divu         s3, gp, a5
                  srai         t5, s2, 11
                  rem          t2, ra, t5
                  fsgnj.s      ft7, fa1, ft9
                  fcvt.wu.s    ra, ft8, rmm
                  lui          sp, 71975
                  sltiu        a7, t6, -316
                  fsgnjn.s     fa7, ft6, ft10
                  fmin.s       fa5, fa6, ft8
                  ori          a6, ra, -1827
                  remu         a3, t0, a7
                  mulhu        s2, t6, a4
                  fcvt.s.wu    fs6, zero
                  fsub.s       ft4, ft10, fs2
                  or           gp, sp, t5
                  xori         a5, zero, 1136
                  fsgnjn.s     ft1, ft6, fa7
                  mulhsu       a3, a5, t2
                  sub          a3, a7, t3
                  fmin.s       fa2, ft10, ft2
                  sltu         s7, a6, gp
                  srl          a6, a6, t0
                  fcvt.w.s     a2, fa5, rup
                  xor          sp, s7, s11
                  andi         a5, sp, 367
                  slti         a6, sp, -902
                  sll          zero, t2, tp
                  fsgnjn.s     fs0, fs8, fs0
                  srl          a1, a6, a5
                  mulh         t5, a7, s10
                  fcvt.wu.s    t3, fa1
                  nop
                  srl          zero, sp, sp
                  fdiv.s       fs6, fs11, ft9
                  sltiu        s0, s5, 1660
                  fsgnjx.s     fs10, fs4, fs6
                  mulhu        a1, sp, gp
                  mulhsu       s10, s11, t6
                  sra          s9, a0, a4
                  sll          sp, t0, t0
                  ori          tp, t2, 850
                  srai         t3, t5, 19
                  fmin.s       ft3, fs11, fa3
                  fsgnjx.s     fs7, fs10, fs11
                  fadd.s       fs2, fs5, ft0, rdn
                  flt.s        a7, ft11, fs9
                  sltu         a5, sp, a6
                  xor          t2, t6, t4
                  fcvt.s.w     ft8, s4
                  slti         s1, t0, -1044
                  or           sp, gp, s0
                  sll          a2, s10, s1
                  fsgnj.s      fa4, fs5, ft5
                  fsgnj.s      fs4, ft11, fa5
                  fmv.x.w      s4, fs3
                  fle.s        s4, fa6, fs4
                  fmin.s       fs1, fa1, fs7
                  fcvt.s.wu    fa2, s1
                  fdiv.s       fs10, fa0, ft4
                  mulhu        a5, a5, s7
                  slli         s2, gp, 8
                  mulh         s11, s3, a6
                  srl          a7, gp, a7
                  fcvt.s.w     ft10, t5
                  sub          a7, s0, s8
                  lui          s2, 31525
                  fle.s        t2, fs11, fs10
                  fsgnj.s      ft10, fs8, ft11
                  divu         a7, s8, s11
                  fsqrt.s      fs0, ft10
                  fcvt.s.wu    fa7, ra, rup
                  fmax.s       ft9, ft7, fa6
                  and          s1, a7, s1
                  fadd.s       ft3, ft7, fs7
                  mulhu        s5, s9, t6
                  fmul.s       fs4, fs1, fs9
                  fsgnjx.s     ft0, fs6, fa5
                  ori          a6, s11, 1538
                  xori         t3, t1, -1087
                  fcvt.wu.s    zero, ft5, rup
                  sra          t0, s8, a0
                  ori          t4, t4, 1656
                  nop
                  fdiv.s       fs11, fa0, ft3
                  fcvt.w.s     s2, fs7
                  ori          s7, t0, -1725
                  slt          a1, tp, s6
                  div          a1, t3, s8
                  srai         t1, s1, 14
                  and          s9, t4, a3
                  feq.s        s7, fs11, ft3
                  addi         s1, t6, 764
                  fcvt.w.s     s8, fs3, rtz
                  fcvt.w.s     gp, fa3, rne
                  srl          sp, s7, zero
                  auipc        gp, 929127
                  auipc        zero, 643649
                  fadd.s       fa0, fa1, fs4
                  xor          a3, a4, a5
                  fmin.s       fa2, ft0, fs8
                  mulhsu       s10, s7, s5
                  rem          s3, a6, a6
                  rem          s2, s7, t5
                  sll          t3, sp, s2
                  fmv.x.w      s1, ft7
                  xori         s2, a4, 1686
                  mul          s1, s7, a7
                  fcvt.wu.s    s3, ft1, rup
                  fcvt.wu.s    a2, ft9, rdn
                  fcvt.wu.s    a3, ft3, rtz
                  slt          s0, s7, a0
                  fcvt.w.s     a3, fa2
                  or           a7, s2, s3
                  fmul.s       ft4, fs4, fa0
                  auipc        s3, 487638
                  fsgnj.s      fa5, fs0, ft9
                  addi         s7, s0, 1226
                  divu         a3, s6, s11
                  xori         s6, t1, 584
                  srli         sp, s3, 8
                  mulhu        s4, s3, a3
                  xor          s10, s10, a7
                  fclass.s     t0, fa3
                  mulhsu       s6, s3, s3
                  fadd.s       fs9, fa6, ft9
                  add          s2, s1, s4
                  fmin.s       fa5, fa0, fa3
                  fle.s        t0, ft8, fs1
                  sra          sp, a3, a4
                  fclass.s     sp, fs1
                  xor          s0, zero, t2
                  fmax.s       fa7, ft3, fa4
                  xori         s1, a2, 1479
                  slti         sp, t2, -473
                  nop
                  slti         gp, s8, 777
                  srl          s3, t1, t3
                  fclass.s     s10, ft11
                  mulhsu       s9, sp, a5
                  fadd.s       ft1, fa2, ft6, rup
                  flt.s        a6, ft1, ft7
                  fsgnjn.s     fs3, fs4, ft8
                  fsub.s       fa0, fs8, ft7
                  sll          t0, zero, gp
                  xor          t5, a1, s10
                  add          a5, t4, s5
                  srai         s8, t2, 21
                  fcvt.s.w     ft0, s4
                  divu         t0, a7, t1
                  xor          s2, zero, s1
                  srli         s3, a5, 19
                  fmv.x.w      t3, fs11
                  srl          s11, t3, a0
                  mul          s7, a3, s7
                  rem          t3, s6, gp
                  ori          s2, t5, -373
                  fcvt.s.wu    ft1, sp, rmm
                  fcvt.wu.s    s2, fs2, rtz
                  lui          a7, 218420
                  or           sp, zero, s1
                  fcvt.s.w     ft3, s4, rmm
                  addi         s6, t5, -1544
                  fmax.s       ft1, fa3, fs0
                  srli         s5, s2, 19
                  xori         s10, t5, 805
                  fmv.w.x      ft0, s9
                  lui          a1, 91440
                  srl          t0, sp, s0
                  xor          ra, s1, a1
                  and          t1, ra, a6
                  fdiv.s       ft8, ft0, ft3, rup
                  sub          s3, sp, a2
                  sub          s0, s1, s5
                  slli         s8, t4, 21
                  fdiv.s       fs6, fs10, ft8
                  flt.s        s9, ft2, fs6
                  fsub.s       ft9, fa5, fs10
                  andi         s4, t3, 63
                  slti         t4, s7, -725
                  nop
                  rem          ra, t0, a6
                  xori         s4, s9, 231
                  fcvt.wu.s    s3, fs10, rdn
                  fcvt.s.w     ft8, t0, rmm
                  fmul.s       fs10, ft1, fa1, rmm
                  sub          a6, t0, s11
                  fadd.s       fs4, fs7, ft2
                  sll          a7, a7, t5
                  mulhu        s9, s11, s7
                  fmv.w.x      fs3, s4
                  xor          s2, a1, zero
                  srl          s5, sp, tp
                  ori          a7, a4, 1419
                  fmul.s       ft2, ft10, fs8
                  sltu         t4, tp, s9
                  fmax.s       ft7, fs8, ft4
                  fmv.x.w      gp, ft7
                  xor          a1, t4, s11
                  div          tp, s6, a5
                  mul          s5, a7, s7
                  add          a7, a5, s0
                  fcvt.s.wu    ft10, s9, rdn
                  slti         s10, a5, -587
                  mulhu        sp, s10, a7
                  fsgnjn.s     ft4, fs9, fs1
                  fcvt.wu.s    s6, ft10
                  nop
                  remu         a2, s8, s6
                  fsqrt.s      fa4, fs2
                  fmul.s       ft5, ft6, fs11
                  fsgnjn.s     ft11, ft6, fa0
                  mulhu        s10, s1, s2
                  xori         s0, s11, 1427
                  srli         zero, s1, 25
                  fadd.s       ft0, fa2, fs4
                  rem          s2, a4, tp
                  remu         t2, t4, s10
                  fmin.s       ft6, fs4, ft3
                  fcvt.s.w     ft11, s5, rmm
                  sub          a2, s1, t6
                  flt.s        a7, fa2, ft8
                  ori          s10, a3, -888
                  addi         s1, t5, -1806
                  sra          gp, t0, s8
                  sub          t1, a4, t2
                  fmax.s       ft7, fa0, fa0
                  fclass.s     tp, fs0
                  addi         zero, t4, -992
                  mulh         a6, gp, a6
                  fcvt.s.w     fa5, s8
                  lui          s8, 476805
                  fcvt.s.wu    ft7, t4, rmm
                  mulh         t0, ra, s4
                  ori          s10, a6, -2008
                  add          t2, a1, a5
                  fadd.s       fs2, fs6, fs5, rup
                  sub          a3, a7, t4
                  divu         t1, s4, tp
                  fadd.s       ft4, fs7, ft2
                  fsgnjn.s     fs2, fa3, ft0
                  sub          s8, zero, s0
                  fle.s        t1, ft4, fa0
                  mulhsu       sp, a5, s2
                  fsub.s       fs3, ft3, ft0, rne
                  remu         a3, zero, a2
                  fmul.s       fs0, fs3, fs3
                  feq.s        a7, ft5, ft5
                  fsqrt.s      fs11, ft1, rtz
                  fle.s        s1, fs10, fa0
                  fcvt.w.s     a7, fa3, rdn
                  xor          tp, a0, a7
                  xori         t1, gp, -1762
                  or           s2, t3, zero
                  srli         t4, zero, 19
                  addi         s4, tp, -130
                  sub          a1, s3, a4
                  addi         zero, s3, 508
                  srai         t4, s2, 13
                  fdiv.s       fa1, fs11, fa3
                  mul          s0, s6, t4
                  slli         s8, s7, 10
                  fadd.s       fs8, fa2, fa3
                  flt.s        tp, ft8, fs0
                  fle.s        tp, ft10, fa2
                  fcvt.s.wu    ft4, s11, rmm
                  fclass.s     a7, ft11
                  addi         ra, zero, -620
                  lui          sp, 187905
                  andi         sp, s4, 203
                  fcvt.w.s     s1, fs10, rup
                  rem          s8, ra, t3
                  fmv.x.w      s8, fs6
                  fcvt.wu.s    a2, fs4
                  rem          zero, t6, a2
                  flt.s        a2, fa5, fs11
                  xori         a6, a2, 558
                  fcvt.s.wu    ft8, t5, rne
                  rem          s2, s3, t4
                  srli         t5, t1, 15
                  andi         gp, t6, -426
                  flt.s        ra, ft1, ft3
                  srli         t5, ra, 8
                  slt          s8, a2, s10
                  xor          s7, t1, t6
                  or           s10, s2, t0
                  fadd.s       fa1, fs8, fs5
                  fmax.s       ft4, ft3, fa3
                  fsub.s       fa2, ft11, fa7
                  mul          gp, t5, s5
                  nop
                  slli         s2, a2, 22
                  sra          s1, s5, t0
                  andi         s5, t0, 593
                  srl          a6, s10, s3
                  xori         t0, t2, -23
                  sltu         tp, s3, gp
                  xori         s7, sp, -1183
                  fclass.s     s11, ft8
                  fmin.s       ft3, ft5, fs0
                  xori         s1, s7, -881
                  lui          t0, 610457
                  feq.s        gp, fa7, fs4
                  mulh         t5, zero, zero
                  fadd.s       fa3, ft8, fs3
                  mul          a7, a3, s6
                  mulh         sp, s2, t5
                  remu         a3, s4, a6
                  mulh         t2, s9, s1
                  slti         s9, t3, -405
                  add          sp, a1, s3
                  srai         gp, s6, 23
                  slli         s8, s4, 5
                  slti         a2, t0, 114
                  fsqrt.s      fa7, ft0, rdn
                  fsgnjx.s     ft0, fa3, ft7
                  lui          a2, 900617
                  fmv.w.x      ft9, a0
                  slt          t3, a6, a2
                  fadd.s       ft4, ft3, fa6
                  fmv.x.w      t3, ft6
                  fsgnj.s      ft1, ft9, fa2
                  fsgnj.s      ft7, ft10, fs0
                  fsqrt.s      fa7, fs2, rup
                  fmul.s       ft6, ft2, fs4
                  fdiv.s       fa0, fs5, ft6
                  xor          s4, t6, sp
                  xor          sp, s4, t0
                  slt          s0, s11, s5
                  xor          t2, t2, t4
                  lui          t1, 1039886
                  fsqrt.s      ft8, ft11, rmm
                  fsgnj.s      fs8, ft7, fs8
                  fsgnj.s      ft8, fs7, fa6
                  lui          s8, 851607
                  fmin.s       fs8, ft4, ft11
                  fadd.s       ft8, ft5, ft4
                  xori         s5, s5, -1115
                  srl          s5, a5, a2
                  fdiv.s       ft11, ft6, fs0
                  sub          ra, s3, s6
                  slt          s5, a6, s4
                  srai         a3, s0, 6
                  srl          ra, s10, a2
                  fcvt.w.s     s2, fs0, rtz
                  andi         a5, a7, -879
                  flt.s        a5, ft9, fs2
                  mulhu        a3, s5, s4
                  fdiv.s       fs4, ft7, fs10
                  fmul.s       fa4, fs3, fs9, rup
                  mul          t0, s8, a7
                  sra          s1, a1, s10
                  nop
                  fcvt.w.s     a7, ft3, rne
                  rem          t0, s4, a5
                  fadd.s       ft0, fs3, ft1
                  fsgnjn.s     fs11, fa2, fs6
                  sltiu        a6, s1, -836
                  or           s6, s5, a3
                  sltu         s5, a4, t1
                  slti         a2, s7, 965
                  srl          a3, t0, zero
                  slli         s10, s4, 3
                  slt          t2, s7, s10
                  fdiv.s       fs5, ft0, fs9
                  fcvt.s.w     fs1, s1, rtz
                  sltu         s2, a0, gp
                  fcvt.w.s     ra, ft5, rmm
                  sub          s5, a2, a7
                  fmax.s       fa5, ft8, ft4
                  fmin.s       fs8, fs5, ft8
                  fsgnjn.s     fs0, ft1, fs0
                  fle.s        t2, fa0, ft10
                  mulhu        s6, t6, s3
                  xor          t3, t1, t2
                  xor          s8, a5, a7
                  fmul.s       ft1, ft11, ft9
                  fsqrt.s      ft5, fs0
                  slti         s1, gp, -931
                  fmax.s       ft6, ft8, ft4
                  srl          s5, s4, t4
                  srli         s9, a2, 11
                  andi         s0, gp, -576
                  fclass.s     s11, fs8
                  divu         a5, s3, t3
                  fcvt.s.w     ft8, t2
                  add          s1, a2, a5
                  auipc        t0, 79634
                  xori         s0, a1, 1498
                  lui          s2, 836977
                  mulhu        s9, s6, s0
                  fcvt.wu.s    tp, ft10
                  fmv.x.w      ra, fs5
                  sltiu        s0, s7, 1719
                  sub          t2, t2, s0
                  mul          gp, s4, s3
                  fmv.x.w      s2, fs4
                  fsgnj.s      ft2, fs10, fa5
                  remu         zero, t0, tp
                  or           s5, a5, a3
                  fcvt.w.s     a7, ft10, rdn
                  rem          t4, t5, sp
                  auipc        t3, 531765
                  srl          t1, t4, s7
                  or           s3, s11, t5
                  auipc        a6, 282709
                  srl          tp, gp, s3
                  slti         a7, s0, 1941
                  ori          s7, t5, -1165
                  srli         s9, ra, 31
                  slli         a3, t3, 16
                  add          s1, t0, a2
                  lui          s11, 207307
                  sltu         s2, t2, s9
                  fmax.s       fs2, fa7, fs8
                  fclass.s     s10, ft7
                  fadd.s       fs11, fs11, fa0, rtz
                  auipc        t5, 996706
                  nop
                  fcvt.wu.s    s0, ft6
                  auipc        t3, 560746
                  feq.s        t2, ft7, fa6
                  fsqrt.s      ft2, fs10, rtz
                  slli         t2, a2, 25
                  feq.s        s2, ft6, ft9
                  sltu         s7, s10, s0
                  andi         s9, sp, 1825
                  srai         zero, s7, 26
                  feq.s        a7, fa4, fs1
                  fcvt.s.wu    fa7, tp
                  mulhu        s2, s6, gp
                  fcvt.w.s     s6, ft0
                  mulhu        a2, s1, t6
                  fsgnjx.s     ft10, ft3, fa2
                  fsqrt.s      ft2, fa6, rup
                  slti         a2, gp, -709
                  fmv.x.w      sp, ft7
                  srl          ra, a2, s1
                  srli         a5, zero, 3
                  mulhu        s9, s11, a1
                  nop
                  divu         s8, a5, t5
                  flt.s        zero, ft5, fs10
                  fmax.s       ft9, fa3, fs8
                  fmin.s       fs10, fs3, ft4
                  fmv.x.w      a1, ft0
                  fsub.s       fs2, fa0, fs3
                  fclass.s     a5, fs4
                  sltu         a6, t4, t2
                  addi         a1, a3, -1498
                  lui          a3, 837351
                  lui          a3, 451430
                  fcvt.wu.s    s8, ft4, rmm
                  auipc        a2, 250294
                  slt          tp, tp, s10
                  andi         sp, a2, -846
                  fsgnj.s      ft6, ft11, fa1
                  sll          t0, s6, a3
                  fmax.s       fs1, fs1, fa1
                  ori          s8, s2, 25
                  auipc        a2, 946803
                  xor          s4, ra, a5
                  sub          a7, s7, t2
                  sra          sp, a7, a5
                  addi         s5, ra, -452
                  sra          gp, s8, s10
                  divu         sp, a1, sp
                  fmin.s       fa7, ft8, fs10
                  fcvt.wu.s    s2, fs0
                  slli         a5, t3, 26
                  flt.s        a3, fs4, fs10
                  sltu         s1, s0, s2
                  nop
                  fcvt.w.s     s11, fa0, rup
                  sltu         s8, s4, a3
                  mul          s1, s5, t4
                  fsgnjx.s     fs7, fa6, fa1
                  fcvt.s.wu    fs8, s1
                  fsgnjn.s     ft10, fs8, fs6
                  mulh         s3, s6, t5
                  fmul.s       ft10, fa7, ft9, rdn
                  fmv.w.x      fs2, s1
                  andi         a5, s8, -1891
                  slli         ra, t0, 28
                  feq.s        s2, fs2, fs3
                  fclass.s     s2, ft2
                  fcvt.wu.s    s7, ft3
                  mulhu        ra, zero, t6
                  fadd.s       fs10, fa1, fs7
                  fcvt.w.s     a1, ft10, rtz
                  feq.s        t5, fs4, fa1
                  auipc        zero, 311485
                  xor          t2, s3, s1
                  fsgnjn.s     ft8, ft5, ft7
                  srl          t5, s3, a6
                  slti         gp, sp, 461
                  ori          s0, s11, -1915
                  fadd.s       fa0, fs10, ft9
                  xori         s3, a5, -1837
                  ori          s5, t2, 1244
                  rem          a5, a6, s2
                  andi         a6, a1, -120
                  fmax.s       fs10, ft0, fa5
                  fcvt.wu.s    s9, fa5, rmm
                  fsgnjx.s     fa0, fa7, fs10
                  xori         s0, t2, 144
                  sll          s3, ra, t0
                  srl          tp, s10, zero
                  fmv.x.w      s8, fs8
                  xori         a3, t2, 596
                  or           a6, a7, s7
                  srl          a3, a0, t4
                  sra          s3, a6, s6
                  fsqrt.s      fs1, fs1
                  fsgnjx.s     fa4, ft7, fa6
                  ori          s9, s2, 1335
                  fcvt.s.w     fa3, a0, rdn
                  fmv.x.w      s1, fs8
                  slli         a3, t3, 27
                  fsgnj.s      ft6, fs2, ft5
                  and          a7, s1, a5
                  sra          a7, s0, t3
                  fcvt.wu.s    t0, ft9
                  fdiv.s       fs9, ft10, ft1, rmm
                  and          ra, s0, gp
                  sub          a2, gp, s4
                  fclass.s     a5, fs0
                  fmax.s       fa3, ft4, fa3
                  fadd.s       ft9, ft5, fs5
                  sltu         s0, t0, s4
                  ori          tp, s5, -1043
                  fcvt.w.s     t5, fa7
                  sll          sp, s2, t1
                  sltiu        s2, t3, -1323
                  fle.s        a6, fs2, ft10
                  fadd.s       ft9, fa4, fs1, rdn
                  sra          ra, s5, t3
                  fsqrt.s      fa4, fa0
                  fcvt.s.wu    fs6, s10
                  fmin.s       fs7, ft2, fa1
                  div          a1, s11, a5
                  lui          t2, 258215
                  srli         s8, zero, 30
                  addi         s11, a0, 1
                  slti         a5, s4, -585
                  mul          a1, t5, s3
                  fsgnjx.s     ft1, ft5, fs10
                  fsgnj.s      fs0, ft1, fa4
                  mulhu        zero, s2, a2
                  auipc        s0, 399874
                  addi         t5, s7, 656
                  mulhsu       t0, a6, a2
                  mulhu        s2, s11, s4
                  sltu         s9, s5, sp
                  xori         s7, s4, 20
                  ori          s7, t1, -628
                  sltiu        a5, a5, 1241
                  fle.s        s5, fs3, fa2
                  srli         tp, s9, 0
                  srl          s2, tp, s9
                  sra          s11, s3, s6
                  fadd.s       ft10, fs0, fs6, rmm
                  remu         t4, t3, a3
                  lui          sp, 562217
                  srli         a5, s11, 10
                  slti         s4, a6, 222
                  fcvt.s.wu    ft11, tp, rtz
                  fcvt.wu.s    tp, fs7
                  addi         a5, s7, 248
                  andi         s10, tp, 466
                  nop
                  fle.s        s4, fa1, ft2
                  fdiv.s       fs7, ft4, fa2
                  fsgnjx.s     fa5, fa5, fa0
                  auipc        a2, 436809
                  fsgnjn.s     ft3, ft2, ft6
                  fmv.x.w      tp, fa2
                  or           a6, s11, s8
                  fsgnj.s      ft9, fs2, ft10
                  ori          a5, s5, 1980
                  mul          sp, sp, a5
                  srl          a7, a3, s0
                  fmax.s       fa3, fs6, fa3
                  fmin.s       fs0, ft6, fs7
                  fmul.s       fa3, fs8, fa5, rdn
                  andi         s5, a2, 1705
                  rem          s8, s11, t1
                  fadd.s       ft5, fs9, fs6
                  and          s4, s6, s7
                  sra          t1, t4, a5
                  sltiu        t1, a6, -704
                  sltiu        s5, a1, -127
                  slti         s1, a4, -915
                  and          s7, t4, s7
                  remu         ra, a3, s0
                  mul          s4, s5, sp
                  andi         s7, s11, -1399
                  fsqrt.s      ft0, ft10
                  sra          s4, s9, s3
                  fmax.s       ft6, fs3, fs10
                  div          a6, t5, s4
                  fsgnjx.s     ft1, fs0, fs1
                  fadd.s       ft0, fs8, ft10
                  lui          s4, 606379
                  fcvt.w.s     t0, ft4
                  fmax.s       ft11, fs8, fa1
                  flt.s        a7, fs3, ft10
                  fsgnjn.s     fa1, ft11, fa0
                  fsub.s       fa3, ft9, ft8, rtz
                  slti         t3, a6, -1972
                  fmin.s       fs3, fs3, fs8
                  fadd.s       ft4, fa2, fs6
                  rem          a7, t3, t0
                  fmax.s       fs4, fs10, fs4
                  divu         a2, a7, s1
                  remu         t4, s5, gp
                  fadd.s       ft6, ft8, ft4, rne
                  fsgnj.s      fa3, ft11, ft6
                  fmv.w.x      fs6, a4
                  fsgnjn.s     fa7, fs10, fs8
                  fmul.s       fs11, ft10, fs1
                  slt          t1, t6, s7
                  andi         gp, s7, -1396
                  sra          a5, s4, t3
                  fmv.w.x      fs2, t5
                  xori         s1, a5, 1302
                  div          a5, sp, t5
                  feq.s        t4, ft2, ft2
                  remu         t5, t1, t2
                  fsgnj.s      fa3, fs8, fs1
                  fcvt.w.s     s6, fs10
                  add          s0, s3, s6
                  sltu         s0, s0, zero
                  fsqrt.s      ft2, fa6
                  sll          s2, a4, a3
                  fmv.w.x      ft3, s8
                  fcvt.wu.s    s9, fa6, rtz
                  fmv.w.x      ft4, t5
                  fcvt.s.w     fs1, s3
                  fcvt.s.wu    ft7, a7
                  addi         s9, a2, -252
                  ori          s3, a0, -588
                  mulhu        s8, s0, s10
                  slti         zero, a5, -352
                  addi         sp, s2, -503
                  mulh         s9, a6, zero
                  sll          s4, t0, t5
                  fcvt.w.s     zero, ft1
                  remu         a7, s1, s9
                  sra          s9, s0, a3
                  auipc        a3, 461377
                  sub          ra, a0, s9
                  srai         a6, s0, 9
                  addi         s9, s7, -1443
                  fcvt.wu.s    s5, ft1
                  mul          s5, s10, tp
                  srli         a6, a7, 1
                  fle.s        t0, fs3, ft0
                  fsub.s       fs3, fs0, ft5, rdn
                  addi         s10, s10, -617
                  fmax.s       fs4, fs7, fs2
                  remu         gp, s9, s11
                  ori          t4, a7, -843
                  fsqrt.s      ft11, fs6
                  srai         t5, s1, 18
                  andi         zero, s7, -987
                  fcvt.w.s     s8, fa2, rtz
                  feq.s        a3, fa5, fa5
                  fsub.s       fa3, fa0, ft7
                  fmax.s       fs4, fs5, ft4
                  sra          sp, zero, zero
                  or           a7, t5, a5
                  xor          s1, a7, t4
                  slt          a6, t6, s2
                  div          t5, s3, a2
                  add          tp, s10, s0
                  fsgnjx.s     fa2, ft10, fs8
                  fcvt.s.wu    fs8, t0
                  addi         s0, s9, 1125
                  sll          s8, s3, s1
                  fmin.s       ft8, fs6, fa5
                  nop
                  addi         a6, t5, -657
                  fmv.w.x      fa7, gp
                  mulhsu       zero, t5, sp
                  fsub.s       fa0, ft3, fs1, rmm
                  fsgnj.s      fs6, fa7, fs8
                  auipc        ra, 628862
                  sub          t0, a0, sp
                  srli         s2, a5, 19
                  slti         s4, t3, 7
                  mul          s0, a6, s1
                  and          s9, tp, s10
                  fmin.s       ft3, ft0, ft5
                  fadd.s       fs3, fs4, fa5
                  sltu         s0, gp, t4
                  mulhu        a6, t4, s2
                  xor          ra, s8, s11
                  fmax.s       fs7, ft6, ft3
                  flt.s        s2, fs1, fs9
                  rem          s1, t5, zero
                  srai         sp, s2, 19
                  sltu         s1, a6, t3
                  div          a6, a1, s8
                  nop
                  fle.s        s4, ft8, fs6
                  slti         gp, a4, -613
                  fsgnj.s      fs9, ft10, fs8
                  remu         a5, ra, a0
                  sll          zero, t4, s4
                  fcvt.wu.s    s11, fs7
                  andi         tp, gp, -518
                  fsgnjn.s     fs1, fs8, fs5
                  fsub.s       ft11, fs5, ft10
                  mul          t3, s11, ra
                  andi         a3, s5, -29
                  fmv.x.w      gp, fa7
                  fsgnj.s      fa1, fs10, ft2
                  and          t2, s8, s0
                  feq.s        s11, fs0, fs9
                  addi         t4, a1, -955
                  fdiv.s       ft11, fa4, fs6, rmm
                  srl          a7, a3, zero
                  xori         s6, t0, -401
                  fsub.s       fs11, fs3, fs1
                  andi         t4, a2, 2046
                  fsgnjn.s     fs2, fa6, fa5
                  srl          s3, a7, t6
                  fcvt.s.w     fa0, a7, rup
                  fmv.w.x      ft4, s7
                  and          s7, s4, zero
                  auipc        s6, 812317
                  fcvt.s.wu    fs11, a2
                  sll          s6, a3, gp
                  div          s5, gp, a3
                  fadd.s       fa2, fs0, fs8
                  fmv.w.x      fa6, ra
                  ori          ra, a1, 1312
                  xor          t1, zero, t2
                  rem          t0, s6, a1
                  rem          a1, t0, s5
                  mulhsu       a3, s4, s9
                  fmul.s       ft2, fa7, fa1
                  mulh         s1, gp, t1
                  auipc        s11, 900489
                  sra          sp, s0, s5
                  and          t2, t4, a5
                  lui          s6, 679549
                  rem          s1, zero, s7
                  xor          s6, t6, t3
                  fcvt.s.wu    fs4, s11, rne
                  fcvt.s.wu    fs4, s9
                  ori          a3, t6, 365
                  srli         s0, sp, 27
                  sltu         a6, ra, t1
                  srai         t3, a3, 15
                  fcvt.wu.s    s8, ft10
                  srai         s2, s9, 1
                  sltu         t1, s2, s6
                  sltiu        t2, zero, 350
                  slt          s1, a7, a0
                  fmax.s       fa1, fs3, fs8
                  fmin.s       ft6, fa3, fa4
                  fclass.s     a3, ft2
                  fcvt.wu.s    a3, ft6
                  mulhsu       s3, a0, s9
                  fclass.s     t2, ft1
                  and          a2, s7, s10
                  sub          a7, s5, ra
                  flt.s        s5, fs5, fa5
                  lui          t5, 665952
                  fmax.s       fs1, fs9, fa6
                  srli         s11, s9, 27
                  fdiv.s       fa1, fa0, fa3
                  fdiv.s       fa6, ft1, fa3
                  srai         t5, a4, 24
                  fsgnj.s      fa0, ft10, fs1
                  fsgnjn.s     ft8, ft6, ft6
                  fcvt.wu.s    t4, fs11
                  sub          tp, s9, a1
                  fclass.s     a5, fa6
                  mul          s4, t1, gp
                  fmv.x.w      s2, ft8
                  slt          s3, s7, a3
                  sll          a3, zero, gp
                  fsqrt.s      fs2, fs0, rup
                  rem          a2, s5, t5
                  sll          t5, a2, s6
                  srai         a6, zero, 28
                  mul          t4, a3, t2
                  fdiv.s       fa3, fs4, fs2
                  fcvt.w.s     s9, ft8
                  fsgnj.s      fs5, fa4, fs9
                  fdiv.s       fs2, ft9, fa3, rdn
                  fmul.s       fs5, ft3, ft11, rup
                  fdiv.s       fs7, ft5, ft9, rup
                  xori         s3, a0, 1723
                  mulhu        a1, ra, s11
                  fcvt.w.s     s2, fs10, rtz
                  add          s3, a6, t5
                  srai         t0, a1, 23
                  mulhsu       gp, s11, tp
                  fmv.w.x      ft10, tp
                  fsub.s       ft0, fs1, fs10
                  and          t3, a7, t0
                  srl          a7, a5, s4
                  slti         a2, s5, -1330
                  fadd.s       fs8, fa3, ft0, rtz
                  fclass.s     s7, fs11
                  fsgnjn.s     fs0, ft4, ft4
                  xor          t0, t2, a7
                  slt          ra, a5, a5
                  fsgnjx.s     fs6, fa7, ft5
                  fmin.s       fs2, fs10, ft6
                  and          s7, a0, s3
                  flt.s        ra, ft8, ft11
                  slli         a1, a6, 13
                  xori         t3, s1, -1148
                  and          s9, ra, a7
                  sll          a7, gp, s5
                  fsub.s       fs10, ft4, fa4
                  mulhu        s3, a1, s4
                  sltiu        s4, a2, -559
                  fsqrt.s      ft0, fa3, rne
                  lui          s1, 859579
                  fsgnj.s      fs8, fa0, ft0
                  sltiu        a3, s11, -1307
                  fdiv.s       fs6, fa5, ft10, rmm
                  sll          t3, s3, sp
                  remu         t1, t1, s0
                  fsgnj.s      ft3, fs0, fa7
                  div          s2, t2, s6
                  feq.s        a7, fa2, fa7
                  lui          s5, 447229
                  mulhsu       s0, t2, s3
                  slli         tp, tp, 17
                  slt          s11, t6, s11
                  srl          a2, t2, s3
                  or           t2, s4, s7
                  addi         t1, t6, -261
                  fcvt.s.wu    fs0, s2, rmm
                  lui          s3, 240687
                  fmax.s       fa2, fs6, fa7
                  sltu         t2, t3, t4
                  lui          t2, 573453
                  sll          s4, t1, s0
                  nop
                  slti         a2, t0, 571
                  fle.s        s6, ft1, ft9
                  fdiv.s       fa6, ft5, ft0, rdn
                  fsgnjx.s     fa2, fs6, fa5
                  feq.s        s2, fs7, fa2
                  mulhsu       a3, a1, t2
                  fcvt.w.s     s4, fs9, rtz
                  rem          t4, sp, a1
                  remu         a3, a1, s11
                  xori         s5, s2, -1044
                  andi         t3, sp, -1840
                  fcvt.s.wu    ft6, a2
                  divu         s5, a3, s0
                  fadd.s       fa0, fs1, fs2, rne
                  fcvt.wu.s    gp, fa1
                  fsgnjx.s     ft10, ft11, ft6
                  fsqrt.s      ft10, fa1
                  feq.s        t4, fs5, fs9
                  divu         t1, a7, s7
                  xori         a5, t0, -1629
                  fcvt.s.w     fs1, t0
                  fdiv.s       ft0, fs8, fa2
                  xori         t4, a6, 878
                  slt          gp, s10, s1
                  auipc        a3, 778201
                  fle.s        t4, ft4, fs9
                  fadd.s       ft7, ft5, ft3, rup
                  div          a2, a3, a1
                  srl          s4, s2, t3
                  srai         s9, s3, 18
                  fcvt.wu.s    s10, fs9
                  slli         t2, gp, 16
                  mul          s2, a2, s5
                  fsgnj.s      fa6, fa6, ft4
                  rem          t0, a3, s1
                  slt          a3, a2, s8
                  andi         s7, s5, 210
                  slti         s7, tp, -269
                  rem          s1, t3, ra
                  sra          t2, a3, s11
                  srli         s0, s4, 6
                  fcvt.wu.s    ra, ft2
                  add          a7, a1, sp
                  add          a5, t1, s4
                  mul          ra, s2, t4
                  ori          a7, s6, -1861
                  andi         s7, a4, 1871
                  fsub.s       ft11, fa0, fs11
                  fmin.s       fa3, ft4, ft10
                  fadd.s       ft9, fa7, ft11
                  fmv.x.w      s10, fs10
                  lui          s1, 367602
                  fcvt.w.s     s5, fa0, rup
                  andi         t0, s0, 1363
                  lui          s1, 55536
                  fdiv.s       ft6, ft11, ft3, rtz
                  andi         sp, s6, -1738
                  sltu         s0, sp, s4
                  ori          s7, s2, -791
                  rem          s11, t2, s4
                  flt.s        s4, ft1, fs10
                  xori         a7, t0, 154
                  slt          s6, s5, s6
                  srl          a3, s5, zero
                  div          a1, gp, s1
                  nop
                  rem          tp, sp, t2
                  sll          s2, tp, t3
                  fdiv.s       fa1, fs3, ft10
                  slti         zero, t5, -1709
                  fcvt.w.s     t4, fs4
                  fadd.s       fs0, fa7, fa3, rup
                  and          a6, t6, s7
                  feq.s        s1, ft3, fa5
                  fmax.s       fs4, fa4, ft0
                  and          a6, s7, a2
                  mulhu        t0, a1, s7
                  ori          s8, s11, -1688
                  fmv.w.x      ft2, a0
                  addi         t5, t1, -1022
                  lui          s4, 783261
                  lui          s1, 606495
                  remu         a2, zero, t3
                  sll          s1, a2, t2
                  xor          s3, a6, ra
                  sra          t3, a3, s6
                  fmin.s       fs5, ft9, ft4
                  xori         a2, a3, -1999
                  srl          ra, t4, a4
                  remu         sp, s5, s2
                  or           ra, a5, t1
                  fdiv.s       fs0, fs10, fs1
                  xor          t2, s3, tp
                  div          t1, a5, s11
                  mul          sp, s11, s4
                  fsgnjx.s     ft5, fa3, fs9
                  fle.s        s11, fs11, ft6
                  fsub.s       fs5, ft8, fa1
                  srli         gp, s10, 20
                  sltiu        t0, s4, 1246
                  lui          s7, 894706
                  fle.s        s1, fs11, fs3
                  fcvt.s.w     fs9, s7
                  slti         s10, a3, -1460
                  xori         s9, s11, -1129
                  fcvt.wu.s    gp, fa2, rmm
                  fadd.s       ft5, fs8, fs8
                  flt.s        s7, ft4, fs2
                  sltu         s1, zero, tp
                  mulhu        s6, s10, t6
                  sra          s5, tp, a0
                  auipc        a7, 1009700
                  div          ra, a6, s7
                  fmv.w.x      fs11, s4
                  fclass.s     zero, fa4
                  addi         a6, t1, 1941
                  div          s4, sp, s7
                  or           t5, s10, s0
                  or           tp, t6, s10
                  srl          t4, t2, t2
                  auipc        a6, 38506
                  nop
                  mulhsu       s4, a7, s4
                  or           t3, s7, s3
                  lui          s5, 66199
                  fsqrt.s      fs5, fs6, rne
                  fcvt.s.wu    fa2, zero, rtz
                  fsqrt.s      ft1, ft10
                  fsub.s       fs11, ft3, fa7
                  fsgnjx.s     fa7, fa4, fs11
                  fsgnj.s      fs11, fs1, ft10
                  sltu         tp, t2, t3
                  slli         sp, a7, 3
                  add          t2, s9, t6
                  sll          t0, s4, s1
                  xor          s3, a3, s11
                  fcvt.s.wu    fs1, a3, rtz
                  fsgnjx.s     fs7, fs9, ft5
                  addi         zero, a1, 1289
                  fmul.s       fa5, fa5, fs4
                  sltu         t4, ra, a0
                  auipc        t0, 412410
                  srli         sp, s3, 27
                  fmax.s       ft9, fa4, fa2
                  fmin.s       ft6, fa6, fa1
                  feq.s        s8, ft1, fs8
                  fadd.s       fs0, ft0, fs1
                  slti         a3, a3, -1777
                  lui          s0, 548920
                  srli         s9, t0, 7
                  xor          s3, tp, a6
                  div          a7, a7, t5
                  mul          s4, ra, ra
                  fmul.s       fs11, fs1, ft3, rdn
                  fclass.s     s9, fs2
                  fmv.x.w      s5, fa3
                  srai         s1, a4, 2
                  fclass.s     a3, fa0
                  mul          a5, ra, tp
                  andi         s11, s8, -148
                  xori         s3, t0, 733
                  addi         s6, s0, -1961
                  fmax.s       ft5, fa3, fs7
                  xor          t1, t3, a3
                  fcvt.s.wu    fa4, s8, rdn
                  sltu         s0, s10, s10
                  mulh         s9, a7, t5
                  div          s10, ra, zero
                  fclass.s     s11, fs8
                  remu         s4, a4, ra
                  fmv.w.x      fa6, s6
                  fsgnjx.s     fa1, ft4, fs3
                  fmin.s       fa7, ft4, ft6
                  add          s1, s11, tp
                  fcvt.w.s     a2, fa3, rup
                  xori         s3, t0, 741
                  lui          zero, 492953
                  fdiv.s       ft9, ft6, fa6, rdn
                  fmv.x.w      t5, fs2
                  lui          s11, 916102
                  mulhsu       t3, t5, s3
                  fsub.s       fs2, fs3, fa7, rtz
                  fcvt.wu.s    zero, ft10, rup
                  xori         s5, s6, 391
                  addi         t1, sp, -370
                  fcvt.wu.s    ra, ft9
                  xor          s7, s4, a6
                  sub          a6, gp, s1
                  fle.s        a7, fa1, fa2
                  sll          a6, t4, s11
                  mulhsu       ra, a5, s10
                  mulh         sp, t6, sp
                  srai         s9, a2, 8
                  xori         ra, t0, -1085
                  fmin.s       ft6, ft7, fa0
                  sll          s2, gp, a0
                  fclass.s     sp, fs4
                  fclass.s     t0, fs11
                  auipc        t3, 250490
                  fle.s        t4, fs6, fa1
                  fsqrt.s      fs5, fs8
                  srl          a1, a2, a3
                  slli         t2, t6, 6
                  slli         s0, t0, 29
                  sub          t3, a4, a0
                  fmul.s       ft9, ft1, fs9, rdn
                  div          t1, gp, s8
                  div          s10, s8, gp
                  slli         s3, a5, 14
                  sll          zero, s8, s8
                  fsqrt.s      fa3, fs7, rmm
                  fcvt.s.w     fa2, a6
                  fcvt.wu.s    ra, ft5, rtz
                  and          a5, zero, a7
                  fsgnjn.s     ft7, fs10, fs7
                  mul          s2, a5, a5
                  fsgnj.s      ft9, fa4, fa5
                  rem          s7, gp, a5
                  fmul.s       fa0, fa3, fs5
                  rem          t5, gp, zero
                  fdiv.s       ft2, ft0, fa4
                  srl          t5, a1, sp
                  srli         s8, a4, 7
                  feq.s        sp, fs6, fa6
                  flt.s        a3, ft6, ft10
                  div          t5, s11, a6
                  remu         s10, a7, zero
                  fcvt.s.w     fs0, s7
                  fcvt.s.w     fs3, t4
                  fsgnjx.s     ft1, fa0, ft8
                  sub          s11, a1, t6
                  and          s5, s4, a5
                  auipc        t4, 25401
                  fmax.s       fs11, fa6, ft5
                  xori         t1, ra, -656
                  sltu         t3, t3, ra
                  addi         s9, t0, 469
                  slli         s4, s8, 30
                  fclass.s     s9, fs0
                  mul          tp, s6, s11
                  addi         a6, a5, -645
                  mulhsu       s2, a6, s4
                  auipc        s6, 650565
                  mul          s11, t4, a5
                  fclass.s     a7, fs1
                  sltu         s10, t5, s4
                  and          t4, tp, a5
                  fsgnj.s      fs1, fs6, fa1
                  srli         t0, a5, 10
                  mulhsu       a1, a1, a4
                  xori         t0, gp, -709
                  and          zero, t4, t1
                  fdiv.s       fa5, ft1, ft10
                  fmin.s       ft3, ft10, fa0
                  mulhsu       a7, s11, t2
                  add          t5, s5, t3
                  fsgnj.s      fs6, fa3, fa3
                  div          ra, a2, t1
                  nop
                  fadd.s       ft8, fs1, fs11
                  xori         s10, t3, 2028
                  sltiu        s9, t5, 1932
                  addi         s0, a2, -195
                  fcvt.s.wu    fa6, s1, rmm
                  mul          a7, a2, a0
                  fsgnj.s      fs5, ft10, ft8
                  fadd.s       ft0, fa7, fs2
                  fsgnjn.s     ft11, ft0, fs6
                  srli         a5, a7, 20
                  fdiv.s       fa0, fa4, fs10, rdn
                  mulhsu       t2, s6, t4
                  fcvt.s.w     fa5, s5, rup
                  fmul.s       fa5, fa4, fa6, rmm
                  rem          s7, t4, a5
                  add          ra, t5, a7
                  div          s0, a4, t0
                  sra          s9, zero, s11
                  fdiv.s       ft11, fa6, ft2
                  fmin.s       fs5, fs9, ft10
                  fle.s        s8, ft10, fa7
                  remu         a6, s0, a2
                  srl          s10, a3, s8
                  fcvt.w.s     a1, fa4
                  fdiv.s       fa0, ft3, fs7
                  fmv.w.x      ft2, a3
                  fmin.s       ft9, ft0, ft3
                  fcvt.wu.s    s5, fs7, rmm
                  fclass.s     ra, fa1
                  fdiv.s       fs7, fs6, ft7, rtz
                  nop
                  sltiu        s6, a2, -1856
                  rem          a1, a0, s9
                  fcvt.s.wu    fs10, s7, rne
                  addi         a2, s11, 343
                  fclass.s     s10, fs2
                  srl          sp, s5, a5
                  srl          s3, a1, s2
                  fsgnj.s      fa4, fa2, fs9
                  slti         s9, a5, 969
                  andi         tp, a7, -1873
                  sub          t5, tp, s11
                  fcvt.wu.s    a6, ft7, rtz
                  fclass.s     ra, ft1
                  remu         s7, s10, t0
                  fsqrt.s      fs1, fs11, rtz
                  flt.s        s2, ft9, ft10
                  srai         s8, a7, 13
                  fcvt.s.wu    fs0, zero, rmm
                  fcvt.s.w     ft6, a3
                  fsub.s       fs9, ft0, ft6, rne
                  slli         a3, s6, 5
                  feq.s        zero, ft4, fa4
                  divu         tp, a1, a1
                  or           a5, t4, t0
                  divu         s3, s7, s0
                  sltu         s4, a2, t5
                  slli         s2, s6, 19
                  mulhsu       a6, t6, a0
                  fmv.w.x      fa3, s2
                  auipc        a6, 287475
                  srli         t2, a2, 21
                  mul          ra, s6, ra
                  fsgnjx.s     fs7, fa1, fs0
                  srai         t0, s6, 25
                  fcvt.s.wu    fa1, s5, rtz
                  fmv.w.x      fa3, s6
                  slli         a3, s5, 31
                  fcvt.s.w     ft6, s2
                  divu         t1, t3, s5
                  srai         t2, s3, 19
                  nop
                  mulh         s11, s9, t5
                  fadd.s       ft6, ft11, ft9, rup
                  addi         s1, s5, 665
                  or           s7, a0, gp
                  lui          a7, 81132
                  fsub.s       fs2, fs0, ft2, rup
                  sra          t1, s2, s4
                  srli         zero, a7, 4
                  flt.s        tp, fa4, fs4
                  srl          t5, t2, gp
                  sra          s7, a6, a5
                  auipc        t2, 381960
                  sra          s10, gp, t6
                  and          s7, s9, s2
                  andi         a2, a6, -453
                  fmax.s       ft8, fs9, ft8
                  addi         s3, s0, -583
                  lui          a7, 65931
                  sub          a5, s1, s10
                  fsgnjx.s     fs6, ft5, ft11
                  fcvt.w.s     t3, fa0, rdn
                  auipc        t5, 330733
                  sub          a1, s6, a3
                  lui          tp, 182361
                  add          s8, a2, t5
                  mulhsu       ra, gp, t2
                  fcvt.s.wu    ft2, gp, rtz
                  srai         zero, s0, 15
                  fmax.s       fs6, fa6, fa7
                  lui          s2, 662730
                  mulh         a5, t0, s10
                  or           s0, s11, t3
                  sltu         s5, s10, t1
                  slt          gp, a4, t0
                  fmax.s       fs5, fa1, fs1
                  mulhsu       a1, t1, s8
                  mulhsu       s6, sp, t6
                  or           t0, a7, gp
                  flt.s        s1, fs3, fs7
                  srai         ra, t1, 26
                  fmax.s       fa1, fa2, fa6
                  fsgnjx.s     ft4, fa4, ft8
                  nop
                  lui          s6, 288362
                  sra          s10, s6, s2
                  fcvt.w.s     a6, fa7, rmm
                  sll          s5, s3, zero
                  fmul.s       fa2, ft6, fs5, rup
                  fcvt.wu.s    t5, fs8
                  mulhu        s0, s11, s4
                  mulhsu       s5, a6, t4
                  feq.s        s11, fs7, ft4
                  fmv.w.x      fs11, t2
                  add          gp, gp, s4
                  fdiv.s       fs5, ft5, ft4, rtz
                  fmul.s       ft7, ft0, ft2
                  sra          t2, tp, tp
                  fclass.s     s5, ft0
                  xori         a7, t3, -1809
                  mulhsu       s3, a3, a2
                  fle.s        a6, ft0, fa1
                  fcvt.wu.s    gp, ft2, rne
                  nop
                  fsgnj.s      ft6, ft7, fs8
                  add          sp, a1, a7
                  andi         sp, a1, -166
                  fcvt.wu.s    t1, ft10
                  fdiv.s       fs0, fs5, fa5, rtz
                  slt          s10, zero, s4
                  lui          s6, 411954
                  fsgnjn.s     fa5, ft10, fa5
                  divu         ra, a3, t0
                  fsqrt.s      fs11, ft7, rtz
                  flt.s        s5, ft7, fa6
                  fcvt.wu.s    t3, ft10, rup
                  flt.s        s2, ft0, ft0
                  fsgnj.s      ft9, fs9, fa4
                  addi         ra, s1, 877
                  sra          s1, a1, s6
                  fle.s        t4, fs9, fs0
                  fsgnj.s      fs7, ft4, fa3
                  fdiv.s       fs10, ft2, fa7
                  srl          t5, s8, s6
                  sra          a2, s2, a4
                  fmul.s       ft8, fs0, fa4, rtz
                  sra          s5, a3, s7
                  fcvt.wu.s    s11, ft1
                  mulhu        s5, a6, t1
                  and          s9, t0, a5
                  lui          s3, 162359
                  fadd.s       ft2, ft1, fs4, rtz
                  fclass.s     s4, fa0
                  mulhu        a7, t2, s8
                  srai         t5, t5, 24
                  fsqrt.s      fs7, fa6
                  div          a2, s6, tp
                  or           gp, a5, s4
                  mulh         s4, s0, a6
                  or           s0, a2, s0
                  rem          a1, s0, s2
                  feq.s        t4, ft11, fa6
                  fclass.s     s1, fs10
                  fmv.x.w      s6, fa4
                  fsgnj.s      ft1, fs0, fs5
                  or           sp, s1, s8
                  fmax.s       ft7, fa7, fa4
                  feq.s        zero, fa3, fs7
                  xor          t3, s0, t1
                  slti         t4, t1, 1423
                  slti         s11, zero, 492
                  div          gp, t0, s3
                  remu         a2, t0, s4
                  flt.s        a3, fs1, fs0
                  fdiv.s       ft3, ft10, ft9
                  fclass.s     t2, ft5
                  fsqrt.s      fs1, fs6
                  fadd.s       fs7, ft7, fa3, rup
                  fsgnjn.s     fs10, ft2, fs4
                  ori          t2, s5, 1015
                  xor          a3, t2, s6
                  and          t0, zero, a6
                  rem          zero, ra, a1
                  fmv.w.x      fs0, s9
                  slli         t0, t0, 13
                  fcvt.w.s     a2, ft11
                  fcvt.s.w     fs11, a0
                  fcvt.s.w     fa4, s11
                  fle.s        a5, fs3, fs11
                  fcvt.w.s     s0, fa0
                  fclass.s     a6, ft7
                  fmv.w.x      fa3, a5
                  mulh         s6, a6, a3
                  nop
                  sltiu        t2, t3, -1410
                  nop
                  ori          a1, tp, 810
                  andi         t5, t4, 863
                  feq.s        t0, fa3, ft0
                  or           a7, ra, t2
                  fsgnj.s      fs11, fs5, ft8
                  mul          s5, a5, t5
                  divu         a5, t6, s0
                  mulhsu       a5, s3, s11
                  divu         gp, t1, a1
                  fcvt.wu.s    s7, fs6
                  fsub.s       fs10, fa2, fs2
                  sltiu        t0, tp, -533
                  rem          ra, sp, a2
                  fadd.s       fa6, fa6, fs5
                  rem          a3, s9, t2
                  div          s4, gp, a3
                  fle.s        s6, fa0, ft9
                  srl          ra, zero, s10
                  sll          gp, t0, a5
                  xori         s9, a7, -127
                  fsgnj.s      ft11, fs6, fs6
                  fcvt.wu.s    t2, fs7, rdn
                  addi         t4, a5, -642
                  srai         s6, s4, 21
                  fclass.s     ra, fs3
                  fmul.s       fa5, fa2, ft11
                  fmax.s       fs7, ft6, ft3
                  fsqrt.s      fa2, ft7, rtz
                  slli         a2, a6, 19
                  rem          t2, s4, t1
                  fadd.s       fs8, ft5, fa2
                  sra          t3, t3, t2
                  fmv.w.x      fs6, a5
                  xori         s0, t2, -7
                  fmv.w.x      ft2, a6
                  auipc        a3, 564373
                  slti         s11, s1, 31
                  srai         t3, a6, 16
                  fcvt.w.s     a6, fs6, rne
                  auipc        s4, 903234
                  mulhu        a3, t0, s4
                  rem          t5, t6, t6
                  nop
                  fcvt.s.w     fs8, a7
                  xori         a3, t1, -1766
                  add          a1, s2, t2
                  fsgnjn.s     fa6, ft6, fs7
                  fcvt.s.wu    ft10, s9
                  srl          s5, s10, s10
                  mul          tp, s11, a1
                  xori         a5, s0, 1724
                  fmul.s       ft11, fa0, fs10
                  fcvt.w.s     s11, ft7
                  remu         a6, a1, tp
                  slt          t4, gp, s10
                  sltiu        a1, a1, -1532
                  divu         ra, zero, t3
                  slt          s6, s8, a1
                  slli         a3, s3, 15
                  xori         a3, t1, 724
                  fclass.s     zero, ft3
                  or           s8, s9, s11
                  mulhu        a2, a2, zero
                  addi         t1, a2, -236
                  remu         t0, s4, s8
                  fmin.s       fa3, ft7, ft9
                  xori         s1, t3, 1847
                  fdiv.s       fs6, ft6, fs0
                  fcvt.s.w     ft4, t6, rmm
                  nop
                  mulhu        t4, s8, t4
                  fsgnjx.s     ft2, ft4, fa0
                  and          a2, a6, s1
                  add          s7, sp, a0
                  andi         tp, a2, 1974
                  lui          t0, 788988
                  sra          a1, s11, gp
                  fcvt.wu.s    a5, ft8, rdn
                  ori          gp, s4, -1495
                  fsgnjx.s     fa2, ft2, ft1
                  auipc        s3, 871093
                  sll          sp, a4, ra
                  feq.s        a1, ft10, fs6
                  fcvt.s.w     fa3, a6
                  sltiu        t0, t2, -234
                  rem          s0, zero, t3
                  fsgnj.s      fs7, fs5, fs8
                  fmv.x.w      a2, fa6
                  feq.s        t2, ft7, ft0
                  srai         s9, a5, 10
                  slli         s7, a4, 6
                  fcvt.s.wu    fs8, s3, rne
                  fmv.x.w      a6, fa7
                  ori          a3, sp, -274
                  fmv.x.w      a6, fs4
                  fcvt.wu.s    a5, fa0
                  flt.s        t0, ft5, fs4
                  fsgnjx.s     fs10, fs2, fs7
                  mulh         s5, s2, s1
                  add          t1, s5, t2
                  fcvt.s.w     fs5, t4, rup
                  fdiv.s       fs1, fs9, fa3, rup
                  slli         s11, sp, 12
                  flt.s        s11, fs5, fa4
                  slt          ra, s0, s9
                  fmul.s       fs7, fs9, fs2, rup
                  fcvt.wu.s    a2, fa7, rdn
                  fadd.s       ft0, fs0, fs2, rdn
                  and          s1, a5, t3
                  mulhsu       t1, ra, s1
                  mul          s8, s5, sp
                  sra          s0, a2, s5
                  slt          tp, s8, s8
                  div          s8, s2, a3
                  mulhu        s3, t2, ra
                  sll          zero, a1, a4
                  fsub.s       fs7, ft7, ft3
                  mulhsu       s11, a5, s4
                  div          s10, t3, s9
                  fsgnj.s      ft8, ft2, fs11
                  sub          s9, s4, t6
                  fsgnj.s      fa7, fs2, fs5
                  nop
                  or           gp, s3, t3
                  fadd.s       fs6, ft2, fs2
                  sra          t1, tp, tp
                  fsgnjx.s     fs8, ft4, fs6
                  addi         s7, gp, 776
                  and          t0, a7, a2
                  slli         s5, a4, 22
                  srli         a7, s4, 6
                  slt          a1, s6, t6
                  slt          s8, t2, t4
                  div          sp, s10, a4
                  xor          a2, a2, s11
                  slt          a1, t5, zero
                  feq.s        a1, fa7, fs3
                  fcvt.s.wu    fa4, s6, rup
                  fsgnjx.s     ft3, ft3, ft5
                  remu         t1, t0, t0
                  mulh         s9, s11, ra
                  fdiv.s       fa1, fs3, fs0
                  xor          a2, s11, s11
                  fcvt.wu.s    s5, ft5
                  fmin.s       fs5, fs4, fs11
                  sll          t2, a3, s9
                  sltu         s5, a3, zero
                  andi         s7, ra, -1147
                  srai         s9, a7, 18
                  fsgnjx.s     fs7, ft3, ft7
                  fsgnj.s      ft4, ft6, ft6
                  fclass.s     a3, fs4
                  fmul.s       fa4, fa5, ft10
                  fmul.s       fs1, fa5, ft4
                  or           s9, t0, ra
                  lui          ra, 882170
                  nop
                  fmv.w.x      fa6, a5
                  fmv.x.w      s8, fs6
                  fdiv.s       fa7, ft6, ft6
                  fsqrt.s      fs0, ft11
                  mul          tp, ra, a2
                  fmv.w.x      ft2, a3
                  fsgnjn.s     fa5, fs7, fs0
                  fmul.s       fs7, ft11, ft5
                  srl          a7, a7, t3
                  fcvt.wu.s    t1, fs5, rdn
                  mul          a1, s7, a2
                  sltu         s11, s5, t6
                  andi         a3, t0, -381
                  fsgnjx.s     ft6, fa1, fs4
                  ori          t2, t0, 1032
                  fmax.s       ft2, ft11, ft8
                  mulh         a2, sp, s9
                  slti         gp, s9, 405
                  fsqrt.s      fa5, fa1, rdn
                  remu         s0, s11, t2
                  flt.s        s3, fa0, fs8
                  sub          sp, s10, sp
                  fdiv.s       fs10, fs5, ft8, rup
                  fsub.s       ft8, fa0, fs10
                  sra          gp, a7, t1
                  fcvt.w.s     s3, fs3, rne
                  fle.s        tp, fa5, fa1
                  sltiu        t2, t6, -1314
                  fle.s        s11, ft9, fa2
                  slti         sp, tp, 1967
                  lui          zero, 836078
                  srli         s4, s5, 4
                  fcvt.s.wu    ft9, a4
                  fmin.s       fa2, fa2, fa2
                  fcvt.s.w     fs0, t6
                  divu         a2, a5, a4
                  srai         zero, t1, 3
                  and          a1, a0, sp
                  andi         s11, tp, -566
                  add          tp, ra, s8
                  or           s1, a0, a3
                  or           a7, s10, s7
                  auipc        tp, 452896
                  andi         t5, s1, 711
                  slt          s0, tp, tp
                  fmul.s       ft9, ft9, fs6
                  fsgnj.s      ft7, fs1, fs7
                  slli         t2, tp, 4
                  add          t1, s9, t1
                  remu         s1, s1, t1
                  fcvt.s.w     ft5, a1
                  fadd.s       ft6, fa7, fa4, rtz
                  fdiv.s       fs5, fs9, ft0, rtz
                  fmv.w.x      fa6, t6
                  sll          ra, a3, s7
                  slli         s0, tp, 26
                  mulhsu       t1, s6, t6
                  fmin.s       ft11, ft6, ft7
                  srl          t1, t5, s7
                  fsqrt.s      fa2, fa1
                  slti         s11, a4, -1536
                  div          t2, s2, s0
                  fsqrt.s      fa6, fs5
                  add          sp, a6, a6
                  ori          s7, a7, -859
                  srai         s5, a2, 18
                  slt          s1, tp, a6
                  or           a5, s6, a4
                  srai         a5, s6, 18
                  divu         s4, a7, s11
                  xori         s11, s9, -1747
                  nop
                  fsgnjx.s     ft7, fa1, fa5
                  feq.s        a5, ft8, fa4
                  sub          a3, s11, s8
                  sltiu        s7, t5, 1379
                  ori          a7, a6, 734
                  srl          sp, s6, s5
                  fsgnjn.s     fs3, ft8, ft2
                  fcvt.wu.s    t4, fs5
                  add          s2, s2, s1
                  fcvt.s.w     fs10, s11, rup
                  sltu         s1, t4, t5
                  fmv.w.x      fs1, s6
                  slti         zero, a5, 1940
                  fcvt.wu.s    t0, ft6, rne
                  sll          t1, a5, a5
                  fcvt.s.wu    fa3, t5
                  nop
                  sltu         a6, a7, s6
                  nop
                  divu         s5, t1, a5
                  feq.s        s6, fs11, ft0
                  ori          a6, a4, -996
                  fcvt.s.w     fa4, t1, rtz
                  sll          s11, s5, a0
                  fsgnjn.s     fa4, fs11, fs10
                  srli         s4, zero, 26
                  mulhsu       t4, s11, t1
                  add          a5, s3, s0
                  or           a6, s0, t5
                  srli         t0, s4, 20
                  andi         a2, gp, -247
                  divu         tp, a0, t2
                  fmv.w.x      fs7, tp
                  srai         ra, s11, 6
                  mulhsu       t5, a3, zero
                  ori          t5, a3, -83
                  sltiu        s2, s5, -1870
                  fsqrt.s      fs1, fa1, rtz
                  auipc        s10, 376290
                  fsub.s       fs9, ft7, ft6
                  srli         t3, zero, 4
                  div          t2, s3, s11
                  fmv.w.x      fa3, a2
                  fsgnjn.s     fs10, ft0, fs6
                  fmv.x.w      s11, fa5
                  sub          s9, a7, s1
                  auipc        t3, 545526
                  xori         s9, s1, -2042
                  fmax.s       fa6, fs2, fs1
                  divu         s0, s0, a3
                  mulh         t2, s7, a4
                  sltiu        t1, a7, 881
                  fcvt.wu.s    t5, ft10
                  or           s2, ra, zero
                  mulh         a7, s2, s0
                  ori          t0, s7, -1858
                  sub          s10, s7, t3
                  xori         s4, s3, 1359
                  fadd.s       fs5, ft6, ft6, rdn
                  andi         gp, t5, -830
                  fsub.s       fa5, ft2, ft5
                  fsgnjn.s     ft11, fs10, fs6
                  addi         a2, a2, 316
                  fcvt.w.s     s9, fs7, rtz
                  fsgnj.s      fs4, ft4, ft0
                  slt          t3, t2, s3
                  fcvt.s.w     fa4, a2
                  sltu         t2, s8, t0
                  slt          s6, s10, a6
                  flt.s        t5, ft1, fs10
                  auipc        s4, 779567
                  slti         s8, t4, 1054
                  fmul.s       fs2, ft6, fa1
                  slli         t2, s5, 5
                  fcvt.wu.s    s8, fa3, rdn
                  nop
                  add          t3, a2, s3
                  or           zero, a2, t5
                  fcvt.w.s     s3, fs4, rmm
                  flt.s        s2, fa5, fa3
                  add          tp, a3, t6
                  fcvt.s.w     fa6, s9, rdn
                  andi         t2, zero, 1916
                  xor          zero, a3, t5
                  fmv.x.w      s0, ft2
                  mulh         tp, s0, a5
                  and          s4, s9, ra
                  remu         s10, t4, s11
                  sra          a5, tp, a5
                  xor          s3, s1, s0
                  nop
                  fsub.s       fs11, fs5, fs9
                  fadd.s       fa2, fa6, fa3
                  slti         s5, a0, -183
                  or           sp, s11, t5
                  fdiv.s       ft7, fs2, fs1
                  slt          a5, s7, tp
                  div          s0, zero, a4
                  divu         gp, s7, zero
                  addi         sp, a2, 1775
                  sub          s8, sp, s11
                  fsgnjx.s     ft8, ft4, fs8
                  or           s11, t1, s0
                  srl          a1, s6, s7
                  sltu         zero, a5, s1
                  sra          s0, t3, s11
                  slli         tp, s0, 13
                  fsgnjn.s     ft1, fa4, fa0
                  sll          s7, s5, a1
                  sub          s4, t5, s0
                  fsub.s       ft10, ft4, fs4
                  fmul.s       fs9, fa1, fa0, rtz
                  xori         t0, a6, -1978
                  mulhu        s4, s7, tp
                  feq.s        a7, fs9, fs2
                  xori         ra, t6, 669
                  srai         s2, s0, 5
                  xori         sp, s11, 1089
                  or           s7, a2, s1
                  fmax.s       fs10, fs6, fa4
                  srl          t2, s6, a7
                  mulhu        t4, a1, s3
                  fmv.x.w      a6, ft5
                  sub          s2, s5, s7
                  mul          t2, s4, gp
                  fmin.s       ft0, fs2, fs3
                  mulhsu       s2, a2, s2
                  slti         a2, sp, -1841
                  add          s3, zero, zero
                  fmv.w.x      fa3, a4
                  fcvt.s.w     fa3, s10, rmm
                  slli         s6, s10, 7
                  mul          s7, s1, a0
                  sltu         s6, t2, t0
                  add          ra, t5, s9
                  fadd.s       ft10, ft11, fs0, rdn
                  fmin.s       ft5, fa1, fs7
                  fcvt.w.s     zero, ft8
                  mulhsu       zero, s3, a0
                  fsgnjn.s     fa3, fa3, fa3
                  slti         s0, a3, 127
                  fmax.s       fa3, fs10, ft1
                  fmv.w.x      fs5, t3
                  fdiv.s       fa4, ft4, fa1, rdn
                  fle.s        t2, ft7, fs1
                  fsub.s       fa5, fs8, fs5, rtz
                  fsgnjx.s     ft10, fs10, fa3
                  ori          s9, a0, -1587
                  fdiv.s       fa2, fa4, ft6
                  fcvt.wu.s    s5, ft11, rdn
                  mulhsu       t1, sp, s4
                  nop
                  ori          s9, gp, -1909
                  and          t2, t6, s5
                  fclass.s     s4, ft5
                  slt          a1, t0, a0
                  sra          s10, t0, s5
                  sra          a1, t4, s0
                  slli         s10, a7, 18
                  fsgnj.s      fs1, fa5, ft9
                  fle.s        t1, ft5, ft2
                  srli         t5, t3, 4
                  add          s6, a1, t0
                  and          s2, a1, t3
                  mulhsu       t3, s5, s0
                  add          s9, s6, a6
                  sll          s11, a5, a3
                  fclass.s     a2, fs5
                  fdiv.s       ft8, fa5, fs7, rup
                  fle.s        t0, ft0, fs4
                  fdiv.s       fa0, fa2, fs4
                  fclass.s     t4, fa2
                  fmv.w.x      fs5, a2
                  mul          ra, t0, t2
                  andi         t2, t3, -902
                  sll          t0, zero, t4
                  ori          s9, a7, 1075
                  fadd.s       ft6, fs3, ft4
                  fsgnj.s      ft2, fs7, ft1
                  addi         s11, a3, -938
                  andi         s11, a4, 955
                  mulh         t0, ra, t0
                  fcvt.s.w     fs7, zero, rup
                  rem          s1, t0, t4
                  sll          s7, ra, s5
                  mul          t5, a7, t5
                  flt.s        sp, fa1, fs2
                  feq.s        sp, fa7, fs4
                  sub          s10, t3, t5
                  srl          t0, sp, ra
                  auipc        zero, 749426
                  fcvt.wu.s    s10, fs4, rup
                  xori         s7, s10, -85
                  andi         a3, a2, -1050
                  slli         ra, a7, 12
                  sltu         t0, t2, a7
                  divu         ra, s11, t0
                  nop
                  fcvt.wu.s    s2, fs8
                  fmax.s       fs0, ft11, fa7
                  fcvt.s.wu    fs10, s8
                  fcvt.w.s     s11, fs3
                  fmin.s       ft10, ft6, fa1
                  srl          a5, t1, a5
                  slli         a2, s9, 13
                  rem          t2, a6, s2
                  addi         a5, a4, 788
                  srai         t2, gp, 18
                  fsub.s       fs5, ft6, fs2, rtz
                  slti         tp, t5, -911
                  slt          a7, t1, s3
                  sll          s2, a3, t3
                  fsgnjx.s     fa3, fs8, fa2
                  fmax.s       fs3, ft11, ft2
                  mulhu        s9, s2, a3
                  slt          s10, t6, a2
                  fmin.s       fs11, fs11, fa1
                  srai         s7, s8, 13
                  mulhsu       t5, a1, s5
                  fle.s        t0, fs9, fa6
                  sra          s7, t2, t2
                  xori         t3, s5, -1356
                  fmin.s       ft11, fs4, ft7
                  fsqrt.s      fs4, ft3
                  feq.s        a2, ft1, fs3
                  fcvt.wu.s    s4, fs10
                  flt.s        s1, ft8, ft7
                  fclass.s     a6, ft0
                  fmin.s       fs6, fa2, ft2
                  div          s0, zero, a4
                  mul          a5, t2, a5
                  add          s1, a3, t5
                  ori          ra, s9, 1865
                  fdiv.s       fs8, ft6, fa2
                  fclass.s     t0, ft2
                  fadd.s       ft4, ft1, fs1
                  fcvt.wu.s    t5, ft7, rmm
                  mulh         s8, s0, gp
                  mulh         s5, t1, t6
                  div          gp, t6, t2
                  fcvt.s.wu    ft3, t0
                  fcvt.w.s     t5, fa4, rne
                  remu         s6, a1, a1
                  sub          s10, t3, a7
                  sltu         a6, t6, t2
                  mulhu        a1, s10, sp
                  ori          a2, s5, -1464
                  fadd.s       fa0, ft3, fs7, rtz
                  fmin.s       ft6, fa6, ft0
                  fsqrt.s      fs11, ft11
                  srai         t5, a7, 27
                  slti         gp, a6, 1921
                  slti         a7, s10, 1132
                  srl          s6, s1, a0
                  ori          s10, a0, 1501
                  fmv.w.x      fs7, s7
                  auipc        s8, 672177
                  fcvt.w.s     a6, fs11
                  sltu         t4, a2, s2
                  divu         s2, s11, s3
                  slt          s2, gp, sp
                  ori          gp, a7, -818
                  divu         s7, t5, s10
                  sra          t5, s4, a4
                  addi         s11, s4, 546
                  xor          s1, t4, s10
                  fsqrt.s      ft6, fs3
                  fmv.x.w      t4, fa1
                  nop
                  ori          t5, a4, -786
                  fdiv.s       ft10, fa7, fs6
                  fmul.s       fa1, fs5, ft3, rne
                  fsgnjx.s     fa5, fs5, fs9
                  slt          s7, t1, s4
                  slti         gp, s3, 1324
                  sltiu        t4, s7, -1402
                  fsgnj.s      fs10, fa6, fa0
                  andi         s11, gp, -1176
                  fmv.w.x      fa7, t4
                  fmax.s       ft7, ft4, ft3
                  addi         s0, a5, -367
                  ori          s7, t3, 1395
                  fsqrt.s      fa6, fa7, rtz
                  divu         s2, t3, t0
                  fadd.s       ft9, fs10, ft5, rtz
                  slt          s6, ra, s10
                  srli         s1, a3, 29
                  fsub.s       ft9, ft4, ft1
                  auipc        s8, 1030851
                  mulhsu       s7, s9, a0
                  sub          a6, s2, zero
                  add          a6, s7, t2
                  flt.s        t2, fa6, ft7
                  fsgnjx.s     ft11, fa5, fs7
                  or           a1, s1, s0
                  divu         s10, a1, t2
                  and          t2, s3, s8
                  mulhsu       t2, s10, a4
                  fsgnjx.s     ft6, ft4, ft7
                  rem          a5, a0, a2
                  slti         a3, t1, 1939
                  feq.s        s9, ft1, fs4
                  andi         s5, a3, -686
                  or           ra, a4, s7
                  xor          t3, zero, t0
                  fcvt.w.s     t3, ft7
                  fclass.s     s7, fs4
                  fmin.s       ft6, fa5, fa7
                  and          s6, a7, s5
                  xori         a3, a1, -34
                  flt.s        s11, fa5, ft0
                  fcvt.wu.s    s3, fs6, rmm
                  fcvt.wu.s    a1, fa1, rdn
                  feq.s        s0, ft1, ft11
                  srl          s0, t5, s10
                  div          s6, t4, s0
                  fmv.x.w      s5, ft4
                  add          a2, s10, a1
                  fcvt.s.wu    fs3, s1, rmm
                  fmin.s       ft10, fs3, ft5
                  mulhu        tp, a3, tp
                  fsub.s       ft1, fa3, fs2
                  fmin.s       fa2, fa5, fs7
                  xori         a3, a7, 1381
                  auipc        t2, 832696
                  nop
                  rem          t0, s5, s3
                  rem          s11, a2, ra
                  flt.s        s6, ft4, fa3
                  sll          zero, a0, sp
                  ori          t4, tp, 629
                  mulhu        a2, a0, s4
                  mulh         s10, a2, s11
                  addi         tp, a0, -401
                  fmin.s       fa1, ft6, fs1
                  or           s0, t6, s8
                  add          sp, s1, a1
                  nop
                  fmax.s       fs1, ft1, fa7
                  sltu         s2, s4, t2
                  slli         t4, a7, 16
                  sltu         t4, a1, a7
                  sub          s8, s4, ra
                  xor          t5, a4, s8
                  mulhu        a1, s2, a3
                  fmul.s       fa6, fa6, fa5
                  and          s8, tp, a4
                  rem          s6, s2, sp
                  sltiu        gp, a3, 495
                  fle.s        t5, fa4, fs4
                  mulh         a2, t6, a6
                  mulh         gp, a6, t1
                  fsgnjx.s     fa0, fs6, ft9
                  xor          s10, t4, s5
                  sltu         a1, tp, s9
                  fcvt.w.s     zero, fs0
                  fmin.s       ft7, fa5, fa0
                  mulhu        t1, s10, t5
                  srai         s0, t3, 26
                  fclass.s     t0, ft5
                  fmin.s       ft5, fs4, fs4
                  fsqrt.s      fa0, ft4
                  slt          t1, s1, t6
                  div          a5, s3, s2
                  flt.s        s2, ft7, ft4
                  fcvt.s.wu    ft8, t6
                  addi         zero, t3, -30
                  lui          s7, 541424
                  sltiu        s2, t2, 1298
                  fmul.s       fs3, ft6, fs6
                  divu         s5, s4, s3
                  lui          s9, 1030736
                  rem          sp, s3, s9
                  sra          s7, s0, t6
                  fsgnjx.s     fs3, ft9, ft0
                  addi         s3, sp, -1309
                  srli         gp, tp, 25
                  slt          s1, s0, zero
                  fmax.s       fa2, fs5, fs7
                  fsqrt.s      ft1, ft9
                  lui          s9, 813014
                  feq.s        s10, ft11, ft9
                  fle.s        a7, ft8, ft0
                  feq.s        t1, fa1, fa6
                  fmv.x.w      a5, ft2
                  mul          s6, a0, t5
                  addi         ra, t0, -1983
                  nop
                  fsgnj.s      fs2, fs11, ft4
                  div          s6, t4, s3
                  slli         a2, s4, 15
                  srai         s2, s11, 19
                  fdiv.s       fa5, fs9, ft2
                  feq.s        a7, fs10, fs4
                  fsgnjx.s     ft11, fa1, fs7
                  lui          t4, 289903
                  sra          s7, t6, sp
                  fmax.s       ft2, fa3, ft4
                  add          s9, a7, s5
                  andi         s3, s0, -1846
                  mulhsu       t0, gp, s10
                  fcvt.w.s     s4, fa7, rtz
                  lui          zero, 528110
                  fadd.s       ft9, ft5, fa1
                  fcvt.w.s     sp, ft9, rup
                  srai         s5, a3, 1
                  and          t2, s1, t0
                  sub          t0, a7, tp
                  add          s1, s11, s8
                  fmul.s       fa7, fs6, fs2
                  fmv.w.x      fs4, s10
                  srli         a3, a2, 0
                  addi         s5, t1, -639
                  fmul.s       fa1, ft8, ft1, rdn
                  slti         t1, s3, -1283
                  fcvt.w.s     s9, fs9, rmm
                  xor          tp, a3, s4
                  fclass.s     s2, ft5
                  fsgnjn.s     fs9, fs4, ft4
                  fsgnj.s      ft10, ft1, fs5
                  fclass.s     tp, fs2
                  sltu         ra, s5, s2
                  sub          ra, s2, a3
                  and          a3, ra, s0
                  andi         t0, a5, -1002
                  srai         tp, s7, 16
                  or           gp, s4, ra
                  fmv.w.x      fs1, a5
                  divu         s7, t1, a7
                  fadd.s       fs5, fa0, fs10, rmm
                  remu         s6, t4, s8
                  fsgnjx.s     fs10, fs5, ft0
                  slli         s0, a4, 11
                  remu         t1, t6, a7
                  lui          tp, 790449
                  remu         t5, s7, ra
                  mulh         t4, s1, a0
                  lui          s0, 780704
                  fmv.x.w      ra, fs10
                  fclass.s     s5, ft1
                  sra          t4, t5, t0
                  mulhsu       a5, s3, sp
                  fmv.w.x      ft9, a6
                  mulhsu       t2, s3, a7
                  rem          s4, a2, sp
                  fcvt.s.wu    fs10, s2
                  fcvt.w.s     s1, ft8, rup
                  sub          a6, a7, s3
                  slt          s4, s11, s4
                  mulhsu       a3, a3, t3
                  slti         t4, sp, -795
                  div          s2, a6, a2
                  div          a2, t3, t6
                  xor          t3, zero, t4
                  srl          tp, t6, s9
                  or           t3, s3, s7
                  or           s1, a2, t1
                  fclass.s     a7, fs0
                  remu         s3, tp, s2
                  andi         s1, t3, -352
                  sll          tp, s6, t5
                  fmax.s       ft2, fs2, ft5
                  sll          s1, s7, tp
                  rem          s6, s6, sp
                  rem          sp, s9, a2
                  fsgnjn.s     ft10, fs11, fa5
                  feq.s        s10, fs1, fs6
                  fclass.s     a1, fa6
                  sltu         sp, s6, s2
                  fcvt.s.w     fs9, s7, rdn
                  fsub.s       ft3, fa6, fa2
                  fmv.x.w      tp, ft5
                  xori         s1, s2, 219
                  slti         s4, s8, -1942
                  add          s3, t6, s2
                  fsgnjx.s     ft8, fa2, fs8
                  fmin.s       fa4, fs11, ft4
                  fsgnjx.s     ft3, fs7, fs6
                  flt.s        t4, ft2, fs10
                  sub          t1, s6, zero
                  sub          s7, s7, s9
                  fmv.w.x      fs11, s10
                  addi         s6, s7, 1721
                  fle.s        s1, ft6, fa3
                  sll          s11, t1, s0
                  slt          t0, t1, tp
                  fcvt.s.wu    ft8, s6, rup
                  fmin.s       fs11, fs8, ft5
                  div          sp, ra, s9
                  fsub.s       fa6, fa2, ft10
                  fcvt.s.w     fs11, a4
                  remu         sp, ra, t1
                  fmv.w.x      ft1, s4
                  rem          s9, s4, a2
                  fmax.s       ft9, fs10, fa3
                  or           s8, s7, a3
                  sltiu        s7, s10, 765
                  fsub.s       fs4, fs0, fa0, rup
                  fmv.x.w      t4, fa5
                  feq.s        ra, fa5, fa5
                  fsgnjx.s     fs9, fs8, ft9
                  fmv.x.w      s0, fs7
                  rem          t3, a1, s5
                  div          s7, s2, a3
                  srl          tp, tp, zero
                  fmin.s       ft5, fs7, fs10
                  lui          s8, 627343
                  remu         t5, t4, zero
                  fsgnjx.s     fs3, ft8, ft10
                  fadd.s       ft6, fs7, ft4
                  lui          s8, 579757
                  slti         s1, t3, 986
                  mul          s1, a3, t2
                  rem          a1, s3, s1
                  fcvt.wu.s    zero, fa0
                  mulhu        t4, ra, s4
                  feq.s        a2, fa6, fa6
                  fcvt.s.wu    fs4, a0, rmm
                  ori          s10, t2, 611
                  sltiu        a5, s11, -941
                  fsub.s       ft6, fs11, fa7
                  mulhsu       t5, ra, t2
                  auipc        t1, 77551
                  fcvt.s.wu    fs11, a0, rne
                  fmv.w.x      fs7, a0
                  fdiv.s       ft1, ft10, fa7, rne
                  slti         t3, s5, -824
                  slt          a5, t6, zero
                  xor          a1, s4, a1
                  slt          t5, s9, a2
                  fsqrt.s      ft4, ft11
                  or           a7, s3, t6
                  feq.s        t3, fs9, ft5
                  sub          a6, s7, a2
                  fmv.x.w      s5, ft1
                  andi         s7, a6, 296
                  fdiv.s       fs0, ft6, ft10
                  add          s8, a2, s9
                  and          s5, a2, s8
                  auipc        zero, 810272
                  fmax.s       fs7, fs6, ft1
                  fdiv.s       fa5, fa7, fs10
                  fadd.s       fa5, fs9, ft4
                  fsgnj.s      ft2, ft10, fa1
                  fcvt.w.s     ra, ft6
                  rem          t4, s8, a2
                  rem          s3, s8, a7
                  ori          s7, a2, 65
                  fsqrt.s      fa6, fa3
                  fsqrt.s      fa3, fa4
                  fle.s        a2, fa4, fs7
                  andi         gp, s10, 1819
                  ori          a5, a4, 187
                  fle.s        a7, fa3, ft5
                  fmv.w.x      fs5, s1
                  nop
                  mulhsu       s9, gp, a3
                  addi         t5, s9, 1474
                  fmin.s       fs8, fa7, fs11
                  sltiu        sp, a0, -1698
                  fmv.w.x      fa3, s9
                  mulhu        zero, a2, t0
                  and          a1, zero, s0
                  div          ra, a1, a6
                  and          s4, t3, t1
                  mul          a6, a5, a2
                  flt.s        t3, ft6, fa6
                  srl          a7, s7, s4
                  sra          gp, t0, ra
                  sltu         a1, s11, s10
                  add          a2, s6, a4
                  mulhsu       t0, s9, s6
                  fsub.s       fa2, ft1, fs3
                  slti         tp, s3, -1760
                  divu         a3, a7, s0
                  andi         t1, sp, -590
                  fsgnjn.s     fs11, ft10, fa2
                  nop
                  slti         t1, sp, 1649
                  fmv.x.w      a7, fs8
                  fle.s        s9, fa4, fs0
                  sltu         s5, s10, a1
                  fadd.s       fa7, fs5, ft4, rtz
                  fmv.x.w      s1, fs2
                  fmv.x.w      a7, fa1
                  addi         t5, s0, 1287
                  fclass.s     a7, fs11
                  fclass.s     a5, ft10
                  slti         t2, s11, 1796
                  fcvt.s.w     ft2, s7, rmm
                  fmul.s       fs5, fa1, fs2
                  flt.s        t1, fs11, ft5
                  andi         s2, s2, 1918
                  add          s1, s10, s7
                  fdiv.s       fs10, ft7, fs7, rmm
                  slti         s0, s11, -311
                  slli         s6, a1, 28
                  slt          s7, a6, s1
                  fmv.x.w      s6, fs1
                  and          s2, t4, a5
                  mul          t0, a4, s6
                  remu         t5, a5, t3
                  fcvt.s.wu    fs0, t6, rmm
                  fsgnj.s      fa7, fs6, fa4
                  slli         s1, s2, 21
                  sll          a6, sp, ra
                  fclass.s     a7, ft8
                  fcvt.w.s     a3, ft6, rmm
                  fsqrt.s      fa4, fa2, rup
                  or           t2, s0, t5
                  auipc        gp, 373317
                  xor          ra, a3, s8
                  srli         tp, t3, 8
                  xori         s7, a0, 301
                  fmv.x.w      a7, fs7
                  srli         s2, a1, 19
                  div          s9, s6, t4
                  addi         t2, s4, 1892
                  feq.s        tp, fs8, fa1
                  fclass.s     t4, fs10
                  fadd.s       fs1, fs7, fs3, rne
                  fcvt.s.wu    ft11, t6
                  fclass.s     s4, fs7
                  flt.s        s9, ft2, fs8
                  fdiv.s       ft0, fs3, ft9
                  fmin.s       fs8, ft1, fa6
                  mulh         s10, a5, a5
                  fmul.s       fs10, ft10, ft5
                  div          s10, gp, t5
                  feq.s        a7, fa6, ft10
                  fle.s        s4, fs10, fa3
                  fsub.s       fs5, ft9, fs2
                  fmin.s       ft6, fs5, ft6
                  fsub.s       fs2, fs10, fs11, rup
                  fsgnjn.s     fa2, ft10, fs3
                  fadd.s       ft9, ft8, fs4, rmm
                  sra          s9, s9, a3
                  fcvt.s.w     ft1, t2
                  slt          s10, s8, s5
                  fcvt.s.w     ft4, s6, rmm
                  sltu         t3, t4, sp
                  addi         a5, a2, -639
                  fsgnj.s      fs7, ft4, fs4
                  fcvt.s.w     ft9, a0
                  fmul.s       ft0, fa5, fs5, rne
                  slti         s3, s10, 906
                  mulh         s9, s9, t6
                  lui          zero, 942201
                  feq.s        s5, fs4, fs9
                  slli         s8, tp, 29
                  ori          zero, a2, -385
                  fmul.s       ft5, fs1, ft7, rmm
                  srl          s10, s11, t1
                  srai         s8, s11, 8
                  nop
                  and          tp, a6, s1
                  fle.s        s0, fa6, fa1
                  xor          a3, t1, t1
                  slli         s3, s1, 29
                  sll          a2, t2, s2
                  mulh         a1, a5, s8
                  fmul.s       fa0, ft4, fa3, rdn
                  ori          t1, t5, 1103
                  fsgnj.s      ft7, fa5, fa1
                  remu         s7, zero, a5
                  fsgnj.s      fs9, fs5, fa5
                  add          s11, t5, s9
                  ori          a2, s8, -173
                  fcvt.s.w     fs0, gp
                  fdiv.s       fa0, ft4, ft3, rmm
                  lui          s4, 77289
                  fle.s        zero, ft9, fa0
                  add          s1, a4, s7
                  fadd.s       fa5, fa3, fs9
                  fsub.s       fs5, fs10, fa5
                  sll          s6, sp, s9
                  fmv.x.w      s7, ft10
                  sra          a2, a4, a3
                  andi         t1, ra, 1091
                  fcvt.s.wu    fs11, t0
                  mulh         s4, tp, t0
                  slt          s3, s7, t1
                  mul          ra, a1, sp
                  srli         a1, ra, 21
                  sll          s0, t6, t2
                  feq.s        t4, ft11, fs8
                  srli         ra, t5, 0
                  fdiv.s       ft2, fs1, fa3, rmm
                  and          ra, s11, s5
                  addi         a7, t6, -309
                  fadd.s       ft8, ft6, ft4, rne
                  slli         s8, gp, 3
                  fcvt.s.w     fa5, s4
                  fdiv.s       fa4, ft8, ft6, rmm
                  srai         s1, a7, 27
                  srai         sp, zero, 6
                  feq.s        sp, fs10, fa2
                  lui          tp, 20191
                  sltu         t1, a1, ra
                  add          a3, t6, s10
                  xori         s8, s7, -458
                  sra          s4, s5, s6
                  nop
                  sltu         a3, a4, s3
                  fmul.s       ft11, ft6, ft2
                  lui          t1, 155058
                  fsgnj.s      ft3, fa1, fa7
                  slli         a1, s3, 0
                  fsgnjn.s     fs3, ft0, ft9
                  sltiu        a3, t4, -1561
                  srl          s0, s6, t6
                  fmax.s       ft6, fa7, ft1
                  fmv.w.x      ft4, a4
                  fmv.x.w      t4, ft11
                  fmv.x.w      zero, ft0
                  fsgnjx.s     fa2, fs11, fa3
                  fcvt.s.wu    fs9, s3, rtz
                  mulhu        t5, t1, t5
                  mulhu        s0, t3, a7
                  xor          t0, tp, s0
                  fsub.s       fa3, fs1, fa7, rne
                  nop
                  mulhu        zero, t6, s5
                  mulhsu       s10, s4, t3
                  addi         a2, zero, -922
                  fadd.s       ft8, ft4, ft6, rmm
                  fmax.s       fs4, ft6, fa4
                  fsub.s       ft7, fs0, fs8
                  sub          s5, tp, s0
                  lui          a3, 377246
                  and          s3, s1, a1
                  fcvt.s.w     fa1, a7
                  flt.s        t2, fs1, fs7
                  fcvt.s.wu    fa0, t6
                  feq.s        s6, ft5, ft7
                  srai         a1, t6, 2
                  srl          t2, t2, a7
                  fsgnjx.s     fs10, ft7, fa4
                  fmax.s       ft0, fs1, fa1
                  rem          gp, zero, t1
                  mulhsu       s7, s1, s0
                  srli         a5, a6, 1
                  sltu         gp, a0, s6
                  fadd.s       fa6, ft0, fs3
                  fcvt.s.w     fa1, a7, rtz
                  fcvt.s.w     fs6, a2
                  mulh         s6, s8, s8
                  slli         t2, a7, 17
                  srai         a5, t0, 12
                  srai         a1, ra, 4
                  and          s9, a0, zero
                  xori         s1, gp, 1129
                  fsub.s       fa5, fa1, fs3, rdn
                  fcvt.wu.s    s6, fa2, rne
                  slli         t4, a5, 9
                  fmv.w.x      fa7, t6
                  feq.s        s7, fs10, ft11
                  fcvt.s.wu    fa3, ra, rup
                  mul          s3, a7, a4
                  fcvt.s.w     ft0, t5, rne
                  srai         s6, s3, 17
                  nop
                  fdiv.s       fa6, ft8, fa1, rtz
                  fmax.s       fs10, fs7, ft9
                  fcvt.wu.s    gp, fs6, rup
                  fcvt.w.s     s0, fa2
                  feq.s        ra, ft2, fa7
                  div          a3, s9, s7
                  lui          t2, 537886
                  addi         a3, s6, -1271
                  nop
                  ori          a2, sp, 1720
                  fsgnj.s      ft4, ft1, fs10
                  fsgnjn.s     fs1, fs0, fs3
                  srai         s8, s10, 13
                  fsgnjx.s     fs7, fs4, fs5
                  xor          s11, t5, ra
                  feq.s        t0, fs11, fs4
                  fsgnj.s      ft3, fa5, ft8
                  fmv.w.x      fs5, s8
                  fsgnjx.s     fa1, ft0, ft6
                  or           a5, sp, a7
                  xor          a6, s0, s5
                  and          t2, a6, s3
                  mulhsu       s11, s0, s0
                  srl          t0, s5, s8
                  fmin.s       ft10, ft4, ft10
                  divu         a2, s10, s6
                  srl          s6, t5, sp
                  fmv.x.w      s5, fs4
                  mulhu        s11, t0, s7
                  remu         s1, s4, s9
                  addi         zero, s10, -122
                  fadd.s       fs11, ft0, fs4
                  fcvt.s.w     fs7, s9, rtz
                  add          s11, s10, s4
                  nop
                  nop
                  sub          t1, s6, zero
                  divu         tp, s10, t0
                  feq.s        s7, fa2, fs0
                  fdiv.s       ft1, fs0, fs7
                  andi         a2, t0, 26
                  fmin.s       ft3, fs10, fs6
                  or           a6, t0, ra
                  mulh         t0, t1, t1
                  srl          ra, a3, a5
                  add          a7, s9, t2
                  slti         t1, s3, -379
                  ori          s10, gp, -512
                  mul          s6, s6, a6
                  sll          t5, t3, s4
                  fcvt.s.w     fa2, t4
                  or           s2, s1, s4
                  divu         s10, ra, sp
                  auipc        t4, 831790
                  slli         t4, s0, 26
                  mulhu        s1, s5, a0
                  fsqrt.s      fa2, fs6
                  sra          t5, s10, a5
                  div          s2, s0, t2
                  fcvt.s.w     fs2, s11, rne
                  slt          t5, t0, a2
                  remu         gp, s6, s9
                  lui          tp, 275523
                  slti         s10, ra, 1814
                  srai         a6, s9, 28
                  sltiu        a2, a7, 1188
                  or           s2, s4, s2
                  divu         t4, s5, s11
                  srai         a5, a6, 8
                  sra          t2, s7, zero
                  srli         s5, a5, 12
                  fmv.w.x      fa7, zero
                  andi         t0, t2, -1277
                  fmul.s       fa3, ft3, fa3
                  nop
                  fcvt.s.w     fs0, ra, rdn
                  fmul.s       ft3, fs4, ft3, rne
                  fsub.s       fs2, fs7, fs0
                  auipc        a6, 745868
                  addi         t5, s0, 1351
                  fdiv.s       ft9, ft4, fs3
                  sll          s9, s11, t3
                  fcvt.wu.s    a2, ft6
                  divu         s8, t2, t3
                  fle.s        tp, fa2, ft8
                  and          gp, t6, gp
                  slli         gp, a0, 28
                  slt          zero, a1, s0
                  mulhu        s4, sp, s11
                  andi         a5, a3, -336
                  feq.s        s6, fa2, fs9
                  fdiv.s       fs10, fa4, fs0
                  fcvt.w.s     s1, fa0, rdn
                  div          gp, a7, s4
                  and          a2, t0, s6
                  fsqrt.s      fs4, fa5, rmm
                  sltu         zero, s4, s6
                  mulhsu       s7, t2, s4
                  fle.s        t1, ft0, ft8
                  srl          tp, s1, s2
                  sub          s11, tp, t4
                  fsqrt.s      fa4, fa4
                  addi         s7, s1, -1860
                  xor          sp, ra, tp
                  slti         s10, t0, 1571
                  remu         a6, s6, t5
                  sub          s9, gp, a2
                  flt.s        s5, fs6, ft2
                  slt          a6, s8, s2
                  ori          s11, gp, 1202
                  feq.s        t4, fs11, fs4
                  fsgnjx.s     ft10, fs2, fs11
                  slt          s7, t4, a7
                  fcvt.wu.s    t3, fs9
                  fle.s        s10, fa0, fs7
                  srai         s4, a4, 28
                  fsqrt.s      fs7, fs7
                  fsgnjx.s     fa2, ft10, fs8
                  sltiu        a3, a6, 917
                  mulh         zero, t2, a0
                  sltiu        a5, a5, -1386
                  sll          tp, s8, a4
                  fadd.s       fa0, fs6, fa6, rmm
                  fsgnj.s      ft10, ft1, fs9
                  fsgnjx.s     ft9, ft7, fs6
                  add          s8, s1, s7
                  srli         s9, a2, 22
                  fmin.s       ft6, ft1, fa6
                  slt          s9, a7, a2
                  slli         tp, s1, 1
                  sra          a7, zero, s9
                  auipc        t1, 275559
                  fsub.s       fs8, ft3, fs1
                  xor          s1, t3, s3
                  sltiu        s10, a1, 1710
                  fle.s        t0, ft11, fs0
                  srai         t2, a7, 15
                  fdiv.s       fa3, ft4, fs7
                  divu         s9, s8, s1
                  and          s5, a5, s9
                  rem          s0, s10, a3
                  fmul.s       fa5, fs11, fs3
                  and          a1, sp, s8
                  srl          a3, sp, t2
                  fsgnjx.s     fs9, fs6, fs0
                  fmin.s       ft1, ft3, fs6
                  slt          s2, a7, s4
                  andi         a6, a6, -898
                  xor          s3, s9, s0
                  sltiu        s8, a2, 439
                  fcvt.w.s     s8, fa1, rne
                  srl          s10, a2, s6
                  fmv.x.w      s5, fs11
                  feq.s        t4, fs0, fs1
                  ori          t3, s11, -281
                  fmin.s       ft8, fs0, fs6
                  fsub.s       fs10, ft1, ft3, rmm
                  mul          s8, tp, t6
                  flt.s        s1, ft6, ft1
                  sll          ra, a7, s8
                  addi         s5, a4, 1169
                  fadd.s       fs0, fa3, fa6, rtz
                  add          t0, s3, a0
                  fcvt.s.wu    ft2, s9
                  slli         t0, s9, 1
                  srai         s6, s5, 21
                  and          s0, zero, s11
                  flt.s        a1, fs0, ft0
                  add          s1, s8, s11
                  flt.s        s3, fs9, fs7
                  feq.s        s7, fa0, ft2
                  remu         a3, s10, zero
                  fsgnj.s      fa6, ft2, fa3
                  xor          t2, t5, t4
                  sra          a5, a0, s4
                  fsgnjn.s     fs5, fs4, ft8
                  mul          t1, s7, s6
                  fsub.s       fa7, fa2, fs9
                  srai         s4, tp, 15
                  fle.s        a2, ft7, fs5
                  rem          tp, a3, t1
                  sll          a2, s5, s6
                  rem          t4, s2, a2
                  ori          t0, sp, -1026
                  sll          ra, s5, t6
                  srli         s3, s10, 0
                  fsgnjx.s     fa1, ft6, ft6
                  flt.s        t1, fa6, ft0
                  fmv.w.x      ft7, t1
                  div          t3, t0, s5
                  sltiu        s10, t3, 2004
                  ori          a7, a6, 1882
                  fcvt.wu.s    ra, ft5
                  mulh         s4, sp, a1
                  lui          s10, 92057
                  xori         tp, t5, 94
                  remu         t2, a7, t4
                  fle.s        t0, fa4, fs8
                  fclass.s     s10, ft5
                  mulhu        a6, t4, a2
                  fsgnjn.s     fs11, fs9, ft4
                  slt          t5, s4, a7
                  slti         t4, zero, -643
                  fmin.s       fa4, fa0, ft3
                  addi         s4, s5, -81
                  remu         a3, t0, a5
                  mul          a1, s7, a1
                  fmul.s       fa6, ft7, fs7, rtz
                  srl          s8, a1, s6
                  sltiu        t4, s2, -1476
                  fcvt.s.w     fs3, a5, rup
                  xori         s9, t6, 1869
                  srl          t3, s2, s11
                  fmul.s       fa3, ft7, fs8, rmm
                  fle.s        gp, ft1, ft7
                  srl          a6, ra, tp
                  andi         t0, s4, 1552
                  addi         t1, s0, 960
                  andi         a3, a3, 1431
                  mulh         s6, t5, s6
                  srai         s6, s3, 22
                  xor          tp, a6, s0
                  srli         a5, a4, 18
                  or           s6, sp, t6
                  xor          s8, a6, t6
                  mulh         a1, s11, t6
                  fcvt.wu.s    a7, fa1
                  fsgnj.s      fs1, fa7, fs0
                  sll          s5, s0, s11
                  slli         t5, t0, 12
                  sll          s1, t2, a5
                  fmax.s       fa1, ft5, fs6
                  lui          a6, 608225
                  and          s2, t2, a0
                  fsub.s       fs6, ft2, ft2
                  remu         s11, s9, t1
                  slli         a3, t4, 28
                  remu         ra, s9, t2
                  sll          gp, s2, a3
                  div          t4, a5, t0
                  remu         s0, sp, s4
                  div          t5, s11, s8
                  sub          t1, t0, t1
                  ori          a7, s8, -1396
                  xori         t4, s8, 794
                  mulhu        s8, s5, t4
                  or           a2, t2, t4
                  add          t3, a0, s11
                  fcvt.s.wu    ft5, zero
                  auipc        s9, 844010
                  mulhsu       a7, a6, a0
                  sltiu        gp, a6, 885
                  div          a1, tp, t6
                  fsub.s       ft5, fs10, ft11, rne
                  sltiu        tp, t1, -213
                  fsqrt.s      fa0, ft8, rdn
                  fmax.s       fs4, ft9, fa2
                  xori         gp, sp, 1561
                  fmv.x.w      a7, ft10
                  fsub.s       ft9, ft1, fs8
                  divu         s10, zero, gp
                  divu         t4, tp, a1
                  srai         a1, s2, 18
                  div          zero, a0, a4
                  mulhsu       t2, a0, a2
                  feq.s        gp, fa6, fs1
                  fmul.s       fa5, fs0, ft0
                  fadd.s       ft2, ft1, fs2
                  and          s2, s4, t3
                  fadd.s       fa7, fa5, fs3, rmm
                  sub          s2, s8, s7
                  sll          a7, t5, a2
                  srl          s9, s3, t0
                  lui          gp, 808382
                  addi         a1, s10, -1874
                  flt.s        a1, fs0, fa3
                  fmv.x.w      s9, fs3
                  slli         s7, s6, 1
                  xor          s2, t2, s7
                  rem          t5, ra, s4
                  fmv.w.x      fs3, a0
                  fmv.x.w      t3, ft9
                  slt          s0, s0, s0
                  fdiv.s       fa0, fs4, fs7, rup
                  or           t2, ra, zero
                  fdiv.s       fa7, fa7, ft0
                  flt.s        a1, fs0, fa0
                  nop
                  srl          a2, s0, t2
                  fcvt.w.s     a1, fs3
                  add          sp, a6, a3
                  srli         t2, t0, 23
                  mulh         a1, gp, a5
                  flt.s        a6, fs9, fa2
                  flt.s        t4, ft3, fs7
                  sra          a7, sp, s11
                  mulhu        tp, sp, a3
                  fsqrt.s      fa1, ft11, rup
                  fadd.s       fa6, fa4, fa1
                  sll          zero, s4, s1
                  fmin.s       fs3, fs5, fa3
                  srli         t1, s7, 10
                  feq.s        s5, fs8, fa5
                  fmul.s       ft11, fa1, fs5, rne
                  sra          ra, a7, s11
                  add          t4, a5, a4
                  srai         zero, t5, 8
                  srl          t5, s0, s10
                  fmv.w.x      fs10, a5
                  fcvt.s.wu    fa2, t1
                  fle.s        s7, fa0, fa2
                  rem          s7, a6, t5
                  xori         t5, t6, 95
                  lui          t5, 152863
                  fle.s        a3, ft3, fa0
                  divu         s3, s9, s9
                  fcvt.w.s     t5, fs0
                  srli         t2, s1, 18
                  sll          s1, s8, a3
                  xor          t0, tp, gp
                  fcvt.w.s     s3, fa5, rne
                  andi         s5, gp, 395
                  fcvt.s.wu    fs4, s4
                  xor          s3, s8, a6
                  div          t5, t5, t5
                  sll          t3, s9, s11
                  fsgnjx.s     ft2, ft8, fa4
                  flt.s        s10, fs1, fs7
                  fsgnj.s      fs10, ft9, ft1
                  feq.s        t2, ft9, fa6
                  fdiv.s       fs7, ft5, fs3
                  flt.s        t0, ft2, fs1
                  fclass.s     a6, fs3
                  fsgnjn.s     fa4, fa6, fs11
                  or           tp, t3, s11
                  srl          s4, s5, sp
                  fmv.x.w      s7, ft6
                  fcvt.s.wu    fs4, t4
                  fsgnj.s      fs2, fs10, fs0
                  srli         a2, s8, 3
                  fdiv.s       ft10, fs2, fa6
                  fsgnjn.s     ft7, fa1, fs0
                  sltu         s6, s6, ra
                  fadd.s       fa7, fs2, fs7
                  fcvt.s.wu    fs9, zero
                  rem          s3, s9, a6
                  addi         a5, s2, -1042
                  mulhsu       a5, a2, s6
                  srai         s10, s8, 15
                  fdiv.s       ft6, ft7, ft6
                  nop
                  fdiv.s       fa6, ft6, ft4, rmm
                  srai         t5, s10, 2
                  sra          s9, s3, s9
                  slt          s9, a1, t1
                  slt          t5, s9, s4
                  srl          s5, a3, s2
                  fmin.s       ft11, ft4, fa4
                  fsgnj.s      fa2, ft3, ft9
                  fadd.s       ft4, fs10, ft9, rup
                  srai         s0, tp, 0
                  mulh         a2, tp, t2
                  fle.s        s0, fs5, ft1
                  xor          t0, t4, s7
                  auipc        s1, 893170
                  fsub.s       ft5, fs5, fs7
                  addi         s1, t1, 234
                  fsgnj.s      ft7, ft9, fa6
                  fmv.w.x      fs6, zero
                  lui          t4, 134538
                  slli         s2, a1, 0
                  rem          s0, a6, s10
                  fcvt.w.s     s9, ft10
                  srli         a7, s7, 20
                  andi         s0, s5, -829
                  fcvt.wu.s    a7, fa2, rup
                  la x14, test_done
                  jalr x0, x14, 0
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
                  addi x31, x31, -4
                  sw  x10, (x31)
                  add x10, x31, zero
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
                  add x31, x10, zero
                  csrr x6, 0x300 # MSTATUS
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 31
                  bne x6, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x6, 0x341 # MEPC
                  csrr x6, 0x342 # MCAUSE
                  li x24, 0x3 # BREAKPOINT
                  beq x6, x24, ebreak_handler
                  li x24, 0x8 # ECALL_UMODE
                  beq x6, x24, ecall_handler
                  li x24, 0x9 # ECALL_SMODE
                  beq x6, x24, ecall_handler
                  li x24, 0xb # ECALL_MMODE
                  beq x6, x24, ecall_handler
                  li x24, 0x1
                  beq x6, x24, instr_fault_handler
                  li x24, 0x5
                  beq x6, x24, load_fault_handler
                  li x24, 0x7
                  beq x6, x24, store_fault_handler
                  li x24, 0xc
                  beq x6, x24, pt_fault_handler
                  li x24, 0xd
                  beq x6, x24, pt_fault_handler
                  li x24, 0xf
                  beq x6, x24, pt_fault_handler
                  li x24, 0x2 # ILLEGAL_INSTRUCTION
                  beq x6, x24, illegal_instr_handler
                  csrr x24, 0x343 # MTVAL
                  1: la x14, test_done
                  jalr x1, x14, 0

ecall_handler:    
                  la x6, _start
                  sw x0, 0(x6)
                  sw x1, 4(x6)
                  sw x2, 8(x6)
                  sw x3, 12(x6)
                  sw x4, 16(x6)
                  sw x5, 20(x6)
                  sw x6, 24(x6)
                  sw x7, 28(x6)
                  sw x8, 32(x6)
                  sw x9, 36(x6)
                  sw x10, 40(x6)
                  sw x11, 44(x6)
                  sw x12, 48(x6)
                  sw x13, 52(x6)
                  sw x14, 56(x6)
                  sw x15, 60(x6)
                  sw x16, 64(x6)
                  sw x17, 68(x6)
                  sw x18, 72(x6)
                  sw x19, 76(x6)
                  sw x20, 80(x6)
                  sw x21, 84(x6)
                  sw x22, 88(x6)
                  sw x23, 92(x6)
                  sw x24, 96(x6)
                  sw x25, 100(x6)
                  sw x26, 104(x6)
                  sw x27, 108(x6)
                  sw x28, 112(x6)
                  sw x29, 116(x6)
                  sw x30, 120(x6)
                  sw x31, 124(x6)
                  la x14, write_tohost
                  jalr x0, x14, 0

instr_fault_handler:
                  add x10, x31, zero
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
                  add x31, x10, zero
                  lw  x10, (x31)
                  addi x31, x31, 4
                  mret

load_fault_handler:
                  add x10, x31, zero
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
                  add x31, x10, zero
                  lw  x10, (x31)
                  addi x31, x31, 4
                  mret

store_fault_handler:
                  add x10, x31, zero
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
                  add x31, x10, zero
                  lw  x10, (x31)
                  addi x31, x31, 4
                  mret

ebreak_handler:   
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x10, x31, zero
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
                  add x31, x10, zero
                  lw  x10, (x31)
                  addi x31, x31, 4
                  mret

illegal_instr_handler:
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x10, x31, zero
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
                  add x31, x10, zero
                  lw  x10, (x31)
                  addi x31, x31, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x6, 0x300 # MSTATUS;
                  csrr  x6, 0x304 # MIE;
                  csrr  x6, 0x344 # MIP;
                  csrrc x6, 0x344, x6 # MIP;
                  add x10, x31, zero
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
                  add x31, x10, zero
                  lw  x10, (x31)
                  addi x31, x31, 4
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
