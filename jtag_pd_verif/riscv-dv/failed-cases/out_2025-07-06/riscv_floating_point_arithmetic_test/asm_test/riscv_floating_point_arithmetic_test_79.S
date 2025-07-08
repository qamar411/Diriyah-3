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
                  li x29, 0x40001120
                  csrw 0x301, x29
kernel_sp:        
                  la x20, kernel_stack_end

trap_vec_init:    
                  la x29, mtvec_handler
                  ori x29, x29, 1
                  csrw 0x305, x29 # MTVEC

mepc_setup:       
                  la x29, init
                  csrw 0x341, x29

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x29, 0x3800
                  csrw 0x300, x29 # MSTATUS
                  li x29, 0x0
                  csrw 0x304, x29 # MIE
                  mret
init:             
                  li x29, 0
                  fmv.w.x f0, x29
                  li x29, 5050276
                  fmv.w.x f1, x29
                  li x29, 2147483648
                  fmv.w.x f2, x29
                  li x29, 2139095040
                  fmv.w.x f3, x29
                  li x29, 2147483648
                  fmv.w.x f4, x29
                  li x29, 2147483648
                  fmv.w.x f5, x29
                  li x29, 4286578688
                  fmv.w.x f6, x29
                  li x29, 4286578688
                  fmv.w.x f7, x29
                  li x29, 7829474
                  fmv.w.x f8, x29
                  li x29, 0
                  fmv.w.x f9, x29
                  li x29, 2147483648
                  fmv.w.x f10, x29
                  li x29, 2148514127
                  fmv.w.x f11, x29
                  li x29, 2139095041
                  fmv.w.x f12, x29
                  li x29, 2139095040
                  fmv.w.x f13, x29
                  li x29, 4286578688
                  fmv.w.x f14, x29
                  li x29, 2139095040
                  fmv.w.x f15, x29
                  li x29, 2166535733
                  fmv.w.x f16, x29
                  li x29, 2139095041
                  fmv.w.x f17, x29
                  li x29, 2143289344
                  fmv.w.x f18, x29
                  li x29, 4286578687
                  fmv.w.x f19, x29
                  li x29, 2151560706
                  fmv.w.x f20, x29
                  li x29, 2147483648
                  fmv.w.x f21, x29
                  li x29, 4286578688
                  fmv.w.x f22, x29
                  li x29, 2139095041
                  fmv.w.x f23, x29
                  li x29, 3236907898
                  fmv.w.x f24, x29
                  li x29, 2151903143
                  fmv.w.x f25, x29
                  li x29, 4286578688
                  fmv.w.x f26, x29
                  li x29, 1332665
                  fmv.w.x f27, x29
                  li x29, 2149420749
                  fmv.w.x f28, x29
                  li x29, 2802859213
                  fmv.w.x f29, x29
                  li x29, 2143289344
                  fmv.w.x f30, x29
                  li x29, 1439813183
                  fmv.w.x f31, x29
                  fsrmi 4
                  li x0, 0xc
                  li x1, 0x6
                  li x2, 0xb888d1ff
                  li x3, 0x0
                  li x4, 0x9d003bfb
                  li x5, 0xfc8a0b4b
                  li x6, 0x1
                  li x7, 0x24aef20c
                  li x8, 0x80000000
                  li x9, 0x80000000
                  li x10, 0xe0de5f2b
                  li x11, 0xf058456f
                  li x12, 0x0
                  li x13, 0xf28e4a03
                  li x14, 0x72cb4a24
                  li x15, 0x0
                  li x17, 0x80000000
                  li x18, 0xe
                  li x19, 0x80000000
                  li x21, 0x2
                  li x22, 0x0
                  li x23, 0x0
                  li x24, 0x2ed48c1b
                  li x25, 0x7a6cbfbd
                  li x26, 0xb
                  li x27, 0xd
                  li x28, 0x2
                  li x29, 0x99407df0
                  li x30, 0x0
                  li x31, 0x80000000
                  la x16, user_stack_end
main:             srli         t1, s8, 12
                  flt.s        ra, ft10, ft7
                  addi         gp, t3, 1266
                  fmul.s       ft1, ft1, fs2
                  srli         tp, s7, 5
                  mul          sp, t0, t4
                  fmin.s       fs1, fa6, fs1
                  mulhsu       s6, s3, t2
                  ori          sp, a0, 639
                  fcvt.w.s     t5, ft11, rmm
                  ori          tp, t2, -1346
                  srli         a7, t2, 27
                  srl          t5, s0, t5
                  fmul.s       fa5, fs5, ft4, rdn
                  xor          s9, a4, s4
                  add          t5, t2, s8
                  fadd.s       fa5, fs9, fa7
                  fmv.x.w      ra, fs11
                  fadd.s       fs11, ft2, fs4
                  and          a1, a5, a0
                  nop
                  fadd.s       ft11, fs2, fa3
                  andi         t0, a4, -312
                  fmin.s       fs11, fs8, fa3
                  xor          s2, gp, gp
                  xor          tp, s11, gp
                  fmin.s       ft9, fs10, fa0
                  fcvt.wu.s    sp, fa0
                  fsgnjn.s     ft8, ft1, ft4
                  fsgnj.s      fs4, ft5, ft2
                  feq.s        tp, fa5, fs6
                  fcvt.s.w     fs3, a3
                  xor          s5, s2, t2
                  fadd.s       fs1, fs4, ft3
                  fcvt.w.s     a7, fa0, rtz
                  slti         s3, t5, -1648
                  fclass.s     s9, ft7
                  mulhsu       a3, s0, a1
                  sll          tp, a6, t3
                  fclass.s     t1, ft9
                  slt          gp, a7, sp
                  sll          t5, a4, sp
                  sltiu        s5, a2, -1450
                  div          a0, t4, sp
                  remu         s5, a6, ra
                  fsgnj.s      fs5, ft3, ft3
                  fsgnjn.s     fs2, fs0, ft10
                  fle.s        t0, fs5, fs11
                  fsgnjn.s     fa3, fa3, ft8
                  fadd.s       ft0, ft4, fa5
                  fcvt.s.wu    fa6, a6
                  fsub.s       ft11, ft5, ft10, rne
                  sltiu        s1, s10, -757
                  fmv.x.w      s9, fs1
                  div          gp, t5, t1
                  srli         gp, s0, 16
                  mulh         s5, s11, t0
                  sra          s8, sp, s4
                  fmv.w.x      fa5, a3
                  fmin.s       fs4, fs10, ft11
                  divu         s2, s9, a2
                  fcvt.w.s     s7, ft6
                  mulh         tp, t1, s4
                  slti         t6, t5, 1716
                  fcvt.s.w     fa5, s11
                  fsgnjx.s     fs4, fa3, fs11
                  nop
                  fmax.s       fs0, ft3, ft9
                  or           a1, t4, a3
                  fadd.s       fs3, ft10, fa7, rtz
                  divu         tp, t4, s9
                  srai         t0, a3, 13
                  fclass.s     t6, fs6
                  sra          t0, s5, s1
                  fsgnjx.s     fs11, ft7, ft2
                  fle.s        s5, fa4, fs6
                  divu         zero, t4, s0
                  nop
                  sra          a7, t1, t1
                  lui          s10, 1036121
                  fclass.s     s5, fs10
                  addi         tp, zero, -1889
                  sra          ra, t6, t4
                  ori          s5, t6, 1724
                  sltu         gp, s3, a1
                  srli         t5, s3, 26
                  fcvt.w.s     t2, fa2
                  rem          t4, a2, tp
                  xor          t0, t3, a6
                  nop
                  addi         tp, sp, 1923
                  sll          a1, t0, s1
                  add          t5, t3, s5
                  mulh         t2, a1, a7
                  div          a3, t6, tp
                  slt          ra, s3, s9
                  and          s10, zero, sp
                  fmul.s       fs3, fs1, ft4, rup
                  fcvt.s.w     fs8, s6, rtz
                  slti         a7, a5, -841
                  addi         t6, s6, -1403
                  sra          sp, sp, s6
                  div          ra, a2, s9
                  slti         a7, zero, -1540
                  fdiv.s       ft11, fs7, fs10
                  fdiv.s       ft8, fs11, fa4, rtz
                  srai         s0, a2, 2
                  slli         a3, s0, 6
                  fadd.s       ft11, fa3, fs1
                  fle.s        a2, ft3, fa5
                  sub          a2, t5, s8
                  mulhu        s7, zero, s6
                  fsgnj.s      fs2, fa3, fs0
                  nop
                  fcvt.w.s     zero, fs6, rmm
                  fadd.s       fs11, fs4, fs1
                  slt          tp, s11, a3
                  fmax.s       ft3, fs1, ft10
                  fsgnjn.s     ft8, fs0, fs7
                  flt.s        t2, fa7, ft5
                  addi         s2, zero, -1227
                  fmv.x.w      s10, ft8
                  sra          s6, a1, a5
                  fsgnj.s      ft1, ft6, ft9
                  sltu         a2, s4, a6
                  sub          s6, a6, a6
                  flt.s        t3, ft11, fs2
                  fadd.s       ft9, ft2, ft11
                  mulhsu       s6, a0, t5
                  feq.s        s2, fs6, fa6
                  sll          s8, s0, s7
                  srai         t2, sp, 13
                  slt          s9, s8, a2
                  slti         s5, t5, -1218
                  mulh         t1, gp, t1
                  sltiu        a3, s9, 1329
                  addi         sp, s5, 385
                  fsgnjn.s     fs8, fa0, ft3
                  fcvt.s.wu    ft3, a4, rmm
                  sll          s11, s9, t5
                  sltu         ra, s4, sp
                  xor          s8, sp, a2
                  fmv.w.x      ft6, a3
                  fsqrt.s      fs9, ft9
                  sltu         s6, s7, s1
                  rem          zero, t5, s10
                  slt          s0, s7, t1
                  fclass.s     s7, fs11
                  slli         t1, s4, 10
                  mulhu        tp, t5, a0
                  srli         s11, s4, 18
                  addi         s2, s4, 807
                  fcvt.wu.s    s1, fs6
                  fmul.s       fa3, fs4, ft5
                  slti         s7, t5, 101
                  fcvt.s.w     ft8, t5
                  fdiv.s       fa3, fa2, fs2
                  slt          t4, s1, a6
                  sub          s11, s2, s7
                  or           s2, s6, s0
                  lui          s9, 705030
                  slt          t0, sp, s0
                  div          a1, a6, a7
                  fmv.w.x      fs1, t2
                  fmul.s       ft5, fs9, fs10
                  sll          tp, a7, s7
                  mulhsu       ra, s8, a0
                  lui          s11, 337740
                  sltu         t5, a0, a1
                  sll          tp, s7, gp
                  fcvt.w.s     ra, fs6
                  fmv.w.x      fs8, ra
                  srl          t1, tp, t6
                  srli         tp, a4, 22
                  div          s9, a6, a2
                  ori          t4, s7, -648
                  fmul.s       ft4, fa2, fs4, rmm
                  ori          s0, t5, 375
                  xori         a3, s0, -367
                  sll          t1, t4, s3
                  slli         s10, s7, 14
                  sub          t6, t5, t2
                  fsgnj.s      ft7, fs9, fs1
                  slti         t3, gp, 1622
                  lui          t4, 199123
                  andi         s1, s2, 2040
                  fmv.x.w      t2, fa6
                  addi         t4, ra, -494
                  add          s1, t3, a6
                  andi         s2, s11, 1587
                  nop
                  div          a3, gp, a6
                  or           s11, t1, sp
                  auipc        s10, 316131
                  fsgnj.s      fa4, fa7, fa4
                  slli         t5, tp, 15
                  ori          tp, a3, 814
                  div          a0, t6, t6
                  srai         s6, a7, 24
                  fsub.s       ft5, fa2, fa3
                  fsgnjx.s     fs6, ft10, fs3
                  flt.s        s5, fa7, fa5
                  mulh         s9, t6, a3
                  fcvt.w.s     t0, fs6, rup
                  fdiv.s       ft7, ft7, fs10
                  mulh         a0, a0, s8
                  slli         s3, t0, 20
                  lui          t6, 850993
                  mul          s7, s2, a4
                  add          t0, s8, s3
                  sltu         t1, a2, t2
                  fmul.s       fa3, fs2, fa1, rtz
                  mulh         a2, gp, s7
                  fle.s        t4, fs2, ft1
                  fsgnj.s      ft2, fs3, ft10
                  and          s0, a3, a4
                  srl          a0, s2, zero
                  fcvt.s.w     fs11, t6
                  fcvt.w.s     a1, ft8, rne
                  fsub.s       fs8, ft3, fs9
                  lui          t2, 464004
                  fmax.s       fs9, fa3, fa6
                  fmin.s       ft3, fs9, fa0
                  fsgnj.s      ft4, fa1, fs9
                  lui          t2, 253658
                  mulhsu       t1, s7, s1
                  rem          a5, sp, s3
                  and          s10, s5, s5
                  div          sp, a4, a0
                  fsgnj.s      fa3, ft0, fs9
                  or           s8, t2, a5
                  fmax.s       fa0, fs8, fa3
                  fadd.s       ft1, fa1, fs10
                  fmv.w.x      ft0, t2
                  fcvt.s.w     ft2, s6
                  fmv.x.w      t4, fa7
                  fmax.s       fa0, fa6, ft1
                  divu         s1, t5, s0
                  auipc        s5, 57098
                  fcvt.wu.s    s5, fs5, rdn
                  and          a0, a2, t0
                  mulh         zero, s8, a0
                  fle.s        s2, fs5, fa6
                  add          sp, t3, tp
                  fsgnjn.s     fa7, ft4, fa3
                  fsub.s       fs8, fs1, fs11, rtz
                  mulh         a7, s9, gp
                  sll          s3, t3, s11
                  sltu         s6, t4, a6
                  fsgnj.s      fs0, fs0, ft6
                  fsub.s       ft1, ft6, fa4, rdn
                  fle.s        t4, fs0, fa1
                  fle.s        t1, fa3, fs0
                  fmin.s       fs9, fs3, fa6
                  fsqrt.s      fa7, fs3
                  fcvt.w.s     s8, fa2
                  fsgnj.s      fs5, fa1, fa4
                  fcvt.wu.s    s11, fa0, rdn
                  fmv.w.x      ft9, s6
                  fadd.s       fa4, fa3, ft8
                  fcvt.wu.s    a5, ft2
                  flt.s        s11, fs0, ft2
                  mul          s3, s8, t4
                  sltiu        s6, sp, -918
                  andi         t6, a0, 1852
                  fadd.s       fs3, fa0, fs0
                  slti         sp, tp, -84
                  slt          a0, gp, zero
                  divu         t3, a7, a6
                  srai         s5, t2, 16
                  sll          t4, zero, a4
                  fsgnjx.s     fs10, fa5, fa6
                  fmul.s       fs9, fs8, fs7
                  slt          s0, s10, tp
                  remu         s5, s5, a4
                  fmul.s       fa0, fs9, ft8
                  sub          s3, s1, zero
                  fmv.w.x      ft11, s4
                  mulhsu       s11, t4, a5
                  andi         a5, s1, -975
                  mulh         sp, s8, t6
                  sll          gp, s7, t3
                  andi         s11, s4, -1798
                  nop
                  feq.s        t1, fs5, ft8
                  slti         a3, a3, 583
                  or           s9, a5, t1
                  fmax.s       fs8, fs11, fs3
                  divu         a2, t3, s4
                  slt          t1, s11, s9
                  fsgnj.s      fs7, ft6, ft10
                  nop
                  slti         gp, t3, -1710
                  div          a0, t1, s3
                  nop
                  sltu         s3, a0, s9
                  srl          s1, a1, a7
                  mulh         t5, ra, a6
                  ori          t3, s9, 1030
                  nop
                  srli         s9, t0, 20
                  srai         t6, s11, 5
                  fadd.s       ft8, ft8, fa3
                  slt          a3, s0, tp
                  slt          t1, s6, tp
                  auipc        s8, 107115
                  xor          s7, s2, s2
                  slt          s1, a2, t1
                  mul          s1, s5, a3
                  fmv.w.x      fs4, s6
                  sltiu        s9, tp, 373
                  srai         gp, ra, 17
                  flt.s        a0, fa7, fa1
                  rem          zero, s11, a4
                  add          t6, s2, s7
                  fmv.x.w      s10, fa4
                  fclass.s     t1, fa2
                  ori          ra, s0, 40
                  xori         s9, s10, -1237
                  fcvt.s.w     fs0, s7
                  andi         t0, s1, -1511
                  slt          t5, a4, t4
                  slti         s3, tp, -852
                  fmul.s       fa5, fa7, ft6, rdn
                  fdiv.s       fa0, fs3, ft5, rdn
                  rem          s1, a7, s3
                  srl          gp, a2, s0
                  remu         s10, s5, t1
                  sltiu        ra, zero, -1666
                  remu         a7, s0, s0
                  or           s10, t4, s5
                  flt.s        sp, ft8, fs7
                  fcvt.w.s     a0, fa2, rne
                  sll          s3, a1, s0
                  and          a5, s5, sp
                  auipc        a0, 594880
                  fsgnjx.s     fs10, ft8, fs9
                  fadd.s       fa3, fa3, ft0
                  slti         s8, s10, -259
                  fsqrt.s      fa4, ft6
                  addi         zero, s3, 1573
                  xori         ra, sp, 1303
                  fmax.s       fa6, fs0, ft6
                  fsgnjn.s     fs4, ft8, ft1
                  fsqrt.s      ft11, ft10, rup
                  fmv.w.x      ft0, a2
                  fclass.s     a7, ft9
                  srli         s2, s10, 28
                  sltiu        s7, s4, -1083
                  mul          s3, s9, gp
                  fmv.w.x      ft10, a7
                  ori          a1, zero, 1902
                  slt          tp, sp, zero
                  nop
                  add          tp, gp, s1
                  slti         s6, s4, 1451
                  addi         sp, s0, -1238
                  fcvt.s.w     ft4, a1
                  fcvt.w.s     s9, fa7
                  ori          s1, s10, -143
                  fsgnjn.s     ft4, fa6, ft0
                  sll          a1, t1, ra
                  fmax.s       ft10, fs8, fs11
                  nop
                  nop
                  fcvt.wu.s    a7, ft4
                  mulhsu       a5, a3, s7
                  fadd.s       fs0, fs4, fs3
                  mul          s0, t3, s0
                  sltu         zero, s2, a5
                  add          gp, a0, a7
                  fsgnj.s      fs7, fa1, ft2
                  lui          s9, 32637
                  remu         a7, ra, s4
                  fsqrt.s      fa3, fa5
                  mulh         a2, s5, a2
                  fsgnjx.s     fs6, fs5, fa1
                  xori         s3, sp, 66
                  fmul.s       ft4, ft7, fs10, rne
                  slti         s6, a2, 1250
                  divu         gp, s3, t4
                  fcvt.s.w     fs10, a4
                  feq.s        a7, fa4, fs11
                  xor          a2, s11, t6
                  auipc        a3, 211220
                  remu         t2, a4, a0
                  slti         a3, a2, 1276
                  fclass.s     t1, fa0
                  flt.s        t1, ft5, fa2
                  mulhu        ra, tp, s3
                  fclass.s     s6, fa2
                  fmin.s       ft6, fa4, fs10
                  addi         s8, a7, -60
                  lui          s5, 257230
                  mul          s8, t6, s2
                  sll          a3, ra, s0
                  fsqrt.s      ft6, fa6, rmm
                  fcvt.s.w     ft0, t6
                  add          ra, a2, ra
                  fcvt.w.s     s10, ft7
                  sltu         t1, s3, s8
                  sub          s11, a4, s8
                  sltu         a0, s2, s0
                  andi         t5, s11, 1704
                  and          s6, s11, s8
                  slti         s3, t6, 45
                  fsqrt.s      fa7, ft3, rdn
                  rem          t0, s1, t0
                  mulhsu       s11, a2, a2
                  remu         s0, ra, s1
                  fsgnj.s      ft4, fs7, ft9
                  sll          t3, s4, a0
                  fmax.s       fs5, fa0, fa3
                  remu         ra, zero, s3
                  srli         gp, s11, 23
                  divu         s8, t0, a1
                  addi         t5, tp, -1881
                  auipc        t5, 397661
                  fmv.w.x      fs10, s3
                  fsgnjn.s     fs5, fa3, fs3
                  fclass.s     gp, fs10
                  fdiv.s       fs3, fs3, ft2
                  fmax.s       ft6, ft3, ft7
                  slti         t5, t3, 724
                  sll          sp, a3, s1
                  sll          s7, t0, s2
                  remu         t2, gp, s10
                  fcvt.s.wu    fa6, tp
                  fcvt.wu.s    a7, fs11, rtz
                  fcvt.wu.s    t6, fa3
                  fmax.s       fa3, fa4, ft2
                  fsqrt.s      ft2, fs5
                  auipc        t5, 737063
                  add          a2, t6, t0
                  fsub.s       ft3, ft3, fs4
                  div          t0, a1, s11
                  sltu         a7, s0, t2
                  fadd.s       fa2, fs9, ft6, rmm
                  sub          a2, a6, a2
                  mulh         s6, s8, s5
                  fsqrt.s      ft8, fs6
                  fadd.s       fs5, fa5, fs1, rmm
                  slli         t5, ra, 8
                  add          ra, a2, s2
                  andi         t6, t4, 1107
                  fsgnjn.s     fa5, fs2, fs6
                  sll          a1, s9, s2
                  mul          s8, ra, a6
                  nop
                  slt          s7, a3, s4
                  srai         s2, a1, 20
                  divu         sp, s6, t0
                  feq.s        s7, fa4, ft1
                  fsqrt.s      fs11, fs10
                  and          s9, s6, t1
                  ori          t4, a6, -1021
                  fclass.s     t4, fs9
                  mul          s7, t0, t1
                  sltiu        t6, t1, 1336
                  mulh         s1, s11, ra
                  srai         ra, a5, 11
                  fmv.x.w      s9, fa5
                  addi         s5, t4, 1998
                  srl          s6, s1, ra
                  fsgnjx.s     ft9, fs8, fa6
                  remu         t3, t3, a7
                  srai         s8, zero, 3
                  slt          s9, ra, a5
                  fsgnj.s      fs4, fa6, fs11
                  fmv.x.w      zero, ft0
                  lui          a7, 945672
                  fsgnjx.s     ft8, fa4, ft1
                  flt.s        s1, fs3, fa2
                  sub          a5, t6, t3
                  fmv.w.x      ft1, s0
                  mulh         s2, a0, s8
                  add          a7, a4, s9
                  fsgnjn.s     fs8, fa1, ft0
                  addi         a3, sp, 17
                  nop
                  remu         sp, s11, sp
                  fle.s        a5, fs4, ft8
                  add          t4, zero, sp
                  nop
                  fsgnjn.s     fs0, fa6, fs11
                  flt.s        a0, fs9, fs5
                  addi         s7, s3, -1331
                  slt          s0, s9, t3
                  remu         a2, gp, s10
                  sub          ra, s0, s7
                  sltiu        t2, gp, 1389
                  xor          s8, a7, tp
                  fmv.w.x      fs6, s0
                  xor          s3, tp, s11
                  xor          s2, s6, s11
                  sltiu        s11, a3, -1723
                  lui          gp, 893830
                  fadd.s       ft2, fa6, ft7, rdn
                  fmax.s       fs6, fa2, fa1
                  or           ra, t0, a1
                  srl          s3, t2, t5
                  fmax.s       fa4, fs3, ft7
                  add          gp, s6, a2
                  fsub.s       fa4, fa7, fa7, rdn
                  flt.s        s8, fs1, ft10
                  mul          t2, s11, s2
                  fmv.x.w      sp, fa1
                  fsgnj.s      ft6, ft5, fa4
                  lui          t3, 903700
                  ori          tp, a2, -206
                  mul          s2, t2, zero
                  lui          s8, 787370
                  fcvt.s.wu    ft11, a2, rne
                  fmin.s       ft3, fs9, fa4
                  and          t2, t0, s8
                  srl          s7, gp, a3
                  sra          a0, s1, gp
                  fmin.s       ft9, fa1, fa0
                  srli         t1, a3, 31
                  fcvt.s.w     fs11, s5, rne
                  and          s10, a5, s5
                  or           s3, a7, t2
                  lui          t4, 507028
                  divu         a0, t0, a0
                  sltiu        a1, ra, 1941
                  mul          a1, a4, zero
                  lui          s8, 119632
                  feq.s        s11, fs3, ft3
                  or           tp, a7, zero
                  slti         s2, s9, 1496
                  slli         s1, a0, 4
                  fmul.s       ft2, fa3, ft8
                  fmv.x.w      tp, fs11
                  mul          s8, s10, ra
                  mulh         a5, t1, ra
                  slti         s6, gp, 2021
                  and          t4, a7, t0
                  fcvt.s.w     fs10, t2
                  mulh         tp, s10, s8
                  fsub.s       ft5, fa3, fs4, rne
                  sltu         sp, t1, t0
                  fadd.s       ft5, ft4, fa5, rmm
                  fmax.s       fs1, ft9, fs4
                  mul          s3, zero, s5
                  div          t2, s2, zero
                  fsqrt.s      fa4, fs2
                  slt          a5, t5, a6
                  or           tp, a4, s7
                  sra          t6, a5, a4
                  fmin.s       ft2, ft3, fa2
                  fdiv.s       fs8, fa3, fa3
                  xori         zero, s2, 1184
                  fmul.s       fs6, ft5, fa3
                  lui          s11, 581590
                  fmul.s       ft3, fs4, fa3
                  mulhsu       a5, a4, a4
                  ori          a3, t6, 1643
                  fclass.s     t2, fs4
                  fsgnj.s      fs7, ft4, ft3
                  sra          s9, t4, a2
                  mulhu        t1, s7, s5
                  fcvt.s.wu    fa7, s10
                  lui          s8, 700114
                  sra          t2, t6, t0
                  fmax.s       ft7, ft1, fa5
                  div          a7, t6, t0
                  add          s11, s4, s5
                  xori         s6, s1, -946
                  nop
                  nop
                  add          s6, s1, t4
                  slti         s5, t6, -1689
                  fle.s        t1, fa1, fs4
                  rem          s0, a7, s0
                  slli         t6, s0, 3
                  fadd.s       ft4, ft1, ft7, rtz
                  fmax.s       fa2, fs6, fs6
                  fmv.w.x      fs4, s9
                  srli         s6, t0, 8
                  ori          a1, s5, -431
                  fle.s        a5, fs1, fs7
                  sll          s2, s9, a1
                  mulh         s6, s0, a3
                  fsub.s       fa5, fs10, fs7
                  feq.s        a2, ft6, fs1
                  addi         s9, s2, 2046
                  fsgnj.s      ft9, ft6, fs6
                  add          a0, s3, t0
                  fmul.s       fs3, ft7, ft5, rtz
                  fmax.s       fa0, ft10, ft2
                  rem          s1, t6, s3
                  fmv.w.x      fa1, s2
                  fcvt.s.w     fs11, ra, rne
                  fclass.s     gp, fs4
                  remu         a7, tp, s5
                  fsgnjn.s     ft4, ft1, fa0
                  feq.s        t1, fs11, fa2
                  fcvt.s.wu    fs9, s8, rtz
                  nop
                  mulhu        a2, a5, s3
                  mul          ra, t3, t6
                  fcvt.wu.s    t3, ft5, rtz
                  or           a7, t1, sp
                  mulhsu       ra, s6, s0
                  fle.s        s8, fa5, ft11
                  flt.s        t5, fs8, fs9
                  fcvt.s.wu    ft7, t1, rup
                  slli         t2, t3, 25
                  add          t4, s5, s10
                  mulhu        s11, a3, gp
                  or           a2, a2, a3
                  mul          s0, t4, t5
                  slli         s2, t2, 9
                  fsgnjn.s     fs2, ft0, ft3
                  fmul.s       fs5, fs11, ft5
                  flt.s        t3, fs7, fs6
                  fmv.x.w      s0, fs4
                  andi         a0, gp, -385
                  fsqrt.s      fs3, ft0, rmm
                  fsub.s       fa6, ft5, fs4
                  slt          gp, s10, zero
                  remu         t2, s0, sp
                  fclass.s     ra, fa2
                  divu         a3, t3, s1
                  divu         t3, s11, a0
                  fmv.w.x      fs1, a3
                  fcvt.wu.s    ra, ft8
                  fmax.s       fs8, ft6, fa6
                  and          s6, a5, t3
                  add          s11, a0, s6
                  srl          s2, ra, t5
                  sub          t4, a4, s6
                  fcvt.wu.s    a7, ft11, rtz
                  fsgnj.s      fa1, ft10, ft2
                  fcvt.w.s     tp, fs8
                  fcvt.s.wu    fs6, t2
                  sub          t6, s3, ra
                  or           tp, a7, zero
                  fadd.s       fs0, fa6, fs4
                  slti         a1, a4, -184
                  auipc        s9, 680804
                  fclass.s     a0, fa5
                  slti         t5, a0, 688
                  srai         s8, a1, 23
                  fsqrt.s      ft0, ft7
                  fmax.s       fs10, fs6, fs2
                  sltiu        a2, s3, -216
                  sll          a3, t1, s11
                  srl          tp, a7, a0
                  fcvt.wu.s    s9, fa0
                  fle.s        a3, fs5, fa5
                  sltu         a7, s2, a4
                  remu         s1, s1, t1
                  sll          s6, zero, s5
                  rem          s0, sp, t1
                  fmul.s       ft9, fs9, ft5
                  fsgnjn.s     fs9, ft1, ft1
                  andi         s8, t1, -127
                  auipc        zero, 887602
                  auipc        s0, 362157
                  mulhsu       s11, a1, ra
                  fcvt.wu.s    a7, fa6, rne
                  fcvt.s.wu    ft2, s2, rdn
                  srai         s10, s6, 0
                  slti         s2, a7, 1536
                  srli         a5, tp, 7
                  sra          t4, a4, a0
                  div          s3, zero, t6
                  fsgnj.s      fs7, fs5, fs11
                  slt          s9, s8, s0
                  fle.s        s6, fs9, ft0
                  mulhsu       s6, a3, s3
                  lui          gp, 917557
                  slti         a7, a6, -315
                  add          s6, gp, a4
                  fcvt.w.s     t5, ft6, rne
                  fclass.s     s8, fa2
                  rem          s0, a4, s11
                  and          a2, a2, t0
                  xor          gp, a1, t6
                  sltu         a1, s11, t6
                  fle.s        s10, ft10, ft11
                  sll          t5, s1, t0
                  sltu         t3, a0, zero
                  nop
                  flt.s        s2, fs0, fs2
                  nop
                  feq.s        sp, ft11, ft1
                  mul          s9, s9, t5
                  sra          t6, s11, t0
                  flt.s        s7, fs8, fa1
                  fcvt.w.s     ra, fa7
                  slt          sp, sp, t6
                  fsub.s       ft8, ft7, ft8, rdn
                  slli         t3, tp, 30
                  fcvt.w.s     s3, ft10, rtz
                  slli         s2, gp, 20
                  srai         t6, a5, 4
                  fclass.s     a5, fs8
                  fsgnj.s      fa3, fa4, ft10
                  fsqrt.s      fs0, fa6
                  addi         s10, t6, 149
                  mulhu        a1, t1, s10
                  fsqrt.s      fs3, fs3
                  fdiv.s       ft3, ft4, ft8, rmm
                  ori          gp, t5, -328
                  or           s1, t6, sp
                  fsub.s       ft11, fs4, ft1
                  fmul.s       ft10, fa0, fs9
                  srli         a7, s1, 16
                  xor          gp, t5, gp
                  sltu         s1, s8, s11
                  add          t2, a5, a7
                  slt          t5, zero, a0
                  fcvt.wu.s    s5, fs11, rtz
                  slli         a5, t6, 9
                  fcvt.w.s     t2, ft3
                  flt.s        s8, ft3, ft3
                  addi         zero, a5, -1843
                  add          a5, a2, s3
                  ori          ra, s8, -482
                  feq.s        t3, fs6, fs6
                  fcvt.s.w     ft11, tp
                  fadd.s       fa3, ft3, fs1, rdn
                  div          a7, a6, a7
                  add          s1, s0, s9
                  fclass.s     a5, ft4
                  rem          t6, t0, a2
                  addi         t4, a5, -155
                  addi         a2, a1, -109
                  fcvt.s.w     ft2, t0
                  xori         ra, sp, 1485
                  srli         s1, s9, 6
                  srli         t1, t2, 5
                  fcvt.s.w     fs4, t5, rdn
                  fclass.s     a7, fs11
                  fsqrt.s      fa4, fs1, rdn
                  feq.s        s1, ft5, ft2
                  divu         t3, a3, t1
                  sll          s10, t2, t4
                  sra          s0, tp, s10
                  slt          a2, t6, t6
                  srli         s2, a6, 5
                  fmv.x.w      a2, fs11
                  divu         a1, zero, sp
                  slti         s7, t1, 1608
                  fclass.s     a5, ft3
                  fcvt.w.s     t6, fs6
                  fmv.x.w      s11, ft11
                  sll          s6, zero, a1
                  addi         s3, s10, 301
                  auipc        s0, 972189
                  sltu         s6, a2, a2
                  fcvt.s.wu    ft10, t5, rdn
                  fsqrt.s      fs6, fs7, rmm
                  fmul.s       fs6, fs10, ft9, rtz
                  xori         s7, t1, 1262
                  fmin.s       fa0, fs5, fs5
                  mulhsu       t3, s5, s8
                  sltu         gp, s1, s9
                  and          a5, s4, a5
                  remu         s5, s5, tp
                  auipc        a7, 154598
                  add          a3, s4, a5
                  fcvt.w.s     a2, fa7
                  and          s9, s4, t1
                  auipc        s6, 11487
                  fsgnj.s      fa5, ft6, fs2
                  fsgnjn.s     fa2, ft4, ft11
                  fcvt.w.s     s3, fs5
                  andi         t3, t6, 1655
                  srli         s3, a7, 8
                  flt.s        a1, ft9, ft4
                  sra          sp, t2, s0
                  srli         a3, t2, 13
                  srli         zero, s3, 0
                  flt.s        s3, fa2, ft10
                  flt.s        a2, ft2, fs11
                  addi         s7, s2, -699
                  addi         gp, zero, -864
                  mulh         s10, ra, s0
                  sub          s8, s9, s8
                  xor          s5, s3, a4
                  fcvt.w.s     a1, ft5, rup
                  fsqrt.s      ft6, fa5, rmm
                  sltu         s2, t1, s11
                  fsub.s       fs6, ft4, ft7, rmm
                  fmax.s       fs6, fs1, fs4
                  fdiv.s       fs11, ft0, fa6
                  mul          t0, t0, tp
                  addi         s11, a4, 679
                  fmax.s       ft1, ft0, fs1
                  and          t6, t3, s5
                  sltu         a1, a3, s9
                  srli         s1, t4, 16
                  rem          t5, a3, s3
                  srai         s3, t3, 15
                  nop
                  sltu         a7, a1, s10
                  fmin.s       fa0, fa4, fs11
                  andi         sp, a2, 1367
                  andi         t4, sp, -1795
                  fcvt.s.wu    ft0, a1, rdn
                  and          sp, s1, s7
                  fsqrt.s      fa5, fa5
                  slti         gp, s2, 1060
                  fsgnjn.s     fs4, ft9, ft6
                  slti         a1, zero, 538
                  fle.s        s9, fs4, fa0
                  andi         sp, s9, -1666
                  fdiv.s       fs10, fs2, fs8
                  sltiu        a3, t1, 1111
                  slli         sp, s6, 27
                  mulhsu       s8, s6, s8
                  nop
                  srli         t0, a1, 13
                  mulhu        t1, sp, s0
                  rem          a2, t3, a6
                  auipc        sp, 213007
                  fcvt.s.w     fs7, tp, rtz
                  fcvt.wu.s    t0, fa3
                  slt          t2, s5, sp
                  fsgnjn.s     fa5, ft4, fa2
                  fmin.s       ft0, fs8, ft7
                  fcvt.wu.s    s0, fa7, rdn
                  srli         s1, t1, 12
                  fsqrt.s      ft2, ft3
                  xori         a7, s11, -2025
                  addi         s5, gp, -599
                  srl          s8, t4, a1
                  fcvt.wu.s    tp, fs8, rne
                  divu         s2, a0, a3
                  fmul.s       fs9, fs0, fs7, rdn
                  srl          s0, t2, t6
                  mul          a0, a1, t6
                  fsgnjx.s     fs4, fs10, fa2
                  srai         a1, s6, 6
                  rem          a0, a4, ra
                  fle.s        s11, fa2, fa6
                  feq.s        ra, fa0, ft4
                  addi         zero, a1, 1307
                  div          t0, s3, a5
                  fle.s        a2, fa7, fs9
                  mul          s5, a2, s4
                  sub          s8, s4, s10
                  auipc        a1, 285860
                  slli         zero, ra, 29
                  fmv.x.w      s2, fs6
                  slli         tp, s6, 0
                  fcvt.s.wu    fs3, s0
                  fclass.s     t4, fa0
                  mulhu        s6, a1, a7
                  sll          a7, s11, s11
                  divu         t6, ra, t3
                  fsqrt.s      fa4, fa4
                  remu         s5, s4, t3
                  fsgnjn.s     fs0, fs10, fa5
                  andi         t2, t5, 1665
                  fcvt.w.s     tp, ft9, rup
                  sub          a5, ra, t2
                  slti         s0, gp, -630
                  fsgnj.s      fa5, fs2, ft1
                  mulhsu       s1, a6, t6
                  fsgnjn.s     ft6, fs1, fa7
                  fsgnj.s      ft5, fs8, fa2
                  sltiu        a1, t5, -1418
                  div          t1, s0, s4
                  fadd.s       fs7, fs1, ft4
                  remu         sp, t5, t0
                  and          s6, zero, s10
                  fdiv.s       fs10, ft5, fa4
                  fle.s        s5, fs1, ft2
                  fcvt.wu.s    a1, ft1
                  fsgnjn.s     fa1, ft7, fa6
                  fsqrt.s      fs4, fs6
                  sltu         t1, s3, s4
                  or           s11, a3, s0
                  fsgnjx.s     ft6, fs2, fa0
                  ori          sp, a0, -1814
                  srli         s10, s9, 30
                  fsgnjx.s     fs6, fs7, ft8
                  fmv.w.x      ft6, zero
                  xor          s9, s2, s11
                  srai         zero, s8, 24
                  addi         sp, t0, 1132
                  fle.s        gp, ft1, fa1
                  sltiu        a0, s7, 1640
                  fmin.s       fa6, fa7, ft6
                  fmin.s       ft8, fs3, ft1
                  srli         zero, t5, 6
                  fsqrt.s      fs11, fs5
                  srai         t6, t0, 21
                  mul          a2, s1, a0
                  mulhsu       t1, t1, t2
                  fle.s        ra, ft11, fa0
                  fcvt.s.w     fa5, a6
                  fadd.s       ft1, fs1, fs0
                  rem          a3, s5, s3
                  feq.s        s1, fa6, fs7
                  slt          a3, a6, s0
                  remu         a5, t5, s11
                  flt.s        ra, fa0, fs1
                  fsgnjx.s     fs4, ft11, fs6
                  fdiv.s       ft4, ft6, fs2, rup
                  fsub.s       fs8, ft4, fa4
                  fsub.s       fa5, fs5, fa6, rtz
                  fsqrt.s      fs2, fs10
                  sra          s6, a4, t2
                  fle.s        s0, fs6, fs9
                  add          t0, tp, zero
                  andi         s2, s6, -1914
                  rem          t1, zero, a6
                  fsgnjx.s     ft4, ft7, fs10
                  sll          a1, a7, s11
                  fmv.x.w      t3, ft9
                  fadd.s       fs0, fs8, ft3, rtz
                  fdiv.s       ft11, ft4, fs6, rdn
                  fmin.s       ft3, ft7, ft10
                  fcvt.s.w     fs4, a6
                  mulhu        a1, tp, gp
                  rem          s7, t4, s3
                  xori         t1, s10, -1018
                  slti         t6, sp, 990
                  ori          s11, a7, -444
                  srli         s0, sp, 9
                  andi         s5, a6, 848
                  fmin.s       fs9, ft10, fs3
                  fsgnjn.s     ft3, fa6, fa0
                  rem          s1, a1, t4
                  flt.s        s2, ft10, ft4
                  sub          ra, sp, t5
                  sra          a5, t0, a1
                  lui          t3, 239557
                  srli         t1, s7, 31
                  fadd.s       fs11, ft9, fa5, rtz
                  slt          s6, a6, t0
                  fmv.w.x      ft10, a7
                  xori         a0, tp, 440
                  fle.s        sp, ft1, ft10
                  sra          t3, a3, s1
                  ori          a0, sp, 589
                  srli         ra, tp, 28
                  andi         t5, s7, -728
                  mulhsu       a7, gp, s11
                  sra          gp, s2, a2
                  srai         a2, s4, 24
                  mulh         s9, t2, s11
                  sltiu        tp, s7, 1506
                  fsgnj.s      fa2, fs7, fs5
                  mulhsu       sp, s0, s11
                  sub          s6, a5, s10
                  fclass.s     t2, fa4
                  and          ra, a7, s10
                  fcvt.s.w     fa5, s9, rdn
                  fmv.w.x      ft5, s10
                  xor          t3, zero, zero
                  andi         s2, a7, 1290
                  srai         s0, a0, 11
                  add          s1, t4, s3
                  fsqrt.s      fs0, ft9
                  fcvt.wu.s    s5, ft4
                  fsgnj.s      fs4, fs7, fa4
                  fmul.s       ft9, ft4, fa4, rdn
                  slli         s10, zero, 22
                  fmax.s       fs6, fa1, fs11
                  lui          t2, 906818
                  mul          s9, a3, a3
                  sltiu        t5, a1, -1947
                  fsqrt.s      fa6, fa6
                  slti         s1, a5, 69
                  fmv.w.x      ft5, s10
                  slt          s1, t0, t0
                  srli         t5, zero, 19
                  andi         tp, tp, 994
                  and          s8, a5, s7
                  fcvt.w.s     s8, fa2, rup
                  mulh         t1, tp, s7
                  or           t2, s7, a0
                  fmv.x.w      tp, fs2
                  lui          t2, 89335
                  mulh         sp, a7, s4
                  sltiu        t5, s8, -1342
                  or           s9, s11, a5
                  nop
                  nop
                  and          sp, a0, sp
                  fmv.w.x      fa1, gp
                  fdiv.s       ft3, fa0, fs8
                  or           a2, a4, t4
                  remu         s1, s9, s9
                  divu         s6, a0, sp
                  fcvt.s.wu    ft7, a3
                  nop
                  auipc        t1, 22375
                  remu         t0, s0, t1
                  or           a0, zero, s4
                  fcvt.w.s     s5, ft9, rdn
                  fsqrt.s      fs2, ft9, rmm
                  or           ra, t3, s10
                  xor          t4, s0, a2
                  andi         tp, t3, -595
                  slli         t6, t2, 2
                  fle.s        t2, fa4, fs0
                  srl          s6, t1, a3
                  sll          s9, zero, t3
                  div          s8, s10, tp
                  srl          t6, tp, s11
                  flt.s        zero, fs0, fs6
                  feq.s        a2, fs1, fa7
                  sltu         s11, a5, s1
                  andi         a5, t1, -1836
                  sra          zero, a2, s0
                  fmax.s       fs8, fs0, ft10
                  fmv.x.w      s6, ft11
                  fmax.s       ft3, ft9, ft10
                  divu         a7, s6, s0
                  fcvt.w.s     s0, ft2, rne
                  fadd.s       fs7, fa2, fs4
                  feq.s        s6, fa6, ft4
                  auipc        a5, 899012
                  sll          t5, s8, a1
                  fcvt.s.wu    ft3, gp, rne
                  sra          s10, a2, s8
                  fmin.s       fs7, ft4, fs2
                  flt.s        a2, fs8, fs7
                  fmin.s       ft8, fa5, fa3
                  auipc        s10, 423321
                  ori          a7, s1, 1168
                  add          gp, s4, a0
                  fle.s        ra, fa3, fs4
                  fsgnjn.s     fs2, fa4, ft9
                  div          zero, t0, s7
                  fcvt.s.wu    fs1, s2, rup
                  srai         t0, s4, 26
                  mulh         s6, s4, s5
                  fle.s        a5, fs9, ft5
                  mulhu        s10, s10, a7
                  fmin.s       fs8, fa6, fa2
                  or           t6, t2, s1
                  fsgnj.s      ft0, ft2, ft1
                  and          t1, s9, t1
                  feq.s        s1, ft9, ft9
                  fdiv.s       fs5, fa2, fs5
                  mulh         s0, s7, s3
                  div          t5, a6, a2
                  fmv.x.w      t2, fs2
                  srai         s2, s4, 21
                  sltiu        ra, a0, -1775
                  fmul.s       ft2, fa4, ft3, rmm
                  fmin.s       ft6, ft8, fs6
                  sll          a1, t0, a3
                  fcvt.s.wu    fa0, a0, rne
                  fcvt.w.s     s3, fs0, rup
                  add          s7, s2, t4
                  fsub.s       ft11, fa4, fa2, rtz
                  slli         s5, a6, 21
                  ori          t3, s9, 1800
                  auipc        s6, 904747
                  mul          sp, a6, a5
                  srli         t5, s9, 10
                  fmul.s       fa6, ft1, fs8
                  fsub.s       ft1, fa0, fa7, rup
                  mulh         zero, gp, a0
                  fclass.s     t2, fs1
                  fmin.s       fa2, fs1, fs10
                  fsub.s       fs9, fs5, fs2, rtz
                  fcvt.w.s     t3, ft7
                  srai         s2, tp, 25
                  slli         zero, a5, 1
                  fmul.s       ft6, fa5, ft5, rup
                  mul          a1, t6, s3
                  srli         s1, a6, 10
                  srl          s0, s7, gp
                  sll          s10, t0, tp
                  div          t4, a2, s7
                  fmv.w.x      ft8, s8
                  mulh         s2, zero, a6
                  fsgnjn.s     fs0, fa0, fa1
                  fsqrt.s      fs3, fs3, rne
                  sll          a3, a3, a3
                  fmul.s       ft3, fs1, fs4, rtz
                  fcvt.s.w     ft10, a2
                  slt          s3, s6, a4
                  fle.s        t6, ft3, fs2
                  slli         s0, tp, 5
                  mulhu        a1, s10, a0
                  srl          t4, ra, s1
                  addi         t5, a5, -835
                  fcvt.w.s     s2, fa6
                  fcvt.s.wu    ft6, s11
                  fmax.s       fa0, ft8, ft2
                  and          s3, s1, s3
                  sltu         t5, s8, t2
                  div          s1, zero, a4
                  nop
                  xor          s0, s5, t1
                  mulhu        s10, s3, s3
                  rem          t0, t5, s5
                  nop
                  mulhsu       s2, s2, s4
                  sub          t2, s2, t1
                  andi         s1, ra, -1433
                  mulhsu       s2, s3, zero
                  andi         s11, t3, -1332
                  fcvt.s.wu    fa4, t2
                  fmul.s       fs4, fs10, fa5
                  fsgnjn.s     fa5, ft11, fa1
                  fmin.s       ft6, fa2, fs11
                  fle.s        t4, ft8, fs8
                  feq.s        t2, fa2, fs8
                  fsub.s       fa1, ft9, fs3
                  srli         s11, sp, 22
                  fmv.w.x      fs3, a6
                  fsgnj.s      fs10, fs3, fa3
                  fsub.s       ft8, ft10, ft4, rtz
                  sra          s7, s9, t0
                  fsqrt.s      fs5, ft11, rmm
                  sltiu        s7, a0, -1838
                  fle.s        a3, ft7, fa3
                  fsub.s       fa4, fs10, fs5, rdn
                  sltiu        s5, a3, 1228
                  fmv.x.w      s2, fa1
                  remu         t6, a0, sp
                  sll          ra, sp, s5
                  mul          a0, a6, s1
                  flt.s        a1, fs1, ft1
                  fdiv.s       fa4, ft7, fs3
                  nop
                  nop
                  fsgnjn.s     ft1, fa7, fs6
                  and          t3, s0, a6
                  andi         s6, a6, 1567
                  nop
                  and          a5, s11, a7
                  fcvt.wu.s    t4, ft7
                  srli         t3, t2, 9
                  srai         a0, a4, 4
                  slli         a1, s5, 2
                  fmv.x.w      a3, fs0
                  fcvt.s.w     fs11, a2
                  fsub.s       fs0, fs6, fs1, rmm
                  mul          s10, s10, a6
                  fsub.s       ft9, fs9, fa0, rup
                  add          t2, a4, a4
                  mulhsu       a0, t2, t6
                  fsgnjx.s     ft10, fa0, ft10
                  sltiu        s3, s5, -363
                  slti         s1, zero, 166
                  fmv.w.x      fs2, a1
                  fsgnjn.s     fa3, fa5, fs6
                  fmv.x.w      t3, fs0
                  fadd.s       fa7, ft0, fs7
                  fsgnjn.s     ft7, fs1, fs5
                  fle.s        a2, ft3, fs9
                  flt.s        s5, fa4, ft3
                  fmul.s       fs3, fs0, fs7, rup
                  addi         t6, a0, 335
                  flt.s        zero, ft11, fs4
                  fmv.x.w      zero, ft11
                  srli         s11, a3, 2
                  slt          t3, t2, t4
                  sltiu        a2, a2, 602
                  fmin.s       fa7, fs1, fa4
                  fsqrt.s      fs5, fs6, rdn
                  auipc        s11, 206504
                  or           a2, a0, a4
                  fsgnjn.s     fa3, fs5, fa3
                  nop
                  flt.s        a0, ft9, fs1
                  fcvt.s.wu    fs9, t1
                  fcvt.w.s     s8, fs10
                  add          s5, s7, ra
                  fmax.s       ft9, ft5, ft9
                  flt.s        s5, ft5, ft5
                  or           a5, a7, t0
                  fdiv.s       ft9, ft4, ft8, rup
                  and          a3, a1, t4
                  lui          t4, 983739
                  fsgnjn.s     fs1, fa6, fa3
                  fdiv.s       ft0, ft7, ft7, rtz
                  remu         a7, a0, sp
                  flt.s        s2, fs0, fa1
                  fcvt.w.s     gp, ft5
                  fmv.x.w      a7, ft0
                  fdiv.s       fa7, fs8, ft10, rmm
                  xor          s8, t4, t4
                  fsub.s       fs10, ft11, fa1, rne
                  sll          zero, s11, t4
                  mul          tp, t3, t0
                  divu         ra, a0, a2
                  ori          tp, sp, 1095
                  fmv.w.x      fs7, t3
                  divu         s6, t5, a4
                  fmin.s       ft10, fa7, ft3
                  or           zero, t3, a7
                  lui          s7, 902362
                  mulhsu       s1, s0, a6
                  slli         s8, a1, 30
                  sub          s5, a0, t4
                  sub          s1, t4, gp
                  fle.s        t3, fs7, ft5
                  srl          s10, a3, s10
                  divu         t5, tp, gp
                  andi         a2, t3, 969
                  sll          s10, a6, gp
                  auipc        t2, 409478
                  fmv.w.x      fs7, sp
                  ori          a1, sp, -1983
                  mulhu        a5, a6, tp
                  add          ra, t4, ra
                  srai         s0, s2, 21
                  fcvt.s.w     ft2, s11
                  addi         s11, sp, 1410
                  auipc        s0, 575055
                  xor          s0, tp, a7
                  fmin.s       ft8, fa4, ft3
                  srai         tp, s3, 23
                  mulh         a5, a0, a3
                  or           s7, a4, a7
                  sub          tp, t1, s5
                  sra          s9, a6, tp
                  sll          s3, s3, t1
                  slli         t0, s7, 20
                  remu         sp, a0, t4
                  addi         t6, a5, 658
                  fsub.s       fa5, ft7, ft4, rmm
                  rem          ra, s4, t1
                  ori          t4, s6, -2041
                  fmv.x.w      t3, fs8
                  rem          s8, s0, s3
                  nop
                  fclass.s     zero, ft2
                  slt          ra, sp, ra
                  fmax.s       ft6, fa7, ft4
                  addi         s6, s5, 1095
                  fmul.s       fs11, ft11, ft2
                  mulhsu       t3, s0, s1
                  sltiu        a1, t0, 1080
                  fmin.s       fs9, fa3, fs8
                  fsub.s       fs7, ft2, fs2, rmm
                  fsgnjn.s     fa5, fa7, fs2
                  sra          s11, tp, s2
                  sra          s7, s2, zero
                  fcvt.w.s     t2, fa3, rtz
                  remu         t3, a2, s1
                  div          sp, ra, t5
                  fsgnjx.s     fs2, fs6, ft7
                  add          s8, a5, a1
                  fcvt.s.w     fs6, t1
                  mulhu        a5, s4, gp
                  fmv.x.w      s2, fs9
                  div          s9, zero, t5
                  fmv.x.w      ra, ft4
                  srl          t2, a6, a6
                  mulhu        sp, s0, s9
                  remu         s2, s9, a4
                  xor          a7, t0, t4
                  fsqrt.s      fs7, ft11
                  andi         t6, s7, -1399
                  fcvt.s.w     ft11, ra
                  andi         a1, s10, -1514
                  slli         a1, t0, 12
                  slt          s2, ra, sp
                  sub          s10, gp, t0
                  lui          a3, 15688
                  xori         zero, a3, 749
                  flt.s        t4, fs9, ft2
                  sltiu        t3, tp, 1222
                  sra          a1, t4, t0
                  fle.s        s8, ft8, ft3
                  slli         a1, s11, 7
                  mulhsu       t4, s6, t6
                  fmv.x.w      a7, fs0
                  fsqrt.s      ft0, ft3, rtz
                  or           s6, s5, s7
                  auipc        zero, 259468
                  srl          a3, a5, s5
                  xori         ra, ra, 205
                  fclass.s     s1, fs4
                  fsgnjx.s     fs1, fa6, fs8
                  fsqrt.s      ft11, fs8, rup
                  div          s10, s5, a5
                  nop
                  sll          gp, t3, s11
                  and          t0, ra, t2
                  slt          tp, s4, t4
                  fsgnjx.s     ft2, ft3, fa4
                  slt          s3, a3, t6
                  fcvt.w.s     t0, fa0
                  fsgnjx.s     fa0, ft1, ft8
                  fmin.s       ft9, fa6, fa3
                  srl          a0, a1, s8
                  fmax.s       ft2, fs9, ft8
                  andi         s8, a4, 548
                  sltiu        s3, tp, -1110
                  slli         t1, s4, 26
                  mulhsu       gp, t1, s2
                  fmv.w.x      fa5, s2
                  fcvt.s.wu    ft11, s5
                  rem          s7, gp, zero
                  fsub.s       ft2, fs4, ft7
                  fsgnj.s      ft8, fs2, ft3
                  fle.s        s6, ft11, ft10
                  add          s8, s4, a0
                  fmv.x.w      a0, fs8
                  fcvt.s.wu    fa7, s4, rne
                  slt          gp, a4, s7
                  fsgnjn.s     fs1, ft3, fs3
                  fmv.w.x      fs3, t4
                  remu         a7, sp, t2
                  fdiv.s       ft2, fs1, fs5, rup
                  fcvt.s.w     ft4, s3
                  sltiu        t5, t4, -684
                  feq.s        a1, fs4, ft7
                  mulhu        a7, t5, t6
                  fsgnjx.s     fa6, ft7, fa6
                  remu         s9, s4, zero
                  srli         s8, a2, 1
                  and          t5, s11, s4
                  or           s3, s7, a0
                  fadd.s       fs8, fs2, ft7
                  flt.s        s7, fs2, fa2
                  fsqrt.s      fa6, fs4
                  fclass.s     s6, fa2
                  sub          t6, s11, s6
                  xor          t4, t6, sp
                  xori         s1, t0, 1796
                  slti         s0, t4, 360
                  flt.s        a3, ft7, fa1
                  add          s8, s10, t1
                  fsgnjn.s     fa4, fa4, fs0
                  fsgnj.s      ft2, fs4, fa7
                  mulh         s8, a6, s9
                  fle.s        a7, ft0, fs10
                  mulhsu       a7, s2, s5
                  fsqrt.s      fa7, fs0, rne
                  fmin.s       fs3, fs8, ft6
                  fmin.s       fa7, fa3, fa5
                  mulhu        s6, s8, s10
                  slti         a1, t4, -305
                  sra          s6, tp, s10
                  slli         s2, t4, 22
                  sltu         s3, zero, a6
                  mul          s11, s3, s7
                  sub          s7, s4, t5
                  fmax.s       ft9, ft6, ft4
                  mulhu        s7, a2, zero
                  div          a7, a2, a4
                  nop
                  mulh         gp, t5, t6
                  fcvt.s.wu    fs1, a1, rmm
                  andi         sp, t1, -1457
                  feq.s        ra, ft10, fs1
                  mulh         a5, sp, s6
                  fcvt.s.w     fs6, s10
                  fcvt.wu.s    t0, fs8
                  fmv.w.x      fs6, a1
                  fmv.w.x      fs8, zero
                  fclass.s     s3, fs9
                  xor          s6, a5, a3
                  fmax.s       fs7, fs11, fa4
                  andi         zero, tp, -59
                  fcvt.wu.s    ra, ft10, rdn
                  sub          t5, tp, a2
                  fmax.s       fs3, fa5, fa2
                  fcvt.wu.s    s10, ft10, rmm
                  fmul.s       fa4, fa6, ft7, rmm
                  fmax.s       fa5, fs3, ft2
                  fmin.s       fa2, fs5, fs11
                  fsub.s       fs11, ft0, ft7, rtz
                  xori         s8, sp, -1422
                  fsgnjn.s     fa4, ft7, fa4
                  flt.s        t3, fs0, fa0
                  fsqrt.s      ft1, ft10, rup
                  fdiv.s       fa2, ft7, fs4
                  slli         a5, s7, 31
                  ori          t0, a5, -1225
                  srai         s11, t2, 24
                  flt.s        gp, fs1, fa1
                  mulhsu       t1, t6, t5
                  fcvt.s.w     ft1, a4
                  fmul.s       ft5, fs7, fa2, rtz
                  flt.s        a3, ft9, fs0
                  or           s1, a3, s10
                  fmax.s       ft1, ft0, ft3
                  divu         s6, s4, ra
                  srli         s8, s9, 24
                  mul          s11, ra, s6
                  slt          a2, s3, t6
                  fclass.s     s2, ft6
                  rem          s11, s7, t2
                  and          s10, s0, zero
                  flt.s        t5, ft7, ft0
                  fmin.s       fa3, ft0, fa0
                  div          s11, sp, t6
                  srl          s0, s5, t5
                  rem          a0, s10, s1
                  fmax.s       fs4, ft4, ft4
                  fsgnjx.s     fs11, fs5, fs9
                  fcvt.s.w     fs4, t4
                  slti         s6, t5, -1506
                  mul          s8, a6, a0
                  fmax.s       ft6, fs0, fs9
                  fclass.s     a7, ft6
                  xori         zero, s6, -294
                  addi         s3, ra, -287
                  mulhu        t5, s8, t1
                  xori         s0, a6, -1255
                  slli         a0, t6, 18
                  ori          gp, a4, 864
                  remu         a5, a0, t2
                  srai         a3, s2, 29
                  or           t6, sp, s4
                  ori          t5, t5, -1271
                  mul          s7, a4, s8
                  fmv.x.w      a7, fa3
                  srl          zero, gp, s9
                  fadd.s       fs1, ft8, ft1
                  fmax.s       fa3, ft3, ft4
                  fcvt.w.s     a7, fa6, rup
                  fcvt.wu.s    ra, ft5, rup
                  srl          zero, sp, a6
                  slti         s5, a0, 1999
                  fsub.s       fa0, ft9, ft1
                  mulh         ra, s0, s7
                  fadd.s       fs4, ft11, ft0, rmm
                  nop
                  fsgnjn.s     ft4, ft5, ft3
                  ori          s0, t3, 1992
                  fmul.s       fs10, ft8, ft4, rmm
                  srl          s11, t2, a6
                  srli         a2, s10, 24
                  flt.s        gp, fs6, ft3
                  srl          ra, tp, t3
                  mulhsu       zero, t3, s11
                  mul          s5, s8, t5
                  fmax.s       fa2, fa6, ft11
                  lui          s11, 732791
                  ori          t0, t1, 1751
                  div          ra, t3, s11
                  fcvt.wu.s    a7, ft2
                  and          s9, a5, s9
                  fcvt.s.wu    ft4, ra
                  fmul.s       ft10, fa7, fs7, rtz
                  fdiv.s       fs11, ft11, fa6, rup
                  and          a7, a5, s0
                  rem          a0, zero, s8
                  add          s9, t1, a5
                  add          s11, s10, a6
                  addi         s8, t0, 298
                  lui          a2, 506228
                  or           tp, t6, ra
                  slt          tp, a3, s5
                  slt          t4, s8, a7
                  fmv.w.x      fs11, gp
                  fmv.x.w      gp, fa4
                  fmax.s       fs10, ft4, ft9
                  fcvt.w.s     gp, fa5, rdn
                  div          a2, s8, s5
                  fsgnjn.s     ft9, fa2, fa6
                  fsgnjx.s     fs9, ft4, fa5
                  remu         s11, ra, a2
                  fsgnjx.s     fa2, fs11, fs2
                  fmin.s       ft4, fa4, fa6
                  fmv.w.x      fs1, zero
                  mulhsu       s6, s8, s0
                  slli         tp, s2, 15
                  mul          a7, ra, s5
                  mul          a3, s3, a0
                  fmul.s       fa1, fs2, fa5, rne
                  srai         zero, t6, 31
                  slt          s2, s6, a2
                  fcvt.wu.s    s9, fs5, rdn
                  div          a2, a0, s4
                  fmv.x.w      s0, ft0
                  fsub.s       fs1, fa1, fs2, rtz
                  feq.s        t2, fa2, fs9
                  flt.s        a2, fs11, ft7
                  addi         a2, sp, 952
                  lui          sp, 706067
                  sll          sp, s4, t6
                  slli         a0, s7, 28
                  andi         a5, a0, 673
                  fmax.s       fs8, fs10, fs0
                  mul          tp, s8, a1
                  slti         a3, ra, -1446
                  fclass.s     s2, fs9
                  mulhsu       t4, t3, s1
                  xori         a2, s1, 821
                  fmv.x.w      ra, fs1
                  sltiu        t4, t3, 232
                  nop
                  fclass.s     gp, ft4
                  remu         s5, a7, s4
                  fcvt.s.w     fa6, a3
                  fsgnj.s      ft7, ft11, fa4
                  slt          a7, s1, t6
                  slti         a5, t4, 862
                  sra          t2, a1, s3
                  nop
                  fcvt.w.s     a5, fa3, rtz
                  nop
                  slti         t6, t4, 410
                  mul          sp, s4, s2
                  divu         sp, t3, zero
                  or           a7, s9, s9
                  mulhu        s8, sp, s9
                  fmul.s       fs0, ft5, ft2, rdn
                  sltiu        s7, gp, -392
                  fsgnjn.s     fa3, fs9, fs0
                  mulh         t6, s10, s5
                  xor          gp, a1, tp
                  lui          s2, 242093
                  srl          a7, a3, s8
                  slt          s2, a3, t5
                  nop
                  fmin.s       fs9, fa4, ft10
                  sltiu        s0, t5, -1836
                  xori         s10, a4, 1838
                  srai         a3, a2, 15
                  fdiv.s       fa1, fs5, fs3, rmm
                  fmv.w.x      fa2, a2
                  fsqrt.s      fs4, fs7
                  fcvt.s.w     fa4, a0
                  srli         ra, t0, 11
                  fmin.s       fa2, fs0, fa4
                  auipc        t4, 878102
                  sra          sp, a5, t4
                  slti         gp, s3, -1524
                  lui          zero, 1036489
                  fle.s        s5, fs5, fa5
                  nop
                  fsgnjn.s     fs8, fs0, ft5
                  fsgnjn.s     fa4, fa1, fs8
                  slt          s7, a3, s8
                  slti         s3, t0, -1822
                  fsgnj.s      fs8, ft8, fs2
                  sra          s11, s4, a0
                  mulh         s2, s7, a4
                  mulhsu       s10, tp, s1
                  sltiu        s7, t4, 1699
                  sltiu        t0, a3, 1573
                  fcvt.s.w     ft1, a7, rmm
                  rem          s6, t6, s1
                  mulhu        t0, s6, t5
                  sra          t4, a1, a7
                  feq.s        s2, fa5, fs3
                  nop
                  fmul.s       fa6, ft2, ft7, rtz
                  fdiv.s       ft8, ft2, fa3
                  ori          s10, s9, -1260
                  slt          s2, s7, s10
                  add          a1, s6, s3
                  fcvt.s.w     fa3, t1, rtz
                  fsgnjn.s     ft4, fa5, ft8
                  sltiu        t2, t5, -392
                  sub          sp, t0, a1
                  fsqrt.s      fs2, fs7
                  fsgnjn.s     fa7, ft9, ft6
                  divu         s3, s1, t3
                  fmv.w.x      fs7, a0
                  fsgnjn.s     ft7, fs8, fs5
                  fmax.s       fs3, fa0, fs5
                  rem          t2, sp, t0
                  fclass.s     t3, fa0
                  xori         t2, a4, 1425
                  fsub.s       ft3, ft8, fs11
                  fmin.s       ft5, ft3, ft4
                  fdiv.s       fs2, fs5, fs5, rne
                  lui          t0, 918749
                  rem          a0, t5, a3
                  fsgnjx.s     fs6, fs9, fs11
                  fsgnj.s      fa3, fa2, fs8
                  fcvt.w.s     a1, ft2
                  feq.s        s0, fs10, ft11
                  or           s8, s4, gp
                  mulh         t6, a7, s9
                  fadd.s       fs1, ft8, ft10
                  sltu         s2, s3, t4
                  divu         sp, s0, sp
                  lui          tp, 885468
                  and          s1, gp, a1
                  fdiv.s       ft7, ft1, fa4, rdn
                  srai         t4, t1, 1
                  addi         s11, t3, 387
                  fmax.s       fs8, fs2, fs9
                  fadd.s       fa4, fs9, fa1, rne
                  fdiv.s       ft2, fs1, fs4, rup
                  and          a1, s10, a7
                  slti         t6, a7, 15
                  fadd.s       ft1, fs9, fa3
                  slti         s3, s9, 1495
                  andi         t6, s10, 1737
                  div          s7, t0, t2
                  fdiv.s       fs6, ft3, fa4, rmm
                  slt          s5, t2, s6
                  fcvt.w.s     a1, fs1, rtz
                  or           s8, a5, t6
                  srli         t1, a3, 23
                  div          s7, a3, t6
                  slli         s0, s11, 16
                  fsgnjn.s     fa3, fa7, ft1
                  add          s0, a5, s11
                  or           sp, s6, t6
                  mulh         s2, t0, s7
                  fsgnjn.s     fs6, fa2, ft2
                  fsgnjn.s     fa2, fs0, ft4
                  add          s3, a4, a3
                  sra          s3, s1, tp
                  andi         s2, s5, -1976
                  fcvt.w.s     s11, fs1, rup
                  fsgnjn.s     ft4, fa7, fs4
                  slli         zero, s1, 5
                  fsgnjx.s     fa2, fa7, fa3
                  andi         a1, tp, 976
                  fcvt.wu.s    sp, fa2
                  sll          a5, a1, t3
                  fcvt.w.s     a3, fs11
                  or           t3, a3, s7
                  fsgnjn.s     ft0, fa3, fa5
                  fle.s        s7, fs10, ft5
                  xor          s2, t0, ra
                  remu         sp, a2, s0
                  div          s7, t0, a5
                  mulhsu       s3, a7, a0
                  mul          s5, a0, a7
                  auipc        s3, 388346
                  fmax.s       fa5, fs9, fa5
                  mul          ra, sp, a3
                  fsgnjx.s     fs11, ft3, fs4
                  feq.s        t5, fs10, fs10
                  fmv.w.x      fs3, a3
                  fle.s        t1, fs10, fs3
                  remu         a2, s1, s3
                  feq.s        tp, fa4, ft0
                  fcvt.w.s     a7, fa0, rne
                  ori          t1, s1, -1596
                  xor          s10, t1, t4
                  lui          a5, 89895
                  remu         sp, a4, a4
                  srai         t0, s9, 9
                  fle.s        tp, fa2, ft0
                  divu         a5, s10, s4
                  slli         s5, a7, 19
                  mulhu        t1, s1, gp
                  fmv.w.x      ft10, sp
                  fsgnj.s      ft5, fa7, fs9
                  fcvt.w.s     s11, fa1
                  auipc        a2, 916399
                  fadd.s       fa0, fa5, ft4, rtz
                  addi         t4, s3, 1054
                  nop
                  fsgnjx.s     fs9, ft3, fs9
                  slt          s7, zero, a6
                  fmax.s       fs8, fa7, fa7
                  srl          a2, zero, s3
                  fsgnjx.s     fa0, fa3, fs9
                  fsub.s       fa6, ft6, fs9
                  fmul.s       fs10, fa7, ft9, rup
                  fadd.s       ft5, ft11, ft3
                  fmax.s       fs5, fa6, fa2
                  nop
                  fdiv.s       ft8, fs7, ft6
                  slt          t4, s9, t1
                  fdiv.s       ft9, fa6, fa2
                  fadd.s       fa2, fa7, fs11, rup
                  addi         zero, s2, -869
                  fmax.s       fs11, fa7, ft8
                  lui          s1, 504993
                  auipc        tp, 583154
                  slti         s9, s9, 144
                  fcvt.wu.s    tp, fa5
                  remu         s11, ra, s5
                  srl          a3, t6, a0
                  fmv.w.x      fa2, a6
                  ori          a1, a5, 1744
                  divu         a0, s9, t6
                  lui          a2, 863392
                  sltu         t3, s11, a4
                  fcvt.wu.s    s9, fs5, rdn
                  slti         s9, s3, 1937
                  ori          s7, t5, 379
                  andi         a2, a7, 1168
                  fclass.s     t0, fs2
                  sra          s3, s5, t5
                  rem          t1, s4, a5
                  slli         s2, sp, 22
                  andi         t0, a0, -430
                  sltu         t4, s9, s5
                  fmv.w.x      fa2, a4
                  mulhu        ra, a7, s5
                  srli         t6, a1, 8
                  sltu         s2, s8, s10
                  ori          s0, a2, 740
                  sltu         a0, a2, s2
                  mulhsu       s10, s6, t6
                  sra          sp, s7, sp
                  slli         s3, s3, 0
                  fclass.s     a1, ft9
                  fsgnjx.s     fa5, fs7, fs10
                  sltiu        s10, s10, 2015
                  fsgnj.s      fs0, fa3, ft3
                  srli         zero, t2, 17
                  srli         s8, s0, 23
                  sll          a7, s7, t0
                  fsgnjx.s     ft1, fs1, fa5
                  andi         t2, s4, -113
                  fmin.s       fs7, fs6, ft3
                  or           s2, t4, s3
                  fmv.w.x      fa1, sp
                  sltu         s0, a0, sp
                  feq.s        s7, ft1, fs3
                  slt          a5, s9, tp
                  feq.s        t6, fs7, ft7
                  fsgnj.s      ft6, ft8, fs6
                  fcvt.wu.s    s11, ft0
                  fmin.s       fs2, fs9, ft11
                  flt.s        t3, ft5, fs2
                  mulhu        gp, s1, s9
                  or           s8, a1, a5
                  fcvt.w.s     t2, fa5
                  fcvt.s.wu    ft3, a5
                  fmax.s       fs3, fa6, fa3
                  xor          tp, t1, t1
                  andi         t1, s2, 661
                  fcvt.wu.s    t2, ft8
                  and          s9, s4, a0
                  divu         t5, zero, s8
                  sltu         s10, t1, a0
                  fmin.s       fa5, fs10, ft10
                  fsgnjx.s     ft10, ft5, ft7
                  srli         a3, tp, 3
                  slt          s5, a7, a5
                  fmv.x.w      s9, fs5
                  srl          t6, a3, s10
                  fsub.s       fa3, ft11, fa1, rtz
                  flt.s        s9, ft0, fa6
                  fcvt.w.s     t1, fa4, rtz
                  srl          s6, s8, a3
                  addi         s11, t4, 2013
                  mul          a7, a2, s7
                  rem          s11, t4, t0
                  fmin.s       ft4, ft5, ft9
                  fadd.s       fs3, fa5, fa7
                  srl          a0, s5, t6
                  fsgnjx.s     ft2, fa5, fs11
                  fcvt.w.s     s5, fa4, rmm
                  mulhsu       a7, sp, a0
                  lui          a7, 328233
                  slli         t4, zero, 2
                  srai         s1, ra, 26
                  fclass.s     gp, fs6
                  sra          tp, s5, a7
                  fdiv.s       fs9, ft0, fa5
                  fsqrt.s      ft0, ft10, rne
                  xori         sp, a7, 1414
                  mul          tp, s0, s2
                  mulhu        s8, t1, a6
                  slli         t2, a0, 18
                  fcvt.w.s     zero, fs5, rdn
                  fadd.s       ft8, ft4, ft6, rmm
                  sltiu        t1, ra, 365
                  or           s1, a7, gp
                  sltu         s11, s6, t4
                  fdiv.s       fa5, fs10, ft10, rup
                  fsqrt.s      fs3, fs3
                  and          t2, t1, s4
                  fsgnj.s      fs4, fa6, ft8
                  fadd.s       ft11, fs9, fs11, rne
                  and          t3, zero, s6
                  and          s8, s9, t0
                  remu         t2, zero, a6
                  and          s5, s7, a5
                  fadd.s       ft11, fa7, fa3
                  fsgnj.s      ft5, fa5, ft7
                  fsgnjx.s     fa4, ft6, ft2
                  fmax.s       fs2, fs9, fs6
                  sll          a0, a6, gp
                  mulh         s5, t0, s4
                  fcvt.wu.s    a3, fa6, rdn
                  fmax.s       fa2, ft4, ft7
                  sltu         a2, a6, a4
                  nop
                  fle.s        t0, fa4, fa0
                  fclass.s     s5, fs0
                  fle.s        a5, ft3, ft10
                  slti         s7, t2, -686
                  fcvt.s.w     fa1, t5, rne
                  mulh         a3, a0, s2
                  fcvt.s.w     ft1, t5, rtz
                  fclass.s     gp, ft5
                  mulh         zero, s7, a0
                  fsgnjn.s     fa3, fa3, fs4
                  mul          s3, a7, a5
                  fle.s        s3, ft8, fs0
                  sltiu        s5, s10, -2011
                  fsgnjn.s     ft5, ft10, ft6
                  div          s6, a6, zero
                  mul          t6, s0, s7
                  fsgnjn.s     fs4, fs9, ft10
                  xor          a0, a5, s10
                  auipc        s7, 566239
                  sll          s8, a2, t3
                  rem          tp, a4, t1
                  rem          s2, a4, a1
                  ori          t0, a7, 610
                  rem          t3, s3, s8
                  fmin.s       ft5, ft11, fa0
                  addi         s6, s0, 1209
                  xor          s7, ra, t1
                  lui          s11, 574886
                  slti         t3, t6, 1952
                  fsgnjn.s     fa4, fa6, fs7
                  fmax.s       fs1, fa6, fs0
                  slti         a0, t6, -137
                  andi         a5, tp, -1981
                  and          t0, s10, t3
                  lui          t3, 71479
                  srai         t4, sp, 20
                  fsub.s       fs9, fa3, fa5, rdn
                  fmv.w.x      fs5, a2
                  divu         s9, s0, s3
                  sltu         a0, t2, a1
                  srai         a2, t0, 20
                  fadd.s       ft7, fs5, fs2
                  fclass.s     tp, fs9
                  lui          a1, 165314
                  mul          s2, zero, s2
                  mulhsu       s0, tp, a2
                  mulh         t5, s6, s9
                  remu         s11, s9, a0
                  fmax.s       ft1, fs2, fs1
                  srai         t4, zero, 12
                  srai         a3, s5, 3
                  slli         t6, ra, 6
                  add          t4, a5, s6
                  fle.s        t2, fs8, ft5
                  or           a2, ra, t0
                  remu         t5, s5, s4
                  fsub.s       fs5, fs9, ft10, rmm
                  mulhsu       gp, t6, zero
                  add          t6, a2, s0
                  fsgnj.s      ft0, fa3, ft10
                  xori         zero, s3, -622
                  divu         ra, a2, tp
                  auipc        t6, 182355
                  fsgnjx.s     fs8, ft8, fs9
                  sltu         t1, a6, tp
                  mulhsu       t4, s9, s7
                  fclass.s     s0, ft4
                  fsgnjx.s     fs8, fs3, fa2
                  lui          a5, 28413
                  mulhsu       a3, t4, tp
                  fmax.s       ft11, fa3, fa3
                  fsgnj.s      ft0, fs9, fs5
                  mulhu        a1, a2, s2
                  fcvt.s.wu    ft6, s5, rmm
                  feq.s        sp, fs11, fa2
                  sra          a3, t2, s4
                  fmax.s       ft8, ft1, fa0
                  srli         s11, s9, 14
                  slli         s10, s0, 13
                  div          s0, a2, gp
                  fcvt.w.s     s6, ft6, rup
                  and          s3, ra, t0
                  fcvt.w.s     s1, fs9, rup
                  ori          a1, a1, -1422
                  or           s0, a5, s10
                  remu         t4, gp, s11
                  rem          s6, t5, a6
                  fsqrt.s      fs6, ft10, rtz
                  slli         a0, s9, 8
                  slt          a2, s7, a7
                  sll          s0, t6, a3
                  fsgnj.s      ft5, fs0, fa0
                  fcvt.s.wu    fa3, s4
                  fclass.s     t3, fs10
                  xori         sp, sp, -547
                  fclass.s     s7, ft1
                  slt          s0, t4, tp
                  fadd.s       fs3, ft2, ft11, rtz
                  fmv.w.x      fa3, a1
                  remu         a1, s1, t3
                  slt          sp, a7, a0
                  xori         ra, s10, 1892
                  sltiu        s0, s6, 378
                  sub          s10, t5, t0
                  sll          a2, s0, s9
                  fmax.s       fs11, ft4, fa1
                  mulhsu       s1, t3, s2
                  fmin.s       fa4, fa3, fs4
                  mulhsu       s3, s3, a6
                  addi         t5, a6, -252
                  add          a7, t4, t2
                  lui          t1, 951277
                  divu         t0, t4, a2
                  fsqrt.s      ft4, fs11, rup
                  mulh         sp, t0, t3
                  feq.s        t0, fs4, ft3
                  sub          t3, a1, s5
                  ori          s2, zero, -1895
                  and          a5, a3, a2
                  mulh         s10, s3, t1
                  addi         a2, s0, -860
                  fsgnj.s      fa2, fs11, ft8
                  srli         s9, sp, 20
                  ori          s8, t1, 237
                  and          sp, s4, sp
                  fadd.s       fs2, ft6, ft10, rdn
                  sll          s7, t0, s4
                  fcvt.wu.s    a1, ft1
                  fmv.x.w      t0, ft7
                  addi         s0, t4, 45
                  mulhu        t6, a3, zero
                  mulhsu       t2, tp, s1
                  div          t2, a7, s4
                  slt          s5, a2, sp
                  fsgnjx.s     fs4, ft1, ft2
                  ori          t2, s9, 54
                  and          a5, sp, t3
                  div          s2, sp, t0
                  ori          gp, t3, -893
                  auipc        t2, 619636
                  mulhsu       s7, a1, a6
                  fmv.x.w      sp, ft2
                  and          s3, s8, s11
                  lui          s10, 340397
                  slt          s10, tp, gp
                  xor          sp, s2, s2
                  slli         s3, s8, 8
                  feq.s        s5, fs1, fs1
                  auipc        t2, 221662
                  divu         sp, s1, a4
                  fcvt.wu.s    ra, ft0
                  fcvt.s.w     fs5, s10
                  sltiu        t0, t6, 59
                  fadd.s       fs9, fa6, fa3, rtz
                  sll          s6, a5, a7
                  addi         t4, s8, -1612
                  fmv.w.x      fa0, t4
                  fadd.s       ft9, ft2, ft6
                  fmv.w.x      fs2, s6
                  sltu         a3, s5, s7
                  nop
                  fadd.s       ft10, ft7, fs6
                  flt.s        tp, fs6, ft3
                  srl          t6, a1, a0
                  mulh         s9, a5, tp
                  fcvt.w.s     s5, ft1
                  fsub.s       ft11, fs3, fs6, rdn
                  slli         s6, sp, 8
                  mulhsu       a5, zero, a6
                  srai         s2, a7, 28
                  flt.s        s2, ft5, fs10
                  fsub.s       fs10, fs11, ft1, rne
                  fdiv.s       fs8, ft3, ft8, rtz
                  feq.s        a7, fa5, fa6
                  or           s10, s1, t6
                  add          t2, s2, s1
                  fmin.s       fa5, fs9, fs5
                  slti         a2, a5, -995
                  fsgnjx.s     fa2, ft9, ft10
                  srli         s9, a4, 7
                  slti         s9, s9, 617
                  or           t6, t5, a1
                  fadd.s       ft6, fs10, ft2, rtz
                  divu         s8, a4, t1
                  fsgnjx.s     fa7, fs4, fs9
                  fcvt.wu.s    a7, ft5, rup
                  mul          a0, s5, sp
                  sub          zero, s5, zero
                  slt          zero, a7, t4
                  mulh         t4, a3, t6
                  fcvt.w.s     sp, fs3, rup
                  or           t2, t0, a2
                  remu         tp, s11, zero
                  fclass.s     s1, fa2
                  mulhu        s11, gp, a7
                  fsqrt.s      ft8, ft8
                  or           s9, a2, t4
                  srli         a5, t6, 29
                  fcvt.s.wu    fa5, t3
                  srli         gp, gp, 16
                  andi         a1, t0, 1753
                  fmv.w.x      ft10, a6
                  sll          s8, s1, t2
                  fadd.s       fs9, fa6, fa2, rup
                  fmul.s       fs5, ft1, ft3
                  fsqrt.s      ft11, fs8
                  xor          t5, a5, s7
                  fsgnj.s      fa1, fa2, fs9
                  andi         t4, a2, -825
                  flt.s        a0, fs11, fa6
                  slli         s10, s7, 27
                  mulh         a1, a1, s9
                  sub          t3, a4, s4
                  remu         a0, a0, sp
                  feq.s        s6, fa1, fa5
                  fsub.s       ft2, fs7, fa4
                  mul          t0, a5, s6
                  add          s9, t0, s10
                  fmv.w.x      ft9, zero
                  or           t4, tp, gp
                  fsqrt.s      ft2, ft6
                  fmv.w.x      fs9, s9
                  mulhu        ra, ra, ra
                  fsub.s       fa0, fs5, fa6
                  sltiu        s2, t4, -2017
                  auipc        t0, 729168
                  sltu         s3, s10, t4
                  srai         s3, s7, 26
                  srai         s2, s9, 4
                  slli         t2, t0, 30
                  sll          t4, a4, s5
                  fmax.s       fa2, fs6, fa7
                  andi         s8, s3, 319
                  slli         tp, tp, 27
                  fmv.x.w      sp, fa5
                  sltu         a5, s11, a0
                  fcvt.wu.s    gp, ft9, rmm
                  auipc        t4, 793533
                  div          a0, t4, s11
                  fle.s        a1, fa7, fa0
                  sub          tp, t5, a6
                  div          a1, s6, s5
                  lui          s0, 850258
                  mulhu        s0, ra, t1
                  and          a3, s8, t4
                  sra          s9, s9, s1
                  andi         a3, t0, 573
                  srl          s11, s2, a7
                  remu         zero, s1, ra
                  slti         s9, t4, -1800
                  nop
                  or           t3, t1, s11
                  fmv.w.x      ft3, a3
                  or           a7, s3, t2
                  sub          t2, t5, a3
                  nop
                  fcvt.w.s     ra, ft11, rne
                  fclass.s     t4, ft10
                  auipc        t0, 354290
                  sltu         s11, s7, s6
                  fclass.s     s9, fs4
                  fcvt.s.wu    ft2, a0, rdn
                  fadd.s       fs1, ft0, fs4, rup
                  fadd.s       fs10, ft5, fs1
                  ori          s9, t1, 1144
                  nop
                  fmax.s       fa3, fs8, fa7
                  fcvt.wu.s    t6, ft3
                  slti         s0, a0, -543
                  mulh         a3, s3, t3
                  fmax.s       fa4, ft9, fs1
                  fcvt.w.s     a7, ft11, rtz
                  fdiv.s       fs5, ft4, fa2, rup
                  sltiu        s3, s4, 1333
                  mul          s10, a1, sp
                  sll          a3, t4, s0
                  addi         s3, tp, 698
                  fsgnj.s      fs2, ft11, fa0
                  srli         s10, a1, 4
                  fsgnj.s      fs6, ft8, ft7
                  sltu         s0, t6, t6
                  div          t1, s2, t4
                  srl          s0, a4, s9
                  fcvt.wu.s    s9, fs8, rdn
                  slli         s7, sp, 29
                  feq.s        t4, fa2, ft4
                  fmax.s       fa5, fs0, ft4
                  sra          t6, t2, a5
                  fmin.s       ft1, fs6, ft7
                  fadd.s       fs0, fs8, ft4, rne
                  xor          t5, a0, s7
                  fmax.s       ft7, fs10, fs9
                  add          t2, t6, s9
                  div          a0, t3, sp
                  mul          sp, t2, s8
                  fmul.s       fs0, ft3, fa1
                  nop
                  andi         t0, t1, -819
                  sltu         s1, a3, a1
                  slt          t3, t3, s10
                  feq.s        ra, ft6, fs6
                  fmin.s       fs1, ft3, fa6
                  fmul.s       fa6, fs0, fs4
                  sltiu        t1, a5, -1012
                  or           a0, s3, s10
                  and          s11, t6, t5
                  fcvt.s.w     fa2, t2, rdn
                  mulhu        t1, sp, s3
                  sll          s6, s9, t1
                  fmax.s       ft4, fs8, ft9
                  and          t4, s5, a2
                  fmin.s       fs0, fa0, fs9
                  sll          s11, a3, s7
                  xori         t2, t0, -377
                  fsub.s       fs9, ft9, ft10
                  nop
                  nop
                  fsgnjx.s     ft0, ft2, fa0
                  sll          t4, a4, s4
                  fmax.s       ft4, fa3, ft11
                  nop
                  rem          a0, a3, s5
                  fsqrt.s      ft7, fa3
                  slti         ra, s8, -643
                  divu         tp, a1, a5
                  fle.s        t0, fa2, ft4
                  xor          s2, tp, sp
                  mul          a7, a3, t0
                  divu         s5, gp, s11
                  fcvt.s.wu    fs1, s0, rdn
                  xori         s7, t1, -1175
                  fle.s        t1, ft2, ft8
                  slt          ra, s7, s0
                  slti         a7, a1, 1683
                  fmul.s       ft5, ft3, ft9
                  slt          ra, tp, s5
                  fsub.s       fa2, ft1, fs7
                  slti         a5, s5, 1752
                  fcvt.w.s     a1, fa2
                  sll          s11, sp, t5
                  sltu         a7, a3, s1
                  fsgnjx.s     fs8, fs11, fs9
                  fcvt.s.wu    ft0, s1, rdn
                  divu         s1, a2, a4
                  ori          tp, s6, -496
                  fsgnjx.s     fa6, fs10, ft1
                  fadd.s       fs9, fs8, ft2
                  or           ra, t1, a3
                  mulh         a3, a2, s1
                  fadd.s       ft5, fs2, fs3
                  feq.s        s3, fs4, ft8
                  slli         t2, t5, 27
                  xor          tp, a0, s5
                  addi         a5, s1, 1116
                  or           t0, t3, t4
                  ori          a5, s6, 126
                  srl          a0, s2, s7
                  flt.s        a7, fa7, fs7
                  fadd.s       fa2, ft6, ft0, rmm
                  sub          s7, s5, a3
                  fmul.s       ft0, ft9, fa3, rup
                  fmin.s       ft6, fa0, ft7
                  add          t3, a4, s7
                  slli         t6, s10, 15
                  fmin.s       fa0, fs3, ft4
                  addi         tp, t6, -604
                  mulh         s10, s6, s4
                  flt.s        gp, ft3, ft5
                  sltu         t6, s1, zero
                  feq.s        a0, ft11, fa1
                  fsgnj.s      fs9, fa6, ft1
                  srli         zero, s4, 10
                  rem          t3, zero, t6
                  ori          a0, a7, -181
                  fcvt.wu.s    tp, fa6, rdn
                  fcvt.s.w     ft3, s6, rmm
                  fsgnj.s      ft2, fs4, ft6
                  feq.s        s3, fa7, ft1
                  rem          s7, s2, t6
                  fmv.w.x      ft2, s11
                  xori         s5, sp, -877
                  remu         a3, t3, t3
                  srai         a0, s1, 15
                  srl          s3, a4, s11
                  and          t5, t6, tp
                  remu         s11, s8, s8
                  lui          s11, 176090
                  sll          t5, a2, s6
                  slli         s0, s5, 14
                  sra          s3, s3, t6
                  div          s7, a2, t6
                  sub          a5, s7, a4
                  mul          a2, s11, s8
                  mulhu        ra, a3, s5
                  mulhsu       s8, s0, t6
                  sra          s9, t1, a3
                  fsqrt.s      fs7, ft11, rtz
                  andi         gp, a5, -1272
                  fcvt.s.w     ft11, a6
                  srai         t6, s7, 23
                  feq.s        s9, fs2, fs9
                  fclass.s     ra, ft6
                  mulhu        s10, s6, sp
                  and          zero, a4, sp
                  addi         t0, gp, -1112
                  div          s3, tp, t6
                  xor          s5, t5, s8
                  fsgnjx.s     ft3, fs3, fa7
                  rem          t4, s3, a7
                  fmul.s       ft10, fs6, fa6
                  feq.s        s9, fs6, fs4
                  fdiv.s       ft10, fa1, fs9
                  add          s9, a0, s7
                  srai         zero, sp, 27
                  remu         t1, a5, t1
                  mulhsu       s0, gp, s10
                  fmv.x.w      t5, ft9
                  fmin.s       fs7, fs10, fs3
                  mulh         t3, a6, s10
                  fclass.s     t4, fa5
                  slt          s6, s10, s9
                  feq.s        t5, fa5, fs4
                  and          s2, a1, a2
                  sra          s9, a3, s10
                  add          s11, t0, t0
                  mulh         s9, s0, zero
                  xori         a0, a6, -1729
                  fdiv.s       ft1, fs5, ft1, rup
                  fmv.w.x      fa7, s5
                  flt.s        s10, ft10, fs8
                  andi         s9, s4, 1607
                  fmv.x.w      t6, fs11
                  xori         t6, s1, 762
                  fadd.s       ft4, fa3, ft5, rdn
                  sub          a7, s10, s9
                  fsgnjx.s     fs2, fs10, fs7
                  srl          a1, a6, t4
                  add          gp, s11, t5
                  slti         s2, s4, -1042
                  fsgnjx.s     fs11, ft0, fa7
                  fclass.s     t0, fs1
                  fadd.s       fs4, ft0, ft10, rup
                  fcvt.s.wu    fs1, s6, rne
                  or           t6, s7, a4
                  fmv.x.w      s9, fa7
                  feq.s        s7, fs8, ft0
                  xor          s9, tp, s4
                  flt.s        sp, ft4, fs5
                  fmin.s       ft4, fs10, ft0
                  fmul.s       fs0, ft0, fs1
                  fmv.x.w      s0, fs6
                  srli         a1, s11, 10
                  sll          a2, a6, s1
                  xori         a3, s9, 1829
                  fsgnjx.s     ft8, ft1, ft1
                  xor          s5, a6, s11
                  sub          t6, ra, a6
                  divu         s3, t0, s8
                  auipc        s1, 58313
                  sltu         s9, s10, a7
                  fcvt.w.s     t5, fs9, rmm
                  srl          s8, s6, s0
                  sll          gp, t2, s1
                  mulhu        s8, s4, s6
                  sra          zero, t0, a4
                  sltu         t6, a7, s11
                  slt          s9, a0, t6
                  sub          s10, a6, t3
                  flt.s        a5, fs10, ft7
                  feq.s        s8, ft8, ft10
                  rem          s3, a2, s8
                  mulhu        t4, gp, s5
                  fmin.s       ft5, fa0, fa6
                  sltiu        t2, t4, -1393
                  mulhsu       t1, s2, a6
                  nop
                  sub          t4, t0, a5
                  fsub.s       fa3, fa0, fa4
                  divu         t0, a1, s6
                  feq.s        t4, ft4, fa2
                  fdiv.s       fs11, ft9, ft3
                  slti         t6, s9, 899
                  fdiv.s       ft4, ft4, fs8
                  sll          a2, t2, a6
                  fmax.s       fs2, ft2, fs2
                  srli         a7, t5, 15
                  srai         s1, s1, 14
                  fsqrt.s      fs4, fs10, rup
                  fmul.s       ft6, fa2, fs11, rne
                  srl          a7, s6, gp
                  flt.s        s10, fs7, ft6
                  srl          a0, s10, s6
                  and          t5, tp, s9
                  srli         s8, t6, 2
                  slti         a2, t1, -158
                  xor          s2, gp, s0
                  fle.s        t6, fs2, ft6
                  remu         a1, a0, t0
                  fsgnjx.s     fa0, fa4, ft7
                  sltu         t0, t5, ra
                  fcvt.s.w     ft1, s8, rdn
                  add          s3, ra, s3
                  slli         s5, tp, 20
                  fcvt.s.wu    ft10, a7
                  fclass.s     s9, ft9
                  sra          s6, s6, a2
                  slti         s2, tp, -1380
                  sub          s7, s10, t5
                  sltu         a5, zero, gp
                  add          a1, s9, a7
                  fcvt.s.w     fa0, s3
                  auipc        gp, 601164
                  fsgnj.s      fa3, fs10, fs8
                  srli         tp, t2, 15
                  srli         gp, t5, 30
                  sltiu        a5, s0, 1398
                  fcvt.s.w     fs6, a4
                  sll          s10, s7, a7
                  and          zero, t6, zero
                  remu         a1, s0, s4
                  fle.s        t0, ft8, fs10
                  or           t5, t0, a5
                  slti         s0, a2, -1757
                  sra          t0, s6, s7
                  xor          ra, a0, s11
                  addi         s5, a3, -1119
                  sub          a7, s8, s4
                  feq.s        t1, fs4, fs3
                  sub          s3, t1, s8
                  sltiu        s3, s2, 1468
                  or           t2, s7, s5
                  fcvt.s.w     fs3, s0, rdn
                  fmv.w.x      fa6, a1
                  fcvt.s.wu    fs0, sp
                  andi         t1, tp, 586
                  fsub.s       fs9, ft8, ft7, rmm
                  rem          t5, s2, s0
                  fclass.s     s11, ft3
                  sltiu        sp, tp, -207
                  auipc        s11, 447669
                  fmin.s       fs11, ft8, fa0
                  mulh         t6, s11, s11
                  fsqrt.s      fa4, fs6
                  xor          s8, t5, s7
                  mulhu        gp, s11, a3
                  mul          t1, s2, zero
                  fcvt.s.wu    fa5, t6, rup
                  fmv.x.w      gp, fs2
                  div          t3, a5, t0
                  fadd.s       ft0, ft6, fs4
                  fclass.s     gp, ft8
                  srai         t1, t6, 0
                  auipc        zero, 683017
                  mulh         s7, t0, a3
                  lui          s3, 425260
                  fsub.s       ft1, fs6, ft6
                  fsgnjn.s     fs1, fa6, ft9
                  feq.s        t4, fs0, ft3
                  fle.s        s7, fs9, fs11
                  sltiu        s9, s7, 1933
                  divu         zero, s10, t1
                  sltiu        t0, a1, 1527
                  fcvt.s.wu    fs6, a0, rmm
                  mulhsu       a7, s4, s11
                  rem          a7, s5, a0
                  slt          t0, a6, zero
                  xor          a1, a6, s1
                  mulhu        zero, s9, t3
                  div          s5, t4, t4
                  srli         a1, sp, 1
                  divu         t3, ra, s11
                  auipc        s1, 401767
                  xor          s7, s2, s11
                  flt.s        ra, fa1, fs3
                  fclass.s     s5, ft4
                  fmax.s       fs4, fs10, fa7
                  auipc        s10, 784517
                  sra          s8, a5, s1
                  slli         t5, a2, 9
                  fcvt.s.wu    fs5, s0
                  xor          t3, a1, t1
                  divu         s11, a7, tp
                  mulhu        s8, ra, t0
                  mul          a1, a6, t2
                  slli         s6, s4, 10
                  fcvt.s.wu    ft10, gp, rup
                  rem          s5, t6, t6
                  fsgnjx.s     fs6, ft4, ft4
                  mul          t4, s3, t5
                  fdiv.s       ft2, ft9, fs5
                  fsub.s       fs3, fs1, fa0
                  fsub.s       ft10, fs4, fa5, rtz
                  fsub.s       fs2, ft8, fs6, rtz
                  flt.s        t6, ft5, fs6
                  fmin.s       fa4, fs7, ft10
                  lui          s10, 995545
                  fsqrt.s      fa5, fs8
                  slli         t0, tp, 1
                  nop
                  nop
                  fdiv.s       fa0, fa0, fa5
                  fsgnjn.s     fs10, ft8, ft2
                  slli         t4, s10, 2
                  fadd.s       ft8, fa5, fs8
                  sll          s9, a2, t6
                  nop
                  fcvt.s.wu    ft4, a5, rmm
                  addi         gp, s10, -1499
                  remu         t1, s7, s3
                  slt          s9, t2, a5
                  fsqrt.s      fa2, fa5
                  fmv.w.x      ft4, ra
                  mulh         ra, s0, s5
                  fclass.s     s7, fs5
                  fsub.s       ft9, fs9, fa2
                  fmin.s       ft8, ft0, fs10
                  divu         t1, s0, s2
                  fmax.s       fs6, fa1, ft3
                  rem          t0, s5, a5
                  mul          t2, ra, a3
                  or           s0, sp, s4
                  feq.s        sp, fs1, fs11
                  fcvt.wu.s    s11, fs6, rmm
                  fmv.x.w      s9, fa6
                  sll          gp, s9, t3
                  remu         a1, s1, t0
                  divu         t5, tp, a0
                  fdiv.s       fs2, fs0, fa5
                  mul          tp, s7, s5
                  lui          t5, 28053
                  add          sp, tp, zero
                  and          a7, t0, s10
                  fsub.s       fs5, ft9, fs11
                  sra          t4, s8, a7
                  add          s7, a6, s4
                  slti         t6, a2, 1518
                  fcvt.w.s     s5, ft2, rtz
                  feq.s        t1, fa4, fa5
                  sltu         s0, t5, t6
                  addi         s11, a7, -1430
                  and          a5, t5, t1
                  remu         s11, s11, a1
                  fmv.x.w      a5, ft8
                  fsgnj.s      fs5, ft11, fa5
                  fmax.s       ft5, fa5, ft1
                  fsub.s       ft2, ft10, ft1
                  srli         s1, a5, 11
                  sll          s11, a5, tp
                  srl          a1, gp, s11
                  fsqrt.s      fa5, fa3
                  fadd.s       ft7, ft8, ft6, rne
                  feq.s        s0, fa1, fs6
                  fmul.s       fs3, fs4, fs4
                  fcvt.wu.s    a2, fs0
                  mul          t5, t1, s0
                  fcvt.wu.s    t3, fa4
                  and          sp, s3, t1
                  remu         s6, a0, t5
                  xor          a2, t1, t0
                  feq.s        s9, ft11, fs6
                  fle.s        s9, ft4, ft6
                  fcvt.wu.s    s7, fs9, rne
                  mulhu        ra, a6, a3
                  slti         t0, zero, -996
                  srl          t5, s3, a1
                  srli         t1, s7, 15
                  nop
                  fcvt.w.s     s5, fs11, rdn
                  flt.s        t0, ft6, ft11
                  slli         s7, a6, 8
                  mulhsu       a2, t4, t3
                  add          t3, a3, a1
                  fmul.s       ft2, fa6, ft4, rmm
                  and          t0, a0, a6
                  sltu         s6, t1, a4
                  fsub.s       ft5, fs5, fs6
                  div          a0, a4, a1
                  slti         a2, tp, -93
                  srl          a1, a1, s11
                  fcvt.s.wu    fs7, a7, rdn
                  fmul.s       ft1, ft9, ft10, rup
                  sltiu        a1, t1, 362
                  or           a5, s5, tp
                  andi         zero, s10, 918
                  sub          s10, t1, s9
                  remu         s9, s8, s1
                  fsgnj.s      ft10, fa4, ft4
                  fmv.w.x      fs0, a5
                  fmul.s       ft1, fs6, ft11, rtz
                  fmin.s       fs3, fs5, fa7
                  fsgnjx.s     ft0, ft11, fa1
                  auipc        a2, 277145
                  fcvt.s.w     ft0, a6, rmm
                  mulh         t4, ra, a4
                  fsqrt.s      fa3, fs4
                  or           s8, sp, a3
                  fcvt.s.w     fa6, a4
                  fadd.s       ft11, ft2, fa5, rup
                  srai         s3, t5, 3
                  srli         t6, a6, 8
                  fmv.w.x      ft3, s9
                  fsgnjn.s     fs11, ft4, fs10
                  sltiu        a0, s7, 1573
                  fadd.s       ft8, fa0, fs0, rne
                  ori          s1, a6, 694
                  mul          t3, zero, a7
                  slli         s5, s7, 4
                  fmv.w.x      fs1, sp
                  or           s11, t6, a1
                  mulh         t4, ra, s0
                  fmin.s       ft3, fs11, ft5
                  fdiv.s       fa6, fs3, fs3, rtz
                  mulhu        a7, a6, t4
                  andi         s8, a2, 1796
                  fmul.s       ft11, fs1, fs6
                  slli         gp, s2, 28
                  fclass.s     s9, ft6
                  fcvt.s.wu    fa5, s0
                  slt          t5, a4, s6
                  fcvt.wu.s    s7, fa5, rmm
                  xor          ra, tp, ra
                  addi         a2, s3, -890
                  fmv.w.x      ft2, s10
                  fadd.s       ft0, ft5, fs9, rdn
                  mulhu        t4, gp, a7
                  fclass.s     s9, fs10
                  fclass.s     tp, fs1
                  fsgnjn.s     fs9, fa5, fa3
                  or           s0, s11, s6
                  fmv.w.x      fs8, a3
                  addi         t6, a5, 996
                  sltiu        s11, gp, 1543
                  srl          a2, a4, s2
                  fmax.s       fs7, fs6, ft1
                  div          s9, s11, gp
                  fclass.s     s10, ft2
                  remu         t5, s11, s3
                  sltiu        a1, a1, -1525
                  feq.s        s8, ft8, ft8
                  addi         s8, t5, -44
                  fmin.s       fs0, fa5, fs9
                  mulh         s2, s6, sp
                  fmax.s       fa6, ft5, fs9
                  fsqrt.s      fa1, fs2, rdn
                  fsgnj.s      fs10, ft10, fs6
                  fsqrt.s      fa2, fs7
                  sltu         t3, s10, t5
                  slti         a1, t2, 549
                  srai         a2, s8, 5
                  or           s3, a2, a4
                  srai         a5, s6, 15
                  fsgnjx.s     fs1, fa7, ft4
                  sub          zero, t6, s4
                  rem          s0, ra, s3
                  nop
                  fcvt.w.s     s3, fs1
                  fmin.s       fs1, ft5, fs7
                  slt          s10, tp, t0
                  srl          t4, s1, s6
                  addi         t3, s2, 821
                  andi         a1, t3, 443
                  rem          t0, s6, a3
                  sll          tp, a6, gp
                  slti         s10, s1, 1428
                  rem          t3, tp, s1
                  fsgnj.s      ft10, fs1, ft6
                  fsgnjx.s     ft6, ft9, fs1
                  nop
                  feq.s        a3, fa6, ft9
                  fmax.s       ft11, ft7, ft2
                  feq.s        t0, fa3, ft9
                  mulh         s3, s10, s4
                  srai         s2, gp, 2
                  flt.s        t4, ft4, fa7
                  flt.s        s5, fs11, ft11
                  sltiu        s3, a2, -994
                  fcvt.s.wu    ft0, a5
                  fsqrt.s      fs2, fa6
                  fsgnj.s      fa7, fs3, fa7
                  xori         s9, a7, -67
                  fcvt.s.wu    fa3, t0
                  fcvt.s.w     ft10, a5, rdn
                  sltiu        a7, s1, -1896
                  add          t1, a5, t6
                  xor          s9, zero, a1
                  fsub.s       ft2, fs4, fs8
                  and          a2, a5, t0
                  fcvt.s.w     ft9, a0
                  andi         t0, t4, 828
                  sltiu        s1, s1, 686
                  sra          s0, s5, s4
                  sltiu        t1, t2, -1524
                  andi         s2, s8, 1585
                  sltu         t6, s8, a6
                  andi         t2, a0, -1131
                  fmv.w.x      fa3, tp
                  fmax.s       fs6, ft1, ft8
                  ori          a7, t3, 1466
                  fmul.s       fs9, fa4, ft7, rne
                  slt          a0, a1, sp
                  fcvt.w.s     a3, fs7
                  mul          t6, sp, s11
                  xori         zero, s0, -1909
                  divu         s5, s4, t0
                  fsgnjx.s     ft7, fs2, fa3
                  fsqrt.s      ft10, fa3, rup
                  fcvt.w.s     s2, ft10
                  fmul.s       ft5, ft7, ft8, rdn
                  auipc        s5, 491105
                  srli         s6, s11, 7
                  ori          t1, zero, -257
                  fcvt.wu.s    sp, ft5, rmm
                  andi         s11, s10, -12
                  srli         zero, s2, 11
                  rem          s10, tp, gp
                  andi         t6, gp, -1953
                  fsqrt.s      fs1, fa2, rtz
                  sltu         a3, s6, t1
                  fmin.s       ft7, fs10, fa4
                  slt          a3, a5, s3
                  slli         t5, tp, 19
                  sll          ra, s0, s3
                  fmv.x.w      a1, ft9
                  addi         s5, t5, -969
                  srl          s8, t6, s2
                  addi         t3, a1, 310
                  fsub.s       ft2, fs8, fa4, rtz
                  sltu         zero, s1, a6
                  sra          gp, sp, a4
                  slli         a2, a2, 0
                  srai         t6, s1, 26
                  sll          ra, t6, t5
                  lui          ra, 161233
                  fsqrt.s      ft3, fa1
                  mulhu        s7, t0, s3
                  flt.s        ra, fa1, ft7
                  fsgnj.s      fa3, fs7, fa0
                  sra          s9, zero, s2
                  div          t5, a6, t2
                  ori          t5, t2, 875
                  fsqrt.s      fs6, fa2, rmm
                  feq.s        t1, fs9, fa4
                  sll          t0, s10, zero
                  sub          s3, a0, s3
                  mul          s8, a1, t6
                  sub          t5, a6, a0
                  mulh         zero, a2, t4
                  fsqrt.s      fs0, ft10
                  fcvt.s.w     fs4, sp
                  add          t6, zero, ra
                  divu         t4, s5, a7
                  xori         t4, s6, -163
                  fsqrt.s      fs3, fs0, rdn
                  fadd.s       ft3, fa1, ft1
                  fle.s        s1, ft10, fs4
                  fcvt.wu.s    a2, ft7, rne
                  fcvt.s.w     fs4, t2
                  sltu         t2, s11, s8
                  sra          a2, gp, s6
                  feq.s        sp, fs3, fa7
                  divu         s7, s6, a2
                  fmv.x.w      s1, fs9
                  fcvt.wu.s    gp, ft7, rmm
                  flt.s        t0, fs1, fa3
                  fmin.s       fs2, fa0, fs10
                  andi         t4, a1, -386
                  sltiu        a0, t5, -488
                  mulhu        a0, t6, ra
                  div          s9, s0, s2
                  slli         t0, a7, 10
                  fsgnj.s      fs9, ft3, fa3
                  ori          t0, s2, -215
                  mulhsu       a5, t0, s11
                  feq.s        t6, fs11, ft11
                  slt          s0, s9, s1
                  sltiu        a5, t1, 974
                  fmv.w.x      ft5, s0
                  fmax.s       ft7, fs0, fs7
                  fsgnj.s      ft2, fs11, fa7
                  srai         t4, t1, 2
                  fmv.x.w      s11, ft10
                  sltu         t6, a7, t5
                  mulhsu       t6, a2, a5
                  fdiv.s       ft0, fs10, ft3
                  nop
                  ori          s10, s0, 1921
                  sltiu        gp, t2, -69
                  fsgnj.s      ft2, fa7, ft3
                  divu         s10, t0, t3
                  ori          a7, t0, 1314
                  sltu         s6, a6, t2
                  fadd.s       fs0, ft10, ft10
                  srai         s3, s11, 2
                  srai         ra, t0, 25
                  rem          t2, s2, t6
                  flt.s        s7, fs9, fa4
                  mulh         t2, tp, t0
                  fcvt.wu.s    t5, fa3
                  rem          t6, s10, s11
                  fmax.s       fs0, ft3, fa7
                  fcvt.s.w     ft2, s10
                  auipc        zero, 776211
                  add          t6, s7, sp
                  nop
                  auipc        t4, 809464
                  sltu         sp, t1, s11
                  slli         a0, a5, 30
                  srl          a3, a4, s8
                  add          s6, a5, s0
                  sltiu        s2, s0, -963
                  slti         t6, tp, 1423
                  srai         s8, t1, 25
                  fclass.s     t3, ft0
                  ori          t3, t2, 1910
                  fadd.s       fs6, fs8, ft8
                  ori          t1, s5, 543
                  sll          s1, t3, s8
                  fcvt.wu.s    s9, fs10
                  nop
                  andi         t4, a1, -1847
                  fmv.w.x      fs3, s2
                  lui          t1, 719766
                  mulhu        t6, s0, a7
                  xori         sp, a1, 808
                  lui          s5, 745518
                  mul          s7, tp, t0
                  slt          s7, t5, s10
                  fcvt.wu.s    s10, ft6, rup
                  slt          s10, s1, s11
                  mul          s8, tp, sp
                  slt          a3, t6, t3
                  fdiv.s       ft0, fa2, fa2
                  add          t5, t5, s1
                  xor          t2, sp, t0
                  div          s3, t0, gp
                  sltu         s0, a7, gp
                  remu         s11, t3, t4
                  sltiu        s2, s9, -168
                  fsgnjx.s     ft11, ft9, ft1
                  fcvt.s.wu    ft9, sp, rup
                  fsgnjx.s     fs2, fa5, ft0
                  divu         t5, s2, s11
                  mulhu        a7, s6, t3
                  xori         a7, s8, -1700
                  fle.s        zero, ft10, fs2
                  fmul.s       ft2, fa7, fs8, rup
                  fmul.s       fs6, fa2, fa0, rtz
                  auipc        gp, 37656
                  sra          zero, t6, a7
                  sltu         t5, a3, t4
                  and          a1, t1, s4
                  fsgnjx.s     fa6, ft3, ft5
                  andi         zero, t0, 355
                  sra          a3, ra, a4
                  divu         s11, s6, gp
                  xori         s3, a2, 486
                  fclass.s     s6, ft11
                  addi         a1, ra, 14
                  fcvt.s.w     fs3, t3, rdn
                  fmv.x.w      t4, fa4
                  srl          t4, t1, s2
                  fclass.s     t3, fs11
                  xor          a0, s1, s10
                  srl          a7, s5, ra
                  sra          t3, s2, a4
                  fcvt.wu.s    s3, ft0, rmm
                  lui          a1, 386175
                  fsgnjx.s     fs1, fs5, ft6
                  sll          s5, s3, t5
                  xor          t6, s7, t2
                  mulh         t3, s4, s4
                  sub          t1, s7, s2
                  sll          s10, a1, sp
                  slli         s7, s10, 26
                  lui          a0, 1011824
                  fmin.s       fa1, fs6, fs0
                  sra          a2, s11, t5
                  fadd.s       fa3, fa6, ft9, rne
                  lui          sp, 175357
                  divu         s6, a1, s8
                  addi         tp, t5, -1205
                  mulhu        tp, a3, zero
                  fsgnj.s      ft8, fs9, fs6
                  fmul.s       ft6, fs10, fs2
                  sra          s2, t1, s5
                  divu         zero, tp, ra
                  mulhu        t3, s2, gp
                  nop
                  fsqrt.s      ft10, fa6, rdn
                  mul          s0, s2, a2
                  and          a7, t6, s3
                  fcvt.wu.s    s3, fa2
                  fle.s        s1, ft5, ft4
                  fmax.s       fs1, fs9, ft3
                  fcvt.s.wu    ft1, ra, rmm
                  fmul.s       fa1, ft3, ft8, rmm
                  fcvt.s.w     fs0, a0
                  and          t1, a1, a3
                  or           sp, t2, s7
                  sub          a1, s4, zero
                  slli         s0, s10, 10
                  mulh         s10, s0, s9
                  fle.s        a3, fa1, fs4
                  lui          s7, 439553
                  sub          a0, t1, tp
                  remu         t0, s8, s5
                  fmul.s       fa1, fs7, fa1
                  mulh         t0, s6, s0
                  nop
                  rem          a0, s7, s7
                  mulhsu       a0, s0, s0
                  sub          s3, s6, a3
                  or           tp, s1, s1
                  xori         s1, s2, 1939
                  mulh         gp, t2, a4
                  mul          a1, gp, a2
                  mulhsu       ra, a2, t3
                  divu         s3, sp, s7
                  mul          s5, s2, t6
                  sll          zero, t0, s1
                  fsub.s       fs8, fa6, fa6
                  fmul.s       fs6, ft1, fa4
                  fmax.s       fs7, fs5, ft11
                  flt.s        s10, ft10, ft7
                  srai         s0, s3, 29
                  rem          t3, a4, t4
                  sll          s11, t2, a2
                  fdiv.s       fa3, ft10, fs9, rmm
                  and          s5, s5, t4
                  fmv.x.w      a3, ft0
                  sll          sp, t4, s4
                  xor          sp, t6, t0
                  mul          ra, a5, a1
                  sltu         a0, a6, a3
                  feq.s        a3, fs11, ft10
                  ori          t0, zero, 1837
                  nop
                  fsqrt.s      ft11, fs8, rup
                  fclass.s     t6, fa5
                  slt          t2, a6, t4
                  sra          tp, s11, a2
                  mulh         s7, s7, t3
                  sra          s11, s8, s1
                  or           gp, a1, t5
                  sltiu        s7, t3, -517
                  flt.s        s8, ft9, fa6
                  srli         s3, a7, 27
                  sltiu        a7, s8, 937
                  fcvt.wu.s    t6, ft1, rtz
                  sub          t3, s10, t0
                  lui          a1, 997412
                  srli         s11, sp, 5
                  fcvt.w.s     zero, fs7, rup
                  sra          a1, s4, ra
                  fadd.s       fs10, fs1, fs0
                  nop
                  fdiv.s       fs1, fs10, fs2, rup
                  slli         t2, zero, 18
                  fsgnjx.s     fa6, fa5, fa3
                  fmv.w.x      fa1, s9
                  fcvt.s.w     fa0, t3
                  fadd.s       ft0, ft7, fs9, rup
                  div          zero, s5, s0
                  fsqrt.s      fa5, ft1, rdn
                  sltiu        s0, s2, 525
                  fmv.x.w      s5, fa5
                  rem          s9, s9, s7
                  slli         t0, t6, 8
                  xori         s10, s6, 183
                  fsqrt.s      ft10, fs3
                  srli         s8, s1, 8
                  fsgnjn.s     fs7, fa5, fs2
                  fmv.x.w      a0, fa7
                  fsgnj.s      ft2, ft3, ft3
                  fsqrt.s      fs1, fs2
                  mulhu        s7, t4, a6
                  auipc        a1, 308822
                  and          s1, s8, s10
                  fcvt.wu.s    s8, fs2
                  fsgnj.s      fa0, fa1, fa4
                  auipc        t6, 865803
                  and          a5, s10, s1
                  lui          a1, 408594
                  feq.s        sp, ft8, fs3
                  fcvt.s.wu    ft2, t5, rdn
                  srli         a0, s10, 20
                  fclass.s     a0, ft0
                  divu         t3, t2, s3
                  andi         s2, tp, 1331
                  xori         a0, s7, 1193
                  slli         a3, a5, 16
                  div          s7, s7, s2
                  feq.s        tp, ft8, fs5
                  rem          a2, s10, ra
                  addi         a5, s3, 21
                  sltu         s6, t2, a7
                  fmul.s       ft10, fa7, fa1, rne
                  divu         gp, t4, a3
                  srli         s7, t2, 5
                  fcvt.w.s     t5, fs9
                  fsqrt.s      ft5, ft1, rmm
                  sub          a5, t1, t5
                  fadd.s       fa0, fs0, fa0, rup
                  ori          s6, s4, 334
                  slt          s5, t1, s4
                  ori          s6, t1, 1923
                  srl          a2, s4, s9
                  fcvt.wu.s    a3, fs4, rdn
                  xor          s6, s9, a4
                  fdiv.s       fs2, ft8, ft11, rmm
                  xor          a2, s5, s11
                  divu         t3, s4, zero
                  nop
                  feq.s        s2, fa1, fs0
                  mul          s6, t0, a3
                  flt.s        a3, fs2, ft9
                  srl          a0, t2, a1
                  remu         t0, a0, s7
                  fmv.w.x      fs8, gp
                  sub          t3, a0, t5
                  mul          ra, s5, a0
                  xori         a0, t4, 789
                  fdiv.s       fa5, ft7, fs8, rmm
                  rem          ra, t1, a5
                  fmin.s       fa2, ft9, ft3
                  fmax.s       ft7, fs10, ft9
                  fcvt.w.s     s7, ft4, rne
                  fmul.s       ft8, fa0, fa1
                  fsgnjn.s     fs5, fs0, ft8
                  fmv.w.x      fa3, s3
                  fcvt.wu.s    a5, fs7
                  sub          t2, t3, sp
                  fdiv.s       fs3, fs6, ft4, rup
                  fcvt.wu.s    s10, fa4
                  srai         s9, a1, 7
                  xor          s7, t3, a1
                  nop
                  and          s6, s3, a0
                  divu         s7, s9, t0
                  fsgnjx.s     fs6, ft2, ft8
                  srl          a1, s5, zero
                  srli         t3, s4, 4
                  fcvt.s.w     fa7, t3
                  fadd.s       fa4, fs6, ft5
                  srl          s8, s9, a6
                  fmv.w.x      ft3, ra
                  div          a7, tp, s4
                  flt.s        s7, ft2, ft6
                  flt.s        sp, fs4, fs10
                  rem          s0, zero, s5
                  fsub.s       ft8, ft2, ft6, rtz
                  srai         t2, t0, 8
                  div          s10, a2, a4
                  srli         s10, sp, 20
                  or           a3, t3, t1
                  div          s9, gp, s4
                  and          t0, t4, s3
                  mulhu        s11, t4, t6
                  fsub.s       ft2, fs8, ft2
                  andi         s0, a4, -485
                  xor          s9, s9, s5
                  nop
                  fsgnjn.s     fs3, fs5, ft7
                  srl          s10, a4, a4
                  srl          s9, tp, t3
                  flt.s        tp, fa1, fs4
                  fcvt.wu.s    t2, ft11, rtz
                  mulhu        a2, gp, gp
                  fcvt.wu.s    t5, fs0, rtz
                  fcvt.wu.s    s5, ft2, rdn
                  fcvt.s.w     ft0, t6
                  lui          s8, 664312
                  fmin.s       fs9, fs8, fa4
                  addi         t3, ra, -1693
                  fcvt.w.s     s9, ft1
                  fsgnjn.s     fa1, fs2, ft3
                  fmul.s       fs7, fs2, fa0, rup
                  sra          s11, s2, s2
                  fmul.s       fs3, fa1, fa2
                  srli         s6, t3, 29
                  fmax.s       ft11, fs1, fs4
                  fmv.w.x      ft6, s3
                  fsgnjx.s     fs11, fs7, fa1
                  or           s1, ra, s0
                  slt          t1, s11, a5
                  slli         s1, s8, 7
                  divu         s5, a5, t6
                  xor          t1, a3, a3
                  divu         s10, a4, tp
                  mulhu        s11, t2, s6
                  ori          s6, t4, 1695
                  xori         gp, tp, -408
                  sltiu        t5, t3, -648
                  srl          s5, a5, t0
                  feq.s        s11, fs11, ft5
                  addi         s5, sp, -671
                  addi         s9, tp, -1427
                  auipc        a1, 794479
                  fadd.s       fs10, fa4, fa2, rup
                  lui          s7, 712684
                  sll          ra, tp, a1
                  sra          sp, a2, s9
                  div          s8, t1, s7
                  slti         ra, s5, 1111
                  mulhu        s8, ra, t4
                  fmul.s       ft0, ft9, fs7
                  fcvt.wu.s    tp, ft3, rmm
                  slti         s5, t2, 873
                  nop
                  srli         s10, gp, 0
                  srai         s10, s6, 17
                  fcvt.s.wu    fs11, a3, rne
                  fmv.w.x      fa6, t6
                  or           ra, a3, tp
                  fcvt.s.w     fs3, t0
                  andi         t6, s0, 1363
                  mulhsu       a0, a4, t3
                  sltiu        sp, t3, 997
                  srl          s3, a3, s9
                  remu         s3, a5, tp
                  mul          a5, t4, s9
                  slti         zero, sp, -212
                  sub          s7, s0, sp
                  fcvt.wu.s    s6, ft0, rdn
                  fadd.s       ft8, ft11, ft5, rdn
                  mulhsu       s3, s10, t5
                  xori         a3, t5, 740
                  mulhsu       t2, s3, s3
                  mulh         s2, t6, s6
                  addi         s8, a3, -1715
                  fcvt.s.wu    fs1, zero
                  fadd.s       fa7, fa0, ft9
                  fcvt.w.s     s0, fa3, rmm
                  fsgnjx.s     fs7, fs1, fs0
                  slli         sp, ra, 13
                  srl          s7, t6, s9
                  srai         sp, t6, 22
                  andi         a3, t4, -1298
                  fle.s        ra, ft10, ft9
                  divu         s0, s8, s7
                  remu         gp, zero, a7
                  sll          s5, s2, a1
                  fcvt.wu.s    s1, ft10, rdn
                  srli         sp, s2, 20
                  fsub.s       fa7, fa5, fs8
                  add          s6, a2, s2
                  fcvt.w.s     s9, fa0, rup
                  fsgnjn.s     fa4, fa3, fa1
                  lui          s9, 881092
                  fsub.s       ft7, fs0, ft10, rdn
                  rem          s11, s11, a4
                  sub          s7, s8, t6
                  fsgnjx.s     fs9, ft1, fs0
                  mulh         t1, t4, zero
                  remu         t1, s11, a6
                  ori          tp, s10, 207
                  xor          a5, s3, s6
                  sub          gp, a4, sp
                  fcvt.wu.s    a7, fa0, rne
                  fsgnjn.s     ft2, fs11, fs2
                  fcvt.wu.s    s11, fs2, rup
                  feq.s        s10, fs11, fa2
                  srai         s2, sp, 8
                  slt          s2, t3, t6
                  fcvt.s.w     fa2, sp
                  fmv.w.x      ft6, s11
                  sltu         t5, tp, s3
                  fmv.x.w      t5, fs7
                  fdiv.s       fs6, fs2, ft9
                  rem          t5, t6, s1
                  fmv.x.w      s10, ft1
                  auipc        t1, 895163
                  fadd.s       ft7, ft1, fs6
                  fsgnjx.s     fs1, fs6, fa5
                  slli         a5, t3, 21
                  fadd.s       fa0, fs9, ft3
                  fmul.s       fs6, fs0, fs11
                  fmv.x.w      s9, fa3
                  or           a5, t5, a4
                  fsgnj.s      fs3, fs6, ft6
                  mulh         t5, tp, a7
                  addi         a5, t6, 1386
                  fcvt.wu.s    s10, fa5, rtz
                  lui          a7, 109388
                  remu         a3, s2, s8
                  fmul.s       fs8, fs8, fa2, rup
                  fmul.s       fs7, fa7, fs10
                  slti         t2, t1, -1035
                  fsqrt.s      fa5, fa6
                  fsgnjx.s     ft1, ft5, fs0
                  auipc        s8, 576371
                  fmul.s       fs2, fs0, fs10
                  sltiu        a1, a1, -83
                  srli         t2, s6, 18
                  fsgnjn.s     fs6, fs9, ft0
                  fclass.s     a7, fs4
                  and          t4, s0, s5
                  fsgnj.s      fs2, fs11, ft3
                  mulh         ra, s1, t4
                  fle.s        sp, ft8, fa7
                  fcvt.s.wu    fa1, a5
                  addi         t1, s9, 1260
                  div          s6, a3, s5
                  sltu         s8, s10, a0
                  and          a7, a1, s6
                  andi         t4, gp, -1505
                  fcvt.s.wu    fa6, s10
                  divu         s11, ra, t5
                  fmv.w.x      fa5, a2
                  fcvt.wu.s    s2, fs4, rmm
                  feq.s        s7, ft3, fs9
                  fcvt.s.w     fs8, a6, rdn
                  nop
                  fcvt.wu.s    s8, fs9
                  fsub.s       fs2, fs1, ft7
                  sub          s11, gp, s2
                  slti         zero, a5, -1247
                  or           t5, tp, a2
                  fclass.s     sp, ft5
                  sra          s1, a6, s4
                  fsub.s       fs4, fs6, fa6, rup
                  lui          gp, 428472
                  rem          sp, t1, a6
                  feq.s        a0, fs5, ft11
                  sll          s0, t0, t1
                  ori          t5, a5, 358
                  fmax.s       ft2, fs1, fs1
                  sltiu        a2, t2, 846
                  mulh         s7, s9, a3
                  or           t6, s5, s5
                  ori          s10, s11, -684
                  fcvt.s.w     ft0, gp, rne
                  srl          s2, t0, t3
                  ori          t4, s6, 1479
                  srai         gp, a0, 19
                  fmv.x.w      s9, ft10
                  fcvt.s.wu    fa7, s5
                  fsqrt.s      fs11, ft8
                  and          s3, s7, a1
                  and          s5, s7, s11
                  fcvt.s.w     fa0, s8
                  fcvt.w.s     t1, fa6, rne
                  sltiu        gp, t6, -1836
                  srli         s6, t6, 26
                  sltu         tp, t3, ra
                  rem          t5, a3, t1
                  fsgnj.s      ft4, fa0, ft7
                  fcvt.s.w     fa6, t2
                  fsqrt.s      fa1, fs2, rdn
                  andi         t3, a5, 1419
                  ori          a0, s8, 459
                  sub          tp, s0, a7
                  sub          t0, s1, s8
                  divu         s0, a7, s3
                  srli         s5, s5, 11
                  feq.s        s9, fa3, ft11
                  mul          s9, s8, a2
                  remu         t5, zero, zero
                  fmv.w.x      fs10, s3
                  mulhsu       zero, a3, t1
                  srli         t3, s11, 4
                  rem          s2, t0, s2
                  lui          t3, 399549
                  mulh         s5, a6, a0
                  andi         s1, s8, -546
                  mulhu        t1, t3, a5
                  lui          tp, 131872
                  fclass.s     s3, fa4
                  divu         tp, a2, gp
                  xor          a0, s6, a5
                  slti         a3, a5, -1230
                  fsqrt.s      fa3, ft6, rdn
                  auipc        s7, 620605
                  fmv.w.x      ft9, a1
                  mulhu        a0, s2, s11
                  and          a7, t4, s1
                  andi         s1, t0, 1862
                  xor          a7, a3, s5
                  flt.s        s8, fs3, fs9
                  fcvt.s.wu    fs9, tp
                  sra          tp, sp, s0
                  fmv.x.w      a5, fa0
                  fcvt.s.wu    fs5, s11, rup
                  srai         s3, s4, 30
                  fcvt.wu.s    s2, ft11
                  srai         s7, s8, 5
                  fsqrt.s      fs10, ft10, rmm
                  nop
                  lui          a3, 169673
                  slti         s5, t5, 1221
                  sub          s2, t3, s10
                  fmin.s       ft3, ft0, ft1
                  mulhsu       a0, t0, s11
                  andi         s8, t0, 3
                  fcvt.w.s     s7, fa0, rdn
                  ori          s10, s8, -1211
                  fadd.s       fs7, fs9, fs6
                  xor          t1, t1, tp
                  and          s9, a2, a2
                  fmv.x.w      tp, fs4
                  fcvt.wu.s    s9, fs3
                  srl          t0, a4, t3
                  fsub.s       ft0, fs4, fa1
                  mulhu        t1, s6, t2
                  addi         a3, s3, 1843
                  sra          s1, a2, t2
                  fcvt.wu.s    s7, ft11
                  sra          a0, ra, gp
                  fsgnjx.s     ft8, ft5, ft5
                  sltu         t3, a6, s7
                  fcvt.w.s     ra, fs0
                  srl          t2, s5, a7
                  sub          a1, t3, t1
                  div          a0, a3, s6
                  fmin.s       ft3, fs1, ft9
                  fsgnjn.s     fa4, ft9, fs10
                  remu         s11, s0, s3
                  fmax.s       ft3, fs9, fs11
                  fmul.s       fa0, fa6, fs5, rne
                  slli         a3, gp, 10
                  xori         t3, a4, 1188
                  andi         a0, a5, -334
                  sub          t2, s8, a6
                  srl          a5, s5, s0
                  sub          zero, zero, t2
                  fsub.s       fs6, fs3, fs0
                  mul          a1, gp, s10
                  sltiu        a5, a1, -1663
                  rem          s0, gp, sp
                  fcvt.wu.s    t3, fs11, rne
                  xor          a3, t3, s1
                  and          s9, tp, s7
                  fcvt.w.s     s6, fs5, rdn
                  mulhu        t1, a0, s2
                  fmin.s       ft9, ft11, ft0
                  srai         t4, s5, 14
                  slt          t0, a0, s0
                  sltiu        s6, s7, -1358
                  fmv.x.w      s3, fa3
                  lui          s5, 1033029
                  fdiv.s       ft2, fa3, fa4
                  lui          s6, 985685
                  fsgnjn.s     fs1, ft3, fs8
                  fmax.s       ft6, fs10, fs5
                  mulhsu       a5, gp, a7
                  fadd.s       ft11, ft5, fa4
                  flt.s        a1, fs7, ft6
                  fsgnj.s      ft3, ft3, ft6
                  fcvt.s.w     fs9, s5, rmm
                  fmul.s       ft10, ft1, fs4
                  fmax.s       fa6, fa2, ft9
                  lui          s7, 394705
                  fsgnj.s      fs1, fs6, fs7
                  sll          s7, a1, s10
                  fmin.s       fs4, fs8, fa5
                  addi         zero, s7, 217
                  and          a0, t3, ra
                  auipc        s9, 92748
                  mulhu        t2, zero, zero
                  fclass.s     a5, fs0
                  addi         s1, t4, 630
                  sll          a7, s6, s11
                  divu         a2, t3, a6
                  flt.s        t5, ft11, fs9
                  fmax.s       ft6, ft2, fs4
                  andi         a2, a5, -1108
                  fsgnjx.s     ft10, fs9, fs4
                  div          s10, s4, ra
                  feq.s        t3, fs8, ft6
                  lui          s10, 183422
                  divu         t0, s9, t2
                  nop
                  slti         tp, s9, -1692
                  fmv.x.w      s10, ft7
                  addi         s0, s11, 1810
                  lui          s1, 39510
                  fcvt.wu.s    s8, fa3, rne
                  fcvt.wu.s    s0, fs8, rdn
                  remu         a5, sp, a5
                  add          tp, s0, a3
                  fcvt.wu.s    ra, ft5, rne
                  fcvt.w.s     s7, fa7, rtz
                  lui          zero, 785248
                  sltu         t2, a1, tp
                  fclass.s     ra, ft6
                  fsqrt.s      fs3, fs4, rne
                  div          t3, a3, t1
                  fmax.s       fs4, fs11, fs4
                  flt.s        sp, fs1, fa0
                  fcvt.s.wu    ft4, a6
                  fmv.x.w      sp, fs4
                  or           s9, a3, s5
                  fsqrt.s      fs10, fa6
                  mulh         s6, s4, a4
                  mul          s9, s0, s3
                  fmin.s       ft1, fa3, ft11
                  fmin.s       ft9, ft2, ft9
                  nop
                  xor          t2, a0, a6
                  slt          s3, gp, t2
                  slt          gp, s10, s5
                  sltu         t4, t5, s1
                  or           s5, a1, s4
                  flt.s        zero, fa0, ft8
                  add          t6, a1, a4
                  fsgnjx.s     fs3, ft9, fs0
                  slti         s1, t3, 275
                  mulh         zero, t1, s6
                  fsqrt.s      ft9, fa6
                  feq.s        s6, ft9, ft6
                  fsgnjx.s     fs2, fa5, ft9
                  slti         t5, t1, -333
                  addi         s5, s8, 990
                  ori          sp, s0, -1798
                  ori          t0, t6, 1862
                  fmax.s       fa2, fa3, ft1
                  fsgnjn.s     fa4, ft3, fa2
                  fadd.s       ft5, fs1, fa2
                  flt.s        s1, ft10, ft2
                  mulhu        tp, s5, s9
                  slti         a0, sp, -316
                  fadd.s       fa4, ft10, ft6, rne
                  fclass.s     a1, fa6
                  srl          zero, s4, a7
                  sll          a0, t4, s5
                  fsub.s       ft7, fs4, fa4, rdn
                  fcvt.w.s     a3, ft10, rtz
                  fle.s        s10, fs8, ft9
                  rem          t1, s6, a0
                  feq.s        ra, fa4, fs4
                  remu         s5, t4, s8
                  sltu         s6, s7, a2
                  fmv.x.w      s1, ft0
                  slt          s7, s9, s4
                  fsub.s       ft9, fa5, ft11, rup
                  remu         tp, t0, zero
                  fsqrt.s      fa2, fa6, rdn
                  fclass.s     t2, fa7
                  nop
                  sub          a0, s0, s6
                  sll          sp, s5, t3
                  fdiv.s       fa2, ft9, ft10
                  fmin.s       fs11, fa1, fa5
                  srl          a1, ra, tp
                  fmul.s       fa1, ft10, ft6, rup
                  andi         t5, t3, 184
                  lui          a0, 309762
                  fcvt.w.s     s1, fa5
                  or           s5, s4, s10
                  slt          s8, t2, s7
                  fsgnjx.s     fa0, fs1, fs2
                  xori         t4, ra, 1528
                  xori         s9, s8, -1365
                  mul          t1, s1, s9
                  fsgnj.s      fa4, fs4, fa6
                  fsgnjn.s     fa6, fa2, fs1
                  slt          t0, tp, s9
                  sra          s3, s11, s6
                  divu         t6, t4, s1
                  andi         s6, gp, 1
                  fcvt.s.wu    fs8, s4, rdn
                  xor          a5, s10, s5
                  xor          a7, t1, a2
                  fmv.w.x      fs9, s8
                  sltiu        a0, t1, -465
                  xori         t5, s11, 919
                  addi         s5, a3, -1049
                  sll          gp, s10, t1
                  feq.s        t2, fs1, fa3
                  srli         s8, s10, 31
                  mulhsu       s6, s1, t3
                  fsgnjx.s     fa1, fa1, ft9
                  fdiv.s       ft5, ft8, fa7
                  fcvt.w.s     s0, ft2
                  fsqrt.s      fs6, ft8
                  xori         ra, s4, -1224
                  slli         s7, s10, 13
                  fcvt.s.wu    fa3, a0, rmm
                  auipc        ra, 320774
                  fcvt.w.s     s10, ft5
                  fcvt.s.w     fa1, a5, rtz
                  lui          t3, 645124
                  fmv.x.w      s2, fs11
                  fcvt.s.w     ft11, t2, rtz
                  ori          t6, a3, -1679
                  nop
                  fdiv.s       ft4, ft1, fs1, rne
                  fmax.s       ft2, ft3, fa7
                  fmul.s       fa4, ft11, ft11
                  sltu         s8, zero, a3
                  xor          t4, s0, t3
                  fmax.s       fs5, fa7, fs0
                  srl          a0, s7, s9
                  fsub.s       fs1, fs9, ft0
                  mulh         s1, s4, t0
                  fcvt.wu.s    a7, ft3, rtz
                  fsqrt.s      fs1, ft7
                  slli         s11, a0, 28
                  and          s11, s9, t6
                  fcvt.s.wu    fs9, s8
                  remu         s8, zero, a1
                  add          s5, s11, zero
                  fcvt.s.wu    fa6, a0, rne
                  fmax.s       ft8, ft2, fs4
                  div          tp, s6, s10
                  nop
                  and          s0, s8, s0
                  div          a0, s10, s8
                  mulhsu       zero, s10, ra
                  sltiu        a0, gp, -1027
                  remu         a1, t5, t6
                  fcvt.wu.s    t0, fs1, rne
                  xor          a3, t2, s1
                  fsgnjn.s     ft7, fa4, ft9
                  fcvt.s.wu    ft1, ra
                  and          s9, a1, a2
                  fcvt.w.s     ra, fs6, rup
                  lui          a0, 964145
                  fdiv.s       ft3, fs2, fs5, rdn
                  or           t2, a0, a1
                  fclass.s     s8, ft4
                  fcvt.s.wu    fa0, s7
                  mul          s2, t1, s0
                  fmul.s       fa1, fa2, fa2
                  fsgnjn.s     fs1, fa4, fs7
                  fcvt.w.s     s1, fs5, rtz
                  div          t3, t0, a6
                  slli         s11, ra, 9
                  mul          zero, t0, t1
                  srli         t2, t6, 18
                  fmax.s       ft4, ft3, fs10
                  ori          s5, s10, -534
                  fcvt.wu.s    s10, ft4
                  rem          s9, s5, a4
                  and          t6, tp, sp
                  fsgnjx.s     fa4, fs5, fa1
                  srli         s3, s1, 2
                  sltiu        a3, t1, 745
                  slt          s8, s11, gp
                  auipc        a7, 693873
                  mulhsu       s9, t0, s2
                  fle.s        s2, fs0, fa1
                  add          a7, s7, t2
                  andi         tp, t3, 1530
                  add          s8, zero, t1
                  fsgnj.s      ft8, ft6, ft11
                  and          a3, s5, a7
                  fsgnj.s      ft11, ft2, fa6
                  fcvt.w.s     s2, fs5, rtz
                  slli         t1, tp, 25
                  auipc        a3, 603728
                  mulhu        t2, t5, a1
                  fcvt.w.s     t5, fs8, rne
                  flt.s        s5, fa7, ft0
                  sltu         a0, t5, t3
                  fmv.x.w      t3, fa2
                  fcvt.wu.s    s2, ft3
                  srai         a3, s9, 23
                  sra          t6, gp, ra
                  divu         a5, gp, s1
                  fcvt.w.s     s10, fa5, rmm
                  fadd.s       fa2, ft0, fa5, rmm
                  fmv.x.w      t4, fs7
                  sltu         s8, sp, s2
                  fsqrt.s      fs8, fa6, rne
                  fmv.x.w      s11, fa6
                  sra          t3, s1, s4
                  fsqrt.s      ft3, fs8
                  fle.s        t2, ft7, ft9
                  nop
                  rem          s7, t3, s5
                  xor          s10, ra, tp
                  srli         s0, s6, 24
                  nop
                  srai         sp, s2, 12
                  fmul.s       fa3, fs9, fs5, rne
                  fsgnjx.s     fa5, fs11, fa1
                  fmul.s       fa7, fs2, fs9
                  fsgnjn.s     ft5, fa1, fa4
                  sll          s7, t1, gp
                  fcvt.s.w     ft5, t0
                  div          a5, a0, t4
                  remu         t6, s9, a6
                  or           a5, t0, a7
                  srl          t2, a3, sp
                  srl          a3, s9, a4
                  sra          s10, s11, a7
                  fcvt.wu.s    s11, fa4
                  sub          s9, a1, s11
                  sub          zero, s2, a4
                  fclass.s     t3, ft5
                  fmul.s       fs2, ft11, fa6, rne
                  and          s11, t1, t4
                  xor          s2, s4, s1
                  fsgnjx.s     fs11, fs0, fa3
                  auipc        gp, 507484
                  div          s6, t4, s3
                  divu         t2, s10, s11
                  slti         s0, a1, 385
                  fcvt.s.wu    fa2, t2, rtz
                  andi         sp, a7, -112
                  fclass.s     a3, fa6
                  and          tp, s8, t5
                  fsgnj.s      fs2, ft8, fs3
                  xor          sp, s4, a2
                  sra          sp, s4, gp
                  divu         s10, a0, gp
                  srl          a0, s4, t5
                  fmin.s       fa7, ft3, fs4
                  fmul.s       ft9, ft8, ft1
                  fcvt.s.wu    fs3, s5
                  fsgnjn.s     ft5, fs1, fs10
                  fcvt.s.w     fs7, a1
                  mulhsu       a1, t5, s6
                  fsqrt.s      fs2, ft1
                  lui          a5, 218207
                  xori         s11, t3, -320
                  divu         zero, a2, s7
                  xori         t1, a5, -1143
                  remu         s2, t4, ra
                  or           s2, gp, t5
                  slli         s11, s1, 12
                  fsgnj.s      fa7, ft5, ft4
                  sll          s5, t4, s4
                  fle.s        a1, ft4, fa4
                  fsqrt.s      fa3, fs10, rup
                  feq.s        a2, fa4, fs2
                  divu         s7, a6, s1
                  mul          t4, s0, a6
                  mulhsu       s3, s8, s5
                  sll          a7, a1, s9
                  mulh         s11, s1, s9
                  slt          s8, a0, s3
                  nop
                  flt.s        t3, ft2, fs0
                  rem          s0, ra, s2
                  slli         a2, s2, 0
                  add          a2, sp, s10
                  fcvt.w.s     s11, ft11
                  fadd.s       fs2, fa7, ft5, rdn
                  srl          s8, zero, s6
                  fadd.s       fs2, fa7, ft10
                  add          s8, sp, t3
                  xori         a1, a6, -1966
                  fadd.s       ft1, fs3, ft5, rup
                  sltiu        s9, t1, 1976
                  xor          s5, s7, gp
                  fmv.w.x      ft7, t5
                  fdiv.s       fs10, fs10, ft2
                  nop
                  and          s10, s3, a5
                  rem          a5, s11, a6
                  or           gp, s9, s6
                  fsgnjn.s     ft7, fa2, fa6
                  srai         s6, s10, 7
                  fcvt.s.w     ft0, a1
                  fsgnjx.s     ft1, ft5, ft4
                  fcvt.s.w     fs1, s10
                  fsub.s       ft11, ft8, ft11
                  andi         s10, t4, -1783
                  addi         t4, t2, 1797
                  remu         s5, s9, s6
                  sltu         s0, s9, t3
                  xori         a2, s8, -1376
                  fsgnjx.s     fa4, fa5, ft11
                  srai         s1, s4, 13
                  remu         a2, a1, s7
                  mulhsu       gp, t2, s6
                  slti         t2, a5, 972
                  srli         t6, a7, 21
                  and          t6, s6, a1
                  mul          s3, s3, t3
                  addi         a5, t0, 1950
                  add          t4, s8, a5
                  mulhsu       a3, ra, a1
                  fsqrt.s      fs3, fs4
                  remu         a0, a1, a4
                  fclass.s     a2, fs1
                  fcvt.w.s     t3, ft2, rup
                  fcvt.s.w     fa1, a3
                  fsgnjx.s     fs10, fs0, ft7
                  xor          a7, a7, a5
                  fcvt.wu.s    s3, fs7, rmm
                  flt.s        a5, fa0, fs11
                  sltiu        a2, s2, -1412
                  mulhsu       t5, t3, sp
                  srli         s2, a6, 14
                  lui          tp, 733468
                  mulhu        t2, t6, a2
                  divu         s2, a3, t3
                  fsgnjn.s     ft2, fs1, fs2
                  slti         t2, a0, -249
                  fsqrt.s      fa0, fs11
                  srli         a2, s0, 18
                  lui          a1, 596670
                  fadd.s       fs10, fs2, ft0, rup
                  fle.s        tp, fa5, fs9
                  fclass.s     gp, ft11
                  fcvt.w.s     s0, fs0, rup
                  fsgnj.s      fs8, ft7, ft5
                  remu         t5, a7, s8
                  sub          zero, t6, zero
                  xori         tp, s0, -923
                  fsgnj.s      fa5, ft0, ft7
                  remu         t6, gp, s2
                  remu         gp, s2, a3
                  xori         a1, a6, -1610
                  feq.s        t2, fa5, fs10
                  fadd.s       ft10, ft1, ft7, rmm
                  sub          zero, t6, a3
                  sra          t6, gp, s4
                  mul          a7, zero, s2
                  and          a3, t0, t6
                  fmv.x.w      ra, fa1
                  fsgnj.s      ft3, fs5, fs4
                  add          s8, t0, a7
                  or           a3, s9, ra
                  ori          a3, a4, -1368
                  fsub.s       fs7, ft10, fa4, rup
                  mulhsu       t6, s0, gp
                  fcvt.wu.s    s1, fa4, rne
                  fmul.s       ft1, fa2, ft0
                  srli         s10, s1, 9
                  add          a2, s10, s9
                  sltu         s3, a3, t2
                  or           s8, a4, s11
                  mulhu        a5, a2, s0
                  sll          zero, s3, a4
                  fmin.s       fs7, ft7, fs4
                  mulhsu       ra, s3, s3
                  fmv.x.w      a3, fs7
                  flt.s        s9, ft5, ft9
                  fcvt.wu.s    t0, fa0, rne
                  fdiv.s       fs6, fa6, ft7
                  slli         t0, ra, 7
                  addi         s2, t5, -657
                  xori         t6, s7, -99
                  sub          gp, s5, t3
                  mulhsu       t3, s11, t0
                  feq.s        t3, ft2, ft7
                  auipc        t5, 738391
                  slt          t6, a2, zero
                  fsgnjx.s     fs6, fa4, ft1
                  fmin.s       fs5, ft0, fs9
                  fdiv.s       fs6, fa2, ft11, rmm
                  xor          s0, a2, s3
                  feq.s        s5, fs6, fa7
                  xor          zero, t6, s8
                  fmv.x.w      s8, fa5
                  andi         zero, zero, 1256
                  mulhu        s11, a2, s0
                  slt          a3, s8, s9
                  sltu         a5, s8, s3
                  add          s3, zero, t0
                  fcvt.s.w     fa5, a6
                  fcvt.s.wu    fs6, t0
                  fmv.x.w      s2, ft11
                  xori         s11, a4, 1215
                  srli         a0, s8, 19
                  lui          a7, 59756
                  sltiu        t2, t4, -1840
                  fcvt.s.wu    fa5, s10
                  fcvt.w.s     s6, ft6, rmm
                  srai         t6, a1, 28
                  fclass.s     s7, fs9
                  divu         s5, a2, a5
                  fsub.s       ft11, fs9, fa2
                  fle.s        gp, ft2, ft6
                  fsgnjx.s     fs8, fa2, fa7
                  addi         t3, s11, -1365
                  sll          s10, s2, s2
                  fdiv.s       ft4, fa4, ft6
                  sll          zero, s2, a6
                  srli         t6, a7, 5
                  fcvt.wu.s    t2, ft6, rmm
                  fsgnjx.s     ft5, fs9, ft0
                  sub          s3, a1, s8
                  fsgnjn.s     ft11, fa5, fa6
                  flt.s        zero, fs2, ft3
                  mulh         a3, ra, s5
                  fmv.x.w      zero, fs11
                  fsgnjx.s     fs9, fa4, fs1
                  and          s0, s11, s2
                  or           s11, a6, zero
                  fcvt.wu.s    t1, fs4, rne
                  fmul.s       ft0, ft7, ft7
                  lui          s11, 444866
                  fle.s        s10, fa3, fs11
                  fsgnjn.s     fa3, ft1, ft10
                  srai         s5, sp, 30
                  sltiu        s9, s7, -1303
                  fsgnjx.s     fs1, fs7, ft2
                  and          s8, s5, t3
                  mulh         s0, t1, a2
                  or           a1, s6, tp
                  and          zero, s5, a6
                  xori         t6, a3, 1119
                  fcvt.s.wu    ft4, t0
                  fsgnj.s      fs8, fs11, fa7
                  nop
                  fcvt.wu.s    a3, fs1, rdn
                  remu         a0, zero, a1
                  fsqrt.s      ft11, fs5, rtz
                  mulhu        ra, t3, s1
                  fadd.s       ft7, fs4, ft8, rdn
                  fmv.x.w      s8, fa0
                  nop
                  or           s7, gp, a6
                  auipc        t6, 57611
                  fmv.x.w      sp, ft0
                  fadd.s       fs0, fs2, fs7, rne
                  fcvt.w.s     s9, fa4
                  xor          s5, s0, a5
                  fadd.s       fa0, fa6, fs3
                  srl          s10, s7, s2
                  add          a7, a5, t3
                  fsqrt.s      ft7, fs4
                  mulhsu       t1, s7, s9
                  fsgnjx.s     ft10, fs6, fs5
                  srai         a3, a3, 3
                  sltu         tp, t1, ra
                  fle.s        s9, ft9, ft5
                  fcvt.wu.s    s6, ft8
                  mulhu        tp, sp, t6
                  fadd.s       ft1, ft3, fs7
                  slli         s3, a6, 12
                  fmax.s       ft2, fa4, ft4
                  fsgnjn.s     fa6, ft10, ft8
                  fmv.x.w      s9, fs8
                  andi         zero, s0, 1698
                  srli         s3, t0, 21
                  mulhu        s2, s2, t2
                  lui          t3, 240998
                  addi         s7, ra, -825
                  fsgnjn.s     fs11, fs1, ft2
                  flt.s        s6, fs7, fs3
                  srli         s1, a1, 1
                  sll          t5, a1, s10
                  nop
                  remu         zero, a3, s8
                  fsgnj.s      ft3, fa5, ft9
                  fclass.s     t3, ft10
                  or           a5, s3, s6
                  or           s9, s8, s9
                  fadd.s       fa4, fa5, fa7, rmm
                  remu         t0, s6, t3
                  fclass.s     t1, ft7
                  rem          ra, s5, sp
                  rem          s10, s3, a4
                  andi         t2, zero, 509
                  fle.s        gp, ft3, fa4
                  add          a0, s10, a2
                  add          a1, t2, a4
                  mulhsu       t4, a7, a5
                  divu         s9, a6, a3
                  fclass.s     s5, ft10
                  fadd.s       fs3, fs6, fs10, rmm
                  mul          t6, sp, s2
                  xor          gp, zero, t5
                  flt.s        gp, fa5, fs2
                  slt          a1, s1, s11
                  sra          t5, s0, a2
                  xori         t2, t0, 1313
                  andi         s11, a6, -1830
                  sltu         t0, a2, s6
                  flt.s        s6, fs10, fs3
                  fdiv.s       fa5, fs6, ft11
                  auipc        sp, 354418
                  fmv.x.w      tp, fs5
                  fcvt.wu.s    tp, ft3
                  slli         s5, a0, 25
                  div          t1, a3, t6
                  fcvt.s.wu    fs5, t1, rtz
                  fsgnjx.s     fa6, ft2, ft7
                  addi         t5, a3, -1802
                  and          tp, s0, s0
                  mulhu        a3, t2, a4
                  flt.s        a7, ft4, fs4
                  mulhsu       s1, t0, t2
                  fle.s        a7, fa6, fs11
                  remu         sp, t6, t5
                  srli         s7, s4, 0
                  sub          t0, tp, s4
                  fcvt.wu.s    tp, ft10
                  div          t5, zero, t0
                  srli         t3, s11, 26
                  fmul.s       ft9, fa4, ft2, rdn
                  srl          zero, s4, gp
                  fsgnj.s      fs3, fs8, ft3
                  mulhsu       ra, a3, a3
                  fcvt.s.w     fs5, a2
                  addi         s0, s0, -1996
                  add          s11, s9, tp
                  sltiu        t0, gp, 1842
                  div          t4, s3, s6
                  mulhu        a5, ra, s5
                  srl          a7, a6, a5
                  div          gp, zero, s3
                  xor          a5, a3, t4
                  mul          ra, s10, s6
                  fdiv.s       ft9, ft9, fs8
                  fsgnjx.s     fa1, ft4, fs8
                  xor          s5, a1, s9
                  mul          a2, a6, a2
                  fmv.w.x      fs10, s6
                  remu         a0, s4, a6
                  xori         s2, a2, -1764
                  fmv.x.w      s1, ft9
                  fsqrt.s      fs5, ft0, rdn
                  fsgnjx.s     fs6, fs2, ft1
                  fsgnjn.s     ft3, fa7, fs1
                  fcvt.s.w     fs11, a0
                  andi         s9, t1, -351
                  add          s3, a2, s10
                  fcvt.w.s     t3, ft8, rdn
                  fmul.s       fs0, ft10, fs6, rmm
                  mulhu        t1, tp, a4
                  rem          a1, a2, s0
                  divu         a5, gp, s6
                  fsgnj.s      fs8, fs5, fs9
                  fcvt.w.s     s6, ft11
                  fmv.x.w      sp, fa3
                  fle.s        s11, fs2, fs7
                  fmv.x.w      s0, ft5
                  xor          a3, t1, s11
                  srli         ra, s7, 15
                  fdiv.s       ft2, fs5, fs8, rdn
                  mulhsu       s8, s2, a1
                  slt          s6, tp, s7
                  remu         t5, s11, s8
                  fsgnj.s      fs11, fs6, fs5
                  fcvt.s.w     fs5, t0, rne
                  fsgnj.s      ft7, fs3, fs2
                  xori         t3, a5, 469
                  fcvt.wu.s    t1, fs2
                  sub          zero, s9, t0
                  mulhsu       t4, a7, t2
                  lui          s11, 1034150
                  srli         t4, t2, 17
                  fsgnjn.s     ft8, fa1, ft3
                  remu         s9, gp, gp
                  fsub.s       ft1, ft3, ft6
                  fcvt.w.s     t0, ft6
                  mul          s3, s3, ra
                  fadd.s       fa6, fs2, ft9, rtz
                  fmul.s       fs4, ft3, ft1, rne
                  lui          t1, 832303
                  fsgnjx.s     fs5, fs11, ft0
                  sll          t0, t3, s4
                  mulhu        s5, s2, s3
                  fmul.s       ft3, fs5, ft5
                  sltu         a7, a6, s7
                  xori         t4, s4, -225
                  fle.s        tp, fs4, fs8
                  mulhsu       s5, zero, a6
                  fcvt.s.wu    fa2, s3
                  mulh         s10, s4, s2
                  fsub.s       fs1, fs4, ft6, rtz
                  fdiv.s       fa4, ft4, ft10, rtz
                  remu         s8, t0, sp
                  mul          gp, t5, a4
                  sltiu        s11, ra, -573
                  mulhsu       zero, a0, s9
                  fdiv.s       ft9, ft6, fs7
                  ori          a1, s0, 1050
                  fmax.s       ft1, fs9, ft6
                  fsgnjx.s     fa2, fa5, fa5
                  fmv.w.x      fs0, sp
                  mul          t3, a3, s10
                  add          t4, s1, s2
                  div          t6, t6, s9
                  fcvt.w.s     s11, ft11, rup
                  fmax.s       ft0, ft1, fs4
                  fcvt.s.w     fs10, tp
                  nop
                  mulh         t5, s0, t5
                  fmin.s       fa5, ft8, fs4
                  fadd.s       ft5, fs2, ft1
                  sltu         zero, a1, a1
                  slt          t1, s5, a1
                  slti         sp, a1, 1229
                  fcvt.wu.s    t1, fa2
                  mulhu        a7, s7, s3
                  fcvt.s.wu    ft8, t1
                  srl          s11, s2, s4
                  fmax.s       fa2, fs5, ft10
                  srl          s8, s7, gp
                  xor          s1, s10, a0
                  srai         a5, t2, 1
                  sltu         s0, t5, ra
                  addi         gp, s5, 1690
                  lui          a3, 741645
                  add          s2, s2, zero
                  rem          t4, sp, s3
                  sll          t1, s2, sp
                  andi         a3, t4, -1140
                  add          t6, t1, a6
                  srli         s1, t5, 8
                  slt          s3, ra, s5
                  slt          zero, t0, s1
                  sra          s7, t2, a6
                  mulhu        t3, s6, s5
                  fmv.w.x      ft6, zero
                  fle.s        s10, fa4, ft6
                  lui          t6, 503108
                  mulhsu       a3, tp, zero
                  fdiv.s       ft5, fs9, ft3, rdn
                  slt          sp, t0, s1
                  mulhsu       a1, s8, t6
                  sll          t5, t5, s3
                  nop
                  slt          s10, s0, a2
                  fsgnj.s      fs10, ft7, fa1
                  sll          a3, s8, a3
                  fsub.s       ft9, ft11, ft8
                  sltu         a2, s6, a2
                  rem          gp, t4, s3
                  mulh         a0, ra, zero
                  slli         s5, a4, 4
                  and          s9, s7, a0
                  fcvt.s.wu    ft10, s6, rup
                  srai         zero, s7, 24
                  fcvt.w.s     s1, fa3, rup
                  fcvt.s.wu    fs11, t4, rmm
                  slli         t0, a5, 25
                  fsgnj.s      ft10, fa4, ft10
                  fmv.w.x      fs10, t6
                  fmv.x.w      zero, fs3
                  mulhu        gp, t5, t0
                  fcvt.w.s     t3, ft3
                  auipc        a0, 1026035
                  fsgnjx.s     fa2, ft11, ft1
                  nop
                  srl          tp, a0, a2
                  fmin.s       fa5, ft9, ft10
                  fmv.w.x      ft9, a0
                  auipc        s2, 967909
                  fsub.s       fs4, fs1, ft11, rne
                  divu         t6, s6, t4
                  fsgnjn.s     fs4, fs8, fa5
                  slli         sp, s7, 30
                  mulhu        t6, s4, t3
                  sltiu        s10, s7, 1952
                  fadd.s       fa5, fa2, fa4
                  remu         ra, t4, s6
                  fcvt.s.wu    fa2, s11, rdn
                  fmv.w.x      fa3, tp
                  fsqrt.s      fa6, fs4, rmm
                  fadd.s       fs7, fs6, ft0, rdn
                  mul          t6, s7, tp
                  fcvt.w.s     t5, fs3
                  slli         s9, a4, 30
                  fdiv.s       fa7, fs9, fs0, rdn
                  fcvt.s.wu    ft11, a6, rne
                  fcvt.s.wu    fs1, t2, rdn
                  mulhsu       a7, a7, a4
                  fsgnj.s      fa2, fs7, fs8
                  mulhsu       a3, t1, a0
                  srl          t4, a4, s3
                  fcvt.s.w     fs6, s3
                  addi         sp, a2, -1894
                  sra          a5, a1, s0
                  fmv.w.x      ft7, t6
                  xor          sp, a7, s2
                  auipc        a1, 983061
                  or           a1, a0, s0
                  fmax.s       fa2, fs9, ft5
                  fmul.s       ft8, fa7, fs7
                  srl          t1, t4, a5
                  fmin.s       fa3, fa3, ft7
                  xor          s5, t4, ra
                  mulhu        s5, t6, t1
                  div          t6, tp, s5
                  fmul.s       fs10, ft3, ft10
                  slt          s10, zero, t0
                  ori          t4, s2, 623
                  add          t4, t6, s4
                  andi         t1, s1, 282
                  fsgnjx.s     ft9, fa4, fa2
                  fdiv.s       ft8, fs8, fs11, rne
                  and          s9, t4, sp
                  fsgnj.s      fs3, fs9, fs10
                  mulhsu       ra, t0, ra
                  add          ra, s1, s10
                  flt.s        t4, fa2, fs2
                  fclass.s     s1, ft3
                  fsgnjn.s     fs5, fa1, fs6
                  fmv.x.w      s7, ft5
                  srli         t6, s0, 16
                  srl          s1, s6, t2
                  slli         a0, t1, 13
                  mulh         s5, t4, t3
                  divu         tp, s9, s0
                  div          s0, s5, s10
                  fsgnj.s      ft7, ft5, fs3
                  fmv.x.w      t3, fa0
                  fcvt.s.w     fs2, a1
                  auipc        s1, 497901
                  or           s6, s3, s11
                  mul          s6, a5, tp
                  add          ra, a1, a6
                  mulhsu       zero, t5, a7
                  xori         zero, t2, 1507
                  fmin.s       fs0, fa6, fs5
                  srl          s10, a2, s7
                  slt          a5, s0, a2
                  slt          ra, s11, s6
                  fcvt.s.wu    fs9, t6, rdn
                  fcvt.wu.s    t0, ft4, rup
                  srai         s10, zero, 30
                  xor          a0, a1, s3
                  rem          a2, s0, s10
                  fsgnjn.s     ft7, fa1, ft0
                  mul          s10, t3, s4
                  xor          s3, a6, s3
                  xori         s7, a0, 1062
                  fadd.s       fs0, fa1, fs7, rdn
                  fmv.w.x      fa6, a6
                  fle.s        sp, fa2, fa5
                  fdiv.s       ft6, ft3, ft4
                  fmv.w.x      fs0, a5
                  srli         a2, s9, 20
                  and          s9, s7, sp
                  mulh         ra, a3, ra
                  rem          s3, s0, a7
                  xori         t6, a4, -1872
                  srai         s8, a7, 17
                  flt.s        s0, ft0, fa5
                  mulhsu       a1, s1, gp
                  fcvt.w.s     s11, fs1, rmm
                  mulhu        a3, s4, gp
                  mul          t6, s0, a7
                  slt          ra, t3, s8
                  remu         tp, a4, s6
                  lui          t4, 1012378
                  add          sp, t1, a7
                  mulh         t1, a4, s10
                  remu         a5, a0, t6
                  fdiv.s       fs11, fa7, ft5, rdn
                  auipc        a0, 679104
                  div          s11, a5, t0
                  sub          t1, a0, ra
                  fsqrt.s      fa7, fa5, rmm
                  remu         ra, a5, s5
                  sltu         t4, s0, t5
                  fadd.s       ft7, fs4, fs4, rne
                  rem          s2, a0, t6
                  auipc        s1, 884665
                  andi         a5, s6, 1276
                  xor          gp, s4, a3
                  sltiu        a3, s9, 1327
                  fsgnj.s      ft3, ft0, fa6
                  fsqrt.s      fa0, fs5, rdn
                  or           s10, t1, tp
                  fsgnjx.s     ft5, fa5, ft8
                  fle.s        s1, fs10, fa1
                  slt          sp, zero, s8
                  auipc        s5, 744651
                  fmul.s       fs5, ft7, fa4, rmm
                  xor          t3, a6, t3
                  fmax.s       fa6, fa0, fs4
                  add          gp, t3, a3
                  fdiv.s       ft5, fa0, ft1, rmm
                  or           a7, a5, ra
                  divu         t4, t4, t6
                  sltu         sp, a3, s8
                  srai         t0, t1, 23
                  fmin.s       ft4, fs1, fa1
                  fsgnj.s      fs2, fs4, ft10
                  feq.s        t0, fa0, fa0
                  ori          s11, s6, -1239
                  addi         t1, a3, -1963
                  mul          zero, a2, a6
                  addi         s2, s6, -1058
                  fmul.s       fs6, fa1, fa6
                  mul          a3, t5, t4
                  xor          tp, s1, a6
                  sltiu        t3, s1, -630
                  fsgnjx.s     fs8, fa2, fs3
                  fadd.s       ft4, ft5, fs11, rmm
                  lui          a2, 437293
                  flt.s        a3, fa6, fs4
                  addi         s3, s5, -605
                  fle.s        a7, ft0, fa5
                  sub          ra, a7, a0
                  fsgnjn.s     fa5, fa1, ft10
                  fclass.s     s1, fs1
                  rem          s10, s4, a5
                  sll          s5, s2, s8
                  feq.s        a3, fa4, ft0
                  fadd.s       ft6, ft5, fa0, rne
                  feq.s        s1, fs8, fa4
                  mul          s6, s1, s9
                  fadd.s       fa2, ft0, fa6
                  flt.s        t2, fs7, fs10
                  fcvt.s.w     fs11, a2, rtz
                  add          t0, s9, a6
                  add          s11, s3, s8
                  fmv.x.w      a5, ft3
                  fclass.s     a2, fs7
                  div          zero, t3, s4
                  feq.s        s6, fs6, fs8
                  fsqrt.s      fs9, fs9
                  mul          a2, s7, t0
                  slt          t0, s4, t3
                  fmax.s       ft1, fs4, ft5
                  fmax.s       fa3, ft9, fa5
                  add          s6, a1, s0
                  mulhu        t3, a5, t2
                  xori         a7, s6, -969
                  mulhu        gp, s4, gp
                  fadd.s       fs10, fs5, fa4
                  fcvt.s.w     ft10, t5, rmm
                  fle.s        s6, fa0, fa2
                  or           s10, t5, s5
                  sltu         s0, s11, a4
                  mul          sp, gp, s9
                  slt          sp, s5, a6
                  xor          t2, a1, a4
                  sll          s3, a1, s10
                  sll          t0, s1, s3
                  fcvt.s.w     fa5, s9, rmm
                  fcvt.s.w     ft6, t2
                  srai         s10, a5, 0
                  sltu         t4, sp, s0
                  mul          s11, a0, ra
                  slt          s11, a7, a5
                  fadd.s       fa2, fa3, ft10, rdn
                  fmin.s       fa7, fs6, fa4
                  sra          zero, s0, a3
                  srai         s3, s3, 12
                  divu         ra, gp, a3
                  srai         s3, s10, 17
                  slt          s11, s5, a4
                  fcvt.wu.s    tp, fa4, rdn
                  fcvt.s.w     ft10, ra
                  fmin.s       fs6, fs4, ft0
                  ori          a0, t6, -1822
                  fmv.x.w      t2, ft2
                  sra          t3, t6, t0
                  fadd.s       fs2, fs7, ft4
                  mulh         s5, s5, a6
                  div          sp, gp, a1
                  fmax.s       fs6, fa4, fa0
                  div          a0, a2, t5
                  andi         s11, s10, 1965
                  mulh         t6, a1, a1
                  andi         tp, a6, -1121
                  srli         tp, tp, 26
                  fcvt.wu.s    t5, ft5
                  fcvt.s.wu    ft1, s11, rtz
                  fsgnjx.s     fs1, fs8, fs11
                  flt.s        t1, fa5, fs8
                  mulhsu       t5, t0, t5
                  fdiv.s       fs6, fs11, fs8
                  mulhsu       s6, a5, s11
                  flt.s        t3, fa7, fa1
                  srai         s1, s4, 1
                  fmax.s       fa4, fa5, ft2
                  andi         s3, a3, -752
                  sra          s5, s2, s11
                  sll          s11, s4, a2
                  fcvt.s.w     ft3, a5
                  mulh         s8, a7, a5
                  sltu         t2, a1, s10
                  sltiu        a5, s9, 1191
                  slt          a3, a0, t0
                  fcvt.s.w     fs11, s2, rdn
                  mulhsu       s9, t5, sp
                  divu         sp, a1, s10
                  andi         s7, sp, 611
                  fle.s        s8, fs10, fs3
                  addi         a3, a7, -489
                  fsqrt.s      fa2, ft1
                  sra          s2, s5, a7
                  slli         sp, a2, 15
                  fmv.w.x      fs7, a0
                  auipc        a3, 471744
                  sltu         t3, a7, a6
                  remu         a0, s0, s10
                  addi         s11, a6, -1841
                  fle.s        sp, ft7, ft5
                  mul          t2, s5, ra
                  fclass.s     tp, fs0
                  fmin.s       fs4, fa2, fs3
                  xor          a2, s1, t1
                  addi         tp, s5, -1609
                  sra          a2, s5, a0
                  slt          a7, t2, t6
                  and          t6, s6, a2
                  fmax.s       fa7, fa4, ft6
                  remu         ra, t1, a5
                  fmul.s       ft7, ft8, ft1, rdn
                  rem          s11, t3, zero
                  fle.s        t2, fs8, ft6
                  fcvt.s.wu    fs9, s2, rup
                  nop
                  mul          s9, zero, sp
                  mul          a0, a4, s9
                  fcvt.s.wu    fa4, s2
                  fmax.s       fs11, fs4, fs8
                  fmul.s       ft8, fa6, ft3
                  nop
                  lui          a3, 494178
                  fmul.s       fa4, fs5, ft2
                  andi         s2, s8, 873
                  sll          t0, s9, t6
                  ori          s11, a1, 652
                  add          t1, t4, tp
                  slli         t6, a3, 14
                  lui          zero, 466629
                  ori          ra, t2, -636
                  lui          t5, 422082
                  fcvt.s.wu    ft10, a4
                  fclass.s     s7, fa1
                  fmin.s       ft8, fs0, fs11
                  fmv.w.x      fs0, a7
                  slt          a3, gp, s11
                  fmv.w.x      fs1, s1
                  srai         a3, a7, 13
                  fmv.w.x      ft0, s2
                  fsgnjx.s     fa6, fs2, fs7
                  fcvt.wu.s    a0, fs5, rmm
                  fsgnj.s      fs3, fs7, fa3
                  feq.s        t5, fs7, fs1
                  lui          s8, 569243
                  fadd.s       ft5, fa6, fs1, rtz
                  fcvt.s.w     fa5, t6
                  srai         s6, t2, 21
                  fcvt.wu.s    a3, ft0, rmm
                  fadd.s       fs6, ft1, fs9
                  feq.s        s0, ft10, fs9
                  mulhsu       s5, t4, s6
                  feq.s        a7, ft7, ft3
                  sra          s10, t6, s7
                  mulhsu       gp, s1, t2
                  andi         s8, t5, 698
                  fsqrt.s      fs11, ft11, rmm
                  fmin.s       fa2, fs2, fa7
                  fsub.s       fs10, fa4, fa2, rdn
                  fdiv.s       ft3, fa3, fa1
                  slli         s2, t6, 13
                  slti         s3, a3, -1615
                  fadd.s       ft3, fa1, fs5
                  feq.s        s11, fs4, fa2
                  sra          s11, a2, a7
                  slli         s11, a1, 1
                  slti         sp, zero, -1615
                  div          t0, s3, t1
                  fmax.s       fs11, fa7, ft6
                  srai         a3, t3, 3
                  slti         s1, t4, -812
                  sltu         a2, a3, t5
                  sub          ra, s2, a4
                  add          s7, s2, s5
                  andi         s2, s2, 1735
                  feq.s        a0, fa3, fa6
                  srl          gp, a0, gp
                  fcvt.s.w     ft7, a2
                  mulhsu       s5, t4, tp
                  fclass.s     s6, fs1
                  divu         a0, t3, a1
                  mulhu        sp, a6, t6
                  sltu         t1, s7, s11
                  fle.s        tp, fa3, fa1
                  mul          t3, t4, s1
                  nop
                  fcvt.s.w     fs5, a6
                  xor          s0, a5, tp
                  fcvt.s.wu    ft5, tp
                  nop
                  slti         a3, t2, -664
                  divu         s6, t3, t2
                  fsgnj.s      ft0, ft2, ft6
                  lui          s0, 378606
                  fsgnjx.s     fa6, fa2, fa6
                  fcvt.s.w     fs4, a0
                  fcvt.s.wu    ft9, t3
                  fadd.s       fa1, ft2, ft11
                  srai         a2, t6, 2
                  addi         t4, t0, -348
                  sltu         t2, a3, t2
                  or           a0, a4, gp
                  srai         s2, s8, 8
                  ori          t4, t5, -952
                  sra          s8, gp, s9
                  fsgnj.s      ft6, ft0, fs11
                  fcvt.w.s     a2, fs3
                  fsgnjn.s     fs2, fs1, fs3
                  remu         a2, a0, ra
                  lui          t3, 430251
                  fcvt.s.wu    ft7, gp, rmm
                  fmv.w.x      ft4, t1
                  fclass.s     s11, fa2
                  mulhu        s7, s1, t6
                  xor          tp, a2, s4
                  xori         t4, a1, 1228
                  and          zero, s3, gp
                  fmin.s       fs5, fs5, fs6
                  xor          s8, tp, zero
                  srai         s5, s2, 12
                  fdiv.s       fs2, ft1, fs7, rmm
                  nop
                  slt          gp, s9, t4
                  fclass.s     s5, fa2
                  srli         s8, s7, 0
                  remu         t2, s3, t5
                  or           a1, s3, sp
                  addi         ra, t5, 961
                  lui          s0, 831960
                  fclass.s     s0, fa2
                  fsgnjx.s     ft9, fs9, ft2
                  sll          a1, a3, a4
                  fmv.x.w      s9, ft1
                  sll          t4, zero, t2
                  fsgnj.s      fs9, fs3, fs3
                  slti         a2, a5, -990
                  srli         s1, t1, 14
                  xori         s2, a3, 1958
                  fsqrt.s      fa1, fa4
                  slt          s9, s9, a6
                  nop
                  sltiu        s6, t3, 1132
                  fsgnjn.s     ft11, fs6, fs6
                  or           a0, tp, t6
                  ori          a1, t3, -545
                  fmv.x.w      t6, fs9
                  xor          s6, s5, a4
                  mulhu        s6, zero, a2
                  fsgnjx.s     fa7, fa3, ft10
                  mulh         s6, tp, s1
                  slt          a3, s6, s1
                  sub          s7, sp, a1
                  mulhu        sp, s8, t1
                  fdiv.s       fs9, ft9, fa3, rne
                  feq.s        t6, ft0, ft4
                  feq.s        t6, ft11, ft2
                  fle.s        zero, ft6, fs1
                  mulh         gp, a2, t0
                  sub          s7, t3, t0
                  mul          t5, s3, a5
                  and          a2, a6, s9
                  mulhu        t4, a3, t4
                  fclass.s     s2, ft2
                  sra          s1, a0, s6
                  fsgnjx.s     ft1, ft0, fa1
                  fsub.s       fs7, fs9, fa6, rmm
                  sltu         tp, s0, t1
                  ori          a7, t4, -450
                  rem          s9, a6, a7
                  xori         s10, s1, -1174
                  mulhu        s5, a7, s5
                  auipc        a1, 461206
                  fclass.s     t4, fa5
                  ori          gp, s7, 1218
                  fmax.s       fs4, fa0, fs3
                  fmul.s       fs2, ft7, fa2
                  rem          gp, s2, a3
                  xor          s1, s7, a2
                  srl          s2, a2, a7
                  and          s9, a0, s11
                  fsgnj.s      fa0, ft1, fa1
                  div          s1, tp, s4
                  xori         s10, s3, -1699
                  fcvt.w.s     t5, ft8, rup
                  sll          a3, a2, a7
                  remu         a0, t2, t2
                  fcvt.w.s     s0, ft6, rne
                  xor          s6, s3, sp
                  fcvt.wu.s    s2, fs9, rup
                  fle.s        s6, fs1, fs3
                  srli         s8, t3, 26
                  sltu         s3, s5, s1
                  mulhsu       a2, a6, gp
                  mulhsu       a0, s11, a6
                  slli         a0, a3, 29
                  srl          a5, zero, a6
                  fmv.w.x      fa6, s3
                  addi         s10, s3, -604
                  flt.s        a3, fa1, fa4
                  add          gp, zero, s9
                  fcvt.s.wu    ft0, sp, rtz
                  sltiu        s7, s10, -936
                  fadd.s       ft11, ft5, fs2, rmm
                  fmv.w.x      fs8, a5
                  div          sp, t5, s9
                  fsub.s       fs6, fs5, ft0, rup
                  flt.s        s0, fs8, ft9
                  lui          t0, 380436
                  sltiu        s0, s2, -713
                  slli         s9, zero, 21
                  addi         s3, s7, 1808
                  lui          s11, 50635
                  mul          s10, s1, s6
                  srl          ra, s5, s7
                  fcvt.s.w     ft2, a7, rup
                  sra          gp, a5, a2
                  slt          t4, s0, t1
                  srai         s3, a0, 15
                  fcvt.s.wu    ft3, a6
                  addi         s1, t2, 267
                  fsgnj.s      fa5, fs4, fa6
                  divu         s0, a0, a6
                  fmul.s       fa3, ft2, fs9, rtz
                  fmul.s       ft2, fs1, ft11, rmm
                  flt.s        sp, fa6, ft5
                  divu         s3, s8, s3
                  fmax.s       ft0, fa3, ft6
                  fsgnj.s      fa4, ft11, ft11
                  fmax.s       fa5, fs11, fs10
                  sll          t0, t2, s2
                  srli         t1, s1, 10
                  sra          gp, a4, a6
                  fcvt.w.s     a0, fs4
                  auipc        s8, 645110
                  fsqrt.s      fs3, fa0
                  fcvt.w.s     s9, fa1
                  fcvt.s.w     fa4, a4
                  and          s1, s7, s3
                  fsgnjx.s     fs8, fa4, fa0
                  fmul.s       fa3, fs11, ft6
                  nop
                  fmax.s       fa5, ft10, ft10
                  fcvt.wu.s    t3, fa3
                  fclass.s     s10, fs7
                  lui          t2, 926427
                  ori          t6, s7, -853
                  fcvt.w.s     t4, fs9, rtz
                  flt.s        s11, fs6, fs10
                  remu         ra, t3, a1
                  sub          a0, a4, s8
                  fcvt.s.w     fs11, s7
                  mulh         s1, t3, gp
                  feq.s        a2, ft5, fs6
                  slti         sp, s1, -580
                  flt.s        a0, fa0, fa5
                  sub          t5, s4, s7
                  addi         s1, ra, -986
                  or           s10, t5, s0
                  fadd.s       fs4, fs1, fs4
                  sub          a1, a7, s6
                  fcvt.s.w     fa3, a0
                  fmin.s       fa4, fs4, fs5
                  divu         zero, s0, a4
                  add          a2, s6, s6
                  fsgnjx.s     ft8, fs4, fs1
                  divu         a7, s4, t0
                  slli         s1, t5, 26
                  fcvt.s.w     fs10, s6, rdn
                  flt.s        s3, fa1, fa6
                  fdiv.s       ft10, fs7, ft0
                  lui          gp, 984675
                  feq.s        a2, fs1, fa5
                  mul          t6, tp, t3
                  or           a2, s10, a4
                  srli         t5, ra, 16
                  mulhu        t4, gp, t2
                  fcvt.s.w     ft0, t2
                  fcvt.s.wu    fs1, s7, rtz
                  feq.s        s11, fs11, ft10
                  feq.s        sp, fs11, fa2
                  fsgnjx.s     fs9, fa0, fa4
                  remu         t0, s9, s3
                  nop
                  nop
                  sll          a0, a6, t2
                  srli         s9, t6, 30
                  fcvt.s.wu    ft3, tp
                  srli         a3, t3, 26
                  fsgnjx.s     ft9, ft8, ft6
                  divu         a1, s3, s10
                  add          a7, s1, tp
                  auipc        t5, 776415
                  fsub.s       ft7, fs6, fs10
                  mulhsu       gp, a5, t2
                  remu         s11, t2, t5
                  fsub.s       ft2, ft8, fa4
                  div          s8, a1, s6
                  div          a3, a4, a0
                  srl          t6, t0, tp
                  fdiv.s       fs10, ft9, fs0, rtz
                  add          s7, s4, s0
                  sub          t4, sp, a6
                  sltiu        s8, s4, 957
                  fcvt.w.s     s8, ft5, rtz
                  flt.s        s7, fa1, ft1
                  fsgnjn.s     fs2, fs8, ft6
                  srai         s6, a4, 28
                  sltu         s0, s6, gp
                  fmv.x.w      s10, ft3
                  fmv.x.w      s3, ft5
                  fsgnjn.s     ft11, fs5, fs10
                  mulhu        zero, t4, tp
                  lui          s5, 336585
                  fcvt.w.s     a0, fs2
                  fcvt.w.s     zero, fs9
                  remu         s1, s0, t6
                  remu         a2, t4, t2
                  mulhsu       a7, s4, t3
                  fmv.w.x      fs9, zero
                  mul          t1, a4, s3
                  fsub.s       fs11, fs6, fa6, rtz
                  andi         s10, s9, 536
                  fmin.s       fs3, fs6, fa5
                  fsgnjx.s     fs1, fs8, fs5
                  fsgnj.s      ft11, fa4, ft2
                  lui          s6, 752972
                  fcvt.s.w     fs9, t1, rtz
                  mulh         s5, s9, a4
                  slt          t5, s9, gp
                  fmul.s       fa6, fs7, fs5
                  feq.s        s11, fs1, fa0
                  andi         t0, a1, 149
                  fcvt.s.wu    fa6, zero, rtz
                  fmax.s       fa5, fs5, fa5
                  slt          a5, s7, s5
                  fsgnjx.s     fa7, fs9, fa1
                  add          a1, a5, s4
                  sltu         gp, a6, gp
                  fmv.w.x      fa2, sp
                  fcvt.s.wu    fs2, t4
                  srai         a5, s2, 8
                  fmv.w.x      ft4, t3
                  divu         t6, a4, s5
                  andi         a1, t3, 1284
                  sltiu        gp, a3, -680
                  fadd.s       fa5, fa6, ft8, rne
                  auipc        a2, 532058
                  fmin.s       fa2, ft3, fs5
                  fdiv.s       fa4, ft6, ft9, rmm
                  auipc        t5, 647750
                  sub          a0, s6, s3
                  fsgnjx.s     fs10, fs10, ft9
                  slt          a0, t6, t6
                  sll          a2, zero, gp
                  mulhsu       a7, t2, a3
                  xori         a7, s4, -547
                  fcvt.w.s     a1, ft6, rne
                  fsub.s       ft9, fa1, ft5
                  slt          s1, a4, s3
                  fmin.s       fs4, fa0, fa6
                  fclass.s     s9, fs5
                  mul          s10, t0, a1
                  fmax.s       fa6, fa7, ft4
                  feq.s        a0, ft10, ft7
                  fmax.s       fs7, fs1, fs8
                  sltiu        s5, s10, 594
                  or           t5, s4, s2
                  and          t0, s4, sp
                  div          s0, t1, a3
                  ori          ra, s10, -408
                  sltiu        t0, s2, 779
                  srl          a0, gp, t0
                  div          ra, sp, s5
                  mulhsu       sp, t3, s3
                  fsgnj.s      fs9, ft8, ft2
                  lui          a2, 907998
                  add          s5, a4, s10
                  mulhu        t4, s7, a7
                  slt          ra, a7, a4
                  xori         sp, t0, 161
                  andi         ra, a7, -1178
                  fcvt.w.s     a7, ft11, rdn
                  fcvt.s.wu    fs5, ra, rtz
                  slti         s2, a7, 173
                  fsgnjx.s     fa5, ft8, fa0
                  slt          s7, t4, t4
                  fsgnjx.s     fs5, ft9, fs2
                  mulhsu       a3, s6, t2
                  fle.s        a2, fa1, fs4
                  fdiv.s       fa6, fa0, ft6, rdn
                  srl          s3, s9, s7
                  fclass.s     a2, fa1
                  fcvt.w.s     s7, fs9
                  feq.s        s5, ft8, fs5
                  fmul.s       ft7, fa5, fs3, rtz
                  flt.s        t3, ft9, ft11
                  mul          gp, a6, a6
                  fmv.x.w      s0, ft8
                  xor          s7, sp, tp
                  sltiu        gp, gp, 1828
                  andi         s7, a3, 1313
                  sra          a7, s9, s7
                  div          t1, t2, s0
                  sltu         zero, s6, s10
                  and          tp, s0, a1
                  lui          s11, 909734
                  fle.s        a2, fs4, fa4
                  fmv.w.x      fa1, a5
                  fsgnj.s      ft6, ft5, ft4
                  fle.s        t0, fs7, fa7
                  fsub.s       ft6, ft1, ft6
                  fsub.s       ft3, fa5, fa5
                  and          sp, t5, sp
                  divu         s6, s3, sp
                  mulhu        s7, t2, s6
                  mulh         a3, ra, s10
                  fcvt.s.w     ft3, t6, rmm
                  fmv.x.w      s7, ft0
                  mulh         zero, a0, a2
                  fadd.s       fa3, ft1, fa2, rdn
                  fsub.s       fa5, fa4, ft3, rdn
                  ori          t4, a4, -270
                  fmul.s       fa2, fs6, ft11, rmm
                  fmax.s       fs8, fs4, ft7
                  or           s7, s2, zero
                  fdiv.s       fs7, fs7, ft4
                  fmv.x.w      s9, ft5
                  rem          t6, s10, a6
                  and          t1, a6, t0
                  fle.s        t4, ft1, ft6
                  slli         a3, s5, 16
                  fsub.s       fa3, fs4, fa7, rup
                  fsgnj.s      ft5, fs1, fs10
                  srl          a3, t2, t1
                  fadd.s       fa5, ft9, ft6
                  add          s11, s5, t0
                  add          t6, s2, s2
                  fsqrt.s      fs10, fs0, rtz
                  ori          a2, t4, 1136
                  feq.s        a1, ft2, ft3
                  fclass.s     t6, fs9
                  feq.s        t5, ft6, fa2
                  and          t4, s0, s5
                  fmv.w.x      fs3, s5
                  remu         t5, t4, s2
                  sltiu        t2, s11, 114
                  sltiu        gp, t2, -1427
                  div          s7, ra, t4
                  fmin.s       ft5, ft3, ft2
                  srli         s11, t5, 18
                  sub          t3, s7, a2
                  nop
                  fmax.s       fa3, ft11, fa2
                  mul          sp, s1, s10
                  fdiv.s       fs2, fa4, fs9
                  fdiv.s       ft11, fs11, fa7
                  fsgnjn.s     fs10, fa6, ft5
                  nop
                  flt.s        a3, fa5, ft11
                  fle.s        t2, ft4, ft6
                  srli         s8, t3, 26
                  mulh         s9, zero, t3
                  div          t5, t3, a1
                  remu         gp, a1, t3
                  srli         t6, a6, 8
                  sltu         s3, sp, a4
                  rem          t3, a0, s6
                  fsgnjn.s     ft1, fs11, fa7
                  fsgnj.s      fs7, fa6, fs9
                  xor          s9, s2, s3
                  remu         s3, t4, s9
                  fmv.x.w      s8, fa4
                  divu         a2, sp, s8
                  fmul.s       ft10, ft10, ft10
                  auipc        s0, 995830
                  sub          gp, s2, s6
                  fcvt.s.w     fs3, s8, rne
                  mulhu        tp, s6, a2
                  flt.s        s8, fa4, fs8
                  div          a2, s9, t1
                  or           a0, t0, s7
                  feq.s        t4, ft6, fs8
                  mulh         a1, a5, t2
                  flt.s        s5, fa7, fa2
                  fmul.s       fa7, ft2, ft3, rup
                  fsgnj.s      fs5, ft7, fs1
                  fdiv.s       ft11, fa5, fs1
                  mul          t0, sp, a2
                  and          t4, s3, s3
                  nop
                  rem          s5, a1, s0
                  fadd.s       fa4, fa0, fs2
                  mul          sp, zero, a3
                  fmax.s       fa4, fs8, fa6
                  fmax.s       ft10, fs2, fs2
                  lui          t4, 199023
                  fcvt.s.w     fs8, s10
                  div          s1, zero, s7
                  divu         s8, a7, a5
                  mulhsu       zero, s2, t2
                  auipc        a5, 416480
                  or           t6, a4, s3
                  add          t4, a5, t0
                  fmv.w.x      ft3, a4
                  feq.s        sp, fs3, fs10
                  slli         sp, s2, 29
                  and          s6, t1, a3
                  fle.s        a5, fs9, ft1
                  srli         t1, t4, 7
                  sll          s10, t2, s11
                  fclass.s     a5, ft1
                  mulh         s7, ra, zero
                  fdiv.s       fs0, ft1, ft2
                  sll          s0, zero, a1
                  mulh         t0, a3, a7
                  srli         s2, s1, 25
                  fcvt.wu.s    s11, fa6, rdn
                  fcvt.w.s     s5, ft2, rup
                  sll          s6, a7, s6
                  or           gp, ra, s6
                  div          t3, s11, s6
                  fadd.s       ft10, ft3, ft9, rdn
                  fdiv.s       fs3, ft2, ft0, rne
                  fsgnjx.s     ft1, ft4, ft1
                  mul          s2, a4, s2
                  div          s0, s8, s4
                  fsgnjx.s     ft3, fa6, fs7
                  sltu         t0, sp, s8
                  fsgnjx.s     fa0, fs2, fs7
                  fcvt.w.s     s2, fs10
                  divu         t3, a0, s10
                  auipc        s7, 228911
                  fmv.x.w      t1, ft11
                  fcvt.s.w     fa5, t0, rtz
                  fcvt.s.wu    fa1, s8, rne
                  mul          s0, a5, s4
                  fmul.s       fs4, fs10, ft4, rmm
                  mulh         s1, a3, s3
                  remu         s2, s5, s10
                  nop
                  sub          ra, gp, a0
                  nop
                  flt.s        t2, fs0, ft9
                  fsub.s       fa2, fa6, fs11
                  fadd.s       fs5, fa1, ft1, rdn
                  rem          s6, a1, s11
                  slti         s7, zero, -1278
                  divu         s2, s9, a7
                  fsub.s       fa2, ft7, fs7, rne
                  fdiv.s       fs10, fa2, fs8
                  sltu         t1, a4, s2
                  or           a0, gp, s2
                  div          s7, s0, zero
                  slti         ra, t2, -276
                  fcvt.wu.s    tp, fa7
                  srai         s2, t1, 9
                  fmv.x.w      zero, ft7
                  fsgnjx.s     fs4, ft0, fa4
                  fsgnjn.s     ft8, fa4, ft7
                  fsgnjx.s     fs5, fs9, fs1
                  rem          t4, gp, s9
                  fle.s        s3, fs9, fs7
                  sll          s11, s11, a5
                  fadd.s       fs6, ft9, ft8
                  feq.s        t1, ft1, fs4
                  feq.s        t0, fs9, fs2
                  fsgnj.s      fs11, fa6, fs7
                  srl          s3, s8, s11
                  fadd.s       fs4, fa3, fa5
                  srli         t4, t6, 6
                  sll          s6, s11, s8
                  xori         t3, s8, -905
                  nop
                  sltu         s10, ra, ra
                  fcvt.wu.s    s8, fs5
                  sll          s9, s11, t0
                  fsgnj.s      fa2, ft5, fs4
                  fle.s        s0, ft8, fs4
                  xori         s5, t6, -733
                  auipc        t1, 729728
                  slli         tp, tp, 21
                  fcvt.s.wu    ft4, a0, rdn
                  fsgnjx.s     ft5, ft5, ft0
                  fsgnjx.s     ft3, fs9, fs2
                  sltiu        s9, a6, -951
                  fsqrt.s      fs9, fa2
                  slti         a5, a3, 1481
                  srai         s6, ra, 26
                  sltiu        s10, t5, -691
                  xor          a5, sp, s1
                  fcvt.s.wu    fs6, a0
                  nop
                  mulh         s6, t1, t4
                  sltiu        s3, s10, 1988
                  fsgnj.s      fs2, ft1, fa0
                  flt.s        t6, fs10, fa0
                  xor          s0, tp, sp
                  ori          t1, a3, 1112
                  sra          t2, s1, s0
                  sltiu        a2, s3, -731
                  remu         s9, a0, tp
                  slli         t0, t5, 1
                  nop
                  div          zero, t0, a7
                  sra          a2, t1, a2
                  mulhu        a0, s3, s5
                  sll          t3, s5, t2
                  mul          gp, a4, t4
                  fsub.s       fa2, fs0, fa0, rdn
                  fsqrt.s      fs4, fs2
                  fle.s        ra, fa1, ft9
                  fle.s        ra, fa1, fs5
                  xori         s6, t5, 1555
                  addi         t3, sp, 1353
                  srli         a0, s11, 25
                  fsqrt.s      ft11, fa6, rtz
                  mulhsu       a1, s2, s11
                  slt          ra, t1, s4
                  ori          s0, s9, 1040
                  nop
                  fmv.x.w      a2, ft3
                  rem          t5, s9, s0
                  xori         t0, s3, -1445
                  srli         a1, t2, 16
                  feq.s        a0, ft0, fs3
                  fmul.s       ft10, fs10, fa4
                  fmv.w.x      ft1, t3
                  fmin.s       ft3, fs9, fs3
                  mulhsu       s5, s9, s2
                  fsqrt.s      ft7, ft6
                  div          t5, t4, a1
                  mulh         s5, t6, a1
                  mulhsu       t4, s6, zero
                  fmv.w.x      fa5, a6
                  fsgnj.s      ft5, ft7, fa0
                  fsgnjx.s     ft8, fs0, ft8
                  nop
                  fmax.s       ft7, ft1, fs5
                  fle.s        s5, fa1, fa5
                  slti         s9, a6, -1023
                  fcvt.s.wu    ft5, t5, rdn
                  fmv.x.w      t6, fs9
                  slt          s8, a6, s7
                  xor          a5, zero, t6
                  and          s8, t5, t5
                  sll          t1, s10, s9
                  andi         t5, ra, 1565
                  or           a2, t0, s6
                  or           ra, a0, s8
                  mulh         a0, t0, s7
                  rem          t4, s8, t5
                  mul          s6, t2, s1
                  fmax.s       ft5, fs1, fa0
                  rem          s5, ra, s8
                  fsqrt.s      fa3, fs7, rup
                  sra          gp, gp, s10
                  andi         a3, a6, 78
                  divu         t2, s8, a4
                  fmax.s       ft9, ft9, fs8
                  divu         ra, t3, t6
                  andi         t4, s8, 1068
                  sra          t0, t6, s7
                  nop
                  andi         t2, t4, -1096
                  mulhsu       t6, s4, t6
                  xori         sp, sp, -824
                  fmv.x.w      t2, ft9
                  fsgnj.s      ft9, ft3, ft9
                  xori         gp, t4, 1502
                  ori          t1, s2, -756
                  fmax.s       fs3, fa3, fa6
                  sll          s1, a5, gp
                  srli         zero, t5, 25
                  srl          a2, sp, a4
                  divu         s2, s8, a2
                  sltiu        s8, s8, 1644
                  auipc        s5, 146129
                  fmv.w.x      fs10, ra
                  add          t0, a1, s5
                  divu         tp, s7, t0
                  divu         s9, s6, gp
                  mulh         zero, s7, t5
                  fdiv.s       fa0, ft6, fa2, rtz
                  fmv.w.x      fs4, s5
                  xor          a3, a6, a5
                  fmv.w.x      fa6, s9
                  fcvt.w.s     t3, ft2
                  remu         s5, zero, s3
                  fcvt.w.s     s8, ft3
                  fsgnjx.s     fs0, ft9, fs0
                  remu         s0, s9, s6
                  and          sp, t3, a3
                  remu         t0, a6, a6
                  div          t6, s7, s7
                  fsqrt.s      fa0, fs4
                  fmax.s       fs7, fs5, fs3
                  fmv.w.x      fs2, a7
                  slli         a5, s0, 18
                  sltiu        s11, t6, -1652
                  auipc        s11, 393934
                  fcvt.wu.s    a1, ft11
                  mulhsu       t4, gp, s7
                  sll          s9, a0, ra
                  fmv.x.w      s0, ft1
                  slli         ra, s11, 16
                  lui          a3, 2426
                  or           s9, ra, s3
                  fmv.w.x      fa7, t3
                  lui          s7, 452033
                  div          s10, a0, s9
                  ori          s2, s9, 1081
                  rem          t3, t4, s5
                  mulhsu       t2, t4, s11
                  srl          zero, s11, s3
                  ori          s8, gp, -1949
                  sra          t2, t6, s4
                  fcvt.wu.s    s2, fa3
                  sra          s2, a3, s8
                  fsgnjx.s     ft8, ft5, ft9
                  sub          a5, gp, a0
                  fsqrt.s      fa2, fs2, rtz
                  fmv.w.x      ft3, s7
                  auipc        s5, 447696
                  sra          t0, s0, tp
                  andi         t5, s10, -901
                  fcvt.s.wu    fs0, a5, rne
                  divu         t5, a2, s11
                  lui          sp, 350573
                  fcvt.wu.s    a3, ft9, rne
                  slli         tp, t2, 17
                  feq.s        a2, fa6, ft2
                  sltu         t0, s2, s6
                  fcvt.wu.s    t0, fa1
                  addi         s11, a3, -396
                  sltiu        zero, s10, -1097
                  fsgnjn.s     fs7, fs2, fs3
                  fmv.w.x      fs1, s6
                  sltu         t6, t0, s8
                  and          s10, zero, gp
                  mul          s6, ra, tp
                  and          s5, gp, t3
                  fcvt.w.s     sp, ft4
                  or           a3, s7, s8
                  srl          a3, a1, s5
                  addi         a2, t5, 384
                  auipc        ra, 125639
                  fcvt.w.s     t0, fa4, rmm
                  fcvt.w.s     t0, ft3
                  addi         gp, s7, 1070
                  slt          t1, sp, zero
                  lui          gp, 690144
                  fcvt.w.s     s0, fa4
                  sll          a2, s0, s4
                  addi         a2, s2, 1290
                  fsub.s       ft8, fs8, ft6, rup
                  rem          s11, t4, s4
                  fmin.s       fa1, fs10, ft6
                  or           t1, t3, s11
                  flt.s        s7, ft0, fs4
                  andi         t3, s8, 896
                  slt          s0, gp, s4
                  slt          a3, s7, a2
                  remu         t0, s9, a6
                  fsub.s       ft3, fs0, fs3, rne
                  mulhu        gp, s3, s0
                  fcvt.s.wu    ft2, t3
                  fle.s        t2, ft3, fa0
                  flt.s        s0, fs10, fa2
                  addi         s1, a7, 451
                  xori         t5, s6, 771
                  fmax.s       ft11, ft6, ft0
                  fsgnjx.s     ft10, fs0, fs0
                  fcvt.s.w     ft9, s7
                  add          a2, gp, t3
                  mul          s6, a7, t2
                  fsub.s       fa3, ft4, fa3, rup
                  fadd.s       fs5, ft0, fa3, rtz
                  xor          t1, sp, a5
                  rem          s5, s1, a7
                  fdiv.s       ft4, fs10, fa7
                  fsgnj.s      fs7, fs2, ft10
                  fmv.x.w      s8, fs1
                  fmv.w.x      fa5, t0
                  fclass.s     t0, fs0
                  fle.s        a3, fs0, ft5
                  fmv.w.x      fa0, t0
                  divu         a7, s11, s4
                  fmul.s       fs5, ft0, ft10, rdn
                  xor          s6, sp, s3
                  fcvt.w.s     ra, ft0
                  fle.s        s7, fa4, ft10
                  mul          s11, s6, s1
                  xor          s11, a5, a5
                  flt.s        tp, fa2, fs10
                  slti         s9, s0, -510
                  mulhsu       t1, a0, s4
                  fmv.w.x      ft6, a1
                  srai         s8, s7, 20
                  fdiv.s       fs9, fa5, fs5
                  and          s9, s10, t5
                  fle.s        a2, ft1, ft0
                  remu         gp, s5, s2
                  mulh         s5, t6, a0
                  div          ra, s3, a1
                  sll          t1, t3, s1
                  fmax.s       fs7, fs1, fs1
                  sll          a2, a2, gp
                  srli         sp, a3, 17
                  fsub.s       fa6, fa3, ft7
                  nop
                  fcvt.s.w     fs0, s6
                  fsgnjn.s     fa2, ft0, fs10
                  remu         s5, s8, sp
                  sra          s8, a6, s3
                  xor          s3, a3, s3
                  fclass.s     t4, fa7
                  remu         sp, s0, t5
                  mul          t4, a3, s3
                  fcvt.s.w     fs11, t5, rdn
                  rem          t1, a1, a0
                  srli         a3, a5, 23
                  divu         t4, s3, s6
                  fsgnj.s      ft7, fs6, fa4
                  fdiv.s       fa3, ft7, fa3
                  ori          s10, s2, -1246
                  fsgnj.s      fa7, fa5, ft4
                  rem          a3, a2, gp
                  fmin.s       fa1, ft10, fa0
                  sltu         sp, s4, tp
                  remu         s3, s11, s2
                  fcvt.s.wu    fa1, s2
                  remu         s11, s11, s1
                  fmv.x.w      s0, fa0
                  slt          a3, a5, s6
                  fsqrt.s      fs1, fs0, rdn
                  srl          sp, t1, a3
                  sub          s11, s7, t3
                  feq.s        s0, ft10, fs2
                  nop
                  sll          s11, s9, s0
                  mulhu        s5, s11, a3
                  mulh         gp, s3, t0
                  srli         s2, t1, 9
                  srl          gp, s1, a5
                  fcvt.w.s     s9, fs8
                  andi         t5, a7, -807
                  fsub.s       ft9, fa7, fa2, rtz
                  mul          ra, a3, a4
                  andi         s7, s10, -799
                  fmv.x.w      s7, fs5
                  divu         t3, a0, s6
                  srai         s1, a6, 11
                  feq.s        a7, fs0, ft9
                  fcvt.s.wu    fs4, t0, rdn
                  sub          a3, ra, t4
                  mulhsu       t3, ra, t1
                  fmin.s       fa4, fa6, fs1
                  slt          t4, a5, ra
                  sll          ra, a3, s7
                  andi         ra, s8, 1091
                  remu         a7, s2, t0
                  xori         ra, s6, 1558
                  fmul.s       fs5, ft6, ft1
                  fsgnj.s      fs11, fa6, ft6
                  fadd.s       fs6, fs7, fs9
                  srai         s6, s1, 15
                  rem          s5, s10, t4
                  divu         s10, t5, s0
                  flt.s        s0, fs7, fs10
                  fsgnj.s      fa5, fs5, fs5
                  mul          s8, s9, s2
                  add          s5, a4, s5
                  sra          s5, s5, a0
                  xor          s0, s10, s10
                  nop
                  fmul.s       fs9, fa7, ft8, rup
                  mulh         gp, a5, gp
                  fclass.s     t6, fs4
                  fadd.s       fs0, fs7, fs10, rdn
                  mulhu        gp, s9, a4
                  slli         gp, gp, 27
                  xor          a2, tp, a6
                  fmax.s       fa1, ft9, fa3
                  fmul.s       fs4, fa2, fs2
                  nop
                  xori         a0, s9, -1414
                  fmv.x.w      s11, fs10
                  rem          a7, tp, a3
                  lui          s6, 146052
                  sra          t0, a6, s9
                  fcvt.s.wu    ft1, a3
                  sltu         t4, s0, s4
                  slli         t0, s6, 8
                  mulhsu       a2, gp, s9
                  sltiu        a0, a3, -1694
                  fadd.s       fs11, ft2, fs2, rne
                  sltiu        zero, s5, 36
                  mulh         t4, a5, a0
                  fmv.x.w      a2, fa7
                  fmv.w.x      fs1, s4
                  fcvt.s.wu    ft2, s9
                  fcvt.wu.s    t3, ft2, rup
                  srli         s1, t0, 29
                  fmv.x.w      t6, fa4
                  fsub.s       ft6, fa0, ft3, rmm
                  slti         a7, t6, 1870
                  mul          s5, t0, a0
                  fsgnjn.s     fa3, fs1, ft1
                  slti         s11, s6, 1631
                  fdiv.s       fs5, ft1, ft0
                  fmv.w.x      fa6, s2
                  fdiv.s       fs1, fs6, fa0, rup
                  fdiv.s       fs5, ft9, fa1, rdn
                  srl          s3, s2, gp
                  fmv.x.w      s8, ft5
                  fsqrt.s      ft11, fa1, rdn
                  xori         ra, a0, 905
                  remu         s3, ra, t4
                  feq.s        zero, ft4, ft10
                  andi         gp, t5, -250
                  mulh         a0, t3, a5
                  andi         tp, zero, 366
                  fcvt.wu.s    s8, ft3, rdn
                  sltiu        s3, s9, -1074
                  fcvt.wu.s    t5, fs8
                  sra          a1, a1, s6
                  xor          zero, s2, s3
                  slli         t1, s10, 18
                  mulhsu       s0, s8, s4
                  fcvt.s.w     fa3, s9, rdn
                  fsqrt.s      fs2, ft3, rup
                  fcvt.w.s     s3, ft4
                  fmin.s       fa1, fa5, fa6
                  div          s9, s10, a1
                  sra          s0, zero, t5
                  sltu         sp, s8, a4
                  or           s10, a1, a0
                  mulhu        t5, t3, ra
                  fsgnjn.s     fs6, ft0, fs11
                  or           a0, s0, a3
                  flt.s        a5, fa5, ft6
                  slti         ra, t1, -331
                  ori          s6, t3, -553
                  divu         s7, a0, gp
                  fsub.s       fa2, fa7, fa2, rmm
                  srai         sp, t1, 18
                  rem          s9, t5, s7
                  addi         s1, t3, 1505
                  fsub.s       fa5, ft8, fs3, rmm
                  divu         t2, s2, a4
                  fclass.s     t2, fs2
                  fsub.s       ft3, ft5, ft8, rne
                  sll          s8, t0, a3
                  srai         a3, s8, 7
                  sltiu        t2, a2, -540
                  xor          t0, s6, t0
                  xor          t4, a6, t2
                  remu         tp, s5, s10
                  srl          s8, t4, ra
                  fdiv.s       fa4, fa3, ft11
                  mul          gp, s10, s5
                  mulhsu       t5, t6, tp
                  fsgnjx.s     fs4, ft7, fs3
                  add          t3, s8, a6
                  fadd.s       fa5, fs1, fs8, rtz
                  add          s8, s9, s10
                  mulhsu       sp, s10, s2
                  slti         ra, t0, -665
                  remu         s2, s0, t4
                  sll          a2, a3, a2
                  fsqrt.s      fs7, fa7, rup
                  sll          a5, ra, s1
                  fsub.s       fs0, ft6, fa6
                  xor          tp, s9, a2
                  fle.s        a5, ft2, fa2
                  add          s9, zero, a2
                  srli         s2, tp, 15
                  flt.s        tp, ft1, fs5
                  srl          a1, a7, t2
                  fmul.s       ft8, fa7, ft9
                  srli         t5, t1, 29
                  nop
                  fmv.w.x      fs1, a3
                  sub          zero, s2, s6
                  remu         s11, s8, t3
                  fsgnjx.s     fs4, ft10, fs11
                  mul          s3, ra, t2
                  srl          s11, gp, a2
                  nop
                  fsub.s       fs6, fa0, fa0
                  or           s3, zero, a7
                  slt          s9, a7, t0
                  mul          t4, a5, a0
                  add          s6, zero, t4
                  and          s8, t6, sp
                  fsub.s       fa7, fs1, ft0
                  srai         t2, sp, 12
                  sra          t3, s1, gp
                  xor          s11, t4, s2
                  or           s6, s4, t2
                  srai         s8, t3, 5
                  sll          t5, s6, t2
                  mulhu        s9, sp, gp
                  fsgnjx.s     ft6, fs11, fs3
                  fcvt.s.w     ft2, gp, rne
                  slli         t0, s5, 22
                  slt          s1, s10, t2
                  fcvt.s.w     fa0, a6, rup
                  srl          t1, a4, s4
                  nop
                  sub          t6, a2, t3
                  fmv.w.x      fs5, s6
                  mul          a5, s3, s11
                  mul          s9, ra, s11
                  fsub.s       fa3, fa7, fs10, rne
                  mulhu        s1, a6, t1
                  fcvt.wu.s    t0, ft4
                  ori          s0, ra, 691
                  fmv.x.w      s5, ft11
                  ori          t4, a2, 1992
                  fcvt.s.w     fs6, a4
                  rem          a0, s6, ra
                  srli         sp, zero, 16
                  divu         s0, s3, s1
                  slt          t3, a7, a0
                  slt          s11, gp, s4
                  div          ra, a1, t3
                  div          t3, a1, t0
                  fcvt.wu.s    s1, fa3
                  mulhsu       s10, ra, t5
                  sub          t1, s6, t5
                  or           ra, a3, t6
                  mulh         a1, a3, a4
                  slti         t0, s4, 1439
                  add          s3, a3, t6
                  sub          a7, ra, s7
                  fmul.s       fs2, fa7, ft4, rtz
                  sll          t5, t6, a4
                  fcvt.s.wu    ft5, gp
                  fmax.s       fs9, ft10, ft2
                  srli         t3, s7, 7
                  slti         t3, s7, -562
                  ori          a1, a3, -2024
                  slti         t3, a3, 751
                  sltiu        sp, s10, 1135
                  fmv.w.x      fs9, t3
                  sra          t3, a2, s7
                  fclass.s     t4, fa3
                  mulhsu       a1, tp, a1
                  add          a1, s4, s4
                  srai         s5, gp, 1
                  fmin.s       ft9, fa4, fs1
                  fmv.w.x      fs4, zero
                  sll          t0, s11, a5
                  fcvt.wu.s    ra, fa0, rtz
                  fsgnj.s      ft4, fs10, fs0
                  fmul.s       ft1, fs11, fs8
                  fsgnjx.s     ft4, fs2, ft3
                  fmv.x.w      s1, ft3
                  fmul.s       fs11, ft7, ft0, rne
                  fsgnjx.s     ft10, fa6, fa2
                  fmv.x.w      t0, ft11
                  andi         s8, t6, -1908
                  addi         t1, t4, -888
                  feq.s        tp, ft7, ft9
                  lui          s5, 123959
                  fsgnjx.s     fa3, fs7, ft6
                  srl          s7, t5, a7
                  fcvt.wu.s    a3, ft10
                  sltiu        a3, a6, -57
                  fcvt.wu.s    a1, ft10, rtz
                  fmul.s       fs11, ft0, fs9
                  fsqrt.s      fa5, fs10
                  feq.s        a7, ft0, ft5
                  fsqrt.s      fa1, fs11
                  fsqrt.s      fa4, ft5, rne
                  mulh         t6, s8, ra
                  rem          a5, t3, gp
                  fsgnj.s      ft1, ft7, fa4
                  srai         zero, a6, 3
                  andi         s6, s0, 127
                  sltiu        s0, t4, -1677
                  fmax.s       ft6, ft0, fa0
                  fmv.w.x      fa5, t3
                  sltiu        tp, tp, -1053
                  fdiv.s       fa4, ft1, ft2
                  or           s9, a1, s0
                  sra          t2, t0, a5
                  fle.s        a0, fs10, ft6
                  auipc        t3, 402930
                  fmul.s       fs3, ft10, ft1
                  add          a2, t0, t5
                  mulhsu       s0, tp, s0
                  addi         s1, a6, 885
                  fsgnjx.s     fs6, fa6, fa7
                  or           s10, sp, a5
                  sll          s5, s1, s0
                  remu         a7, t5, s7
                  rem          zero, t0, s10
                  sltu         a5, sp, t6
                  auipc        gp, 505120
                  fadd.s       fa0, fa7, ft7
                  mul          t0, t4, a0
                  lui          ra, 35036
                  fdiv.s       ft1, fa4, fa0
                  addi         tp, s9, -1368
                  xori         s8, s9, 1669
                  fmin.s       fa4, fa1, ft3
                  fle.s        s11, fs9, ft11
                  sltu         t4, t5, s9
                  sra          a5, a4, t5
                  fsqrt.s      fs5, fs7, rmm
                  lui          a1, 639351
                  fsqrt.s      fa2, ft8, rmm
                  andi         a7, a5, 64
                  sra          s2, t4, t2
                  nop
                  ori          s11, a2, -1698
                  mulhu        tp, t6, tp
                  fle.s        gp, ft0, fa3
                  fsgnjn.s     ft5, fs7, fs10
                  fsub.s       ft6, fa2, fa7, rne
                  or           s3, a3, t6
                  mul          sp, s3, a4
                  fmv.w.x      fa2, s5
                  flt.s        gp, ft1, ft2
                  srai         t2, t0, 31
                  add          a0, a5, s9
                  fclass.s     t2, fs3
                  rem          ra, t2, a5
                  add          t6, s8, a0
                  fcvt.s.wu    ft4, s7
                  fcvt.s.wu    fs1, tp
                  fle.s        s1, ft1, ft7
                  fcvt.wu.s    tp, fa6, rtz
                  fsub.s       fa2, ft7, ft6
                  fdiv.s       fs10, ft10, fa5
                  sltiu        ra, a2, 1144
                  lui          a5, 49528
                  mulh         s11, s4, a2
                  fle.s        a7, fs2, fs6
                  slti         a3, t6, -156
                  fle.s        ra, ft8, ft10
                  feq.s        s0, fa5, ft11
                  xori         s2, s0, -1254
                  fmv.w.x      ft10, s1
                  fcvt.s.w     ft3, s8, rmm
                  fsgnjn.s     ft11, ft3, ft1
                  lui          s5, 786446
                  mulhsu       ra, s0, gp
                  xor          a3, a5, a2
                  nop
                  auipc        sp, 105178
                  div          t2, s7, s1
                  srli         sp, s2, 29
                  slt          s2, a4, a3
                  div          t4, t0, t4
                  fmin.s       fs8, fa3, ft3
                  slli         ra, s3, 2
                  sra          gp, s1, t4
                  slli         a3, a2, 14
                  sltu         s1, t4, t4
                  add          tp, t1, t5
                  fmv.w.x      fs0, s6
                  divu         zero, a6, s0
                  andi         s5, a3, -345
                  rem          s10, s5, gp
                  fsqrt.s      fa5, ft0
                  sub          t5, s3, zero
                  mulh         a3, s6, t2
                  mulhsu       s7, a1, s8
                  add          s6, t0, t6
                  fsub.s       fa6, fs0, ft8
                  feq.s        t0, fa6, fs8
                  mulhsu       tp, s5, s6
                  andi         s10, a5, -1446
                  srli         s2, a5, 9
                  mulhsu       tp, s9, s7
                  fmax.s       fa1, fa7, fs1
                  fmv.w.x      fa0, gp
                  flt.s        sp, ft5, fs1
                  sltiu        a5, s8, -1674
                  sll          t5, s2, t2
                  slli         s10, s5, 17
                  auipc        s2, 810640
                  srli         t2, s10, 9
                  srli         a2, gp, 16
                  add          s11, a2, s11
                  mulhsu       s9, t6, a1
                  fcvt.wu.s    s3, ft5
                  mulh         s5, s5, s2
                  and          t3, t2, gp
                  srai         a7, sp, 2
                  fsgnjx.s     fa3, fa5, fs7
                  sra          ra, t4, a2
                  mul          zero, s8, t5
                  slti         s1, s6, -864
                  mulhsu       t1, s4, s1
                  sltu         s2, ra, ra
                  lui          t2, 919825
                  fmin.s       fs9, fs2, fs8
                  fsqrt.s      ft10, ft9, rne
                  fsgnjn.s     ft5, fs6, ft6
                  slt          s10, t2, s2
                  sub          s3, a2, s2
                  mulhsu       a7, t2, s4
                  flt.s        ra, ft1, fs8
                  sra          s0, s3, a2
                  fsgnj.s      fs11, fa0, fa3
                  flt.s        t4, fa4, fs10
                  mulh         gp, a3, s10
                  lui          a7, 227409
                  sub          s11, sp, t0
                  auipc        t4, 458856
                  fcvt.w.s     t3, fs10, rne
                  fsgnj.s      fa6, ft2, ft5
                  mulhu        s11, s2, a3
                  div          zero, s4, a3
                  xor          s1, t3, a6
                  fcvt.w.s     gp, ft7
                  fmax.s       ft3, fs9, ft7
                  slli         tp, t1, 2
                  feq.s        t2, ft4, fs2
                  ori          t0, s0, 1115
                  remu         sp, s1, s1
                  fcvt.s.w     fa4, s3
                  slti         s7, sp, 414
                  flt.s        s3, fs3, fa3
                  sub          a0, a1, s10
                  rem          s5, a2, s0
                  fle.s        s8, ft8, fs6
                  and          zero, s11, s3
                  mul          gp, s11, s3
                  fmax.s       fs5, ft10, ft5
                  fmul.s       ft1, ft2, fs5, rne
                  slli         s1, gp, 1
                  fsgnjx.s     fs11, fs6, fs9
                  fsqrt.s      ft11, ft4
                  srai         a3, s1, 25
                  mulh         tp, gp, a1
                  fdiv.s       fa3, ft4, ft10, rmm
                  flt.s        s6, fs2, ft3
                  fdiv.s       fs8, fs1, fa3, rup
                  mul          t0, s4, a1
                  lui          a0, 804018
                  lui          s3, 775432
                  sub          s9, a5, s4
                  fdiv.s       fs8, ft9, ft1, rdn
                  fmin.s       fa1, fs11, ft9
                  fsub.s       fs6, fa4, fa7, rdn
                  mulhsu       s3, s2, a3
                  fcvt.w.s     a7, fa2
                  nop
                  fcvt.s.w     ft9, s0, rup
                  div          t5, t6, t1
                  fmul.s       fa7, fs10, fs2
                  srl          t2, t6, s4
                  fmax.s       fs1, ft9, ft2
                  or           t0, s6, a5
                  slli         s2, s8, 16
                  xori         ra, a4, 558
                  fmul.s       fa1, fs0, ft1, rup
                  mulhsu       t6, a2, t1
                  sra          s10, t3, s1
                  div          a7, s3, a5
                  remu         ra, s9, a5
                  andi         t0, s6, 828
                  lui          zero, 565288
                  rem          a0, gp, s2
                  slli         s0, a4, 10
                  add          a5, sp, gp
                  srli         zero, a6, 9
                  srli         t5, ra, 29
                  fsgnj.s      fs1, fs3, fa7
                  xor          zero, ra, a2
                  fsqrt.s      fs3, ft6, rne
                  mulhsu       s1, sp, s4
                  fsqrt.s      ft0, ft8, rtz
                  fsub.s       fs3, ft11, fa1
                  lui          t6, 793280
                  fmv.x.w      a5, ft10
                  fsgnj.s      fa2, ft2, fa1
                  andi         sp, a1, -1096
                  fsqrt.s      ft8, fs5
                  fmv.w.x      ft7, s6
                  fmax.s       fs7, ft7, fa0
                  mulh         t0, a6, s11
                  fadd.s       fa2, fa6, fs6
                  srl          tp, s1, s8
                  lui          t5, 240875
                  fmin.s       fa0, fa6, ft2
                  lui          t4, 741592
                  fdiv.s       ft10, fs2, ft4, rdn
                  fle.s        s11, fs3, fa0
                  divu         s6, t6, t1
                  flt.s        s2, fs4, fa2
                  fsgnjx.s     ft7, ft5, ft5
                  xori         s3, a2, -1121
                  slt          s0, s10, s4
                  rem          sp, s9, a2
                  srai         t6, t6, 16
                  addi         s10, a4, 1488
                  slti         s6, s6, 298
                  fcvt.w.s     sp, ft7, rdn
                  fsgnjx.s     fa3, ft8, fa5
                  slti         a1, t2, 944
                  mulhu        ra, t4, s8
                  div          s3, a2, t5
                  nop
                  slli         a0, s5, 29
                  fclass.s     t5, ft9
                  feq.s        a0, ft2, fa6
                  ori          s9, a0, 1397
                  mulh         t6, gp, s11
                  mul          s7, s2, a1
                  fsgnjn.s     fa1, fa6, ft11
                  addi         t6, s10, -1529
                  andi         zero, s7, 586
                  sra          a5, a7, s10
                  and          a3, a0, a7
                  fmv.x.w      ra, ft0
                  and          gp, s6, a7
                  fmin.s       fs3, fs1, fs9
                  or           s11, s6, s10
                  andi         s2, s9, -401
                  slti         s6, s8, -691
                  div          t3, s11, t0
                  srl          s8, t2, s7
                  fdiv.s       ft6, fs10, fs3, rne
                  fadd.s       fs5, fs8, fs0, rmm
                  mul          a1, s6, t5
                  mulhsu       t0, a2, t6
                  add          t5, s10, t0
                  fcvt.s.w     fa0, s1
                  xori         t6, t4, -298
                  fsgnjn.s     ft1, fa7, ft3
                  slt          s2, t3, a5
                  sra          a3, a4, a6
                  fmax.s       fa3, ft3, ft11
                  fsqrt.s      fs10, ft5
                  lui          s11, 526798
                  mul          t2, s1, sp
                  fsub.s       fa2, fs4, ft5
                  fmv.w.x      ft4, a2
                  nop
                  sltiu        t0, s6, 1549
                  sll          t1, s11, s7
                  andi         s0, sp, -612
                  addi         s7, t0, -1062
                  mulh         ra, s9, t5
                  srai         t1, s11, 12
                  fmul.s       ft8, fa4, fs8, rne
                  srl          t6, a2, s7
                  xor          s10, a3, a3
                  nop
                  xor          t4, s11, tp
                  feq.s        t2, fs7, fa1
                  fle.s        s0, fa1, ft1
                  fsqrt.s      fs1, fa6
                  fcvt.s.wu    ft2, zero, rdn
                  srli         a7, s9, 11
                  sra          s5, a7, t2
                  xori         s7, t1, -940
                  divu         t4, s1, s0
                  mulhsu       s6, a5, s3
                  fmax.s       fa3, ft9, fa6
                  flt.s        t3, fa0, ft11
                  mulhu        s8, a7, s10
                  sltiu        s1, tp, -554
                  fcvt.w.s     a1, fa5, rtz
                  auipc        a5, 164451
                  sltiu        tp, s11, -967
                  fcvt.w.s     ra, fs11
                  fmul.s       fa0, fs7, fa5
                  mulh         sp, ra, s8
                  divu         s0, s1, t1
                  divu         t0, s11, a4
                  sub          zero, s2, s1
                  mulhu        a2, s8, s11
                  xori         zero, sp, -1962
                  mulhsu       tp, a4, s1
                  mulhsu       s2, s3, t5
                  fsub.s       ft8, fs9, ft3, rmm
                  xori         ra, a7, -836
                  sub          t5, s6, s5
                  fsgnjx.s     ft4, ft10, fs1
                  fle.s        s9, fa5, fa3
                  or           s0, s0, s8
                  andi         t2, s1, 1343
                  ori          s1, sp, 1150
                  sltiu        s10, s9, 1514
                  sltiu        a7, a1, -12
                  srl          t1, a1, t3
                  slli         s0, s2, 14
                  flt.s        a3, ft5, ft6
                  xori         a1, s5, 403
                  fsqrt.s      fs11, ft0
                  fmv.x.w      t6, fs0
                  fsgnj.s      fa5, fa5, ft7
                  fmv.w.x      ft1, t4
                  mulhu        s6, s8, s5
                  fle.s        s8, ft10, ft4
                  fcvt.wu.s    s5, fs11
                  fsgnj.s      ft6, fa1, ft5
                  addi         gp, s6, 328
                  lui          s7, 131673
                  fclass.s     ra, fa6
                  slti         s1, a6, -1888
                  sll          t1, s9, t4
                  fmin.s       ft8, fa0, fs3
                  fmin.s       ft2, fs2, ft10
                  rem          s3, s11, t0
                  sra          s9, t4, s5
                  fsqrt.s      ft1, fa5, rup
                  slti         t0, t3, -232
                  fmul.s       fs7, fs0, fs3, rne
                  sub          s3, t4, a2
                  mulhu        a3, zero, a1
                  divu         t3, s9, a0
                  auipc        a5, 26898
                  mulhsu       s11, t3, s3
                  remu         t2, a0, s11
                  slli         s2, s7, 17
                  srl          s10, a7, t1
                  remu         a3, a3, t0
                  rem          s3, ra, s1
                  fsgnjx.s     fs1, fs6, fa3
                  fsgnj.s      fa7, fs4, fs3
                  fmul.s       ft1, fa0, ft1, rup
                  fcvt.wu.s    a3, ft0
                  fsgnjn.s     fs6, fa3, fa7
                  sra          s0, ra, a6
                  mulhsu       s7, s3, t2
                  xori         gp, a5, -387
                  and          s8, s6, s0
                  ori          s2, s1, -1817
                  fdiv.s       fa4, ft10, fs8
                  add          t6, s9, a0
                  andi         t0, t5, -66
                  flt.s        s7, fa5, ft1
                  auipc        t6, 846081
                  and          ra, t1, s7
                  nop
                  fsqrt.s      ft1, fs6
                  slti         t3, s11, 6
                  slti         t6, zero, 1676
                  fsgnj.s      ft0, ft10, fs4
                  sra          t5, a2, t3
                  auipc        s6, 590077
                  fclass.s     s3, fs3
                  fsgnjx.s     ft1, ft7, ft0
                  fmv.x.w      gp, fa4
                  fdiv.s       ft4, ft8, ft7, rmm
                  rem          t0, s10, a4
                  sltu         t5, t5, s5
                  mulhu        ra, a7, s6
                  sltu         s5, s11, a2
                  div          t0, s8, t2
                  fsqrt.s      fs1, fs7
                  fsgnj.s      fa6, ft8, fs10
                  lui          zero, 72309
                  sra          t6, s3, ra
                  ori          s9, a3, -399
                  ori          zero, s5, 765
                  sll          zero, t1, t4
                  fcvt.wu.s    s9, fs11, rne
                  fcvt.s.wu    fs4, tp
                  fmul.s       ft0, ft2, ft6, rtz
                  sra          s0, tp, a7
                  fmv.x.w      t3, fa5
                  fmv.x.w      a2, fa5
                  fmv.x.w      a5, fs11
                  rem          t2, zero, t5
                  fsgnjn.s     ft7, fs1, ft8
                  fmv.w.x      ft11, t2
                  srl          t6, a5, s0
                  fsqrt.s      fs2, fa6, rtz
                  fdiv.s       fs3, fs3, ft4, rtz
                  andi         t0, t4, -1702
                  srl          a3, ra, t6
                  fcvt.s.w     fs0, a3
                  srai         s3, tp, 4
                  rem          t2, s4, s11
                  remu         s1, s3, s10
                  nop
                  fmul.s       fs3, fa6, fs9, rup
                  mulhsu       a5, sp, t0
                  fcvt.s.wu    ft9, a0, rtz
                  fcvt.w.s     gp, ft4
                  fsub.s       fs2, ft1, ft10, rdn
                  add          t2, sp, a2
                  fadd.s       fa3, fs11, fs4, rmm
                  mulhsu       s9, zero, s4
                  fmv.w.x      fs9, s11
                  auipc        t4, 9777
                  fsgnjx.s     fa0, fs1, fs8
                  fsub.s       fs5, fs0, fs1
                  add          a1, a0, s2
                  remu         t0, s11, t1
                  fcvt.w.s     a2, fs2
                  fmv.x.w      s2, fs3
                  mul          t4, t2, s9
                  add          t1, a2, s11
                  and          s0, t6, s1
                  fsub.s       fs5, fs5, fs10
                  fadd.s       fa4, fa0, fa6, rtz
                  mulh         sp, s10, a3
                  and          a1, a7, a3
                  flt.s        a0, ft0, ft2
                  fsgnjx.s     fs2, ft9, fs11
                  fmin.s       fs10, ft1, fa0
                  fclass.s     a7, fs8
                  mulhu        a5, s10, ra
                  fsgnj.s      fs6, ft1, ft1
                  lui          zero, 567032
                  add          s2, t3, s4
                  lui          t3, 669286
                  nop
                  fcvt.s.w     fs4, a7, rtz
                  and          s3, a1, s7
                  fdiv.s       fs6, ft1, fa7, rmm
                  fcvt.w.s     a7, fs1, rdn
                  ori          a1, a7, -1758
                  auipc        t5, 129611
                  fsgnj.s      ft7, fs5, ft11
                  fcvt.s.wu    fs4, a6
                  fsqrt.s      ft2, ft2
                  fsgnj.s      ft11, fa3, ft11
                  lui          s9, 855469
                  slti         a2, s1, 1445
                  fcvt.w.s     t1, ft11
                  and          s10, a7, gp
                  fmin.s       fa1, fa3, ft0
                  slti         s0, a5, -1101
                  fcvt.w.s     a2, fs4
                  mul          t4, s8, t3
                  fcvt.wu.s    s5, fa6
                  sltu         t6, s0, s0
                  xori         s2, t6, -1017
                  slli         a7, s7, 15
                  sub          t6, a1, s2
                  fcvt.wu.s    s11, fs1, rdn
                  mulh         t2, t3, s1
                  srli         zero, t2, 5
                  fcvt.s.wu    fs10, gp, rtz
                  mulh         t4, s4, s8
                  mulh         s8, a0, t4
                  fsgnjx.s     fa4, fa7, fa6
                  mul          a0, s11, s10
                  srl          s8, s3, a0
                  andi         a5, t6, 461
                  fdiv.s       fs0, fa4, ft6, rtz
                  fmul.s       fs7, ft9, ft2, rtz
                  auipc        s8, 824275
                  fsgnj.s      fa4, fa3, ft2
                  slt          s7, t1, s7
                  fsgnjx.s     ft5, fs6, fa1
                  flt.s        gp, ft3, fs11
                  remu         s0, s9, s2
                  fcvt.wu.s    ra, fs0
                  divu         s5, a6, s6
                  sltiu        s8, sp, -1921
                  feq.s        a1, ft11, fa5
                  ori          s2, s0, 1550
                  sltu         sp, s7, a1
                  remu         a2, t5, s5
                  fadd.s       fa6, ft3, fs5, rtz
                  mulh         zero, a4, a1
                  fsgnjn.s     fs4, fa5, fa7
                  fsgnjn.s     fa0, ft2, fa0
                  fcvt.s.wu    ft7, s9, rup
                  lui          s8, 670197
                  slli         s0, tp, 1
                  divu         s1, s1, s0
                  fmv.w.x      fs5, a0
                  or           s1, a1, a0
                  fmv.x.w      zero, fa6
                  mulh         ra, zero, s10
                  mulhsu       t4, t1, t0
                  mulhu        zero, a7, zero
                  auipc        s11, 254949
                  mulh         sp, t1, t2
                  fcvt.wu.s    a3, ft0
                  sll          s7, t0, s9
                  fle.s        sp, ft7, ft4
                  divu         t6, ra, s7
                  mulhsu       sp, tp, a4
                  lui          a0, 306906
                  fcvt.w.s     a3, fa6, rmm
                  flt.s        a2, fs10, fa7
                  andi         s8, t3, -162
                  fmin.s       ft10, ft5, ft5
                  srl          a5, s2, s7
                  sltu         a7, zero, s3
                  and          a2, tp, s0
                  slt          t6, s5, a1
                  divu         t3, s2, s7
                  fmin.s       fs11, fs0, ft9
                  fsub.s       fa4, ft8, fa1
                  remu         a7, a1, tp
                  fsub.s       fa7, fa0, ft0, rne
                  fmax.s       ft9, fa5, ft11
                  slt          zero, s11, s3
                  addi         zero, a2, -1667
                  fcvt.s.wu    ft3, t2
                  rem          s2, tp, t1
                  mulh         s2, s8, a7
                  mulhu        s6, s11, a5
                  remu         s5, a6, s3
                  fcvt.wu.s    t2, fa1, rne
                  mulh         a1, zero, t0
                  fmv.x.w      s8, fs9
                  fsub.s       fa0, fs0, fs1
                  srai         t4, t4, 25
                  sltiu        a3, gp, -164
                  slli         s5, a2, 15
                  sltu         s7, s4, s3
                  fmul.s       fa5, fa3, fs6, rne
                  slti         t5, tp, 1848
                  slti         s7, s1, 582
                  sltu         s6, s7, t5
                  fcvt.s.w     ft1, a2
                  fmax.s       ft6, fa4, fs5
                  fmul.s       fs5, fs8, fa0, rdn
                  sll          t3, a4, t6
                  srai         a1, t0, 5
                  fdiv.s       fs0, ft2, fa1, rne
                  feq.s        t3, ft11, fs2
                  auipc        s0, 56476
                  feq.s        a7, fs1, ft8
                  sltiu        a0, t1, -632
                  mulh         s11, a1, s3
                  rem          zero, s11, tp
                  flt.s        a5, fa0, fs7
                  srli         t2, s4, 18
                  sub          s10, a6, t6
                  fsgnjx.s     ft0, fa4, ft1
                  mulh         t5, t1, sp
                  fdiv.s       fa3, fs6, fa6, rmm
                  fmv.w.x      fa6, ra
                  mulhsu       s6, t6, t3
                  fmv.w.x      ft9, a4
                  mul          a1, s10, a5
                  fdiv.s       fs5, fa6, fs3
                  fsgnjx.s     ft2, fs1, fa0
                  fadd.s       ft0, fa5, fa6, rne
                  andi         t6, s7, -140
                  div          zero, t1, s5
                  fsqrt.s      fa6, ft2
                  mulhsu       s1, tp, tp
                  fsgnjn.s     ft5, fa7, fa4
                  sltu         s9, t3, zero
                  slli         t0, s2, 26
                  ori          a1, a1, -1955
                  fsqrt.s      ft9, fs3, rne
                  fadd.s       fs2, fs10, ft0, rne
                  sltiu        t4, s9, 648
                  sll          t2, zero, t5
                  fsgnjn.s     ft5, ft6, ft9
                  divu         t1, s4, s9
                  fmin.s       ft6, fa1, fa5
                  fcvt.w.s     s6, fs3, rtz
                  fsgnj.s      fa1, fa2, ft9
                  fadd.s       ft2, fa5, ft10
                  feq.s        a7, fa7, fs11
                  divu         a0, s7, t0
                  fsgnjn.s     fs9, ft2, fs7
                  sltu         s1, t1, a7
                  flt.s        tp, fa6, ft8
                  rem          s2, a5, t5
                  sra          s7, a4, t3
                  srai         s2, a3, 13
                  feq.s        t6, fa0, ft2
                  divu         zero, zero, t5
                  mulh         gp, gp, s8
                  or           t5, t6, a3
                  mul          s3, a3, a3
                  fmul.s       fa6, ft7, fs4
                  flt.s        s6, fs10, fa2
                  fmin.s       ft2, ft1, ft8
                  or           tp, a4, t6
                  slti         t2, t6, 330
                  fmin.s       ft1, ft5, fa7
                  or           s1, s11, s2
                  mulhsu       s9, s10, s0
                  fcvt.s.wu    ft9, a4
                  ori          a1, s1, 51
                  fadd.s       fs0, ft8, ft3, rup
                  fcvt.wu.s    s6, ft4, rmm
                  fclass.s     a3, fs9
                  fsqrt.s      fs7, fs4, rtz
                  sra          s2, sp, a6
                  mulhu        s3, a1, s9
                  fcvt.s.w     fs3, ra
                  fmin.s       fs3, ft2, fs3
                  mulh         s11, a7, t0
                  fdiv.s       fs9, fa5, fa4
                  fmin.s       ft10, fa1, fa5
                  fcvt.wu.s    a7, fa7
                  mulhu        s3, s3, s0
                  xor          a0, s11, s11
                  fsub.s       ft0, ft7, fs0
                  fcvt.s.wu    fa0, s4
                  slli         s7, a4, 12
                  addi         s1, s10, 1169
                  fsgnjx.s     fs3, ft9, ft8
                  sra          s6, gp, s9
                  sll          a7, sp, a7
                  fmax.s       fs4, fa1, ft9
                  mulh         t5, s9, ra
                  fclass.s     t6, fa7
                  mulhu        t2, a4, a0
                  fsgnjn.s     ft1, fs8, ft7
                  and          a0, t5, a0
                  xori         sp, a5, 396
                  fmul.s       ft1, fs4, ft10, rtz
                  xori         zero, s9, -50
                  sltiu        s7, tp, 120
                  srai         sp, sp, 9
                  feq.s        s8, fs5, ft8
                  xori         t3, ra, -1441
                  srli         t6, a3, 27
                  xori         a7, a7, 783
                  xor          s2, a3, s8
                  mulhsu       s6, t3, t5
                  fle.s        s0, ft4, fs6
                  auipc        s0, 17758
                  or           t1, a1, s4
                  slt          a5, a1, s11
                  sra          zero, a2, gp
                  mulhu        a2, a4, a4
                  fclass.s     a2, fa5
                  fmax.s       ft11, ft5, ft11
                  or           t0, a3, t6
                  fsgnjn.s     ft11, ft4, ft9
                  fadd.s       fa4, ft8, fa2, rdn
                  fle.s        s7, fs10, ft3
                  fmv.w.x      fa4, s8
                  mul          s0, sp, a4
                  xori         a2, s11, 1194
                  sltu         ra, zero, tp
                  and          t1, ra, tp
                  fmin.s       fa7, ft9, ft4
                  mulhsu       ra, t6, a5
                  div          t1, a6, a2
                  fmax.s       fa4, ft9, fa4
                  mul          t2, s3, tp
                  slti         t1, t5, -1133
                  addi         a2, sp, 882
                  fcvt.w.s     s10, fs8
                  fadd.s       ft1, fs6, fs5, rtz
                  fcvt.s.wu    ft2, s1, rdn
                  divu         t6, s8, t1
                  remu         sp, t6, gp
                  rem          gp, s3, a3
                  xor          a7, t2, t0
                  sra          s10, s8, a0
                  fcvt.w.s     t3, fs8, rup
                  fcvt.wu.s    t5, ft2
                  ori          a7, s11, 920
                  mul          t1, s1, s10
                  sra          a1, t2, s7
                  srli         s6, t1, 31
                  slli         sp, t5, 0
                  xor          s10, a4, a3
                  fmv.x.w      a7, ft2
                  sltiu        s11, a7, -1938
                  divu         s11, s5, sp
                  slt          a5, a4, ra
                  fmul.s       fs6, fa7, fs11, rdn
                  mulhsu       ra, s7, tp
                  fcvt.s.wu    fs4, t2
                  fadd.s       fs11, ft11, ft5
                  nop
                  sub          a7, t2, s7
                  fsub.s       fs6, ft0, fa5
                  fmv.x.w      ra, fs10
                  or           s2, t1, s1
                  fcvt.w.s     a7, fs10
                  srl          s2, sp, s6
                  rem          s10, t6, s2
                  fsqrt.s      ft1, fa4, rne
                  fdiv.s       fa5, fs1, ft8
                  srl          s3, t1, tp
                  or           gp, a5, s5
                  fmin.s       ft5, ft3, fa1
                  nop
                  mul          t1, s5, t3
                  sltiu        s10, s5, 1049
                  fmin.s       ft6, ft6, fs4
                  fle.s        ra, fs5, fa6
                  fclass.s     s2, ft11
                  fclass.s     s1, fa4
                  rem          t6, s5, a1
                  fcvt.s.w     fs4, s6
                  srl          ra, t4, t5
                  fcvt.wu.s    s5, ft9
                  fsqrt.s      ft5, fa5, rup
                  lui          tp, 866403
                  fmv.w.x      ft0, sp
                  slti         s6, s6, -634
                  fcvt.s.wu    fs10, a6, rdn
                  fmax.s       ft5, ft10, ft3
                  auipc        t0, 427852
                  slti         s8, s2, 597
                  sra          s6, t0, a5
                  flt.s        zero, fa4, fs2
                  nop
                  fmin.s       ft4, fs1, fa0
                  fmin.s       fs1, fa3, ft5
                  srli         tp, ra, 1
                  slt          s1, t2, tp
                  sll          t0, s8, s0
                  mulh         s3, t2, s1
                  slli         a5, tp, 3
                  sub          sp, s4, s7
                  and          s9, a2, s8
                  nop
                  div          gp, s2, a4
                  fadd.s       ft8, fa3, fs1
                  auipc        t0, 880614
                  fsgnjx.s     fa2, fs10, fs0
                  fsqrt.s      fa7, ft9
                  slt          s9, s11, zero
                  sra          t0, s2, a4
                  xor          s6, a3, t1
                  andi         t0, a6, 273
                  sltu         t0, t4, s0
                  fmin.s       ft1, ft5, fs1
                  fsgnjx.s     fa1, fa6, fa3
                  mulhsu       a1, t6, a2
                  div          a2, a1, t5
                  srl          tp, s1, sp
                  flt.s        a7, ft11, fa5
                  fsgnjx.s     ft4, fs6, fa5
                  fmax.s       ft0, ft6, fa2
                  srai         zero, s4, 10
                  mulhsu       s5, t6, a4
                  sub          t5, a5, s9
                  fmul.s       fa0, ft9, ft8, rtz
                  fsgnjx.s     fa0, ft4, fa6
                  mulh         s7, s4, s6
                  mul          t5, s9, s6
                  auipc        t4, 780031
                  fcvt.s.w     fs9, s2
                  fmul.s       fa3, ft9, fs0, rne
                  sltiu        s3, t5, 1559
                  fle.s        t5, fa1, fs9
                  mulhu        a0, s4, zero
                  divu         s0, t2, a3
                  fcvt.wu.s    zero, ft7, rdn
                  fle.s        t1, fs1, ft5
                  fcvt.s.w     fa5, s9
                  mulhu        t0, s3, s2
                  fcvt.s.wu    fs3, s2
                  andi         s7, t0, 1562
                  rem          gp, t6, s3
                  xori         s5, t2, 100
                  slti         zero, s9, -1274
                  sltu         a3, t0, t5
                  and          zero, s0, a2
                  fmul.s       fs2, fa3, fs10
                  srl          zero, a5, a5
                  flt.s        t4, fa5, fa3
                  fsgnjn.s     fs0, fa1, fs3
                  remu         t6, a0, s6
                  fclass.s     ra, ft9
                  fsgnjx.s     fa5, ft0, fs5
                  ori          s5, t5, -1499
                  mulhsu       s6, a7, sp
                  fmv.x.w      a5, ft7
                  fcvt.s.w     ft6, t4
                  lui          s5, 446766
                  mulhu        s10, t6, sp
                  andi         s8, a2, -930
                  sltu         sp, s8, a5
                  srli         s11, t3, 29
                  slti         a3, tp, -787
                  fsqrt.s      ft10, fs8
                  sra          ra, zero, gp
                  fmax.s       fs11, fs0, ft2
                  mulhu        a2, s2, s10
                  remu         tp, t3, a6
                  srli         s8, a6, 16
                  ori          s8, t4, -231
                  mulhu        t3, s0, s0
                  sltiu        t6, a4, -516
                  fdiv.s       fa5, ft3, fa4, rne
                  divu         t5, s5, t1
                  fsub.s       ft1, fs1, ft1, rdn
                  fcvt.wu.s    s11, fa2, rup
                  fcvt.w.s     s10, fa3, rmm
                  fmin.s       fs11, fa5, fs2
                  fmv.w.x      fa0, zero
                  div          t2, gp, a5
                  slt          gp, a3, a4
                  mulhu        gp, s2, s8
                  fmul.s       fa1, fa2, fa0, rdn
                  fdiv.s       fs8, ft10, fa6, rdn
                  fmv.x.w      sp, ft0
                  andi         s0, s0, -779
                  remu         s6, a1, t3
                  fclass.s     s11, fs1
                  fsgnjx.s     fa0, fa1, fs2
                  rem          s9, a0, zero
                  xor          a2, t2, a6
                  fle.s        t1, ft2, fs9
                  fcvt.w.s     t3, ft11, rdn
                  fsqrt.s      ft0, fa5
                  fsqrt.s      ft9, fa3
                  fcvt.s.wu    ft9, s1
                  remu         zero, s0, a6
                  mulhu        sp, t4, a6
                  addi         a2, a4, -637
                  mulhsu       zero, s6, a5
                  fmv.x.w      a3, ft11
                  srli         s5, t5, 3
                  srai         s2, s2, 25
                  fsub.s       fa3, ft0, ft1
                  srai         s0, t4, 24
                  srl          t6, sp, zero
                  mulhu        s10, s11, s11
                  sll          a5, s10, ra
                  fmul.s       fs8, fs5, fs0
                  slti         s5, a7, 316
                  sra          a7, t1, gp
                  remu         s8, a1, s10
                  add          t1, s10, s6
                  fsub.s       fs11, fa2, ft1, rdn
                  fsgnjx.s     ft7, ft7, fs4
                  fmv.x.w      t4, fa4
                  fle.s        t0, ft8, fs11
                  sll          s2, a2, ra
                  fdiv.s       fs5, fs6, fs7, rmm
                  fcvt.w.s     gp, fs5, rtz
                  nop
                  remu         s3, sp, gp
                  fdiv.s       fs4, fa0, ft8, rup
                  fsgnjx.s     ft1, fs9, fa4
                  nop
                  xor          s0, a7, t1
                  xor          s5, t1, zero
                  divu         s3, a5, a4
                  fmv.w.x      fa5, s5
                  fmv.w.x      fs2, s1
                  slt          zero, s4, a2
                  srli         t6, t6, 20
                  fmv.w.x      ft3, gp
                  remu         s11, s11, s10
                  fmin.s       fa7, fs6, fs10
                  sltu         s9, a0, s8
                  ori          a7, s10, 449
                  lui          t1, 51223
                  fcvt.s.wu    fs10, t4, rmm
                  srl          gp, s9, s2
                  fcvt.wu.s    s10, ft7
                  fsgnj.s      fa4, fa1, fa6
                  fsqrt.s      fa7, fa0, rtz
                  feq.s        a3, ft3, fs6
                  andi         gp, a6, -1406
                  xor          t6, t1, s10
                  addi         gp, t0, -1205
                  addi         s3, ra, -940
                  nop
                  fsgnjx.s     fa1, fa7, fa1
                  sltu         s7, a2, s7
                  fcvt.w.s     sp, ft1, rne
                  and          s7, s2, sp
                  and          t4, s2, s10
                  sub          s10, s7, ra
                  fdiv.s       ft6, fa1, fs0, rdn
                  fadd.s       fa6, ft10, ft7, rup
                  fcvt.w.s     a0, ft6
                  fclass.s     gp, fs0
                  sub          gp, zero, a4
                  xori         s2, t1, -1481
                  fsgnjx.s     fs3, fs0, fa5
                  and          s11, a1, sp
                  slti         a7, ra, -179
                  mulhsu       s8, s7, a4
                  sra          zero, zero, s7
                  fmax.s       fa3, fa4, fs10
                  and          t1, s5, s0
                  andi         tp, s2, 548
                  fsub.s       fs4, fs11, ft7, rne
                  srl          a7, t2, gp
                  fcvt.w.s     a7, fs8
                  fcvt.s.w     ft10, a2
                  fcvt.s.wu    fa5, a1
                  addi         a1, s1, -1534
                  sll          a2, s0, s10
                  rem          t2, t1, t3
                  divu         s6, s9, s11
                  sll          t0, t3, t5
                  fcvt.s.wu    fa3, a2
                  fle.s        s9, fa6, ft8
                  rem          a1, a0, s0
                  fmv.x.w      t2, fs5
                  fcvt.w.s     t0, fa7
                  fmax.s       ft11, fa6, ft5
                  feq.s        s6, fa2, fs7
                  remu         s10, a3, ra
                  sltu         a7, s0, a1
                  fdiv.s       fs5, fs5, fs2
                  mul          t0, t3, t0
                  fmv.x.w      a7, fs4
                  srl          t5, a2, zero
                  divu         a7, s6, t2
                  fmax.s       fs10, fa5, ft6
                  sll          t4, s5, t1
                  fmul.s       ft0, fs2, ft1
                  lui          s9, 73341
                  ori          s10, t0, 777
                  fsqrt.s      fs5, ft10
                  lui          ra, 752714
                  fcvt.w.s     t2, fs8, rup
                  fcvt.w.s     t0, fa1, rup
                  flt.s        s7, ft0, fs2
                  div          sp, gp, a4
                  addi         s8, gp, 1381
                  srl          sp, t5, sp
                  divu         s5, a1, ra
                  fsgnj.s      fa3, fs10, fs3
                  ori          s8, s8, 354
                  sub          s3, s9, t5
                  sll          tp, a6, s8
                  xori         t1, t6, 1072
                  slli         s11, sp, 29
                  lui          a5, 856444
                  and          t3, a4, t4
                  sub          s8, a1, s4
                  div          s8, t2, a4
                  fmax.s       fs7, ft3, fa3
                  fdiv.s       fs0, fs4, fs1, rup
                  sltu         t1, t0, s3
                  fsgnjx.s     ft7, fs7, fs2
                  fsgnj.s      fa6, ft5, ft3
                  sltu         a0, t1, s6
                  andi         s2, a5, 1572
                  lui          ra, 529283
                  fcvt.w.s     t5, ft7, rtz
                  div          zero, s5, a2
                  fcvt.w.s     t6, fa5, rup
                  slti         a1, s3, -1301
                  slti         s9, a1, 188
                  divu         s0, t4, s4
                  sub          s5, s2, s9
                  fmv.w.x      ft11, s1
                  addi         t6, s0, -549
                  mul          a2, s3, s10
                  fsqrt.s      ft9, fs2
                  ori          s2, s4, 874
                  auipc        t5, 441474
                  fsgnjx.s     ft9, fs1, fa2
                  addi         a0, a1, -1279
                  flt.s        t2, fs7, fs1
                  remu         a3, gp, tp
                  fsgnjx.s     ft0, fs9, fa6
                  fmv.w.x      fs6, s6
                  fsub.s       fs4, ft3, ft10
                  fmv.w.x      ft2, a5
                  mulhsu       t4, s7, a5
                  fsgnjx.s     fs6, fs0, fs1
                  fcvt.w.s     zero, fs7
                  sltu         t2, s9, s5
                  fcvt.wu.s    zero, fs4, rne
                  sltu         ra, t1, a6
                  fsqrt.s      ft9, ft6, rmm
                  slt          t6, gp, s11
                  or           t0, s11, t0
                  sll          a5, sp, s4
                  fmin.s       fa1, ft4, fa3
                  remu         a5, ra, t0
                  sll          t1, t2, s8
                  fsqrt.s      fs8, ft9, rne
                  andi         a0, s4, 39
                  srl          t5, t2, s6
                  rem          tp, s1, a7
                  sub          sp, t4, s11
                  fsgnj.s      fa1, fa5, fs10
                  fmv.x.w      s8, ft1
                  rem          t6, a6, s1
                  fmax.s       ft3, fa6, fs1
                  remu         sp, t2, zero
                  rem          t5, s7, a0
                  mulh         a0, a2, s6
                  div          s5, gp, s9
                  fle.s        s2, fs1, fs0
                  fsgnjn.s     fs6, fs9, fa2
                  mul          a2, s8, a4
                  div          gp, zero, s8
                  fsub.s       fa3, fs3, fa6
                  flt.s        a2, fs7, ft1
                  fcvt.s.w     fs1, s3
                  fle.s        t3, fs11, fs10
                  rem          t5, a1, s5
                  nop
                  fsgnj.s      ft7, ft5, fs7
                  feq.s        s3, ft5, fs1
                  fmin.s       ft10, fs6, fa7
                  srl          t6, sp, s3
                  fsgnjn.s     fa3, fa2, ft6
                  mulh         ra, sp, t4
                  fmul.s       fa6, ft7, ft2, rdn
                  fle.s        s8, fs0, fs7
                  mulhu        zero, gp, a4
                  fsqrt.s      fs2, fs10, rmm
                  fmul.s       fs3, fs1, ft9, rtz
                  fmv.w.x      ft6, s10
                  or           zero, a3, t0
                  add          zero, s2, s11
                  fcvt.s.w     fa3, t3
                  fsgnjn.s     ft3, ft4, ft1
                  fmv.w.x      fs5, s8
                  srl          gp, t5, a1
                  div          zero, t4, t0
                  sll          s7, a2, sp
                  div          a1, s2, tp
                  fmin.s       fa3, ft2, ft5
                  fcvt.s.w     fs11, s7
                  sub          s7, s1, s5
                  auipc        a7, 130415
                  fsub.s       fs8, fs6, ft6, rtz
                  xor          a3, s9, s7
                  add          s11, t4, t5
                  add          s3, s5, s10
                  fmin.s       fa7, ft6, fs10
                  div          a2, tp, a1
                  mulh         s7, s1, s1
                  fmul.s       ft11, ft10, ft1
                  nop
                  fclass.s     s1, ft10
                  mul          a2, a3, a5
                  fclass.s     a7, ft7
                  nop
                  sra          s7, t2, s3
                  sll          t5, t0, s7
                  addi         s6, a2, 2002
                  fmv.w.x      fs5, t6
                  slt          s2, sp, t0
                  sub          s3, t2, a1
                  fadd.s       ft3, ft3, fs8
                  fsgnjx.s     fa7, fs2, ft9
                  fclass.s     t6, fa7
                  mulh         a2, t5, s10
                  slt          zero, a0, zero
                  ori          a1, a7, 1922
                  fdiv.s       fs9, ft2, ft10
                  fcvt.s.wu    fs11, a5, rne
                  addi         t2, s9, -1226
                  or           s8, a3, t6
                  div          s5, s5, t5
                  sra          a3, a5, s7
                  divu         s1, s1, ra
                  fadd.s       fa7, ft2, ft9, rdn
                  srai         s1, s2, 9
                  srl          t1, t3, t6
                  fmax.s       ft4, fs1, fs5
                  fle.s        s7, fs3, ft6
                  srai         s9, zero, 17
                  fmv.w.x      ft11, a2
                  fclass.s     gp, fa6
                  auipc        t6, 375777
                  fcvt.w.s     tp, ft8
                  fle.s        a5, fs2, ft8
                  and          s0, zero, s8
                  fdiv.s       ft0, fs9, fs6, rup
                  addi         a3, a0, -899
                  fsgnj.s      fa5, ft5, fs1
                  fsgnj.s      fs3, fa4, fa3
                  fclass.s     s0, fs0
                  slti         t4, s5, -1681
                  addi         a3, t1, 883
                  fsgnj.s      ft11, ft0, ft8
                  add          t4, t3, a5
                  slti         sp, s6, 600
                  fsub.s       fs7, fa2, fa6, rne
                  rem          t4, a4, s9
                  slli         s5, s3, 11
                  fle.s        a2, fa6, ft3
                  srai         a7, t4, 21
                  fsqrt.s      fs10, fs3
                  slli         t6, s3, 20
                  sll          t6, t3, s11
                  sltu         s5, a7, tp
                  sltiu        s6, a7, 171
                  addi         s7, s4, 122
                  feq.s        a7, fs6, ft7
                  add          s1, s0, a4
                  srl          gp, s8, a3
                  fcvt.s.wu    ft1, t3
                  fsgnj.s      fa6, fs11, fs1
                  fmv.x.w      t2, ft3
                  ori          t2, a3, 1140
                  fmax.s       ft3, ft2, ft0
                  xori         s7, s6, -1359
                  fmv.w.x      ft1, s6
                  slti         a1, a5, -944
                  sltiu        s3, s11, -1718
                  add          a5, s3, s2
                  fmv.w.x      ft8, s8
                  fcvt.s.wu    fa6, sp
                  fsgnj.s      fa0, fs5, ft6
                  ori          a7, s9, 1014
                  fdiv.s       ft8, ft11, fs6
                  xor          s5, s7, sp
                  div          s2, a0, t2
                  sub          s2, t4, s3
                  slt          a0, s4, t3
                  fsgnjn.s     fa7, ft5, fa7
                  srl          s0, s6, t0
                  sra          s11, tp, t6
                  fsgnjx.s     fs7, fs0, ft9
                  mulhu        sp, s1, s11
                  fsgnj.s      fs3, ft5, ft10
                  fcvt.w.s     tp, fa7, rmm
                  fcvt.s.wu    fs2, t3, rne
                  fcvt.s.wu    fs6, a7, rdn
                  fmv.w.x      fa1, t2
                  sltiu        t5, gp, -840
                  rem          t1, a5, a1
                  xori         s0, s6, -1886
                  srli         s6, s10, 3
                  rem          a2, a0, s2
                  feq.s        t6, ft6, fa7
                  xori         a5, s11, -682
                  flt.s        ra, fa6, fs9
                  xori         s5, t5, -931
                  fmv.w.x      ft2, t0
                  slti         t6, t5, -2003
                  fadd.s       fa7, fs7, fs0
                  fsgnjn.s     fa5, ft2, ft7
                  div          s9, t0, a4
                  flt.s        s11, ft10, ft1
                  fmv.x.w      s8, ft10
                  fcvt.wu.s    a2, fs11, rne
                  mulhu        s0, s2, t1
                  slli         s1, a3, 16
                  andi         s1, s4, -299
                  xor          a7, a2, t6
                  mul          t5, sp, a6
                  div          s8, s2, tp
                  div          gp, s8, gp
                  sltu         s6, a2, gp
                  divu         gp, s2, a7
                  and          s1, t4, s4
                  mulhu        s6, sp, t2
                  fadd.s       fa4, fs8, fs4, rmm
                  sltu         s9, zero, a4
                  auipc        a0, 932435
                  nop
                  fsgnjx.s     fs7, ft1, fs5
                  remu         t3, a6, s4
                  fsgnjx.s     fa6, ft6, ft10
                  auipc        zero, 827571
                  fadd.s       fs2, ft0, fs10
                  addi         s6, ra, -1110
                  div          t5, s5, a1
                  auipc        zero, 575972
                  mul          tp, a1, a4
                  slti         t3, a2, 1781
                  fcvt.wu.s    s3, ft10
                  fsqrt.s      ft5, ft4, rmm
                  fmin.s       fs7, ft0, ft0
                  fmv.w.x      ft5, t4
                  nop
                  sll          s3, sp, a7
                  addi         t4, t0, -569
                  rem          t0, zero, s6
                  fmv.w.x      fa3, t4
                  sub          s7, s7, t5
                  andi         t5, s2, -1038
                  div          t6, a3, s2
                  div          s3, a3, tp
                  fmv.w.x      fa6, a4
                  fdiv.s       ft1, fa6, ft2
                  xori         s2, s9, -1174
                  fdiv.s       ft3, fs6, fs1, rmm
                  slli         s5, a7, 5
                  sub          tp, a0, a7
                  flt.s        t3, fs11, fs9
                  fmv.w.x      fs11, a2
                  fmul.s       fs7, fs2, fa6, rmm
                  fsub.s       ft7, fa2, fa5
                  mulhu        t3, s4, s7
                  sltiu        s6, a3, -533
                  fmv.w.x      fa3, s6
                  fdiv.s       fs0, fs11, fs3
                  fcvt.wu.s    t5, fa7
                  remu         s7, t0, s6
                  rem          s7, s6, t6
                  srli         s3, s1, 14
                  slt          t2, s6, s3
                  fsub.s       fs0, fs5, fs4
                  or           s3, t2, s1
                  ori          s2, t3, -1373
                  flt.s        t3, fs10, fs4
                  mul          t1, t3, a1
                  remu         a1, s8, gp
                  sll          s2, s6, s10
                  and          t5, s11, s4
                  andi         a0, s8, 888
                  fsub.s       fs10, ft10, fs11
                  srl          a3, t5, t5
                  fcvt.s.wu    ft0, ra, rmm
                  ori          t0, s0, -1491
                  ori          t1, s7, 86
                  fadd.s       fs0, fa1, ft9
                  fdiv.s       fa2, fs0, fa4, rup
                  flt.s        t2, fs10, fs7
                  fle.s        s5, fs0, fs5
                  mulhsu       s10, t3, a0
                  fsgnj.s      ft11, fa0, fs2
                  fcvt.s.wu    fa2, s0, rne
                  fsub.s       fa3, ft8, fs1, rtz
                  xor          t1, s8, t1
                  sll          a5, t5, a7
                  slt          s2, t0, t5
                  fmv.x.w      s9, ft10
                  srli         s7, a0, 29
                  fmv.w.x      fs6, s2
                  fmin.s       fs4, fa7, fs10
                  fle.s        ra, ft6, fa4
                  fadd.s       ft2, ft10, fs5, rtz
                  div          s11, zero, s6
                  mulh         s1, t1, a5
                  addi         s3, s4, 1704
                  fmv.w.x      ft9, s2
                  fadd.s       fa5, ft9, ft8, rmm
                  fmax.s       fs10, ft4, ft7
                  divu         gp, s3, s4
                  fcvt.wu.s    s7, fs6
                  fmv.x.w      s0, ft7
                  sra          a7, s9, ra
                  divu         s2, s5, t0
                  mulhu        a0, a5, tp
                  srl          s8, a2, s10
                  sltu         tp, a2, s1
                  fsgnjx.s     fa3, fa1, fs2
                  fsgnjn.s     fs2, fs5, fa5
                  and          s9, s3, s2
                  srai         a3, s11, 7
                  slt          gp, t0, t5
                  fclass.s     zero, ft6
                  srl          t6, s3, t3
                  div          s10, a3, s7
                  addi         s7, t0, 935
                  fmul.s       ft8, fa3, fs8
                  fmin.s       ft6, fs2, fs11
                  nop
                  sltu         a1, s10, t5
                  mulh         s6, s8, a5
                  fmin.s       ft11, ft2, fa2
                  fmax.s       fa6, ft7, fa5
                  fsgnj.s      fs4, ft7, fa3
                  auipc        zero, 178000
                  andi         s9, t0, -1634
                  addi         s11, tp, -1613
                  and          s8, s7, s11
                  mulhsu       s11, t0, a5
                  srli         ra, s5, 9
                  fcvt.s.w     fs7, a5, rne
                  fsgnj.s      fs9, ft6, ft1
                  feq.s        s6, ft10, ft10
                  fcvt.wu.s    zero, ft1
                  div          s11, t2, s10
                  fle.s        s9, fs3, fs5
                  and          s5, a0, s8
                  fmv.w.x      fs1, ra
                  rem          s9, gp, a7
                  fcvt.w.s     a5, fs4
                  fcvt.wu.s    s10, fs5, rup
                  fsgnjx.s     fa1, fa1, fs0
                  fmin.s       fs1, fa3, fs9
                  ori          t3, a4, 118
                  mulh         s3, gp, t5
                  andi         a5, s2, -1358
                  feq.s        t2, ft7, fs3
                  slli         s3, a0, 3
                  feq.s        s5, ft3, ft1
                  mulhsu       zero, s4, t2
                  feq.s        zero, fa2, fa6
                  add          a5, a7, a3
                  rem          s7, a5, s3
                  fmax.s       ft6, fa3, fs1
                  andi         t3, s1, 868
                  fsgnjx.s     ft4, ft4, fs4
                  xor          s7, a4, s6
                  mulhsu       t6, a7, t2
                  xori         tp, zero, 1448
                  and          ra, tp, t1
                  srl          t0, s9, s7
                  add          s1, s5, a0
                  srai         s5, t4, 4
                  remu         tp, s9, s1
                  remu         s11, sp, s1
                  feq.s        s5, ft7, ft8
                  flt.s        a3, fa1, ft10
                  div          s2, t6, t5
                  fsub.s       fs0, fs10, fs10
                  sra          a0, t2, ra
                  addi         s0, a1, -1114
                  xor          s8, a5, s4
                  fcvt.s.w     fa5, t5
                  fsgnjx.s     fs8, fs6, fs10
                  andi         t0, s8, 922
                  andi         s3, a1, 996
                  sltu         tp, zero, a0
                  add          a2, t0, zero
                  fle.s        a0, fa3, ft3
                  fsub.s       ft2, fa1, fa7, rtz
                  slti         t3, s1, -1512
                  feq.s        s11, fa6, ft2
                  fsgnj.s      ft10, fa4, ft11
                  srli         s3, a0, 9
                  xori         s1, t1, -1452
                  sra          t2, t3, gp
                  flt.s        s7, fs10, fa3
                  addi         sp, t0, 293
                  fadd.s       ft7, fa5, fa6
                  andi         s8, t3, 527
                  fcvt.w.s     sp, fs5
                  sltiu        s2, s11, -1872
                  fmv.x.w      s11, fs9
                  fcvt.wu.s    zero, fa1
                  fmv.w.x      fa7, a3
                  and          a2, t1, s10
                  mulh         ra, a1, gp
                  fsgnjx.s     fa1, fa4, fa2
                  sltu         a5, s3, zero
                  and          ra, zero, s11
                  fmv.w.x      fs3, t5
                  fsqrt.s      ft1, ft6
                  fclass.s     s6, ft10
                  feq.s        zero, fs9, fs4
                  fsqrt.s      fa0, fa5, rtz
                  andi         a5, ra, 105
                  fcvt.s.w     ft8, a6
                  mulh         s5, a1, s11
                  fadd.s       fs3, ft10, fa0
                  mul          a5, a4, s5
                  fmax.s       ft0, ft7, fa6
                  nop
                  mulh         s10, a7, s8
                  fsqrt.s      fs1, fs1, rdn
                  fadd.s       ft0, ft0, fa7, rne
                  fmin.s       fa1, fs5, fs2
                  srai         s5, a1, 26
                  srl          ra, ra, ra
                  fmin.s       ft1, ft7, ft7
                  fsub.s       fs8, fs1, fa3, rdn
                  fmv.w.x      fa5, s0
                  fcvt.w.s     a7, fs7
                  addi         tp, s8, -875
                  divu         s7, s7, t1
                  divu         a3, a7, t0
                  fsub.s       fa2, fs6, fs8
                  auipc        t3, 34503
                  flt.s        s1, fs3, ft6
                  andi         s1, s8, -64
                  fadd.s       fs3, ft6, fa3, rne
                  fcvt.s.wu    fa1, t4
                  fcvt.s.wu    fs4, s7, rne
                  fsgnjx.s     fa7, fa1, fs0
                  rem          a7, tp, s3
                  remu         a5, s4, t3
                  auipc        zero, 519430
                  slti         s6, s10, 689
                  xor          s10, s9, s8
                  and          t0, t1, t0
                  fle.s        s9, ft2, fs2
                  slti         a3, tp, 1249
                  div          t0, a5, a2
                  div          s1, gp, s5
                  or           gp, a3, t0
                  mul          ra, t4, s1
                  addi         t2, tp, -2038
                  srai         s6, s1, 17
                  divu         s9, a0, t0
                  div          gp, s1, t0
                  mulh         s9, t4, a7
                  fdiv.s       fs7, fs8, fs8, rup
                  sll          gp, s6, a2
                  slti         a1, a6, 361
                  div          t4, s9, s6
                  addi         t3, s1, 1456
                  lui          s6, 706702
                  xor          t3, a6, s0
                  fsub.s       ft6, ft0, fa3
                  sll          s2, s8, s7
                  fmv.w.x      fs11, s3
                  mulhsu       t6, a2, t4
                  or           a1, zero, s3
                  sub          a2, a1, s11
                  rem          a0, a2, gp
                  sltu         a3, a0, a4
                  fcvt.wu.s    s0, fa5, rmm
                  fcvt.wu.s    a0, fs5, rtz
                  ori          a3, tp, 1992
                  xor          a1, s1, t4
                  fclass.s     s6, fs6
                  sltiu        s11, s10, -857
                  mulh         s10, s1, s1
                  fcvt.s.w     ft6, t2
                  sll          a3, t6, s11
                  fsgnjx.s     fa5, ft8, ft7
                  fsgnj.s      fs4, fs6, fs10
                  nop
                  srai         t6, a2, 31
                  fcvt.s.wu    fa6, s1
                  and          s6, t3, t5
                  auipc        s8, 903134
                  fmv.w.x      fs6, t5
                  andi         ra, t5, 229
                  fsgnjn.s     ft1, ft11, fs2
                  sltiu        s6, ra, -1211
                  fmin.s       fs6, fa7, ft1
                  sll          s6, t1, a5
                  slli         sp, a5, 3
                  andi         s8, ra, 392
                  slli         a3, gp, 0
                  fmul.s       ft9, fs0, ft8, rup
                  remu         a3, t3, a5
                  flt.s        gp, fa3, fa0
                  addi         a2, s7, 847
                  sub          s8, sp, a7
                  and          a7, t5, s4
                  add          s7, t6, t2
                  fsub.s       ft10, fs6, ft11
                  and          s9, s10, s0
                  nop
                  fsgnjn.s     fs3, ft2, fa3
                  sub          s7, a4, tp
                  fdiv.s       fs7, fs7, ft0, rtz
                  sltu         t4, s3, s10
                  slti         t5, s4, -597
                  fle.s        t4, ft3, fa6
                  feq.s        s6, fa6, fs3
                  fcvt.wu.s    a7, fs11, rmm
                  slti         a5, a4, 1266
                  fmax.s       fs5, fa5, fa0
                  auipc        sp, 116423
                  slt          t0, t3, s4
                  fsgnjx.s     ft3, fa6, ft8
                  xori         gp, t2, -1808
                  mulh         s9, t2, a6
                  fle.s        s8, fs8, ft0
                  nop
                  fmv.x.w      t5, fa2
                  fcvt.w.s     tp, fa3
                  add          zero, s9, s1
                  nop
                  fmax.s       fa2, fs11, fs8
                  add          t6, t2, a6
                  mul          s0, sp, t4
                  auipc        s0, 887954
                  mul          a7, s0, s1
                  fdiv.s       ft3, fs5, ft5, rdn
                  sll          t2, s11, s2
                  ori          a2, a1, 1506
                  add          a2, gp, t5
                  feq.s        s8, fa5, ft3
                  fmin.s       fs11, fs6, fa1
                  fmax.s       fs6, ft10, fs10
                  flt.s        t3, fa5, fs7
                  fcvt.s.wu    ft7, a7, rdn
                  fsub.s       fs3, fs11, fs0
                  slti         s8, a7, 530
                  fsqrt.s      ft5, fs0, rmm
                  sub          ra, zero, tp
                  xori         t6, t3, 1684
                  or           s1, s0, s11
                  sll          gp, s0, t5
                  rem          a2, s5, sp
                  fsqrt.s      fs4, fa1
                  remu         s1, s9, a1
                  srai         tp, a5, 14
                  sll          t6, a5, t5
                  auipc        s10, 777793
                  fcvt.w.s     s0, fs4
                  slli         t2, s9, 16
                  sll          a1, t2, s6
                  sra          s8, s8, t3
                  sll          a7, t5, s10
                  or           s8, a5, t2
                  srli         t6, s9, 4
                  andi         s6, t1, 1353
                  feq.s        s10, ft10, ft4
                  fmax.s       ft10, fa2, fs11
                  fmv.w.x      fs3, s10
                  sltu         a7, t0, s3
                  auipc        a1, 780692
                  and          a2, s4, a2
                  xori         s2, s11, 1281
                  slt          s6, a4, t4
                  flt.s        a1, ft2, fa1
                  addi         gp, s4, 1976
                  sltu         s8, t5, s9
                  fdiv.s       ft4, fa6, ft6, rne
                  fmv.x.w      ra, ft0
                  sll          a7, s6, a4
                  fclass.s     s11, fs0
                  auipc        gp, 633007
                  mulh         a5, s2, a4
                  ori          s3, a7, 1648
                  fsub.s       fs10, ft2, fs10
                  mulhsu       t0, zero, t5
                  rem          a5, tp, s3
                  slli         s11, gp, 29
                  and          zero, s10, a2
                  fmv.x.w      s3, fs7
                  xori         s10, t3, 499
                  fsgnj.s      fa0, fa5, fs2
                  fmul.s       fs9, fs11, fs11
                  mulhsu       t0, s11, ra
                  srai         t6, s8, 30
                  fsqrt.s      fs7, ft3
                  and          s5, zero, t3
                  slti         s3, a7, 168
                  slti         a7, gp, -964
                  fadd.s       ft5, fs4, fa7
                  fcvt.w.s     t3, fa4
                  sltu         s5, t6, s1
                  fsgnjx.s     ft0, fa1, fs10
                  sltu         a0, s10, s7
                  auipc        zero, 642993
                  lui          s0, 878657
                  divu         s11, s1, tp
                  slti         t0, sp, 763
                  add          zero, t4, a1
                  sll          sp, a0, s2
                  fsgnjn.s     fs11, fa1, ft4
                  fcvt.s.w     fs9, t1, rmm
                  andi         s7, t3, 1597
                  fmin.s       fs11, fs10, fs0
                  div          a7, s10, t0
                  fmax.s       ft6, fs8, fs1
                  ori          s10, s8, -316
                  mulhu        t5, s6, a7
                  srai         s2, t1, 26
                  auipc        gp, 962968
                  nop
                  sll          zero, s4, zero
                  fcvt.s.wu    fs8, t1
                  fcvt.w.s     t3, ft4
                  lui          s1, 965924
                  nop
                  fadd.s       fa5, fs7, fa2
                  fmv.w.x      ft7, s1
                  mulhu        t4, s4, s0
                  mulhsu       s5, s0, s9
                  srl          s3, ra, sp
                  fcvt.wu.s    a5, fs3
                  fmax.s       ft3, fs11, fa4
                  srli         t4, s2, 12
                  slti         a2, s1, -1282
                  fsgnj.s      fa0, fa1, ft1
                  fadd.s       ft8, fs6, fs2
                  fle.s        t6, fs11, fs3
                  lui          t1, 318233
                  mulh         a1, a0, a6
                  fsqrt.s      ft0, fa3, rup
                  feq.s        s7, fs9, fa3
                  sltu         t3, t1, ra
                  fcvt.s.wu    fs0, s7
                  fmin.s       fs4, ft6, ft6
                  slt          sp, s5, a7
                  fcvt.s.wu    fs0, zero
                  sll          a7, s2, s8
                  mulhu        t1, a2, a4
                  fclass.s     a1, ft8
                  rem          a5, s0, s4
                  add          s11, t2, a0
                  mul          a0, s3, s2
                  srli         tp, s4, 7
                  slt          s3, t1, a1
                  fle.s        zero, ft7, fa2
                  srai         s3, s1, 20
                  sub          zero, t5, t4
                  fsqrt.s      fs8, fs2, rtz
                  fsgnj.s      fa2, ft8, fa1
                  fdiv.s       fa4, fa4, ft7
                  feq.s        a0, fs0, fa6
                  xor          t3, a5, a6
                  fsub.s       ft6, ft10, ft4
                  and          a7, a1, a3
                  fcvt.s.w     ft0, a3
                  nop
                  flt.s        t5, ft1, ft6
                  mulh         a7, ra, a1
                  srai         s5, zero, 2
                  div          tp, s0, t3
                  xori         t5, t5, -445
                  ori          a5, s0, -1757
                  mulh         s9, ra, t5
                  fcvt.s.wu    fs0, tp, rne
                  mulhsu       s1, s7, a2
                  fmax.s       ft10, ft8, ft8
                  remu         t1, ra, t0
                  rem          t1, s4, s11
                  fmax.s       fa6, ft4, ft5
                  remu         a1, s4, s11
                  mulh         s8, tp, gp
                  fsgnjn.s     fa6, fs1, fs3
                  sub          a1, a3, sp
                  sub          s3, s11, s10
                  sra          s0, t1, s7
                  fmv.w.x      fa6, s6
                  mulhu        sp, s9, ra
                  andi         s3, s8, 440
                  auipc        s3, 890391
                  fcvt.w.s     t0, fa6, rne
                  fmin.s       fs5, fa5, ft7
                  sll          sp, s4, zero
                  or           gp, a5, t1
                  srli         s5, s6, 26
                  fle.s        gp, fa2, ft7
                  fsgnjx.s     ft2, fa4, fs4
                  sltu         t2, t4, t1
                  slt          t2, s1, zero
                  fsub.s       fs8, ft11, fa3
                  feq.s        a1, fa5, ft1
                  fsub.s       ft4, fs5, ft1, rup
                  sll          t0, s3, s10
                  sub          t3, s9, s10
                  addi         a7, t0, 1193
                  srai         t1, s10, 29
                  ori          s3, s8, 358
                  lui          s0, 717076
                  srai         t2, t2, 24
                  fmax.s       fa6, fs4, fa7
                  sltiu        s6, s7, -486
                  fcvt.wu.s    a5, fs7, rtz
                  fmin.s       ft5, fs3, fa1
                  div          t5, tp, s4
                  sll          tp, a2, a0
                  auipc        s11, 1034557
                  fle.s        a0, ft1, fa1
                  fdiv.s       fs5, fa7, fa1, rne
                  xor          ra, s0, a0
                  sltu         s5, a4, gp
                  mulhsu       a0, t4, s4
                  fle.s        gp, ft4, ft10
                  rem          s10, s8, a0
                  fmin.s       ft0, fa0, ft1
                  mulhu        a2, s4, s2
                  add          t6, t2, a4
                  rem          a5, a3, t2
                  mulh         s3, a5, s11
                  mul          a2, a7, s1
                  fcvt.wu.s    s0, fs11, rne
                  fadd.s       fa4, fs11, fa2
                  fdiv.s       fa4, ft1, fs2, rne
                  remu         ra, a4, a4
                  srai         s9, a4, 9
                  fadd.s       ft11, fs0, ft1
                  sltiu        s5, zero, 1834
                  srli         t6, t5, 10
                  fmul.s       fa7, fa1, ft8
                  fsgnjx.s     fa4, ft3, ft7
                  slti         a1, s9, -1299
                  xori         s5, a1, 301
                  fdiv.s       fs5, ft2, ft5, rup
                  nop
                  srli         a5, gp, 16
                  fle.s        s6, ft6, fa1
                  sltiu        s2, a0, 2039
                  lui          s10, 622523
                  flt.s        a1, fs9, ft5
                  flt.s        s3, fa7, fs1
                  srli         t3, t6, 24
                  sltiu        s5, t2, -894
                  fcvt.wu.s    s5, ft2
                  fcvt.wu.s    a7, fa5
                  flt.s        a5, fs7, ft2
                  fmv.w.x      fs7, gp
                  rem          t5, t4, t4
                  fcvt.wu.s    a2, fa5
                  and          s5, tp, a4
                  sltu         t2, sp, s11
                  fcvt.s.w     fa5, s3
                  remu         t2, s8, s10
                  srl          sp, a7, a7
                  sltu         a1, t0, a2
                  fsgnjn.s     ft5, fs1, fa4
                  slt          s8, a3, a3
                  fadd.s       ft6, fs9, fa6, rmm
                  or           a1, a5, s6
                  and          a2, t6, s0
                  mul          s11, a0, ra
                  fcvt.wu.s    gp, fa2
                  fcvt.wu.s    zero, fs9, rtz
                  sra          t6, s10, s0
                  fcvt.wu.s    s9, fs2
                  div          a7, s6, s0
                  fcvt.s.w     ft2, t2
                  fle.s        t2, ft6, fs0
                  mulhsu       s9, s8, a5
                  ori          a1, a6, 429
                  fcvt.w.s     gp, fs7
                  fsgnjn.s     ft6, fa1, ft7
                  fcvt.w.s     s7, fs10, rup
                  or           s6, sp, s10
                  ori          t6, s8, 605
                  flt.s        a1, ft6, ft8
                  fsgnjx.s     ft0, fa6, ft2
                  feq.s        s10, fa1, ft7
                  and          s6, t2, a6
                  fcvt.w.s     a7, fs7
                  feq.s        s7, fs1, fa4
                  sll          s11, t2, t2
                  fmv.w.x      fa1, s3
                  or           s5, a3, t1
                  addi         s6, t5, 1806
                  sub          s5, t5, a3
                  feq.s        s8, ft1, ft10
                  ori          s5, s10, 1935
                  sltu         s10, s10, t5
                  fmv.x.w      s8, fs2
                  flt.s        t5, ft2, ft4
                  feq.s        s0, fa3, fs4
                  remu         tp, t1, sp
                  nop
                  sra          zero, t2, gp
                  slli         a5, t0, 11
                  fcvt.s.wu    ft10, s11
                  fcvt.wu.s    t2, fs8
                  xori         tp, t2, -1507
                  fsqrt.s      fa1, fs11
                  add          t5, s7, t2
                  nop
                  fcvt.s.wu    ft7, zero, rne
                  slli         t0, s6, 28
                  fcvt.s.w     ft2, a4
                  andi         a7, a3, -1963
                  xor          a2, t3, s2
                  srai         s7, s11, 6
                  fle.s        t1, ft10, ft8
                  divu         t4, t2, s6
                  fsgnjx.s     fa2, fs0, fa6
                  lui          s7, 159868
                  or           t3, gp, s10
                  fmul.s       ft4, fa6, ft10, rtz
                  andi         s10, a2, 1712
                  srl          tp, t6, s11
                  sltu         s0, s5, a6
                  fdiv.s       fs2, ft4, fs2, rmm
                  fmin.s       fa1, fa0, fs4
                  fsgnjx.s     fa7, fs10, fa1
                  fmul.s       ft9, fs1, fs7
                  sltiu        t4, s1, -335
                  fcvt.s.w     fs11, s11, rtz
                  sltu         s9, t6, a2
                  fdiv.s       ft6, ft7, ft6
                  fle.s        s6, fs4, fa0
                  sub          s2, a6, s9
                  fcvt.s.wu    fa5, s7, rdn
                  sltiu        s2, ra, -1545
                  srl          a1, a3, t3
                  lui          s9, 390091
                  div          t4, s2, a1
                  lui          s1, 66812
                  fsgnjx.s     ft5, ft9, ft10
                  fsgnjn.s     fa3, ft5, fs9
                  feq.s        s7, fs5, ft5
                  fmv.w.x      fs2, t3
                  fclass.s     s10, fs6
                  fmin.s       fs5, fs8, ft2
                  fsgnjx.s     fa6, ft0, ft1
                  flt.s        s5, fs5, fa1
                  andi         s11, t5, 776
                  flt.s        t1, fs6, fs11
                  fle.s        s10, fa6, fa3
                  andi         ra, t0, -1250
                  fadd.s       fa7, ft2, ft8
                  andi         ra, a0, 1685
                  auipc        a7, 867977
                  fadd.s       fs5, ft3, fa6
                  fmax.s       fs4, fs2, fs5
                  slli         s10, tp, 13
                  slt          s5, s9, sp
                  fdiv.s       ft4, ft0, fa2
                  slt          t6, gp, s6
                  flt.s        s6, fa3, fs8
                  fsub.s       fa6, ft1, fs8, rne
                  xori         t3, t1, -347
                  sltiu        s9, t5, 1604
                  feq.s        a1, fs11, fs11
                  andi         s1, s10, -1094
                  srai         tp, s9, 1
                  fsub.s       fs11, fa6, fa6
                  sub          t4, a6, sp
                  xori         a0, zero, -1778
                  or           ra, s1, t6
                  fsgnjn.s     fa3, fa1, fa5
                  fcvt.s.wu    ft6, ra, rmm
                  div          t3, s2, s7
                  fadd.s       fs7, fa1, fs9
                  fadd.s       fs7, fa5, fs5, rdn
                  fmax.s       ft6, ft10, fa0
                  div          s8, s6, gp
                  flt.s        s11, ft7, fs7
                  fmv.x.w      a2, fs4
                  sltiu        s6, tp, -1128
                  fdiv.s       ft5, ft5, fs3
                  slt          tp, ra, a7
                  and          t1, sp, ra
                  fmul.s       fa6, ft3, ft3
                  sltiu        a2, s7, 154
                  fcvt.s.wu    fs6, zero, rmm
                  slti         s6, s3, 1365
                  fmax.s       fs11, fs5, ft5
                  fmv.w.x      fs10, t3
                  slt          a7, ra, s8
                  fmin.s       ft9, fs3, ft2
                  flt.s        a2, fs2, fa5
                  slli         t2, s1, 24
                  xor          s1, s5, s4
                  fmv.x.w      s10, fa6
                  fcvt.w.s     t2, fs2
                  lui          s1, 841560
                  remu         t3, sp, tp
                  nop
                  slt          t3, s10, s2
                  mulhsu       s7, s2, s3
                  srai         t6, s7, 31
                  nop
                  fsqrt.s      fs0, fs7
                  xori         sp, a1, 709
                  fcvt.s.wu    fs10, a4, rne
                  rem          s10, s6, s1
                  or           s2, t0, s1
                  xori         ra, t4, -1463
                  add          s0, zero, a1
                  sltu         s11, s11, a6
                  slti         a2, zero, 277
                  mulhu        zero, t3, s0
                  sltu         t5, s9, t4
                  fdiv.s       ft10, fs0, ft10
                  mulhsu       a0, s6, a1
                  fsub.s       fs5, fa0, fs11, rdn
                  fsgnjx.s     fa0, ft4, fs6
                  fcvt.s.wu    fs0, t5
                  fle.s        t6, fs5, fs2
                  add          tp, s11, a3
                  fsgnjx.s     fs8, fs2, fs8
                  fsgnj.s      ft6, ft4, fa2
                  fsgnjx.s     fs6, ft7, fs5
                  srl          t0, t2, t1
                  fcvt.wu.s    s2, fs0
                  fadd.s       ft5, fs5, fs3, rne
                  or           t4, s9, tp
                  srai         s11, s0, 8
                  auipc        t2, 618427
                  nop
                  sll          s2, s10, zero
                  slt          t6, s4, t2
                  slti         s11, t3, -1479
                  srl          a3, a1, gp
                  srli         t5, t1, 9
                  lui          a5, 173532
                  sra          a1, s0, zero
                  mulhu        sp, zero, a2
                  nop
                  srl          t2, t5, a7
                  slli         sp, sp, 8
                  xor          s9, t2, s1
                  nop
                  mulhsu       t3, t1, t1
                  fsgnjn.s     ft3, fs4, ft0
                  fcvt.s.w     ft4, s4, rtz
                  rem          a3, s7, t1
                  feq.s        a7, ft2, fa6
                  sra          a5, t6, a3
                  sra          tp, s5, sp
                  mulh         t0, s10, t2
                  or           t6, zero, t0
                  feq.s        ra, ft0, fs9
                  fcvt.s.w     ft7, a4
                  flt.s        a5, fa6, ft2
                  fsub.s       fa7, ft3, fa4
                  fclass.s     s6, fs7
                  rem          t6, zero, tp
                  fsgnj.s      fa4, fs3, fa0
                  fcvt.w.s     s3, ft11
                  mulhsu       s6, s11, s0
                  mulhsu       t5, s10, s9
                  and          gp, s8, sp
                  add          s2, t6, s11
                  or           t1, s3, a3
                  mulhu        s11, a5, a1
                  slt          t3, tp, t1
                  fmul.s       fa6, fs10, ft6, rup
                  mulhu        a0, a0, t2
                  slti         t5, a3, 1118
                  add          sp, a1, s4
                  sltiu        s3, s0, -1422
                  add          a2, a4, s9
                  nop
                  srli         a2, s6, 27
                  sub          s0, a4, s10
                  srl          a3, t1, s1
                  fcvt.w.s     s5, ft2, rmm
                  fcvt.wu.s    t3, ft7
                  andi         t6, t5, 1205
                  mul          a3, t2, s10
                  flt.s        a5, ft0, fa5
                  fadd.s       fs4, fa6, fs0, rne
                  or           tp, s7, s2
                  sll          a7, sp, t3
                  feq.s        tp, ft5, fs7
                  lui          s9, 382329
                  mulhsu       s3, a1, gp
                  div          s2, a2, s6
                  ori          s9, s3, 1683
                  lui          a7, 802953
                  slt          gp, s2, a2
                  lui          ra, 739594
                  div          s6, t6, a2
                  srli         s9, a5, 20
                  fcvt.wu.s    s3, ft9
                  sltiu        sp, a4, -1999
                  xori         s0, s9, 1609
                  or           s8, s3, a1
                  xor          a2, s4, s2
                  srl          gp, t0, s5
                  fcvt.wu.s    t2, ft3, rtz
                  ori          t3, s0, -729
                  fmax.s       fa5, fa2, ft8
                  fle.s        s7, fs3, fs1
                  fmul.s       fs7, fs0, ft2
                  fmv.x.w      t3, fa1
                  fmax.s       fa3, fa2, fs2
                  slli         s0, a0, 13
                  andi         s3, s5, -1766
                  sltu         t1, s11, t4
                  rem          t1, s10, ra
                  or           t2, s8, a0
                  flt.s        s1, fs7, fs3
                  mulhsu       a2, t1, zero
                  andi         ra, a4, 1052
                  fclass.s     s8, fs11
                  mulhsu       s11, sp, a1
                  add          s6, s10, s7
                  add          gp, a4, t3
                  fcvt.w.s     s10, fs8, rmm
                  fdiv.s       ft3, fa0, fa5, rmm
                  fsub.s       ft8, ft9, fa5, rdn
                  xori         t5, zero, 644
                  rem          a5, a5, s8
                  sub          a0, a1, t3
                  fsgnj.s      fa3, fa4, fa3
                  fcvt.wu.s    zero, fs6
                  andi         s6, s5, 1031
                  addi         t4, t2, -238
                  fmax.s       fa5, ft1, fa1
                  fle.s        a2, ft5, fa5
                  fmv.w.x      fa1, a3
                  flt.s        t0, fa6, ft5
                  sltiu        s0, t3, -801
                  rem          t6, s4, s1
                  fmv.x.w      s1, fa2
                  rem          s1, a1, a3
                  sll          t1, a3, t3
                  div          a3, sp, t5
                  mulhsu       ra, a2, t1
                  andi         t4, t5, 468
                  feq.s        t4, fs2, ft11
                  addi         t3, s2, 1128
                  fclass.s     a1, ft4
                  fclass.s     gp, fs8
                  sltu         s9, a1, tp
                  fdiv.s       ft6, fs8, fa0
                  fclass.s     s8, fs2
                  fadd.s       fs11, fs6, fs3, rmm
                  srai         a5, a6, 4
                  fmv.x.w      t5, fa2
                  slti         s1, s8, 172
                  remu         s6, a3, a0
                  flt.s        s10, fs6, ft6
                  remu         tp, s4, t2
                  add          a2, s7, t2
                  fcvt.s.wu    ft10, s1, rne
                  sltiu        s7, a0, -1811
                  divu         s10, t1, s9
                  div          t3, t2, t3
                  fmin.s       fa0, fs9, ft3
                  fsqrt.s      ft9, fa5, rne
                  add          s10, t6, tp
                  fsgnj.s      fs10, ft11, ft0
                  add          a5, t2, s9
                  divu         zero, a5, a0
                  slli         ra, t0, 18
                  fmin.s       fs6, fs7, fs5
                  ori          gp, tp, -903
                  lui          t6, 953505
                  mulhu        a0, s9, t3
                  or           gp, sp, a4
                  mulh         t2, a3, s10
                  flt.s        t2, fs7, fa0
                  fle.s        ra, fs10, fs8
                  fdiv.s       fs8, fa3, fs10
                  fcvt.s.w     ft8, t2, rne
                  fmv.x.w      t1, fa6
                  auipc        t1, 638592
                  fmin.s       ft6, ft8, ft3
                  mulhsu       t3, a4, a3
                  fsgnjn.s     ft0, ft6, fa5
                  fcvt.s.w     fa7, t2
                  fmv.w.x      fs0, s0
                  fsub.s       ft9, fa5, fa0
                  fsub.s       fs11, fa1, fs5, rdn
                  mulhu        s6, tp, gp
                  slti         s0, s6, 631
                  div          t5, a7, ra
                  div          gp, a5, s0
                  fmv.x.w      zero, ft6
                  fsub.s       ft9, fs4, ft3, rmm
                  fcvt.w.s     t6, fa6, rup
                  fcvt.w.s     t4, ft1, rmm
                  srl          s5, a5, a1
                  or           zero, s6, t0
                  div          a5, zero, sp
                  sltu         a1, s10, t2
                  mul          t6, t3, s8
                  srai         t6, tp, 4
                  slli         a3, s6, 18
                  slli         t1, s4, 9
                  fsgnj.s      fs8, fs11, fs4
                  andi         t2, s11, -1039
                  slli         s11, s0, 27
                  auipc        t2, 960537
                  srli         s11, s6, 19
                  fcvt.w.s     tp, ft2, rmm
                  xor          a0, s6, s7
                  fsgnjx.s     fs1, fa7, ft7
                  and          t0, s2, t0
                  or           zero, a2, s6
                  fclass.s     a3, fs5
                  fmul.s       fa5, fs3, fs11, rdn
                  fmax.s       fa4, fa0, fs9
                  and          s0, t3, a1
                  sll          t2, a0, ra
                  sltiu        s6, s11, -807
                  remu         s1, s0, a6
                  or           a1, t1, a2
                  divu         s6, s1, a7
                  fsgnjx.s     fs11, fs4, fa4
                  remu         s9, a4, s7
                  fmv.w.x      fs4, s9
                  remu         ra, ra, t0
                  fmul.s       ft0, ft6, fa6
                  sub          zero, sp, t6
                  slti         a1, s11, 319
                  fsgnjx.s     ft8, ft3, fa6
                  flt.s        tp, fs5, fs10
                  divu         s2, s9, gp
                  ori          s5, a7, -1217
                  or           t3, t4, s11
                  slt          t6, t4, t0
                  sub          t2, zero, a3
                  add          s5, s8, t6
                  nop
                  and          s8, sp, s9
                  fcvt.wu.s    sp, fa5, rne
                  fmin.s       ft3, fs11, fs10
                  srai         a7, a2, 10
                  slli         t1, tp, 20
                  sll          tp, a3, gp
                  slli         s9, s4, 9
                  fcvt.wu.s    s5, fs6, rup
                  fadd.s       ft5, fs9, fa0
                  fdiv.s       ft4, fa7, fa5
                  fle.s        a3, fs5, ft4
                  fcvt.wu.s    s2, fs5
                  mulhu        zero, s11, s1
                  sll          s9, tp, s1
                  slt          t1, a4, gp
                  lui          gp, 166659
                  sltu         a1, t0, tp
                  fmv.w.x      fs9, t2
                  and          t5, a7, a5
                  fdiv.s       ft6, fs1, fs0
                  mulh         t3, s5, t0
                  fmv.w.x      fa4, tp
                  fcvt.wu.s    s6, fs4, rup
                  fle.s        s11, ft4, fa4
                  feq.s        tp, fa7, ft5
                  fsqrt.s      ft10, ft4
                  fmv.w.x      ft1, t0
                  xor          t0, t6, t4
                  sll          a3, s0, a7
                  fmv.w.x      fs1, s1
                  rem          a3, a0, a0
                  add          s6, t5, t6
                  sltiu        t3, s5, -1667
                  fsub.s       fs9, ft11, ft3
                  srai         a2, s0, 21
                  mulh         t3, gp, t0
                  fsgnj.s      ft11, fs0, fa1
                  srl          t2, t5, t2
                  mul          t5, gp, t0
                  slt          s11, s0, zero
                  sll          s6, s10, t2
                  mulhsu       t2, s10, t4
                  sltu         a7, t2, a3
                  sltu         a7, gp, gp
                  fadd.s       fa6, fa0, ft4
                  sub          a1, s2, t3
                  addi         t0, s2, -26
                  nop
                  fmin.s       fs1, fs11, ft1
                  add          a3, t2, s1
                  fsgnjx.s     fa7, fa1, ft3
                  or           t3, zero, a0
                  rem          s11, tp, t4
                  divu         s2, a5, s2
                  sra          t1, s9, t5
                  fmin.s       fs6, ft9, fs0
                  fclass.s     s0, fs2
                  fclass.s     a5, fs3
                  fmul.s       fs8, ft4, fs2, rne
                  fcvt.s.w     fs2, a7, rup
                  auipc        s11, 286287
                  divu         gp, t0, s1
                  fcvt.w.s     t6, ft3
                  nop
                  feq.s        a3, fa7, fs11
                  slt          s5, a2, s3
                  fsqrt.s      ft7, fa3, rtz
                  sra          s11, s1, t5
                  mulhsu       s1, s7, s2
                  slli         a1, a7, 14
                  fmv.w.x      fa2, s0
                  xor          t6, t4, t5
                  srli         a1, gp, 30
                  lui          s3, 388303
                  fcvt.w.s     a2, fs2, rne
                  sra          a5, t1, s6
                  fmv.w.x      fs9, zero
                  fsgnjx.s     fs3, fs3, fa3
                  rem          t2, s2, a0
                  sltu         zero, gp, ra
                  fcvt.s.w     fs5, t2
                  srli         t6, a3, 31
                  sltiu        s7, a1, 1928
                  fcvt.wu.s    s6, ft7, rmm
                  divu         s2, ra, t2
                  lui          s9, 811640
                  add          sp, t1, t0
                  fmul.s       fs2, ft2, ft6, rmm
                  div          s5, tp, a2
                  ori          s0, tp, -1566
                  slli         s6, a6, 3
                  ori          s8, t0, 1796
                  add          a5, a1, a3
                  flt.s        ra, fs6, ft6
                  fadd.s       ft8, ft7, fa3, rne
                  srl          t4, a7, t6
                  sltu         s11, a2, s3
                  fmax.s       fa1, fa6, ft10
                  feq.s        a5, ft5, fs8
                  nop
                  sll          s11, a6, tp
                  mul          s0, gp, s3
                  sll          t4, s3, zero
                  add          a3, a6, a6
                  auipc        a7, 786911
                  xor          t3, t6, ra
                  and          a2, t3, gp
                  srai         ra, a6, 29
                  feq.s        a7, fa5, ft6
                  sltiu        t6, t5, 1325
                  fmax.s       ft7, ft11, ft1
                  mulh         a3, a1, t4
                  sltu         t1, tp, s0
                  slt          a5, t2, zero
                  fle.s        s8, fs2, fa2
                  xori         t5, t2, -1514
                  nop
                  fclass.s     t0, fs2
                  sltu         s0, a5, s8
                  slt          a5, ra, sp
                  mulhsu       a3, a7, t6
                  sll          s3, t5, t4
                  addi         tp, a2, -777
                  ori          t3, s7, 1674
                  sra          s3, ra, t0
                  sltiu        a1, t5, -4
                  lui          zero, 993558
                  rem          sp, a5, s5
                  mulhu        t0, s2, t2
                  divu         s10, a6, s2
                  fmin.s       fs1, ft1, ft3
                  xori         s2, t4, 542
                  addi         s9, s7, -527
                  fclass.s     t5, fs10
                  srli         tp, s11, 26
                  fmul.s       fa6, ft0, fs1
                  fmin.s       ft2, fs9, ft8
                  lui          s8, 373336
                  xor          s3, s3, ra
                  sltu         a7, s9, a4
                  mulhu        sp, a2, s11
                  or           s3, sp, zero
                  fadd.s       fa1, fs3, fa6
                  sll          a2, t2, tp
                  mul          s7, a0, gp
                  sra          a0, a6, zero
                  fmul.s       ft3, ft7, fs11, rmm
                  addi         a7, a3, -13
                  fcvt.wu.s    a1, fs4, rtz
                  sltiu        s1, s10, 31
                  srli         s1, zero, 30
                  feq.s        tp, fa5, fs8
                  fmv.x.w      t4, ft5
                  sub          a7, a0, a5
                  fcvt.s.wu    fa1, sp, rdn
                  fsub.s       fs8, fa4, fa4, rtz
                  srl          s9, t0, a3
                  slti         s2, t6, 665
                  fmv.x.w      a2, ft0
                  xori         s9, a6, 1514
                  sltiu        s7, a1, 585
                  addi         zero, t5, 730
                  lui          t0, 1006811
                  fmul.s       ft2, fs7, ft0, rdn
                  mulhu        s0, t5, s1
                  xori         a3, s6, -1875
                  srl          s1, a4, s9
                  or           s11, a4, gp
                  sub          s10, gp, t4
                  slli         tp, ra, 2
                  divu         sp, sp, sp
                  srli         ra, s6, 27
                  fsgnjn.s     ft6, fa7, ft6
                  fmv.w.x      fa1, s8
                  xor          a3, a5, sp
                  mul          a7, t2, t3
                  lui          t5, 114512
                  and          t1, s9, t4
                  fclass.s     t5, fs5
                  sll          s3, ra, gp
                  fadd.s       fa0, fa5, ft0, rup
                  mulh         s5, t4, tp
                  fsqrt.s      fa5, ft3
                  lui          s3, 333039
                  sltiu        s7, ra, -1072
                  flt.s        s7, ft2, ft10
                  slti         s7, a5, -906
                  fmax.s       ft5, ft3, ft9
                  andi         a2, a4, 1982
                  flt.s        a2, ft10, fs0
                  or           s1, s0, s4
                  fsgnjx.s     fa6, fs1, ft11
                  srai         s3, a1, 19
                  xor          a5, t4, a3
                  fcvt.s.wu    fs9, s11, rne
                  sra          a5, t3, s5
                  auipc        a3, 304355
                  xor          s6, s7, s7
                  flt.s        t3, ft2, fs1
                  slti         s1, s7, 145
                  fmin.s       ft11, fa7, ft5
                  add          s6, a3, s2
                  nop
                  slti         gp, s11, -261
                  fcvt.s.wu    fa5, zero
                  xor          a1, t5, s7
                  sltiu        s9, t5, 534
                  remu         t4, a1, a0
                  remu         t1, a1, a6
                  xori         s1, tp, -610
                  srl          tp, a7, t2
                  fcvt.s.w     ft9, gp, rdn
                  sub          gp, s2, tp
                  sll          tp, t0, s11
                  feq.s        s0, ft4, fa0
                  sra          a2, t3, s1
                  feq.s        tp, fs11, ft3
                  fmv.x.w      t1, fs10
                  slli         zero, sp, 6
                  fmax.s       ft4, ft8, ft8
                  divu         t1, s5, a7
                  fdiv.s       ft2, ft9, fs3, rup
                  slli         t3, a5, 2
                  mul          gp, a1, a2
                  fmv.x.w      a1, fs6
                  fdiv.s       fa0, ft0, ft7, rne
                  divu         s10, t0, a1
                  auipc        s5, 458007
                  auipc        s3, 431325
                  fcvt.w.s     s7, ft11, rne
                  fmin.s       ft2, fs3, fs10
                  fcvt.s.w     fs11, sp
                  srai         s11, s7, 30
                  fsgnj.s      ft3, fs10, ft9
                  mulh         s9, tp, t1
                  lui          ra, 935500
                  fsgnjn.s     fs6, fs5, ft8
                  mulhsu       a0, gp, a6
                  nop
                  nop
                  fclass.s     gp, fa1
                  fcvt.wu.s    ra, fs8
                  sra          t5, t3, s3
                  feq.s        a7, fs7, ft0
                  div          s2, a5, s6
                  fclass.s     a3, fa0
                  mulhu        s2, t2, t3
                  mulh         a7, s8, tp
                  fmv.x.w      a1, ft4
                  fsgnjx.s     fs1, fs11, fs0
                  or           sp, s6, a0
                  fdiv.s       ft9, fa1, ft11, rup
                  slt          a0, ra, t0
                  fsqrt.s      ft1, fa4, rmm
                  slt          a1, t6, s4
                  andi         s5, s6, 1551
                  sra          t2, t2, t2
                  fclass.s     s10, fa5
                  fdiv.s       fs6, fs4, ft6
                  fmax.s       fa5, fa2, ft3
                  fcvt.s.w     fs10, s9
                  srai         s6, a6, 17
                  xori         t6, s8, -994
                  ori          t2, a3, 1940
                  fsgnjx.s     fs10, fa2, ft0
                  sltiu        s10, t6, -1139
                  xori         a5, a2, 1667
                  fmul.s       fa5, ft3, fa6
                  sra          s9, tp, t4
                  srl          t5, s2, s9
                  srl          t3, t0, s11
                  fmax.s       ft5, fs9, ft6
                  fmax.s       fs9, fa3, fs6
                  mulhsu       a7, ra, s7
                  sltu         t6, t5, a4
                  add          s1, a0, zero
                  andi         ra, t5, 909
                  rem          t2, s8, a3
                  fcvt.wu.s    a7, ft7
                  fmv.x.w      ra, fs6
                  fcvt.s.w     fa0, s9
                  sll          t5, t0, s3
                  fcvt.w.s     s3, fs10
                  srai         t3, a5, 14
                  and          t1, a1, t2
                  xor          t5, a5, a0
                  feq.s        t6, ft6, ft8
                  and          s8, a5, t6
                  mul          t1, t2, s11
                  slli         a5, a6, 1
                  fle.s        zero, fs2, fs7
                  fadd.s       ft5, fs0, fs2
                  fcvt.wu.s    t1, fa4
                  mulhu        s0, a3, t5
                  fsub.s       fa6, ft3, fs11
                  ori          t2, s3, -1485
                  flt.s        t1, ft2, ft3
                  fsgnj.s      ft10, fs2, fa6
                  srl          s9, s4, s10
                  fmin.s       fs10, fs1, fs2
                  feq.s        t4, fa3, ft7
                  fsqrt.s      ft8, fs11, rdn
                  fsub.s       fs10, ft2, fa7
                  auipc        s7, 272419
                  sra          t0, a4, s4
                  addi         s7, t1, 935
                  add          a2, s2, a5
                  srli         t3, s4, 23
                  or           s6, a3, t1
                  srai         t0, s10, 4
                  ori          t4, s3, 357
                  fle.s        sp, ft2, ft7
                  mulhu        s8, s8, ra
                  fle.s        sp, fs8, fs3
                  fdiv.s       fs6, ft6, fa5
                  mulhu        a2, a3, a7
                  divu         s9, s8, t3
                  and          s3, t6, zero
                  feq.s        t3, fs5, fs1
                  fmin.s       ft7, fa4, fa1
                  div          s11, t6, ra
                  fcvt.s.wu    fs11, s11, rmm
                  auipc        a5, 959224
                  mul          t2, a1, s6
                  slt          t1, s9, a2
                  mulh         tp, a4, s4
                  sub          a1, a3, s7
                  rem          s1, s10, t5
                  fcvt.wu.s    zero, fa3
                  fadd.s       fs7, fs2, ft10, rup
                  fcvt.w.s     s0, ft5
                  rem          a0, a2, a4
                  andi         tp, s7, 1816
                  sll          t2, zero, gp
                  div          t1, s8, s1
                  slli         a2, t0, 4
                  fsgnjx.s     ft1, fs3, ft8
                  addi         s0, a2, -422
                  fmv.w.x      fs9, tp
                  sra          s8, s6, t4
                  fcvt.w.s     tp, fs6, rtz
                  fsqrt.s      ft11, ft2
                  sll          s6, s5, s11
                  rem          a5, zero, t5
                  slt          ra, a5, a1
                  xori         s8, a7, -1090
                  sltiu        t0, a7, -1632
                  fcvt.w.s     s2, fa3
                  fmv.w.x      fs8, s10
                  add          zero, t4, s11
                  fmax.s       fs10, fs10, fs10
                  fcvt.s.wu    fs0, s7, rmm
                  fmax.s       ft11, fa2, fa3
                  fmax.s       fs6, fs8, ft0
                  divu         ra, s7, t3
                  fsgnjx.s     fa2, fa7, fs10
                  or           s3, t3, t1
                  ori          t2, s7, -1695
                  div          s5, a6, t6
                  mulhsu       s2, s6, a0
                  srl          gp, t2, a4
                  fmv.x.w      s7, ft9
                  fle.s        t5, fa4, fs9
                  ori          a1, t0, 610
                  flt.s        s10, fs4, fs4
                  andi         gp, s10, 756
                  sltiu        t4, s5, 2006
                  sltu         s2, s10, tp
                  fmul.s       fs6, fs9, fs8, rmm
                  fcvt.wu.s    t4, fa2
                  fmv.w.x      fs4, a3
                  flt.s        sp, ft9, ft8
                  fmin.s       fs7, ft8, fa0
                  slt          t4, t1, s3
                  sra          t1, a0, s9
                  fclass.s     s7, fa7
                  fsgnjx.s     ft11, fs3, ft1
                  fsub.s       fs8, fs4, ft11
                  sltu         s2, s9, tp
                  ori          a0, t5, 598
                  sra          t3, a1, s7
                  rem          sp, t2, t2
                  div          t5, t3, a5
                  fmin.s       fs7, fs1, fs4
                  srl          t0, s10, tp
                  sltiu        tp, s4, -826
                  flt.s        s0, ft1, ft11
                  fsqrt.s      fa1, fa7
                  sub          s11, t3, t0
                  mulh         s2, s1, ra
                  mulhu        s2, t6, zero
                  fmv.x.w      t4, fs11
                  fmin.s       fs5, fa0, fs8
                  sltiu        s3, gp, 844
                  fsgnjx.s     ft1, ft2, ft1
                  flt.s        a3, ft1, fa3
                  sltu         t4, s0, s6
                  srl          s5, ra, a2
                  xor          t2, s10, s7
                  mulhsu       a5, s6, ra
                  nop
                  fclass.s     sp, fa1
                  fmv.x.w      sp, fa0
                  fmul.s       ft1, ft0, ft4
                  and          sp, ra, t4
                  fmax.s       ft1, ft6, fs11
                  and          s1, t3, s8
                  div          sp, t2, a6
                  fclass.s     s0, ft2
                  ori          t6, ra, -210
                  auipc        a5, 702488
                  divu         s3, sp, s10
                  fcvt.s.wu    ft6, s11
                  fsub.s       fs5, ft7, ft3
                  xor          s5, t4, s11
                  feq.s        a3, ft11, fs5
                  mul          a7, s0, s3
                  fsgnjn.s     fa6, fs9, fs6
                  sll          t3, zero, t6
                  feq.s        s1, ft0, ft0
                  srl          a0, t2, a0
                  xor          t5, t4, t5
                  fmv.x.w      s10, fa4
                  slt          s6, s8, s9
                  auipc        a7, 550958
                  fmin.s       fs1, fs11, fs11
                  fadd.s       fa5, fa7, fa6, rup
                  fcvt.s.wu    fa2, t3, rne
                  mulh         zero, s0, s2
                  auipc        a2, 1007434
                  add          s10, a7, t6
                  fsqrt.s      fs4, fa4, rtz
                  fcvt.w.s     a5, ft2, rup
                  mul          t0, s10, a6
                  srl          sp, s11, a5
                  auipc        a2, 884658
                  lui          t5, 99229
                  mulhsu       t0, sp, zero
                  fsgnjn.s     ft10, fs6, ft1
                  andi         gp, t2, -1488
                  sltiu        t6, s5, -718
                  fdiv.s       fa3, ft7, ft2
                  fmv.x.w      t5, fa6
                  mulh         sp, t6, gp
                  srai         t2, a4, 21
                  sub          sp, s10, t6
                  mulhu        t1, s5, s10
                  mulhsu       s5, t5, s2
                  xori         a2, ra, 478
                  mul          s9, a2, a0
                  fmin.s       fs9, fa3, fs3
                  or           s8, t2, s8
                  fmax.s       ft1, fs11, fs3
                  srai         a2, zero, 24
                  sltiu        a7, a7, -1585
                  sll          s6, gp, ra
                  andi         a2, a1, -329
                  fmin.s       fs5, ft6, ft8
                  xor          a3, t3, t4
                  fdiv.s       fs11, ft8, fa7, rtz
                  fsgnj.s      ft2, fs11, ft0
                  fmax.s       fs10, ft4, fs11
                  srli         t0, a3, 3
                  andi         t5, tp, 1382
                  sll          t1, t6, s4
                  fmv.w.x      fa5, a6
                  fcvt.s.w     fs6, ra
                  addi         t4, a0, -323
                  sltu         s5, ra, t4
                  sub          t1, t1, a7
                  sra          s3, s8, s3
                  fmv.w.x      ft9, s5
                  mulhsu       t3, s9, a1
                  xori         zero, t3, 263
                  sltu         a1, zero, s4
                  fcvt.s.w     fs10, t0
                  xori         a0, s2, 1368
                  sub          t4, s6, s4
                  divu         s3, a0, s6
                  fle.s        a1, fs6, ft5
                  and          tp, a6, a6
                  or           s10, a3, s3
                  fsgnjx.s     fs2, fa1, fs5
                  slti         s10, a6, 906
                  fle.s        s10, fa1, fs0
                  div          zero, t3, t2
                  flt.s        s7, fa2, ft5
                  div          s1, t2, s10
                  fcvt.w.s     a5, fs10
                  divu         t1, s1, a3
                  div          s5, t4, t2
                  sll          s7, s8, a6
                  fmv.x.w      t6, fa0
                  or           zero, zero, a5
                  rem          s2, s1, ra
                  feq.s        tp, ft4, ft7
                  mulhu        tp, a0, t6
                  auipc        s7, 379174
                  sra          t3, t5, s2
                  fmv.w.x      fa2, a5
                  slt          t4, t4, s11
                  auipc        a2, 24925
                  fcvt.s.w     ft5, a0, rtz
                  fmul.s       fs0, ft3, fs1, rmm
                  xori         s10, tp, 1895
                  fclass.s     sp, fs9
                  fmv.w.x      fa7, zero
                  fcvt.w.s     a1, ft6, rdn
                  fmv.w.x      ft10, s8
                  mulh         t1, s11, s10
                  fsgnjx.s     ft7, fa6, ft1
                  sltu         s11, s0, s9
                  fcvt.s.w     fs3, s7
                  fmv.w.x      fs7, s11
                  slt          t5, a0, sp
                  rem          a1, gp, ra
                  fsub.s       fa2, ft1, fs0, rdn
                  srl          s3, t1, a5
                  fadd.s       fs2, fa2, fa3, rmm
                  fcvt.w.s     a1, fs9
                  sltiu        t1, s7, 907
                  fle.s        t3, fs6, fa5
                  fmin.s       fa7, fs1, fs4
                  mulhu        a3, a7, a7
                  mulhsu       a1, s6, zero
                  mulh         t4, a4, a3
                  fcvt.w.s     ra, fs10
                  slt          a2, a2, a7
                  fmv.w.x      fs6, s4
                  mulhsu       s1, s8, s9
                  fsub.s       fa4, fa1, fs11, rtz
                  addi         s6, s11, -1267
                  fmul.s       ft5, fs8, fa6
                  feq.s        t3, fa7, ft0
                  sltiu        t1, gp, -787
                  mul          a5, t4, t6
                  rem          s7, zero, s0
                  fcvt.s.w     fa2, a0, rup
                  fcvt.wu.s    t1, fa7
                  sra          s1, s4, sp
                  fadd.s       fa0, fs6, ft3
                  nop
                  srai         gp, s2, 0
                  fcvt.s.wu    ft0, a0
                  fdiv.s       fa0, fs5, fa7, rtz
                  fcvt.w.s     t0, fs2, rdn
                  fmax.s       fs11, ft1, fs4
                  fadd.s       ft0, fs8, fa2, rup
                  fmax.s       fs3, fs3, fa0
                  fmin.s       ft2, ft7, fa3
                  and          gp, s10, s9
                  rem          s11, s3, s6
                  xori         s6, a1, 580
                  rem          a7, a5, tp
                  sltiu        ra, t0, 534
                  fcvt.s.w     fs3, t4
                  xori         s7, a7, 104
                  fmin.s       fs5, fs2, ft11
                  slti         a7, a4, 565
                  xori         t2, a6, -350
                  div          a5, t3, s1
                  fsqrt.s      ft0, fs8, rdn
                  fmul.s       ft2, ft6, fs3, rdn
                  slli         s9, t1, 30
                  slti         s10, a2, -1434
                  divu         s9, t2, a7
                  srli         gp, a5, 1
                  lui          tp, 305783
                  auipc        s9, 1035308
                  rem          s5, s10, tp
                  sra          zero, a0, s0
                  rem          gp, t0, s7
                  fmin.s       fs2, ft11, ft7
                  lui          a2, 948190
                  divu         t6, gp, s5
                  fdiv.s       ft6, ft8, ft0, rup
                  xori         s3, t6, 146
                  lui          a7, 340713
                  sub          sp, a7, a0
                  fmul.s       ft9, fa0, ft3
                  add          s3, s11, t2
                  fdiv.s       fs3, fs9, fs11, rdn
                  sltiu        s6, t2, -1362
                  fdiv.s       ft2, ft9, ft8
                  or           s2, s7, s0
                  sltiu        a5, sp, 717
                  mulhu        tp, zero, s9
                  srl          ra, t3, s0
                  fclass.s     s11, fa3
                  mulh         s5, s1, t5
                  xori         t4, a4, -309
                  or           s10, t3, t5
                  fsgnjn.s     fs7, fs11, fs6
                  fmin.s       fa5, fa3, ft1
                  slli         a0, s7, 14
                  and          a1, a4, s11
                  fle.s        s1, ft0, fs10
                  srl          a7, s6, s7
                  fsub.s       fs6, fa3, ft2
                  sub          a0, a5, s4
                  add          s2, s2, gp
                  ori          s10, a1, 1911
                  fcvt.s.w     ft9, s2, rtz
                  sub          a1, s7, a0
                  sub          s1, t3, s6
                  mulhsu       s10, s7, s8
                  fmv.w.x      fs1, s2
                  slt          gp, t2, zero
                  sltiu        tp, s2, 396
                  mul          s9, a6, a6
                  sltiu        s0, s7, 307
                  sltu         s11, a7, s4
                  mulhsu       a7, a6, s10
                  remu         t4, t3, a1
                  slti         s2, s6, -596
                  slli         s5, t2, 2
                  slti         s7, zero, -993
                  xori         s2, s6, 946
                  srli         s2, ra, 24
                  fmv.x.w      a2, ft0
                  flt.s        t0, fa3, fa1
                  mulhu        s2, t1, s1
                  sra          t4, t0, s6
                  fcvt.s.wu    ft6, t4, rtz
                  sltiu        s7, a3, 1223
                  ori          s0, s5, -393
                  srai         zero, a7, 24
                  mulh         ra, s2, s11
                  auipc        a3, 690587
                  xori         s9, s10, 1261
                  fdiv.s       fs2, fs5, fa6
                  mulhu        s1, s6, s0
                  fcvt.s.w     ft8, t3
                  srai         ra, t0, 15
                  sra          a0, t4, ra
                  nop
                  fmv.x.w      s2, fs3
                  rem          t1, s8, a0
                  sra          s6, a0, s5
                  fsub.s       ft11, fs9, fs4
                  srl          a3, t6, s5
                  mul          a1, zero, t1
                  nop
                  mulhu        a7, t2, a5
                  fsub.s       fs5, ft10, fs7, rtz
                  fmv.w.x      fs6, s2
                  fsgnjx.s     ft7, ft5, fs0
                  remu         a0, t0, ra
                  mulhu        s9, a6, s4
                  srli         s3, t1, 23
                  fmv.x.w      t4, fs2
                  fmv.w.x      fs11, s9
                  fle.s        t3, fs9, fs11
                  lui          s7, 516839
                  slt          sp, a5, t3
                  fsgnjx.s     fa4, ft5, fa1
                  fcvt.s.wu    fa7, s7, rmm
                  fmul.s       ft7, fs8, fa3, rtz
                  lui          t5, 857172
                  fle.s        zero, fs0, ft11
                  sltiu        t6, t4, 1715
                  sll          s6, a6, a7
                  and          a1, a5, t2
                  auipc        a0, 565674
                  fcvt.s.wu    fs8, s5, rne
                  srli         ra, zero, 12
                  sltu         a3, a1, s8
                  fmin.s       ft2, fs6, ft2
                  fcvt.w.s     ra, ft3
                  xor          a1, gp, a2
                  fmax.s       ft0, fs0, fs5
                  xori         zero, s10, -1213
                  fcvt.w.s     zero, fa0
                  divu         t0, t1, s6
                  rem          s0, s0, t3
                  xori         s6, s6, 1095
                  fcvt.w.s     t4, ft6
                  sra          s3, s4, ra
                  feq.s        gp, fs11, ft1
                  fle.s        t6, ft2, fa1
                  andi         t6, s8, 540
                  fcvt.s.wu    ft1, sp
                  fmax.s       fa1, fs11, ft8
                  fmv.w.x      fs7, t4
                  auipc        ra, 800241
                  fsgnjn.s     ft0, ft1, fa2
                  fcvt.wu.s    t3, fa2
                  fmv.w.x      ft0, zero
                  slli         ra, s4, 10
                  feq.s        s5, ft7, fs0
                  fclass.s     a0, ft2
                  feq.s        a2, ft6, fa3
                  fdiv.s       fs4, ft4, fs2
                  addi         a5, s7, 302
                  add          s6, t5, a2
                  and          ra, a1, t2
                  mulh         t0, a4, t0
                  mulhu        a2, a6, t1
                  rem          s9, sp, s4
                  lui          zero, 682266
                  add          sp, sp, gp
                  fle.s        s3, ft8, ft4
                  srai         a3, s5, 22
                  divu         s2, gp, t3
                  flt.s        ra, ft9, fa0
                  fmax.s       fa6, fs4, ft7
                  fmax.s       fs9, ft7, ft1
                  mulhu        a0, s10, tp
                  fmul.s       ft2, fa6, fa1, rdn
                  srl          t5, s9, a7
                  rem          t6, s4, a3
                  fclass.s     s11, fa4
                  or           a0, s9, s4
                  fsgnj.s      ft0, fs0, fs7
                  fdiv.s       ft5, fs11, fa6
                  fsgnjx.s     fs5, fs11, ft2
                  fmin.s       fa5, ft1, fa5
                  xor          t3, a7, a3
                  add          s9, s2, t2
                  ori          s6, a0, 1709
                  div          a5, a0, t3
                  sra          a2, s10, s6
                  fcvt.s.wu    fs3, a1
                  fsgnjn.s     ft3, fs10, ft1
                  fcvt.wu.s    s1, ft0, rdn
                  fcvt.s.wu    fs10, ra
                  sra          s2, s8, ra
                  slli         t5, gp, 2
                  xori         gp, t0, -1451
                  srl          a0, gp, s4
                  fsgnjx.s     ft1, ft7, fs3
                  remu         ra, a6, s7
                  fsqrt.s      ft3, fs10
                  div          a2, a3, a5
                  fmax.s       fs0, ft11, fs7
                  auipc        s11, 247351
                  fmin.s       fa2, fs3, fa1
                  fsqrt.s      ft9, ft4
                  xori         a2, a2, 261
                  mul          t6, t5, a4
                  fadd.s       fa3, ft6, ft2, rdn
                  mul          ra, s7, s3
                  srli         tp, t2, 31
                  xori         t4, gp, -1031
                  fmv.x.w      t6, fs0
                  flt.s        a5, fa4, fs6
                  feq.s        a0, ft0, ft1
                  mulhu        a7, s2, t5
                  and          s1, s11, t6
                  sltu         s11, gp, t6
                  slt          zero, a2, sp
                  fmin.s       fa3, fs1, fs5
                  feq.s        tp, fa0, fa5
                  sub          s3, s9, s3
                  fsgnjn.s     fs0, ft5, ft5
                  fsub.s       fs11, fa1, ft3, rtz
                  flt.s        s5, fs5, ft5
                  srli         t4, t4, 25
                  mulhsu       s6, s3, a6
                  fcvt.s.wu    fa2, s9
                  mulhu        tp, t2, s3
                  slti         a0, t2, 620
                  mul          a5, t6, t2
                  fcvt.s.w     fa2, t2, rne
                  fadd.s       ft3, ft0, fs1, rne
                  fmv.x.w      s5, fs0
                  srli         s10, zero, 31
                  slli         s9, s8, 17
                  fcvt.wu.s    t0, ft9, rdn
                  divu         s3, t3, s7
                  fsub.s       fs11, ft7, ft5, rmm
                  fsgnjx.s     fa4, fs4, fa3
                  fmul.s       fs1, fs7, fa1, rtz
                  mulh         ra, gp, a7
                  or           a1, s7, s8
                  div          a2, t4, s8
                  mul          t0, s6, a7
                  fmul.s       fa0, ft11, ft11, rne
                  fadd.s       ft7, fa0, ft5
                  fsgnjx.s     ft3, ft11, fs6
                  or           s3, t4, s1
                  fcvt.w.s     ra, fs10, rdn
                  sra          t5, s1, sp
                  fcvt.wu.s    s0, fs10, rtz
                  flt.s        s3, ft10, fs6
                  fmin.s       ft2, ft10, fs10
                  fdiv.s       fs7, ft2, ft5
                  feq.s        sp, fs1, ft1
                  srai         s6, s2, 7
                  sra          s2, s2, a2
                  mulhu        s8, a5, sp
                  fsgnjn.s     fs11, fs6, fa1
                  remu         a3, a3, s2
                  xori         s7, tp, 1893
                  sll          a2, zero, s4
                  rem          s1, t5, tp
                  mul          ra, a1, t1
                  slt          s8, s9, t0
                  andi         s11, t2, -161
                  sltu         s10, a5, sp
                  fmin.s       ft10, fa3, fs5
                  sra          a0, tp, t3
                  sub          t1, a1, t2
                  fsgnj.s      ft6, fa3, ft1
                  slti         zero, a7, 1531
                  sub          s5, a7, t1
                  slti         s0, t3, 1810
                  and          a2, a3, a3
                  fsub.s       fs8, fs2, ft7
                  fsgnjn.s     ft0, ft11, fs7
                  fcvt.s.w     fa6, a2, rmm
                  fclass.s     a0, fs0
                  remu         s6, s11, sp
                  div          sp, a3, a2
                  fmv.w.x      fs8, t5
                  flt.s        s2, fa3, fs11
                  fmv.x.w      ra, fs7
                  fle.s        t3, fs4, ft5
                  xori         sp, s6, 1442
                  slt          t5, a7, s5
                  ori          t0, s5, 1554
                  xor          a5, t6, t3
                  andi         s2, sp, -1426
                  fsqrt.s      ft5, fs11, rmm
                  mulhu        t3, t2, a4
                  fcvt.wu.s    s2, fs1, rdn
                  fdiv.s       fs7, fs9, fa4
                  flt.s        sp, ft1, ft0
                  fmv.x.w      t6, fs11
                  fle.s        a5, fs2, ft8
                  fle.s        s6, fa0, ft6
                  srai         a3, s3, 17
                  addi         s5, t5, -591
                  slli         s3, s6, 13
                  add          s5, s5, s3
                  sra          t1, sp, a1
                  rem          a7, a3, t5
                  fmv.x.w      a3, fa5
                  divu         t3, a4, a3
                  mulhsu       a3, a7, s0
                  fmv.w.x      ft7, t1
                  srli         gp, t2, 6
                  fmul.s       fa1, fs7, fa2
                  xor          a2, zero, s3
                  divu         t2, a6, s10
                  fsgnj.s      ft0, ft3, ft10
                  fclass.s     t1, ft8
                  addi         zero, a2, 998
                  fmin.s       fa3, fs5, ft1
                  feq.s        sp, ft10, fs2
                  fsub.s       ft11, ft2, ft8, rtz
                  xori         a3, s7, 744
                  fclass.s     gp, fs2
                  fcvt.wu.s    a7, fa2, rmm
                  sltiu        a1, s5, 457
                  and          s2, t5, a6
                  mulh         s6, s1, s8
                  mulhu        s0, t6, s11
                  fadd.s       ft2, fa2, ft5, rdn
                  divu         s6, t4, a0
                  sub          s5, tp, a2
                  fcvt.s.wu    fa7, s1, rmm
                  fmul.s       ft7, fs8, fa3, rmm
                  fmax.s       ft5, ft9, fs2
                  mulh         t5, t4, a1
                  xor          t2, s1, s5
                  fcvt.w.s     s2, fs0, rdn
                  sltiu        ra, s5, 989
                  fle.s        t1, ft5, fs8
                  fle.s        t1, fs10, fs4
                  add          a3, a6, t0
                  srli         s3, a2, 9
                  fle.s        ra, fa5, ft1
                  srli         s10, s10, 24
                  fcvt.wu.s    a3, fa4
                  nop
                  auipc        s3, 34706
                  sltiu        s2, s9, 262
                  mul          a2, t0, zero
                  and          t4, s8, t4
                  srli         a2, ra, 18
                  flt.s        ra, fs0, ft10
                  fcvt.wu.s    s5, fa3, rtz
                  mulhu        t2, s10, s9
                  srli         s5, ra, 6
                  sll          s0, t5, t4
                  auipc        a5, 794170
                  andi         a1, t3, 1128
                  slli         gp, a0, 24
                  fclass.s     zero, fs1
                  slli         a7, t2, 31
                  fcvt.w.s     t3, fa3, rtz
                  mulhu        s11, s4, tp
                  sll          t6, s8, a3
                  sltiu        s8, tp, 1649
                  srai         sp, tp, 28
                  ori          gp, sp, 1262
                  sra          s11, t3, s4
                  sll          a0, t5, t6
                  fmin.s       fs8, ft1, fa7
                  fadd.s       fs5, fs8, ft4
                  rem          tp, t0, t0
                  mulh         t4, t3, s0
                  fdiv.s       fs4, ft9, fs6
                  divu         a0, tp, a4
                  divu         a2, ra, a2
                  fclass.s     s9, fs8
                  mul          a3, gp, a6
                  fmin.s       fs4, fs4, fs11
                  andi         a1, s0, 200
                  andi         t4, a7, 1746
                  and          t5, zero, a7
                  xor          t4, a7, ra
                  or           t0, s9, s3
                  srai         sp, a5, 7
                  fclass.s     t5, ft7
                  xor          s9, s2, s2
                  xor          t2, t5, tp
                  fmax.s       ft9, fs7, ft4
                  fcvt.wu.s    t6, fs1
                  flt.s        t0, fs8, fs8
                  sub          t2, s4, s2
                  slli         a2, s8, 23
                  fcvt.wu.s    t2, fa3, rtz
                  xor          t3, s8, s8
                  slti         s3, s9, -1429
                  fmax.s       fs2, fs6, fs7
                  sltiu        s8, s10, -1356
                  fmv.w.x      fa1, ra
                  andi         s2, s6, -238
                  fmax.s       fs6, fs7, ft3
                  fsgnjn.s     fs10, fa0, ft1
                  nop
                  mulhu        ra, a0, a2
                  sltiu        s7, tp, -1805
                  sub          a0, sp, s11
                  xor          s0, s2, t2
                  lui          a2, 6420
                  mul          t4, s4, t4
                  srli         s9, ra, 31
                  fadd.s       ft11, fs8, fa5, rtz
                  fdiv.s       fs8, ft9, fa5, rdn
                  lui          zero, 724465
                  and          a5, s7, gp
                  div          a3, zero, s7
                  fcvt.wu.s    t2, fs3, rne
                  fclass.s     t5, ft0
                  sll          t3, a2, sp
                  fsgnjn.s     fa7, ft5, fs6
                  mul          s2, s3, s1
                  div          a2, a3, a7
                  divu         gp, s4, a1
                  fmul.s       ft11, ft10, fa1
                  xori         zero, s9, -1331
                  srai         t3, gp, 5
                  rem          s0, t6, a4
                  sltiu        s6, s11, -144
                  fmin.s       ft10, fa1, fa2
                  mulh         a3, t5, t0
                  sltu         zero, t6, s1
                  mul          a2, ra, s4
                  xori         t2, s9, 1901
                  sub          s10, s0, s1
                  fclass.s     a3, fs0
                  andi         t2, s8, -479
                  sltiu        zero, t1, 872
                  addi         t4, t3, -1028
                  fmax.s       fa7, fs9, fs8
                  fle.s        zero, fs0, fa1
                  flt.s        a1, ft3, fa0
                  sll          t3, a5, s4
                  auipc        s0, 1016078
                  fdiv.s       ft2, fs7, fs7, rmm
                  fcvt.w.s     s2, fs4
                  srli         s2, a4, 14
                  nop
                  or           a2, t4, a7
                  srl          s10, s4, t6
                  fsgnjn.s     fa7, ft6, ft1
                  add          s3, a0, s5
                  slli         t0, s4, 14
                  mulh         s7, a3, a4
                  add          s9, a2, t6
                  fsgnjx.s     fs8, fs11, fs10
                  sub          s9, a7, a6
                  fdiv.s       fs11, fa6, ft5, rtz
                  slt          s3, a0, sp
                  srai         sp, a4, 10
                  or           s11, a3, t1
                  mulhu        s5, a0, s0
                  fsgnjx.s     fa5, fs1, fs6
                  fcvt.wu.s    s9, fa7
                  auipc        s6, 80855
                  sra          s8, tp, tp
                  flt.s        s10, fs2, ft6
                  fmul.s       ft7, fs11, fs6
                  fsgnjx.s     ft1, ft10, fs11
                  addi         a5, s10, 1614
                  slti         a7, a6, 95
                  nop
                  fcvt.s.wu    fa2, s9
                  fsub.s       fs10, fs8, ft0
                  sll          ra, a2, s7
                  addi         ra, s6, -81
                  auipc        t4, 143245
                  add          s11, a4, zero
                  sll          t4, s4, t5
                  mulhu        t1, gp, s4
                  fmin.s       fs11, ft5, fs11
                  srai         s10, s3, 6
                  fcvt.s.w     ft2, a1, rtz
                  srli         t6, tp, 23
                  fmax.s       fs2, fs8, ft5
                  fsqrt.s      fa1, fs11, rtz
                  fsgnj.s      fa5, fa7, ft6
                  fle.s        s7, fs10, ft11
                  fsqrt.s      ft1, fa6
                  fmv.w.x      fa0, t4
                  srli         a3, t6, 12
                  fcvt.s.w     fs0, t1, rtz
                  srai         t2, a0, 19
                  fcvt.s.w     fs7, s4
                  fcvt.w.s     a5, ft11, rtz
                  andi         a5, ra, 1170
                  fmv.w.x      ft0, t4
                  fmax.s       ft2, ft6, fs9
                  fmul.s       ft1, fa6, fs10, rtz
                  fsgnjx.s     ft0, fs8, fs10
                  sub          s2, a1, a2
                  lui          a3, 541988
                  rem          t4, a3, s0
                  and          t1, s4, s11
                  add          t6, a2, a7
                  fsgnjx.s     fs5, fa4, fs4
                  fmv.w.x      fs4, s3
                  fsgnjn.s     fs5, fa0, ft10
                  fsgnjn.s     fs3, fs2, fs3
                  srai         a3, sp, 30
                  remu         t6, t0, ra
                  div          a2, t3, t6
                  rem          s9, t6, s11
                  fsgnjx.s     fa6, fa2, fs2
                  ori          s7, s9, 624
                  xor          a0, t0, s5
                  fclass.s     t0, ft11
                  fsub.s       fs11, ft0, fs9
                  addi         s5, s7, 346
                  srl          tp, s6, a5
                  div          s1, s4, a0
                  mul          s3, a7, a7
                  fmul.s       fa0, fs0, fs9, rne
                  and          s8, t5, a2
                  fsgnjx.s     fs10, fa6, ft0
                  fcvt.s.wu    fs8, s5, rdn
                  or           s0, s0, t3
                  fcvt.wu.s    s11, fa5
                  fsgnj.s      ft5, ft1, fa6
                  fsqrt.s      fs1, ft2, rne
                  fmul.s       fa2, ft0, fs2, rtz
                  fle.s        t3, ft6, fs4
                  fle.s        a2, ft7, fs1
                  fcvt.w.s     gp, fa1, rdn
                  sltu         s11, t1, s2
                  mul          a3, t3, s9
                  srli         s6, s8, 15
                  flt.s        s3, ft8, fs6
                  remu         s0, s10, t5
                  fmul.s       fs1, fa1, fs3
                  slli         a1, a6, 26
                  fadd.s       fs2, fs5, fs8
                  fsub.s       fa3, ft6, fa4, rtz
                  sltu         t4, s8, s10
                  feq.s        sp, fs2, ft5
                  fmin.s       fs6, ft7, ft3
                  fsgnj.s      fa3, fs7, fs5
                  fmul.s       ft5, ft10, fs6, rtz
                  div          a1, s11, ra
                  or           t3, a5, s3
                  lui          sp, 35301
                  fle.s        a2, fs11, ft0
                  fsqrt.s      ft0, fs8
                  slli         a2, t2, 18
                  lui          s7, 838619
                  fsub.s       ft5, fa2, ft4
                  remu         a5, s5, tp
                  div          s0, a0, zero
                  fclass.s     a0, fs5
                  fsub.s       ft3, ft6, fa0, rmm
                  fcvt.s.wu    ft5, t5
                  fsub.s       fs10, ft5, fa5
                  sll          t0, gp, t3
                  fadd.s       ft2, fs9, fs7, rup
                  fsub.s       ft6, fs3, fa7, rdn
                  sll          s9, t5, sp
                  rem          s9, s10, t5
                  or           s11, gp, ra
                  fmul.s       fa1, fs2, fs7, rmm
                  sll          gp, s2, s9
                  fdiv.s       ft8, ft2, fa4
                  fmin.s       fs8, ft11, fa6
                  fmax.s       fs0, fa4, ft8
                  mulhu        a5, zero, t3
                  xor          t3, t4, tp
                  fclass.s     t5, fs1
                  srai         s8, s3, 25
                  div          t1, a4, s5
                  fcvt.s.wu    ft10, t4, rtz
                  fcvt.wu.s    t4, fs0
                  ori          s1, t5, -1528
                  feq.s        s10, ft0, fa5
                  fsub.s       ft6, fa3, fs4, rmm
                  divu         a1, a6, a7
                  fcvt.s.wu    fs8, a5, rdn
                  fmax.s       ft10, ft10, fs7
                  auipc        a5, 960347
                  sltu         zero, s1, a4
                  addi         s2, a0, 826
                  andi         tp, zero, 1902
                  or           gp, s6, tp
                  fsub.s       ft4, fa1, ft0, rne
                  fmv.w.x      fs9, zero
                  ori          a1, zero, -471
                  fle.s        t3, fa1, fa6
                  and          a7, s10, t5
                  fmv.w.x      fs1, a2
                  auipc        s9, 1046837
                  sub          sp, sp, zero
                  mulhsu       a3, t1, zero
                  flt.s        tp, fs4, fs8
                  lui          a7, 548992
                  fsgnjn.s     ft5, fs2, ft5
                  fsgnjn.s     fs3, fs3, fa3
                  fcvt.s.w     ft0, tp
                  fmin.s       fs1, fs11, ft6
                  fcvt.s.wu    fa3, a6
                  fcvt.wu.s    s7, fs1, rne
                  fsgnj.s      ft10, fa6, fs4
                  slt          zero, tp, t4
                  add          ra, s8, a3
                  sll          sp, s7, s11
                  fclass.s     s9, ft6
                  fadd.s       fs6, ft6, fs1
                  fmul.s       fs6, fa7, ft4, rdn
                  fclass.s     a0, fa1
                  fmv.w.x      ft1, s7
                  remu         t6, sp, s4
                  slli         s0, a0, 27
                  mulhsu       a3, s8, s10
                  remu         s1, s4, s2
                  divu         sp, s7, s0
                  nop
                  sub          ra, a1, sp
                  mulh         s6, s2, t4
                  fsgnjn.s     ft11, fs1, fs0
                  fle.s        t3, fs4, fa1
                  fsgnjn.s     ft11, fs5, ft7
                  sll          t2, t6, s1
                  sltu         s2, a3, a0
                  and          gp, s5, s7
                  xor          s7, t2, gp
                  sltiu        a7, s0, 852
                  slti         s3, s2, 682
                  sub          s5, s11, t4
                  srl          s7, s5, a1
                  nop
                  nop
                  mulhu        a0, s7, zero
                  fsgnj.s      fs9, fs2, fa7
                  rem          s2, a4, zero
                  and          s5, s3, s7
                  mulhsu       s2, a5, s11
                  mulh         t4, a6, zero
                  fsub.s       ft2, fa0, fs10, rup
                  fsgnjx.s     fa4, fs9, fs3
                  xori         t0, s3, -691
                  srl          t0, a5, tp
                  sltu         s8, t3, s2
                  fsgnj.s      fs3, ft5, ft1
                  sltu         a0, ra, s11
                  srli         zero, a2, 9
                  divu         zero, ra, a4
                  fsqrt.s      ft9, fs11
                  fsqrt.s      fs10, ft0, rtz
                  fdiv.s       ft11, fs9, fs9, rne
                  slli         gp, s8, 24
                  add          a2, t0, s8
                  fmin.s       ft11, fa5, fa5
                  sltiu        gp, a5, -460
                  mulhsu       t4, s1, zero
                  fmul.s       ft5, fa0, ft0
                  and          t3, s1, sp
                  or           zero, s11, a7
                  fdiv.s       fs5, fs5, ft1
                  fmin.s       fs1, ft5, ft3
                  or           gp, s1, tp
                  slt          s8, zero, ra
                  slt          s7, t4, a6
                  and          s0, sp, a7
                  fmin.s       fs8, fa4, fs0
                  or           t6, a1, t1
                  auipc        s8, 410211
                  divu         a0, s4, s6
                  feq.s        s8, fs6, ft5
                  mulh         gp, s8, s8
                  div          s11, t6, t3
                  divu         t1, ra, a4
                  fmax.s       ft10, fs0, fa4
                  fadd.s       fs4, ft5, fa5, rup
                  fcvt.s.wu    ft6, s1, rtz
                  slt          s5, t5, a1
                  fcvt.s.w     fs6, s6, rtz
                  fsgnj.s      fs2, ft0, ft9
                  sltiu        gp, s11, -1730
                  srli         s7, gp, 24
                  andi         a3, s1, 544
                  feq.s        t1, fs0, fs5
                  fmul.s       ft7, ft9, ft3, rmm
                  xor          t0, s2, s7
                  fcvt.wu.s    gp, ft3, rtz
                  fmv.w.x      fa5, a2
                  slli         t5, a5, 17
                  mulh         tp, s8, sp
                  or           t6, s10, s2
                  ori          t2, a4, 1918
                  fmax.s       fs9, fs11, ft1
                  fle.s        s1, ft4, fs4
                  xori         s2, s9, 417
                  sll          a5, a7, t5
                  xori         a2, a7, 923
                  fclass.s     s7, fs11
                  add          t6, a4, t3
                  fcvt.s.w     fs6, s2, rup
                  fadd.s       ft0, fs6, fs11
                  mulhu        tp, t6, a7
                  slti         s0, s10, -2033
                  andi         s9, a5, -518
                  fcvt.wu.s    t2, fs7
                  remu         t1, s3, a4
                  sll          a2, s5, s0
                  auipc        s5, 313979
                  fsgnjx.s     ft5, ft0, ft11
                  fcvt.s.wu    fs8, s8, rmm
                  nop
                  sub          tp, s10, a3
                  mulh         t6, a1, tp
                  auipc        s10, 611929
                  ori          s3, a0, 753
                  fmv.x.w      t6, ft8
                  fmul.s       fs7, ft2, fs2, rdn
                  fsqrt.s      fs10, fa6
                  sltu         t1, a4, t4
                  div          tp, s9, t6
                  addi         tp, s9, 760
                  sltiu        a7, t1, -1694
                  ori          a7, s0, 1472
                  mulh         s1, s11, ra
                  fdiv.s       ft8, fa7, fs10, rdn
                  srli         s10, t2, 0
                  mulh         s1, zero, s9
                  fclass.s     s10, ft11
                  addi         s5, a1, -919
                  or           t0, a2, zero
                  xor          s9, s5, s9
                  srl          s0, a0, a3
                  slti         a2, s6, 2029
                  divu         zero, t0, s1
                  slt          s6, a1, zero
                  remu         t2, t6, tp
                  xor          s5, gp, s11
                  auipc        a1, 735077
                  fcvt.s.w     fs9, s2
                  fcvt.s.w     fa7, a5
                  sll          s5, s10, tp
                  sll          s9, ra, tp
                  slt          t1, a1, s4
                  addi         s7, s9, 152
                  sltiu        gp, tp, -1831
                  fmul.s       ft2, fa7, fs6, rdn
                  fsgnjn.s     ft4, ft10, ft9
                  fadd.s       ft10, fs5, ft10, rmm
                  fcvt.w.s     t1, fs1
                  feq.s        t4, fs7, fs2
                  fcvt.w.s     t1, fs11, rtz
                  div          tp, gp, s1
                  sltu         s6, s9, t6
                  sra          ra, tp, a4
                  fsgnjx.s     fa7, fs1, fa2
                  andi         a3, a3, 1117
                  lui          s3, 933977
                  fcvt.s.wu    fs6, t4, rmm
                  fcvt.w.s     gp, ft1
                  sll          gp, s10, tp
                  add          a1, s5, t2
                  slti         s8, t4, -1621
                  sltu         s10, a4, s2
                  rem          t5, tp, s9
                  fdiv.s       fa3, ft4, fs5
                  fle.s        s8, ft1, ft8
                  fmul.s       ft6, ft5, ft1
                  srai         sp, s6, 0
                  div          s1, a7, t4
                  nop
                  addi         s0, s8, -1705
                  or           t0, s1, a2
                  mulhsu       sp, t0, s0
                  fcvt.wu.s    a2, fa4, rtz
                  remu         t1, t6, s9
                  fcvt.s.w     fa0, ra
                  addi         tp, t0, 1748
                  sub          t1, a2, a4
                  mulh         s6, gp, a3
                  auipc        a5, 668552
                  mul          t1, s3, s10
                  mul          s10, s7, s6
                  fcvt.s.wu    ft5, sp, rtz
                  fsgnjn.s     ft8, ft1, ft9
                  rem          s9, a4, t4
                  flt.s        t5, fa7, fs8
                  mul          s8, a5, s11
                  sra          zero, t0, gp
                  and          t5, a0, gp
                  fadd.s       fs4, fa4, fs5, rne
                  fcvt.s.w     fs4, t3, rtz
                  add          s3, t4, s1
                  lui          t3, 716037
                  fmax.s       fs5, ft5, ft9
                  fcvt.s.wu    ft5, s1, rtz
                  fsgnjn.s     fs9, fs3, fs1
                  mulhsu       a3, s7, a0
                  fsgnj.s      fs3, fs5, fa6
                  fmv.w.x      ft3, s0
                  fmin.s       ft6, ft6, fa6
                  fmv.x.w      t4, fs10
                  andi         a7, zero, 125
                  sub          gp, t2, s11
                  add          s8, t1, a2
                  or           a1, s3, t2
                  fdiv.s       ft4, ft6, fa3
                  fcvt.s.wu    fs2, t4, rne
                  flt.s        t3, ft10, fs11
                  fsgnjx.s     fa3, fs0, fa0
                  fmul.s       fa7, fa2, fs2, rtz
                  div          t3, a1, a5
                  divu         s11, s6, s5
                  div          a3, a7, t2
                  fmax.s       ft7, fs0, fa1
                  fsqrt.s      fa0, ft3, rne
                  fsgnjn.s     ft2, fs4, fs7
                  sltiu        a2, a4, -408
                  srl          zero, ra, s10
                  fmin.s       fs7, fa4, ft10
                  xor          a2, a3, s10
                  divu         s10, s9, t1
                  mul          gp, sp, t6
                  fsub.s       fa2, fs5, ft7
                  divu         a2, zero, s0
                  nop
                  fmv.x.w      a1, fa5
                  fsqrt.s      fa0, ft2, rne
                  fcvt.s.wu    fa2, tp, rtz
                  sub          sp, a1, a3
                  fcvt.s.w     fa5, t3, rmm
                  mulh         a5, a7, t2
                  srl          tp, a6, gp
                  fmv.w.x      ft9, a6
                  rem          sp, s9, a2
                  nop
                  mulhsu       a7, s6, s10
                  fsgnj.s      fa3, fs6, ft6
                  fle.s        t0, fs5, fs11
                  fsub.s       ft7, fs11, fs9, rtz
                  mulh         a3, s11, a3
                  and          s3, a2, t1
                  sub          t4, a0, a4
                  slti         s9, t1, -554
                  fmin.s       ft1, fs11, fs3
                  sltu         t6, zero, a7
                  sltiu        a1, s0, -167
                  fadd.s       fs0, fa6, fs4, rup
                  feq.s        t1, ft0, ft10
                  auipc        a3, 616585
                  fsub.s       fs6, fs11, fa3
                  fcvt.s.w     ft4, s6
                  fadd.s       ft9, ft11, ft2, rdn
                  fcvt.s.w     ft10, a6, rtz
                  fcvt.s.wu    ft0, t2, rdn
                  slti         t1, s7, -1138
                  and          zero, zero, a0
                  fle.s        t5, ft3, fa2
                  mulhsu       ra, s6, ra
                  fmv.w.x      fs2, s6
                  fdiv.s       ft2, fs10, fs9
                  mulhsu       zero, s9, t4
                  fsgnjn.s     fa5, fa4, fs2
                  srli         t2, t4, 0
                  fmin.s       fs1, fa7, fs1
                  fle.s        s11, ft7, fa3
                  add          s3, s10, a1
                  srli         ra, tp, 12
                  fmv.w.x      ft2, s6
                  mulhu        s5, s8, s3
                  lui          t3, 944383
                  slt          t2, a6, a3
                  sub          s3, a4, a1
                  remu         t6, gp, s10
                  xori         s1, s10, 356
                  fclass.s     gp, fs1
                  fdiv.s       fs0, ft2, ft6
                  fmax.s       fa2, fs11, fa4
                  andi         s9, a1, -1508
                  divu         s1, t4, s11
                  fcvt.s.wu    fs4, s10
                  mulh         a7, a0, tp
                  sub          a2, ra, s0
                  srai         t1, a6, 24
                  sra          t3, s0, a2
                  and          t5, s1, s6
                  fdiv.s       fa1, ft5, ft8
                  fmax.s       fa2, fs10, ft10
                  feq.s        a2, fa7, fa3
                  div          gp, s11, s1
                  and          t0, s10, s10
                  addi         s6, a7, 1351
                  fmv.w.x      fs5, gp
                  srli         t3, t4, 27
                  xori         t6, s6, -1733
                  fsgnjn.s     fa7, fa2, fa5
                  slti         a0, s5, -649
                  fsgnjx.s     fs1, fs1, ft9
                  addi         a2, t3, -1683
                  rem          gp, a4, s1
                  sub          a5, s0, s2
                  add          s10, s10, t0
                  fmax.s       ft0, ft11, fs8
                  and          s11, s6, s11
                  divu         s6, s11, s6
                  mulhsu       t3, t0, a5
                  remu         s6, s0, t2
                  fdiv.s       fa0, fs0, ft8, rmm
                  sltiu        a1, s1, -613
                  ori          a0, s9, -334
                  divu         s8, s6, tp
                  mul          s7, t3, s8
                  nop
                  divu         tp, s11, s2
                  nop
                  ori          gp, t1, -342
                  fsgnj.s      fs10, ft5, fs10
                  div          s3, s5, a5
                  fsgnjn.s     fa4, fa6, fs4
                  mulh         s10, sp, t4
                  fcvt.s.wu    fs5, t1, rne
                  rem          a7, s8, a1
                  fmin.s       fa1, fs1, ft3
                  rem          t5, t4, a6
                  div          a3, a7, s8
                  fclass.s     s10, ft11
                  div          a2, a7, zero
                  fmul.s       ft7, fa6, fa7
                  mul          s3, a7, a6
                  fclass.s     s0, fa4
                  remu         s9, a6, s3
                  sub          s7, t4, s8
                  srl          gp, t3, gp
                  fadd.s       fs7, ft11, ft7
                  fle.s        t3, fa1, fa2
                  srl          t0, t2, s9
                  slti         s1, ra, -277
                  fmax.s       fa4, fs9, ft2
                  fmv.w.x      fs10, a2
                  fmin.s       fa2, ft6, fa4
                  rem          s2, a6, a5
                  add          t5, a0, s10
                  ori          a0, gp, 987
                  addi         a3, t0, 60
                  lui          a0, 1007018
                  fmv.w.x      fa5, s9
                  fsgnj.s      ft1, fs9, fs5
                  fmax.s       fs8, fs10, fs2
                  auipc        sp, 961881
                  fdiv.s       fs4, fa5, ft11
                  slti         a7, s11, -1595
                  fcvt.w.s     a7, fs4
                  sll          sp, a4, s3
                  fsub.s       fs9, fs9, fs4, rdn
                  slti         gp, s7, -1323
                  fsgnj.s      fs2, ft10, ft4
                  auipc        a5, 398203
                  fmul.s       ft11, fs0, ft2
                  fle.s        a7, fa5, ft10
                  ori          t3, sp, 1805
                  mulh         s10, s7, zero
                  div          t0, t1, a6
                  fcvt.wu.s    a5, fs1, rdn
                  add          sp, s5, ra
                  xori         tp, a6, -1578
                  auipc        sp, 106693
                  mul          s8, a4, a4
                  addi         gp, a3, -1493
                  lui          a1, 896624
                  and          s8, ra, a0
                  fadd.s       ft8, fa5, fs6, rtz
                  div          sp, a1, s5
                  andi         ra, s3, 838
                  fadd.s       ft3, fs7, fs1, rmm
                  fdiv.s       fs5, fa3, fa7, rup
                  srai         s7, t2, 5
                  fsqrt.s      ft7, ft8
                  ori          s2, a7, -1473
                  fcvt.s.wu    fa1, t3, rne
                  srai         t1, t6, 27
                  fsqrt.s      ft10, fa7
                  rem          s8, t4, s5
                  feq.s        a0, fa6, fa6
                  xori         s10, t2, -1899
                  fcvt.w.s     s5, ft8, rdn
                  feq.s        a3, ft0, ft4
                  sltu         s1, s11, t6
                  divu         s8, a6, zero
                  fcvt.wu.s    zero, fa6
                  nop
                  fmv.x.w      s0, fs2
                  slt          t6, s10, t4
                  auipc        ra, 7302
                  fcvt.s.w     fa4, a1, rup
                  divu         s5, t0, t4
                  fsub.s       ft7, fa5, fa7
                  fsqrt.s      fa6, fs3, rtz
                  feq.s        s7, fs10, ft9
                  feq.s        t3, ft5, fa4
                  fmax.s       fa0, ft1, fs7
                  fsqrt.s      ft0, fs6, rup
                  div          t5, sp, tp
                  slt          a5, s3, s10
                  auipc        s1, 164491
                  fcvt.s.wu    fs2, s5
                  mulh         a0, t5, a0
                  fsgnj.s      fs1, fs9, fa5
                  add          a2, s9, a2
                  fclass.s     tp, fs1
                  mul          s1, s10, a3
                  mul          s9, tp, s0
                  sub          a3, t4, a2
                  sra          s9, gp, t6
                  andi         s5, zero, -868
                  nop
                  fmax.s       fa0, ft10, ft8
                  fadd.s       fa2, ft0, fs3
                  srai         s10, s8, 22
                  div          a2, sp, t2
                  xor          a1, zero, a1
                  fsgnjn.s     fs10, fs6, ft0
                  fsgnjn.s     ft11, fa5, ft7
                  addi         t4, a5, 866
                  fsqrt.s      fs11, fs6
                  fsgnjx.s     fs9, ft7, fs3
                  fcvt.w.s     t2, fs3
                  div          t0, a4, t4
                  ori          tp, s3, -787
                  fcvt.wu.s    a3, ft0, rdn
                  sltiu        tp, s11, 1117
                  flt.s        a2, ft2, fa4
                  auipc        tp, 873905
                  xori         a3, a3, -319
                  fmv.w.x      ft2, t1
                  slli         zero, s7, 2
                  flt.s        t4, fs11, ft1
                  mulhu        s7, s7, a5
                  fcvt.w.s     s0, ft1, rne
                  fcvt.s.w     fa3, t5, rne
                  divu         s5, t4, a7
                  sltiu        zero, zero, 185
                  fle.s        gp, ft5, fs11
                  nop
                  feq.s        ra, fa3, ft3
                  fcvt.s.wu    ft8, gp
                  lui          a1, 987115
                  or           s10, s9, t6
                  sltu         t6, t3, a7
                  fcvt.s.w     fs0, s0
                  mulhu        zero, s6, a2
                  rem          sp, s2, t2
                  mulh         a7, s9, t5
                  fcvt.s.w     fa4, s7
                  fmv.x.w      ra, fa2
                  sll          sp, t3, a4
                  mulh         t5, s8, sp
                  fmul.s       fs11, fs4, ft9
                  fmv.x.w      zero, fs10
                  fcvt.w.s     s5, fa1, rdn
                  sltu         ra, a1, s2
                  fcvt.w.s     s0, fa7, rdn
                  ori          a3, a0, 1565
                  sra          s10, sp, s7
                  sll          s2, t1, a3
                  fle.s        t4, ft4, fa2
                  mulhu        t3, a3, t5
                  fcvt.s.w     fs6, t6
                  srli         s0, t6, 10
                  fmv.x.w      gp, fs6
                  sltu         t4, s3, s11
                  sub          t2, s8, a2
                  fcvt.wu.s    s11, fs1, rup
                  fmv.w.x      fa6, s7
                  divu         s0, zero, s4
                  fle.s        a2, fs1, ft5
                  srl          s9, t0, a3
                  auipc        t2, 41803
                  fle.s        s7, ft2, ft7
                  mul          s9, s10, a7
                  xori         s9, s5, 484
                  xori         sp, ra, 840
                  xor          s1, s7, s11
                  fsgnjn.s     fs7, ft3, ft11
                  srli         a7, a0, 15
                  and          a7, s4, t0
                  mul          s7, a4, s2
                  xor          t3, s7, t0
                  fcvt.s.w     fs10, s11, rtz
                  srai         s3, a5, 12
                  add          s5, a0, t4
                  nop
                  srl          a1, a7, tp
                  srl          s6, a4, a0
                  andi         a1, a1, 693
                  fcvt.w.s     a2, ft1, rtz
                  mul          t4, s4, tp
                  mul          sp, a5, s8
                  andi         s2, s11, -1495
                  sltiu        s7, s4, 1393
                  fmul.s       fa3, ft2, fs3, rdn
                  xor          a5, a2, s0
                  fdiv.s       fs1, ft2, ft2, rne
                  div          t5, t4, s4
                  feq.s        s0, fs7, ft11
                  fcvt.wu.s    sp, fs11, rmm
                  fclass.s     zero, ft8
                  sltiu        s10, s6, -133
                  srl          s9, t2, t1
                  sll          gp, sp, s9
                  xor          s3, s7, s7
                  andi         t4, a0, 1248
                  slt          t3, t4, t0
                  srl          s0, sp, a3
                  srl          t0, gp, tp
                  fsgnjn.s     ft2, fs9, ft11
                  slli         s5, t2, 6
                  sltu         s9, s1, s4
                  fdiv.s       fs6, fs4, fs8
                  sra          s2, s9, a3
                  fcvt.s.w     ft3, t4, rdn
                  srl          a0, s11, s4
                  lui          tp, 758875
                  addi         sp, t0, -1871
                  srli         s3, gp, 26
                  fdiv.s       ft9, fa2, fs4
                  fsqrt.s      fs7, ft5, rdn
                  sltu         t2, a2, s5
                  fmul.s       ft9, fs10, fa5, rup
                  srli         a7, a1, 11
                  fdiv.s       fa4, ft9, fa1, rmm
                  lui          s5, 573425
                  add          zero, s11, a6
                  mul          s9, gp, s4
                  nop
                  fcvt.s.wu    fa2, s1
                  slt          a7, s3, s8
                  xori         t4, a5, 1863
                  fdiv.s       fs2, ft0, fa1, rmm
                  sltiu        zero, t5, 2020
                  auipc        tp, 431463
                  fcvt.s.wu    ft11, s3, rup
                  srl          a7, s1, a4
                  xor          t0, s9, sp
                  div          ra, s2, s5
                  mul          s7, t0, a2
                  fcvt.s.w     fs3, a1
                  divu         sp, ra, t6
                  fsub.s       fs4, fs7, fs0
                  mul          a2, a4, t5
                  fmv.w.x      fs10, s7
                  lui          s9, 604740
                  rem          gp, s5, s8
                  and          sp, a3, a1
                  slt          t0, a3, s2
                  sra          s3, tp, a1
                  fle.s        t3, fa4, ft4
                  andi         a7, a4, -833
                  sra          a5, s1, s4
                  slli         s7, a5, 28
                  fmv.w.x      fa0, t0
                  fdiv.s       ft3, fs4, fs11, rtz
                  mulhu        t1, s1, sp
                  addi         t1, t3, -394
                  srli         a0, t6, 14
                  nop
                  xor          a2, t2, t6
                  or           a2, s11, s5
                  or           s3, zero, s11
                  fle.s        t2, fs11, fs8
                  fsgnj.s      ft10, fa3, ft6
                  fle.s        s7, fa6, fa5
                  srl          s8, s4, t1
                  fmul.s       ft2, ft7, fs11, rtz
                  srl          s6, t1, t5
                  add          a0, t1, ra
                  fcvt.s.wu    fs0, s4
                  feq.s        tp, fa3, ft10
                  fcvt.s.w     fa2, s2
                  divu         t2, s1, a2
                  or           s9, s0, t4
                  div          s8, s9, t6
                  slti         s3, s0, 869
                  fmul.s       fs5, ft4, fs5, rdn
                  fmin.s       fs1, ft2, fa6
                  add          s11, s3, t5
                  fcvt.s.w     fs1, a6, rmm
                  and          s5, s2, t0
                  fsgnj.s      fa1, ft7, fs2
                  fsgnjx.s     fs3, ft8, fs9
                  nop
                  slti         s1, s1, -1162
                  sra          a0, a0, t4
                  fsqrt.s      fa6, fs5
                  and          t6, s1, t4
                  sltu         a0, t0, s6
                  sltu         t0, s2, s5
                  slt          s8, t2, s6
                  rem          ra, s10, t6
                  sra          t5, zero, t2
                  fmul.s       fa5, ft0, ft7
                  fmv.w.x      fs5, s2
                  nop
                  rem          t6, tp, gp
                  fclass.s     s10, ft3
                  fmin.s       fs11, fa4, fa2
                  sll          a5, t2, s7
                  xor          a1, s0, s6
                  lui          t6, 653134
                  nop
                  xor          s11, zero, a7
                  mulh         a1, a5, zero
                  ori          t0, s11, 1311
                  sltiu        t0, a3, -458
                  xori         zero, s3, 1917
                  srl          a7, a0, gp
                  slt          a1, s6, a1
                  fmul.s       fa6, fa0, fa3
                  fclass.s     s1, fs6
                  fmv.w.x      ft6, a7
                  mulhu        s0, t1, s7
                  fmv.w.x      fs3, s8
                  div          s6, a2, t6
                  sll          s11, s7, a4
                  div          s0, s7, s1
                  fsgnj.s      fs5, fa4, fa3
                  fmul.s       ft11, ft11, fa2, rdn
                  fmin.s       ft8, ft0, fs4
                  slti         s1, t2, 1393
                  addi         s7, tp, 426
                  lui          ra, 613463
                  mulhsu       s8, t0, t6
                  srl          a7, t5, zero
                  ori          s11, a6, -681
                  srai         t5, a4, 1
                  fcvt.wu.s    s6, fs2, rne
                  fdiv.s       ft7, fs6, fs0
                  mul          a3, a3, s6
                  fclass.s     gp, fs3
                  fadd.s       fs7, fa2, fs2, rtz
                  slti         s9, s8, -214
                  srl          gp, gp, t3
                  srai         a5, zero, 12
                  srli         a3, s6, 30
                  fadd.s       ft10, ft4, fs7
                  fcvt.wu.s    a7, fs0
                  fmv.w.x      ft6, t3
                  andi         s2, s8, -942
                  slti         sp, s9, 833
                  divu         a7, a4, a5
                  fle.s        s0, fa0, ft5
                  fsgnjx.s     fs9, fs11, fs11
                  fsgnj.s      fa3, fa7, ft11
                  lui          s10, 195425
                  fcvt.s.w     fs11, sp, rdn
                  sltu         s9, s1, t6
                  fcvt.w.s     s3, ft4, rup
                  fmax.s       fs2, ft7, ft3
                  fcvt.s.w     fs11, ra, rtz
                  srli         t3, gp, 15
                  remu         s9, a3, s9
                  remu         s10, s9, gp
                  fdiv.s       fs4, ft11, ft11, rtz
                  fcvt.s.w     fa3, zero, rdn
                  flt.s        a7, fa2, fs4
                  fmv.w.x      fa3, s11
                  fsqrt.s      ft3, fs11, rtz
                  mulh         t1, a2, s7
                  divu         s9, a7, zero
                  sll          a0, s11, zero
                  fclass.s     t4, fs11
                  andi         a7, s0, -198
                  mulh         s3, s11, s4
                  slti         zero, t0, 916
                  lui          sp, 950025
                  sra          s10, s9, s6
                  fmv.x.w      t1, fs0
                  lui          t1, 948213
                  fsqrt.s      fa4, ft11
                  fsqrt.s      fa7, fs0, rne
                  sra          s6, s7, a0
                  xor          a3, s8, ra
                  addi         a1, t2, -1228
                  auipc        a3, 764153
                  fcvt.w.s     s7, fa5
                  sub          s8, t2, a2
                  fmv.w.x      ft7, ra
                  div          t2, s3, t6
                  slt          sp, t3, a2
                  add          s3, a6, a6
                  sll          t6, s4, s5
                  fcvt.s.w     fa7, s4, rne
                  fsgnjn.s     fs8, fa4, fs0
                  sltiu        a5, zero, -636
                  fmv.x.w      s9, fa3
                  fmv.x.w      s5, ft9
                  mulh         tp, t3, s7
                  fsqrt.s      ft6, fs8, rup
                  fmv.w.x      ft10, s9
                  fsub.s       fs2, fa5, ft8, rtz
                  fmv.x.w      a5, fs5
                  slti         a3, a2, -1824
                  fcvt.w.s     gp, fa2
                  div          s0, s5, a0
                  fmul.s       ft4, ft7, fa7, rup
                  fmv.w.x      ft9, s11
                  sub          a1, s8, t0
                  fcvt.wu.s    t0, fa7
                  xori         s7, s8, -1691
                  feq.s        s11, fa4, ft9
                  fcvt.s.wu    fs1, a1
                  and          tp, a3, a1
                  div          s6, t3, a4
                  fsgnjx.s     fa6, fa1, fs8
                  fsgnj.s      ft9, fs5, ft6
                  ori          s0, s3, -163
                  feq.s        s0, fs5, ft1
                  flt.s        s3, ft9, ft2
                  fcvt.s.w     fs9, tp, rne
                  slli         s6, a6, 14
                  divu         s7, s6, s9
                  slti         s8, s7, 1004
                  lui          s0, 614674
                  sltu         tp, a0, zero
                  fmax.s       ft4, fs2, ft2
                  xori         a1, t3, 113
                  fcvt.s.w     fs2, a7, rne
                  mulhsu       zero, s7, gp
                  fmin.s       fs3, fs10, ft2
                  sll          t1, a1, gp
                  fsgnj.s      fs3, fa2, fs9
                  fmin.s       fs1, ft2, ft1
                  fadd.s       fa4, fs8, ft10
                  ori          t0, s6, -270
                  lui          s10, 168137
                  add          s7, zero, s5
                  fsqrt.s      fs4, ft2, rdn
                  fsgnj.s      ft1, fs8, ft3
                  srl          sp, s7, zero
                  fcvt.w.s     a1, fa3
                  fsgnj.s      fa0, fs8, fs10
                  nop
                  auipc        a0, 268694
                  sra          s9, a4, a0
                  flt.s        t4, ft7, fa1
                  remu         s3, s0, s1
                  mulhu        tp, s7, s8
                  fadd.s       fs2, fs7, ft11, rtz
                  xori         s6, a3, 1211
                  andi         s10, s9, 385
                  feq.s        a5, ft0, ft6
                  srli         s3, sp, 9
                  xor          t6, s4, s10
                  fsqrt.s      fa0, fs9
                  remu         gp, t2, t4
                  fcvt.wu.s    sp, fs11
                  fdiv.s       fs4, fa2, fs4, rne
                  sltu         a2, s11, tp
                  fcvt.s.w     fa3, a7
                  fdiv.s       ft4, fs5, ft10, rup
                  divu         a0, a5, a7
                  fsgnj.s      fa5, ft9, fa2
                  mulh         s7, zero, s10
                  fmin.s       fs8, ft2, fa3
                  fsub.s       fs2, fa5, fa0
                  srai         gp, s9, 8
                  xor          tp, a0, s9
                  fcvt.wu.s    s9, ft3
                  remu         t4, a1, s0
                  lui          s9, 67822
                  flt.s        t5, fa1, fs8
                  srl          tp, zero, t3
                  remu         s10, a7, t5
                  fsgnjx.s     ft5, fa3, fa0
                  fcvt.s.w     fa7, t6, rdn
                  nop
                  fcvt.s.wu    ft3, t5, rdn
                  mulhsu       sp, sp, s2
                  rem          s7, s2, s1
                  fmv.x.w      s11, ft1
                  fmv.x.w      t6, ft3
                  fadd.s       fa4, fs10, fs5, rtz
                  fsub.s       ft6, ft10, fs10
                  nop
                  xor          s9, t6, s5
                  andi         s3, a3, -1684
                  remu         a5, a0, sp
                  fcvt.s.wu    fs0, s4
                  ori          t2, zero, -723
                  remu         t3, t2, t5
                  sltiu        s7, zero, 194
                  sll          t5, t3, s5
                  fsgnjn.s     ft4, fs11, ft10
                  rem          s3, s2, a7
                  auipc        a0, 649469
                  rem          t5, sp, t2
                  and          s5, a7, t2
                  sll          s11, gp, a4
                  mulh         s11, a0, s6
                  and          s10, s8, a2
                  sltiu        s7, t4, -278
                  sltiu        s0, t1, -292
                  div          a5, s10, t3
                  mul          a5, ra, s5
                  fmin.s       fs7, ft8, ft11
                  fle.s        s2, ft7, fs3
                  divu         s11, a3, s11
                  flt.s        s0, fs10, ft2
                  and          s0, tp, a4
                  srli         s7, a5, 27
                  lui          a0, 873380
                  feq.s        s3, ft5, ft1
                  andi         s5, s9, 419
                  mulhu        a5, a0, a2
                  addi         a1, s8, -2025
                  feq.s        t2, fa6, fa5
                  fsub.s       fs0, fs5, fa5
                  fsgnjx.s     ft4, ft1, ft2
                  srl          sp, a0, zero
                  sra          a3, a1, s9
                  srli         tp, sp, 2
                  fdiv.s       fa2, fa7, ft5
                  fadd.s       fa6, fa2, fs8
                  sltu         s8, a4, t0
                  fmin.s       fa2, ft9, ft5
                  divu         tp, tp, s11
                  srli         t2, t2, 27
                  fmax.s       fs3, fs11, fs1
                  slt          s0, t6, s6
                  sltiu        t2, s8, -986
                  sltiu        t3, s11, -1876
                  mulhu        s9, t6, t6
                  mul          t4, s9, s2
                  fdiv.s       ft10, ft0, fa1, rtz
                  fmul.s       fa7, ft4, fs10, rdn
                  slli         s9, s6, 17
                  slli         a1, a0, 4
                  ori          s6, t4, -352
                  slti         t6, a0, 1506
                  or           s2, zero, t3
                  sltu         s6, s8, a5
                  mulhsu       t4, t5, a3
                  fsub.s       fs10, fs0, ft0
                  srl          tp, s2, a4
                  slt          tp, s7, a2
                  fcvt.wu.s    t6, ft10
                  lui          s3, 359277
                  fmv.w.x      ft1, a1
                  sll          sp, s8, t1
                  sra          a5, t6, t6
                  div          t2, a2, s11
                  srai         s7, a3, 29
                  sltu         t5, t1, s9
                  fsqrt.s      ft6, fs9, rup
                  fcvt.w.s     a3, ft3, rmm
                  addi         t0, a4, -1173
                  mul          s7, ra, gp
                  mul          a5, sp, s7
                  fcvt.wu.s    t1, fs4
                  fcvt.wu.s    s10, fs3, rup
                  divu         t0, a2, s0
                  nop
                  andi         s6, t1, 1899
                  sltiu        t2, ra, -1528
                  and          t6, a7, t5
                  auipc        a2, 654039
                  xor          a3, gp, s6
                  mulhu        t6, t3, t6
                  fcvt.s.w     ft5, t5
                  fle.s        s11, fa3, ft5
                  auipc        a5, 302084
                  auipc        t6, 190518
                  fmax.s       ft2, fs9, fa3
                  fsgnjx.s     fa0, ft6, fs3
                  sub          t4, a2, a1
                  fmin.s       ft8, fs8, ft8
                  srai         t6, a4, 17
                  sltiu        t1, gp, 323
                  srl          ra, t5, s8
                  srl          sp, zero, gp
                  addi         s9, a3, 1272
                  auipc        s0, 790521
                  srai         t2, tp, 22
                  fmin.s       fs8, fs5, ft8
                  nop
                  fsgnjx.s     fa3, ft7, fa6
                  fcvt.wu.s    s11, fa7, rtz
                  addi         t4, s3, 1111
                  fmin.s       fa7, fs8, ft0
                  mulhsu       s7, s2, s8
                  fmax.s       fa0, fs1, fs1
                  and          a7, s4, a7
                  xor          tp, s1, a2
                  fdiv.s       fs1, fa1, fs7, rtz
                  mulhu        s11, t2, s1
                  flt.s        s2, fs9, fs7
                  sltiu        zero, s4, -1137
                  remu         zero, s11, t4
                  fcvt.wu.s    a5, ft10
                  fcvt.w.s     t3, fa0, rtz
                  xor          t2, a7, s11
                  fsub.s       fa3, ft8, fs9, rdn
                  nop
                  fmv.w.x      fs10, s8
                  slli         a5, a4, 13
                  addi         a7, a3, 485
                  fmin.s       fs8, fa7, fs9
                  mul          t4, s3, t3
                  mulhsu       a5, t3, s7
                  slli         gp, t4, 2
                  remu         a2, a3, a3
                  add          a3, a2, s0
                  fsgnjn.s     fs10, fa4, ft5
                  div          a3, zero, s11
                  sub          s10, s6, s3
                  divu         gp, s3, s3
                  fle.s        s3, ft9, ft9
                  slli         s2, t0, 15
                  xor          t2, gp, ra
                  slt          zero, a4, ra
                  fcvt.s.wu    fs2, s0
                  div          t3, a4, s2
                  fmax.s       ft11, fa0, fs11
                  div          a5, t3, a1
                  fcvt.s.w     ft2, s8, rmm
                  mulhu        t2, t0, a0
                  slt          a2, s10, s4
                  divu         t0, s7, s4
                  sub          s9, s6, a5
                  slti         a2, t3, -552
                  addi         s0, t6, 1291
                  sll          a0, t3, s11
                  srl          t2, s3, gp
                  sra          s1, t6, s0
                  and          a2, a2, s7
                  fcvt.s.wu    ft3, a1, rdn
                  feq.s        t5, fs8, ft9
                  divu         a3, a7, t0
                  fcvt.s.wu    fs5, a6, rmm
                  fsgnjn.s     fa7, fs5, fs1
                  divu         t1, s10, s8
                  srl          t1, s3, t6
                  slt          gp, t4, sp
                  mulhu        s5, t5, a1
                  auipc        a5, 844008
                  fsgnj.s      ft11, fa6, ft2
                  fsqrt.s      ft6, ft2
                  fcvt.wu.s    s10, fa4, rmm
                  add          t1, t2, t2
                  and          gp, a5, s7
                  mulhu        s5, t0, ra
                  srl          t1, a5, a5
                  andi         zero, a1, -1655
                  slt          tp, s0, s6
                  fsub.s       ft5, ft9, ft4
                  lui          a5, 815169
                  flt.s        s1, fa6, ft8
                  sltiu        a5, ra, 1344
                  sltiu        ra, s5, -1317
                  or           s11, t6, a3
                  or           s9, t0, a5
                  or           gp, s10, zero
                  xori         t5, t3, 1651
                  fcvt.s.w     ft2, s3, rtz
                  fsqrt.s      fs1, fs4
                  remu         sp, zero, t1
                  feq.s        zero, fs5, fs9
                  fadd.s       fa6, fs2, ft2, rdn
                  fsqrt.s      fs8, ft10, rup
                  lui          s9, 443337
                  sub          s7, tp, t0
                  srai         ra, a5, 27
                  fcvt.s.wu    fa6, t0, rtz
                  fadd.s       fa4, fs9, ft3, rdn
                  fmv.x.w      s3, fa4
                  fsgnjx.s     fa2, fs11, fa0
                  fadd.s       fs0, fa7, fs2
                  xori         zero, s5, -97
                  fmin.s       fs10, fa2, ft10
                  divu         tp, t6, t4
                  fmax.s       ft1, fs9, fs4
                  fsub.s       fa2, fs7, ft9
                  mulhu        t2, a0, s5
                  andi         t1, t5, 722
                  fcvt.s.w     ft0, a6
                  fadd.s       fs2, fa5, fs2
                  fmin.s       fa7, fs9, fa5
                  and          s5, a4, t1
                  slti         tp, s0, -1700
                  fmv.w.x      fs10, s5
                  flt.s        s2, fs6, ft10
                  sub          zero, t3, s4
                  ori          s6, s6, -922
                  fsgnj.s      fs2, ft7, ft7
                  fmv.w.x      ft5, s5
                  fsqrt.s      fs0, fs1
                  flt.s        s7, ft3, fs7
                  fmax.s       fa7, fa7, ft0
                  fdiv.s       fa1, fa0, fs10, rne
                  fmul.s       fa2, fa2, ft2
                  fsgnjx.s     ft1, fa2, fs4
                  auipc        t3, 204478
                  slt          t1, a5, t2
                  fsgnjn.s     fa6, fs3, fa6
                  fsub.s       fa0, ft1, fs7
                  fclass.s     a5, fa7
                  fcvt.s.wu    ft5, a6, rne
                  sll          gp, ra, t6
                  fclass.s     t6, ft8
                  rem          s7, s0, s0
                  fdiv.s       fa1, fs1, fs1
                  fsgnjx.s     ft4, ft9, ft6
                  xori         tp, t0, 1873
                  flt.s        t3, fa0, fs11
                  mul          t6, a2, a4
                  flt.s        t6, fa3, ft6
                  fcvt.w.s     a7, fs2
                  mulh         zero, t4, tp
                  rem          s3, a1, a2
                  feq.s        ra, ft5, fs3
                  mulhu        s7, tp, s2
                  andi         a3, a7, 711
                  lui          s3, 914405
                  fclass.s     s8, ft2
                  fcvt.w.s     t4, fa2
                  sra          a3, a7, a2
                  fsub.s       fa0, ft7, fa7
                  fcvt.s.w     fs10, sp, rtz
                  divu         a3, s6, a4
                  fsub.s       ft2, fs0, fs10, rup
                  divu         a5, a6, a2
                  fclass.s     gp, ft1
                  fadd.s       fa0, ft1, fs5
                  xori         t6, tp, 303
                  fle.s        gp, ft8, ft2
                  div          s11, a3, ra
                  fsgnjn.s     fa3, ft1, fa4
                  mul          a2, s11, s0
                  xori         t1, sp, -400
                  sltiu        t2, s10, -118
                  fclass.s     t2, ft4
                  fle.s        s6, fs5, fa5
                  mulh         s11, s6, s1
                  slt          s11, s2, s10
                  slt          s0, s9, a7
                  sltu         zero, s9, a4
                  mulh         s10, a5, t6
                  slli         t3, a6, 8
                  mulh         t4, s2, ra
                  sub          t2, t1, s7
                  or           t6, s0, a4
                  sltiu        t3, s5, -848
                  fmax.s       fs11, fa3, fa5
                  srai         a7, s5, 7
                  or           t6, t1, a2
                  remu         a5, a7, a3
                  fcvt.w.s     t6, fs9
                  sltiu        a0, t0, -1609
                  fclass.s     a1, fs8
                  flt.s        s7, fa7, fs0
                  andi         a3, t6, -1372
                  div          tp, s6, s2
                  fsqrt.s      ft8, ft8, rtz
                  addi         a2, s7, -1028
                  sll          a0, t0, t3
                  sra          t4, tp, zero
                  or           s6, ra, a0
                  sltiu        s10, s11, 223
                  srai         t5, gp, 27
                  slti         a0, s9, -676
                  fsgnjn.s     fa2, fs5, fa3
                  feq.s        t6, ft8, ft1
                  fcvt.wu.s    t2, ft10
                  fle.s        s9, ft2, ft1
                  fsub.s       ft8, fs11, fa6, rmm
                  add          s1, t2, s1
                  ori          s9, a3, 213
                  div          s2, s4, zero
                  fmax.s       ft10, fs5, ft7
                  slti         s9, zero, 338
                  fsgnjn.s     ft4, fa5, fs5
                  remu         a7, gp, s10
                  fmul.s       fs6, fs7, fa2
                  div          t0, t0, ra
                  nop
                  fdiv.s       fs8, ft8, ft1
                  fcvt.s.wu    fa5, a2, rmm
                  and          s2, ra, s7
                  remu         s8, a4, ra
                  xor          s6, a1, s2
                  slt          s2, s8, s6
                  fcvt.wu.s    a0, fs3, rdn
                  sub          t0, s4, ra
                  and          zero, t6, s4
                  xori         gp, a7, 1692
                  fcvt.wu.s    a3, fa7, rup
                  add          s11, s11, s4
                  fclass.s     s9, fs0
                  fdiv.s       ft9, fa3, fa3
                  flt.s        zero, fa2, fs9
                  fadd.s       fs2, fa1, fs10, rmm
                  fsgnjx.s     fa1, ft3, fs1
                  srli         s1, s9, 24
                  fdiv.s       ft7, ft9, fs4, rtz
                  fadd.s       ft8, fs3, fs8, rtz
                  and          a0, s9, a5
                  fadd.s       fs9, ft4, ft1, rtz
                  and          s1, a7, a2
                  fle.s        tp, fs2, fa1
                  div          t0, s0, a0
                  fcvt.wu.s    a7, fs8, rdn
                  fmv.w.x      fs2, s11
                  fmax.s       fs2, fa4, ft9
                  rem          a0, t0, gp
                  add          s8, s7, zero
                  fmax.s       ft11, fs3, fs9
                  add          ra, t6, tp
                  mulhsu       a2, t4, t1
                  fcvt.wu.s    a5, fs11
                  fsgnjx.s     fs2, ft4, fs3
                  addi         a7, s3, 152
                  fmul.s       fa6, fa1, ft5
                  fclass.s     a2, ft5
                  srli         a1, s0, 19
                  sra          t1, s8, s5
                  mul          zero, s1, gp
                  slti         s3, a0, 1411
                  fmv.w.x      fs7, sp
                  fcvt.w.s     a3, ft10, rdn
                  srli         a0, a3, 22
                  fmv.x.w      gp, ft2
                  fsqrt.s      fs7, fa6
                  remu         t5, t2, s7
                  mul          s7, s8, a5
                  fsub.s       ft0, fa6, fa5, rup
                  sll          t1, s1, s10
                  xor          s9, a5, s8
                  nop
                  fcvt.wu.s    sp, ft2
                  srai         s9, s2, 6
                  fsgnj.s      fa3, fa5, fs10
                  fsgnjx.s     fa6, ft1, fs5
                  fcvt.wu.s    s9, fa3
                  sub          t5, s7, tp
                  fadd.s       fa0, fs2, ft2, rne
                  and          ra, t1, s7
                  add          a3, s7, t3
                  mulhu        s2, t5, s9
                  fmax.s       ft0, fs10, ft7
                  fcvt.w.s     zero, fs8, rdn
                  mulh         zero, a6, a4
                  fcvt.wu.s    a1, ft5
                  fclass.s     s7, fs3
                  fcvt.s.w     ft10, s1, rtz
                  addi         t5, a7, -1572
                  add          tp, a6, s6
                  fsqrt.s      fa2, fs7, rmm
                  fmv.x.w      s8, fs0
                  flt.s        s7, ft3, fa7
                  ori          a3, s4, -1633
                  srli         t4, gp, 8
                  fsgnjx.s     fs2, fa7, fs2
                  sra          t0, t5, s11
                  fsgnj.s      fs10, fs2, fs10
                  sll          t6, t3, t2
                  mulh         s6, t5, a7
                  sll          t6, t0, t5
                  srl          a7, a7, a0
                  andi         s8, a5, -334
                  fsgnj.s      fs5, fs9, ft5
                  srli         s10, sp, 12
                  mulhu        t2, a5, a3
                  remu         s2, tp, s8
                  srai         t6, s1, 25
                  lui          s0, 607520
                  sll          s2, a3, s7
                  slli         a3, a7, 14
                  and          a7, a5, a3
                  sub          sp, t3, s8
                  sub          s0, ra, a1
                  fclass.s     t0, ft1
                  mulhu        t0, t1, s2
                  fclass.s     s6, ft8
                  fsqrt.s      fa6, fs6
                  slt          s5, a6, t1
                  or           zero, a0, t6
                  divu         s1, t0, a3
                  fcvt.s.wu    fs3, t5
                  srai         sp, zero, 1
                  srl          s7, s7, t2
                  fmv.x.w      a7, fs0
                  sltiu        s2, ra, 1024
                  fcvt.s.w     fa2, a3, rmm
                  fle.s        s8, fa4, fs7
                  mulhu        s6, s9, zero
                  fmv.w.x      fs3, sp
                  fadd.s       fs4, fs10, ft9
                  fmv.w.x      fa1, s11
                  fsub.s       fs11, fs1, fa0
                  mulhu        s7, t4, s10
                  fsgnjn.s     fa0, ft1, ft4
                  fsgnjx.s     fs2, fa1, ft11
                  xor          a7, s3, s3
                  mulhu        s2, a1, t0
                  fmax.s       fa7, fs4, ft3
                  fcvt.s.w     fs5, t0
                  fmin.s       fs5, ft2, ft8
                  sub          s7, t0, t1
                  fle.s        tp, fs9, ft10
                  xori         s1, t6, -1849
                  xori         a1, a6, 594
                  fsgnjn.s     fa3, fs0, fs6
                  fsgnjx.s     fs8, fa1, fa2
                  xor          s7, s10, t4
                  sltu         gp, s3, t0
                  fsub.s       fs2, fa2, ft5, rtz
                  divu         a3, t0, t2
                  addi         sp, s2, 622
                  flt.s        a0, fs5, ft1
                  sub          s2, gp, a4
                  slti         t2, s4, 752
                  fsgnj.s      fa3, ft1, ft1
                  mulhsu       s7, t1, gp
                  slli         gp, s3, 8
                  remu         s3, t6, s2
                  sltu         s6, t6, t2
                  srl          t5, a0, a6
                  srl          s2, a4, t4
                  divu         s11, s10, s6
                  fsqrt.s      fs2, ft3
                  fdiv.s       ft5, fs7, fa5
                  slti         a5, t1, -1783
                  mulhsu       a3, a6, s4
                  srl          a7, sp, s11
                  auipc        t6, 824549
                  add          a7, s11, a2
                  xori         s1, s2, 611
                  fmin.s       fs4, fs7, ft9
                  auipc        s7, 1008337
                  fclass.s     a5, fs4
                  mulhsu       a5, a7, tp
                  add          s8, t0, s8
                  xori         s10, t1, -1031
                  fmv.w.x      ft6, a2
                  fmv.x.w      s8, fs9
                  nop
                  fsgnj.s      fs8, ft6, fa2
                  remu         s7, s3, a1
                  fsgnjn.s     fs2, fs7, ft9
                  slt          s2, gp, t3
                  add          a3, s7, s2
                  mulh         t4, s3, s11
                  mulh         s11, s2, a5
                  remu         s6, t5, sp
                  fmax.s       ft6, ft4, ft9
                  sra          ra, s1, s4
                  mulhu        sp, s6, s1
                  flt.s        a3, fa4, fs7
                  fmul.s       ft11, fs1, fa2
                  fcvt.s.w     fs10, a2, rne
                  srl          s2, t3, sp
                  xori         zero, t0, 189
                  fle.s        s6, fs0, fs3
                  and          s7, a2, t3
                  sll          s7, s8, s10
                  divu         t4, s6, s3
                  addi         a0, a4, 379
                  mulh         t0, t6, a7
                  div          s6, t4, a7
                  andi         s1, s2, -1778
                  slti         a5, t2, 710
                  fcvt.s.w     fs9, s5
                  fcvt.w.s     zero, fs6
                  slti         ra, t4, -817
                  fcvt.w.s     tp, fs6, rmm
                  fsgnjn.s     fa7, fa3, fa3
                  lui          t5, 548904
                  lui          s5, 151946
                  mul          t3, s7, sp
                  feq.s        t3, fa7, fs7
                  fle.s        sp, fa4, fs8
                  flt.s        s9, ft9, fa0
                  fcvt.w.s     tp, fs7
                  mul          ra, tp, s11
                  sll          t5, a4, t1
                  sltiu        s0, s11, -507
                  mul          t0, t3, s4
                  add          s2, zero, s0
                  fle.s        t6, fs2, fs11
                  fle.s        s9, ft7, ft8
                  remu         a5, sp, s8
                  mulh         a0, s3, a1
                  fsqrt.s      ft4, fs9, rdn
                  slt          a7, s10, sp
                  fmin.s       fs4, ft9, ft8
                  and          ra, s7, a3
                  fsub.s       ft11, fs4, fs4, rup
                  mulhu        s3, s4, s9
                  fdiv.s       ft2, ft10, ft5, rup
                  fmin.s       fs3, fs6, ft8
                  sub          tp, a0, t4
                  mulh         sp, s6, t6
                  andi         s3, ra, -823
                  nop
                  fsgnjx.s     ft5, fa5, fa6
                  fdiv.s       ft9, ft10, ft5
                  fsgnj.s      ft3, ft8, fs6
                  sll          s7, tp, a4
                  srl          s10, sp, s0
                  xor          s5, s11, a6
                  mulh         t5, a7, t4
                  fmin.s       ft7, fs2, fs11
                  fmul.s       fa6, ft11, fa5, rup
                  fcvt.s.w     fs11, t6, rmm
                  divu         s11, zero, a4
                  andi         a3, s9, -856
                  andi         a5, s9, 1328
                  sltiu        t6, a6, -1160
                  fcvt.w.s     s7, fs4
                  sra          t6, t4, a1
                  srai         t4, ra, 10
                  andi         t0, s6, -1983
                  fsub.s       ft0, ft3, fs9
                  sltu         zero, a0, t2
                  fclass.s     s11, fa4
                  fcvt.s.w     ft1, s10, rdn
                  mulhsu       a3, s4, s4
                  auipc        s3, 538802
                  xori         sp, a1, -677
                  and          s0, s5, a1
                  mul          s9, t6, s6
                  divu         s3, t5, a4
                  srl          tp, tp, s9
                  fcvt.s.wu    fs10, t1, rtz
                  mulh         t3, s10, s6
                  fle.s        sp, fs11, fa1
                  mulhu        s2, s2, a2
                  srai         zero, a7, 24
                  fsgnjn.s     fs10, ft1, fs7
                  remu         ra, s5, s4
                  mulhsu       a2, t1, ra
                  add          a2, s6, t3
                  sltiu        s5, t0, 1033
                  mulhu        t3, a4, zero
                  fmax.s       ft1, ft4, fa5
                  fsub.s       fa7, ft1, fa1
                  or           s8, s6, t1
                  srai         gp, s0, 1
                  divu         zero, s4, s9
                  slti         a5, zero, -1730
                  flt.s        t6, fs10, ft1
                  fcvt.w.s     ra, fs8
                  srl          s11, zero, a2
                  fclass.s     s3, fs1
                  add          s8, s10, a2
                  remu         t1, t6, ra
                  addi         s10, s8, -345
                  sll          t4, zero, gp
                  fclass.s     s7, fa0
                  nop
                  fmv.x.w      zero, fs1
                  mulh         t1, t2, s3
                  slt          t6, gp, s8
                  fmv.w.x      ft1, t5
                  fmax.s       fs2, fs5, fs8
                  sub          t5, t5, a3
                  mulhu        s8, ra, gp
                  auipc        t4, 463203
                  auipc        tp, 865753
                  addi         t3, s2, 444
                  srai         zero, t6, 0
                  sltu         zero, t0, a2
                  divu         gp, t3, s6
                  srai         s10, s5, 6
                  slti         t3, s5, -932
                  mulhu        s0, t4, t2
                  slli         t3, s1, 22
                  div          t2, s5, a6
                  rem          a0, t6, a5
                  and          zero, t1, tp
                  mul          s7, zero, s10
                  xor          t1, ra, s10
                  ori          a7, s7, -1683
                  fcvt.s.w     fs11, t5, rtz
                  fmul.s       fs3, fs1, fs0
                  ori          t0, a4, 1436
                  divu         s7, a0, a1
                  flt.s        a0, fs7, fs6
                  sltu         ra, t0, t4
                  flt.s        t2, fs0, fs11
                  mulh         a2, a4, sp
                  auipc        s3, 421999
                  fsqrt.s      fs2, fs3
                  fle.s        t5, ft2, fa4
                  fcvt.s.wu    ft7, a6
                  fcvt.s.w     fs10, s5
                  xori         s6, s9, -63
                  div          s0, a1, ra
                  fsgnjn.s     ft7, ft11, fs7
                  fmv.w.x      fs5, s0
                  mulhu        t0, t2, a7
                  lui          s7, 230384
                  fle.s        sp, ft8, ft9
                  fcvt.wu.s    s2, fa2
                  mulh         s8, a2, s6
                  add          t3, ra, s8
                  sltu         a3, a2, ra
                  fsqrt.s      fs9, fs2
                  fmv.w.x      fa5, s6
                  slli         s1, s6, 5
                  srl          a3, a5, t4
                  mulh         zero, a0, ra
                  fcvt.w.s     s10, fs1
                  fcvt.s.w     fs4, s3
                  or           s6, t0, s3
                  divu         a2, s3, t4
                  auipc        t6, 718256
                  divu         s3, s5, t2
                  remu         s7, a6, a0
                  sltiu        t3, a3, -360
                  sltu         s3, t4, s5
                  fclass.s     s10, fa1
                  fsqrt.s      fs6, fs4
                  fmax.s       fs11, ft0, ft8
                  andi         t2, a6, -1488
                  fsgnjn.s     fa7, fa1, ft11
                  add          tp, a1, t3
                  rem          s3, t0, s11
                  slli         s8, zero, 18
                  fsqrt.s      fs9, fs2
                  fmin.s       ft5, fs8, fs8
                  fle.s        s11, fs5, fa2
                  fmul.s       ft5, fs10, ft3, rdn
                  div          a0, a2, s5
                  mulhu        s9, t6, s2
                  sltiu        t1, sp, 224
                  srl          t1, s11, a5
                  auipc        t6, 182251
                  fsgnjx.s     fs6, fa5, fa0
                  slli         s10, s5, 24
                  and          a2, t3, s7
                  feq.s        a1, ft1, fa1
                  andi         gp, t1, -804
                  sltiu        t5, s10, 1887
                  fcvt.wu.s    gp, ft8, rup
                  srl          s9, s6, s2
                  xor          t6, s7, a6
                  addi         a7, ra, -1057
                  sltiu        s9, t2, -1224
                  nop
                  flt.s        gp, ft4, ft3
                  ori          t3, tp, -560
                  or           s6, a5, s1
                  fcvt.s.wu    ft5, ra, rdn
                  slt          sp, t2, t1
                  slli         s5, s9, 7
                  fmv.w.x      fa4, s11
                  fcvt.s.wu    fs8, a5, rup
                  fcvt.w.s     t5, fa6, rup
                  fcvt.w.s     t3, fs9, rdn
                  feq.s        t1, fa0, ft10
                  fsgnj.s      fs5, ft6, ft8
                  srai         a7, s8, 13
                  xor          t3, gp, a4
                  sltiu        t6, t4, -441
                  mulh         s10, s2, t4
                  lui          a5, 184094
                  sltu         s9, s9, t2
                  feq.s        s6, fa5, fa6
                  fdiv.s       ft1, fs7, ft2
                  xor          s5, s2, t2
                  lui          a2, 916738
                  slli         a2, s7, 0
                  and          sp, tp, s0
                  feq.s        a3, fs0, fs7
                  fdiv.s       ft11, fs2, fs10
                  mulhu        a7, sp, t2
                  slli         s10, s8, 25
                  mulhsu       sp, zero, s6
                  fsgnjx.s     fa2, fs0, ft11
                  fmul.s       fs8, fs7, fs1
                  srai         t3, t0, 31
                  addi         t2, a5, -527
                  fclass.s     t6, ft3
                  mulhsu       a5, t4, a6
                  flt.s        a2, fa0, fa3
                  and          s10, s10, s0
                  andi         t2, s9, -1033
                  slti         s8, a3, -654
                  mulhsu       t4, a0, a6
                  slli         a2, s7, 6
                  divu         t1, s2, t3
                  sra          t6, t5, a6
                  rem          s5, zero, a6
                  addi         s2, s6, 1351
                  fmin.s       fa3, ft2, fs9
                  fsqrt.s      fs6, fa0
                  div          s8, t2, s8
                  div          s0, ra, s4
                  add          a7, t3, a0
                  fsgnjx.s     ft5, ft5, fs8
                  rem          t1, s9, tp
                  add          s5, s2, t0
                  fsgnjn.s     ft11, ft8, fs7
                  sra          t3, s1, s0
                  mulh         a1, s8, a5
                  mul          t3, s0, a7
                  srl          a7, a7, ra
                  fmul.s       ft10, fs9, fs6, rdn
                  fsgnj.s      fs4, ft5, fs9
                  mulh         s10, s1, a1
                  sltiu        s10, s8, -1434
                  sub          t4, t4, t4
                  slli         t2, s10, 12
                  xori         s10, ra, 860
                  rem          s5, a1, a4
                  and          s9, a0, t0
                  flt.s        s9, ft6, fa1
                  fcvt.s.wu    fs8, s0
                  fle.s        a7, ft4, fa1
                  rem          s2, s2, a0
                  add          zero, a4, sp
                  fdiv.s       fa5, ft3, ft9, rup
                  fcvt.s.w     fs1, t0, rne
                  fsgnjx.s     fs3, ft8, fs4
                  fmax.s       ft4, ft9, fs6
                  fdiv.s       fs7, fs3, fs6, rne
                  fsub.s       fa4, fs1, fs2, rmm
                  srli         s9, s0, 1
                  fcvt.w.s     a1, ft1
                  mulh         zero, tp, s7
                  mul          a5, s5, a6
                  sll          t3, sp, a3
                  fmax.s       fs4, ft8, fs3
                  sltu         s11, s11, t4
                  ori          ra, s5, 315
                  rem          t3, zero, s0
                  auipc        a7, 1030658
                  fcvt.w.s     t3, fs10, rmm
                  srli         t4, s10, 31
                  lui          a2, 442574
                  andi         s0, s8, 124
                  andi         s8, s1, -1686
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
mmode_intr_vector_1:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_2:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_3:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_4:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_5:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_6:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_7:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_8:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_9:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_10:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_11:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_12:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_13:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_14:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

mmode_intr_vector_15:
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  j mmode_intr_handler
                  1: la x14, test_done
                  jalr x0, x14, 0

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
                  addi x20, x20, -4
                  sw  x16, (x20)
                  add x16, x20, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x20, x16, zero
                  csrr x29, 0x341 # MEPC
                  csrr x29, 0x342 # MCAUSE
                  li x12, 0x3 # BREAKPOINT
                  beq x29, x12, ebreak_handler
                  li x12, 0x8 # ECALL_UMODE
                  beq x29, x12, ecall_handler
                  li x12, 0x9 # ECALL_SMODE
                  beq x29, x12, ecall_handler
                  li x12, 0xb # ECALL_MMODE
                  beq x29, x12, ecall_handler
                  li x12, 0x1
                  beq x29, x12, instr_fault_handler
                  li x12, 0x5
                  beq x29, x12, load_fault_handler
                  li x12, 0x7
                  beq x29, x12, store_fault_handler
                  li x12, 0xc
                  beq x29, x12, pt_fault_handler
                  li x12, 0xd
                  beq x29, x12, pt_fault_handler
                  li x12, 0xf
                  beq x29, x12, pt_fault_handler
                  li x12, 0x2 # ILLEGAL_INSTRUCTION
                  beq x29, x12, illegal_instr_handler
                  csrr x12, 0x343 # MTVAL
                  1: la x14, test_done
                  jalr x1, x14, 0

ecall_handler:    
                  la x29, _start
                  sw x0, 0(x29)
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  la x14, write_tohost
                  jalr x0, x14, 0

instr_fault_handler:
                  add x16, x20, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x20, x16, zero
                  lw  x16, (x20)
                  addi x20, x20, 4
                  mret

load_fault_handler:
                  add x16, x20, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x20, x16, zero
                  lw  x16, (x20)
                  addi x20, x20, 4
                  mret

store_fault_handler:
                  add x16, x20, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x20, x16, zero
                  lw  x16, (x20)
                  addi x20, x20, 4
                  mret

ebreak_handler:   
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
                  add x16, x20, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x20, x16, zero
                  lw  x16, (x20)
                  addi x20, x20, 4
                  mret

illegal_instr_handler:
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
                  add x16, x20, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x20, x16, zero
                  lw  x16, (x20)
                  addi x20, x20, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x29, 0x300 # MSTATUS;
                  csrr  x29, 0x304 # MIE;
                  csrr  x29, 0x344 # MIP;
                  csrrc x29, 0x344, x29 # MIP;
                  add x16, x20, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x20, x16, zero
                  lw  x16, (x20)
                  addi x20, x20, 4
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
