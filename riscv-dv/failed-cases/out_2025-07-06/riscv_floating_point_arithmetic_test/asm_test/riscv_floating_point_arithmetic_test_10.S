.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x10, h0_start
jalr x0, x10, 0
h0_start:
                  li x22, 0x40001120
                  csrw 0x301, x22
kernel_sp:        
                  la x16, kernel_stack_end

trap_vec_init:    
                  la x22, mtvec_handler
                  ori x22, x22, 1
                  csrw 0x305, x22 # MTVEC

mepc_setup:       
                  la x22, init
                  csrw 0x341, x22

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x22, 0x3800
                  csrw 0x300, x22 # MSTATUS
                  li x22, 0x0
                  csrw 0x304, x22 # MIE
                  mret
init:             
                  li x22, 2139095041
                  fmv.w.x f0, x22
                  li x22, 1001503786
                  fmv.w.x f1, x22
                  li x22, 4286578688
                  fmv.w.x f2, x22
                  li x22, 2154842395
                  fmv.w.x f3, x22
                  li x22, 7606749
                  fmv.w.x f4, x22
                  li x22, 2139095041
                  fmv.w.x f5, x22
                  li x22, 4286578688
                  fmv.w.x f6, x22
                  li x22, 4286578687
                  fmv.w.x f7, x22
                  li x22, 2147696906
                  fmv.w.x f8, x22
                  li x22, 2139095040
                  fmv.w.x f9, x22
                  li x22, 0
                  fmv.w.x f10, x22
                  li x22, 7190777
                  fmv.w.x f11, x22
                  li x22, 0
                  fmv.w.x f12, x22
                  li x22, 2147483648
                  fmv.w.x f13, x22
                  li x22, 2147483648
                  fmv.w.x f14, x22
                  li x22, 4286578688
                  fmv.w.x f15, x22
                  li x22, 2143289344
                  fmv.w.x f16, x22
                  li x22, 3230323845
                  fmv.w.x f17, x22
                  li x22, 2147483648
                  fmv.w.x f18, x22
                  li x22, 2143289344
                  fmv.w.x f19, x22
                  li x22, 2139095041
                  fmv.w.x f20, x22
                  li x22, 4286578687
                  fmv.w.x f21, x22
                  li x22, 3332136
                  fmv.w.x f22, x22
                  li x22, 2147483648
                  fmv.w.x f23, x22
                  li x22, 4286578688
                  fmv.w.x f24, x22
                  li x22, 4286578687
                  fmv.w.x f25, x22
                  li x22, 2677517407
                  fmv.w.x f26, x22
                  li x22, 0
                  fmv.w.x f27, x22
                  li x22, 2139095040
                  fmv.w.x f28, x22
                  li x22, 4000149612
                  fmv.w.x f29, x22
                  li x22, 2143289344
                  fmv.w.x f30, x22
                  li x22, 2139095039
                  fmv.w.x f31, x22
                  fsrmi 4
                  li x0, 0xdbcc7daa
                  li x1, 0x80000000
                  li x2, 0x0
                  li x3, 0x80000000
                  li x4, 0x80000000
                  li x5, 0x580f63dc
                  li x6, 0xf59e89f2
                  li x7, 0x0
                  li x8, 0x0
                  li x9, 0x4a768f50
                  li x10, 0x0
                  li x11, 0x23805733
                  li x12, 0x256e668
                  li x13, 0x0
                  li x14, 0xf4efb340
                  li x15, 0x0
                  li x18, 0x80000000
                  li x19, 0xa
                  li x20, 0xe88c95b3
                  li x21, 0x0
                  li x22, 0x0
                  li x23, 0x80000000
                  li x24, 0x3494510b
                  li x25, 0x80000000
                  li x26, 0x0
                  li x27, 0xd
                  li x28, 0xe
                  li x29, 0x80000000
                  li x30, 0x88a4ae79
                  li x31, 0xf34bc1b2
                  la x17, user_stack_end
main:             fcvt.wu.s    zero, ft6
                  mulhu        s7, s4, s8
                  sll          zero, t5, a0
                  flt.s        t1, fa0, fa0
                  rem          s0, s5, a1
                  nop
                  div          s7, ra, s4
                  fcvt.s.w     ft5, s0, rne
                  fmv.w.x      fa5, s1
                  fcvt.wu.s    t2, fs7, rdn
                  fmin.s       fs9, ft0, ft7
                  slt          s7, s2, a4
                  fcvt.s.w     fa3, t4, rup
                  slti         t6, s9, 756
                  srai         s3, s2, 27
                  fle.s        gp, fa4, ft10
                  srl          t6, t3, t4
                  slti         s1, a5, -2002
                  fmul.s       fa2, fs3, ft10, rdn
                  fcvt.wu.s    s11, ft0
                  sltu         t6, sp, s2
                  fmv.x.w      ra, fs10
                  fmin.s       fs0, ft3, ft10
                  fcvt.wu.s    gp, fs2
                  ori          t0, t4, -1193
                  fsqrt.s      ft10, fa4, rmm
                  sltiu        t0, zero, 16
                  feq.s        t5, fa6, ft5
                  addi         s4, t3, 22
                  fsgnjn.s     fa3, ft11, ft6
                  fdiv.s       ft7, fa6, fs11, rne
                  fsgnjx.s     fs8, fs8, fs0
                  divu         s5, t4, a6
                  mulh         s10, a7, s6
                  xori         t6, s6, 1590
                  sll          a3, t0, t6
                  auipc        a3, 967361
                  auipc        s4, 65442
                  and          t2, t3, t1
                  mulhsu       s2, a0, t5
                  ori          s11, t4, 422
                  fmv.w.x      fs0, a1
                  feq.s        s7, ft2, ft10
                  sltiu        t1, a5, -1499
                  fcvt.w.s     a4, fs9, rup
                  fsqrt.s      fs10, fs6, rdn
                  add          s3, t1, s11
                  fmul.s       fs3, ft6, ft9, rne
                  xori         a4, t0, -1637
                  fmin.s       fa1, ft10, fs9
                  sll          a3, s4, a6
                  fadd.s       fa0, fa5, fs10
                  or           s8, s10, s11
                  sltiu        t4, s0, 727
                  fsub.s       fa0, fs6, fs9
                  add          a5, s2, s1
                  remu         t3, t1, s2
                  fcvt.s.wu    fa2, a1, rne
                  sll          s0, t6, tp
                  fcvt.wu.s    s0, ft11, rdn
                  sra          s5, s0, a6
                  fcvt.wu.s    s3, fa3
                  sltu         zero, gp, s1
                  fle.s        t2, fs1, ft0
                  div          t1, s6, a7
                  mulhsu       s3, tp, gp
                  lui          s4, 763896
                  xor          t5, s9, t2
                  fdiv.s       fs7, fs10, fa0, rup
                  sra          a1, a6, s0
                  mulhu        a2, a6, t1
                  rem          s0, a4, a7
                  fcvt.wu.s    s2, ft1, rmm
                  sltu         a3, ra, zero
                  mulhsu       a4, t6, t3
                  andi         s4, zero, 395
                  xori         s6, t6, -1416
                  mulhsu       gp, t3, t1
                  fsgnjx.s     ft6, ft0, fa3
                  fsgnj.s      ft3, ft2, fs10
                  fcvt.w.s     a1, fs3, rne
                  fsub.s       fa4, fs3, ft8
                  auipc        t3, 952104
                  feq.s        ra, fs7, ft9
                  fcvt.s.wu    fs5, a4, rup
                  fmin.s       fa6, fs6, fs2
                  fmin.s       fa5, fa3, ft6
                  divu         s8, t6, t1
                  flt.s        a4, ft5, fa0
                  fmin.s       fs6, fs9, ft5
                  add          sp, t2, t1
                  fle.s        s11, fs4, fs9
                  fmin.s       ft8, fa5, fs11
                  fsgnj.s      ft4, fs3, ft7
                  slti         ra, a6, -1596
                  sll          s11, s5, gp
                  addi         ra, a7, 1145
                  mulhu        a2, a7, t3
                  sra          s5, s11, ra
                  srai         gp, s0, 3
                  fsgnj.s      ft9, ft1, fs3
                  sll          s9, a7, t1
                  fmv.x.w      tp, fa1
                  or           s7, s6, gp
                  rem          t3, s5, a6
                  xor          zero, s7, s3
                  ori          a2, t2, 1106
                  or           s9, s7, a3
                  fcvt.w.s     a1, ft3, rup
                  sll          s6, s4, ra
                  and          sp, a6, a0
                  fsub.s       fs3, ft2, ft0
                  fcvt.w.s     a4, fs8
                  srai         tp, s2, 13
                  fcvt.s.w     ft4, s7, rmm
                  remu         gp, a1, a7
                  srai         a2, gp, 20
                  add          t1, a5, t6
                  and          t1, t4, s9
                  addi         s0, s2, 1067
                  mulh         gp, sp, a4
                  mulhsu       a2, s0, a6
                  slli         t0, sp, 27
                  or           s2, t1, t6
                  add          t1, t4, ra
                  ori          t3, a0, 1784
                  flt.s        s3, fa5, fa4
                  fclass.s     s2, fa0
                  srl          a5, t2, gp
                  fcvt.s.w     fa1, t1, rmm
                  andi         zero, zero, 198
                  srli         t4, a7, 14
                  remu         s0, s8, ra
                  fsgnjn.s     ft9, ft9, ft2
                  fcvt.wu.s    a4, ft11, rdn
                  nop
                  lui          s9, 810316
                  sltiu        gp, t1, 1263
                  mulh         t6, t6, a6
                  fle.s        tp, fs3, ft5
                  fcvt.wu.s    t6, fa0
                  fcvt.s.w     fs10, t2
                  slti         zero, s6, -164
                  fcvt.s.w     fa1, s1, rmm
                  fmul.s       fs9, fa2, ft4, rtz
                  fmv.w.x      fs0, s6
                  sub          tp, a0, t5
                  xor          s6, zero, t4
                  xori         ra, a1, 1841
                  xori         a1, s9, -1148
                  srl          a1, s4, a2
                  slti         s4, s0, 1602
                  fsgnjx.s     fs7, ft3, fs11
                  fclass.s     a2, ft3
                  srai         s2, t4, 29
                  fadd.s       fs11, fs0, fs9
                  slt          t2, a4, t1
                  or           s2, s7, sp
                  fdiv.s       ft7, ft8, ft7
                  fcvt.wu.s    t6, fs3
                  sltu         s9, a5, s7
                  srai         s5, sp, 31
                  fcvt.s.w     fs6, s10
                  sll          s4, a4, a4
                  mulhsu       s10, t6, s2
                  mulhu        s10, s8, sp
                  mulhu        sp, t6, tp
                  div          a5, a7, s5
                  and          s1, gp, tp
                  fmin.s       fs8, fs2, fs10
                  srli         s4, t5, 27
                  fcvt.w.s     s3, fs9, rtz
                  fsgnj.s      ft8, ft11, fa4
                  fdiv.s       ft6, fs1, fa7
                  fsgnjx.s     ft7, ft8, fa4
                  divu         t5, s2, s4
                  sltiu        s1, s0, -1158
                  fle.s        s8, ft5, fa3
                  fmv.w.x      ft11, ra
                  fmul.s       fa0, fs9, fa7, rne
                  sltu         s9, a7, a6
                  fmin.s       fs2, ft8, ft8
                  or           s6, s8, t1
                  fsgnj.s      ft9, fs3, ft9
                  flt.s        a2, fs11, fs7
                  fclass.s     gp, fs9
                  fadd.s       fs10, ft7, ft1
                  slt          s0, t5, s2
                  auipc        t5, 272193
                  divu         s9, s6, t4
                  mulh         t2, s2, t1
                  slti         t3, a2, -1988
                  mulhu        t2, s6, a5
                  sltu         s10, t1, a6
                  fdiv.s       ft8, ft5, ft0
                  fmul.s       fs2, ft1, fs10
                  auipc        s9, 441852
                  xori         s11, s0, -1362
                  slt          a1, s0, s3
                  fmax.s       ft4, ft6, ft2
                  mulhu        zero, a4, s7
                  rem          t4, s4, a4
                  fcvt.s.wu    fs5, t5
                  fmv.x.w      s10, ft8
                  fmv.x.w      s2, fa2
                  sll          t1, t2, a6
                  lui          t0, 902440
                  div          a5, a4, s3
                  ori          a5, s7, -1751
                  rem          s10, t4, t0
                  mulhu        s6, zero, a2
                  and          s6, t4, t5
                  sltiu        gp, s2, 760
                  fsgnjx.s     ft9, fs3, fs6
                  fle.s        s2, ft4, ft2
                  fmv.w.x      fs6, t4
                  flt.s        s4, fa3, ft11
                  auipc        gp, 151182
                  fsub.s       ft6, ft5, fs3, rne
                  fsqrt.s      fa5, fs1
                  fcvt.s.w     fa1, s0
                  fmv.w.x      ft3, s5
                  nop
                  fclass.s     t1, ft8
                  xori         ra, s8, 138
                  lui          zero, 694491
                  feq.s        t2, fs4, fs9
                  ori          s7, a0, -1851
                  fsub.s       fs3, fs2, ft7, rdn
                  fcvt.s.wu    fa3, s9, rtz
                  fsgnjx.s     ft10, ft10, fs3
                  and          a4, a2, sp
                  fmv.w.x      ft7, sp
                  ori          s0, a6, 314
                  fmin.s       ft2, fs8, ft11
                  remu         a4, a3, a4
                  lui          s1, 551080
                  xori         s10, a1, 167
                  fclass.s     gp, fs11
                  fsub.s       fs1, fs9, fs7, rtz
                  fcvt.wu.s    t2, fs3, rne
                  ori          s10, tp, -94
                  fmv.w.x      fa4, sp
                  ori          zero, t4, -1237
                  rem          t2, s6, a3
                  slt          t3, s2, a2
                  fcvt.s.w     ft7, s0
                  sltu         s2, s5, ra
                  fcvt.s.wu    fs4, tp, rtz
                  flt.s        s1, ft10, fs8
                  sra          a3, a4, t4
                  sltu         t0, s9, a1
                  andi         a1, t4, -1795
                  sub          ra, t6, s4
                  sra          s5, t6, s0
                  rem          a3, a5, t1
                  sll          s4, s9, t5
                  sltu         s9, t5, s10
                  fsqrt.s      ft10, fs8, rmm
                  xor          s1, s2, s5
                  feq.s        a4, fa3, fa4
                  andi         a4, t4, 1058
                  sltu         tp, a3, s8
                  fsgnjx.s     fs2, ft3, ft9
                  and          ra, gp, s5
                  feq.s        a1, ft8, fa2
                  srli         t1, t1, 16
                  fmv.x.w      s2, ft5
                  srl          s11, s1, tp
                  slli         s2, a5, 22
                  ori          s11, s10, 414
                  nop
                  xori         s11, ra, 1017
                  ori          s7, a4, -1021
                  ori          t1, s7, 473
                  fmin.s       fa4, ft11, fs2
                  div          s6, s8, a1
                  ori          s5, t3, 873
                  fsub.s       ft2, fa5, ft6
                  rem          a2, s8, t0
                  sub          s6, t1, t4
                  fdiv.s       ft1, ft9, ft8
                  fdiv.s       fa0, fs0, fs5
                  fsgnjn.s     fa4, fs9, fs11
                  fmax.s       fa7, fs1, fs6
                  addi         t0, s4, 328
                  fsgnjn.s     fa1, ft0, fs11
                  or           t2, s10, ra
                  mulh         ra, a6, s11
                  mul          t5, t6, a1
                  fmin.s       fa0, fa0, fs2
                  div          gp, a2, ra
                  fclass.s     t1, fa3
                  srli         a3, a6, 8
                  divu         a3, s11, t6
                  nop
                  fsgnjx.s     ft3, fs4, ft9
                  fclass.s     tp, fa5
                  ori          ra, s4, 535
                  fsqrt.s      fs7, fs3
                  fmv.w.x      fs9, s6
                  srli         a1, s3, 10
                  xor          s11, s9, a7
                  add          t6, a1, t0
                  fmul.s       ft9, ft10, fs5
                  mul          t1, s10, s4
                  andi         ra, s3, -346
                  andi         tp, a3, -1583
                  sltu         a3, gp, s2
                  feq.s        a3, ft6, ft9
                  srl          ra, zero, a5
                  xori         s2, s5, -1972
                  fdiv.s       fa0, fs3, fs10
                  feq.s        s4, fs3, fs2
                  xor          s5, t2, a7
                  sll          s5, s10, gp
                  add          a4, s9, a4
                  nop
                  auipc        t0, 733522
                  fsgnjn.s     fa0, fs2, ft0
                  div          t1, s0, s3
                  remu         s11, a2, t3
                  fle.s        s5, fs2, fs11
                  remu         sp, s8, s5
                  sltu         s0, a6, t5
                  mulhu        a3, t2, t0
                  fcvt.wu.s    a4, ft10
                  fsgnj.s      fa3, fs1, fs4
                  mulhsu       t1, t5, s5
                  flt.s        s9, ft6, fs5
                  fdiv.s       fs8, ft8, ft8, rmm
                  fsgnj.s      fs3, fa6, ft5
                  sltiu        s0, s2, 487
                  rem          s8, a6, s8
                  slli         t1, t6, 10
                  andi         tp, s9, -500
                  addi         t6, s7, 282
                  sll          ra, sp, s9
                  mul          t0, sp, s5
                  and          s10, a5, s10
                  xor          s5, s9, zero
                  srai         s7, zero, 11
                  fsgnj.s      ft5, ft6, fs4
                  fmv.w.x      fs11, a5
                  add          tp, t2, a1
                  fdiv.s       fs0, fa1, fs9, rtz
                  mulhsu       a5, sp, s8
                  sub          t0, a7, s4
                  mulhsu       s5, a2, s4
                  fmin.s       fs8, fs5, fs4
                  fmul.s       ft11, ft1, fs5
                  mulh         s10, s3, t4
                  fmv.w.x      fa5, s11
                  lui          zero, 245021
                  fcvt.s.wu    fa3, s5
                  remu         a3, a3, a4
                  addi         t4, t6, -1735
                  fmin.s       fs11, fs7, fs3
                  mulhu        zero, a1, t6
                  srli         zero, t4, 13
                  mulhsu       s6, s0, a5
                  fcvt.s.w     ft6, t1
                  auipc        tp, 852442
                  fcvt.w.s     t3, ft7, rup
                  fmax.s       ft7, ft1, ft6
                  xor          a1, a0, s5
                  slt          sp, s3, s3
                  sub          t6, gp, s7
                  flt.s        s0, fs5, ft9
                  divu         t1, a6, a7
                  sub          s6, s2, gp
                  nop
                  ori          s1, a0, -432
                  slt          a1, a0, a0
                  sltu         a4, sp, s8
                  mul          gp, s8, t6
                  auipc        t1, 573768
                  auipc        t5, 312685
                  nop
                  fcvt.w.s     ra, ft1, rne
                  mulhsu       s9, s3, s9
                  remu         s3, a2, t4
                  mulh         a1, s6, s10
                  srl          t6, a7, t0
                  fmv.w.x      ft2, ra
                  sra          t1, s6, s8
                  fmax.s       ft5, fs10, ft6
                  fsgnjx.s     fa7, ft11, fs9
                  div          t1, t3, s7
                  sll          a5, t5, s11
                  srli         t6, t0, 20
                  fmin.s       fs11, ft11, ft7
                  slli         t3, s10, 21
                  rem          t5, s8, t4
                  fsgnjx.s     fs0, ft6, fa2
                  sra          s10, a7, sp
                  mulhsu       s4, s2, tp
                  sub          a5, t2, gp
                  andi         s2, t4, -1325
                  fsgnj.s      fs7, fa6, ft7
                  add          s9, tp, s11
                  remu         s2, t6, t2
                  slli         gp, a6, 24
                  add          a5, tp, a6
                  andi         a5, a3, -719
                  mulh         zero, a5, zero
                  andi         gp, s9, 263
                  sltu         gp, s9, s2
                  div          t4, t2, s0
                  auipc        a3, 397342
                  mulhsu       ra, s0, s0
                  fmax.s       ft3, ft9, fs2
                  slti         a4, t3, -1207
                  slti         s4, s0, 1020
                  fcvt.wu.s    t3, fs6
                  fadd.s       fa1, fs10, fa6
                  fsgnjx.s     ft10, fa3, fa2
                  ori          sp, tp, -1573
                  andi         a1, a3, 1882
                  fadd.s       fs0, fa0, fa1
                  div          t0, ra, t1
                  rem          s10, s0, a0
                  srai         s6, s2, 0
                  fsqrt.s      fa6, fa0
                  sltiu        a3, a7, -1092
                  fmin.s       fs2, fs8, fa1
                  fsub.s       fs5, ft7, fa7
                  slt          s2, s4, s3
                  fmv.x.w      a5, fa1
                  slt          ra, t4, t0
                  mul          s0, a6, a1
                  flt.s        t6, fs3, ft0
                  and          s6, a6, ra
                  nop
                  fmul.s       ft4, fa2, fa4, rmm
                  fsgnjx.s     fs3, ft11, ft6
                  fmv.w.x      fs7, s4
                  fcvt.s.w     fs7, t0
                  sltu         s6, s5, s6
                  fmv.w.x      fs8, a0
                  fsqrt.s      ft8, fs11
                  fsgnj.s      fa3, fa4, fa6
                  fmv.x.w      s11, fs9
                  fadd.s       fs11, fs5, fa1
                  fmin.s       fa2, fa3, fa3
                  remu         s9, s5, a2
                  mulhu        a4, s6, s11
                  fcvt.s.wu    fs11, s1
                  fsqrt.s      fs7, fs7
                  lui          t2, 746825
                  fdiv.s       fa5, fs5, fa2, rmm
                  xor          s8, t0, a0
                  fle.s        t3, fa3, ft3
                  slt          tp, s5, a5
                  fcvt.wu.s    gp, ft7
                  sra          ra, ra, s9
                  fmin.s       ft6, fa3, ft0
                  fmin.s       ft11, fa3, ft5
                  flt.s        t3, fs5, fs7
                  fsgnjx.s     fs6, fa6, ft9
                  fcvt.s.wu    fs6, a1
                  fadd.s       ft11, fs3, fa0, rdn
                  fcvt.s.wu    fa0, a3
                  ori          t3, gp, 1471
                  rem          s3, gp, a6
                  fle.s        t0, fa2, fs3
                  sltiu        s6, t2, 2035
                  auipc        s10, 358932
                  xor          s6, t6, a4
                  fle.s        zero, fs3, fs9
                  fsqrt.s      fs8, fa4
                  sra          t4, a4, s11
                  divu         s7, s6, s0
                  sub          s6, s2, a6
                  fclass.s     gp, ft11
                  xori         gp, t1, -1032
                  fsgnjn.s     fs8, fa3, ft5
                  and          s11, gp, t4
                  fle.s        gp, fs0, ft0
                  fmin.s       fs11, fs3, fs2
                  fsgnj.s      ft7, fa0, fa0
                  auipc        s11, 367399
                  feq.s        s11, fs7, fa1
                  rem          a4, a2, t4
                  rem          s11, s6, t1
                  fmax.s       fs6, fs6, ft10
                  fsub.s       fa2, fs10, ft1
                  remu         zero, tp, t5
                  fmv.x.w      s4, ft1
                  sub          tp, t0, sp
                  fmv.x.w      a4, ft3
                  nop
                  fdiv.s       fs0, fa7, fs10, rdn
                  fsgnj.s      fa0, fs3, ft9
                  fmin.s       ft3, fa1, fs11
                  feq.s        s4, fs4, ft7
                  fcvt.w.s     tp, fs0, rdn
                  mulh         a5, zero, s5
                  feq.s        ra, ft1, ft2
                  fsqrt.s      fa2, fs8, rmm
                  flt.s        a3, fs6, fs2
                  fsub.s       fs5, fa2, ft4
                  slli         s9, t2, 13
                  fle.s        s3, fs2, ft11
                  rem          s1, t0, ra
                  flt.s        t3, ft10, ft2
                  fsgnjn.s     fs1, fa4, fs8
                  fmax.s       fa7, ft0, fa4
                  mulhsu       s5, ra, s1
                  fcvt.wu.s    t4, ft3
                  slti         s8, tp, 1419
                  rem          s2, a4, s8
                  fsub.s       fa2, ft7, ft3
                  sltu         s8, t6, t3
                  sra          s1, a6, a5
                  ori          sp, gp, 11
                  srl          a1, t3, s6
                  div          a2, s1, a4
                  auipc        a3, 837942
                  fmv.x.w      gp, ft9
                  divu         a1, s0, a7
                  mul          a5, t1, t6
                  feq.s        zero, fa6, ft8
                  sltiu        s10, ra, -1724
                  fcvt.s.w     ft2, s5, rtz
                  mul          t1, t5, s6
                  slt          a3, s6, t5
                  slt          zero, s0, a0
                  slt          a3, s1, t6
                  sub          s7, s1, a6
                  fcvt.wu.s    s8, ft7, rup
                  fcvt.w.s     t4, ft8
                  add          t5, a2, t4
                  fsqrt.s      fs7, fa4
                  srl          s7, a1, a4
                  fmul.s       fs5, fa1, fa6
                  fmax.s       fs5, fs10, fa4
                  auipc        sp, 140095
                  sra          a4, tp, a2
                  mulhsu       sp, t5, s11
                  srai         s0, t4, 1
                  sub          s4, s5, s9
                  fcvt.w.s     tp, fs4
                  feq.s        s6, ft11, ft2
                  slli         s1, ra, 9
                  fmv.x.w      tp, ft11
                  srai         tp, t3, 27
                  sltiu        s8, ra, -823
                  div          s9, a4, t2
                  sra          t2, s11, a6
                  nop
                  mul          gp, s3, a0
                  fmv.w.x      fa1, a2
                  fsgnjn.s     ft9, fs4, fs7
                  div          s3, t1, s0
                  fsgnj.s      ft2, fs3, ft5
                  fcvt.wu.s    sp, ft2, rup
                  fcvt.wu.s    s9, fa2, rtz
                  sltiu        s7, s7, 1757
                  or           s11, a4, a7
                  fmv.w.x      fa5, s2
                  flt.s        s4, ft11, fs2
                  or           s9, a3, s7
                  srli         t4, a3, 6
                  sltu         s8, a2, a1
                  fadd.s       ft8, fs0, fs0
                  fle.s        t5, ft2, ft0
                  fmax.s       fs3, fs4, fs4
                  and          s1, t6, a4
                  nop
                  fdiv.s       fs6, ft5, fs0, rne
                  slti         s3, s11, -868
                  fclass.s     gp, ft11
                  fmul.s       fs0, fs4, fa6, rtz
                  mul          s2, tp, s9
                  slti         tp, gp, -278
                  srl          a2, a5, s10
                  fcvt.s.wu    ft11, a1
                  flt.s        s9, fs1, fa2
                  fmv.w.x      fs4, a1
                  fmin.s       fa1, ft7, ft9
                  flt.s        t3, fa4, ft4
                  feq.s        t2, ft3, ft8
                  fle.s        t6, fs7, ft6
                  nop
                  add          t1, zero, t4
                  sub          t1, a3, s10
                  xori         s2, zero, 205
                  addi         t4, s0, 1495
                  fdiv.s       fs5, ft1, fs8
                  flt.s        t1, ft2, ft0
                  fcvt.w.s     t6, fa5
                  srai         s11, t5, 4
                  sll          t5, t3, gp
                  fdiv.s       fa0, fs2, ft5
                  srli         zero, tp, 18
                  nop
                  fsgnjn.s     fs11, ft6, fs4
                  fmv.x.w      s0, fa1
                  fcvt.s.w     fs6, gp, rtz
                  fmv.w.x      fs11, s3
                  fdiv.s       ft11, ft8, fs7, rup
                  fmv.w.x      ft1, t1
                  remu         s11, s10, ra
                  fclass.s     a3, ft6
                  fsub.s       fa2, ft3, fs6, rtz
                  auipc        s0, 324437
                  feq.s        s8, fs9, fa3
                  feq.s        s11, fs9, fa6
                  andi         s6, t5, 680
                  mulh         t3, ra, s6
                  fmul.s       ft2, fs6, ft1, rmm
                  fmv.w.x      fs1, a1
                  fsgnjx.s     fa5, fa2, fs8
                  slt          s8, t2, s2
                  fclass.s     s9, fs4
                  sltiu        s2, a4, 1342
                  fdiv.s       ft10, fa0, ft4
                  mulh         ra, a7, a7
                  srai         a3, t3, 13
                  fmv.x.w      t4, fa0
                  fcvt.s.w     fs10, t5
                  ori          s7, s4, 865
                  srai         a1, a0, 3
                  fcvt.s.wu    ft11, sp
                  slli         a2, a4, 24
                  slli         gp, s0, 24
                  lui          sp, 172966
                  or           t6, t6, a7
                  mul          t3, sp, a6
                  rem          t3, s2, t0
                  ori          tp, s9, 892
                  fsub.s       fs11, ft7, fa3
                  fmul.s       fa3, fs9, fs7, rne
                  mulh         s2, zero, a0
                  fsgnj.s      ft9, fs5, fs9
                  fsub.s       fs5, fa3, fs0
                  fcvt.w.s     gp, ft7, rne
                  div          sp, s6, s1
                  fclass.s     s9, fa0
                  fsqrt.s      fs5, fa2
                  auipc        s0, 95556
                  auipc        t3, 358271
                  div          s5, a5, ra
                  sra          s2, s4, t1
                  divu         s1, t6, s0
                  fdiv.s       fs0, fa6, fs10
                  fsub.s       fa1, fs8, fa2
                  addi         s11, s8, -1632
                  divu         s2, t5, s0
                  fsqrt.s      ft9, ft3, rtz
                  mulhsu       s11, s3, s2
                  fdiv.s       ft7, fs11, ft1
                  mulh         s2, s10, s3
                  sll          s7, sp, s2
                  sub          t5, tp, a1
                  xor          a2, a3, t5
                  feq.s        t5, ft1, fs11
                  fmax.s       fa5, fa4, fs1
                  auipc        t2, 384738
                  addi         s6, a3, -1392
                  mul          gp, s4, t1
                  srai         t5, ra, 19
                  fsgnjx.s     ft0, fa2, ft2
                  ori          a2, zero, -1957
                  div          s7, ra, a5
                  remu         t3, a7, s4
                  andi         s5, s11, 1376
                  div          t1, sp, a1
                  and          gp, s0, t6
                  srli         a5, s4, 18
                  mulhu        gp, a7, a6
                  fmax.s       fa4, ft5, fs10
                  fcvt.wu.s    s10, ft10, rmm
                  srai         s1, s10, 22
                  nop
                  sra          s6, a5, tp
                  sub          a3, t1, a3
                  srai         zero, zero, 2
                  fcvt.s.wu    ft9, a3, rdn
                  slli         s1, a2, 0
                  add          gp, a7, s11
                  divu         s0, gp, sp
                  srai         a4, t4, 0
                  fcvt.s.wu    fs2, s2, rtz
                  fadd.s       fs10, ft10, ft6, rmm
                  remu         a5, s1, t2
                  fle.s        s5, fa6, fs5
                  fmin.s       fa1, ft9, fs9
                  mulhsu       gp, a7, sp
                  nop
                  fmv.x.w      ra, fa0
                  sltiu        s10, t5, 967
                  nop
                  addi         s0, sp, 1378
                  sra          a1, a4, sp
                  nop
                  andi         t5, ra, 1608
                  sub          t0, a7, a6
                  slt          zero, s11, s10
                  fsgnjn.s     ft3, fa5, fa6
                  flt.s        s2, fs4, ft0
                  sra          s9, t2, s10
                  feq.s        s9, ft6, fs4
                  srli         s10, a6, 5
                  fmv.x.w      s3, fs0
                  srai         t3, t5, 0
                  fmv.w.x      ft4, s10
                  slli         t4, t5, 29
                  div          s2, sp, a4
                  mulhu        sp, s9, s10
                  fclass.s     s10, ft10
                  sra          zero, a5, s11
                  lui          s0, 36599
                  fle.s        t0, fs10, ft8
                  lui          s9, 625813
                  and          t3, s3, s3
                  fdiv.s       ft1, fa5, fa2
                  slt          a5, a4, a7
                  div          a4, s11, a3
                  mul          s7, t4, s0
                  mulhsu       s1, s3, sp
                  sub          t1, s10, t3
                  fcvt.s.w     fs3, s9, rdn
                  fmv.x.w      s7, ft5
                  fsub.s       ft2, fs5, fs7
                  sll          a2, s3, s5
                  rem          a1, s7, a4
                  fmul.s       fa4, ft8, fs3
                  feq.s        t1, fa0, fs7
                  fcvt.w.s     a2, ft10
                  sub          gp, t0, s7
                  sltu         s7, t0, s2
                  fsgnjn.s     fs2, fa7, fs2
                  fcvt.s.wu    fa7, t3, rmm
                  sltiu        s8, a5, -1164
                  andi         t2, zero, 600
                  fsub.s       fs9, fs4, fs4
                  mulh         tp, t3, gp
                  fcvt.s.w     fa5, a2
                  slli         t5, s9, 24
                  div          s3, ra, zero
                  flt.s        tp, fa3, ft9
                  fcvt.w.s     a1, fs10
                  xor          t3, s7, s8
                  xor          t1, t6, s2
                  sra          s0, a5, a3
                  slti         t4, t6, 1592
                  mulhu        s8, a2, t1
                  divu         gp, s10, t1
                  remu         a1, s7, t1
                  mulhu        gp, s3, tp
                  remu         s11, a5, s7
                  fsgnjx.s     ft1, fa1, fs11
                  flt.s        a4, fa6, fs7
                  fsgnj.s      ft9, fa0, fs0
                  fcvt.wu.s    tp, ft1
                  auipc        s10, 35669
                  srli         sp, t5, 18
                  sub          zero, a1, s8
                  sub          a5, tp, s9
                  mul          a5, a1, s10
                  nop
                  mulhu        s0, a0, a1
                  fsgnjx.s     fa5, fa2, fs0
                  fcvt.wu.s    s2, ft8
                  mulh         s6, tp, t4
                  or           tp, t0, a3
                  fmul.s       ft5, ft6, fs11, rdn
                  auipc        s9, 112028
                  sltiu        t2, s3, -1303
                  sll          t4, a5, zero
                  xori         ra, a4, -1131
                  mul          s6, t4, zero
                  fmul.s       fs11, fs1, ft7, rne
                  xor          s5, a2, a4
                  slt          t5, tp, s11
                  fsgnjx.s     fs8, fa7, fa4
                  mulhsu       ra, s1, a5
                  fsub.s       fa4, fa4, fs9
                  fmax.s       fs7, ft6, fs6
                  mulhsu       t3, a4, tp
                  fmul.s       ft7, fs9, ft6, rup
                  srai         s6, a6, 21
                  mulhu        t2, t0, t5
                  fsub.s       fs1, fs10, fs5
                  ori          t0, t2, 650
                  sll          t0, a1, sp
                  fle.s        gp, ft4, ft0
                  divu         s9, s0, sp
                  fcvt.s.w     fs1, zero, rdn
                  feq.s        s5, fs0, ft9
                  auipc        ra, 109133
                  xor          tp, s9, s9
                  xori         a4, s4, 2032
                  rem          a4, gp, a3
                  fsqrt.s      fs8, fs6
                  xor          t5, t1, s9
                  rem          s6, a0, a5
                  flt.s        tp, fs9, fa6
                  fsub.s       fs4, fs9, ft6, rtz
                  fmul.s       ft1, fs6, fs9
                  addi         a4, t6, -133
                  fmul.s       fs10, ft10, fa0
                  remu         s5, a5, t5
                  xor          s5, t2, s5
                  mulhsu       a5, a3, a0
                  mulhu        s7, s9, s7
                  fsgnjx.s     fs8, ft3, fa4
                  ori          gp, a7, -89
                  srai         s3, t4, 20
                  xori         t3, sp, 369
                  mulhsu       s4, t0, s2
                  flt.s        sp, fs10, ft6
                  fmul.s       fs0, fs10, ft1
                  mulhu        s10, s7, gp
                  and          s7, s0, a0
                  and          s5, a1, a7
                  fsgnjn.s     fa4, fa6, ft8
                  mul          s10, s3, t2
                  srai         a5, zero, 5
                  mulhsu       s2, s10, s1
                  flt.s        s6, fs0, ft10
                  fsgnjx.s     ft4, fs1, fa2
                  fmax.s       fs1, fs2, fs0
                  andi         s2, a7, 441
                  fadd.s       ft8, fa1, fa6, rmm
                  andi         a2, t4, 801
                  feq.s        tp, ft1, ft5
                  feq.s        s1, ft10, ft8
                  sub          t4, s3, gp
                  fmul.s       fa6, ft5, fa3, rmm
                  slt          tp, gp, a0
                  divu         a4, a0, s0
                  fsqrt.s      fs9, ft7
                  fsqrt.s      ft6, ft3, rne
                  fmv.w.x      fs7, s1
                  srli         a3, t3, 12
                  sll          s2, sp, a3
                  sub          s10, s1, a4
                  slti         s5, ra, 980
                  slli         t3, t1, 23
                  nop
                  fcvt.s.wu    ft0, s1, rmm
                  div          a4, s6, s6
                  slli         a2, a4, 30
                  fsgnjx.s     fs1, ft0, ft0
                  fmv.x.w      gp, fs1
                  fmax.s       ft4, fa2, ft10
                  andi         t0, s5, 143
                  nop
                  sll          zero, t0, a3
                  div          tp, zero, a5
                  and          s10, s3, t0
                  or           s5, s0, s7
                  fmv.w.x      ft3, s0
                  mulhsu       a3, a7, zero
                  fmv.w.x      fa1, t0
                  fcvt.w.s     s1, ft1
                  fle.s        s5, fs5, fs9
                  rem          s11, s2, s1
                  srli         t2, t2, 16
                  mul          s4, zero, a6
                  xor          zero, t5, zero
                  fmv.w.x      fa7, zero
                  fsgnjx.s     fa0, ft8, fs2
                  fmv.w.x      ft7, t4
                  mulhsu       a4, ra, zero
                  sll          s1, gp, t3
                  fmv.w.x      fs4, a3
                  fsgnj.s      fs8, fa5, ft8
                  mul          a1, a4, ra
                  fmv.x.w      sp, ft10
                  fmul.s       fs11, ft0, ft8, rtz
                  andi         t5, s2, 1282
                  fcvt.wu.s    t1, fs1, rmm
                  sltu         s11, t5, t4
                  sub          s8, a5, zero
                  slti         a4, s5, -495
                  rem          s5, a5, gp
                  fsgnj.s      fs3, ft6, ft8
                  fadd.s       ft9, ft6, ft0, rtz
                  remu         tp, gp, zero
                  fmul.s       ft6, fa0, fa1
                  fle.s        a3, fs11, ft6
                  nop
                  slli         s6, s1, 29
                  fsqrt.s      fs9, fa1
                  sltiu        s11, s5, -1233
                  fdiv.s       ft6, fs3, fs7
                  fsgnjx.s     fa4, fa7, ft4
                  or           t3, t3, s10
                  auipc        t3, 226207
                  divu         a3, s1, t0
                  sltiu        s10, s3, 1568
                  sltiu        s3, s2, 937
                  fsgnjn.s     ft5, fa5, ft3
                  fcvt.s.wu    fa4, s6, rdn
                  sltiu        tp, s8, -533
                  srai         t2, t3, 17
                  fsgnj.s      fa5, fs3, ft11
                  andi         a1, a5, -1087
                  xor          a5, a6, t0
                  fcvt.s.w     ft4, a6, rdn
                  fcvt.wu.s    a1, fs2, rtz
                  sub          t3, a2, t5
                  srl          s9, a4, s8
                  srli         s0, t2, 4
                  flt.s        s8, ft11, ft6
                  fcvt.s.w     ft3, s11
                  sub          gp, s11, s11
                  srl          sp, s11, gp
                  divu         s3, t2, s1
                  fmv.w.x      fs6, s5
                  div          tp, a6, s9
                  feq.s        s9, ft9, fa0
                  div          zero, zero, t4
                  xori         t5, s0, -1689
                  fcvt.s.wu    ft5, t5, rtz
                  or           ra, t3, t5
                  xori         t3, s11, -1983
                  xori         t2, t4, -329
                  fcvt.wu.s    a2, fs3
                  mulh         s2, a2, ra
                  sll          a4, a4, zero
                  mulh         a2, tp, zero
                  slti         s1, t3, 1052
                  divu         t5, s2, t3
                  ori          t2, t3, 1883
                  sll          s3, t1, t2
                  flt.s        s1, fs4, fs9
                  fmax.s       ft9, fa2, fa2
                  fmin.s       fs2, fs7, fs4
                  fsgnjx.s     fa2, fs1, fa5
                  fcvt.s.w     fs6, ra
                  mul          gp, a2, s9
                  sltu         s11, a5, t4
                  fsgnj.s      fs10, ft5, fs8
                  add          t2, t6, a6
                  auipc        a1, 153841
                  fcvt.w.s     sp, ft7
                  fsub.s       fa1, ft4, ft3, rmm
                  fmul.s       ft11, fs2, fa7, rmm
                  fle.s        tp, fs6, fs6
                  xori         zero, t3, 1976
                  slti         t3, t2, 1304
                  lui          sp, 650367
                  add          t5, s1, a5
                  fmax.s       ft9, fs0, fa6
                  fsub.s       fs2, fa1, fs9
                  add          ra, t4, a0
                  srl          a2, tp, a0
                  fsgnjn.s     ft9, ft8, ft1
                  fsub.s       fa3, fs8, fs5, rdn
                  fsqrt.s      ft6, fs5
                  fsgnj.s      ft8, fa1, fa6
                  or           a1, t3, a6
                  addi         s7, t2, -1647
                  sltiu        a5, t3, -342
                  fcvt.w.s     sp, fa5
                  fsgnjn.s     ft7, fs10, ft0
                  mul          s2, t6, a3
                  fle.s        s11, ft8, fa1
                  slli         a2, s2, 18
                  fadd.s       ft0, fs2, ft3
                  srl          t2, s10, t0
                  mulh         s3, t4, s3
                  slt          t3, ra, s10
                  fmin.s       ft1, fa0, ft1
                  srl          tp, a4, s9
                  fmax.s       fs4, ft0, ft7
                  fdiv.s       fs8, fs4, ft5
                  or           s2, s9, s0
                  sra          t5, s10, zero
                  flt.s        t4, fs1, ft3
                  mulhsu       t5, t5, ra
                  add          s3, t2, s6
                  fle.s        t6, fs2, fs3
                  slti         s2, t4, 148
                  fdiv.s       ft10, ft7, fs9, rdn
                  fmv.w.x      ft11, a5
                  ori          t1, a0, 1529
                  mulhu        a5, s10, s7
                  fsgnjx.s     fs7, ft10, ft5
                  fmul.s       fs11, fa2, fa1, rmm
                  add          s7, a0, s11
                  fsgnj.s      ft5, fs2, ft11
                  sltiu        a2, ra, -728
                  sra          a3, s6, s4
                  xor          s8, s3, gp
                  sub          a4, a2, s8
                  fmin.s       ft7, fs6, fa3
                  sub          t4, s10, s1
                  sll          t4, a2, s0
                  fsgnjx.s     ft10, fs10, ft8
                  srai         s5, zero, 25
                  fcvt.s.wu    ft6, s3, rup
                  auipc        t1, 858032
                  add          tp, sp, s3
                  xori         s5, s3, -2006
                  rem          s3, a3, s3
                  sll          a5, s8, a1
                  add          s11, s0, a2
                  fsgnj.s      fs1, fs4, fs3
                  fdiv.s       ft2, fs8, fs8, rdn
                  slti         s7, s7, -68
                  fmv.x.w      s5, ft2
                  sltu         s3, a3, s7
                  sll          a4, zero, s8
                  fsgnjx.s     fs8, fa1, fs8
                  mulhu        s2, s7, a1
                  fmv.w.x      fs11, t1
                  nop
                  add          s4, s5, s8
                  xor          s0, s7, s7
                  srl          s8, a1, s2
                  srai         gp, a7, 2
                  fcvt.s.wu    fs11, s0
                  remu         s6, a0, zero
                  sll          s4, s5, s11
                  sltu         a4, s10, t0
                  nop
                  srai         s5, tp, 31
                  mulhu        s9, a4, a5
                  fsub.s       fs7, fs0, fa3
                  slti         a1, ra, 942
                  lui          sp, 87449
                  fmul.s       fs10, fs7, ft9, rup
                  fmin.s       fa6, fa5, fa4
                  sltu         a3, s1, a7
                  addi         a5, s2, -1381
                  slti         tp, t6, 1748
                  and          s9, t3, a2
                  slt          s9, s8, t3
                  fsgnjx.s     fs4, ft10, ft4
                  fadd.s       fs2, ft7, fs0, rne
                  and          a1, a3, a0
                  auipc        a5, 795873
                  fmax.s       fa1, ft0, fs8
                  fmul.s       ft9, ft7, ft8
                  srl          s5, s11, s5
                  srl          s6, a4, t3
                  addi         s5, t4, -1093
                  fmul.s       ft0, fs5, fa2
                  fmv.w.x      fs10, s0
                  fmax.s       ft11, ft5, ft3
                  fcvt.s.wu    ft3, t0, rtz
                  divu         a1, s8, t5
                  mul          sp, s3, sp
                  fcvt.s.wu    ft11, s5
                  fclass.s     sp, fs6
                  rem          t2, a1, a0
                  feq.s        s7, fs11, fs6
                  fclass.s     s9, fs0
                  fmul.s       fs4, fs5, fa5, rup
                  fcvt.s.w     fs7, a1
                  mul          s6, ra, s5
                  addi         sp, zero, 1814
                  or           s9, s2, s10
                  nop
                  feq.s        s1, fs11, ft4
                  srai         a5, t1, 23
                  fmul.s       fs1, ft9, fa6, rmm
                  fcvt.s.wu    ft2, t1, rne
                  divu         s4, sp, a7
                  and          s2, a5, t6
                  xori         zero, s4, -1927
                  fsgnj.s      fs6, ft11, fs5
                  fmin.s       fs8, fa7, fs1
                  sltu         s10, s8, ra
                  fcvt.s.wu    fs0, s0
                  fsgnjn.s     ft10, fs7, ft1
                  div          a4, s6, tp
                  xor          t6, a4, s9
                  xor          ra, a5, zero
                  andi         s10, a0, 883
                  mul          s5, s2, a5
                  fsub.s       ft4, ft9, fs11
                  mulhu        s1, s9, a0
                  sub          a3, a7, s7
                  auipc        s3, 559248
                  slli         gp, s0, 18
                  ori          s2, a3, 571
                  srai         s9, sp, 10
                  slli         s5, s11, 17
                  sltiu        a2, s7, 34
                  fsgnj.s      fa6, fs5, ft5
                  fcvt.w.s     sp, fs6
                  sll          s11, a0, s3
                  fcvt.s.wu    ft11, t4
                  andi         s10, t6, 422
                  mulh         a3, s6, s8
                  mulh         a1, sp, t5
                  rem          s11, a7, s5
                  add          s8, sp, s6
                  feq.s        s10, fs2, fs1
                  feq.s        s10, ft10, ft7
                  addi         s10, a0, 834
                  fmv.w.x      fs5, zero
                  slli         t4, s4, 16
                  xor          s7, zero, ra
                  xori         s10, a1, 1837
                  ori          a4, a6, 675
                  fcvt.s.w     fa1, zero
                  mul          a4, s4, s9
                  remu         s7, a1, gp
                  lui          s2, 592390
                  fcvt.wu.s    gp, ft3
                  mulhsu       s4, a1, a5
                  srli         t6, s1, 16
                  ori          a1, a7, -245
                  slli         s8, t3, 4
                  ori          zero, a1, -236
                  fmv.x.w      s5, fs3
                  or           t3, a4, s1
                  feq.s        a1, fs5, fa0
                  rem          s10, s5, s1
                  mul          a4, sp, a6
                  sub          s3, t3, a4
                  fmax.s       fa2, fs6, fs7
                  ori          t2, a7, -1711
                  mul          a4, s6, a0
                  fmul.s       fs3, fs6, fa7, rmm
                  xori         s2, s5, -473
                  sltu         s6, t1, s6
                  fsgnjn.s     ft8, fs3, fs11
                  fcvt.w.s     ra, fs1, rmm
                  auipc        sp, 466015
                  sll          s9, s5, sp
                  fmv.x.w      s9, ft10
                  sll          ra, t2, a7
                  fsub.s       fa3, fs3, fa1
                  fcvt.s.w     fs6, s6, rmm
                  fsgnj.s      fs5, fs5, fs4
                  add          t4, ra, a7
                  xori         a5, a1, -1641
                  fle.s        s1, ft4, ft10
                  fmax.s       ft4, ft11, fs6
                  mulhsu       s8, t0, ra
                  flt.s        gp, fs7, fa5
                  sltu         t5, a5, s11
                  fsgnjx.s     ft4, ft5, fs9
                  flt.s        s6, fs11, ft1
                  fadd.s       fs6, ft0, fs4
                  divu         s3, a3, s8
                  sll          a4, a5, s8
                  srl          s11, zero, s1
                  sll          t4, s8, t1
                  fsgnjn.s     fs2, ft7, ft10
                  srli         a4, t5, 9
                  div          sp, tp, a0
                  ori          a4, s9, -1711
                  and          zero, a6, ra
                  fsgnjn.s     fs6, ft1, ft11
                  fcvt.wu.s    s0, fa7, rne
                  div          a5, s2, a4
                  auipc        s11, 998261
                  fle.s        s1, fs0, fa3
                  auipc        s6, 652389
                  and          t6, a0, a2
                  mulhsu       sp, ra, s0
                  fmul.s       ft3, ft6, fs11, rne
                  fsgnj.s      fa6, fa1, fs11
                  fle.s        t2, fa4, fs8
                  srl          ra, s0, a4
                  fsgnjn.s     fs4, fa3, fs2
                  slt          s5, s6, s0
                  feq.s        a5, fs11, fs0
                  divu         tp, s9, t5
                  fmv.x.w      s3, fs4
                  xor          s3, a6, zero
                  xori         s4, t0, -1490
                  fcvt.s.w     fa1, t3
                  remu         t5, t2, tp
                  div          s6, a6, s0
                  lui          a3, 778409
                  and          s9, s7, t0
                  fsgnjn.s     ft5, ft9, ft5
                  fmul.s       ft9, ft9, ft7, rtz
                  fmin.s       fa4, ft7, ft4
                  mulhsu       s10, s4, a2
                  sub          s10, a7, a3
                  srai         ra, a2, 0
                  fcvt.wu.s    a5, fa0
                  srl          a2, a0, t5
                  remu         s11, a2, s10
                  mulhsu       t5, a2, zero
                  divu         t4, t5, gp
                  fmax.s       fa3, ft0, ft8
                  andi         a2, t3, 1462
                  mulhsu       ra, s2, a2
                  or           s11, t3, s10
                  addi         t0, t6, 2023
                  fle.s        s5, ft5, fs11
                  and          a3, s3, a1
                  sub          gp, a1, s11
                  sra          s3, gp, t2
                  sra          s3, s6, s2
                  fle.s        s9, fa4, fa6
                  fsgnj.s      fa6, fs2, fs3
                  fcvt.s.w     ft0, s6
                  slti         s2, a3, -899
                  add          a4, a4, sp
                  mul          t5, a7, a4
                  fdiv.s       ft9, fa5, fs1, rne
                  fsub.s       fs9, fa3, ft6, rup
                  fmv.x.w      a4, ft11
                  sll          s4, gp, s11
                  fcvt.s.w     fs3, zero, rup
                  fle.s        t2, ft6, ft0
                  fcvt.wu.s    a2, ft6
                  fdiv.s       fa0, ft3, ft7, rdn
                  xori         s7, s6, 448
                  slti         s6, a7, -1441
                  remu         a5, t5, t1
                  sltiu        s8, s11, -886
                  slti         a5, a3, -1343
                  nop
                  sll          t6, a2, s2
                  nop
                  slli         s0, t1, 20
                  fmv.x.w      s7, ft0
                  fmv.x.w      s10, ft1
                  auipc        s0, 775767
                  auipc        t5, 513566
                  xori         a4, tp, 95
                  sll          s3, s5, a1
                  nop
                  slli         s11, t1, 1
                  nop
                  sll          t1, a0, a6
                  slli         t0, s3, 20
                  srl          gp, s9, s7
                  remu         t1, t0, zero
                  fsgnjn.s     ft7, ft3, ft11
                  slti         tp, s7, 1109
                  rem          t1, zero, s3
                  fcvt.s.wu    ft2, s1, rne
                  sra          s4, s3, t4
                  fsqrt.s      fa1, ft2, rtz
                  nop
                  fle.s        t4, fa4, fs7
                  divu         t5, s2, t2
                  div          t0, s4, s5
                  srai         s4, t2, 25
                  mulhsu       a5, s11, s0
                  fsgnjx.s     ft0, ft1, ft5
                  xori         a4, t6, 559
                  sra          t5, s5, t5
                  fmax.s       ft6, fa3, ft4
                  fcvt.s.wu    ft6, a7
                  fsgnj.s      ft5, ft3, ft3
                  or           s11, s3, s3
                  fcvt.s.w     ft1, s5, rmm
                  mulhsu       t6, s10, tp
                  fmul.s       fs5, fs9, fs11, rmm
                  fsub.s       fs7, ft5, fs9
                  fmin.s       ft2, fa3, ft5
                  add          a3, a5, s6
                  srli         a5, t6, 2
                  srli         t6, a1, 12
                  lui          t2, 904875
                  divu         s8, s1, s5
                  fcvt.s.w     fs4, a1, rdn
                  fsgnj.s      fs1, fa6, ft5
                  fmv.x.w      s9, fa0
                  fle.s        t0, fs7, ft9
                  add          t0, t3, s11
                  fle.s        t6, fs5, fs0
                  fcvt.wu.s    ra, fa0
                  flt.s        s6, fs3, fa0
                  div          s5, a0, s10
                  andi         t0, ra, -1552
                  fclass.s     zero, fs5
                  xor          s11, s11, a2
                  div          s9, s1, s7
                  mulh         s6, s3, a3
                  feq.s        s11, ft10, ft4
                  addi         a4, a7, -1769
                  xor          t6, a0, s1
                  addi         a4, t2, 1045
                  srli         s1, s8, 26
                  mul          t1, t1, t0
                  add          a5, t5, a7
                  slti         t5, s8, 909
                  fclass.s     a1, fs11
                  add          t1, t6, t1
                  fsub.s       ft3, fs4, fa3, rne
                  fsgnj.s      fs11, fs4, fs4
                  divu         s5, s2, gp
                  andi         gp, s10, -317
                  fsgnjn.s     fs0, fs8, ft8
                  add          ra, sp, s0
                  nop
                  fsgnjn.s     fs3, fs3, ft10
                  mulhsu       s6, s1, a4
                  fcvt.s.w     fa2, s7, rmm
                  fsqrt.s      fs6, ft1
                  ori          a2, s10, 1102
                  auipc        a1, 534147
                  fmv.w.x      fs0, s3
                  slt          t0, s7, s11
                  or           ra, a3, t3
                  sll          a3, a5, s4
                  sll          s1, a1, ra
                  and          t3, s6, s4
                  fcvt.s.w     fs3, s6, rup
                  fsgnjx.s     fs10, ft3, fa0
                  feq.s        t4, fs3, ft11
                  sltu         s8, s4, t2
                  fcvt.s.wu    fs7, tp, rtz
                  fcvt.wu.s    s0, fa7
                  fsgnj.s      ft1, fs10, ft4
                  or           s0, s7, s1
                  rem          t4, zero, t5
                  ori          s2, s2, -1351
                  mul          t0, a4, s7
                  rem          a1, tp, t1
                  div          s1, t4, ra
                  sltu         s1, sp, t4
                  xor          ra, ra, s6
                  mulhu        tp, s2, s11
                  mul          a3, a3, s6
                  fmv.w.x      fs1, s0
                  sltiu        a5, t5, 882
                  fclass.s     a1, fs6
                  srl          t6, gp, t0
                  fcvt.w.s     s6, fs11
                  slti         s0, s0, -986
                  divu         gp, s1, s6
                  fcvt.s.wu    ft10, t3, rmm
                  xori         s8, s9, 1162
                  or           zero, a0, a1
                  xori         s0, sp, 849
                  fmax.s       fs10, fs2, fs1
                  auipc        a3, 169163
                  fmax.s       ft3, ft9, fa5
                  fcvt.s.wu    fa7, t5
                  slt          s4, s6, s10
                  sltu         s4, t2, s5
                  rem          s10, s7, s2
                  lui          t6, 120075
                  slt          t1, s2, t0
                  flt.s        a1, ft4, ft7
                  fmv.x.w      zero, fs10
                  mulhsu       t6, zero, sp
                  fcvt.s.wu    ft7, tp, rtz
                  mulhu        s0, t1, s7
                  fsgnjx.s     fs0, ft8, ft7
                  xor          t1, gp, s6
                  slti         a1, s1, -997
                  xor          s0, tp, t6
                  feq.s        s6, fa4, ft2
                  lui          a5, 746182
                  srli         s6, s10, 29
                  srli         t0, a6, 22
                  mul          t1, a2, s8
                  srli         s11, a7, 30
                  flt.s        t3, ft4, fs11
                  sltiu        t2, a6, 1084
                  srl          zero, s6, s5
                  addi         a5, s8, 1808
                  srai         s3, gp, 9
                  andi         s3, s11, -767
                  xori         s11, tp, 1054
                  fadd.s       ft5, ft1, ft7
                  fsgnj.s      fs0, fs11, fs1
                  sltiu        s7, s9, 520
                  xori         s1, t6, 639
                  fdiv.s       ft1, fs1, ft2
                  div          s5, gp, t0
                  xor          s8, s8, a4
                  add          t4, s9, a2
                  mulh         t4, s11, s6
                  xor          a2, a0, s10
                  sltu         s1, t0, a7
                  mulh         t2, t0, gp
                  sltiu        s7, a2, 878
                  fcvt.s.w     ft1, t5, rup
                  div          ra, s2, t4
                  divu         s1, s11, a3
                  div          zero, s3, a7
                  fcvt.w.s     s5, fa3
                  fcvt.w.s     ra, ft2, rup
                  nop
                  mulh         sp, a0, s7
                  slli         s5, sp, 3
                  fcvt.s.w     fa0, s1
                  fsgnjn.s     fs11, fa3, fa0
                  fsgnjx.s     fs3, ft2, fa1
                  fle.s        s2, fa7, fs10
                  fsub.s       ft11, ft9, fa2, rmm
                  fsgnjx.s     fa6, ft0, fa4
                  fsgnj.s      fa0, fa5, fs6
                  fclass.s     s9, fs7
                  fsgnjn.s     ft11, ft6, fs3
                  nop
                  slli         s2, a6, 8
                  slli         t0, s7, 26
                  remu         s6, t5, zero
                  or           s7, a3, sp
                  mulhu        t1, s1, s4
                  fmax.s       fa2, ft0, fs7
                  fcvt.wu.s    gp, fa7, rmm
                  sll          sp, t6, s4
                  sra          s3, t2, s2
                  srli         tp, s0, 0
                  fclass.s     gp, ft3
                  div          tp, t4, a7
                  fadd.s       ft7, ft9, fs1, rtz
                  fcvt.s.wu    fa2, gp, rdn
                  fclass.s     t3, ft9
                  div          s3, s6, s0
                  rem          t2, ra, s1
                  and          t6, t5, s10
                  fcvt.s.wu    fs4, a7
                  fmax.s       ft2, fs8, ft2
                  fle.s        t4, fa5, fs9
                  sltiu        ra, s7, -1791
                  sll          s3, a4, s5
                  fmul.s       fs1, fa2, fs7
                  fadd.s       ft8, fs6, ft1, rdn
                  fmv.x.w      a2, fa5
                  or           tp, s6, gp
                  and          t3, a0, s3
                  fsub.s       fs6, fs2, fa0
                  fsgnjn.s     ft3, fs9, fa2
                  sra          tp, t3, a3
                  sltu         s0, s3, a5
                  or           s2, s1, s6
                  srl          t6, s11, t2
                  fmv.x.w      a3, fs5
                  rem          t2, t4, s7
                  lui          ra, 224365
                  srl          t2, s0, s8
                  slti         gp, a6, 317
                  sub          s8, sp, t3
                  rem          t3, a7, s2
                  sub          s5, s7, s8
                  fsqrt.s      ft11, fs8, rtz
                  addi         gp, a6, 816
                  srl          s0, tp, a6
                  fmin.s       ft11, fs5, ft0
                  fcvt.s.wu    fa7, gp, rup
                  sub          a2, s5, a0
                  slt          s8, s6, a0
                  add          ra, s10, s1
                  and          tp, a2, a5
                  slti         t0, a4, 1557
                  xori         s7, t6, -946
                  ori          sp, gp, -1774
                  fsqrt.s      fs9, fs0, rdn
                  andi         a5, s3, -322
                  ori          t3, a7, 574
                  mulh         t6, sp, gp
                  mulhsu       s4, s6, s7
                  fmin.s       fa2, fs2, fa3
                  xori         tp, a1, -1478
                  feq.s        tp, fs5, ft7
                  fmv.x.w      a4, fs8
                  xori         s2, s10, -525
                  fcvt.wu.s    s10, fs3, rtz
                  srli         a4, t4, 31
                  fadd.s       fa4, fa7, fs6
                  fsgnjn.s     fs3, fs3, ft7
                  fle.s        t3, fs10, fs10
                  fle.s        s2, ft0, fs4
                  fsqrt.s      fs3, ft9, rtz
                  div          a1, s1, ra
                  mulh         zero, t0, a6
                  srli         t1, s11, 12
                  mulhsu       s7, s6, s6
                  fcvt.w.s     t5, fs9
                  remu         t6, ra, a3
                  feq.s        sp, fs0, fa4
                  remu         t3, a6, s10
                  flt.s        t4, fs1, ft3
                  fmax.s       fa2, ft9, fs5
                  fcvt.s.wu    fa4, ra, rne
                  mulh         s7, gp, t3
                  xor          t4, t0, a5
                  fcvt.wu.s    s11, fs11
                  feq.s        a3, fs7, fs1
                  fmv.x.w      s5, fa6
                  sltiu        tp, a2, 1308
                  fcvt.w.s     gp, ft6
                  sltiu        t5, a4, 1254
                  fmv.x.w      s3, fa1
                  fmin.s       ft2, ft2, fa6
                  sra          gp, t6, a7
                  divu         s0, s2, a3
                  fsub.s       fa0, fa3, fs1
                  fsub.s       fs5, fs6, fa7
                  fmul.s       fa6, fs4, fa6, rtz
                  flt.s        s3, ft3, ft7
                  fmax.s       ft10, fs1, fs8
                  fsgnjn.s     fs10, fs3, fs3
                  div          s0, tp, t3
                  fmv.w.x      ft7, s9
                  divu         a5, t3, t2
                  auipc        s1, 678890
                  nop
                  fsqrt.s      fs0, ft1, rdn
                  sll          t5, t6, a0
                  fsub.s       ft2, fs7, fa3, rtz
                  xori         s11, s7, 938
                  andi         s3, gp, 428
                  sub          s7, t4, tp
                  ori          t2, s9, -939
                  fcvt.wu.s    s1, fs5, rmm
                  fsgnj.s      fa7, ft10, ft1
                  sra          s9, s5, t4
                  fadd.s       fs10, fs8, fs5
                  fsub.s       ft9, ft5, fs5, rdn
                  nop
                  sll          s4, a1, s2
                  sll          t4, s8, tp
                  fsub.s       fa0, fs7, ft1
                  fclass.s     ra, fa0
                  fcvt.s.w     fs2, s9
                  slti         a5, ra, -540
                  fcvt.wu.s    s2, fs3
                  fmv.x.w      a2, fs4
                  divu         s6, a7, zero
                  mul          a2, s4, a0
                  srai         a3, ra, 1
                  sll          zero, a1, t6
                  fmax.s       fa7, ft9, fa1
                  feq.s        s5, fs7, ft8
                  xori         s5, a7, 495
                  feq.s        a5, fs10, fs4
                  fsgnjx.s     ft9, fs0, fa5
                  fsub.s       ft9, ft6, ft10
                  sltu         a4, s4, s7
                  fmul.s       fs0, fa2, fs8
                  sub          t2, s6, t2
                  fsgnj.s      fs8, ft4, ft1
                  sra          t0, zero, s6
                  flt.s        s4, fa7, fs11
                  xori         s11, s7, 1737
                  fsgnj.s      ft3, fs7, fa2
                  sltiu        t2, s0, 2008
                  slt          s2, s0, s0
                  rem          a3, s1, tp
                  mulhsu       t2, a0, zero
                  fsqrt.s      fs9, fa2
                  flt.s        s2, fa6, ft4
                  srli         s3, a4, 16
                  fcvt.s.w     ft6, t2
                  fmul.s       ft8, ft7, ft2, rtz
                  slt          t1, s2, a4
                  fsgnjx.s     ft6, fs10, fa4
                  srl          zero, s2, s2
                  fsqrt.s      ft7, ft2
                  feq.s        zero, fs5, ft9
                  divu         a2, zero, t4
                  xori         s6, a7, 626
                  nop
                  div          s7, s2, a5
                  srli         t5, a6, 29
                  flt.s        a2, ft0, ft2
                  mulhsu       t5, s8, s2
                  nop
                  add          s5, a6, s8
                  andi         a2, t1, -97
                  fmv.x.w      sp, ft11
                  srli         sp, gp, 12
                  sll          ra, sp, a1
                  flt.s        s3, fs0, fs4
                  auipc        s4, 1007892
                  srli         s10, a0, 10
                  fclass.s     ra, fa4
                  ori          t6, s0, -18
                  and          a2, a5, sp
                  fsgnjn.s     ft1, fa7, fs7
                  fsgnj.s      fa6, fa1, fs8
                  fclass.s     a4, fs8
                  fcvt.wu.s    a1, fa4, rmm
                  nop
                  fadd.s       fs3, ft8, fs11
                  add          tp, s6, s8
                  or           gp, t5, t5
                  fdiv.s       fa4, fs2, fa5, rdn
                  lui          s0, 121802
                  fdiv.s       fs5, fs1, ft2, rne
                  fmv.x.w      s5, fs1
                  slli         a4, a1, 3
                  fle.s        s6, fs4, ft11
                  fcvt.s.wu    fa5, s6, rdn
                  fcvt.wu.s    s6, fs10, rdn
                  srli         t3, t5, 0
                  sltiu        a1, a2, -863
                  flt.s        s0, ft10, fs4
                  auipc        gp, 498800
                  mulh         s0, t2, a1
                  add          a4, a0, gp
                  divu         ra, t2, sp
                  addi         zero, s4, -796
                  fcvt.s.w     fs6, t1
                  fadd.s       ft9, fa5, fs0, rtz
                  mulhsu       ra, t0, ra
                  fmul.s       fa3, fs8, fs0, rne
                  fclass.s     s0, ft1
                  srai         a5, t2, 29
                  sltiu        s10, s4, 129
                  srl          a4, zero, s7
                  fmv.x.w      a1, fs7
                  fcvt.s.w     fa2, s4
                  fdiv.s       ft1, ft5, ft9
                  divu         s10, s2, s11
                  ori          t2, a3, 417
                  sltu         s9, s3, a4
                  fmin.s       fs1, fs11, fa5
                  xori         t6, tp, 1209
                  add          s6, t6, tp
                  slti         a1, s7, 1841
                  fle.s        gp, ft11, fa2
                  fsgnjn.s     ft6, fs8, fa5
                  remu         s4, s4, sp
                  lui          sp, 635243
                  xor          t4, sp, gp
                  fcvt.wu.s    s8, fs8
                  remu         t6, zero, a4
                  xori         a5, s4, -1950
                  fmin.s       ft1, fs8, fa6
                  sll          a3, s8, zero
                  fsgnjn.s     ft1, fa2, fs0
                  srli         gp, t6, 26
                  mulh         s10, a3, s2
                  rem          s0, a3, s9
                  sltiu        gp, s2, 233
                  mulhu        s3, t6, t3
                  slli         s6, s1, 3
                  fclass.s     t3, ft11
                  slt          s3, t1, t2
                  feq.s        sp, ft9, fa6
                  fcvt.s.w     fs7, s0
                  ori          a2, a0, 680
                  fsgnj.s      fa6, fs4, ft0
                  lui          s2, 517501
                  nop
                  rem          a4, a6, ra
                  nop
                  fmin.s       ft4, ft2, fa2
                  and          tp, s10, a1
                  fcvt.s.w     fa3, s0, rup
                  slti         s0, s2, -1556
                  fcvt.wu.s    s1, ft11
                  fcvt.wu.s    a3, fa7, rmm
                  fcvt.wu.s    t0, fa5, rmm
                  mulhsu       t1, s2, s4
                  srli         a4, a4, 29
                  fcvt.wu.s    s8, ft10, rne
                  or           s9, a7, s4
                  fsub.s       ft0, fa5, fa3
                  srl          t3, t0, s1
                  fcvt.s.wu    ft8, t2, rup
                  fmin.s       fs3, ft4, ft8
                  divu         a1, a0, a6
                  sltiu        a4, t6, -966
                  srli         s4, a3, 20
                  and          a2, s11, s6
                  ori          s2, a1, 1844
                  sll          s0, s5, sp
                  xori         s3, s4, 66
                  xor          s6, a3, t5
                  xori         t1, t1, -71
                  add          t5, gp, s2
                  feq.s        s0, fa7, ft7
                  mul          s9, t4, s8
                  fmv.w.x      ft4, s0
                  fdiv.s       fs8, fs3, fs3
                  fsgnjx.s     ft6, fa2, fs7
                  mulhu        s9, t4, a2
                  flt.s        s5, ft8, fs0
                  or           t3, s8, zero
                  feq.s        t3, ft7, fs4
                  slt          a2, s1, a1
                  srai         s0, s1, 21
                  fcvt.s.wu    fs8, t4, rne
                  fclass.s     a4, ft7
                  sub          s4, t5, s9
                  srl          a3, s3, a2
                  slli         s5, a1, 7
                  fcvt.wu.s    s9, fs0
                  mulh         s2, s8, s1
                  feq.s        s5, fa5, fs5
                  sll          t5, s6, s2
                  fsgnjn.s     fs4, ft9, fa0
                  fsgnjn.s     fa3, fs7, ft1
                  fmul.s       fa5, fa6, fa7, rmm
                  add          s5, s7, a7
                  or           gp, s0, t1
                  or           s5, t4, a3
                  sra          s0, t2, a1
                  fcvt.s.w     fs6, a0, rmm
                  or           a2, s1, a4
                  mul          s5, gp, sp
                  slli         s6, tp, 0
                  sub          zero, t3, t5
                  add          t2, a3, a3
                  srai         t0, a1, 12
                  sltu         t1, zero, t5
                  andi         s2, tp, -404
                  auipc        s0, 405655
                  slti         t1, s9, 1272
                  sra          zero, a3, t5
                  rem          s4, a3, s1
                  feq.s        s4, fs11, ft5
                  addi         sp, a5, -853
                  fcvt.s.wu    ft7, a4, rup
                  fmv.w.x      fs11, s7
                  and          t6, sp, zero
                  fdiv.s       ft4, fs3, fs7, rmm
                  add          s5, a3, a0
                  fmin.s       fs4, ft11, fa5
                  sltiu        a3, t0, -149
                  fmin.s       ft6, fa2, ft10
                  sltiu        a2, tp, -32
                  fclass.s     s6, ft2
                  sra          zero, s3, a0
                  and          s3, s2, t2
                  fmax.s       fa4, fa1, fs2
                  srai         a1, s1, 16
                  fmul.s       fs6, fs8, fs6
                  sub          t5, t3, t0
                  fle.s        a3, ft5, fa4
                  addi         s0, s11, 412
                  xor          t1, a6, a0
                  srl          tp, t3, s6
                  sltu         zero, a3, t4
                  srli         s8, tp, 8
                  slt          s9, s1, a2
                  or           s0, s3, s6
                  fsgnj.s      fs0, fs2, fs10
                  sltu         s7, a7, s3
                  fsgnj.s      fs3, fs1, fa0
                  rem          t4, sp, a0
                  sll          s11, s7, s6
                  fsgnjn.s     fa0, fs10, fs0
                  nop
                  xor          a5, t5, a7
                  sll          a1, s3, s1
                  add          a5, s11, t3
                  auipc        a4, 116652
                  sltiu        a2, a1, -76
                  mulhu        t5, a5, s8
                  fmv.x.w      s4, fs5
                  slli         t1, t4, 28
                  fcvt.s.w     fs5, a2
                  fclass.s     tp, fs7
                  fcvt.w.s     s2, fs4
                  or           t3, s6, a7
                  fmv.w.x      fs9, s1
                  slli         a2, ra, 26
                  fclass.s     s9, fa0
                  fcvt.w.s     t4, fs8
                  srl          tp, zero, a1
                  sub          s5, a5, a7
                  and          a2, t0, a6
                  slti         s6, a0, -1183
                  fcvt.s.w     fa6, s11, rup
                  xori         s4, a4, -1995
                  fmax.s       ft5, fs0, fa1
                  slti         t1, s5, -1985
                  sltiu        t1, s8, -944
                  fsgnj.s      ft4, fs3, ft5
                  rem          s7, t5, zero
                  mulh         s1, tp, t5
                  fsgnjx.s     fa7, ft3, fs4
                  andi         s6, t3, -574
                  fcvt.wu.s    t6, fs5, rdn
                  lui          gp, 213298
                  addi         t3, a7, 923
                  lui          a4, 305431
                  flt.s        s11, fs0, fa0
                  srli         zero, s4, 24
                  and          a4, a0, a5
                  fsub.s       fs1, ft0, fs2
                  fclass.s     t6, fa3
                  mulh         a3, t6, s3
                  divu         s1, s2, s5
                  divu         s10, s10, t2
                  fmin.s       fs2, fs7, fs7
                  fadd.s       fs11, ft4, fa5
                  andi         s9, ra, -872
                  fadd.s       fs4, fa5, ft6
                  sub          tp, a6, s5
                  mulhu        a3, s10, a4
                  fsgnj.s      ft10, fs10, ft4
                  fdiv.s       fa2, fs3, fs7
                  fcvt.s.w     fa1, s9
                  sub          s4, s5, s1
                  remu         a5, s7, s11
                  sub          s4, a6, gp
                  auipc        a3, 850931
                  fsqrt.s      fs0, ft8
                  srli         s3, t2, 20
                  xor          zero, t0, ra
                  nop
                  div          t1, ra, t0
                  fmv.x.w      t1, ft0
                  add          a1, s9, a2
                  fclass.s     s10, fa4
                  fcvt.w.s     zero, fs4
                  fmax.s       fs1, fa7, ft3
                  fsgnj.s      ft5, fa7, fa2
                  fsgnjn.s     fs9, fs7, ft8
                  fcvt.s.w     fs4, s11
                  xor          a4, t4, t1
                  mul          s10, gp, s2
                  fle.s        tp, fs0, ft9
                  fmax.s       fs11, fa6, fs7
                  fle.s        t3, ft11, fs7
                  sltiu        s8, t5, 577
                  fsgnjx.s     ft2, fa0, fs4
                  fmul.s       fs1, ft1, fs3, rne
                  fsqrt.s      ft10, ft3, rup
                  slli         t0, s4, 18
                  mulh         s0, s1, a3
                  feq.s        s0, ft2, fs1
                  fmax.s       ft8, fa6, fs8
                  nop
                  slli         a3, a2, 27
                  fmv.w.x      ft2, a0
                  sub          a4, t2, s9
                  sub          t3, ra, s10
                  auipc        s0, 286887
                  fmv.x.w      a3, ft3
                  fmv.w.x      fa0, s0
                  srai         a2, ra, 4
                  slti         a1, zero, -1716
                  srli         tp, t3, 3
                  rem          t6, t2, a4
                  lui          s7, 220027
                  mul          s7, s6, t1
                  xor          s5, t5, s7
                  xori         t4, ra, -781
                  fcvt.s.wu    fa6, s10
                  fcvt.wu.s    s5, fs4, rmm
                  nop
                  rem          t4, a4, t0
                  srai         s0, a6, 2
                  andi         t0, tp, 945
                  addi         t6, t4, 1240
                  fcvt.wu.s    t4, ft4, rup
                  remu         t1, s4, s2
                  fle.s        tp, fa1, fs7
                  andi         gp, s11, -1778
                  fclass.s     t5, ft9
                  xor          s9, a5, s3
                  fcvt.s.wu    ft1, s2, rup
                  feq.s        s8, ft9, ft6
                  fsqrt.s      fs0, ft8
                  fcvt.wu.s    t5, fs6, rne
                  feq.s        a2, ft9, fa6
                  srli         a4, t6, 25
                  add          s6, s10, s0
                  fsub.s       ft3, fa3, ft0
                  ori          s2, a5, -2025
                  fsgnjx.s     fa6, ft4, ft11
                  srai         s2, s3, 28
                  fadd.s       fs1, fs3, fs7
                  add          s0, a5, t2
                  fsgnj.s      fs8, fs0, fs3
                  mul          a1, a4, t5
                  add          t1, t2, s4
                  remu         t6, t2, a7
                  xori         zero, gp, 1495
                  fcvt.s.wu    fs9, sp, rdn
                  lui          a3, 830732
                  fadd.s       ft3, fs2, fs11, rup
                  lui          t5, 586495
                  ori          t1, tp, 1537
                  sltiu        t4, a0, 1263
                  srl          s6, s0, a5
                  lui          s11, 366094
                  divu         s8, s0, t3
                  fmin.s       fa2, fs0, fs6
                  slt          s6, t6, t1
                  fdiv.s       fa7, fa0, fa6
                  addi         t1, s11, -1986
                  srai         s0, t3, 15
                  ori          ra, s4, -1221
                  fcvt.s.w     fs0, ra, rup
                  rem          s11, s0, a7
                  fsgnj.s      fa5, ft2, ft11
                  fsub.s       fa5, ft11, ft9
                  mulhu        s8, ra, a5
                  fcvt.s.wu    fs8, s11, rtz
                  mulhu        a3, a6, a5
                  fcvt.w.s     s6, ft4
                  lui          t6, 199263
                  mul          t5, s11, a4
                  fsub.s       ft6, fs11, fa7, rdn
                  flt.s        s4, ft6, ft11
                  fcvt.s.wu    fa5, a3, rtz
                  slt          t6, t5, a2
                  slt          t3, a3, gp
                  fcvt.s.wu    fs4, s3
                  fsgnjn.s     ft11, fa6, fs2
                  srli         s5, s0, 21
                  fmax.s       fa3, ft3, ft5
                  sra          t0, a1, t0
                  lui          s11, 228871
                  mulhu        s9, t6, a1
                  fcvt.wu.s    s9, fs7, rup
                  fcvt.wu.s    s10, fs2, rmm
                  rem          t3, tp, a7
                  fcvt.s.wu    fs4, t1, rup
                  fsgnj.s      fa7, ft2, fs0
                  fcvt.w.s     s9, fs6, rtz
                  fcvt.w.s     t1, ft0
                  slti         s5, s11, 888
                  fcvt.s.w     fa7, t0, rdn
                  nop
                  fmin.s       fa1, ft11, fa3
                  srl          sp, t4, t4
                  fdiv.s       fa7, fa4, fa0, rdn
                  feq.s        a3, fa3, fa3
                  fsgnj.s      fs4, ft11, fs2
                  sra          s0, ra, t6
                  xori         s8, s1, 637
                  sll          s10, s4, a1
                  and          s5, s1, a5
                  srl          s9, s0, s7
                  fmax.s       ft4, fs0, fs7
                  fadd.s       fs3, fa5, fs6
                  add          t1, s2, s7
                  div          sp, s0, a5
                  sltiu        s8, a5, 1205
                  xor          s10, sp, sp
                  fsqrt.s      ft9, ft8
                  slt          t5, zero, s11
                  fcvt.s.w     fs6, s7
                  div          a1, a3, t5
                  fcvt.s.w     ft0, t5
                  fcvt.s.wu    ft3, a0
                  ori          s3, a0, 907
                  lui          sp, 381206
                  mul          s0, ra, gp
                  srai         a5, a3, 1
                  remu         s4, s2, s0
                  fmul.s       ft11, fa4, ft5
                  slti         s0, s7, 1946
                  fsub.s       fa6, fa5, fa7, rtz
                  slli         s5, s6, 7
                  rem          t1, t2, tp
                  remu         s1, t6, a1
                  ori          s2, s2, 1689
                  sra          s10, t4, s8
                  add          s11, a4, a6
                  or           s0, s6, tp
                  divu         sp, s11, s6
                  srai         t5, a2, 17
                  slt          sp, ra, a3
                  fadd.s       fs10, fs10, ft3
                  mulh         s7, a6, a2
                  mulh         t3, s1, a3
                  fmin.s       fs11, ft11, ft5
                  fdiv.s       fs4, ft7, fa7, rup
                  slli         t0, a2, 0
                  fmin.s       fa2, fa1, fs10
                  nop
                  remu         s11, a1, a5
                  fmv.w.x      fs11, s5
                  fsgnj.s      ft0, fa5, fa2
                  add          s0, a5, s8
                  divu         gp, a6, a6
                  fle.s        s2, fs10, fa3
                  nop
                  xor          t2, a3, t6
                  or           s1, zero, a3
                  fle.s        tp, fa7, fa7
                  fmul.s       fa4, fs5, fs8
                  xor          zero, a3, a0
                  and          a2, s0, s3
                  sltiu        s10, ra, 721
                  srl          tp, tp, a1
                  lui          s11, 182769
                  fsqrt.s      fa1, ft7
                  sub          t4, t3, t5
                  srli         t0, s3, 0
                  sra          s11, tp, a4
                  mulhu        a2, t1, a0
                  ori          a1, s4, -723
                  andi         t1, t2, 892
                  add          t3, t0, s0
                  remu         t4, t2, s8
                  fadd.s       fa3, ft10, fs4, rdn
                  and          t3, ra, a2
                  sltiu        a2, a5, -1417
                  or           s1, s1, t5
                  fmax.s       fs2, fs2, fs0
                  lui          zero, 998789
                  srl          s11, a1, s8
                  fmin.s       ft11, fa6, fs11
                  or           t3, s1, t1
                  fcvt.wu.s    a2, fs10
                  fcvt.s.wu    ft9, s8
                  sub          a4, s6, t0
                  fsgnjx.s     ft1, ft3, ft0
                  fcvt.s.w     ft4, s1
                  add          a5, t5, t1
                  mulhu        t6, a6, s10
                  and          s5, s2, s4
                  fsgnjx.s     fs2, ft7, ft1
                  fmul.s       fa7, fa6, fa7, rdn
                  fmin.s       ft8, fa2, ft0
                  slti         t2, a1, 1921
                  fcvt.wu.s    a2, fa0
                  fadd.s       fs8, fs5, ft3, rtz
                  fsgnjn.s     ft3, ft1, fs11
                  sra          s6, a0, t2
                  mulh         t0, a5, ra
                  slt          s10, t1, t4
                  auipc        s5, 438963
                  fsgnj.s      ft9, fa5, fa2
                  nop
                  lui          t3, 99758
                  fcvt.wu.s    s6, fa0, rtz
                  remu         a1, t1, s9
                  div          gp, ra, s3
                  slt          a3, t0, t2
                  sub          t1, zero, t0
                  rem          t2, sp, a2
                  fadd.s       fa5, ft8, fa0, rne
                  srl          a1, a5, tp
                  slti         s1, sp, 856
                  fcvt.wu.s    a3, fs1, rne
                  mul          t0, s5, zero
                  sltu         s1, s0, t6
                  div          t0, s0, a2
                  sltu         s0, sp, s9
                  fdiv.s       ft11, ft4, fs9
                  fclass.s     t3, fa5
                  addi         t4, s9, -621
                  srli         t5, s10, 5
                  flt.s        t6, ft7, ft6
                  andi         a2, s2, -158
                  fsqrt.s      ft9, fs2
                  auipc        a2, 769531
                  div          s4, a3, s2
                  mulhu        t0, gp, s11
                  fsgnj.s      ft1, ft7, ft9
                  slli         s9, t0, 23
                  slti         s1, t0, -1431
                  sll          t5, a1, s6
                  mul          s11, gp, t3
                  fcvt.wu.s    s1, ft2, rtz
                  remu         s7, s8, t2
                  srai         a3, s3, 1
                  mulhu        t3, a3, t4
                  feq.s        t3, ft8, fs10
                  auipc        a2, 695116
                  mulhsu       a4, t3, s5
                  sltiu        t6, a1, -1660
                  fmax.s       ft2, fa1, fa6
                  fcvt.w.s     s8, fs7, rne
                  fmin.s       fa2, fs4, fs11
                  xor          tp, ra, t0
                  fmv.x.w      t3, fs10
                  fadd.s       fa6, fa0, fs9, rtz
                  mulhu        t1, t2, t4
                  xori         t4, t2, 1644
                  add          a3, sp, t5
                  flt.s        sp, fa4, ft3
                  fsqrt.s      fs8, fs2
                  fmv.x.w      s9, ft8
                  addi         a2, s9, 448
                  add          s10, a7, ra
                  sltiu        t1, gp, -47
                  fsgnjn.s     fa3, fs7, ft6
                  fcvt.s.w     fs2, a7
                  fsqrt.s      fa1, fs3
                  div          s1, t6, a7
                  fle.s        s5, fs4, fs3
                  divu         s6, ra, tp
                  fdiv.s       fs9, fa4, ft9, rtz
                  lui          s8, 937690
                  div          t5, s3, t3
                  fsgnj.s      fa2, fs6, fs4
                  mulhu        t0, a3, s5
                  fsub.s       fs1, fs9, fs11
                  fle.s        t2, fs3, fa3
                  mulh         a2, t5, s10
                  addi         tp, t3, 988
                  fsgnjx.s     ft2, ft0, ft5
                  srl          a5, t6, a4
                  flt.s        sp, fa3, ft6
                  fclass.s     s7, ft5
                  srai         t1, t6, 20
                  auipc        gp, 400841
                  fsgnj.s      ft7, fs9, ft10
                  fle.s        ra, ft8, fs3
                  fcvt.s.wu    fs9, s9
                  sll          s0, s5, s8
                  div          gp, t0, t3
                  fcvt.wu.s    t0, fs9
                  fsgnjx.s     fa2, fs2, fa0
                  mulhu        s4, a0, s5
                  addi         a4, ra, -382
                  fsgnj.s      fa4, fs4, ft8
                  fle.s        s10, ft7, fs8
                  mulhu        t3, a2, t6
                  remu         zero, a0, s5
                  lui          s10, 210780
                  ori          s7, a2, -1612
                  add          t5, t0, t6
                  slt          t2, a1, t5
                  andi         a5, tp, 866
                  and          gp, s8, s0
                  fcvt.wu.s    a2, fs11, rmm
                  fmv.w.x      fs5, s2
                  sub          t3, s5, a0
                  sltiu        s1, zero, -894
                  ori          s7, a3, -418
                  ori          ra, t5, 1354
                  fmax.s       fa4, fs9, ft1
                  srl          a5, a1, t0
                  sub          zero, a4, a4
                  slt          s10, t3, s8
                  sltiu        zero, s5, 1273
                  div          s6, a5, s2
                  and          a2, a2, sp
                  fmax.s       fa7, fs1, fs0
                  rem          t0, t1, a4
                  or           sp, t0, s5
                  fcvt.s.w     fa2, a6
                  xori         s0, t6, 524
                  sra          s11, t5, s8
                  mulhsu       s5, s8, a2
                  sltiu        zero, t0, -1308
                  fadd.s       fs11, ft5, fa5, rne
                  sra          s7, a3, s4
                  auipc        s7, 400855
                  divu         s8, s4, s6
                  fadd.s       fa2, fs10, fs6
                  fdiv.s       fa1, fa5, ft6
                  slli         t6, gp, 7
                  fsub.s       fs6, fs2, ft0, rmm
                  or           t5, s0, t5
                  sltu         s3, a2, ra
                  fmv.x.w      s11, fs6
                  ori          s1, s4, 472
                  or           t1, a7, s3
                  fadd.s       ft11, fs3, ft6, rdn
                  divu         t0, a0, a0
                  or           s0, s3, a1
                  slti         s1, s9, 1333
                  sltiu        a5, a0, -897
                  mulhsu       s6, s11, t2
                  fmax.s       fs2, fs5, ft3
                  fadd.s       fs3, ft11, fa0, rup
                  fdiv.s       fs4, fa1, fa6
                  fmv.w.x      fs4, s4
                  sll          s10, s0, a1
                  fsgnjn.s     ft6, ft0, fs10
                  fsgnj.s      ft3, ft3, fa4
                  fle.s        t3, fa3, ft3
                  fmul.s       ft4, fa1, fa3
                  sltiu        ra, t6, 1520
                  fmul.s       fs5, fs4, ft0, rmm
                  rem          gp, t6, t6
                  sub          s0, s1, a2
                  slti         s6, t3, -571
                  fsgnjx.s     ft9, fa4, fa6
                  srai         a2, t6, 6
                  fsub.s       ft8, fs5, fa7, rup
                  fmax.s       fs5, ft8, fa1
                  fsgnjx.s     fs7, fa4, ft7
                  divu         gp, s7, s11
                  fle.s        s9, fa1, fs11
                  auipc        s2, 570568
                  fsgnjn.s     ft11, fa2, fs7
                  addi         t1, s8, 2001
                  fsqrt.s      fs11, ft9, rne
                  andi         s9, gp, 202
                  sltiu        s7, s11, -1599
                  and          a1, t5, t6
                  fsqrt.s      fa3, fs11, rne
                  slt          t4, s2, s10
                  mulhu        sp, s10, a0
                  sltu         t0, ra, s2
                  srai         s1, t4, 25
                  mul          s0, a1, s5
                  ori          a3, a0, 1230
                  nop
                  fclass.s     ra, fa0
                  fsgnjn.s     ft11, fs3, fs10
                  mul          s8, s6, t4
                  fcvt.wu.s    ra, fs9
                  flt.s        tp, fa7, fs5
                  andi         s5, t1, -699
                  nop
                  addi         s11, tp, 894
                  lui          t2, 423951
                  fdiv.s       fs5, fa3, fs5
                  sll          zero, a7, t6
                  fdiv.s       ft8, fs3, fs0
                  lui          s6, 927338
                  fsgnjx.s     fa6, fa2, fs4
                  divu         s11, zero, s11
                  feq.s        zero, ft10, fs2
                  divu         a2, t1, s6
                  mul          t3, a1, s2
                  mulhu        t0, s6, zero
                  remu         tp, s5, s7
                  fmax.s       ft10, ft8, ft4
                  fdiv.s       fs11, ft11, fs6
                  mul          a1, s11, s2
                  fcvt.s.w     fs7, s3
                  fsgnjn.s     fa4, ft2, ft0
                  andi         a5, ra, 1335
                  fsgnjn.s     fs4, fs8, ft0
                  addi         ra, s6, 1241
                  and          s10, a3, t2
                  ori          t1, a5, 735
                  fcvt.w.s     t5, fa2
                  srli         s10, gp, 31
                  fsqrt.s      ft3, fs4
                  fmax.s       fs11, fs5, fs7
                  sub          a5, s4, t2
                  fcvt.w.s     s8, fa2
                  sra          s10, t1, t0
                  fclass.s     a3, fs4
                  ori          a3, tp, 2043
                  xor          s6, s6, a6
                  slt          s2, s7, s2
                  fcvt.s.w     fa2, t1, rne
                  div          s10, a6, s0
                  sltu         sp, t2, s0
                  fle.s        t3, ft4, fs2
                  fcvt.s.w     fa1, zero, rup
                  srai         s4, t4, 24
                  feq.s        ra, ft10, ft7
                  fsub.s       fs8, fs4, ft10
                  slli         s3, gp, 14
                  slt          t3, s9, t4
                  flt.s        s1, ft9, ft7
                  fsgnjx.s     fs11, fs7, ft0
                  xor          a2, a0, s1
                  fdiv.s       fa2, fs11, fs3, rne
                  sltu         t1, gp, a1
                  xori         sp, a3, 1222
                  fsgnj.s      ft5, ft3, fa4
                  sub          s7, ra, s2
                  fmul.s       ft2, fs4, fs11, rmm
                  divu         s9, tp, s2
                  sub          a5, t1, s0
                  mul          sp, s6, s6
                  fclass.s     s0, ft4
                  feq.s        s4, ft2, fa2
                  or           s7, t5, sp
                  sltiu        s4, a6, -101
                  fmv.x.w      s4, fa6
                  slli         s3, ra, 5
                  fadd.s       fa4, fs11, ft11
                  slli         s10, s10, 30
                  mulhu        t2, tp, a5
                  xor          a4, s7, t3
                  and          s6, t3, a5
                  and          a2, tp, s5
                  mul          t5, t4, ra
                  xori         a2, ra, -921
                  sra          s0, s0, s3
                  fcvt.s.w     fa5, s0
                  fdiv.s       ft3, fa1, ft10, rup
                  slti         gp, a7, 1831
                  addi         a2, a6, 1406
                  auipc        s1, 137490
                  fclass.s     s6, fs11
                  mul          t3, s4, a2
                  srli         s2, s11, 5
                  fsgnj.s      fa5, fs2, fa6
                  fcvt.s.wu    fs11, s10, rne
                  and          tp, s5, gp
                  fsgnjn.s     fs0, fs4, fa1
                  fmin.s       fs5, fa4, ft5
                  nop
                  auipc        t5, 133467
                  fadd.s       fs4, ft7, fs4, rtz
                  fle.s        s5, fa7, ft11
                  fmin.s       fa0, fs3, fs10
                  feq.s        zero, ft4, ft4
                  mulhu        ra, t0, t1
                  rem          a4, a3, t2
                  mulhu        s9, gp, a3
                  sltiu        t6, a7, 1786
                  fclass.s     zero, ft11
                  nop
                  remu         s8, t5, t6
                  rem          s9, t4, t3
                  fmul.s       fs7, ft0, fa4, rmm
                  fmv.x.w      tp, fs8
                  fmax.s       ft5, fs10, ft8
                  fcvt.s.w     fs2, a7
                  slti         tp, gp, 621
                  sltiu        ra, s0, -22
                  flt.s        s0, ft6, fs1
                  mulh         s1, t6, s0
                  srl          sp, s6, sp
                  ori          t0, t2, -712
                  fsgnj.s      fa6, ft3, ft3
                  fcvt.s.wu    fa1, s8
                  divu         s11, s7, t1
                  srli         s7, t3, 10
                  sub          s0, t6, s4
                  slli         t1, a2, 12
                  sltiu        t6, ra, 1654
                  addi         s2, s9, 1673
                  fmv.x.w      zero, ft1
                  sll          s6, t4, t3
                  xori         s1, t0, -529
                  fclass.s     a3, fa7
                  sltiu        t6, s8, -13
                  fsub.s       ft10, fa0, ft5, rne
                  fcvt.w.s     tp, fs11
                  slli         s3, a1, 19
                  ori          zero, t6, -690
                  lui          s8, 98285
                  mul          tp, zero, s4
                  fmin.s       fs5, fs8, ft1
                  addi         s5, a3, 849
                  sub          s2, a7, t0
                  andi         gp, s11, -585
                  nop
                  rem          s0, t4, sp
                  fadd.s       fa2, fs4, fs8
                  lui          t2, 663114
                  xor          s11, s7, a1
                  srli         s10, sp, 3
                  ori          s8, t1, -43
                  or           s7, a5, s3
                  fsub.s       fs2, ft4, fa5, rmm
                  fcvt.s.w     ft11, s5, rup
                  srli         s0, s4, 22
                  fsgnjx.s     ft10, ft8, fa6
                  remu         ra, a7, s6
                  and          t6, s0, a6
                  mulhu        s8, a1, t6
                  fcvt.w.s     t2, fs2, rtz
                  fmin.s       ft3, fs7, fs6
                  fclass.s     a1, fa7
                  sra          sp, t2, t1
                  srai         t2, t2, 2
                  mulh         zero, t4, s3
                  mul          s4, ra, s0
                  flt.s        s7, ft8, ft3
                  fcvt.wu.s    t1, ft10
                  mulhsu       a2, t2, s0
                  mulh         s9, a3, s1
                  fsub.s       fs5, ft2, fs3, rmm
                  nop
                  lui          a4, 685063
                  fsqrt.s      ft4, fs8, rmm
                  nop
                  mulhsu       ra, a2, t3
                  srli         t2, s6, 9
                  slli         s8, a1, 18
                  fmin.s       fa6, ft3, fa4
                  ori          a3, a5, 1987
                  fadd.s       fa2, ft5, ft7, rne
                  srli         a2, s3, 16
                  fmul.s       ft10, fa5, fa4, rne
                  fcvt.w.s     a4, fs7
                  fcvt.s.w     fs8, a6
                  lui          s10, 725076
                  xori         a2, s6, -1277
                  fmin.s       ft11, fa1, fs8
                  slli         s7, gp, 23
                  fsgnjx.s     ft7, fs10, ft5
                  sll          t5, a4, a6
                  xori         s7, s4, -781
                  nop
                  fsgnj.s      fs11, fa4, fa6
                  fmin.s       fa6, fa2, fa0
                  mulhsu       s3, a7, s2
                  srl          t6, a3, tp
                  sll          s5, s7, a2
                  auipc        s1, 551652
                  sra          s1, s5, s2
                  srli         t5, s7, 19
                  xori         sp, a0, 1113
                  fcvt.w.s     a3, fs1, rmm
                  fmin.s       ft3, fs9, fs9
                  auipc        tp, 43849
                  add          t6, a2, a0
                  fsgnj.s      fa2, ft5, fa3
                  mulhu        t4, a1, s11
                  fmul.s       ft6, fs9, fa0, rup
                  slti         s9, a3, 2000
                  sra          sp, t6, t1
                  ori          s4, s0, 1865
                  fmin.s       fs7, ft0, ft11
                  sra          zero, a7, a5
                  div          a5, t3, a0
                  fsgnjx.s     fa1, ft3, ft1
                  sub          s8, t1, gp
                  fcvt.s.wu    fa2, s2, rup
                  mulhsu       gp, s7, t4
                  or           t4, zero, s7
                  fcvt.s.wu    ft6, t4
                  or           tp, a2, s3
                  fclass.s     s2, ft11
                  or           s2, s10, t1
                  mulhu        a5, a5, t1
                  slli         s2, s6, 18
                  sub          t4, t1, s9
                  xor          zero, s11, s3
                  sra          a1, s10, t3
                  or           s10, a5, s6
                  fmv.w.x      fs1, gp
                  slt          a4, t4, a6
                  fcvt.w.s     s5, fa4, rdn
                  sll          a3, s6, t0
                  auipc        a2, 229451
                  fdiv.s       ft8, ft10, ft10, rup
                  nop
                  fmul.s       ft8, fs7, ft4
                  slti         s9, a5, -1961
                  fmin.s       fs8, ft7, ft2
                  lui          t3, 477662
                  fmv.x.w      t2, fs10
                  slt          a4, a1, a6
                  rem          a5, tp, gp
                  auipc        s5, 833561
                  mulhsu       s5, s8, s5
                  slli         t2, t4, 28
                  nop
                  fadd.s       ft5, fs4, fs2
                  slt          s8, s8, s10
                  fcvt.s.wu    fa0, s7
                  lui          s7, 933006
                  fsgnjx.s     ft11, ft10, fs11
                  fcvt.s.wu    fs10, s6
                  rem          ra, gp, zero
                  fcvt.s.w     fa7, s7
                  sltiu        a5, tp, 201
                  srli         s5, s9, 3
                  mul          t4, t2, zero
                  fmv.x.w      tp, fa0
                  sltu         t5, s8, a3
                  fcvt.wu.s    tp, ft2
                  andi         a3, s2, 2047
                  addi         s8, t1, -57
                  flt.s        t1, fa7, fs5
                  fmin.s       ft0, fs1, fs9
                  andi         s2, t1, -33
                  slti         a5, s2, 1240
                  fdiv.s       ft5, fs3, fs10, rdn
                  lui          sp, 76249
                  slti         t3, t4, -1759
                  fmin.s       ft3, ft8, fa0
                  nop
                  mulhsu       gp, t6, a1
                  nop
                  sll          a5, s3, a7
                  divu         a3, a4, s7
                  mul          t3, s2, s10
                  srli         a5, s9, 31
                  div          t5, s8, s0
                  fsgnjn.s     ft6, fa6, fs8
                  sra          s5, a1, ra
                  ori          t5, t6, -505
                  sltu         s5, t1, t3
                  fle.s        s2, fs4, fs6
                  mulhsu       s5, t6, a5
                  mulhu        t5, tp, a2
                  fle.s        s0, fa6, fa0
                  nop
                  fdiv.s       ft5, ft4, fs10, rtz
                  fsgnj.s      fs9, fs8, fs11
                  fsgnj.s      ft10, ft4, fs5
                  slli         s4, t0, 7
                  andi         s3, t3, 935
                  fmin.s       ft10, ft10, fa7
                  fsqrt.s      ft1, fs9, rmm
                  fsgnj.s      fs1, fs1, fs7
                  fmax.s       fa4, fs7, ft1
                  fcvt.s.w     fs3, s4, rdn
                  fmv.w.x      fs7, t5
                  xori         s9, a3, -839
                  sll          s3, s4, t1
                  fsgnjx.s     ft9, fa4, ft5
                  fcvt.s.wu    fa1, gp
                  fsgnj.s      ft7, ft6, fs8
                  srl          s8, s3, ra
                  and          s3, s8, zero
                  andi         s9, s9, -2008
                  remu         a5, t6, t2
                  sltu         t1, ra, t2
                  fadd.s       fa6, fa1, fa6, rmm
                  sltu         s7, a4, s7
                  fmin.s       fs8, fs9, fa1
                  addi         t3, a2, 1562
                  fsgnj.s      fs4, fa3, ft7
                  fsub.s       fs4, ft7, ft5
                  fsqrt.s      ft3, fs9, rtz
                  slti         s4, a7, -175
                  fmul.s       ft7, fs0, ft10, rne
                  flt.s        s2, fs10, ft0
                  fmax.s       fs9, fs2, fa7
                  sub          t4, s9, a2
                  mul          t1, s4, a0
                  fcvt.w.s     s2, ft11
                  and          a5, a0, zero
                  andi         a5, s2, -1190
                  fmin.s       fa2, ft6, ft5
                  fmv.w.x      ft9, a6
                  rem          s7, tp, zero
                  fdiv.s       ft8, ft1, ft10, rne
                  fadd.s       fs8, ft5, fs6, rdn
                  mul          a3, a0, s4
                  sub          s3, ra, t2
                  fcvt.s.w     fa0, t2
                  fcvt.w.s     gp, fa2
                  ori          sp, ra, 1213
                  add          s3, s2, sp
                  ori          gp, sp, 983
                  slli         t6, gp, 18
                  slt          t1, s4, zero
                  fmin.s       ft10, fs10, fs11
                  nop
                  feq.s        s10, ft0, ft10
                  sub          a3, s11, s0
                  addi         s10, t1, 1027
                  fsgnjn.s     fa1, fa2, ft8
                  fmax.s       fa6, fs8, ft8
                  feq.s        s7, fa3, ft11
                  fcvt.wu.s    a5, ft11, rdn
                  mul          s1, zero, s7
                  fmv.x.w      t5, fs2
                  slt          s10, s8, s0
                  fle.s        t6, fs10, ft4
                  mulh         a4, s8, a7
                  fclass.s     t0, fa5
                  fsub.s       fs8, ft1, ft2, rup
                  ori          t3, a3, 852
                  fclass.s     s11, fs10
                  fmul.s       fs2, fs6, fa7, rne
                  fsgnjn.s     fa7, ft3, fa4
                  fmul.s       fa5, ft11, fs7, rdn
                  divu         gp, t3, s10
                  sra          t6, s7, a0
                  fsgnjx.s     ft6, fa1, fs4
                  mul          sp, ra, s10
                  divu         a3, zero, t0
                  fcvt.wu.s    a2, fa0
                  slti         a2, a5, -568
                  div          tp, s1, s5
                  flt.s        t1, ft1, fa1
                  fcvt.s.wu    ft4, s8
                  fmv.w.x      ft1, a3
                  mul          s11, s7, t4
                  rem          sp, a3, s0
                  fsgnj.s      ft2, ft6, fs10
                  fmv.w.x      fa7, s10
                  divu         s5, sp, t4
                  fmin.s       ft6, fs1, fs0
                  remu         s9, t6, t1
                  feq.s        t4, fs4, ft5
                  or           a5, gp, a7
                  fmv.x.w      t3, fs0
                  mulhu        t0, t4, tp
                  fsgnjx.s     fa1, fa0, fs5
                  rem          ra, s11, a3
                  fclass.s     zero, fs0
                  xor          s1, a0, sp
                  auipc        s8, 45035
                  fcvt.s.w     fa2, s5, rup
                  fsgnjx.s     fa3, ft7, ft2
                  sltu         t4, a5, t1
                  fcvt.w.s     gp, ft6
                  mulh         s5, t2, t6
                  slli         tp, ra, 3
                  fle.s        s1, fs8, ft11
                  fmax.s       fa3, ft6, ft8
                  mulh         s11, zero, t5
                  sll          tp, gp, a0
                  mulh         t4, zero, s2
                  xori         s6, s6, 1539
                  fcvt.w.s     ra, fs4, rtz
                  fle.s        t2, fa5, fs10
                  slli         s3, s3, 17
                  slt          a3, a5, t6
                  srli         a4, s6, 31
                  divu         zero, s8, s5
                  fdiv.s       fa3, ft1, ft8
                  divu         a3, a7, s6
                  fcvt.s.wu    fs6, s4, rne
                  fcvt.wu.s    a5, ft2, rtz
                  srli         s2, s11, 24
                  mulhsu       s11, a0, t4
                  sltu         s7, s6, t2
                  fcvt.s.wu    ft4, a2
                  srli         t1, t3, 9
                  fsgnj.s      fa5, ft6, ft6
                  mul          s6, a4, a0
                  sltiu        a3, a5, 914
                  fmv.w.x      fa3, s9
                  auipc        s2, 331892
                  fle.s        t2, fa2, ft9
                  feq.s        t2, fa4, fs11
                  feq.s        s1, fa7, ft1
                  fdiv.s       fs6, fs11, fs1
                  div          s10, t0, s6
                  lui          t6, 707802
                  flt.s        tp, ft4, ft4
                  or           t0, t5, t3
                  fmv.x.w      a2, ft8
                  fcvt.s.wu    ft6, sp
                  fadd.s       fa0, fa7, fs0, rdn
                  fsgnjn.s     fs9, fa4, ft7
                  add          t3, a6, s1
                  mul          s10, s8, t3
                  fcvt.w.s     a1, fs6
                  and          a1, s7, t5
                  fsub.s       fs4, fa1, fa3
                  sll          t0, s9, a4
                  and          gp, t0, t5
                  addi         s8, ra, -1918
                  addi         zero, s8, -830
                  andi         sp, s7, -900
                  fle.s        s4, ft3, fa0
                  feq.s        a1, ft1, fa7
                  fclass.s     s11, ft2
                  xor          zero, t2, a0
                  and          s10, a5, s7
                  mulhsu       s9, s6, gp
                  fsqrt.s      ft2, fs10
                  fmax.s       fa4, fs8, ft2
                  srl          s9, t5, a2
                  mulhu        t3, a4, a6
                  srli         t3, s4, 0
                  fmul.s       ft3, fs6, fs3, rdn
                  flt.s        s2, fs11, ft10
                  fcvt.s.wu    ft4, t2
                  srli         s6, a4, 3
                  fclass.s     s9, ft4
                  ori          t1, s6, -345
                  rem          t1, a5, s7
                  fcvt.wu.s    s11, fs1, rmm
                  slli         ra, gp, 16
                  sltu         t3, a4, t6
                  mulh         s2, t3, t1
                  ori          s5, s9, -876
                  fmin.s       fs3, fa3, fs7
                  and          s10, tp, t1
                  fmv.w.x      ft8, s9
                  srai         ra, sp, 13
                  fdiv.s       ft11, ft3, ft11, rtz
                  feq.s        s6, ft4, ft7
                  ori          s11, s4, -576
                  mulhu        s1, zero, t5
                  sltiu        s5, s11, -1129
                  fmv.w.x      fa4, s2
                  flt.s        a3, fa2, ft9
                  sltiu        t1, s0, 55
                  fsqrt.s      fs6, fs5, rne
                  rem          s9, t5, s4
                  fclass.s     a1, fa0
                  or           t3, a0, s6
                  andi         s11, s4, 121
                  and          s7, s10, t2
                  feq.s        t3, ft3, fs5
                  fclass.s     t0, ft5
                  fmv.w.x      fs4, t3
                  slti         s5, s0, 1755
                  xori         s2, a1, 331
                  mulh         gp, t4, a0
                  fcvt.s.w     fa7, s7
                  fmul.s       fa7, fs11, fa2
                  mul          zero, a7, gp
                  remu         t5, t2, tp
                  srai         zero, s4, 21
                  fsgnjn.s     fa4, ft3, fs7
                  mulh         s6, a2, a6
                  fmul.s       fa2, ft2, fs10
                  slt          zero, s6, s2
                  rem          a5, s11, s1
                  fsub.s       fs10, fa6, fs7, rdn
                  nop
                  fclass.s     s9, ft3
                  remu         s9, a4, a4
                  fcvt.w.s     sp, ft8, rne
                  fcvt.s.wu    ft2, t2
                  mulhsu       t5, s0, a7
                  srl          s10, t3, t5
                  fsub.s       ft6, fs6, fs8, rne
                  div          t4, t4, ra
                  fcvt.s.w     ft1, zero
                  ori          s3, s8, -1225
                  fcvt.s.w     ft1, s4
                  fmin.s       fa6, ft4, ft4
                  fdiv.s       fs7, fs9, ft6, rup
                  xor          a5, a3, a0
                  mulhsu       s4, t0, t0
                  fsgnjn.s     ft8, fs5, ft9
                  fcvt.s.wu    fs10, s1
                  fsub.s       ft10, ft5, ft5
                  sltu         t2, a3, s6
                  slti         s2, s3, -793
                  nop
                  mulhsu       s8, s3, zero
                  slt          t5, s11, sp
                  mulhsu       a1, ra, a5
                  fsgnjx.s     fs8, fs11, fs2
                  fsgnj.s      fa4, fa2, ft11
                  fmax.s       fa7, ft4, fa3
                  mul          s2, t0, t3
                  sll          s6, sp, t6
                  feq.s        ra, ft7, fa1
                  fadd.s       ft4, ft5, fs7
                  addi         a4, t0, -458
                  fmax.s       fa0, fa6, fa4
                  rem          t4, t5, a4
                  div          tp, s10, a2
                  srli         s10, t6, 2
                  add          s7, s1, a5
                  slti         s0, s0, -1278
                  sra          s9, s3, a5
                  sll          sp, a3, a0
                  sub          s10, t5, a5
                  fsgnj.s      fs10, fs0, fs3
                  feq.s        t5, fs11, fa5
                  sub          zero, a1, s11
                  fle.s        a1, ft7, ft4
                  fle.s        s4, ft6, ft5
                  sub          a2, a0, a3
                  fsgnj.s      fs4, ft11, ft5
                  srai         a3, t6, 30
                  fmv.w.x      ft3, s10
                  auipc        tp, 274206
                  fle.s        s11, ft2, fa4
                  rem          tp, a0, t4
                  divu         s4, a2, t2
                  srai         ra, t4, 10
                  fmul.s       fa7, fa5, fa1
                  fmv.x.w      s3, fa2
                  fle.s        s9, ft2, ft9
                  addi         t0, ra, -1780
                  fle.s        s3, fs1, fa5
                  sltiu        sp, s5, 1567
                  fmin.s       ft11, fa5, ft7
                  div          t0, a5, s11
                  fadd.s       fa2, ft6, fa4
                  sltiu        t3, a1, -384
                  fmax.s       fs0, fa0, fs3
                  fcvt.s.w     ft2, s11, rne
                  sll          s7, t0, a7
                  fsgnj.s      ft1, fa7, fa7
                  fadd.s       fa6, fs9, fs9, rup
                  srli         s6, t4, 3
                  addi         ra, ra, 981
                  mulh         s7, t6, ra
                  mul          t0, sp, s7
                  fmax.s       fs10, fs3, fa5
                  mulh         t5, t1, s0
                  fcvt.s.wu    fs10, t0, rtz
                  lui          a4, 923070
                  andi         t5, s10, 120
                  fcvt.w.s     t3, ft5
                  add          s9, t6, s3
                  mulhu        s3, s7, a7
                  fmin.s       ft4, fa2, ft3
                  fsub.s       fs0, fs2, ft1, rup
                  fsgnjx.s     fs11, fs5, ft11
                  srai         s4, s7, 14
                  sltu         s11, a2, s8
                  fle.s        t6, ft11, fs9
                  fsgnjx.s     fa0, ft5, fs5
                  slti         t0, s7, -1974
                  sra          t3, tp, s5
                  sra          a2, a7, s0
                  or           ra, s7, a2
                  slti         s10, s6, 1215
                  fdiv.s       fa4, ft6, ft4, rdn
                  auipc        a2, 709850
                  fmax.s       ft2, fa6, fs4
                  sra          gp, a0, a4
                  sub          a4, zero, s4
                  ori          s0, t1, 1516
                  fsqrt.s      fs9, fa7
                  fsqrt.s      fa1, ft9
                  mulh         s6, a6, t6
                  lui          sp, 400533
                  feq.s        t4, fs3, ft0
                  sltiu        a4, s6, 1425
                  fcvt.s.w     fs9, zero
                  fsub.s       ft0, ft3, fs8, rdn
                  sra          ra, s7, a1
                  fcvt.s.wu    ft8, s0
                  addi         t1, s4, -249
                  mulh         t1, tp, a1
                  fmin.s       ft4, fs1, ft1
                  sll          t0, s5, a1
                  fmul.s       ft6, ft5, fs4
                  sub          s4, tp, t2
                  sltiu        sp, a3, -1760
                  srai         t2, s0, 20
                  fcvt.s.wu    ft10, a1, rdn
                  fmul.s       fs10, fs1, fa5
                  or           tp, zero, t6
                  fmv.x.w      s9, ft9
                  slt          t0, s1, t2
                  div          t6, ra, t4
                  slt          s10, s3, t6
                  rem          ra, a6, s9
                  mulhsu       s10, a2, a4
                  div          s1, s9, t4
                  mulhsu       s2, a6, s6
                  flt.s        s10, fa4, ft5
                  sub          s3, ra, t1
                  slli         t1, s4, 28
                  addi         s1, s10, -62
                  lui          t2, 687896
                  fmul.s       fs7, ft3, fs4, rdn
                  xor          t6, t0, s7
                  fmul.s       fs11, fs11, fs1
                  fsub.s       ft8, fa3, fs9, rup
                  auipc        t3, 42682
                  fsgnjx.s     fa3, fa2, ft7
                  fsub.s       fs7, fa4, ft2
                  fle.s        tp, fa4, fs6
                  slt          s8, s11, t2
                  sltu         s6, a1, s11
                  fmv.w.x      ft2, s3
                  fcvt.w.s     t2, fs3, rup
                  srl          s2, t0, t6
                  addi         s5, s1, 1207
                  fsgnjn.s     fa3, fs0, ft1
                  fmin.s       fa7, fs6, fs4
                  or           sp, t2, s0
                  slti         s7, sp, 1909
                  xor          s6, s0, a0
                  sll          sp, sp, t2
                  fcvt.s.w     fs10, s6
                  slti         a3, t3, -890
                  mul          sp, s7, s11
                  slli         t0, t4, 15
                  div          s6, t2, s1
                  mulh         ra, s6, t6
                  xor          s10, s8, t3
                  fcvt.s.wu    fs2, t5, rdn
                  fcvt.w.s     s5, fa1
                  div          t1, s1, a5
                  sltiu        s2, tp, -1772
                  srli         gp, a3, 12
                  flt.s        s0, fa4, fs3
                  andi         gp, t5, 296
                  fsgnjn.s     fa7, ft5, ft1
                  fmin.s       ft4, fs5, ft7
                  div          zero, s9, s6
                  fsgnjx.s     ft2, fs4, ft0
                  fcvt.s.wu    fa0, t2, rup
                  mulh         s10, s5, s7
                  mulhu        t3, t6, s0
                  fle.s        s2, fa1, fs2
                  sltu         a2, t4, a1
                  fcvt.s.w     ft4, a7
                  mul          s5, a4, a2
                  fle.s        gp, ft8, ft5
                  srai         s11, s3, 14
                  mulhsu       t3, t6, s2
                  mulh         t5, s10, s7
                  and          s2, t5, s10
                  fmin.s       fs4, fa2, fs0
                  lui          gp, 253435
                  fsgnj.s      fs1, fs2, fa4
                  and          t2, ra, s9
                  ori          t1, s3, 1952
                  lui          t4, 617660
                  xor          a1, s3, t4
                  divu         s3, t4, t3
                  fsgnj.s      fa4, ft8, fs11
                  ori          a3, zero, -449
                  fsgnjx.s     fa3, ft8, fs6
                  sra          a2, a5, s6
                  fcvt.wu.s    s4, fs2, rne
                  sltu         a2, t6, t6
                  slti         s8, s4, 1914
                  fle.s        t5, ft8, fs8
                  div          s6, ra, a6
                  sll          s11, a3, tp
                  mulhsu       s11, a1, a6
                  slti         s7, a4, 1564
                  div          sp, a5, a2
                  fmin.s       ft4, fs9, ft0
                  fmin.s       ft8, fa4, fs4
                  fmin.s       ft3, fs4, fs4
                  fmul.s       fs4, fa4, fs3
                  srl          tp, t1, s4
                  div          ra, s5, a5
                  slti         t1, s2, -1721
                  and          tp, s11, s6
                  xor          s5, s0, a3
                  nop
                  feq.s        a3, ft9, ft4
                  and          s6, s11, t2
                  fcvt.s.w     ft9, tp
                  or           s6, gp, t1
                  slti         s5, s2, 1933
                  sltu         s8, zero, ra
                  fsgnjx.s     fs2, ft2, fa7
                  sub          s7, a7, s8
                  sltiu        s3, t3, -1713
                  fdiv.s       fs2, ft4, fa6
                  mul          a5, s0, tp
                  flt.s        t5, fs6, ft2
                  sub          gp, a6, a0
                  fle.s        sp, ft9, fs1
                  addi         sp, s8, -1930
                  sll          a4, s1, a1
                  fcvt.wu.s    zero, fs4, rne
                  slli         s4, a4, 10
                  divu         a5, sp, zero
                  fsub.s       ft11, fs7, ft0
                  ori          ra, s7, -1416
                  or           s5, a1, zero
                  fcvt.s.wu    fs10, a7, rup
                  xor          t3, t5, s7
                  mulhu        zero, s3, ra
                  fsqrt.s      fs8, fa2
                  fsgnjn.s     fs9, fs11, fs11
                  fclass.s     t2, fa6
                  fsgnjn.s     fa5, ft7, fa4
                  fsgnj.s      fs3, fa1, fs8
                  nop
                  sll          a5, gp, sp
                  divu         s6, a1, s7
                  sll          t2, s9, s9
                  fsgnj.s      fa1, fa5, fs3
                  add          s5, s2, s2
                  fcvt.wu.s    a1, fa2
                  mulh         gp, a1, s0
                  fadd.s       fa5, fa7, ft9
                  sltiu        s2, a1, 313
                  divu         s2, a5, gp
                  divu         a5, gp, t2
                  fmax.s       ft10, fa0, fs9
                  feq.s        a2, fs7, ft0
                  xor          t0, s10, s9
                  fmv.x.w      a4, ft7
                  feq.s        s8, ft6, ft0
                  lui          tp, 7309
                  divu         t1, s8, t0
                  fsgnjn.s     fa0, ft7, fs9
                  sra          a3, t3, a4
                  feq.s        ra, ft6, ft2
                  fclass.s     a5, ft9
                  andi         s11, a2, 877
                  fmin.s       fa4, fs0, fs1
                  fmv.x.w      s2, fs7
                  andi         ra, a4, 1643
                  fsub.s       ft7, fs9, ft11
                  and          t1, t6, t3
                  fcvt.s.w     ft4, t3
                  fmin.s       fs4, ft0, fs6
                  fclass.s     s7, fs2
                  sub          a2, a2, s3
                  fsub.s       ft5, fs9, ft11
                  lui          s6, 136204
                  fdiv.s       fa7, ft4, fs4, rmm
                  rem          tp, a3, t2
                  remu         a2, a4, a4
                  fmv.x.w      a5, fa6
                  fmax.s       ft7, ft10, fa1
                  div          t6, s4, a2
                  srai         s0, s4, 28
                  fmul.s       fs0, fa2, ft9, rtz
                  mulhsu       s4, a0, t3
                  fmv.w.x      fa7, sp
                  fmul.s       ft5, ft10, fs11
                  fle.s        a1, ft10, ft8
                  mulh         s9, s5, s11
                  fmin.s       fs9, fa6, ft11
                  sra          ra, tp, s7
                  ori          ra, s11, 687
                  flt.s        s10, ft10, fs11
                  rem          t5, s9, s0
                  add          sp, s7, a2
                  sub          s2, t0, t3
                  fclass.s     s9, fs7
                  fsub.s       ft11, fa1, fs10, rtz
                  fsgnj.s      ft3, ft11, ft7
                  divu         s3, a7, t5
                  lui          sp, 243832
                  divu         gp, t5, a3
                  fdiv.s       fs0, ft6, fs7
                  fcvt.wu.s    s6, fs5, rup
                  mul          s5, s7, s6
                  sll          s3, t3, a5
                  nop
                  fcvt.s.w     fs9, gp
                  sltu         t1, s6, t5
                  srl          s3, a0, t4
                  mulhu        s3, s0, t5
                  mul          t4, s5, s1
                  fsgnjx.s     fa5, fs1, ft0
                  nop
                  srai         s4, a7, 18
                  sltiu        a2, sp, 1710
                  fcvt.s.wu    fs0, s10, rmm
                  andi         s9, a5, 955
                  remu         s3, s5, t1
                  fadd.s       fs7, fa4, fa1, rup
                  srl          s5, t6, s3
                  srai         zero, t1, 12
                  slt          s2, s2, a4
                  fsgnjx.s     fa4, fs9, fa5
                  mulhsu       a2, t0, a2
                  auipc        a1, 753186
                  fcvt.wu.s    ra, fs1
                  srai         t4, a3, 13
                  fsgnj.s      fa3, fs5, fs7
                  fdiv.s       fs4, fa2, fa4, rup
                  fmin.s       ft0, fs4, ft7
                  or           s5, t4, s6
                  addi         s4, a2, 1833
                  sltiu        tp, s0, 718
                  fdiv.s       fa2, ft10, ft8
                  addi         t5, zero, -182
                  fcvt.s.wu    fa0, t2
                  fmv.w.x      fs1, s4
                  fadd.s       ft9, ft3, fa7, rmm
                  sll          t1, a4, a6
                  slti         t2, s0, -657
                  sll          s11, a2, s3
                  fsgnjx.s     fa3, fa2, fs1
                  slti         s9, tp, 1725
                  srli         t0, t6, 6
                  xori         a5, gp, -1119
                  xori         s9, s1, -1969
                  fsub.s       fa3, fs5, fs2, rmm
                  and          s11, t3, s11
                  fsgnjn.s     fa0, ft8, fs5
                  xori         t2, s5, -2037
                  slli         t6, a7, 3
                  sll          t1, s6, a3
                  fmv.x.w      a3, ft0
                  srai         tp, s10, 6
                  srl          t5, s11, s5
                  lui          s0, 85103
                  fclass.s     t2, ft6
                  slt          t2, s1, t4
                  auipc        t4, 259210
                  sltiu        a4, t1, -1184
                  mul          a1, sp, t2
                  divu         s10, a1, a7
                  fsqrt.s      ft8, fs9
                  and          ra, a1, a5
                  mulhu        gp, ra, s3
                  fcvt.s.wu    ft4, tp
                  fsub.s       ft10, ft6, ft3
                  fmul.s       ft5, ft8, fa1, rne
                  andi         t4, s11, -1329
                  nop
                  slt          s6, a2, a7
                  sub          a1, s4, s11
                  fmax.s       fs5, ft7, fs10
                  nop
                  mul          s3, sp, s6
                  sltu         t1, t0, s6
                  fsub.s       fs0, ft1, ft7, rup
                  xor          a4, a5, t5
                  sltu         sp, t6, s10
                  mulhsu       s8, ra, s5
                  remu         s2, a3, ra
                  mul          s4, a3, s6
                  sra          a1, s8, zero
                  xor          t3, t6, sp
                  fmin.s       fa1, ft9, fa7
                  fsqrt.s      ft0, ft7
                  nop
                  mul          ra, s5, s10
                  feq.s        tp, fs0, fa1
                  fcvt.w.s     sp, ft1
                  srai         zero, s7, 27
                  rem          t1, s0, a7
                  mul          s9, t5, s6
                  fsqrt.s      fa6, ft6, rdn
                  fmax.s       fs3, ft5, ft7
                  fmv.x.w      gp, fa7
                  fmv.w.x      fa6, zero
                  fcvt.s.wu    ft0, s7
                  rem          t6, s0, s7
                  fcvt.s.wu    fs4, a7, rne
                  sltiu        t2, a3, 1175
                  add          s3, t5, s9
                  fsgnj.s      fa5, ft5, ft10
                  sll          s9, t2, s8
                  rem          t6, s5, t0
                  fsgnjn.s     fa5, fa3, fs1
                  fmv.w.x      ft10, t5
                  srli         s9, a7, 5
                  lui          a4, 325741
                  rem          s10, sp, s0
                  fadd.s       fa0, fa0, ft0, rmm
                  sra          s6, a6, ra
                  fmax.s       ft0, fs7, fs9
                  fadd.s       fa1, fa6, fa4
                  feq.s        a5, fa5, ft1
                  fclass.s     t5, fs8
                  fclass.s     s11, fa3
                  ori          s8, a3, -1024
                  fcvt.s.w     ft9, t2, rmm
                  add          t5, a1, s0
                  fdiv.s       fa6, ft10, fs1, rtz
                  slti         a2, s4, -576
                  mulhsu       t0, s7, s9
                  fcvt.w.s     t5, fs10
                  fmin.s       ft11, ft4, fa2
                  fmv.x.w      s11, ft8
                  mul          s2, s10, s0
                  fadd.s       fs10, fa4, fs7
                  fmax.s       fs11, fs7, fa4
                  fcvt.wu.s    s5, fa6, rmm
                  mul          s10, s5, s10
                  srai         s0, s6, 20
                  slt          tp, s0, a1
                  mulhsu       t1, gp, s4
                  andi         s5, a2, -160
                  xori         tp, a5, -1326
                  andi         t3, s0, -1428
                  sub          a5, a1, s2
                  andi         a5, zero, 1959
                  or           s9, a6, a1
                  fmv.x.w      ra, fs0
                  andi         s10, a2, -1308
                  div          ra, t4, a5
                  fmv.x.w      s6, fa7
                  feq.s        s3, ft5, fs6
                  mulh         s3, s1, s7
                  mulhsu       ra, s1, a1
                  mul          t0, a7, s2
                  ori          a4, s7, 1209
                  fsub.s       fs11, fa3, fs9, rdn
                  srl          t2, t6, sp
                  mulhsu       t0, s5, a2
                  fcvt.w.s     ra, fs2
                  sltiu        a1, a2, -1215
                  and          a2, t6, s0
                  fcvt.s.w     ft0, s2
                  slli         ra, sp, 1
                  mulhsu       s3, a7, t1
                  fdiv.s       ft7, fs8, fa3, rtz
                  sub          s6, s6, s0
                  mulh         t0, sp, sp
                  mulh         s3, s9, a7
                  div          t6, tp, zero
                  mulh         tp, s5, s8
                  fsub.s       fs1, fs10, fs5
                  fcvt.w.s     a3, ft4
                  fsgnjn.s     fa6, ft0, ft6
                  sub          s10, a0, s0
                  ori          t6, t0, 578
                  fclass.s     s5, fs1
                  fsgnjn.s     ft6, fs4, fa1
                  ori          s9, t0, 1982
                  or           s11, a1, a5
                  srl          s6, a7, gp
                  srai         zero, a2, 10
                  fmul.s       fa4, fs7, ft6
                  slli         t2, t6, 5
                  srai         a2, ra, 2
                  andi         gp, t4, 953
                  sll          s11, s8, t1
                  mulhu        s5, s9, s6
                  divu         s1, zero, t0
                  fle.s        t0, fs7, fs9
                  sra          t2, sp, a2
                  mulh         s3, s6, s9
                  sltiu        s5, t3, -141
                  flt.s        a3, ft9, fa4
                  sltu         t6, a4, a3
                  sra          s1, zero, s10
                  srai         a1, a2, 6
                  fadd.s       fs7, fa3, fs1
                  mulhu        t3, a3, s7
                  add          t4, s8, a4
                  add          t4, a0, a3
                  fmax.s       fs8, ft0, fs7
                  sra          s9, s9, s10
                  mul          a1, s1, gp
                  addi         t1, t5, -1344
                  add          s11, s2, a7
                  srli         zero, t0, 16
                  fadd.s       ft1, fs2, fa1
                  fcvt.s.w     fs4, s3, rtz
                  feq.s        a4, ft9, ft3
                  feq.s        s2, ft5, ft8
                  fmax.s       fs0, ft8, ft10
                  fmul.s       ft4, fs8, fs3
                  srai         t1, t1, 11
                  fmul.s       fs11, fa5, ft4
                  div          s6, s6, gp
                  divu         s3, s1, t6
                  remu         a5, s0, ra
                  xori         t5, a3, -225
                  fadd.s       fa6, fs7, fs2, rne
                  sll          s5, a5, zero
                  divu         s9, s10, a3
                  fsub.s       fs1, ft5, fa1, rup
                  xori         zero, s10, -65
                  andi         s0, ra, -1731
                  fdiv.s       ft3, ft0, fa5, rmm
                  fdiv.s       fs4, fa3, fs4, rne
                  fmin.s       ft10, fs0, fs9
                  slt          t5, tp, a6
                  fsub.s       fs1, ft11, fa7
                  fsub.s       ft2, ft2, ft0
                  fle.s        ra, ft10, fs6
                  auipc        s9, 662208
                  andi         s4, t3, 1646
                  fsgnjn.s     fa3, ft0, ft8
                  mul          tp, zero, a0
                  mulh         s3, a1, t1
                  slli         s5, s1, 11
                  fmin.s       fa5, fs8, fs1
                  sltiu        s9, s4, 1734
                  auipc        s10, 921797
                  srl          t1, zero, a1
                  slt          s0, a5, gp
                  mulhsu       a1, s3, ra
                  slt          t3, a3, zero
                  fmv.x.w      gp, fs8
                  mul          s7, s5, sp
                  xori         gp, t1, -420
                  feq.s        t5, fa7, fs5
                  mulhsu       t0, sp, s2
                  fcvt.s.wu    fa1, s0
                  fcvt.s.wu    fs4, s5
                  mulh         s0, t3, a4
                  fmul.s       fa5, fa2, fs6, rdn
                  slt          a5, s10, a4
                  fdiv.s       fs5, fs1, ft5
                  add          a2, t3, s5
                  fsgnjn.s     fa3, fs3, fa6
                  divu         s7, s5, a4
                  auipc        s10, 146913
                  sltiu        zero, s2, -1298
                  lui          t1, 436818
                  fsgnjn.s     fa3, fa5, fa6
                  fsgnj.s      ft7, fa6, ft8
                  srli         tp, t0, 10
                  flt.s        s6, fs8, ft2
                  fsqrt.s      fa5, fs5
                  fsgnjn.s     fs4, fa6, ft11
                  rem          t3, t3, s10
                  slt          a5, a4, s4
                  mulhsu       s2, a4, a7
                  auipc        s0, 539248
                  fdiv.s       fs2, ft4, ft3
                  srli         s9, s2, 11
                  sub          t0, s4, ra
                  flt.s        s4, ft0, ft0
                  addi         a1, t1, -155
                  sra          t2, s6, sp
                  add          s1, s9, t6
                  fmax.s       ft6, fa0, ft6
                  mulhu        a5, a7, a4
                  remu         t4, a0, s2
                  fcvt.s.w     ft3, s11, rtz
                  fsgnjx.s     ft1, fs1, ft3
                  nop
                  fmul.s       fs9, fa4, fs2, rdn
                  sra          t4, zero, a0
                  addi         t3, t1, -1744
                  fcvt.wu.s    t3, ft5, rup
                  feq.s        t2, fa4, fa4
                  srli         s8, a0, 23
                  mulhsu       t2, s1, s5
                  div          s10, ra, a3
                  fsgnj.s      ft3, fa3, fa1
                  mulh         t5, s9, s3
                  or           s10, gp, s10
                  fadd.s       fs7, ft3, fa6, rtz
                  fcvt.s.w     ft6, t0
                  sra          s1, s8, t2
                  addi         a1, ra, 1649
                  fsqrt.s      fs8, fa4, rmm
                  rem          t2, s5, s0
                  fadd.s       fs11, ft11, fa7, rtz
                  fcvt.wu.s    a5, fa1, rmm
                  slli         a3, s5, 13
                  sll          gp, s11, a5
                  slli         sp, s4, 19
                  addi         s7, s3, -2030
                  flt.s        s5, fs5, fs5
                  auipc        s8, 295846
                  or           s6, a6, t6
                  or           s8, a3, t4
                  andi         s6, s1, -1822
                  slti         s3, s3, -1178
                  fdiv.s       ft3, fa7, fs10
                  rem          a3, t2, t0
                  srl          s0, s6, a5
                  or           s0, s3, tp
                  add          s9, t5, t5
                  mul          s0, a7, s4
                  slli         t0, t3, 22
                  fdiv.s       ft0, ft9, fa3
                  sub          t1, a4, t3
                  sra          s3, s9, s10
                  rem          gp, a0, t5
                  remu         s8, a2, s10
                  fmin.s       fa3, ft2, ft2
                  addi         t3, s11, -1448
                  fmv.w.x      ft9, gp
                  slli         sp, a0, 5
                  fdiv.s       ft4, ft4, fs0, rup
                  add          a1, t0, a0
                  remu         gp, s8, t5
                  fsub.s       fs9, ft6, fs7, rup
                  fsqrt.s      fa4, ft0, rmm
                  srli         zero, a4, 24
                  fcvt.s.wu    fa1, s8, rtz
                  fadd.s       ft4, ft2, ft6, rup
                  fmul.s       fa6, ft10, fa5
                  fdiv.s       ft7, fa1, fa1, rmm
                  sltiu        s7, a5, -822
                  lui          s3, 147902
                  auipc        s5, 350631
                  srai         t3, gp, 11
                  nop
                  fadd.s       fs9, ft8, ft10
                  and          gp, t6, s7
                  flt.s        sp, fa5, fa5
                  fmul.s       fa1, fs9, ft0, rdn
                  ori          t2, a4, 1717
                  fcvt.s.w     fs2, a6
                  fsgnjx.s     fs6, ft2, fs2
                  fcvt.wu.s    a5, fs7, rdn
                  xori         a4, s8, -2
                  fmv.x.w      sp, fs5
                  mulhsu       t1, gp, s6
                  fdiv.s       ft7, ft8, ft7, rdn
                  slti         s2, s3, 876
                  sltu         zero, s4, s7
                  sltiu        s7, t1, -233
                  rem          s11, s1, s6
                  and          t1, t0, tp
                  fsgnjx.s     ft0, fa0, fs2
                  fmul.s       ft4, fs6, ft7
                  mulh         t0, s1, t1
                  mulh         s9, a3, s11
                  mulhsu       t0, s2, s11
                  fmv.w.x      fs3, t6
                  andi         s8, s8, -80
                  mulhu        t1, a4, ra
                  or           t4, s1, zero
                  sltu         a4, a1, zero
                  fdiv.s       fs4, fs7, fa1, rup
                  mulhu        s2, t6, a4
                  fcvt.s.wu    fs3, a4, rne
                  div          sp, gp, s7
                  slli         s4, a4, 5
                  fmv.x.w      t3, fs10
                  andi         s10, t6, 371
                  xori         t0, t0, 515
                  slt          s9, s2, t1
                  or           t5, a1, a2
                  fsgnj.s      ft3, fs1, fa2
                  sltiu        t2, t4, 805
                  xori         a5, t1, -1412
                  fmin.s       fs6, fs1, ft1
                  srli         a1, a4, 1
                  xori         t2, t4, -222
                  mul          t2, a3, a6
                  sub          sp, s7, s8
                  remu         s7, ra, t6
                  fdiv.s       fs11, fs2, fs8, rtz
                  div          s7, a0, t5
                  slli         s6, s2, 25
                  fmin.s       fs5, fa0, ft4
                  auipc        s5, 66119
                  slt          s10, s9, s9
                  ori          s5, a3, 1538
                  fmv.x.w      s8, ft4
                  fsub.s       fa3, fa2, ft3, rup
                  ori          s7, a2, 308
                  nop
                  rem          s7, s7, s8
                  sub          s11, a6, a3
                  sll          a3, a5, s5
                  lui          t1, 155028
                  sltiu        a1, ra, -1761
                  ori          s2, t4, -1141
                  fsub.s       fs1, fa5, fs6, rne
                  sltiu        s0, ra, -1818
                  lui          s6, 341623
                  fcvt.wu.s    s6, fs3
                  auipc        t3, 1012586
                  add          t1, tp, a6
                  fcvt.s.w     fs7, s10, rup
                  fmax.s       fs10, fa4, fa2
                  fsgnjn.s     fa2, fs7, fa5
                  fdiv.s       ft7, fs9, fa2, rup
                  rem          a3, s3, sp
                  sra          s8, zero, a3
                  fsgnj.s      fs9, fa5, fa2
                  lui          a1, 633168
                  slt          t6, s8, sp
                  auipc        s0, 737415
                  remu         s0, s10, s1
                  srai         sp, a5, 23
                  fmin.s       fs9, ft5, ft4
                  mulhsu       s2, t5, s5
                  mulh         t5, s5, t0
                  and          s11, s1, s10
                  mul          gp, s1, a3
                  srli         a2, a0, 10
                  fmin.s       ft2, fs7, fa3
                  rem          zero, a6, t1
                  sltiu        s0, a7, 1924
                  mul          s5, s11, t6
                  sub          t0, ra, a6
                  fdiv.s       fs0, ft6, fs6
                  rem          zero, s8, ra
                  andi         s6, sp, 1075
                  fsqrt.s      ft0, fs9, rup
                  fmv.x.w      s1, ft2
                  fdiv.s       ft6, ft3, fa1
                  srl          a2, a0, s6
                  add          gp, s6, t0
                  andi         a3, s2, 1428
                  auipc        a5, 641486
                  mulhu        a1, a0, ra
                  or           a5, a2, t5
                  add          t1, zero, sp
                  fsgnj.s      fa3, ft6, fs8
                  or           s11, a7, s1
                  auipc        sp, 353243
                  sub          a2, s10, sp
                  fclass.s     zero, fa4
                  nop
                  div          t3, zero, s8
                  rem          tp, a2, s8
                  divu         a2, a5, s8
                  fmul.s       fa7, fs5, fs0
                  lui          s2, 114334
                  sltiu        s2, t2, -81
                  fsqrt.s      fs9, ft1
                  sub          ra, a7, a3
                  fsgnjn.s     ft3, fs10, ft8
                  divu         a2, a5, a5
                  xori         s10, gp, 1227
                  fmv.w.x      fa7, gp
                  nop
                  div          a2, a7, ra
                  slti         t1, sp, 1596
                  remu         t4, s10, s11
                  rem          s10, a5, s1
                  fmv.x.w      s6, ft8
                  auipc        a4, 378923
                  fsgnjx.s     ft2, ft8, ft4
                  fle.s        zero, ft9, ft4
                  fmv.w.x      fa1, t6
                  srl          a5, s7, t6
                  and          a3, a6, a7
                  feq.s        s0, fa0, ft11
                  srai         s8, s10, 9
                  sltu         s10, sp, a2
                  fle.s        s8, fs3, ft10
                  slli         a1, a6, 23
                  fsgnjn.s     ft11, ft5, fs3
                  fadd.s       fs3, fs10, fs6, rtz
                  nop
                  fadd.s       fs4, fs10, fa4
                  fmin.s       fs8, fa5, fs7
                  ori          a3, s8, -1160
                  and          t2, a4, t1
                  sll          ra, a1, t4
                  auipc        s10, 467585
                  mulhsu       s9, a6, a5
                  rem          s3, a6, s7
                  auipc        s10, 967568
                  srli         ra, s8, 29
                  fsgnjn.s     fs2, fa2, fa1
                  addi         tp, a7, -197
                  mulhu        s4, s1, t2
                  fcvt.w.s     s4, fs3, rmm
                  fsgnjn.s     fs11, ft6, fs3
                  fmax.s       fa4, fa3, fa2
                  fcvt.s.wu    ft2, gp, rdn
                  mulhu        ra, s11, s7
                  fcvt.w.s     a5, ft3
                  mulhsu       a2, s8, s11
                  srli         t5, s9, 22
                  fmul.s       ft1, ft6, fs7, rup
                  fcvt.w.s     t0, ft0
                  fcvt.w.s     t1, fs9, rtz
                  divu         s1, s5, a5
                  div          s2, a3, s6
                  slli         s5, t4, 6
                  fmul.s       fa5, fs5, fs2, rne
                  divu         ra, s0, sp
                  fdiv.s       fs5, ft1, fa3
                  lui          a5, 639507
                  fdiv.s       ft11, fa0, fa7, rtz
                  auipc        s10, 831188
                  mulh         s6, t1, t0
                  mulhsu       s0, t3, tp
                  fmul.s       ft8, ft9, fs5
                  addi         s0, t1, 907
                  xori         a2, s1, -1621
                  sub          zero, a4, s11
                  fmv.x.w      s2, fs4
                  ori          a2, ra, -1338
                  fclass.s     t1, ft11
                  sltu         s10, zero, sp
                  fcvt.w.s     s8, ft11
                  slt          s11, a7, a7
                  srai         a1, gp, 20
                  or           a3, t6, a5
                  srai         s3, t2, 9
                  fdiv.s       fa7, fs7, ft5
                  flt.s        t0, ft8, ft11
                  divu         s6, sp, s10
                  remu         t2, tp, s0
                  sub          t1, s2, s8
                  sltiu        a2, s4, 261
                  mulh         zero, s11, s7
                  div          t3, s7, t2
                  fdiv.s       fa6, ft8, fs9
                  fmax.s       fs9, fs7, fs8
                  fcvt.s.wu    fs11, s3
                  mulh         t4, s4, s9
                  add          a4, a6, t1
                  mulhsu       ra, s11, t6
                  and          s1, s4, s3
                  fsgnjn.s     fs7, fa5, fs8
                  lui          a5, 984046
                  fcvt.w.s     s9, fa6
                  fmax.s       fa3, ft11, fa7
                  addi         s2, t4, 607
                  mulhsu       ra, a6, s7
                  rem          s3, s1, a5
                  fmul.s       ft0, ft5, fs1, rtz
                  sra          s4, s0, s2
                  mul          s1, s6, a4
                  sub          t2, s4, a4
                  sll          a2, t6, s10
                  fmul.s       ft4, fs8, fa5, rtz
                  auipc        a3, 832457
                  slti         s9, s10, 1646
                  fmax.s       fa5, fs11, ft4
                  fsgnjn.s     ft8, ft0, fa0
                  fcvt.w.s     t0, fs11, rdn
                  sub          t4, s1, t4
                  fclass.s     t2, ft11
                  fclass.s     tp, fa7
                  sltiu        a4, a3, -1242
                  and          gp, t1, s6
                  sltu         ra, sp, t6
                  auipc        tp, 1261
                  fcvt.w.s     s2, ft9, rtz
                  ori          a2, a2, -1033
                  fmv.x.w      t0, ft11
                  andi         s9, a6, -1208
                  lui          sp, 285489
                  fmax.s       fa2, ft1, ft2
                  rem          t2, a0, a1
                  fmv.w.x      fs0, s1
                  fdiv.s       fa7, ft7, fa6, rmm
                  sltu         zero, a6, s11
                  nop
                  mulh         s9, s11, gp
                  fcvt.wu.s    s2, fs4
                  sra          gp, s8, s6
                  mulhu        a3, a4, t0
                  mulhsu       s0, s10, a5
                  fadd.s       fa1, ft8, fa7, rdn
                  slli         a2, t3, 4
                  mulhu        s5, s6, t2
                  xori         s4, s11, -383
                  fmv.w.x      fs11, s5
                  mulhsu       s9, t6, s4
                  and          t1, t1, s10
                  flt.s        t1, ft2, fs1
                  fcvt.wu.s    s2, fa3, rup
                  flt.s        s7, ft9, ft9
                  add          t4, s5, t2
                  remu         ra, t3, s3
                  fcvt.w.s     s8, ft6
                  addi         s7, zero, -1980
                  fsgnjx.s     fs7, ft3, ft9
                  srli         a2, s8, 31
                  divu         s0, s2, t6
                  slli         t1, ra, 12
                  div          t2, a6, zero
                  fcvt.w.s     a5, fa3, rne
                  auipc        s10, 545105
                  fmin.s       fa3, fs3, ft5
                  nop
                  xor          s4, s11, s2
                  ori          t4, a0, 2010
                  feq.s        zero, fa5, fa2
                  fsqrt.s      ft2, ft3, rup
                  addi         t6, s0, 828
                  fcvt.w.s     a4, fs4, rtz
                  slti         a3, s4, -1788
                  and          s1, a0, s8
                  fsgnjn.s     fa4, ft3, ft4
                  fcvt.w.s     a1, fa5, rdn
                  fsgnj.s      fs7, fs7, ft1
                  fsgnjn.s     ft0, ft1, ft7
                  divu         s11, s4, t2
                  mulhsu       t1, s0, a6
                  divu         s6, a4, gp
                  fmin.s       ft4, fa5, fs6
                  feq.s        sp, ft3, ft11
                  div          t5, s10, a6
                  ori          t0, a7, -1196
                  srl          sp, s0, a1
                  xor          a3, a1, t1
                  div          s6, a2, t3
                  fcvt.s.w     fa7, s6, rdn
                  fmax.s       fa1, fa0, ft1
                  sub          a1, s2, s10
                  fsgnjx.s     fs8, ft6, fs5
                  fdiv.s       fs11, fa2, ft9
                  fmv.x.w      t0, ft0
                  fsub.s       fa2, fs9, ft4, rup
                  srai         s8, a0, 1
                  fsqrt.s      ft1, ft0, rtz
                  andi         sp, gp, -1461
                  xori         gp, zero, -139
                  and          s11, t0, a2
                  srli         s3, a4, 28
                  lui          s9, 475145
                  srl          s6, t3, a2
                  xori         s1, ra, 293
                  fcvt.s.wu    fs6, s8
                  fadd.s       fs3, fs6, fs10, rdn
                  flt.s        gp, ft6, fs6
                  sub          a4, tp, s0
                  fsgnjx.s     fa0, fs6, fs4
                  fdiv.s       fs7, fa4, fs9, rup
                  add          a2, t2, t3
                  slli         s0, a2, 8
                  sltiu        s2, a6, 22
                  add          s1, gp, a2
                  rem          t2, s1, s9
                  remu         t5, t5, s1
                  fsgnj.s      fs11, fs9, ft6
                  sltu         s4, t6, s2
                  remu         t0, t2, t0
                  and          zero, s9, t1
                  nop
                  fmv.x.w      ra, ft3
                  mulh         a1, s4, gp
                  fsgnj.s      ft10, fa7, ft4
                  mulhu        ra, t2, sp
                  fmv.x.w      s4, ft10
                  lui          t2, 340628
                  remu         t2, a1, zero
                  fmax.s       fs1, fs8, fa2
                  lui          s0, 897031
                  feq.s        t5, fs8, ft3
                  fsgnjx.s     fa6, fs11, fs0
                  fsgnjx.s     ft11, fs6, fs0
                  sll          s3, t4, a4
                  remu         gp, zero, a4
                  mulhsu       sp, tp, a2
                  fmv.x.w      ra, fs11
                  remu         a5, a0, a1
                  rem          t4, a1, t3
                  slli         a4, a7, 16
                  fsgnj.s      ft2, fs2, fs7
                  sltu         t2, zero, a4
                  fmv.x.w      t1, fs10
                  mul          s3, sp, s2
                  fclass.s     s2, fs9
                  flt.s        s5, fs9, fa1
                  divu         s2, s10, a1
                  div          a3, a0, t3
                  fcvt.wu.s    t2, fa7, rmm
                  fsqrt.s      fa7, fs8, rtz
                  add          t6, sp, a2
                  sub          t6, a2, a2
                  fsqrt.s      fs5, fa2, rne
                  and          a1, s9, sp
                  fmv.x.w      s10, ft9
                  fsgnjx.s     fs6, ft5, ft3
                  flt.s        t1, fs10, fa6
                  rem          s2, s9, a6
                  slt          a3, sp, sp
                  slt          s6, a4, s11
                  slt          t3, a3, a7
                  srli         sp, s10, 13
                  fmul.s       ft0, fs9, ft1, rtz
                  rem          t5, s8, tp
                  xor          a1, a3, a7
                  fmax.s       fs10, fs6, ft10
                  rem          t1, t2, zero
                  slt          s2, a6, a4
                  fclass.s     s4, fs5
                  nop
                  sltiu        a5, a0, -113
                  addi         t1, t0, 419
                  srli         s1, s4, 26
                  sra          gp, t1, a5
                  fcvt.w.s     gp, fa5, rmm
                  fcvt.wu.s    ra, fa6
                  fcvt.s.wu    fs11, gp, rup
                  fsgnjn.s     fs0, fs9, fs10
                  sltiu        s6, a3, -1049
                  divu         t3, t4, gp
                  add          t3, tp, s4
                  mulhu        s4, s10, s10
                  and          s11, a2, t2
                  fdiv.s       ft10, fs7, ft0
                  rem          t6, a1, tp
                  fcvt.s.wu    ft7, tp, rdn
                  andi         s3, sp, 1481
                  fle.s        a5, ft10, fs2
                  slli         s9, t4, 16
                  mulh         s5, zero, gp
                  add          t4, t2, t2
                  andi         a4, a7, 797
                  div          s4, a2, s9
                  slli         s11, s10, 10
                  fclass.s     a4, fs11
                  fsub.s       fs5, ft8, ft0
                  fmv.w.x      fa1, s11
                  fadd.s       ft7, fa7, ft4
                  auipc        s4, 21987
                  fsqrt.s      fs7, fs2, rmm
                  fmul.s       ft6, fa5, ft10, rtz
                  or           a5, s0, a1
                  ori          t3, a0, 788
                  rem          t6, s10, s7
                  auipc        s11, 543015
                  and          ra, s4, a5
                  lui          gp, 474510
                  xori         t4, s8, -89
                  mulhsu       a1, zero, t3
                  slti         a1, t6, -467
                  fsgnj.s      fs8, fs8, fs9
                  div          a5, s2, t0
                  mulhsu       s2, s3, s10
                  lui          s4, 50644
                  and          t0, a3, a1
                  srai         a1, a0, 5
                  remu         t0, a0, t6
                  sll          s2, a1, ra
                  srli         t5, t0, 2
                  fdiv.s       ft6, fs1, fs5, rtz
                  fsub.s       fa6, fs4, ft7, rup
                  xori         s1, zero, 377
                  and          s9, a7, s4
                  remu         zero, a3, t6
                  fmin.s       ft3, ft8, ft6
                  sra          t3, t4, t3
                  srl          s5, tp, s1
                  fmv.w.x      fs8, gp
                  add          s10, t3, a6
                  slti         sp, ra, -875
                  slli         s3, gp, 11
                  slt          t0, t5, s5
                  srli         sp, tp, 29
                  auipc        a3, 37688
                  slti         t3, s3, 1347
                  sltu         s3, sp, s1
                  rem          s5, t3, t1
                  sltu         s10, t4, t2
                  mulhu        s7, s9, s7
                  xor          s9, a7, t1
                  remu         t6, a3, a7
                  srl          gp, s2, t6
                  sll          s5, t4, s3
                  slli         sp, s0, 25
                  nop
                  fcvt.wu.s    s11, fa2
                  mul          t1, s3, s11
                  div          t3, a5, a0
                  fclass.s     t2, fs5
                  fmin.s       fa2, fa2, fs1
                  divu         zero, t3, s4
                  fsgnj.s      ft1, fs9, fa4
                  fle.s        s7, fa7, ft7
                  auipc        t0, 400639
                  and          a2, s7, a0
                  slt          zero, a7, s0
                  slti         t3, gp, -1799
                  fmv.x.w      s2, fa2
                  fsgnjx.s     fa0, ft0, fs6
                  fmin.s       ft1, fa3, ft10
                  fmin.s       ft5, fs1, fs8
                  mulhu        s3, s7, s7
                  sub          a4, t1, s5
                  slti         t1, s3, 1862
                  mulhu        s1, t2, a4
                  fdiv.s       fa3, ft6, ft10, rmm
                  sub          a5, t0, s6
                  srl          a5, t1, t4
                  sltu         t2, a4, a0
                  mulhsu       s7, zero, gp
                  andi         s7, s7, -1301
                  div          s1, t0, s7
                  mulhu        s2, s10, s1
                  fdiv.s       fs2, fs0, fa5, rup
                  feq.s        sp, fs6, fa4
                  sll          t4, s6, t4
                  nop
                  srl          t4, s3, sp
                  div          t2, a3, s0
                  srl          s5, a5, s8
                  fmin.s       ft4, fa2, ft10
                  fmv.x.w      t6, ft8
                  lui          a3, 992043
                  sltiu        t6, a7, 77
                  fsqrt.s      fa5, ft2
                  fclass.s     s4, fa2
                  fsqrt.s      fs0, ft1
                  srai         a5, t3, 10
                  fsgnjx.s     fa7, fa6, ft0
                  fsgnjn.s     fs1, fs8, ft2
                  divu         s1, a6, s0
                  mulhu        s1, a6, s7
                  fmax.s       ft1, fa4, ft0
                  srai         t4, a7, 17
                  fcvt.s.wu    ft10, tp
                  sll          s10, s11, s2
                  mulhu        t4, t6, t3
                  mulhu        t3, a6, s11
                  sub          tp, ra, t5
                  rem          t0, t5, s5
                  mulh         s0, s3, a2
                  fsqrt.s      fa3, fs6, rmm
                  mulh         tp, s5, t3
                  fcvt.wu.s    t1, fa1, rne
                  fsqrt.s      ft2, fa7, rtz
                  fcvt.wu.s    s10, fs4
                  xori         ra, ra, 406
                  fcvt.w.s     a4, ft4
                  srl          s4, a3, s2
                  mulh         s2, a6, s2
                  fsub.s       fa1, fs8, fs2, rmm
                  srai         a4, s2, 18
                  fdiv.s       fs7, ft10, ft10
                  sltu         zero, a5, a6
                  fmv.x.w      t1, fs1
                  rem          s8, s9, a5
                  or           t5, a0, a1
                  auipc        s8, 88195
                  fadd.s       fs3, fs8, fs0
                  fsub.s       fa6, fs8, ft11
                  fmv.w.x      fa0, s4
                  xor          sp, t0, s2
                  fle.s        a4, fs2, ft0
                  fdiv.s       fs3, ft8, ft3, rdn
                  fadd.s       fs1, ft7, fa1
                  lui          s10, 467274
                  fcvt.wu.s    a5, fa3, rne
                  fcvt.w.s     s0, ft2, rne
                  fsgnjn.s     fs5, fs11, fs10
                  div          tp, a2, s0
                  fcvt.s.wu    ft10, t0
                  auipc        s8, 258092
                  fadd.s       fa7, fa5, ft6, rdn
                  mulhu        s0, t1, a5
                  nop
                  sra          ra, a5, a7
                  srli         t2, s3, 22
                  add          zero, t1, a0
                  add          a1, t6, t5
                  fcvt.s.w     ft3, ra
                  fdiv.s       ft5, fs1, fa6, rtz
                  feq.s        s2, fa1, ft0
                  fadd.s       fa2, fa6, fs10
                  fsgnjx.s     fa4, ft7, ft4
                  fdiv.s       fs2, fs8, ft5, rne
                  fmv.w.x      fs11, t3
                  rem          s7, gp, s10
                  fmax.s       ft4, fa7, ft2
                  sltiu        s1, s2, -561
                  mul          t3, s4, a7
                  fadd.s       fs7, fs4, fa5
                  fmax.s       ft1, fa2, ft4
                  fsgnjx.s     ft1, fa4, fa4
                  add          a3, a1, s10
                  fsqrt.s      fa2, fs5
                  sll          s7, t4, a3
                  lui          s3, 62922
                  xor          a4, sp, t5
                  feq.s        s9, fa7, ft11
                  fmul.s       ft10, fa6, fs0
                  auipc        a4, 855676
                  fmv.w.x      fs0, s2
                  fadd.s       fs4, ft0, fa3
                  sra          t1, s0, a5
                  fsub.s       ft9, fs6, fs11, rne
                  mul          a2, s8, t1
                  fsqrt.s      fa5, fa3
                  fcvt.w.s     t1, ft7, rdn
                  slli         tp, s10, 18
                  mul          s8, s5, a0
                  fsgnjx.s     fa4, fa5, ft5
                  sll          ra, gp, sp
                  slli         s4, t5, 30
                  fmv.x.w      s6, fs9
                  flt.s        s6, ft7, ft4
                  fcvt.wu.s    t2, ft9
                  andi         tp, s2, 542
                  fcvt.wu.s    s11, fs2
                  fsqrt.s      fa5, ft7
                  fmul.s       fs4, fa2, fs5
                  slt          s1, s6, s3
                  remu         t4, s11, s5
                  ori          s8, s0, 356
                  fsub.s       fs1, ft5, ft6, rup
                  mulhsu       s10, t0, a5
                  fmul.s       ft5, ft0, fs3
                  fsqrt.s      fs10, fs11
                  fadd.s       fa3, ft8, ft6
                  nop
                  feq.s        s11, fs0, fs4
                  flt.s        t4, fa7, ft2
                  sll          a5, gp, t3
                  fsqrt.s      fs9, fs2
                  fadd.s       fa7, ft5, fs0, rdn
                  slti         a1, s6, 555
                  slti         t6, sp, -1429
                  xori         s9, s10, -1934
                  lui          s10, 424604
                  mul          a5, zero, t6
                  ori          zero, t1, 1130
                  lui          zero, 978841
                  xor          sp, a5, t4
                  fsub.s       ft8, fa3, ft8
                  div          s0, t3, a7
                  ori          t5, s4, 681
                  fmax.s       fs8, ft8, ft1
                  sll          s8, s11, s2
                  fcvt.s.wu    fa2, s4, rup
                  sll          gp, t0, s11
                  sll          a4, a5, ra
                  add          s5, s0, t5
                  divu         t6, zero, t5
                  flt.s        s9, fa7, ft0
                  fcvt.s.wu    ft11, a7
                  fmv.w.x      fa4, t3
                  fmax.s       fs7, fa5, fa4
                  fadd.s       fs10, fs0, ft3, rtz
                  sltiu        t3, a5, 345
                  srai         t0, s8, 19
                  feq.s        s1, fs8, fs5
                  flt.s        a1, fs6, ft9
                  sltu         t2, t4, s2
                  xor          s3, s3, ra
                  fle.s        s2, ft6, fa6
                  fcvt.wu.s    ra, ft11
                  slti         s0, t2, -1981
                  fadd.s       fs7, fa4, fa2
                  nop
                  fadd.s       ft1, fa1, fa6
                  mulh         s7, ra, zero
                  flt.s        s4, fs6, ft0
                  fmin.s       ft0, fs11, ft3
                  ori          t5, s7, -2047
                  fdiv.s       ft8, fs3, fs4
                  div          t1, t6, ra
                  fadd.s       ft6, fa7, fa4, rtz
                  fle.s        a4, ft8, ft11
                  fsqrt.s      ft0, fs8
                  and          t1, s5, sp
                  fsub.s       ft0, fs5, fs9, rdn
                  mulhu        s4, s10, a7
                  fsgnjn.s     fs0, fs4, fs0
                  fmul.s       fa3, fs7, fa0
                  srli         gp, s4, 3
                  feq.s        s8, fs2, fa7
                  divu         s0, sp, s7
                  mulhsu       tp, a1, a2
                  mulh         t2, a1, s10
                  fcvt.s.wu    ft4, gp
                  fsub.s       fs2, fs8, ft11, rtz
                  auipc        a1, 458489
                  fcvt.s.w     fa6, zero
                  fmin.s       fs3, ft4, fs2
                  or           sp, s9, t5
                  mulhsu       s1, s0, a6
                  fcvt.wu.s    s3, fs8, rdn
                  fmin.s       ft1, ft0, fs8
                  fmin.s       fs6, ft9, fa7
                  fmin.s       fa1, fs1, ft0
                  flt.s        s0, ft3, fa1
                  fsqrt.s      ft9, ft10, rtz
                  srai         s5, s2, 22
                  sub          s2, a1, tp
                  sra          a2, t2, s1
                  feq.s        s7, fa4, fs7
                  fsgnjn.s     fs6, fa4, fa3
                  xori         s2, s4, -2021
                  remu         s4, s5, s2
                  fle.s        s5, fa3, fa2
                  fcvt.wu.s    s7, ft1, rmm
                  mul          t0, s2, s8
                  div          s1, zero, t2
                  srai         gp, s10, 21
                  slli         s1, a2, 14
                  srl          a3, t3, a4
                  flt.s        s5, ft11, fs3
                  fle.s        s6, fa4, ft2
                  nop
                  fmax.s       fa3, ft8, ft2
                  mulhu        zero, a5, a0
                  addi         t3, t2, -1159
                  or           zero, s9, s2
                  and          s2, a5, s6
                  divu         s4, s3, s0
                  fsgnj.s      fs1, fa2, fa1
                  fle.s        s2, ft4, fs11
                  fclass.s     s6, ft3
                  fmv.x.w      gp, fs0
                  fmin.s       ft8, fa1, fa7
                  fsgnjx.s     fs11, fs4, fs6
                  fdiv.s       ft9, fs1, fs0
                  fadd.s       fa5, fs0, fa7
                  mul          s8, a2, s9
                  xor          t2, s6, s3
                  auipc        s6, 754976
                  srai         zero, a2, 18
                  xor          a5, t1, s1
                  sll          s4, s2, s4
                  sll          s10, t0, s0
                  mulh         s3, t3, a2
                  fcvt.s.wu    fa1, zero
                  fsgnj.s      ft7, fs4, ft6
                  add          s0, s11, t2
                  fmin.s       fa4, ft8, fs2
                  fmv.w.x      fs8, a2
                  lui          t5, 542998
                  mulhsu       s2, a2, s11
                  auipc        t4, 425869
                  mulhsu       gp, s11, tp
                  mulhu        tp, t5, s5
                  fmax.s       fs6, fs4, ft9
                  fmin.s       fa2, fs2, fs6
                  feq.s        s10, ft0, fa4
                  rem          s3, s5, a7
                  fcvt.s.wu    ft5, s1, rmm
                  nop
                  fsgnj.s      fs3, fs4, fs5
                  fcvt.w.s     a1, ft10, rdn
                  rem          t0, a1, a2
                  mulhu        a4, ra, a7
                  mul          t5, s5, s7
                  and          s0, a0, s8
                  fmax.s       fa4, fa0, ft2
                  fsgnjn.s     ft10, ft11, fa1
                  remu         s4, t1, s9
                  xor          s1, s0, s7
                  divu         gp, s3, a4
                  and          t3, s2, tp
                  mulhsu       zero, s2, t3
                  and          s2, t3, ra
                  fcvt.s.w     fs5, a3
                  and          t6, s8, a3
                  sltiu        s4, s3, -1447
                  slt          s9, s9, s10
                  fmin.s       fa2, ft4, ft5
                  lui          s1, 494341
                  xor          a3, a3, s9
                  flt.s        t6, fs8, ft1
                  addi         tp, ra, 241
                  fadd.s       fa2, fs2, ft7, rne
                  mulhu        t6, sp, s2
                  nop
                  fsgnjx.s     ft10, fs2, fs5
                  lui          ra, 459727
                  fmul.s       fs0, fa1, fs1
                  lui          ra, 491317
                  fmv.x.w      s0, ft6
                  and          a1, a0, a0
                  fadd.s       ft1, fs7, fs8
                  fadd.s       fa1, ft10, fs1
                  nop
                  srai         ra, t4, 13
                  slti         a1, s1, -1279
                  xor          a1, s4, t3
                  xori         t5, s3, 893
                  fmul.s       fa0, ft1, fs9, rup
                  sll          t5, zero, a2
                  fmin.s       fs0, ft11, fs6
                  fsgnj.s      fs1, fs1, ft0
                  srli         t6, t4, 7
                  fmul.s       ft3, fs0, fs1
                  slli         ra, sp, 4
                  fmv.x.w      t0, ft1
                  fsgnj.s      ft0, fs8, fs4
                  fcvt.w.s     t3, fa0
                  fcvt.wu.s    s10, fa7, rne
                  fsub.s       fs6, fs6, fa2, rdn
                  and          t3, tp, a4
                  fsqrt.s      fs7, ft5
                  slt          zero, a3, s8
                  or           s9, a5, a2
                  srli         s8, tp, 5
                  srl          a2, t5, a2
                  divu         gp, tp, s11
                  fcvt.wu.s    gp, fa1
                  mul          a3, a5, a4
                  remu         s4, a2, t4
                  sra          zero, t4, s9
                  feq.s        t3, fa2, ft7
                  fmv.w.x      fa7, s7
                  fclass.s     a1, ft9
                  mulhsu       s1, s2, a6
                  fsgnj.s      ft11, fa4, fa2
                  feq.s        sp, ft10, fs2
                  fmax.s       fs5, ft2, ft2
                  fcvt.s.w     fs7, t3, rup
                  divu         s0, s8, t4
                  fsub.s       fs10, ft8, fs11, rtz
                  fcvt.w.s     s10, fa3
                  ori          t6, t4, 1586
                  and          t1, s7, t5
                  sll          s2, a0, gp
                  fcvt.w.s     t1, fs4, rmm
                  fsgnjx.s     ft1, fs1, fa2
                  nop
                  fdiv.s       ft11, fs11, ft7
                  sltu         a5, tp, a4
                  fcvt.wu.s    a1, ft9
                  lui          s10, 351284
                  sll          s6, a3, s8
                  srl          s10, t2, s0
                  mul          s4, a0, a6
                  fcvt.w.s     a2, ft8
                  fsqrt.s      fa7, ft5
                  lui          a5, 144499
                  sub          s5, s8, s0
                  fle.s        s4, ft5, fs0
                  fmv.x.w      s8, fs5
                  add          s0, zero, t3
                  sltu         gp, sp, s11
                  srai         s11, s9, 5
                  fsgnj.s      fs9, ft10, fs2
                  ori          s0, s5, -1072
                  nop
                  fdiv.s       fs5, ft7, ft1
                  slli         t6, a4, 16
                  fcvt.s.wu    ft4, s1, rdn
                  fle.s        s1, fs11, fs7
                  slli         ra, a5, 12
                  addi         s11, s10, 1637
                  slt          gp, s1, s4
                  auipc        t2, 818020
                  sub          a1, a7, a1
                  fsgnjn.s     ft11, fs1, fs9
                  fmul.s       ft0, fa0, fs6, rmm
                  divu         s0, ra, t5
                  fmv.w.x      fa1, a0
                  sltiu        t5, s11, 184
                  fmv.x.w      s3, fa5
                  fcvt.wu.s    t0, fa1, rdn
                  fle.s        t6, fs3, ft9
                  addi         s4, s11, -1186
                  andi         tp, tp, 281
                  and          a3, s7, s4
                  fmin.s       fa6, fa7, fs3
                  mul          a5, s10, zero
                  feq.s        a1, fs7, fa1
                  and          s1, t0, s2
                  slli         a3, a1, 25
                  slli         a4, a4, 31
                  add          s5, s5, s9
                  xori         tp, t5, 1287
                  and          s11, s10, s3
                  sltu         t6, tp, t6
                  fclass.s     t4, ft5
                  sltu         a5, t1, s8
                  flt.s        s0, ft11, ft9
                  slt          s4, s9, s0
                  xori         t3, a4, 360
                  sltiu        gp, t2, 1161
                  fcvt.w.s     t3, ft10, rup
                  lui          zero, 107658
                  divu         tp, s11, s6
                  fdiv.s       fs10, ft11, ft10
                  fsgnjn.s     fa7, fa3, fa1
                  nop
                  auipc        s3, 797023
                  fsqrt.s      fa7, fs2, rmm
                  fle.s        s5, fs9, fs11
                  flt.s        t4, ft4, fs10
                  fclass.s     s11, ft4
                  srai         s11, s0, 3
                  andi         gp, t0, -1146
                  remu         a4, s1, s7
                  divu         t6, t2, s3
                  auipc        s1, 960614
                  mulh         tp, s1, a4
                  mulhsu       ra, t0, s9
                  nop
                  fle.s        s1, fa1, ft7
                  fsgnjx.s     ft1, ft4, fs10
                  fmv.w.x      ft7, s5
                  andi         s11, a1, 1638
                  divu         a1, s7, t4
                  mul          s7, sp, s1
                  slli         s1, a3, 9
                  srai         sp, s3, 14
                  auipc        s2, 650005
                  fmv.w.x      fs3, a4
                  fmul.s       fa1, ft10, ft0
                  xori         t4, a7, -34
                  fclass.s     s1, ft3
                  add          s9, t6, t2
                  or           s10, t5, a0
                  auipc        s3, 626986
                  fsqrt.s      fa2, ft10
                  slli         s4, s11, 31
                  mul          s5, s8, a7
                  fclass.s     a1, fs11
                  fmv.x.w      s7, fa1
                  mulhsu       ra, s0, s4
                  fadd.s       fs4, ft4, ft3, rne
                  fmv.w.x      fs11, a0
                  sra          t5, a6, a6
                  fsub.s       ft7, fs11, fs9, rup
                  fsub.s       fs11, ft1, ft9, rdn
                  mulh         s1, s6, a1
                  sll          a3, s10, tp
                  fcvt.w.s     a4, fs10, rdn
                  fmul.s       fs10, fs3, ft11
                  remu         gp, sp, a5
                  feq.s        t0, ft1, ft4
                  lui          s8, 213241
                  feq.s        s3, fs6, fa5
                  fsub.s       ft11, fs5, ft10, rdn
                  fmv.x.w      tp, ft8
                  sub          a4, t5, s5
                  add          a3, t2, s10
                  fmin.s       fs6, ft5, ft11
                  fsqrt.s      fs5, ft5
                  div          t6, a4, t1
                  srl          t2, s8, a5
                  srl          t6, t6, tp
                  slti         t5, s4, -1564
                  fcvt.w.s     s3, ft9
                  lui          s5, 766871
                  slti         t3, a1, -1063
                  div          s5, s6, a0
                  fmul.s       ft11, ft5, fa7, rne
                  fsgnjx.s     ft0, ft9, fa0
                  lui          a1, 640933
                  fdiv.s       fs0, ft2, fs0, rne
                  fcvt.w.s     t4, fs9, rup
                  auipc        gp, 202886
                  fdiv.s       fa2, ft2, fa5, rdn
                  fcvt.wu.s    s4, ft0, rmm
                  fdiv.s       fs5, fs2, ft0
                  fcvt.wu.s    s10, ft9
                  mulhsu       zero, a2, a5
                  fclass.s     t2, ft9
                  slti         s7, zero, -579
                  fcvt.s.w     fa1, t0
                  or           gp, s6, s0
                  fmin.s       ft11, ft3, fa6
                  sltiu        s1, a1, 1801
                  fdiv.s       ft1, ft2, fs3
                  add          s4, s8, zero
                  mulh         t4, s5, s11
                  fdiv.s       fs11, ft0, fs1
                  ori          t4, t0, -1511
                  fmax.s       ft7, fs0, fa6
                  slli         s7, a1, 17
                  xori         s11, a2, -512
                  addi         a3, s6, 347
                  sra          t2, s9, s2
                  sltiu        s4, a0, 267
                  fcvt.wu.s    t3, fs5, rup
                  and          a3, s10, t2
                  fcvt.wu.s    t6, ft3
                  divu         s3, t4, t2
                  mulhu        sp, t2, a1
                  and          t3, s2, t5
                  mul          t6, a4, s0
                  add          a1, ra, a0
                  mul          gp, s4, s9
                  fadd.s       ft1, fa2, ft8
                  fsgnjx.s     fa6, fs0, fa0
                  mulhsu       a2, t3, a0
                  ori          a2, s6, -1300
                  fcvt.wu.s    s1, fa6, rtz
                  fsgnj.s      ft4, ft8, fa1
                  auipc        s4, 357139
                  fcvt.wu.s    a1, fa2
                  fcvt.w.s     tp, ft10, rtz
                  fsqrt.s      fa4, fa4, rtz
                  rem          s0, s0, s1
                  auipc        s0, 512800
                  or           t2, gp, s3
                  feq.s        a2, fs9, ft0
                  or           a1, t5, t6
                  fclass.s     s2, fs0
                  lui          a2, 492992
                  sra          t2, zero, s8
                  slli         sp, a2, 10
                  fle.s        s1, fa3, fs6
                  div          ra, t5, t3
                  fcvt.w.s     a3, fs0, rdn
                  slti         s11, a3, -1092
                  fsgnjx.s     fa0, fs6, ft3
                  xori         t5, s11, -1594
                  feq.s        zero, ft10, fa3
                  fsgnjx.s     fs5, fa2, ft2
                  fsgnjn.s     fa5, ft2, fa3
                  xor          s7, gp, t6
                  fclass.s     s3, ft3
                  mulh         s7, a4, s11
                  slti         s4, t1, -1016
                  andi         a3, s7, 90
                  or           a3, a7, s11
                  add          t5, s7, s8
                  mulh         s1, s4, gp
                  fmul.s       ft5, ft3, fs7
                  remu         t5, s9, tp
                  fmv.x.w      s7, ft2
                  fadd.s       ft8, ft1, ft8
                  nop
                  mulh         gp, t1, t5
                  sra          s0, s1, a3
                  rem          s4, s8, s9
                  fadd.s       fs0, ft6, fs0, rtz
                  xori         a1, tp, -375
                  mulhsu       ra, t5, ra
                  srl          gp, s11, s0
                  sll          ra, gp, s6
                  slli         a2, s9, 15
                  mulhsu       s7, s2, a3
                  fmin.s       fs3, ft1, ft1
                  fmv.x.w      s10, fs2
                  rem          s3, s8, sp
                  auipc        t4, 1034873
                  fcvt.w.s     s9, ft10
                  fle.s        a3, fs2, fa5
                  divu         s1, s11, a4
                  feq.s        a2, fs6, ft0
                  xor          s10, gp, t4
                  mul          s7, t0, ra
                  fcvt.s.w     ft5, a0
                  sltiu        a1, tp, 564
                  srai         t5, a1, 23
                  slli         s9, s0, 29
                  mul          s6, s5, s0
                  fcvt.s.w     ft8, ra, rtz
                  addi         s3, t3, -1714
                  flt.s        zero, fs2, ft0
                  fmv.x.w      s1, ft0
                  fle.s        a3, fs5, ft10
                  fle.s        s9, ft11, fs6
                  fmv.x.w      t3, ft9
                  nop
                  fcvt.w.s     t4, ft1
                  fclass.s     sp, fs8
                  mulh         t4, a7, t4
                  sub          t6, a7, s11
                  mulhu        a1, s0, t1
                  fdiv.s       ft3, fa2, ft9, rdn
                  fclass.s     a2, fs0
                  srli         a2, s0, 11
                  nop
                  sll          ra, s10, s3
                  xori         s9, t6, -435
                  sll          a1, s5, s7
                  mulhsu       t2, t0, t5
                  divu         zero, s2, s8
                  sll          s7, a4, s10
                  mulh         zero, a2, gp
                  xor          s7, a6, s1
                  rem          s7, gp, t2
                  fsqrt.s      ft5, fa5, rdn
                  fcvt.wu.s    sp, fa7, rup
                  addi         sp, a4, 1787
                  sub          a1, a2, t5
                  fcvt.wu.s    a1, fs3, rne
                  or           s3, s0, t2
                  sltiu        s8, a7, -2043
                  lui          t1, 288132
                  remu         s11, t0, s2
                  fcvt.s.wu    fs8, s11
                  srli         t0, a5, 30
                  auipc        zero, 1032268
                  auipc        zero, 875006
                  sltiu        a5, s3, 2038
                  remu         s7, s7, t1
                  fmul.s       ft6, fa4, ft11
                  fmax.s       fa1, fa0, fs1
                  mul          sp, t2, tp
                  xor          gp, t2, a1
                  fmv.w.x      ft3, a2
                  fsgnjx.s     ft10, ft6, fs5
                  fmv.w.x      fs3, t0
                  auipc        s7, 470375
                  addi         t5, a3, 473
                  fadd.s       ft2, ft0, fs10
                  fmv.x.w      s10, fs2
                  andi         a3, a3, -2048
                  feq.s        s11, ft4, fs3
                  addi         a1, s5, -851
                  srl          sp, a7, t5
                  divu         s9, a1, s3
                  fdiv.s       fa1, ft2, ft9
                  mulhu        a2, s2, s10
                  fcvt.s.w     fa4, s6
                  sltu         tp, zero, ra
                  slli         zero, a3, 7
                  flt.s        gp, ft9, fs9
                  feq.s        ra, fa4, fs3
                  div          s4, t1, s2
                  rem          tp, s9, s9
                  fsqrt.s      fs3, fa1, rtz
                  sltu         t0, a7, s5
                  slt          s8, t6, ra
                  fcvt.s.w     fs3, a1, rdn
                  xori         s10, t6, 500
                  fclass.s     s7, ft8
                  fmv.x.w      s10, fs7
                  nop
                  fmin.s       fa7, fs8, fs11
                  addi         sp, s10, -667
                  rem          sp, s4, t0
                  fcvt.w.s     s1, fa3, rtz
                  fsqrt.s      ft10, fs7, rtz
                  nop
                  fmin.s       ft9, fa3, fs3
                  slt          s10, s5, t2
                  feq.s        s0, fa4, ft1
                  srli         t5, a2, 14
                  fclass.s     t0, fa0
                  auipc        t3, 650554
                  div          s8, t4, t2
                  fmin.s       fs1, ft9, fa4
                  mulhu        s2, t5, ra
                  mulhsu       sp, s10, ra
                  fmul.s       ft6, fa2, fs3, rne
                  feq.s        zero, ft3, fs5
                  fsgnj.s      fs7, fa1, fs8
                  fcvt.s.w     ft7, gp
                  fdiv.s       ft9, fa6, fa3
                  fcvt.w.s     t0, fa3
                  slti         t3, t4, 1761
                  ori          s9, t3, 427
                  ori          a4, zero, 1481
                  fcvt.s.w     fs6, gp
                  slli         s5, a5, 23
                  flt.s        s7, ft6, ft0
                  fclass.s     s0, fa0
                  ori          a1, s11, -841
                  fcvt.s.w     fa5, t4, rmm
                  fclass.s     s2, fs3
                  fmv.x.w      zero, fs4
                  andi         ra, a1, -2043
                  andi         s4, s9, -919
                  remu         t0, tp, a6
                  fmin.s       ft5, ft9, fa4
                  fmax.s       fs3, fa3, fs7
                  fsqrt.s      fs1, fa6
                  mulh         a3, s5, s7
                  slti         s6, s5, -1353
                  fcvt.wu.s    s0, ft1, rne
                  flt.s        a2, ft11, ft3
                  srai         t2, s6, 22
                  fcvt.s.w     ft6, s7, rmm
                  fmin.s       ft5, ft3, fa2
                  sub          s5, t5, s8
                  mulh         s4, a0, t5
                  fmv.x.w      s5, fs3
                  srli         a5, t6, 16
                  nop
                  fcvt.s.w     fa3, t4, rdn
                  sra          s1, tp, s2
                  sltu         s4, a7, a7
                  ori          s4, a0, -221
                  srai         s6, s7, 31
                  slli         t3, s11, 10
                  sltu         s4, t2, t2
                  xor          s10, s9, s7
                  flt.s        t0, fs9, fs9
                  srai         s6, zero, 24
                  fclass.s     a1, fs3
                  xori         s0, t6, -188
                  xor          a4, a0, tp
                  sltiu        a1, t2, 1135
                  and          t3, t5, t4
                  addi         a2, a7, -1665
                  lui          s11, 635151
                  fcvt.w.s     a1, ft11
                  fmv.w.x      fs6, a5
                  fmax.s       fs11, fa2, ft4
                  fsgnjx.s     fs2, ft4, fs3
                  nop
                  fsgnj.s      fa7, fa1, ft6
                  fsgnj.s      fa7, fs7, ft3
                  sltiu        gp, t2, -335
                  mulhu        s2, t5, s8
                  fmul.s       ft5, fs7, fs2
                  sltiu        t1, s1, -1389
                  andi         s3, a2, -142
                  sub          s8, t6, zero
                  slli         s6, t0, 10
                  fcvt.s.w     fa1, a4, rtz
                  fcvt.s.w     fa7, s7, rtz
                  sra          t5, s6, t3
                  xori         t3, a6, 884
                  fcvt.s.w     fs1, ra
                  sltiu        a3, s1, 1554
                  fmv.w.x      fs4, t3
                  fmul.s       fa0, fa2, fs10
                  fcvt.s.w     ft10, zero, rup
                  fsgnj.s      fs9, ft11, ft5
                  auipc        sp, 167029
                  fcvt.s.w     fa1, s4
                  fsub.s       ft2, ft0, fs9, rtz
                  andi         sp, s5, 39
                  fmax.s       fs2, fa6, ft0
                  nop
                  fcvt.s.w     fs7, s2, rtz
                  rem          t4, s10, tp
                  sltu         s10, t5, a5
                  fmv.w.x      ft4, t1
                  fcvt.wu.s    a1, fa7
                  sra          s4, t2, t5
                  fdiv.s       fs6, fs0, fa7, rdn
                  sra          t6, a4, a3
                  feq.s        s3, fs2, fs9
                  add          s5, s1, a2
                  rem          s4, sp, ra
                  fcvt.wu.s    zero, ft0, rup
                  rem          s9, a5, t1
                  fsub.s       fs7, ft0, fa3, rne
                  nop
                  slt          a5, t5, s8
                  slti         tp, t6, -1525
                  slt          t5, s5, s11
                  divu         a1, t5, a2
                  fsqrt.s      fs1, fa6
                  fmin.s       fs10, ft11, fs7
                  sub          gp, a5, t2
                  fle.s        a4, fs4, fs8
                  andi         tp, t1, -454
                  or           t2, s5, s7
                  xori         s1, s8, -428
                  mulh         zero, s4, gp
                  xori         zero, s4, -337
                  fcvt.s.wu    ft4, s0, rup
                  fmax.s       fa2, fs5, ft11
                  fcvt.s.w     fs8, s10, rtz
                  fdiv.s       fs9, fa7, ft10, rne
                  fsgnjx.s     fa6, fa4, fs3
                  rem          s5, s2, s10
                  sltiu        s10, s10, -857
                  divu         a2, t2, a5
                  andi         s1, s8, 904
                  fcvt.w.s     s11, ft6, rtz
                  fcvt.s.wu    ft0, a0
                  mul          t3, a3, s9
                  slti         t4, a3, -1704
                  slt          a4, a6, s8
                  andi         t2, t0, 1603
                  fsgnjn.s     fs9, ft8, fa7
                  mulhu        ra, s3, t1
                  and          a3, a4, s4
                  fmv.x.w      zero, ft1
                  fclass.s     a3, fs10
                  fmin.s       fs7, fs2, fs0
                  addi         t6, s2, 121
                  feq.s        s1, ft9, fa1
                  fsqrt.s      ft0, ft5, rmm
                  xor          s0, a5, t1
                  fsgnjn.s     fs7, fa4, fa1
                  add          t0, s10, s11
                  mulh         sp, s9, ra
                  divu         t1, gp, gp
                  div          s1, a2, t3
                  addi         s3, s6, -1756
                  srai         s8, a6, 9
                  srl          a4, t3, s2
                  ori          a3, a7, 833
                  fcvt.wu.s    s7, ft0, rdn
                  fsgnj.s      fs9, ft11, ft1
                  fdiv.s       ft10, ft4, fs2, rup
                  rem          s3, a7, sp
                  srl          t3, s8, s2
                  fsub.s       ft5, fa2, fs6, rne
                  srl          t3, s8, s5
                  addi         t1, s9, 528
                  fle.s        s10, ft5, ft10
                  fmv.w.x      fs0, a0
                  and          a1, sp, gp
                  fcvt.wu.s    s8, fs4, rup
                  xori         a5, s11, 455
                  srai         s8, ra, 7
                  div          t5, s5, t5
                  fclass.s     a2, ft4
                  mulhu        tp, s3, s6
                  sltu         s11, a5, a4
                  auipc        s6, 515698
                  fsgnjn.s     ft2, ft10, fs5
                  slt          t0, s8, t0
                  or           t6, ra, zero
                  fmv.x.w      a1, ft10
                  fsqrt.s      fa0, ft6
                  fadd.s       fs8, fa2, ft10
                  srl          ra, t2, sp
                  fdiv.s       fs1, ft6, ft1
                  fsgnjn.s     fs8, ft2, ft2
                  nop
                  flt.s        t3, fa4, fa7
                  or           a4, a3, a3
                  srli         t5, s8, 19
                  div          s7, t0, s11
                  mulhu        s8, a5, s10
                  fdiv.s       ft2, fs8, fa7, rup
                  mulhsu       t6, a1, sp
                  fmv.x.w      gp, fa0
                  slti         gp, s11, -856
                  fcvt.s.wu    ft0, s9, rne
                  mulhu        s3, a7, t5
                  fmin.s       ft10, fs10, fa4
                  fadd.s       fs1, ft8, ft5
                  mulhsu       tp, s9, s1
                  xori         t6, tp, -10
                  fsgnj.s      fa2, fs8, ft2
                  xori         s7, t5, -951
                  and          s5, zero, t2
                  slli         s6, t5, 0
                  mulhu        t4, a4, sp
                  slti         s3, s6, 1682
                  fcvt.s.w     ft4, s0
                  ori          tp, t3, -123
                  fadd.s       ft11, ft7, ft2, rne
                  xor          gp, t1, s0
                  fcvt.s.wu    fs11, t6
                  mulhsu       sp, t6, t3
                  ori          a1, t4, -1192
                  addi         zero, a6, -426
                  sll          a1, s10, a6
                  fmin.s       fs9, ft4, fs11
                  fle.s        sp, ft2, fa7
                  fmax.s       fs10, fa0, ft11
                  mulh         sp, a7, ra
                  xori         a3, s5, -149
                  fsgnj.s      fa0, ft8, ft5
                  fsub.s       fs4, ft6, ft9
                  div          a5, t1, s11
                  fsgnj.s      fa4, ft5, ft7
                  lui          t4, 151055
                  rem          a3, gp, t6
                  or           sp, s7, a7
                  fadd.s       fs7, fs1, fa5
                  addi         t5, t4, 933
                  flt.s        a1, fs1, fa5
                  srli         a3, t1, 6
                  nop
                  fsqrt.s      fa7, ft1, rup
                  feq.s        s4, ft5, ft1
                  mulh         t5, a6, t6
                  srli         a2, s2, 0
                  slt          s8, s9, tp
                  fcvt.wu.s    a1, ft2, rtz
                  mulhu        s0, t2, s11
                  sltu         s8, sp, a7
                  fclass.s     s4, fs4
                  srl          t4, a1, t3
                  fsgnjn.s     fa5, fa5, fa6
                  ori          gp, t6, 347
                  flt.s        s8, fa0, fs4
                  slli         s7, a7, 30
                  srai         s1, a6, 5
                  mul          tp, s3, t6
                  or           a5, t0, a3
                  mulh         s3, t1, s10
                  rem          s8, t4, a1
                  sll          s7, a5, sp
                  slli         t1, tp, 20
                  divu         a1, ra, a7
                  divu         s6, s4, s6
                  fclass.s     gp, fa3
                  fle.s        ra, fs5, fs8
                  srl          t5, s5, s4
                  fmax.s       fs8, fa3, fs2
                  fsub.s       ft8, fa5, ft2
                  div          a5, s9, s2
                  srai         sp, s2, 23
                  fsub.s       fs10, fs9, ft1
                  fmv.x.w      s11, ft5
                  lui          t1, 721380
                  or           a5, t2, t6
                  fmax.s       fs7, fs4, fa1
                  fsgnjx.s     fa1, fs10, fs8
                  fmv.w.x      ft4, s5
                  fcvt.w.s     ra, fa3
                  fcvt.w.s     a4, ft11, rtz
                  fsgnj.s      fs5, fs3, fs5
                  slli         a5, s11, 13
                  fadd.s       fs4, ft1, fa6, rmm
                  xor          s5, t6, a2
                  andi         s5, ra, 61
                  fclass.s     s9, ft9
                  mulh         s8, s10, s9
                  or           s7, a3, s5
                  srli         t1, s4, 1
                  fsgnjx.s     fa1, fa7, fa0
                  mulhsu       t5, t5, ra
                  fsub.s       ft5, ft5, fa0, rdn
                  lui          zero, 908060
                  andi         t2, t2, -760
                  fcvt.w.s     ra, fs1
                  srli         t2, s11, 15
                  divu         t1, a0, a4
                  addi         a5, s4, 1746
                  srl          s9, a5, gp
                  flt.s        t2, fs0, fs3
                  sltu         gp, zero, s6
                  srli         tp, sp, 25
                  fadd.s       fa5, ft10, fs9
                  fsgnjx.s     ft6, ft1, ft11
                  srli         a2, tp, 28
                  srai         a5, t6, 3
                  slti         t1, t3, 297
                  add          sp, s0, s7
                  sub          s9, a0, a7
                  ori          t1, s0, 1463
                  sll          s6, s8, a2
                  fclass.s     a2, ft6
                  fcvt.s.w     fs9, s5, rne
                  lui          a3, 874884
                  auipc        sp, 970708
                  fsgnj.s      ft6, ft9, ft5
                  fsgnj.s      fs8, ft6, fs8
                  or           s10, s4, a1
                  xori         s7, a4, 1666
                  srli         ra, s4, 4
                  xor          t1, t6, t1
                  fsgnjn.s     ft1, fs0, fa2
                  ori          s8, s7, 384
                  fmin.s       fs9, fa6, fa5
                  sub          gp, t5, s10
                  mulhu        s9, t3, a0
                  fmax.s       fa3, fs9, fs2
                  sub          a1, a3, t6
                  fsqrt.s      fs11, fa4
                  fcvt.s.wu    fa4, tp
                  fmv.x.w      t6, fs2
                  flt.s        t3, ft7, fs1
                  slti         t6, s10, -1893
                  fsgnj.s      ft3, ft10, ft0
                  srli         s10, s1, 23
                  fcvt.s.w     fs6, t4, rdn
                  mul          t2, s5, a1
                  lui          gp, 294723
                  fle.s        s4, ft6, ft11
                  flt.s        s2, ft11, ft4
                  sub          s7, t2, a5
                  andi         a5, zero, 1666
                  andi         s3, a0, -700
                  ori          s3, a1, -627
                  auipc        s1, 461348
                  lui          s4, 677138
                  fclass.s     a1, fs2
                  andi         t1, a6, -855
                  fadd.s       fs6, fa3, fa5, rup
                  sltu         s3, a2, s10
                  xor          t6, a1, s1
                  mulhu        ra, s8, s6
                  ori          s1, s5, 592
                  flt.s        s7, ft2, fs8
                  fle.s        s9, ft5, ft0
                  flt.s        t5, fs2, fs6
                  fcvt.s.wu    fs7, s6, rne
                  fsgnjn.s     ft10, ft5, ft4
                  fsqrt.s      ft6, ft7
                  xor          t1, a2, s0
                  srli         t2, s1, 13
                  fsub.s       fs3, fa5, fs5, rup
                  fcvt.wu.s    s11, ft0
                  andi         s11, a6, 1011
                  mulhu        gp, zero, sp
                  mulhu        a3, a2, zero
                  sltiu        t0, s4, 1682
                  ori          s10, t2, 542
                  fle.s        tp, fs2, ft8
                  fmin.s       ft2, fa0, ft10
                  fclass.s     t4, fs9
                  fadd.s       fs7, ft8, ft1, rup
                  sltu         ra, a4, a7
                  sltu         s0, a6, s5
                  fsgnj.s      fs8, fa6, fa3
                  xori         s5, t6, -1300
                  fadd.s       ft6, ft11, ft6, rup
                  or           a4, s1, t2
                  fcvt.s.wu    fa1, zero
                  fsgnj.s      fa7, ft11, ft1
                  fsub.s       fs9, ft8, fs9, rdn
                  fcvt.wu.s    t5, fs7
                  auipc        s6, 767359
                  fmv.x.w      t4, fs9
                  remu         s2, t1, t5
                  fsub.s       fs1, ft9, ft6
                  fsub.s       fa5, ft10, ft3
                  fadd.s       ft3, ft7, ft9
                  add          s5, s7, a1
                  fcvt.w.s     s1, fs2, rne
                  fmv.w.x      ft1, s11
                  remu         s8, sp, zero
                  mulhsu       a2, a7, a4
                  srai         t5, s1, 20
                  srai         sp, t4, 19
                  andi         s11, t5, -1939
                  add          t1, a4, sp
                  slti         s7, a2, -433
                  fcvt.w.s     s5, ft10, rdn
                  slti         s7, a4, -277
                  divu         s8, t3, sp
                  andi         s10, s4, -1466
                  nop
                  fsqrt.s      ft4, fs1
                  sub          s6, a7, a0
                  fmax.s       ft11, ft1, fa4
                  fcvt.s.w     fs5, a0
                  feq.s        s2, fa2, fs11
                  fsgnjx.s     ft6, fs8, fa5
                  sub          s10, s1, s11
                  fsub.s       fa0, fs6, fa4
                  fle.s        t1, fs3, fs1
                  add          t3, s2, s6
                  feq.s        s8, fs0, ft6
                  slli         t0, sp, 30
                  xori         t0, t6, 1777
                  srl          t2, a0, s6
                  andi         a1, s4, 1286
                  mulhsu       s1, s3, tp
                  sub          ra, s6, zero
                  slti         s0, t2, -1633
                  divu         s7, s1, t2
                  remu         s2, s5, tp
                  divu         a3, ra, a3
                  slti         a5, t0, -508
                  fsgnjx.s     fs5, fa1, ft10
                  sll          sp, t2, a4
                  sra          s11, a4, tp
                  fdiv.s       fs11, fa1, fa3, rne
                  xor          t0, s5, t0
                  div          s8, s2, gp
                  and          sp, s10, a1
                  srl          s7, a6, a0
                  nop
                  fsgnjx.s     ft6, ft3, fa4
                  slti         t5, s3, 1128
                  sra          s3, ra, t5
                  fmv.w.x      fs2, s0
                  fsgnj.s      fs3, fs4, fs10
                  fcvt.s.w     fs3, tp
                  xor          a5, s10, a2
                  auipc        sp, 180969
                  fadd.s       fs1, fs9, fs0
                  mulh         t3, a7, s3
                  fmul.s       ft1, fs10, fa4
                  sra          t2, a3, s6
                  fsgnjx.s     fs8, fs7, fs2
                  fmin.s       ft11, ft8, fs8
                  sltiu        t1, a3, 1363
                  fsqrt.s      ft1, ft9, rdn
                  srli         s1, s11, 12
                  fsub.s       fs0, fs4, fa1, rdn
                  ori          t3, a4, -867
                  fcvt.s.w     fs4, s3
                  sub          s5, t0, t4
                  and          a2, a7, gp
                  slli         sp, a5, 22
                  div          s1, s7, sp
                  fsub.s       fs5, ft8, ft5, rup
                  mulh         ra, t6, s1
                  or           gp, s2, a0
                  fcvt.w.s     t4, fa5, rup
                  and          a3, s6, s5
                  xor          s11, a5, t6
                  srai         s8, gp, 4
                  remu         sp, s6, s4
                  fmin.s       fs0, ft7, fs7
                  fmv.w.x      fs10, t4
                  srai         tp, s6, 9
                  fle.s        a1, fs3, fs5
                  fmax.s       fs11, fs7, fs5
                  fclass.s     a2, ft5
                  ori          s9, s8, 374
                  divu         s2, s1, s4
                  slti         zero, a7, -2012
                  sll          s7, s9, t5
                  sra          a2, t0, s9
                  fmv.x.w      a3, ft4
                  fmax.s       fs4, fs4, fs5
                  mulhu        a1, s2, s3
                  divu         t6, s1, t5
                  fmv.x.w      s3, fs1
                  srli         a1, s4, 24
                  nop
                  auipc        t6, 282489
                  fmv.x.w      a3, fs7
                  srli         t4, s4, 22
                  andi         s3, a6, -1829
                  xor          t0, gp, s9
                  andi         s6, s4, -1606
                  and          s6, t5, s7
                  fcvt.w.s     t0, ft0, rmm
                  slt          s0, a2, ra
                  flt.s        s0, ft8, fa5
                  rem          ra, t4, a1
                  fmv.w.x      fs9, s10
                  sra          gp, s6, t4
                  xor          s8, a1, s3
                  andi         s6, s7, 510
                  auipc        t4, 385240
                  slti         a2, zero, 1286
                  fsgnj.s      ft5, ft4, fa6
                  fsqrt.s      fs2, fa2, rne
                  sltu         s11, s8, a5
                  srl          s4, t4, s10
                  srli         s10, a5, 20
                  fmv.w.x      fa6, t6
                  fclass.s     tp, fs0
                  fmin.s       ft3, fs2, fa4
                  fsgnj.s      ft11, fa1, fs10
                  fsgnj.s      fa4, fa2, fs0
                  rem          s7, s8, s1
                  remu         s0, s3, s2
                  feq.s        s9, fs4, ft0
                  fadd.s       ft1, fa1, fa2
                  flt.s        s9, fa2, ft10
                  fmax.s       ft8, fs5, fa6
                  fadd.s       fa1, fa3, ft11
                  slt          t3, s2, s9
                  fmv.w.x      fs6, s0
                  add          a1, a5, a0
                  lui          s6, 65236
                  fle.s        s6, fa7, fa1
                  mulh         t4, t5, t5
                  add          t4, sp, s7
                  fcvt.s.wu    fa7, s10
                  remu         ra, a6, s10
                  or           s8, a5, gp
                  fclass.s     gp, fa2
                  fsgnj.s      fa0, ft5, fs4
                  fsgnj.s      ft11, ft6, fa3
                  fadd.s       ft9, fa7, fs8, rne
                  lui          t5, 927343
                  fmul.s       fs7, ft1, fs11
                  divu         s6, s7, a6
                  remu         a1, t3, a5
                  sll          t0, s5, a3
                  xori         tp, s6, -1794
                  divu         zero, s0, t6
                  sub          sp, a1, s6
                  fmv.x.w      s8, ft3
                  fmv.x.w      s11, ft0
                  flt.s        tp, ft11, fs3
                  ori          t6, a0, -187
                  slli         a2, s6, 17
                  fcvt.s.wu    ft2, t6, rdn
                  slt          a5, a2, s2
                  fsgnj.s      ft1, ft1, fs9
                  fsgnjx.s     fs7, fs1, ft6
                  ori          t6, s9, -720
                  lui          zero, 27615
                  fadd.s       ft5, fs10, fs0, rmm
                  srli         s4, s3, 0
                  feq.s        sp, ft0, fa5
                  sltiu        s7, s4, 1855
                  slli         a2, s1, 16
                  slt          s0, s1, tp
                  sub          sp, a3, t5
                  ori          t3, t2, 550
                  mul          t5, t1, t2
                  xor          s10, a2, s6
                  and          zero, s10, tp
                  sub          tp, t4, a6
                  slli         a1, s2, 18
                  sra          s2, a6, a3
                  sub          t0, a1, t0
                  fmv.w.x      fs4, s7
                  fsgnjn.s     ft4, ft10, fa7
                  mulhu        t2, t1, zero
                  sub          a2, a2, a1
                  nop
                  fclass.s     t5, ft1
                  mulhu        ra, sp, t1
                  divu         zero, s5, sp
                  add          a5, t3, s11
                  sub          s6, a6, sp
                  and          t6, t4, a2
                  mulhsu       s4, s6, s5
                  xori         ra, a6, -1226
                  mul          a3, zero, s10
                  fsub.s       fs6, fs1, fs10
                  auipc        s7, 9012
                  flt.s        s8, fs9, fa3
                  slti         s4, a3, 701
                  andi         a2, ra, -1026
                  srai         t0, sp, 2
                  mulhsu       s7, s5, s5
                  fsqrt.s      fa0, fs11, rdn
                  fclass.s     a4, fs4
                  fclass.s     s3, fs9
                  sll          a4, t4, zero
                  fclass.s     s7, fs10
                  add          s8, s11, t6
                  srl          s11, s7, a3
                  fmin.s       fa0, fa5, ft1
                  flt.s        a2, fs6, ft3
                  fmv.w.x      fs2, s11
                  fcvt.s.wu    fs3, t5, rtz
                  fmv.w.x      ft11, t6
                  slti         s6, a1, -1201
                  divu         s8, t4, s7
                  slt          a4, s3, a6
                  feq.s        t4, fa4, fa4
                  fmul.s       fa0, fs9, fs5, rdn
                  fcvt.s.w     fs0, s8, rne
                  xor          s10, a3, t0
                  fsgnj.s      fa3, fs5, ft5
                  fsgnj.s      fs5, fa7, ft7
                  mul          s1, a6, s10
                  fmv.w.x      fa5, t3
                  fmin.s       ft11, ft9, ft11
                  fle.s        a5, ft11, ft10
                  nop
                  sra          t0, ra, t4
                  rem          s5, a6, s2
                  ori          s3, t6, -206
                  sll          s1, s11, a0
                  fsqrt.s      fa0, ft1
                  fsgnjn.s     fa4, ft8, fa3
                  fmax.s       fs2, fa2, fa2
                  auipc        a1, 805132
                  flt.s        s9, fs10, ft0
                  ori          s5, sp, -145
                  srli         t1, ra, 14
                  sub          t2, a2, s4
                  slt          s11, ra, s9
                  srai         t0, a7, 5
                  slti         a3, zero, 75
                  remu         s10, a5, t6
                  slt          s1, s2, a7
                  srl          s5, a3, a5
                  fcvt.s.w     fa0, a6, rtz
                  fsgnj.s      fs5, fa2, fs9
                  sltu         s6, t4, s2
                  fadd.s       ft11, ft2, fs2, rne
                  xor          a3, a0, s7
                  feq.s        t5, fa1, ft7
                  feq.s        s3, ft11, ft8
                  divu         s9, s7, s1
                  fsqrt.s      ft8, ft9
                  fsgnjx.s     ft0, fs5, ft2
                  feq.s        a1, ft4, ft1
                  fcvt.s.wu    fs1, zero, rtz
                  andi         zero, t2, 1071
                  sra          s10, s7, t3
                  fmax.s       ft2, fs4, ft8
                  sltiu        sp, a2, 1252
                  fsgnjn.s     ft8, fs10, ft5
                  sltiu        zero, t1, -646
                  fcvt.s.w     ft2, s9, rtz
                  sub          s6, s11, sp
                  div          s4, s1, a1
                  fmv.x.w      s1, fs6
                  andi         t5, t1, 1007
                  mulhsu       t3, a2, tp
                  slli         a4, a6, 24
                  mulhu        gp, t0, a7
                  nop
                  srai         s8, zero, 7
                  auipc        s5, 942673
                  addi         tp, zero, 1605
                  srai         t2, a2, 7
                  slt          s4, s8, t6
                  or           t4, a7, gp
                  xori         t4, s6, -1408
                  fadd.s       ft2, ft1, ft0, rdn
                  xor          s3, s11, s10
                  flt.s        tp, fs4, ft8
                  fsub.s       fs6, fa1, fs4, rup
                  sub          t5, t4, t3
                  sltu         t2, a3, sp
                  and          sp, s4, s0
                  sll          s3, t2, s8
                  fadd.s       fa4, fs8, ft4, rmm
                  xori         t2, a1, 1019
                  mul          a5, t2, t1
                  fcvt.wu.s    tp, fa2, rup
                  fmax.s       ft8, fs6, fs1
                  fsgnjn.s     ft6, ft11, ft9
                  fsqrt.s      fs6, fs8, rne
                  fcvt.w.s     s10, fa4
                  fsqrt.s      fs10, ft3, rup
                  auipc        zero, 779431
                  fcvt.s.wu    fa1, s11, rup
                  fcvt.w.s     s5, fs3
                  ori          a2, gp, 57
                  fmv.x.w      a3, ft10
                  fsub.s       ft0, ft7, ft6
                  fle.s        s6, fs8, fa7
                  fsqrt.s      ft1, fs10, rmm
                  rem          t6, sp, t1
                  remu         s3, a7, s3
                  add          ra, t6, a0
                  rem          t0, s1, s4
                  flt.s        s5, fa5, ft3
                  fmin.s       fa0, fs3, ft8
                  fsqrt.s      ft2, ft6, rdn
                  fdiv.s       ft9, fa4, fs8
                  rem          s6, s7, s1
                  slti         t5, t0, -1567
                  fdiv.s       fa7, fa5, fs5
                  addi         a1, s3, 170
                  sltu         t4, s11, tp
                  slli         a4, s2, 17
                  ori          s8, t3, -1597
                  add          s10, a4, gp
                  fdiv.s       fa7, fs0, fa4, rdn
                  fclass.s     s5, fs5
                  lui          s2, 112180
                  fmax.s       fs0, ft10, ft3
                  fsgnj.s      ft3, fs2, fa5
                  xor          a4, a5, s2
                  fcvt.s.wu    fs7, a7, rdn
                  sub          s10, s5, a7
                  lui          s0, 122410
                  fsub.s       ft6, ft5, fa4, rne
                  auipc        t1, 907177
                  sub          t4, s3, s10
                  fsub.s       ft1, fs7, fs2
                  lui          s0, 954758
                  sub          t0, s1, tp
                  remu         a2, s4, t0
                  remu         t1, s8, s10
                  sltu         a2, t1, t6
                  fcvt.s.w     ft10, a7
                  xori         s4, s7, 754
                  fsgnjn.s     fa2, ft6, fa5
                  fclass.s     sp, ft9
                  add          t3, s1, a6
                  sub          s10, t5, a4
                  andi         s9, a7, 291
                  and          s3, a4, t1
                  fdiv.s       fs8, fa6, ft11, rup
                  fdiv.s       fa6, fs1, ft6
                  ori          s2, tp, -1588
                  fsgnjn.s     fs10, fa7, fs0
                  addi         s4, t6, -706
                  slt          s9, s10, s2
                  fsqrt.s      fs8, fa1
                  fle.s        s6, fs2, ft0
                  sll          zero, s1, s5
                  fcvt.wu.s    sp, ft10
                  mulhsu       zero, s6, a4
                  slli         a2, tp, 2
                  fcvt.s.wu    ft10, s10
                  srai         a5, s9, 7
                  fmul.s       fa5, fs8, fa5, rup
                  mulhu        t0, s0, t3
                  fmin.s       ft3, ft5, ft4
                  slt          a1, s9, s1
                  slt          tp, s1, a5
                  divu         s2, tp, s6
                  fdiv.s       fa4, fs6, fs5, rdn
                  addi         a3, t5, 29
                  divu         s3, s9, a2
                  rem          t6, a2, a7
                  auipc        gp, 725359
                  fcvt.w.s     t2, ft7
                  fcvt.w.s     sp, ft9
                  feq.s        s10, fs9, ft11
                  sub          s6, a4, t0
                  xor          a4, t6, s6
                  and          ra, gp, s8
                  divu         s4, t0, s11
                  fsub.s       fs3, fs9, ft11, rmm
                  div          a1, a5, a6
                  fmv.w.x      fa1, t6
                  fsub.s       fs3, fs7, fs8, rne
                  fcvt.wu.s    ra, fs3
                  sltiu        t0, ra, -1793
                  addi         t3, s1, -71
                  fcvt.s.w     fa0, t4
                  fle.s        s2, fs1, fa1
                  divu         s0, t4, t1
                  sll          gp, a3, s11
                  nop
                  or           tp, s8, a7
                  divu         a1, a1, zero
                  fcvt.s.w     fs6, t6
                  fmul.s       fs9, fs6, fs11
                  and          t0, t6, ra
                  nop
                  mulhsu       s7, s1, a7
                  xori         s3, a5, -648
                  feq.s        s0, ft10, fa4
                  srl          t6, s8, ra
                  slli         s8, s4, 11
                  sub          s9, s8, s7
                  srli         t6, s7, 0
                  auipc        a3, 419907
                  or           a2, s9, a3
                  xor          t0, a3, a4
                  auipc        t3, 949667
                  sltiu        sp, a3, -1739
                  feq.s        a1, fa3, ft2
                  add          gp, ra, a6
                  nop
                  srli         gp, s4, 24
                  fle.s        s5, fs3, ft8
                  srai         tp, s11, 7
                  fmv.w.x      fs3, a1
                  feq.s        s11, fs9, ft2
                  fmin.s       fs9, ft6, fs9
                  sltu         s4, s9, s0
                  divu         s11, gp, tp
                  sra          t0, s6, a0
                  fmin.s       fs3, fs7, fs5
                  mul          s2, a0, t5
                  nop
                  sll          t6, s3, tp
                  slti         a2, a4, -821
                  fmin.s       ft11, ft0, fs4
                  add          s2, t2, s5
                  mulhu        s10, s2, ra
                  mulh         t4, s3, s8
                  fcvt.w.s     a1, ft0
                  fmul.s       fs10, fa3, fs8
                  sltu         s6, s4, s8
                  add          ra, t0, t3
                  fmul.s       fa6, fa2, fs1
                  fsgnjx.s     fs10, ft11, fs9
                  addi         gp, a4, -1411
                  div          s11, a5, t4
                  fsqrt.s      fa6, ft7, rmm
                  feq.s        s3, ft4, fa7
                  flt.s        s2, fs0, fs9
                  ori          s1, t2, 176
                  fmv.w.x      ft11, t0
                  slli         t4, t4, 10
                  mulh         t5, a1, s6
                  slti         s11, ra, 1576
                  mulh         sp, s11, s0
                  srli         t6, t5, 29
                  srai         t2, a6, 10
                  sltiu        t0, a4, 237
                  and          a1, s2, s6
                  divu         s5, t4, ra
                  fcvt.s.w     fs8, a3, rup
                  addi         a5, t2, 1776
                  sra          t3, a3, s5
                  fmax.s       fs0, ft1, fs10
                  lui          t3, 156588
                  addi         t4, s9, -1250
                  feq.s        gp, fs0, ft4
                  fsub.s       fs11, fs1, fs6, rmm
                  fcvt.s.wu    fs9, s5, rtz
                  addi         tp, s7, 732
                  rem          gp, s0, t2
                  fmin.s       ft11, ft4, fs3
                  remu         s8, a5, a3
                  fsub.s       ft11, ft7, ft6
                  and          s10, s7, a3
                  rem          t0, a5, s11
                  sltu         s5, a2, s10
                  feq.s        s5, ft8, fs1
                  mulhsu       s0, s3, t2
                  xori         s11, sp, -558
                  mulhu        tp, t4, s5
                  slli         ra, a4, 23
                  slt          a1, t1, s2
                  sltu         s7, s5, a7
                  fmul.s       fs10, fs9, fs11, rdn
                  and          s9, t3, s8
                  srl          tp, s6, s6
                  fmin.s       fa2, fs5, ft0
                  divu         s6, s2, s9
                  fsub.s       fa3, fs3, fa6
                  feq.s        s8, ft10, ft2
                  fmul.s       fs7, fs11, ft8, rmm
                  mulhu        a3, ra, s1
                  fdiv.s       ft5, ft11, fs0, rtz
                  mul          tp, t2, t2
                  fsqrt.s      fs11, fs4, rtz
                  mulh         a1, a0, a1
                  sub          t0, s9, a2
                  fcvt.w.s     t2, fs1, rdn
                  xor          s0, s5, s1
                  fmul.s       ft9, ft8, ft3, rne
                  sra          tp, s9, a7
                  fsgnjx.s     ft4, ft4, fs6
                  slli         zero, a0, 23
                  ori          s11, t2, 747
                  sra          a4, s10, s3
                  sub          s8, s11, a1
                  fsgnjx.s     fs6, fa6, ft11
                  addi         t0, a3, -1564
                  xor          ra, a4, a1
                  feq.s        t3, fa6, ft1
                  remu         s0, gp, s5
                  ori          a5, a2, 648
                  mulhsu       s7, s9, t5
                  nop
                  fsub.s       fa0, fs3, ft10, rtz
                  fmul.s       fa5, ft11, fs3
                  add          ra, s3, a1
                  fsgnjn.s     fs3, fa0, fs4
                  fsub.s       fa5, fs5, fa1, rmm
                  fclass.s     s3, fs3
                  fsgnjx.s     ft3, fs0, fa0
                  fsgnjx.s     ft5, fs7, fa3
                  fsqrt.s      ft5, ft6, rup
                  lui          t6, 792592
                  fsqrt.s      fs0, fs8, rtz
                  fcvt.w.s     t3, ft2, rmm
                  and          tp, s1, t1
                  slti         ra, s9, 817
                  divu         t5, sp, t0
                  slti         s5, a3, -1289
                  fcvt.w.s     s9, fa5
                  sll          a4, s10, a5
                  xori         s6, s8, -650
                  and          s5, a4, a6
                  fcvt.w.s     tp, fa1, rdn
                  fadd.s       fs11, ft5, fa7
                  fclass.s     a1, ft3
                  slli         ra, ra, 11
                  lui          t1, 1043481
                  ori          zero, s11, 171
                  fle.s        gp, ft2, fs11
                  fcvt.w.s     s8, fs8
                  sub          s7, t2, a6
                  xori         t1, s10, 889
                  and          s6, t4, sp
                  fmv.x.w      s2, fs8
                  feq.s        s11, fs11, ft0
                  fclass.s     s5, fs10
                  addi         tp, s4, -925
                  rem          t3, a2, t1
                  and          tp, t3, a2
                  slt          a2, a2, t0
                  addi         s11, s7, 1438
                  fle.s        s3, ft6, fs7
                  mulhu        a2, s9, t1
                  srli         s3, a1, 10
                  addi         tp, a4, 1210
                  mul          s3, a4, ra
                  rem          t6, t5, s1
                  mulhu        t6, a0, t2
                  or           s6, a7, t1
                  rem          s5, a4, a7
                  mul          gp, s0, s11
                  and          t6, t1, s5
                  xor          sp, a3, t1
                  mul          s4, s8, s6
                  and          t6, a4, gp
                  fsub.s       fs1, ft5, ft9, rup
                  slt          ra, tp, t6
                  fle.s        a4, fs8, fs8
                  srai         sp, t6, 5
                  fsgnj.s      fs5, ft0, ft3
                  sra          s10, a6, s4
                  auipc        t1, 1022293
                  slli         tp, zero, 4
                  addi         t0, t2, 520
                  fmv.x.w      t0, fa3
                  mulh         a5, t2, t6
                  srai         t1, a1, 18
                  sub          s9, s0, s6
                  fmv.x.w      s1, ft4
                  addi         s8, s8, -1806
                  divu         s4, s9, a3
                  fmv.w.x      fa2, s4
                  fcvt.w.s     a5, fa6
                  slti         s6, s10, 717
                  sll          a4, s10, s7
                  remu         t4, tp, tp
                  mulh         s0, a3, s4
                  xor          t0, s11, s10
                  div          t1, t1, gp
                  addi         zero, sp, -701
                  fcvt.wu.s    s11, fa3
                  div          s6, gp, a0
                  fcvt.s.w     ft10, s0
                  fadd.s       fa4, fs6, fa1, rdn
                  feq.s        ra, ft9, fs5
                  fcvt.wu.s    gp, fs3
                  sub          ra, t1, s8
                  addi         tp, a2, 425
                  mul          a3, s10, t6
                  div          s7, s4, s4
                  auipc        a1, 35865
                  sll          t5, a7, s2
                  fsgnjn.s     ft8, fa3, fs3
                  mulhsu       a4, s8, s4
                  fcvt.w.s     ra, fs6, rne
                  divu         s5, s7, s4
                  remu         a3, a6, a5
                  fsqrt.s      ft2, fa4
                  srai         s1, s11, 6
                  divu         s9, a3, s3
                  fcvt.s.wu    ft10, s11
                  rem          tp, s4, a3
                  fsub.s       fs3, ft5, fa5, rdn
                  fcvt.s.w     fs9, t6, rmm
                  fsqrt.s      ft2, ft11
                  fcvt.wu.s    s9, fs3
                  fadd.s       ft8, fa0, fs3, rdn
                  mulh         s7, t1, s3
                  mulh         s6, s9, s9
                  ori          s0, s1, -154
                  sub          s3, a6, a5
                  sltu         s10, s3, s2
                  fsgnjx.s     fs0, fs9, fs2
                  fcvt.wu.s    ra, fs3
                  fmax.s       fs0, fa3, ft6
                  or           t2, a3, sp
                  lui          t4, 1008401
                  sra          s6, s10, s5
                  rem          zero, tp, a6
                  xor          t4, gp, a3
                  sltiu        sp, t0, 1706
                  andi         s0, a5, 911
                  lui          s10, 144653
                  fmin.s       fs9, fa2, fa3
                  xor          t4, s11, s11
                  fmul.s       ft4, ft6, fs8, rdn
                  xori         t5, s2, 158
                  div          s4, s5, s7
                  divu         s11, zero, t3
                  fsub.s       fs4, ft4, fs6, rup
                  add          s2, a1, t5
                  slt          a5, s9, s8
                  ori          tp, a2, 839
                  slti         s3, s10, 363
                  sltu         s4, s4, t4
                  mul          zero, t0, a3
                  fclass.s     ra, ft3
                  fmv.w.x      fa4, tp
                  fadd.s       ft0, fa3, fs3, rup
                  srai         t5, t3, 6
                  nop
                  ori          t0, a6, -1836
                  slti         s11, t1, 1381
                  divu         t4, t0, s10
                  andi         s5, tp, 163
                  slti         sp, s1, 505
                  fclass.s     t6, fs2
                  sltu         s11, t3, a1
                  fsgnjx.s     ft2, ft5, ft10
                  sltu         t2, s11, a0
                  sub          s2, a5, t3
                  xori         a1, sp, 163
                  add          tp, s2, t4
                  slti         gp, s4, -166
                  fdiv.s       fa1, ft10, ft11, rne
                  fmin.s       fa6, fs0, fs0
                  fmv.w.x      ft8, s5
                  slt          s2, t2, t5
                  and          s2, t4, t6
                  fcvt.w.s     zero, fs7
                  rem          s9, tp, a7
                  fsqrt.s      fs3, ft6
                  xor          a5, tp, t0
                  fmv.w.x      fa2, s7
                  sltiu        a4, t6, 1286
                  andi         a3, s11, -1888
                  fcvt.wu.s    t5, fs2, rtz
                  fmv.x.w      t5, ft4
                  fmv.w.x      fs0, a5
                  fmv.w.x      fs2, a0
                  fcvt.wu.s    zero, fa3
                  nop
                  fle.s        s4, fs7, fs2
                  rem          t0, sp, s3
                  nop
                  fsgnjn.s     ft5, fs3, ft3
                  flt.s        s7, fs8, fs8
                  fmv.w.x      ft11, s6
                  srli         s1, s10, 10
                  div          a5, t5, s1
                  srai         s4, s0, 10
                  xori         t1, t3, -1376
                  remu         s9, a0, s4
                  andi         s0, sp, -1648
                  srai         t2, a0, 17
                  add          s5, a7, s8
                  fsgnjx.s     fs1, fs3, ft7
                  fcvt.wu.s    t4, fs6
                  fcvt.w.s     t2, ft2
                  sra          t6, s9, t2
                  remu         a2, s2, gp
                  fmv.x.w      a3, ft1
                  fdiv.s       fa2, ft7, fs7, rtz
                  mulhsu       s2, a2, s9
                  slli         ra, t4, 15
                  fmv.w.x      ft9, zero
                  and          s4, s10, s6
                  add          s10, s0, a5
                  fdiv.s       fs6, fa1, fs10
                  addi         a4, a1, 1457
                  fclass.s     zero, ft7
                  mulhsu       t0, s0, a4
                  fsqrt.s      ft10, ft3, rtz
                  div          a4, a1, a3
                  fcvt.s.wu    fs6, t5, rup
                  fclass.s     t0, fs10
                  add          s2, t1, s2
                  fcvt.wu.s    s11, ft8
                  add          sp, t0, s1
                  fmin.s       fa2, ft8, fs3
                  feq.s        a2, ft1, fa5
                  auipc        s7, 792408
                  slt          a3, s0, s8
                  sltiu        s9, s3, 1661
                  xori         s0, s5, -1907
                  fle.s        t5, ft4, fs3
                  rem          zero, s0, zero
                  fle.s        a5, fa2, fs5
                  feq.s        zero, fs7, fa7
                  xori         t4, t1, -701
                  mul          s11, s0, s10
                  ori          t4, t3, -420
                  mulhsu       gp, s3, s7
                  fcvt.s.wu    fs6, a5
                  fsgnj.s      fa3, fa1, fs9
                  addi         s2, tp, 1795
                  or           s5, s9, s1
                  feq.s        t1, fa1, fs1
                  fmin.s       fa4, fa3, ft7
                  or           s4, gp, a4
                  fmax.s       ft4, fs2, ft2
                  fmin.s       ft1, fs7, ft11
                  ori          s1, s3, 1462
                  srli         s11, s9, 6
                  sll          a5, sp, s4
                  srai         tp, s11, 17
                  srai         t3, t5, 13
                  fsgnjn.s     fs2, fs6, ft1
                  xor          s8, gp, zero
                  fmv.x.w      s0, fs2
                  srl          zero, gp, s5
                  sub          t5, gp, a2
                  fsgnjn.s     fs3, fs11, ft9
                  div          s4, a6, s11
                  mulhsu       t3, s1, a3
                  lui          t6, 396227
                  sltiu        t0, t1, 670
                  mul          zero, s10, t4
                  flt.s        t3, fa6, ft8
                  fmul.s       ft7, fa1, fs3, rdn
                  auipc        s6, 1044084
                  xor          t6, s7, tp
                  srli         s5, t5, 5
                  flt.s        tp, ft6, fa7
                  sll          t5, a3, s8
                  remu         s6, ra, a0
                  ori          t1, t6, 1144
                  slli         a2, s3, 9
                  fsgnjn.s     fs6, fa3, fa1
                  fsqrt.s      ft7, fs1
                  fmv.x.w      a2, fs2
                  fclass.s     a3, ft9
                  fadd.s       fa0, fa0, fs5, rdn
                  slti         a1, t3, 1810
                  fmax.s       fs11, ft10, fa2
                  or           t0, s5, a7
                  slti         a2, t4, -814
                  mul          sp, zero, t3
                  fcvt.w.s     a2, fs4, rup
                  mul          s11, sp, s1
                  mul          s11, a3, s0
                  mulhsu       a5, s11, s0
                  slt          a3, s8, s9
                  sub          s11, s6, t2
                  add          sp, s8, gp
                  fmax.s       fs10, fa6, fa0
                  fle.s        a3, ft3, fs7
                  divu         t5, s9, a4
                  fmv.x.w      a1, fs2
                  fmv.x.w      s2, ft7
                  slli         a4, s2, 8
                  srli         t0, s8, 2
                  and          a3, a3, a7
                  divu         t1, t5, s10
                  slti         t6, t6, 1741
                  slt          a2, t0, t4
                  mulhsu       s0, s0, t4
                  srl          s11, a5, s11
                  fsgnjx.s     fa4, fa2, fa4
                  mulhsu       s5, a3, a5
                  xor          s11, s5, s5
                  xor          s4, s1, a7
                  slti         t6, ra, 825
                  fadd.s       fa5, fs5, fs4
                  fsub.s       fs7, ft2, fs3
                  fmin.s       fa3, ft7, ft7
                  addi         t4, t0, 1343
                  sll          t3, ra, s10
                  fle.s        t5, fa7, fs10
                  auipc        t2, 819303
                  xori         sp, a4, 1361
                  fsgnj.s      ft9, fa7, fs10
                  fclass.s     t6, fa2
                  fclass.s     s7, fs2
                  fmul.s       fs4, ft4, fa3, rdn
                  feq.s        sp, fs6, fs9
                  xori         s11, tp, 523
                  srli         s1, s1, 10
                  fadd.s       ft5, fa5, fs9
                  xor          gp, s5, tp
                  fdiv.s       fs4, ft2, ft0
                  mul          zero, s11, ra
                  srli         a5, zero, 30
                  fmv.w.x      fa7, s7
                  srl          t0, sp, a5
                  mulhu        t2, t5, t4
                  fsub.s       fs1, fs0, fa6, rdn
                  fmv.x.w      zero, fa7
                  rem          t6, ra, tp
                  div          s2, s8, ra
                  mulhsu       s11, tp, t0
                  rem          gp, t0, s9
                  feq.s        t0, fs3, fs3
                  fcvt.wu.s    s11, ft11, rup
                  xor          tp, a0, s10
                  add          a4, t4, t5
                  fsgnj.s      fs6, fs6, fa2
                  fcvt.s.wu    ft5, a3, rne
                  mul          a4, sp, sp
                  fsub.s       fs11, fa3, ft11, rtz
                  srl          t6, tp, t0
                  rem          ra, t0, s11
                  srai         zero, ra, 17
                  fmax.s       ft8, ft4, ft11
                  feq.s        t0, fs5, ft0
                  flt.s        a4, fs4, ft4
                  lui          s7, 977335
                  and          s10, s1, t4
                  sll          t5, s10, s11
                  fdiv.s       fa2, fs9, fs1, rup
                  slli         t3, t1, 29
                  add          t5, s10, s7
                  fcvt.wu.s    t2, ft11
                  slt          zero, a4, s9
                  mulhsu       a1, s1, a3
                  srli         t1, s9, 16
                  fsub.s       fa1, ft9, ft11, rdn
                  fmv.x.w      t5, fa3
                  mulhsu       gp, a4, s5
                  fsgnj.s      fs5, ft4, ft1
                  slt          t1, t0, s7
                  slti         s5, a4, -1361
                  sltiu        t3, a4, 1393
                  auipc        s0, 617601
                  feq.s        a5, fs11, fs6
                  fsgnjx.s     ft11, fs5, fs6
                  fsqrt.s      ft10, fa2, rdn
                  remu         a1, s6, a1
                  fsub.s       ft8, ft8, fs0, rtz
                  sub          s9, t6, gp
                  xori         s2, gp, 998
                  fcvt.s.w     ft10, a1, rmm
                  fdiv.s       ft2, fs9, ft9
                  and          t0, t4, a0
                  fle.s        t4, fa0, fs3
                  fmv.x.w      s1, ft2
                  fsqrt.s      fs2, fa0
                  remu         sp, t2, zero
                  fsgnjx.s     ft9, ft8, fa7
                  fsqrt.s      fs2, fa4
                  srl          zero, a4, s3
                  xor          s3, tp, t0
                  fcvt.s.wu    ft7, a3
                  fcvt.wu.s    s4, ft11, rtz
                  andi         t2, ra, -1390
                  auipc        zero, 846563
                  fsgnjn.s     fa1, ft3, fs5
                  sltu         s10, a3, sp
                  andi         a5, a5, 1050
                  addi         s2, t0, -473
                  fcvt.s.wu    fa6, t0, rne
                  mulhsu       s8, s3, s10
                  slli         t6, s3, 9
                  lui          t3, 1039026
                  srli         t5, s2, 22
                  fsgnjn.s     fs11, fa6, ft0
                  auipc        a1, 327545
                  remu         s6, s6, gp
                  sra          a1, s0, s11
                  or           zero, s8, t1
                  or           s8, s0, s3
                  fclass.s     s10, ft10
                  srli         a5, s4, 23
                  srli         s5, tp, 2
                  fsqrt.s      fs5, fa6, rmm
                  addi         t6, a3, -524
                  xori         a2, t0, 241
                  andi         t0, zero, -1785
                  div          zero, a6, a6
                  div          ra, s6, a4
                  sll          s6, sp, s9
                  flt.s        s4, ft3, fa3
                  nop
                  srai         tp, a4, 12
                  mulh         zero, s4, s11
                  sll          tp, t5, a3
                  fmv.w.x      fa4, t0
                  feq.s        tp, ft10, fs8
                  ori          s4, s9, -1432
                  fcvt.s.w     ft8, a4
                  rem          s2, gp, a7
                  fdiv.s       fs8, fs5, fs9
                  addi         sp, a0, 93
                  srli         s5, a4, 0
                  fmv.x.w      s8, ft9
                  fmax.s       ft1, ft4, fs6
                  fle.s        s2, ft11, fs9
                  sub          t5, s5, a4
                  fcvt.s.wu    fs3, a4
                  lui          t3, 618116
                  andi         a1, gp, -24
                  remu         a4, gp, a6
                  xor          s6, t4, tp
                  feq.s        s6, ft3, fs11
                  or           s1, t1, s11
                  lui          ra, 129976
                  sltiu        s7, s2, 742
                  fsgnj.s      ft8, ft2, fs5
                  fdiv.s       ft3, ft0, fs3, rmm
                  ori          t6, t0, -1184
                  srl          t6, s4, t1
                  and          s8, a2, s0
                  fmv.w.x      fs8, t2
                  sltiu        t6, s10, 617
                  lui          s10, 718581
                  slli         s10, zero, 29
                  sll          ra, s8, zero
                  srl          s10, a4, gp
                  mul          a1, s2, s9
                  fle.s        a1, ft7, fs2
                  add          s10, a4, s5
                  fmin.s       fs5, fs11, fa3
                  slli         s8, s5, 31
                  fsgnj.s      fs5, fs3, ft10
                  sltiu        s1, sp, 1091
                  srli         t0, zero, 28
                  fcvt.s.wu    fa2, s11
                  fdiv.s       fa7, fa1, fs4, rne
                  lui          t3, 368164
                  fsgnjn.s     ft5, fa2, ft7
                  add          a2, ra, t5
                  fsqrt.s      fa1, fs7, rup
                  mulhu        s5, t5, s4
                  fsgnjx.s     ft2, ft10, fa7
                  fdiv.s       fa6, fs8, fs4, rmm
                  srli         a1, s11, 18
                  sub          t2, s5, s9
                  fmax.s       fa3, ft11, ft3
                  fcvt.w.s     s9, fa6
                  add          t0, s10, s0
                  fdiv.s       fs10, ft5, fs1, rtz
                  mulh         gp, gp, s4
                  srli         s1, a1, 15
                  fsgnj.s      fs4, fs8, ft6
                  slli         t3, s8, 25
                  or           t1, a2, a4
                  sra          a1, a1, t0
                  slti         t0, s3, -710
                  mulhu        t2, a6, s7
                  fmax.s       fs9, fs1, ft5
                  andi         s9, a0, 147
                  fmax.s       fs6, ft8, ft9
                  auipc        s4, 797285
                  sll          s4, t4, t1
                  mulhu        a5, s4, sp
                  ori          s6, s10, -117
                  fcvt.w.s     t5, ft11, rtz
                  fmv.x.w      t3, ft6
                  fcvt.s.w     ft10, t5
                  rem          a4, s9, a1
                  slt          s7, t4, a4
                  fadd.s       fa2, fs1, fs11
                  fadd.s       ft5, fs2, ft9, rtz
                  mul          s0, t1, a2
                  sra          a3, zero, a7
                  fsub.s       ft3, fs1, ft4, rne
                  divu         ra, s3, s3
                  fcvt.w.s     zero, fs6, rmm
                  xori         t0, sp, 486
                  srli         a4, zero, 9
                  srl          t3, s7, a4
                  fsgnjx.s     ft10, ft5, fs6
                  sltiu        t4, zero, -527
                  fclass.s     s0, ft6
                  fle.s        s1, ft6, fs2
                  remu         s8, t6, s4
                  fmax.s       fs11, ft5, fs3
                  xor          a2, tp, a0
                  srl          s11, s10, gp
                  fcvt.wu.s    s8, ft6, rmm
                  sll          s5, a5, gp
                  slti         t4, t1, 755
                  fcvt.wu.s    tp, ft4
                  srai         t3, a2, 18
                  add          t4, zero, a1
                  and          ra, t0, t5
                  fcvt.s.w     ft2, gp
                  sub          s9, a7, sp
                  xor          tp, gp, a7
                  sltiu        zero, t6, 838
                  mulhsu       s6, s3, s0
                  fmv.w.x      fs3, sp
                  or           t4, s5, zero
                  auipc        tp, 959966
                  fadd.s       fa1, ft5, fs3
                  fmul.s       ft9, ft0, fs11
                  divu         s6, s4, zero
                  fmax.s       ft0, fa3, ft8
                  slli         a3, a5, 19
                  fmv.x.w      ra, ft4
                  fmax.s       fa7, fs2, fs8
                  fsgnjn.s     fs2, ft8, ft5
                  mulhsu       sp, s5, s1
                  fsqrt.s      fs3, ft4, rtz
                  sltiu        s9, t0, -510
                  sll          s7, a3, s11
                  fmv.w.x      fa7, tp
                  sll          s6, s10, s11
                  div          sp, t4, a0
                  rem          s9, s10, a5
                  or           s3, s2, tp
                  mulhsu       sp, s1, zero
                  add          s11, s2, t1
                  sltiu        a4, gp, 38
                  srl          t4, s0, t6
                  sltu         s4, a5, s6
                  sltiu        a5, s5, -1945
                  sub          s7, s11, s0
                  mulhu        t2, sp, a4
                  mul          t6, s8, s2
                  fsgnj.s      ft7, ft2, fs4
                  sub          t2, s3, t4
                  addi         t3, s0, -1028
                  mulhu        s8, a0, t6
                  fle.s        t3, fs10, fs11
                  fmax.s       ft4, ft9, ft5
                  fsub.s       fs10, ft11, fs2
                  feq.s        s6, fa6, ft8
                  and          t3, t0, s4
                  ori          gp, a1, -612
                  fsgnjn.s     fs4, fa1, fs11
                  fcvt.wu.s    tp, ft0, rup
                  add          s7, gp, s8
                  lui          zero, 337725
                  mulhsu       zero, t1, ra
                  slt          s10, s5, a6
                  sltiu        s2, zero, -1799
                  sll          a1, s3, t5
                  fcvt.w.s     s10, ft5
                  sltu         t4, s9, s3
                  fmv.x.w      gp, fa2
                  fsqrt.s      ft8, fs4
                  sltu         sp, a0, gp
                  srai         t5, sp, 8
                  sll          s3, a4, t0
                  slli         s1, sp, 2
                  fdiv.s       fa6, fs10, ft0
                  fdiv.s       fs1, fs5, ft7, rup
                  sltiu        s7, ra, 1716
                  lui          t2, 164825
                  fcvt.s.w     fa4, a5
                  sra          s0, s4, s6
                  fadd.s       fs7, ft3, fs5, rup
                  mulhsu       t4, s3, t6
                  ori          s4, a3, -165
                  ori          t5, a3, -820
                  slli         s3, a5, 16
                  divu         s8, s11, s10
                  fcvt.wu.s    s6, ft8, rup
                  sltiu        s4, a5, 1339
                  xor          sp, s8, a4
                  fmul.s       fs7, fs2, fa2, rtz
                  rem          gp, s6, s3
                  fsqrt.s      ft1, fs11, rmm
                  sra          s1, s5, s3
                  fmax.s       ft7, fs11, ft7
                  ori          ra, s8, 672
                  fadd.s       ft11, fa1, fs1
                  mulhsu       s9, t6, a5
                  andi         a3, s3, -781
                  mulhsu       zero, a2, a1
                  flt.s        s8, fs10, fs4
                  srl          ra, tp, t4
                  div          t0, t3, s3
                  sll          zero, s2, a0
                  srl          gp, s8, t5
                  feq.s        s0, fa7, fa3
                  feq.s        t3, ft6, fs6
                  fdiv.s       fs8, ft6, ft2, rmm
                  or           s7, gp, s6
                  srli         t0, tp, 23
                  fmv.x.w      s10, ft5
                  slli         t6, a2, 17
                  fmin.s       fs3, fa2, ft11
                  fmul.s       ft5, ft4, fs3
                  fmv.w.x      ft9, s4
                  fsqrt.s      ft2, fs5, rne
                  remu         t3, t3, tp
                  or           t1, a1, a4
                  mulh         a3, s8, t5
                  lui          s9, 100969
                  srl          a2, t1, a6
                  srli         a2, t3, 22
                  slt          a5, s9, ra
                  slt          s10, a6, s6
                  fmv.w.x      fs10, a2
                  fcvt.wu.s    s1, ft3, rdn
                  and          a3, s6, t6
                  and          sp, a0, a2
                  fsgnj.s      ft3, fa5, fs3
                  fsgnj.s      fs10, fa2, fa5
                  fcvt.wu.s    a5, ft6
                  sub          t4, s4, gp
                  and          a3, tp, s6
                  rem          s3, s2, s10
                  feq.s        s7, fa5, ft3
                  sltu         s2, s5, t4
                  fcvt.s.wu    fs5, s2
                  fmul.s       ft6, ft5, fs11
                  rem          ra, zero, a0
                  rem          t0, a3, a2
                  srli         s2, a4, 7
                  nop
                  slt          s8, tp, t2
                  slli         a3, a5, 24
                  andi         s6, tp, 1228
                  fsqrt.s      ft5, fa2, rmm
                  flt.s        zero, fs10, fs2
                  lui          zero, 666549
                  div          s9, a1, a1
                  mulh         s11, s7, a1
                  and          s1, t0, s8
                  fsub.s       ft5, ft0, fs5
                  fadd.s       ft5, fs4, ft9, rdn
                  fsgnjx.s     fa3, ft10, ft2
                  sll          t6, a4, t6
                  divu         t3, a0, tp
                  fmin.s       fs10, ft0, ft10
                  fmv.x.w      t5, fs6
                  mul          a3, s5, a4
                  addi         a1, t5, -1113
                  div          t4, zero, a1
                  slti         s9, t5, 526
                  fmul.s       ft6, fa5, fs8
                  slti         sp, s8, 99
                  sltiu        s2, a0, 1639
                  fadd.s       ft11, ft4, ft4
                  fsgnjx.s     fs11, fa4, ft9
                  lui          t6, 728718
                  sra          a2, a3, s2
                  fcvt.w.s     s6, fa4
                  xor          a5, s4, s3
                  fcvt.s.w     fa1, s9, rup
                  nop
                  rem          s0, s10, t4
                  fsgnjn.s     fa7, fa0, ft7
                  or           a5, tp, a5
                  andi         tp, s10, 1717
                  fdiv.s       fa4, fs3, fs2, rdn
                  fmv.x.w      ra, fa5
                  sltiu        s1, zero, -298
                  sra          s4, t6, s5
                  sra          s11, a5, t4
                  fle.s        s10, ft5, ft11
                  fmv.w.x      ft5, s8
                  mulh         ra, t0, a6
                  div          s4, t0, t3
                  fsub.s       fa6, ft4, ft7, rtz
                  fcvt.s.wu    fs10, s9
                  add          t5, a7, a3
                  srai         s1, a6, 28
                  auipc        ra, 843499
                  flt.s        s7, fs7, fs1
                  sltiu        t3, t2, 2023
                  fadd.s       fa0, fs3, ft9
                  fcvt.s.w     ft8, s2
                  fmin.s       fa1, ft1, fs1
                  sra          s10, s7, tp
                  fdiv.s       fs9, fa6, fs4
                  remu         t1, t4, gp
                  sll          a1, s0, sp
                  mulhsu       s4, t4, t1
                  mulhsu       tp, s3, s11
                  fmv.w.x      ft6, ra
                  fdiv.s       ft3, ft3, fs8, rup
                  fcvt.s.w     fa7, a3, rup
                  slti         gp, s11, -1586
                  fdiv.s       fs5, fs1, fa1
                  ori          s0, t0, 1564
                  slt          t6, s1, a4
                  fcvt.wu.s    s11, ft10
                  remu         tp, s7, s10
                  sltiu        s3, t5, 1020
                  slti         a4, t2, 945
                  fsgnjx.s     fa1, fa7, fa5
                  fsgnjx.s     ft5, fs4, fs2
                  fmin.s       fs6, fa5, fs10
                  addi         a4, tp, 1055
                  fsgnj.s      fa5, ft10, ft0
                  fmin.s       fa7, ft8, ft6
                  fcvt.wu.s    t1, fs0, rmm
                  fcvt.s.wu    fa2, s4
                  srl          t4, gp, ra
                  xori         ra, t5, 929
                  fmul.s       ft3, ft6, ft7
                  mul          zero, a2, tp
                  fcvt.s.wu    fs7, a7
                  fcvt.wu.s    t6, ft9, rup
                  mulhu        s1, zero, s10
                  andi         a4, t1, 1043
                  remu         s0, s5, s2
                  flt.s        s2, fa3, fa6
                  fclass.s     s8, ft3
                  fclass.s     a5, ft6
                  fsgnjn.s     fs8, fa3, fs7
                  fmul.s       fs0, fs1, fs7
                  fle.s        sp, fs2, ft2
                  fcvt.s.w     fa3, s8
                  fsgnjx.s     fa0, fa2, fs2
                  nop
                  add          s7, s5, s7
                  fmin.s       fa4, ft6, ft8
                  add          t4, a2, sp
                  feq.s        a5, fa5, fs7
                  srli         t3, sp, 5
                  xor          s9, ra, t0
                  sltu         s8, s11, s9
                  xor          t2, s2, t6
                  sra          t4, t2, s4
                  fdiv.s       ft9, fs2, fs4, rtz
                  rem          s5, a3, s0
                  remu         s2, s6, t3
                  fsgnjx.s     fa4, ft9, fa4
                  srl          s6, a0, sp
                  andi         s0, t4, 1669
                  fcvt.wu.s    sp, ft9
                  andi         t2, t1, 386
                  fcvt.s.w     ft3, s9, rmm
                  sra          gp, tp, a3
                  slli         s5, s1, 2
                  sra          s5, a2, zero
                  fmv.x.w      s2, fa0
                  fcvt.s.wu    fa7, s6, rmm
                  add          s7, a3, s4
                  fsub.s       fa2, ft2, ft9, rdn
                  fsgnjx.s     ft8, fs11, ft2
                  mul          t3, ra, s3
                  ori          s10, a5, 2042
                  sltiu        a1, a1, -13
                  fcvt.w.s     a2, ft2
                  srli         s8, t2, 11
                  fcvt.s.wu    fs11, zero
                  mulhsu       t5, s3, a2
                  fsub.s       ft1, fa2, fs6
                  rem          t4, a7, s9
                  mulhsu       s1, t4, ra
                  div          a5, a5, t2
                  ori          s5, t0, 543
                  mulhsu       s8, s4, s3
                  add          a5, s5, zero
                  slli         t6, t6, 17
                  addi         a2, s1, 1800
                  nop
                  add          s11, s7, s8
                  fcvt.wu.s    a3, ft10
                  fsgnjn.s     fs9, fa1, fs2
                  feq.s        gp, ft4, fs3
                  or           a4, t0, gp
                  add          t3, a1, s11
                  srli         t5, tp, 25
                  fcvt.s.w     ft1, s9
                  sltu         t0, t3, gp
                  fclass.s     t3, fa2
                  fsub.s       ft1, fa6, ft9
                  slti         s7, s0, 189
                  fcvt.s.w     ft0, s0, rup
                  fcvt.s.wu    fs9, zero
                  srl          s10, s7, s10
                  slt          a3, t6, t5
                  fsqrt.s      ft3, fa5
                  xori         a1, t6, 103
                  and          s5, a1, t6
                  fsgnj.s      fs6, fa2, fs7
                  fcvt.s.wu    fa3, a2, rdn
                  divu         s6, s6, a0
                  mulhsu       a3, s1, t4
                  div          zero, s11, t4
                  slti         ra, s7, 1107
                  sltiu        s9, t2, 1476
                  rem          t4, t0, sp
                  flt.s        ra, fa0, fs9
                  mul          a3, a4, a4
                  add          tp, s5, t6
                  fsgnjn.s     ft2, ft4, fa0
                  srai         t1, a1, 23
                  ori          a4, s10, -771
                  fclass.s     s1, fs9
                  srli         s0, tp, 22
                  divu         s4, a0, s3
                  flt.s        s3, fs11, ft1
                  and          s9, s6, a5
                  divu         ra, a4, t1
                  sltiu        t0, a5, -652
                  mulhu        a2, s8, s4
                  fcvt.s.wu    ft11, zero
                  fadd.s       ft6, fa2, ft2, rne
                  divu         sp, t3, t1
                  fmin.s       fa1, fa6, fs7
                  divu         t3, s7, gp
                  div          tp, s11, s1
                  ori          t1, t0, -1029
                  sltiu        s3, s8, 540
                  ori          t5, s3, -1700
                  fmv.w.x      fa6, s5
                  nop
                  sltiu        gp, s7, -295
                  sub          s1, t0, s4
                  srai         a2, s5, 22
                  remu         s3, t6, s5
                  divu         s8, a0, a3
                  sll          s4, t1, t5
                  slt          s1, s8, tp
                  sra          s1, a1, s4
                  div          zero, s3, ra
                  slti         s4, s8, -127
                  fmax.s       fa6, fs3, ft1
                  fsgnjx.s     fa3, fs3, fs0
                  fsgnjn.s     fa2, fs6, fs8
                  fmul.s       fs0, fs4, fs0
                  fadd.s       ft5, ft3, ft1, rne
                  fcvt.wu.s    a3, fa2, rtz
                  addi         t6, s9, -969
                  fsgnj.s      fs4, ft2, fa4
                  andi         s4, a7, -444
                  fle.s        s3, fa4, ft2
                  srai         s1, a5, 9
                  remu         s9, a1, t2
                  mulh         ra, a1, s0
                  fle.s        a5, fs8, fs1
                  srli         s5, ra, 12
                  mulh         s0, s10, t2
                  mul          a4, s9, t3
                  fsgnjn.s     fs5, ft8, fs7
                  divu         a5, gp, a0
                  sltiu        s4, s10, -76
                  fcvt.s.w     fa2, t6
                  xor          s6, zero, sp
                  fsub.s       ft0, fs6, fs0, rup
                  fcvt.s.w     fs9, s11, rdn
                  nop
                  fmv.w.x      fs10, s4
                  fcvt.w.s     t3, fa1
                  fmv.w.x      ft6, s4
                  sltu         s11, s7, t1
                  fcvt.s.wu    fs0, tp, rtz
                  slti         a5, a4, -1080
                  ori          t0, tp, -85
                  rem          a1, a2, s6
                  srai         s6, t2, 24
                  srli         s10, s5, 9
                  fmv.x.w      t0, ft6
                  fclass.s     s2, fs2
                  fcvt.s.w     fs5, t6
                  div          zero, s0, a1
                  fcvt.wu.s    t1, fs8
                  fsub.s       fs10, fs10, ft10, rne
                  slti         s8, a7, -1888
                  and          s3, s8, s8
                  fmul.s       fa7, fa3, ft1
                  sltu         gp, a4, ra
                  divu         a1, t3, t0
                  slli         t4, t6, 10
                  mul          a5, a0, t2
                  ori          s2, tp, 862
                  fcvt.w.s     tp, ft4
                  fcvt.s.w     fs7, a4
                  fcvt.w.s     s3, fs5
                  divu         s8, a7, tp
                  addi         s3, zero, -1358
                  auipc        s6, 62234
                  fsgnj.s      fs9, fa1, ft6
                  mulh         gp, s8, s10
                  fsgnjn.s     ft2, fa6, fs7
                  fmv.x.w      a4, ft5
                  fsqrt.s      ft6, ft8, rmm
                  fmv.x.w      s9, ft4
                  slti         a2, s8, -1358
                  sra          t2, sp, tp
                  div          t6, a2, a1
                  slti         a5, s3, -117
                  sltiu        t6, tp, 1280
                  mul          tp, a4, s2
                  fsgnj.s      fs9, fs8, ft10
                  fmax.s       fs7, fs0, ft1
                  srai         a4, a1, 3
                  remu         s5, s8, t5
                  remu         s11, s6, a7
                  slt          a1, a0, s3
                  sub          t0, a2, s5
                  mulh         sp, tp, sp
                  xor          a1, t0, s10
                  ori          ra, s6, -1843
                  srli         t4, s5, 10
                  fsqrt.s      fs11, ft10
                  sub          a1, ra, t4
                  sub          s0, a7, a2
                  sub          s8, a5, t6
                  remu         s3, s6, s6
                  feq.s        s7, ft0, fs3
                  fsgnj.s      ft4, fs7, fa2
                  fsgnjn.s     fa6, ft1, ft1
                  ori          s1, a5, -1147
                  flt.s        s5, ft0, ft3
                  fsgnjx.s     ft1, fs1, ft10
                  slli         t6, s10, 18
                  sub          t2, s2, s4
                  slt          s7, s7, s8
                  slli         s7, a2, 1
                  auipc        a3, 149854
                  xori         s3, a4, -1695
                  fsgnj.s      ft5, fs8, ft0
                  srai         t3, t2, 27
                  auipc        a3, 502285
                  fcvt.w.s     zero, ft9
                  srai         a1, s2, 6
                  remu         s2, s10, t3
                  fclass.s     s11, ft7
                  fmv.w.x      fs2, s11
                  fsgnjx.s     fa2, fa0, ft2
                  fcvt.w.s     t1, ft5, rne
                  or           t6, a6, a0
                  fcvt.s.w     ft3, a5
                  slt          s2, s7, a7
                  and          s0, t5, s1
                  rem          t3, t6, a7
                  ori          sp, s9, 1908
                  addi         t6, zero, 1627
                  div          s6, ra, zero
                  xori         s11, gp, -705
                  sub          gp, s7, a2
                  fsub.s       fs1, fs9, fa7, rne
                  fsgnjn.s     fa3, ft3, fs10
                  divu         sp, a6, t1
                  mulh         a4, s1, t0
                  div          t3, zero, a2
                  addi         sp, s7, -1306
                  rem          s0, t0, a0
                  fmin.s       fs10, fa5, fs6
                  lui          s10, 242554
                  fmv.x.w      a4, ft6
                  div          t3, s4, a3
                  fmul.s       fa6, ft10, fs6
                  mulh         s10, a3, t2
                  lui          s6, 856346
                  sltiu        s4, s11, -1622
                  fcvt.w.s     s6, ft0
                  fmv.w.x      ft6, s5
                  slt          a1, a3, s7
                  or           a4, s0, a4
                  fmv.w.x      fa4, s6
                  fmin.s       fs11, ft10, ft5
                  fadd.s       fa4, fa5, fs11, rtz
                  fdiv.s       fs6, ft9, ft3
                  remu         a3, s11, s3
                  sltiu        s4, sp, -1902
                  and          zero, zero, a1
                  rem          t1, a2, t5
                  fcvt.w.s     s5, fs2, rup
                  div          a4, a3, a7
                  mul          t2, sp, a5
                  divu         t0, s0, s10
                  mulhu        s1, s9, t4
                  nop
                  mulhsu       t4, s2, a4
                  fadd.s       ft8, fs3, ft5, rdn
                  fmax.s       ft0, fa3, fs8
                  fmin.s       fs1, ft7, fs0
                  fsub.s       ft1, ft7, ft6
                  remu         s6, s3, s11
                  fcvt.wu.s    s0, fs11, rup
                  srl          s3, sp, a5
                  flt.s        tp, fs5, fs9
                  sub          t2, a5, s7
                  fadd.s       fs2, fa6, fs0, rne
                  or           t3, t4, s7
                  fle.s        a3, fs2, fs9
                  fle.s        t3, fs6, ft7
                  sra          t4, s5, a3
                  fmv.w.x      ft6, a5
                  divu         s6, t4, s8
                  div          a5, a3, a4
                  fsgnjn.s     fs4, fa6, fa1
                  mulhu        s7, a7, a5
                  fadd.s       fs2, ft5, fs5
                  add          t4, a7, s0
                  fle.s        t4, ft9, fs4
                  sra          t0, t2, a2
                  rem          s4, t0, a5
                  mulh         s9, t1, s11
                  xor          s6, s11, s8
                  fmv.w.x      fa0, a2
                  sll          s7, a7, s2
                  fcvt.wu.s    s0, fs5
                  and          s0, a7, sp
                  or           s4, a4, t4
                  and          t0, a3, sp
                  ori          s0, gp, -1854
                  xori         a4, t0, 1351
                  or           s4, t0, s9
                  srli         s3, a1, 7
                  fsgnj.s      fs3, ft11, fa0
                  srl          zero, s5, a3
                  srai         sp, s4, 31
                  or           s0, a1, s7
                  fsgnj.s      fs1, ft3, ft5
                  sltu         t1, a0, s8
                  fsgnjn.s     ft1, fs10, ft1
                  and          s10, t0, s2
                  srli         t6, s8, 9
                  auipc        t6, 5134
                  fcvt.s.wu    fa1, s4, rdn
                  addi         ra, t5, 740
                  sll          a1, sp, a3
                  fmv.w.x      ft2, t1
                  fcvt.s.wu    fs7, t6
                  sltiu        s10, a5, 864
                  slt          s1, s11, s9
                  slti         s1, t2, -1079
                  fmin.s       fs8, fs1, fs10
                  fsgnj.s      ft4, fa6, ft2
                  fcvt.s.wu    fs2, a5, rtz
                  sra          zero, t3, t2
                  fcvt.w.s     t5, ft5, rmm
                  fmv.w.x      fs10, gp
                  fclass.s     t5, fa0
                  fcvt.s.wu    ft11, a3
                  or           t5, a1, s11
                  fdiv.s       fa3, fa2, ft5, rmm
                  or           s2, sp, zero
                  auipc        t3, 355028
                  srl          t2, s1, a2
                  auipc        t2, 974197
                  div          t3, t5, s9
                  fcvt.s.wu    fa3, t0, rtz
                  fsqrt.s      fs3, fa1
                  nop
                  sltu         t6, t2, a3
                  divu         s2, s3, s3
                  fle.s        s2, fa7, ft3
                  sll          s9, sp, a4
                  fmul.s       ft11, fs4, ft9
                  fcvt.s.wu    fs8, t6
                  sll          a3, t2, t0
                  nop
                  lui          t2, 156425
                  srli         t4, a6, 14
                  addi         a2, t4, 1952
                  div          s11, a5, t2
                  fmv.w.x      fs6, t5
                  slti         s11, t1, 751
                  fcvt.s.w     fs6, t1, rtz
                  slli         t2, s1, 17
                  ori          s10, s1, -1004
                  fcvt.s.w     fs2, s4
                  addi         s0, a0, 1169
                  fmv.x.w      t2, fs2
                  or           t4, s8, tp
                  ori          s0, t6, 1203
                  sra          t0, a7, a2
                  addi         ra, a0, -1251
                  fcvt.wu.s    a4, fs7
                  div          a5, s3, tp
                  lui          a2, 175145
                  nop
                  fcvt.w.s     s6, fa3
                  srli         t0, zero, 13
                  fmv.x.w      s8, fa2
                  fcvt.wu.s    s2, fs8, rdn
                  mulhu        s11, s2, t2
                  fclass.s     t5, fa7
                  fmul.s       ft2, ft3, fs11, rtz
                  sub          s4, ra, a6
                  mul          a4, a5, s11
                  sltiu        a5, t5, 767
                  fadd.s       fs4, ft7, ft11, rdn
                  sltiu        sp, t1, -2008
                  fsqrt.s      ft9, fs1, rup
                  remu         sp, gp, t0
                  srai         t1, a5, 17
                  mulhu        s2, t6, s1
                  and          s5, s3, sp
                  mulhsu       a4, s11, s0
                  slt          s9, zero, a4
                  sll          t1, a2, t0
                  addi         zero, s6, -1323
                  sltiu        zero, t3, -1419
                  fsub.s       fs9, ft5, ft2
                  sll          s10, a3, s9
                  rem          t1, t2, a2
                  fsgnjx.s     fs7, fa1, fs7
                  fcvt.wu.s    zero, fs3, rmm
                  fsqrt.s      fa6, fa2, rdn
                  fsgnjx.s     ft2, ft10, fs1
                  fclass.s     a2, ft8
                  fsgnj.s      fa7, fs6, fs11
                  fclass.s     s10, fs1
                  sltu         s7, s8, t5
                  nop
                  nop
                  fmin.s       fs9, ft2, fs10
                  fsqrt.s      fa0, fs2
                  fsub.s       fs8, fs7, fa3, rtz
                  mulhu        t2, s0, t2
                  fsgnj.s      fa1, ft0, ft0
                  fmin.s       fs5, fa1, ft7
                  fclass.s     tp, fs5
                  srl          t4, a3, a0
                  xori         s7, a7, -1740
                  addi         s1, t4, -168
                  ori          t2, sp, 420
                  flt.s        a5, fa3, fs3
                  feq.s        ra, fa3, ft4
                  fcvt.s.w     fs4, gp, rmm
                  sub          ra, gp, a0
                  ori          s7, ra, -1086
                  fcvt.w.s     s2, fs6
                  fsgnjn.s     fs4, ft3, ft11
                  flt.s        s4, ft8, fs7
                  fcvt.s.w     fa1, t3
                  xori         s6, a4, 298
                  flt.s        s9, fs0, fa6
                  flt.s        s1, ft11, ft11
                  slli         a1, a3, 0
                  fcvt.w.s     t4, ft1
                  add          s7, a2, a2
                  sub          s2, a6, t1
                  andi         gp, s3, 851
                  fadd.s       ft5, fs11, ft10, rdn
                  sub          zero, t0, s0
                  sltiu        s9, a4, -820
                  fcvt.wu.s    a3, fs11, rne
                  fmv.x.w      tp, fa5
                  addi         s10, a1, -1393
                  fsgnjn.s     fs10, ft6, fa1
                  auipc        a2, 1011928
                  fcvt.s.w     ft8, a7
                  fadd.s       ft4, fs9, fs11
                  fadd.s       fs11, fa5, fs11, rne
                  slli         t1, t6, 11
                  fmin.s       fs6, fs11, fs1
                  slti         s6, sp, 2002
                  add          a5, t6, t1
                  mulhu        s10, t4, s3
                  srai         ra, s3, 8
                  slt          s1, s10, t2
                  fcvt.s.wu    ft4, a0
                  flt.s        s6, ft8, fs7
                  fmv.x.w      s10, fs10
                  feq.s        s3, fs10, fa3
                  feq.s        s9, fa3, fs10
                  srl          a3, a3, s4
                  fsgnjx.s     ft11, fs3, fs9
                  srl          sp, s6, s8
                  auipc        s9, 177456
                  fsgnj.s      fa4, fa2, fs8
                  mulhsu       t1, ra, t1
                  xori         s6, s1, 1256
                  slt          s8, t4, tp
                  lui          tp, 697950
                  srl          gp, t0, a7
                  fsgnj.s      fs0, ft6, ft4
                  xor          t4, s2, sp
                  sll          s6, s9, t0
                  sub          t3, sp, a3
                  slli         s11, ra, 23
                  fsqrt.s      ft10, fs2, rmm
                  fcvt.s.wu    fs3, zero, rmm
                  divu         s8, t4, gp
                  sltu         tp, s0, tp
                  sltiu        s8, a0, 1852
                  mul          s10, ra, zero
                  fcvt.s.wu    fs8, s6, rne
                  mulhu        t1, a4, s9
                  auipc        s0, 759022
                  and          gp, t0, s4
                  and          t6, tp, t6
                  or           s3, t1, t4
                  mulhu        t6, t4, s5
                  slli         a3, s4, 5
                  andi         s0, s10, -531
                  fsqrt.s      fa7, fs6, rne
                  rem          s1, a7, ra
                  addi         s3, sp, 1639
                  remu         t1, a4, s11
                  feq.s        a3, fs6, fa6
                  mulhsu       s5, sp, t3
                  or           a3, t2, a2
                  or           s7, s7, a6
                  sltu         zero, ra, s5
                  div          t3, s7, t0
                  sltu         ra, a7, a2
                  mulhu        a3, s6, ra
                  lui          a5, 673298
                  fmul.s       ft6, ft3, ft11, rne
                  or           t2, s9, a6
                  flt.s        s1, fs2, fs1
                  fmv.w.x      fa3, t0
                  fmin.s       fs6, fs2, fs7
                  fle.s        t4, ft9, fa2
                  sltu         sp, s4, a0
                  fsgnjn.s     fs6, fa5, fs10
                  srli         a4, s6, 3
                  fmax.s       fs4, ft2, ft9
                  fclass.s     t5, fs5
                  feq.s        s11, fs9, fa7
                  fle.s        t3, fs5, fa2
                  fsgnj.s      fs8, fs6, ft0
                  fmv.x.w      a4, fs9
                  divu         t2, a1, gp
                  srli         gp, a7, 16
                  mulhu        zero, a2, s6
                  and          s6, s9, s4
                  flt.s        a2, ft0, fs3
                  fsgnjn.s     ft10, fa4, fa4
                  fsgnjn.s     fa7, ft3, fs0
                  slt          s1, s6, s9
                  srli         s8, t6, 13
                  xor          a1, s8, s11
                  mulh         t5, s11, ra
                  fsgnj.s      fa5, ft8, fs11
                  fsub.s       fa1, fs7, ft9
                  remu         s8, s7, t1
                  add          s9, s7, sp
                  sltiu        s6, s3, -1628
                  fmv.w.x      fs9, t1
                  fclass.s     a5, ft9
                  ori          t4, s0, -1334
                  fmv.w.x      ft2, a4
                  divu         t5, t3, t5
                  mulh         a3, s1, a1
                  fmax.s       fs9, fa7, fs10
                  fadd.s       fs7, fs8, fs11, rup
                  sltiu        s0, a4, -1931
                  fdiv.s       fa7, fa1, fs7, rmm
                  fsqrt.s      ft2, fs5, rup
                  fcvt.s.w     ft9, t0, rtz
                  fmv.w.x      ft2, t1
                  fsub.s       fs8, fa7, ft0, rtz
                  fmax.s       fs7, fs6, fa4
                  fadd.s       fa3, fs11, ft8, rtz
                  fmax.s       ft3, ft3, fs10
                  andi         s10, s0, 105
                  fsub.s       fs10, fa5, fa5, rne
                  addi         tp, a4, -96
                  and          s3, t0, a5
                  and          s1, tp, t3
                  divu         a1, t6, s11
                  fclass.s     s8, ft0
                  and          a2, ra, s11
                  sltu         zero, sp, a5
                  fmin.s       ft2, fs6, ft11
                  fclass.s     s6, ft3
                  lui          a1, 578852
                  lui          t5, 1025537
                  fadd.s       fs10, ft11, ft4
                  sltiu        t3, a3, 1195
                  fsgnjx.s     fa0, fs3, fs9
                  fcvt.s.w     fs1, s5
                  rem          t5, t6, a6
                  mul          gp, s11, sp
                  add          a4, a1, s4
                  and          sp, a7, s0
                  div          a1, s3, s8
                  sll          a5, t5, t6
                  fmv.x.w      t1, ft5
                  slti         a3, a1, -870
                  sltu         zero, s7, tp
                  add          s10, ra, s4
                  fmul.s       ft11, fs9, fs3
                  flt.s        a4, fs10, ft4
                  sll          a5, sp, a7
                  add          s2, s3, t2
                  fsgnj.s      ft5, fa1, fs11
                  rem          gp, s3, a5
                  addi         s0, t0, 657
                  fsgnjx.s     ft0, fs1, fs9
                  fcvt.w.s     s5, ft11
                  fmul.s       fa7, ft3, ft4
                  fclass.s     s0, fa7
                  fsqrt.s      fs5, fs10
                  fcvt.s.w     fs7, s8, rdn
                  and          t6, s5, s4
                  fle.s        s10, ft8, ft6
                  fmin.s       ft5, ft4, ft10
                  add          s0, a0, s11
                  fsgnjn.s     fs4, ft10, fa7
                  fcvt.s.w     fs8, ra, rne
                  ori          s4, a0, -1112
                  ori          s3, zero, 1519
                  xor          zero, s5, sp
                  feq.s        a1, fa3, fs0
                  sltiu        s5, t1, -1017
                  fdiv.s       fa7, ft0, fs6, rdn
                  xor          s7, zero, t4
                  fle.s        ra, fs0, fs7
                  feq.s        a5, fa5, fs0
                  fmin.s       fs9, ft3, ft7
                  fmax.s       fa7, fa0, fa0
                  flt.s        s3, ft4, fa5
                  slti         a1, gp, 1126
                  fmax.s       ft0, ft11, fa4
                  flt.s        t3, ft9, fs11
                  fle.s        s2, fa6, ft0
                  fcvt.s.w     ft6, t2, rtz
                  fmax.s       fs7, fs2, fa1
                  mulhu        t2, a0, zero
                  fmax.s       fs4, fa4, ft4
                  fcvt.wu.s    s9, fs9, rtz
                  mul          s9, gp, a7
                  nop
                  fmin.s       ft7, fs10, ft3
                  sll          zero, s5, zero
                  div          a2, t0, s10
                  slli         t1, t1, 13
                  mulh         t0, s7, t2
                  fsgnjx.s     fs9, fs8, fs7
                  div          zero, ra, a4
                  sub          a1, s1, zero
                  fcvt.s.wu    fs4, a0, rmm
                  slt          a4, a1, t1
                  and          t1, tp, a7
                  fdiv.s       ft9, ft7, fs11
                  sra          s5, t6, a0
                  fcvt.w.s     t3, fa6
                  srai         a3, s1, 15
                  divu         s3, t2, sp
                  auipc        a2, 209816
                  fadd.s       ft6, fs5, fs9
                  fmax.s       fs0, fs4, fs6
                  slt          s3, s6, a0
                  andi         s7, t6, -155
                  sra          ra, tp, tp
                  fle.s        s4, ft6, ft11
                  fmv.w.x      fs10, s10
                  fdiv.s       ft2, ft0, ft11, rup
                  mulhsu       t1, t5, s7
                  and          s11, t1, s11
                  fclass.s     a2, fa0
                  and          t4, s3, ra
                  mulhu        t3, s4, t5
                  srli         a5, t0, 12
                  slt          s3, t0, s5
                  mulhu        t6, zero, s3
                  fsgnjx.s     fs5, ft4, ft2
                  feq.s        s2, ft6, ft8
                  srai         s9, s0, 21
                  flt.s        t5, fa5, ft0
                  nop
                  fcvt.w.s     a5, fs9
                  fsgnjn.s     ft11, ft3, fs7
                  sltu         s10, tp, tp
                  xor          s3, s10, t4
                  rem          t6, t6, s1
                  xori         s11, tp, -110
                  slti         s4, s9, 98
                  mulhu        s3, s9, sp
                  xori         t3, zero, 860
                  rem          s7, s0, a2
                  sll          a4, a4, s6
                  add          a2, a2, s5
                  sub          ra, t2, s4
                  srai         t6, zero, 17
                  mulh         s5, s5, s9
                  slt          a1, s2, a6
                  fadd.s       fa7, fs1, fa1, rdn
                  fcvt.s.wu    fa7, a0
                  sra          sp, s0, s11
                  fmin.s       fs4, fa2, fs11
                  and          t3, ra, s2
                  xor          s0, s11, a2
                  fcvt.s.w     ft4, s8
                  lui          s2, 965227
                  nop
                  fadd.s       fs10, ft3, fa6
                  fcvt.s.wu    ft8, sp
                  add          s10, t5, s9
                  and          s2, a3, zero
                  mul          t6, sp, s9
                  fmv.w.x      fs3, s9
                  flt.s        ra, fs8, ft3
                  srai         s2, zero, 22
                  xori         s7, a7, 1544
                  sub          s11, s2, s0
                  fadd.s       fs7, fa2, ft11, rne
                  fle.s        s1, fs0, ft4
                  slti         s5, s8, 1069
                  sltiu        s2, zero, 341
                  sub          s2, t1, a1
                  fsgnjn.s     ft10, fs0, fs3
                  divu         s2, s2, s10
                  fcvt.s.w     ft4, s7
                  sltiu        ra, sp, 1268
                  sra          t1, t4, s7
                  fcvt.s.wu    fa6, t4
                  fle.s        s3, fa5, fa4
                  fcvt.wu.s    ra, ft7
                  remu         s0, t5, t6
                  xori         s11, s4, 827
                  mulhsu       s1, s3, ra
                  fadd.s       ft11, fs5, fs9
                  fclass.s     t5, ft11
                  fsub.s       ft11, fs2, ft4, rtz
                  mulhu        s10, t6, s2
                  fmv.w.x      ft11, s2
                  and          s11, s11, t1
                  sltu         a1, s1, s10
                  fsub.s       fs6, fa7, fs4
                  fcvt.s.w     fa5, sp, rmm
                  srli         t0, s11, 14
                  fsgnj.s      fs8, fa1, fs10
                  xor          s1, s0, gp
                  fclass.s     t4, ft8
                  fcvt.w.s     s1, fa4
                  and          tp, a4, s9
                  fsgnjx.s     fs4, fs1, fs3
                  divu         a3, a3, t3
                  flt.s        a1, fs5, fs11
                  slt          s4, t4, a3
                  fcvt.s.w     fs8, s1
                  remu         t1, s0, a4
                  fle.s        a3, fs10, ft6
                  fcvt.s.wu    fa3, t2, rmm
                  fclass.s     s11, fa6
                  xori         t5, s0, 1485
                  and          t0, t6, s9
                  srl          t5, s6, s10
                  srli         t5, a3, 24
                  fmin.s       ft0, fs1, fs4
                  srl          a2, s9, s0
                  fmv.w.x      fs1, a0
                  fsqrt.s      ft9, fs5
                  sltiu        a1, s10, -1328
                  srl          a2, gp, t6
                  addi         s7, a3, 94
                  fcvt.s.wu    ft2, a3
                  xori         t4, s0, -370
                  fcvt.w.s     a1, fs5
                  and          s10, s7, s4
                  sra          a3, t3, t2
                  fsgnj.s      fa4, fa5, fs7
                  mul          s10, s10, sp
                  addi         a4, s4, 178
                  xor          s1, s11, t1
                  fsqrt.s      fa3, fs5, rup
                  fsub.s       fs1, fs4, fa3
                  fmul.s       fs9, fs11, ft7
                  mul          s11, a6, s10
                  fcvt.w.s     s8, ft11
                  addi         a2, s6, -1464
                  add          s9, t2, sp
                  fmul.s       ft11, fs4, ft11
                  or           s3, a6, t1
                  fcvt.w.s     t3, fa1, rdn
                  sub          t6, a4, s4
                  xor          sp, s3, s7
                  sll          a4, s1, tp
                  fmv.x.w      ra, fa7
                  or           s7, s3, a4
                  lui          t0, 751516
                  fclass.s     s4, ft3
                  rem          s2, s8, ra
                  lui          a1, 680752
                  andi         ra, s7, -1336
                  divu         tp, s6, s6
                  fsgnjn.s     fs1, ft8, fa5
                  fle.s        s9, ft3, fa1
                  andi         s11, a1, 164
                  sltu         s9, a2, s11
                  sll          s3, sp, s6
                  mulh         a3, gp, a7
                  feq.s        t2, fa2, fs7
                  fcvt.s.w     ft0, a4, rup
                  divu         a3, tp, ra
                  fmin.s       fs11, fa1, fa7
                  and          s3, a3, a4
                  sll          s10, s10, s7
                  sltu         s7, t2, a3
                  mulhsu       s1, a6, s0
                  addi         t3, tp, 1180
                  feq.s        sp, ft1, fa7
                  srai         s3, s2, 16
                  fsgnjn.s     ft3, fs10, fa1
                  nop
                  divu         s4, s4, a2
                  fcvt.w.s     t3, ft8
                  srai         t3, a6, 0
                  divu         zero, t0, s5
                  mul          s8, t0, s10
                  slti         t4, s2, 845
                  fadd.s       ft7, fs8, fs5
                  auipc        ra, 878363
                  srli         t1, t0, 21
                  andi         t2, a0, -1786
                  fcvt.s.w     fa7, t0, rne
                  fadd.s       ft1, fa7, ft4
                  slti         a1, a2, -578
                  or           t0, sp, a0
                  nop
                  rem          tp, a5, t2
                  fdiv.s       ft3, fa7, fs4
                  or           s8, t4, tp
                  fmv.x.w      s4, fs5
                  fclass.s     zero, ft2
                  slt          s4, s4, s11
                  fcvt.s.wu    ft8, t4
                  feq.s        a4, fa5, ft9
                  nop
                  fmv.x.w      t0, ft9
                  slti         s3, a1, 911
                  slli         s8, s8, 11
                  fsqrt.s      fa5, fa5
                  fmax.s       fs6, fa6, fa2
                  fle.s        zero, ft10, fs2
                  mulh         t4, s9, t6
                  srai         gp, t6, 11
                  fmv.w.x      fa1, s10
                  fmul.s       ft10, fs10, fa7
                  auipc        a4, 875938
                  auipc        s2, 473776
                  nop
                  add          a3, sp, t5
                  addi         s4, a3, -1317
                  fsqrt.s      fs7, fs0
                  sltiu        zero, t6, 1138
                  xori         gp, zero, 1804
                  fcvt.s.w     fs0, s11, rne
                  fmax.s       ft1, fs6, fs11
                  or           a1, s10, t6
                  divu         s2, s3, a7
                  andi         a2, s6, -56
                  fmv.x.w      s6, fs9
                  nop
                  mulh         s2, ra, t6
                  fmul.s       fa5, fa2, ft7
                  nop
                  mulhsu       s2, s8, s11
                  rem          s4, t6, s3
                  or           a4, s5, s8
                  auipc        a3, 872406
                  xor          a5, t3, tp
                  feq.s        tp, ft3, fa2
                  and          gp, s6, a0
                  addi         t5, t3, -1544
                  slli         s7, ra, 0
                  and          gp, a1, a0
                  fsgnj.s      ft8, ft7, ft5
                  addi         zero, sp, -757
                  fclass.s     s0, ft7
                  srl          s6, s7, s11
                  srli         a5, a0, 13
                  fsgnj.s      ft6, fa3, fs4
                  sltiu        s9, t2, 1912
                  xori         t3, t0, -1896
                  fclass.s     t3, fs2
                  mulhsu       s2, a3, s4
                  fsgnjx.s     ft6, fa1, fs0
                  feq.s        s10, fa0, fs9
                  and          a2, s9, t5
                  mulhsu       s0, s2, s8
                  sra          ra, t6, t2
                  fsgnjn.s     ft2, fa2, fa0
                  sltu         zero, a7, t5
                  fsgnjx.s     fs2, fs6, fa0
                  sltu         gp, tp, t4
                  divu         s5, t6, s2
                  fle.s        s10, fa2, ft6
                  xor          a3, t3, tp
                  addi         s11, s1, -1270
                  or           s5, s8, t6
                  slt          zero, s11, t0
                  fle.s        ra, ft2, fs0
                  auipc        zero, 899603
                  sra          s6, s8, t5
                  fclass.s     t6, fs1
                  sltu         s0, a2, a6
                  mulhu        tp, t5, s5
                  slli         s10, s8, 6
                  srl          ra, s2, a1
                  fcvt.w.s     a5, ft1, rup
                  fdiv.s       fa6, ft7, ft1
                  lui          s10, 117476
                  slli         sp, gp, 11
                  srli         t1, s6, 30
                  ori          tp, s7, 1033
                  sub          t4, ra, s6
                  divu         s9, a4, s6
                  fcvt.s.wu    ft1, a7, rtz
                  sltiu        tp, s3, 45
                  xor          s4, t6, s4
                  fsub.s       ft8, fa0, ft7, rdn
                  fsgnjx.s     fs10, ft10, fa5
                  fcvt.s.wu    ft6, s10
                  or           a2, s7, a4
                  mulhsu       a3, t1, gp
                  or           a5, zero, s1
                  fcvt.s.wu    ft5, t3
                  feq.s        s11, fa6, fs10
                  feq.s        s0, fs2, fa5
                  fadd.s       fa3, fs0, ft9, rmm
                  addi         zero, gp, 1898
                  fmv.w.x      ft0, s5
                  fmv.w.x      ft3, tp
                  fclass.s     tp, fa7
                  sltiu        s2, t3, -903
                  fmv.w.x      ft8, ra
                  fsub.s       fs3, fs0, fs4, rmm
                  and          s11, t2, a6
                  fmin.s       ft6, fa5, ft7
                  srli         sp, a4, 7
                  or           tp, s4, t6
                  fcvt.s.wu    fa1, s2, rup
                  fadd.s       ft2, fs4, ft4, rmm
                  mulh         sp, s0, s1
                  mulh         a4, a7, s6
                  lui          s3, 570486
                  andi         t4, s2, -137
                  fmax.s       fs8, ft5, ft8
                  fmin.s       fs1, fa5, fs5
                  sltu         t3, s1, s0
                  mulhu        t0, t4, t3
                  fmv.w.x      fa2, s5
                  add          s10, t2, a5
                  fclass.s     s0, fs11
                  srli         s6, t4, 8
                  ori          a1, s11, 130
                  srli         t3, s0, 1
                  fdiv.s       fs5, ft0, fa2, rdn
                  fsgnjn.s     fa2, fs2, fs5
                  and          t6, tp, a1
                  fcvt.s.w     ft3, t4, rup
                  xori         a1, t1, 911
                  xori         a5, tp, 1307
                  slt          t5, gp, t1
                  fcvt.s.w     fs10, a6
                  fmax.s       ft2, fa4, fa7
                  fcvt.s.w     fa6, gp, rne
                  srli         s4, t6, 14
                  fmin.s       ft6, ft6, fa4
                  mul          a4, tp, s10
                  ori          s10, a0, 1771
                  sltiu        a4, t3, 1945
                  fmv.w.x      fs3, s8
                  div          gp, s0, t6
                  div          t3, t5, s10
                  slti         s5, tp, 1468
                  srli         s7, a6, 1
                  feq.s        sp, fs8, ft4
                  sub          t3, s11, s6
                  sll          a1, t5, t6
                  fsgnjx.s     ft9, fa6, ft10
                  fclass.s     s8, fa1
                  sub          s11, t3, s10
                  slti         t0, a2, -1402
                  fle.s        a4, ft5, fs5
                  fclass.s     s2, fa3
                  fmin.s       ft8, fs1, fa0
                  andi         s5, s1, 1583
                  fclass.s     t2, ft5
                  auipc        s7, 590502
                  srai         t3, a6, 5
                  slt          t4, a1, s2
                  add          sp, s4, a6
                  fcvt.s.wu    fa1, tp, rmm
                  fcvt.s.w     fa7, s9, rup
                  fdiv.s       fs4, fs7, fs7
                  add          s10, a7, a4
                  nop
                  slti         t6, s10, -191
                  fcvt.s.wu    ft8, a0, rdn
                  slt          t0, s1, s1
                  srl          a1, s0, a5
                  slt          s11, s11, t3
                  fsgnj.s      fa2, fs0, fs2
                  add          s7, tp, s1
                  fsgnjx.s     ft0, ft4, fs7
                  mulhu        gp, a2, zero
                  fsgnjn.s     fs8, ft11, fs5
                  rem          t6, s10, s6
                  fdiv.s       fa6, ft0, ft2, rtz
                  fmv.x.w      s3, fa0
                  ori          t0, t5, -1697
                  fcvt.s.w     fs8, s6
                  fsqrt.s      ft3, ft11, rup
                  sub          gp, a6, t2
                  mulhu        s6, a1, t4
                  and          s1, s1, gp
                  sub          s2, s2, s4
                  sra          s7, a6, a0
                  sltu         t1, s1, s3
                  fcvt.s.wu    ft5, a7
                  fsgnj.s      ft8, fa7, fa0
                  fmin.s       fs1, ft9, ft1
                  flt.s        t0, fs2, ft8
                  or           s7, a7, t1
                  fsgnj.s      fa5, fa1, ft10
                  fclass.s     s7, fs9
                  xori         t3, s7, -1810
                  xor          sp, a3, s4
                  mulhsu       a5, t6, s0
                  slti         ra, s11, 449
                  fle.s        a1, ft9, ft7
                  rem          s0, tp, a6
                  auipc        s0, 517996
                  flt.s        t5, fs0, fs0
                  fle.s        s9, fa4, fa3
                  sltiu        a4, s6, 1272
                  mul          s3, s6, a6
                  fsub.s       ft0, ft7, ft11
                  fmv.w.x      ft0, s10
                  sltu         s5, s11, tp
                  flt.s        a1, ft2, fs9
                  auipc        s10, 46760
                  srl          s0, s10, s8
                  fmin.s       fs2, fa0, fa7
                  mulhu        ra, a0, ra
                  sltu         s8, t2, s8
                  sltu         t3, gp, s0
                  slli         s9, a7, 2
                  fsgnj.s      fs2, fa4, fa5
                  fle.s        a1, fs7, ft3
                  fcvt.s.w     fa6, a4, rtz
                  ori          a3, a3, -1984
                  fsgnjx.s     ft0, fa2, fs4
                  srl          s8, s3, s9
                  fcvt.w.s     t6, ft6
                  srl          tp, gp, s8
                  fsub.s       fs1, fs3, ft8, rdn
                  fsgnjx.s     fa1, ft0, fa3
                  flt.s        s8, fs9, ft11
                  xori         s3, a0, -26
                  flt.s        s6, fs5, ft4
                  xori         t6, tp, -1707
                  slt          a3, a7, s10
                  ori          ra, s8, -1700
                  slli         tp, zero, 6
                  mulh         t5, a1, a6
                  fsgnjx.s     ft4, ft11, fs3
                  fcvt.s.w     fa2, gp
                  mulhu        s2, s5, s4
                  add          s3, a4, s2
                  fcvt.wu.s    s2, fa5, rne
                  feq.s        t1, ft1, fa4
                  slli         t0, a5, 19
                  fsqrt.s      fs8, fa4
                  remu         a5, a1, a4
                  fsqrt.s      fa5, fs4
                  fdiv.s       ft10, fs10, fa2
                  add          gp, s11, s6
                  fmv.w.x      fa3, a4
                  srli         t0, t4, 0
                  xor          s10, a4, t1
                  fsqrt.s      fa0, fa4
                  srli         t0, t6, 5
                  fle.s        a5, ft3, ft0
                  feq.s        s2, fa6, fa1
                  fsgnjx.s     ft1, fs10, ft10
                  srai         s11, t5, 31
                  fmv.w.x      ft0, s11
                  fcvt.s.wu    fa2, gp
                  fcvt.wu.s    s11, fs8
                  fadd.s       fs3, ft3, fs5, rmm
                  mulh         s5, s2, s8
                  fmul.s       fs11, fs11, ft5, rne
                  fmul.s       fs9, fs2, ft10
                  xori         s1, a0, 1331
                  ori          t4, a2, 699
                  fmax.s       fs0, fa7, fs0
                  mulhsu       ra, a0, sp
                  fmv.x.w      t0, fs2
                  fcvt.wu.s    t2, fa4, rup
                  mulh         a4, s6, t1
                  add          a4, a6, sp
                  fsgnj.s      fs1, ft9, fa7
                  mulh         a3, a5, zero
                  fmin.s       fa6, ft11, fs3
                  sra          s9, gp, t2
                  auipc        t5, 808430
                  sltiu        ra, a1, 1578
                  ori          t5, s8, 1950
                  fmin.s       fs11, fa6, ft7
                  mul          s2, s11, a7
                  sltiu        t5, a7, -1862
                  feq.s        t5, ft0, ft3
                  fdiv.s       fs3, ft2, fs8
                  slt          t1, s1, a3
                  fmin.s       fa4, fa2, fs7
                  sltu         t2, t1, ra
                  fcvt.w.s     a2, fs11
                  slti         t3, a1, 1820
                  fmv.w.x      ft3, sp
                  mulh         s6, s5, a5
                  xori         s11, t0, 1120
                  fcvt.s.w     fs4, a0, rtz
                  slli         t2, t4, 0
                  addi         s11, s1, -22
                  auipc        t5, 1020090
                  add          a3, s11, zero
                  flt.s        a3, fa1, ft10
                  slti         s3, gp, 529
                  srl          s7, a6, s9
                  fsub.s       fa3, ft9, ft4
                  remu         s11, t2, zero
                  div          t1, t3, s7
                  fsqrt.s      ft10, fa3
                  slti         t6, s7, -107
                  fdiv.s       fs4, ft5, fa2, rne
                  mulhu        gp, t0, s2
                  ori          tp, s6, -1698
                  mulhsu       s4, s0, s4
                  sltu         s6, sp, a5
                  auipc        a4, 728549
                  fcvt.wu.s    s5, fs3
                  fcvt.s.w     fa0, t3, rtz
                  fcvt.wu.s    a2, fa6
                  slt          gp, a0, t3
                  nop
                  auipc        t4, 699589
                  or           tp, tp, s8
                  fcvt.wu.s    s11, fs8, rdn
                  fcvt.s.w     fs1, s5
                  fclass.s     a5, fs3
                  fsub.s       fa6, fs2, ft0
                  fsgnjx.s     ft9, fs2, fa4
                  nop
                  slti         a1, a2, -1608
                  sltiu        t5, t1, -432
                  add          t4, gp, t5
                  fmax.s       ft6, ft9, ft3
                  xori         t1, a2, 1948
                  fmv.x.w      t2, ft5
                  srai         t6, a3, 8
                  nop
                  slli         s4, a3, 10
                  fmv.w.x      fa0, ra
                  ori          a5, s11, -428
                  fle.s        s6, ft0, fs3
                  and          zero, s2, a1
                  fcvt.s.wu    ft8, tp
                  fle.s        gp, fs5, fs5
                  andi         s2, a7, 1119
                  fmax.s       fs2, ft8, ft6
                  srai         s11, s9, 3
                  rem          s10, a2, sp
                  fmax.s       fs0, ft7, ft3
                  addi         s2, a7, -573
                  lui          s11, 172969
                  fdiv.s       ft9, ft8, fa5, rtz
                  rem          s4, a7, t2
                  fmax.s       fa3, fs3, fs5
                  xori         s0, a4, -262
                  fsgnjx.s     fa2, fs4, fs5
                  lui          s9, 76235
                  flt.s        s11, ft11, ft1
                  mul          s2, t5, s8
                  divu         t1, s0, t0
                  fclass.s     s3, fs0
                  fcvt.s.w     fa7, a4
                  fclass.s     s7, fs8
                  and          t1, t3, gp
                  add          sp, ra, t0
                  srli         s9, a0, 25
                  fadd.s       ft10, fa5, fs1
                  fsub.s       fs1, ft11, fs4
                  fmv.w.x      fs8, gp
                  slti         s2, t3, 1640
                  add          ra, s1, a0
                  fmv.x.w      a1, fa7
                  div          sp, gp, a0
                  slt          tp, s7, s11
                  srli         a2, s9, 16
                  nop
                  addi         gp, sp, -23
                  fmax.s       fa2, ft1, ft11
                  div          t0, a6, s0
                  xori         s11, s6, 492
                  sra          t2, s2, t2
                  sll          s10, s10, gp
                  sll          t3, t5, a1
                  fcvt.s.w     fs2, sp
                  slt          gp, t0, a2
                  remu         sp, a5, a3
                  fadd.s       fs3, ft8, fs6, rdn
                  feq.s        t6, fa3, ft3
                  srl          s8, s3, sp
                  fmv.x.w      t0, ft3
                  div          ra, s5, a5
                  fmin.s       ft9, ft9, ft2
                  fmul.s       ft9, ft8, fa0
                  mulhsu       gp, a0, s4
                  add          s11, a3, t6
                  fmin.s       ft2, ft7, ft0
                  mulh         a4, s4, s6
                  fmax.s       ft4, ft7, fs8
                  srai         t2, s6, 12
                  lui          sp, 635757
                  fdiv.s       ft2, ft9, ft11
                  divu         a2, s3, s3
                  remu         a3, a0, gp
                  srai         gp, t5, 30
                  mulh         t3, t4, t1
                  mulhu        s9, s5, t6
                  sltu         t4, t6, s3
                  fmv.w.x      fs5, s6
                  mulhsu       a3, a5, s6
                  sltiu        t3, s11, 226
                  slti         t4, t1, -1540
                  or           s7, t6, a4
                  srli         t6, a5, 21
                  xori         a4, s4, -374
                  fadd.s       fs3, ft10, fs7
                  remu         s10, a5, a5
                  divu         ra, t6, a2
                  rem          a1, a1, a0
                  ori          s0, a5, 1943
                  fsgnjx.s     fa0, fs6, fs4
                  sra          s10, s3, a1
                  srli         t2, gp, 2
                  srl          t2, a1, a2
                  sra          s8, s6, t1
                  fmax.s       fa7, fa4, fs0
                  slli         t1, a5, 28
                  fle.s        t2, fs7, ft5
                  xori         a2, tp, 1408
                  fmin.s       ft3, fs9, fs4
                  fcvt.wu.s    a1, fa4, rne
                  fdiv.s       ft0, fa7, ft6, rne
                  fsqrt.s      fa6, fs4
                  sll          t5, s10, gp
                  fcvt.s.w     ft8, s9
                  feq.s        s9, fs1, ft11
                  andi         s11, sp, 1112
                  sra          a2, s3, a6
                  fsgnjx.s     ft1, fa6, fs2
                  slti         a3, zero, 191
                  fmin.s       fs2, ft2, fs6
                  flt.s        a3, ft7, fs2
                  slt          a2, s6, a3
                  srl          s10, a0, gp
                  srl          s6, t3, sp
                  fmin.s       ft4, fs7, fa5
                  sub          tp, s1, a3
                  fmv.x.w      sp, fs11
                  auipc        tp, 86105
                  divu         gp, a4, s5
                  mul          gp, ra, zero
                  sub          a4, t3, t0
                  mulh         a4, t0, t4
                  sra          a1, s5, t3
                  fsqrt.s      ft11, ft7, rtz
                  lui          t2, 497773
                  mulhu        t2, s3, a2
                  mul          s5, s5, a7
                  lui          s11, 866514
                  srl          s1, t2, s5
                  mul          s7, s9, t6
                  andi         t1, s6, -211
                  srli         a5, s10, 28
                  fmv.x.w      s1, fs8
                  srai         tp, t3, 31
                  andi         t2, t0, -196
                  andi         s4, s11, 1626
                  feq.s        s5, fs0, fs0
                  fadd.s       ft11, ft8, ft8, rdn
                  mulhu        s0, t1, ra
                  rem          a5, s4, a1
                  srli         sp, ra, 17
                  fclass.s     ra, ft9
                  fmv.x.w      s1, fa5
                  fdiv.s       fs0, fs7, fs9
                  fsgnj.s      fa3, fs4, ft2
                  sltiu        a5, t5, -1511
                  and          sp, s4, sp
                  fmv.w.x      fs4, s3
                  slli         a1, t4, 30
                  sra          s3, a6, s10
                  remu         s10, tp, sp
                  fdiv.s       ft9, ft11, fa7
                  fcvt.wu.s    t4, fs2, rup
                  remu         t1, s6, zero
                  remu         t6, a3, t0
                  flt.s        s8, fs7, fs7
                  srl          gp, a5, a6
                  fmv.x.w      t4, fs11
                  rem          t0, a0, a3
                  sub          t1, t5, zero
                  slti         s10, s9, 1424
                  fmv.w.x      ft9, s0
                  nop
                  fdiv.s       ft4, ft8, fa7, rdn
                  add          s9, s4, t2
                  divu         s9, s5, t2
                  fcvt.w.s     s4, ft10
                  add          sp, a3, t4
                  fsub.s       ft0, ft4, fs3
                  fdiv.s       fa6, fs1, ft9
                  sub          s11, zero, gp
                  slti         a5, a7, -1641
                  add          s6, t2, t1
                  rem          s8, sp, t6
                  sll          t0, t3, a4
                  fcvt.s.wu    fs8, t4, rmm
                  fcvt.wu.s    t0, ft0, rmm
                  flt.s        s5, fa1, ft7
                  feq.s        a4, fa6, ft9
                  mulhu        a4, t4, s2
                  and          s11, sp, a7
                  slti         t0, s8, 207
                  fsub.s       fa3, fs2, fa6, rtz
                  sra          ra, gp, s1
                  fmin.s       ft4, ft8, fa2
                  srl          s3, gp, ra
                  slt          t3, a6, a6
                  remu         gp, a1, tp
                  fsqrt.s      fs7, fs2, rdn
                  fdiv.s       fa5, fs3, fs10
                  fcvt.s.wu    ft5, s1, rtz
                  fsub.s       fs9, fs7, fs5, rup
                  addi         t6, a5, -2012
                  fmul.s       fa4, fs9, ft10
                  fle.s        s9, ft8, fs7
                  nop
                  mul          s9, s5, t1
                  sub          zero, t2, s9
                  lui          a4, 294541
                  fmax.s       fa6, fs10, fa3
                  fsqrt.s      fs6, fa7, rne
                  div          t4, a4, t1
                  remu         s6, s4, t6
                  fmin.s       ft5, ft1, fs11
                  fmul.s       ft3, ft8, fa6, rmm
                  sra          s5, t1, a1
                  sll          tp, s8, s5
                  sltiu        a5, t1, -1950
                  fsgnj.s      fa7, ft10, fs8
                  fcvt.s.w     ft6, s3
                  feq.s        s6, fs5, ft7
                  ori          t5, a6, 1777
                  auipc        sp, 1039247
                  srai         a5, gp, 11
                  slt          zero, a1, tp
                  fsgnjn.s     fs5, ft10, fs11
                  mulhu        sp, a7, gp
                  mulhu        zero, sp, s10
                  slli         a2, s2, 21
                  mulh         t3, s9, a6
                  fsub.s       ft7, fs5, fa0
                  fcvt.w.s     t5, fs9, rmm
                  fsqrt.s      fa4, ft3
                  sra          tp, a3, s1
                  sll          t1, t5, t6
                  or           t6, t6, t5
                  fmin.s       fs7, fa0, fs4
                  sltu         t2, a2, a5
                  fcvt.wu.s    s3, fa3, rne
                  fsgnj.s      fs0, fs2, fs7
                  slti         a1, s7, 1432
                  fmv.w.x      fa6, t5
                  srli         t2, sp, 22
                  mulhsu       a3, a1, t5
                  sll          s0, t2, s3
                  fmax.s       fs2, ft4, fs10
                  or           t3, s7, s6
                  sub          s11, s3, s6
                  fclass.s     s0, ft11
                  xor          s9, a6, a7
                  remu         a4, a0, a0
                  ori          a1, s9, -1591
                  auipc        t5, 982198
                  xor          t3, s3, s5
                  srai         a4, a7, 17
                  fmv.w.x      fa6, a0
                  fmv.x.w      s10, fs9
                  srl          a4, s9, zero
                  sll          a4, a1, t2
                  div          t1, zero, a1
                  fle.s        s11, fs7, fs2
                  fcvt.wu.s    s2, ft2, rmm
                  slli         a1, s8, 18
                  and          s1, s11, t4
                  addi         s1, s10, 1531
                  srl          s2, ra, s9
                  slti         gp, t4, 1485
                  div          a4, s4, s4
                  srai         s10, ra, 31
                  fmul.s       ft11, ft4, fs9
                  sll          t6, s6, gp
                  fclass.s     a5, fa0
                  nop
                  fdiv.s       ft1, fa1, fa7
                  flt.s        t6, fa6, ft7
                  add          s1, gp, a1
                  fsgnjn.s     fa1, fs10, fs9
                  slt          tp, s4, t5
                  add          a2, s9, s6
                  auipc        a2, 175245
                  sll          a5, tp, s6
                  fcvt.s.wu    ft11, ra, rup
                  flt.s        s11, fs5, fs3
                  slli         a5, s8, 17
                  sltu         a3, s8, tp
                  mulh         s5, a5, a2
                  sub          a2, t1, t2
                  fmv.x.w      a2, fa6
                  fcvt.s.w     fs7, s1
                  xori         a5, ra, -285
                  remu         sp, t6, a6
                  fsgnjx.s     fs3, fs8, ft10
                  lui          gp, 855706
                  fcvt.wu.s    zero, ft1, rmm
                  and          t5, a5, s2
                  srai         t3, s3, 30
                  fdiv.s       ft6, fs4, fs6
                  srli         s11, s2, 11
                  fcvt.wu.s    s1, fa4, rmm
                  fmax.s       ft9, ft8, ft3
                  fcvt.w.s     a1, ft11, rtz
                  mulhu        a1, s3, sp
                  fsgnj.s      ft4, fa6, fa6
                  slli         s3, a1, 22
                  fle.s        t5, fs5, fa3
                  fadd.s       ft2, fa5, fs1
                  fle.s        t2, fs5, ft2
                  fadd.s       fs11, fa4, fa2
                  slt          tp, t3, t4
                  xor          t3, a1, a4
                  fmin.s       fs9, ft9, ft7
                  fsgnjn.s     fs4, fs10, fs7
                  sra          a3, t2, s8
                  div          s5, a1, zero
                  addi         t5, s1, -1902
                  slti         s3, t0, 713
                  add          zero, a3, a5
                  srl          zero, a1, t4
                  fcvt.s.wu    ft8, s9, rtz
                  sltu         s2, s6, s0
                  fcvt.s.wu    ft7, a0, rup
                  ori          a1, zero, -1336
                  sll          t4, s4, a6
                  rem          s8, s8, s2
                  or           s10, s7, a3
                  fcvt.wu.s    t2, fa1, rtz
                  fmul.s       ft4, fs11, ft7, rne
                  xori         a2, a1, 177
                  sll          s6, t0, a0
                  div          ra, tp, a1
                  fmax.s       fa4, fs5, fa3
                  ori          s7, gp, -1210
                  fmul.s       ft9, fs2, fs11
                  sltu         t1, t5, s9
                  mulhu        s1, t0, t6
                  fcvt.s.w     fa5, s2
                  srai         s10, s4, 31
                  mulhu        s8, s11, s6
                  fmv.x.w      zero, fa7
                  sra          t0, s2, gp
                  add          s1, s3, gp
                  lui          t3, 361626
                  xori         zero, s6, -1605
                  fle.s        s9, ft3, ft7
                  lui          t4, 512050
                  fmin.s       fa1, fa5, fs11
                  nop
                  fclass.s     s0, fs5
                  or           s4, t1, t5
                  lui          tp, 305158
                  auipc        s10, 868668
                  srl          a5, s3, a2
                  fle.s        zero, fa6, fs3
                  fcvt.s.wu    fs5, s6, rmm
                  andi         s11, s10, -412
                  and          a3, s8, t5
                  fcvt.s.w     ft9, tp, rtz
                  xor          a2, t1, a3
                  auipc        a1, 200844
                  srli         s11, sp, 30
                  fsgnj.s      ft10, ft5, fs5
                  xor          t0, a2, t5
                  slti         a3, s9, -959
                  slt          s10, a5, s9
                  srai         s5, s8, 20
                  lui          sp, 785123
                  fcvt.w.s     sp, ft9
                  div          s3, t6, s8
                  divu         a2, a7, s5
                  fmax.s       ft3, ft11, fa6
                  nop
                  srli         t0, s8, 11
                  lui          sp, 576136
                  sll          gp, tp, a2
                  fcvt.w.s     t6, ft0
                  sra          a3, a4, a7
                  div          zero, t1, t0
                  slti         t2, a6, 1747
                  fmax.s       fa5, ft1, fs7
                  srli         s3, t4, 18
                  rem          s4, t0, s6
                  slli         t3, a6, 20
                  div          a5, s4, s9
                  sll          s9, a5, t5
                  fmv.x.w      t2, ft10
                  fcvt.w.s     s9, ft3, rne
                  mulh         a3, s11, t0
                  sra          s5, a0, s8
                  fclass.s     gp, fs4
                  sra          t1, s3, s1
                  srai         t4, sp, 14
                  sll          gp, s7, s3
                  div          s2, s1, s8
                  fle.s        s6, fa4, ft9
                  xor          s7, a3, gp
                  fcvt.s.wu    fs6, a6
                  slti         gp, s10, -890
                  ori          s2, s0, 59
                  fclass.s     t0, ft7
                  slti         t6, a5, 1680
                  mulhu        gp, gp, s1
                  flt.s        ra, ft6, fs4
                  sltiu        s1, t3, 1187
                  nop
                  srli         s2, s10, 14
                  fsqrt.s      ft7, ft0
                  fdiv.s       ft0, fa3, ft5
                  slli         t1, s7, 17
                  andi         s0, a5, 589
                  fmv.w.x      fs0, s8
                  fcvt.wu.s    t2, fa1, rup
                  fsqrt.s      fa5, fs1, rdn
                  slt          t3, t2, a0
                  fmul.s       fa6, fa7, fs8, rup
                  slti         a5, s9, 1539
                  srai         a4, a6, 21
                  auipc        s10, 168776
                  fsub.s       fs5, ft9, ft1
                  lui          a2, 326986
                  divu         t2, t1, t2
                  nop
                  and          t1, a2, t6
                  fcvt.s.w     fs7, s3
                  fsgnj.s      ft3, ft4, fa5
                  fmv.w.x      ft1, gp
                  fcvt.w.s     t3, ft2, rup
                  fmul.s       ft7, fs4, ft6
                  divu         t3, a2, a0
                  add          t1, s8, t6
                  fcvt.s.w     fa1, s2, rdn
                  fcvt.s.w     fs10, a2
                  fsqrt.s      ft11, ft8
                  fcvt.s.wu    ft2, s1
                  fcvt.wu.s    t4, fa5, rne
                  mul          zero, t6, ra
                  fmv.w.x      fs0, s2
                  fsgnj.s      fa1, ft10, fs3
                  xor          zero, t4, a0
                  ori          s11, sp, 444
                  sltu         ra, tp, s10
                  slti         t1, tp, -367
                  xori         s11, tp, 827
                  fsub.s       fs4, ft5, ft11, rmm
                  fcvt.s.wu    ft3, s5
                  fdiv.s       fs0, ft7, fs0
                  sltu         t0, zero, t6
                  fsgnj.s      fs11, ft9, fs7
                  srli         zero, s5, 23
                  fmax.s       fa5, fa4, fs10
                  andi         sp, a4, -2
                  fmin.s       fa3, fs5, fa7
                  fcvt.s.w     fs1, t4, rmm
                  xori         a3, a7, -1596
                  sll          t2, s4, zero
                  sra          zero, s7, t0
                  nop
                  lui          s8, 1035370
                  fmul.s       fs4, fs6, fa4
                  fcvt.s.w     ft1, s5
                  remu         s3, a4, a5
                  srl          sp, gp, tp
                  lui          t4, 98736
                  fcvt.wu.s    a3, ft1
                  ori          s10, s7, 1356
                  rem          t6, a6, t1
                  fdiv.s       fa3, fa2, fa1, rmm
                  fcvt.wu.s    sp, ft7
                  auipc        t5, 619255
                  remu         zero, t6, a5
                  mulhsu       ra, s3, s0
                  srai         s8, s6, 21
                  flt.s        t0, ft1, ft8
                  add          s9, tp, s1
                  slli         t6, t3, 10
                  srli         s7, a1, 18
                  fsgnjx.s     fa6, fs6, ft2
                  addi         ra, a3, -1845
                  sll          ra, t1, a7
                  fclass.s     s4, fs0
                  fclass.s     sp, fs9
                  fdiv.s       fa4, fa6, fs5
                  add          a5, a7, s5
                  addi         t4, s6, 880
                  and          t6, a7, a2
                  sub          gp, a5, t5
                  or           s9, a0, s9
                  sltiu        s7, s11, -969
                  feq.s        ra, ft3, fs0
                  addi         s0, a3, -1167
                  add          a1, t0, t6
                  fcvt.w.s     s1, fs5
                  fsgnj.s      fa0, fs8, fa4
                  nop
                  srli         a5, zero, 22
                  addi         a3, a3, 1216
                  sltu         a3, ra, tp
                  mul          s4, s3, s6
                  addi         s7, s9, -1701
                  fcvt.wu.s    a5, fs1, rdn
                  mulhsu       s11, a6, a2
                  fadd.s       fs8, fa6, ft10
                  addi         ra, s4, 1976
                  slli         s8, s11, 31
                  mulh         t3, s3, s11
                  remu         s10, t4, gp
                  sltiu        s0, t0, 1987
                  sub          s1, s11, s8
                  feq.s        s6, fs3, fa5
                  ori          s2, a5, -1237
                  slt          a5, t5, ra
                  fadd.s       ft4, ft6, ft8
                  sll          t6, a3, a0
                  sra          a2, s8, s11
                  fmv.x.w      s7, fs5
                  auipc        s10, 771810
                  slli         s1, a1, 26
                  fclass.s     t1, fs11
                  sltiu        a4, a3, -188
                  fcvt.s.wu    fs9, a5
                  sll          a5, s11, t1
                  fclass.s     a2, ft10
                  ori          ra, s10, -479
                  srai         s0, s3, 16
                  fcvt.s.w     fs4, s3, rmm
                  andi         t1, ra, 1746
                  fmul.s       ft4, ft1, fa7
                  fmul.s       ft4, fa6, fa6, rup
                  fsgnjx.s     ft1, ft7, fa1
                  slt          s11, t5, zero
                  mulhsu       sp, zero, s3
                  fle.s        t6, ft7, ft7
                  slli         t2, t2, 1
                  slti         a5, a5, -84
                  fsgnj.s      ft10, ft3, fs11
                  srai         s1, s9, 0
                  remu         s1, t4, t6
                  sll          t1, s9, gp
                  fmul.s       ft9, fs4, fa1, rne
                  fcvt.wu.s    s10, ft1
                  or           gp, a5, s1
                  fsgnjx.s     fs4, fa3, fs8
                  fmv.w.x      ft3, a1
                  auipc        s8, 771996
                  fmv.w.x      fs6, s4
                  fadd.s       fs7, ft3, fa7, rmm
                  mul          s0, t0, a7
                  fcvt.s.w     fs5, a0
                  sub          a4, s2, a0
                  fcvt.w.s     tp, fs11
                  fsgnjn.s     fa5, fs9, fs10
                  srli         t2, a0, 9
                  div          t3, gp, a2
                  fsgnjx.s     ft10, ft2, fa5
                  addi         s10, t2, -1753
                  fsgnjn.s     ft9, fs0, fa7
                  sltiu        s8, gp, 1022
                  sltiu        a2, s6, -564
                  fcvt.wu.s    tp, fs2, rtz
                  flt.s        a5, ft3, fa1
                  and          t6, a1, a3
                  mulhsu       t1, a1, s7
                  divu         t5, s6, t1
                  slti         s5, a4, 1084
                  slti         ra, a1, -2026
                  and          s2, s10, a3
                  fmv.w.x      fs9, zero
                  srli         a4, gp, 0
                  fmul.s       fs6, fa0, ft8
                  add          s2, a2, t0
                  srl          a3, a5, t4
                  fsub.s       fs7, ft2, fa3
                  mulhsu       s6, s8, t5
                  fcvt.w.s     t3, ft0, rmm
                  fcvt.w.s     a2, ft7
                  fle.s        s4, fs3, fa3
                  srai         t2, sp, 30
                  fcvt.s.w     fs6, s3
                  sra          s4, t3, s9
                  xor          t0, a1, t0
                  fmul.s       fs8, fs2, ft2
                  ori          s1, t5, 1312
                  fmul.s       ft10, fs0, ft3, rup
                  sll          a4, t4, tp
                  xori         a5, sp, -737
                  slt          s6, zero, t1
                  divu         s0, t6, a5
                  ori          s11, s2, -135
                  fclass.s     s6, ft0
                  auipc        s1, 430690
                  fdiv.s       ft8, fa3, ft10, rmm
                  or           gp, tp, s2
                  div          t3, s2, t6
                  fsub.s       fs8, fs11, fs4
                  sll          s0, s6, t0
                  div          zero, s3, t4
                  fsgnj.s      ft11, ft0, ft7
                  mulhu        s5, a3, a6
                  fmv.x.w      t4, fs1
                  sltiu        s10, sp, 1685
                  slt          s11, a2, a1
                  fsgnjn.s     ft4, fa6, fa6
                  slti         s0, t4, -1460
                  fmv.x.w      t5, fa5
                  mulh         tp, a1, t2
                  fadd.s       fs6, ft6, ft5, rtz
                  fclass.s     ra, ft8
                  remu         ra, s9, a6
                  fadd.s       ft6, ft5, fs4, rup
                  fdiv.s       fs4, ft8, fa4
                  mul          tp, s4, a6
                  fmax.s       ft8, ft6, ft11
                  feq.s        s1, fs9, ft8
                  fsgnj.s      fa7, fs4, fa6
                  fcvt.wu.s    s2, ft11, rup
                  slti         tp, a5, -1020
                  fsqrt.s      fs4, fs8, rne
                  andi         s9, s11, -526
                  lui          a5, 267434
                  xor          t1, t2, t4
                  fcvt.w.s     s0, fs2
                  srai         t6, s0, 28
                  srai         s10, t4, 26
                  fmax.s       fa0, fs11, ft11
                  flt.s        a5, ft10, fs10
                  fmax.s       ft10, fa7, fa2
                  div          a5, t6, t0
                  fadd.s       ft8, ft11, fs10
                  or           s6, a1, t6
                  fcvt.w.s     t3, fa7, rmm
                  fmax.s       fs9, fa1, ft2
                  flt.s        a4, fa1, fa3
                  fmin.s       ft1, fa2, fa6
                  fsqrt.s      fa5, ft11
                  mulhsu       sp, t1, sp
                  xori         s11, t4, 1374
                  fdiv.s       ft5, fs7, ft10
                  addi         a5, tp, 116
                  addi         s10, s4, 1298
                  divu         s10, t4, a0
                  slli         s11, t3, 21
                  ori          t0, a0, 1026
                  fcvt.s.w     ft9, sp
                  fcvt.s.wu    ft10, t6, rmm
                  fsqrt.s      fs10, fs9, rmm
                  add          a1, t6, s4
                  fle.s        s8, ft1, fs10
                  flt.s        t2, ft8, fa0
                  auipc        gp, 375876
                  srl          s9, s4, t0
                  andi         gp, gp, 1050
                  mulh         s2, t3, s9
                  xori         ra, s6, 1994
                  fadd.s       fs5, fa4, fs8, rdn
                  xor          s3, t2, a4
                  andi         t4, s1, -1753
                  fmax.s       ft11, fa2, ft8
                  fcvt.s.wu    fs2, s0, rtz
                  flt.s        s10, fa5, ft6
                  fsgnj.s      fa6, fs11, fa1
                  xor          s2, t5, a3
                  fcvt.s.wu    fs1, a6, rmm
                  fmax.s       fs2, fa5, ft4
                  sra          s6, sp, a4
                  mulhu        s8, s5, s1
                  sub          t6, s8, s0
                  sltiu        s5, s2, 70
                  srl          a3, s7, s5
                  fsqrt.s      fs7, fs3
                  fle.s        s10, ft6, ft4
                  remu         s9, s3, a1
                  auipc        t0, 351564
                  slt          t4, a6, s0
                  sltiu        a4, s2, -581
                  fdiv.s       fs2, fs5, fa5, rup
                  lui          s3, 266738
                  auipc        s1, 753423
                  xori         t2, s4, -1475
                  fcvt.w.s     s1, fa0
                  fadd.s       fs9, fs1, fs4, rne
                  rem          t2, t2, a0
                  fle.s        a3, fs6, fa4
                  fmv.x.w      s3, ft1
                  and          s5, ra, s9
                  add          t5, s0, s2
                  slli         s5, t1, 6
                  rem          a5, s7, s1
                  fsgnjn.s     ft1, ft9, ft4
                  srli         a5, a4, 2
                  mulhu        sp, a0, zero
                  fsub.s       fs2, fs9, ft6, rmm
                  or           a1, t6, s6
                  fcvt.wu.s    zero, ft0, rne
                  slli         t0, a5, 26
                  auipc        tp, 664729
                  lui          s11, 446461
                  fsgnjx.s     fs4, fs2, ft1
                  fclass.s     s7, fa5
                  fsgnj.s      fa7, ft2, fs9
                  rem          s4, a5, s4
                  sub          s1, t3, t3
                  or           gp, a5, t1
                  sll          s11, zero, s2
                  fsgnjx.s     fa5, fs10, fs9
                  slli         t2, t4, 7
                  sll          tp, t6, zero
                  fmin.s       fa1, ft5, ft6
                  xori         t0, tp, -416
                  fcvt.s.wu    fs0, s11, rtz
                  fclass.s     s10, ft4
                  fsgnjn.s     fa1, fs8, fa5
                  sltu         s4, s11, s8
                  fcvt.wu.s    s4, fa1, rdn
                  xor          t4, t4, a4
                  rem          a4, a6, t1
                  fcvt.w.s     s0, fa7, rmm
                  fsqrt.s      fs11, fs1, rne
                  mulhu        s7, t6, t6
                  slti         gp, s4, 1677
                  add          s3, t1, zero
                  fmv.w.x      ft10, a6
                  xori         s5, ra, -802
                  div          a4, t4, a7
                  fclass.s     t2, ft5
                  sub          ra, s9, a7
                  mul          tp, tp, s5
                  srli         t2, t1, 18
                  and          t5, t1, t5
                  div          s11, a4, t1
                  sra          s10, s9, s11
                  sub          s7, zero, a7
                  srli         a4, tp, 10
                  fmv.x.w      a5, fs10
                  fle.s        t5, fs8, fs9
                  srli         ra, s9, 24
                  xor          a4, gp, s9
                  rem          s4, ra, zero
                  div          a3, s9, a0
                  nop
                  fdiv.s       ft3, ft8, fs5, rdn
                  srai         t0, a4, 12
                  or           a4, sp, s6
                  rem          s0, t2, sp
                  flt.s        sp, ft0, fs1
                  divu         sp, s8, tp
                  remu         s1, s4, s11
                  srl          a4, a2, t1
                  fmax.s       fa3, fa5, ft4
                  srai         t1, t6, 12
                  fmax.s       ft1, ft9, fa1
                  fmv.x.w      t1, fs4
                  fsgnjn.s     fa3, fa2, ft2
                  srai         zero, s6, 9
                  fadd.s       ft8, fa5, fs4
                  lui          ra, 571220
                  fclass.s     sp, fs5
                  fcvt.w.s     t5, fa3, rtz
                  fclass.s     s3, ft9
                  sltu         a1, sp, a1
                  fsgnjx.s     ft2, ft5, fs6
                  mulhu        t6, a4, s4
                  fmax.s       fs10, fs7, ft8
                  fsgnjn.s     fs5, fs6, ft3
                  fsgnj.s      ft7, fa1, ft0
                  remu         t2, s11, ra
                  fmul.s       fa0, ft11, fa6, rmm
                  fcvt.s.wu    fa4, s0, rne
                  andi         t3, s0, -224
                  fle.s        s7, fs10, ft8
                  sra          t1, ra, a1
                  fdiv.s       fa6, ft2, fs8
                  fmax.s       ft7, fs7, ft8
                  slti         gp, s9, -2032
                  remu         t2, a6, t2
                  addi         s9, t1, -1220
                  ori          tp, t6, 805
                  rem          s9, s0, s11
                  nop
                  andi         t6, s7, 1434
                  xori         s5, a0, -1761
                  fadd.s       ft8, fa2, fa2, rdn
                  fcvt.w.s     s11, fa4, rdn
                  flt.s        s7, fs4, fs9
                  and          a4, t1, a4
                  mulhsu       t5, a7, a7
                  auipc        a4, 398880
                  sra          t5, t1, s6
                  fcvt.s.w     ft7, s3
                  fmin.s       fs11, fs0, fa4
                  srai         s5, s10, 31
                  fcvt.s.w     fs9, a5
                  feq.s        s0, fs1, ft8
                  xor          tp, a2, s11
                  mul          a5, tp, s3
                  fsqrt.s      fa4, fs7, rne
                  srai         gp, ra, 28
                  fsqrt.s      fa5, fs2
                  rem          s4, t1, a4
                  fmv.x.w      t4, ft7
                  slt          s5, s11, zero
                  srl          t6, a6, a0
                  fmv.w.x      fs5, ra
                  auipc        t0, 806172
                  srli         t4, a6, 23
                  fadd.s       fs9, fs5, fs8
                  fsub.s       fs0, fa1, fs0, rdn
                  srl          t4, s9, sp
                  fmv.x.w      t0, fa3
                  fmax.s       fa5, fa6, fa5
                  fcvt.w.s     t0, ft10, rne
                  slti         s6, s11, -1530
                  fle.s        zero, fa4, ft0
                  xor          s4, t3, t5
                  fmax.s       fs7, ft1, fs1
                  mul          s2, t4, t3
                  flt.s        s1, fs10, fs0
                  sub          a5, s9, s3
                  fcvt.wu.s    t3, fa3
                  div          a1, gp, s8
                  nop
                  addi         sp, a0, -1562
                  ori          s1, t2, 274
                  divu         a4, a5, sp
                  sra          t1, a7, t3
                  slli         a3, a2, 8
                  fmul.s       fs8, fa7, fs0
                  nop
                  fmv.x.w      s10, fs1
                  addi         t1, t6, 1296
                  andi         a4, a2, 129
                  fsgnjx.s     fs1, fs3, fa7
                  sltiu        gp, tp, -1446
                  fadd.s       fs2, fs9, ft8
                  fsgnjx.s     fs10, fa4, fs2
                  nop
                  fcvt.w.s     gp, fs11, rne
                  slli         tp, s9, 29
                  srli         tp, t2, 28
                  fsgnj.s      ft11, ft11, ft8
                  xor          t6, ra, s10
                  divu         s1, a3, s1
                  xori         zero, s4, 1899
                  ori          t1, t1, 410
                  and          gp, t1, t0
                  slti         s1, gp, 1816
                  sll          t0, a7, a3
                  andi         t0, tp, -1622
                  rem          s3, a2, a5
                  fsgnj.s      ft0, fa1, fa7
                  nop
                  feq.s        t3, ft9, fa4
                  sltu         s0, t6, sp
                  nop
                  xor          a3, t5, a4
                  andi         s10, s11, 297
                  flt.s        zero, fs2, ft2
                  nop
                  addi         s2, s2, -1951
                  div          s6, a4, s2
                  fsub.s       ft4, ft7, ft11
                  fsgnjx.s     fa5, fs11, ft2
                  remu         t6, a3, a0
                  lui          gp, 503519
                  nop
                  rem          s4, s10, sp
                  sltu         s11, s3, s0
                  slli         t4, tp, 7
                  fsgnjn.s     fa6, fs8, fs11
                  feq.s        tp, ft0, fs7
                  fsgnjn.s     fa6, ft10, fs5
                  sltiu        t0, t5, -1353
                  nop
                  sra          s11, tp, t3
                  andi         t3, t3, 775
                  mulh         sp, t2, ra
                  fdiv.s       ft8, fs6, fs3
                  xori         t4, gp, 479
                  fmv.x.w      s5, ft5
                  fsub.s       fs9, fs9, fa5
                  xori         s10, t1, -159
                  and          t5, s7, a1
                  feq.s        s1, fs3, fs6
                  fsgnj.s      fs11, fa2, fa5
                  srli         t3, s3, 31
                  fmv.w.x      fs7, s3
                  sra          a5, a6, s2
                  fmul.s       ft7, fs8, fa5
                  divu         a5, t6, sp
                  div          s5, s10, sp
                  fcvt.wu.s    a2, fs8, rtz
                  slli         a1, s6, 10
                  srai         a3, a0, 10
                  fmv.w.x      ft8, s7
                  mulhu        a2, t6, sp
                  fmv.w.x      fs2, s4
                  div          s8, t0, a1
                  sltiu        s9, ra, 1041
                  sub          s3, a1, t2
                  fadd.s       fa1, ft3, fa7, rne
                  fcvt.s.w     ft10, s11
                  fle.s        s3, fa0, ft8
                  fsgnjn.s     fs1, fs0, ft4
                  sltiu        t3, a4, -1414
                  mulhsu       s1, s3, t3
                  divu         zero, s11, s3
                  mul          s5, s6, s6
                  fle.s        s8, fs8, fa7
                  mulhu        s3, a7, s6
                  ori          a2, a4, -1843
                  mulhu        s7, s1, a2
                  mulhsu       t5, s5, t6
                  rem          ra, s3, s1
                  fsub.s       fs7, fa4, ft2
                  srli         ra, tp, 11
                  mulhu        a2, s1, t6
                  srli         a5, sp, 7
                  fsgnjn.s     fs0, fa7, fs8
                  mulh         s8, t2, zero
                  divu         s1, s5, ra
                  mulh         sp, t1, s4
                  fsgnjn.s     fs10, ft8, fs0
                  fcvt.s.wu    fa6, s9, rtz
                  fsqrt.s      fs0, fa7
                  fmax.s       ft8, ft4, fs2
                  mulhu        t1, a0, t2
                  add          sp, zero, s1
                  andi         s6, t6, -1087
                  fdiv.s       fa6, fa6, ft5, rdn
                  fsgnjx.s     fs9, fs6, ft4
                  sub          sp, a4, t1
                  lui          s9, 161639
                  xori         ra, a0, 1861
                  fsub.s       ft10, ft6, fs6
                  sltiu        s6, a1, 190
                  fle.s        s10, fs3, fs0
                  xor          s10, a5, t6
                  fsgnjn.s     fs3, fs0, fa0
                  xori         t1, a1, 215
                  mul          tp, s3, a1
                  mul          gp, s9, zero
                  fmv.x.w      a5, fs11
                  xori         t4, ra, 1053
                  slt          t2, s11, gp
                  slli         zero, a1, 31
                  fadd.s       ft3, ft8, fs7, rdn
                  sub          s6, tp, s0
                  rem          s11, ra, a6
                  rem          a4, s3, tp
                  fcvt.wu.s    sp, fa7
                  divu         ra, a6, s3
                  addi         t2, a6, 1608
                  xor          sp, a4, a5
                  fcvt.w.s     ra, ft9, rmm
                  addi         a4, s1, -849
                  srli         s1, s3, 30
                  fcvt.s.wu    fs6, s3
                  div          t2, zero, t5
                  rem          a5, a7, a7
                  fsgnj.s      fs11, ft1, fs3
                  ori          t1, t1, 571
                  feq.s        s0, ft5, ft0
                  fsqrt.s      ft3, fs8, rup
                  fsgnj.s      ft0, fa6, ft1
                  fadd.s       fs10, ft9, fa4
                  nop
                  add          a4, ra, s5
                  mulhsu       s3, sp, s8
                  fcvt.s.wu    fa6, t0, rtz
                  div          t2, a6, s1
                  remu         a3, s6, t6
                  nop
                  sub          gp, gp, a6
                  fsgnj.s      fs10, fa2, fs7
                  and          s8, t4, a6
                  fcvt.s.wu    ft1, a2, rup
                  rem          a4, t5, s6
                  lui          a3, 796094
                  srai         t3, t5, 31
                  ori          sp, tp, 725
                  divu         tp, s3, a4
                  sra          ra, t6, s7
                  slt          t2, s0, t0
                  rem          a4, t2, t2
                  mulhu        s2, t2, s11
                  fcvt.s.w     ft2, zero
                  fmv.x.w      zero, fs1
                  fmv.w.x      fs3, t2
                  sra          zero, t0, a6
                  feq.s        a2, ft0, fa3
                  fmv.x.w      t6, ft4
                  sltu         t5, tp, t3
                  divu         a2, a7, s8
                  sltiu        s6, a7, -270
                  add          s0, t6, a0
                  nop
                  fsub.s       ft9, fa4, fs7
                  fclass.s     zero, ft1
                  fle.s        s10, fa3, fs3
                  fmul.s       ft3, fa7, ft7, rtz
                  addi         t1, ra, 221
                  fmv.w.x      fa0, s0
                  fsqrt.s      fs5, fa4, rdn
                  auipc        t3, 489841
                  sll          a5, ra, t6
                  fmv.w.x      fs6, gp
                  mul          a5, t5, s1
                  fcvt.w.s     ra, ft0
                  fsgnjn.s     fs5, fs2, fs1
                  fsgnjn.s     ft5, ft7, fs6
                  fsgnj.s      ft9, ft7, ft8
                  ori          t2, t2, -1899
                  srl          t5, s5, zero
                  fcvt.s.wu    ft0, t3, rup
                  sltu         s0, t6, a1
                  xor          a4, zero, s5
                  div          zero, s11, zero
                  feq.s        s4, ft2, fs11
                  lui          s4, 108611
                  nop
                  addi         s2, a4, -1581
                  sltiu        t1, a7, 2016
                  fmv.x.w      s10, ft3
                  mulh         s4, a0, gp
                  feq.s        a5, fa3, ft0
                  srli         t3, s2, 30
                  fsgnjx.s     fs3, fs5, fa1
                  lui          s1, 197482
                  fcvt.wu.s    t2, ft3, rdn
                  fsub.s       fs10, ft5, fa1
                  rem          t2, s5, s0
                  fcvt.s.w     fa2, a2
                  sra          t1, t4, a6
                  fsgnj.s      ft2, fs5, fa6
                  mulh         s2, t6, s0
                  slli         gp, s5, 27
                  fmv.x.w      a3, ft10
                  fmv.w.x      ft8, s0
                  divu         s9, a3, s9
                  fcvt.s.wu    ft1, t4
                  divu         t4, s11, s11
                  fsgnjx.s     fa4, fs5, ft0
                  xori         t4, s7, 683
                  mulhsu       s6, s4, s2
                  sra          s6, a3, s7
                  fmin.s       fs0, fs11, fs11
                  flt.s        s4, fs11, fa5
                  andi         s5, s7, -1316
                  xori         t1, sp, -1633
                  slt          zero, a5, s8
                  fsub.s       fs1, fs4, fa2
                  sub          a1, s3, zero
                  sub          s0, a1, t5
                  fmv.x.w      zero, ft4
                  flt.s        s0, ft11, fa1
                  slti         s0, s7, 1349
                  fmv.w.x      fs1, s8
                  fsub.s       fs10, ft3, fa5
                  xori         t2, a1, -1758
                  flt.s        sp, ft8, fa2
                  or           a2, a7, a5
                  div          a4, a0, s0
                  fsgnjn.s     ft0, fa4, ft5
                  fcvt.s.wu    ft8, s6
                  mulhsu       a5, gp, s5
                  fcvt.s.wu    fs0, a7
                  and          t6, a3, t4
                  xor          t1, s4, t5
                  sltu         s8, t1, s5
                  srl          s7, t3, a6
                  fsgnjx.s     fa7, fs2, fs10
                  srli         ra, s7, 24
                  ori          s9, a5, 1687
                  sltiu        a2, t1, -1979
                  fadd.s       ft10, ft8, ft2
                  slt          s1, t1, a1
                  fmin.s       fa5, fs1, fa2
                  fdiv.s       ft7, fs10, ft6
                  fcvt.s.w     ft8, t6, rtz
                  nop
                  rem          a5, ra, ra
                  fclass.s     s6, fa7
                  xor          s0, t1, t2
                  and          s1, t5, a7
                  auipc        s1, 438666
                  mulhu        s7, s11, a3
                  divu         t4, s10, t3
                  mulhu        sp, a4, s1
                  fle.s        s7, fs8, fs1
                  fdiv.s       ft11, fa2, fs11
                  mulhu        s7, a2, s1
                  fle.s        s7, fs4, fs1
                  sltu         zero, s0, t3
                  sll          a1, s5, s5
                  sltiu        sp, t1, -1445
                  slt          t2, a3, s2
                  rem          gp, tp, s8
                  srl          a2, a6, a7
                  div          tp, a6, a5
                  sltiu        s5, s2, 372
                  fcvt.w.s     t2, fs0, rtz
                  xor          t2, s4, s3
                  divu         a5, a5, s5
                  slli         s1, s7, 3
                  fmin.s       ft8, fs2, ft10
                  addi         s0, s11, 1715
                  flt.s        t3, fs2, ft9
                  mulh         a2, s10, s9
                  slli         s8, s9, 14
                  fclass.s     s9, ft4
                  fadd.s       ft3, ft5, fs9, rtz
                  fmin.s       fs9, fs6, fs0
                  mulhu        s11, gp, a0
                  fcvt.w.s     a5, fa3
                  fmv.w.x      fa0, s3
                  fle.s        tp, fa3, fa5
                  divu         s1, s10, a1
                  xori         s5, zero, 126
                  fadd.s       ft9, fa3, fs10, rup
                  addi         s9, s11, -1026
                  fmin.s       fs10, fs4, fs5
                  fcvt.w.s     a1, ft5
                  remu         zero, tp, t4
                  fmv.w.x      fa1, t6
                  sltiu        s0, gp, -423
                  addi         tp, a1, -1402
                  sub          a4, s4, a0
                  fcvt.s.w     fs2, s10
                  fcvt.wu.s    s9, ft6
                  mulh         t6, s6, s7
                  sltiu        s4, a2, -920
                  add          s8, s0, s9
                  fcvt.w.s     s0, fs8, rdn
                  fmax.s       fs6, ft2, fs7
                  mulh         t4, s6, s11
                  sub          s9, a0, t5
                  xor          s10, a7, s1
                  fcvt.w.s     s11, fs2
                  fmax.s       fs9, fa7, fs10
                  srli         a5, a4, 31
                  or           a4, s2, tp
                  sltu         s1, gp, t0
                  mul          a5, t4, a7
                  sltu         sp, a3, t2
                  fsqrt.s      fs6, fa0
                  srai         tp, t6, 17
                  feq.s        a1, ft7, ft10
                  addi         s11, a0, -2015
                  mul          tp, s2, s6
                  fmv.w.x      ft2, ra
                  fsgnjx.s     fs4, fs10, fa0
                  fsgnjn.s     fs2, ft7, fs2
                  add          t3, a6, s0
                  slli         s2, a4, 27
                  rem          t3, s4, tp
                  srai         s10, a3, 17
                  srai         s6, a7, 18
                  auipc        s8, 477190
                  feq.s        s4, ft8, fs9
                  srli         a5, s9, 18
                  fmin.s       ft3, fs5, ft3
                  fmin.s       fs4, ft4, fs11
                  divu         gp, a2, a2
                  andi         t3, ra, 732
                  fle.s        s1, ft8, ft10
                  flt.s        s5, fs1, fs10
                  sub          a4, tp, gp
                  fdiv.s       ft0, fs9, fa1, rne
                  sra          s7, a2, a4
                  sub          s7, a1, a2
                  fcvt.wu.s    s5, fa5, rup
                  srli         t2, a2, 6
                  add          s0, zero, t3
                  auipc        a3, 664015
                  fsub.s       ft2, fs9, fa4
                  divu         a3, s6, sp
                  fclass.s     a5, ft11
                  srli         s5, s9, 5
                  fsgnjx.s     fa1, fs11, fs3
                  fle.s        s5, ft0, ft10
                  fmv.w.x      fa4, s3
                  fdiv.s       ft0, ft10, ft7, rtz
                  fcvt.w.s     s8, fs4
                  and          s5, s11, a1
                  fmv.w.x      fa5, s2
                  fmin.s       ft8, ft0, fs1
                  div          t5, a1, s9
                  or           s8, s8, gp
                  fmul.s       fa5, fs10, fa2, rtz
                  fdiv.s       fs0, ft5, fs11
                  flt.s        t3, fa1, fs1
                  ori          a3, s9, -1401
                  slti         t2, s6, 958
                  and          a5, t6, s0
                  fmul.s       fa0, ft10, ft8, rmm
                  fmax.s       ft3, fs1, fs11
                  slt          s4, a3, a3
                  srli         t4, gp, 9
                  sra          t6, s6, a3
                  feq.s        a1, fs5, fa4
                  slti         s4, a0, -1578
                  auipc        sp, 465985
                  fclass.s     s8, ft2
                  mulhu        s2, s5, t0
                  divu         t1, s3, s3
                  sll          a5, t5, a1
                  sra          s10, s0, t6
                  auipc        t5, 435869
                  fclass.s     s11, fa7
                  fcvt.s.wu    ft10, t2, rne
                  srli         a2, ra, 29
                  sll          t4, s6, t6
                  divu         s3, a6, s6
                  feq.s        s1, fa0, fs10
                  addi         a2, a7, 2018
                  fsgnj.s      ft8, fs11, fs5
                  fcvt.s.w     fa5, ra, rmm
                  sub          s4, ra, t3
                  fcvt.s.w     ft5, s9
                  fmax.s       ft8, ft6, ft9
                  fmin.s       fs3, ft6, ft0
                  rem          s4, s9, t0
                  flt.s        s0, ft9, fs5
                  fcvt.w.s     s11, fs7, rne
                  mulhsu       t4, a3, t1
                  divu         t1, t6, t1
                  mulh         ra, s5, a5
                  mulhsu       s8, s1, t5
                  fmax.s       ft8, ft5, fs11
                  fsgnjn.s     fs0, fa6, fa2
                  fmul.s       ft6, fa5, fa7
                  fadd.s       fa0, fa1, ft8
                  flt.s        a4, fa5, ft7
                  fmul.s       ft3, fs7, fs2
                  nop
                  srai         a3, a1, 12
                  fmax.s       fs8, fs7, fs3
                  sltu         s0, a4, s3
                  fmin.s       ft3, fa0, fa1
                  fsgnjn.s     fa5, ft7, ft11
                  fmin.s       fa7, fa5, ft10
                  fmin.s       fa4, ft5, fa1
                  fsgnjx.s     ft11, ft3, ft8
                  fmul.s       fs3, fs2, fs0, rup
                  andi         a1, t6, 423
                  div          t3, a6, tp
                  fmin.s       ft4, fs7, fa4
                  lui          s11, 847334
                  sra          t0, a6, t3
                  add          a1, t1, s0
                  fclass.s     sp, fs3
                  ori          a4, s11, -648
                  fle.s        sp, ft4, fa0
                  fcvt.s.w     ft3, a6
                  fsub.s       ft10, ft10, fs0
                  sra          s10, a7, zero
                  div          t4, a7, s10
                  sub          s5, a0, t4
                  fsub.s       fa6, fs6, fa6, rmm
                  rem          s6, s2, a1
                  slt          t0, s3, s0
                  slti         s7, ra, -1191
                  or           t6, a0, s8
                  fcvt.s.w     fa6, s1, rtz
                  srai         a1, a2, 20
                  fcvt.s.w     fs5, a5, rne
                  fcvt.wu.s    t0, fa6, rtz
                  mul          t0, s1, s7
                  slt          zero, tp, t0
                  remu         t6, s6, s2
                  remu         s11, t0, ra
                  addi         a3, t2, -1305
                  rem          t1, t4, t5
                  sll          s3, t1, t5
                  fmax.s       ft2, fs2, fs9
                  add          ra, zero, s8
                  and          t3, s4, a1
                  slti         s5, a2, 850
                  fdiv.s       fa3, fs7, fa2, rup
                  xori         a5, s9, -1026
                  fadd.s       ft1, fa7, ft8, rup
                  fsqrt.s      fs2, fs10
                  remu         ra, a0, a1
                  div          s6, t1, t3
                  remu         s3, a2, a3
                  fmv.x.w      t4, fa1
                  and          a5, t2, s10
                  andi         t1, a0, -105
                  mul          gp, s2, s4
                  and          t6, a3, s6
                  sra          gp, s8, s8
                  fsgnjx.s     ft2, ft2, fs0
                  fcvt.s.w     fs8, s4, rtz
                  sll          s7, s4, ra
                  fmul.s       ft11, fs5, fs10
                  fcvt.s.w     fs10, gp, rup
                  sltiu        s3, t5, -240
                  fsqrt.s      ft10, ft8
                  mulhu        a1, s11, t4
                  srli         s8, ra, 2
                  fcvt.s.w     ft4, a0, rup
                  srai         zero, t2, 10
                  sub          s6, zero, a3
                  fmv.w.x      ft3, ra
                  fcvt.w.s     s3, ft3
                  lui          s8, 915786
                  fadd.s       ft7, fs4, fs10, rdn
                  fmul.s       fs0, fa7, fa3, rmm
                  fsqrt.s      fa5, fs6, rmm
                  xor          s4, a6, a3
                  fcvt.w.s     s8, fa4, rmm
                  fcvt.s.wu    fa2, t6
                  fmv.x.w      tp, fs10
                  div          t4, ra, gp
                  xori         s2, s9, -463
                  sub          s1, t3, t3
                  fsub.s       ft7, fa6, fa1, rtz
                  fsgnjx.s     ft3, fa3, fs1
                  rem          t4, s1, s11
                  fcvt.s.w     fa1, s7
                  fadd.s       ft2, fs3, ft1
                  fclass.s     a4, ft9
                  srli         a1, s7, 25
                  fsqrt.s      ft4, fa0, rne
                  mulh         tp, t0, t6
                  sll          s3, ra, s0
                  xori         s4, s10, 862
                  ori          s6, s2, -603
                  fcvt.w.s     gp, ft7, rmm
                  sltiu        s4, tp, -794
                  mulhsu       t6, t4, s10
                  sra          s2, t4, a7
                  rem          s4, a2, t0
                  fmv.w.x      fa4, s0
                  add          a5, s5, ra
                  fmul.s       ft7, fs7, ft5, rmm
                  srl          s1, a5, s0
                  slli         t1, s3, 13
                  fdiv.s       fs9, fa3, fa6
                  sub          s8, a7, a0
                  fsgnjn.s     fa6, fs8, fs2
                  fmv.x.w      sp, fs5
                  fadd.s       fa2, fs2, fa4, rmm
                  flt.s        a5, fs6, ft11
                  mulhsu       s3, a4, a4
                  mulh         s9, a6, t6
                  sltiu        t1, t6, 2013
                  sltu         s3, t4, a3
                  fadd.s       ft0, fs9, fs4
                  srl          gp, a3, s2
                  slli         gp, t1, 11
                  div          s5, t5, s11
                  addi         zero, t2, 102
                  remu         sp, a1, a7
                  fcvt.w.s     t1, fs6, rup
                  srai         a3, sp, 0
                  fcvt.w.s     s11, fs11, rtz
                  fcvt.w.s     tp, ft2, rne
                  fmv.x.w      s10, fa2
                  xori         tp, t6, -1329
                  fcvt.w.s     t4, ft4
                  slti         t5, t4, 1510
                  div          ra, s9, t0
                  sltu         a4, s10, s9
                  fsgnjx.s     fs10, ft1, ft11
                  srl          s10, s7, a5
                  add          ra, t5, t3
                  rem          s7, s10, zero
                  rem          a2, zero, a7
                  fcvt.s.w     ft4, a6
                  sltu         t4, t3, s5
                  fmul.s       ft1, fs7, ft9, rtz
                  mulhsu       zero, a3, t6
                  mul          a3, s2, s6
                  mulhu        t2, a3, t5
                  lui          zero, 342672
                  fcvt.wu.s    a5, ft8
                  slt          s0, s9, t3
                  div          a4, s7, s2
                  fsqrt.s      ft7, fa3
                  ori          a2, a6, 1028
                  slt          s8, t1, s5
                  fsgnj.s      fs9, fs9, ft1
                  sra          s10, a2, t5
                  feq.s        s10, ft9, fs0
                  feq.s        s6, fs11, fa0
                  sltiu        sp, s1, -1233
                  mulh         a3, t5, t5
                  or           a5, s5, s9
                  fcvt.s.wu    ft3, a3, rdn
                  div          s4, s10, s4
                  fmul.s       fs1, ft0, ft1
                  fsgnjx.s     ft11, ft8, fa5
                  slli         s4, t4, 25
                  sll          s1, t3, a4
                  sra          t0, s10, s11
                  nop
                  fadd.s       fs3, ft8, fs10
                  fadd.s       ft4, ft0, ft0
                  srai         a1, sp, 15
                  fle.s        t4, fs8, fs7
                  slti         zero, s0, 158
                  mulh         s4, t1, s4
                  divu         s8, t2, a2
                  fsub.s       ft9, fs6, fs2, rup
                  sll          s6, ra, s11
                  sll          s11, a2, t0
                  lui          a4, 252204
                  andi         a3, s4, -699
                  div          s0, s10, s11
                  xor          s10, t0, a4
                  addi         s3, t2, -1730
                  rem          s0, s10, a1
                  fsqrt.s      fs6, fs2, rtz
                  srl          t4, ra, s2
                  lui          s0, 441478
                  fcvt.s.wu    fa7, s7, rdn
                  or           s7, t2, gp
                  mulh         a1, t6, s1
                  fcvt.s.wu    fa3, a5
                  nop
                  fsqrt.s      fs7, fs7, rne
                  and          a5, s7, s5
                  flt.s        t1, ft5, fa7
                  ori          t6, s5, -502
                  srli         s5, s2, 29
                  srai         a4, s2, 28
                  slt          a4, t4, a1
                  fcvt.wu.s    t1, ft11, rne
                  flt.s        s3, fa7, ft9
                  fmul.s       fa6, fs3, fs4, rup
                  div          t4, a4, s11
                  sll          tp, ra, s3
                  nop
                  fsgnjn.s     fa5, fs9, fa5
                  or           gp, a4, s4
                  fadd.s       ft9, fs7, fa0
                  sub          ra, zero, s11
                  divu         zero, s2, s2
                  fcvt.wu.s    a1, fs11, rtz
                  fcvt.wu.s    a2, fa0
                  srl          t4, t1, s8
                  fcvt.s.w     fa2, a5
                  fmv.x.w      s8, fs11
                  fmv.w.x      ft4, a1
                  remu         ra, s4, s10
                  fmv.w.x      fs6, t2
                  fsgnjx.s     fa7, fs7, ft5
                  fsqrt.s      fa1, fs11, rup
                  sltiu        a3, s3, -1780
                  slt          t0, a2, t5
                  fclass.s     a2, fs11
                  mulhsu       tp, t6, s6
                  slli         s11, t4, 26
                  divu         a1, tp, s6
                  andi         ra, a6, -357
                  fmin.s       fs3, fa6, fs5
                  slt          s5, a3, t3
                  sltu         ra, tp, a4
                  andi         t5, sp, 1246
                  slt          s11, s3, a6
                  fsqrt.s      ft1, fa7
                  xor          s11, s4, s3
                  feq.s        sp, fs9, ft7
                  slt          tp, s2, a1
                  sltiu        a4, s10, 509
                  slti         t6, a6, -1727
                  fmin.s       ft10, fs4, fs5
                  rem          s9, tp, a5
                  divu         t4, s11, a3
                  xori         s6, zero, -1801
                  auipc        zero, 449040
                  xor          s6, ra, t1
                  fsgnjn.s     ft4, fs2, fs3
                  divu         gp, ra, t1
                  fmv.w.x      ft0, s3
                  div          s7, a4, s11
                  sltiu        a4, a5, 827
                  fsgnjx.s     fs10, fs8, fs7
                  slt          t3, t2, a7
                  fsgnjn.s     ft3, ft8, fs6
                  sub          t0, a1, t0
                  mul          t6, gp, a7
                  slt          t6, a2, s5
                  fmv.x.w      t6, fa6
                  ori          s7, s9, 2018
                  sltu         s11, s5, ra
                  slti         t2, s9, -1522
                  fcvt.w.s     a1, fa4, rmm
                  xor          s11, s5, a1
                  srl          s8, s11, s5
                  fsub.s       fa4, fs7, ft10
                  fsgnjx.s     ft5, fa3, ft0
                  lui          gp, 533440
                  xori         zero, s11, -1513
                  srli         s1, s5, 16
                  fmul.s       ft4, fs11, fs2
                  fcvt.s.wu    fa3, a4, rtz
                  fsgnjn.s     ft8, ft10, fa6
                  fadd.s       ft4, fa3, ft4
                  divu         t6, a2, s11
                  fmul.s       fs6, fa3, fs7
                  xor          t3, t2, zero
                  add          a2, a3, t1
                  sll          a2, s9, s1
                  mulhu        t0, s0, gp
                  and          a3, a2, s5
                  fsgnjn.s     ft3, fa7, fs10
                  and          t3, a3, a5
                  or           s4, a5, a0
                  fsgnjx.s     fa7, ft6, fa2
                  sll          a5, a7, t0
                  fmul.s       fs11, fa2, fa3, rne
                  sll          t3, t1, a0
                  sll          t0, a3, t4
                  sub          t0, s11, s11
                  fcvt.s.wu    fs7, t3, rtz
                  fsub.s       fs3, fa3, ft7, rup
                  ori          a5, s1, -1331
                  flt.s        ra, fa4, ft11
                  feq.s        a4, ft8, fs10
                  feq.s        s10, fs3, fa7
                  fcvt.w.s     t6, fa4, rtz
                  fmul.s       fa5, fs2, ft5, rdn
                  fmv.w.x      fs10, a6
                  mul          t1, s1, s7
                  rem          a4, a2, a3
                  fcvt.s.w     fa0, s2
                  fmax.s       fs2, fs11, fs3
                  srai         t5, s8, 10
                  fcvt.wu.s    tp, fa7
                  fsgnjx.s     ft4, fs0, ft9
                  and          s4, t0, t1
                  fmin.s       fa3, ft0, ft4
                  lui          gp, 523732
                  srai         s3, a5, 12
                  ori          s2, a3, -1196
                  srai         tp, ra, 17
                  slli         a4, s7, 30
                  fsgnj.s      fs8, fs8, fa5
                  div          t5, a1, a7
                  fadd.s       fs10, ft2, ft0, rup
                  feq.s        tp, fs1, fs4
                  sltiu        s2, a0, 107
                  remu         s7, t3, t0
                  add          s1, s11, a7
                  fadd.s       fs11, fa7, fa1
                  flt.s        t1, ft11, fs9
                  fmv.x.w      zero, ft6
                  fmv.w.x      fs0, t2
                  sra          s8, s3, sp
                  fle.s        sp, fs5, fs10
                  remu         t3, a1, a4
                  xori         t5, t4, -325
                  srai         a1, t3, 16
                  fsgnj.s      fs0, ft8, ft10
                  mulhu        t0, t6, a4
                  rem          zero, t2, t3
                  xor          s0, sp, tp
                  fmul.s       fs4, fa7, fs0, rtz
                  fmin.s       ft6, fa6, fs2
                  div          tp, s8, s9
                  mul          s11, a2, t1
                  fmax.s       fs8, ft10, fs2
                  fclass.s     t5, ft6
                  fmv.x.w      s10, ft7
                  remu         t0, t0, s0
                  sltu         ra, t1, s11
                  fmul.s       fa3, fs1, fs3, rmm
                  fle.s        s8, ft2, fa7
                  sub          s4, s9, s0
                  fmin.s       ft4, fs8, fs8
                  slt          a1, s10, s1
                  mulhsu       t0, a3, t6
                  fcvt.w.s     t2, fs4, rup
                  div          s3, sp, s9
                  fcvt.wu.s    s5, fs10, rtz
                  add          s0, s3, s6
                  ori          t1, s2, -25
                  srl          s3, a3, t2
                  slt          s0, s5, t4
                  ori          s8, t3, -18
                  mulhsu       a1, t6, a5
                  feq.s        t0, ft5, fa3
                  srl          s9, a7, s4
                  fsgnjn.s     fa4, fs4, fs1
                  mulh         s2, a0, t2
                  lui          ra, 401705
                  auipc        s0, 337996
                  fdiv.s       fs7, fs6, ft2
                  fcvt.s.wu    ft6, t1
                  mulhu        gp, t2, s1
                  ori          a4, t5, -1856
                  srli         s4, s7, 11
                  flt.s        a4, ft5, fs1
                  sll          gp, t4, a1
                  ori          s3, t6, -1130
                  fcvt.s.wu    fs8, s3
                  slti         zero, t0, -1073
                  or           s6, t3, s2
                  addi         t2, zero, 394
                  mulh         s8, a2, a0
                  sltiu        s0, sp, -619
                  fmax.s       fs9, fs1, fs7
                  addi         a5, t3, 1080
                  mulhsu       gp, gp, t0
                  ori          t2, tp, -1671
                  remu         t5, t3, s4
                  slt          a5, a6, s1
                  mulhu        ra, s10, t1
                  auipc        t4, 103554
                  sltu         t5, s4, a7
                  fmv.w.x      ft10, sp
                  or           t0, zero, a1
                  slti         t2, t6, -224
                  fsgnj.s      ft3, fs8, ft1
                  fsqrt.s      ft0, fs2
                  flt.s        s3, fs9, fs7
                  srai         s6, a4, 5
                  feq.s        sp, ft4, fs10
                  flt.s        s5, ft6, fs11
                  sub          s11, zero, s0
                  fcvt.s.w     fs0, a7, rne
                  srli         sp, t1, 16
                  fcvt.w.s     a3, ft1
                  fmv.x.w      s11, fa0
                  srai         a5, a6, 1
                  fmv.x.w      a5, fa4
                  nop
                  fsgnjx.s     fs7, ft0, ft8
                  sra          s3, s9, t0
                  slti         gp, ra, 1611
                  fmv.w.x      fs1, tp
                  slt          sp, s0, ra
                  srai         a5, a4, 13
                  fmax.s       fs3, ft1, ft4
                  or           a5, tp, t3
                  fdiv.s       fs2, fs2, fs7
                  fcvt.s.wu    fs11, gp, rmm
                  srai         s9, t5, 15
                  divu         s6, s7, t5
                  ori          s2, s3, 1358
                  divu         t1, s2, s2
                  slti         s1, t1, 808
                  rem          s7, t1, s0
                  fcvt.w.s     zero, fa2, rup
                  sltu         a2, a3, s11
                  or           t6, s4, a5
                  srli         t0, a5, 30
                  ori          a5, t0, 1600
                  sra          s11, t3, s9
                  sll          s1, a2, s6
                  fcvt.wu.s    t6, ft2
                  fsub.s       fa5, fs4, fs5
                  lui          tp, 276382
                  sll          zero, s3, s7
                  slli         zero, s6, 3
                  fmv.w.x      fa4, s6
                  srl          zero, s4, s7
                  sll          s7, s6, s1
                  nop
                  mulh         a2, a5, s1
                  nop
                  fcvt.s.wu    fs0, sp, rup
                  mul          zero, tp, a0
                  sll          s2, s0, s2
                  or           a5, zero, t3
                  fcvt.w.s     a4, fs8
                  fle.s        s6, ft4, fa3
                  sra          a3, t2, a2
                  sltiu        s11, a4, 656
                  slti         s5, tp, 1183
                  fmv.w.x      ft9, t5
                  fmv.w.x      fa2, t6
                  sub          s9, s4, sp
                  remu         s1, s3, s4
                  andi         s2, s1, 1245
                  auipc        a2, 577543
                  fclass.s     t0, fa0
                  fcvt.s.wu    fa3, t4, rne
                  fsub.s       fs5, ft8, fs3, rup
                  mul          zero, t2, s4
                  mulhu        a5, t3, tp
                  sub          t6, a6, t5
                  fclass.s     a3, ft11
                  sltu         tp, ra, s3
                  fsgnjn.s     fs4, ft6, fs6
                  div          t0, s0, s9
                  mulhu        s1, gp, a1
                  auipc        t2, 793779
                  fdiv.s       ft8, ft10, fs1, rtz
                  xor          t3, a0, ra
                  fsgnjx.s     ft2, fa7, fa1
                  fsgnjx.s     ft6, fs4, fs5
                  andi         sp, a0, -697
                  slli         s8, a2, 16
                  fsgnj.s      ft3, fa4, ft8
                  sll          s0, t1, s0
                  and          t6, s10, s3
                  fmax.s       fs0, ft11, fs0
                  fsqrt.s      ft2, ft6, rup
                  fcvt.wu.s    s7, ft1
                  fsqrt.s      fs8, ft6, rtz
                  divu         s10, zero, a4
                  fdiv.s       fs10, ft3, fs11, rup
                  sra          t5, t3, t3
                  andi         zero, a2, 754
                  srli         tp, s0, 3
                  divu         s4, s0, zero
                  xori         t0, t1, -1147
                  lui          sp, 721623
                  ori          t5, s8, 1469
                  fcvt.w.s     s3, fs7
                  fsqrt.s      ft8, fa0
                  srl          s9, t5, t0
                  fcvt.wu.s    s1, ft3
                  flt.s        sp, ft4, fs6
                  and          s2, gp, s10
                  srli         t1, t6, 30
                  sltu         s7, s3, s7
                  or           s8, s8, s9
                  mulhsu       s1, a6, a1
                  mulhsu       a1, a1, s3
                  srli         t3, s7, 22
                  fmv.x.w      a2, ft8
                  fmv.w.x      fs4, a4
                  ori          s8, a2, 1568
                  div          s7, a7, a7
                  mul          s9, s9, a4
                  addi         a4, s10, 348
                  sub          s3, s3, a6
                  flt.s        a2, fs8, ft10
                  slt          a3, ra, s9
                  fsub.s       ft6, fa5, fa2, rmm
                  auipc        t1, 188785
                  feq.s        s10, fs8, fs8
                  srai         s6, t6, 28
                  auipc        t5, 822985
                  fsqrt.s      ft9, fs4
                  addi         s1, s4, 376
                  divu         t1, s1, s9
                  mulhsu       s2, tp, s7
                  sll          t6, sp, s0
                  sra          a4, t6, s3
                  fmin.s       fa7, ft1, fs6
                  sltiu        s0, t4, -331
                  fsgnj.s      fs11, fs0, fs9
                  srl          a3, t6, t4
                  ori          s9, s5, -1545
                  srl          sp, s1, s9
                  fclass.s     s11, fs5
                  xori         s1, t2, -861
                  srai         s8, s6, 31
                  slli         s9, s1, 15
                  fsub.s       fs0, ft5, fs8, rne
                  slli         s6, s10, 10
                  fsqrt.s      fa4, fa3, rup
                  fsgnjn.s     fa4, fa0, ft5
                  fsgnjn.s     ft6, fs5, ft7
                  xori         s2, t6, -1167
                  fmv.x.w      tp, fs5
                  mul          t4, a5, s3
                  slli         t0, zero, 2
                  mulhsu       a5, tp, t0
                  remu         t0, t6, a5
                  slti         ra, ra, 768
                  fsgnjn.s     fs3, ft4, ft4
                  fsub.s       ft5, ft7, fa3
                  sra          s0, sp, s4
                  xori         sp, s0, -1954
                  mul          a2, s9, ra
                  slti         gp, s9, 1802
                  sub          t4, s11, a1
                  feq.s        tp, fs7, fs10
                  fdiv.s       fs8, ft1, fs9
                  addi         s5, s0, -1323
                  mulh         s8, a1, s9
                  fcvt.wu.s    tp, fa7
                  fsgnj.s      fa2, fs6, fa6
                  rem          a2, a0, t5
                  mulhu        s5, s3, zero
                  fmv.w.x      ft9, a2
                  fsgnj.s      ft10, ft10, fs10
                  or           tp, s2, s11
                  xor          s0, s6, s3
                  srai         sp, gp, 14
                  fmax.s       ft2, fa4, fs11
                  fsgnjx.s     fs6, ft7, ft6
                  srl          tp, s0, s1
                  sra          s2, sp, t0
                  andi         t6, t2, -463
                  mulhsu       a5, t2, sp
                  fsqrt.s      fa0, fa7
                  sub          gp, t6, t3
                  srli         sp, s10, 14
                  mulhsu       s2, a7, a7
                  mulhsu       a2, s7, a7
                  fsgnj.s      fa1, ft0, fa0
                  slli         a1, a1, 28
                  or           zero, zero, t2
                  mulh         s1, ra, s7
                  feq.s        t5, ft0, fa1
                  mul          gp, a4, a7
                  fmul.s       fs8, fa4, ft8
                  sra          a3, s0, a2
                  divu         gp, a1, s8
                  auipc        s9, 411863
                  fcvt.w.s     t1, ft11
                  fmax.s       ft9, fa6, fa5
                  fsgnjn.s     fa7, ft5, fs5
                  fsub.s       fs10, fs0, ft8, rup
                  feq.s        ra, ft11, fa7
                  fclass.s     s0, ft2
                  remu         t0, s8, a7
                  sub          t3, s1, tp
                  fmv.w.x      ft11, t4
                  slti         a2, a1, -2023
                  feq.s        a2, fs8, ft7
                  nop
                  mulhu        s0, a4, gp
                  sltiu        s11, a2, 558
                  auipc        tp, 487779
                  xor          s4, s4, t5
                  fmv.w.x      fa5, a4
                  fsgnjn.s     fs0, fs7, fa6
                  fadd.s       ft11, fa6, fs11, rdn
                  fdiv.s       ft5, fs0, fa4, rdn
                  and          t3, a4, a3
                  rem          a1, t1, t4
                  fdiv.s       ft8, fs11, fa3
                  xor          t3, tp, s4
                  div          t3, ra, s0
                  fadd.s       fa6, fs0, fs8
                  xor          s3, t0, s8
                  fmin.s       fs4, ft0, fa5
                  add          s1, t0, a4
                  fcvt.w.s     a2, fa4
                  slt          sp, s4, s10
                  fle.s        s11, fa0, fs7
                  lui          tp, 12737
                  fcvt.wu.s    t1, ft7, rmm
                  fsgnjn.s     fs6, ft7, ft10
                  xori         s0, tp, -1011
                  fdiv.s       fa3, fa5, fs2, rdn
                  fcvt.s.w     fa7, ra
                  flt.s        s0, ft7, ft7
                  feq.s        gp, fs6, fs10
                  lui          t3, 105055
                  slti         a1, t4, -122
                  rem          s0, a3, s9
                  mulh         s11, t2, sp
                  ori          a1, s10, -1746
                  fsub.s       fs10, fa4, ft3, rmm
                  nop
                  slt          t4, s9, s3
                  fmax.s       ft1, fs2, fs6
                  fmul.s       ft4, fa5, fa3, rdn
                  sltu         s2, a3, s1
                  fmax.s       fa0, fa5, fs11
                  addi         t3, s10, -738
                  fcvt.s.wu    ft11, s8
                  slti         s1, s5, 339
                  feq.s        s5, ft9, ft8
                  slti         t1, a4, -2013
                  slli         zero, s8, 29
                  ori          a5, s11, 603
                  feq.s        s8, fa0, ft9
                  fclass.s     t3, fs8
                  remu         a2, s5, a4
                  fsgnjn.s     fs6, ft6, fs9
                  srai         s4, ra, 1
                  addi         s9, a3, -1309
                  xor          t6, s6, gp
                  fmax.s       ft7, fs3, ft1
                  mulhu        s7, t6, t6
                  slti         t3, a3, 901
                  fcvt.wu.s    s7, ft6
                  fmv.x.w      sp, fa7
                  mulhu        s8, a3, s5
                  fsgnjx.s     fs8, fs5, ft10
                  mulhu        s3, s4, t5
                  addi         s2, s0, -1590
                  slti         t4, gp, 1548
                  sra          s1, s8, a3
                  fmv.x.w      a3, ft6
                  slt          s4, s11, s9
                  lui          gp, 1009545
                  sltiu        ra, s3, 78
                  fadd.s       fa5, ft8, ft8
                  addi         t4, s9, 1172
                  fclass.s     sp, fs10
                  sltu         a2, a2, t0
                  fmax.s       fs5, fa4, fs5
                  sltiu        t3, s0, -1099
                  add          s10, a1, s2
                  sltiu        s6, s6, -1924
                  mulhsu       t6, t3, s8
                  fcvt.s.wu    ft6, zero, rne
                  divu         s9, gp, s8
                  srli         a3, a3, 31
                  fcvt.w.s     t0, fs9, rne
                  and          s4, a0, ra
                  fclass.s     a3, fs6
                  fsgnj.s      ft4, ft6, fs11
                  and          s2, s2, t3
                  div          a1, t1, s2
                  slt          s10, t0, a7
                  fmv.w.x      fs4, s8
                  mulhu        t5, t4, sp
                  sltu         s0, s6, s2
                  sltu         s7, a1, a2
                  fmv.w.x      fa2, t3
                  rem          zero, t6, t2
                  sltiu        t4, s8, 597
                  sra          a4, a4, a2
                  nop
                  sltiu        gp, s6, 1244
                  fmul.s       ft4, fa5, fs3
                  or           s1, t2, a0
                  srli         t5, zero, 25
                  fsgnjn.s     fa4, ft1, fs1
                  div          s8, t2, tp
                  divu         s0, sp, t3
                  remu         t6, a2, s1
                  add          s6, s2, s3
                  fdiv.s       fa7, fs1, ft4, rtz
                  sltiu        s9, s3, -109
                  fmul.s       ft8, ft9, fa0, rtz
                  fsgnjn.s     fs3, fs11, fs10
                  fmv.w.x      fs3, a1
                  mulhsu       sp, a4, s9
                  fmv.x.w      t1, fa1
                  fle.s        t4, ft1, fa7
                  add          s8, t2, t3
                  fmv.x.w      t0, fs0
                  fle.s        tp, fa2, fs10
                  slli         t4, t2, 0
                  sra          gp, zero, s7
                  fcvt.wu.s    s5, fa2, rmm
                  fmul.s       ft5, fa2, fs11, rdn
                  srai         a2, a6, 4
                  fcvt.s.w     fs3, gp
                  flt.s        s2, ft4, fa4
                  feq.s        a4, fa0, fs9
                  srai         s2, gp, 4
                  sltu         s7, s5, s9
                  fsgnjx.s     ft6, ft11, fs10
                  sra          s6, a4, a0
                  fclass.s     zero, ft2
                  fmax.s       fs5, ft5, fs8
                  addi         t3, t5, 36
                  fclass.s     sp, fs2
                  or           s9, t0, a5
                  nop
                  add          a1, t6, s1
                  xor          s9, s5, sp
                  fcvt.s.w     fs1, s6
                  lui          t6, 800084
                  srl          t6, a1, a2
                  nop
                  sub          s11, t2, zero
                  divu         s8, t1, tp
                  fcvt.s.wu    fs1, gp
                  sra          tp, s7, s10
                  sra          t5, s4, a5
                  divu         s4, s5, zero
                  xor          s9, s2, a2
                  or           t1, a5, t0
                  fadd.s       fa5, fs0, ft10, rtz
                  fdiv.s       ft5, fs7, ft8, rup
                  andi         s1, t2, 375
                  fle.s        s3, ft8, ft4
                  fmv.w.x      fs3, s8
                  fmax.s       fs5, fa7, fs6
                  andi         a1, s10, 1923
                  sltiu        s3, zero, -1401
                  auipc        t0, 343462
                  mulhsu       t3, s3, t0
                  srli         a4, s7, 9
                  fsgnjx.s     fa4, fs11, ft3
                  sltiu        a5, s0, -1720
                  sltu         t0, a1, t3
                  fsgnjx.s     fa6, fa6, fa1
                  addi         a1, t4, 165
                  mulhsu       a1, a4, t3
                  sltiu        t2, t6, -547
                  nop
                  fmul.s       fa2, fs3, fs11
                  auipc        s0, 215674
                  mulh         s11, a5, zero
                  mulhu        s11, t2, s9
                  sltu         tp, s1, t0
                  sll          s2, a2, a5
                  fcvt.wu.s    s3, fs11
                  lui          s4, 124662
                  sltiu        s4, a3, -1102
                  slt          s8, a2, s2
                  feq.s        s4, fs6, ft7
                  sltu         t4, a2, t0
                  rem          a5, s7, a7
                  fmv.w.x      fa2, a0
                  srli         s5, s8, 14
                  fdiv.s       fs3, ft5, ft5, rne
                  flt.s        s3, fs3, fs2
                  sub          a1, a1, s2
                  div          t3, s6, s11
                  fmul.s       fa2, ft3, fs0
                  fcvt.w.s     s11, fs4
                  lui          s8, 1018160
                  fcvt.s.w     ft3, s6, rmm
                  fcvt.wu.s    s5, fs0
                  fcvt.s.w     fs9, gp
                  fcvt.s.w     ft0, a7
                  fle.s        s4, fa2, fs1
                  remu         t2, sp, gp
                  fmv.w.x      fa0, a4
                  flt.s        a2, ft3, fs3
                  fmin.s       fa0, fs2, ft8
                  auipc        s10, 752312
                  divu         t2, a5, a7
                  and          ra, s9, t3
                  fdiv.s       ft3, ft4, fa3, rdn
                  mulhsu       a3, gp, s0
                  fsgnj.s      fs6, fa2, ft10
                  addi         t0, t4, 665
                  add          a5, a4, s5
                  slti         s2, s1, -475
                  xori         ra, sp, 1917
                  fmv.w.x      ft8, a1
                  feq.s        a2, fa2, fs4
                  and          t2, a5, sp
                  mulhsu       s3, s6, t1
                  mulhsu       tp, ra, t0
                  mulh         a2, s3, t5
                  fmv.w.x      fa2, gp
                  remu         t2, zero, t6
                  sltiu        s9, s8, -1301
                  flt.s        s4, fa5, fa1
                  fclass.s     s1, fa2
                  auipc        ra, 191697
                  fmv.w.x      fs3, tp
                  fcvt.s.wu    fs3, s4
                  xor          s5, s10, s8
                  xori         a2, s8, 1217
                  lui          s8, 542153
                  srai         zero, s7, 3
                  sub          s7, s1, s8
                  fadd.s       fa4, fa0, fs8
                  srl          s10, a6, t2
                  sltu         s9, s10, a6
                  mulhsu       a5, t6, s7
                  fcvt.s.w     fa6, a7, rtz
                  fsub.s       fa4, fs9, fa3
                  remu         tp, t1, t1
                  remu         t4, s11, t6
                  slli         s4, s9, 25
                  add          t5, t1, a1
                  fmul.s       ft0, ft6, fs10, rup
                  sll          s4, a2, a3
                  addi         s4, a3, -690
                  mulhsu       s9, a1, a3
                  fsgnj.s      fs6, fa4, ft1
                  ori          a4, s0, -38
                  xor          s1, t3, a4
                  xor          tp, a2, t3
                  fle.s        a4, fa3, ft0
                  fle.s        s0, fs4, fs11
                  fmin.s       ft8, fa5, fa1
                  remu         s11, a4, sp
                  mulh         s3, s0, s11
                  slli         s7, gp, 19
                  srai         t4, t3, 19
                  sltu         t4, a6, a2
                  fmin.s       ft9, fa2, fa1
                  srli         a4, t0, 1
                  sll          t4, a1, t1
                  and          gp, a2, s10
                  srl          s7, gp, zero
                  sub          s11, t3, tp
                  divu         t3, gp, s6
                  fle.s        a5, fa4, fa6
                  fmax.s       ft3, fa0, ft9
                  slti         zero, s3, 1276
                  srli         s9, a4, 0
                  fsub.s       ft2, ft2, fs8, rmm
                  fcvt.s.w     fa5, ra, rdn
                  fle.s        a4, fa5, ft9
                  fsub.s       ft11, ft8, fs11, rmm
                  fcvt.s.wu    fa6, s7
                  fsgnjn.s     ft0, fs9, fa1
                  mulhsu       t1, s7, tp
                  sltiu        t5, t6, 1653
                  mulhsu       a4, t5, s6
                  fmv.x.w      tp, fs11
                  fsgnj.s      fa6, ft5, fs2
                  fcvt.wu.s    s1, ft3, rup
                  slt          s0, a7, s4
                  nop
                  fadd.s       ft11, fs10, ft0, rne
                  fmv.x.w      s7, fs0
                  fcvt.wu.s    a3, ft7, rup
                  div          zero, a3, s9
                  lui          t0, 417149
                  lui          a4, 343885
                  mulhu        t4, s1, s9
                  fmax.s       fs1, fa3, fs11
                  add          gp, t2, a1
                  fcvt.w.s     s7, fa2, rup
                  rem          sp, sp, zero
                  fmax.s       ft3, ft1, fs10
                  xori         a3, t2, 428
                  fsgnjx.s     ft9, ft9, fa1
                  fcvt.w.s     t6, ft10, rup
                  fcvt.s.wu    ft8, s10
                  sltiu        a5, t3, -1426
                  rem          gp, tp, a3
                  fmax.s       ft1, ft4, ft1
                  fcvt.s.wu    ft3, zero, rup
                  fmv.x.w      s4, fs8
                  fmax.s       fs0, fa2, fs9
                  fsgnjn.s     fa2, fs9, fs10
                  add          gp, t2, tp
                  fcvt.w.s     a1, fa4
                  fle.s        s8, fa6, fa6
                  flt.s        s2, ft8, fs9
                  srai         a5, t4, 15
                  add          t3, s5, sp
                  mulhu        s4, zero, s6
                  fmv.x.w      a5, ft7
                  mulhsu       s8, a3, s2
                  fclass.s     s0, ft10
                  sltiu        s5, s4, 1606
                  fmv.w.x      ft6, s3
                  remu         gp, a7, a2
                  srli         t0, s3, 11
                  fadd.s       ft1, fs1, ft1, rtz
                  fcvt.wu.s    s5, ft6, rdn
                  slti         t5, a7, 1296
                  sra          s1, a1, a6
                  mulhsu       a2, s6, a2
                  divu         s5, t0, s9
                  mulhsu       s1, a7, a3
                  srl          tp, gp, s10
                  sub          s5, a2, a0
                  fcvt.w.s     t4, ft8, rne
                  sra          s8, a6, t6
                  xor          a2, a5, t5
                  fmin.s       ft8, fs2, ft6
                  mul          tp, t6, tp
                  andi         a2, t6, -441
                  and          s5, t6, a4
                  fsgnjx.s     fs7, ft3, ft2
                  srli         t1, t6, 8
                  addi         s10, s7, 441
                  xori         s1, s0, 1384
                  fdiv.s       fa0, fs8, fs4, rtz
                  sra          s6, t4, s3
                  fmax.s       ft2, ft1, ft10
                  auipc        s8, 241084
                  add          s6, a6, s3
                  fdiv.s       ft4, fs4, fs7
                  lui          a3, 631245
                  sltiu        s8, s2, 720
                  remu         t5, a6, a5
                  fadd.s       ft8, ft2, fa5
                  fsgnj.s      ft5, fs11, fs0
                  or           ra, t2, t1
                  srai         a2, s10, 15
                  mulhu        t3, tp, s1
                  fmin.s       fa2, ft3, fs10
                  or           a3, s7, a4
                  slli         s6, t1, 1
                  srl          a1, s8, a2
                  slli         a3, s11, 1
                  slti         s10, s3, 1746
                  xor          t6, t5, t1
                  fmul.s       fs6, fs9, fs0
                  feq.s        tp, ft9, fs6
                  fmin.s       fs8, ft3, ft1
                  remu         s8, a4, gp
                  xori         a4, s7, -1779
                  fdiv.s       fs8, fa0, fa0
                  fadd.s       fa4, fa2, fs10, rtz
                  fmv.x.w      s10, fs5
                  slli         t6, t5, 26
                  fmin.s       ft7, ft6, ft9
                  fsgnjx.s     fs1, fs11, fs0
                  mulhsu       a3, a0, s10
                  fmax.s       ft8, ft1, ft3
                  fcvt.s.w     fs2, s2
                  xori         ra, t1, 512
                  fsgnj.s      fa6, fs2, ft0
                  xori         s1, a2, -43
                  fsub.s       fa2, fa0, fs8, rmm
                  fsgnj.s      ft6, fs6, ft6
                  srl          s3, a1, a7
                  slli         a1, t4, 23
                  mulhsu       t2, t6, s9
                  or           t1, s7, s2
                  ori          a4, a0, -1137
                  slti         s5, t0, 176
                  slli         s11, s11, 12
                  sltu         zero, s7, t0
                  fsgnj.s      fa2, fa1, fs5
                  feq.s        s4, ft7, ft7
                  mulhsu       t6, s5, t2
                  remu         s10, s0, t4
                  sll          s7, zero, a6
                  sra          s3, s4, s7
                  nop
                  add          tp, t5, a3
                  ori          a3, t2, -1813
                  fsgnj.s      fs5, fs2, fs9
                  ori          t6, a2, 953
                  mulh         s7, a5, s0
                  fadd.s       ft10, ft3, ft1
                  div          t5, s10, s8
                  sltiu        t3, s3, 1610
                  sra          sp, s7, zero
                  fmv.x.w      s0, fa0
                  fsqrt.s      fs10, fa7
                  fdiv.s       fa2, fa5, fa0, rne
                  fsqrt.s      fs3, ft1
                  or           t0, s5, t4
                  fcvt.wu.s    s2, fa6
                  fle.s        sp, fs8, ft9
                  or           s11, s8, sp
                  srli         s10, a4, 26
                  flt.s        zero, fa7, ft4
                  fdiv.s       fs11, ft3, fs7
                  feq.s        t0, ft8, fa2
                  ori          t6, zero, 691
                  div          s3, sp, s5
                  add          t6, a1, s2
                  fmax.s       ft1, fa3, ft7
                  sll          t3, a2, a0
                  fsgnjx.s     ft10, fs9, fa3
                  sra          s4, a3, a6
                  srl          s1, gp, t3
                  sub          s9, a3, s3
                  lui          s3, 65613
                  and          zero, t6, a6
                  div          s8, a3, a3
                  nop
                  fadd.s       fs2, ft10, fa3, rdn
                  nop
                  fadd.s       ft11, ft4, ft3, rdn
                  fsgnj.s      fs7, fs7, fa2
                  rem          a1, s7, s2
                  slli         t2, s7, 4
                  mulh         t2, s11, t4
                  sll          s7, s5, ra
                  srli         t0, s8, 28
                  or           t6, s0, t1
                  sltu         t1, t4, t3
                  slti         s2, a2, 322
                  mulhsu       s1, s4, s4
                  mulh         a1, t1, a6
                  fmv.x.w      s5, fs2
                  fmul.s       ft8, fs1, ft11, rne
                  remu         s10, s5, a2
                  fcvt.s.wu    fs4, s11
                  xori         a1, t3, 474
                  sll          ra, s11, t5
                  mulhsu       t6, ra, t3
                  fclass.s     t0, fs11
                  fmul.s       ft3, fs8, fa0
                  mul          zero, t5, sp
                  sra          t3, s3, s5
                  sltu         ra, t3, a2
                  fclass.s     s11, fs9
                  fadd.s       ft8, fs0, fa6
                  slt          s2, s7, s5
                  mulhsu       s6, a0, a4
                  sub          zero, s3, s0
                  fmv.w.x      fa0, s11
                  mulhsu       a5, s10, s2
                  fclass.s     t4, ft1
                  fsgnjx.s     ft2, fs1, ft8
                  or           s11, t1, zero
                  sll          s2, s2, t4
                  fcvt.w.s     s6, ft1
                  fadd.s       fs6, ft7, fa7, rup
                  divu         s8, s5, tp
                  mulh         ra, tp, s4
                  fmin.s       fs9, ft5, ft6
                  rem          zero, s8, zero
                  fsgnjx.s     fs11, fs5, ft0
                  or           s0, t1, s2
                  divu         t6, s2, t2
                  mulh         s4, t1, gp
                  xori         sp, s0, -1955
                  fsgnjn.s     ft8, fs5, fs11
                  and          s0, s11, sp
                  srai         t4, s10, 1
                  fcvt.wu.s    a2, fa2
                  and          s9, s4, a2
                  slti         s8, t4, -252
                  fmv.x.w      t3, fs7
                  fmin.s       fs5, ft7, fs0
                  fsgnjn.s     fa4, fa3, fs11
                  fmax.s       ft4, ft0, fs8
                  fadd.s       fs7, fa7, ft6
                  or           s6, t0, s3
                  mulh         ra, s7, s2
                  andi         s4, s5, -339
                  remu         t6, s6, s0
                  fmax.s       fa1, ft8, ft11
                  fadd.s       ft3, fa2, fa5
                  divu         s11, s0, s9
                  srl          s3, a5, s7
                  fmv.x.w      ra, ft3
                  fmin.s       fs7, fs8, fa1
                  slli         t0, s6, 28
                  sra          t3, t5, t2
                  ori          ra, s8, -1578
                  flt.s        s5, ft3, fs3
                  fmax.s       ft1, ft8, fs3
                  srai         s7, s11, 27
                  rem          s11, ra, a5
                  fsgnj.s      fs7, fs0, fs1
                  addi         s11, t6, -1035
                  fsgnjn.s     fa7, fa7, ft0
                  divu         a5, s1, a6
                  flt.s        tp, fa1, ft8
                  remu         s7, s10, t3
                  mulh         t4, s8, s0
                  sub          a5, sp, s6
                  ori          a1, s10, -1506
                  divu         s1, t0, t6
                  feq.s        t6, ft10, ft4
                  mulh         s8, gp, ra
                  xori         zero, s2, 395
                  rem          t2, t0, s9
                  fsgnj.s      ft10, ft10, ft5
                  fmax.s       ft11, ft2, fa7
                  fsqrt.s      fa5, fs7
                  fsub.s       fa4, fs3, ft3
                  fcvt.s.w     fa7, s7, rup
                  fmin.s       ft3, ft1, ft2
                  mulh         s11, t2, s11
                  mul          s7, a0, t4
                  fsgnjn.s     fs7, fs5, fs10
                  fmv.w.x      fa2, a0
                  mulhsu       gp, t5, a7
                  lui          s9, 970713
                  mulhsu       s0, s11, s11
                  fadd.s       fs8, fs10, ft8
                  rem          zero, t3, t2
                  feq.s        s5, fs10, ft9
                  addi         t3, t0, 1229
                  fsgnj.s      ft10, ft7, ft1
                  flt.s        a3, ft7, fa6
                  div          s1, s10, sp
                  fsub.s       ft11, ft7, fs11
                  fcvt.s.w     fs6, s0, rmm
                  ori          t3, s11, -77
                  auipc        sp, 929228
                  ori          t2, a5, 82
                  div          s8, a3, t5
                  fsub.s       ft7, fs0, fa7
                  fsgnjx.s     fs5, ft7, fs1
                  srai         a4, a7, 8
                  sltu         s11, t1, s1
                  or           s6, s7, s3
                  lui          s11, 774971
                  mulhsu       t0, s5, a1
                  rem          s3, s9, s10
                  slli         t5, s1, 8
                  lui          s8, 527152
                  fsub.s       fa1, fs8, fa7, rne
                  ori          t3, s10, -1106
                  mulh         t0, a3, s7
                  sra          a2, t1, s7
                  lui          s1, 446524
                  fsgnj.s      fs5, fa0, fa1
                  fsgnjx.s     ft10, fs3, fs4
                  fsgnj.s      fs10, fa1, ft6
                  or           t0, s9, s7
                  feq.s        s7, fs7, fs4
                  addi         t4, a7, -704
                  remu         s0, a3, t0
                  fcvt.s.wu    ft7, s8
                  fclass.s     a5, ft3
                  divu         s0, a6, s3
                  fsgnjx.s     fs8, ft2, fa2
                  rem          a5, t2, ra
                  mul          s6, s10, t6
                  fadd.s       fs0, fa0, ft1, rup
                  addi         sp, tp, -232
                  mulh         s8, s1, t2
                  fsub.s       fs4, fs8, fa1
                  auipc        a1, 411730
                  rem          a3, s0, a0
                  and          gp, s6, s8
                  fsub.s       ft0, ft2, fs2
                  andi         zero, a7, 1061
                  srli         s7, t1, 24
                  or           s10, a0, a5
                  remu         s4, s6, s8
                  srli         s8, a0, 12
                  mulhsu       a5, t3, t1
                  mulh         a1, t1, a5
                  ori          s10, s6, -976
                  fcvt.s.w     fs7, s6, rne
                  fmax.s       fs6, fa0, fa5
                  fmv.w.x      ft7, t6
                  flt.s        a2, ft0, fs1
                  mulh         s7, tp, t0
                  feq.s        s7, ft10, ft10
                  fsgnjn.s     fa4, fs0, ft0
                  slli         s2, t3, 8
                  rem          a5, t5, s7
                  fmin.s       ft3, ft8, ft2
                  fle.s        s8, ft6, ft1
                  srai         s11, s3, 9
                  srli         t5, a2, 11
                  xor          t0, t1, t6
                  slti         s6, s6, 1736
                  fmv.x.w      t6, ft9
                  addi         s4, t3, -1999
                  sll          t4, a3, t4
                  xor          t2, s2, s11
                  fmul.s       fa4, fs6, ft7, rdn
                  feq.s        t1, fa2, ft4
                  fmul.s       fs8, fa2, fs6
                  sll          a1, s11, t1
                  nop
                  fclass.s     s9, ft0
                  ori          t1, t4, -2012
                  andi         tp, s1, 873
                  fsgnj.s      fs11, ft11, fs4
                  mulhu        s2, t4, a4
                  or           a5, a0, s3
                  fcvt.w.s     s9, fa7
                  fcvt.s.wu    fs9, s9
                  xori         s2, t4, -1360
                  fmin.s       fa3, ft0, fa0
                  sltu         zero, t6, s6
                  mulh         gp, zero, a4
                  fclass.s     s2, fs8
                  fle.s        gp, fa4, fa0
                  xori         s11, a0, 972
                  mul          sp, s10, sp
                  remu         s7, a0, t1
                  mulhu        a4, s7, s5
                  sltu         t2, t6, t2
                  fclass.s     tp, fs7
                  addi         s9, a1, 589
                  divu         s1, a0, s3
                  slli         s9, s6, 2
                  nop
                  fdiv.s       fs4, fa2, ft1, rdn
                  fmv.x.w      s6, ft6
                  feq.s        t5, fs5, ft4
                  rem          sp, s9, t6
                  sltiu        sp, s10, -787
                  mulhsu       t4, t4, t3
                  srai         s6, t4, 28
                  slt          a4, s0, t6
                  sll          s1, s5, s10
                  lui          s0, 458081
                  add          a3, a6, s10
                  srli         t0, s2, 24
                  srai         a3, a2, 1
                  fcvt.wu.s    ra, fs10
                  sub          t4, s8, ra
                  addi         a2, a6, -419
                  sra          a3, t6, a5
                  fcvt.wu.s    t6, ft1
                  fmv.w.x      ft10, t0
                  feq.s        a1, ft2, fs3
                  fcvt.wu.s    t4, ft8
                  mulhu        s11, s3, s5
                  fmul.s       ft8, ft9, fa5
                  add          s9, tp, t5
                  srai         s3, s8, 12
                  slt          tp, s6, t4
                  srli         s4, tp, 29
                  remu         s3, s0, t2
                  fcvt.wu.s    t3, fs8, rtz
                  mulhu        sp, a6, t4
                  slti         s9, sp, -1189
                  fsub.s       fa4, fa6, fs6, rup
                  divu         gp, sp, s10
                  andi         s8, a6, -1437
                  fsqrt.s      ft7, ft9
                  slt          s4, s6, s1
                  fmv.x.w      s11, fs8
                  slt          gp, a0, gp
                  fsgnjx.s     fa5, fs6, fa6
                  fle.s        sp, ft6, fa0
                  mul          t6, ra, a3
                  fsgnjn.s     fs5, fa7, fs11
                  mul          s11, t4, s7
                  rem          a4, a4, a3
                  feq.s        t2, fa5, fa2
                  srai         s11, t2, 21
                  divu         zero, s1, t5
                  sra          s8, t4, zero
                  srl          gp, t1, t2
                  fmv.x.w      tp, ft1
                  fsub.s       fs8, fs9, ft9, rmm
                  sll          gp, a6, s8
                  fsgnjn.s     ft5, fs6, ft4
                  fmv.w.x      ft1, s8
                  sra          a2, zero, s1
                  andi         s1, gp, -1437
                  or           zero, sp, s0
                  flt.s        s11, ft10, ft9
                  andi         s0, s11, 1522
                  fsgnj.s      fs2, fa7, fa2
                  nop
                  add          a2, s6, t2
                  fdiv.s       fs1, ft7, ft11, rup
                  fsgnj.s      ft7, fa2, ft9
                  fsub.s       ft11, fs4, ft11, rdn
                  sra          s5, a4, a4
                  mul          zero, s9, a0
                  fmin.s       fs4, fs3, ft6
                  fcvt.s.wu    ft0, zero
                  sll          sp, a7, tp
                  andi         t5, s6, 1118
                  nop
                  srl          ra, tp, s6
                  fmv.x.w      gp, ft9
                  slt          t2, a1, a1
                  andi         zero, a2, 516
                  srai         t5, a2, 23
                  ori          s9, gp, 1362
                  remu         tp, a6, s8
                  addi         s6, a6, -482
                  fmax.s       ft9, fs11, ft5
                  fsgnj.s      fs5, fa1, fa2
                  add          t3, a4, t2
                  fmax.s       ft9, fa5, fs9
                  fcvt.wu.s    t2, fa2
                  sltu         ra, a4, s6
                  mul          s8, s2, ra
                  fadd.s       fs7, ft6, fs7, rup
                  fmax.s       ft4, fs3, fs0
                  fsub.s       ft9, fa6, fa3, rmm
                  slti         gp, a0, -1015
                  fmv.x.w      s3, fs3
                  ori          tp, s6, 237
                  fmin.s       fs8, fs11, fa3
                  rem          zero, a1, t1
                  flt.s        ra, fa1, ft0
                  ori          sp, t2, -102
                  fcvt.s.w     fa4, sp
                  fmv.x.w      ra, fs6
                  nop
                  div          t2, a5, s7
                  sra          sp, t5, t0
                  mulh         sp, a5, tp
                  fcvt.s.w     fa0, s1
                  add          a3, t4, t1
                  fmin.s       fa4, fa0, fs7
                  feq.s        s10, ft2, fa0
                  mulhu        t6, gp, t6
                  add          s1, a1, ra
                  add          s1, t2, s10
                  add          t3, a7, a1
                  fsgnjx.s     fs7, fs6, fs11
                  slti         s3, s2, 927
                  fle.s        s3, fs9, ft5
                  fsgnj.s      ft2, ft6, fs8
                  mulh         sp, s0, s6
                  fcvt.w.s     s10, ft2
                  slli         a4, a1, 11
                  srl          t2, a6, zero
                  add          t3, ra, s6
                  fclass.s     a3, ft4
                  flt.s        t2, fa4, fs10
                  fcvt.s.wu    ft11, s8
                  slli         t2, t0, 20
                  fcvt.wu.s    a5, ft8, rup
                  feq.s        a3, fa4, ft9
                  andi         t1, gp, 185
                  sra          t3, t1, s8
                  xori         s8, s1, 1513
                  fclass.s     s4, ft5
                  mulhsu       s4, s0, a4
                  fmv.x.w      s9, fs11
                  feq.s        s9, fs2, ft4
                  mulhu        t3, ra, a5
                  fmax.s       fa4, ft11, fa5
                  slt          a1, t6, s2
                  mul          s8, zero, t2
                  fsgnjx.s     fs6, ft8, ft10
                  ori          s6, s1, 958
                  fcvt.s.w     ft3, s8
                  sra          s3, a3, t5
                  sltiu        t5, a1, 123
                  sll          t1, t5, s6
                  andi         t2, a2, 1774
                  fmul.s       ft11, ft9, fs7
                  srli         s7, s5, 17
                  and          t1, t4, t0
                  fmv.x.w      s3, ft3
                  fsgnjx.s     fa5, ft11, fs0
                  fle.s        s7, fa5, fs11
                  fcvt.s.w     fa3, s6, rne
                  fsgnjx.s     fs2, fs10, ft8
                  slli         a4, a0, 29
                  mul          t2, s3, s4
                  sltiu        s11, a5, -1530
                  fsqrt.s      fs0, fa6
                  fcvt.wu.s    s4, fa3, rne
                  fcvt.s.wu    ft4, a7, rdn
                  fsub.s       fs7, fs1, fa2
                  sll          a5, t5, a2
                  srli         t2, t3, 16
                  fcvt.s.w     ft0, s0
                  mulhu        s7, s7, s3
                  slt          t2, a4, a0
                  nop
                  mul          s8, gp, a7
                  mulh         t6, s3, t5
                  fcvt.s.wu    ft9, s3, rmm
                  sll          s10, t0, s2
                  fcvt.w.s     gp, fs7
                  fsgnjn.s     ft6, ft6, fs5
                  andi         s1, tp, -979
                  div          s10, t0, a6
                  fcvt.wu.s    t4, fa4
                  fmul.s       fa2, ft3, ft4
                  slt          s7, a6, s4
                  and          s8, s10, a0
                  sub          ra, s2, gp
                  srai         t4, a7, 24
                  mulh         a5, t5, s2
                  srai         s11, s10, 10
                  mulh         s9, s9, a6
                  fclass.s     s9, fs6
                  fadd.s       fs6, fs2, fa6
                  flt.s        t3, fs2, fa4
                  slti         t6, s7, -559
                  add          t1, s2, ra
                  fsgnjn.s     ft11, fs0, fs5
                  fsgnjn.s     ft5, fs5, ft2
                  srli         t1, t5, 12
                  mulhu        t6, s0, s6
                  srl          a1, s11, s5
                  fcvt.s.wu    fa7, sp
                  srli         t1, s10, 24
                  divu         s9, a4, a4
                  add          s7, s4, s3
                  remu         s4, s11, s3
                  fclass.s     t2, fa7
                  fdiv.s       ft2, ft11, ft0
                  and          zero, a1, s10
                  remu         t3, s11, a5
                  flt.s        t6, ft1, ft3
                  fadd.s       ft6, fa6, fs7
                  srl          t0, a1, a7
                  addi         t1, s1, -1303
                  fcvt.wu.s    t4, fs8, rdn
                  andi         s10, s6, 951
                  auipc        s7, 149386
                  slt          tp, a2, a0
                  nop
                  fsgnjn.s     ft3, ft7, fa2
                  fcvt.s.w     fs3, a3, rne
                  sub          s2, s7, a6
                  fmv.w.x      ft1, t6
                  div          a5, s8, a5
                  feq.s        a3, fa0, fs6
                  mulh         a5, s8, a3
                  mul          s1, a4, tp
                  srli         tp, sp, 15
                  fcvt.wu.s    s3, ft8
                  srai         s11, zero, 12
                  fclass.s     s11, fs6
                  sub          s9, s6, s5
                  div          a1, s6, t6
                  sltiu        s7, t4, 560
                  slti         a5, t6, 1849
                  ori          a1, ra, 1815
                  lui          t2, 714996
                  sltu         s6, t1, a5
                  sltu         tp, a1, t5
                  fcvt.s.w     ft10, gp
                  slli         s3, ra, 6
                  fmax.s       fs7, fa0, ft10
                  fmv.w.x      fs9, zero
                  mulhsu       a1, a1, zero
                  fsgnjx.s     fs2, ft8, fs10
                  remu         s9, a7, s11
                  sll          s7, s6, a0
                  fsub.s       fs2, ft4, fs7
                  ori          t0, s6, 1140
                  srli         s8, gp, 0
                  slti         s9, s11, 1987
                  sltiu        a1, s6, 1738
                  fsub.s       ft0, fa2, fa6
                  sll          s11, s7, t3
                  feq.s        a2, fs4, fa6
                  sub          a1, t3, t6
                  remu         a4, ra, s0
                  auipc        a4, 154766
                  nop
                  fdiv.s       ft2, fa1, ft3
                  fsgnj.s      fa2, fs11, fa0
                  fsgnjn.s     fs2, fa3, fs3
                  sltu         zero, t4, a2
                  divu         t5, s3, a4
                  add          t5, a5, t2
                  srl          a4, t5, s1
                  fmin.s       fa0, fs6, fs4
                  divu         ra, a2, a2
                  fcvt.s.wu    fa3, t6
                  rem          a5, s0, t6
                  fcvt.wu.s    t5, fa1, rdn
                  xori         s3, t6, -333
                  andi         s0, s0, -1023
                  divu         s6, zero, t1
                  fcvt.wu.s    s6, ft7, rne
                  srl          a3, zero, t0
                  sll          t2, zero, a4
                  srl          s11, sp, a3
                  fsgnjx.s     ft6, fs5, ft8
                  fle.s        s3, ft2, fa5
                  xor          s7, s4, s0
                  fsqrt.s      fa7, fs10, rtz
                  addi         s9, s1, 433
                  fcvt.w.s     a1, fs11, rup
                  fcvt.s.wu    ft8, s1
                  xori         t1, tp, 1652
                  lui          zero, 447594
                  fsqrt.s      fs10, fs10
                  fmin.s       fa1, fs3, fs1
                  rem          s2, a5, t1
                  slli         tp, a3, 10
                  and          s2, a6, t4
                  fle.s        s1, fa5, fs10
                  sltu         a2, a4, t1
                  fle.s        a5, fa3, fa5
                  flt.s        t5, fs5, fa6
                  sub          s8, s7, a1
                  mulhsu       s1, a4, s1
                  mulhsu       t4, ra, t3
                  fsgnjn.s     ft10, fa7, ft11
                  fsqrt.s      ft11, ft9, rmm
                  andi         sp, s8, 1471
                  fmul.s       ft9, fa1, fs1
                  or           s2, ra, zero
                  fle.s        s6, fs8, fs2
                  sltiu        s5, a1, 585
                  fcvt.w.s     t0, fs11
                  andi         sp, s10, -1045
                  fcvt.s.wu    fs4, s10
                  xor          t2, s8, t3
                  ori          a2, zero, -1054
                  fclass.s     s0, ft1
                  sra          t0, a7, s0
                  fdiv.s       fs1, fs4, ft6
                  sub          ra, a5, t5
                  sltu         s1, s0, ra
                  ori          a5, t2, -832
                  rem          a2, s2, a4
                  mulh         ra, s2, t6
                  divu         a2, s10, tp
                  fsub.s       fs4, ft3, ft0
                  fcvt.w.s     s6, fs11
                  fmin.s       ft8, ft7, fs10
                  mulhu        a1, tp, a7
                  remu         s1, a6, a2
                  lui          s5, 426885
                  sltu         t4, s0, a1
                  mul          sp, s6, a6
                  sltu         s10, ra, t3
                  fcvt.wu.s    zero, ft8
                  slti         s7, a7, -745
                  addi         s5, s0, 680
                  fadd.s       fs9, ft6, ft1
                  nop
                  srai         s11, s6, 2
                  fmin.s       fa5, fa3, fs7
                  srli         s6, s11, 0
                  fmax.s       fa7, ft3, fs6
                  and          t4, t6, tp
                  sub          a3, s6, a2
                  fsgnj.s      fs7, ft7, fs3
                  div          s1, tp, s11
                  srli         a2, a3, 25
                  addi         a4, gp, 763
                  srli         t0, s0, 8
                  flt.s        s6, fa7, fs0
                  slt          t6, a0, s6
                  sltiu        tp, t1, 460
                  fmv.w.x      fa0, s2
                  flt.s        s2, fa1, fs4
                  fsgnjx.s     fa5, fa5, ft5
                  fsqrt.s      fs2, ft6
                  ori          zero, a4, -1166
                  or           s2, gp, sp
                  or           s9, t4, s7
                  divu         a3, a4, t6
                  xori         s10, s9, 1713
                  fle.s        s6, fs2, fa4
                  fsgnjn.s     fa2, fa5, fs0
                  andi         s3, s2, -1355
                  fsgnjx.s     fs4, ft10, ft9
                  fadd.s       fs2, fs9, ft0, rne
                  xor          s6, s1, s1
                  slli         t5, s7, 30
                  fmv.x.w      a2, ft6
                  andi         s1, s8, -336
                  fmin.s       ft2, fa0, ft7
                  ori          t5, a0, -1683
                  fsgnj.s      fs0, fa1, fs3
                  srli         s4, s10, 3
                  srli         t1, s2, 24
                  sub          s2, s5, a7
                  flt.s        t3, fs8, fs11
                  div          sp, s9, zero
                  nop
                  and          s10, s1, zero
                  and          s2, s3, s4
                  feq.s        s5, fs9, ft2
                  xor          t4, a2, s5
                  sltu         t0, t2, s6
                  or           s4, s7, t6
                  add          t2, s4, gp
                  auipc        s9, 928638
                  fclass.s     ra, fa2
                  srai         s11, s11, 3
                  fle.s        t0, fs2, ft11
                  fcvt.s.wu    fs1, s10
                  and          s6, t1, t3
                  feq.s        ra, ft2, fs0
                  fmul.s       fa5, ft10, fa7
                  sub          a2, t2, a1
                  sll          sp, t6, sp
                  xori         s7, gp, -339
                  divu         s0, t5, a2
                  sltu         s3, s7, zero
                  fsgnjx.s     fs10, fs3, ft9
                  slt          a2, zero, a7
                  fsgnj.s      fs4, ft2, ft10
                  div          ra, s0, a1
                  fle.s        s8, fs2, fa0
                  fmin.s       ft8, fa3, fs1
                  or           t5, zero, a7
                  feq.s        s7, fa3, fa6
                  fdiv.s       fa2, fa2, fs5, rne
                  sltu         a1, s11, s1
                  fcvt.s.w     fa0, gp
                  fsub.s       fs3, fs8, ft4, rup
                  fcvt.s.w     fa5, gp
                  xor          s6, a3, a2
                  add          s6, t5, sp
                  mulhu        t1, s4, gp
                  feq.s        s0, ft1, ft9
                  sub          a4, s6, s5
                  fclass.s     t0, fa5
                  la x10, test_done
                  jalr x0, x10, 0
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
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_2:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_3:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_4:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_5:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_6:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_7:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_8:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_9:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_10:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_11:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_12:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_13:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_14:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

mmode_intr_vector_15:
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x342 # MCAUSE
                  srli x22, x22, 0x1f
                  beqz x22, 1f
                  j mmode_intr_handler
                  1: la x10, test_done
                  jalr x0, x10, 0

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
                  addi x16, x16, -4
                  sw  x17, (x16)
                  add x17, x16, zero
                  addi x17, x17, -128
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  add x16, x17, zero
                  csrr x22, 0x341 # MEPC
                  csrr x22, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x22, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x22, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x22, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x22, x9, ecall_handler
                  li x9, 0x1
                  beq x22, x9, instr_fault_handler
                  li x9, 0x5
                  beq x22, x9, load_fault_handler
                  li x9, 0x7
                  beq x22, x9, store_fault_handler
                  li x9, 0xc
                  beq x22, x9, pt_fault_handler
                  li x9, 0xd
                  beq x22, x9, pt_fault_handler
                  li x9, 0xf
                  beq x22, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x22, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
                  1: la x10, test_done
                  jalr x1, x10, 0

ecall_handler:    
                  la x22, _start
                  sw x0, 0(x22)
                  sw x1, 4(x22)
                  sw x2, 8(x22)
                  sw x3, 12(x22)
                  sw x4, 16(x22)
                  sw x5, 20(x22)
                  sw x6, 24(x22)
                  sw x7, 28(x22)
                  sw x8, 32(x22)
                  sw x9, 36(x22)
                  sw x10, 40(x22)
                  sw x11, 44(x22)
                  sw x12, 48(x22)
                  sw x13, 52(x22)
                  sw x14, 56(x22)
                  sw x15, 60(x22)
                  sw x16, 64(x22)
                  sw x17, 68(x22)
                  sw x18, 72(x22)
                  sw x19, 76(x22)
                  sw x20, 80(x22)
                  sw x21, 84(x22)
                  sw x22, 88(x22)
                  sw x23, 92(x22)
                  sw x24, 96(x22)
                  sw x25, 100(x22)
                  sw x26, 104(x22)
                  sw x27, 108(x22)
                  sw x28, 112(x22)
                  sw x29, 116(x22)
                  sw x30, 120(x22)
                  sw x31, 124(x22)
                  la x10, write_tohost
                  jalr x0, x10, 0

instr_fault_handler:
                  add x17, x16, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x16, x17, zero
                  lw  x17, (x16)
                  addi x16, x16, 4
                  mret

load_fault_handler:
                  add x17, x16, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x16, x17, zero
                  lw  x17, (x16)
                  addi x16, x16, 4
                  mret

store_fault_handler:
                  add x17, x16, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x16, x17, zero
                  lw  x17, (x16)
                  addi x16, x16, 4
                  mret

ebreak_handler:   
                  csrr  x22, 0x341
                  addi  x22, x22, 4
                  csrw  0x341, x22
                  add x17, x16, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x16, x17, zero
                  lw  x17, (x16)
                  addi x16, x16, 4
                  mret

illegal_instr_handler:
                  csrr  x22, 0x341
                  addi  x22, x22, 4
                  csrw  0x341, x22
                  add x17, x16, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x16, x17, zero
                  lw  x17, (x16)
                  addi x16, x16, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x22, 0x300 # MSTATUS;
                  csrr  x22, 0x304 # MIE;
                  csrr  x22, 0x344 # MIP;
                  csrrc x22, 0x344, x22 # MIP;
                  add x17, x16, zero
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 128
                  add x16, x17, zero
                  lw  x17, (x16)
                  addi x16, x16, 4
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
