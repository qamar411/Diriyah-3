.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x19, h0_start
jalr x0, x19, 0
h0_start:
                  li x6, 0x40001120
                  csrw 0x301, x6
kernel_sp:        
                  la x30, kernel_stack_end

trap_vec_init:    
                  la x6, mtvec_handler
                  ori x6, x6, 1
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
init:             csrr x10, 0x003
                  li x6, 6720840
                  fmv.w.x f0, x6
                  li x6, 2139095040
                  fmv.w.x f1, x6
                  li x6, 2143289344
                  fmv.w.x f2, x6
                  li x6, 2139095041
                  fmv.w.x f3, x6
                  li x6, 0
                  fmv.w.x f4, x6
                  li x6, 4286578688
                  fmv.w.x f5, x6
                  li x6, 2143289344
                  fmv.w.x f6, x6
                  li x6, 2080819184
                  fmv.w.x f7, x6
                  li x6, 4286578687
                  fmv.w.x f8, x6
                  li x6, 2505876050
                  fmv.w.x f9, x6
                  li x6, 3351307011
                  fmv.w.x f10, x6
                  li x6, 0
                  fmv.w.x f11, x6
                  li x6, 2147483648
                  fmv.w.x f12, x6
                  li x6, 2139095040
                  fmv.w.x f13, x6
                  li x6, 2139095041
                  fmv.w.x f14, x6
                  li x6, 2139095039
                  fmv.w.x f15, x6
                  li x6, 2143289344
                  fmv.w.x f16, x6
                  li x6, 2148760329
                  fmv.w.x f17, x6
                  li x6, 2139095039
                  fmv.w.x f18, x6
                  li x6, 2143289344
                  fmv.w.x f19, x6
                  li x6, 2139095039
                  fmv.w.x f20, x6
                  li x6, 4286578688
                  fmv.w.x f21, x6
                  li x6, 2148273584
                  fmv.w.x f22, x6
                  li x6, 4286578687
                  fmv.w.x f23, x6
                  li x6, 4554595
                  fmv.w.x f24, x6
                  li x6, 2139095039
                  fmv.w.x f25, x6
                  li x6, 2964548509
                  fmv.w.x f26, x6
                  li x6, 4286578687
                  fmv.w.x f27, x6
                  li x6, 2143289344
                  fmv.w.x f28, x6
                  li x6, 2139095040
                  fmv.w.x f29, x6
                  li x6, 4286578687
                  fmv.w.x f30, x6
                  li x6, 2139095040
                  fmv.w.x f31, x6
                  fsrmi 4
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0xb19e6a6c
                  li x3, 0x80000000
                  li x4, 0x6
                  li x5, 0x80000000
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0xf5386527
                  li x9, 0x80000000
                  li x10, 0xf875caf7
                  li x11, 0xa
                  li x12, 0x4
                  li x13, 0x4
                  li x14, 0xa
                  li x15, 0x80000000
                  li x16, 0x5
                  li x17, 0xf
                  li x18, 0x1
                  li x19, 0xf7972d21
                  li x20, 0x80000000
                  li x21, 0xf0f58fba
                  li x22, 0xc
                  li x23, 0x9
                  li x24, 0xf2c675f9
                  li x25, 0xd
                  li x26, 0x1
                  li x28, 0xf1d175b7
                  li x29, 0xf1a89710
                  li x31, 0x80000000
                  la x27, user_stack_end
main:             remu         a2, t3, a5
                  sll          a0, a2, a0
                  divu         s0, zero, s4
                  remu         t2, a2, s7
                  flt.s        a7, fs2, fa3
                  rem          t2, zero, a2
                  rem          s8, a5, s11
                  slt          s4, a5, gp
                  fcvt.s.w     fa5, s7
                  srli         sp, s2, 31
                  addi         s4, s4, 95
                  fsgnjx.s     ft7, fs1, ft3
                  sll          zero, t3, t4
                  srl          t3, s11, tp
                  fcvt.s.wu    ft10, tp
                  lui          a4, 931527
                  fle.s        t0, fa2, fs10
                  div          a1, t4, s1
                  xori         a7, s3, -775
                  fcvt.s.w     fs5, ra, rdn
                  add          t4, a6, s7
                  slti         a3, s0, -138
                  sub          s10, t3, t5
                  fclass.s     a5, ft3
                  remu         s8, gp, t4
                  fcvt.wu.s    a7, fs10, rmm
                  remu         s8, t4, t0
                  add          a1, a1, t2
                  addi         t4, s2, -539
                  addi         s1, s7, 30
                  sltu         tp, t4, s2
                  and          a1, s9, s4
                  andi         a6, s9, -1445
                  mulh         a0, t2, s3
                  feq.s        zero, fs5, fa2
                  mulhu        a4, a7, s4
                  fcvt.wu.s    s8, fs6, rmm
                  mulh         t0, s8, a6
                  ori          gp, s2, 387
                  addi         s1, t4, -762
                  fcvt.w.s     a7, fa4
                  fmv.x.w      a4, fs3
                  rem          gp, s8, a4
                  nop
                  feq.s        gp, fa5, fs6
                  fcvt.s.w     ft9, tp
                  fcvt.s.w     ft0, s4, rtz
                  slli         t4, a0, 28
                  fsgnjx.s     fa5, fs4, fa1
                  slti         t2, zero, 1600
                  or           s9, tp, t2
                  slt          a1, a6, s4
                  rem          a5, zero, a3
                  fsgnjx.s     fs11, fs0, fs8
                  fle.s        s0, fs1, fs8
                  feq.s        tp, fs1, fs9
                  addi         t3, t2, -767
                  flt.s        s6, fa6, fa4
                  mulh         sp, a2, t3
                  addi         s6, s7, -11
                  xor          a1, t4, gp
                  auipc        t6, 577165
                  slt          s6, gp, a3
                  xori         a6, s10, -1749
                  srli         t4, s4, 18
                  fsgnj.s      fs7, ft11, ft10
                  fsgnjn.s     fs3, ft8, ft10
                  fmin.s       ft2, fs3, fa4
                  mulhu        s9, a5, s3
                  feq.s        t0, fa3, fa7
                  mulh         a2, a3, a0
                  fsub.s       fs8, fs9, ft5, rup
                  rem          t2, ra, s3
                  addi         s10, ra, -702
                  fcvt.w.s     t0, ft6
                  fmv.w.x      fa7, s7
                  slti         s7, a6, -467
                  ori          tp, sp, -397
                  xori         a4, s5, 1536
                  slli         s6, s11, 17
                  fcvt.w.s     a1, fs11
                  fmax.s       fa2, ft9, fs9
                  xori         t2, t3, -1682
                  add          a6, s7, s7
                  fsgnjn.s     fa7, ft0, ft6
                  fadd.s       fs6, fa1, ft9, rdn
                  srl          a4, t2, s2
                  addi         s10, s3, -1171
                  fmv.x.w      s9, fs1
                  fmin.s       fs9, fa6, fs3
                  fmin.s       fa2, ft3, fa7
                  srl          a3, t1, s1
                  fsgnjx.s     fa6, ft6, fa0
                  div          ra, zero, t0
                  div          t2, s7, s6
                  fcvt.s.w     ft6, s10, rne
                  sltu         s4, a0, sp
                  fmin.s       ft2, fs4, ft8
                  sll          gp, a2, s2
                  div          a3, s10, a1
                  srai         a2, a7, 6
                  xor          a7, tp, s5
                  flt.s        s9, ft0, fa2
                  fcvt.s.wu    fs1, gp
                  fclass.s     a4, fs2
                  nop
                  fcvt.wu.s    a5, fa0, rtz
                  auipc        t2, 896951
                  mulhu        zero, t1, s10
                  rem          a1, a4, tp
                  mulhu        t2, a4, a4
                  sltiu        a4, t2, 1266
                  fsub.s       fa1, fa4, ft2
                  fcvt.s.w     ft10, s1, rdn
                  sltu         a5, s9, a0
                  add          ra, a7, s2
                  fcvt.w.s     t0, fa7
                  ori          a0, tp, 311
                  fsgnj.s      fa2, fa2, fs10
                  feq.s        sp, fs6, ft0
                  xor          s2, s8, ra
                  xor          a7, a7, t6
                  remu         s8, s8, a1
                  nop
                  remu         t3, a0, sp
                  andi         s2, a6, -1879
                  sub          s8, ra, s10
                  andi         a4, a7, -732
                  or           t2, s9, t1
                  xori         a4, t0, -1962
                  auipc        a3, 1040602
                  mul          ra, a7, s9
                  or           s8, a5, t2
                  mulhsu       s8, t2, s1
                  srli         a4, s8, 31
                  and          s1, s1, a0
                  srli         a1, s5, 17
                  lui          gp, 253180
                  nop
                  mulhsu       a7, a5, s5
                  sub          s1, s6, s2
                  remu         tp, a6, t2
                  sub          zero, s6, t1
                  srai         t2, t5, 11
                  feq.s        s7, fa1, ft4
                  srai         a1, t3, 0
                  srli         t3, s4, 11
                  fcvt.s.w     fs11, s11, rmm
                  fmv.w.x      fa4, s5
                  fmax.s       fs7, fs6, fs0
                  srai         s2, t1, 0
                  xori         a2, s8, -1316
                  fadd.s       fs1, fs0, fs1
                  slti         a4, s10, 650
                  slli         s1, a5, 0
                  slt          gp, t3, t0
                  mulh         t1, ra, s4
                  slt          a2, s2, a5
                  slti         s7, a1, 448
                  fsgnj.s      fs3, ft8, fs0
                  ori          a2, sp, 24
                  fcvt.s.w     fa6, gp
                  fmv.w.x      fs6, s2
                  xor          s0, s10, t1
                  fsgnjx.s     ft6, ft1, ft11
                  fmax.s       fa1, fs11, fs3
                  feq.s        a0, ft10, ft3
                  ori          s1, ra, 1345
                  sltu         a2, a2, sp
                  srl          a4, s3, a3
                  mul          t4, a7, s8
                  slli         s1, s10, 11
                  addi         a7, a4, -1056
                  fclass.s     a1, fs11
                  fmax.s       fs7, fa2, fa4
                  sltiu        s6, s2, -559
                  fmin.s       fa7, fs0, fa5
                  flt.s        s6, ft6, ft3
                  xori         a6, s2, -1832
                  add          s4, s9, gp
                  xori         s9, t3, 1748
                  add          tp, t3, a2
                  srl          s4, a0, s5
                  fadd.s       fa5, fa3, fa1
                  andi         t3, s8, -1332
                  mulh         s4, s6, a0
                  slli         s1, a3, 7
                  divu         a1, s0, s0
                  addi         ra, ra, -339
                  fcvt.w.s     t6, ft4, rdn
                  slti         s7, t2, -888
                  remu         s8, t2, tp
                  fmv.x.w      a5, fa1
                  fsgnjx.s     ft6, fs3, fs7
                  fmv.w.x      ft9, zero
                  and          t6, gp, a4
                  fsub.s       fs6, ft11, ft9
                  mulhu        s7, a2, t1
                  and          t1, t4, a5
                  xori         sp, gp, -176
                  and          a7, gp, ra
                  fadd.s       fs11, fs0, fs6
                  mulhu        s6, s8, s6
                  fsgnjn.s     fs8, fa1, fs1
                  fcvt.w.s     a5, ft10
                  fcvt.wu.s    a7, ft2, rne
                  fmv.x.w      a2, fs8
                  fcvt.s.wu    fa6, a4, rdn
                  srai         sp, t4, 7
                  slti         s5, s6, 1086
                  andi         s0, sp, 1478
                  remu         gp, t6, t0
                  sra          t4, a4, t0
                  fcvt.wu.s    s8, fs3
                  xori         a5, t6, -298
                  fadd.s       fa3, ft4, ft5, rmm
                  xor          a4, s4, a5
                  fcvt.s.wu    fa3, sp, rne
                  divu         a6, a0, t5
                  fcvt.s.wu    fs11, a2
                  fsub.s       ft10, ft4, fs8, rdn
                  nop
                  mulhsu       zero, zero, s11
                  fcvt.s.wu    fa3, a0
                  xor          t3, t3, a6
                  fle.s        t6, fs8, fs6
                  div          t1, s8, zero
                  fadd.s       fa2, ft5, ft8
                  xori         s6, s7, 763
                  xori         a5, t6, 1136
                  fadd.s       fs5, ft1, ft3
                  or           a5, a5, a2
                  mul          a3, s8, s5
                  sub          t3, t2, a0
                  fmin.s       fa6, fs8, fs9
                  srli         sp, a3, 6
                  andi         zero, s10, -335
                  fclass.s     a5, fa0
                  slt          a7, sp, s5
                  sra          tp, s9, a6
                  fsgnj.s      ft9, fs11, ft5
                  fadd.s       ft11, fs4, fa4
                  fclass.s     s5, fs8
                  nop
                  srl          s2, t3, s7
                  fmv.w.x      ft4, s3
                  mulh         s9, a0, sp
                  fadd.s       fs3, fs7, ft3, rne
                  add          a3, s7, a7
                  mul          zero, s3, t3
                  fmv.x.w      gp, fs8
                  fmin.s       fs5, fs8, ft1
                  feq.s        a5, fa5, fs0
                  fsgnjn.s     fa7, ft4, ft1
                  sltu         a1, t4, t0
                  fsub.s       fs3, fs6, fs3, rmm
                  fsub.s       ft8, ft1, fa5
                  fcvt.w.s     sp, fs11
                  ori          s6, s6, -446
                  div          s0, a6, zero
                  ori          a1, t6, -1256
                  fcvt.w.s     s7, ft10
                  fclass.s     s8, fs8
                  mulh         s4, s1, t2
                  slti         s9, a3, -1222
                  auipc        a0, 829873
                  sra          s1, s1, sp
                  nop
                  sltu         t0, a7, a2
                  mulh         s8, s9, tp
                  mulhsu       tp, a1, zero
                  fcvt.w.s     s5, fs7
                  sltu         sp, s4, a0
                  rem          ra, s9, s9
                  div          s1, a5, t3
                  fcvt.wu.s    a3, fa1, rne
                  mul          a1, a3, sp
                  srl          gp, s4, t4
                  sltu         a7, t3, a2
                  feq.s        s10, fs8, fa3
                  add          s2, t2, t6
                  srli         s1, s0, 2
                  feq.s        zero, ft3, fs5
                  fcvt.s.w     ft5, a1
                  mulh         a7, t0, zero
                  fsgnj.s      fs5, fa7, fa5
                  rem          a1, t2, s2
                  auipc        zero, 302014
                  fadd.s       fs10, fa7, fa4, rdn
                  fcvt.s.wu    fs8, s10
                  srli         t6, zero, 4
                  andi         t3, tp, 1321
                  mul          t1, a3, a1
                  srai         a0, sp, 10
                  fsgnjx.s     ft7, ft1, ft11
                  fcvt.s.w     fs5, t5
                  fsub.s       ft3, ft6, ft5
                  fcvt.s.w     ft1, sp, rne
                  mulh         t0, gp, t2
                  mul          s6, s9, s5
                  div          a7, zero, a2
                  flt.s        s1, fs9, fs6
                  mul          ra, t0, a6
                  andi         s1, a0, -1091
                  ori          tp, s6, -573
                  fmv.w.x      ft2, a4
                  slti         t2, t5, 2003
                  fsgnjn.s     ft5, fa2, ft7
                  or           s2, s5, s2
                  fcvt.wu.s    t2, fa1
                  nop
                  fsgnjn.s     ft9, fs6, fa0
                  divu         a0, s7, t1
                  flt.s        ra, ft0, fs9
                  rem          a0, t4, t2
                  fmin.s       fs2, fs5, fs11
                  nop
                  andi         t4, s2, 901
                  fsgnjn.s     fs2, ft5, fa6
                  div          s0, s9, a6
                  fmv.x.w      zero, ft3
                  sll          s2, s7, t2
                  fsgnjn.s     fa5, ft11, fa6
                  xor          s5, s5, t3
                  remu         s1, t5, s1
                  fadd.s       fa1, fs2, ft2
                  lui          zero, 675767
                  fmax.s       ft0, ft0, ft4
                  fmax.s       ft8, fa6, fa6
                  fsgnjx.s     fs5, ft8, fs3
                  add          zero, s0, t0
                  fadd.s       fs6, fa6, fs10
                  sltu         a4, s8, a1
                  mul          t2, s5, s6
                  fsub.s       fa5, fa0, fa6
                  xori         ra, a6, 538
                  mulh         gp, a2, t2
                  mulhsu       t3, zero, t5
                  sll          t4, s0, t2
                  fclass.s     s0, ft0
                  or           tp, a6, t6
                  fcvt.s.wu    ft1, t0
                  lui          s1, 728646
                  addi         a2, a2, -390
                  flt.s        gp, fs4, fa5
                  fmv.w.x      fs6, s10
                  div          t4, t2, s10
                  srli         s2, a1, 6
                  xori         s6, a0, 1707
                  fsgnjn.s     ft2, ft10, ft0
                  mulhsu       t3, a6, sp
                  divu         t3, s7, zero
                  rem          s9, t3, ra
                  fmax.s       fs6, fs1, fa2
                  divu         t2, tp, s2
                  feq.s        ra, fs1, fa7
                  div          s9, a5, s11
                  and          s0, gp, s0
                  rem          t3, s0, s6
                  and          a6, a6, zero
                  fcvt.s.w     ft5, s11, rup
                  fsgnjx.s     ft8, fa6, fs9
                  sll          a2, a6, a5
                  fsgnjx.s     fa4, ft0, ft7
                  addi         zero, t5, -800
                  fmax.s       fs11, fa5, ft4
                  fmv.w.x      fa1, s2
                  fsub.s       fs6, fs1, ft10, rmm
                  fcvt.s.wu    fs2, s8
                  mul          a1, s6, t6
                  addi         sp, s11, 90
                  fsgnjn.s     fs5, fs7, ft5
                  fclass.s     s10, fa6
                  sltiu        t3, s8, -119
                  add          s0, s1, ra
                  slt          sp, t3, a0
                  fsgnj.s      fs5, ft7, ft10
                  slli         a1, t6, 8
                  or           a7, a1, s7
                  fmin.s       fa5, ft3, fa2
                  feq.s        s7, fs3, fs2
                  slti         gp, s9, -1894
                  nop
                  rem          a0, zero, s4
                  fsgnjn.s     fa6, fa7, fs7
                  srli         gp, s0, 7
                  fcvt.s.w     fs11, s11
                  xori         t2, s11, 94
                  div          s2, s10, tp
                  sub          a6, s4, a2
                  fadd.s       fs11, ft8, ft10
                  mulhsu       t3, s2, s7
                  mulhu        s2, a4, s9
                  srai         a1, s1, 12
                  fclass.s     gp, fa7
                  flt.s        a6, ft9, fa7
                  mulh         sp, tp, s1
                  or           a7, gp, a0
                  fmv.x.w      t1, fa0
                  fmin.s       fs6, fa0, fs4
                  andi         a1, s9, 898
                  fcvt.w.s     a6, ft1, rtz
                  mulhsu       t2, t3, s2
                  add          s1, tp, gp
                  slt          t3, s7, a6
                  slt          s8, s1, a2
                  slli         t0, a3, 26
                  mulhsu       s7, s8, a1
                  div          t6, t5, t0
                  addi         s4, t5, -940
                  ori          s6, s9, -1294
                  lui          a2, 832172
                  mulhsu       zero, t2, a5
                  fsub.s       fs9, fs9, fs5
                  fsgnjn.s     fs1, ft3, fs2
                  fclass.s     s8, fs3
                  xori         s9, s1, 557
                  xori         t0, t5, -1337
                  divu         a5, a0, a7
                  sll          t2, s3, s3
                  auipc        tp, 978194
                  xori         a7, a0, 572
                  nop
                  mulh         s1, a6, t6
                  fmax.s       fs6, ft4, fs3
                  addi         a7, s9, -1325
                  or           t1, s9, a5
                  fmv.x.w      sp, fs8
                  fcvt.w.s     t1, fs11, rup
                  fmax.s       fs10, fa4, ft7
                  mulhu        gp, gp, s6
                  fcvt.s.w     ft0, s3, rne
                  andi         a3, a5, -1185
                  nop
                  andi         a5, s10, -832
                  rem          gp, a1, s8
                  fsgnjx.s     ft1, fs5, fs1
                  ori          a7, a4, -1005
                  auipc        s10, 69340
                  nop
                  fclass.s     a2, fa3
                  fsgnjn.s     ft2, ft10, fs8
                  andi         a3, sp, 666
                  flt.s        a5, fa6, ft0
                  sltu         s6, a1, sp
                  sll          s0, s9, a6
                  fclass.s     s5, fs8
                  fadd.s       fs5, fa7, ft0, rtz
                  mulhsu       s0, s5, s0
                  sltu         s7, t0, gp
                  lui          t6, 191738
                  lui          s1, 989203
                  auipc        a6, 589682
                  sltiu        a2, s9, 1325
                  remu         s0, zero, s5
                  mul          t1, t4, a4
                  slt          t2, t4, t6
                  srl          t2, s11, zero
                  auipc        a7, 429516
                  xor          s7, s8, s5
                  and          a1, t4, ra
                  mul          a6, s1, zero
                  div          t2, a5, s0
                  andi         t6, a2, 234
                  srai         ra, s2, 21
                  mulh         s4, s0, a2
                  fmv.x.w      sp, ft0
                  slli         gp, t1, 18
                  fsgnj.s      ft11, ft9, fs2
                  feq.s        t0, ft6, fa5
                  fcvt.s.wu    ft6, s2, rmm
                  fclass.s     s8, fa6
                  fmin.s       fa5, ft4, fs10
                  sltiu        a0, tp, -450
                  div          s8, a1, a6
                  slli         a5, s7, 25
                  auipc        t2, 435407
                  fsub.s       fs3, ft2, fa4
                  and          tp, a6, gp
                  fcvt.s.wu    ft7, t2
                  srai         s6, s11, 29
                  feq.s        a0, ft5, fa3
                  ori          a2, s10, -1875
                  fsub.s       fs4, ft4, fs6
                  sra          s7, s2, a0
                  mul          a0, a0, t0
                  fmax.s       ft3, fa7, fa0
                  add          s2, s1, s8
                  xor          s10, ra, t2
                  fmv.x.w      t4, ft9
                  lui          a6, 509044
                  remu         s9, s8, a6
                  fadd.s       fs0, fs7, ft5, rdn
                  rem          a4, s11, t6
                  sltu         s8, t3, ra
                  auipc        s8, 852391
                  fmv.x.w      a3, fa0
                  feq.s        s8, fa2, ft10
                  fmv.x.w      t2, ft3
                  feq.s        a1, ft7, fs1
                  addi         s5, ra, 1937
                  srli         sp, zero, 29
                  lui          s7, 123539
                  div          zero, s8, t6
                  fsgnj.s      fa7, fa0, fs1
                  add          a0, tp, t1
                  fsgnjx.s     ft7, ft0, fs2
                  ori          t1, a5, -1966
                  fclass.s     a0, ft6
                  fcvt.w.s     a6, ft10
                  or           t3, t5, sp
                  fadd.s       fs9, fs0, fs4, rdn
                  fcvt.wu.s    gp, fs3
                  fcvt.wu.s    s5, ft4
                  auipc        s4, 477896
                  srai         a1, a7, 31
                  fadd.s       ft11, fa0, fs5
                  fcvt.s.w     fs11, s7, rup
                  rem          zero, gp, s8
                  divu         a2, a4, s0
                  fmax.s       ft0, ft8, fa5
                  div          sp, t0, s0
                  fcvt.wu.s    t2, ft2, rdn
                  addi         a0, tp, 182
                  remu         s4, s4, s11
                  fcvt.wu.s    s4, fs1, rmm
                  addi         a5, s2, -1118
                  nop
                  sltiu        s5, a7, 1366
                  fsub.s       fs5, fa0, fs2, rmm
                  srai         ra, s5, 31
                  sll          s1, t3, t3
                  sltiu        t3, a1, -2
                  fcvt.wu.s    a3, fa2
                  fcvt.w.s     zero, ft7, rmm
                  slti         ra, a1, 266
                  xor          s8, s6, a4
                  sltiu        s0, s10, -1209
                  fsgnj.s      fa2, ft6, ft0
                  sltu         zero, s3, a1
                  mul          t3, s10, s2
                  addi         s9, s5, 598
                  auipc        a3, 729520
                  ori          s9, ra, 1019
                  flt.s        a5, ft7, ft5
                  sra          s10, t0, s9
                  addi         a4, t2, -98
                  mulh         s6, t3, a0
                  fsub.s       ft1, fs10, ft5, rdn
                  mulhu        s0, s11, t4
                  slli         s10, a0, 5
                  fsgnjx.s     ft11, fs0, ft9
                  andi         s9, s5, -74
                  fsub.s       fs0, fs5, fs7, rmm
                  srli         t6, s0, 31
                  mul          t4, a5, a2
                  fmin.s       ft6, ft10, ft7
                  fcvt.s.wu    fa3, t5
                  fclass.s     t4, fa7
                  sltu         a7, s4, a2
                  lui          s2, 481747
                  fcvt.s.wu    ft3, a4, rdn
                  feq.s        s4, fs9, fa6
                  or           s5, tp, s3
                  andi         s9, s4, 522
                  rem          s7, gp, ra
                  feq.s        gp, fa4, ft3
                  slti         a1, s1, -1561
                  xor          a5, s8, t5
                  fmv.x.w      tp, fa6
                  fcvt.w.s     t3, fs2, rup
                  nop
                  sltu         t2, a6, t3
                  fcvt.wu.s    a2, fa2, rne
                  xori         s5, a6, 543
                  xori         a5, gp, 671
                  srai         s10, s6, 20
                  flt.s        t0, fs7, fs11
                  slti         t3, t3, 881
                  fmv.x.w      s8, fs5
                  fcvt.s.w     fs8, t1
                  sltiu        s2, gp, -1561
                  fsgnjx.s     fs9, ft11, fs6
                  fle.s        a4, ft9, ft9
                  fmv.x.w      s8, fa2
                  srli         s6, a3, 7
                  fcvt.w.s     a7, fs9
                  srai         t4, s0, 0
                  slli         a7, a0, 2
                  mulhsu       s2, s7, s2
                  fsgnjn.s     ft4, fs10, fa4
                  lui          t0, 507400
                  lui          s4, 696802
                  mulhu        s9, s6, s9
                  sub          s0, tp, s4
                  nop
                  divu         a7, a3, s1
                  srai         s5, a3, 22
                  srai         a5, a3, 23
                  fsgnjx.s     ft5, fs2, ft1
                  xori         s0, t0, -1355
                  sltiu        t0, s2, -1588
                  fcvt.s.w     fa2, t2
                  feq.s        s6, fa3, fs4
                  fcvt.w.s     a3, fs4, rne
                  lui          s1, 58949
                  mulh         t4, s2, a1
                  fmax.s       ft4, ft9, fa2
                  fclass.s     t1, fs6
                  auipc        a1, 556135
                  fcvt.s.w     ft10, a4, rtz
                  sltiu        a0, t1, 126
                  fmv.x.w      ra, fs11
                  mul          s0, a6, s10
                  sll          s7, t2, a7
                  and          t2, ra, ra
                  srai         gp, s8, 5
                  fcvt.s.wu    fa2, zero, rmm
                  and          s4, s5, s0
                  slli         t1, a2, 8
                  add          s2, ra, s3
                  sltiu        s9, s3, -322
                  ori          a0, a6, 1404
                  rem          s0, t2, s9
                  xori         s10, s6, -742
                  and          a0, t0, t1
                  fclass.s     t0, fs9
                  sltu         s7, ra, s2
                  srli         s5, a5, 15
                  fle.s        s7, fs1, ft1
                  xor          a0, a5, s10
                  xori         t1, gp, -1637
                  div          a7, s7, t3
                  lui          t2, 96403
                  mulhu        s1, a5, s2
                  andi         a2, s2, -1098
                  mulhu        s4, s10, s4
                  feq.s        a7, fs3, ft8
                  xori         s8, s2, -1740
                  xori         s0, sp, -187
                  fsgnjx.s     ft5, fs5, ft7
                  div          t2, t3, a6
                  fmax.s       fa2, fs11, fa1
                  nop
                  auipc        a2, 318549
                  fsub.s       ft5, ft1, fa3
                  fmin.s       ft5, ft0, fa5
                  slti         a3, a4, 1635
                  fmin.s       fs7, fa5, ft11
                  ori          s9, a3, 649
                  add          a2, s2, s6
                  flt.s        a3, fa6, ft5
                  fcvt.s.w     fs8, a1
                  fsgnj.s      fa1, ft11, ft7
                  xori         gp, s7, 104
                  addi         gp, s0, -1680
                  xor          a6, s10, a6
                  div          a4, tp, a7
                  fcvt.w.s     s5, fs2
                  srl          s2, ra, tp
                  sub          sp, a2, tp
                  div          t6, s2, s8
                  fclass.s     s1, fs2
                  sll          a4, t5, tp
                  or           a0, t4, s7
                  fle.s        s1, fa4, fa4
                  feq.s        s5, fa0, ft2
                  slt          s0, a7, sp
                  mulh         gp, zero, a5
                  mulhu        t2, sp, a6
                  add          s8, s1, t6
                  sra          a6, a7, s8
                  or           a1, zero, t3
                  ori          t3, t6, -1899
                  fmv.w.x      fa3, a6
                  slt          t2, t0, t0
                  andi         s7, t6, 1068
                  auipc        gp, 22697
                  sll          s8, t2, a3
                  remu         t1, t4, t2
                  fmv.w.x      ft6, a5
                  xori         s9, s11, 2047
                  mul          a1, a0, s5
                  flt.s        s0, ft8, fs0
                  sub          s8, t4, s4
                  slli         zero, s1, 6
                  fle.s        s1, ft9, ft5
                  sll          a2, t0, t2
                  fcvt.w.s     s9, fs4, rtz
                  sll          a3, t6, t0
                  mul          a6, a3, sp
                  xori         s5, s7, -248
                  fsgnjx.s     fa7, fs7, fa5
                  fcvt.s.wu    fs9, a0
                  mulhsu       s4, t6, s2
                  srl          t3, ra, s10
                  fcvt.wu.s    a7, fs1
                  sltiu        t0, zero, -943
                  div          tp, t1, t4
                  div          s10, t0, a6
                  fle.s        t4, fs2, fs10
                  remu         a4, s0, t3
                  fmv.w.x      fs2, t2
                  sll          gp, s6, s5
                  flt.s        sp, fs9, ft1
                  sltu         a1, a7, s9
                  slti         s2, a1, -1761
                  sra          s9, a6, s7
                  fcvt.s.wu    fa2, s11, rup
                  ori          a7, s9, -1954
                  feq.s        gp, ft10, fs3
                  sub          s0, t0, s3
                  div          s0, sp, ra
                  fadd.s       fs11, fs9, fs6, rmm
                  andi         t1, s0, -663
                  slti         s0, sp, 248
                  sltiu        s5, a5, 1151
                  fcvt.w.s     tp, fs10, rdn
                  or           s7, t2, zero
                  mulhsu       a2, s11, a0
                  fsub.s       ft8, ft8, ft1
                  fsgnjn.s     fa0, ft6, fs5
                  remu         s8, s1, t4
                  fcvt.s.w     ft11, a0
                  auipc        t6, 45499
                  ori          s2, t0, 1742
                  fsgnjx.s     fs0, ft8, ft7
                  sltiu        a5, s8, -996
                  mulh         t3, s3, gp
                  remu         s10, ra, t6
                  slt          a6, ra, a3
                  sltiu        gp, a5, 1229
                  div          t4, s11, s7
                  ori          s4, a4, 1458
                  fsgnjn.s     ft2, fa6, fs1
                  lui          s4, 662562
                  srl          s0, t0, a3
                  lui          s6, 60940
                  sub          t3, a1, s3
                  and          s4, a2, s3
                  fsgnjn.s     ft7, fs11, fs5
                  add          s7, s3, s10
                  srai         s8, s7, 27
                  slli         s0, s7, 25
                  or           s5, t2, s5
                  fsgnj.s      ft11, fa3, ft8
                  and          a7, s4, t6
                  srli         t4, t0, 29
                  divu         gp, a6, t6
                  fcvt.s.w     ft7, s1, rtz
                  addi         s6, a2, -1078
                  addi         a6, s2, 1629
                  feq.s        s5, ft5, ft5
                  flt.s        a7, fs1, ft3
                  fmv.x.w      zero, ft2
                  fadd.s       fa3, fs0, ft11
                  srai         s0, t2, 18
                  flt.s        a4, ft7, fs5
                  slli         t1, t2, 13
                  fsgnj.s      ft5, fa4, fs5
                  xori         a7, a3, 1130
                  and          gp, a0, s2
                  rem          a5, sp, a2
                  mul          t2, s9, t1
                  xor          s10, gp, a7
                  sll          a7, a5, s10
                  fcvt.wu.s    s7, fa4
                  fsgnj.s      ft10, fs3, fs0
                  mulh         t6, t5, s6
                  ori          a4, s5, -358
                  andi         gp, gp, 1214
                  fmax.s       ft3, ft5, fs0
                  fsgnj.s      fs4, fs8, fa2
                  feq.s        t3, ft0, ft5
                  lui          t1, 251650
                  remu         t3, a6, t1
                  srai         t1, sp, 16
                  xor          sp, s9, s6
                  fadd.s       ft2, fa7, fs2
                  fsgnj.s      ft11, fs8, ft1
                  addi         s0, s6, 298
                  fsub.s       ft1, ft10, fa6, rtz
                  slt          t6, s1, s7
                  auipc        t2, 752636
                  sll          s5, zero, s5
                  sltu         ra, t1, s3
                  lui          a0, 960553
                  sltiu        ra, s3, -289
                  fmv.x.w      a0, fs3
                  fadd.s       fa5, fa5, fa2
                  slt          gp, t4, tp
                  fsgnjx.s     fa7, fs7, ft7
                  fmax.s       fs10, fs5, fa4
                  rem          s9, s6, ra
                  rem          t1, s5, t5
                  sll          a3, a4, t0
                  fmv.x.w      s0, fs9
                  fmax.s       fs9, fa6, ft4
                  xor          s1, gp, t0
                  rem          a6, zero, a2
                  mul          a6, s5, a4
                  nop
                  fcvt.wu.s    t3, fa7, rne
                  slt          tp, t1, s10
                  add          t0, gp, a2
                  fcvt.wu.s    gp, ft10
                  mul          s6, gp, t3
                  flt.s        a5, fs9, ft4
                  lui          a7, 336710
                  add          t0, s9, a1
                  feq.s        tp, ft1, fs7
                  div          a4, t5, a7
                  srl          a4, t6, s2
                  srl          t3, s6, t3
                  srai         a4, a7, 20
                  sub          s1, a5, a6
                  fmv.x.w      s4, ft7
                  sltiu        s7, s0, 973
                  slli         s0, s3, 25
                  srl          t3, s6, ra
                  remu         a1, s10, s6
                  and          tp, s2, t6
                  fcvt.wu.s    s0, ft9, rup
                  or           ra, t3, s1
                  fsub.s       ft7, fa5, fs3, rdn
                  srl          a0, a1, s3
                  fle.s        t4, fs5, fa4
                  fmv.w.x      fs6, a3
                  xori         gp, s1, 1245
                  fcvt.s.wu    fa4, t6
                  xor          t2, a6, gp
                  div          s8, t4, s8
                  fcvt.wu.s    t1, fa5, rtz
                  fmin.s       fs0, ft7, ft7
                  remu         t1, s4, t0
                  fsub.s       ft5, fa2, ft11
                  fsgnjn.s     fa4, fa3, ft0
                  mulh         t4, a3, s3
                  sub          s10, t5, s6
                  mulhu        s8, s2, ra
                  rem          a4, t4, s9
                  fsgnj.s      ft1, ft7, fa3
                  auipc        t6, 11573
                  lui          s2, 206613
                  or           s10, t4, a0
                  or           s10, a4, ra
                  mul          s5, t1, a5
                  fmv.w.x      fa3, t0
                  srai         a2, s8, 28
                  or           a1, s5, ra
                  fadd.s       fa1, ft11, ft1, rne
                  sltu         sp, a1, t1
                  feq.s        t6, fa6, fs3
                  mul          tp, s11, s4
                  and          a0, a4, s5
                  sltiu        t3, s2, -1772
                  add          t3, s0, ra
                  and          s2, s0, s9
                  auipc        s5, 85169
                  fmin.s       ft11, fs5, fs4
                  sll          s1, t5, a3
                  xori         a2, zero, 1978
                  mulhsu       s4, a6, s4
                  mulhsu       t1, a2, s9
                  fmv.w.x      ft4, a4
                  srai         t3, s6, 10
                  lui          s1, 1016368
                  fsgnj.s      fs8, ft5, fa2
                  fcvt.s.w     fs4, t0
                  ori          t1, s8, 1380
                  feq.s        s2, ft10, ft7
                  fmv.w.x      fs4, s7
                  fmv.x.w      a3, ft3
                  sltiu        t3, s0, 1791
                  divu         s9, s3, a0
                  div          t0, t2, s4
                  fcvt.s.w     ft6, t2, rdn
                  sra          a5, a3, a7
                  fadd.s       fa5, fs5, fa1
                  sra          a1, s11, s9
                  fsgnjn.s     fs0, ft0, fs4
                  andi         t2, t2, -1838
                  fsub.s       fa0, fs0, ft4
                  fsub.s       ft4, fa3, ft0, rmm
                  slti         s6, t1, -552
                  ori          a5, a1, 732
                  slt          a6, t3, a7
                  divu         a1, s2, a6
                  lui          a0, 909804
                  mulh         a4, a2, t4
                  fcvt.s.w     ft10, s1
                  fcvt.w.s     zero, ft6, rtz
                  fadd.s       fa4, fs6, ft8, rmm
                  ori          t4, t3, -1465
                  srli         s10, s5, 25
                  lui          t1, 409089
                  fcvt.s.w     fa0, a0
                  slli         a4, tp, 3
                  or           a2, sp, t3
                  srli         s1, s0, 28
                  xori         s8, ra, -192
                  div          s6, t3, t2
                  slti         a1, s0, 1193
                  mulhu        a3, s9, s10
                  fmv.x.w      s8, fs5
                  or           tp, t0, ra
                  slli         s0, s11, 17
                  fmin.s       ft5, fs4, fa6
                  feq.s        a4, fs8, ft7
                  fclass.s     t4, ft0
                  sll          t6, s1, ra
                  fmv.x.w      s0, ft9
                  mulhsu       s9, sp, t5
                  fmin.s       ft2, fs8, fa4
                  fmin.s       fa7, fs10, fs1
                  fcvt.wu.s    s2, fs1, rup
                  divu         tp, t2, a5
                  sra          zero, a6, t0
                  sub          t6, s9, t5
                  xori         a2, a7, 1150
                  fcvt.s.w     ft2, t5, rtz
                  mulh         t4, zero, s1
                  fadd.s       ft2, fs8, fa2, rdn
                  fadd.s       fa0, fa6, fs5, rtz
                  fcvt.w.s     a5, ft1, rmm
                  rem          s4, s5, s2
                  mulh         s6, t4, s2
                  ori          tp, s3, -1673
                  fcvt.s.w     ft1, zero, rne
                  fcvt.wu.s    s6, fs2
                  slli         s1, a3, 2
                  fsub.s       fs6, fa4, fs6
                  auipc        s6, 833158
                  fadd.s       ft11, fa2, ft7, rdn
                  nop
                  srai         a6, s10, 13
                  nop
                  slti         a3, a5, 1228
                  div          s2, s8, zero
                  flt.s        t4, fs2, fa2
                  flt.s        t2, fs4, fs5
                  mulhu        t4, s0, a6
                  fadd.s       ft10, fs3, fa1, rup
                  feq.s        gp, fa2, fa1
                  divu         tp, a0, s2
                  mul          t4, t1, a7
                  flt.s        a5, fa4, fa7
                  fmv.x.w      a3, fa5
                  addi         s0, a3, -1179
                  slt          s1, t2, s5
                  fcvt.s.w     fs4, a6, rdn
                  srai         s0, s11, 7
                  fmv.x.w      a6, fs6
                  fsgnjx.s     ft3, fs8, fs6
                  lui          s9, 366569
                  addi         a4, a1, 103
                  slli         s0, s7, 15
                  or           tp, a4, a2
                  feq.s        s4, ft3, ft8
                  fmax.s       fa2, fa0, fs11
                  sra          t1, s6, t1
                  slli         s1, t1, 27
                  fmax.s       ft7, fs5, fs3
                  fmax.s       ft9, fa0, fs9
                  sll          s1, a2, s11
                  fle.s        s1, ft10, ft11
                  slli         t3, s11, 14
                  slti         s4, t5, -1627
                  fsgnjn.s     fa5, ft4, fa4
                  fle.s        s0, fs10, fs11
                  addi         s10, t5, 548
                  slt          s6, sp, gp
                  slli         s0, s1, 9
                  fcvt.s.w     ft2, s1
                  sra          a5, a2, a5
                  slt          a1, s4, ra
                  xori         tp, ra, 699
                  ori          a4, a7, 1485
                  xor          s2, t5, t2
                  fmv.x.w      a3, ft6
                  slti         gp, a3, 198
                  mulh         a0, zero, s11
                  andi         a6, s6, -1868
                  srli         s6, t4, 7
                  fsgnjx.s     fa6, ft1, fa5
                  slli         a3, s9, 22
                  slti         t4, zero, 2029
                  fle.s        a2, fs2, fs3
                  auipc        t6, 920821
                  slti         s5, a3, -1426
                  mul          sp, s10, a6
                  sll          sp, ra, t3
                  ori          tp, t2, -1862
                  srai         a2, a6, 16
                  srl          s5, s0, t5
                  fcvt.w.s     a6, fs1
                  and          tp, t2, s7
                  fadd.s       fa3, fa1, fs1, rmm
                  feq.s        s1, fs8, ft6
                  andi         a6, s10, 1449
                  mul          t2, tp, t5
                  fcvt.s.w     fs3, a0, rne
                  nop
                  fclass.s     t1, fs11
                  fsgnjx.s     ft3, ft10, fs11
                  mulhsu       sp, sp, a4
                  slli         s1, s2, 5
                  ori          t6, ra, -1629
                  fcvt.w.s     a2, ft1, rup
                  sra          a4, a3, s4
                  fmv.x.w      a1, fa4
                  nop
                  fmin.s       ft2, ft11, ft9
                  div          t2, a4, a4
                  fcvt.s.w     fa4, s9
                  fcvt.s.w     fs0, a2
                  srli         ra, a5, 6
                  srli         sp, s1, 5
                  addi         tp, t0, -729
                  xori         s2, t5, -1817
                  sltu         s6, s7, s7
                  fclass.s     t2, fs6
                  sltu         a3, s1, t6
                  fcvt.w.s     a7, fa6, rne
                  mulhsu       s0, t0, s9
                  fmv.x.w      t4, fa3
                  sub          a1, s6, gp
                  rem          a5, t5, a3
                  mulhsu       a3, a3, a1
                  fmax.s       ft5, fa3, fa4
                  sub          tp, a0, s6
                  fsgnjx.s     fa0, ft6, fs2
                  andi         t3, s11, -855
                  xori         t4, s8, -1268
                  srl          gp, a2, t2
                  xori         a7, a1, 1202
                  feq.s        a7, ft4, ft1
                  fcvt.s.w     fa7, a1, rup
                  div          s2, a2, a0
                  fsgnjn.s     fs0, fa5, fs10
                  fclass.s     t3, ft0
                  remu         a5, s3, a2
                  mulhsu       s2, t1, s5
                  sub          a6, a4, s7
                  flt.s        s0, fa0, fa1
                  addi         a6, s1, 590
                  lui          a2, 115828
                  fsgnj.s      ft10, fa7, fs9
                  fmax.s       fs6, fa0, ft7
                  fmin.s       fa6, fa2, fs1
                  srli         s0, t5, 8
                  and          ra, sp, s4
                  fadd.s       fs8, ft2, fs11
                  sra          t0, a1, sp
                  fclass.s     a5, ft2
                  fcvt.s.wu    fa6, s3
                  sub          ra, ra, a3
                  slti         tp, s2, -280
                  fclass.s     sp, ft10
                  addi         a4, s2, -1189
                  fcvt.wu.s    s4, fa3, rtz
                  ori          a4, a2, 1272
                  lui          a1, 497373
                  fsub.s       fa7, ft11, ft2, rdn
                  fadd.s       ft8, ft3, fa7, rtz
                  sra          sp, zero, zero
                  mulhsu       ra, s3, t1
                  sltiu        zero, gp, 525
                  and          s4, t4, gp
                  feq.s        a6, fs5, fs1
                  mulh         a6, s8, s9
                  remu         t0, t1, s8
                  xor          ra, t5, s10
                  mul          a6, s11, t2
                  sra          a1, sp, a1
                  add          a1, s0, s5
                  xor          s2, s2, s7
                  and          s1, s8, zero
                  remu         t4, ra, s2
                  fmv.x.w      s8, ft11
                  mulh         s1, tp, a7
                  rem          s1, s2, t1
                  rem          s5, s7, t1
                  mulh         s7, gp, ra
                  fcvt.s.wu    ft5, s1
                  fmv.w.x      fs0, a7
                  rem          a2, s9, t5
                  auipc        s2, 1008340
                  slt          s4, a5, s1
                  mulhu        s7, t6, tp
                  mulhsu       t4, t0, ra
                  mul          a5, t4, ra
                  sltu         s9, s11, t5
                  fcvt.s.wu    fs3, s2, rmm
                  ori          a0, s0, 17
                  srli         s10, s10, 10
                  slti         s10, t6, 1184
                  slt          zero, t0, t2
                  nop
                  auipc        s0, 940669
                  mulh         s10, tp, t3
                  fcvt.wu.s    t1, fa3
                  add          s4, t0, t2
                  fsgnj.s      ft7, ft9, ft3
                  fle.s        t4, ft11, ft5
                  sra          t3, a2, t0
                  or           a1, a4, s1
                  lui          s1, 377477
                  feq.s        ra, ft3, fs10
                  addi         a1, a5, 1180
                  addi         t2, a1, -1587
                  xor          t1, a4, sp
                  fmv.x.w      a0, fs2
                  div          a2, a5, a7
                  fcvt.w.s     s7, ft6
                  mul          a2, zero, s3
                  sra          a6, s11, s5
                  fsgnjx.s     ft10, ft10, ft0
                  xor          s6, s4, a0
                  fmv.x.w      tp, fa3
                  andi         t1, s6, -409
                  lui          tp, 67748
                  ori          a2, t5, 948
                  mulhu        s8, t5, t6
                  sub          a4, s8, s2
                  xor          zero, t3, zero
                  fsgnjn.s     ft10, fa3, fs6
                  sra          a7, s1, s9
                  feq.s        a5, ft9, fa4
                  mul          tp, t6, t2
                  slt          a3, t3, tp
                  addi         a0, s10, 214
                  fcvt.s.w     fs10, a2
                  mulhsu       s8, s8, t0
                  mulh         s5, t4, s2
                  addi         a4, s5, -1524
                  remu         s0, s0, a6
                  fadd.s       fa5, fs10, ft11, rne
                  slti         s7, sp, -217
                  andi         t6, zero, -705
                  fsub.s       fs3, fa3, fs4, rtz
                  sltu         sp, sp, s2
                  fcvt.s.w     fs4, a0
                  sll          s2, t6, s8
                  or           a7, s4, a4
                  srli         s9, s10, 21
                  fmin.s       fs10, ft9, ft10
                  mulhu        s0, a2, a1
                  mul          t0, t3, zero
                  mulhu        t2, a7, a4
                  fmin.s       fa6, fs7, fs1
                  mul          s1, zero, a3
                  fmv.x.w      s7, fs6
                  remu         s2, a0, a5
                  fcvt.w.s     t6, fs2, rtz
                  ori          t4, t6, -1738
                  addi         sp, a7, 1063
                  addi         s2, t4, 1541
                  fadd.s       fa1, fa1, fs4
                  fle.s        gp, fa2, fa7
                  ori          s7, tp, -303
                  fcvt.wu.s    sp, ft8, rup
                  fcvt.s.wu    ft0, s3, rup
                  fcvt.wu.s    s2, fs4, rdn
                  fsgnj.s      fa0, fa6, ft2
                  fcvt.s.w     fs2, s3
                  divu         a3, t6, zero
                  fsgnj.s      ft11, fa1, ft7
                  xori         s0, s9, -1807
                  fsgnjx.s     fs9, ft7, fa4
                  slt          tp, tp, sp
                  nop
                  xor          a3, a3, a7
                  fsub.s       fa7, fa3, fs2
                  fmv.x.w      t6, fa5
                  sltu         t0, a3, s10
                  srli         zero, a1, 25
                  andi         zero, a0, -621
                  or           t4, t4, sp
                  fsgnjn.s     ft3, fa7, ft6
                  fcvt.w.s     tp, ft2
                  xori         zero, t1, 1301
                  srai         ra, s9, 13
                  and          a2, t3, a4
                  fcvt.w.s     a3, ft4, rtz
                  fclass.s     tp, fs3
                  auipc        a2, 204330
                  slti         s0, a1, 419
                  srl          t6, a2, s7
                  slli         s1, ra, 2
                  fcvt.s.w     fa6, s0, rmm
                  sll          s6, t5, s11
                  fcvt.w.s     s2, fs6, rtz
                  add          a7, a5, t4
                  fclass.s     a6, fs11
                  sub          s8, t2, zero
                  div          s0, t2, s11
                  fmax.s       fs5, ft8, fs3
                  fsgnj.s      ft10, ft5, ft8
                  slti         a5, a0, -1124
                  and          t6, ra, s4
                  auipc        a1, 849198
                  remu         t4, s0, a0
                  sll          s8, tp, a2
                  srl          gp, a6, t6
                  slti         s9, a3, -297
                  fcvt.s.wu    fa3, s3
                  rem          a2, s7, t3
                  fmax.s       ft10, ft5, fs2
                  fsgnjx.s     fa5, fs5, fs6
                  sub          a5, s3, t6
                  sll          t4, t3, t0
                  sra          t2, t5, sp
                  div          a4, s10, ra
                  auipc        gp, 54704
                  fcvt.s.w     fs11, a2
                  sltiu        t3, sp, 1385
                  fmv.w.x      ft8, s6
                  slt          s0, t6, t4
                  fcvt.s.w     fs3, s2, rup
                  slli         t3, s0, 8
                  fmv.x.w      s0, ft5
                  srli         gp, t2, 31
                  fmax.s       ft5, fs1, fa6
                  nop
                  sltu         t6, a5, a4
                  ori          a3, a4, -1532
                  srl          a5, t6, gp
                  sll          t6, s0, s5
                  slli         a7, a6, 23
                  fmin.s       fs4, ft1, fs10
                  fmax.s       ft8, ft0, fs8
                  fmax.s       fs6, fs6, ft6
                  div          a1, a4, a0
                  fsgnjx.s     fs4, fa1, ft0
                  fcvt.wu.s    s2, ft8, rtz
                  fcvt.w.s     t6, fs11
                  sub          a1, t4, ra
                  fmax.s       ft7, fs10, ft7
                  nop
                  srli         t2, a7, 28
                  fmv.x.w      s4, fa6
                  fsgnj.s      fs8, fs2, ft10
                  slli         s0, t5, 9
                  sltu         s1, s9, a2
                  fsgnj.s      ft9, ft2, ft9
                  mulhsu       a3, s2, t6
                  sltiu        tp, a4, -676
                  sll          s4, t2, s3
                  divu         t6, t4, s0
                  sll          s7, s1, t0
                  and          tp, zero, s10
                  fmv.w.x      fs5, s0
                  sra          t3, s11, s3
                  sub          zero, a6, s7
                  fsub.s       ft1, ft6, fa3, rup
                  xori         zero, a0, 1987
                  fmax.s       ft5, ft5, fa6
                  slli         t4, a4, 4
                  div          t2, t6, s6
                  andi         s1, ra, -1858
                  fmv.x.w      ra, fs3
                  fcvt.wu.s    ra, fs8
                  nop
                  fcvt.wu.s    t4, ft0
                  xori         s5, s6, 44
                  auipc        zero, 883970
                  andi         s2, t5, -385
                  mul          s6, sp, s5
                  fcvt.wu.s    s8, fa5
                  fle.s        s8, fs8, fs0
                  sltu         t2, t5, tp
                  sltu         a2, ra, a2
                  divu         s6, s0, t3
                  or           s2, s8, s4
                  fmin.s       ft11, fs4, fs11
                  mul          ra, a2, s3
                  andi         t3, s6, -1507
                  srl          s8, t2, t3
                  mulhsu       t6, t1, sp
                  fcvt.s.w     ft0, a7, rup
                  mulhsu       s10, a0, a6
                  srl          gp, s4, a6
                  or           s0, a0, s9
                  ori          a2, a3, -826
                  andi         a1, t3, 1126
                  sub          t6, ra, s6
                  sltiu        zero, s4, -1171
                  srli         sp, sp, 20
                  mul          a1, s4, s1
                  fsgnjx.s     fs5, fs7, fa1
                  slti         s4, a0, 143
                  sltu         s10, a7, zero
                  sll          a7, t5, s1
                  slli         tp, s2, 25
                  fmv.x.w      s2, fs11
                  or           a4, a6, zero
                  fmin.s       ft8, fa5, fa7
                  fsgnjx.s     ft4, fa7, fa6
                  srli         a3, s6, 18
                  feq.s        s10, fa3, ft11
                  addi         t4, s4, -970
                  fmv.x.w      s2, fs1
                  fclass.s     zero, fs5
                  sll          s1, tp, gp
                  feq.s        t0, fs11, fs3
                  fsgnjn.s     ft9, fs9, fa6
                  sltiu        ra, gp, -1896
                  andi         a5, tp, 717
                  sll          s0, zero, tp
                  srai         s9, s4, 17
                  fmv.x.w      a5, ft7
                  fsgnj.s      ft11, fs6, ft5
                  fle.s        s0, fa7, ft7
                  fadd.s       ft8, fs7, ft8
                  lui          t3, 650972
                  fsgnjx.s     fa4, fa6, fs0
                  fcvt.w.s     t0, fa2
                  fcvt.s.w     ft1, s4
                  slti         zero, s7, 421
                  fmax.s       fa3, ft2, fs8
                  fadd.s       fa5, fs8, fs11, rtz
                  sra          s10, t3, t3
                  xor          a0, s2, s11
                  fsgnj.s      ft6, fs6, ft7
                  addi         a7, a1, -1212
                  fmv.x.w      gp, ft9
                  auipc        ra, 514496
                  sra          s4, a1, t6
                  or           zero, sp, s3
                  mulhsu       a2, a4, a1
                  fmv.x.w      s10, ft7
                  sra          a4, tp, t2
                  slti         gp, s5, -1739
                  div          gp, t0, s0
                  sll          s0, a5, t2
                  and          s7, t3, s3
                  fmin.s       fs9, fa1, fa1
                  add          t1, a0, a0
                  sltiu        s7, t1, 315
                  divu         a6, t3, s5
                  fmin.s       fs8, fs2, fs0
                  fsgnj.s      fs4, fs1, ft3
                  fclass.s     ra, ft6
                  feq.s        t3, fa7, fs5
                  andi         t6, s2, 1597
                  fcvt.w.s     t6, fs4
                  fmv.x.w      a3, ft3
                  fle.s        t2, ft6, fs7
                  flt.s        s2, fs7, fs6
                  fmv.x.w      a2, ft0
                  fmv.x.w      t2, fa1
                  auipc        a7, 819540
                  fsgnjx.s     fa2, ft8, fa1
                  fmv.x.w      gp, ft6
                  rem          t3, a4, t3
                  fmv.w.x      ft3, t6
                  fcvt.w.s     t6, fa4, rup
                  slt          sp, t2, a7
                  fcvt.s.wu    ft5, zero
                  fle.s        a7, fa1, ft6
                  sub          a6, t2, s4
                  slti         s9, s10, 1776
                  fcvt.s.wu    fs1, t4
                  srl          s1, t1, s7
                  auipc        a2, 728643
                  div          a6, s6, t5
                  ori          a2, t5, 970
                  slti         a7, a0, -375
                  srli         ra, s2, 4
                  rem          t0, s3, a2
                  mul          a3, a7, t3
                  remu         s9, s10, t2
                  remu         s2, s10, s9
                  fsgnj.s      ft7, fs9, fs5
                  srli         tp, s9, 27
                  mul          t6, t6, a3
                  mulhsu       a0, ra, a2
                  mulh         s2, t0, a4
                  fcvt.w.s     s6, fa0
                  feq.s        t4, fa2, fs2
                  fmin.s       fs3, fa1, fa5
                  fmin.s       fs0, ft10, fa2
                  fadd.s       ft10, ft9, ft6
                  rem          zero, t2, s10
                  sll          s2, sp, s6
                  and          sp, a3, s6
                  mulhsu       t3, a5, t5
                  fsub.s       fs2, ft9, ft11, rmm
                  xori         t1, a0, -498
                  sll          s2, t6, s4
                  fcvt.s.wu    ft0, a6, rup
                  srai         t1, t0, 12
                  slli         s7, s7, 22
                  or           s4, a7, t5
                  mulhsu       tp, tp, a2
                  flt.s        gp, fs0, ft1
                  fmin.s       ft0, fs11, fs2
                  srli         a5, a1, 26
                  slli         a4, a4, 18
                  mulhsu       s8, a6, tp
                  mulhu        t4, s8, s10
                  sub          a4, s1, a0
                  add          s1, s0, s4
                  fadd.s       ft7, fs0, ft7, rup
                  mulhu        a7, s11, a0
                  fadd.s       ft4, fa7, ft9
                  remu         s7, s2, s8
                  or           s6, t6, t0
                  fsgnjn.s     fs0, fa7, fs6
                  fcvt.w.s     t4, ft9
                  or           s4, a4, s3
                  fcvt.w.s     a1, ft5, rdn
                  srai         a1, zero, 1
                  add          gp, s9, s9
                  div          t6, t6, s3
                  addi         tp, t2, 25
                  fmax.s       fa3, fa1, ft3
                  sll          ra, s11, t1
                  nop
                  divu         t3, a3, a1
                  sra          a1, t5, gp
                  fclass.s     a4, ft9
                  remu         tp, s0, s9
                  addi         s6, s3, -455
                  mul          s10, a5, tp
                  add          s1, t1, s8
                  slt          a4, t3, s2
                  feq.s        s7, fs3, fa0
                  srli         a6, a2, 21
                  xor          t2, s7, t0
                  fsgnjx.s     fs9, fs9, fa5
                  sltiu        s6, a0, 334
                  fsgnj.s      fs9, ft6, fa3
                  fclass.s     t0, ft1
                  mulhu        s0, s2, t4
                  flt.s        a5, fa6, ft3
                  addi         a1, a4, 1847
                  remu         s9, t4, s11
                  lui          t1, 719122
                  auipc        s6, 99774
                  fmin.s       ft3, fs2, fs5
                  mulhu        t4, s4, s7
                  slli         ra, a1, 17
                  slli         t4, t3, 10
                  mul          s1, s6, s7
                  xor          t2, gp, s0
                  addi         a1, s3, 1496
                  fcvt.s.wu    fs1, s7
                  xori         s9, a2, 1642
                  add          a6, sp, s2
                  mulhsu       a3, s8, s5
                  fadd.s       fs4, ft1, fs2
                  xori         tp, s10, -1963
                  fsub.s       fa0, fs10, fa4
                  srli         ra, t2, 3
                  fle.s        s6, fs4, fa2
                  fmv.w.x      fa1, s5
                  mulhsu       t4, s10, s6
                  sub          s4, t3, s3
                  nop
                  fsgnj.s      fa1, ft10, ft9
                  sra          gp, s5, t4
                  fle.s        a1, ft0, ft6
                  sltiu        t3, s10, -1908
                  sltu         t3, sp, s7
                  slti         gp, t0, 371
                  fmax.s       ft4, fs3, ft10
                  addi         s4, s10, 2032
                  fsgnj.s      fa7, ft5, fa2
                  andi         s1, t6, 1826
                  sll          a7, a5, ra
                  and          s8, s4, sp
                  mulhu        gp, gp, t1
                  fmv.w.x      fs3, a6
                  mul          t3, t1, tp
                  srl          s4, t5, a6
                  slti         zero, a7, 1508
                  fmv.x.w      a3, fa2
                  sll          gp, s2, zero
                  fsgnjn.s     fs8, fs4, fa7
                  remu         t6, a0, t3
                  fclass.s     gp, ft7
                  fcvt.w.s     t6, ft11, rtz
                  fmv.w.x      fs8, s2
                  fcvt.wu.s    s1, fs2, rup
                  divu         s0, s9, a4
                  div          t4, a6, s1
                  mulhu        sp, s0, a7
                  fsub.s       ft10, ft3, fs6
                  mul          zero, a3, t1
                  rem          s8, t5, s3
                  feq.s        s7, ft6, fa7
                  and          a6, s9, s4
                  divu         s5, a5, a3
                  sll          s4, t0, t6
                  slli         s1, t5, 12
                  fmax.s       fs5, ft4, fs5
                  mulhu        s4, t1, s8
                  fmin.s       fs0, ft5, fs9
                  fsub.s       ft0, ft6, fs2
                  slli         s8, sp, 18
                  mulhsu       t3, a0, tp
                  fsgnjx.s     fa1, fa7, ft5
                  slli         s10, ra, 7
                  fsgnjn.s     fs2, fa4, fs10
                  fcvt.s.wu    ft1, t6, rtz
                  slt          s1, s5, s1
                  mul          s0, t3, s7
                  lui          s0, 72802
                  nop
                  add          a1, a6, s0
                  rem          t0, t1, t4
                  fle.s        tp, fs1, fs6
                  sltu         tp, s9, t5
                  ori          s0, sp, 232
                  sra          a0, t3, t4
                  mulhu        t2, a6, zero
                  ori          s1, tp, 337
                  fsub.s       fa6, fs0, ft2
                  fcvt.s.wu    ft1, t2
                  auipc        t2, 763930
                  sra          a1, a2, ra
                  mul          a5, zero, t4
                  fcvt.w.s     a3, fs0
                  mulhu        gp, a2, t3
                  slti         t2, a5, 67
                  slti         t4, t3, -1840
                  fmv.x.w      s4, ft2
                  flt.s        s0, ft0, fs9
                  fsgnj.s      fs11, fs3, fs9
                  sltu         ra, tp, t3
                  fsub.s       ft4, fa3, fs2
                  fclass.s     a4, fa7
                  slti         s4, t4, -590
                  mul          a7, a0, a2
                  fcvt.s.w     fs8, s10, rtz
                  sra          t4, s11, t3
                  addi         s0, t2, 1949
                  and          s1, zero, ra
                  fle.s        s9, fa5, fa7
                  srl          ra, gp, sp
                  and          gp, s1, a3
                  fmin.s       fa7, fs7, fs0
                  fsub.s       ft4, fs7, fa0
                  rem          t0, s8, s11
                  sub          gp, s1, t5
                  add          t2, s1, gp
                  auipc        t4, 167499
                  mulhsu       a3, tp, a2
                  fcvt.wu.s    s0, fa5
                  fsgnjn.s     fs6, fa4, fs8
                  nop
                  fle.s        s7, fa1, fs7
                  fsgnjx.s     ft11, ft7, ft4
                  slli         gp, a4, 21
                  mulhsu       s0, s9, s8
                  fsgnjn.s     fa4, fs1, ft5
                  mulhu        ra, zero, gp
                  sltu         s8, t6, s5
                  lui          gp, 1010847
                  fcvt.s.wu    fa4, a4, rup
                  or           t2, s5, a3
                  fcvt.w.s     a6, fs8
                  divu         s1, t6, s0
                  sltu         t6, s0, s10
                  mulhsu       a4, a1, sp
                  addi         t3, ra, 1226
                  or           s7, s3, a4
                  remu         a5, t3, a2
                  fcvt.s.w     fa1, s10, rtz
                  sltu         a1, t4, a0
                  add          s1, s1, a7
                  sltu         a3, a5, t2
                  fsgnj.s      fs1, fs7, ft5
                  add          a0, a5, s11
                  add          a4, s4, t2
                  sra          zero, t2, t1
                  fcvt.s.wu    fa2, ra, rmm
                  xor          t4, a5, t1
                  andi         t6, s9, 470
                  div          a5, t6, s0
                  feq.s        s1, fa0, fa5
                  srai         s9, sp, 30
                  flt.s        a3, fs6, fa2
                  fmin.s       ft2, fs11, ft11
                  fle.s        s1, fs0, ft10
                  fmin.s       ft0, fa7, fs7
                  divu         t6, s9, ra
                  add          t3, tp, s11
                  xori         s0, gp, -1299
                  lui          zero, 778442
                  slti         sp, a1, 1975
                  fsgnjn.s     ft9, ft0, ft3
                  ori          a1, t0, -18
                  slli         a7, t5, 5
                  fsgnjx.s     fs7, fs2, ft2
                  slti         t4, s8, -1149
                  slti         s2, s9, -1198
                  mulhsu       s6, zero, a1
                  fcvt.s.wu    fs8, t1
                  sll          t3, s7, s4
                  fmin.s       fs3, ft6, fs11
                  feq.s        a1, ft4, fs7
                  fle.s        a1, fs4, ft5
                  addi         t2, t0, 1155
                  or           s0, a7, a6
                  flt.s        s10, ft1, fa0
                  fcvt.w.s     t1, ft1
                  lui          t4, 650662
                  srai         s0, s0, 13
                  fmv.w.x      ft1, a4
                  slti         s4, s4, -323
                  sltiu        gp, s5, -1754
                  divu         s7, a2, ra
                  sll          t4, s0, s2
                  mul          t6, a1, a3
                  mulh         t3, t4, s5
                  auipc        t1, 367018
                  xori         a4, s10, -909
                  fmv.x.w      a3, ft10
                  mulh         t3, a2, s10
                  andi         s0, sp, 1989
                  fcvt.w.s     s6, ft9
                  sub          a6, s0, s4
                  fmin.s       fa3, fa4, fs3
                  add          s10, sp, gp
                  fclass.s     a5, fs1
                  xori         sp, sp, 277
                  fsub.s       ft8, fs2, fa0, rne
                  fmv.w.x      ft0, t4
                  slti         s2, ra, 1366
                  ori          sp, a1, 610
                  mulhsu       sp, s0, s1
                  sll          s7, s3, t0
                  fmax.s       ft3, fa7, ft10
                  nop
                  sltiu        gp, a0, -510
                  lui          s0, 727888
                  xor          s10, tp, t6
                  remu         t6, sp, zero
                  fsgnjx.s     fa2, ft1, fa5
                  sltu         s1, t6, s10
                  rem          t3, s11, t5
                  slti         gp, a4, -74
                  fcvt.s.w     fs7, a5, rdn
                  mulh         t1, a2, sp
                  slti         a4, s10, -665
                  rem          s4, t5, t4
                  sra          a7, s11, a3
                  add          s2, a5, s11
                  addi         t2, a4, -1239
                  slti         a3, s10, -804
                  ori          t3, a3, -780
                  sub          a4, gp, s1
                  fmv.w.x      fs11, t6
                  remu         s1, s2, a3
                  fcvt.wu.s    s4, fa7
                  divu         s8, gp, s11
                  fclass.s     s0, fa0
                  add          a3, t2, s6
                  lui          a0, 727651
                  xor          ra, a6, s3
                  ori          t1, a7, -1435
                  fmv.w.x      ft1, t6
                  fcvt.s.wu    fs11, a7
                  flt.s        t1, fs1, ft1
                  remu         a3, t6, t5
                  fmin.s       ft9, ft11, fs8
                  srai         s1, a6, 24
                  mulhu        s6, s7, s3
                  remu         a7, a5, s9
                  fcvt.s.w     fa5, s7, rne
                  mulh         ra, t3, s11
                  fcvt.w.s     s1, fs4, rtz
                  add          s6, a0, s4
                  rem          s5, s0, t2
                  sltiu        zero, t6, 1437
                  fsgnjx.s     fs10, ft2, fa5
                  sltu         gp, t4, s3
                  fsgnjn.s     fa5, ft8, ft11
                  fle.s        ra, ft0, ft3
                  fmv.x.w      zero, ft8
                  divu         zero, t0, ra
                  sll          t0, a4, s10
                  remu         s6, s3, s5
                  fle.s        s2, ft9, fs1
                  andi         t2, a2, 1628
                  and          s7, s11, t6
                  sltiu        a3, s8, 1289
                  ori          s10, zero, 483
                  srli         s10, t4, 15
                  mul          t6, t4, s3
                  fadd.s       fs7, fa4, ft10, rup
                  fmv.x.w      s4, ft9
                  add          a1, a6, s10
                  mulhsu       a4, s2, t4
                  andi         s6, s5, 809
                  fcvt.wu.s    t0, ft3
                  fadd.s       ft11, fs1, ft0
                  flt.s        t4, fs1, ft6
                  andi         a0, a1, -1929
                  lui          t3, 31280
                  fsgnjn.s     fs4, fs0, ft3
                  feq.s        t6, fa0, fa7
                  flt.s        t3, fs4, fs6
                  srl          a4, s2, a1
                  sub          s5, s0, t5
                  fsgnjx.s     fa2, fs8, ft8
                  mulh         sp, s10, s3
                  lui          s5, 110798
                  slli         a4, a6, 15
                  rem          t0, sp, a7
                  fsgnjn.s     ft7, fs2, fs4
                  sll          tp, t6, s0
                  sltiu        a4, t3, 1482
                  auipc        t3, 700370
                  fcvt.wu.s    a0, fs1, rup
                  sub          sp, a4, a3
                  srl          t0, a2, s5
                  add          sp, a5, s8
                  fcvt.s.w     ft7, s4
                  div          t6, t6, s4
                  slti         tp, s3, 1819
                  fcvt.wu.s    a0, ft0
                  mulhu        s6, s10, t2
                  div          t2, s10, t4
                  sltu         a0, a6, t4
                  auipc        gp, 725537
                  fmv.w.x      fa2, s2
                  lui          s6, 968785
                  xor          s10, zero, s10
                  fmv.x.w      s1, fa5
                  fmv.w.x      ft4, gp
                  fcvt.wu.s    a6, ft11
                  mul          s9, a6, t5
                  slli         a6, s0, 14
                  sub          s9, sp, sp
                  fmv.w.x      ft2, a7
                  sltu         tp, s2, t0
                  sltu         sp, s7, t2
                  fmv.w.x      fa4, tp
                  fadd.s       fs8, fs0, fa3
                  remu         s8, s2, a5
                  fcvt.wu.s    a7, fs9, rne
                  srai         s1, a6, 30
                  or           a0, a6, s6
                  fsgnj.s      fs3, fs10, fs7
                  remu         s2, ra, a2
                  lui          t4, 275997
                  slli         zero, a2, 26
                  fsgnj.s      ft5, fs1, ft9
                  fcvt.s.w     ft11, sp, rne
                  rem          s0, sp, a3
                  mulhsu       a2, s8, s0
                  mulhu        s9, zero, s1
                  fmax.s       ft9, fs2, fa2
                  mulhsu       t3, s5, s1
                  ori          sp, s6, -1597
                  fcvt.w.s     zero, ft6, rup
                  sub          t6, a0, a6
                  fsgnjn.s     fa5, fa7, ft6
                  fcvt.s.wu    ft1, t0
                  fcvt.wu.s    a0, fs3, rup
                  remu         sp, s2, s5
                  xori         a0, a1, 1615
                  sll          s5, a6, s0
                  fadd.s       fs5, fa3, fs8, rtz
                  fmv.w.x      ft3, s8
                  fle.s        s10, ft3, fa2
                  fcvt.wu.s    s8, fa2, rup
                  fsgnjn.s     fs6, fa3, fs0
                  slli         zero, s5, 12
                  mulhsu       a4, s9, s9
                  fle.s        a6, ft8, fs4
                  auipc        ra, 412290
                  lui          a7, 542394
                  auipc        s2, 174804
                  sltiu        a4, t6, -1100
                  fsgnjn.s     ft4, fs3, ft4
                  xori         s0, t5, 2025
                  xori         a3, sp, 242
                  fmax.s       ft0, fs10, fa4
                  fmv.w.x      ft0, s6
                  fadd.s       fa1, ft0, fa4, rmm
                  auipc        s1, 342479
                  rem          zero, a2, s1
                  addi         s1, a1, -1326
                  fcvt.s.w     fa5, s6, rne
                  fsgnj.s      fs1, ft11, fs7
                  sltu         a0, t2, s8
                  slti         s6, a0, 1547
                  fmin.s       fs8, ft9, fa3
                  lui          t3, 396814
                  xori         a4, a1, -1955
                  feq.s        tp, ft11, fa1
                  fadd.s       fs7, ft6, fa4
                  fsgnjx.s     ft2, fa1, fa1
                  xori         s6, sp, -1480
                  mulhsu       zero, a2, a7
                  sub          t3, t3, a5
                  div          t4, t5, a6
                  mulh         zero, t4, s9
                  sub          s4, s11, ra
                  fsgnjn.s     ft5, fs3, fa5
                  divu         t4, s11, a5
                  fmv.w.x      fs4, sp
                  auipc        a4, 971551
                  srli         s5, a4, 7
                  sltu         t2, a3, t1
                  xori         zero, s10, -2013
                  mul          t6, s6, s1
                  slli         s10, s6, 4
                  fsgnjx.s     fa0, ft4, fs3
                  fmax.s       fa6, ft9, fa1
                  srli         a3, s5, 7
                  fcvt.s.wu    fs1, s10, rtz
                  mul          t0, s2, s5
                  remu         gp, s1, s10
                  fsgnjx.s     ft11, ft9, ft3
                  feq.s        t2, fs2, fa7
                  or           a1, a4, s10
                  fclass.s     s6, ft8
                  rem          s7, a6, s2
                  and          a5, zero, a3
                  fclass.s     s0, fs0
                  fmin.s       fs10, fs0, fa6
                  feq.s        t4, fs7, ft9
                  fadd.s       ft8, fa7, ft5, rup
                  div          a1, a2, s5
                  fcvt.w.s     a2, ft9
                  fcvt.wu.s    a7, fs6, rup
                  fsub.s       ft9, ft10, fa1
                  fsgnjn.s     fa6, fs0, fa0
                  slli         t6, s3, 4
                  slti         a4, a4, 934
                  flt.s        a0, fa2, ft4
                  sltu         s5, a3, ra
                  xori         gp, sp, 1758
                  add          s8, s2, a0
                  nop
                  mulhu        zero, a1, tp
                  add          t3, t0, zero
                  fcvt.s.w     fa6, s6, rne
                  mulhsu       tp, tp, sp
                  sltiu        a7, a3, -2011
                  remu         s2, ra, s3
                  rem          ra, s0, s5
                  ori          t2, s1, 1346
                  fcvt.s.wu    fa3, ra, rup
                  fsub.s       fs3, ft8, ft8, rdn
                  fcvt.wu.s    s5, ft10, rmm
                  sra          a7, a3, t6
                  fsgnjx.s     fa7, fa5, fs9
                  fcvt.s.w     fa7, a5, rdn
                  feq.s        s5, fs6, fa4
                  xor          a1, sp, s4
                  slti         s6, t5, 290
                  div          a1, t6, s9
                  add          a7, gp, ra
                  nop
                  fmv.w.x      fa3, s6
                  slt          a7, s8, t0
                  srl          a2, s9, s4
                  fsub.s       fs2, fs4, ft5, rup
                  srl          s5, a3, a3
                  lui          t3, 215179
                  rem          a1, s0, a5
                  rem          t6, s7, zero
                  fsgnjn.s     ft10, ft10, fs11
                  fsgnj.s      ft0, ft0, fa4
                  lui          s6, 762179
                  sub          s8, s0, sp
                  fmv.w.x      ft2, s11
                  divu         tp, gp, t6
                  fcvt.s.w     fa7, a5
                  srli         s4, s5, 6
                  srli         s8, t1, 17
                  andi         s1, a3, -1721
                  mulhu        sp, s6, s1
                  feq.s        a4, fa2, ft7
                  xori         s9, a4, -551
                  fmv.w.x      fs1, a7
                  feq.s        gp, fa4, fs7
                  rem          t6, zero, s3
                  fadd.s       fs5, fa5, fs7
                  fcvt.w.s     s8, fa1, rtz
                  addi         t0, t5, 186
                  srai         a6, s6, 11
                  fsub.s       fa6, fa1, fa2
                  fcvt.s.w     ft11, t3, rne
                  fmv.w.x      fs0, a5
                  fcvt.wu.s    zero, fa7, rmm
                  mulhsu       zero, sp, t4
                  fmin.s       ft5, fs11, fa1
                  fsgnjx.s     fs4, fa7, ft11
                  sltu         s7, t1, gp
                  fcvt.w.s     t1, fs3, rmm
                  divu         gp, a0, s3
                  sll          t2, s1, s0
                  fadd.s       fa3, fs2, fs5
                  xori         s0, a2, -1348
                  srai         tp, zero, 22
                  srl          gp, s11, gp
                  fle.s        s4, fs7, fs7
                  or           s6, a4, s8
                  fcvt.s.w     ft5, sp, rdn
                  auipc        a0, 577066
                  sra          s4, a7, a4
                  fsgnjx.s     fa6, ft5, fa3
                  mulhsu       t4, s2, t2
                  fle.s        a1, fa2, ft2
                  fcvt.w.s     s5, fa5
                  fsub.s       ft1, fs6, ft6
                  or           s2, a5, s7
                  fcvt.s.wu    fs2, a2, rtz
                  remu         s8, s10, a5
                  fsgnjx.s     fa0, fa7, fs9
                  fmv.w.x      fa7, t5
                  fmv.x.w      s8, fs1
                  slt          s10, s0, a2
                  mulhsu       s10, tp, s7
                  andi         a2, ra, -1672
                  sltu         a0, a1, t1
                  fsub.s       fs9, fa5, fs1
                  div          s8, s2, t5
                  xori         t2, t2, 1433
                  mul          s6, ra, s6
                  fmv.x.w      s4, ft10
                  mulh         a2, s11, t0
                  fcvt.s.w     fs1, zero, rup
                  mul          s2, t3, s11
                  sltiu        a4, a2, -1872
                  fsgnjx.s     ft7, fa7, ft6
                  xor          s4, sp, t2
                  slti         a6, tp, -1675
                  slli         a3, a6, 28
                  divu         s1, a4, s10
                  sub          t1, a6, a2
                  mul          s1, s11, gp
                  sub          zero, s7, a0
                  sra          t2, tp, s5
                  fmin.s       ft5, fs8, fs8
                  mulh         a6, a5, t6
                  add          s4, zero, t4
                  ori          a0, tp, -940
                  div          t1, s7, s0
                  add          a7, a6, t1
                  and          a2, zero, a4
                  fmin.s       ft11, ft9, ft1
                  auipc        s9, 883153
                  nop
                  fsgnjx.s     fa2, fs10, ft6
                  divu         s9, tp, zero
                  fsgnj.s      fs0, ft2, fs4
                  fcvt.s.w     fs1, s0, rne
                  xor          s7, t3, t5
                  slti         t2, t1, -1981
                  and          s8, s0, s1
                  andi         a1, s6, 596
                  xori         s10, ra, -963
                  srai         tp, a6, 7
                  rem          s7, s11, t4
                  auipc        a6, 623421
                  mulh         sp, s0, s6
                  sltiu        a1, a7, 1013
                  fsgnjn.s     fs3, fa3, ft10
                  andi         a4, s2, -1195
                  auipc        a2, 713849
                  divu         a6, a5, s11
                  xor          a1, t0, sp
                  addi         s6, s1, 914
                  remu         t3, t5, a7
                  sltu         gp, a2, s6
                  and          s0, s0, a6
                  fcvt.s.wu    fs8, s4
                  fle.s        t4, ft6, ft5
                  feq.s        s2, fs9, ft4
                  xor          s10, s5, a1
                  mulhsu       a3, s6, t5
                  add          tp, a7, a6
                  slt          s8, s4, t5
                  addi         s8, s7, -1318
                  divu         s7, a3, sp
                  mulhu        a7, a7, t4
                  fcvt.w.s     t2, fs6, rmm
                  or           a0, s6, a4
                  srai         a6, a1, 22
                  sra          s9, t4, zero
                  div          sp, s4, s6
                  nop
                  div          a4, s2, s10
                  slli         t0, t2, 13
                  fsgnjx.s     fs4, fa4, ft9
                  sll          s1, tp, t0
                  mulhsu       a7, a5, gp
                  auipc        t2, 855744
                  addi         a0, s5, 539
                  feq.s        zero, fs9, ft10
                  sub          a0, t2, s5
                  fmin.s       ft6, ft9, fs5
                  andi         s7, s3, -1373
                  sll          s1, a6, s4
                  sra          s5, a4, a4
                  fcvt.s.w     ft8, s2, rdn
                  mulhu        t2, a4, a4
                  fcvt.s.w     fs8, zero
                  fmin.s       fa1, fa0, ft2
                  sltu         t6, s8, s4
                  mul          a5, s3, t2
                  fcvt.wu.s    s6, fa6, rup
                  fle.s        t2, fs10, fs5
                  slti         a4, t6, 471
                  fsgnj.s      ft1, fa3, fs7
                  flt.s        s9, fs11, ft7
                  fsgnjx.s     fa6, ft1, fs4
                  mulhsu       t0, a5, t1
                  xori         s1, zero, 668
                  fmv.w.x      fs0, s1
                  div          s10, s7, s10
                  auipc        tp, 319282
                  xor          ra, s1, t3
                  rem          a5, t3, gp
                  or           s4, s5, a0
                  remu         t0, s9, s0
                  sll          s4, t2, a4
                  andi         tp, s6, -72
                  auipc        s10, 851411
                  div          s7, s11, s4
                  mulhu        s10, s0, a1
                  auipc        t0, 371806
                  sll          ra, s10, s2
                  sltiu        s1, a6, -1631
                  sll          t6, s3, a4
                  fcvt.s.wu    fa7, s2
                  sub          a7, t2, s10
                  fle.s        a0, fs6, fs1
                  srl          t4, ra, t5
                  fmax.s       ft11, fs10, fa1
                  mulhu        ra, a2, s11
                  xor          a5, gp, s5
                  xori         gp, a1, 1813
                  add          a2, t2, s6
                  div          gp, tp, s5
                  and          s0, a0, s5
                  mul          s5, tp, a0
                  add          a5, s2, t0
                  rem          a4, s2, s2
                  fmin.s       fs11, ft3, fs7
                  ori          a5, s4, 1341
                  fcvt.w.s     a1, ft8, rmm
                  fsgnjx.s     fa2, fs9, ft6
                  fcvt.wu.s    s8, ft8, rtz
                  srai         t3, t5, 1
                  fmv.x.w      s6, fa0
                  mulhu        s6, a7, gp
                  and          zero, s1, s2
                  addi         a0, a7, 1771
                  mulhu        zero, s11, s1
                  ori          s7, s11, 384
                  srl          gp, s9, s8
                  slli         a6, zero, 0
                  fmin.s       fs9, ft0, ft2
                  remu         t4, a4, a1
                  or           s9, s11, t5
                  addi         t2, a2, 739
                  mul          t1, tp, t3
                  flt.s        s0, fa3, ft1
                  auipc        a7, 143464
                  andi         ra, t1, 1304
                  mulhu        a3, s1, t1
                  nop
                  fmv.w.x      ft2, t4
                  fcvt.s.w     fs2, s0, rup
                  or           gp, gp, a1
                  fadd.s       fs2, ft0, fs6
                  fmv.w.x      fa0, a5
                  div          s10, t5, a4
                  fcvt.wu.s    s4, fs1
                  fcvt.s.wu    fa2, s10, rne
                  fmax.s       fa4, fs8, ft8
                  fmin.s       fs3, fs10, fa0
                  fsgnj.s      fs1, ft4, fs2
                  fcvt.wu.s    a5, fs9
                  sra          t0, s3, s2
                  fcvt.wu.s    gp, fa6, rmm
                  fmv.x.w      a1, fs11
                  sltu         t3, t2, t6
                  slti         zero, s4, 421
                  add          s4, a2, s9
                  sll          a7, t6, s11
                  addi         t3, a5, -1036
                  nop
                  andi         s2, t1, 1691
                  and          s6, s10, t1
                  auipc        a5, 815462
                  fmv.w.x      fa3, s5
                  auipc        a0, 839843
                  nop
                  flt.s        s10, fs1, fs5
                  div          t4, a7, t6
                  slt          s1, t1, a1
                  fle.s        sp, fs9, fs10
                  flt.s        t6, fa3, fa2
                  and          s8, t0, s8
                  xori         ra, a0, -406
                  flt.s        s5, ft7, fa5
                  fmv.w.x      fa5, a6
                  xori         t2, a2, 1006
                  fcvt.wu.s    a0, ft10, rmm
                  addi         s5, a6, -901
                  fsgnjn.s     fa1, fa6, fa0
                  sltiu        a7, s3, -818
                  mulhu        s8, a0, s2
                  div          s1, s3, a0
                  sra          s9, ra, s1
                  mulh         s9, s8, s5
                  or           s9, t2, s0
                  feq.s        s10, ft1, ft2
                  div          sp, ra, s4
                  fcvt.s.w     fs1, a7, rup
                  fclass.s     tp, ft11
                  xor          s10, t0, s3
                  slti         a1, gp, 1589
                  slt          t6, t1, t3
                  slt          tp, zero, a3
                  remu         t6, s3, t1
                  sltiu        t1, a0, -1783
                  or           gp, t5, s0
                  fcvt.s.wu    fs1, s7, rne
                  divu         s9, a1, s3
                  fcvt.s.wu    fs4, t0, rdn
                  fsub.s       fs9, fa6, fa1, rtz
                  div          t6, s10, s8
                  mulhu        s4, t4, a1
                  sltiu        s2, ra, 1745
                  fsgnjx.s     ft7, fs9, ft11
                  srl          a4, ra, s4
                  auipc        s9, 990339
                  fmv.w.x      ft10, s8
                  sub          s6, s0, t3
                  or           s8, t4, s1
                  div          s2, t6, t6
                  xori         t3, s8, -1307
                  nop
                  nop
                  fsgnj.s      fa0, ft0, ft3
                  sltu         s2, t5, s7
                  fsub.s       ft0, fs7, ft7, rup
                  mulhsu       ra, s0, t0
                  fclass.s     a4, fa7
                  slli         s10, t5, 26
                  mulhsu       s0, a7, t2
                  sltiu        a4, sp, -1340
                  fadd.s       fs5, fa1, fa7, rup
                  fcvt.w.s     a3, fs10, rmm
                  srai         s9, s8, 20
                  srli         a5, t2, 3
                  mul          a5, t2, a4
                  slt          s0, a0, zero
                  slti         s7, ra, 2037
                  addi         s10, s4, -66
                  fmax.s       fa2, fs11, fa0
                  srai         sp, a2, 21
                  andi         s5, t1, -832
                  remu         a1, tp, s0
                  fclass.s     s0, fa6
                  nop
                  sltu         gp, s11, s5
                  lui          t0, 366815
                  mulhu        s0, sp, t3
                  fcvt.wu.s    t3, fa3
                  fle.s        t4, fa2, fs2
                  slli         s7, s6, 10
                  xori         s0, s6, -1352
                  flt.s        a3, fa4, ft8
                  mulhu        s10, a0, t0
                  fcvt.s.wu    fs6, t6
                  andi         sp, s0, 994
                  mul          a2, s6, s7
                  flt.s        sp, ft1, fa3
                  mulh         gp, s11, s1
                  slli         s7, t6, 24
                  mulh         sp, gp, s5
                  nop
                  fcvt.s.wu    fs5, s3
                  sll          t4, a0, t1
                  fmv.x.w      s5, ft2
                  fsub.s       fa6, fa0, fa4, rtz
                  sltu         s1, gp, s3
                  and          s1, sp, a0
                  feq.s        t3, fs11, ft9
                  srai         s6, s8, 10
                  mulhu        sp, s10, a4
                  feq.s        a3, ft1, fa6
                  xor          s9, s5, s1
                  fcvt.s.wu    fs5, s0
                  remu         t0, a1, a6
                  mul          t4, t3, t4
                  or           t1, t0, t1
                  fmv.w.x      fs9, t1
                  sltu         s10, a7, a4
                  fcvt.s.wu    ft6, s10
                  remu         ra, t6, t0
                  divu         s0, s10, a3
                  fcvt.s.w     ft8, s4
                  mulh         t6, zero, t3
                  slli         s2, t5, 21
                  and          t0, t5, s1
                  fmin.s       fa5, ft5, fs9
                  fmax.s       ft11, ft10, fa4
                  mulh         t0, s11, a5
                  sra          a3, t2, s4
                  fadd.s       fs11, fs5, fs2
                  fclass.s     ra, fs3
                  slt          t1, a2, a5
                  xori         s1, sp, 1916
                  rem          a5, s6, s2
                  flt.s        a7, fs5, fs6
                  nop
                  fsgnj.s      fa0, ft2, ft2
                  fcvt.s.w     fa2, sp
                  mulhu        a7, s7, zero
                  mulhu        s2, s6, t6
                  srli         ra, sp, 8
                  lui          s6, 931979
                  srl          gp, s4, s8
                  fmax.s       ft1, fs4, fa3
                  mulhu        t2, a0, t2
                  fcvt.w.s     s0, ft3, rtz
                  srl          t6, s4, sp
                  xor          a5, t0, s10
                  mulhu        a1, ra, s7
                  ori          t1, a7, 672
                  fsgnjn.s     fa1, ft3, fs8
                  xori         t3, t3, 1822
                  sra          a3, s5, s9
                  flt.s        s9, ft8, fa1
                  fcvt.s.w     fa1, ra
                  div          t0, a3, a4
                  sub          s7, a0, sp
                  fmax.s       fs1, fa7, fa0
                  mulhu        s9, s5, s0
                  sub          sp, s3, s1
                  slli         zero, s8, 6
                  slti         s10, s7, 627
                  fsgnjx.s     ft1, ft3, ft2
                  sub          s5, a3, a0
                  fsgnjx.s     fs8, fs7, fs3
                  sub          a0, t2, s3
                  xor          t0, s0, t2
                  slt          s6, s8, a2
                  lui          s6, 572228
                  slti         s5, t4, -194
                  add          s4, s6, s3
                  fmax.s       fs11, ft0, fs1
                  fmax.s       ft11, fs1, fa3
                  div          a2, a6, s4
                  slli         ra, t4, 0
                  sra          a5, s8, a5
                  add          tp, a4, a6
                  div          s5, a0, t3
                  flt.s        a0, fa5, fs11
                  srai         s8, s10, 14
                  sltu         ra, a6, t5
                  rem          tp, s11, s3
                  mulh         gp, ra, a4
                  ori          t6, s7, 828
                  fsgnjx.s     ft0, ft9, fs10
                  sra          t6, s4, s5
                  rem          t1, a2, s4
                  fsgnjx.s     fs11, fs7, fs11
                  xor          s10, a1, s3
                  div          t0, s2, s5
                  sra          s0, s11, t2
                  add          s4, a4, t3
                  auipc        t6, 595773
                  fcvt.s.wu    ft9, s10
                  divu         s10, zero, a7
                  mulhsu       a2, s10, t6
                  srai         a3, a1, 30
                  sub          a2, s2, a5
                  fsgnj.s      ft8, ft7, ft10
                  sll          s8, s11, gp
                  sub          s10, a4, a2
                  nop
                  sra          s4, a3, t5
                  remu         s6, s9, s0
                  ori          a6, s7, 121
                  add          s6, s3, s2
                  srai         s8, a1, 31
                  xori         sp, ra, -619
                  fcvt.s.w     fs6, t6, rmm
                  fmin.s       ft1, ft10, fa4
                  slli         tp, a6, 27
                  slt          ra, t5, ra
                  or           s9, s5, ra
                  slt          t0, tp, a4
                  fmin.s       ft10, ft8, fs1
                  rem          a6, a4, t4
                  fsgnj.s      ft2, fs4, fs3
                  sra          t4, a6, a4
                  div          a2, tp, zero
                  lui          s4, 354405
                  fsub.s       fa5, fa0, ft2
                  mulh         t0, t4, gp
                  auipc        a5, 464015
                  flt.s        s6, fs7, fs11
                  fmv.x.w      gp, fa5
                  srli         t2, a2, 30
                  andi         s1, s7, 1803
                  div          a6, s9, a7
                  mulh         s2, s1, s4
                  fmv.x.w      s7, ft0
                  fclass.s     s2, fs6
                  mul          tp, a3, a7
                  slli         s2, t5, 28
                  mulhsu       gp, s11, ra
                  remu         ra, t4, s5
                  or           a2, t5, a4
                  or           gp, t5, tp
                  lui          t3, 344358
                  ori          tp, t1, -1452
                  fmv.w.x      fs10, s11
                  divu         t6, t1, s6
                  fadd.s       ft9, fa6, fs2
                  lui          a7, 931576
                  fcvt.s.w     fa0, a5, rdn
                  sltu         a3, sp, a7
                  fmv.w.x      ft0, s4
                  and          a6, s3, s0
                  fsgnjn.s     fs5, fa2, fs11
                  add          s9, s2, t5
                  add          ra, a0, t1
                  fsgnj.s      fs4, fa4, fs1
                  mul          sp, a5, t5
                  fsgnj.s      fs3, ft4, fs11
                  mulhu        s8, s3, t4
                  auipc        a3, 1014552
                  xor          t1, tp, a3
                  mulhsu       a7, a7, t6
                  slt          t2, sp, t3
                  srai         t3, sp, 17
                  sltu         a7, a6, t3
                  remu         s8, s6, s9
                  sltiu        a4, t5, -907
                  xor          t1, t2, t5
                  sltiu        ra, a7, -1811
                  fcvt.s.wu    ft3, t2, rmm
                  slli         tp, a4, 12
                  addi         s1, gp, -1551
                  lui          s10, 72367
                  and          s10, t3, t2
                  sub          a4, sp, a2
                  sra          sp, gp, t5
                  srl          t0, s4, a4
                  fle.s        s1, fs5, ft4
                  fsgnjn.s     fs8, fs5, fs4
                  add          a7, a1, t1
                  and          s1, a4, sp
                  fadd.s       ft9, ft10, fs3, rtz
                  fsgnj.s      ft0, ft10, fs2
                  fsub.s       fs4, fs2, ft0, rmm
                  fmv.w.x      fs5, s10
                  fcvt.wu.s    s0, fs8
                  or           a3, a7, a5
                  mulh         s1, ra, s4
                  srl          a2, s7, a2
                  remu         a1, s10, s7
                  lui          a0, 737853
                  fsgnj.s      ft5, fs7, fs10
                  feq.s        s7, ft11, ft1
                  lui          s7, 191256
                  feq.s        gp, ft0, ft6
                  nop
                  fcvt.s.wu    fs4, s11, rtz
                  rem          s5, s3, ra
                  mulh         ra, s7, gp
                  andi         t2, t0, 1136
                  fcvt.s.wu    ft5, s11
                  fclass.s     t1, ft6
                  fsgnjx.s     fa4, fs2, fs4
                  fsgnj.s      fa5, fa3, ft6
                  fsgnjn.s     fa0, fs6, fa3
                  xori         tp, sp, 1459
                  fmv.x.w      gp, ft6
                  fmax.s       ft5, fa7, ft9
                  sub          sp, t5, a0
                  fmin.s       ft1, ft7, ft1
                  andi         t6, t0, 1085
                  fadd.s       fs6, fs8, ft5, rup
                  nop
                  ori          a0, t2, 114
                  slt          s5, a1, ra
                  slti         a5, t4, 668
                  remu         gp, s7, a0
                  srl          s6, s11, a5
                  feq.s        t2, ft2, fa1
                  ori          tp, a3, 2039
                  fmax.s       fs11, fa2, ft4
                  mulhu        zero, a2, t4
                  fadd.s       fs5, fs1, fs0, rtz
                  flt.s        s6, ft11, fa4
                  fsgnj.s      fs10, fs3, fs2
                  fclass.s     s1, fs10
                  lui          t6, 828895
                  fmv.x.w      s8, ft8
                  ori          t4, s1, 550
                  sltu         s0, s5, s4
                  ori          t2, s9, -1582
                  divu         s7, t2, t5
                  fsub.s       fs3, fs9, fs3
                  sll          a4, s10, t2
                  mulh         s4, gp, zero
                  fcvt.s.w     ft0, a1
                  fadd.s       fa0, ft9, fs3
                  fmax.s       fs5, ft11, fs3
                  sub          a0, s1, a5
                  mul          a5, s11, a2
                  fmax.s       ft5, fs0, fa3
                  srl          s5, zero, s7
                  fsgnjx.s     ft4, ft11, ft6
                  divu         s4, s3, a5
                  mulh         a5, s10, ra
                  rem          s1, a0, t3
                  sll          s0, a6, t0
                  fcvt.wu.s    gp, fs4, rdn
                  or           s2, t2, t2
                  flt.s        t3, ft9, fs0
                  xor          t2, a1, zero
                  fmv.x.w      s7, ft6
                  fclass.s     s7, ft5
                  fmin.s       ft10, ft0, ft7
                  divu         gp, s1, s4
                  fsub.s       fa6, ft1, ft3, rtz
                  and          a7, s10, s7
                  slt          s0, tp, a3
                  addi         a0, t0, -1084
                  fcvt.wu.s    a4, ft0
                  fsgnjn.s     fs0, fa0, ft1
                  sra          s6, t4, t0
                  fmv.x.w      s4, fa6
                  fcvt.s.w     ft5, a1, rmm
                  add          a0, s6, s10
                  fcvt.s.wu    fs3, s8, rtz
                  flt.s        a1, ft10, ft8
                  rem          sp, s10, tp
                  fsgnj.s      fs6, ft10, fa5
                  mulhu        a7, s10, a5
                  flt.s        t0, ft3, fs3
                  div          t0, a6, zero
                  and          zero, t0, s6
                  slti         ra, s8, -1024
                  feq.s        s9, ft6, fs1
                  fmv.x.w      tp, fs8
                  fcvt.wu.s    a0, fs3, rtz
                  fsgnjx.s     fs0, fa1, ft5
                  or           t6, ra, sp
                  srl          a1, s3, gp
                  divu         a3, t3, a1
                  sltu         a3, s10, t0
                  mulhu        t1, s9, t1
                  fmv.w.x      fa2, s1
                  fmv.w.x      ft1, s6
                  srai         t4, s6, 2
                  srai         a6, t0, 26
                  fcvt.wu.s    gp, ft9, rtz
                  xori         t0, s11, -1124
                  fsgnjn.s     ft0, fs4, fa3
                  add          zero, t0, s3
                  fadd.s       fs4, ft2, fs6, rtz
                  auipc        a1, 300424
                  sra          t2, a7, s8
                  mulhsu       s9, t0, sp
                  fmv.x.w      tp, ft0
                  flt.s        s8, ft8, ft4
                  xor          ra, tp, t4
                  sra          a3, a7, zero
                  divu         s1, gp, s1
                  mul          a0, s11, t1
                  sltu         a5, s3, t2
                  slt          zero, t0, gp
                  auipc        zero, 351483
                  sub          a5, gp, t6
                  rem          sp, a3, zero
                  fcvt.s.w     fs2, s8
                  xori         a5, t6, 317
                  sra          t0, t3, tp
                  remu         a1, s11, s8
                  remu         a6, t3, t5
                  slti         a0, t2, 1218
                  fcvt.w.s     t0, ft2
                  fsgnjx.s     ft7, ft1, ft1
                  fmv.x.w      a5, fs5
                  srai         a6, a0, 1
                  slli         s10, a6, 19
                  flt.s        s0, fa0, fa2
                  fcvt.s.w     ft8, sp
                  nop
                  fsgnjn.s     fa1, fs10, fa5
                  ori          a4, gp, 1004
                  nop
                  fcvt.w.s     t6, fs5, rmm
                  sltiu        s9, a4, 946
                  slti         t3, t6, 1447
                  flt.s        a1, fa6, fa7
                  slt          a0, a2, a6
                  auipc        a7, 580867
                  fmv.x.w      t6, ft8
                  fsgnjn.s     ft10, fa2, fs6
                  sltiu        s10, a7, 1411
                  srai         s10, s7, 31
                  nop
                  andi         a2, s3, 1278
                  rem          a7, s6, s0
                  fcvt.wu.s    s7, fs10
                  fsgnjn.s     fs2, fs10, ft7
                  mulhsu       s5, t4, gp
                  fclass.s     t6, fa7
                  fle.s        tp, fa7, ft5
                  add          t4, a6, tp
                  andi         t2, t1, -2037
                  fclass.s     a6, ft11
                  fcvt.wu.s    s5, fs10
                  fmax.s       fs3, fs6, ft10
                  fclass.s     s7, ft2
                  addi         t3, t0, -1700
                  andi         a3, t3, 3
                  andi         t1, tp, 1797
                  feq.s        s1, ft3, fs7
                  slti         a4, gp, -1356
                  fsgnj.s      fa3, ft6, ft7
                  sub          zero, s9, gp
                  fsgnjn.s     ft2, fs2, ft9
                  fmv.w.x      fs5, a4
                  div          t6, t1, t6
                  fcvt.s.wu    ft4, s4
                  sra          t1, s10, a4
                  fsgnjn.s     ft3, ft2, fa1
                  srl          t2, t4, s11
                  fcvt.wu.s    tp, ft0
                  xor          s9, t5, s11
                  fsub.s       ft9, fs11, fa7
                  srai         a3, a1, 19
                  auipc        s6, 941425
                  auipc        t6, 549963
                  ori          t2, a6, 982
                  mulhsu       a5, gp, s7
                  fsgnjn.s     fs11, ft7, ft3
                  sll          a5, a3, s0
                  sll          gp, s7, t3
                  sub          ra, s8, s5
                  sltu         a7, a5, s1
                  div          s4, a2, s8
                  lui          s4, 69408
                  nop
                  mulh         tp, zero, t1
                  rem          a2, a1, s0
                  remu         t2, s0, s9
                  mulhsu       s8, zero, zero
                  mulhsu       s5, gp, t5
                  fsgnj.s      ft2, fs10, fs2
                  fmv.x.w      t6, ft11
                  fsub.s       fa4, ft3, ft11, rne
                  ori          s9, s2, 297
                  fadd.s       fs9, fs2, fs0
                  slt          s8, a5, s10
                  sub          s10, s2, t1
                  fmv.w.x      ft8, s9
                  div          s2, t5, sp
                  or           s4, a2, gp
                  lui          a0, 817704
                  divu         ra, a1, ra
                  mulh         s5, a3, a0
                  fsub.s       ft8, fs4, ft2, rtz
                  slt          t4, s10, tp
                  fmv.x.w      a7, fa5
                  divu         s8, s1, s6
                  slt          zero, t1, a6
                  sltiu        a4, t0, 430
                  nop
                  sltiu        t1, s3, -749
                  mulh         a2, s9, s6
                  sra          s0, ra, a0
                  rem          s8, ra, s6
                  fcvt.s.wu    ft11, a7
                  addi         s10, s11, -1689
                  fcvt.s.wu    fa0, t1, rup
                  fcvt.s.wu    ft6, s3
                  auipc        t3, 16199
                  xor          s6, a7, t0
                  fcvt.s.w     ft6, t0
                  fle.s        t4, ft9, fs3
                  fmv.x.w      a7, fs2
                  mul          a2, t3, s1
                  mulhu        s7, sp, t2
                  sll          a5, s7, a4
                  srli         s9, s3, 0
                  feq.s        ra, fa5, ft6
                  addi         s9, ra, 31
                  auipc        t3, 231208
                  mulh         s5, zero, t0
                  add          t3, s11, s9
                  fsgnj.s      ft6, fs6, ft3
                  fclass.s     t2, fa4
                  sra          sp, s0, s3
                  divu         a0, a0, a0
                  fcvt.wu.s    s4, fs4, rne
                  mulhu        a1, s0, t0
                  fsgnjn.s     ft6, ft7, fa2
                  fcvt.s.wu    ft10, t2
                  fmv.w.x      fa4, s6
                  srai         a5, a0, 7
                  mulhsu       s8, s5, t0
                  xor          zero, ra, s1
                  mul          t1, a1, zero
                  fsgnj.s      ft1, ft6, fs6
                  fcvt.s.wu    fa7, a1, rtz
                  slli         ra, s9, 23
                  sll          gp, t5, zero
                  fcvt.s.w     fa3, t1
                  fsub.s       ft5, fs2, fs3
                  fmin.s       ft1, fa6, fa4
                  xor          s1, gp, a3
                  fle.s        a3, ft11, fs1
                  sltiu        gp, s8, -186
                  divu         s2, t2, s7
                  fmv.w.x      fa0, a6
                  sra          s1, t5, s9
                  feq.s        a2, ft4, fa0
                  fadd.s       fa5, fs3, fs10, rup
                  sltu         t1, a5, s2
                  fclass.s     s9, fa0
                  fle.s        a5, ft4, fs5
                  feq.s        s7, ft0, fa6
                  sra          tp, t5, s5
                  fcvt.s.w     ft1, a5
                  sll          s1, s3, s5
                  mulhu        ra, s5, a3
                  add          s4, a1, t2
                  lui          t2, 502764
                  slt          a1, s11, a2
                  sra          a6, s9, a7
                  flt.s        a2, ft3, fa5
                  fmv.w.x      ft11, t4
                  flt.s        t1, fs11, ft1
                  sra          a0, t4, gp
                  sll          s8, ra, s9
                  slt          zero, t0, s3
                  mul          t2, tp, t4
                  or           tp, a2, s4
                  fsgnjx.s     fs9, fs5, ft11
                  fadd.s       fa6, fa4, fa2, rmm
                  sll          a4, t3, s1
                  flt.s        t1, fs2, fa5
                  fmin.s       fs1, ft7, fa7
                  sltiu        s10, t0, -173
                  mulhu        a7, t6, a3
                  fmin.s       fs4, fs7, fs8
                  mulhu        a4, a7, zero
                  add          s6, s8, ra
                  rem          a2, a6, s3
                  srli         s6, a1, 30
                  fmv.w.x      ft4, s4
                  sra          gp, a6, t0
                  addi         zero, t4, -1739
                  ori          a7, a6, 1161
                  fsgnjn.s     fs8, ft2, fa5
                  sra          a0, a0, ra
                  sll          s4, a5, t3
                  fmax.s       fa1, fa4, fa1
                  mulhu        sp, a1, t5
                  fsgnj.s      ft10, ft11, fa0
                  mulhsu       ra, s9, sp
                  srli         t6, a7, 2
                  sll          s0, s1, a1
                  srli         s0, s2, 15
                  andi         sp, t2, 32
                  feq.s        a0, fs6, fa6
                  sltu         zero, t1, a0
                  fsgnj.s      fs5, fs8, ft9
                  flt.s        s8, ft11, ft2
                  sra          s0, tp, gp
                  add          a4, ra, s9
                  fsgnjx.s     fs11, fs4, ft11
                  fcvt.s.w     fs11, a0, rne
                  auipc        a4, 362169
                  fcvt.w.s     t4, ft7, rne
                  addi         t6, a3, -1779
                  slt          s7, t2, t6
                  andi         s5, t1, -1332
                  auipc        s6, 475102
                  fcvt.s.w     ft6, sp
                  fsgnj.s      fs5, fs10, fs0
                  srai         s5, t3, 25
                  mulhu        s0, ra, a7
                  fmax.s       ft4, fs5, fa4
                  andi         s5, ra, -146
                  sll          s6, a6, t3
                  sltiu        a0, a4, 1375
                  rem          a5, gp, a6
                  fcvt.s.w     ft3, t0, rtz
                  sub          zero, gp, s11
                  sub          s0, sp, a7
                  srl          sp, t0, s2
                  mul          sp, a3, t3
                  ori          a6, s2, -725
                  fsgnj.s      ft7, ft7, ft4
                  andi         gp, s7, 832
                  fcvt.s.wu    fs8, t6, rne
                  fcvt.s.w     fs1, a0, rne
                  mulh         t1, s8, t6
                  lui          s0, 325550
                  sub          t4, t0, s1
                  slti         t1, s8, 330
                  sltiu        t4, gp, -1284
                  rem          sp, t3, sp
                  rem          a6, t3, a0
                  addi         t4, s0, 70
                  fsgnjx.s     fs8, ft9, ft0
                  srl          a7, a3, s11
                  xori         a2, s5, -1027
                  fclass.s     s4, fs1
                  fcvt.s.w     ft4, t0, rtz
                  fle.s        tp, fs8, ft1
                  or           t4, t6, s5
                  fcvt.w.s     s9, ft9
                  flt.s        s0, fs1, fa1
                  fclass.s     s2, fa2
                  mulhu        zero, t3, ra
                  fmin.s       fs10, fs4, fs10
                  fclass.s     s4, fa5
                  ori          a6, a4, 395
                  fcvt.s.w     fa0, s11, rdn
                  sltu         a2, a7, t4
                  fsgnjn.s     fs11, fs2, fs6
                  xori         t0, a4, 75
                  fle.s        ra, ft9, fa0
                  andi         t6, gp, 1139
                  fmv.w.x      ft9, t4
                  slt          a7, ra, t2
                  mulhsu       s9, t0, a5
                  slli         s9, s8, 7
                  remu         a7, s7, t0
                  xor          a0, tp, a2
                  flt.s        s0, ft6, ft7
                  add          s7, s8, a7
                  fsgnjx.s     fs4, fa3, fa6
                  srl          t4, t2, a2
                  srl          s7, s1, s3
                  mul          a4, s0, t5
                  add          zero, t6, a3
                  mulhsu       s1, s1, t1
                  add          s1, s6, a0
                  auipc        a4, 884978
                  lui          s5, 1004998
                  srl          a0, t4, s7
                  fsgnj.s      ft9, fa7, fs1
                  flt.s        a4, ft2, fs8
                  remu         ra, t4, a5
                  div          a4, a6, s7
                  add          s1, t4, t2
                  fadd.s       ft6, fs3, ft9, rne
                  fsgnjn.s     fa3, fa1, ft5
                  sltu         s10, s4, a4
                  sltu         a7, a3, a4
                  mulhsu       s2, t1, a1
                  lui          a2, 688293
                  remu         t4, s11, t1
                  andi         t3, a3, -1615
                  mulh         a1, a7, s3
                  fclass.s     zero, fa5
                  srl          t6, a1, s2
                  xori         a7, a5, -23
                  fsgnjx.s     fs10, fa0, fa7
                  fmin.s       ft3, fa0, ft2
                  fadd.s       fs0, ft6, fs2, rne
                  slt          a4, s0, a0
                  flt.s        a7, fa0, fa5
                  slli         t4, t5, 6
                  fmin.s       fs11, ft0, fs1
                  xor          s2, t4, t4
                  srl          ra, a7, t4
                  fmv.w.x      ft1, t0
                  mulh         s8, a7, t2
                  rem          a6, sp, s3
                  fmin.s       fs7, ft0, fs5
                  slti         s1, t4, -694
                  add          a6, s7, a4
                  sll          a4, a3, s10
                  fclass.s     a3, fa0
                  auipc        a4, 796663
                  fcvt.wu.s    a7, ft11, rmm
                  sltiu        s9, a4, 317
                  sra          a6, s5, a2
                  sub          t1, a1, a1
                  fsgnjn.s     fa0, fs9, ft10
                  mulh         s2, s10, zero
                  sll          t3, t2, s9
                  fsub.s       ft0, fs11, fs1, rmm
                  mulhsu       s2, t6, s1
                  fmv.w.x      ft10, s2
                  sra          zero, t0, s7
                  xori         tp, a0, -952
                  sra          s2, s4, s10
                  fcvt.wu.s    t6, fs0, rup
                  sltiu        a6, t6, -594
                  fsgnjn.s     ft1, fs6, fs3
                  srai         t3, zero, 1
                  slt          t0, a6, t3
                  fclass.s     sp, fa0
                  xor          s0, a4, s7
                  auipc        a1, 881614
                  div          t4, a7, gp
                  sub          tp, s6, a4
                  srli         a7, s9, 3
                  srli         s10, a4, 10
                  fsgnjx.s     ft11, fa2, fa5
                  fcvt.s.w     ft2, a0, rne
                  xor          sp, s10, t3
                  fclass.s     a2, fa1
                  xor          a3, a5, gp
                  fmin.s       ft4, fa5, fa6
                  or           s10, s10, a4
                  or           s4, a2, a2
                  fmax.s       ft5, ft7, ft9
                  fle.s        zero, fs6, fa4
                  feq.s        a6, fs7, fa0
                  sltu         a7, s11, s2
                  fle.s        t1, ft7, ft2
                  fcvt.w.s     t3, fs10
                  sub          gp, s1, t6
                  auipc        gp, 586672
                  sll          gp, s10, s3
                  slti         a6, a6, 1186
                  slt          t0, zero, s1
                  sltiu        ra, gp, 1118
                  srli         zero, s6, 29
                  sub          t1, a1, t3
                  ori          t6, a7, -358
                  fclass.s     tp, fa7
                  fmin.s       fa1, fa2, fs9
                  xori         s9, a5, -1206
                  ori          a1, t2, -192
                  fsgnj.s      fs9, fs9, fs0
                  fsub.s       fs1, ft3, fa1, rmm
                  div          s9, s6, t1
                  fmv.w.x      fa5, a3
                  fsub.s       fs8, fa5, fa4, rmm
                  div          gp, s6, a5
                  rem          a7, a6, s1
                  feq.s        ra, fs6, ft11
                  mulhsu       t3, t4, s11
                  auipc        s10, 897662
                  fle.s        t4, fs11, fa7
                  fadd.s       fa4, fa3, fs8, rup
                  div          sp, s11, a5
                  fmv.x.w      a3, fs1
                  xori         a6, s6, 1608
                  flt.s        zero, fa6, fa0
                  add          t2, a2, s2
                  srli         s0, s1, 20
                  andi         s9, s4, -86
                  remu         s0, t0, tp
                  addi         t3, tp, 869
                  sll          t2, t4, gp
                  flt.s        tp, ft7, fs11
                  auipc        s8, 475001
                  sltu         s4, a1, tp
                  mulhu        t4, s2, a5
                  fmin.s       fa2, fs5, fs10
                  fclass.s     s6, ft5
                  sltiu        s4, ra, 165
                  fcvt.wu.s    s8, fs5, rdn
                  mulhsu       t6, t5, t1
                  fcvt.s.wu    fs0, s11, rdn
                  fmin.s       fs4, fs10, fa3
                  rem          a3, t6, t4
                  lui          tp, 1028078
                  nop
                  divu         s7, gp, s7
                  fmv.x.w      zero, ft8
                  fmv.w.x      fa5, s3
                  fcvt.s.w     fa7, s5, rtz
                  rem          s0, s10, s4
                  rem          a4, a2, t3
                  fmax.s       ft6, fs8, fa1
                  srai         gp, a7, 7
                  srli         a1, s5, 30
                  mul          t3, sp, s10
                  fsgnjx.s     fa5, fs0, fa7
                  divu         a1, t6, t1
                  srai         a5, t2, 5
                  div          t6, s3, t1
                  fsgnj.s      fs2, ft7, ft4
                  fsgnjx.s     ft3, ft2, ft1
                  mul          ra, t2, t4
                  ori          a2, a5, -239
                  rem          a5, s7, t3
                  nop
                  and          s7, a3, t3
                  divu         a0, s0, s1
                  fclass.s     a2, fa4
                  srl          t4, t1, s3
                  mulhsu       a6, sp, ra
                  rem          s1, a1, t2
                  auipc        s9, 634105
                  remu         a3, t5, s6
                  xori         s5, s1, -664
                  add          a6, a4, s10
                  fmv.w.x      ft11, s7
                  fmax.s       ft5, fa2, ft1
                  mulhsu       t6, a2, s10
                  fcvt.s.w     ft0, a4
                  sll          s4, a6, a6
                  fsgnj.s      ft9, fa2, ft0
                  sll          s4, gp, a7
                  divu         ra, t2, s7
                  slti         s1, s7, 1324
                  sra          s6, a2, s5
                  sub          gp, s11, s9
                  srai         t0, a0, 31
                  srli         t1, s2, 3
                  fsgnjx.s     ft9, ft4, fa7
                  fsub.s       fa4, ft8, fa3, rup
                  slti         t2, s5, 1404
                  addi         a0, a1, 444
                  andi         s5, s0, 991
                  sll          sp, zero, a6
                  fle.s        s4, ft2, ft3
                  fcvt.w.s     a0, fa3, rmm
                  mulhsu       s4, tp, s3
                  and          t1, zero, tp
                  fmax.s       fa5, ft1, ft0
                  rem          a0, t4, s10
                  or           a0, a6, a7
                  mul          s10, a5, t1
                  nop
                  fle.s        s4, fs7, fa1
                  fcvt.s.w     fa6, a2
                  slli         s9, sp, 9
                  mulh         tp, s1, s11
                  rem          s1, t4, t6
                  fsgnj.s      fs7, fa1, fa2
                  sra          s7, s2, s8
                  flt.s        a0, ft4, fa3
                  fcvt.wu.s    gp, fs0, rdn
                  fadd.s       fa4, ft2, fa2
                  feq.s        zero, ft3, ft8
                  slt          s2, a3, t5
                  srli         a7, s1, 22
                  slti         a6, t1, 533
                  fcvt.wu.s    s9, ft9, rup
                  slti         t1, s6, -835
                  flt.s        s10, fa2, ft5
                  sltu         s5, t6, s1
                  fle.s        s7, ft8, fa1
                  fsgnjn.s     fa6, ft3, ft5
                  fsub.s       fs2, fa1, fa1
                  sltu         a7, s10, a2
                  fcvt.s.wu    fs1, s10
                  rem          s1, t3, s1
                  fcvt.s.w     fs2, s0, rne
                  auipc        a4, 921875
                  fsgnj.s      fs9, fs1, fa3
                  lui          zero, 530244
                  feq.s        a7, ft9, fs3
                  sltiu        t0, t3, 750
                  mulh         a2, s7, s8
                  nop
                  srai         s6, s5, 28
                  auipc        t0, 274121
                  xor          t3, t0, t2
                  or           sp, s6, t2
                  nop
                  mulhsu       a4, s5, t5
                  divu         t1, sp, a3
                  andi         t4, t4, 683
                  srl          s10, t4, a7
                  fle.s        s0, fs5, ft3
                  srli         tp, s8, 23
                  lui          a0, 529465
                  fmin.s       fs11, fs10, ft4
                  rem          s8, s11, ra
                  fcvt.s.wu    fs10, t0
                  slti         a5, a5, 1120
                  srli         a3, a4, 10
                  andi         s1, t1, 1676
                  srli         s1, s0, 3
                  mul          s1, s9, a6
                  xori         s6, a4, -276
                  ori          t3, a5, -1961
                  ori          zero, s9, 22
                  slt          s5, t1, s1
                  xori         ra, a2, 1986
                  slt          sp, t1, a6
                  feq.s        ra, fs2, ft9
                  fsub.s       ft9, fs9, ft11
                  andi         zero, s4, 27
                  fsub.s       ft8, fa1, ft3, rup
                  ori          a2, s5, -1886
                  fmin.s       fa2, fs1, fa3
                  fadd.s       ft5, fa1, ft11
                  fmv.w.x      fs3, ra
                  andi         a2, s8, 1654
                  slti         a4, sp, -1988
                  fcvt.wu.s    t2, fs8, rup
                  fclass.s     a3, fa2
                  fcvt.wu.s    s8, ft3, rdn
                  slti         a7, s7, 895
                  div          t0, s3, s4
                  fsgnj.s      ft8, fa6, ft8
                  fadd.s       fs0, fs0, ft1, rmm
                  srl          t3, tp, a7
                  fadd.s       fa6, ft4, fa7
                  mulh         a1, t0, a0
                  andi         s6, s10, -799
                  remu         s8, a1, zero
                  fsgnjn.s     fs1, ft8, fs5
                  nop
                  sltu         t2, s1, a4
                  slli         t0, a4, 23
                  feq.s        t4, fs2, ft5
                  sra          a1, a3, s8
                  slt          s10, t6, t3
                  fcvt.w.s     a4, ft11, rmm
                  rem          zero, gp, t4
                  nop
                  srli         ra, a3, 27
                  flt.s        t3, ft0, ft10
                  fsgnjn.s     fs1, fs1, ft3
                  fle.s        s0, fa0, fa7
                  fadd.s       fs1, fa3, fs4
                  rem          sp, gp, s3
                  fcvt.wu.s    a4, fa4, rdn
                  addi         a7, a6, -1177
                  ori          s10, s10, 654
                  fcvt.s.wu    fs5, a3, rmm
                  fmv.x.w      s9, fs7
                  mul          zero, s4, a4
                  flt.s        tp, fs1, fa6
                  nop
                  fmv.x.w      s4, fs0
                  div          a0, t4, t2
                  fmv.w.x      ft7, t2
                  slti         s2, s8, -1035
                  add          s6, s7, t6
                  sll          s10, t1, s11
                  rem          t1, s1, tp
                  srl          s1, t1, s10
                  fmax.s       ft1, fa2, fs3
                  auipc        t1, 168121
                  sltu         a4, t4, s11
                  slli         zero, sp, 6
                  mul          a5, a0, s11
                  xori         a5, t0, -274
                  fmv.x.w      t0, fs0
                  fcvt.wu.s    s2, fa1, rtz
                  fsgnj.s      ft10, fa4, ft7
                  srl          a3, a3, s2
                  fcvt.wu.s    s5, fs6, rdn
                  remu         s6, a2, t4
                  fmv.x.w      t6, ft10
                  slti         t6, s3, -1289
                  srai         s2, t2, 28
                  fcvt.w.s     a2, fa4
                  mulhsu       s5, t1, t4
                  srli         s7, s6, 5
                  fsgnjn.s     fs10, fa0, fa6
                  srli         gp, t2, 21
                  srl          s7, t4, a5
                  ori          t3, t1, -1753
                  fmv.w.x      fa4, a0
                  fadd.s       fa3, ft2, ft5
                  add          s6, ra, a3
                  slli         a4, s10, 11
                  fmv.w.x      fs3, t0
                  fsub.s       fs11, fa1, ft0, rup
                  flt.s        s8, fs10, fa3
                  fcvt.s.w     fs2, a6
                  fsgnjx.s     fs2, fa6, ft3
                  sltiu        a6, gp, -142
                  fcvt.wu.s    tp, ft9, rup
                  lui          a7, 510248
                  andi         t1, a0, 1351
                  fcvt.s.wu    fa7, zero, rdn
                  fmv.x.w      s10, fa6
                  rem          t4, a3, s11
                  fsgnj.s      fs11, ft11, fs5
                  or           zero, s5, s4
                  fmax.s       fs2, fs5, fa5
                  sub          s9, t0, a5
                  mulh         s1, a0, a0
                  nop
                  xori         a6, t2, 170
                  sltiu        t3, s6, 1995
                  or           gp, ra, a5
                  add          t6, s10, a7
                  fclass.s     a3, fs3
                  slt          a5, tp, tp
                  slli         a4, a6, 30
                  fadd.s       fs2, fs7, fs2, rtz
                  flt.s        gp, fs11, ft9
                  or           t1, t0, s8
                  lui          a0, 740190
                  fmax.s       fs8, ft5, fa4
                  fcvt.s.w     fa7, a0
                  and          s5, ra, t0
                  andi         sp, t4, -1377
                  fmv.x.w      t1, ft4
                  sub          s8, t3, s2
                  sll          s4, t6, s6
                  mulhu        a0, a1, s6
                  sltiu        gp, s5, -1225
                  fcvt.s.wu    ft4, s11
                  fcvt.s.wu    fa2, a6, rtz
                  fsgnjn.s     fs4, ft6, fs6
                  fcvt.w.s     t6, ft1, rup
                  fle.s        gp, ft9, fs7
                  rem          sp, gp, sp
                  flt.s        zero, ft6, fs1
                  flt.s        s6, fa3, ft0
                  fcvt.s.w     ft0, t6
                  fmv.w.x      fa1, a0
                  auipc        s1, 211331
                  slli         a1, sp, 3
                  rem          a7, t1, a7
                  srai         s2, tp, 12
                  addi         s8, s6, 974
                  fcvt.wu.s    s6, fs5
                  add          a0, t4, t6
                  addi         ra, t6, 1080
                  fmax.s       ft3, ft3, fs8
                  xor          a0, s8, s11
                  mulh         s9, s10, ra
                  mulhu        s8, t3, s0
                  div          t3, gp, s0
                  divu         gp, s0, s9
                  fmv.w.x      ft1, zero
                  sub          gp, s4, s1
                  and          zero, s10, t0
                  slt          sp, t0, s4
                  fmax.s       fs10, fa4, fa2
                  fsgnjn.s     ft9, ft2, fs3
                  fcvt.w.s     t3, fs2, rdn
                  fsub.s       fs11, ft1, ft2
                  sll          gp, t5, a3
                  fcvt.w.s     a0, ft5, rup
                  flt.s        s6, ft10, ft9
                  fcvt.wu.s    t4, fa0, rtz
                  fmax.s       fa4, ft11, ft1
                  ori          a1, t6, 184
                  srai         s7, a2, 10
                  slli         s1, a2, 6
                  fsgnjn.s     fs4, fa0, fa6
                  remu         sp, s5, a1
                  divu         a0, s6, s1
                  fmv.x.w      s5, ft7
                  fsgnjn.s     fs5, ft11, fa3
                  sra          tp, s6, a6
                  srli         a5, t2, 22
                  fcvt.s.w     fa7, t6, rne
                  fle.s        s0, ft5, ft6
                  fmax.s       fa7, fs3, fa2
                  slt          t3, s8, t5
                  fcvt.wu.s    s8, fs7, rtz
                  mulhu        gp, t3, s9
                  sub          s1, s10, s9
                  sll          t6, ra, t2
                  fclass.s     a0, ft10
                  feq.s        s9, fs3, fa5
                  lui          s0, 434601
                  fsgnjx.s     fs10, fs5, fs5
                  xori         a4, t2, 1360
                  fmax.s       fs5, fa7, fs11
                  auipc        a3, 263897
                  sll          a0, ra, t5
                  fclass.s     a7, fs10
                  lui          a3, 831342
                  lui          s9, 161194
                  srl          a7, zero, a0
                  fmin.s       fs3, fs6, fa7
                  sltiu        t0, t5, -1529
                  feq.s        s0, fa3, fs7
                  mul          s7, s1, a0
                  sra          a4, zero, ra
                  sub          t0, s5, tp
                  sub          t1, t0, t0
                  div          s1, a0, s5
                  remu         t0, s10, a3
                  nop
                  rem          a2, a6, s2
                  ori          ra, zero, -26
                  fsub.s       ft4, fs0, ft4, rdn
                  div          s1, s2, a4
                  fadd.s       fs5, ft1, ft6, rdn
                  fcvt.wu.s    a0, ft2, rup
                  fsgnjx.s     fs2, ft6, fs7
                  xor          a7, a7, s5
                  slti         a2, t1, 371
                  fcvt.s.w     fa7, s0, rdn
                  fmv.x.w      ra, fs8
                  fmv.w.x      ft6, s3
                  sra          zero, s0, s1
                  fsub.s       fs0, ft9, fa7
                  mul          s5, s3, a5
                  sub          s10, gp, s7
                  fmax.s       fs11, fa5, fs6
                  flt.s        s6, ft2, fa1
                  andi         s0, s3, 616
                  andi         s10, s3, 1814
                  slti         s6, s6, -297
                  div          sp, t1, a1
                  sltiu        gp, a2, -1357
                  mul          a5, s6, s11
                  fle.s        s4, ft10, fs5
                  feq.s        s7, ft4, fs4
                  andi         a2, ra, 905
                  srl          sp, a3, t6
                  rem          s1, a2, sp
                  fclass.s     t3, fs4
                  sub          t6, s0, s7
                  rem          a1, a2, t4
                  mulhu        t1, s10, gp
                  fcvt.s.w     ft6, sp
                  divu         t2, a6, t0
                  and          a0, t0, t4
                  fclass.s     s6, ft3
                  fclass.s     t6, fa4
                  add          t6, t4, t2
                  add          t1, t1, s4
                  fle.s        a6, ft3, ft2
                  andi         zero, s9, -1091
                  add          t3, a1, sp
                  mulhu        a3, a2, s6
                  sub          a1, t5, s4
                  fcvt.s.wu    fs11, sp
                  srai         s6, t4, 20
                  fmax.s       ft5, fa7, fa1
                  fcvt.w.s     ra, ft11, rup
                  or           ra, s6, s9
                  sra          t4, s2, a6
                  mulh         t2, s1, t2
                  fmax.s       fs10, fs1, fs4
                  slli         gp, sp, 5
                  ori          tp, s7, -1345
                  mulh         t4, t3, s11
                  or           s5, a1, gp
                  fsgnj.s      fs7, fs7, fa7
                  fadd.s       fs1, fs0, fa2, rmm
                  mulhsu       a5, s10, gp
                  and          t4, t1, t4
                  fle.s        s6, fs7, fs4
                  slti         s7, a3, 517
                  fsgnjn.s     fa5, fs4, ft10
                  sltu         a7, t2, s3
                  xori         a3, t6, 1198
                  or           s4, s11, s8
                  fcvt.w.s     a2, fs0, rup
                  fsgnjn.s     ft5, fa4, fs2
                  or           a2, a2, s7
                  srl          a3, t4, a6
                  srli         s10, a1, 3
                  srai         s4, t0, 1
                  sra          t6, a1, a2
                  or           a5, zero, t6
                  div          a1, a1, tp
                  slli         s2, t4, 30
                  srl          s0, t5, t4
                  fcvt.wu.s    tp, fs6
                  sltiu        s6, t6, -1068
                  addi         gp, s7, 474
                  remu         ra, tp, t6
                  fadd.s       fa1, ft9, fs3
                  remu         t6, ra, s11
                  srai         a3, gp, 19
                  addi         a2, ra, -1200
                  fle.s        s7, fa6, fa3
                  fcvt.wu.s    t3, fs7, rdn
                  fsgnjn.s     ft2, ft9, fs5
                  xori         s5, s2, -1569
                  or           ra, s3, ra
                  flt.s        t3, ft0, ft9
                  rem          a4, a0, s10
                  fmv.x.w      t4, fs7
                  xori         a2, a3, -118
                  fcvt.wu.s    ra, fs1, rtz
                  divu         a1, a1, s10
                  lui          s2, 392524
                  fsub.s       ft0, ft7, ft11, rtz
                  srli         s9, gp, 31
                  slli         s6, t2, 20
                  or           s10, s2, gp
                  sltu         a4, tp, a6
                  slli         tp, s7, 0
                  andi         a5, a1, -1063
                  fsgnjn.s     ft9, ft6, ft0
                  mulhu        a5, a3, s0
                  fsgnjx.s     ft7, ft0, ft7
                  lui          gp, 553965
                  divu         s7, a6, a0
                  andi         a5, a3, -1538
                  fcvt.wu.s    a0, fs9
                  fsgnjn.s     fs10, fs10, fs6
                  srai         a5, s10, 19
                  slti         a7, a1, 845
                  fcvt.w.s     a0, fa6
                  slli         s0, a5, 22
                  rem          gp, s6, t4
                  fmv.w.x      fs1, tp
                  nop
                  fcvt.s.w     fs0, s3, rmm
                  slti         s5, s8, -1712
                  srl          s5, a3, sp
                  flt.s        a7, fs9, ft7
                  mul          a6, t0, zero
                  xori         a5, t2, -738
                  fcvt.s.w     ft5, s1
                  fcvt.s.wu    fs3, a6, rmm
                  slli         a5, a0, 9
                  fsgnjx.s     fs9, ft0, fs5
                  fclass.s     t2, fs9
                  mul          tp, sp, t1
                  remu         a5, s3, a6
                  sra          t3, s7, t6
                  fcvt.s.wu    fa7, s0, rtz
                  xori         t2, t2, -1980
                  sra          a5, s5, a6
                  remu         s8, s7, s9
                  and          s9, a0, a6
                  fclass.s     s0, fs8
                  ori          s8, s0, 331
                  xori         ra, s0, 1371
                  fmv.w.x      fs7, a7
                  srli         gp, zero, 21
                  fsgnj.s      ft2, ft9, ft8
                  divu         a7, a6, s9
                  lui          s9, 50208
                  feq.s        s4, fs10, fs7
                  fcvt.s.w     ft7, sp, rmm
                  mulhsu       t2, t3, s7
                  fle.s        t6, ft9, fs1
                  or           t1, t4, s9
                  slt          s8, a4, a3
                  slt          tp, a3, s1
                  andi         a5, a1, -1824
                  fmin.s       fa1, fa1, ft4
                  fsgnjx.s     fs10, fs6, fa1
                  mulhu        t3, t2, s10
                  mulh         s1, s5, a6
                  fsgnj.s      ft0, ft0, fs3
                  remu         a6, s6, s7
                  fsgnjx.s     fs11, fa2, ft9
                  add          t6, a5, s8
                  sltiu        a7, zero, -1055
                  mulh         s0, a1, gp
                  fcvt.s.w     ft5, a6, rne
                  fcvt.s.wu    fs5, t3
                  mul          s7, a7, s8
                  xori         a4, a1, -1422
                  slt          a1, ra, a7
                  xori         ra, s7, -493
                  remu         ra, s0, s1
                  divu         s4, t0, a5
                  fmax.s       ft6, fa0, ft4
                  fclass.s     t2, fs3
                  auipc        sp, 593382
                  xor          a7, a7, s10
                  divu         t0, t5, a6
                  mulhsu       s5, t4, t3
                  sltiu        a5, s4, -212
                  and          s10, tp, a3
                  nop
                  ori          a0, t0, 1598
                  mul          gp, sp, s6
                  sltu         s7, s7, a3
                  fmv.w.x      fs6, t2
                  fcvt.wu.s    s2, fa0
                  fmv.w.x      fs4, a2
                  slti         s0, a6, -623
                  rem          s1, s7, t1
                  fclass.s     t0, fa7
                  fcvt.s.wu    fs0, a2
                  fcvt.s.wu    fs4, s6
                  flt.s        s9, ft1, ft8
                  mulhu        a4, a6, t6
                  ori          s2, s8, 916
                  or           a0, s1, a2
                  fmv.x.w      a3, ft10
                  fsgnj.s      ft4, ft2, ft7
                  slli         s2, ra, 24
                  sll          t3, s7, t6
                  slli         zero, t0, 10
                  lui          zero, 1025275
                  slti         s2, a2, -546
                  fcvt.s.wu    fs4, tp, rdn
                  xor          s4, a7, s10
                  fsgnjx.s     fa5, fs3, ft9
                  fsub.s       ft8, ft0, fa2, rmm
                  fcvt.s.wu    fa7, s1
                  andi         t6, s6, -1728
                  fclass.s     s0, ft5
                  mulhu        s10, t5, a3
                  fclass.s     a2, fs5
                  sltu         tp, ra, gp
                  or           a4, t5, sp
                  ori          s4, t2, 1770
                  mulhu        s2, s11, s6
                  lui          s4, 217418
                  sltu         s6, a3, s8
                  andi         zero, a3, 1259
                  sub          a6, a3, s0
                  sll          gp, a6, t2
                  auipc        s7, 966505
                  fsgnj.s      fa7, ft0, ft7
                  fadd.s       ft6, fa2, fs1
                  auipc        s1, 1018948
                  sll          t6, a0, ra
                  fcvt.wu.s    a0, ft3
                  fadd.s       ft7, fa5, ft7, rmm
                  sll          s7, s0, s7
                  fcvt.w.s     gp, fs9, rmm
                  feq.s        a7, ft11, fa5
                  slli         ra, s9, 26
                  rem          s8, s3, s5
                  fmin.s       fs7, fa4, fa4
                  sltiu        s7, s2, 1105
                  slt          t4, s3, s2
                  fclass.s     a7, ft3
                  fadd.s       fs1, fs6, fs0
                  and          sp, t5, s8
                  addi         s0, sp, 692
                  sra          t0, tp, a3
                  xori         s7, s6, -1456
                  fle.s        a7, ft2, fs4
                  fsgnj.s      fs1, fa7, fs11
                  fle.s        a0, fa6, ft7
                  fclass.s     a1, ft11
                  lui          s1, 901455
                  remu         a4, t4, sp
                  mul          a7, t6, t0
                  fcvt.s.wu    fs5, t2
                  mulhu        t6, s2, a3
                  srli         a1, tp, 5
                  fadd.s       fa4, ft8, ft10
                  sltiu        a2, t6, -153
                  add          gp, s2, a4
                  fadd.s       fa4, fa1, fa4
                  fle.s        s1, ft8, fa5
                  sll          a3, t3, s5
                  fmv.x.w      zero, ft5
                  fadd.s       fs4, ft0, fa7
                  rem          zero, t3, s0
                  fcvt.w.s     t2, fs7, rne
                  srl          s10, s4, t2
                  srai         s2, s0, 17
                  fsub.s       ft0, ft1, ft10, rne
                  sub          gp, s6, a7
                  fmv.x.w      s5, ft7
                  sll          t2, sp, a1
                  divu         tp, ra, a7
                  fsgnjx.s     fa3, ft4, fs5
                  fmv.w.x      ft6, s10
                  andi         a0, t6, 364
                  slli         s0, a7, 11
                  srl          a6, a3, gp
                  nop
                  fmin.s       ft5, fa7, fs2
                  divu         s2, s0, s9
                  auipc        zero, 502975
                  mulhu        t1, t4, s11
                  fcvt.w.s     t3, ft9, rne
                  fclass.s     tp, ft4
                  srl          sp, s10, s1
                  fmax.s       fs10, fs10, fa0
                  sub          t4, t2, t0
                  fmv.x.w      sp, ft9
                  sll          a6, a7, t1
                  mul          a5, s10, a2
                  fmin.s       ft3, fs1, fs5
                  srli         tp, a0, 1
                  fsub.s       ft7, ft4, ft6, rmm
                  fle.s        a0, ft11, fa6
                  mul          s9, s9, s1
                  divu         t4, s0, s7
                  flt.s        t6, fs0, ft3
                  andi         a7, gp, 1664
                  srai         a0, s8, 7
                  sra          a1, s3, zero
                  fsgnjn.s     fa1, fs4, ft10
                  sra          s4, a1, s2
                  fsgnj.s      fs8, fs5, fs11
                  mulhsu       a6, tp, s3
                  sll          zero, s8, s9
                  ori          s4, a2, 989
                  sub          a7, t0, s8
                  fmin.s       ft2, ft7, fs10
                  srl          s10, s9, a0
                  fsgnjn.s     ft0, ft6, fa3
                  fadd.s       ft8, fs8, fa3
                  srl          s8, s4, s2
                  flt.s        a4, fs0, fa5
                  fclass.s     a7, fs6
                  fmax.s       fa5, fs10, fs3
                  fle.s        a7, ft0, fa3
                  mulhsu       a4, s8, a1
                  flt.s        s4, fs5, fs5
                  srl          tp, a3, t1
                  addi         ra, a1, -172
                  sltu         ra, s9, s4
                  fsgnjn.s     ft8, fs8, fa1
                  remu         t4, s10, sp
                  fsgnjx.s     ft7, fs0, fs6
                  fsgnjn.s     ft9, ft3, fa3
                  sub          a3, s8, a3
                  fmax.s       ft9, fa2, ft0
                  fmin.s       fa0, fa0, ft0
                  sub          a0, s4, s0
                  and          s7, a5, t4
                  add          t0, s1, s10
                  fle.s        s2, ft3, fs4
                  auipc        s6, 428814
                  divu         zero, s4, s9
                  rem          a7, s1, s7
                  divu         a6, gp, s2
                  fcvt.s.w     fs3, a6, rup
                  fcvt.wu.s    a7, fs7, rne
                  fcvt.wu.s    ra, fa5, rne
                  fcvt.s.w     ft10, a1
                  fsgnj.s      ft4, fa0, ft9
                  fsub.s       fa7, ft4, ft9, rdn
                  divu         a1, t3, t0
                  mulh         s0, s4, s4
                  fcvt.s.wu    ft9, s0, rdn
                  fcvt.s.w     ft2, s5
                  or           s5, a4, s3
                  rem          s9, t1, t4
                  mulhu        s10, s2, t3
                  fsgnjx.s     ft2, fs7, fs9
                  mulhu        t0, a6, t3
                  fsgnjx.s     ft5, fa7, ft6
                  fsgnjx.s     fs2, fa6, fs7
                  mul          s10, t6, s10
                  mul          s5, s3, t1
                  fsub.s       fa6, ft6, ft7
                  sltiu        a1, gp, 1643
                  fle.s        t4, ft1, fs6
                  or           s10, a5, s5
                  feq.s        a0, fs0, fa6
                  feq.s        a3, fa5, fs1
                  nop
                  fmv.w.x      fs6, s6
                  ori          a2, s7, 1810
                  fle.s        sp, ft11, ft2
                  or           s5, a4, s2
                  ori          a7, s1, -1747
                  sltiu        s5, t4, -1078
                  fcvt.s.wu    fs2, t3, rtz
                  div          a0, t1, zero
                  fcvt.s.wu    fs7, s5
                  divu         s0, a3, a2
                  fcvt.s.w     fs6, t1, rmm
                  mul          s10, s6, zero
                  fadd.s       fa7, fs2, fa4
                  fmv.x.w      a3, fa7
                  addi         t2, ra, -1158
                  sll          a1, zero, t4
                  fcvt.s.wu    fs10, s4, rne
                  and          ra, a5, gp
                  fmv.x.w      a0, ft3
                  srai         zero, a7, 27
                  fcvt.s.wu    ft5, a4
                  mul          ra, sp, t2
                  sltiu        s1, s0, 1099
                  srai         s8, a4, 21
                  slli         s5, a3, 22
                  xori         s2, s11, 640
                  fsgnj.s      fs6, fa5, fs5
                  fmax.s       fa3, ft0, ft6
                  rem          s8, t3, a1
                  fmin.s       ft6, ft1, fs5
                  divu         s1, s1, s2
                  rem          s10, s11, t4
                  xor          zero, zero, gp
                  fmv.w.x      fs5, t3
                  fsgnj.s      fs7, fs9, fs6
                  xori         zero, s2, -494
                  mulhu        t1, a6, s3
                  mulh         t3, a1, s3
                  fcvt.wu.s    t2, fa2, rmm
                  fcvt.w.s     a1, fs10, rtz
                  fcvt.w.s     tp, ft1
                  mulh         a1, a2, a2
                  mulhsu       s9, a5, s2
                  andi         zero, s8, 1690
                  fadd.s       ft2, ft7, fa4
                  xor          s5, s2, s0
                  div          s4, ra, a0
                  mulhsu       t3, s1, s10
                  feq.s        a4, fa0, fa2
                  srai         a1, s2, 19
                  fle.s        a3, fs3, fs6
                  nop
                  and          t0, t1, t5
                  feq.s        s2, fs7, fs8
                  srli         a6, s0, 31
                  andi         t0, s9, 1365
                  fsgnj.s      fs11, ft3, fs3
                  fle.s        a1, fa3, fa1
                  or           t3, a7, t5
                  fsgnjn.s     ft5, ft5, fa3
                  ori          s6, gp, -1978
                  fcvt.w.s     t3, ft2
                  sll          s7, a5, a3
                  fsub.s       fs4, ft6, ft4, rtz
                  fadd.s       ft0, ft2, fa5
                  addi         s7, sp, 1702
                  fcvt.wu.s    a1, fa1, rdn
                  remu         ra, s10, s9
                  sll          s1, a6, s1
                  sll          s4, a0, a6
                  div          a0, t1, s8
                  auipc        a1, 737011
                  sltiu        s0, s3, 1358
                  fsgnjn.s     ft9, ft9, fs9
                  srli         a6, a0, 14
                  auipc        t0, 62166
                  fmax.s       fs1, fa0, fs10
                  andi         s8, a4, 1564
                  srl          a2, s10, a6
                  fmax.s       ft4, fs9, ft2
                  fmax.s       fs6, ft4, fa5
                  remu         s6, zero, t2
                  srai         a7, a2, 21
                  andi         a2, s10, 1093
                  ori          tp, s3, -1759
                  add          t1, s6, s3
                  rem          s2, zero, s0
                  fmv.w.x      fs4, a1
                  fclass.s     t0, ft6
                  xori         s5, s6, -1824
                  mul          s9, a7, s3
                  srli         t0, a2, 5
                  fmax.s       fa1, ft9, ft5
                  fmax.s       fs11, fs2, fs5
                  lui          t3, 241626
                  sltiu        s6, zero, 1552
                  fcvt.s.w     fs8, zero
                  sll          s4, s3, s5
                  mul          s5, a2, s3
                  fsgnj.s      ft11, ft10, fa5
                  sra          s8, a6, s0
                  srl          s6, s1, s11
                  fmv.w.x      ft0, a3
                  add          s1, s8, zero
                  feq.s        s10, fs10, ft10
                  lui          t1, 482536
                  fmin.s       ft10, fs5, ft8
                  fcvt.s.wu    fs7, s11
                  fle.s        s8, fs0, fa6
                  sra          a1, tp, a5
                  nop
                  fle.s        a5, fs6, fs8
                  srl          a6, a0, t5
                  nop
                  sll          t4, tp, s0
                  addi         s10, ra, -728
                  flt.s        s4, fs5, fs1
                  remu         a2, a4, a4
                  or           t2, sp, s2
                  auipc        a2, 343444
                  xor          s4, s6, a7
                  mul          t0, s3, a6
                  slt          t3, s5, s8
                  fcvt.s.wu    ft2, s1
                  fle.s        t2, fa3, fa5
                  fmax.s       fs5, fa2, fs11
                  fcvt.s.wu    fs9, tp
                  remu         ra, s3, a1
                  fle.s        a3, ft5, fs7
                  sltiu        s2, t4, 1472
                  auipc        s4, 900587
                  mul          ra, t2, s8
                  lui          s2, 160461
                  sub          s8, a5, s9
                  slt          t1, s10, s1
                  fsgnjx.s     ft3, ft4, ft5
                  slti         a0, s4, -302
                  feq.s        t6, fs5, fa2
                  fcvt.s.w     ft10, ra, rne
                  ori          s2, s9, -1943
                  sra          s7, s3, t5
                  fsgnjx.s     fs4, fs5, fs3
                  fsgnjn.s     fa6, fs8, ft5
                  remu         s7, s1, zero
                  slti         s1, zero, -670
                  fmv.w.x      ft9, s1
                  fsgnjx.s     fa0, fs4, ft1
                  mulhu        t4, t2, a4
                  fadd.s       fs4, ft3, fs8, rdn
                  srl          t2, s8, ra
                  lui          s5, 489636
                  fle.s        t1, fa4, fs2
                  divu         ra, a0, s8
                  mul          s2, t3, t2
                  sra          a7, gp, s10
                  slt          t3, t1, s0
                  srli         s2, s9, 10
                  fmin.s       fa4, fs1, ft5
                  feq.s        ra, ft10, fa4
                  addi         s0, a1, -780
                  fcvt.w.s     gp, fs9, rne
                  sltu         gp, s1, t5
                  xori         t0, s8, 261
                  fcvt.wu.s    s2, ft9, rtz
                  add          a4, s9, tp
                  rem          a2, s0, a0
                  xor          a6, s7, t3
                  fsgnjn.s     ft11, ft6, fa4
                  fmv.x.w      s9, ft10
                  ori          s2, t0, 801
                  feq.s        s8, fs0, fs5
                  fcvt.wu.s    zero, fa3, rup
                  slli         s8, s10, 7
                  fmv.x.w      zero, fs11
                  fle.s        zero, fs5, fs0
                  fmv.x.w      gp, fa7
                  rem          a4, s5, tp
                  remu         s0, a3, s0
                  fcvt.s.w     ft9, a5, rup
                  fcvt.s.w     fs2, t2, rdn
                  fsgnjn.s     fs5, fa3, fa2
                  auipc        s1, 673509
                  add          a3, t1, s4
                  mul          t6, a5, sp
                  fcvt.w.s     t6, fs4, rup
                  and          s10, sp, s2
                  mulhsu       s8, gp, gp
                  fsgnjn.s     ft6, fs2, fs9
                  fsgnjn.s     fa4, fa6, ft1
                  div          s8, t4, s0
                  and          t2, s10, s8
                  sll          s7, t4, s7
                  addi         tp, a3, -844
                  fcvt.s.w     ft4, s1, rdn
                  fle.s        zero, fa7, ft4
                  fsgnj.s      ft9, fs7, fa7
                  sll          s2, ra, s4
                  fmv.w.x      fs3, t4
                  srl          a7, s5, a5
                  divu         s7, a6, t0
                  srli         a7, s7, 25
                  and          s1, s3, s8
                  fmv.w.x      ft3, t3
                  flt.s        s0, fa2, fs8
                  and          t6, tp, t0
                  sll          gp, a6, t3
                  divu         tp, a2, a5
                  fmax.s       fa0, fa5, fa0
                  fcvt.s.wu    fa6, a5
                  fsub.s       ft2, fa6, fs7, rup
                  add          t4, s6, zero
                  fmin.s       ft5, fa0, ft1
                  fcvt.s.w     fa4, tp
                  nop
                  remu         t6, zero, t5
                  divu         a7, gp, a6
                  fsub.s       fs4, ft5, fa7, rdn
                  fsgnj.s      fs4, fs2, ft6
                  fsgnj.s      fs1, fs3, ft2
                  sltiu        t0, a1, -1955
                  fcvt.s.w     fs2, s2
                  xor          s0, zero, a6
                  ori          a4, a4, 837
                  fsgnj.s      fs6, fs0, fs1
                  fcvt.w.s     sp, fa1
                  mulh         gp, a6, s7
                  sltiu        a1, sp, -1385
                  fmax.s       ft3, ft7, ft1
                  and          a1, s5, s1
                  fcvt.s.w     fs4, s0
                  sltiu        s2, a2, -33
                  fmax.s       fs4, ft11, ft9
                  sltu         gp, s6, a2
                  div          a3, a7, t6
                  divu         t6, s1, a6
                  sra          s5, tp, t1
                  xor          s6, s8, a0
                  div          ra, a3, s11
                  fmax.s       fs0, ft2, ft5
                  fsub.s       fs5, fs1, fs1, rup
                  sltu         t1, t1, zero
                  xor          a2, sp, a3
                  fcvt.s.wu    fa5, s0
                  srl          sp, tp, a7
                  mul          t3, a1, s0
                  auipc        a2, 220627
                  mul          a5, s1, s9
                  srai         t4, s7, 15
                  feq.s        sp, fa2, fa0
                  fcvt.s.wu    fa3, sp, rtz
                  sra          s7, s5, a2
                  sra          s6, t5, s9
                  fcvt.w.s     a7, fs9
                  remu         a1, sp, s3
                  fsgnj.s      fa5, fa1, fa3
                  fmv.w.x      fa7, t2
                  or           a6, a4, s9
                  fmax.s       fs10, fa2, fs6
                  feq.s        s7, fs7, fa4
                  fsgnjx.s     ft6, fa1, fa0
                  srl          t4, s10, t0
                  sub          t1, s6, sp
                  fcvt.w.s     s5, fa1
                  srai         s0, s10, 11
                  mulh         s4, zero, t2
                  fcvt.wu.s    a6, ft6, rne
                  srai         s0, s1, 1
                  or           t3, a0, a7
                  srli         a5, a7, 17
                  mulhsu       s7, t2, a4
                  sll          t3, tp, gp
                  xori         a5, a5, 707
                  div          s7, zero, t6
                  fcvt.w.s     s6, fs1, rup
                  sub          s4, s1, a0
                  fmv.w.x      fs1, s4
                  fsgnjx.s     ft10, ft5, ft6
                  sll          a4, ra, a3
                  slli         a7, zero, 11
                  lui          s7, 168875
                  fclass.s     s5, ft10
                  divu         s7, a3, a1
                  fcvt.s.wu    ft10, t1
                  fcvt.wu.s    t6, fs4, rup
                  or           t2, ra, s9
                  slt          a3, a2, a5
                  fclass.s     a4, ft0
                  xori         a5, s7, -633
                  sltiu        s9, zero, -503
                  slt          zero, a5, t2
                  fmv.x.w      t0, ft3
                  mulhu        s7, a2, t1
                  fadd.s       ft5, fa7, ft11
                  fclass.s     tp, fs4
                  fsub.s       fs3, ft8, ft5
                  fcvt.wu.s    s2, ft7
                  fcvt.s.w     ft11, s9
                  and          a3, t3, a5
                  sra          a6, s2, a2
                  fsgnjn.s     fs6, fs0, fs1
                  flt.s        s2, fa2, fs11
                  srl          s10, a7, sp
                  srl          a1, a1, s2
                  andi         gp, s1, 725
                  fmin.s       fs10, ft4, fs5
                  sll          tp, t0, s5
                  nop
                  flt.s        t1, ft8, fs7
                  andi         s5, t1, 1794
                  fadd.s       fa2, fs11, ft9, rtz
                  or           s9, s6, sp
                  srl          s2, a6, t2
                  fcvt.s.wu    fs8, s2, rup
                  ori          zero, s5, -537
                  mulhsu       a7, gp, s4
                  sltu         t1, s4, s3
                  sra          s7, s6, a4
                  divu         a6, s9, sp
                  xori         tp, a7, -1123
                  lui          a1, 460258
                  mul          sp, s9, a4
                  sra          a0, s6, s9
                  xor          gp, t1, t4
                  srli         s1, t3, 6
                  andi         gp, s1, -2003
                  fcvt.s.w     fs11, a5
                  fmin.s       ft4, fa4, fs7
                  fcvt.w.s     t3, fs9
                  xori         a7, s5, -80
                  fsgnjx.s     fs8, fa0, ft3
                  xor          a6, s11, ra
                  slt          s4, a3, t0
                  fclass.s     a5, fs7
                  fmax.s       fa3, ft8, ft4
                  srl          s10, a1, s8
                  mulhu        tp, s5, tp
                  fadd.s       fs0, ft5, ft8, rne
                  fsub.s       fa5, fs6, fa5
                  fmv.w.x      ft10, sp
                  div          s8, a7, t0
                  fadd.s       ft7, ft9, fa0
                  sub          zero, s9, t5
                  rem          s1, s5, sp
                  mulhsu       a2, tp, s4
                  xor          a4, s8, t6
                  fcvt.wu.s    a2, ft11
                  fadd.s       fs5, ft5, fs3, rtz
                  fcvt.s.w     ft2, s3, rne
                  fmax.s       fa1, ft4, fs0
                  fmax.s       fs2, fa2, fs3
                  fmin.s       ft8, fa5, ft0
                  feq.s        t4, fs6, ft2
                  slt          ra, tp, a5
                  remu         a5, s9, s9
                  and          a7, a1, s9
                  fcvt.w.s     s4, ft2
                  fsgnjn.s     ft10, fa7, fa6
                  srai         t3, t4, 5
                  fadd.s       ft10, ft2, fa6, rup
                  fsgnjx.s     fa4, ft11, fs2
                  sub          a0, a1, t2
                  fmv.w.x      fs7, s11
                  fle.s        s9, fa3, fs10
                  mulhu        zero, a0, ra
                  nop
                  auipc        zero, 671634
                  fsgnjx.s     fs2, fa2, fa5
                  fle.s        t2, fa2, fs3
                  fsgnjx.s     fs5, ft0, ft6
                  fsgnjx.s     fs9, fa1, fs5
                  fsgnjx.s     fs10, ft4, fs6
                  mul          a4, s7, t5
                  or           sp, t1, gp
                  fcvt.wu.s    t3, fa2, rup
                  andi         zero, s2, -1061
                  addi         a7, a6, 566
                  addi         s1, t0, 1181
                  add          t4, t3, s4
                  andi         a4, a4, -815
                  divu         t6, a5, tp
                  mulhu        a0, s9, s4
                  sll          t0, a7, s8
                  sltiu        s9, s5, -656
                  fmv.x.w      tp, fa4
                  slti         s8, t2, -755
                  rem          t4, s1, a2
                  mulhu        a7, s10, t1
                  fcvt.s.w     ft4, a5
                  fcvt.wu.s    t1, fs7, rup
                  xor          s7, sp, s1
                  div          s6, sp, a5
                  xori         t0, gp, 1102
                  nop
                  fle.s        gp, fa6, ft0
                  rem          t3, t4, t4
                  sltiu        s5, a3, -1653
                  mulhu        s8, t5, t3
                  slt          s5, s2, t1
                  sra          a5, a5, s10
                  srli         a5, ra, 31
                  srl          s0, a5, t3
                  mulhsu       t6, s10, t1
                  auipc        gp, 656534
                  fcvt.s.wu    fa6, t0
                  fcvt.s.w     fs1, t6
                  mulh         t2, ra, a7
                  div          t4, s5, s11
                  fsub.s       fs10, fa5, fa7, rtz
                  fsgnjn.s     ft6, fs7, fs7
                  srai         sp, s4, 4
                  flt.s        sp, fa7, ft1
                  flt.s        a0, fs1, fs11
                  nop
                  fcvt.s.w     ft3, a1
                  ori          sp, t6, 587
                  or           t4, s3, zero
                  mulhu        s6, s3, t6
                  fmin.s       ft11, fs5, ft10
                  ori          t0, ra, 1910
                  xori         s8, a1, -1028
                  ori          a5, t5, -599
                  fadd.s       ft5, ft2, ft7, rdn
                  fcvt.s.wu    fa6, t4, rtz
                  slli         t2, a0, 0
                  fmax.s       ft9, fs7, fs8
                  fle.s        gp, fa4, ft8
                  xor          t1, t6, t6
                  slli         a5, s1, 10
                  slli         s5, a3, 24
                  add          a2, t6, s11
                  srai         a1, a3, 23
                  slt          s8, s11, s3
                  fadd.s       fa1, fa2, fs1, rmm
                  remu         s0, t3, a4
                  fcvt.w.s     a1, ft8, rmm
                  lui          s8, 416854
                  andi         s7, gp, -136
                  xori         t4, a4, -1195
                  auipc        sp, 359774
                  sltiu        s5, t6, 1590
                  andi         s4, tp, -1585
                  fsgnj.s      fs0, fs3, fs9
                  flt.s        s2, ft11, fs10
                  mulhu        t0, s6, a2
                  fcvt.s.w     fs0, a3
                  fmax.s       fs6, fs5, ft10
                  fsgnjn.s     ft5, fa5, ft5
                  srli         s8, a7, 9
                  srli         s6, s8, 0
                  mulhu        s7, a6, s3
                  fsgnj.s      fa0, ft9, fs8
                  addi         t1, a7, 1283
                  fcvt.wu.s    zero, fa7, rne
                  addi         a6, t6, -1335
                  fsub.s       fa0, ft7, fs6, rdn
                  fcvt.w.s     s4, fa5, rtz
                  xori         sp, a5, 224
                  addi         t2, t4, -1533
                  ori          gp, t0, 944
                  xor          ra, t2, a1
                  mulh         tp, sp, s7
                  slli         s0, s11, 29
                  fcvt.s.w     fa2, s1
                  add          s9, s11, t6
                  or           a4, s1, tp
                  feq.s        t0, fa1, fs5
                  divu         s8, s10, t3
                  fsgnjx.s     fs2, fs8, fa0
                  fcvt.s.w     ft7, s7, rmm
                  srli         s7, s2, 0
                  fcvt.w.s     s1, ft10, rne
                  fmin.s       fs1, fa7, fa7
                  fcvt.w.s     a0, ft6, rne
                  srai         s4, t1, 0
                  mulhu        tp, s1, s11
                  fcvt.w.s     t2, fa7
                  ori          a2, sp, -201
                  fcvt.s.w     fs3, ra
                  feq.s        t4, fs3, ft6
                  fsgnjn.s     ft3, ft7, fa1
                  remu         tp, ra, a1
                  div          t2, s11, a3
                  andi         s2, t6, -1357
                  fcvt.s.w     ft11, s1
                  mulh         gp, s0, s6
                  fmax.s       fs2, ft7, fa4
                  xor          a6, a7, a0
                  andi         s8, s0, -888
                  mulhu        a4, zero, s5
                  slli         s6, a1, 9
                  fsub.s       fs2, fa4, ft1, rup
                  remu         a1, t5, s8
                  sub          tp, s6, s0
                  srai         t1, t6, 9
                  fmv.x.w      s1, fs5
                  mulhu        s9, sp, s4
                  addi         t0, s11, 1243
                  sub          gp, s10, s7
                  slt          t2, a3, t6
                  or           a3, s2, a1
                  fadd.s       fs10, fs6, ft10, rdn
                  sltiu        a4, s3, -1400
                  lui          zero, 611218
                  fsub.s       fs3, fa5, ft3, rdn
                  mulhsu       t3, s6, a6
                  fsub.s       fa7, ft9, ft6
                  fsub.s       fs9, fs2, fs9
                  rem          s7, a4, sp
                  sltiu        s8, s6, 1961
                  xori         sp, s7, -47
                  fmax.s       fs5, ft3, ft3
                  sltiu        s4, a7, -698
                  add          a4, a6, a2
                  fadd.s       fa2, fs11, ft0, rdn
                  mulhsu       t1, s5, s6
                  fsub.s       fs2, fa1, fa2, rmm
                  feq.s        t6, fs4, ft2
                  fadd.s       ft10, fa7, fa4
                  fsgnjx.s     ft5, fa7, ft6
                  fcvt.s.wu    fa4, s9
                  xori         t1, a2, 1748
                  fcvt.wu.s    ra, fa1
                  feq.s        a5, fa5, ft2
                  auipc        s10, 1039694
                  sub          a0, a2, tp
                  divu         s4, zero, a7
                  srai         gp, t5, 6
                  xori         a4, s11, -167
                  addi         a5, sp, -1417
                  flt.s        sp, ft1, ft4
                  fcvt.wu.s    ra, fs1, rne
                  fcvt.s.w     ft3, gp, rtz
                  addi         a7, a5, 1662
                  mulh         t2, a5, t5
                  fmv.x.w      a6, fa3
                  slli         a4, a1, 19
                  fmv.x.w      a0, fa3
                  fsgnj.s      fs11, fs8, fs1
                  mulhu        ra, tp, s3
                  nop
                  fsgnjx.s     ft5, ft1, fa7
                  mulhsu       tp, t0, a0
                  add          a3, a4, t0
                  fcvt.s.wu    fa3, zero, rdn
                  fsub.s       fa2, fa7, ft4, rmm
                  feq.s        t4, ft9, ft8
                  fcvt.s.w     fs7, s0, rdn
                  fcvt.wu.s    gp, ft1, rne
                  fmin.s       fs3, ft10, ft6
                  addi         t1, t5, -1224
                  fclass.s     s4, ft1
                  sra          s6, gp, sp
                  fsub.s       fs5, ft6, ft5, rup
                  nop
                  sra          s1, s0, t3
                  remu         t2, t3, tp
                  sltu         s4, a2, t0
                  mul          s6, tp, t4
                  rem          zero, t3, a7
                  fsgnj.s      ft7, ft6, fs3
                  sll          s2, ra, a1
                  fcvt.s.w     ft1, s8, rtz
                  fmin.s       ft7, fa6, fa7
                  mul          t0, a0, a6
                  mulhsu       a1, s10, t3
                  srai         zero, s4, 7
                  rem          sp, s8, t1
                  auipc        ra, 710200
                  xor          tp, s5, a1
                  or           a5, a6, a6
                  and          a6, t5, sp
                  sltu         s6, sp, t2
                  xor          ra, t4, s6
                  fsub.s       ft1, fs0, fs0, rne
                  div          s2, sp, a3
                  sub          ra, a6, s3
                  rem          zero, t0, a1
                  fsub.s       ft6, fa7, fa0
                  fadd.s       ft2, ft9, ft9, rdn
                  flt.s        t2, fs4, fs8
                  fle.s        t2, fs6, fs11
                  fmin.s       ft7, fs1, ft1
                  sra          tp, zero, t5
                  flt.s        a6, ft2, fs9
                  mul          s10, sp, ra
                  divu         gp, ra, sp
                  ori          ra, s0, -1180
                  andi         a5, a3, -2039
                  nop
                  fcvt.s.w     ft8, s9, rtz
                  add          s6, s8, s11
                  mulhsu       s10, s5, a2
                  and          t3, ra, s9
                  fcvt.s.wu    ft0, s1, rmm
                  add          a5, ra, s1
                  div          t0, t3, a4
                  mul          s8, s11, s9
                  and          tp, s7, s11
                  sltiu        a1, s11, -166
                  slli         ra, s10, 13
                  fsgnj.s      ft8, fa7, fs1
                  sltiu        t1, s6, -941
                  fsgnjx.s     fs6, ft2, ft9
                  mul          s0, s9, t4
                  srl          t0, t0, s0
                  and          a7, a6, a1
                  div          sp, a2, s4
                  fcvt.w.s     a4, ft6
                  xori         ra, ra, -1695
                  and          a4, a4, s6
                  add          t3, s3, a1
                  add          s4, t0, s9
                  sll          sp, s1, a6
                  fsgnj.s      fs6, fa0, fs5
                  fcvt.w.s     a6, ft5, rup
                  fcvt.s.wu    ft3, tp
                  sll          s6, ra, s3
                  xor          tp, zero, s3
                  fmv.w.x      fs0, s8
                  fsub.s       fs8, fs1, fs6
                  sltu         a4, s3, a6
                  fsgnj.s      fa4, ft11, ft8
                  sll          a3, t1, s0
                  fmax.s       ft4, fa3, fa7
                  sll          s2, s1, s2
                  slt          t2, s9, s1
                  or           a5, a4, t1
                  srl          a4, t0, a7
                  fmv.x.w      zero, fa3
                  fcvt.s.w     ft9, t1
                  add          t0, a6, tp
                  fsgnj.s      fa7, ft2, fs1
                  fle.s        t6, ft6, fa3
                  remu         a5, s4, t5
                  feq.s        s10, ft1, fa4
                  fcvt.wu.s    s6, ft5, rup
                  xori         a5, s11, 538
                  addi         a7, t5, 1974
                  rem          s0, t5, a2
                  feq.s        t2, fa0, fs1
                  slli         s8, s8, 18
                  auipc        a3, 930533
                  xori         a6, sp, -923
                  fmv.w.x      fs0, t4
                  slt          a4, s3, a3
                  flt.s        t1, ft6, ft8
                  nop
                  sltu         s1, ra, t6
                  divu         ra, tp, a4
                  remu         s6, a7, s9
                  sltu         s9, t3, s9
                  lui          s5, 746454
                  div          s0, s7, sp
                  sltiu        s7, s8, -1185
                  fcvt.wu.s    s4, fs4, rdn
                  sltu         t3, a2, ra
                  remu         ra, s9, s7
                  auipc        a6, 442917
                  slli         t0, t0, 12
                  fcvt.w.s     s4, ft4
                  or           t4, t5, a4
                  fsgnj.s      fs10, ft11, fs6
                  mulh         s7, a4, tp
                  fsgnjx.s     ft3, ft0, ft3
                  andi         tp, t3, 1907
                  srli         t2, a3, 3
                  srli         t6, gp, 15
                  sltiu        a4, zero, -460
                  mul          a5, sp, s1
                  sub          gp, s1, s9
                  add          s6, a6, a0
                  fmin.s       ft1, fa1, fs3
                  sll          a5, s6, a2
                  divu         a2, t1, a6
                  srl          t2, tp, s4
                  divu         a4, tp, s10
                  sltu         tp, s10, ra
                  sltu         sp, t0, sp
                  fle.s        tp, fa5, ft3
                  srli         t4, a1, 25
                  fclass.s     a5, fs6
                  remu         t1, s5, s4
                  xor          a3, s6, s7
                  and          a0, a5, a5
                  div          t2, a3, s10
                  sll          s10, t2, t2
                  addi         t1, s11, -66
                  auipc        tp, 847176
                  mulhu        t1, t3, t2
                  fmv.x.w      t0, ft7
                  srl          s8, s1, s8
                  mulhsu       s7, s0, s7
                  add          t4, s1, s1
                  srli         s2, s10, 14
                  fsgnj.s      ft3, fs10, fa7
                  fsgnj.s      fs8, ft0, ft1
                  add          gp, a5, s5
                  fmv.x.w      s2, ft7
                  rem          tp, s7, s6
                  auipc        zero, 866926
                  fsgnjn.s     fs1, fs10, ft8
                  slli         a3, s0, 30
                  srli         tp, t1, 5
                  remu         s1, t5, s9
                  or           a4, sp, s11
                  srl          s7, t4, s3
                  and          s8, gp, s7
                  mulhu        a5, t0, tp
                  fmax.s       ft1, ft4, fs3
                  slt          t6, s4, gp
                  ori          a7, s5, 483
                  srai         a2, a5, 27
                  sub          s9, a5, t5
                  sltu         a0, t5, s8
                  srai         gp, s2, 31
                  lui          s9, 303712
                  fadd.s       fs4, ft10, fs3, rup
                  sra          tp, s11, s3
                  fmv.x.w      t2, ft3
                  slti         s5, s1, -986
                  sltu         zero, t3, t5
                  mul          s5, t5, a1
                  ori          a2, sp, 1814
                  xor          a7, s4, t3
                  fmin.s       fa1, fs7, ft8
                  fmv.x.w      gp, ft11
                  fsub.s       ft5, fs2, fa7, rne
                  fcvt.wu.s    s2, fs4, rdn
                  srli         a7, s6, 21
                  mul          s0, a1, ra
                  slti         s4, s11, -818
                  mulh         s8, a6, s0
                  mul          s1, s6, a0
                  sra          s4, a2, t5
                  fsgnjx.s     fs9, fa1, ft4
                  fsgnj.s      ft11, ft7, fa3
                  andi         tp, a1, 1727
                  slli         zero, a2, 16
                  slli         s4, s2, 9
                  div          a0, s9, t4
                  mulh         a7, gp, t3
                  add          s0, s10, tp
                  fcvt.wu.s    tp, ft11
                  remu         zero, t6, sp
                  fcvt.s.w     ft3, a4
                  andi         s1, s1, 588
                  feq.s        a6, ft11, ft0
                  fsgnjx.s     ft9, ft6, ft0
                  fsgnjn.s     fa3, fs4, fa0
                  auipc        a1, 876122
                  slt          s2, sp, a2
                  and          s9, a4, s11
                  add          t6, a4, t1
                  srai         s5, tp, 20
                  lui          t3, 940917
                  mulhu        a2, a4, s9
                  xor          s2, a7, t6
                  nop
                  xor          s1, s11, gp
                  mulhu        a7, s11, s9
                  fcvt.w.s     s7, ft3, rup
                  slt          s2, a5, a1
                  fmv.w.x      ft5, tp
                  divu         a5, s9, ra
                  xori         t1, s3, 1767
                  fmv.x.w      a1, fa2
                  fadd.s       fs3, ft8, ft4
                  rem          a4, gp, s0
                  xor          zero, a1, t4
                  nop
                  fsgnjx.s     fa2, ft1, fs9
                  sra          a0, t3, s7
                  fadd.s       ft3, fs7, fs10, rne
                  mul          a6, a4, tp
                  fcvt.wu.s    gp, fs5, rup
                  feq.s        s6, fs0, fa3
                  fmin.s       ft2, fs2, ft2
                  srli         t6, a1, 5
                  fclass.s     s5, fs7
                  rem          a0, a6, tp
                  addi         s4, ra, -1844
                  fmv.w.x      fs0, s4
                  fsgnj.s      ft7, fa6, fs7
                  addi         a7, t1, -1567
                  xori         t6, s8, -578
                  fmin.s       fs3, ft5, ft2
                  sltu         a3, s11, a2
                  fsub.s       fs0, fa5, fs8, rmm
                  fsub.s       ft10, fs9, ft5, rup
                  srl          tp, s2, s3
                  flt.s        s10, ft11, fs9
                  remu         a7, s7, s7
                  fadd.s       fs3, ft8, fa3, rdn
                  rem          t4, s5, a6
                  fclass.s     a0, fs8
                  and          t1, s1, t4
                  fclass.s     t0, fs9
                  sltu         zero, ra, s5
                  lui          s9, 618743
                  flt.s        t1, ft3, ft2
                  fle.s        a1, fs10, ft8
                  fmax.s       ft9, fa1, fs3
                  mul          tp, t3, s1
                  fcvt.w.s     zero, ft2
                  and          a6, t5, s5
                  rem          a2, s7, gp
                  srli         s0, a2, 17
                  fmin.s       ft8, ft4, fa5
                  fmv.w.x      fa6, a3
                  mulhu        s9, s3, s7
                  srl          t4, t0, s1
                  nop
                  fsgnjn.s     fs4, fa7, ft11
                  fcvt.s.wu    fa6, t5
                  remu         a4, a6, t2
                  fmv.w.x      fs3, s7
                  fcvt.s.wu    fs11, s10
                  feq.s        a6, ft1, fa6
                  srai         a2, s7, 19
                  fcvt.w.s     tp, fa6, rdn
                  fmax.s       fa3, fs10, fa3
                  mulhu        sp, a1, s7
                  srli         s10, s8, 17
                  flt.s        a6, fs3, ft3
                  nop
                  div          s2, a6, s5
                  mulhu        s7, a4, s9
                  fle.s        zero, ft1, fs8
                  sltiu        t0, t4, 1825
                  srl          s10, s10, s5
                  mulh         s2, a4, s8
                  fmax.s       ft7, fs2, fa3
                  fle.s        s6, fa1, ft1
                  fsgnjx.s     fa2, fa5, fa5
                  sub          s9, sp, s5
                  fsgnj.s      fs10, ft10, fs6
                  fmin.s       ft3, fa0, ft1
                  nop
                  and          zero, a3, s0
                  div          a0, a0, a7
                  flt.s        t3, fa4, fs2
                  fmv.x.w      sp, fa0
                  andi         gp, a2, 214
                  fsgnjn.s     fa5, ft9, fa2
                  slti         s9, zero, 560
                  add          a0, s6, a6
                  fcvt.w.s     t4, fa4, rmm
                  slli         a5, a7, 5
                  lui          s1, 1001147
                  mulhu        a4, s10, a7
                  slli         sp, sp, 23
                  sub          s7, t4, t3
                  mulhu        s10, s2, ra
                  nop
                  slti         a4, s0, -1957
                  lui          sp, 65938
                  fmin.s       fs5, fa2, ft4
                  fcvt.s.w     fs9, s5
                  srli         s4, s4, 2
                  xor          zero, s5, a5
                  mulh         s7, s7, tp
                  srli         zero, s7, 9
                  mulhsu       ra, t0, ra
                  fle.s        a0, fs2, fs8
                  divu         s4, ra, a2
                  or           a6, zero, sp
                  fcvt.w.s     a5, fa3, rne
                  andi         t4, t4, -770
                  divu         s8, s2, a5
                  divu         a0, t6, t0
                  lui          s2, 273172
                  fcvt.s.wu    fs2, a7
                  fsub.s       fa2, fs10, fs9, rdn
                  and          s1, t0, a6
                  sll          a1, s4, t2
                  slli         t0, s2, 28
                  fle.s        t0, fs7, ft4
                  lui          s7, 933721
                  mulh         a1, s5, t6
                  fsgnj.s      fa6, ft0, fs5
                  srai         a0, gp, 16
                  srli         ra, t3, 20
                  slli         s7, tp, 23
                  mul          t1, a3, s5
                  srai         s9, tp, 14
                  or           a3, a3, s6
                  nop
                  add          s5, a7, t6
                  fcvt.s.w     fa0, a4
                  fcvt.w.s     tp, ft7, rtz
                  fadd.s       ft4, ft6, fs11, rtz
                  sra          s4, tp, s3
                  srl          s5, t2, a3
                  sltiu        a3, t3, 100
                  sub          tp, t3, s2
                  or           a6, t3, a0
                  nop
                  srl          s2, t0, s4
                  sltiu        s6, t2, 1513
                  slli         s5, a1, 11
                  flt.s        s6, fs9, fs7
                  fcvt.s.wu    ft7, s7
                  sltiu        s4, t3, -1300
                  fadd.s       fa2, fa6, ft2, rdn
                  fcvt.w.s     a7, fa3, rdn
                  sra          ra, s9, s11
                  slli         t0, a2, 16
                  divu         tp, s5, s7
                  srl          s7, a7, t1
                  fcvt.wu.s    zero, fa5
                  mulhu        t1, t6, a7
                  sll          tp, s4, s0
                  remu         t0, a1, a7
                  auipc        ra, 45254
                  fmv.w.x      ft5, a7
                  slt          a1, a5, s4
                  slti         a7, s6, -792
                  fmin.s       ft7, ft9, fs1
                  remu         s8, s8, s1
                  mul          s6, a5, s4
                  addi         t3, t0, 1398
                  auipc        a6, 25615
                  fadd.s       ft9, fs0, fa4
                  div          s5, a7, t6
                  mulhsu       t4, s3, ra
                  srl          a3, a2, s0
                  xor          a6, t0, s7
                  fsub.s       ft5, fs8, ft5, rmm
                  fsgnjx.s     ft3, ft2, ft0
                  fcvt.w.s     a6, ft7, rmm
                  fsgnj.s      ft4, fs8, ft6
                  div          t6, t1, s5
                  sra          a6, s7, a4
                  fmv.x.w      gp, ft6
                  and          a3, s7, zero
                  ori          sp, a4, 239
                  mulhsu       sp, zero, sp
                  fcvt.w.s     tp, ft8, rup
                  divu         s10, t1, t2
                  rem          s6, s2, s7
                  or           s1, s9, zero
                  andi         s9, a6, -1016
                  div          gp, s5, t4
                  ori          s4, s5, -1775
                  sltiu        ra, s7, 426
                  fclass.s     s6, ft7
                  fsgnjx.s     fs9, ft5, ft11
                  nop
                  slli         a2, t6, 9
                  xor          s9, t0, tp
                  add          a4, tp, a0
                  srai         s2, s5, 22
                  fmax.s       fs9, ft4, fa7
                  lui          s0, 31099
                  sra          a0, tp, t4
                  ori          s5, s10, -1023
                  and          a0, t0, a5
                  slti         sp, t3, -1524
                  fcvt.s.w     ft0, t3
                  and          zero, t6, ra
                  fmax.s       ft4, fs7, fs9
                  fmv.x.w      a6, fs11
                  fclass.s     a7, fs1
                  feq.s        a1, ft1, ft1
                  lui          t3, 792975
                  fsgnj.s      fa0, ft11, fa7
                  rem          zero, t4, s5
                  mulh         a2, a6, a0
                  fmv.x.w      s5, fs10
                  fle.s        a1, fs4, fa5
                  auipc        a3, 793199
                  addi         s1, t4, 1614
                  mulh         sp, a0, a6
                  mulh         s9, a5, t3
                  fclass.s     sp, fa0
                  sll          sp, s2, a6
                  mul          a4, s11, ra
                  srli         a4, zero, 6
                  sll          ra, s9, tp
                  sub          sp, a3, s5
                  divu         s6, a5, s6
                  fcvt.s.w     ft4, s1
                  add          tp, t2, a7
                  auipc        a5, 914413
                  fadd.s       fs8, fs3, ft4
                  fmax.s       fa7, fs1, fa5
                  feq.s        sp, fa7, ft5
                  xori         a4, sp, -640
                  and          t1, s5, t2
                  sub          s9, a5, s0
                  fsub.s       fa4, fa0, ft3
                  or           t6, tp, s4
                  mulh         a7, ra, a5
                  flt.s        t2, fs9, fs0
                  sll          a6, a4, t0
                  fmin.s       ft5, ft3, ft0
                  nop
                  sra          a0, t6, t2
                  sra          t6, t6, s3
                  divu         t3, t4, a6
                  rem          a2, a1, s10
                  or           a6, s9, a3
                  remu         s6, s4, a3
                  div          a4, gp, s0
                  flt.s        s1, ft7, fa7
                  srli         t1, s11, 5
                  flt.s        t0, fs1, fa7
                  fsub.s       ft7, ft8, ft10
                  or           s4, s3, a2
                  sra          t4, s3, s0
                  xor          s9, ra, a7
                  fmv.w.x      fs1, t2
                  srl          s7, tp, sp
                  feq.s        a5, fs8, fs1
                  slti         t0, t0, -1546
                  remu         a4, s11, s1
                  slli         a6, s6, 5
                  sra          a7, s4, a6
                  mulhu        s9, a3, s10
                  remu         s6, s2, a1
                  mulh         a7, a3, s5
                  fsgnjx.s     ft6, ft7, ft11
                  srai         zero, t4, 3
                  remu         s8, s9, ra
                  fsgnjn.s     ft0, fs3, fa0
                  lui          s5, 469929
                  fcvt.wu.s    t0, fs11, rmm
                  add          a3, a4, sp
                  slt          s10, s8, sp
                  fcvt.wu.s    s5, fs1, rdn
                  slti         a7, a4, -1726
                  ori          s9, a1, 33
                  fcvt.w.s     a0, ft3
                  feq.s        a4, fa3, ft2
                  fle.s        t1, fa3, fs2
                  and          t3, zero, t3
                  fmv.w.x      fa7, s1
                  fsgnjn.s     ft4, fs3, ft8
                  fsub.s       fa3, ft5, ft3, rdn
                  nop
                  or           t3, a1, a7
                  feq.s        a1, fa3, fa6
                  nop
                  mul          a6, s4, gp
                  srli         a1, s4, 4
                  ori          s2, t5, 1147
                  sll          a6, a1, s0
                  slt          sp, zero, s1
                  xor          a3, t2, a5
                  nop
                  lui          a0, 920454
                  fcvt.w.s     t1, ft3
                  sltiu        s5, s0, -1422
                  sltu         t4, a7, a3
                  fle.s        a3, ft7, fa1
                  sltiu        t6, s2, 941
                  andi         s9, s2, -1386
                  fsgnjx.s     fa0, fa5, fs11
                  fcvt.s.w     fs11, zero, rup
                  fcvt.w.s     s0, ft4
                  fmv.x.w      a0, fs11
                  xori         s9, t2, -1400
                  fsgnjn.s     ft8, fa5, ft5
                  fcvt.wu.s    tp, fa0, rne
                  add          t1, t3, a7
                  slli         s1, s11, 20
                  addi         t4, tp, -640
                  srai         t3, a7, 25
                  fcvt.s.w     fs5, t3, rdn
                  mul          gp, a5, t4
                  fle.s        gp, fa2, ft5
                  or           s10, s5, a1
                  slli         a2, ra, 4
                  fcvt.s.w     fs8, s3, rne
                  fcvt.s.w     fs10, s8, rmm
                  slli         s8, tp, 14
                  xor          a4, a5, t5
                  sltu         t1, s11, t2
                  ori          s10, a6, -1383
                  sll          s6, s9, ra
                  nop
                  sltu         gp, ra, s1
                  fcvt.s.wu    fa3, t4
                  srl          a1, s1, gp
                  andi         t6, t1, -21
                  fmv.x.w      s8, fa5
                  fsgnjx.s     fs3, fs0, fa0
                  div          s2, s0, s1
                  fsgnjx.s     fs5, fs10, fa2
                  slti         s8, a0, 835
                  fmin.s       ft11, ft5, ft10
                  fmax.s       ft5, fs7, fa6
                  slt          s9, s3, t3
                  ori          a5, t3, -512
                  sltu         a7, t6, a1
                  fmin.s       ft8, fs8, fa0
                  fcvt.s.wu    ft6, t2, rtz
                  fclass.s     a2, ft1
                  slt          a1, a3, t1
                  or           a7, s4, a5
                  sub          tp, t3, s4
                  andi         t2, a5, -1551
                  or           a1, a0, s11
                  remu         a6, zero, gp
                  auipc        a1, 1023595
                  addi         tp, tp, 855
                  sll          s9, s5, gp
                  xori         s8, t6, -1564
                  srli         s7, zero, 20
                  fmv.x.w      a0, ft7
                  xor          a3, a1, a7
                  nop
                  fcvt.wu.s    t2, fa0, rup
                  fcvt.s.wu    fa0, s5
                  srl          a2, a6, a7
                  srl          t1, a1, a5
                  xor          a3, t0, s2
                  slti         s2, a3, 1536
                  flt.s        a3, fs5, ft10
                  srl          t4, s9, t4
                  and          sp, s6, gp
                  lui          s5, 485733
                  mulh         t2, a3, zero
                  fcvt.s.wu    ft10, t5, rne
                  fmv.x.w      s9, ft4
                  mul          a0, t1, t5
                  add          s2, s9, s11
                  feq.s        t4, fa7, fs8
                  slli         s0, s7, 7
                  fmv.w.x      ft5, t6
                  mulhsu       t1, s0, a2
                  srai         sp, s3, 4
                  slti         t4, s11, -1074
                  div          sp, ra, s9
                  fle.s        s8, ft0, ft3
                  mulhsu       s0, a5, s4
                  andi         sp, t2, 459
                  rem          s0, s8, s3
                  fadd.s       ft11, fa3, ft10, rup
                  rem          s6, sp, a4
                  ori          s5, a2, 723
                  fsgnjx.s     ft3, ft0, fs2
                  fle.s        zero, fs10, ft9
                  fsgnjn.s     fs2, ft10, ft3
                  fcvt.wu.s    s2, ft2
                  slli         zero, t5, 19
                  auipc        s5, 1006692
                  addi         a0, t2, 526
                  fclass.s     s0, fs6
                  fsgnjx.s     fs5, fa5, fa5
                  fsgnj.s      ft9, ft7, fs1
                  fclass.s     t1, ft6
                  slti         sp, a5, 1719
                  divu         zero, s8, s6
                  or           t3, gp, s8
                  fsgnjx.s     fs7, ft9, ft6
                  or           t6, a2, t6
                  addi         s10, a4, 1750
                  srai         tp, t3, 7
                  sll          s10, t1, t2
                  mulhsu       a7, s0, s4
                  sltiu        a3, t2, 976
                  sltu         a7, s2, s4
                  div          a7, s11, a4
                  fadd.s       fa3, ft6, fs3
                  fcvt.s.wu    fa3, s10, rdn
                  auipc        t4, 993048
                  mul          s2, s6, t6
                  rem          t3, a3, s8
                  fsgnj.s      fs10, fa3, fa0
                  fmv.w.x      ft9, s9
                  feq.s        t6, fs9, ft3
                  feq.s        a7, fa7, fa2
                  srl          s7, a4, tp
                  fmv.w.x      fs6, zero
                  lui          t1, 215623
                  fmin.s       fs7, ft10, fa2
                  slt          gp, ra, s5
                  xor          t6, a7, s6
                  srli         zero, s8, 14
                  srl          s10, tp, a0
                  sub          a0, s1, s10
                  srl          t4, s0, ra
                  xor          s6, a5, a6
                  sub          s1, a4, s11
                  flt.s        t4, ft11, fs2
                  slt          t0, s9, a4
                  fclass.s     t1, fa0
                  xori         s0, s4, -353
                  fsgnj.s      fs4, fa7, fs1
                  fsgnjn.s     fa1, fa0, fs8
                  xor          a6, s3, a2
                  sltiu        a4, a0, -1797
                  fcvt.wu.s    sp, fs7, rmm
                  mulhsu       s6, s1, t6
                  fcvt.s.wu    fs7, a3
                  and          a3, tp, s4
                  add          s7, gp, sp
                  srai         t2, s9, 6
                  sra          gp, sp, s8
                  nop
                  xor          a3, s1, t2
                  ori          a5, a6, 1719
                  divu         s9, a3, s8
                  srai         s1, s4, 13
                  fcvt.s.wu    fs7, s3
                  andi         t1, zero, -1667
                  rem          s0, gp, s5
                  addi         t2, t0, 2027
                  addi         t1, s6, 1227
                  xor          a4, s5, t1
                  nop
                  fclass.s     s9, ft6
                  fcvt.s.wu    fs2, s3
                  slli         s1, s10, 7
                  and          t1, zero, t1
                  fcvt.s.w     fa5, t2
                  remu         t2, tp, s5
                  fcvt.w.s     s6, fs6, rdn
                  slt          a5, t2, t0
                  fclass.s     tp, ft8
                  srl          t4, t2, gp
                  andi         ra, a4, 135
                  mulh         s5, s0, s4
                  fadd.s       ft2, fa3, ft5, rne
                  mulhu        a0, s4, t5
                  sra          a5, t2, gp
                  slli         s10, t5, 11
                  slli         s0, t6, 10
                  andi         s1, s10, 286
                  fsub.s       fa7, ft6, fa4
                  fsub.s       ft10, fa2, fs3, rmm
                  remu         tp, s6, a3
                  fcvt.w.s     ra, ft2
                  fle.s        sp, fa3, fs1
                  fcvt.s.wu    fs3, s3, rup
                  fsub.s       ft8, fs11, fa5, rne
                  addi         a1, zero, -1065
                  auipc        ra, 230668
                  fmv.x.w      s8, fs4
                  sltiu        a5, t5, 1380
                  divu         sp, s0, zero
                  lui          s1, 454473
                  sll          t3, s0, t4
                  sll          s9, s2, ra
                  feq.s        ra, fs9, ft4
                  divu         s6, a6, s11
                  slti         gp, a6, -1097
                  fsgnjx.s     ft2, fs9, fa5
                  sub          t0, a4, t5
                  addi         s9, a6, -1870
                  sltiu        t6, s0, -299
                  add          a5, s0, t2
                  sltiu        s1, t1, 617
                  slti         s2, t4, 1323
                  fmax.s       fs10, fs8, fa1
                  mulh         a0, s10, s11
                  fcvt.w.s     t6, ft10
                  mulhu        s6, s1, a5
                  nop
                  feq.s        gp, ft0, fa6
                  slli         a7, ra, 22
                  slli         t2, ra, 27
                  fmv.x.w      gp, ft7
                  fmv.x.w      s9, fs9
                  sll          t6, a7, s2
                  remu         s6, t0, a4
                  slti         zero, s7, -495
                  fsub.s       fs9, fs9, fa7, rtz
                  sltu         s5, s3, a7
                  fmv.x.w      a1, ft2
                  fmax.s       ft4, ft10, ft5
                  addi         zero, a4, 12
                  feq.s        t1, fs8, fa7
                  mulhsu       a4, s0, gp
                  lui          t2, 952904
                  fcvt.wu.s    zero, fs10
                  div          s4, a3, a6
                  fsgnjx.s     ft2, ft2, ft8
                  mulhsu       s9, t2, tp
                  fcvt.s.wu    fa3, a0
                  sra          s0, gp, s10
                  or           a3, s3, zero
                  and          t0, a4, t2
                  andi         s10, t3, 478
                  mul          zero, ra, a0
                  fclass.s     s5, ft1
                  xori         tp, s1, 141
                  slli         t2, s6, 23
                  mulhu        a2, zero, s4
                  lui          a5, 339751
                  addi         a4, a7, -1500
                  sra          t2, a1, a4
                  mulhu        tp, t4, a2
                  flt.s        s8, fs3, ft10
                  fmv.x.w      s9, ft10
                  auipc        s9, 53190
                  feq.s        ra, fs1, ft7
                  fsgnj.s      fa1, ft0, ft0
                  mulhu        s2, t1, t3
                  mulhu        s0, s11, gp
                  div          s7, tp, t6
                  nop
                  addi         zero, t3, 1350
                  mul          t2, s2, a5
                  slti         t1, a1, 1667
                  fcvt.s.w     ft5, s7, rtz
                  slti         ra, s1, -1334
                  fsgnjx.s     fs7, fa7, ft3
                  srl          s7, s0, s10
                  div          s7, a4, t4
                  addi         s8, tp, 93
                  flt.s        a1, fs10, fs10
                  sra          t3, tp, s4
                  fcvt.wu.s    s8, fs3
                  fsub.s       ft4, ft5, fs1
                  flt.s        s2, ft2, fs11
                  flt.s        s9, fa4, ft7
                  nop
                  srl          a3, s11, t6
                  slti         a7, a3, 1201
                  mul          t1, s7, sp
                  or           t3, s3, ra
                  fmv.w.x      fs3, a2
                  fsgnj.s      fs7, ft5, fa7
                  fclass.s     zero, fa6
                  addi         t1, s10, -330
                  sub          sp, s0, t5
                  slti         t2, s5, 1291
                  fle.s        s5, ft8, ft7
                  fsub.s       fa4, ft11, fa1, rdn
                  lui          s2, 30838
                  slti         t1, s5, -396
                  fmax.s       fs11, fs2, fa6
                  srli         a0, t3, 14
                  fmin.s       ft3, ft0, fs6
                  fadd.s       ft11, fs7, ft1, rtz
                  and          a7, t3, s2
                  slti         t2, s3, 1263
                  sltiu        ra, s8, -273
                  srli         s7, a2, 17
                  slli         ra, t0, 7
                  nop
                  fle.s        t0, ft5, ft10
                  ori          s6, t5, -1317
                  divu         a2, s2, s10
                  fsgnjn.s     fs4, fa7, fs5
                  mulhsu       tp, a3, s5
                  mul          s4, s3, sp
                  fmv.x.w      t0, fa1
                  sll          a5, a4, a4
                  and          a0, t2, s3
                  ori          s8, a2, -1882
                  feq.s        s0, ft4, fa1
                  mul          s9, s8, s0
                  rem          s8, a2, zero
                  divu         tp, a4, s6
                  mulh         tp, a3, a3
                  fsgnjn.s     fs11, fa6, ft8
                  fadd.s       fa5, fs4, ft9
                  fadd.s       ft6, ft10, fs3
                  fsub.s       ft0, ft10, ft6
                  fadd.s       fa1, fs1, fa4
                  sltiu        s6, a0, 2029
                  ori          a2, t3, -1402
                  remu         a5, a6, t4
                  ori          s9, tp, -1077
                  slti         t3, s11, 1892
                  addi         s6, zero, -284
                  xori         s10, s8, 739
                  xor          a4, a3, t2
                  auipc        s1, 1055
                  sltu         t3, tp, t6
                  fcvt.wu.s    t0, ft7
                  feq.s        t6, fs2, fa5
                  and          t1, t3, t4
                  and          s5, a7, ra
                  ori          zero, ra, -1128
                  sltiu        sp, s10, -133
                  andi         s6, a4, -1452
                  sltiu        tp, s4, 10
                  fsgnjn.s     ft5, fs6, ft4
                  fsgnjx.s     fs2, fa4, fa3
                  slti         s5, s6, -161
                  fadd.s       fa0, fs7, fa5
                  remu         s6, s10, t3
                  or           tp, t2, tp
                  slli         t1, a2, 30
                  fclass.s     s5, fs7
                  auipc        tp, 222642
                  fadd.s       ft9, ft4, ft9, rtz
                  remu         a6, s5, a2
                  xori         t6, t2, -524
                  fmv.w.x      fs5, s4
                  mulhu        s0, s11, a4
                  flt.s        sp, fs5, ft5
                  mulh         a5, s7, t2
                  slli         a2, a2, 19
                  rem          t2, a6, s0
                  fsub.s       fs4, ft5, fa7, rdn
                  slti         t6, s6, -872
                  mulhsu       s10, s4, t4
                  fmv.x.w      t2, ft1
                  auipc        a0, 140947
                  auipc        t0, 649350
                  slti         zero, tp, -1321
                  ori          a6, a2, -1545
                  feq.s        a1, fs6, fs7
                  flt.s        a0, fs4, fs10
                  fcvt.w.s     t2, fa1, rne
                  srli         a7, s2, 12
                  sltu         sp, s4, a1
                  sra          a5, t4, s9
                  fsgnj.s      fs4, fa4, fs5
                  sltiu        t6, s11, 837
                  fsgnj.s      fs11, fa7, fa0
                  ori          s8, s3, -96
                  mul          s0, a3, a2
                  fsub.s       fs5, ft5, fs2, rup
                  divu         t3, zero, zero
                  srli         s9, a4, 6
                  fmin.s       ft6, ft4, fa7
                  mulhu        a2, a1, s6
                  divu         a4, s6, s6
                  fcvt.wu.s    ra, fs1
                  div          s8, t4, a0
                  srli         a7, s0, 1
                  div          a6, a1, t5
                  srli         a1, t6, 24
                  lui          t2, 241764
                  mulhu        t3, s2, s5
                  fcvt.s.wu    fs5, s3, rdn
                  xori         s0, a3, 1339
                  div          s5, s8, t6
                  srai         t4, s9, 3
                  fsgnj.s      ft11, ft4, fa4
                  rem          a2, tp, s11
                  div          a1, s5, a5
                  flt.s        gp, fs2, fa3
                  mulh         sp, s4, a0
                  ori          s8, a2, 1107
                  fmin.s       ft10, fs4, fs7
                  div          a2, t5, a6
                  sra          s6, t1, a6
                  srli         ra, s8, 3
                  mul          t0, s11, t4
                  sub          s2, s2, s6
                  sltu         t0, s9, a5
                  fmv.x.w      t3, fs4
                  fclass.s     t3, fa2
                  add          t4, a2, s9
                  sub          t1, a1, s5
                  and          s0, ra, a2
                  slti         s7, s6, 2026
                  auipc        a1, 151612
                  xori         s1, s4, -1194
                  feq.s        s7, fs7, fs1
                  mul          t2, a6, sp
                  nop
                  fcvt.s.wu    ft11, a1, rdn
                  divu         gp, ra, s9
                  fmax.s       fs8, fs9, fa2
                  mulh         zero, s1, a0
                  fmv.w.x      fa1, tp
                  andi         s4, tp, 563
                  mulhu        a5, a5, s6
                  auipc        a6, 673609
                  rem          s8, tp, s11
                  sll          a4, s11, s0
                  add          s5, a1, a3
                  fsgnj.s      ft4, ft2, fs6
                  auipc        t2, 257378
                  and          tp, s10, s1
                  feq.s        a4, ft5, fs7
                  lui          tp, 621960
                  feq.s        a2, fs1, ft2
                  fmv.w.x      fs1, s0
                  fcvt.s.w     fs2, t0
                  lui          s8, 48785
                  mul          gp, s0, s4
                  srl          s2, t1, a1
                  slti         t6, s0, 1665
                  flt.s        s7, fa6, ft1
                  fmv.x.w      gp, fs1
                  slt          s7, t4, s0
                  fsgnj.s      fs2, ft4, fa5
                  fcvt.s.w     fs0, t1
                  and          s0, s2, a0
                  fsgnjx.s     fa7, fa6, fs7
                  slt          a0, a3, t6
                  fsgnjx.s     fa7, ft11, fs6
                  lui          t1, 440761
                  fsub.s       fa2, fs2, fs8
                  srl          s4, a1, tp
                  fsgnjx.s     ft0, fs0, ft5
                  sub          a1, s2, t0
                  slti         s8, sp, -1956
                  and          s4, a0, t5
                  ori          t1, s6, -1288
                  divu         t1, sp, sp
                  sltu         a2, t5, s1
                  fclass.s     s7, fs8
                  fsgnjn.s     ft7, ft11, fs8
                  sltiu        s7, a4, -1585
                  addi         s9, sp, -130
                  addi         s6, s0, -1078
                  nop
                  fsub.s       fa1, fs10, ft0, rne
                  mul          ra, a1, a3
                  fcvt.wu.s    s10, ft4
                  xor          a7, t2, s8
                  fcvt.s.wu    fa2, a1
                  fadd.s       fs9, ft3, fs1
                  fmax.s       ft9, fs2, fs1
                  sub          t0, s0, tp
                  flt.s        zero, fa5, fs3
                  slti         t3, s0, -1716
                  div          t0, t0, s0
                  xori         a5, ra, 1029
                  fsgnjn.s     fs9, fs7, fs8
                  nop
                  ori          s6, a3, 837
                  sra          a1, a1, a5
                  nop
                  lui          s4, 884727
                  mulhsu       a7, sp, t4
                  slt          t6, a4, s2
                  addi         zero, t1, 800
                  xor          a1, t4, t6
                  and          a6, t6, sp
                  srai         t1, a7, 3
                  sra          tp, ra, s11
                  fsgnj.s      fs7, fa2, ft10
                  fmv.w.x      ft3, s3
                  mul          a4, s9, s3
                  or           t4, t1, t3
                  fcvt.s.w     ft5, s2, rmm
                  fclass.s     s8, fs10
                  feq.s        t0, ft8, ft4
                  mulh         a5, ra, s8
                  srai         s9, sp, 30
                  sltu         ra, s11, a0
                  fcvt.wu.s    t6, ft11, rmm
                  and          a2, s10, a0
                  lui          tp, 502739
                  addi         s5, t4, 1103
                  fsgnjn.s     ft1, ft5, ft3
                  nop
                  fmin.s       fa1, ft1, fs2
                  slli         s9, a1, 24
                  sltiu        zero, t1, 51
                  mulhu        tp, s0, a5
                  fmv.w.x      ft10, sp
                  fmv.w.x      fa3, s6
                  auipc        s6, 181241
                  mulh         s6, s4, s1
                  srl          a1, s8, a3
                  fclass.s     s1, fs5
                  fsgnjx.s     fs8, ft3, ft9
                  srli         ra, a1, 3
                  ori          a6, a3, 1660
                  slli         a4, a2, 3
                  fcvt.s.w     fs1, a3, rne
                  fcvt.s.wu    ft2, a7
                  sltiu        s10, a4, -127
                  sub          s6, s10, a5
                  mul          s5, t1, a3
                  fadd.s       fs11, fa6, fs8
                  sltu         a2, s2, s3
                  fsub.s       fa0, fa2, fs1, rdn
                  sub          a0, a1, s11
                  and          s8, s1, a0
                  fclass.s     a1, ft9
                  slli         s7, sp, 16
                  mulhu        s7, a2, s1
                  fmax.s       fa5, fs10, ft11
                  feq.s        s10, fs10, fs5
                  slti         a6, t3, -553
                  or           t3, sp, s11
                  slt          a4, s0, t3
                  slt          s5, a1, ra
                  xor          t1, a6, a7
                  ori          t4, tp, 1583
                  mulhu        a4, a2, t4
                  fcvt.wu.s    a1, fa7
                  srli         t3, s9, 29
                  rem          s5, s11, s8
                  fcvt.wu.s    s0, ft6
                  fcvt.s.w     ft5, ra, rtz
                  mulhu        a2, s0, a1
                  rem          a0, a0, s6
                  feq.s        a3, ft8, fs1
                  div          a0, a6, a3
                  slti         a4, a4, 980
                  or           s4, s9, s10
                  fmv.w.x      fa4, s8
                  mul          t1, a1, a6
                  sltiu        s5, s0, 226
                  srli         ra, s5, 15
                  rem          t0, a5, t4
                  xor          a2, s2, s9
                  remu         gp, s6, a0
                  srli         tp, a2, 29
                  fmin.s       fs2, fs3, fs10
                  mulh         zero, a5, sp
                  fle.s        s9, fs11, fs11
                  fcvt.s.wu    fa1, s6
                  fsgnj.s      fs3, ft11, fs4
                  or           t1, t5, s10
                  and          a6, t2, a4
                  divu         a7, s6, zero
                  mulh         sp, t3, t4
                  srai         zero, a6, 26
                  srai         s7, s0, 19
                  mul          t1, a4, a5
                  fclass.s     t4, fa1
                  mul          a1, s9, sp
                  sra          s4, gp, s8
                  flt.s        a1, ft9, fa1
                  fadd.s       fs1, ft2, fa3, rup
                  fsub.s       fa3, fa5, ft4, rmm
                  mulh         s10, a2, t4
                  remu         ra, a5, s2
                  andi         s7, s11, 54
                  or           s4, s11, t2
                  and          zero, t1, s0
                  sub          s2, sp, s4
                  or           a3, a5, t6
                  andi         t4, t2, 1298
                  slti         t4, s8, 1812
                  sltu         t6, a3, s3
                  srai         t2, s11, 22
                  xor          t4, s6, s5
                  andi         t1, t1, 1953
                  flt.s        s5, fs9, fs8
                  slti         a1, a3, -394
                  fadd.s       ft1, fa5, fa6
                  fsgnjx.s     fa7, ft3, ft0
                  slt          a0, zero, ra
                  fmax.s       ft2, ft1, fa6
                  divu         s9, t3, s7
                  addi         a1, a3, -889
                  flt.s        a2, ft5, fa4
                  fcvt.wu.s    s4, ft10, rdn
                  fadd.s       ft8, fa6, ft7
                  mul          t1, t1, a3
                  rem          zero, a2, t5
                  mulhu        a4, t5, s3
                  sra          s4, s0, t2
                  fsgnjn.s     ft11, ft9, fa4
                  sub          a6, t0, a1
                  remu         s4, ra, s6
                  mul          s9, a3, s2
                  mul          a2, s11, s2
                  and          a5, a7, a7
                  mulhu        s8, a3, gp
                  rem          sp, zero, s5
                  auipc        ra, 729161
                  or           a5, a4, gp
                  mul          s6, t5, t5
                  fsgnjx.s     fa7, fs9, fs5
                  sltiu        ra, s3, -1242
                  fadd.s       ft3, fa2, ft3, rdn
                  sub          a1, s3, zero
                  or           zero, s6, gp
                  slti         a1, t2, 1462
                  fcvt.wu.s    ra, fs6, rup
                  fle.s        s0, ft1, fs2
                  mulh         s7, t1, t2
                  xor          a2, s10, zero
                  fmin.s       fa7, fs7, ft4
                  andi         s0, a5, 983
                  sll          s8, t4, a1
                  fcvt.w.s     a3, fa7, rmm
                  mulhsu       ra, s3, s0
                  fle.s        a2, fs3, fa4
                  fsgnjn.s     ft4, ft4, fa0
                  fcvt.wu.s    t3, fs10, rne
                  fmv.w.x      ft3, s7
                  slt          a5, a7, t2
                  add          t4, s6, t6
                  fclass.s     a2, ft6
                  lui          tp, 59823
                  rem          a2, a6, s5
                  mulhu        s4, t5, s8
                  lui          t1, 597929
                  feq.s        s8, ft9, fs2
                  fcvt.s.wu    fa0, s7, rne
                  and          ra, s7, a0
                  flt.s        t3, fa3, fa5
                  add          s7, s0, s9
                  auipc        t2, 830248
                  divu         s9, t1, s0
                  or           s8, gp, s1
                  sub          s1, s11, zero
                  fadd.s       fs8, fs8, fs9
                  auipc        a1, 603550
                  sub          a0, t2, zero
                  srl          sp, a4, a5
                  add          a5, a5, t6
                  divu         ra, t2, s0
                  rem          s5, sp, s4
                  fsub.s       fa3, fs1, ft2, rmm
                  feq.s        sp, fs1, fa1
                  addi         a1, s7, -828
                  fmax.s       ft6, ft4, fa5
                  mulh         s9, t4, t2
                  auipc        a5, 906252
                  fcvt.s.w     fa2, ra, rne
                  sll          a3, a5, a5
                  nop
                  mulhu        s6, s11, a2
                  sltiu        t6, tp, -767
                  mulhsu       s6, a4, s5
                  fcvt.s.wu    fs3, s2, rtz
                  auipc        t0, 49595
                  slt          s1, a6, s7
                  rem          tp, s8, s2
                  mul          a0, t2, a6
                  slli         s1, s2, 10
                  srli         a6, s6, 0
                  fclass.s     a1, fs1
                  mul          s4, tp, a1
                  andi         s6, a4, -619
                  addi         tp, zero, -1238
                  fsgnjx.s     ft3, fs10, ft7
                  mulhu        s5, gp, a6
                  srl          s2, gp, t6
                  fmax.s       fa2, fa4, ft3
                  ori          s8, t3, 1298
                  fsgnj.s      fs1, ft9, ft11
                  fle.s        s9, fs2, fa4
                  feq.s        s10, ft7, ft1
                  slli         a4, s4, 15
                  mulhsu       a3, tp, s5
                  divu         s4, t0, s2
                  lui          a1, 670900
                  flt.s        s2, fs2, ft6
                  srl          s9, s2, t3
                  fcvt.wu.s    a1, fs3, rdn
                  xori         s8, a5, 1138
                  nop
                  feq.s        a3, fs8, fa3
                  rem          t2, s11, tp
                  flt.s        a1, ft5, ft5
                  fmax.s       fa1, fs11, ft2
                  fle.s        s5, ft10, fa4
                  addi         t2, a6, 1343
                  fcvt.s.wu    fs11, a0, rtz
                  fsub.s       ft9, fa0, ft7, rmm
                  sltu         s1, s6, t4
                  fmax.s       fa2, fs10, ft3
                  slt          a3, zero, sp
                  and          s0, s9, t4
                  or           s10, t6, a7
                  sltiu        t0, a6, -1348
                  remu         gp, t0, s8
                  fcvt.w.s     t4, fs7, rne
                  slti         t0, a0, 946
                  fsgnjx.s     ft7, fs4, ft5
                  fmin.s       fs2, ft9, fs4
                  fcvt.w.s     sp, fs5
                  fmax.s       ft2, fs9, fs5
                  srli         t3, a7, 22
                  slli         s0, tp, 5
                  fmv.w.x      ft10, gp
                  add          t3, a4, a1
                  and          t3, t3, gp
                  or           t4, t3, t5
                  sll          a2, a0, gp
                  srli         s7, t1, 14
                  addi         zero, s7, -48
                  feq.s        a7, ft4, fs1
                  fclass.s     t0, ft1
                  rem          s10, zero, zero
                  feq.s        tp, fs11, fs0
                  andi         a3, sp, 344
                  fmv.x.w      t3, fs8
                  fcvt.w.s     s2, ft7, rne
                  fmax.s       fa3, ft8, fs11
                  fmv.w.x      fs1, gp
                  add          t2, s0, s8
                  remu         a2, gp, t4
                  slli         t6, a6, 15
                  sltiu        s4, a3, -1455
                  auipc        s4, 987591
                  add          sp, t2, tp
                  fsgnjx.s     fs3, fs4, fs2
                  fsub.s       fs2, fs3, ft2
                  addi         s1, tp, -565
                  auipc        a3, 346826
                  fcvt.wu.s    t3, ft9, rdn
                  fsgnjn.s     ft2, ft0, ft1
                  div          s8, a6, s2
                  mul          s10, gp, s10
                  divu         t3, a6, t6
                  fcvt.wu.s    s10, fs1
                  mul          s6, a2, t2
                  feq.s        s7, ft3, ft0
                  and          s9, t0, zero
                  fmv.w.x      ft8, t1
                  sltiu        a5, s10, 1037
                  and          gp, a0, s4
                  ori          s1, a4, 1161
                  sra          s4, s4, a1
                  srli         a7, s0, 6
                  fclass.s     s7, ft3
                  fmv.x.w      sp, ft9
                  remu         ra, a5, a3
                  srl          gp, a2, gp
                  srai         gp, tp, 0
                  sra          ra, t6, a2
                  feq.s        a7, fa2, fa0
                  nop
                  fcvt.s.wu    fs10, zero
                  xori         a2, tp, -1239
                  fsgnj.s      ft4, fa1, fs5
                  srli         s10, t1, 2
                  fmin.s       ft2, fs3, fs2
                  sltiu        a1, s5, 19
                  slli         a7, a5, 30
                  sltiu        t2, s10, -1567
                  sltiu        a0, sp, 70
                  fmin.s       ft9, fa6, fs5
                  fcvt.s.wu    ft6, t0
                  andi         t0, t4, -2013
                  fmin.s       ft5, fs10, fa6
                  xori         sp, s1, 2033
                  addi         s9, s6, -1766
                  remu         a6, s5, s1
                  andi         s9, s4, -1268
                  mulh         t1, s10, t5
                  lui          zero, 798793
                  divu         t1, s3, s9
                  nop
                  fcvt.s.w     fs4, a7
                  xori         s9, a3, 905
                  xor          a3, s10, s4
                  mulh         a5, a7, a7
                  mulh         t6, s1, a3
                  srai         a3, t2, 4
                  srai         t1, s1, 26
                  fsgnj.s      fs4, fs7, fs6
                  nop
                  rem          zero, s1, s4
                  fmv.x.w      t6, fs0
                  fsgnjx.s     ft11, ft0, fs1
                  fcvt.w.s     a6, fa2
                  addi         t6, t4, -364
                  fmv.x.w      s10, fs7
                  lui          a4, 298432
                  slt          a7, s4, t4
                  slt          t2, s7, s11
                  sra          a0, s4, a0
                  divu         s2, s1, s1
                  fclass.s     t1, fs4
                  sltiu        s0, a7, -1448
                  andi         tp, s2, -205
                  fle.s        s7, ft7, ft3
                  rem          a3, ra, s0
                  and          a1, s11, s3
                  div          gp, s6, s5
                  ori          s2, t2, 1449
                  mulh         a4, s3, s6
                  ori          t4, zero, -233
                  auipc        s9, 451942
                  fcvt.s.wu    ft5, s4
                  and          t0, t4, gp
                  xor          gp, ra, s9
                  sltiu        a7, gp, -1145
                  mulhsu       s6, a4, s6
                  nop
                  rem          t0, sp, s7
                  and          s4, zero, t4
                  and          gp, s10, tp
                  feq.s        a4, ft7, fa6
                  feq.s        tp, ft6, ft10
                  slt          s9, s5, s9
                  sll          a3, a3, s5
                  slli         ra, a2, 7
                  fsgnjx.s     fs6, ft10, ft8
                  fclass.s     t1, fs1
                  fle.s        t4, fa6, ft8
                  fmin.s       ft0, fs0, ft7
                  lui          s1, 693212
                  andi         t1, s3, 1436
                  srai         s0, a2, 13
                  fclass.s     s5, ft7
                  mulhsu       s1, s9, a6
                  divu         s7, t6, a4
                  or           t3, t1, s8
                  fsgnjx.s     fs11, fs5, ft10
                  fmax.s       fa1, ft7, fa2
                  nop
                  fsgnj.s      ft5, fs5, fa1
                  addi         t0, t1, 1930
                  sltu         t2, t5, t1
                  mulhu        a5, zero, s8
                  slti         t3, a3, 1891
                  feq.s        a5, ft9, ft9
                  addi         ra, gp, -384
                  mulhu        tp, s4, zero
                  fcvt.s.wu    ft6, a1
                  fle.s        t6, ft7, fa6
                  slli         a7, s6, 26
                  fsgnj.s      ft7, fs6, fs9
                  slt          s1, gp, s0
                  ori          s2, s5, 499
                  mulhu        s0, s1, s5
                  auipc        a0, 250893
                  fcvt.w.s     gp, fs8, rne
                  srli         s4, a7, 6
                  mulhsu       s7, zero, s5
                  remu         t0, t6, tp
                  fsgnjx.s     ft7, ft8, fa3
                  remu         s1, s10, t2
                  srl          s7, a7, ra
                  xor          s0, a7, s3
                  or           t6, s0, a3
                  mulh         a4, t6, s6
                  sltu         s9, s6, s5
                  fle.s        t6, fa3, fs5
                  andi         s5, tp, 1064
                  mul          t1, s10, t5
                  fmin.s       fs5, ft5, fs3
                  fsgnjx.s     fs2, fa4, fs5
                  srl          s5, s10, a5
                  or           s1, t6, s9
                  fmin.s       ft8, ft3, fs7
                  sltiu        s0, s10, -981
                  sltiu        gp, gp, -1032
                  sltiu        a3, sp, 326
                  remu         s10, t6, gp
                  or           t0, t2, s4
                  sltiu        s6, a5, -1282
                  fcvt.wu.s    t1, fs2, rdn
                  sltu         a1, s6, s0
                  slti         t6, a4, -1562
                  auipc        a4, 364723
                  rem          s2, a1, a7
                  add          s7, a6, t2
                  fsub.s       fs4, ft4, fa7, rmm
                  fmv.w.x      fa2, s9
                  addi         s9, s2, -281
                  mulhu        a6, gp, t0
                  divu         a0, a2, s6
                  slli         t3, s2, 23
                  lui          s5, 797899
                  divu         a4, a4, s5
                  addi         t4, s4, 1335
                  andi         s10, s1, 988
                  sub          ra, s8, t1
                  srl          t0, a0, gp
                  srl          a2, s2, a6
                  auipc        t2, 648240
                  and          s10, a1, t4
                  fsub.s       fa3, fs10, fs3, rmm
                  fcvt.s.w     ft6, t0
                  srl          a7, a2, t6
                  mulhsu       s5, t2, s9
                  mulh         s2, s1, a4
                  feq.s        gp, fa6, ft0
                  sll          s9, a1, t1
                  slli         t2, s10, 7
                  srai         s6, sp, 27
                  xor          s8, a4, s8
                  mulhsu       a4, s6, a3
                  srai         a3, a2, 22
                  or           a2, s5, ra
                  fadd.s       fa4, fa5, ft9
                  slti         t0, t3, 11
                  divu         t1, s10, s5
                  fmv.x.w      a4, ft2
                  divu         a1, s10, t3
                  auipc        zero, 910090
                  addi         a6, t5, -1477
                  sll          s0, s1, t2
                  fcvt.s.wu    ft0, t6
                  sltiu        t6, t1, 1464
                  and          a0, a0, s8
                  fsgnjn.s     fs7, fa7, fa1
                  lui          s8, 904293
                  andi         t3, t4, 2030
                  fsgnj.s      fs8, fa4, ft1
                  sra          s4, a7, a3
                  srl          s4, s6, s11
                  flt.s        zero, ft2, ft8
                  fsub.s       ft0, fs6, fs7, rup
                  fsub.s       fa5, fs0, fa2
                  fmax.s       fa7, ft8, ft6
                  mulhsu       s10, t6, s2
                  lui          t0, 701649
                  lui          t2, 409884
                  fsub.s       ft4, fs10, fa4
                  fle.s        gp, fa3, ft5
                  addi         a7, zero, 849
                  slt          zero, a1, t3
                  divu         a0, t0, s9
                  mulhu        a7, sp, zero
                  fclass.s     s1, fa0
                  ori          a1, t6, -639
                  srl          a7, t5, t4
                  mul          a5, a6, a4
                  feq.s        a0, fa7, fs2
                  lui          a6, 341989
                  mulhsu       t3, t6, a2
                  xori         s2, s5, -693
                  srl          a1, t4, s1
                  fcvt.s.w     fs2, a6, rne
                  srai         s8, s2, 23
                  fcvt.s.wu    ft4, t3, rne
                  mulhsu       s10, t4, s1
                  sra          t0, tp, zero
                  nop
                  auipc        s8, 248328
                  fmin.s       ft1, fa7, ft4
                  and          a6, gp, s1
                  ori          gp, s3, -1618
                  sub          ra, a3, a4
                  add          a1, t3, t2
                  mulhu        a2, ra, t3
                  mulh         s4, t0, s6
                  add          s4, tp, t6
                  fsgnj.s      ft7, ft7, fa7
                  fadd.s       fs4, fs6, fs2
                  sra          t4, s7, s11
                  mulhsu       t3, a1, a3
                  fmin.s       ft2, fa5, fa5
                  rem          a0, a3, a4
                  andi         a7, t0, -1466
                  feq.s        s4, ft5, fa4
                  fmv.x.w      a1, fa1
                  xor          s6, s8, a5
                  andi         tp, a4, 1665
                  fle.s        tp, fs10, fs1
                  divu         t0, s0, a7
                  and          s7, a0, tp
                  fmax.s       fa2, fa0, ft5
                  mulhsu       ra, s0, t2
                  flt.s        s9, fs5, ft4
                  mul          a5, a3, t5
                  or           a2, s10, s11
                  or           s1, t5, t5
                  sra          a2, a4, s11
                  sltu         t0, a1, sp
                  fsgnjn.s     fs0, fs4, ft10
                  nop
                  fsgnjx.s     fa4, ft2, fs8
                  fmin.s       ft3, ft10, fs3
                  lui          t0, 450930
                  fsgnj.s      fa7, ft8, fa2
                  fle.s        s6, ft6, fa1
                  fcvt.wu.s    s1, fs11
                  feq.s        a1, fs11, ft0
                  fmax.s       fa6, fs10, fa7
                  fcvt.s.w     ft10, tp
                  xor          t1, s10, zero
                  srai         a3, t0, 22
                  ori          t4, s5, 1828
                  fsgnjx.s     ft0, fs11, fs2
                  fmin.s       fs3, fs8, fs11
                  lui          a1, 168965
                  fcvt.wu.s    a2, fs0
                  xor          ra, s6, s11
                  srl          a0, s5, a7
                  ori          a0, gp, 293
                  sra          a3, ra, s10
                  srli         sp, s6, 10
                  nop
                  fcvt.w.s     s8, fa5, rne
                  slti         s4, s1, 984
                  feq.s        s10, fa3, fa4
                  fle.s        a5, ft8, fs11
                  fle.s        s8, fa4, ft5
                  fle.s        t4, fs7, fs2
                  srai         s5, s3, 23
                  auipc        a0, 339844
                  rem          a2, tp, s11
                  fsgnjx.s     fa2, ft1, fs2
                  mulhsu       s9, a1, s6
                  fsub.s       fa2, ft10, fa4, rne
                  fcvt.wu.s    s6, fs8
                  remu         s10, sp, t5
                  mulhu        s8, a2, s2
                  or           s1, a2, a5
                  slli         s7, s1, 5
                  fcvt.s.w     fa6, t5
                  sra          s5, a1, s5
                  or           a1, t3, t5
                  fmv.w.x      fs6, s9
                  ori          t4, s10, -1302
                  rem          a2, a4, a0
                  auipc        tp, 778075
                  andi         a6, s10, -1774
                  fsgnjn.s     ft0, fs6, fs5
                  mulh         s4, a6, t3
                  fclass.s     t0, ft0
                  slli         s0, a7, 23
                  ori          s6, s10, -69
                  slti         s2, s0, 1532
                  or           s9, s9, zero
                  fsgnjx.s     fs1, ft5, fs4
                  xor          s0, s6, s4
                  srai         zero, s7, 23
                  fcvt.s.wu    fs2, s8
                  fclass.s     a2, fa2
                  fsgnjx.s     fs2, fs4, fa4
                  fle.s        gp, fs6, fa3
                  divu         a7, a0, t5
                  fcvt.w.s     a5, ft4
                  nop
                  feq.s        s7, ft10, fa6
                  sra          a5, zero, s1
                  divu         s10, s2, sp
                  xori         zero, s5, -744
                  srl          s0, a5, s9
                  slli         s6, a1, 28
                  srl          t0, t5, s9
                  flt.s        s1, fa1, fa4
                  sll          a6, s10, ra
                  rem          s7, a1, a5
                  remu         s4, a6, a5
                  fsub.s       ft5, fs8, fa1, rtz
                  xor          t2, a4, a0
                  fle.s        t4, ft11, ft1
                  feq.s        tp, fa0, fs9
                  fclass.s     a2, fs1
                  fmv.w.x      fs1, s4
                  slti         s9, s8, -475
                  add          a3, s0, s1
                  slt          s0, a1, a0
                  fcvt.s.w     fs4, s4
                  slti         t1, a7, -1197
                  nop
                  fsub.s       fs4, fs11, ft5, rtz
                  flt.s        gp, fa5, fs10
                  sra          s0, s5, t0
                  ori          a3, t1, 30
                  div          a3, t5, a3
                  mulhsu       ra, s9, s4
                  slti         a2, t2, 1301
                  fcvt.s.wu    fs2, s10
                  fsgnjx.s     ft2, ft2, fs0
                  fmv.x.w      t6, fs7
                  fmv.w.x      ft9, s7
                  fcvt.s.wu    fs11, s4
                  fsgnjx.s     fs4, fs3, fs8
                  remu         s8, s0, a3
                  div          t6, s4, t0
                  fmax.s       fa6, fs9, fs3
                  slt          s4, s4, a1
                  feq.s        t6, ft8, ft10
                  remu         s2, zero, a0
                  fle.s        s5, ft6, fs2
                  add          a6, s5, t3
                  sra          sp, a3, s11
                  fclass.s     s1, fs2
                  srli         a2, t3, 17
                  lui          sp, 1032597
                  xori         t2, a5, -392
                  fcvt.s.w     ft9, t3, rdn
                  fadd.s       ft10, ft7, fs9
                  sltu         s4, s2, gp
                  fcvt.s.wu    fa7, t2
                  feq.s        t1, ft11, fa0
                  fmax.s       fs11, ft2, fa3
                  mulh         a1, t2, gp
                  fsub.s       ft0, ft2, ft6
                  mulh         a4, s3, t0
                  feq.s        s2, ft0, fa4
                  fcvt.s.wu    fs7, a6
                  fcvt.s.w     ft8, a0
                  sra          zero, tp, s6
                  fmv.x.w      zero, ft4
                  remu         ra, t0, s7
                  slti         s8, s9, 528
                  div          tp, s9, s9
                  fsgnjn.s     fa0, fs2, fs4
                  slt          a3, t4, s9
                  slli         s2, s3, 25
                  sltiu        t0, ra, -522
                  div          s10, s0, t2
                  slt          s1, s4, t1
                  fsgnjn.s     fs2, ft1, ft2
                  fmv.x.w      s7, fa1
                  fclass.s     t1, fs1
                  sltu         s2, t3, s1
                  fmv.w.x      fs7, tp
                  xor          a1, a3, t0
                  fcvt.w.s     a2, fa0, rmm
                  add          t6, t2, a6
                  remu         s7, a2, t1
                  or           a0, s6, a6
                  feq.s        ra, fa6, ft4
                  fmv.x.w      s10, fs7
                  fcvt.s.w     fs3, sp, rup
                  sltiu        s5, tp, -54
                  addi         a3, sp, 842
                  ori          a7, a0, 539
                  fcvt.w.s     gp, fa5, rtz
                  sltiu        a1, t0, 1345
                  fcvt.s.w     ft0, s2, rne
                  sltiu        t1, s9, 1941
                  xor          s4, s11, t1
                  lui          s5, 575278
                  srl          gp, s3, t6
                  andi         t3, t3, 203
                  fmin.s       fs1, fs11, fa5
                  xor          a4, s11, s4
                  auipc        a0, 638114
                  mulhu        a3, s0, zero
                  div          t3, s4, s4
                  fcvt.w.s     s5, fs3, rtz
                  divu         s1, a4, s10
                  fsgnjx.s     fs11, fa5, fa0
                  sra          a5, a2, s4
                  fmin.s       fs6, fs5, ft5
                  fmv.x.w      t1, fs4
                  or           a2, a7, s4
                  slt          t3, gp, t6
                  fsgnjn.s     fs7, ft1, fs1
                  slt          t0, ra, a1
                  and          a4, t4, s6
                  or           tp, s8, s9
                  xor          s5, t3, t5
                  sltu         t4, ra, s7
                  fsgnjn.s     fs6, fa1, ft2
                  or           gp, s1, t3
                  mulhu        s6, zero, s7
                  fsgnj.s      fa7, ft7, fs6
                  slli         s5, a3, 15
                  xor          a6, t6, zero
                  fclass.s     t0, ft4
                  xori         s1, t2, -259
                  fadd.s       ft2, ft5, fa1, rdn
                  andi         t2, s5, 1847
                  rem          s0, s3, a6
                  or           a0, s2, t6
                  sll          t4, t6, s6
                  sub          a7, s10, a3
                  add          zero, t0, a3
                  fsgnjx.s     ft6, fs8, ft1
                  fmax.s       fs2, ft1, ft5
                  feq.s        t0, fa0, ft2
                  mulhu        zero, s4, ra
                  feq.s        a3, ft0, ft2
                  andi         s10, a2, -301
                  mul          a6, t4, a1
                  sltu         s2, zero, s6
                  fmv.w.x      fa5, ra
                  sll          gp, sp, a5
                  sra          a5, t0, s6
                  div          gp, a5, gp
                  xori         a0, zero, 625
                  fmv.w.x      fs3, s5
                  add          a7, a3, a1
                  rem          t3, t4, s8
                  addi         a6, s5, -1716
                  feq.s        t3, fa0, ft6
                  sltiu        t0, s2, 558
                  fmin.s       fs8, fa1, ft4
                  and          s7, t0, t1
                  fcvt.w.s     s4, fs7
                  auipc        s9, 386352
                  fmin.s       ft10, fs3, fs10
                  srai         s5, s4, 14
                  srl          t4, s8, s9
                  fsgnj.s      fs2, fs1, ft10
                  feq.s        ra, fs6, ft1
                  auipc        s6, 878031
                  remu         a4, a1, s2
                  fmv.x.w      gp, fs5
                  srli         t2, a1, 31
                  srli         s2, t1, 15
                  addi         a4, ra, -1501
                  auipc        s2, 888932
                  rem          tp, gp, t2
                  mulhu        tp, s11, sp
                  fsgnj.s      fs11, ft1, ft4
                  fsgnjx.s     fs6, fs8, fs9
                  fadd.s       ft0, fs4, fs2, rmm
                  flt.s        t6, fs8, ft4
                  auipc        a4, 529487
                  fsgnjn.s     fs10, fs3, ft10
                  slli         zero, a3, 21
                  sra          a3, s11, t0
                  lui          a4, 999350
                  nop
                  mul          t0, t1, zero
                  flt.s        t4, fs2, fa5
                  srai         s1, t2, 31
                  rem          t1, t0, s3
                  addi         t2, a5, -1826
                  slti         a4, sp, -1929
                  sltiu        a6, zero, 1136
                  fcvt.wu.s    a4, fs11
                  slt          a4, s3, tp
                  fmv.w.x      fa3, s1
                  sub          a3, t0, s4
                  srl          a4, s8, a6
                  sltiu        s6, a6, -1385
                  remu         tp, s9, s3
                  fmv.w.x      fa3, s3
                  feq.s        s1, fs11, ft1
                  mulhu        sp, s3, a7
                  remu         a5, a0, t2
                  sub          a3, a2, gp
                  slli         sp, s0, 7
                  feq.s        a7, fa1, ft6
                  fmin.s       fa5, fa6, ft7
                  fsgnj.s      ft2, ft7, ft8
                  sub          a3, s2, a1
                  fmv.w.x      ft11, t1
                  srl          ra, t5, gp
                  nop
                  mul          s1, t4, s2
                  fmin.s       fa1, fs2, ft4
                  fmax.s       fa0, fa4, fs10
                  fmv.w.x      fa2, a4
                  fsub.s       fa4, fs11, ft11
                  fsgnjn.s     ft10, ft8, fs5
                  srli         a4, tp, 18
                  remu         s7, t5, s2
                  slti         tp, t2, -1752
                  ori          a5, t3, -708
                  sub          t2, t3, t5
                  mulh         a0, a4, a4
                  ori          a2, a5, -1085
                  mulh         a5, t1, s6
                  xor          zero, s5, s0
                  fadd.s       fa5, ft9, fs5, rup
                  fclass.s     t3, fs0
                  div          s6, s3, s9
                  lui          t6, 998197
                  mul          s6, t2, s9
                  lui          t0, 62021
                  divu         a3, t5, t6
                  flt.s        ra, ft0, ft1
                  srli         a5, a7, 15
                  divu         a6, a0, a6
                  feq.s        t0, fa5, ft9
                  fcvt.wu.s    a3, fs1, rdn
                  sll          s1, a7, t3
                  fle.s        ra, fs5, fa4
                  divu         a6, t1, a1
                  sltiu        s2, t6, -247
                  fcvt.s.w     ft7, s3, rdn
                  rem          a7, s3, s4
                  fmax.s       fs11, ft1, ft11
                  mulhsu       s2, a3, a2
                  fadd.s       fs5, fs7, fs8
                  slti         s4, a7, 736
                  rem          s0, zero, a5
                  fmax.s       fs4, fs4, fs1
                  sltiu        t2, s0, -622
                  sltiu        s10, t2, -76
                  add          s0, zero, t1
                  srli         s6, s5, 3
                  addi         t4, a2, 187
                  slti         s6, a1, -1923
                  sltu         t2, tp, tp
                  xor          ra, s3, a4
                  srai         t6, a2, 1
                  add          s8, ra, s1
                  sll          a3, t1, t3
                  sll          s0, s9, s7
                  fcvt.s.wu    fa4, t3, rtz
                  fmv.x.w      zero, ft4
                  divu         a3, a6, s3
                  flt.s        t6, ft6, fs10
                  fsgnjn.s     fs5, fs4, ft11
                  slt          t4, s4, t5
                  slti         a6, t6, 1108
                  sll          s9, zero, s11
                  sltu         s1, zero, a1
                  flt.s        t4, ft8, fs8
                  rem          a6, t1, a4
                  mul          zero, a1, s5
                  sub          zero, s1, s11
                  srai         s6, a7, 5
                  lui          s4, 992658
                  remu         s6, t6, s9
                  fmax.s       fs11, fa7, fa3
                  mulhu        a2, zero, s7
                  or           tp, s8, s3
                  sra          t0, s9, tp
                  fmin.s       ft9, fs9, fs3
                  nop
                  fmin.s       ft3, fa1, ft5
                  fle.s        s1, fs7, ft9
                  sltu         s10, t2, s10
                  srai         s8, a3, 20
                  fcvt.wu.s    s2, fs9
                  auipc        t2, 133374
                  addi         s1, sp, -2007
                  divu         s10, a6, t0
                  rem          s5, t4, s2
                  fclass.s     t1, fs9
                  and          t3, t2, s3
                  fsgnj.s      fa2, ft7, fs3
                  sub          a3, s10, a3
                  ori          a4, s1, -1508
                  fcvt.wu.s    s10, fs3
                  fmin.s       ft2, ft9, ft8
                  fmin.s       ft0, ft9, fa1
                  or           a4, s4, a4
                  xori         s9, s4, 1494
                  slti         a5, s6, 161
                  fcvt.w.s     ra, ft7, rdn
                  sra          a2, t5, sp
                  sub          sp, s8, a2
                  sra          gp, ra, a6
                  slti         s6, ra, -1667
                  sll          s6, t3, t3
                  ori          t1, a7, 780
                  fcvt.w.s     a5, ft2, rmm
                  remu         zero, t3, s0
                  sub          t0, t5, a6
                  ori          t1, a1, -888
                  fsgnjx.s     ft3, ft0, ft0
                  sub          a3, sp, s10
                  flt.s        a3, fs4, fa1
                  mulh         t2, s10, s2
                  and          s7, sp, s4
                  srli         s0, t4, 17
                  fcvt.s.wu    ft5, gp, rmm
                  fle.s        t2, fa6, fs11
                  fmv.x.w      sp, ft1
                  slt          s6, s11, t6
                  feq.s        t4, fa6, fa2
                  mulhu        s2, a3, ra
                  div          zero, a2, a0
                  sub          s7, a6, s7
                  auipc        s7, 179593
                  mulhsu       sp, s6, tp
                  fsgnjx.s     fa3, fs5, ft2
                  fadd.s       ft8, fs10, ft7, rne
                  and          zero, t3, a1
                  fcvt.s.w     fs2, a1
                  fmv.x.w      s10, fa1
                  fle.s        s4, fa0, fs5
                  fmv.w.x      fa6, t2
                  mulh         a1, t0, s9
                  fcvt.wu.s    t2, fs6, rmm
                  fsgnjx.s     fa5, ft3, ft6
                  slli         a7, a1, 30
                  fmin.s       fs11, fs1, ft8
                  fsgnjx.s     fa5, ft2, fs9
                  fsgnjx.s     ft3, fs5, fs8
                  srai         a3, gp, 24
                  mulh         a1, s2, gp
                  fcvt.w.s     a1, ft10, rup
                  and          s8, s10, a5
                  fle.s        zero, fs9, fa4
                  fcvt.w.s     s9, ft10
                  fclass.s     t4, fa4
                  fle.s        a4, ft9, fs6
                  remu         tp, a5, ra
                  srli         t0, a6, 15
                  or           gp, s4, t5
                  srl          a0, t2, gp
                  fcvt.s.w     fs1, s5, rtz
                  fclass.s     s7, ft7
                  fmv.w.x      fa3, a1
                  remu         a0, a3, s4
                  divu         a6, a2, a5
                  add          a1, s7, t2
                  fsub.s       fs5, fs5, fs5
                  sltu         t2, s10, t6
                  fadd.s       fa4, ft7, fs7, rtz
                  sra          s7, s1, s11
                  rem          t1, a7, t0
                  auipc        s0, 161880
                  fle.s        t2, fs8, ft5
                  srli         s1, t6, 24
                  sltiu        s10, t5, 1690
                  or           s8, a2, tp
                  srl          t4, s8, s6
                  fadd.s       fa0, ft5, fs1, rmm
                  ori          s9, a5, -1354
                  fclass.s     gp, ft4
                  fcvt.wu.s    a6, ft0
                  feq.s        tp, fs2, fs2
                  mulhsu       s10, s8, t2
                  fsgnjn.s     fs1, fa0, ft6
                  fmin.s       ft4, ft5, ft6
                  div          t3, t6, t0
                  slti         s4, s2, -134
                  fsub.s       fs9, fa0, fa5, rdn
                  auipc        s6, 385890
                  slti         t2, s2, 153
                  and          s8, s7, s0
                  add          s8, s5, s0
                  nop
                  srai         t4, a7, 27
                  rem          t2, t6, t2
                  fadd.s       fa5, fs3, fs7, rdn
                  fle.s        t0, fs5, fs1
                  nop
                  slti         s0, s1, -1426
                  fmv.w.x      fs6, a6
                  fadd.s       fs8, ft1, fs0, rup
                  ori          s0, s9, -1177
                  slli         zero, s1, 16
                  sll          t4, a6, a4
                  lui          s7, 281547
                  lui          t2, 47064
                  xori         t0, a7, 855
                  andi         t3, tp, 641
                  mul          t3, a3, t1
                  fmin.s       fs6, fs0, fs0
                  fmv.w.x      ft3, gp
                  and          s6, t5, s4
                  fle.s        s5, ft6, ft2
                  sltiu        a5, ra, 154
                  divu         a1, t2, s11
                  div          a5, a0, s8
                  nop
                  srai         tp, a0, 23
                  sll          t6, tp, ra
                  flt.s        t2, fa2, fs3
                  fle.s        s0, fa7, fs10
                  fcvt.s.wu    ft8, s9, rmm
                  fcvt.s.w     ft4, s2, rtz
                  divu         a3, a5, s7
                  add          t0, t2, ra
                  addi         a4, a1, 534
                  fmax.s       ft2, fs8, ft6
                  nop
                  sub          s4, s5, a6
                  andi         gp, t5, -220
                  fsgnj.s      ft2, ft1, fs9
                  slt          a6, t1, a4
                  and          a5, t5, s5
                  mulhu        a5, s8, a2
                  mulh         a7, s4, t5
                  nop
                  srl          sp, s3, t4
                  lui          s6, 931594
                  sra          s7, s10, s8
                  fmv.w.x      fa4, t2
                  sra          s7, s1, t2
                  srl          t2, s10, a4
                  ori          tp, t6, 597
                  fmin.s       fs7, fs5, fs5
                  fcvt.s.wu    fs2, a3, rdn
                  fcvt.s.wu    fs10, s11, rne
                  fcvt.s.w     ft5, s6
                  or           ra, t5, s11
                  fadd.s       fs2, ft8, fs3
                  slt          a2, s4, zero
                  fmv.x.w      t1, fs8
                  and          t3, t1, s6
                  divu         t4, ra, a0
                  andi         a4, t0, -216
                  mul          s1, t4, t4
                  fle.s        s8, fs4, fs11
                  feq.s        s0, ft11, fa1
                  sub          s10, t1, a2
                  ori          a3, t5, -1878
                  nop
                  sll          s8, sp, s7
                  addi         a7, s7, 1558
                  nop
                  fle.s        s9, ft8, ft6
                  mulhu        s6, s2, s1
                  remu         a0, s2, s2
                  div          s8, t5, a3
                  ori          a2, t0, 1057
                  nop
                  slt          s1, s5, s0
                  remu         a1, s3, t0
                  mulhsu       s7, s0, s6
                  mulhu        t6, t1, s7
                  sub          s2, t2, t4
                  fle.s        a7, ft4, ft10
                  xor          t2, t2, s7
                  sll          t6, s8, s4
                  and          a4, a7, s5
                  sltu         t1, a6, a0
                  sra          s4, s0, a0
                  auipc        sp, 98410
                  srl          s1, a2, a0
                  or           a2, tp, t1
                  mul          s10, a6, s7
                  mulhsu       t6, a6, s7
                  divu         zero, t1, s6
                  andi         ra, a3, -1518
                  lui          s6, 935808
                  fmv.x.w      gp, fa5
                  divu         sp, tp, a3
                  sltu         s9, t0, zero
                  flt.s        s9, ft9, ft4
                  fcvt.wu.s    t3, fs0
                  fsgnjn.s     ft4, ft9, fs8
                  slli         s0, zero, 30
                  divu         zero, t2, a0
                  flt.s        zero, fs5, fs5
                  fclass.s     s4, ft10
                  fsgnjx.s     fs3, fs10, fs1
                  fcvt.s.wu    fs7, tp
                  fsgnjx.s     fs2, fa1, fa6
                  and          a4, s0, s8
                  or           t1, t1, s2
                  auipc        a7, 459178
                  auipc        s4, 399620
                  mulh         t6, s9, a4
                  fsgnjn.s     fs7, fa2, ft9
                  srai         t1, s4, 29
                  remu         s2, a2, t1
                  slti         s7, s4, 69
                  fsgnjx.s     ft11, fa7, fa2
                  xor          s7, s2, s4
                  sltiu        t1, s7, -1244
                  fcvt.s.w     fs11, zero
                  sll          ra, a4, a4
                  fle.s        t1, ft7, ft4
                  fmax.s       fs6, ft5, fa7
                  xor          gp, s2, t4
                  and          t0, s3, gp
                  fsub.s       fs7, fa4, ft6, rmm
                  fsub.s       ft10, fs1, fs3
                  lui          a3, 60243
                  sub          a4, a1, a0
                  rem          gp, a6, s10
                  sltiu        gp, s0, -1716
                  feq.s        a0, fa0, fa5
                  fsgnjn.s     fs3, ft11, ft1
                  andi         a5, tp, -1635
                  or           s4, t3, a7
                  add          s1, t4, s4
                  mul          s9, t0, t3
                  sll          zero, s5, a6
                  or           t3, a1, zero
                  mulh         a1, s6, s9
                  slti         s10, t5, -1792
                  sltu         s4, s2, t5
                  and          s1, a0, a7
                  fcvt.s.w     fa2, a6, rdn
                  divu         gp, t5, a6
                  fcvt.s.wu    fa1, zero
                  xori         s7, t5, -504
                  fsgnjn.s     fa4, ft9, fs3
                  fcvt.w.s     sp, ft10
                  fclass.s     tp, fs7
                  slli         s5, s6, 18
                  addi         sp, s10, -1105
                  slt          a3, a6, a6
                  mulhu        s8, a3, a3
                  fclass.s     t1, ft9
                  div          s2, ra, s11
                  sub          s9, t5, a5
                  and          t1, tp, t4
                  rem          s7, a1, a5
                  lui          a5, 223499
                  ori          a7, s0, -733
                  mulhsu       a0, t4, s4
                  fmax.s       fa5, fs10, fs4
                  sltiu        sp, t0, -36
                  mulhu        s2, s2, s6
                  xori         t2, a6, -1900
                  ori          t6, s1, -369
                  fmin.s       fs7, fa6, fs1
                  xor          a1, s2, t3
                  sub          a1, s6, t0
                  sll          s10, tp, s7
                  addi         a0, t5, 1731
                  sltu         gp, t5, a1
                  ori          t1, t4, 1098
                  sll          a0, a4, s4
                  fcvt.wu.s    s0, fs8, rmm
                  addi         a6, zero, 1315
                  fmv.x.w      a5, fs4
                  div          a1, t2, s0
                  fsgnjx.s     fs8, fs8, fs2
                  fmv.w.x      fs10, t5
                  fcvt.s.w     fa0, t6, rup
                  fcvt.w.s     t4, fs2
                  slti         zero, s2, -907
                  xori         a2, s1, -288
                  fsgnjx.s     fs8, fs0, ft10
                  fle.s        s7, fs2, ft10
                  fsgnj.s      ft0, fs4, fs10
                  slli         s4, s6, 28
                  fmax.s       fa6, fs10, fs9
                  slti         tp, a1, 955
                  remu         s1, t1, a3
                  rem          gp, a3, t0
                  fcvt.wu.s    ra, ft5, rmm
                  mulhu        tp, s6, sp
                  xori         t6, s1, -1080
                  or           t0, t2, a2
                  srai         s6, tp, 7
                  slli         a7, t1, 17
                  fsgnjn.s     fs10, fs3, fs5
                  mul          a0, t2, t3
                  auipc        zero, 281285
                  fsgnjx.s     fs0, ft6, ft11
                  srai         a7, s1, 28
                  sll          s7, gp, t2
                  rem          s0, a0, s3
                  slt          a5, t3, s0
                  sltu         ra, s1, ra
                  srl          s1, a6, s11
                  andi         s10, t3, -1959
                  sra          a5, a6, a6
                  andi         s2, s8, 1740
                  nop
                  remu         a6, t6, s0
                  add          t4, t6, s6
                  slt          a0, a7, a0
                  lui          a0, 888342
                  fmv.x.w      s7, fs4
                  fsgnjx.s     fs10, fa4, ft5
                  fmin.s       ft1, ft11, ft9
                  divu         a2, s9, a5
                  flt.s        t2, fs1, ft5
                  remu         s4, t3, s9
                  andi         t2, s6, -412
                  fcvt.s.wu    ft9, s1, rne
                  divu         tp, t1, s6
                  fadd.s       fs6, fs11, ft6
                  slt          s6, s3, a0
                  fmv.x.w      s7, fa3
                  fcvt.s.wu    ft6, t0
                  remu         a0, s11, s4
                  and          s2, s1, zero
                  rem          t3, s3, s0
                  andi         sp, a4, -342
                  fsub.s       fs5, fa1, ft0, rtz
                  auipc        s5, 1023727
                  fmax.s       fa4, ft4, fa3
                  and          s0, t1, s11
                  fadd.s       ft3, fa3, fa2
                  slt          t0, a5, t4
                  mulhsu       s2, s11, t3
                  mulhsu       t6, s10, tp
                  srl          s0, t1, s2
                  sltu         s4, t4, a0
                  fmv.x.w      t6, fs5
                  mulhu        t6, s2, tp
                  sll          ra, s2, t6
                  sltiu        a2, s2, -1953
                  slli         t4, s2, 7
                  fclass.s     a3, fa7
                  div          s2, a4, s0
                  divu         s0, sp, t3
                  mulhu        a3, tp, s1
                  xor          t1, zero, s6
                  sltiu        s5, a3, 765
                  srl          tp, s8, t3
                  slti         a0, a3, -888
                  mul          s4, a2, a2
                  remu         zero, t2, zero
                  sltu         sp, ra, s1
                  auipc        t4, 1010746
                  mul          t6, t5, sp
                  and          s6, t5, a6
                  feq.s        s1, ft1, ft7
                  mulh         s9, s0, s1
                  andi         a4, s3, -687
                  fmv.w.x      fs2, sp
                  fmin.s       ft5, ft7, fs8
                  fmax.s       fs8, ft4, fs0
                  sll          s5, t6, ra
                  sll          t6, t4, a2
                  sub          t6, s8, s8
                  fsgnjx.s     fa1, fs11, fa2
                  xor          a1, t3, s4
                  slti         gp, gp, 935
                  fsub.s       fs3, ft0, fa0, rne
                  divu         s5, s10, a7
                  srai         a1, a4, 9
                  sltu         s1, s2, t1
                  auipc        t6, 620700
                  add          s2, tp, s9
                  flt.s        s10, ft5, fa5
                  add          s6, gp, t1
                  feq.s        a0, fs6, fa4
                  lui          a5, 233970
                  auipc        sp, 839538
                  fmv.w.x      fa2, t0
                  fsub.s       fa4, fa0, fa2, rtz
                  andi         s5, s0, 2042
                  srl          a5, s5, a6
                  slli         a6, a4, 26
                  fsgnj.s      fs7, fa5, ft0
                  srl          s5, t2, s9
                  fsub.s       fs11, ft3, ft8
                  fmv.w.x      fa1, t3
                  andi         ra, a1, 1181
                  auipc        t2, 665315
                  slli         s9, t3, 12
                  fcvt.s.wu    ft2, s4
                  fcvt.s.w     fs6, s4, rdn
                  fmv.x.w      sp, fa2
                  or           t2, s4, t5
                  fsgnj.s      fa7, fs2, ft7
                  fsgnj.s      ft0, fs11, ft8
                  srai         t0, s2, 4
                  mul          a3, t6, s3
                  and          s9, a2, s9
                  mul          t0, s7, s8
                  fclass.s     s7, fs6
                  ori          s4, t6, -163
                  xori         gp, t1, 1410
                  srli         t0, t2, 7
                  fadd.s       fa0, fs2, fs6
                  fmv.w.x      fa1, t4
                  auipc        a0, 868946
                  and          gp, s10, t0
                  slli         s8, t2, 0
                  srai         s2, a7, 19
                  nop
                  nop
                  auipc        t3, 672018
                  flt.s        gp, fs6, fs4
                  fcvt.wu.s    s2, fs2
                  slti         s9, a0, -778
                  xor          s6, sp, gp
                  sra          s1, t3, t3
                  fadd.s       ft7, fs6, ft11, rne
                  fclass.s     s2, fa2
                  add          s1, s8, s10
                  flt.s        s8, ft6, fs10
                  fcvt.wu.s    a4, fs9, rne
                  srai         s9, a6, 27
                  add          a2, t5, a6
                  fadd.s       fs6, fa6, fs1
                  xori         s9, a7, 479
                  srli         s5, a7, 12
                  slti         t2, sp, 482
                  div          a3, t3, s5
                  mulhu        a1, t2, s1
                  slti         tp, a6, 1
                  sltu         s2, t0, s9
                  sub          s0, a3, a6
                  sra          tp, ra, s2
                  sltiu        a7, s4, 1900
                  div          s0, t5, zero
                  addi         a1, s10, -836
                  remu         t0, t3, sp
                  fmv.w.x      fa3, s3
                  fcvt.wu.s    a0, fa3, rne
                  fclass.s     t4, fs0
                  slti         zero, a3, 565
                  remu         s1, s7, a3
                  fsgnjx.s     fa3, ft8, fs4
                  sll          tp, s9, t3
                  xor          a5, a0, a5
                  andi         t1, zero, 2011
                  sll          sp, t5, a5
                  flt.s        gp, ft9, fa4
                  srai         gp, a5, 18
                  xor          s1, s5, a5
                  fadd.s       fa7, ft7, fs5, rdn
                  sll          t1, t5, s7
                  rem          t2, t3, gp
                  divu         s6, s5, a3
                  fcvt.s.w     fs3, t3, rmm
                  auipc        gp, 315472
                  fsub.s       fs9, fs2, fs8, rup
                  xori         s8, s6, -676
                  fcvt.s.w     fa6, a6
                  fmv.x.w      sp, fa1
                  div          s6, t4, s5
                  fsgnj.s      fa5, fs8, fa5
                  sub          s5, s10, zero
                  mulhsu       s9, a3, a1
                  auipc        tp, 507268
                  sra          a1, s6, a6
                  mul          s9, s9, s1
                  fadd.s       fa5, ft1, fs11
                  fcvt.w.s     s6, ft1
                  sltiu        sp, s8, -870
                  div          s1, t3, s8
                  fsgnjx.s     fa1, ft6, fs7
                  flt.s        s10, fa5, ft0
                  feq.s        t1, ft11, fs1
                  fcvt.s.wu    ft8, a6, rne
                  xor          s5, t4, a2
                  ori          a6, a5, 1161
                  fclass.s     s8, fs8
                  fcvt.s.w     ft0, a2, rmm
                  fsgnjn.s     ft7, fa2, fs5
                  slt          s2, s5, ra
                  fle.s        tp, fs0, fa6
                  sltiu        s2, a7, 940
                  sltu         s6, s1, a1
                  ori          s9, t3, 319
                  sltiu        s9, tp, 1357
                  fcvt.wu.s    a7, fs2
                  rem          s9, s7, zero
                  mul          tp, s5, s2
                  div          s7, a0, s4
                  sll          tp, a2, t4
                  feq.s        a0, ft11, ft11
                  add          a0, s7, s8
                  slt          s4, t2, a2
                  fsgnjn.s     fa1, ft3, fa5
                  fsgnj.s      fs7, fa6, ft11
                  sub          ra, ra, s2
                  fsgnj.s      ft1, ft11, fs6
                  slti         a2, ra, 1854
                  or           s10, s11, a2
                  fle.s        tp, fs10, fs3
                  feq.s        a6, fa3, fa5
                  ori          t1, tp, -1211
                  fsub.s       fs5, fs10, fa0, rmm
                  fcvt.w.s     ra, fs9
                  slli         a7, ra, 10
                  fcvt.s.w     fs8, a0
                  srli         s6, s10, 18
                  or           a3, t0, s4
                  nop
                  andi         a7, s1, -590
                  slt          t2, s5, s11
                  srl          a7, gp, s8
                  divu         sp, t0, zero
                  flt.s        a2, ft1, ft1
                  auipc        t1, 294268
                  add          t3, s8, a0
                  fmv.x.w      s9, ft9
                  slt          s2, t0, a3
                  sltiu        s4, t6, 1035
                  xori         a2, s10, 767
                  mulhu        t3, a1, a1
                  sub          t1, a6, s0
                  sll          s1, gp, a3
                  fcvt.w.s     s1, fs6, rdn
                  sll          s1, gp, tp
                  add          a7, t2, sp
                  srl          t4, s7, s9
                  auipc        a3, 231214
                  slli         a1, s10, 14
                  add          s5, t3, a6
                  mulhu        a5, a0, zero
                  xor          t4, s3, s11
                  auipc        s9, 740359
                  fadd.s       fa2, fs7, ft3, rdn
                  mulhsu       t6, t1, t1
                  slli         t3, s1, 10
                  fsgnjn.s     ft4, fs9, fa4
                  xori         a0, s8, -793
                  srai         gp, a6, 13
                  flt.s        tp, ft5, fa6
                  fmin.s       fs3, fs11, fs3
                  slt          t1, gp, t1
                  xori         a6, sp, -815
                  feq.s        t1, fa3, ft0
                  fsgnjn.s     ft10, fs6, ft3
                  fsub.s       fa4, ft3, fa2
                  div          s5, a5, s9
                  lui          sp, 87102
                  divu         a1, ra, s11
                  remu         t0, a2, t4
                  nop
                  fsgnjx.s     fs0, fa3, ft6
                  fmax.s       fa0, fs7, ft9
                  xori         a2, t0, 336
                  fmv.x.w      s8, fs2
                  flt.s        s10, ft9, ft0
                  divu         t3, t5, t4
                  auipc        s5, 217686
                  fcvt.w.s     s10, fs0
                  div          s9, a4, s11
                  fcvt.w.s     t1, ft2
                  mulhsu       s4, a3, s1
                  slt          a4, a7, t6
                  fsgnj.s      ft4, fs10, fs5
                  mulhsu       a4, a2, s9
                  sltiu        gp, a3, 707
                  feq.s        t3, fs7, fs0
                  div          t2, t2, ra
                  sll          s7, a7, a5
                  fsgnj.s      fs7, fa1, ft2
                  fle.s        t0, ft1, fa4
                  addi         a0, t6, 402
                  or           s6, zero, s3
                  divu         t4, a4, s3
                  xor          t3, s2, sp
                  srli         s6, s8, 20
                  andi         s8, s7, 1562
                  xori         a4, a0, 311
                  xor          s7, s6, sp
                  mulh         s8, s9, s10
                  fcvt.s.w     fs0, s6, rmm
                  add          s10, gp, gp
                  feq.s        s5, fs6, fa0
                  mulhu        t3, s9, t4
                  sra          s9, zero, t2
                  sra          s6, s3, t1
                  lui          a5, 557351
                  fcvt.wu.s    s1, fs9
                  fle.s        s7, ft1, ft0
                  srai         t0, zero, 3
                  ori          s0, s10, 1367
                  fmax.s       fa5, ft6, ft1
                  xor          sp, s9, t5
                  fmax.s       fs7, fa1, ft2
                  and          gp, a3, a1
                  slt          zero, s5, s7
                  rem          sp, s5, s10
                  addi         a5, t5, -311
                  and          a5, tp, a6
                  fadd.s       ft5, ft4, fs7
                  divu         a2, t1, s7
                  xori         s0, s8, 922
                  srli         t2, a7, 26
                  divu         s2, s0, s3
                  fcvt.s.wu    fa0, t1, rmm
                  srli         s2, s6, 29
                  andi         a1, t3, 526
                  fcvt.s.wu    fa7, t6
                  fcvt.s.w     fs6, a7
                  and          s7, a1, s2
                  slti         s1, s10, -1902
                  fmv.w.x      fa5, zero
                  mulh         s6, a0, s9
                  feq.s        t4, fs6, ft6
                  fadd.s       ft8, fa6, ft6, rup
                  fmv.w.x      ft2, s8
                  addi         t4, a6, -793
                  fclass.s     a3, ft4
                  srli         s2, s1, 31
                  lui          a1, 486834
                  srai         s4, t0, 29
                  fle.s        t2, ft5, fa2
                  fmin.s       fa2, fs9, fs1
                  fsub.s       ft7, ft9, fa2
                  fsgnj.s      fa2, fa2, fa4
                  fadd.s       fs5, ft8, ft7
                  lui          s7, 974268
                  fmax.s       fa6, fs7, ft10
                  xori         s8, t3, 1795
                  add          a4, a6, t6
                  ori          a3, ra, -1449
                  or           s4, a3, a5
                  sll          t3, t5, s9
                  div          gp, sp, zero
                  slti         s0, s3, 305
                  andi         s10, t4, -1807
                  fmax.s       fs8, ft11, fs0
                  fmin.s       fs8, fa3, ft10
                  slt          t4, s6, ra
                  addi         a2, tp, -1145
                  slt          a1, sp, s5
                  srli         a3, s7, 15
                  mul          a3, ra, tp
                  sltiu        a0, a5, -574
                  mulhu        s4, sp, s0
                  ori          s8, a2, 1377
                  rem          s10, t1, s2
                  ori          a3, s7, -168
                  feq.s        a0, fa6, fs0
                  slt          a7, t6, s4
                  rem          sp, t2, s2
                  srai         s9, s7, 16
                  div          sp, gp, s9
                  sra          t3, t4, s1
                  fcvt.wu.s    s10, fa2, rmm
                  feq.s        s0, fs4, ft6
                  fle.s        a1, fs0, fs3
                  flt.s        t3, fs4, ft7
                  fmax.s       ft4, fs6, fs1
                  fadd.s       ft10, fs5, ft6
                  fcvt.s.w     fs5, zero
                  srl          gp, s2, t6
                  mul          s5, s7, a1
                  fcvt.s.wu    ft9, a3, rne
                  srai         a0, ra, 26
                  mulhsu       a6, t6, s9
                  fclass.s     s5, fs3
                  addi         s8, s6, -1025
                  mulh         s0, zero, t5
                  sra          s1, s4, s1
                  fcvt.w.s     t2, fa1
                  slli         s8, s4, 7
                  divu         a4, zero, sp
                  divu         a2, a4, s9
                  sll          zero, sp, s2
                  srl          s9, s9, s6
                  mul          s5, t5, t2
                  slli         a7, t0, 21
                  mul          a1, tp, s5
                  fsub.s       ft11, fs1, fa6
                  sltu         sp, s7, t6
                  fle.s        a0, fs10, fa4
                  fmin.s       fs10, fs1, ft10
                  sll          t1, t6, s6
                  rem          a6, t0, s2
                  fmv.x.w      a7, ft7
                  fsgnj.s      fs7, fs1, fs1
                  fcvt.s.w     fs7, a0
                  srli         s1, t3, 18
                  auipc        sp, 440105
                  fcvt.s.wu    fs11, s10
                  srai         s7, s7, 18
                  fcvt.wu.s    t1, fs1
                  fcvt.wu.s    a5, ft1, rne
                  fsgnjn.s     ft0, fs3, fs3
                  sub          t0, gp, s6
                  fsub.s       fs8, fa0, fa6, rdn
                  fcvt.s.wu    fa5, s2, rdn
                  fmv.x.w      s10, fs5
                  andi         a2, s9, -989
                  slti         s7, s0, -537
                  auipc        s5, 508345
                  fmv.w.x      ft9, sp
                  lui          a6, 817200
                  fsgnjx.s     fs10, fa3, fs3
                  mul          a2, a1, s9
                  sltu         s2, a4, s9
                  auipc        s9, 377288
                  fmv.x.w      t4, fa5
                  fclass.s     s2, fs1
                  or           a5, a7, s3
                  fmv.x.w      t6, ft2
                  mulh         s6, s7, a5
                  fsgnjx.s     fa0, fa2, fa1
                  and          s0, a2, sp
                  fsub.s       ft1, ft3, fa0
                  fcvt.s.w     ft0, a7, rdn
                  srli         s6, t0, 14
                  sltiu        sp, s11, -1506
                  xori         t0, s10, -370
                  fcvt.wu.s    s9, ft0
                  fcvt.w.s     s7, fa3
                  mulhsu       s2, a5, s9
                  sll          ra, tp, gp
                  remu         tp, s3, s0
                  fmin.s       ft5, fa0, ft9
                  srai         a1, t4, 29
                  add          t6, a4, a5
                  fmax.s       ft4, ft0, ft9
                  fmin.s       fs3, fa6, ft2
                  fmax.s       fs4, fs0, fs11
                  fcvt.wu.s    s6, fa0, rmm
                  mulhu        t1, s11, a2
                  srai         s10, gp, 0
                  fsgnjx.s     fs2, fa3, fa0
                  fsgnjx.s     fs7, fs0, ft2
                  fcvt.s.wu    fa3, s11
                  fcvt.s.w     fa5, a3, rne
                  divu         t6, s4, tp
                  fclass.s     s10, ft7
                  andi         s2, s10, -1431
                  fsgnj.s      fs0, fs6, fs7
                  srli         a1, t4, 30
                  fsgnj.s      ft0, fs7, ft7
                  lui          a7, 1011102
                  and          t4, sp, gp
                  fcvt.w.s     ra, fa5
                  slt          a2, a4, t4
                  feq.s        s6, fa6, ft8
                  rem          t6, t4, a2
                  feq.s        t0, fs8, fs0
                  flt.s        s8, fs1, ft5
                  mulhsu       a5, s4, a5
                  mulh         sp, t1, tp
                  mulh         ra, t1, s8
                  mulhu        t6, s7, t0
                  addi         ra, s0, -294
                  fcvt.wu.s    t4, fa1
                  slti         s6, t1, 35
                  fmax.s       fs4, fa1, ft5
                  sltu         s2, gp, s9
                  auipc        a1, 354808
                  fle.s        s8, ft0, ft1
                  remu         t0, t1, a3
                  add          a3, t0, a5
                  divu         s7, s4, s3
                  mul          a5, s9, s7
                  fsub.s       fs6, fs3, fs1
                  mulhsu       ra, t2, a6
                  mulhu        s10, s11, s8
                  fcvt.wu.s    t2, ft8, rtz
                  sltu         a1, s5, s3
                  mulh         tp, s6, a7
                  nop
                  fmax.s       ft2, fs5, fs9
                  fsgnj.s      fs4, ft3, fa3
                  sll          tp, s3, s8
                  sra          a6, s1, s10
                  or           s7, t6, a7
                  fcvt.s.w     ft1, tp, rup
                  srai         s6, s1, 22
                  and          a0, s3, t4
                  srai         gp, t3, 25
                  xor          a4, s0, a7
                  xori         s10, s3, 1596
                  rem          tp, a7, ra
                  ori          ra, t1, -680
                  add          a0, s8, a7
                  fcvt.wu.s    t1, ft11, rdn
                  mulhu        s7, s2, a3
                  xori         s6, a2, 1105
                  nop
                  fcvt.s.wu    fs0, s7, rdn
                  xori         s1, a2, -29
                  fsgnjx.s     fs4, fa5, fa7
                  feq.s        t1, fs7, fs0
                  fcvt.wu.s    t0, ft11, rup
                  fcvt.s.w     fs6, s8
                  nop
                  xor          a1, tp, zero
                  slti         gp, a4, -1855
                  fcvt.s.w     fa1, t4, rne
                  fmv.w.x      ft4, a0
                  fcvt.w.s     ra, fa7, rtz
                  fcvt.wu.s    t4, ft1
                  fcvt.w.s     gp, fa7, rtz
                  xor          a6, a1, a6
                  fmax.s       fs8, fs2, fs0
                  fle.s        a4, fa0, ft6
                  srai         gp, a5, 21
                  div          s9, s4, s4
                  sltu         t0, t0, t6
                  fsgnjn.s     fs3, ft11, fs4
                  sra          a1, t6, a7
                  andi         s4, a7, 1476
                  addi         ra, s10, -1405
                  fsub.s       fa0, fa5, fs9
                  sltiu        t2, a6, -1181
                  nop
                  addi         s6, s6, 754
                  slti         a1, t0, -770
                  slti         s1, s11, 817
                  auipc        t0, 80682
                  fsub.s       ft2, ft0, ft5
                  srl          tp, s2, a3
                  sltu         sp, t6, s1
                  mul          a5, a4, s7
                  srl          s0, a5, a7
                  fle.s        a2, fs10, fs5
                  sltu         a2, s9, s8
                  div          s5, t6, a6
                  fle.s        a4, fs7, fa3
                  sltiu        a7, tp, 1022
                  lui          ra, 838267
                  fsgnj.s      fa2, ft4, ft10
                  lui          s2, 243330
                  div          s0, t1, t6
                  xori         t3, tp, -552
                  fcvt.s.w     fs5, zero
                  flt.s        tp, fa5, fs6
                  mul          s0, zero, s8
                  xor          t3, s0, a3
                  slt          a5, a2, ra
                  sltu         tp, t0, s11
                  fsub.s       ft2, fs5, ft1
                  or           a1, s2, s10
                  andi         zero, a2, 141
                  sra          t4, a6, a2
                  fmv.w.x      ft2, s10
                  auipc        ra, 943304
                  and          zero, t3, t0
                  mulh         t0, s10, s6
                  rem          a4, a6, t3
                  mulh         t0, t6, t1
                  mulhsu       a7, s10, ra
                  xor          a2, s10, t1
                  remu         t4, tp, s11
                  nop
                  fsub.s       fa1, ft8, fa3, rtz
                  fmin.s       ft11, fs1, fs2
                  divu         s6, t0, s10
                  fsgnj.s      ft11, ft3, fa6
                  srai         tp, t4, 16
                  fcvt.s.w     fs7, a4, rtz
                  lui          tp, 810023
                  auipc        t0, 517019
                  addi         zero, s11, 96
                  div          a7, t5, t0
                  andi         t0, t1, -651
                  fsgnj.s      fs1, ft1, fs5
                  addi         s4, gp, -1093
                  fsgnjx.s     ft3, fa4, fs1
                  fmin.s       fa1, ft2, ft8
                  fcvt.s.wu    ft3, sp
                  mul          s0, t0, a0
                  fcvt.s.w     ft7, t1
                  mulhu        t3, ra, a1
                  addi         tp, zero, 2027
                  fcvt.w.s     a1, fs10, rmm
                  flt.s        t6, ft5, fs10
                  sub          s0, a4, t0
                  mulh         s4, s8, s10
                  fcvt.s.w     fs1, t1
                  sra          a4, t6, tp
                  mul          s1, s1, s5
                  mulhsu       a5, a6, s4
                  fcvt.w.s     ra, ft3
                  fmv.x.w      s8, fa3
                  fsgnj.s      fs3, ft7, ft6
                  fsgnj.s      fa5, fs9, fs7
                  addi         s7, a0, -23
                  fcvt.wu.s    a1, ft4, rmm
                  ori          a7, s3, 1729
                  or           t3, s11, s9
                  rem          a3, a6, s5
                  xori         a3, a0, -398
                  or           s4, a5, a4
                  andi         tp, t1, 733
                  fsub.s       fa6, ft2, fa5
                  fmax.s       ft2, fs7, fa7
                  srai         t4, a7, 12
                  fcvt.s.w     fa3, s8
                  mul          sp, a1, a0
                  fsgnj.s      fa5, fs4, fs4
                  fcvt.wu.s    ra, fa7
                  or           a7, a0, gp
                  sra          a1, s0, a2
                  sub          t6, t5, a3
                  nop
                  sll          gp, a7, s2
                  fcvt.s.w     ft11, ra
                  slti         s9, s7, 196
                  flt.s        s2, ft11, fs10
                  rem          t1, s4, s4
                  fsgnj.s      fa2, fs4, fa4
                  xori         t6, s1, 1495
                  xori         a1, s11, 556
                  fsgnj.s      fs5, ft10, fs1
                  addi         t2, a1, -1812
                  auipc        a2, 602238
                  fmax.s       fs6, ft3, ft5
                  fcvt.s.w     ft9, s10, rmm
                  sra          t0, s10, s3
                  slli         t3, s0, 8
                  feq.s        s5, ft6, ft4
                  fcvt.wu.s    s10, fa0, rne
                  slt          t6, a3, s8
                  fadd.s       ft2, fa3, ft5, rtz
                  mulhsu       a6, s1, sp
                  or           ra, s3, a0
                  fsgnjn.s     ft4, fs8, ft1
                  fsgnjx.s     fa4, fa4, ft8
                  fsgnjn.s     fs7, ft4, ft0
                  mulh         ra, a6, s11
                  slti         s5, gp, -1400
                  mulh         sp, s2, a6
                  fsgnjx.s     fa2, fs4, ft7
                  divu         sp, t4, gp
                  mulhu        s10, s9, zero
                  flt.s        zero, fs8, fs9
                  fmin.s       fs9, fs0, fs5
                  remu         zero, a6, a7
                  sub          a5, s6, tp
                  and          s9, a2, t3
                  nop
                  sra          s2, a0, gp
                  fsub.s       fs9, ft6, fa6, rmm
                  xori         s9, s5, -1706
                  fcvt.s.w     fs5, s10, rtz
                  fsgnj.s      ft6, fa7, fs3
                  mul          t6, ra, a1
                  sub          t0, gp, a1
                  rem          t4, t3, t2
                  auipc        a3, 137177
                  srai         gp, s7, 27
                  srli         t1, a2, 29
                  fmv.x.w      s10, ft5
                  fadd.s       ft3, ft6, fa6, rtz
                  mulhu        s1, t1, a7
                  div          a4, s8, s6
                  fmax.s       fs1, fs7, fs2
                  fmin.s       ft11, fs7, fs4
                  mul          zero, a7, t6
                  fsgnj.s      fs5, ft3, fs9
                  fle.s        a3, fs1, ft10
                  or           s1, s2, a1
                  div          s5, s6, t3
                  addi         s6, zero, 1055
                  nop
                  fcvt.w.s     s9, ft11, rmm
                  fle.s        a5, fs0, fa2
                  and          s1, s9, a7
                  fsgnjn.s     ft6, ft2, fs1
                  slti         a6, s11, 919
                  fsgnjx.s     fs1, fa4, fs11
                  fsgnjn.s     fa6, fs2, ft0
                  srl          a7, s0, t3
                  fmax.s       fs10, fs7, fs6
                  fmv.x.w      t3, fs0
                  and          t1, s10, s6
                  divu         a4, t2, s4
                  and          t1, a5, s10
                  slt          s2, s2, zero
                  srli         t6, s1, 8
                  sltu         t6, s6, s4
                  feq.s        t3, fa7, fs11
                  fadd.s       ft5, fa7, fa6, rmm
                  fle.s        s9, fs6, ft3
                  mulhsu       a1, s8, a5
                  andi         s7, t2, 1138
                  auipc        s2, 583765
                  fcvt.s.wu    fa1, s7, rne
                  sltiu        s10, zero, 988
                  slli         gp, t2, 20
                  slti         t2, t1, 842
                  fcvt.wu.s    s10, fa6
                  fadd.s       fa5, fa4, fs2, rtz
                  fmv.x.w      s6, fs4
                  fcvt.s.wu    fa5, s11, rne
                  slti         s5, t1, 832
                  sll          tp, s1, s4
                  remu         a7, a1, a0
                  auipc        ra, 261975
                  sra          a4, s0, a0
                  sll          s10, s5, s4
                  div          a4, t5, s3
                  mulhsu       a6, s8, tp
                  add          gp, s6, a7
                  mulhsu       s10, zero, s10
                  fcvt.w.s     t3, ft2, rne
                  fmv.w.x      ft0, gp
                  fcvt.wu.s    s4, fs3, rdn
                  fadd.s       fa3, ft9, fs7, rmm
                  slti         a0, t1, 1932
                  fmv.x.w      gp, ft9
                  slti         t3, a4, -736
                  mulhu        a3, t5, s1
                  xori         s7, s8, -679
                  fsub.s       fs5, ft1, ft3
                  divu         t4, zero, t0
                  fsgnj.s      fa2, ft5, fs3
                  andi         s4, a7, -910
                  sra          t0, gp, t6
                  sra          a5, a5, s11
                  fmv.x.w      a7, fs0
                  addi         s6, t1, 1883
                  srli         s4, tp, 9
                  feq.s        t6, fs2, ft9
                  fsgnjx.s     fs4, fa1, fs8
                  fcvt.s.wu    ft3, a1
                  andi         tp, s6, 1388
                  fsgnjx.s     ft6, ft1, fs11
                  flt.s        a4, ft4, ft6
                  xori         t1, s0, -2027
                  sltu         s6, s3, a2
                  sltiu        t0, gp, -587
                  rem          zero, t2, s9
                  nop
                  sra          a5, s11, gp
                  sltu         t2, t1, t1
                  fmax.s       ft6, fs2, ft2
                  slli         s1, s2, 25
                  fsgnj.s      ft5, fa2, fs1
                  fclass.s     a2, ft5
                  fcvt.wu.s    s7, fa6, rne
                  divu         a3, s6, t4
                  sll          a7, a6, a1
                  ori          a6, s6, 1666
                  andi         s0, a4, -581
                  fmv.w.x      fs10, t1
                  flt.s        s9, fs8, ft3
                  srai         t6, sp, 7
                  sll          s9, s7, s7
                  sltu         a0, zero, s8
                  srai         s6, t3, 5
                  sll          s5, s10, a5
                  divu         a7, sp, t2
                  remu         a3, s7, a1
                  auipc        s7, 1004464
                  fsgnj.s      fa3, fs1, fs0
                  xori         zero, t2, -1849
                  feq.s        s9, ft8, fs7
                  sub          t6, a4, a1
                  sll          gp, s6, gp
                  fsgnj.s      fa3, ft2, fa2
                  fadd.s       fa4, ft8, fs6
                  sltiu        ra, t0, -1729
                  fsgnjn.s     fs11, fa5, ft8
                  flt.s        s9, ft10, ft6
                  sra          gp, zero, s8
                  add          a4, ra, t1
                  flt.s        a6, fa2, fs0
                  sll          t1, s2, t1
                  xori         s10, s11, -365
                  fle.s        t4, fs10, fa1
                  lui          gp, 831657
                  auipc        tp, 804715
                  or           t2, ra, s6
                  xori         t3, ra, -747
                  fmax.s       fa4, fs3, ft7
                  div          s8, s11, a0
                  mulhsu       tp, t4, tp
                  sra          s4, t6, s5
                  ori          a4, zero, -806
                  sltiu        a5, t6, -133
                  sra          s2, a0, s2
                  sltiu        a2, a3, -580
                  fsgnjn.s     fs0, ft5, ft9
                  ori          s5, a1, 2024
                  fcvt.w.s     zero, ft10
                  slti         zero, t2, -1362
                  divu         s4, a3, sp
                  fcvt.s.w     fs10, sp, rup
                  srai         s10, a5, 7
                  fsgnjn.s     fa3, ft9, ft10
                  andi         tp, t2, 1983
                  mulhsu       s2, s8, t1
                  addi         s7, t5, -1544
                  fcvt.w.s     s8, ft8, rne
                  add          a5, t0, a7
                  rem          ra, t0, s9
                  fcvt.wu.s    a1, fs3
                  fcvt.s.wu    fs9, t4, rdn
                  fsub.s       fs3, fs2, fs6, rmm
                  sub          a3, s4, t1
                  slt          t2, a4, a4
                  mulhsu       s0, gp, a0
                  fsgnj.s      ft0, fa2, fa1
                  fle.s        s0, ft7, ft1
                  nop
                  fmin.s       fa1, fs6, ft5
                  xor          a0, t4, a5
                  mulh         t1, t2, ra
                  fmv.x.w      s5, fs0
                  xor          s10, s7, s10
                  mul          a0, s11, t4
                  slt          s7, s4, sp
                  xor          s4, gp, zero
                  fsgnjn.s     fs7, fs9, fa4
                  xori         a2, s6, -877
                  xor          a6, a2, s11
                  addi         a7, s0, 94
                  sltu         a0, ra, t4
                  fcvt.wu.s    a7, fs8, rne
                  nop
                  mulh         s10, s11, s10
                  addi         s4, t5, 119
                  sll          s5, t2, t6
                  sub          t2, t5, t6
                  slli         gp, a1, 20
                  rem          s1, a5, t6
                  addi         t2, ra, 227
                  add          zero, t2, t1
                  sll          tp, s9, s8
                  fcvt.s.wu    ft8, s8, rdn
                  fmv.w.x      fs5, s11
                  flt.s        s1, fa3, ft2
                  and          ra, t5, ra
                  fmv.x.w      s4, ft11
                  fsub.s       fs0, fs10, fa0
                  fsub.s       ft6, fa5, fa7
                  andi         s5, s9, 1240
                  fsgnjx.s     fa4, fa7, ft8
                  ori          a3, s7, 1985
                  sra          a3, t3, gp
                  fcvt.wu.s    a5, ft8, rdn
                  fcvt.w.s     s2, ft11
                  mulh         s8, s4, t1
                  sltu         s6, s1, s9
                  srli         a4, a4, 27
                  fsgnjn.s     ft4, fs5, fa4
                  ori          a1, s6, 151
                  srl          s5, a4, a7
                  mul          gp, t4, ra
                  sub          a2, t0, t1
                  lui          a3, 615813
                  or           a5, t6, t2
                  srai         a6, a4, 17
                  fclass.s     a1, fs3
                  srai         s5, s3, 27
                  fle.s        s2, ft5, ft0
                  fcvt.w.s     s4, fa4, rdn
                  mulhu        s8, t0, s3
                  sltiu        s5, gp, 469
                  srli         t1, t2, 27
                  fcvt.s.w     fs6, a3, rup
                  lui          t4, 835614
                  sltu         s1, t0, t1
                  ori          t1, t3, 1650
                  fsgnjx.s     fs9, fa1, fs7
                  slti         t6, a7, -760
                  ori          s5, s9, -869
                  fsgnjx.s     fs4, fa7, fa0
                  fsgnjx.s     ft6, fa6, fa6
                  fmin.s       ft2, fa7, ft9
                  fclass.s     t6, ft0
                  feq.s        s5, ft7, fa4
                  fclass.s     a1, ft2
                  srai         zero, a3, 2
                  fcvt.wu.s    s0, ft5
                  rem          s1, zero, s10
                  fsgnjx.s     fa4, ft5, fa2
                  fmv.w.x      ft10, s6
                  mulhsu       a4, s10, gp
                  or           a0, zero, s5
                  ori          t6, s8, 1798
                  srli         a3, t0, 30
                  xori         a5, s10, -318
                  sra          s8, s3, s5
                  xori         a6, t3, -1528
                  rem          s4, s2, t3
                  mulh         a6, a2, s1
                  slli         s10, a0, 20
                  fclass.s     t2, fa7
                  fmv.x.w      gp, fs4
                  fsgnjx.s     fs3, ft6, fs11
                  fmax.s       fa7, ft7, fa2
                  fsgnjx.s     fs9, fs3, ft6
                  fmax.s       fa3, fa7, ft7
                  flt.s        gp, fs3, ft11
                  mulhu        zero, a7, s10
                  fmv.x.w      s4, fa0
                  mulhu        tp, s4, a3
                  srli         s6, s5, 12
                  fcvt.s.w     ft4, s1
                  fcvt.s.w     ft3, gp, rtz
                  addi         s7, s9, -1768
                  addi         a1, ra, -1019
                  fcvt.w.s     t1, fs0, rdn
                  fmax.s       fs0, fa0, fa3
                  fsgnjx.s     fs2, fs1, fa4
                  nop
                  fcvt.w.s     a1, fa1
                  sub          zero, a6, t2
                  auipc        s1, 97081
                  lui          a4, 930942
                  sra          t4, t4, s1
                  xori         a0, s2, 214
                  fsgnjn.s     fs2, fa5, ft6
                  srai         s2, s1, 19
                  mulhsu       tp, a5, s11
                  sra          t6, a2, a6
                  divu         t0, s7, s10
                  fcvt.wu.s    a4, fa6, rmm
                  fcvt.wu.s    t1, fa4
                  fsub.s       ft0, fs9, ft6
                  mulh         gp, t6, t1
                  mul          a6, ra, a1
                  addi         a2, t0, -687
                  sra          a6, s3, t2
                  srl          s2, t6, t0
                  xori         s7, t1, -434
                  mulhsu       t1, t1, a1
                  fle.s        zero, fa1, fs0
                  fsub.s       fs7, fs7, fs2, rmm
                  rem          s8, a6, s7
                  mulhsu       zero, t2, zero
                  div          a7, a2, s1
                  andi         t3, s6, 280
                  ori          ra, tp, 80
                  auipc        t6, 401889
                  xor          ra, s1, t0
                  flt.s        tp, ft0, ft9
                  srai         s0, tp, 14
                  slti         sp, s9, -704
                  xor          gp, s10, a4
                  feq.s        a3, fa6, ft3
                  auipc        a3, 910142
                  div          t4, t0, s5
                  slli         ra, a3, 9
                  sub          s5, s10, s3
                  addi         s5, a3, -771
                  sra          t0, s9, a2
                  sltiu        tp, s9, 1363
                  fmin.s       ft11, ft6, fa6
                  slt          a6, s2, t1
                  srai         a5, s5, 14
                  addi         t1, s11, 952
                  addi         zero, a7, 482
                  fmv.x.w      zero, fs0
                  sll          t3, zero, t6
                  srai         s4, ra, 3
                  fcvt.wu.s    t1, fs2, rmm
                  fmv.x.w      t0, fa5
                  flt.s        a5, ft0, fa4
                  nop
                  fsgnjn.s     fs1, fs0, fs3
                  mul          s4, t5, s6
                  fsub.s       ft6, ft9, fs3
                  add          a4, s0, t6
                  remu         tp, gp, a0
                  srl          s5, a7, gp
                  fsgnj.s      ft9, fs6, fs4
                  mulhsu       s7, a2, s4
                  feq.s        s1, fa3, fs5
                  fcvt.s.w     fs5, tp, rdn
                  divu         s4, s10, s6
                  remu         s1, zero, s3
                  divu         t2, a7, sp
                  mulhu        zero, gp, s6
                  fcvt.s.w     ft4, s9
                  add          tp, s5, a4
                  fsgnj.s      ft5, fa4, fs6
                  fcvt.w.s     s0, fs10, rup
                  fadd.s       fs11, ft2, ft9
                  xori         ra, gp, 1437
                  fsub.s       ft8, fa6, fs4, rtz
                  addi         ra, t3, -1346
                  sltu         a4, a5, a5
                  or           a0, s7, t5
                  sra          a7, ra, s9
                  flt.s        s7, fs1, fs3
                  xori         t2, a0, 789
                  xor          s6, s11, t5
                  mulhu        a4, a0, s5
                  xor          a2, tp, t1
                  addi         s10, a5, 495
                  fmv.x.w      t0, fs0
                  fle.s        sp, ft1, ft4
                  fle.s        s9, ft1, fs11
                  slt          s10, a6, t3
                  slti         a1, s4, -1286
                  nop
                  slli         t2, s5, 3
                  fmax.s       fa7, fa7, fs1
                  and          a0, s6, s10
                  addi         s4, sp, -1674
                  mulhsu       t2, a4, s4
                  fle.s        s4, fa1, fs3
                  xor          s6, ra, s5
                  andi         s8, t0, -460
                  sltu         a5, a6, s10
                  slti         gp, t2, 2022
                  mulhsu       a0, t3, t5
                  srli         s2, t0, 9
                  sra          t2, gp, a2
                  fcvt.wu.s    a1, fs0
                  fsgnjx.s     ft0, ft11, fs9
                  sra          s4, s2, a7
                  sra          a6, a3, s8
                  sltu         s8, s9, a2
                  flt.s        t6, ft7, fs0
                  sra          a2, a3, s9
                  fadd.s       fa7, ft1, ft0, rmm
                  divu         a3, s11, a5
                  feq.s        t3, ft4, fs7
                  fsgnjn.s     ft2, ft11, ft2
                  nop
                  ori          t2, a2, -735
                  slli         a4, ra, 13
                  slt          a3, s5, s8
                  and          s9, a3, sp
                  srai         s6, s10, 23
                  divu         a4, s4, s2
                  fsgnjx.s     ft2, fa0, fs9
                  srli         a0, s0, 16
                  mulh         t4, s8, ra
                  xori         tp, ra, -1064
                  and          s1, tp, s4
                  remu         tp, t5, a1
                  mulh         a6, sp, s2
                  slti         a1, t3, -196
                  div          s9, t2, t3
                  remu         t6, t2, s0
                  add          gp, s7, t5
                  or           s0, t5, s10
                  fmv.w.x      ft6, a3
                  mulhu        ra, zero, zero
                  fsgnjx.s     fs10, fs2, fa5
                  fcvt.s.wu    fs5, t6
                  fmv.x.w      s10, fs6
                  sll          a3, a4, t6
                  fcvt.wu.s    a0, fs2, rdn
                  divu         a0, s6, s2
                  rem          t2, s8, a0
                  add          t2, s2, s5
                  fsgnj.s      fa1, fa7, fs1
                  xor          s6, s2, a6
                  mulhu        a7, s8, s5
                  fcvt.w.s     a0, fs9
                  fsgnj.s      ft0, fa2, fs1
                  fmin.s       ft4, fa7, fs9
                  fsgnjn.s     ft6, ft3, fs4
                  sra          s8, s11, a7
                  mul          a6, a2, a0
                  mulh         s0, a4, zero
                  andi         s2, sp, -834
                  fle.s        t3, fa1, ft4
                  feq.s        t1, fs1, fs11
                  auipc        a5, 953476
                  nop
                  fsub.s       ft7, ft1, ft6
                  auipc        a6, 904957
                  div          s10, s8, t1
                  sub          s2, s3, t1
                  mulhsu       s10, a2, s5
                  fle.s        a2, ft8, fs9
                  add          s2, a1, a6
                  divu         s10, s6, t6
                  xor          a3, a6, ra
                  fmv.x.w      s10, ft4
                  slt          ra, zero, t5
                  fadd.s       fa6, fa7, fs10
                  fcvt.wu.s    t3, fs2, rmm
                  fmv.x.w      a5, fa0
                  feq.s        a4, ft2, fa2
                  fsub.s       fs8, fs8, fa1
                  fcvt.s.w     ft3, s2, rup
                  sll          a6, a4, gp
                  sltu         a4, s10, s0
                  sltu         a7, t5, s2
                  sltu         zero, t6, s10
                  srai         s8, s9, 26
                  ori          ra, s10, 503
                  mul          zero, s3, s1
                  srl          t0, a0, a0
                  divu         t6, a6, s7
                  fadd.s       ft8, fs11, ft5, rdn
                  sltu         s2, a7, a0
                  sra          t0, s2, t4
                  fsgnjn.s     ft11, fa6, fs2
                  sra          t4, s0, t5
                  fcvt.s.w     ft7, a7
                  feq.s        s0, fs11, fa7
                  sltiu        t2, s0, 1959
                  fadd.s       fa0, ft6, fa0, rup
                  fsgnj.s      fa5, fa0, ft10
                  mul          t1, a7, t1
                  andi         a5, s6, -155
                  add          a2, t2, a5
                  srai         t2, a4, 15
                  fcvt.w.s     a2, fs6
                  fsgnjn.s     fs1, ft1, ft3
                  slti         a4, a0, 1147
                  fmv.w.x      fs10, s5
                  fmin.s       fs8, fa7, fs11
                  rem          zero, a4, sp
                  feq.s        t3, ft8, fa3
                  lui          s6, 430533
                  fcvt.s.wu    ft10, a2
                  sltu         a1, tp, s0
                  slt          s1, a6, s10
                  mulh         s8, gp, s10
                  remu         a1, a2, sp
                  fcvt.w.s     s10, ft7, rne
                  srl          a2, t5, gp
                  fmin.s       ft11, ft6, fs2
                  nop
                  fmax.s       fa0, ft0, ft5
                  remu         a2, s8, s10
                  fcvt.w.s     t3, ft7
                  remu         s10, a0, s1
                  slt          a1, tp, s6
                  divu         s10, a0, t2
                  nop
                  addi         s8, a7, -217
                  fadd.s       fa3, fs1, fa3, rup
                  sltu         s8, s10, s5
                  slti         s7, s11, 576
                  fcvt.s.w     ft4, s6
                  or           ra, a5, t2
                  rem          sp, a4, t0
                  xor          t3, t0, s11
                  srl          s4, t4, s3
                  and          s6, t3, s2
                  addi         a3, a7, -1869
                  add          a6, t6, a7
                  addi         a7, s9, -1129
                  mulhu        a5, s5, s2
                  fmv.x.w      t4, ft6
                  mulhu        t0, s1, ra
                  ori          s1, s8, -305
                  fle.s        t4, fs11, fs5
                  fadd.s       fa0, ft8, ft5
                  slli         zero, s7, 20
                  fmin.s       fa0, ft0, ft3
                  fsgnjn.s     ft1, fs4, ft2
                  fsgnjx.s     fa7, fs1, fs11
                  fsgnjn.s     fa0, ft2, ft6
                  xori         t2, a6, 2017
                  ori          t3, a2, -705
                  addi         s2, s4, -1692
                  auipc        zero, 575183
                  fsgnj.s      fa4, ft6, ft0
                  sll          sp, s5, a5
                  fsgnjn.s     ft9, fs11, fs2
                  fsgnjx.s     fs1, ft7, fs5
                  sltiu        a4, t6, -932
                  mulhu        t3, tp, tp
                  fsgnjx.s     ft10, fs6, ft5
                  slli         a3, s9, 17
                  andi         s2, a2, -582
                  div          s10, a5, a2
                  fsgnjn.s     fs6, ft7, fa2
                  or           a5, a2, t3
                  divu         s1, a4, a7
                  xori         t6, t5, 1521
                  fmax.s       fs3, ft0, ft2
                  and          a7, tp, t2
                  auipc        s9, 228359
                  fadd.s       ft5, fs8, ft3
                  fmv.w.x      fs5, s10
                  fcvt.s.w     fs6, t0
                  sltiu        a5, tp, 1299
                  fmin.s       fs0, fa0, fs2
                  sltu         s9, s4, s0
                  slt          t1, tp, s2
                  fcvt.w.s     s10, fa2, rdn
                  fle.s        sp, fs9, ft1
                  xor          gp, a6, s8
                  or           s1, a4, a0
                  mul          s5, a4, s0
                  nop
                  auipc        s9, 121185
                  fmax.s       fs1, fa0, ft2
                  fsgnjn.s     fs3, fa3, ft2
                  or           s0, t1, t4
                  addi         a1, a3, -378
                  slt          zero, s8, s4
                  xor          ra, s3, a4
                  slt          a6, a1, s11
                  div          a4, s8, s3
                  fadd.s       fs0, ft8, fa1
                  addi         zero, s9, 552
                  mulhu        s4, s4, s2
                  mulhu        t3, t0, t3
                  ori          a7, t4, -1997
                  fmin.s       ft1, fa0, ft9
                  fcvt.s.wu    ft4, t4, rdn
                  lui          a2, 461742
                  slt          gp, t0, a0
                  remu         a2, s7, s9
                  slli         s6, a1, 12
                  fsub.s       fs5, ft5, fs6, rup
                  mulh         ra, s6, s4
                  nop
                  rem          a3, a4, sp
                  ori          t0, a2, -144
                  sub          a4, s0, a6
                  fsub.s       fs0, fs6, fs11, rdn
                  remu         s9, s10, t6
                  mul          zero, s8, a2
                  fmv.w.x      fs6, s11
                  fmin.s       fs10, fa2, ft9
                  fadd.s       ft5, fs3, ft0
                  srai         a4, t2, 25
                  andi         s0, s5, -1652
                  fsgnjn.s     fs11, ft2, fs0
                  mulh         s8, t1, ra
                  slli         s7, s10, 12
                  sltu         a3, gp, zero
                  srl          a5, a2, ra
                  fmv.w.x      fa5, s7
                  sub          t1, a1, s3
                  nop
                  fmin.s       fa0, ft5, fa7
                  mulhsu       s8, zero, t1
                  sll          tp, zero, s11
                  fmax.s       fa4, ft9, fa3
                  slli         zero, s2, 5
                  slli         t3, zero, 16
                  sll          s2, s11, sp
                  and          s1, s8, t4
                  fle.s        t3, fs8, fs7
                  slt          s0, t3, a6
                  fclass.s     s1, fs11
                  fcvt.wu.s    t4, fs4, rup
                  lui          tp, 415789
                  mul          a5, ra, a3
                  fsgnjx.s     ft8, fa3, ft3
                  fsgnj.s      fa5, ft3, fs10
                  fcvt.wu.s    s7, ft8
                  fsub.s       fa4, fs0, fa3
                  remu         a7, a5, gp
                  fcvt.w.s     a5, fa5, rtz
                  fclass.s     s7, fa1
                  fmv.x.w      s0, ft4
                  xori         t1, t2, 1527
                  mul          tp, a7, gp
                  fle.s        s8, fa7, ft6
                  fmin.s       fa4, fs8, fs11
                  flt.s        s1, ft11, fa3
                  fsgnjn.s     fs8, fa5, ft11
                  ori          gp, t3, 930
                  xori         s1, s8, -1534
                  fsgnjn.s     fs3, fs2, fs2
                  slt          ra, a2, zero
                  fsgnjx.s     fs8, fs5, fs6
                  xor          a5, a3, s10
                  rem          a4, s6, s2
                  add          ra, ra, t2
                  fcvt.wu.s    t2, fs4
                  fmv.x.w      tp, fs2
                  mulhu        t3, s3, a6
                  fclass.s     t1, fs5
                  fmv.w.x      ft7, a0
                  fmin.s       ft3, ft7, fs8
                  sltiu        t0, s11, -2042
                  slti         a3, a3, -1035
                  fcvt.s.wu    fs8, gp, rmm
                  mulhu        s6, s9, s1
                  div          s0, s6, a7
                  flt.s        s0, ft11, fs2
                  and          t0, sp, t4
                  and          tp, a6, s3
                  slli         t1, s8, 31
                  andi         t2, t3, 1325
                  srli         t0, s5, 13
                  slti         t0, sp, -1643
                  flt.s        s2, ft7, fa1
                  slli         zero, t4, 7
                  fsgnj.s      fs7, ft4, fs0
                  divu         a7, t0, t0
                  lui          s1, 937014
                  divu         s4, s4, zero
                  div          gp, s7, a2
                  fcvt.s.w     fs5, s0
                  fsgnj.s      fs2, fs10, fa7
                  mulhu        t3, tp, a1
                  div          a7, t0, s5
                  nop
                  or           s10, s5, a1
                  slti         a7, a7, -2046
                  slt          sp, t1, a7
                  slli         s0, s9, 0
                  rem          a0, t1, s9
                  mulhu        s1, t6, a7
                  sub          a6, a2, a6
                  sltu         a4, t3, s2
                  srai         s2, t6, 23
                  fmax.s       fs10, fs0, ft3
                  sub          t3, s1, a3
                  fcvt.w.s     a3, ft0
                  fmv.w.x      fs3, s5
                  rem          s6, s11, s3
                  mulhu        a0, a1, t0
                  sltu         a4, t5, t3
                  andi         t0, a6, -980
                  fmv.w.x      fs11, s7
                  fsgnj.s      fs4, ft7, ft0
                  mul          s10, a6, a5
                  srl          t4, t3, s0
                  xori         t1, s4, -1524
                  fsub.s       fs8, fs1, fs4
                  fsgnjx.s     fa1, fa5, fs2
                  fmv.w.x      fs1, a4
                  sra          s8, s0, t5
                  remu         a3, zero, ra
                  divu         sp, a1, s6
                  fsgnjx.s     fs8, fa4, fa3
                  srai         s10, sp, 18
                  fcvt.s.w     fa0, tp, rup
                  sll          a0, tp, a5
                  mulhu        t4, a5, a4
                  and          a2, s6, tp
                  fsub.s       ft5, fa5, fs4
                  add          t0, a1, s2
                  auipc        s4, 404990
                  sltiu        a5, a1, -1577
                  slti         t0, a6, 1798
                  xor          tp, a3, zero
                  fcvt.w.s     s4, ft8
                  sltiu        s0, t3, 1323
                  mulhu        t0, a4, a5
                  ori          s4, s8, 2046
                  andi         a7, s10, 1432
                  fmv.x.w      a2, fs3
                  lui          t2, 264237
                  flt.s        a0, ft6, ft8
                  fmin.s       fs10, fs11, fa7
                  srai         s4, t2, 10
                  srl          zero, a2, a5
                  rem          sp, zero, s6
                  mulh         s9, t1, s3
                  xori         tp, a1, -669
                  fcvt.s.w     ft2, a2
                  mulhsu       a3, s8, s9
                  lui          s8, 455849
                  flt.s        sp, ft6, fa6
                  srli         zero, s7, 7
                  xori         s4, s6, 566
                  sub          a5, t2, a4
                  fmv.x.w      a6, fa6
                  fclass.s     t2, fa7
                  fsgnjx.s     fs11, fs5, fa6
                  fclass.s     s1, fs2
                  div          a4, t2, s3
                  xori         s0, t1, -791
                  mulhsu       t6, s1, zero
                  fmax.s       fs4, fa3, fs7
                  fsgnjx.s     fa2, fa3, fa6
                  or           ra, s3, a1
                  srli         t2, s6, 13
                  flt.s        a4, fs8, ft9
                  slli         ra, t4, 16
                  slt          s2, s5, a0
                  fcvt.wu.s    a5, fa6, rtz
                  fle.s        a6, fs10, fs5
                  div          sp, a1, s2
                  ori          a7, sp, -108
                  fsgnjn.s     fs8, ft7, ft9
                  fcvt.s.wu    ft10, a5, rne
                  mulh         a5, t1, a1
                  fadd.s       fa0, fs1, ft4, rup
                  slt          a3, t1, s2
                  fmin.s       fs8, fs11, fa4
                  fcvt.w.s     gp, ft6, rmm
                  fsgnj.s      fs10, fs1, fs8
                  lui          s4, 885442
                  divu         t6, t6, a7
                  nop
                  flt.s        sp, ft8, fa2
                  andi         t0, a5, -648
                  sra          a6, a0, sp
                  fsgnjn.s     fs3, fs3, fa2
                  and          t1, a2, t5
                  and          a1, s8, s7
                  fsgnjn.s     ft10, ft4, ft11
                  fcvt.s.w     fa3, t4, rtz
                  and          t4, sp, a3
                  fcvt.s.wu    fs10, tp
                  sra          a0, t3, a1
                  rem          s0, a6, s11
                  nop
                  addi         t0, t4, -1613
                  div          a1, ra, s7
                  fmv.x.w      a7, fs7
                  fcvt.s.w     ft4, s1
                  srai         sp, s11, 23
                  xori         gp, s10, -1013
                  xori         a0, s2, 1074
                  feq.s        s8, fa4, fs3
                  srli         a6, s7, 30
                  or           a7, gp, a5
                  and          s1, ra, s3
                  and          s7, a4, s0
                  fmax.s       fa5, ft1, fa0
                  ori          s1, s3, 1333
                  slti         t2, s11, 347
                  addi         t2, t1, -1776
                  addi         sp, s3, -1675
                  flt.s        t4, fs8, fa0
                  fcvt.s.w     fa3, t5
                  flt.s        zero, fa4, fs8
                  fsgnjx.s     fs2, ft1, ft6
                  sltu         zero, sp, s8
                  feq.s        a7, fs0, ft0
                  mul          a4, a6, a5
                  fcvt.wu.s    s4, fs3
                  sltiu        s5, a2, -378
                  nop
                  sra          gp, t6, s4
                  sltiu        a7, a1, 694
                  xor          s7, t3, t0
                  mulhsu       s9, s1, s0
                  mul          gp, a0, s1
                  fmin.s       fs6, fa7, ft8
                  fclass.s     ra, fa4
                  or           s8, t0, t4
                  srli         a7, t0, 0
                  fsgnj.s      fa7, fs7, fs3
                  ori          a4, s4, 849
                  xori         t2, s7, -2022
                  lui          a3, 324702
                  ori          s1, t3, 323
                  mulh         a7, s7, a5
                  mulh         t0, s8, t6
                  fcvt.w.s     t4, ft3, rne
                  flt.s        s4, fs1, ft11
                  xor          s4, gp, ra
                  sra          a2, t6, s6
                  rem          a0, a7, t5
                  feq.s        a2, fs4, fs11
                  nop
                  fcvt.wu.s    s0, ft4, rdn
                  sll          a6, tp, a7
                  mulhu        a1, s7, a6
                  fmax.s       fs3, fs7, fa2
                  flt.s        gp, fs10, ft9
                  ori          a4, a0, 1996
                  slt          t6, a4, s6
                  slli         s4, sp, 23
                  andi         t2, a1, 119
                  flt.s        tp, ft2, fs9
                  xor          a2, s6, s0
                  fmax.s       ft7, fs1, ft8
                  flt.s        a5, fa5, ft3
                  or           a2, a1, t3
                  srli         a3, s10, 31
                  fclass.s     a1, ft0
                  fcvt.s.w     fa0, a2
                  and          a2, a5, a3
                  fmv.x.w      t6, fa0
                  fsub.s       fa7, fs5, ft8, rtz
                  fsgnj.s      fs3, fs2, fs0
                  fle.s        gp, fa4, fa4
                  sltu         tp, tp, t0
                  mul          t6, s2, s5
                  srai         s6, s7, 24
                  lui          sp, 76881
                  fsgnjx.s     fa3, fa7, fs9
                  mul          s9, t3, a2
                  sub          t3, s10, s3
                  fcvt.w.s     sp, ft2, rdn
                  mulhsu       sp, s5, a3
                  feq.s        t2, ft3, ft6
                  xor          a0, s0, t5
                  fmv.w.x      ft0, a5
                  fsub.s       fa5, fa4, fs8
                  fmv.w.x      fa4, t0
                  srl          s2, ra, s5
                  fmin.s       ft0, ft10, ft7
                  srl          sp, t2, s10
                  flt.s        a4, fa0, fa4
                  addi         a6, s7, 1692
                  slt          t4, t4, s3
                  srl          ra, t3, a3
                  andi         a6, s6, 70
                  mulh         s8, gp, a4
                  slti         s4, t6, -1250
                  ori          a7, t1, 968
                  xor          a7, t1, s2
                  fclass.s     a2, fs8
                  srai         a4, s11, 19
                  nop
                  fcvt.s.w     ft7, s8
                  fsub.s       fs2, fs2, fa2
                  fmv.x.w      a6, fs2
                  lui          s1, 5415
                  fsgnjn.s     ft5, fs10, fa1
                  fcvt.w.s     t6, ft2
                  slti         s5, t3, 49
                  add          t4, a1, tp
                  auipc        s9, 629351
                  fcvt.w.s     s7, fa1, rup
                  srli         zero, sp, 22
                  auipc        t4, 76872
                  slt          gp, s4, s0
                  fsgnj.s      ft6, fs7, ft6
                  feq.s        s9, ft1, ft9
                  divu         a2, a2, sp
                  lui          t0, 249187
                  sltu         s8, a2, s2
                  fcvt.w.s     a5, fs2, rmm
                  fmax.s       fa6, ft5, fa4
                  fmv.x.w      a3, fs3
                  fmin.s       fs3, fa1, fa5
                  ori          t1, s4, -1899
                  srli         a1, tp, 8
                  auipc        t6, 46257
                  add          a0, a0, s9
                  fsub.s       fs9, fs6, ft11, rdn
                  rem          a0, t4, a0
                  mulhsu       sp, s9, zero
                  mul          t2, s9, a5
                  slti         s5, sp, -991
                  auipc        t4, 466809
                  sltu         s7, s4, a1
                  fcvt.s.w     fs4, s9
                  fmv.x.w      t1, ft11
                  feq.s        t0, fs6, ft6
                  fadd.s       fs3, ft8, fa0, rne
                  auipc        a4, 44526
                  lui          t3, 486249
                  rem          t4, zero, zero
                  mul          a2, a1, s2
                  mulh         s5, zero, t6
                  sltu         zero, s2, a7
                  sll          s5, t6, a5
                  mulhu        s7, a5, a4
                  fcvt.w.s     s2, ft4, rdn
                  feq.s        s2, fs8, fa4
                  div          a4, s1, t3
                  fcvt.s.wu    ft1, s2
                  fsgnjx.s     fs10, ft5, fa5
                  sltiu        sp, sp, -496
                  srl          ra, s11, zero
                  andi         gp, s9, 7
                  fsub.s       fa2, ft1, ft6, rdn
                  mulh         s8, sp, a4
                  andi         s9, s4, -1673
                  and          a6, zero, t6
                  xor          s2, s1, tp
                  sltu         t0, a2, s6
                  slt          s10, s2, s9
                  fle.s        t0, fs2, fs1
                  srai         a4, a5, 23
                  remu         s10, s4, s7
                  sub          s0, t2, s5
                  sub          a6, s2, a4
                  div          t4, t3, s11
                  fsgnjx.s     fa0, ft8, ft0
                  srli         gp, t5, 30
                  slt          s2, a5, a5
                  fcvt.wu.s    t1, ft1
                  srl          t0, a4, s2
                  rem          zero, s2, t5
                  slli         a2, s9, 19
                  sub          s0, t1, ra
                  sub          s5, s0, s5
                  fsgnjx.s     fa6, fs9, fs3
                  fsgnjx.s     fa5, fs3, ft5
                  mulh         a6, zero, t6
                  or           s5, tp, s3
                  nop
                  remu         zero, t5, ra
                  auipc        zero, 375582
                  sltu         s2, s7, s7
                  divu         a4, tp, s0
                  xor          t2, t4, t4
                  fsgnj.s      fs0, ft9, ft5
                  sub          a4, s8, t2
                  fcvt.wu.s    s4, fa1, rmm
                  sltu         zero, ra, gp
                  fcvt.wu.s    a3, ft8
                  remu         a3, a6, t6
                  fle.s        t6, fs8, ft3
                  feq.s        s2, fs9, fs6
                  fadd.s       fs6, fa5, fs2
                  sra          tp, t1, a5
                  fcvt.w.s     a0, fs7, rmm
                  fcvt.w.s     a6, fa3
                  addi         s8, a4, 1550
                  fcvt.s.w     ft1, tp, rne
                  fmin.s       fs9, fa4, ft7
                  fadd.s       fa4, fs2, ft7, rmm
                  srl          s4, s11, t1
                  srli         zero, s0, 9
                  slli         a5, a6, 6
                  fcvt.wu.s    a2, ft11, rup
                  fsub.s       ft7, fa1, fa3, rdn
                  sll          t4, s5, t6
                  or           t3, gp, a4
                  slti         ra, s10, -1749
                  divu         s7, a2, s6
                  auipc        a0, 651594
                  sra          t0, t4, t0
                  slt          ra, sp, gp
                  fcvt.w.s     a4, fa7
                  mul          gp, zero, s10
                  fcvt.s.wu    fs0, s4
                  div          s8, s2, s3
                  feq.s        a1, fs2, ft7
                  fmax.s       fs4, fa1, ft1
                  auipc        t3, 299228
                  mul          s4, s10, tp
                  auipc        a6, 326181
                  sra          t1, s6, sp
                  mulhsu       a6, a2, s7
                  xor          a7, t5, s6
                  fsgnj.s      fa3, fs7, ft9
                  sra          a6, t1, t5
                  mulhsu       sp, ra, t4
                  fcvt.s.w     fa6, t1
                  fcvt.s.wu    ft0, s10, rtz
                  fsub.s       fa2, ft1, fs3
                  fclass.s     a5, fa0
                  addi         s5, a2, -1828
                  xori         s10, s1, -1515
                  fmin.s       fa6, fa4, ft11
                  fcvt.wu.s    ra, ft11, rup
                  fmv.w.x      fs11, tp
                  fmv.w.x      fs11, s0
                  fsgnj.s      fs5, fa6, ft3
                  fcvt.s.wu    fa2, s11
                  srli         s6, ra, 20
                  fcvt.wu.s    zero, fa1
                  or           t0, s4, t4
                  fmv.w.x      fs11, a6
                  flt.s        t0, fs9, fa7
                  xori         gp, s4, -1091
                  sltu         s7, tp, a6
                  nop
                  ori          ra, t5, 821
                  divu         s5, s5, gp
                  sra          zero, s0, s1
                  addi         a2, zero, 1300
                  fsgnj.s      fa1, fs11, fa5
                  fadd.s       fs8, fa6, fa2, rne
                  fsgnjn.s     fa1, fs2, fs4
                  mul          t1, t2, t1
                  xori         s2, a2, 472
                  addi         tp, sp, 534
                  srli         t1, s5, 4
                  fmin.s       fs3, fs6, fs5
                  srai         zero, s8, 21
                  xori         s1, s7, -225
                  fclass.s     ra, fa4
                  slli         s4, s2, 19
                  mulhu        a5, a5, a3
                  sltiu        s4, s5, 900
                  divu         zero, a0, t5
                  flt.s        a3, fs10, fs0
                  mulhsu       t4, s5, s2
                  xori         s2, t3, -435
                  fcvt.s.w     ft4, a7, rdn
                  srli         tp, t0, 20
                  xor          s0, a7, a3
                  lui          sp, 184624
                  ori          a6, s10, -729
                  fsgnjx.s     fs3, ft5, fs1
                  mulhu        s4, a5, a4
                  div          s6, gp, ra
                  xor          tp, a2, s0
                  remu         t3, t1, tp
                  sub          a6, s0, a6
                  fcvt.s.w     fs1, sp, rtz
                  mulhsu       s1, a0, s1
                  fsub.s       fs4, ft8, fa7, rup
                  rem          t3, s9, t0
                  srl          a2, s3, s9
                  flt.s        s6, fs4, ft6
                  add          s10, a0, s11
                  sll          s5, a2, t3
                  nop
                  mul          s6, t5, s0
                  ori          zero, s5, 1374
                  xor          s5, s5, s4
                  fcvt.s.w     fa1, t3
                  or           gp, gp, t6
                  fcvt.s.wu    ft11, ra
                  fmin.s       ft3, fs1, fa3
                  mulh         a1, zero, s3
                  fadd.s       ft11, fs10, fa4
                  addi         s9, gp, -985
                  fadd.s       fs5, ft8, fa5, rup
                  add          t6, a5, t6
                  xor          gp, s1, t3
                  xori         s0, s2, -415
                  fmax.s       ft11, ft8, fs6
                  flt.s        t0, fs1, ft9
                  add          a1, a3, a1
                  mul          a5, a2, s10
                  auipc        a6, 406767
                  add          t1, a5, t0
                  add          t1, tp, a3
                  slti         zero, t4, -1878
                  mulh         s6, t4, s3
                  mulh         t2, s1, s6
                  divu         s7, s1, s3
                  feq.s        t1, fa5, fs10
                  sltiu        a3, s7, 601
                  fmv.x.w      s6, fa6
                  fsub.s       ft8, ft1, fs5, rmm
                  rem          s10, s9, s5
                  and          s5, t5, s1
                  addi         t3, s9, -1935
                  mul          a2, s5, t0
                  srl          s5, a7, t5
                  and          tp, s0, a4
                  fcvt.wu.s    t2, ft8, rtz
                  fsgnjn.s     fs1, ft1, ft7
                  fmv.x.w      s4, fs0
                  fle.s        s4, fs1, fs0
                  srli         s7, a5, 6
                  sltu         s5, s7, a3
                  nop
                  andi         tp, t2, -622
                  fsgnjx.s     fs5, ft7, ft6
                  fmin.s       fa3, ft1, fs0
                  feq.s        s9, fa6, fs0
                  fsgnjn.s     fs1, ft10, fs4
                  remu         t6, s7, a1
                  fmv.w.x      fs7, a4
                  remu         t4, t2, s11
                  srli         a7, tp, 11
                  fcvt.s.w     ft2, t0
                  fsgnj.s      fs8, fs11, fa0
                  sra          s7, s2, t2
                  feq.s        a0, fs2, fs4
                  xor          s10, s6, zero
                  flt.s        a2, fs4, ft3
                  andi         a7, ra, 941
                  fcvt.wu.s    sp, fa1
                  sub          a0, zero, gp
                  srli         t0, s8, 17
                  or           s7, a7, sp
                  sra          t2, t6, t0
                  slt          ra, s0, s6
                  fsub.s       fa5, fa5, fs5, rdn
                  sltu         ra, a4, s4
                  sltiu        sp, tp, -1238
                  andi         ra, a6, -799
                  flt.s        s8, fs1, fa6
                  mul          s8, gp, a1
                  fsgnjx.s     ft2, ft2, fs1
                  auipc        a1, 400241
                  slli         t1, s2, 16
                  mulhu        sp, a1, s1
                  fmv.w.x      ft3, a6
                  divu         s9, t1, s8
                  divu         s2, a0, s7
                  auipc        a5, 45435
                  mulhsu       zero, ra, s2
                  ori          a1, a6, 1971
                  fadd.s       ft4, ft11, fa5
                  nop
                  addi         s9, s4, -1846
                  xor          s7, s10, a0
                  fcvt.s.w     ft4, a2
                  fcvt.wu.s    s1, fs4, rup
                  sub          a2, tp, a3
                  fcvt.s.w     fs10, a4, rdn
                  fmv.x.w      s8, ft11
                  slt          t4, s11, s4
                  xor          a5, s0, t4
                  fmin.s       fa6, ft1, fs11
                  fadd.s       fa2, fa6, fs8
                  fsgnjx.s     fs0, fa2, fs11
                  fcvt.wu.s    t1, ft9
                  fcvt.w.s     tp, fs11
                  lui          a4, 957696
                  fmin.s       fa1, fs0, fs3
                  mulhsu       s0, t3, s8
                  xori         s5, a4, -2038
                  srai         s4, t4, 4
                  sltiu        a4, a2, -1694
                  fsgnjn.s     fs10, ft7, fa7
                  andi         s2, s11, -1753
                  fclass.s     a2, fs3
                  srl          a2, t1, s9
                  auipc        zero, 275669
                  andi         t1, t4, 1686
                  or           gp, t0, gp
                  andi         s2, a3, 1696
                  mulh         a7, s1, a4
                  slli         t0, s7, 0
                  lui          a6, 688136
                  fcvt.wu.s    s2, ft11, rdn
                  mul          s7, s9, t6
                  srai         tp, s1, 9
                  sra          t1, a0, a7
                  mulh         s1, t5, s7
                  flt.s        s9, fs6, fs5
                  feq.s        a6, fs4, ft3
                  fle.s        s2, fa1, ft1
                  sltu         ra, t2, t0
                  fsgnjx.s     fs1, fs10, fs1
                  xori         t2, t1, 249
                  mul          a4, a0, gp
                  fsgnjx.s     fs11, fs10, fs7
                  fclass.s     t0, fs1
                  and          t4, t3, a4
                  feq.s        t0, ft7, ft0
                  andi         gp, a5, 44
                  srli         s9, sp, 25
                  rem          s7, gp, s7
                  fcvt.w.s     t4, ft11
                  mulhsu       s2, tp, s1
                  fsgnjn.s     ft3, ft9, fa5
                  xor          t1, ra, a2
                  add          zero, a2, a7
                  ori          tp, zero, -621
                  fclass.s     s0, fa4
                  feq.s        s1, fa7, fs11
                  sltu         t0, s0, sp
                  lui          tp, 520866
                  remu         a2, s11, s1
                  mulhsu       s5, s10, tp
                  fmin.s       fs0, fa0, fa5
                  mul          s8, s0, s5
                  rem          ra, t5, tp
                  sltu         a1, s10, s3
                  andi         t0, t3, 787
                  fsgnj.s      fs10, fs0, fa1
                  fmin.s       fa2, fs4, ft11
                  fmin.s       fs9, fa1, fa7
                  xor          ra, s7, a0
                  fcvt.wu.s    sp, ft6
                  mulhu        sp, a7, s6
                  srai         sp, t4, 28
                  xor          sp, ra, a1
                  fmv.w.x      fa4, s4
                  mulhu        s0, zero, s9
                  fcvt.s.w     fs4, a0
                  remu         a0, a6, ra
                  fclass.s     a4, fa2
                  fmv.x.w      s4, ft8
                  fmin.s       ft4, fs5, ft7
                  sub          t3, s11, s7
                  fcvt.wu.s    s8, ft5
                  div          zero, a3, t2
                  fle.s        s4, ft0, fs8
                  fmin.s       fa2, ft9, ft11
                  fcvt.wu.s    a4, ft10, rdn
                  fmv.w.x      fs10, s10
                  andi         t3, s9, -16
                  fmax.s       fs6, ft1, ft2
                  lui          t1, 329157
                  lui          t3, 621921
                  srai         a1, s11, 2
                  mulhsu       s2, a5, a6
                  auipc        a7, 498293
                  xor          a0, t5, t4
                  flt.s        s0, fa1, fa5
                  remu         gp, s1, a5
                  add          s2, t2, s3
                  fmin.s       fa3, fa5, ft9
                  sra          t3, s8, s8
                  mulh         t6, s3, a0
                  fcvt.wu.s    t1, ft6
                  mulh         s0, a6, a3
                  slti         zero, s9, 1865
                  auipc        t4, 619740
                  andi         t3, s7, -96
                  mul          s5, s5, s9
                  and          a3, t4, tp
                  mulhsu       a1, tp, a5
                  slt          a1, s2, zero
                  xor          t2, s2, t0
                  fmax.s       fs2, fs6, fa2
                  fadd.s       fa5, fs2, ft3, rup
                  addi         gp, s2, -1355
                  fmax.s       fa2, fs11, ft1
                  fsgnjx.s     ft11, ft11, fa3
                  auipc        t0, 412944
                  srl          s7, s8, t6
                  fcvt.s.wu    fs0, a4, rtz
                  sub          s8, s10, gp
                  addi         a2, a5, 1630
                  nop
                  fsub.s       fs6, ft0, fs4, rdn
                  fmv.x.w      sp, ft7
                  addi         s10, a2, -614
                  fle.s        s7, fa5, fs9
                  sltu         a7, t0, a0
                  xor          t4, tp, a0
                  fcvt.w.s     a4, fs2
                  sltu         a1, s10, a3
                  fsgnjx.s     fs0, ft1, fs5
                  and          a6, s4, t1
                  flt.s        s10, ft1, ft6
                  sltu         t6, a6, t4
                  mulhsu       zero, t2, s1
                  add          t0, a6, t5
                  and          ra, a3, s4
                  fle.s        a1, ft11, fa4
                  srl          gp, t5, gp
                  slti         s10, s4, 646
                  srl          s5, s1, t2
                  remu         s6, a7, ra
                  slli         s1, a5, 10
                  fcvt.s.wu    ft1, s6
                  mul          a7, a7, a5
                  fsub.s       fs6, ft2, ft7, rne
                  fle.s        ra, fs10, fs3
                  rem          a3, s8, t0
                  remu         a0, a5, s10
                  fsgnjx.s     fs5, fa0, fs4
                  feq.s        t1, fa7, ft6
                  div          ra, s5, s2
                  fsgnjn.s     fs10, fs11, ft9
                  auipc        t0, 184692
                  fsgnjx.s     ft1, fs9, ft7
                  slli         s7, s8, 30
                  fsgnj.s      ft2, fa5, fa2
                  mulh         t4, t5, s6
                  fsgnjx.s     fa2, fa1, fs1
                  fmv.w.x      fa4, gp
                  ori          a4, a7, -979
                  fsgnjn.s     fa6, ft5, fa2
                  slti         s7, s0, -1978
                  fcvt.wu.s    a7, ft10, rdn
                  fadd.s       fa0, fa3, ft8
                  sltiu        t2, a7, 1470
                  mul          s10, a1, a2
                  xori         s1, s3, 340
                  fle.s        t4, fa3, ft9
                  fmv.w.x      fs1, s8
                  fmax.s       fa7, fa1, fs4
                  and          a1, s8, s3
                  or           a4, s9, a0
                  lui          t2, 996364
                  fmin.s       ft6, fa1, fs3
                  div          a0, s10, s11
                  fmax.s       ft5, fs9, fs7
                  divu         s10, s2, gp
                  div          s4, s4, gp
                  divu         tp, t0, tp
                  or           t6, gp, sp
                  ori          a4, s7, -1808
                  auipc        s0, 951572
                  sltu         s4, a0, s3
                  mulh         a7, gp, t3
                  fcvt.s.w     fa3, sp
                  feq.s        s6, fs2, ft6
                  srl          a3, t0, s1
                  addi         s0, s11, -533
                  flt.s        s1, fa5, ft11
                  fcvt.s.wu    ft0, t5, rup
                  slti         s4, s6, 1897
                  lui          t6, 282380
                  feq.s        a1, fs7, fa5
                  and          a0, s3, a6
                  fsgnjx.s     fs7, ft0, fs6
                  addi         a0, s6, -878
                  remu         sp, s6, s4
                  nop
                  lui          a1, 202176
                  fsgnjn.s     fs4, fa5, fs11
                  sltiu        a1, sp, 42
                  xor          s1, s9, sp
                  ori          s9, s0, -82
                  mulhu        s2, a0, s2
                  remu         a6, t0, zero
                  slti         tp, a4, -1832
                  mulhu        t6, zero, t0
                  srl          s1, t1, a5
                  fsub.s       ft4, fa4, ft7
                  slli         sp, s2, 29
                  fmv.w.x      ft7, tp
                  add          t0, a3, s2
                  mulhu        a6, sp, t3
                  divu         s2, t5, s5
                  slti         t6, ra, -1623
                  flt.s        s4, fa7, fa4
                  srli         s8, zero, 23
                  addi         a6, gp, -180
                  flt.s        s0, ft9, ft2
                  fclass.s     t6, fa5
                  mulh         t4, sp, s1
                  fsgnjx.s     ft4, fs10, ft10
                  sub          s1, a2, zero
                  fadd.s       ft1, fa6, fa7, rne
                  or           s10, s8, s10
                  feq.s        a7, ft7, ft8
                  sltu         sp, a7, a5
                  addi         tp, s9, 1664
                  sltiu        a1, s10, 896
                  mulhsu       s1, s10, t3
                  remu         s5, s10, s11
                  sltiu        t6, a4, -1824
                  fmv.w.x      fa4, a6
                  nop
                  fmax.s       fs5, fa1, ft5
                  srl          s9, a1, s11
                  fsub.s       fa5, ft2, fa6, rdn
                  fcvt.w.s     a7, ft6, rtz
                  slt          s1, s11, s6
                  fcvt.s.wu    ft0, t6, rmm
                  flt.s        t3, fs0, ft6
                  fsub.s       fa7, fs6, fs9, rdn
                  sra          a4, t4, ra
                  srai         zero, t2, 13
                  nop
                  slli         zero, a2, 14
                  xor          a6, t4, a7
                  mulhsu       s9, s5, s8
                  fcvt.s.wu    fs9, s10, rmm
                  mulhsu       s4, a1, a1
                  mul          s5, zero, a1
                  mul          t1, s7, gp
                  and          a1, gp, s11
                  sra          sp, a0, a6
                  fmax.s       ft5, fa6, fa4
                  srli         gp, a7, 16
                  xori         tp, gp, -1020
                  fcvt.s.w     ft1, a0, rmm
                  sltiu        s6, s2, -407
                  fadd.s       ft2, ft5, fs10
                  fle.s        a1, fa0, ft4
                  remu         tp, s7, s9
                  remu         s7, t6, s4
                  fmv.x.w      ra, ft2
                  fsub.s       fs0, fs0, fs6, rdn
                  addi         s1, s1, -892
                  flt.s        t0, ft1, fa3
                  srai         t6, t5, 8
                  auipc        s9, 257309
                  or           a4, t0, s1
                  mulh         sp, a1, a6
                  fcvt.s.w     fs3, a2
                  div          a6, s6, s1
                  div          sp, t2, t0
                  lui          s1, 629293
                  sll          a7, a2, t2
                  mulh         a7, t1, s8
                  divu         s7, s3, s5
                  sra          t0, ra, s4
                  fcvt.s.w     ft3, s10
                  remu         s8, a0, t1
                  slli         a2, t1, 27
                  fclass.s     s9, ft3
                  slti         a7, ra, -417
                  nop
                  or           t1, t1, a2
                  sltu         s7, s6, s2
                  fcvt.s.w     fs4, t5
                  fcvt.s.wu    fs9, sp
                  mulh         a7, t1, a1
                  and          sp, sp, t6
                  div          a7, ra, a0
                  feq.s        t4, fa0, fs7
                  auipc        a6, 179749
                  remu         t0, zero, a3
                  fsgnj.s      ft9, fs8, fs9
                  sra          gp, t3, t4
                  remu         s1, s0, a4
                  mulh         ra, gp, s2
                  fmax.s       fs5, fa6, fa5
                  slli         sp, s7, 18
                  fsgnj.s      ft7, fs0, fa3
                  addi         s6, t1, -1691
                  fmv.w.x      fs8, t0
                  xor          s4, sp, s10
                  divu         s5, s2, a2
                  add          t4, s1, s0
                  mul          t1, s2, s1
                  fcvt.s.w     ft1, sp
                  ori          t2, s8, -445
                  or           a7, s0, t1
                  add          s7, a3, t3
                  nop
                  fcvt.s.w     fa2, s5, rup
                  mulhu        t4, a1, a4
                  fsgnj.s      fs8, fs2, fs8
                  mul          s1, s7, a0
                  sra          s7, tp, zero
                  sll          a0, a4, s0
                  lui          s4, 44058
                  fsgnjx.s     fs10, fs9, ft3
                  flt.s        s4, ft7, fs4
                  nop
                  fadd.s       fs3, ft7, fa1
                  add          ra, gp, ra
                  andi         a3, s10, 1038
                  fcvt.w.s     s6, fs6, rne
                  slt          s0, s9, a2
                  fadd.s       ft3, ft1, fs8
                  lui          s7, 588035
                  sll          a1, s9, a0
                  fcvt.w.s     a1, ft10
                  rem          a1, a0, s6
                  sltiu        s7, a6, -991
                  fclass.s     t1, fs2
                  mulhsu       t0, s3, a6
                  sll          s0, t1, tp
                  fmin.s       fs6, ft2, fs4
                  fsgnjx.s     fa1, fs2, ft10
                  or           t3, s8, s11
                  mul          a3, a0, t3
                  lui          s9, 576981
                  fadd.s       ft2, fa1, fs1, rmm
                  fle.s        s4, fs1, fs3
                  sub          a1, tp, t2
                  fadd.s       ft5, fs8, ft1
                  and          sp, s6, a3
                  fclass.s     t4, fs9
                  sll          a7, t1, a3
                  addi         s6, t4, 189
                  fcvt.s.wu    fa2, s6
                  fsgnjn.s     ft7, ft4, fa3
                  div          a0, s1, a1
                  fmv.w.x      fa5, s9
                  srai         sp, sp, 29
                  fmv.w.x      fs3, ra
                  fsgnj.s      ft7, ft2, ft11
                  sra          s8, ra, ra
                  fclass.s     a7, ft11
                  srl          a6, s5, s2
                  fsgnjx.s     ft10, ft5, fs8
                  divu         s10, t0, sp
                  andi         a4, gp, -116
                  fmin.s       ft7, fa1, ft2
                  fsub.s       ft10, fs9, fa7, rup
                  auipc        t2, 139561
                  srl          zero, s10, a0
                  fsgnjx.s     ft1, ft1, fs7
                  sub          a0, gp, s4
                  fmv.w.x      ft7, zero
                  sll          tp, s10, s8
                  fmax.s       fs1, fs4, ft1
                  andi         a0, s6, 1054
                  sltiu        s4, t2, -418
                  slt          sp, t3, zero
                  sltu         s6, s8, a1
                  fmax.s       fa2, ft1, fa1
                  andi         a4, s4, 1178
                  mulhsu       a3, gp, a0
                  xor          a7, t1, t5
                  feq.s        t6, fa5, ft10
                  fle.s        s10, ft5, fs5
                  fadd.s       ft2, fs4, fa0, rup
                  fmv.x.w      t0, fa5
                  sub          t6, t6, t4
                  xori         a4, t2, 337
                  andi         ra, gp, -1871
                  mulhu        t6, gp, s9
                  fclass.s     s7, fs2
                  fsgnjx.s     ft7, fa4, ft11
                  slt          t2, a1, s3
                  fcvt.w.s     s6, fs0
                  fmv.x.w      s4, fs3
                  mulhu        a3, t2, t2
                  auipc        s2, 668589
                  or           t4, s7, zero
                  nop
                  fmax.s       fa0, fs10, ft2
                  fadd.s       fa4, fa1, fa4
                  mulhsu       s2, s4, s4
                  divu         t4, zero, s7
                  sltiu        a5, a3, -1360
                  sltiu        s9, a7, 636
                  sra          gp, s1, t1
                  and          t1, s0, s7
                  divu         sp, s11, t4
                  fcvt.s.wu    fa1, s7, rup
                  fcvt.wu.s    s2, ft9, rdn
                  rem          sp, a5, s4
                  slt          s0, a6, a2
                  fsgnj.s      ft3, fs3, fs6
                  fmv.w.x      fs3, s5
                  xori         s9, s6, -893
                  sra          sp, a5, a2
                  fsgnj.s      fa7, fs9, fs7
                  slti         a5, s3, -1316
                  fcvt.w.s     a1, fs4
                  divu         a7, s4, s4
                  mulhu        a3, s10, s9
                  fmax.s       fa3, fs9, fs10
                  flt.s        s2, fa1, fs0
                  fcvt.w.s     a4, ft6, rdn
                  srl          a0, sp, s2
                  fsgnjx.s     ft10, ft6, fa0
                  fmv.w.x      fa5, s11
                  rem          s0, zero, s10
                  srli         s1, s5, 1
                  fsgnj.s      fs0, ft3, ft0
                  feq.s        s1, ft8, ft1
                  remu         zero, t2, s6
                  fadd.s       fa3, fa0, fa5
                  sll          s10, a6, t3
                  mul          t2, t3, sp
                  div          a6, s11, s1
                  fsgnjx.s     ft9, ft10, fs8
                  xor          t0, s3, a3
                  add          s6, a4, s7
                  fsgnj.s      ft7, ft11, fa2
                  sltiu        t3, a1, -1299
                  auipc        s7, 857449
                  and          a6, s3, a0
                  addi         s10, t0, 1286
                  or           t6, s1, s10
                  mulhsu       s5, s2, a3
                  sltu         s6, s9, a1
                  feq.s        a7, ft3, ft5
                  fcvt.w.s     tp, ft5, rup
                  or           s10, tp, a3
                  srli         t3, a6, 1
                  srli         gp, s8, 24
                  sltiu        tp, t3, 1562
                  fmax.s       fa1, fa3, fa3
                  ori          s10, a7, 281
                  slt          a2, t6, s2
                  fmv.w.x      fs11, s4
                  fmin.s       ft3, fa7, ft1
                  rem          a4, s6, a2
                  fmax.s       ft3, ft5, ft0
                  addi         a7, a6, 127
                  andi         t6, a4, -71
                  feq.s        t4, ft11, ft3
                  fmin.s       fs7, fs10, fs7
                  mulh         a3, s7, s8
                  sltiu        s0, a3, -20
                  sra          s6, tp, s7
                  sll          gp, s2, t3
                  mulhu        a0, ra, a1
                  sub          t6, t4, s0
                  mul          a6, t6, s3
                  rem          t2, s4, tp
                  sltu         t0, zero, a2
                  fsgnjx.s     fa6, fs4, fs7
                  fclass.s     t2, fa5
                  fmv.x.w      a4, fa5
                  slli         t3, a2, 25
                  mulhsu       s4, a2, a0
                  slt          a6, s8, s8
                  mulhu        s9, a4, s6
                  fmin.s       ft8, ft4, fs2
                  lui          s2, 826964
                  feq.s        a4, fs8, fs5
                  sra          a2, s6, t0
                  fmin.s       ft2, ft11, fs3
                  auipc        t1, 688801
                  flt.s        a2, fa5, ft8
                  and          gp, sp, gp
                  fmv.x.w      s5, fs3
                  or           s2, t0, sp
                  fcvt.w.s     s1, fs2, rtz
                  sub          t2, a2, s1
                  sltiu        a5, s7, -386
                  lui          a6, 358691
                  add          s7, s6, s5
                  nop
                  slti         a7, ra, 253
                  slli         t0, s1, 14
                  slli         a6, a6, 4
                  addi         t4, s11, 24
                  fle.s        s0, ft11, fs8
                  fmv.x.w      t3, fa3
                  fmax.s       fs11, ft2, ft11
                  fmin.s       ft10, fa5, ft7
                  ori          s7, s9, 1903
                  srai         s10, t5, 31
                  or           t6, t2, s3
                  fmin.s       fa6, fa2, fs11
                  flt.s        ra, ft4, ft2
                  fadd.s       ft6, fa7, fa4, rdn
                  fmin.s       ft5, fs0, ft1
                  divu         s1, t1, a3
                  fcvt.s.w     ft9, s7
                  nop
                  fcvt.s.w     ft11, s4
                  fcvt.wu.s    gp, fs0
                  fmv.w.x      ft0, s2
                  fsgnj.s      fs6, fs4, fa5
                  flt.s        s6, ft8, fs6
                  fle.s        a1, fs10, fa3
                  flt.s        s6, fs1, fs4
                  fsgnj.s      fs10, fs1, ft2
                  fsgnj.s      fs2, fa3, fa1
                  fcvt.s.wu    fa4, s7, rup
                  fsgnj.s      fs10, ft5, ft11
                  sra          tp, s10, t3
                  ori          s5, t6, 1873
                  fmin.s       ft3, ft3, ft7
                  mul          s7, s0, zero
                  feq.s        s10, fa5, ft2
                  srl          gp, t4, s4
                  fsgnjn.s     fs7, fs3, fs1
                  sltiu        t6, a5, -1418
                  xori         s10, sp, -1825
                  or           s4, s2, s4
                  feq.s        tp, ft8, fs3
                  fmv.x.w      s0, ft11
                  mulh         s8, s6, t4
                  lui          a7, 183721
                  srl          a0, tp, zero
                  sltu         a5, s9, s5
                  slt          a2, s1, t5
                  sub          a4, t3, a0
                  xor          a5, a5, t6
                  fclass.s     a1, fs4
                  fmv.x.w      t6, fs4
                  andi         a7, a6, -1112
                  remu         s7, s4, ra
                  xor          t4, t3, s11
                  sra          a1, s11, a2
                  add          a7, s9, s1
                  remu         a4, t3, a2
                  or           sp, ra, s8
                  rem          s2, a3, s7
                  ori          t0, t2, 1730
                  srai         a0, tp, 12
                  or           sp, t0, a6
                  fsgnjx.s     fa4, ft8, fs3
                  fadd.s       fa4, ft6, fa3
                  fcvt.wu.s    s1, fs5, rtz
                  slli         s5, a1, 28
                  xori         tp, a7, -776
                  sll          ra, a5, t5
                  mulh         ra, a0, s3
                  and          a3, s3, s5
                  srai         a1, s10, 28
                  fmax.s       ft2, fa4, fs10
                  and          s6, t4, a3
                  fcvt.wu.s    s2, fs6, rdn
                  div          a3, t3, a2
                  lui          s9, 224766
                  flt.s        s0, fa2, ft5
                  srli         t6, s0, 28
                  slti         s8, gp, 836
                  divu         s7, a7, a5
                  or           t1, t1, s10
                  sll          s6, a3, a0
                  fsgnjn.s     fs9, fs9, fs2
                  mul          gp, a6, a5
                  nop
                  fmv.x.w      s2, fa7
                  auipc        s0, 724183
                  add          a7, a0, t2
                  div          s10, a7, a7
                  sltu         t6, s4, a3
                  slti         t3, sp, -1633
                  fsgnjx.s     fs7, fa2, ft7
                  fadd.s       fa0, fs4, fs2, rne
                  divu         s1, s4, t4
                  fmv.w.x      ft2, s4
                  srli         a1, a4, 19
                  srai         gp, t4, 23
                  or           t2, t4, s6
                  sltu         s8, t2, t0
                  fle.s        a4, ft11, fa0
                  flt.s        t1, ft2, ft10
                  auipc        a3, 565150
                  xor          s9, a1, s8
                  fmv.w.x      fa6, t1
                  fmv.x.w      a3, fs2
                  mulh         gp, s2, a3
                  fclass.s     tp, fs7
                  slli         s1, t0, 4
                  fsgnjx.s     ft0, fa2, fa7
                  addi         a3, a7, 1505
                  xor          t2, a1, a1
                  remu         s5, t2, a2
                  sltiu        s6, s10, -1560
                  divu         s1, a6, sp
                  auipc        s2, 480443
                  fmv.x.w      tp, ft4
                  mul          t4, s3, t3
                  add          s8, t6, sp
                  divu         a1, zero, a7
                  mulh         s4, a4, t6
                  mulhu        a0, t6, s2
                  sltiu        s8, t1, -1280
                  sub          s1, tp, t6
                  slt          tp, s0, t1
                  mul          t0, tp, s9
                  flt.s        t2, fs8, fs5
                  auipc        s9, 385408
                  fadd.s       fs9, fs7, ft4, rmm
                  srl          s4, s4, a4
                  srai         s5, s1, 19
                  slli         s5, t2, 21
                  sub          t2, t3, t3
                  fclass.s     a6, fs9
                  fmax.s       fa3, fa4, fa1
                  srl          s7, a7, t3
                  fsgnjx.s     fs6, fa6, ft7
                  div          s1, s5, s4
                  auipc        a7, 968628
                  sll          t6, s9, t3
                  fmv.w.x      ft3, a2
                  sra          a2, t5, sp
                  or           t1, s8, a4
                  mulhu        t4, a3, s10
                  fclass.s     sp, fa4
                  srai         s7, a2, 24
                  fcvt.wu.s    t4, fs2
                  and          s4, s1, gp
                  feq.s        t6, ft0, fs7
                  fadd.s       fa5, fs3, fa3, rtz
                  srli         s4, zero, 16
                  fcvt.s.w     fa7, s2
                  xori         s9, a6, 819
                  slti         s2, ra, -1133
                  srl          a5, a7, s1
                  fcvt.wu.s    t6, fa7
                  xor          s7, t3, a0
                  fmv.w.x      fs3, s7
                  xor          a6, a3, s6
                  srai         s6, s9, 13
                  fsgnjn.s     fa2, fa0, fs8
                  fsub.s       ft9, fa6, ft11
                  fcvt.s.wu    fs1, a4, rdn
                  xor          a1, a0, ra
                  rem          t4, s10, a6
                  mulh         t3, tp, ra
                  lui          a4, 816423
                  lui          tp, 970218
                  ori          zero, s5, -2009
                  fcvt.s.w     fa3, t4
                  fadd.s       fa1, fs0, fs2
                  fcvt.s.wu    fa6, ra, rne
                  fcvt.w.s     a7, ft8, rne
                  fcvt.w.s     a0, fs10
                  fsgnj.s      ft4, ft1, fa6
                  sltiu        t6, s8, -1754
                  slli         t0, a0, 20
                  mul          a3, s3, s5
                  xori         a3, s0, -479
                  fmax.s       ft6, fs8, fa2
                  and          t2, tp, a0
                  xori         a5, s8, 1714
                  srli         s2, ra, 15
                  auipc        a7, 773600
                  fsgnj.s      fa3, fs6, fs7
                  div          s6, ra, s9
                  fadd.s       fs8, ft10, ft1, rup
                  sra          a2, a3, sp
                  fle.s        t3, ft0, fa2
                  fsgnjx.s     ft0, ft9, ft11
                  addi         sp, t3, 3
                  srli         a0, tp, 21
                  fsgnjn.s     fs6, ft5, fa7
                  feq.s        a3, ft11, fa2
                  fclass.s     t2, ft3
                  div          t1, s0, s1
                  slti         a0, s7, -1234
                  lui          zero, 579746
                  fmv.w.x      fa4, ra
                  lui          a7, 417196
                  or           s10, a1, s6
                  and          s4, t3, t1
                  div          t3, s0, sp
                  add          a3, t6, a7
                  fsub.s       ft2, ft11, ft7, rup
                  nop
                  srl          s2, sp, s8
                  fcvt.s.w     ft8, zero
                  nop
                  fmin.s       fs3, ft3, fs7
                  addi         s5, zero, 1303
                  mulh         t6, sp, zero
                  fsgnjx.s     ft0, fa7, fs0
                  feq.s        gp, fa4, ft6
                  fcvt.wu.s    s0, fa4
                  fsub.s       ft6, ft5, ft9, rne
                  fcvt.s.wu    fs4, a0, rtz
                  slt          s10, s9, a0
                  nop
                  fsgnj.s      fs6, fa7, ft2
                  fmax.s       fs6, ft9, fs2
                  srai         s6, s8, 18
                  fmax.s       ft10, fs6, fa3
                  fle.s        s4, fs9, fa4
                  sub          a3, s4, t0
                  fle.s        a1, ft2, ft5
                  xor          s0, s2, sp
                  nop
                  sltiu        s4, a5, -709
                  div          sp, s10, a6
                  srl          s10, s10, a4
                  srl          zero, a6, s9
                  div          a0, sp, s5
                  or           a4, s6, t0
                  fmax.s       fa6, ft10, fs7
                  feq.s        s4, fa1, fa4
                  fmv.w.x      fa0, ra
                  srl          s1, s5, t6
                  fsub.s       ft9, ft9, fa5, rne
                  fcvt.s.wu    ft10, t5
                  divu         s1, t5, ra
                  xor          s10, a2, s10
                  srai         t4, a7, 2
                  remu         s1, t5, s11
                  slti         s9, t2, -97
                  sub          zero, a3, t5
                  sub          s0, s11, a4
                  sltu         s7, t0, s2
                  fclass.s     s1, fs2
                  and          s4, a3, t4
                  fmv.x.w      t3, ft8
                  fcvt.s.wu    ft6, s4
                  fsgnjx.s     fa4, ft7, fa4
                  fcvt.w.s     a0, fa5
                  fclass.s     s5, fa6
                  mul          a1, s9, a2
                  feq.s        a4, fa0, ft11
                  srli         s1, s7, 6
                  sra          a5, s10, a0
                  srli         a4, t2, 22
                  div          s2, s6, a2
                  andi         gp, t3, -136
                  auipc        a0, 518883
                  sub          a0, s4, a5
                  or           t6, t4, a1
                  rem          a3, a0, t5
                  fmax.s       fs6, ft3, fa7
                  andi         t2, t1, 477
                  fcvt.w.s     a3, fs3
                  slti         a4, s11, -1355
                  fsgnjx.s     fs4, ft2, fs5
                  feq.s        ra, fs5, ft5
                  fsub.s       ft8, ft7, ft7
                  feq.s        s8, fs10, ft1
                  xor          a0, s8, a5
                  slt          s6, s11, t1
                  addi         s2, t5, 1422
                  sll          a5, t0, s11
                  slt          s10, tp, s1
                  xor          ra, a5, t0
                  srai         t6, t6, 30
                  add          t4, a1, t2
                  fcvt.s.wu    fa5, s0
                  mulhu        zero, gp, s4
                  and          s8, a0, a3
                  fmv.x.w      a7, fa1
                  fadd.s       fs11, fs7, fs5, rup
                  mul          s7, s3, s9
                  add          s9, s8, s7
                  fle.s        s0, fs1, fs5
                  fsgnjn.s     ft3, fs8, fs9
                  srli         a4, a4, 8
                  srai         t0, s10, 0
                  fle.s        t6, fa2, fs4
                  remu         s7, s0, gp
                  sltu         t2, s7, t4
                  rem          s10, a7, t4
                  fcvt.s.wu    fa4, s2, rmm
                  and          ra, t1, t3
                  fcvt.w.s     s5, ft9
                  add          s0, a2, tp
                  feq.s        s4, ft4, fs1
                  fmv.w.x      ft6, a3
                  fcvt.wu.s    s7, ft7, rup
                  andi         t3, s2, -668
                  remu         s2, s0, gp
                  fsgnjn.s     ft2, fa1, ft0
                  lui          a4, 717059
                  fmin.s       fs4, fs11, ft8
                  addi         t0, s5, -1412
                  fsub.s       fs5, ft7, fa0
                  mul          tp, s11, a5
                  mulhsu       t0, t6, t6
                  mulhu        s8, a7, t6
                  sub          s2, s1, s11
                  sub          a6, s9, s11
                  feq.s        a6, fa1, ft10
                  fmv.x.w      a1, fs4
                  slti         tp, a7, -1256
                  fmin.s       fs0, fs8, ft11
                  fsub.s       fs1, ft8, fs9
                  srai         t4, a5, 16
                  srli         a0, t5, 16
                  xor          t2, s0, s5
                  sll          s2, a4, s8
                  auipc        t0, 1009129
                  or           t3, gp, t1
                  fsgnjx.s     fa7, fs0, ft10
                  nop
                  sra          gp, s1, s6
                  mulhu        a7, zero, t2
                  andi         s5, t2, -428
                  xor          t6, t4, s2
                  remu         tp, a2, zero
                  fsgnj.s      ft7, ft10, fs6
                  nop
                  and          a0, a6, s8
                  lui          a5, 159585
                  sub          t1, a0, a4
                  srli         a0, a6, 5
                  fsgnj.s      fa4, fs3, fa7
                  fadd.s       ft2, fa6, ft7, rne
                  fsgnj.s      fs2, ft4, fs6
                  sra          s4, zero, a3
                  xor          tp, s9, s11
                  auipc        t6, 145207
                  and          ra, s6, s2
                  slli         s8, tp, 2
                  mulhu        a5, s11, a3
                  feq.s        tp, ft11, fa2
                  divu         s8, s9, zero
                  fcvt.s.wu    fa3, t5
                  ori          s9, s7, -835
                  sub          tp, tp, t5
                  sll          t1, s10, t0
                  slli         s4, a3, 13
                  xori         gp, s4, -1261
                  fclass.s     zero, fa4
                  fmv.x.w      a0, fs5
                  mulhu        t0, s11, s8
                  xori         gp, s5, 205
                  slli         s5, a7, 26
                  sra          a2, a5, t5
                  rem          a5, t4, t0
                  fmv.w.x      fs3, s0
                  rem          s7, a0, tp
                  fsgnjx.s     fs8, fs6, fa0
                  fadd.s       fa1, fs1, fs8, rne
                  div          s10, sp, s1
                  mulhu        a3, t0, a4
                  divu         s5, s10, t3
                  mulh         s10, sp, s11
                  xori         t6, zero, -2014
                  xor          sp, a6, a7
                  auipc        s2, 513122
                  remu         zero, sp, a7
                  fmax.s       ft8, fa6, fs1
                  xori         s2, a0, -595
                  sltiu        a1, tp, 1121
                  sll          zero, s1, s6
                  fsgnjn.s     fs0, fs1, fs0
                  fcvt.w.s     a2, fa1, rne
                  fmv.x.w      s9, fs8
                  sra          s1, a7, t0
                  fsub.s       fs5, fs6, ft1, rne
                  xori         s9, t0, -355
                  fadd.s       fa3, fs3, fs2, rup
                  sub          a0, zero, t3
                  lui          sp, 441067
                  feq.s        a5, fa7, fs3
                  srli         a5, s11, 29
                  remu         s5, a2, s9
                  flt.s        a4, ft2, fs3
                  flt.s        s7, ft7, fs6
                  remu         a2, ra, t4
                  fcvt.s.w     fs11, s6
                  slti         a5, s9, -1710
                  addi         s4, a1, -743
                  xor          s5, t6, sp
                  sub          t4, sp, zero
                  sll          sp, ra, s11
                  fcvt.wu.s    t3, fs0
                  sra          s5, s5, a4
                  sub          s4, a4, s8
                  fmv.x.w      s1, fs0
                  feq.s        s8, fa1, ft5
                  fsgnjn.s     ft1, ft10, ft8
                  fmv.x.w      t3, fa6
                  fsgnjn.s     fa6, fs9, ft9
                  fcvt.w.s     s2, ft8
                  auipc        s2, 149473
                  fle.s        s1, ft9, fa7
                  mulh         t1, a2, a5
                  div          s0, zero, a3
                  nop
                  sll          sp, a1, s1
                  srai         t3, a2, 16
                  fle.s        s1, fa6, fa3
                  or           s9, s2, a5
                  sltu         ra, a6, tp
                  fsgnj.s      fs8, ft11, ft1
                  slli         zero, zero, 2
                  xori         t1, sp, -719
                  fsgnjx.s     ft6, fs4, fs10
                  mulh         t6, s8, gp
                  sltiu        s8, sp, 1956
                  mulh         tp, sp, s5
                  sra          t3, t6, t0
                  sra          t0, t0, t1
                  srl          a3, s8, s4
                  fsgnjn.s     fs3, ft5, fa0
                  nop
                  fmax.s       ft3, ft9, ft1
                  flt.s        a7, ft3, fa1
                  fcvt.wu.s    t6, fs8
                  rem          a5, s6, a7
                  xor          s5, s1, tp
                  add          s8, s3, s5
                  nop
                  or           t1, s5, s10
                  srli         s10, s0, 12
                  feq.s        a5, ft8, ft7
                  mulhu        a2, s4, t0
                  fcvt.w.s     s0, ft1
                  slli         gp, s11, 25
                  srl          a6, ra, gp
                  slti         t2, s3, -1906
                  srl          t2, t1, ra
                  fcvt.s.wu    fa5, a3, rmm
                  auipc        t2, 593655
                  srai         gp, sp, 9
                  mulhsu       a6, t6, t1
                  sll          t4, a4, t1
                  slti         zero, zero, 1944
                  sll          a4, s2, gp
                  ori          zero, gp, 203
                  div          s4, s10, t0
                  slti         tp, tp, -1963
                  ori          zero, t2, -165
                  mul          a1, a3, zero
                  fsub.s       fs0, ft5, fa5
                  fadd.s       fs7, ft5, fs10
                  slti         a2, t3, -1771
                  mul          s6, a1, s11
                  fle.s        t6, ft6, fa2
                  fcvt.s.w     ft10, s8, rne
                  add          s1, s9, zero
                  fcvt.w.s     s0, ft0
                  div          t1, a7, sp
                  auipc        a3, 323353
                  addi         s2, a1, -425
                  srai         a0, a6, 16
                  srli         a1, a4, 13
                  addi         t6, ra, -2015
                  divu         a1, a1, t6
                  fcvt.w.s     s4, fs10, rup
                  sltiu        s0, s9, -1002
                  addi         a1, a3, 2021
                  fsub.s       fs11, fs9, fa1, rmm
                  auipc        a4, 975680
                  flt.s        a5, ft11, fs3
                  div          a2, t6, s1
                  sltiu        s0, a3, 190
                  fadd.s       ft1, fa1, ft6, rtz
                  slt          a2, s4, t4
                  fmv.w.x      fs5, s2
                  mulhu        s6, a4, s10
                  and          t6, ra, t4
                  andi         t1, a2, 725
                  fmax.s       ft4, fa3, ft6
                  slli         t0, t5, 20
                  fcvt.w.s     a1, fs7, rup
                  sra          s8, a2, s1
                  fmv.w.x      ft2, t5
                  fmv.w.x      ft7, t0
                  fadd.s       fs5, fa3, ft7, rup
                  fmv.x.w      zero, ft4
                  div          sp, t4, zero
                  slli         ra, tp, 16
                  sll          a4, a0, s7
                  fcvt.w.s     a2, fs11
                  fclass.s     a1, ft0
                  slti         s10, zero, -1233
                  andi         sp, s3, -627
                  mulh         s9, s11, t3
                  slt          s6, tp, s11
                  fmax.s       fs5, fs2, fs5
                  fcvt.w.s     s6, fs7, rmm
                  mulh         t0, s3, s10
                  xori         a6, a4, -1524
                  sra          s5, s10, s11
                  fle.s        a5, ft1, fs10
                  mulhsu       s10, t5, s1
                  sub          s2, s1, s5
                  fsgnjn.s     fa1, ft3, fs0
                  xor          a4, sp, a1
                  sra          a0, s5, s4
                  remu         s5, s1, a0
                  or           a2, t1, s6
                  sub          a7, s0, s2
                  divu         a2, t1, t6
                  mulhsu       t1, s9, s10
                  addi         t0, ra, 992
                  andi         a5, gp, -1928
                  fsgnjx.s     fa0, fs7, fs1
                  sub          s0, a3, a5
                  srai         s0, a4, 16
                  and          ra, s9, s2
                  fcvt.s.wu    fs4, a3, rtz
                  slt          t0, a1, s2
                  nop
                  sltu         s7, t1, a3
                  sub          t1, s2, a4
                  remu         s2, s6, s0
                  add          tp, t6, s0
                  fmv.w.x      fs3, a4
                  fadd.s       ft5, fa4, ft8
                  fsgnjn.s     fa3, fs2, fs7
                  mulhsu       a5, t5, s1
                  fcvt.wu.s    t1, fs0, rdn
                  fcvt.s.wu    ft7, s6
                  fcvt.s.wu    ft2, s6
                  div          a5, s1, s11
                  add          a7, a2, ra
                  divu         s5, t5, s9
                  nop
                  fsgnj.s      fs5, ft9, fa7
                  mulhsu       s10, s3, a0
                  andi         s2, a6, 1241
                  fadd.s       ft6, ft11, ft6, rtz
                  or           s6, a6, s4
                  fcvt.w.s     t2, fs3, rdn
                  fmax.s       fs2, fs3, fs6
                  fle.s        s0, ft5, fs2
                  fmv.x.w      sp, fs0
                  flt.s        s8, ft11, fs8
                  sub          gp, a5, a7
                  xori         s6, t5, -1330
                  sub          s9, a3, s9
                  fsgnjx.s     ft7, ft10, ft4
                  remu         s0, sp, t0
                  slt          a1, s11, tp
                  fmax.s       fs2, ft7, fs2
                  lui          a7, 981733
                  fmax.s       ft0, fs9, fa4
                  andi         s6, sp, -1402
                  and          a4, a5, t4
                  sra          a2, t6, t5
                  fcvt.w.s     s8, ft1
                  sltiu        s10, s1, -27
                  flt.s        t2, ft2, ft10
                  nop
                  sub          a5, ra, a5
                  and          a2, t0, ra
                  fle.s        a5, ft0, fs10
                  srli         t0, a6, 12
                  feq.s        s10, fa5, fa3
                  srai         tp, t5, 6
                  fsgnjx.s     ft9, ft2, ft8
                  or           s9, a3, a6
                  nop
                  fsgnj.s      fs9, ft5, ft8
                  sub          t0, t0, a0
                  sltiu        s8, ra, -514
                  fmv.w.x      fs11, t4
                  fmv.x.w      ra, fs3
                  slti         a7, a7, -1836
                  mulhu        t2, a7, s1
                  lui          t0, 919939
                  fmax.s       ft10, ft7, fs7
                  fcvt.s.w     ft3, s5
                  mulh         a3, s1, gp
                  fcvt.s.w     ft1, gp, rup
                  fmin.s       ft9, fs0, fs0
                  remu         a6, s8, s6
                  mul          gp, s0, t5
                  nop
                  srli         s10, s2, 4
                  and          t1, a2, s10
                  slli         a3, s3, 6
                  remu         tp, s4, tp
                  lui          a4, 928562
                  mulh         s7, s9, s7
                  mulhsu       t6, a0, t4
                  srli         t3, t4, 28
                  rem          a0, zero, a0
                  sltu         t0, s3, s2
                  fsub.s       ft4, fs0, ft10, rdn
                  and          s0, s5, sp
                  div          a6, s3, s3
                  fmv.w.x      fa4, a7
                  and          s4, s0, a1
                  rem          t0, ra, a7
                  fcvt.w.s     t4, fs6, rmm
                  srl          ra, s7, t1
                  fmv.w.x      fa0, sp
                  fmax.s       fa3, ft8, ft11
                  auipc        zero, 405392
                  slli         a0, s1, 16
                  sltiu        t4, s11, 1507
                  fmin.s       fa4, fa2, ft4
                  srli         s1, s9, 24
                  mulhu        sp, s2, s8
                  fadd.s       fa3, fs2, fs7
                  fmv.x.w      a3, fs11
                  fadd.s       ft1, fs4, fa6, rne
                  rem          a3, sp, ra
                  ori          t4, t1, -1377
                  and          zero, s0, s3
                  remu         a4, s5, a7
                  slt          t3, a6, t4
                  sll          t6, t2, a6
                  flt.s        s2, fs9, fs6
                  feq.s        gp, fs11, fa0
                  lui          zero, 879897
                  lui          a4, 963085
                  ori          a4, gp, 1545
                  sra          s2, gp, s5
                  andi         gp, t1, -1745
                  fmin.s       fs4, fa5, fa6
                  fmv.x.w      s7, fa7
                  fsgnjx.s     ft0, ft4, fa2
                  div          s6, a5, tp
                  srl          a2, gp, s9
                  feq.s        a4, fa6, fs3
                  slti         a5, gp, 1068
                  add          a2, sp, s9
                  divu         a0, s7, s2
                  rem          s0, a4, t3
                  addi         s9, t0, -389
                  sll          s0, a1, t0
                  fcvt.wu.s    t6, ft6
                  xori         t2, s10, 1520
                  rem          s1, s1, t5
                  fcvt.w.s     s4, fs7, rtz
                  nop
                  srl          s4, s8, t0
                  sub          s8, t1, s8
                  remu         a5, s6, a0
                  rem          s10, a6, ra
                  fmv.w.x      fs10, s6
                  sll          s1, tp, s3
                  fmv.w.x      fs10, a0
                  fle.s        t4, ft5, ft1
                  xori         zero, t6, -1979
                  slt          s9, t3, s11
                  mulhu        t3, tp, a6
                  fsub.s       ft9, fs9, fa1, rdn
                  div          t3, tp, s1
                  sub          s7, a7, tp
                  rem          zero, a1, a1
                  mulh         s6, t5, s10
                  srai         s8, a2, 22
                  slt          t0, s7, s9
                  srai         s5, t3, 28
                  srl          s6, a2, s7
                  fsgnjn.s     ft1, fa7, fa5
                  xor          s8, s6, s6
                  fsgnjn.s     fs0, ft0, ft5
                  auipc        gp, 701869
                  fadd.s       ft7, ft11, fs6, rdn
                  mulh         ra, s10, s0
                  fcvt.s.wu    ft8, a3
                  sra          a2, a3, ra
                  srai         s4, s3, 2
                  slli         zero, ra, 26
                  mulhsu       s5, a7, t3
                  rem          a4, a6, a2
                  slli         s2, zero, 7
                  or           gp, s7, a3
                  add          gp, a2, s8
                  or           a0, t3, s6
                  addi         t2, s7, 839
                  fmax.s       fa0, fa1, ft10
                  flt.s        s4, ft6, fs3
                  sub          tp, s0, a1
                  mulh         tp, a7, s0
                  slti         s8, t5, -1263
                  divu         s2, t2, t4
                  srai         a1, s11, 6
                  auipc        s8, 572166
                  xor          s1, t5, tp
                  flt.s        s1, fs0, fs10
                  xor          ra, a3, s6
                  fsgnj.s      ft11, fs4, fs2
                  fsgnj.s      ft11, fs3, fa1
                  fclass.s     ra, fa4
                  fsgnjn.s     ft11, ft10, fs2
                  lui          t4, 104980
                  fadd.s       ft8, fs4, fs8
                  fmax.s       ft6, fs1, ft0
                  fmin.s       fs6, fa0, fa2
                  divu         s7, a5, s9
                  srli         s4, a6, 11
                  fmin.s       ft9, fa5, fa1
                  andi         t1, s6, 1922
                  fle.s        ra, fa6, fa7
                  flt.s        t2, ft6, fs0
                  srli         sp, a2, 4
                  lui          a0, 446144
                  flt.s        s0, fs4, fs5
                  fcvt.w.s     s1, fa5, rmm
                  sll          t4, s5, zero
                  fmv.x.w      gp, fs2
                  remu         t6, s1, a7
                  sra          tp, t2, zero
                  and          sp, s6, t3
                  or           s8, s0, s8
                  flt.s        ra, fs1, fs3
                  mul          t6, s4, t0
                  srli         s6, s11, 1
                  div          s9, s6, s10
                  mulh         s9, t2, a4
                  ori          zero, s8, 1382
                  div          a1, a0, t6
                  div          t6, a7, ra
                  fmv.w.x      ft10, s11
                  fmv.x.w      t4, ft3
                  remu         a3, s11, a6
                  auipc        a7, 623514
                  remu         sp, t1, t3
                  fsgnj.s      ft0, ft7, fs10
                  fmv.x.w      a5, fs7
                  fclass.s     s0, fa3
                  lui          a7, 424467
                  andi         s4, zero, 1990
                  nop
                  sll          ra, s1, t1
                  or           a4, s6, sp
                  fcvt.s.wu    fa5, a1, rmm
                  xori         zero, a6, -1209
                  auipc        s8, 381101
                  add          t6, s9, a6
                  sub          t4, t4, a0
                  xor          a4, s4, t2
                  div          t1, a2, s6
                  slt          gp, ra, sp
                  sra          s7, t6, a1
                  fle.s        t2, fs11, fs1
                  srai         s0, a3, 5
                  addi         s10, t6, -845
                  fsub.s       ft11, ft2, fs7
                  fcvt.w.s     a7, fa6
                  addi         a7, s3, 1263
                  ori          a4, t1, 283
                  sltu         a5, sp, s11
                  srai         s5, zero, 0
                  nop
                  fsub.s       ft3, fs6, fa1, rtz
                  and          s0, s6, t0
                  feq.s        t6, ft3, fa0
                  fcvt.w.s     a2, ft9
                  fcvt.s.w     fa0, t5, rup
                  sltu         sp, s5, t4
                  fcvt.s.w     fa0, a2, rtz
                  or           t3, a3, a4
                  srli         t6, t2, 5
                  fle.s        a0, ft10, ft0
                  sltiu        t0, sp, -1571
                  addi         zero, a5, 803
                  fmin.s       fs6, fa6, fs2
                  rem          s1, t4, s4
                  add          a0, a4, ra
                  sltu         a7, t0, a5
                  mul          tp, sp, zero
                  xor          s2, s11, sp
                  fcvt.wu.s    a3, ft8, rtz
                  mul          s7, a3, a7
                  slt          zero, t0, s9
                  slti         t6, sp, 248
                  sltu         s2, zero, t4
                  sra          gp, s11, s3
                  xori         a0, t6, 1714
                  slli         a6, a1, 1
                  mulhsu       tp, t1, a4
                  mulhsu       s8, a7, a5
                  slt          tp, a7, s5
                  fcvt.wu.s    t3, fs7, rdn
                  lui          gp, 644220
                  feq.s        a5, fs1, fa7
                  sub          t2, s0, t2
                  fle.s        a3, fs4, fs9
                  fsgnjn.s     fs10, fs3, fs1
                  mulhsu       s5, s5, s10
                  rem          t3, zero, t4
                  fcvt.wu.s    a6, fs8
                  slti         a4, t5, -1745
                  fcvt.wu.s    tp, ft4
                  fsub.s       fa0, fa4, ft6, rdn
                  mulh         s6, s7, t2
                  remu         zero, sp, s7
                  nop
                  andi         a6, s3, 224
                  xori         s2, a5, -536
                  addi         tp, s1, 632
                  sub          t0, t3, t5
                  sltu         s10, s4, a1
                  srl          a2, a3, t3
                  lui          t4, 955495
                  sltiu        s1, a6, 1495
                  srl          s5, s10, zero
                  fsgnjx.s     fs9, fa0, fa5
                  addi         a6, sp, -175
                  mulh         ra, s7, s9
                  or           t4, zero, t3
                  rem          s9, s0, t4
                  mulh         s9, a5, a0
                  xor          a6, t0, t4
                  and          a3, t3, a7
                  fsgnjx.s     ft4, ft7, ft1
                  mul          t3, s5, zero
                  sltu         s8, t5, ra
                  mulh         a4, s8, a1
                  auipc        zero, 915752
                  fsgnj.s      fa0, fs1, fs9
                  xor          t3, t0, s2
                  nop
                  xor          a6, a2, s10
                  xor          s2, t4, t3
                  fsgnjx.s     fa2, ft5, ft7
                  fcvt.wu.s    a4, ft3, rup
                  divu         s7, s2, a6
                  feq.s        a1, fs4, fa1
                  fcvt.w.s     a0, ft7
                  mul          s10, a1, t5
                  fsgnjn.s     fs4, ft3, fa6
                  fsub.s       fa0, ft4, ft4
                  srli         a7, s1, 0
                  sra          a0, tp, s4
                  fclass.s     t1, ft1
                  rem          sp, s8, a4
                  mulhsu       s2, a6, sp
                  fmin.s       fa1, fa5, ft2
                  flt.s        gp, fa1, fs0
                  or           a4, t0, a3
                  slli         s9, a6, 4
                  srli         ra, zero, 14
                  fadd.s       fa4, fs0, fs4, rdn
                  fsgnj.s      fs9, ft2, ft2
                  feq.s        s0, fa5, fa0
                  sub          s6, t1, a5
                  slli         s2, s8, 26
                  fsgnjn.s     fs10, fs8, ft6
                  srai         s4, s9, 9
                  xori         s1, s6, -1126
                  sub          s5, s3, s0
                  nop
                  mulh         tp, s2, s1
                  nop
                  sltu         s1, s0, s5
                  ori          s8, t2, -666
                  mulh         ra, tp, s4
                  slt          s1, s9, tp
                  feq.s        ra, ft4, ft7
                  slli         a2, s3, 5
                  fcvt.wu.s    s7, fs11
                  ori          s0, s7, 1261
                  addi         t2, s9, -1363
                  fle.s        a2, fa3, ft6
                  fle.s        s7, fs3, fa5
                  fmv.x.w      t2, ft1
                  and          a1, ra, t3
                  slli         a1, s9, 3
                  fmv.w.x      fs3, t6
                  srai         s5, a3, 13
                  sra          a4, s10, s11
                  slt          s2, a7, t2
                  nop
                  sll          s6, t4, t5
                  fcvt.s.w     fs10, a0, rdn
                  srai         a0, a2, 12
                  fadd.s       fs1, fa3, fs5, rtz
                  or           s5, s8, t1
                  or           a6, s8, tp
                  andi         gp, t3, -1767
                  xori         t0, s9, 1184
                  sub          sp, a3, a0
                  mulh         s9, a1, a7
                  rem          zero, s2, s1
                  and          s10, s7, t2
                  div          s8, a6, s2
                  div          a5, a3, t0
                  fcvt.wu.s    s2, ft2, rdn
                  feq.s        t3, fa2, fs11
                  fsgnj.s      fs7, ft3, ft7
                  sltiu        a5, s4, 700
                  flt.s        ra, fs0, fs4
                  mulhu        s4, t2, ra
                  divu         a0, s9, s1
                  flt.s        s7, fs6, ft11
                  flt.s        t4, fs8, fs4
                  div          s9, t0, s4
                  auipc        s4, 67446
                  fclass.s     s8, fs6
                  flt.s        a6, fs10, fs9
                  remu         s1, a2, t1
                  sltiu        s10, s6, 242
                  ori          s5, s7, -1779
                  addi         s9, s6, 726
                  andi         zero, s0, 337
                  div          a1, s9, s3
                  div          zero, zero, s5
                  fcvt.s.wu    fs4, zero, rdn
                  addi         s10, zero, 1621
                  nop
                  xor          s0, a5, t2
                  rem          a3, s4, a6
                  or           s4, t1, s4
                  fadd.s       fs4, fs0, fa1, rup
                  fle.s        s4, ft7, ft7
                  nop
                  fcvt.s.w     ft9, s9, rup
                  mulh         s1, gp, t5
                  sub          sp, s0, a0
                  fsub.s       fa5, fs3, fs9, rtz
                  srli         tp, t5, 30
                  fclass.s     s1, fs10
                  add          a4, s9, s8
                  sra          t6, a3, gp
                  addi         a5, s2, -1942
                  or           sp, sp, t2
                  fclass.s     zero, ft8
                  divu         s1, s11, s6
                  mulh         a7, s3, ra
                  mulhsu       a6, a2, s7
                  fle.s        t1, fs8, fa7
                  sltiu        a3, t6, 1210
                  fsgnjn.s     ft10, fa3, fs8
                  lui          s10, 779019
                  fcvt.wu.s    a4, fa5, rdn
                  divu         ra, t3, t1
                  fmax.s       ft2, fs10, fa1
                  sltiu        s9, a0, 904
                  slti         t3, a2, -31
                  fclass.s     t6, fs7
                  rem          a5, tp, s1
                  fcvt.w.s     s8, ft11, rdn
                  or           s8, t4, s1
                  div          s9, a7, t0
                  xor          s2, s4, s2
                  add          s1, s4, s11
                  mulhu        s5, s11, sp
                  mulh         a3, s11, t5
                  fmv.w.x      fa7, t2
                  sltu         a1, zero, s5
                  fadd.s       ft11, ft9, ft1, rup
                  lui          s9, 678097
                  fsub.s       fa5, fa5, ft0
                  slti         s7, t5, 171
                  fsgnjn.s     fs8, ft9, fs1
                  fsgnjn.s     fa0, fa1, fs0
                  nop
                  mulh         sp, s0, s2
                  sltiu        tp, a7, 1061
                  fclass.s     s10, fs7
                  remu         a1, sp, s10
                  fclass.s     a5, fa0
                  fsub.s       fs6, fs9, fs5, rtz
                  slti         t2, tp, -61
                  mulh         tp, a5, s0
                  div          a6, t1, t2
                  srli         sp, a7, 24
                  mulh         a7, a0, a4
                  srai         a4, t4, 16
                  sltiu        s10, s11, 1871
                  slli         t3, ra, 26
                  fle.s        t1, ft2, ft4
                  auipc        t3, 108889
                  srai         s1, a3, 14
                  slt          a3, t0, s4
                  fcvt.w.s     tp, fa5, rdn
                  sra          gp, a4, gp
                  add          a1, s11, s5
                  lui          s9, 537732
                  fsgnjn.s     fa1, ft8, fs5
                  addi         tp, s8, -143
                  add          s2, s2, s10
                  xor          a4, s6, sp
                  fsgnjn.s     ft8, fs8, fs9
                  addi         t6, t4, -1148
                  rem          a7, s4, s9
                  xor          a3, a7, t2
                  auipc        a6, 535074
                  fadd.s       ft9, fa7, fs4
                  feq.s        t4, fa3, fa2
                  auipc        gp, 823403
                  lui          s2, 940024
                  mul          a7, t2, s0
                  fcvt.s.wu    fa4, a0
                  srl          t1, t1, t1
                  ori          ra, s3, 1893
                  add          s1, gp, s2
                  sra          sp, a4, s4
                  nop
                  mulhsu       a3, a1, s9
                  fsub.s       fs7, ft8, ft6
                  mulhu        t0, a3, t3
                  slt          tp, sp, a2
                  xor          gp, s9, zero
                  flt.s        a7, ft6, fa1
                  sll          s5, a4, s3
                  sll          s7, a4, t4
                  fcvt.w.s     s5, fs0, rne
                  sltiu        a6, a6, 340
                  srai         s6, s3, 12
                  feq.s        t3, fa3, fa3
                  mul          s10, s5, s6
                  fsgnj.s      ft1, ft9, fs9
                  fcvt.w.s     a7, ft5, rtz
                  fsgnj.s      ft2, fa4, fa5
                  add          s6, tp, t0
                  remu         t0, t1, t0
                  fcvt.s.wu    ft5, t3, rdn
                  rem          zero, a4, a0
                  slt          a5, t1, s6
                  sra          a2, t4, t4
                  add          a1, tp, ra
                  rem          ra, a5, a5
                  feq.s        sp, fs5, ft5
                  andi         t1, t0, -875
                  ori          s8, t1, -718
                  mul          a4, s10, s11
                  add          t4, s1, a5
                  add          a3, tp, s11
                  nop
                  and          a0, t3, a6
                  addi         zero, sp, -1301
                  mulhsu       s7, t0, a7
                  auipc        s1, 166334
                  nop
                  fmv.x.w      a0, fa2
                  sll          s8, a6, t3
                  fcvt.s.w     fa2, s0
                  sltiu        a6, s0, -1659
                  feq.s        t4, fs4, ft5
                  sltiu        a6, s9, 573
                  fmv.x.w      a2, ft5
                  slt          t2, t3, ra
                  sub          gp, a5, t4
                  flt.s        s9, fs2, ft3
                  mulhu        t2, a7, s10
                  and          a7, tp, s2
                  divu         a2, ra, t5
                  remu         t2, t5, s4
                  or           ra, s10, s8
                  ori          t4, s1, 591
                  remu         s1, a2, s3
                  fle.s        a3, fa3, fs1
                  fcvt.s.wu    ft2, a7, rmm
                  sltu         s6, t2, a6
                  fcvt.s.wu    fa1, a0
                  srl          s6, s7, zero
                  nop
                  fcvt.s.w     fs1, t1, rup
                  fcvt.w.s     a5, ft2
                  fcvt.w.s     s10, fs1, rmm
                  slti         s6, sp, 1146
                  mulh         gp, a1, t2
                  ori          a7, s10, -126
                  fsgnj.s      fa6, ft1, fs8
                  fsgnj.s      fa6, fa5, fs7
                  fmv.w.x      fs2, s9
                  xori         t3, s4, -1781
                  fsgnjx.s     ft10, fs8, ft9
                  srl          t6, t3, t2
                  fcvt.s.wu    fs4, a1, rne
                  lui          a5, 422846
                  fsub.s       fs10, fa7, ft5, rmm
                  lui          a2, 583869
                  mulh         a4, t1, s1
                  fmax.s       fs7, fs8, fs2
                  srl          a5, gp, t1
                  add          gp, s1, a7
                  fmv.w.x      fs2, t0
                  lui          tp, 989204
                  auipc        s0, 288300
                  sll          t3, s4, a6
                  addi         s9, a1, -86
                  fcvt.s.wu    ft10, a3
                  srli         t4, a2, 5
                  fcvt.w.s     gp, fs4, rtz
                  fmax.s       fs7, ft7, fs7
                  sltu         s10, a1, s2
                  xori         s4, sp, -1553
                  fmv.w.x      fa0, t1
                  ori          zero, s6, -354
                  fcvt.s.w     fs11, s5
                  fadd.s       fa6, fs7, ft0, rne
                  remu         a3, a0, t2
                  fsgnjn.s     fs8, ft1, ft11
                  fmv.w.x      ft11, s5
                  slli         t4, ra, 30
                  fmv.x.w      s6, fs6
                  andi         s9, sp, -1951
                  sra          s0, s11, zero
                  sltu         s4, a4, a5
                  slli         s5, tp, 11
                  fcvt.s.w     fa0, t4
                  rem          a4, s4, s10
                  remu         s5, sp, s6
                  fmv.w.x      ft6, a7
                  sll          s6, s8, s0
                  fcvt.wu.s    a3, fs6
                  fcvt.wu.s    s4, fs11
                  slli         a1, s6, 13
                  and          gp, s7, s1
                  mulh         a5, a0, a7
                  mulhsu       a4, a6, t4
                  nop
                  mulhu        t2, s3, t6
                  div          s5, a0, s9
                  fcvt.s.w     ft4, tp, rmm
                  fmax.s       ft3, ft11, ft11
                  sltu         s10, t5, a5
                  auipc        a1, 385690
                  addi         a4, s9, 1461
                  sltiu        a4, a0, 1534
                  sltiu        s0, a0, -1461
                  xor          tp, t0, zero
                  fmv.x.w      s6, fs4
                  rem          a6, ra, a0
                  fcvt.w.s     s5, fs6
                  srli         s6, t1, 16
                  sra          t6, a2, s3
                  sra          tp, ra, a3
                  and          a0, s11, t3
                  rem          a3, s3, a2
                  sra          t3, zero, sp
                  sll          t4, t1, s2
                  fsgnj.s      fs3, ft4, fa4
                  sra          t1, sp, t6
                  xori         s7, s2, -933
                  sra          a5, a4, t6
                  xor          a3, gp, s3
                  feq.s        tp, ft5, ft1
                  xori         t0, t2, -57
                  fcvt.s.wu    ft6, gp
                  sra          a4, t5, t1
                  sll          t1, s3, s0
                  ori          a3, s1, -849
                  mulhsu       s4, s10, s11
                  mulhsu       s8, s11, t4
                  fcvt.s.w     fs1, s0, rdn
                  sra          a7, a3, s11
                  ori          t3, ra, 782
                  srli         t1, a7, 29
                  fmin.s       fs6, fs8, ft11
                  fmax.s       ft5, fs8, fs0
                  fmin.s       fs10, fa2, fa7
                  add          a2, a5, a4
                  divu         sp, s5, t2
                  fmv.w.x      fa7, s7
                  xor          s10, t5, t1
                  xor          s9, s9, a6
                  add          t2, s10, a5
                  flt.s        s8, fs4, ft1
                  mulh         a3, s11, t1
                  addi         a0, t0, 460
                  sub          tp, ra, a4
                  and          t4, s9, a7
                  slli         a4, s2, 7
                  divu         s8, s8, t0
                  xor          s9, a4, a2
                  fle.s        s7, fs8, fs11
                  ori          zero, s7, -52
                  slti         s4, s6, 840
                  sltiu        s9, s9, -1104
                  nop
                  sra          s8, s5, t1
                  auipc        s0, 338804
                  fsgnj.s      fa2, fa4, fs7
                  feq.s        a7, fs2, ft1
                  mulhsu       a4, a0, zero
                  sra          s0, t1, zero
                  fcvt.w.s     s4, ft6, rne
                  sltu         s5, s11, s7
                  mulhsu       t0, s6, t1
                  fcvt.w.s     sp, ft1, rmm
                  fcvt.wu.s    t0, fa2
                  sub          t2, a2, t1
                  srli         zero, s0, 27
                  lui          a4, 214443
                  auipc        a4, 296539
                  fmax.s       ft2, ft9, ft7
                  sltiu        t2, a6, 73
                  nop
                  srl          s6, a6, sp
                  sltu         gp, ra, a7
                  remu         gp, t2, s1
                  andi         s8, a7, -494
                  auipc        s5, 273479
                  slt          ra, t0, s5
                  sra          s1, s5, a5
                  mulhu        gp, t0, a1
                  srai         a7, s4, 3
                  nop
                  ori          a1, gp, -1103
                  mulh         a0, t1, t2
                  andi         sp, t1, 996
                  fcvt.w.s     a2, ft8, rmm
                  mul          s6, gp, a6
                  ori          s2, t2, 442
                  fmax.s       ft1, fa5, fs8
                  remu         s0, a5, gp
                  remu         s8, a6, gp
                  auipc        t1, 278505
                  mul          s7, a6, t3
                  fmv.x.w      s9, ft9
                  sub          s5, t0, t3
                  mul          s5, a6, s5
                  ori          a5, t3, -1460
                  srli         t3, zero, 17
                  sll          zero, t5, a0
                  xori         s0, a2, -219
                  srli         s6, s6, 9
                  remu         t0, s1, s7
                  fclass.s     a4, fs6
                  mulh         t4, a1, t5
                  fsgnjx.s     ft7, fs10, ft9
                  fmv.x.w      a2, fa0
                  fmv.w.x      ft9, t3
                  xor          a5, a3, a5
                  sltiu        s9, a1, -686
                  xor          gp, a6, zero
                  fsgnj.s      fs0, fs4, fa4
                  fcvt.s.w     ft7, sp, rmm
                  add          t0, s3, a3
                  fmin.s       ft6, ft10, fs3
                  auipc        t3, 1014739
                  srl          s5, t2, a4
                  feq.s        a1, ft3, fs4
                  and          s8, a5, gp
                  div          t6, sp, t6
                  fsub.s       fa7, ft1, ft9, rup
                  mul          s8, s7, t0
                  slti         t0, a7, 610
                  mulhsu       s6, s3, a2
                  fle.s        gp, fs8, fa3
                  ori          zero, sp, 1858
                  srl          t1, t1, s1
                  sra          s9, sp, s8
                  and          s1, s4, t1
                  mulhu        a2, s9, s6
                  fcvt.s.wu    fa2, a0
                  mulhsu       s7, a6, sp
                  fadd.s       fs6, fa3, fa5
                  fmin.s       ft11, ft10, fa4
                  fle.s        t0, fs1, fa3
                  mul          tp, s0, t0
                  srl          zero, a4, s9
                  andi         a3, t6, -1968
                  sra          zero, a1, a3
                  fsub.s       ft0, ft5, ft11
                  divu         s8, t1, s11
                  add          s7, gp, a7
                  fsgnjn.s     ft11, ft5, ft10
                  or           s6, a0, s8
                  fsgnjn.s     fs3, fa2, ft4
                  add          a0, t4, s2
                  srli         s2, a6, 26
                  fsgnjx.s     ft1, ft7, fa6
                  mulh         a4, a4, sp
                  mul          s0, a2, t2
                  feq.s        t0, fs6, fa6
                  sub          zero, gp, s4
                  fsub.s       ft6, fa1, fa0
                  and          t0, ra, s7
                  xor          s5, ra, s4
                  mul          a7, t1, tp
                  flt.s        a5, fs0, fs1
                  sub          s2, s3, s3
                  fle.s        t3, ft0, fs9
                  sra          s0, t6, t2
                  fclass.s     a6, fs5
                  srl          s2, t0, s2
                  mulhu        a3, a4, a4
                  slt          a6, s5, a7
                  fadd.s       fa4, ft1, ft1, rne
                  add          s7, a4, t5
                  sll          a3, s10, t2
                  div          a1, a2, s4
                  divu         s9, sp, t5
                  srli         a0, s9, 0
                  fcvt.s.wu    fs3, t2
                  slt          sp, s2, s5
                  fcvt.s.wu    ft1, zero
                  srl          a7, gp, s11
                  fcvt.s.w     ft0, s4
                  fcvt.s.w     fs6, s10, rtz
                  fcvt.wu.s    s10, ft5
                  fmax.s       fs3, ft9, fs6
                  mulhu        a4, a5, a6
                  fsgnj.s      ft5, fa7, fs7
                  fmax.s       ft4, ft3, fa5
                  add          sp, a5, s8
                  fsgnj.s      fa2, ft5, ft8
                  xor          s7, tp, t0
                  fsub.s       fs10, fs4, ft0, rdn
                  fsgnjn.s     ft0, fa6, ft0
                  div          a5, s7, s3
                  srl          a6, a5, s3
                  xor          t4, t4, t5
                  sub          t4, gp, s8
                  sub          a0, s7, a1
                  nop
                  xori         s9, t6, 648
                  fcvt.wu.s    s5, fs11
                  sra          t4, a1, s4
                  fsgnj.s      fa7, ft9, fs6
                  fsgnj.s      fs6, ft4, ft0
                  slti         sp, t2, -1727
                  rem          s9, gp, t3
                  fmv.w.x      fs3, a1
                  sltiu        a2, s1, 569
                  xori         s1, s9, -1536
                  xori         a3, a1, 355
                  divu         zero, zero, t1
                  div          t3, a6, t6
                  xor          t4, gp, t5
                  fadd.s       fs0, fs0, ft11, rdn
                  div          a0, gp, zero
                  fcvt.s.wu    ft8, s7, rmm
                  rem          t4, s6, t4
                  fcvt.s.w     fs6, t0, rup
                  sltu         t3, s8, a3
                  auipc        t2, 606243
                  fsgnj.s      fa1, fa4, fs1
                  feq.s        a3, ft9, ft5
                  fmv.x.w      s1, fa1
                  srl          tp, s11, a2
                  and          s0, t5, t2
                  fcvt.w.s     t0, fs5, rdn
                  addi         tp, t1, 1660
                  fsgnjx.s     ft7, fs10, fs2
                  mul          t2, t5, s10
                  fcvt.s.w     ft1, a7
                  fsgnjn.s     fs0, fs4, fs3
                  sll          gp, a7, t0
                  sll          zero, s9, zero
                  lui          t3, 87740
                  fcvt.w.s     a1, fa0, rtz
                  andi         sp, s4, 299
                  srli         a2, s11, 0
                  remu         ra, sp, s3
                  fcvt.s.w     ft3, t2, rne
                  fsgnjn.s     ft0, ft4, fa3
                  srai         s0, t4, 27
                  addi         a0, s3, 467
                  fmv.x.w      a4, fs1
                  sub          tp, s0, t0
                  fcvt.s.wu    ft1, t0
                  add          t4, tp, t5
                  fmv.x.w      a5, fs9
                  fmv.x.w      s2, fs2
                  divu         sp, s1, s0
                  fcvt.w.s     t2, fa3, rmm
                  flt.s        s2, ft8, ft7
                  or           a5, s4, s10
                  ori          t1, t0, 1483
                  nop
                  fmv.w.x      fs8, ra
                  nop
                  remu         zero, zero, s0
                  sra          s10, t1, s0
                  fclass.s     a1, ft10
                  remu         s0, t2, t5
                  ori          s9, t6, -1520
                  andi         s8, a7, 1081
                  addi         s2, s6, -445
                  fsgnjx.s     fs9, fs3, fa5
                  srai         gp, ra, 14
                  nop
                  or           a7, a5, s5
                  mulhu        a6, ra, t6
                  div          a6, a2, t0
                  divu         a6, a1, t4
                  fmv.x.w      s8, fa4
                  sltu         t1, tp, s10
                  slt          s10, s6, a6
                  fadd.s       fa4, fa1, ft11, rtz
                  auipc        sp, 492311
                  divu         t3, t1, s6
                  ori          s5, s1, 805
                  fcvt.wu.s    a5, fs3, rup
                  fle.s        t1, fs0, fa4
                  fle.s        a1, ft8, ft5
                  fsgnjn.s     ft11, ft6, fa3
                  and          t0, s5, a3
                  srli         s8, a5, 22
                  fle.s        s10, fa7, ft9
                  slti         s8, s2, -694
                  mul          sp, s5, a4
                  fsgnj.s      fs4, fs4, ft2
                  flt.s        a1, ft11, fs2
                  fcvt.w.s     t1, ft9
                  addi         tp, sp, 945
                  nop
                  auipc        a4, 951033
                  xor          gp, a4, s4
                  auipc        zero, 145013
                  ori          a4, t0, 1438
                  fsgnjx.s     fs5, fs6, fa1
                  xor          s0, t4, t2
                  add          tp, s2, a4
                  sub          t2, s10, a3
                  lui          s5, 75322
                  fcvt.w.s     tp, fa5
                  auipc        a7, 106701
                  fcvt.s.w     fa5, t0, rdn
                  xor          a7, a3, t2
                  sltiu        s9, s3, 1939
                  rem          s5, t0, a7
                  feq.s        t1, ft5, fs11
                  remu         s10, s8, sp
                  sltiu        a3, s4, 1927
                  remu         t3, t3, t5
                  add          a1, s2, a1
                  sra          a5, s0, t5
                  div          s8, s7, zero
                  sltu         t3, a6, s11
                  mulhsu       sp, t5, s8
                  fcvt.s.w     ft8, s9, rtz
                  fcvt.w.s     s4, fs0
                  sltu         zero, a3, s8
                  fmv.x.w      t2, fa0
                  xor          t2, a5, t0
                  sltu         s2, s7, t2
                  fclass.s     s0, fa3
                  mul          t0, s1, s6
                  add          s8, a4, t0
                  addi         s6, a1, 1393
                  srli         a6, s6, 10
                  divu         a5, t1, a5
                  flt.s        a0, fs2, fs1
                  mulhsu       a6, s0, s7
                  fsgnjn.s     fs7, fs0, ft0
                  fmax.s       fs3, ft5, fs5
                  sltiu        t4, s10, -1981
                  mul          t6, tp, s1
                  auipc        t1, 791842
                  mulhu        zero, t4, s5
                  andi         t6, a7, 1703
                  fsgnjx.s     fa6, fs1, fs2
                  or           t2, t5, s7
                  divu         a6, s0, s2
                  mulh         s10, gp, a7
                  sltu         sp, s10, s4
                  andi         t6, t2, 1893
                  fsgnj.s      ft10, fa7, ft9
                  fmv.w.x      ft8, a1
                  mulhsu       zero, s6, s0
                  la x19, test_done
                  jalr x0, x19, 0
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
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_2:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_3:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_4:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_5:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_6:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_7:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_8:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_9:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_10:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_11:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_12:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_13:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_14:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

mmode_intr_vector_15:
                  addi x30, x30, -4
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x342 # MCAUSE
                  srli x6, x6, 0x1f
                  beqz x6, 1f
                  j mmode_intr_handler
                  1: la x19, test_done
                  jalr x0, x19, 0

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
                  sw  x27, (x30)
                  add x27, x30, zero
                  addi x27, x27, -128
                  sw  x1, 4(x27)
                  sw  x2, 8(x27)
                  sw  x3, 12(x27)
                  sw  x4, 16(x27)
                  sw  x5, 20(x27)
                  sw  x6, 24(x27)
                  sw  x7, 28(x27)
                  sw  x8, 32(x27)
                  sw  x9, 36(x27)
                  sw  x10, 40(x27)
                  sw  x11, 44(x27)
                  sw  x12, 48(x27)
                  sw  x13, 52(x27)
                  sw  x14, 56(x27)
                  sw  x15, 60(x27)
                  sw  x16, 64(x27)
                  sw  x17, 68(x27)
                  sw  x18, 72(x27)
                  sw  x19, 76(x27)
                  sw  x20, 80(x27)
                  sw  x21, 84(x27)
                  sw  x22, 88(x27)
                  sw  x23, 92(x27)
                  sw  x24, 96(x27)
                  sw  x25, 100(x27)
                  sw  x26, 104(x27)
                  sw  x27, 108(x27)
                  sw  x28, 112(x27)
                  sw  x29, 116(x27)
                  sw  x30, 120(x27)
                  sw  x31, 124(x27)
                  add x30, x27, zero
                  csrr x6, 0x341 # MEPC
                  csrr x6, 0x342 # MCAUSE
                  li x21, 0x3 # BREAKPOINT
                  beq x6, x21, ebreak_handler
                  li x21, 0x8 # ECALL_UMODE
                  beq x6, x21, ecall_handler
                  li x21, 0x9 # ECALL_SMODE
                  beq x6, x21, ecall_handler
                  li x21, 0xb # ECALL_MMODE
                  beq x6, x21, ecall_handler
                  li x21, 0x1
                  beq x6, x21, instr_fault_handler
                  li x21, 0x5
                  beq x6, x21, load_fault_handler
                  li x21, 0x7
                  beq x6, x21, store_fault_handler
                  li x21, 0xc
                  beq x6, x21, pt_fault_handler
                  li x21, 0xd
                  beq x6, x21, pt_fault_handler
                  li x21, 0xf
                  beq x6, x21, pt_fault_handler
                  li x21, 0x2 # ILLEGAL_INSTRUCTION
                  beq x6, x21, illegal_instr_handler
                  csrr x21, 0x343 # MTVAL
                  1: la x19, test_done
                  jalr x1, x19, 0

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
                  la x19, write_tohost
                  jalr x0, x19, 0

instr_fault_handler:
                  add x27, x30, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x30, x27, zero
                  lw  x27, (x30)
                  addi x30, x30, 4
                  mret

load_fault_handler:
                  add x27, x30, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x30, x27, zero
                  lw  x27, (x30)
                  addi x30, x30, 4
                  mret

store_fault_handler:
                  add x27, x30, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x30, x27, zero
                  lw  x27, (x30)
                  addi x30, x30, 4
                  mret

ebreak_handler:   
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x27, x30, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x30, x27, zero
                  lw  x27, (x30)
                  addi x30, x30, 4
                  mret

illegal_instr_handler:
                  csrr  x6, 0x341
                  addi  x6, x6, 4
                  csrw  0x341, x6
                  add x27, x30, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x30, x27, zero
                  lw  x27, (x30)
                  addi x30, x30, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x6, 0x300 # MSTATUS;
                  csrr  x6, 0x304 # MIE;
                  csrr  x6, 0x344 # MIP;
                  csrrc x6, 0x344, x6 # MIP;
                  add x27, x30, zero
                  lw  x1, 4(x27)
                  lw  x2, 8(x27)
                  lw  x3, 12(x27)
                  lw  x4, 16(x27)
                  lw  x5, 20(x27)
                  lw  x6, 24(x27)
                  lw  x7, 28(x27)
                  lw  x8, 32(x27)
                  lw  x9, 36(x27)
                  lw  x10, 40(x27)
                  lw  x11, 44(x27)
                  lw  x12, 48(x27)
                  lw  x13, 52(x27)
                  lw  x14, 56(x27)
                  lw  x15, 60(x27)
                  lw  x16, 64(x27)
                  lw  x17, 68(x27)
                  lw  x18, 72(x27)
                  lw  x19, 76(x27)
                  lw  x20, 80(x27)
                  lw  x21, 84(x27)
                  lw  x22, 88(x27)
                  lw  x23, 92(x27)
                  lw  x24, 96(x27)
                  lw  x25, 100(x27)
                  lw  x26, 104(x27)
                  lw  x27, 108(x27)
                  lw  x28, 112(x27)
                  lw  x29, 116(x27)
                  lw  x30, 120(x27)
                  lw  x31, 124(x27)
                  addi x27, x27, 128
                  add x30, x27, zero
                  lw  x27, (x30)
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
