.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x1, h0_start
jalr x0, x1, 0
h0_start:
                  li x15, 0x40001120
                  csrw 0x301, x15
kernel_sp:        
                  la x4, kernel_stack_end

trap_vec_init:    
                  la x15, mtvec_handler
                  ori x15, x15, 1
                  csrw 0x305, x15 # MTVEC

mepc_setup:       
                  la x15, init
                  csrw 0x341, x15

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x15, 0x3800
                  csrw 0x300, x15 # MSTATUS
                  li x15, 0x0
                  csrw 0x304, x15 # MIE
                  mret
init:             
                  li x15, 2143289344
                  fmv.w.x f0, x15
                  li x15, 0
                  fmv.w.x f1, x15
                  li x15, 4286578687
                  fmv.w.x f2, x15
                  li x15, 0
                  fmv.w.x f3, x15
                  li x15, 192236878
                  fmv.w.x f4, x15
                  li x15, 0
                  fmv.w.x f5, x15
                  li x15, 2139095039
                  fmv.w.x f6, x15
                  li x15, 1561152780
                  fmv.w.x f7, x15
                  li x15, 4286578688
                  fmv.w.x f8, x15
                  li x15, 2970680130
                  fmv.w.x f9, x15
                  li x15, 2139095041
                  fmv.w.x f10, x15
                  li x15, 3546549700
                  fmv.w.x f11, x15
                  li x15, 2876258625
                  fmv.w.x f12, x15
                  li x15, 4286578688
                  fmv.w.x f13, x15
                  li x15, 2147483648
                  fmv.w.x f14, x15
                  li x15, 0
                  fmv.w.x f15, x15
                  li x15, 4106376
                  fmv.w.x f16, x15
                  li x15, 2139095041
                  fmv.w.x f17, x15
                  li x15, 6483270
                  fmv.w.x f18, x15
                  li x15, 4286578688
                  fmv.w.x f19, x15
                  li x15, 2143289344
                  fmv.w.x f20, x15
                  li x15, 2143289344
                  fmv.w.x f21, x15
                  li x15, 4286578688
                  fmv.w.x f22, x15
                  li x15, 4286578688
                  fmv.w.x f23, x15
                  li x15, 2230589
                  fmv.w.x f24, x15
                  li x15, 8239724
                  fmv.w.x f25, x15
                  li x15, 2150066754
                  fmv.w.x f26, x15
                  li x15, 2139095040
                  fmv.w.x f27, x15
                  li x15, 2139095041
                  fmv.w.x f28, x15
                  li x15, 2139095041
                  fmv.w.x f29, x15
                  li x15, 2139095039
                  fmv.w.x f30, x15
                  li x15, 2147483648
                  fmv.w.x f31, x15
                  fsrmi 3
                  li x0, 0xbee1a8d3
                  li x1, 0x0
                  li x2, 0x0
                  li x3, 0xfd4feba2
                  li x5, 0x80000000
                  li x6, 0xc
                  li x7, 0x3200b8b9
                  li x8, 0xb
                  li x9, 0xf76d91b9
                  li x10, 0x0
                  li x11, 0x3
                  li x12, 0xf4adc60c
                  li x13, 0xf01a2380
                  li x14, 0x80000000
                  li x15, 0x80000000
                  li x16, 0x0
                  li x17, 0x0
                  li x18, 0xf4f31060
                  li x19, 0x4
                  li x20, 0x80000000
                  li x21, 0x11fa4c7
                  li x22, 0x0
                  li x23, 0x80000000
                  li x24, 0xf0177bab
                  li x26, 0xf
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0x80000000
                  li x30, 0x8
                  li x31, 0x2
                  la x25, user_stack_end
main:             auipc        sp, 855921
                  fmul.s       fa2, fs1, fs4
                  flt.s        s7, fs5, fa2
                  rem          t0, a6, a0
                  and          s4, tp, t2
                  mulhu        t0, a7, zero
                  mulhu        t6, s5, t6
                  div          a5, a2, t4
                  xor          s10, s9, sp
                  srl          s10, gp, a4
                  andi         a3, t5, 1677
                  and          s7, sp, t1
                  and          a0, s6, t0
                  slti         a1, s10, 1452
                  srl          t2, zero, s7
                  mulhu        t2, a3, a1
                  divu         t0, s9, t5
                  slt          s4, s1, a3
                  fsub.s       ft2, fa3, fs10
                  sltu         sp, t3, s4
                  flt.s        s11, fs10, fs3
                  div          s2, s3, tp
                  sltu         s11, s8, t2
                  srl          s5, s3, gp
                  or           a6, s3, a4
                  fsgnjx.s     ft3, fs4, fs7
                  mulhsu       s3, s5, a0
                  srl          zero, zero, s0
                  fle.s        t3, ft2, fs0
                  fsub.s       ft6, fs2, ft4
                  fle.s        gp, ft0, fa2
                  mulhsu       a4, gp, ra
                  fsub.s       fa1, fs10, ft7
                  and          s4, s1, zero
                  fmv.w.x      fa0, t6
                  sub          a5, s9, t5
                  fsgnjx.s     fs1, fa2, fa4
                  fsqrt.s      fs7, fs0
                  fadd.s       ft11, ft2, ft7
                  fle.s        sp, fa7, fa0
                  andi         s4, zero, 1908
                  mul          s8, zero, t6
                  fsgnjx.s     ft8, fs2, fs11
                  rem          sp, tp, t1
                  nop
                  fcvt.s.wu    ft2, a5
                  mulhu        t6, a2, s3
                  fcvt.wu.s    s10, fs3, rdn
                  fle.s        s7, ft7, ft2
                  sll          s1, s9, sp
                  fmin.s       fs4, fs5, fa7
                  srl          sp, t5, s1
                  fsgnj.s      fa2, fs1, fs11
                  sll          gp, s1, s7
                  fcvt.wu.s    t1, ft0, rup
                  fmax.s       fa1, ft11, fa7
                  lui          s1, 928622
                  fclass.s     t5, ft7
                  fsgnjx.s     fs3, ft6, fs3
                  fcvt.s.wu    fs9, s5
                  andi         t6, a7, 1116
                  feq.s        t5, ft8, ft9
                  fle.s        s7, fs4, ft4
                  srai         s6, a7, 7
                  fsub.s       fa2, fa6, fa0
                  fmv.x.w      a6, ft1
                  fsgnjx.s     ft7, ft7, ft1
                  fmin.s       fs6, fs3, fs8
                  fmul.s       fs11, fa6, fs6
                  slt          a6, a3, s4
                  fcvt.s.w     fs1, s1
                  sra          s6, a6, t3
                  sra          a5, tp, a5
                  divu         a0, s10, tp
                  xor          a5, t3, s2
                  srl          s7, t4, s0
                  lui          s1, 801520
                  sub          t5, s7, a5
                  fmul.s       ft2, fa6, ft11
                  fcvt.wu.s    s7, fa0
                  fcvt.s.w     fa3, t3
                  sra          s11, a0, t3
                  srai         s4, s2, 13
                  fclass.s     s6, fs10
                  fcvt.wu.s    a1, ft7, rtz
                  fmax.s       fa4, ft0, ft7
                  nop
                  lui          a1, 234082
                  fmul.s       fa7, fs8, fa2
                  nop
                  slti         zero, a3, 1988
                  divu         a2, a1, gp
                  fcvt.w.s     s4, fa3
                  fdiv.s       fs0, fa3, fa0
                  slti         a6, s10, -407
                  fcvt.s.w     ft10, tp, rup
                  fsgnjn.s     ft0, fs6, fa4
                  flt.s        t0, ft11, fs2
                  flt.s        s11, fa0, fa6
                  lui          s7, 642168
                  fmin.s       ft10, ft9, ft5
                  srl          t5, a1, a6
                  fsub.s       fs8, fa1, fa6, rne
                  remu         t6, s7, s6
                  fcvt.s.w     fs6, t6, rne
                  fsub.s       fs6, ft1, ft10, rup
                  fadd.s       fs4, fs7, fa0, rmm
                  fcvt.s.wu    ft2, a6, rdn
                  fadd.s       fa6, fs11, ft0, rtz
                  srl          a1, s2, s8
                  fcvt.wu.s    s11, fs3, rmm
                  slt          a0, t3, a0
                  or           zero, a7, ra
                  fdiv.s       fa1, fa1, fs8, rne
                  fsgnj.s      fa1, fa3, fa3
                  fdiv.s       ft2, ft11, fs3, rup
                  fcvt.s.wu    ft11, t3
                  addi         s5, s11, 1303
                  ori          s3, s5, 923
                  andi         a2, tp, -1847
                  srai         gp, a3, 21
                  fsqrt.s      fa3, fa2
                  or           s4, gp, s1
                  fsgnjx.s     fa7, fs6, ft10
                  remu         t4, gp, tp
                  fcvt.s.w     fa0, s0, rtz
                  slti         s4, tp, -318
                  fadd.s       ft9, ft10, ft11, rmm
                  and          a4, a3, a5
                  sra          t3, a1, t4
                  fsgnj.s      fa7, ft10, fs9
                  fsgnjx.s     ft8, fs8, ft2
                  srli         t3, s11, 18
                  remu         a7, s9, gp
                  addi         s7, t2, 194
                  nop
                  sltu         a6, a7, a1
                  auipc        s8, 131887
                  fdiv.s       ft8, fs4, ft6
                  fdiv.s       ft6, ft7, fs4, rtz
                  srli         a4, s2, 30
                  fcvt.s.wu    ft4, s7, rmm
                  fcvt.wu.s    s7, ft3
                  divu         a1, a6, s11
                  slti         a2, a1, 766
                  sltiu        a2, s5, -689
                  fsgnj.s      fs7, ft1, fa3
                  flt.s        s10, ft3, fa5
                  fsgnjn.s     fs4, fa3, fa1
                  xor          s10, ra, zero
                  fmv.x.w      a6, fs2
                  fmv.x.w      gp, fs0
                  remu         s1, s5, s8
                  fsqrt.s      fs5, ft9, rne
                  sra          s10, ra, s2
                  fmin.s       fa7, fa5, ft7
                  fadd.s       fs10, ft1, fa0
                  fmin.s       ft7, ft9, fs2
                  sltiu        s1, s2, -600
                  srl          a4, t6, t3
                  fmv.x.w      a5, fa2
                  xor          s4, ra, a4
                  sltiu        s5, t6, -1903
                  or           a0, t6, s7
                  slti         t6, s3, -700
                  lui          t1, 34861
                  fsgnj.s      fa7, ft9, fs3
                  mulhu        s5, sp, a6
                  fmv.w.x      fa0, a6
                  fle.s        s8, ft6, fs6
                  fmul.s       fs9, ft2, fs0, rup
                  srl          s2, s5, s5
                  remu         s7, zero, t6
                  fsub.s       ft1, fa2, ft3, rup
                  xor          s7, s9, s1
                  fsgnjn.s     fs7, ft11, fs10
                  slli         gp, a2, 22
                  slt          t2, zero, s7
                  slt          s10, s10, t4
                  fsgnjn.s     fs3, ft6, fs8
                  sltiu        a2, a0, 413
                  ori          t4, t5, -467
                  fsqrt.s      ft1, fa2
                  mulhsu       a3, s5, a7
                  fle.s        t4, fs3, ft7
                  fsgnjn.s     fs11, ft3, ft0
                  lui          s11, 554419
                  fmin.s       fs4, fa4, fs9
                  slt          a1, s9, a7
                  fmv.w.x      fs5, a2
                  mul          a4, a4, t6
                  slli         s10, tp, 26
                  or           s0, s7, a2
                  fsgnjn.s     ft2, fa5, ft9
                  sltu         t4, t4, a2
                  sub          t5, s10, s6
                  sltiu        t1, t1, -1236
                  flt.s        s8, ft0, fs4
                  fmul.s       fs2, fs2, fs11
                  fcvt.s.w     ft6, t3, rdn
                  sltiu        t0, gp, 652
                  fsgnjn.s     fa7, ft6, fa0
                  or           a2, s4, gp
                  fcvt.s.w     fa7, t2
                  fcvt.w.s     s10, fa3, rmm
                  fcvt.s.w     ft8, t4
                  fdiv.s       fa0, ft4, ft1
                  sub          t4, a7, ra
                  fsgnjx.s     ft2, fa6, ft7
                  sltiu        s11, s1, 1735
                  mulhu        s3, t1, a0
                  srai         s1, tp, 14
                  fmv.x.w      a0, fs0
                  fsub.s       fa6, fs8, ft0
                  fmin.s       fs3, ft5, fa3
                  slti         s2, ra, -819
                  srl          a6, s10, s5
                  slti         s3, a6, 259
                  fcvt.s.wu    ft4, s0
                  sltu         s3, t4, t2
                  or           t6, s4, s11
                  flt.s        zero, fs5, fa3
                  sltiu        a5, gp, -1951
                  sub          a7, t3, t0
                  mulh         a0, a2, a0
                  fsqrt.s      fs6, fs9, rup
                  fcvt.s.wu    ft5, s8
                  fmin.s       ft10, ft7, ft4
                  srl          s8, a0, s5
                  slti         s8, ra, -522
                  addi         a0, gp, 641
                  srai         a6, a0, 31
                  fsgnj.s      fa4, fa7, fs1
                  fcvt.wu.s    t6, fs6
                  fclass.s     gp, ft9
                  mulh         s1, t1, a5
                  fcvt.wu.s    zero, fa2, rmm
                  or           s2, a1, sp
                  fcvt.w.s     s5, fs3, rtz
                  ori          t4, s10, 1845
                  mul          t3, a2, a1
                  sra          t5, s2, a1
                  divu         gp, a2, s6
                  slt          a7, s7, a6
                  lui          zero, 274090
                  fclass.s     s2, ft2
                  mul          sp, s2, s3
                  andi         s3, s7, 1230
                  fsgnjn.s     fa4, fs2, fa1
                  fcvt.wu.s    a5, fa4
                  srl          gp, sp, t3
                  fle.s        gp, fs7, fa5
                  rem          s10, tp, tp
                  nop
                  fmv.x.w      sp, ft8
                  add          s2, a5, s3
                  fcvt.w.s     gp, fa3, rtz
                  slti         t2, s1, -101
                  mulh         s1, t2, t2
                  flt.s        s1, ft0, fs7
                  fcvt.w.s     s1, ft6, rtz
                  fmin.s       fs9, fa2, fa5
                  srl          a6, s10, s7
                  xori         t0, s0, 1901
                  mulhsu       t3, tp, a2
                  fmv.w.x      ft3, t2
                  rem          s11, s9, s11
                  fmax.s       ft1, fs5, ft0
                  fcvt.s.wu    ft0, s6, rtz
                  srli         s0, a7, 17
                  fadd.s       ft4, fs0, fa3, rup
                  fcvt.s.w     fa0, s0
                  fdiv.s       fa6, fs5, ft10
                  srl          s10, t1, a0
                  nop
                  div          s3, t5, a4
                  fsqrt.s      fa2, ft9
                  nop
                  fmul.s       fs3, ft4, fs8, rne
                  divu         t2, zero, s6
                  slti         s6, t5, -649
                  fclass.s     t5, fs5
                  fmv.w.x      fa7, s3
                  remu         gp, t6, gp
                  fcvt.w.s     s2, ft0, rmm
                  fcvt.w.s     s0, fa5, rup
                  fadd.s       ft8, ft11, ft1
                  fmin.s       fs8, fs7, ft2
                  remu         s4, s3, t3
                  sll          s6, s11, s4
                  slli         a0, tp, 20
                  fcvt.s.w     fs7, t1, rmm
                  mul          s0, a5, a4
                  mulhu        s7, a3, t2
                  nop
                  fsqrt.s      ft1, fs6
                  or           t4, sp, a2
                  nop
                  fmin.s       fs5, ft7, fs11
                  remu         t0, s10, s10
                  srl          s8, ra, s3
                  rem          t1, sp, s11
                  flt.s        t4, fa3, fa1
                  div          t0, t3, sp
                  add          s2, a6, a1
                  fmv.w.x      fa7, zero
                  fcvt.s.w     fs1, t4
                  div          a1, gp, s9
                  divu         a6, a5, s10
                  div          zero, a5, t2
                  mulhsu       s5, s5, s5
                  sltu         t3, a5, s5
                  mulhu        t3, s10, a1
                  mul          a0, a1, s1
                  srai         s1, tp, 17
                  fsqrt.s      fs3, ft9, rup
                  fmax.s       ft10, fs6, ft4
                  sltiu        s0, a7, -507
                  slli         a2, s5, 5
                  sub          t0, s5, gp
                  addi         s0, s9, -1296
                  fmax.s       ft4, fs2, ft5
                  srli         t3, tp, 14
                  divu         zero, a5, a0
                  slti         t4, tp, -179
                  add          t1, sp, t2
                  lui          a7, 861951
                  fmul.s       ft10, ft3, fs8, rne
                  divu         t3, a2, s6
                  srl          zero, sp, s10
                  sra          s11, ra, s11
                  srli         s11, s4, 28
                  fsub.s       ft6, ft3, ft5, rmm
                  fadd.s       ft6, ft7, ft2
                  mulh         zero, gp, t5
                  srai         t5, t5, 4
                  sll          s6, s5, a3
                  fmin.s       fs5, fa7, fa0
                  fcvt.wu.s    s11, fa3, rtz
                  nop
                  fmax.s       fs9, fs1, fs2
                  nop
                  feq.s        s7, ft7, fs11
                  ori          a7, zero, -951
                  ori          s11, t0, 2022
                  fmv.x.w      s6, fa6
                  div          s8, s4, t0
                  mul          s3, s2, gp
                  and          s0, ra, ra
                  mulhsu       s3, s6, s10
                  srl          a2, s8, s8
                  fsgnjx.s     fs11, fs10, fa4
                  xor          s1, s7, s7
                  fdiv.s       fa2, ft2, fa4, rmm
                  srl          t3, t2, a0
                  fcvt.s.wu    fs3, t0
                  fadd.s       fs7, fs5, ft9, rtz
                  sub          s4, gp, t3
                  fcvt.s.wu    fa5, s7
                  srli         s11, s10, 12
                  fdiv.s       fs4, fa2, ft9
                  fmv.x.w      a3, ft2
                  mulhsu       s8, s5, s0
                  srai         s6, tp, 4
                  lui          s6, 13281
                  mulh         t4, s10, zero
                  fcvt.s.w     ft4, a4, rtz
                  rem          s2, t3, t0
                  addi         a4, s8, -1211
                  flt.s        a0, fs3, fs5
                  fcvt.wu.s    a2, ft0, rup
                  ori          a0, t4, 1541
                  sltiu        t6, t5, -76
                  mul          a2, s6, t1
                  fle.s        a1, fs8, fa7
                  xori         t0, a1, 555
                  fmin.s       ft0, ft2, fa1
                  mulhu        s1, s9, a5
                  srai         s11, t3, 31
                  fcvt.wu.s    t4, fs8, rdn
                  xori         s7, s5, -256
                  sll          s4, t1, s7
                  and          t2, s0, s5
                  mulh         s10, s2, s4
                  sub          s8, t4, s10
                  andi         t4, s9, -1319
                  flt.s        a3, fa1, fs5
                  fadd.s       ft2, ft10, ft3
                  fsgnjn.s     fs8, fs7, fs6
                  srli         s6, s3, 23
                  fsgnjn.s     ft1, ft1, ft10
                  fmin.s       fs4, ft10, fa7
                  fsgnjx.s     fs7, fs1, ft6
                  ori          a6, s8, 613
                  ori          a0, s3, 1019
                  fadd.s       fs5, ft0, fs10, rne
                  fcvt.w.s     s1, fa0, rup
                  slti         t6, zero, -793
                  fsgnjn.s     fa5, ft4, ft8
                  fmin.s       fs4, fs6, ft0
                  mul          s4, t0, a6
                  fadd.s       ft2, ft0, fs5, rdn
                  mul          a2, s6, s8
                  slli         s0, a2, 10
                  fclass.s     t2, fs11
                  nop
                  slli         s6, a0, 23
                  srli         s3, tp, 31
                  sltu         t6, s1, a0
                  slli         t5, s0, 8
                  sltu         a4, s10, s4
                  fsqrt.s      fs1, ft3, rup
                  sltiu        t4, s2, 1189
                  fmv.w.x      ft3, s1
                  fadd.s       fs7, fs2, fs1
                  remu         s3, t4, t2
                  lui          t3, 630175
                  fcvt.s.wu    ft8, s11, rtz
                  slt          t3, a1, tp
                  fcvt.s.wu    fs4, tp, rdn
                  fsub.s       ft7, fs3, fa5, rtz
                  ori          s3, s10, -1023
                  fcvt.w.s     s10, ft4, rmm
                  addi         gp, t5, 977
                  srai         t0, a4, 0
                  sltiu        t0, s0, -1283
                  ori          s3, s10, -274
                  fle.s        a4, ft7, fs7
                  lui          t4, 10934
                  fsgnj.s      ft10, fs8, ft3
                  fmin.s       fs6, fa4, fs0
                  slti         s5, s3, -796
                  sub          a7, sp, a4
                  srl          s5, ra, t2
                  xori         a7, a0, -1828
                  fadd.s       fa3, fs5, fs1, rdn
                  lui          s3, 325938
                  fdiv.s       fa3, ft8, fs6
                  and          t1, s5, sp
                  fadd.s       ft9, fs3, fa2
                  or           s10, a5, t4
                  lui          s3, 698248
                  srli         t3, s10, 0
                  sltu         zero, tp, sp
                  or           s7, a0, a5
                  fmul.s       ft9, ft1, ft7, rmm
                  srli         s0, s10, 19
                  ori          s8, s9, -1353
                  rem          a3, s5, t5
                  sltiu        t1, a2, 1995
                  add          t1, s5, s11
                  fmin.s       fs8, fs11, fa5
                  sltiu        t3, a2, -851
                  slti         t1, a6, 1384
                  fcvt.wu.s    s2, fs2
                  sub          t0, s8, a6
                  ori          s1, a1, 670
                  or           t2, s10, s3
                  mulhu        t2, t6, tp
                  fle.s        a4, fs1, fs8
                  fmin.s       fs6, ft0, fa2
                  fcvt.s.wu    fs9, s9
                  fcvt.wu.s    a3, fa1
                  or           a0, s4, t6
                  sltiu        a6, s6, 1894
                  feq.s        t4, ft4, fs3
                  mulhu        t4, s4, a2
                  remu         s6, gp, zero
                  sltu         s4, s8, a0
                  flt.s        s3, fs2, fs7
                  srl          zero, s8, t1
                  ori          t5, a2, 938
                  fsgnj.s      ft11, fa3, ft11
                  fcvt.s.wu    ft7, t6, rdn
                  fcvt.s.w     fs2, ra, rtz
                  divu         s2, s11, s9
                  auipc        sp, 150007
                  xori         sp, t4, -1647
                  mulhsu       a6, a3, s11
                  fadd.s       fa0, fs0, fs8
                  xor          t6, s5, t2
                  fcvt.w.s     s4, fa3
                  feq.s        t4, fs8, ft0
                  sltu         s6, t4, t5
                  andi         s7, ra, -1415
                  fle.s        t3, ft1, fs2
                  div          s11, t3, s6
                  ori          s7, t0, -927
                  fsgnj.s      ft11, ft9, ft7
                  slli         a2, t1, 26
                  lui          sp, 329779
                  and          a4, sp, s0
                  fcvt.wu.s    s0, ft11
                  slli         s3, s3, 22
                  srl          s4, a1, s3
                  fadd.s       ft10, ft2, fs9
                  and          s8, s8, s9
                  rem          s1, a5, a2
                  fcvt.wu.s    s5, fs1
                  slti         s6, s0, -54
                  fsqrt.s      fa3, ft0
                  sll          t0, t3, s0
                  fcvt.wu.s    a0, ft0, rdn
                  mul          t0, sp, s6
                  xori         s10, a1, 655
                  slli         zero, a3, 12
                  fmax.s       fa5, ft8, fs2
                  rem          s2, a1, t0
                  fsgnj.s      fs9, fs10, ft7
                  sltiu        s4, s4, -478
                  feq.s        s2, ft10, fa2
                  fcvt.s.w     fs5, a3, rne
                  fcvt.wu.s    s11, ft6
                  fclass.s     sp, fs4
                  sra          s0, tp, s7
                  fsgnjn.s     ft0, fs9, fs3
                  sltiu        s7, a5, -520
                  srli         t6, a2, 12
                  srli         a6, s1, 8
                  andi         a4, t0, -1511
                  xori         s6, ra, -1583
                  sltu         s2, t1, s10
                  slli         sp, s2, 15
                  fcvt.s.w     fa1, a7, rtz
                  slt          t0, s9, s4
                  fmax.s       fa6, ft2, fa0
                  sltiu        s8, zero, 106
                  fclass.s     s11, fa4
                  div          s7, s10, t2
                  lui          a7, 461833
                  sll          a1, tp, a2
                  xori         a1, s4, -1347
                  nop
                  fadd.s       ft11, fs0, fa7, rmm
                  sltu         t2, s1, t4
                  fcvt.s.wu    fs2, sp, rdn
                  add          a6, a5, a0
                  add          t4, s2, t4
                  fcvt.s.w     fs6, t4
                  sltiu        s6, t6, 1460
                  srli         t6, s1, 15
                  nop
                  mulhu        t4, a6, a5
                  flt.s        s7, fs4, ft5
                  fcvt.s.wu    ft6, s5
                  fcvt.wu.s    a1, ft4, rne
                  lui          t4, 364529
                  fle.s        s10, fs11, ft7
                  fmin.s       fs7, fs5, fa4
                  rem          s0, s3, a3
                  srli         t1, s2, 29
                  fdiv.s       ft1, fa7, fa4
                  remu         a7, a0, t1
                  or           s5, s5, s10
                  or           a1, a6, s0
                  flt.s        s2, ft0, fs9
                  slli         t2, s5, 10
                  sll          a7, s1, sp
                  srli         a2, s7, 18
                  divu         t4, s4, a3
                  fmul.s       ft4, fa5, fa1
                  fsgnjx.s     fs8, fa3, ft4
                  or           zero, a4, s3
                  addi         s3, s5, -790
                  fmul.s       fs11, fs1, ft0
                  xori         t0, s11, -539
                  srli         gp, a5, 11
                  fclass.s     gp, fa0
                  fsub.s       ft5, fs9, fs6
                  fcvt.wu.s    zero, fs7
                  srl          t2, a3, t0
                  fsqrt.s      fs7, fs11
                  fsub.s       ft8, ft11, fa7, rup
                  or           a3, s0, t3
                  divu         a3, s0, s5
                  fsqrt.s      fa1, ft9, rup
                  fsgnjn.s     fa0, ft2, ft0
                  srli         s6, s5, 20
                  srli         s7, s5, 27
                  divu         s11, t5, a4
                  sub          t2, sp, a0
                  fmin.s       fa0, fs4, ft0
                  mul          s4, s7, a3
                  fsgnj.s      fs1, ft3, fa3
                  sub          t4, t3, t2
                  mulhu        s6, a7, tp
                  or           a0, a6, ra
                  addi         s6, s6, 1153
                  fadd.s       fs4, ft4, fs5
                  fmul.s       fs2, fs2, fs10
                  addi         s7, s1, 175
                  addi         a4, s2, 1623
                  fmin.s       ft10, fa3, fa2
                  fcvt.w.s     a5, fa7, rup
                  sub          s6, s9, tp
                  auipc        t3, 621239
                  fcvt.s.wu    fs9, t1
                  sll          s10, s9, a6
                  add          s11, s8, s2
                  fsgnj.s      ft0, fs0, ft3
                  remu         t1, t4, t0
                  sub          a1, a6, gp
                  sll          a1, s11, a0
                  nop
                  fclass.s     a6, fs9
                  fsub.s       ft3, fs3, fa7
                  xori         a5, sp, 804
                  fsub.s       ft10, fs4, fa5, rdn
                  sll          t1, a7, a6
                  fmv.x.w      s3, ft4
                  xor          s4, a7, s9
                  fclass.s     a2, fa5
                  fle.s        s5, ft6, ft5
                  nop
                  slti         s4, t0, 1121
                  fclass.s     t3, fs2
                  mul          s3, a0, a5
                  mul          s5, a7, gp
                  fclass.s     t6, ft10
                  slt          s1, t5, a2
                  and          t0, a5, a1
                  mulhsu       s1, ra, a1
                  sltu         sp, t1, s0
                  fsgnj.s      fs3, ft4, fs4
                  xor          zero, t4, t3
                  fcvt.wu.s    s2, ft4, rdn
                  srli         a3, t2, 13
                  auipc        a1, 324264
                  divu         s10, a1, a4
                  addi         s11, s7, -443
                  or           s2, ra, s10
                  and          t0, s2, a0
                  mulh         a3, s8, s6
                  fcvt.w.s     s7, fs10
                  xori         s8, s0, 55
                  fmin.s       ft1, fs4, fs11
                  and          t1, tp, a2
                  sra          s2, s10, a1
                  fcvt.s.wu    fs10, a1, rdn
                  fcvt.w.s     s8, fs1, rtz
                  fsgnjn.s     ft0, fs10, fa2
                  fmv.w.x      ft10, s5
                  andi         t5, s5, -1676
                  fcvt.wu.s    a4, fs0, rup
                  slt          t1, s9, s3
                  nop
                  mulhsu       a0, a3, s3
                  auipc        t6, 836571
                  div          t1, a3, s9
                  fmv.w.x      ft2, sp
                  flt.s        t0, fa6, ft5
                  sltiu        s3, s11, 1706
                  sll          s2, a5, t0
                  srli         s5, s4, 21
                  sra          s1, s5, a5
                  mul          s11, s10, s3
                  divu         sp, a3, s2
                  xor          s2, s6, a0
                  remu         s8, s5, s1
                  slt          a4, a3, s6
                  flt.s        t0, fs9, ft7
                  fadd.s       fa3, ft4, fa4
                  add          t3, t3, a4
                  fmin.s       fa6, ft8, ft0
                  xori         t6, s1, 1408
                  xori         a3, s7, 1099
                  ori          a0, ra, 411
                  fcvt.s.wu    fs9, s9
                  mulhu        s5, s1, a6
                  auipc        a7, 385830
                  fmv.w.x      ft11, gp
                  lui          sp, 186388
                  sltu         a0, s4, s4
                  fsgnjn.s     ft11, fa6, fs10
                  fmax.s       fa5, fa6, fa3
                  fsqrt.s      ft3, ft5, rtz
                  sll          a0, t3, t3
                  slti         s7, t6, -1011
                  slti         t1, t2, -654
                  mulh         s3, s0, a7
                  fmv.x.w      a4, fa6
                  fmax.s       ft11, fa1, ft5
                  fsgnjn.s     fa3, fs8, fa4
                  fle.s        t3, fs1, fs11
                  and          gp, ra, s3
                  xor          t2, a3, a0
                  divu         a1, s2, s1
                  slt          a0, ra, t5
                  add          t0, tp, s5
                  sra          a0, s1, tp
                  and          sp, t6, ra
                  mulh         a4, a4, s9
                  fclass.s     t5, ft9
                  slti         t6, zero, 1406
                  or           a0, t3, s1
                  srli         t5, s5, 18
                  srai         s2, a2, 6
                  andi         t3, a6, -278
                  slli         s4, s6, 21
                  divu         t1, a7, ra
                  sltiu        a2, s0, -1145
                  fmax.s       fs2, ft9, fa3
                  fdiv.s       fs5, ft0, ft8, rup
                  sll          t5, s8, s2
                  slli         t6, s11, 27
                  fle.s        t0, fa3, ft6
                  flt.s        s1, ft2, fs11
                  add          s7, s7, gp
                  slti         t5, s1, -1341
                  remu         t3, s7, s3
                  fsgnj.s      fa2, fa7, ft2
                  mulhu        s6, a5, s5
                  divu         a3, zero, s6
                  divu         a1, a6, t1
                  rem          s11, t0, a0
                  auipc        s7, 954541
                  remu         a5, a6, s8
                  or           a7, t4, s10
                  fsgnjn.s     fa2, fa7, fs7
                  mulhu        sp, s10, a3
                  slt          s7, a6, s4
                  sll          t1, t2, s4
                  fcvt.s.w     fa4, a5
                  or           s8, s0, zero
                  sltiu        s5, a4, -444
                  fsqrt.s      fs0, fs0, rne
                  fadd.s       fs0, ft0, ft2
                  mul          t3, s4, s4
                  slt          a3, a0, tp
                  ori          s11, s3, 1024
                  sltiu        s0, a0, -521
                  mulhsu       a7, t2, a0
                  sra          a1, a5, a5
                  lui          sp, 447599
                  and          s1, tp, a1
                  auipc        t1, 139055
                  srli         s1, a3, 11
                  fmul.s       ft11, fa4, fa5, rdn
                  mulhu        s4, t2, gp
                  fmax.s       fa2, ft3, fa0
                  mul          s4, gp, a3
                  xor          s7, ra, s1
                  fmul.s       fa2, fs7, ft2, rup
                  ori          s8, a3, -1340
                  divu         a7, t4, t6
                  andi         s10, t2, -1760
                  remu         s1, t3, a5
                  fsgnjn.s     ft1, fa0, fa7
                  fcvt.s.wu    fs9, a0, rne
                  fmul.s       ft1, fs1, ft0
                  nop
                  fdiv.s       ft1, fs0, fa7, rmm
                  sll          sp, gp, a2
                  srli         t0, t3, 31
                  slti         s8, s1, -859
                  and          a2, zero, a0
                  addi         s8, t1, -651
                  xori         t2, tp, -1761
                  sll          a1, tp, a6
                  or           a4, s1, t5
                  sltiu        s1, s2, -1226
                  sltu         s2, sp, s11
                  lui          t4, 381603
                  fclass.s     s6, ft9
                  fcvt.s.wu    fs2, s3
                  addi         a5, tp, 1618
                  rem          a7, a5, s10
                  mul          a4, ra, a1
                  andi         zero, s2, 1787
                  divu         t5, s2, sp
                  auipc        s1, 1047727
                  addi         a1, t0, -650
                  add          s3, zero, t1
                  srl          t5, t0, t3
                  flt.s        s11, fs1, fa2
                  fdiv.s       ft7, fs11, fs8
                  sll          a3, a4, s10
                  srl          t6, t0, t2
                  mulhsu       sp, s0, a4
                  mulhsu       a7, s10, t1
                  fsgnjx.s     fa2, fs6, fa4
                  addi         s1, s5, 850
                  fsub.s       ft0, fa5, ft1
                  fcvt.w.s     s5, fa1, rdn
                  fcvt.w.s     s4, fs0
                  fmul.s       fs7, ft10, fs1
                  fsgnjn.s     fs7, ft4, fs2
                  mulhu        a1, a7, t0
                  fadd.s       ft3, fs0, ft10, rne
                  fsqrt.s      fs10, fa4
                  sltu         s2, a0, s9
                  nop
                  sltiu        a7, s8, 198
                  fmv.w.x      ft7, t5
                  flt.s        s7, fs1, ft2
                  and          t3, s0, zero
                  div          s5, s9, s3
                  fcvt.s.w     fs0, a4
                  div          t2, s9, a4
                  fmax.s       fs1, ft3, ft5
                  sra          t0, a7, t6
                  div          s7, a1, zero
                  fcvt.s.w     fa1, s1
                  fmax.s       fs4, ft10, fs8
                  srl          s7, a6, s8
                  srli         t6, sp, 21
                  fcvt.wu.s    t1, fs1
                  srli         s8, s9, 23
                  fmv.w.x      fs6, ra
                  srai         s0, t0, 3
                  fmv.x.w      sp, fs0
                  rem          sp, a1, t2
                  fmax.s       ft0, fs3, ft4
                  ori          s7, tp, 1797
                  divu         s1, a5, s10
                  xor          a6, sp, s6
                  srai         a3, s5, 20
                  lui          s5, 114057
                  sltiu        s7, t1, 656
                  mul          t2, t1, t1
                  fcvt.s.wu    ft6, s5
                  and          t6, t5, t6
                  fclass.s     s2, fs3
                  fcvt.w.s     s5, fs8
                  fadd.s       ft3, fs7, ft0
                  fsgnjx.s     fs1, fs4, ft1
                  fsqrt.s      fs1, fs10
                  slli         a3, s6, 5
                  fadd.s       ft1, fs4, fs3, rup
                  fsub.s       ft7, ft9, ft0
                  rem          a3, gp, a3
                  fsgnjx.s     fs8, fa4, fa1
                  or           s5, tp, s6
                  fsub.s       ft3, fa7, fs11
                  and          s6, t1, ra
                  sub          a0, s3, t4
                  fdiv.s       ft4, ft3, ft3, rup
                  or           t3, a3, s8
                  and          t5, a7, s11
                  sra          zero, a2, s2
                  srli         a3, a3, 1
                  fmv.x.w      s5, fs10
                  nop
                  addi         a1, s1, -176
                  mulhsu       sp, s2, a7
                  sub          t2, gp, sp
                  sll          t0, a1, t4
                  srli         t0, s5, 22
                  feq.s        a1, ft1, ft0
                  fsub.s       fs9, ft9, fa6, rne
                  feq.s        a7, fa1, fs4
                  fmv.w.x      fs3, t4
                  mulh         t6, s5, a3
                  feq.s        sp, fa2, ft3
                  slli         t4, s6, 25
                  auipc        s5, 414883
                  srai         s3, s0, 14
                  slti         s6, a3, -1070
                  andi         a2, a3, 1687
                  slli         a5, s4, 17
                  sltiu        a1, t2, 1347
                  sltiu        sp, a3, -117
                  mulh         s6, s9, t3
                  sll          s11, s11, t1
                  and          s7, t3, s10
                  fcvt.w.s     sp, fa1, rup
                  slli         t2, t6, 13
                  divu         s2, s3, s4
                  and          s0, t3, zero
                  divu         s5, s7, a7
                  fsqrt.s      fs3, fs2, rne
                  slli         t2, t0, 24
                  fadd.s       ft7, fs8, ft8, rmm
                  fcvt.w.s     a2, ft10, rdn
                  add          s11, a1, s4
                  rem          a3, a6, sp
                  fmv.w.x      fa7, s4
                  remu         zero, a4, ra
                  srli         s3, s11, 27
                  sra          s3, ra, s7
                  fsgnjn.s     ft2, fs4, fs11
                  fsqrt.s      fa7, ft0
                  sra          s10, t5, s4
                  sub          t4, a1, a5
                  mul          gp, t2, a3
                  add          zero, a6, t2
                  sub          s3, zero, t0
                  fmul.s       fa7, ft10, fs11, rmm
                  fle.s        a5, ft6, ft9
                  fcvt.s.w     fa5, t6
                  srl          s2, t2, t1
                  fsgnj.s      fa3, fa7, fs3
                  div          s1, a7, t0
                  sltiu        a7, s0, 1746
                  xori         s2, a4, 711
                  fsgnjn.s     fs5, ft3, fs4
                  mul          a1, s7, t1
                  fcvt.w.s     a4, fs3
                  divu         a6, t6, s8
                  addi         a5, t0, 292
                  xor          t1, s11, t3
                  fmul.s       ft11, fa1, fa6
                  fadd.s       fs8, fs11, ft0, rne
                  fadd.s       fs1, fs1, fs3
                  lui          s8, 949365
                  or           s4, zero, s7
                  sll          s4, a0, t2
                  fcvt.wu.s    s0, ft6
                  fsub.s       ft9, ft7, ft4, rdn
                  mulhu        t0, gp, a4
                  feq.s        t5, fs11, ft1
                  addi         a2, s2, -877
                  fmul.s       ft2, fs11, fs11, rmm
                  sltu         s7, t3, sp
                  sltu         s0, a6, a1
                  slti         s10, t0, 1311
                  flt.s        a7, fs2, fs10
                  or           zero, s4, a1
                  fcvt.s.wu    fa7, zero
                  sll          t4, a6, a6
                  lui          t1, 928825
                  fsub.s       fa2, fs9, ft5
                  xori         a1, s11, -1170
                  fcvt.wu.s    s1, fs5
                  sll          s11, t5, t6
                  fmin.s       fs1, fs4, fs5
                  fsgnj.s      ft7, fs5, fs3
                  srl          a4, a6, s3
                  mulhsu       a5, s10, ra
                  and          a6, t0, s10
                  nop
                  fadd.s       fa6, ft7, fs1
                  divu         s5, t4, t6
                  sll          s1, a7, s2
                  lui          a2, 605574
                  fcvt.s.wu    fa3, zero, rne
                  or           t2, a5, s6
                  srli         s7, s11, 21
                  feq.s        s2, fs1, ft11
                  fle.s        t5, fs2, fs11
                  fcvt.s.w     fa0, ra
                  andi         t6, s5, -1794
                  lui          t6, 547552
                  fcvt.s.w     fs5, t5, rup
                  srai         s11, t5, 5
                  fmax.s       ft5, ft3, fs10
                  fmv.x.w      a0, ft5
                  or           s11, t4, t6
                  fmul.s       fs11, fs2, ft6
                  sltiu        s7, s7, -1677
                  nop
                  fmul.s       fs6, ft10, ft2
                  fadd.s       ft0, fs5, fa3
                  andi         s6, t4, -102
                  divu         t1, t2, zero
                  slli         s8, t3, 0
                  slli         s11, a2, 10
                  lui          s4, 188845
                  fsgnjn.s     fs6, fa3, fs3
                  andi         t0, t1, -1875
                  srli         s7, zero, 20
                  sub          s0, t3, zero
                  fmax.s       fs5, ft4, ft4
                  add          a0, a6, t3
                  andi         zero, a4, -1770
                  fclass.s     t3, fa5
                  flt.s        sp, ft5, fa0
                  nop
                  xori         t2, a4, -2
                  andi         s3, a6, 1518
                  mulhsu       a2, a4, t4
                  sub          a0, a3, a4
                  fsgnj.s      fs7, fs6, fa2
                  mulhu        a1, a5, s4
                  srl          s11, s7, s2
                  slli         t5, zero, 17
                  flt.s        a7, fs9, ft8
                  rem          a2, gp, t0
                  fsgnjn.s     ft4, ft8, fa3
                  sltu         a0, a7, s4
                  mulh         s11, s5, s10
                  div          s0, a0, t4
                  div          s2, s0, a3
                  fadd.s       ft5, fs0, fs0
                  sll          gp, t5, s4
                  sltu         a6, a6, s10
                  fcvt.w.s     s5, fa7
                  sub          a5, s2, s8
                  fle.s        s4, fa4, ft2
                  xor          s3, gp, t1
                  divu         a6, s10, t5
                  mulhu        a3, s8, s6
                  andi         a1, t2, 1366
                  mulh         s11, sp, s5
                  mulh         s10, ra, a3
                  sll          t2, s2, zero
                  fmul.s       ft11, ft5, ft6, rne
                  rem          zero, t3, s3
                  fmul.s       fs6, ft0, ft10
                  fsqrt.s      ft4, fs11
                  fmin.s       fa4, fs10, fa1
                  sub          s2, sp, s3
                  mulhu        t3, zero, t4
                  nop
                  lui          sp, 818547
                  mul          a4, t2, a5
                  xori         t3, s10, 538
                  lui          a0, 901032
                  auipc        a7, 75249
                  slli         a3, gp, 6
                  feq.s        a3, ft6, ft11
                  or           t6, t2, s7
                  sra          a6, a5, t3
                  or           zero, s0, t2
                  sltiu        t2, s7, -1999
                  fmin.s       ft0, ft5, ft6
                  fsub.s       fa0, ft5, fa0, rne
                  sltu         zero, sp, a3
                  div          t0, a6, s1
                  and          a1, s6, a6
                  fadd.s       fs0, fa0, fa0
                  feq.s        t0, fs0, fs4
                  fcvt.wu.s    s6, fs10
                  fmax.s       fs1, fs1, fa7
                  flt.s        t4, fs0, ft2
                  divu         t6, a4, t2
                  sll          t3, zero, s0
                  divu         a0, t3, s2
                  mulhsu       t0, s4, t3
                  fsgnjx.s     ft3, fa0, fa4
                  fcvt.wu.s    a1, fs4
                  sltiu        t4, a7, 538
                  xor          s2, a3, s4
                  slli         a4, s0, 16
                  addi         t0, t1, -1498
                  fmul.s       fs11, fs10, ft1
                  lui          a6, 93004
                  ori          a7, s7, 1142
                  rem          a2, s2, s6
                  fmul.s       fa0, ft5, ft0, rmm
                  fmax.s       fa7, fa5, ft8
                  feq.s        t2, ft2, fs1
                  lui          s7, 1040947
                  fsub.s       ft6, fs5, ft9, rmm
                  fmv.x.w      s1, fs2
                  fsgnjx.s     ft3, fs6, ft9
                  mulhu        a1, a1, s5
                  sltu         s8, t0, t4
                  fdiv.s       fs10, fa5, ft3
                  sub          a3, sp, s10
                  fadd.s       fs11, ft9, fa6
                  fsgnjn.s     ft11, ft8, fs11
                  fadd.s       fa0, fs0, ft4, rmm
                  srl          t3, ra, s8
                  divu         t2, s1, s11
                  fclass.s     a0, ft9
                  fmv.w.x      ft2, a2
                  xori         s11, a2, 1462
                  sltu         s0, s8, ra
                  fsgnjn.s     ft11, fa1, fs11
                  lui          s11, 513139
                  flt.s        t4, fa7, fa2
                  fmin.s       fa2, fa3, fs2
                  fle.s        s3, fa3, ft1
                  sltiu        t3, a3, 1792
                  nop
                  fmax.s       fs2, ft11, fs3
                  sub          s10, zero, t0
                  fsgnjn.s     ft11, fa1, ft10
                  fmv.x.w      a6, fs3
                  fsgnj.s      ft0, fa3, ft4
                  fmul.s       ft2, fs11, fs3
                  fcvt.wu.s    t0, fs6, rmm
                  remu         s11, a6, gp
                  fmax.s       ft4, fs7, ft10
                  ori          s5, t6, -42
                  slti         s1, s10, 1962
                  lui          gp, 583726
                  fmv.w.x      fs3, a6
                  mulhu        s10, a6, s5
                  div          t0, t2, s9
                  fadd.s       fa5, ft1, ft0
                  mulhu        s11, s2, s5
                  fcvt.wu.s    t4, fs6
                  sub          a3, t5, s1
                  or           gp, a5, s1
                  mulhu        a3, gp, sp
                  fsgnj.s      fs11, ft6, ft2
                  sub          s5, s0, s7
                  and          s7, sp, s8
                  fsub.s       ft9, ft7, ft2, rtz
                  fle.s        s8, fs7, fs8
                  sll          t5, t0, s2
                  mulhu        a6, gp, t3
                  fsgnjx.s     fs7, fs9, fs2
                  auipc        t0, 883471
                  fcvt.s.w     fs1, ra, rdn
                  fsgnjn.s     fs10, fa2, ft4
                  fclass.s     s6, fs8
                  xor          t4, t1, a7
                  fclass.s     s5, ft8
                  mulh         s4, s0, a2
                  srli         a1, a1, 9
                  fmv.w.x      ft1, a2
                  fsgnj.s      ft5, fs8, ft1
                  fsgnjx.s     ft11, fs0, ft7
                  or           t2, t0, t4
                  addi         s6, s2, -414
                  slt          t1, s9, s10
                  sltu         a5, tp, s2
                  rem          t6, t5, s6
                  srl          t6, t5, a4
                  andi         s8, ra, -969
                  fcvt.wu.s    t2, fs3, rmm
                  div          s11, ra, s5
                  fadd.s       ft0, fs3, fa3
                  fsgnjn.s     fs9, ft11, fs6
                  mulhsu       a6, a5, t0
                  sltiu        t2, a5, 443
                  feq.s        s8, ft2, fs3
                  feq.s        s4, fs8, ft9
                  nop
                  fdiv.s       fa4, fa0, ft6, rdn
                  slt          a1, a3, t5
                  fsgnjx.s     ft5, ft10, fa3
                  fcvt.w.s     t2, ft5, rup
                  fsgnj.s      fa2, ft6, ft10
                  and          s6, sp, t1
                  fmul.s       fs1, fa6, fa1
                  fsqrt.s      ft7, ft11
                  slti         a3, ra, 1255
                  ori          s10, a5, 600
                  fmv.x.w      a5, fa3
                  fsgnjn.s     ft1, fa2, ft6
                  andi         t5, t6, -1905
                  fsqrt.s      fs9, ft4, rtz
                  add          a7, s0, tp
                  sll          gp, a5, ra
                  srli         t3, a5, 7
                  rem          s5, s7, s0
                  fle.s        s6, fa5, ft3
                  slti         t1, s10, 1849
                  mulhsu       a5, s9, sp
                  fmul.s       ft1, ft1, ft5, rmm
                  fmv.x.w      s10, ft10
                  xori         a2, zero, 686
                  fmax.s       fs4, fs8, fs7
                  rem          a3, a7, t5
                  srl          a3, a3, t6
                  slti         gp, s11, -289
                  and          s5, s0, t3
                  srli         a4, a7, 15
                  srli         a0, a0, 1
                  mulhu        t6, t1, ra
                  or           t0, a3, s2
                  mulhsu       s10, sp, a6
                  sltu         s5, t3, a6
                  fsgnjn.s     fs4, fs6, ft2
                  divu         a3, t5, t6
                  xor          t6, t6, gp
                  div          a1, a2, gp
                  ori          a5, s6, 1472
                  xor          t4, a2, sp
                  and          a1, sp, t3
                  div          s1, s6, s11
                  fcvt.s.w     ft2, t6, rmm
                  sltu         s5, a0, a6
                  srl          t5, sp, a7
                  fsgnjx.s     fs0, ft6, fs3
                  andi         s5, gp, -1427
                  flt.s        s6, fa2, fa6
                  fmv.x.w      s4, ft2
                  mulhu        gp, a5, sp
                  andi         s2, s11, 1531
                  mulhu        s10, sp, a6
                  andi         a3, sp, -457
                  sub          a2, s9, t0
                  and          a1, s11, s1
                  fcvt.s.wu    fs2, zero, rtz
                  xor          s8, s0, t1
                  remu         s3, a1, s11
                  fsgnj.s      fs10, fs9, ft10
                  fcvt.s.wu    fs7, s9, rtz
                  andi         s1, s7, 1352
                  fadd.s       fs6, fs1, fs5, rup
                  add          s3, t2, s10
                  sra          s3, s4, t4
                  fmax.s       ft11, fs0, fs0
                  divu         s6, s8, a4
                  srl          t5, s0, a5
                  fsgnj.s      ft5, fa6, fs9
                  remu         t4, s10, s3
                  fmv.x.w      a4, ft10
                  mulhsu       a0, a0, a2
                  or           s11, s7, s11
                  srli         s4, a3, 10
                  fsgnjx.s     fa7, fa6, fs4
                  sub          s11, a2, s2
                  mulh         zero, s11, t5
                  sll          s6, s4, t6
                  andi         a6, a7, -706
                  sub          t2, s4, t4
                  mul          s0, s9, s10
                  srai         t4, a0, 3
                  fle.s        t1, fs6, ft3
                  or           s11, s0, a6
                  fsgnjx.s     fs1, fa4, fs5
                  fmul.s       ft4, fs3, fa1, rne
                  mul          s5, s11, s8
                  fmax.s       ft2, fa5, fs2
                  slt          a5, s6, ra
                  fsgnjn.s     ft7, ft7, ft10
                  slti         a2, a6, -1514
                  andi         s3, a6, 176
                  rem          s8, tp, t4
                  fadd.s       ft10, ft7, fa1
                  slli         t1, a0, 19
                  fadd.s       ft10, ft1, fs1
                  sltu         s5, t6, a5
                  sltiu        s2, s1, 441
                  xor          a7, s0, s6
                  ori          s11, gp, 470
                  add          s8, a1, a4
                  sltiu        t2, gp, 846
                  fsgnjn.s     fs6, fs6, ft5
                  flt.s        zero, ft3, fs4
                  flt.s        s10, fa6, fs1
                  sltu         a2, zero, t2
                  mulhsu       a6, s5, s6
                  sll          s0, s0, ra
                  add          t0, s2, a7
                  sra          s3, tp, s8
                  addi         s2, sp, 1340
                  fmul.s       ft10, ft8, fs5, rdn
                  slt          t5, s3, a4
                  fle.s        s4, fs8, fs10
                  fsgnjx.s     ft7, ft10, fs1
                  ori          gp, a0, -476
                  divu         t4, s4, t4
                  xor          t1, t5, s8
                  mulh         s0, s2, t4
                  srli         t6, a3, 22
                  flt.s        s7, ft2, fs4
                  slli         s1, a6, 23
                  fdiv.s       fs5, fa0, fs1, rup
                  and          t3, gp, s2
                  fmul.s       fa1, fs11, fs7, rmm
                  fsqrt.s      fa0, fs5, rdn
                  fcvt.s.w     fa5, s6, rmm
                  fdiv.s       fs11, fa3, ft7, rup
                  xori         a6, gp, -641
                  fcvt.s.wu    fs6, t3
                  fmul.s       fs6, ft1, fs1
                  srl          t5, t0, a4
                  srai         s5, a3, 29
                  fcvt.wu.s    t4, fa4, rup
                  fsgnjx.s     fa1, fa1, fa3
                  fle.s        t2, ft8, ft0
                  slli         t3, t1, 13
                  fmv.x.w      t4, fa5
                  andi         a0, a2, 999
                  sltiu        a5, gp, -1780
                  srai         t5, t5, 9
                  srl          t5, a4, ra
                  fcvt.s.w     ft9, s0, rne
                  auipc        s6, 907863
                  fcvt.s.wu    fs10, ra
                  fmv.w.x      fs3, t1
                  sra          a4, a1, s3
                  fmin.s       ft11, ft4, ft9
                  fcvt.w.s     s3, fa5
                  sltiu        a2, s8, 1726
                  or           sp, zero, s10
                  rem          s8, t0, s7
                  slt          a1, gp, s3
                  sll          s2, t3, s1
                  addi         s10, s1, -1116
                  fmul.s       fa3, ft10, ft10, rne
                  slt          s0, zero, t5
                  fclass.s     a2, fa7
                  fsgnjx.s     ft5, fs4, fs5
                  mulhsu       t5, t4, t0
                  slli         a1, a0, 6
                  xori         a6, s2, -449
                  fclass.s     t6, fs8
                  sltu         t2, t2, s9
                  addi         s4, a6, -165
                  and          a0, ra, zero
                  fcvt.w.s     s2, ft4
                  xori         t5, a1, -1751
                  srai         t2, t5, 17
                  slli         s0, t6, 6
                  fsqrt.s      fs6, fs7
                  fcvt.wu.s    t3, fa4
                  mulhu        a5, s11, gp
                  rem          s3, a5, zero
                  slli         t6, s9, 31
                  fmv.x.w      s4, fs9
                  mulhsu       a3, s7, s8
                  lui          zero, 536761
                  sll          s6, ra, gp
                  srli         a7, a4, 20
                  xori         s0, s5, -839
                  sll          a4, a3, t5
                  srl          t3, ra, t5
                  or           s3, t6, t6
                  flt.s        a3, fa0, fs9
                  sltiu        t6, s7, 1499
                  srli         s6, s7, 11
                  slli         t1, a2, 1
                  slt          sp, a6, a5
                  fmv.x.w      a1, ft4
                  fcvt.w.s     sp, ft10
                  fsgnjn.s     fs3, fa3, fa1
                  fle.s        a6, ft0, ft7
                  fclass.s     t6, fs0
                  mulhsu       a4, s6, sp
                  fle.s        s1, fs9, ft3
                  fmv.w.x      fa0, a5
                  sub          s10, a6, s9
                  fsgnj.s      fs2, ft6, ft1
                  rem          s1, s7, s0
                  flt.s        s11, fs6, fs4
                  fsgnjn.s     fs11, fa2, fs8
                  fmul.s       fs9, ft2, fs10
                  slti         zero, zero, -789
                  addi         zero, ra, -245
                  sll          s6, a3, a6
                  fcvt.s.wu    fs6, t3, rup
                  fclass.s     s4, fs4
                  slti         t6, a4, -1763
                  sltu         s8, s0, s6
                  andi         a4, s3, -156
                  or           sp, a3, t5
                  fsgnj.s      fa4, fs3, fs8
                  fmv.x.w      s5, ft10
                  fmv.x.w      s10, ft6
                  fcvt.w.s     t5, fs11
                  fmv.x.w      t3, fa5
                  div          t2, ra, a7
                  fsub.s       fa2, ft1, fs11
                  lui          t6, 544
                  sltiu        a7, s3, -34
                  fdiv.s       fa3, ft3, ft4
                  fsgnjn.s     fs11, ft4, ft8
                  fsgnjn.s     fs3, ft7, ft3
                  fmax.s       fs8, fs0, ft8
                  srai         s5, t5, 20
                  mulh         s4, s4, ra
                  mulhsu       s5, a0, gp
                  feq.s        a6, fa0, fs6
                  fcvt.wu.s    gp, fs7, rmm
                  sltu         s0, a2, a6
                  feq.s        s0, fa1, fs10
                  fsqrt.s      ft2, fs11, rne
                  rem          s1, s3, ra
                  fmax.s       fs9, fa2, fa7
                  or           t3, s11, a0
                  or           s11, s11, a1
                  nop
                  fclass.s     t2, fs5
                  xor          s0, a4, a2
                  remu         a1, s1, s4
                  srai         s2, s10, 11
                  feq.s        s1, ft0, ft3
                  slt          s5, t0, a4
                  div          s0, t6, ra
                  fclass.s     s11, ft0
                  mul          t3, s0, t0
                  fsub.s       ft3, fa3, fs10
                  nop
                  sub          a0, a5, a7
                  fsgnjx.s     ft8, ft7, fs7
                  fsub.s       fa3, ft3, ft3, rtz
                  add          t0, t1, a2
                  sltiu        s7, t0, -5
                  fsub.s       fa3, fs9, fs10
                  fsqrt.s      fs1, fs3, rup
                  sll          a7, t3, s7
                  mul          s7, a0, s0
                  div          a6, sp, a7
                  fcvt.w.s     a0, fs0
                  lui          s11, 529273
                  or           sp, t5, s5
                  addi         t6, a5, 776
                  sub          a3, a0, zero
                  srli         s6, s11, 12
                  fsub.s       fs7, ft3, fs0, rne
                  feq.s        s0, fa7, fs3
                  fmax.s       ft4, fa5, fa3
                  remu         s4, t3, a0
                  feq.s        t5, ft5, ft6
                  fmax.s       fs1, fs1, fa3
                  slli         t4, t2, 7
                  div          s8, ra, s10
                  fle.s        a0, fs3, ft10
                  ori          t5, s0, 1532
                  sll          s11, s10, s6
                  fcvt.s.w     ft9, s3
                  remu         a2, t4, s11
                  sra          a1, s7, s3
                  srai         s0, sp, 5
                  addi         s3, s2, 1165
                  fdiv.s       ft2, fa2, ft11
                  slti         t4, a0, -34
                  mulhsu       a3, ra, s0
                  slt          a3, gp, sp
                  fadd.s       ft7, ft3, fs3, rup
                  xor          a5, t2, s5
                  fcvt.w.s     zero, ft11
                  xori         a3, s0, 1025
                  mulhu        t6, a7, zero
                  fadd.s       ft1, fa4, fa5
                  fmin.s       ft7, fs8, fs10
                  srl          s5, tp, s11
                  fmax.s       fa7, fa7, ft10
                  fsub.s       ft3, ft7, fs10
                  fsgnjn.s     fs1, fs0, fs4
                  lui          s2, 1029016
                  slti         a4, s2, -1
                  fmin.s       fs11, fa6, fa4
                  fmin.s       fs4, ft3, ft8
                  nop
                  nop
                  fsgnj.s      fs11, ft2, fs9
                  xor          s5, a7, s3
                  srli         t2, t2, 26
                  mulh         t2, s10, gp
                  fsgnj.s      ft11, ft10, fa0
                  fmv.x.w      sp, fa7
                  fcvt.s.w     fs5, a2
                  fmul.s       ft5, fs11, fs7, rne
                  sltu         a6, a6, a1
                  flt.s        a1, fa7, fs2
                  fsgnjx.s     fa3, ft5, ft4
                  fdiv.s       fs10, fa7, ft9, rdn
                  fcvt.w.s     s4, ft3, rne
                  lui          a2, 475435
                  fmv.w.x      ft2, a3
                  fsgnj.s      fa5, fa2, ft0
                  fadd.s       ft3, fs7, ft5, rne
                  ori          a5, s3, 2023
                  lui          a5, 619318
                  fsgnjx.s     fa7, fa5, ft10
                  fcvt.w.s     sp, fs4
                  divu         s8, s2, a7
                  fmv.w.x      ft1, t5
                  xori         zero, s11, -1229
                  sub          s8, a6, t0
                  fsgnjx.s     ft10, fs11, fs11
                  auipc        a2, 45413
                  xor          t2, t3, a6
                  mulhsu       s7, s6, t3
                  fsqrt.s      fs6, ft9, rup
                  slti         s3, s8, 1335
                  srai         s8, a0, 10
                  div          a4, t2, t0
                  slt          t4, s8, s3
                  fmv.x.w      s3, fs4
                  divu         s10, a5, s0
                  flt.s        a2, fa0, fa4
                  and          a1, a6, a1
                  fmv.w.x      fs6, t3
                  feq.s        a2, fa4, fa6
                  slti         s1, t1, -1650
                  fsgnj.s      ft0, fa1, fa4
                  fsub.s       fs1, ft11, ft7, rdn
                  mul          s11, s4, a3
                  fmul.s       ft5, fa2, fs3, rdn
                  fcvt.s.w     ft7, s7
                  xori         sp, s10, 226
                  slli         t1, a7, 15
                  srl          gp, t3, a2
                  slt          s1, s4, gp
                  srli         a7, s1, 6
                  add          sp, a7, s10
                  lui          s2, 145515
                  mulhu        s11, t3, s6
                  slli         s5, s9, 5
                  and          t4, a6, s0
                  slt          s5, s10, s3
                  slli         a5, s9, 28
                  mulh         s1, a6, s1
                  rem          zero, s6, gp
                  or           s2, zero, t2
                  fadd.s       ft0, ft0, fs5
                  remu         t2, t5, s8
                  flt.s        a4, ft11, fa2
                  mulhu        a1, a0, a7
                  fmv.x.w      s1, ft10
                  div          s11, ra, a4
                  sub          sp, a1, sp
                  fadd.s       ft4, ft3, fa3
                  fcvt.s.wu    fs1, a0, rne
                  add          a2, s6, t5
                  add          s11, a4, t4
                  fsgnjx.s     fs7, ft6, fs7
                  fdiv.s       fa1, fa4, ft3, rdn
                  fcvt.w.s     s3, fs5
                  srli         t6, t3, 22
                  slli         a2, s7, 14
                  slli         a6, a5, 24
                  fsgnjn.s     fa5, fs2, ft6
                  fsub.s       fa5, fs11, fs7
                  divu         t1, s3, a6
                  and          t1, a4, t3
                  ori          s5, t4, -1704
                  feq.s        a6, fs3, fs8
                  fsgnjx.s     ft2, fs6, fs9
                  and          s7, s9, s4
                  fcvt.s.w     fa1, s8, rne
                  fmul.s       fs4, ft3, fs4
                  fcvt.s.wu    fs2, a7, rup
                  or           gp, t1, gp
                  fsqrt.s      fs0, fs10, rup
                  remu         s7, t4, s8
                  fsgnjx.s     ft6, fa2, ft2
                  xori         s10, a6, -1356
                  fmax.s       fs0, fs2, ft3
                  and          s7, a5, s5
                  or           s2, t4, s8
                  sra          a4, sp, a7
                  fcvt.w.s     s3, fa1
                  fmin.s       ft0, ft2, fa1
                  fsqrt.s      ft9, ft3
                  addi         a0, zero, 1716
                  fmin.s       fs8, fs11, ft4
                  sub          t4, a5, t1
                  fsqrt.s      fs2, fa3
                  fcvt.w.s     a3, fs11, rmm
                  flt.s        a3, fa2, fa6
                  sll          s1, sp, a4
                  ori          sp, s8, 1445
                  sll          a3, t1, zero
                  remu         a3, a1, tp
                  sll          a5, sp, sp
                  slti         s8, t5, 131
                  fmax.s       ft1, ft9, ft11
                  fsgnj.s      fa1, fa1, fa3
                  fsub.s       fs6, ft7, ft5
                  mul          s8, s11, s6
                  div          a2, s3, t3
                  mulhsu       t4, ra, a1
                  sltu         a1, s0, s10
                  flt.s        s0, ft0, ft9
                  sub          s0, t6, t1
                  fsgnjx.s     ft7, fs0, ft4
                  fclass.s     t5, fa0
                  fcvt.s.w     fa4, t4, rmm
                  srl          s3, a5, s10
                  fsgnjn.s     fa4, ft9, fs0
                  xori         t0, a4, -2048
                  fmv.x.w      zero, fa2
                  fmin.s       fs3, fs7, ft6
                  fmv.w.x      fa4, s6
                  fsgnj.s      fs7, fa0, fs1
                  fcvt.s.wu    ft2, sp, rdn
                  fadd.s       fs3, ft6, ft6, rup
                  fmv.x.w      a4, fs4
                  lui          a1, 448352
                  lui          s7, 683225
                  or           t2, zero, s11
                  slt          a0, t0, t1
                  sll          t1, s8, a6
                  fadd.s       fa0, fs5, ft2
                  flt.s        zero, ft0, fs6
                  mulh         s3, s4, gp
                  addi         t6, t0, 1477
                  fdiv.s       ft1, fs6, fs2
                  fclass.s     t6, fa0
                  xor          t2, s9, t5
                  div          s11, t0, a5
                  fsub.s       ft7, fs10, fa1
                  fsub.s       fs7, fs11, ft4
                  andi         s1, sp, 358
                  sll          t3, s0, t5
                  fsgnjn.s     ft2, fs8, fs6
                  slti         s8, a4, 85
                  fle.s        a3, fs2, fa2
                  mulhu        s6, s4, s7
                  divu         a7, s9, a1
                  fsgnj.s      fa3, ft8, ft3
                  fmv.x.w      a6, ft5
                  fmul.s       ft10, fa2, ft2
                  flt.s        s8, ft6, fs8
                  mul          s3, a5, s9
                  fsgnj.s      fs4, fa6, fa7
                  srl          t3, t3, a0
                  sll          s3, ra, s10
                  remu         s10, a6, s2
                  fle.s        gp, ft0, ft3
                  fsub.s       fs0, ft2, ft7
                  sll          a6, a5, s0
                  sra          s5, a7, a5
                  srai         t4, a4, 3
                  slti         t4, a7, -653
                  fmul.s       fs2, fs9, fs10, rdn
                  fmv.x.w      t4, fs1
                  fadd.s       ft8, fs3, fs9, rdn
                  mul          s1, a2, a4
                  fsgnjx.s     fa3, ft0, fs9
                  remu         t0, a6, a3
                  slt          a6, a5, a6
                  mulhsu       t6, t2, tp
                  fcvt.s.w     ft9, t0
                  lui          t2, 81681
                  xori         s2, s4, 1268
                  flt.s        a2, fa2, fa0
                  fsub.s       fa1, ft9, fa7
                  fsgnj.s      fs1, fa6, ft8
                  mul          s6, s0, zero
                  sra          a3, sp, a7
                  nop
                  andi         t6, s8, 582
                  fmv.w.x      ft5, a1
                  sll          t0, t5, s2
                  sltiu        t0, t1, -1611
                  fdiv.s       fa4, fs6, fs5
                  fadd.s       fs4, fs11, fa0, rtz
                  slli         s7, a5, 26
                  xor          a5, s11, t5
                  fle.s        s8, fs6, fa4
                  div          a2, a2, a3
                  fmin.s       fs9, fs7, fs9
                  slli         a4, sp, 12
                  sltu         a7, gp, t6
                  fcvt.wu.s    s3, ft3, rne
                  lui          t6, 803347
                  mulhsu       t5, ra, t5
                  fsgnjn.s     fs5, fs6, fs0
                  fcvt.wu.s    a1, fa0, rdn
                  fdiv.s       fa4, fs5, fa0, rup
                  fcvt.s.w     fa2, a3
                  srai         a2, s8, 10
                  srl          a3, s2, s1
                  sll          a3, a1, tp
                  slli         a3, a7, 2
                  mulh         gp, s3, a4
                  fcvt.s.w     ft4, t2
                  sub          s3, s0, t1
                  and          s1, tp, a5
                  nop
                  xor          s1, gp, tp
                  fmax.s       fs11, ft8, fs9
                  fcvt.wu.s    t0, fa7, rmm
                  nop
                  srai         s7, t3, 6
                  xor          s10, s6, gp
                  slt          t5, ra, t5
                  sub          s1, a1, a6
                  srl          t1, zero, s10
                  fsgnjx.s     fs2, ft5, fs9
                  flt.s        s2, fs1, ft8
                  divu         a7, t4, s0
                  srl          s8, t5, t0
                  fcvt.wu.s    zero, ft7
                  fsgnj.s      ft3, fs2, fs8
                  fle.s        s8, ft6, fs1
                  fsgnj.s      fs6, fa0, fa0
                  mulhu        a4, zero, s8
                  sll          gp, zero, zero
                  divu         t4, t1, s4
                  fsgnjn.s     fa3, ft0, ft5
                  xor          t6, t2, a7
                  slt          a0, s10, s6
                  add          s4, s4, s1
                  fcvt.s.wu    fa5, a1
                  fcvt.w.s     s11, fs0, rmm
                  rem          s10, s7, s3
                  ori          s5, a6, 1319
                  srli         sp, t0, 4
                  nop
                  fsgnjx.s     fa1, fa4, ft11
                  fle.s        a5, ft4, ft0
                  rem          sp, s8, s2
                  fmv.x.w      s10, fa3
                  sra          t0, a2, a5
                  addi         s6, s5, 1673
                  fsgnj.s      ft9, fa4, fs6
                  srli         s6, t6, 19
                  fdiv.s       fa4, ft1, fs6, rne
                  fle.s        a1, fa2, fa5
                  fadd.s       fa5, ft0, fs0
                  fsgnjx.s     fs7, fa7, ft9
                  fmul.s       fa3, fs7, fs2, rdn
                  and          a1, a3, t3
                  mulhsu       a3, s9, a5
                  fmin.s       ft8, ft2, fs4
                  mulhu        s0, s0, sp
                  mulh         t4, ra, s8
                  fsgnj.s      fa5, fa4, ft9
                  fsgnj.s      fs0, fs5, ft9
                  sll          s6, a4, ra
                  fmin.s       fs3, fa7, fa0
                  fmv.x.w      s11, fs1
                  sra          t6, a6, t0
                  fdiv.s       fs1, fs8, fs4
                  flt.s        s2, ft3, fs6
                  xor          sp, a3, s11
                  fmv.w.x      fs8, s1
                  rem          gp, s2, a4
                  fmin.s       fs4, ft1, fs2
                  xor          s6, s2, s3
                  fmv.w.x      ft2, s8
                  fcvt.s.wu    ft1, s10, rmm
                  slt          a0, t1, t5
                  xori         s7, a2, -240
                  mulhsu       t5, a3, s0
                  fcvt.s.wu    fs3, a1, rtz
                  nop
                  divu         a7, a3, t4
                  fcvt.s.w     fs3, t4
                  srli         t5, sp, 21
                  mulhu        a4, t2, s8
                  fsqrt.s      ft11, fs6, rmm
                  srai         s1, s8, 0
                  fcvt.s.wu    fs8, s6, rmm
                  mulhu        t4, a4, s1
                  fdiv.s       ft1, ft8, fs10
                  sll          s3, s0, a3
                  remu         a3, s2, a3
                  slti         s8, t3, 327
                  sltu         t3, a6, s1
                  div          t3, s9, t0
                  fmin.s       fs9, fa1, fs1
                  sra          s2, s6, a6
                  fmin.s       ft4, fa5, ft9
                  fclass.s     t2, fa5
                  slli         a3, s1, 2
                  lui          a7, 825962
                  sub          sp, t0, s9
                  fdiv.s       ft7, ft8, fa6
                  mulh         t0, s10, t0
                  fcvt.wu.s    s5, fa5, rne
                  sll          t4, t6, t0
                  nop
                  nop
                  mulhsu       gp, s3, a0
                  nop
                  fadd.s       fa4, fs10, ft2
                  and          a3, sp, a0
                  srli         a3, t5, 12
                  add          a3, a1, a4
                  fclass.s     zero, fs1
                  fcvt.w.s     a2, fs4, rdn
                  fmin.s       fs7, fs8, fs4
                  slt          a7, a4, s2
                  mulhu        a5, s7, t0
                  and          s11, s4, a7
                  srli         t3, t3, 30
                  fsgnjn.s     fs0, fs10, fa1
                  mulhsu       s4, zero, sp
                  remu         a0, s6, sp
                  add          s7, s8, t5
                  slti         a5, a2, 997
                  sltu         s1, s4, zero
                  sltiu        gp, a3, -522
                  fmax.s       fs10, ft6, fa1
                  srli         s5, s8, 1
                  addi         a4, tp, 1104
                  or           s0, a0, t2
                  flt.s        t2, fa4, fs8
                  feq.s        a5, fs6, fs11
                  mulhsu       s5, sp, s5
                  fcvt.s.wu    fs7, a1
                  ori          a4, s4, -605
                  add          s5, s4, s6
                  auipc        s7, 812985
                  srai         s8, s1, 9
                  fmv.x.w      a1, fs1
                  sltiu        t2, ra, -461
                  xori         sp, a1, 1034
                  sltu         s7, s2, s3
                  fmv.x.w      a3, fs0
                  sltu         t6, a0, s6
                  feq.s        t1, fa7, ft11
                  xor          a6, a1, t0
                  fmul.s       fa5, fa1, fs2
                  xor          s3, sp, s4
                  lui          s8, 787233
                  xori         zero, t6, 452
                  div          a3, a2, a6
                  feq.s        s10, ft9, ft9
                  sra          a1, a7, gp
                  remu         t6, a6, s3
                  sra          a3, s0, ra
                  div          t1, t3, tp
                  fdiv.s       fs8, ft10, ft5, rdn
                  xori         a3, a2, -796
                  fsgnjn.s     fs4, ft9, fa3
                  sltu         s11, ra, a2
                  xor          sp, sp, a6
                  rem          a3, t6, a2
                  lui          a7, 443216
                  add          t0, a6, s6
                  xori         a2, t1, 1127
                  mulhsu       s4, a2, t2
                  add          t6, t4, a2
                  fsgnjn.s     ft7, ft3, fs11
                  fsqrt.s      fs10, fs9, rdn
                  fle.s        s4, ft3, fs0
                  fcvt.s.wu    ft4, gp
                  sltiu        s7, sp, 1240
                  sra          t5, s5, a7
                  remu         a7, t5, t2
                  slt          gp, s7, s10
                  mulhsu       t5, s3, a5
                  srl          s3, s4, s10
                  sub          t3, s11, s10
                  remu         gp, a3, a1
                  fcvt.s.w     fs7, t1
                  remu         a4, a4, s6
                  lui          a2, 384565
                  remu         a6, s0, a7
                  sub          t2, t2, s2
                  mulhu        sp, t3, s5
                  ori          t5, tp, 815
                  fcvt.s.wu    fs0, s3, rup
                  fle.s        a6, fa4, fs10
                  slti         a6, t3, -1884
                  sub          a3, a6, a2
                  remu         a4, a6, a4
                  fmin.s       ft10, fs4, fs7
                  sll          a0, gp, t3
                  slt          s0, t4, s1
                  fsgnj.s      fs9, fa0, fa1
                  mulh         t6, s9, tp
                  fmv.w.x      fa4, s0
                  flt.s        a7, fa4, ft4
                  mul          s2, s2, a5
                  fcvt.s.wu    fs7, a4, rup
                  fsqrt.s      fa3, ft3
                  fmv.w.x      fa7, s3
                  srli         s6, t5, 6
                  ori          s1, a0, -1777
                  fmv.w.x      fs0, t6
                  flt.s        s1, fs1, fs11
                  or           t4, tp, s10
                  feq.s        a7, ft9, fs11
                  mulhsu       t3, s2, a4
                  fdiv.s       fa5, ft11, fs2, rtz
                  feq.s        s6, ft4, fa3
                  fcvt.wu.s    zero, fs10
                  fle.s        sp, fa4, fa4
                  fclass.s     t1, fa3
                  ori          a2, a0, 1243
                  srai         a6, t2, 14
                  fsub.s       fs9, fa1, fs3, rtz
                  fsgnjn.s     ft0, fa7, fa0
                  fmul.s       ft3, fa3, fa2, rup
                  fle.s        t6, ft1, ft5
                  addi         s4, s8, -1004
                  fle.s        s1, fs1, ft3
                  nop
                  slli         s10, s3, 26
                  fsgnjx.s     ft2, fs3, fa7
                  remu         a7, a3, s10
                  sltu         t1, s11, a3
                  sltiu        s5, tp, -499
                  mulhu        sp, t5, a5
                  fcvt.s.wu    fa7, t1
                  remu         s6, s5, s1
                  nop
                  sra          t3, s11, tp
                  fsgnjn.s     ft5, ft0, ft2
                  mulhu        a7, a5, s3
                  srai         s0, s4, 8
                  srai         s0, s0, 20
                  div          s11, s8, t2
                  fcvt.s.wu    fs6, s11, rtz
                  srai         a0, s0, 28
                  fcvt.w.s     s11, ft6
                  srli         sp, t6, 27
                  srli         a4, gp, 8
                  fsgnjx.s     fs7, ft5, ft11
                  andi         t3, a4, -503
                  ori          t0, s2, 807
                  ori          t3, s10, 806
                  mulhsu       s10, s6, t2
                  fcvt.wu.s    a2, fa6
                  fsub.s       fa1, fa5, fs2
                  sltiu        s0, t1, -1917
                  fcvt.s.w     ft1, a5, rtz
                  fdiv.s       ft3, ft1, fs5
                  sra          t1, sp, t3
                  sll          s0, tp, s5
                  fsgnjx.s     fa1, fs1, fa3
                  mulh         a1, s4, s3
                  fmax.s       fa1, ft6, fs1
                  fclass.s     s2, fa6
                  mulh         a6, a3, t3
                  rem          a4, s8, t4
                  fmax.s       ft5, ft4, fs4
                  fclass.s     a4, fa4
                  fmul.s       fa1, fs7, fs2, rdn
                  remu         s1, a3, ra
                  and          s4, t2, a3
                  sltiu        s6, s2, 648
                  sra          s6, a5, t1
                  ori          s3, t4, -1561
                  sra          a2, ra, s0
                  sltu         a6, a5, a0
                  fclass.s     s7, ft1
                  mulh         s1, a0, a1
                  feq.s        s0, fs4, fs0
                  fcvt.w.s     a7, fs2, rup
                  fmul.s       ft2, fs0, ft1
                  xori         s2, a2, 938
                  sub          s7, t5, a6
                  nop
                  srl          t6, gp, a6
                  xor          s5, a6, a1
                  and          sp, s3, s9
                  fsgnj.s      ft8, fa6, fa0
                  mul          s1, s0, s1
                  andi         t4, a4, -666
                  srai         a1, a0, 29
                  fsgnjn.s     ft3, fa6, ft11
                  feq.s        a5, fs1, fs9
                  rem          a3, t6, a7
                  fcvt.wu.s    t2, fs1
                  addi         s5, s9, -254
                  fcvt.wu.s    a0, fa4
                  or           gp, s2, tp
                  add          a0, s7, t1
                  xor          sp, t1, a1
                  sll          s11, a7, t2
                  fmv.w.x      ft6, t6
                  add          s2, t4, s2
                  andi         t0, s1, -1838
                  srli         s10, s6, 24
                  nop
                  flt.s        t1, fs4, fs5
                  sub          a7, a6, t0
                  fcvt.w.s     a5, ft4, rmm
                  slt          t1, zero, s0
                  srai         s1, a2, 17
                  mulhu        s1, zero, t4
                  sub          t6, sp, tp
                  fclass.s     a0, ft4
                  fmv.x.w      s7, fa3
                  fclass.s     a0, ft5
                  fsqrt.s      ft8, ft5, rup
                  slti         t6, s10, 12
                  add          a2, s8, s9
                  sra          t0, s10, s8
                  mulhu        t5, s0, s2
                  slt          a4, s5, a2
                  sltu         a5, a5, a7
                  mulhsu       s5, gp, t5
                  remu         gp, s6, s3
                  div          a3, t2, s3
                  flt.s        a7, fa7, ft10
                  mulhsu       s1, t5, s9
                  fle.s        s6, fa7, fs5
                  add          s6, s7, t1
                  fcvt.w.s     t5, fs10, rmm
                  mulhsu       s3, s4, s0
                  mulhu        s7, a5, s4
                  lui          t6, 40791
                  slli         s10, s8, 15
                  xor          s3, tp, s0
                  sra          s10, s6, t6
                  sll          t3, t5, s5
                  mul          s8, s7, t1
                  fclass.s     t5, fa2
                  slli         t4, a6, 6
                  slti         s7, s10, 214
                  fcvt.s.wu    fs0, s0
                  sra          s5, s7, t5
                  mulhu        s6, ra, gp
                  slt          t2, tp, ra
                  fcvt.s.w     ft3, a7
                  mul          t4, a0, a1
                  xori         s3, t5, -1561
                  slti         s8, sp, -1343
                  remu         s6, sp, s4
                  andi         t6, s4, -152
                  addi         s4, sp, -787
                  sltiu        s11, s11, -1812
                  lui          s8, 615098
                  fclass.s     s3, ft0
                  fcvt.w.s     a7, ft9, rmm
                  fmax.s       ft4, fs0, ft9
                  fsgnjn.s     fs5, fa6, ft10
                  fsqrt.s      fs5, ft1, rup
                  fmv.w.x      ft8, a7
                  mul          a2, s10, s11
                  fclass.s     a5, ft10
                  divu         t5, s8, s6
                  mul          s0, t3, a4
                  div          s7, s7, s10
                  fcvt.s.w     fs3, a2, rmm
                  fcvt.s.w     fs10, a5
                  fle.s        s4, fa0, ft2
                  remu         zero, a4, s10
                  fcvt.s.w     ft8, a1
                  fmax.s       fa7, fs5, fs6
                  div          a2, ra, s3
                  srai         s10, a3, 15
                  fmv.x.w      s10, ft7
                  nop
                  slt          s4, s1, ra
                  lui          a3, 535726
                  sltiu        s1, s7, 1684
                  fsqrt.s      ft8, fa4
                  or           a1, a1, s5
                  or           a6, s11, t5
                  andi         s2, t5, 553
                  divu         s11, s4, a6
                  fcvt.w.s     s2, ft5
                  fsgnj.s      ft2, fa4, ft8
                  srai         a6, s8, 12
                  divu         s11, t6, s0
                  nop
                  fcvt.s.wu    fs8, t0
                  remu         a5, a2, tp
                  slt          s11, t2, gp
                  remu         t3, t4, a6
                  srai         s6, gp, 22
                  mul          s4, a2, t1
                  rem          a0, s5, t4
                  xori         t4, ra, 1597
                  sltiu        s0, a5, -937
                  srl          a0, s5, t5
                  mulhsu       s6, s10, gp
                  remu         sp, a0, sp
                  fsgnjn.s     fs7, fs0, fs2
                  feq.s        a4, ft0, ft9
                  sub          a7, t2, s4
                  flt.s        s1, ft1, fa4
                  sltiu        s2, a5, -1740
                  ori          t3, a7, -550
                  fcvt.s.wu    fs3, a1
                  mulh         s4, a6, t0
                  lui          t6, 507509
                  sll          s5, s7, a1
                  fcvt.s.w     fs5, t3
                  fcvt.w.s     s8, fs0
                  mulh         t4, t3, s6
                  fsqrt.s      ft4, fs2, rmm
                  fdiv.s       fa3, fs6, ft10, rdn
                  add          s6, t6, s8
                  and          a0, t3, a2
                  fsqrt.s      ft10, ft3, rtz
                  fsgnjn.s     fs2, fs8, fs4
                  fclass.s     s5, fs2
                  xori         a3, a0, 447
                  and          a0, tp, a4
                  srai         t4, s9, 15
                  mulhu        sp, s9, sp
                  or           zero, t4, tp
                  srli         s7, sp, 2
                  flt.s        sp, fa0, ft4
                  feq.s        s6, fs3, ft7
                  ori          t1, sp, -603
                  or           s1, s11, s3
                  fdiv.s       fs11, ft4, ft4, rdn
                  sltiu        t2, a0, 809
                  feq.s        a2, fa1, fs5
                  xori         s6, s6, -955
                  addi         s8, s7, -1951
                  xor          t4, s7, t0
                  fadd.s       ft3, ft1, ft4, rdn
                  nop
                  fmv.x.w      s10, fs10
                  and          t1, t3, gp
                  slti         zero, s0, 1657
                  div          zero, a2, tp
                  mulhu        s4, s7, t2
                  fcvt.w.s     t6, fs4
                  andi         s6, a3, 1246
                  fsgnjn.s     ft9, fa5, fa3
                  addi         t5, t6, -1896
                  mulh         sp, t1, s5
                  xor          a6, s4, tp
                  rem          s8, s7, t5
                  fcvt.s.wu    ft4, zero
                  flt.s        a4, ft10, fa1
                  nop
                  nop
                  fcvt.s.wu    ft1, sp
                  xor          s2, s5, zero
                  lui          s3, 595845
                  auipc        a4, 836558
                  fsgnjn.s     fa7, fs3, fs0
                  fcvt.w.s     t0, fa1, rdn
                  divu         s2, s0, t3
                  or           t0, sp, t4
                  slli         t3, zero, 19
                  sltu         a6, s7, a4
                  rem          a0, ra, a0
                  sub          gp, s3, tp
                  sra          s0, sp, t1
                  or           t6, ra, s9
                  sub          t5, t6, t3
                  fclass.s     t0, ft5
                  xori         t4, s9, 395
                  slt          t3, s3, a7
                  sll          t0, s8, s0
                  mulhu        t1, a5, s4
                  srl          a3, t0, s3
                  srli         zero, s11, 10
                  slti         a2, s3, -51
                  slli         a5, a5, 19
                  xori         a2, t0, -1818
                  divu         a7, t3, s1
                  srl          a4, s0, t2
                  slli         t6, t3, 0
                  flt.s        a1, fs1, ft9
                  xor          s5, a4, a2
                  fmul.s       fs6, fa3, ft7, rup
                  feq.s        t1, fa1, fa7
                  mulhsu       a0, s10, a5
                  rem          zero, a3, a4
                  fmul.s       fa7, fa6, ft10, rdn
                  auipc        s11, 865045
                  xori         t1, t1, 1410
                  remu         s4, t4, a2
                  slti         a7, zero, -85
                  fsub.s       fs4, ft3, ft3
                  feq.s        zero, ft10, ft0
                  div          zero, zero, ra
                  flt.s        s3, fa3, fa5
                  flt.s        a4, fs8, fs11
                  fsgnj.s      ft9, fa6, fs4
                  and          t0, t3, a3
                  fcvt.s.w     ft7, t4, rne
                  feq.s        s1, ft11, fa3
                  flt.s        t4, fa4, ft6
                  fadd.s       ft10, fs4, ft8, rtz
                  sltu         s5, s5, s10
                  srl          zero, ra, ra
                  fadd.s       fs10, fs8, fa1, rne
                  fdiv.s       ft3, fs4, ft5
                  add          t5, sp, s7
                  fsgnjn.s     ft10, ft9, ft11
                  or           s11, ra, gp
                  mulhu        a4, s7, a4
                  divu         s5, t1, t0
                  andi         s2, s4, 884
                  fadd.s       ft4, fa3, fa7
                  mulhu        a3, s2, t4
                  rem          t6, t6, s11
                  mulhu        t6, a6, s7
                  fcvt.s.w     fa1, t5, rdn
                  fcvt.w.s     s2, ft3, rtz
                  mulhsu       s6, t0, a5
                  sltiu        s10, s6, 1414
                  feq.s        a2, fs11, fs5
                  fmv.w.x      ft2, a5
                  and          s11, a5, s9
                  sltu         a7, a0, zero
                  div          a3, s8, s7
                  fcvt.s.wu    ft3, s2
                  fadd.s       fs6, ft7, fs0, rdn
                  fmul.s       ft4, fs10, fs6
                  fdiv.s       fs5, ft7, fa4, rdn
                  flt.s        s5, fs3, fa5
                  fclass.s     t0, fa6
                  or           a5, a4, s3
                  fsgnj.s      fs5, fa4, fa0
                  fclass.s     zero, ft8
                  fsgnjx.s     fs2, fs5, ft5
                  fsgnjn.s     ft8, fs7, ft0
                  divu         s8, s1, a6
                  div          s10, s0, s2
                  fadd.s       fs2, fs3, fa7
                  addi         s5, s5, -2026
                  fsub.s       ft0, ft1, ft6
                  flt.s        s2, fa3, fs4
                  sra          gp, t0, s11
                  and          s1, s0, t4
                  slti         t3, sp, -255
                  or           a7, t6, a5
                  lui          sp, 106783
                  flt.s        a4, fs2, ft9
                  slti         t2, s11, -709
                  rem          s0, a0, s5
                  slli         gp, t6, 15
                  fle.s        s6, ft1, fs8
                  fsqrt.s      fs0, fs6
                  fcvt.w.s     t4, fa1, rtz
                  fmul.s       fs9, fa7, fs5, rtz
                  xor          t0, a0, t3
                  sll          s4, s1, s9
                  fadd.s       fs6, fs8, ft4, rdn
                  sll          s10, a5, s7
                  fcvt.s.wu    ft11, t0, rmm
                  fmul.s       fs4, fa6, fs7, rup
                  fcvt.s.wu    ft8, a3
                  srli         a0, t2, 18
                  srli         t2, t2, 2
                  fadd.s       fa5, fa4, fa2
                  mulhsu       s1, s5, a6
                  fsgnjn.s     fa4, ft7, fs4
                  fle.s        a4, ft11, ft6
                  remu         a6, t2, t5
                  fsgnj.s      fs10, fs1, fs7
                  div          t6, s10, s7
                  fsgnj.s      ft9, ft6, fs4
                  slti         a6, s6, 529
                  ori          a0, s7, -569
                  mulh         s5, a4, s0
                  ori          t3, a3, 848
                  slli         s11, a5, 9
                  remu         s11, t5, s2
                  mulhu        s10, a4, ra
                  fle.s        a3, fa5, ft5
                  and          s7, gp, s7
                  slt          s4, s5, tp
                  divu         s5, a5, zero
                  fsqrt.s      ft8, fs1
                  flt.s        a0, ft10, fs4
                  sub          s10, t6, s8
                  addi         s5, tp, -1551
                  fdiv.s       ft7, fs11, fs3
                  slt          s6, s10, a6
                  nop
                  fmax.s       ft8, ft11, fa7
                  srl          s2, a3, sp
                  slli         t5, s3, 14
                  div          s11, zero, s1
                  srl          a2, s4, s10
                  mulh         a1, a5, a4
                  fmul.s       fs11, fa4, ft0, rmm
                  fsqrt.s      ft10, fa6
                  remu         zero, s11, a2
                  fmin.s       ft10, fs11, fs2
                  fsgnjx.s     ft4, ft11, fs5
                  xori         a7, t5, -1867
                  sltu         s8, s11, a0
                  xori         s1, gp, 1581
                  remu         t2, t2, s6
                  mulhsu       zero, t4, a1
                  andi         t0, s6, -1918
                  fle.s        a7, ft8, fs3
                  mulh         s1, a2, s3
                  mul          t1, a0, tp
                  srli         t6, s7, 22
                  slt          s8, s2, a4
                  srl          s4, ra, tp
                  fmax.s       fs9, fa3, ft11
                  fclass.s     gp, fs4
                  sub          s2, s0, t2
                  slti         t2, s1, 263
                  fmv.w.x      fs0, s7
                  fadd.s       fa7, ft8, fs4, rmm
                  feq.s        a7, ft3, fs6
                  andi         a6, s7, 713
                  andi         a2, s10, 317
                  feq.s        s4, fa6, ft5
                  srl          a7, s8, s9
                  remu         gp, zero, a5
                  feq.s        s3, fa5, ft9
                  fcvt.s.wu    ft9, gp, rdn
                  slti         a3, s11, -2011
                  fsgnjx.s     fs10, fs2, fs6
                  flt.s        t0, fs9, fs4
                  fsgnj.s      ft5, fa2, ft10
                  fmul.s       fs10, ft1, ft9
                  xori         a1, s2, 1666
                  xor          a3, a0, s2
                  flt.s        zero, fs1, fa1
                  fsgnjx.s     ft9, ft3, ft7
                  fmul.s       ft1, ft1, fs10, rne
                  srl          s8, s9, s3
                  fcvt.w.s     s10, ft8
                  fle.s        t6, ft1, fs5
                  xor          t3, tp, t0
                  mulhsu       s3, s2, a0
                  andi         s11, s4, 934
                  fclass.s     t1, ft7
                  flt.s        s4, ft3, ft8
                  remu         t4, sp, s3
                  sub          t0, s3, t5
                  srli         sp, ra, 25
                  slt          s4, s0, a7
                  fmul.s       ft5, ft0, ft0, rup
                  add          t5, t0, a5
                  fcvt.w.s     t5, fs9, rtz
                  ori          a6, t3, 1017
                  fcvt.wu.s    a6, fa5, rtz
                  flt.s        t0, ft1, fa6
                  sll          a1, s2, tp
                  sll          t5, ra, ra
                  fmul.s       fs11, ft3, fa4
                  flt.s        sp, ft11, ft10
                  fcvt.s.wu    ft11, s0, rdn
                  lui          a2, 205347
                  ori          s3, t2, -47
                  mulhsu       a5, gp, s5
                  div          s7, ra, a4
                  fsqrt.s      fa7, fa4
                  fcvt.wu.s    t3, fs4
                  fmax.s       fa6, ft4, fs0
                  remu         s5, t4, s3
                  srl          t2, s0, a3
                  fsgnj.s      fa1, fs6, fs3
                  srl          zero, a1, s1
                  andi         a4, s4, -1608
                  mulhu        a4, a2, t5
                  nop
                  fmax.s       ft2, ft7, fa6
                  rem          a1, t1, s9
                  fle.s        zero, ft11, fa0
                  fdiv.s       fs11, fa1, ft9, rmm
                  or           s4, s0, s3
                  xori         a1, s1, -1326
                  srli         t5, t4, 5
                  slt          a4, t6, a5
                  nop
                  fcvt.s.wu    fs3, a6, rmm
                  remu         t6, s1, t6
                  andi         t3, s4, -1927
                  fsgnj.s      fs6, ft2, fa4
                  addi         a0, sp, -1101
                  fdiv.s       ft4, fs6, fa2
                  sltu         t0, a2, t3
                  rem          s7, s0, s0
                  lui          s5, 776516
                  xor          a5, t6, t6
                  slti         a4, t0, 1172
                  andi         sp, a2, -625
                  fsqrt.s      ft0, fs5, rne
                  slti         t0, gp, 592
                  nop
                  feq.s        s4, fs9, fs4
                  fcvt.w.s     a2, fs6, rdn
                  srai         t6, t4, 17
                  rem          s4, s0, zero
                  or           s6, zero, a4
                  slti         zero, a5, 775
                  remu         a1, s2, gp
                  fmv.x.w      a6, fs1
                  slti         t4, t4, -726
                  nop
                  mul          a7, s0, s7
                  flt.s        s7, fs5, fa4
                  fclass.s     s7, fs1
                  mulhu        s1, t2, s6
                  ori          s5, zero, -495
                  fcvt.wu.s    t1, fa5
                  fle.s        s5, ft6, ft1
                  fcvt.wu.s    t1, fs5
                  fmul.s       fs3, ft11, fa0, rup
                  mul          a4, tp, t1
                  srai         s5, t6, 0
                  fclass.s     a4, ft8
                  fadd.s       ft8, fs3, fa0
                  sltu         a7, t3, s6
                  sub          zero, sp, s4
                  fdiv.s       ft3, fa1, fa6, rne
                  ori          a4, s6, 993
                  sll          a7, s9, t1
                  fclass.s     s6, fs7
                  slti         a0, s0, 1360
                  and          s10, a6, a5
                  fclass.s     s11, fa7
                  mulh         a7, s8, t2
                  flt.s        s3, fs4, fs11
                  lui          a2, 870642
                  fsgnjn.s     fa7, fs10, fs2
                  fcvt.w.s     a5, ft11, rdn
                  ori          s5, a3, -1839
                  sra          t2, a3, s2
                  andi         s4, a7, 1034
                  slt          t3, t4, t4
                  slli         t5, t6, 11
                  fmin.s       fs6, fa1, fs7
                  fsgnjx.s     fs1, fs4, ft0
                  srai         s4, a5, 26
                  slli         gp, a5, 5
                  sll          t1, t2, a6
                  remu         t6, s10, a6
                  fle.s        t6, fa6, ft9
                  srli         a5, a3, 26
                  divu         s11, tp, s3
                  addi         s3, s5, -763
                  slt          zero, s5, s6
                  fsgnj.s      fs8, ft1, ft2
                  fdiv.s       fa2, fa4, fs6
                  fdiv.s       fa3, fa5, fa4, rdn
                  fmv.w.x      fs5, gp
                  mulh         t3, s7, s11
                  fsgnjx.s     fs9, fs2, fs1
                  nop
                  sub          t5, s0, a0
                  fclass.s     a6, ft2
                  rem          a5, t4, t3
                  feq.s        a1, fa0, ft3
                  srai         s5, t2, 27
                  srl          a6, s7, a0
                  fmul.s       ft11, fa2, fs1
                  andi         t4, ra, 1328
                  srli         s11, s7, 18
                  fsub.s       ft6, ft7, ft1, rup
                  sltiu        a5, t1, 1588
                  slti         s6, t2, 1098
                  or           s10, t0, t2
                  divu         s1, s9, s11
                  divu         t1, s11, s7
                  fmv.w.x      ft7, s2
                  mulhu        s10, zero, a2
                  xor          a6, s5, a2
                  addi         t3, s8, 907
                  srl          t4, a3, s2
                  fsgnjx.s     fa1, fs2, fs3
                  add          s10, s11, zero
                  mul          a2, a4, gp
                  divu         t4, t3, a2
                  or           gp, s3, gp
                  divu         zero, s4, t5
                  fclass.s     s10, ft1
                  sra          zero, gp, a5
                  sra          t2, a0, gp
                  slti         s3, s2, 1235
                  xori         a2, s7, -1747
                  remu         t0, zero, a6
                  addi         s6, sp, 877
                  mulhsu       s2, s5, t3
                  fsgnj.s      fs1, ft4, ft9
                  mul          s11, a0, a3
                  sra          a2, zero, tp
                  fsgnjx.s     fs5, ft5, fs10
                  fcvt.s.wu    ft4, s11, rtz
                  fclass.s     s3, ft3
                  fcvt.w.s     t6, fs3, rtz
                  flt.s        s5, fa0, fa0
                  srai         s8, t0, 26
                  fmv.w.x      fs11, s1
                  fmul.s       fa2, fs2, ft1
                  sub          s8, s2, a7
                  sub          s0, s9, t4
                  div          s5, sp, t6
                  fmul.s       fs5, fa6, fs7, rdn
                  sltu         t1, s11, s3
                  mulhu        s8, s1, s2
                  fsub.s       fs7, ft3, fs8
                  fmv.x.w      s8, ft7
                  remu         t3, s7, s3
                  fadd.s       ft10, ft4, ft2
                  fcvt.wu.s    zero, fs3
                  auipc        s6, 933001
                  addi         s2, sp, -200
                  lui          gp, 486350
                  auipc        t4, 384406
                  fmin.s       ft3, fs2, ft3
                  fmin.s       fs1, ft5, fa3
                  srai         a6, a3, 19
                  fmax.s       ft10, ft4, ft7
                  srai         a5, t5, 30
                  mul          s3, a6, s11
                  ori          a3, a0, -949
                  lui          a5, 865925
                  srl          a0, t3, s7
                  fmax.s       fa0, ft3, ft10
                  fsqrt.s      fs7, ft4
                  mulh         s7, s9, s0
                  slti         s3, t4, -1535
                  fcvt.wu.s    s11, fa6
                  fcvt.wu.s    t5, fa6
                  fmv.x.w      s4, fa4
                  fle.s        t4, fs2, fa6
                  flt.s        sp, fa5, ft11
                  fmul.s       fs10, fs1, ft5, rne
                  remu         sp, s2, t4
                  feq.s        a6, fs1, fa4
                  addi         zero, t1, 1240
                  xori         s3, t1, -1957
                  and          s1, t1, s11
                  fmax.s       fa2, fs1, ft7
                  sltiu        s2, s0, 621
                  fmin.s       ft3, ft11, ft7
                  mulh         a2, t0, a5
                  feq.s        t1, ft3, fa2
                  fclass.s     s3, fs8
                  fclass.s     a5, fs0
                  flt.s        s10, fs10, fs8
                  fsgnjn.s     ft0, ft7, fa5
                  srli         t5, a3, 30
                  fcvt.s.w     ft7, a2, rmm
                  sra          s3, s4, a7
                  sltiu        t3, a7, 991
                  fmv.x.w      sp, ft2
                  fdiv.s       fs1, ft6, fa7, rup
                  lui          s8, 49639
                  srl          s6, t1, a0
                  fsgnj.s      ft5, fa5, ft2
                  fsgnjx.s     ft10, fs3, fs11
                  sltiu        t1, a0, -393
                  fcvt.wu.s    gp, fa2, rdn
                  remu         s6, a0, a4
                  fcvt.s.wu    fa0, a0, rne
                  fsgnjn.s     fs1, ft5, ft1
                  fsqrt.s      fs4, fs8
                  fsgnjx.s     fa6, fa4, fs2
                  and          a1, s1, t2
                  mulhu        s2, ra, s0
                  fmin.s       ft2, fs10, ft4
                  srai         a5, t2, 15
                  rem          t0, s1, s10
                  fsgnjx.s     fa5, ft5, fs1
                  add          a5, a3, t1
                  sltu         t6, a0, t3
                  mulhsu       s1, s4, t6
                  sll          s1, t6, s2
                  auipc        a7, 828050
                  lui          a5, 813620
                  and          t4, s5, t5
                  mul          s0, s9, a1
                  fmin.s       ft5, fs1, fs2
                  slti         s11, s8, 297
                  nop
                  fdiv.s       fs0, fs2, fs9, rup
                  addi         zero, s4, -1651
                  fcvt.s.w     ft9, a1
                  fsub.s       ft3, ft1, fs1, rne
                  slt          a5, s2, s4
                  fmax.s       fs4, fs6, fs5
                  fcvt.s.wu    fa3, a2
                  sll          a2, zero, s1
                  ori          t1, s3, 458
                  mulh         a5, gp, zero
                  rem          a7, a3, a7
                  fcvt.s.w     ft9, s3
                  fsgnjn.s     fs5, fa6, fa2
                  mulhu        a0, s8, s0
                  andi         s7, s8, -1286
                  sltu         s8, a5, t5
                  mulh         gp, a0, s9
                  addi         a4, s11, -428
                  fsgnj.s      fs9, fa5, fa7
                  fmv.w.x      fs4, a6
                  fmv.w.x      fs0, s7
                  xor          a4, s2, a4
                  fsgnj.s      fa2, ft1, fa1
                  slti         t1, s0, -633
                  sub          a5, s10, ra
                  sltiu        s7, t5, -1072
                  fcvt.wu.s    s5, fs11, rtz
                  lui          a5, 712933
                  addi         s1, t4, -1875
                  lui          a7, 166525
                  flt.s        s4, ft7, fs5
                  mulhu        t4, t5, s9
                  mul          a6, s0, a0
                  fsqrt.s      fs0, fs11
                  sub          s6, tp, a1
                  feq.s        a0, ft0, ft9
                  mul          s4, a2, s2
                  and          s0, a2, s0
                  and          s4, a6, a6
                  mulhu        s5, a3, s6
                  andi         s3, ra, 502
                  sltiu        a4, gp, 2017
                  sra          a7, t5, a0
                  remu         t2, tp, t0
                  fmin.s       fs10, fa5, ft4
                  mulhu        s4, a6, a0
                  and          s6, s11, s8
                  and          t6, t1, gp
                  addi         gp, t5, -1179
                  fsub.s       fa6, ft8, fs6, rne
                  rem          s6, s3, s0
                  nop
                  xori         gp, a2, 1738
                  sltu         t5, a0, ra
                  remu         s7, t1, a5
                  feq.s        s11, ft2, fs11
                  fmul.s       fa2, ft9, fs9, rmm
                  ori          a4, a4, 1851
                  fmul.s       fs1, fs1, ft6
                  fsgnjx.s     fa4, ft3, fa2
                  fsgnjx.s     fs11, fa7, fs7
                  add          t2, s6, s4
                  fsqrt.s      fs6, fs0, rmm
                  srai         t2, a0, 21
                  and          s3, t2, a7
                  or           t4, t4, s10
                  remu         a7, a5, t2
                  fsgnj.s      fs5, fs2, fs0
                  ori          zero, s9, -1553
                  remu         gp, t0, a0
                  fadd.s       fs4, fs3, fa4
                  div          gp, a1, a5
                  sub          s8, t0, s10
                  mulhu        s1, a1, a3
                  sra          sp, t3, s9
                  div          s0, t3, s0
                  fcvt.s.w     ft8, t3, rtz
                  fadd.s       fa7, fa2, fs3
                  div          s5, a5, tp
                  fadd.s       fs11, ft10, ft9, rne
                  sll          s2, a2, t6
                  fsgnjn.s     ft0, fa0, fa4
                  fsub.s       ft5, fs9, ft10
                  remu         a5, t2, a5
                  fcvt.wu.s    gp, fs0, rmm
                  fcvt.s.w     fs3, s11
                  sll          s7, s9, sp
                  fcvt.s.wu    fs8, s11
                  feq.s        t0, ft4, ft0
                  fcvt.w.s     t0, fs7
                  add          zero, s9, a4
                  slli         a3, s10, 8
                  fsqrt.s      ft2, ft0
                  fclass.s     s8, fs3
                  flt.s        t2, fs6, ft11
                  slli         a3, s11, 8
                  fcvt.s.w     fa2, sp, rtz
                  fmin.s       fs11, fs6, fa7
                  flt.s        t4, fa2, ft9
                  addi         s11, t5, 1214
                  fle.s        t2, fs0, fs10
                  fsgnjx.s     fs4, fs11, fs7
                  slli         a5, zero, 25
                  fcvt.s.w     ft10, t0, rne
                  and          t5, t6, a0
                  sltiu        t3, s9, 1954
                  sll          a6, t6, a4
                  sra          s7, t0, s6
                  or           s4, s4, zero
                  srl          s0, s10, s5
                  fsub.s       ft3, fs2, ft11, rne
                  sltu         a1, ra, a6
                  or           s5, s8, a6
                  fmv.x.w      s6, fs6
                  feq.s        s5, fs3, fs7
                  mulh         s8, a4, tp
                  mulhsu       a5, a2, tp
                  mulhsu       s2, t1, t3
                  addi         s6, s10, -465
                  addi         t5, s6, 538
                  auipc        s1, 934596
                  slt          t2, s0, s0
                  or           s3, t4, a1
                  ori          t3, s2, 707
                  fmv.w.x      fs3, t0
                  fcvt.s.w     ft9, a5
                  fcvt.wu.s    s2, fs2, rtz
                  add          a4, s8, s7
                  srl          t6, t1, s0
                  slli         s10, a5, 31
                  mulhsu       s7, a7, a5
                  nop
                  fcvt.s.w     ft5, a1
                  fmul.s       ft3, ft10, ft9
                  add          s6, s1, a1
                  fmv.x.w      sp, ft2
                  mulhsu       a2, zero, ra
                  fsgnj.s      fs4, fa2, fa6
                  srl          t6, t1, sp
                  or           sp, a0, gp
                  fmul.s       fa7, ft8, ft10, rmm
                  sra          a4, a6, t2
                  fsgnj.s      fa1, fa2, fs7
                  add          t1, s4, s11
                  lui          s10, 246612
                  fadd.s       fa6, ft5, fs5, rne
                  nop
                  divu         t1, t4, a2
                  fsgnjx.s     fa5, ft0, fs10
                  divu         t6, ra, t2
                  slt          gp, s1, s4
                  ori          t5, s11, -1078
                  sltu         t0, t3, a5
                  fsgnjx.s     fs0, fa7, fa3
                  fsqrt.s      fa6, fs3
                  xori         t5, s6, -1591
                  fadd.s       fs10, fs10, ft7, rup
                  rem          s3, a5, s1
                  fcvt.wu.s    a0, ft2
                  sub          s1, t6, s5
                  sub          s3, a1, t2
                  slli         zero, s1, 20
                  fmin.s       fa0, fa1, ft1
                  fmv.w.x      fs2, t6
                  nop
                  fcvt.s.w     ft2, a4, rup
                  fmv.x.w      s5, ft6
                  fcvt.s.wu    fs3, s0, rmm
                  auipc        a7, 821107
                  fmax.s       ft6, fs4, fa0
                  divu         t1, t0, t0
                  fcvt.wu.s    s7, ft0, rmm
                  add          s10, s4, t0
                  fle.s        a6, fa7, fa7
                  srl          s4, a2, s7
                  slti         s8, sp, -897
                  fsgnj.s      fs11, ft7, ft5
                  addi         t4, t0, -1712
                  mulhsu       a6, t0, s11
                  fcvt.w.s     s4, fs0
                  xor          a0, s10, a2
                  fdiv.s       fs2, ft10, fa0
                  srli         s2, a5, 10
                  slt          s10, ra, a4
                  fle.s        t0, fs1, fa6
                  fcvt.s.w     fa1, tp
                  add          gp, t3, s0
                  auipc        s0, 543118
                  flt.s        t1, ft6, ft0
                  fcvt.w.s     t4, fa3, rup
                  or           gp, a5, gp
                  flt.s        zero, fa2, ft1
                  ori          a7, s10, -1501
                  fsqrt.s      ft4, fs3, rup
                  lui          t4, 458968
                  sltu         t5, s2, gp
                  sltiu        s8, a1, -2009
                  ori          s8, t1, -1712
                  mulhsu       a2, s1, s10
                  remu         t3, a2, a0
                  fsub.s       ft8, fs5, fs8
                  fadd.s       ft5, fs4, ft6
                  fsgnjn.s     fs1, fs5, fa2
                  rem          a4, s7, t3
                  flt.s        t3, ft0, ft10
                  srai         t5, a6, 2
                  flt.s        t6, ft5, ft6
                  mulhu        sp, s7, t1
                  fmul.s       fs4, fa0, fs7
                  fsqrt.s      fa3, fa0
                  fle.s        s3, ft4, fs9
                  slli         t1, t1, 1
                  remu         a6, gp, s0
                  fadd.s       ft4, fs11, ft10
                  fmin.s       ft7, fs8, fa3
                  xori         s10, s11, 87
                  slti         s0, s10, 709
                  slli         s3, t5, 8
                  auipc        zero, 988005
                  fdiv.s       ft4, fs10, ft3, rdn
                  fadd.s       fs6, ft5, fa4
                  mulhu        t3, s11, a5
                  mulh         a3, a3, s7
                  fdiv.s       fs2, fs3, fs3
                  or           s5, a3, a2
                  sltu         s7, t5, a7
                  fsgnjn.s     ft9, ft8, fs2
                  srai         a3, tp, 7
                  rem          s1, s1, sp
                  fmax.s       ft8, fs10, ft5
                  srli         s3, a7, 10
                  sll          gp, t0, a3
                  srli         s10, t1, 18
                  xori         t0, s4, 1653
                  fcvt.s.w     ft10, s10, rmm
                  mulh         a2, zero, t2
                  slt          a4, a7, s8
                  feq.s        zero, ft5, fa3
                  fcvt.wu.s    s2, fa6, rmm
                  sub          s8, t4, gp
                  fmax.s       fs3, fa6, fa4
                  xori         a1, a6, 1550
                  remu         a0, a5, s9
                  sltiu        gp, a0, 1964
                  fcvt.s.w     ft3, a2, rdn
                  fcvt.s.wu    fs2, a4, rtz
                  sltiu        gp, a6, -1375
                  sub          a1, zero, gp
                  fmv.w.x      fs9, a4
                  fmv.x.w      s11, ft8
                  fsgnjx.s     ft7, ft11, ft0
                  fsgnjx.s     fa2, fs6, fs11
                  sltu         s3, s10, s1
                  fdiv.s       fs9, fa7, fs7
                  fmax.s       fs1, ft8, fs9
                  fcvt.s.w     fa7, a1
                  fsgnjx.s     ft9, ft3, fa5
                  fsgnjn.s     fs3, fa4, fs10
                  srai         s8, t1, 16
                  fclass.s     s5, fs8
                  sltu         s11, t4, a6
                  flt.s        s0, ft3, ft1
                  fcvt.wu.s    t4, fs8
                  fmv.x.w      a3, fa2
                  sub          a3, s4, t4
                  fmax.s       fs3, fa3, fs1
                  fclass.s     gp, ft9
                  lui          t0, 630932
                  fsqrt.s      fs9, fs3
                  div          t4, s9, t1
                  mulhsu       a2, s4, a4
                  lui          a4, 794041
                  fmul.s       fs10, ft4, ft5, rup
                  sra          s3, s2, a5
                  xori         s11, t5, -1039
                  or           t3, s9, s0
                  flt.s        s10, fs11, fs8
                  srli         s6, s0, 2
                  auipc        s8, 81963
                  mul          t0, t1, s5
                  fcvt.s.wu    ft6, s0, rne
                  fmv.w.x      fs2, s4
                  flt.s        a3, ft3, fa3
                  divu         t2, t4, t4
                  fsgnj.s      fa4, ft8, ft5
                  addi         t4, zero, -668
                  mul          s0, s10, tp
                  div          a1, a3, s10
                  fcvt.wu.s    t6, fs9, rup
                  add          s5, s1, zero
                  flt.s        s7, fa0, fa7
                  ori          s8, t6, -989
                  andi         a5, s6, -896
                  slli         gp, s2, 1
                  mulhsu       a1, s0, s2
                  slli         t6, t4, 23
                  fsgnjn.s     ft5, fs2, fa2
                  srl          s11, a6, a7
                  fadd.s       fs2, ft10, fa6, rup
                  divu         s4, t0, a3
                  fsgnjx.s     fs11, ft0, ft0
                  fcvt.w.s     s1, fa1, rne
                  fclass.s     a4, fs2
                  divu         s5, t6, t0
                  mulhu        t2, a4, a7
                  addi         s6, s3, -1392
                  srli         s6, a6, 28
                  fsgnjx.s     fa0, fs6, ft9
                  mulh         a5, s8, a6
                  srai         zero, t5, 3
                  fsub.s       fs2, fs1, ft11
                  andi         t2, s3, 1124
                  slti         a0, s7, 353
                  fmv.x.w      a2, fs0
                  mul          s2, zero, a4
                  fcvt.s.wu    fs8, s0
                  xori         t2, s2, 797
                  sltiu        s0, ra, 1022
                  fcvt.s.wu    fa0, t4
                  fsgnjn.s     ft2, ft6, fa4
                  fmul.s       fs2, fa5, fa5, rmm
                  add          a6, gp, ra
                  lui          s10, 202252
                  auipc        a4, 1039264
                  fsgnjx.s     fs10, ft4, fa2
                  ori          s11, a0, 1477
                  slti         s6, s8, 181
                  fmax.s       ft2, fa4, fs2
                  fsgnjx.s     fs9, fa3, ft10
                  fsgnj.s      ft11, fs1, fs6
                  nop
                  fclass.s     s10, fa3
                  divu         s0, gp, t3
                  sll          t3, s6, t4
                  nop
                  fadd.s       fs5, fa5, fs10
                  fmv.x.w      t1, ft1
                  fmv.w.x      ft4, a5
                  feq.s        s5, fa3, fs6
                  feq.s        s0, ft2, fa2
                  srl          s11, s6, a0
                  srl          s8, t2, s3
                  fsqrt.s      ft3, fa0, rdn
                  rem          t5, t6, a0
                  fclass.s     s3, ft7
                  fmv.w.x      ft0, ra
                  and          s2, s6, s9
                  fcvt.wu.s    s10, fa4, rup
                  fadd.s       ft9, ft2, ft1, rtz
                  sltu         t2, gp, s0
                  flt.s        t2, ft2, ft11
                  slti         a6, a6, 12
                  fsub.s       ft10, ft11, fa3, rtz
                  auipc        s10, 765885
                  fle.s        s5, fa6, ft8
                  fsub.s       fa2, fa4, fs1
                  srl          s8, a3, s11
                  fdiv.s       fs0, fs2, ft9
                  andi         zero, t3, 325
                  fsqrt.s      fs10, ft6
                  xor          t1, s10, a0
                  fcvt.s.w     fa5, gp
                  fcvt.s.w     fs2, a6, rtz
                  slli         s1, ra, 17
                  div          s2, a4, s7
                  fsqrt.s      ft6, fs9, rdn
                  mul          t6, a3, s4
                  srai         t6, zero, 9
                  fsgnjn.s     fs6, fa7, ft2
                  sll          t2, t3, ra
                  slt          a4, s9, s3
                  fmv.x.w      t1, fs3
                  andi         s7, a0, 250
                  fmin.s       fs4, fa2, fs1
                  fsqrt.s      fs0, fs1, rdn
                  fmin.s       fa6, fa0, ft5
                  srli         s0, s5, 21
                  fadd.s       fs8, fa3, fa7
                  div          sp, t3, ra
                  andi         a5, a1, -1315
                  fclass.s     t0, fs11
                  remu         a2, zero, a7
                  fmax.s       fa3, ft5, ft3
                  fsqrt.s      fa3, fs2, rtz
                  fmax.s       ft2, fa2, ft11
                  lui          a1, 727549
                  fmax.s       fa6, ft1, fa7
                  nop
                  fsub.s       fa2, fs1, ft1
                  fmax.s       fs2, fs4, fs0
                  fadd.s       fs11, ft1, fa7, rdn
                  fcvt.s.w     ft6, t1, rup
                  mulhu        a6, s3, s10
                  or           s10, a3, a3
                  fadd.s       fs0, fa6, fs9, rtz
                  mul          a0, t2, sp
                  fmul.s       ft9, ft2, fs6
                  srl          t2, s9, s6
                  nop
                  sra          s7, s11, s5
                  fsgnjn.s     fs4, fs3, fs9
                  fsgnj.s      fs2, fa2, fs0
                  slt          t3, t2, s11
                  srli         a2, a1, 3
                  slti         sp, s7, -1980
                  fmv.w.x      ft11, s9
                  divu         s0, s11, s1
                  remu         s1, s9, s6
                  fdiv.s       fa0, ft5, fs1
                  slti         s1, s6, 669
                  fmv.x.w      s1, fa3
                  fsub.s       fa2, fs11, fs2, rmm
                  srl          s11, a4, s0
                  fsgnjn.s     fs7, ft6, fa3
                  flt.s        sp, fs6, ft6
                  mulhsu       s4, s0, tp
                  ori          s1, s2, -29
                  ori          zero, s5, 823
                  fle.s        t1, ft2, ft6
                  fcvt.wu.s    a0, fs4
                  fclass.s     a1, ft7
                  nop
                  div          s2, zero, t6
                  fmin.s       fa7, fa4, fa4
                  rem          t5, a2, t3
                  fsgnjn.s     fs2, ft8, ft9
                  fcvt.w.s     a3, ft4, rtz
                  srli         s6, s7, 11
                  or           s6, a5, zero
                  fmax.s       fs1, fs4, ft9
                  srai         s6, t1, 17
                  div          gp, s8, a2
                  sltiu        s10, a1, 1095
                  remu         a6, zero, t6
                  sltiu        s5, s8, -1753
                  fcvt.s.wu    ft5, t0, rne
                  fadd.s       fa4, ft7, fa6, rup
                  fsgnj.s      ft4, ft0, ft2
                  slt          s5, t0, a4
                  lui          s2, 553228
                  srai         a6, t4, 6
                  srai         t2, t5, 18
                  add          s7, s8, sp
                  sra          t1, zero, s9
                  sll          t2, s3, sp
                  srli         zero, a7, 6
                  slli         gp, t6, 28
                  and          a3, s0, t3
                  add          a6, a4, a5
                  fcvt.s.w     ft1, a1, rtz
                  remu         s4, s8, a4
                  add          s3, s3, s2
                  fdiv.s       fa7, ft0, ft6
                  sub          a3, a2, ra
                  ori          s0, t4, 466
                  slti         s3, t4, -1847
                  and          a6, s9, t5
                  mulhu        a0, gp, t1
                  remu         s2, a1, a6
                  slli         t3, s5, 12
                  andi         s5, t2, -1880
                  fsqrt.s      ft1, fs10, rup
                  sll          a2, gp, s4
                  nop
                  slt          a3, s11, tp
                  add          s11, s6, zero
                  slt          t4, s9, tp
                  auipc        sp, 709086
                  fcvt.s.w     ft11, t1, rup
                  slli         t5, a4, 22
                  srli         t0, zero, 3
                  fmax.s       fs9, ft9, fa0
                  srl          t5, s8, a5
                  nop
                  slt          s11, s7, s2
                  fsgnj.s      fs5, fa0, ft0
                  rem          a1, s11, s11
                  fcvt.s.wu    fa6, t3, rup
                  srl          a0, t0, a2
                  fmul.s       ft5, fs1, fs2
                  srai         a2, a3, 15
                  xor          a1, s9, a7
                  sra          s2, s0, s2
                  srl          t5, s10, a7
                  fclass.s     t2, ft4
                  sltu         a3, t2, t3
                  sltu         s8, gp, s5
                  fmv.x.w      s4, fa4
                  slli         t4, zero, 18
                  nop
                  remu         a3, t0, s0
                  slt          t4, tp, ra
                  fmax.s       ft10, ft10, fs0
                  feq.s        t0, ft1, ft4
                  fsub.s       ft7, fs1, fa2, rdn
                  fsgnjx.s     ft10, ft3, ft4
                  lui          a5, 135998
                  sltiu        s4, t2, 1734
                  andi         t0, a5, -598
                  fmv.w.x      ft2, a0
                  fadd.s       fs9, fa2, ft1, rup
                  flt.s        s1, fa5, fa7
                  lui          t0, 876506
                  slt          s6, s5, s3
                  fcvt.s.wu    fs4, a7, rup
                  fmul.s       fs3, ft4, fa1, rtz
                  fmv.w.x      ft10, t3
                  add          t4, t3, s11
                  fsub.s       fs9, ft3, fa1
                  fmin.s       fa7, fs9, fs2
                  divu         a0, a2, t4
                  div          zero, a4, t3
                  fcvt.s.wu    ft0, a7, rdn
                  fadd.s       fs8, ft6, fa6, rmm
                  sltiu        s4, a2, 1407
                  and          t4, gp, tp
                  fclass.s     zero, ft5
                  srli         s0, a3, 20
                  mul          a2, t3, t1
                  fdiv.s       fa3, fs9, fs6
                  ori          s2, a7, 1742
                  sltu         t2, gp, a2
                  mul          t6, ra, zero
                  sub          gp, zero, zero
                  xori         a7, a5, -910
                  rem          t6, s9, a5
                  mul          a7, s7, gp
                  xor          s10, t0, s0
                  addi         t3, zero, 1037
                  flt.s        s6, fs0, ft2
                  fcvt.s.wu    ft6, a1, rne
                  fclass.s     s1, fa1
                  fmv.x.w      t1, fs2
                  and          s1, s1, s10
                  fsgnjx.s     ft5, fa6, ft0
                  add          a0, s6, a4
                  flt.s        a5, fs11, fs2
                  fcvt.wu.s    t4, fa0
                  fmv.w.x      fs5, t6
                  feq.s        sp, ft9, ft5
                  xor          a3, zero, t4
                  fsqrt.s      ft7, ft9
                  srli         t1, t2, 10
                  fcvt.s.wu    fa3, t6
                  fdiv.s       fa0, fs3, ft9, rdn
                  fmin.s       ft5, ft8, ft10
                  srai         s11, zero, 0
                  fsgnjn.s     fa1, ft0, ft11
                  fclass.s     a1, fa5
                  sra          a0, s9, s10
                  fmin.s       fa4, fs6, fs2
                  ori          a4, s11, -80
                  fsgnjx.s     ft11, ft5, ft10
                  fmul.s       fa3, fa2, ft3, rup
                  slli         t1, s8, 6
                  sltu         s3, s11, s11
                  fsqrt.s      ft11, ft2
                  mulhsu       t2, s3, s3
                  fmv.w.x      fs7, a5
                  fclass.s     s1, ft2
                  srli         s1, t0, 31
                  feq.s        a3, fa1, fs5
                  fdiv.s       ft11, ft8, fa0, rmm
                  fcvt.w.s     a3, fs0
                  sltiu        zero, t1, -683
                  fcvt.wu.s    gp, ft10, rup
                  fcvt.s.w     fa6, t6, rup
                  srai         a2, tp, 29
                  xor          t2, s10, s3
                  fmv.w.x      fa5, a4
                  mul          s5, s9, t5
                  auipc        s5, 656331
                  xor          a2, s1, a0
                  srli         s5, t1, 3
                  fle.s        s3, ft7, fs4
                  sub          sp, s1, gp
                  fdiv.s       fs4, ft7, fs11, rtz
                  fdiv.s       fs10, ft8, ft7, rdn
                  fmax.s       ft1, ft5, fa6
                  srli         t1, t5, 4
                  add          t0, s9, t3
                  slli         t2, t4, 28
                  srai         s8, a5, 19
                  fcvt.wu.s    a6, fs2, rdn
                  lui          s3, 965185
                  fsgnj.s      fs4, fa6, fa2
                  sll          s4, s4, t1
                  nop
                  slli         s8, s10, 1
                  fle.s        s1, fs11, ft1
                  divu         a1, a6, s8
                  fsgnjx.s     fa0, ft0, fa2
                  div          a5, t1, ra
                  auipc        s6, 822369
                  fmv.x.w      t3, fa2
                  fmul.s       ft10, ft1, fs1, rdn
                  fdiv.s       ft1, fa6, ft11
                  slt          t4, tp, s4
                  or           t2, s7, s5
                  fcvt.s.wu    ft11, s9, rmm
                  remu         t5, t5, t1
                  fsqrt.s      fs8, fs4
                  fsqrt.s      fs0, fa7, rmm
                  remu         s0, s7, t0
                  mulhu        a2, a6, s11
                  fdiv.s       fa6, fa3, ft5
                  fsgnj.s      ft3, fa1, ft7
                  fcvt.wu.s    t5, fa1
                  sll          t4, s1, t3
                  xor          s1, t6, t5
                  addi         zero, t4, 685
                  slt          a2, s4, t4
                  fdiv.s       ft0, fa5, fs7, rup
                  slt          a1, a1, zero
                  fdiv.s       fs2, fs1, fs4
                  auipc        a2, 484798
                  xori         a4, s7, 1188
                  fsgnj.s      ft4, ft4, fs0
                  fsgnjx.s     fs0, ft5, fa5
                  fcvt.wu.s    a4, fs10
                  rem          t2, a6, t4
                  xor          a1, s6, a5
                  srli         a4, s3, 25
                  fcvt.s.wu    fa2, a3, rup
                  rem          s2, a4, s4
                  rem          s11, s4, s7
                  fsgnjx.s     fs8, ft0, fa1
                  fsgnj.s      ft3, fs6, fs3
                  div          s10, a0, s9
                  andi         s7, t6, 1721
                  fcvt.wu.s    t4, ft11
                  sub          t0, a1, ra
                  fmul.s       fa1, fs10, fs5
                  divu         s0, t0, s3
                  fcvt.s.wu    fa2, ra, rdn
                  sltiu        a5, s0, 1713
                  sra          a5, s6, s3
                  mul          s1, s4, t0
                  srl          sp, tp, zero
                  fsgnj.s      fs11, ft0, fs2
                  mulhu        t2, t4, a5
                  auipc        t6, 951937
                  fsqrt.s      ft2, ft11, rne
                  slli         t0, a3, 21
                  flt.s        s1, ft0, fa6
                  fle.s        t2, ft3, fa6
                  or           a1, a0, a2
                  fadd.s       ft10, fs2, fs5, rup
                  fadd.s       fs5, fa3, fs10, rup
                  mulh         s10, s7, t1
                  xori         t6, s11, -257
                  nop
                  fsub.s       ft11, fs1, fs10
                  fsgnjn.s     fa2, fs10, fa1
                  div          zero, s3, sp
                  fsgnjx.s     fa2, ft2, fs5
                  mul          t1, s9, s10
                  div          a6, a0, t0
                  auipc        s5, 856264
                  slti         t2, a5, -824
                  fsgnj.s      fa7, ft11, fa4
                  slti         sp, s1, 670
                  rem          s4, ra, s2
                  xor          s0, zero, s7
                  xori         s6, s4, -1253
                  nop
                  xori         s0, s11, 1058
                  ori          t1, sp, 1693
                  fcvt.s.wu    fa0, s5, rne
                  mulhu        s7, gp, a2
                  add          s0, tp, s9
                  addi         s7, zero, -353
                  fmax.s       ft0, ft3, fa3
                  fcvt.wu.s    a5, fa0, rup
                  slli         a6, a2, 29
                  mulhsu       s7, s5, a6
                  fcvt.w.s     s11, ft11, rup
                  srai         s0, s10, 28
                  slti         a1, s9, -280
                  srai         zero, s0, 16
                  add          a3, t0, s5
                  addi         a4, t0, -1319
                  feq.s        t0, fs11, ft9
                  addi         s5, a5, -57
                  fsqrt.s      fa0, ft6, rtz
                  andi         t6, tp, -226
                  or           s11, a3, t3
                  slti         t2, t4, -781
                  or           s1, s1, t0
                  and          s8, s10, a6
                  fmv.w.x      fa0, a5
                  fmv.w.x      fa4, a3
                  slt          t2, s1, s0
                  slt          s0, a2, t1
                  sltiu        s2, t0, -2003
                  fsub.s       fa7, fs0, fs8
                  fsub.s       fs0, fs0, fs7, rne
                  remu         t6, t2, gp
                  fmax.s       ft10, fs7, ft5
                  and          s6, t3, s1
                  slli         t1, a2, 25
                  fcvt.wu.s    t1, fs11
                  nop
                  andi         a0, a3, -836
                  fsub.s       ft11, ft10, ft8
                  srl          s8, s0, t2
                  mul          t0, t2, s5
                  fcvt.s.w     ft8, a2, rtz
                  mulhu        s5, t3, a1
                  feq.s        a2, fs2, fa6
                  srai         sp, a6, 0
                  fclass.s     s6, fs5
                  fsgnj.s      fa5, fs10, ft6
                  xori         s5, a0, -1583
                  fcvt.wu.s    a1, fa3
                  mulhsu       s11, t6, a6
                  fsgnjx.s     ft4, fa7, ft3
                  sltiu        a6, sp, -1201
                  fdiv.s       ft9, fa3, fs8, rdn
                  sra          a0, sp, zero
                  slt          s3, a0, t2
                  sltiu        a6, a3, -1964
                  sltiu        a0, a7, -1760
                  flt.s        a2, fs6, fa6
                  fsgnjx.s     fs3, fs6, fs4
                  fsqrt.s      ft9, fa6
                  fle.s        gp, ft3, fs9
                  xor          a2, s10, s3
                  ori          a6, s10, -1233
                  slti         a7, s7, -1192
                  and          a3, s10, s0
                  sltu         s10, t2, ra
                  sra          s11, a6, t3
                  fclass.s     s7, ft3
                  srai         a2, s10, 25
                  div          t4, s11, ra
                  srl          a3, t1, ra
                  rem          s10, t6, s11
                  andi         a5, t1, -887
                  lui          t2, 918306
                  fmin.s       ft1, fa4, fa3
                  auipc        s2, 220617
                  mulhu        a5, s0, t6
                  fcvt.s.w     fs1, s10
                  div          a4, t0, s2
                  fcvt.w.s     s5, fs3
                  fmul.s       ft6, fa0, fa5
                  slt          a0, a6, s10
                  andi         s10, a7, 540
                  ori          s11, t3, -834
                  fcvt.w.s     zero, fs11
                  addi         t0, s0, 310
                  add          t1, t0, s7
                  xori         s5, t0, 1251
                  fsub.s       fs8, ft5, fs2, rmm
                  fsub.s       ft10, ft10, fs5
                  xori         a3, t1, -1163
                  fsgnj.s      ft9, fa2, fa3
                  addi         a6, gp, 596
                  or           s5, a5, s7
                  fcvt.w.s     sp, ft5
                  xori         s6, t3, -1278
                  div          s7, t4, s1
                  xori         s6, a6, 1140
                  fsgnjx.s     fs8, fs4, fa7
                  andi         s8, s5, -1699
                  srai         gp, a3, 26
                  fcvt.w.s     t6, fs3
                  sll          s10, t5, a3
                  xor          a6, a2, a6
                  lui          a3, 114407
                  and          s4, s3, tp
                  remu         gp, tp, s1
                  mulh         s3, t3, a2
                  remu         t2, a1, t0
                  mulhsu       s8, a4, zero
                  ori          t2, a1, -525
                  feq.s        t4, ft11, ft3
                  fcvt.s.w     fs0, a2, rup
                  fmin.s       fa0, fs5, fs1
                  fsub.s       fs5, ft5, fs10
                  fclass.s     s11, fa6
                  fcvt.s.w     ft11, s5, rup
                  slt          zero, s7, s3
                  slt          t5, a4, t2
                  xori         a7, s9, 1799
                  sll          t3, a0, tp
                  mulhsu       s4, s7, s4
                  rem          t0, t3, t0
                  fcvt.s.wu    fa7, t4
                  div          t4, s10, s1
                  mulhsu       gp, ra, gp
                  fclass.s     a7, fa1
                  fmin.s       ft8, fa0, ft4
                  sub          s7, t4, s10
                  mulh         gp, t2, a0
                  mul          zero, t0, ra
                  fadd.s       fs7, fa1, ft4
                  remu         gp, a0, t2
                  xor          a2, a4, s2
                  fsgnjn.s     fs2, fs11, ft1
                  sub          a4, zero, a2
                  fsub.s       fs7, fa2, ft5, rdn
                  fmv.w.x      ft11, a1
                  add          s3, t0, t3
                  fsgnjx.s     fa4, fa6, fs4
                  fcvt.wu.s    zero, ft11, rne
                  sub          t1, zero, ra
                  srl          s11, s2, tp
                  nop
                  fadd.s       fa5, ft7, ft1
                  mulhu        s1, s4, a5
                  xori         a5, a2, -1777
                  mulh         gp, t3, a7
                  fmv.x.w      t0, ft9
                  fle.s        a1, ft6, fs11
                  sub          a4, s0, s2
                  fdiv.s       ft0, fa6, fs5
                  xor          a7, ra, s11
                  or           zero, s0, s9
                  ori          s0, gp, 614
                  nop
                  fcvt.s.wu    fa1, s2, rtz
                  fdiv.s       fs9, fs6, fs3, rdn
                  slti         t5, s3, 591
                  fsgnjx.s     fa3, ft8, fs9
                  and          a1, a6, s4
                  nop
                  fsgnjn.s     fa5, ft8, ft8
                  fsgnjx.s     fs0, ft5, fa5
                  srai         zero, s9, 10
                  sll          t6, zero, a1
                  fsgnj.s      fs4, fs5, ft10
                  nop
                  sub          a5, s7, zero
                  slti         s3, t1, -413
                  divu         s8, a5, s8
                  fsgnjx.s     fa4, fa3, fs5
                  slt          a3, t6, t1
                  mulhu        a6, s5, t4
                  fmv.x.w      a7, fa5
                  fcvt.wu.s    t4, ft5, rne
                  fmul.s       ft0, fa0, fs9
                  ori          s8, t4, -1334
                  mulh         s0, a4, s10
                  mulh         s10, s1, s0
                  sltu         s11, s2, s7
                  fcvt.s.wu    ft1, s11, rtz
                  mulhu        s0, s6, s8
                  fmul.s       fa7, ft2, fs10, rtz
                  fmv.w.x      ft8, s4
                  addi         zero, t5, -958
                  addi         s3, t5, 1654
                  fadd.s       ft8, ft3, fa4
                  fsgnjx.s     ft0, fa6, fa4
                  fsgnj.s      ft6, ft8, fs4
                  fsgnj.s      ft8, fs0, fs4
                  sltu         s0, a7, a6
                  auipc        s0, 486289
                  fmv.x.w      s5, fs8
                  srai         s3, s7, 25
                  sub          t3, a3, t2
                  srl          a1, a2, s4
                  xor          s11, a5, s11
                  fcvt.s.w     ft2, s1, rup
                  nop
                  andi         s0, zero, -1298
                  feq.s        s1, fs8, ft1
                  addi         s1, s11, -749
                  fclass.s     s1, ft6
                  ori          t3, s1, -1497
                  slti         a4, ra, 192
                  xor          a1, zero, s4
                  fsqrt.s      fs2, ft6
                  fadd.s       ft5, ft6, ft5, rup
                  fclass.s     t3, ft11
                  rem          a2, ra, a3
                  sra          gp, a4, t1
                  slli         a0, s7, 15
                  fsub.s       fs10, fs1, ft7, rne
                  fsub.s       fs3, fs2, fs4
                  fclass.s     s11, ft6
                  add          a0, s4, sp
                  slli         s6, ra, 3
                  div          t5, s8, zero
                  fmv.x.w      t1, fs1
                  addi         s3, t0, -1151
                  xor          a6, a1, a6
                  feq.s        a6, ft3, fs9
                  sra          s7, t3, s11
                  fsqrt.s      fs3, fs3
                  fmax.s       fs7, fs6, ft2
                  srli         s6, t2, 23
                  and          a5, s2, s1
                  sltu         s4, a2, a6
                  nop
                  addi         s8, a3, 1210
                  mulhsu       t4, s10, a0
                  fcvt.s.wu    fs4, t1
                  andi         s3, t1, 1633
                  divu         a7, s9, s9
                  auipc        a3, 246540
                  lui          s2, 570877
                  sll          s11, s6, t2
                  fcvt.s.wu    fs9, a1, rup
                  fmv.x.w      a5, ft1
                  fclass.s     s0, ft1
                  fsqrt.s      fs5, ft1, rdn
                  fmin.s       fs4, fs3, fa5
                  andi         s10, s2, 789
                  auipc        t2, 517922
                  fmv.w.x      fs5, a2
                  slti         a4, s7, 330
                  xor          sp, s4, a7
                  slt          s1, t2, zero
                  srl          s4, s10, t5
                  fcvt.s.wu    fs3, a0, rup
                  mulhsu       s7, s9, s4
                  slli         zero, a7, 1
                  fcvt.w.s     a2, ft6
                  divu         t4, a4, tp
                  xori         a6, s4, 1737
                  add          t3, s0, a3
                  remu         s5, s1, t6
                  srli         zero, s3, 6
                  fcvt.w.s     s5, ft1
                  sub          t0, s4, gp
                  xori         t4, a1, 1473
                  mulh         s2, t5, sp
                  sltiu        sp, s11, 1801
                  andi         t0, s5, 667
                  fmv.x.w      a5, fs4
                  mulhsu       a1, s4, s8
                  fsgnj.s      ft2, fs0, fa0
                  divu         a4, t5, ra
                  divu         t6, a0, s3
                  rem          s6, a3, s6
                  addi         s8, s9, 91
                  slt          s1, a0, a0
                  fcvt.w.s     s10, ft0, rtz
                  add          t2, a6, t1
                  or           s4, ra, t3
                  and          a5, a1, a6
                  rem          s3, t3, a6
                  fcvt.w.s     a7, fs2, rup
                  fmax.s       fa4, fa6, ft6
                  mulhsu       t6, s2, a0
                  lui          t3, 376051
                  flt.s        zero, ft2, fs1
                  xor          a5, sp, s5
                  fsgnj.s      ft0, fa2, ft4
                  div          t6, t2, s0
                  fsgnjn.s     fa3, fa6, fa0
                  fmv.x.w      s0, ft6
                  addi         s5, t1, -229
                  andi         s5, s6, -252
                  rem          a3, a6, s1
                  or           t2, s7, gp
                  fcvt.s.w     ft10, t2, rne
                  fcvt.s.w     fa7, s2
                  fsub.s       ft9, fa0, fs0, rdn
                  fmul.s       ft10, ft1, fs10
                  fle.s        s4, ft2, fs11
                  remu         t5, s10, s9
                  sub          a3, t3, s0
                  sra          s3, t4, tp
                  fsgnjn.s     fs6, fa5, fs8
                  andi         s3, t0, -1397
                  fsgnjx.s     ft0, ft4, ft3
                  srai         s1, tp, 26
                  remu         s1, t6, s1
                  sra          t5, a6, ra
                  fsqrt.s      fs6, fs8, rne
                  fadd.s       fs6, fs10, fs6, rup
                  slti         zero, s10, 673
                  flt.s        a0, fs7, fs11
                  remu         t3, s10, s10
                  fmv.x.w      a4, fs8
                  div          sp, a4, s5
                  lui          s3, 613357
                  divu         a5, t0, s4
                  sll          t1, t3, a3
                  fsqrt.s      ft5, ft0
                  fmv.w.x      ft3, t2
                  auipc        t0, 320685
                  sll          t3, a3, s4
                  xor          s2, s8, zero
                  slti         t0, a0, -1790
                  mulhu        a5, s7, s4
                  fmv.w.x      ft4, a5
                  xor          s7, t3, a4
                  fmul.s       fs0, ft2, fs1, rdn
                  fdiv.s       ft5, fa0, ft5, rne
                  fcvt.s.wu    fs3, a0
                  slli         a6, gp, 2
                  nop
                  nop
                  or           s8, sp, s3
                  mulh         s2, sp, tp
                  nop
                  fmin.s       fs6, fs0, fa5
                  fadd.s       fs2, fa7, fs1, rne
                  fle.s        a7, ft10, fa7
                  feq.s        s6, fs4, fs2
                  fcvt.s.wu    ft10, a4
                  fcvt.s.w     ft10, t5, rne
                  fle.s        s8, ft9, ft0
                  fmul.s       ft9, fs2, ft0, rdn
                  srl          a4, s4, s1
                  fsub.s       ft10, fs8, fa6, rup
                  mulhu        s8, gp, t5
                  fcvt.s.w     ft0, t1
                  remu         a3, a6, t5
                  add          t1, a5, s3
                  xor          gp, a0, sp
                  srl          zero, a4, gp
                  sll          t3, tp, s1
                  fmax.s       fa7, fs1, ft5
                  srli         t1, s5, 16
                  fmv.x.w      a6, fs2
                  mul          s6, ra, s10
                  sltu         s6, t0, a7
                  xor          s6, a6, a2
                  andi         a2, s4, 8
                  nop
                  sra          t0, s6, zero
                  fmul.s       ft8, fs0, ft7
                  srai         s10, s5, 2
                  srai         a6, s8, 9
                  div          a2, sp, s3
                  fmv.x.w      t3, ft11
                  auipc        s0, 668328
                  mul          a1, a6, ra
                  ori          a7, s5, 1501
                  add          t2, a3, a7
                  addi         s1, gp, 1034
                  mulhsu       s4, s1, s5
                  mulh         s6, s1, s9
                  mulhsu       s0, s0, t3
                  fmv.w.x      fs6, t3
                  addi         a6, t0, -833
                  add          t6, gp, t1
                  fsgnj.s      fs10, fa3, ft7
                  fclass.s     t4, fs1
                  mulh         a7, gp, s7
                  srl          a5, s3, s1
                  lui          a0, 139962
                  addi         sp, a2, -1955
                  divu         t3, a4, t4
                  fsqrt.s      fa7, fa7
                  remu         s5, s10, s7
                  slti         a2, s9, -1627
                  fcvt.s.w     fs1, a1, rup
                  xori         a6, a6, 900
                  sub          s6, s7, a6
                  fsqrt.s      fa1, fs8
                  addi         s2, s4, 1628
                  fsub.s       ft8, fs2, ft10
                  sltu         gp, s8, t2
                  fmv.w.x      fs11, s5
                  slt          s8, t3, t4
                  sll          a1, t5, t5
                  slti         t1, a0, 2016
                  slti         t0, a3, -367
                  fcvt.s.w     ft6, s1, rdn
                  addi         a5, s4, 1394
                  srl          a1, t0, a1
                  mul          t5, a2, t1
                  fle.s        s7, ft8, fa1
                  fmul.s       fa2, fs8, fa1, rne
                  fmv.x.w      t5, ft11
                  ori          s3, t0, -943
                  xor          s3, gp, s3
                  sub          a1, a1, s6
                  and          s7, s11, gp
                  fcvt.s.wu    fs10, gp
                  xori         s5, s5, -2042
                  fcvt.s.wu    fa2, ra, rdn
                  fmin.s       fs11, fs10, fs3
                  lui          s0, 701542
                  addi         a3, s2, -985
                  ori          s0, s10, 42
                  fsqrt.s      ft2, fs10, rup
                  srai         t6, ra, 30
                  xor          t5, t6, t6
                  fcvt.wu.s    a5, ft3, rup
                  div          sp, s10, a3
                  sltu         a5, s2, t4
                  fcvt.s.w     ft2, gp
                  fmv.w.x      fs0, s0
                  fadd.s       fa2, ft8, fs8, rdn
                  and          a7, s4, a2
                  mulhsu       s2, a1, a3
                  fcvt.wu.s    t4, ft3, rup
                  nop
                  flt.s        t4, fs7, ft11
                  slli         t3, a5, 13
                  fsgnjn.s     ft3, ft1, ft7
                  slli         s7, a4, 7
                  flt.s        sp, ft9, ft8
                  fmax.s       ft1, fs3, fs3
                  sub          s1, t6, s3
                  fmul.s       fa6, ft2, ft11, rmm
                  fmax.s       fa7, ft2, fs4
                  mulh         s5, t2, gp
                  fmin.s       fa7, fs9, fa5
                  nop
                  remu         s8, a5, s6
                  fdiv.s       fs7, fs0, fs7, rup
                  fcvt.s.w     fa0, a0
                  fmin.s       fs3, fs7, fa3
                  rem          s7, s0, s8
                  slli         a4, a0, 2
                  fsgnj.s      fs11, ft3, fs1
                  flt.s        t2, fs8, ft11
                  mul          t3, sp, ra
                  feq.s        gp, ft10, fs1
                  fdiv.s       ft8, fs1, fs1, rne
                  fclass.s     a0, fa3
                  fclass.s     t3, fa1
                  fcvt.s.wu    ft5, gp
                  fsqrt.s      fs5, ft2
                  sll          s1, gp, a4
                  divu         s6, a1, a7
                  fcvt.s.w     ft5, s2
                  and          s0, t1, a5
                  fle.s        s4, fa2, fs3
                  slti         t5, a7, 651
                  mul          a0, ra, s8
                  fmin.s       fs2, fs2, fa0
                  fadd.s       fs3, fs9, ft4, rtz
                  auipc        s5, 180815
                  feq.s        t3, fa3, fs6
                  fmin.s       fa6, fa1, fs5
                  xori         s10, s6, -519
                  fdiv.s       ft0, ft11, fa1
                  fcvt.s.wu    ft8, t2
                  feq.s        zero, ft7, ft0
                  add          s4, t4, a4
                  fcvt.w.s     t3, ft11, rdn
                  fmul.s       ft1, fa3, fs10, rup
                  or           s4, a7, tp
                  fcvt.w.s     s4, fa7
                  fmul.s       ft9, ft9, fs4
                  remu         zero, s4, t1
                  fclass.s     t5, fa6
                  or           s10, s3, sp
                  fle.s        s11, fs5, fa4
                  fmax.s       ft8, fa5, fs10
                  sltu         a7, tp, t6
                  sll          a1, a7, s5
                  fcvt.wu.s    s7, fs2, rup
                  fmax.s       fa4, ft4, ft7
                  srai         a6, s1, 15
                  srl          t4, a3, a0
                  fsgnjn.s     fs9, ft2, fs11
                  fmax.s       ft8, ft10, ft9
                  feq.s        s0, fa6, fa3
                  fle.s        s2, fs1, ft2
                  fsgnj.s      fs2, fs1, ft7
                  fcvt.s.w     fa5, zero
                  srl          a3, s9, t4
                  add          t0, sp, t5
                  fcvt.w.s     s11, fs8
                  xor          t1, sp, s7
                  mulh         s11, s5, t0
                  srl          s7, s2, s3
                  flt.s        t6, fa5, fs6
                  xor          s0, s7, s5
                  fsgnjx.s     fs5, ft10, fs2
                  slt          a5, sp, t6
                  ori          zero, t0, -1770
                  remu         t5, a3, s4
                  fsgnjx.s     fs10, ft1, ft8
                  divu         s8, s0, sp
                  mulhu        gp, s2, a4
                  sll          a0, zero, a6
                  sltu         sp, t1, a7
                  slli         a6, a5, 20
                  fadd.s       fs6, fs11, ft3
                  mulh         s4, a2, s6
                  fcvt.w.s     s3, fa5, rdn
                  flt.s        s4, fa2, ft5
                  nop
                  mulhu        sp, s7, zero
                  mulh         t3, t6, a7
                  div          s11, t6, sp
                  mul          a3, zero, s1
                  slli         t2, s4, 27
                  sll          s2, t2, t6
                  fmin.s       ft6, fs6, ft3
                  fcvt.w.s     t1, ft3
                  auipc        s7, 956662
                  fcvt.s.wu    ft5, a3, rdn
                  sltu         gp, t2, s6
                  fadd.s       ft10, ft2, ft11
                  auipc        a7, 789109
                  slli         t0, s7, 4
                  addi         t2, s4, -1932
                  fsgnj.s      fs11, fa2, fs8
                  srli         t3, s7, 28
                  rem          a0, a4, a1
                  lui          s3, 236091
                  sltiu        zero, gp, 388
                  remu         a5, zero, s2
                  fsgnj.s      ft7, fs11, ft5
                  divu         s11, s2, t1
                  nop
                  remu         t4, a3, s2
                  fsgnj.s      fa2, fa3, fs2
                  fsgnj.s      fs2, ft0, fs3
                  fcvt.wu.s    s5, fs0
                  mul          a1, t6, s0
                  fmax.s       fs1, fa4, ft3
                  flt.s        a6, ft1, ft9
                  sltu         t1, s4, t5
                  fsgnj.s      ft1, fa3, fs3
                  fcvt.wu.s    t1, fs1
                  slt          s1, sp, s5
                  sltu         s2, s9, sp
                  fsqrt.s      ft8, fs6
                  fmin.s       fa5, fs8, fs6
                  fcvt.w.s     s8, fs2, rne
                  fadd.s       ft10, fs7, fa7, rne
                  mulhu        t1, s10, a4
                  fmax.s       ft9, fa7, ft6
                  xori         s1, sp, -1257
                  fle.s        s5, ft4, fs0
                  fadd.s       ft10, ft1, ft9
                  ori          a3, s11, 1996
                  ori          s6, s1, 209
                  remu         s4, s4, t1
                  add          a4, a3, s3
                  divu         s10, a0, s0
                  addi         a6, s7, 682
                  fsgnjx.s     fs3, ft0, fs6
                  fmv.x.w      a7, fs5
                  mul          a0, tp, zero
                  fclass.s     a7, ft0
                  fmax.s       fs4, ft4, ft5
                  xor          a1, a4, s7
                  fclass.s     a1, ft7
                  sll          s8, s3, a1
                  fle.s        s0, fs10, ft4
                  sltu         s7, t1, ra
                  or           t5, t5, t2
                  lui          gp, 364500
                  slli         a2, s11, 3
                  fsqrt.s      fa7, fs8
                  nop
                  rem          s0, ra, t1
                  div          a0, s9, t2
                  fsub.s       fa3, fa3, fa3
                  mul          a5, t6, zero
                  slti         t1, s6, 695
                  fsgnjx.s     fa1, fs10, ft6
                  flt.s        s8, fa1, ft10
                  srli         zero, ra, 10
                  remu         a7, s10, a7
                  andi         a6, t1, 555
                  ori          a0, t0, 328
                  lui          t0, 853083
                  fmv.x.w      a5, fa4
                  add          t2, s9, a0
                  lui          a4, 407119
                  fcvt.s.w     fs5, s4
                  srli         a6, s7, 15
                  remu         t1, t0, a5
                  fle.s        a1, fs11, fs7
                  fsub.s       ft9, fa1, fs6
                  flt.s        t2, ft7, fs1
                  or           s2, s2, s4
                  mul          a7, a7, t6
                  fmul.s       fs11, ft11, fs11, rup
                  and          t2, s7, a1
                  slt          s4, s11, sp
                  lui          s3, 782375
                  fcvt.wu.s    a3, fs7, rtz
                  sltiu        sp, s10, -1139
                  fmin.s       ft2, fs1, ft1
                  fsub.s       ft3, ft4, fs8, rtz
                  fclass.s     a6, fs7
                  sll          a3, t2, a2
                  sll          t2, t1, a4
                  slli         s5, s4, 27
                  mulh         s3, s5, a4
                  fcvt.wu.s    t6, ft10
                  slt          a0, a1, t4
                  auipc        s6, 70639
                  flt.s        t1, ft9, fs11
                  fmax.s       ft2, fs6, fa1
                  slti         s3, tp, -390
                  fcvt.s.wu    fs3, t3, rdn
                  srl          s0, s0, t4
                  fclass.s     s4, fa5
                  srli         a7, s6, 14
                  and          s6, a6, s4
                  slt          s7, a7, s1
                  mulh         zero, s8, s2
                  or           a5, a7, a6
                  add          t5, ra, s3
                  and          a6, s8, t3
                  fsgnjx.s     ft11, fa2, fa1
                  fsgnjn.s     fa2, fs5, fa3
                  fmv.w.x      fs0, t2
                  add          s2, a0, s7
                  fcvt.s.w     fa7, t0
                  slti         a7, zero, 946
                  feq.s        a5, fs1, fs2
                  xor          t2, ra, s1
                  sll          a5, s5, a1
                  srl          t1, s5, gp
                  mulh         t1, a3, s1
                  slli         gp, t5, 11
                  sra          a1, t1, s1
                  lui          s0, 41709
                  fsqrt.s      fs10, fs1
                  slti         s11, s11, -1528
                  slt          a4, s5, t4
                  nop
                  fcvt.wu.s    a7, ft3
                  fmv.w.x      ft10, s9
                  feq.s        t0, fs10, ft7
                  sltiu        s10, s6, -598
                  nop
                  slti         s7, t0, -1336
                  sltiu        t5, t2, -325
                  fsgnjx.s     fs8, ft3, fs10
                  sub          a5, t2, s1
                  fsgnjx.s     fs11, fa2, fs3
                  addi         gp, s9, 101
                  sltu         a3, a1, s4
                  fmv.x.w      s6, ft5
                  srli         zero, a1, 11
                  fmax.s       fs10, ft2, ft4
                  remu         t0, s0, a6
                  mul          a7, t3, s9
                  fmul.s       ft9, fs5, ft10
                  xori         s3, t4, -1355
                  or           t6, s2, s7
                  mul          s8, t4, s1
                  lui          a7, 299638
                  sra          a6, s2, s1
                  srai         s8, ra, 11
                  fcvt.w.s     t0, ft2
                  ori          a2, s3, -388
                  xor          s5, s7, t0
                  mul          s5, ra, t6
                  fadd.s       fs11, ft3, ft5
                  nop
                  srli         zero, gp, 2
                  fsgnjn.s     ft11, ft11, ft7
                  rem          a6, tp, s1
                  fdiv.s       ft3, fs6, fs8
                  fmv.w.x      ft9, a7
                  remu         a5, a5, t3
                  fcvt.s.wu    fs9, s11
                  fsgnjn.s     fa2, fa2, fs0
                  fcvt.s.wu    ft10, t2, rdn
                  fmin.s       fa4, fa6, ft7
                  sltu         s7, s0, sp
                  fclass.s     t0, ft2
                  fcvt.s.wu    fs3, a7, rdn
                  addi         t6, ra, -1371
                  fadd.s       ft4, fa0, fa4, rmm
                  feq.s        s3, ft7, fs8
                  mul          t2, t3, s4
                  sub          s7, gp, s2
                  mulh         s2, zero, t5
                  sltu         s7, s11, ra
                  addi         gp, s2, 1611
                  mulh         a3, a4, a5
                  fmul.s       fa6, ft6, fa7
                  fsgnj.s      ft2, fs9, ft6
                  mulhu        s4, s1, s0
                  xor          a0, s11, t2
                  srli         t3, t0, 12
                  slti         s5, ra, -1546
                  sltu         a1, a7, t4
                  mulh         s3, s10, t5
                  srai         s3, a2, 3
                  fdiv.s       ft11, fs3, fs7, rtz
                  or           s4, s11, s8
                  fclass.s     t0, ft3
                  fdiv.s       fa1, ft4, fs6
                  xor          sp, s7, t4
                  fle.s        s11, ft2, fs8
                  fcvt.w.s     s7, fs8, rtz
                  div          s8, s10, s0
                  srli         a0, s10, 26
                  fsub.s       ft1, fs4, ft0, rne
                  sltiu        s1, a6, 1642
                  divu         s7, s8, a1
                  srai         a2, s5, 6
                  fmin.s       fs4, ft5, ft1
                  mul          t0, s7, s2
                  feq.s        a3, fs2, fs9
                  div          gp, a2, a6
                  slti         t1, t3, -357
                  sll          s2, s11, sp
                  slti         t0, s3, 1635
                  add          a1, t6, s0
                  srai         t1, t0, 11
                  mul          s5, s4, ra
                  andi         s4, gp, -1806
                  fle.s        s10, fa5, fs11
                  sltu         s3, t4, t3
                  fclass.s     s8, ft11
                  fsgnjn.s     fa6, fa6, fa7
                  xor          s0, tp, s6
                  mul          s8, a5, t5
                  fadd.s       ft5, ft0, fa4, rdn
                  remu         a1, a5, s3
                  fsgnjx.s     fs0, fs0, ft1
                  slti         s10, t2, -1296
                  fsgnjx.s     ft3, fa2, ft1
                  divu         s1, t4, a7
                  or           a0, a3, a0
                  fmv.x.w      t4, ft4
                  mulhsu       t3, s1, s1
                  sltiu        a2, zero, -1339
                  fcvt.wu.s    s8, fs5, rmm
                  mulh         s8, a5, s3
                  auipc        s1, 935909
                  fadd.s       fs7, fs4, fs10, rne
                  fcvt.s.w     fa5, a7, rdn
                  srai         s2, t4, 25
                  fclass.s     a4, fa3
                  sra          s2, t4, s0
                  or           s4, a3, zero
                  fsub.s       fa0, ft5, ft3
                  fcvt.w.s     s3, fa6
                  slti         s1, s9, 1776
                  fsgnjx.s     ft8, ft7, ft3
                  slli         s10, a0, 8
                  fmin.s       fa6, fa1, fs9
                  ori          sp, t0, -347
                  ori          t6, a7, 1433
                  or           s4, s2, a0
                  mul          s4, t0, a5
                  fcvt.wu.s    gp, fa5
                  lui          t2, 860764
                  flt.s        a1, fs11, ft11
                  fmv.w.x      ft6, a0
                  srli         t5, a1, 23
                  fcvt.w.s     s7, ft6, rup
                  fsub.s       fa0, ft11, fs6, rmm
                  srl          s5, s11, t1
                  sltu         a6, t5, a2
                  fcvt.s.wu    ft4, t5
                  fmul.s       fs7, fa1, ft1, rtz
                  fadd.s       fs1, ft8, ft5
                  fdiv.s       fs3, fs2, ft1, rtz
                  fclass.s     s11, fs1
                  slli         s8, t0, 11
                  fsgnjx.s     fs6, ft7, ft7
                  srl          t2, zero, a5
                  sltiu        zero, tp, -1425
                  mulhu        t2, t6, s6
                  fcvt.wu.s    a2, ft9
                  sltiu        s4, gp, 594
                  sub          t1, a6, s9
                  fmul.s       fa0, fa5, fa7
                  sra          t4, s9, s6
                  srai         zero, a5, 1
                  remu         a4, a6, s9
                  sra          t0, t2, a0
                  or           t3, a6, zero
                  xor          s7, tp, t6
                  sltiu        s0, t2, 1345
                  srl          t3, t1, s9
                  and          s8, a6, s0
                  sltiu        s7, s10, 1038
                  xori         sp, t5, 1377
                  xor          a5, s5, a4
                  nop
                  srli         s2, a4, 28
                  auipc        s5, 702202
                  andi         a1, gp, 377
                  sltu         t4, s8, sp
                  andi         s0, t5, -1340
                  mulhsu       a6, a4, s4
                  sll          t3, a5, s3
                  xori         t1, s7, 492
                  xori         t6, s5, -2009
                  srai         sp, s2, 19
                  ori          s3, s0, 690
                  sub          t4, zero, s7
                  fdiv.s       ft1, ft3, fs3
                  slti         s3, a3, 99
                  slli         s5, s6, 15
                  sll          t1, a5, sp
                  sub          t1, a6, s7
                  fcvt.wu.s    s11, ft9, rup
                  ori          s1, t5, 1487
                  feq.s        a4, ft7, ft7
                  xori         a6, s3, -101
                  sub          s11, tp, a0
                  xori         s7, t2, 495
                  mulhu        t4, a1, s3
                  fadd.s       fs5, ft0, ft4
                  fsqrt.s      fs7, ft0
                  fmv.x.w      a0, ft0
                  andi         t6, sp, 1997
                  remu         t0, a1, a6
                  sltiu        s7, s7, 196
                  fclass.s     s10, fa1
                  flt.s        a6, fa2, fs3
                  fle.s        a5, fs8, fa7
                  fmv.x.w      zero, ft2
                  feq.s        t5, fa4, ft6
                  fsgnj.s      fs10, ft7, fa7
                  div          s2, t5, tp
                  lui          s8, 453535
                  mulh         t1, tp, a7
                  fsqrt.s      fs8, ft3, rmm
                  ori          a3, ra, 1666
                  remu         s6, s3, t1
                  rem          t5, t6, a1
                  fmin.s       fa1, fa5, fs6
                  fsgnj.s      ft2, ft1, fs10
                  fsub.s       fs8, fa5, fs3
                  srai         s3, a1, 20
                  mulh         s8, s7, t5
                  fsub.s       fa5, fa2, fs7
                  sltu         t4, t0, tp
                  fdiv.s       ft1, fa3, fa1, rtz
                  andi         s11, t2, 1958
                  lui          s5, 475096
                  sltiu        a4, s11, 362
                  div          s4, ra, a4
                  fdiv.s       ft4, fs8, ft9, rne
                  fadd.s       fa1, ft9, fa1, rdn
                  fsgnj.s      ft2, fs10, ft3
                  mulhu        t3, t0, zero
                  srai         a4, tp, 1
                  fdiv.s       fs7, fs0, ft11, rne
                  and          t4, zero, a0
                  flt.s        a2, fs4, fs0
                  fle.s        s11, ft2, fs5
                  and          t3, s11, s10
                  fmin.s       fa3, ft10, ft1
                  divu         s2, a2, zero
                  rem          t4, t6, s4
                  srl          s2, a6, zero
                  sra          s3, t4, s4
                  fcvt.s.w     fs3, a2, rdn
                  fle.s        s10, fs3, ft8
                  fmul.s       fs4, fa5, ft8
                  fle.s        gp, ft8, fa2
                  nop
                  fmv.x.w      sp, ft10
                  slt          s4, t3, s7
                  sltu         s11, s7, s11
                  sltiu        zero, t6, -2018
                  fclass.s     gp, ft6
                  srai         a4, a0, 18
                  ori          a2, s0, -253
                  sll          a5, a1, s4
                  sltiu        a5, a4, 1299
                  srai         zero, s2, 17
                  fmin.s       fa0, ft8, fs10
                  sltiu        t0, s8, -886
                  mulh         t3, zero, tp
                  mulh         a0, t5, sp
                  sub          t5, a2, s2
                  fmin.s       fs0, fa3, fs11
                  fsqrt.s      fs10, fs8, rne
                  remu         a3, t1, s11
                  fmul.s       ft4, fs11, fs5, rdn
                  fsub.s       fs4, fs5, fs9
                  and          a7, s2, a4
                  slli         t0, s8, 2
                  fmul.s       fs9, fa5, ft8
                  lui          a2, 976193
                  fclass.s     s6, fs4
                  sll          s6, a1, a4
                  fmax.s       fs10, ft1, ft0
                  fsgnj.s      fs6, fa5, fs10
                  fcvt.s.w     ft0, s6
                  fsgnjx.s     fs10, fa2, fs2
                  sltu         s2, a1, s6
                  fmul.s       fa0, ft0, fs9, rne
                  or           a1, s10, s11
                  remu         s4, s6, t3
                  fmin.s       fs2, fa6, ft10
                  rem          a5, s9, a7
                  add          a5, t5, s9
                  rem          t1, s3, s3
                  divu         s1, a4, s3
                  lui          s4, 897814
                  fadd.s       fa7, ft5, fs2
                  fsgnjn.s     fs5, ft10, ft10
                  fsgnj.s      fs3, ft8, ft3
                  nop
                  fsgnjx.s     ft9, fa0, fa3
                  fcvt.w.s     a1, fa0
                  addi         s1, s3, -167
                  slti         s1, a1, -1567
                  flt.s        s7, ft6, ft11
                  fcvt.s.w     ft2, s2, rtz
                  rem          a4, a6, a3
                  auipc        s6, 321982
                  fsgnjx.s     fa3, fs0, ft8
                  addi         t2, tp, 875
                  slli         sp, t0, 29
                  flt.s        a6, fa4, fs3
                  slli         a1, t0, 27
                  fadd.s       fs3, fa2, fs3, rup
                  fadd.s       ft1, ft7, fs5
                  srl          a7, t4, t1
                  feq.s        s8, ft4, fs8
                  add          a7, s4, s2
                  fsgnjx.s     ft3, fs8, fs3
                  slti         s5, t0, 295
                  fcvt.wu.s    a6, fs0
                  srli         s11, a3, 29
                  fmv.w.x      ft1, s0
                  div          a7, a1, a4
                  lui          s3, 43054
                  add          a6, a2, a5
                  ori          zero, s1, 1271
                  addi         a6, sp, -1533
                  srai         sp, s3, 24
                  sltu         t2, sp, t2
                  nop
                  fmv.x.w      t1, fs7
                  fclass.s     t2, ft5
                  fcvt.wu.s    t3, fs6
                  div          s5, sp, a5
                  fadd.s       fs6, fs0, fs1, rne
                  andi         t6, sp, 1440
                  sltiu        t0, t5, 468
                  mulhu        t5, t0, tp
                  fmv.x.w      s6, fa2
                  mulhu        t6, a3, s9
                  fcvt.w.s     s1, fa4
                  sub          a7, a5, s10
                  fmax.s       fs2, fa7, fs2
                  slt          s2, s9, a7
                  fcvt.s.wu    fs6, t0, rne
                  mulh         a1, zero, t2
                  div          s7, a2, a2
                  mulhu        t4, s8, a6
                  add          t2, t0, t4
                  mulh         s8, s4, a2
                  add          t0, a6, zero
                  rem          s10, t1, s6
                  nop
                  ori          s5, t4, 1238
                  fmul.s       fs11, fs3, ft8
                  addi         s8, t2, 731
                  div          a3, s10, a7
                  sll          s4, s11, t1
                  fsgnj.s      ft11, fs8, fa4
                  auipc        a2, 497382
                  srl          a2, s5, a4
                  mulhu        a5, a3, s10
                  fsgnjx.s     ft5, fs10, fa0
                  div          t3, s7, s5
                  fsgnjx.s     ft11, fs1, fs5
                  fsqrt.s      ft10, fa6, rtz
                  fsgnjx.s     fs8, ft3, ft6
                  sub          s1, s2, t3
                  addi         a6, tp, 805
                  andi         t0, a2, 1647
                  fcvt.w.s     a6, ft1, rne
                  fcvt.s.wu    fa6, sp, rup
                  rem          t5, a1, s7
                  fcvt.s.w     ft11, zero
                  feq.s        t6, fs2, fs8
                  srli         a5, s10, 1
                  fmul.s       ft0, fs6, fs10
                  mulhu        s8, t1, gp
                  ori          t0, zero, 780
                  xori         s2, sp, -1822
                  fmax.s       fs3, fs6, fs6
                  div          s6, s11, s11
                  addi         s0, s1, -289
                  fcvt.w.s     t5, fs5
                  fmv.w.x      fs10, s11
                  slt          t3, s9, s9
                  slli         t1, a2, 20
                  divu         t2, t3, t5
                  mulhu        a4, s5, a4
                  fmv.x.w      t6, fa7
                  sll          t1, tp, s6
                  or           a5, a5, a5
                  sub          a4, gp, a3
                  add          a6, a0, t5
                  sub          s5, s9, s0
                  auipc        t4, 220318
                  and          sp, gp, s2
                  fsub.s       fa3, fa7, fs3
                  fcvt.s.w     ft10, s8
                  add          s2, t3, a4
                  fmin.s       fs6, fa0, fa0
                  sub          s10, a0, ra
                  fsqrt.s      ft11, fs3
                  fmv.x.w      s11, fa5
                  fsqrt.s      fs7, ft6, rup
                  fdiv.s       ft4, fs1, fs11
                  fle.s        s4, fa4, fa3
                  fsgnjx.s     fa0, fa3, ft0
                  remu         a3, t5, t4
                  fcvt.w.s     s6, ft6
                  fcvt.w.s     sp, ft9, rdn
                  remu         s0, a2, s6
                  fsgnjn.s     fs0, ft2, ft8
                  flt.s        t0, fs9, fs7
                  fclass.s     s0, fa4
                  mulhu        a7, tp, t3
                  andi         t3, sp, -1287
                  fsub.s       fs9, fs2, fs10, rne
                  div          s6, s2, t0
                  srl          s3, a3, t4
                  sltu         t6, a0, s5
                  fsgnj.s      ft1, fs8, fa6
                  andi         s10, a0, -25
                  fmv.x.w      t2, fs9
                  fcvt.s.wu    fs5, s9
                  sra          sp, a4, a3
                  fmul.s       fa6, fa2, fa6, rtz
                  div          t0, s8, t1
                  xori         s0, s2, 1377
                  or           s0, a3, a3
                  fmin.s       fs6, fs8, fa1
                  fmv.w.x      fs7, s4
                  fmin.s       fs7, fa4, fs10
                  mulhu        sp, s3, t4
                  fdiv.s       fa5, fs5, ft7
                  divu         s4, t3, s11
                  fmv.w.x      fs3, s8
                  slti         s5, t0, -747
                  sll          a1, s11, s1
                  flt.s        s8, fs6, fs8
                  and          gp, a1, s3
                  or           s2, t6, s2
                  nop
                  feq.s        a0, fs4, fa6
                  fsgnj.s      fa7, fs2, fa1
                  sub          s2, ra, t1
                  lui          t2, 320592
                  fle.s        s6, fs0, fs11
                  sra          t1, s5, s5
                  remu         t4, s7, s2
                  mulhsu       a5, s4, a6
                  mul          a2, s2, s6
                  mulhu        s4, a7, s11
                  fmul.s       fa3, ft0, fs8, rup
                  sub          s11, s1, s0
                  ori          s6, tp, -1061
                  fdiv.s       fs3, ft5, fa1
                  srl          sp, t3, s4
                  fsgnj.s      fa7, ft1, ft9
                  fmv.x.w      a1, fs7
                  fmv.x.w      sp, fa1
                  fmv.w.x      ft1, s5
                  slt          sp, gp, s11
                  fsub.s       fa1, fs7, fa2, rdn
                  fdiv.s       fa5, fa3, fs2, rdn
                  mulhu        s8, a6, s0
                  ori          t3, t5, 1862
                  xori         s5, sp, -1081
                  andi         sp, a1, 39
                  mulhu        a3, s0, t1
                  andi         a6, a1, 1500
                  fmv.x.w      s8, fa3
                  fmv.w.x      fa6, t6
                  fmul.s       fs4, ft4, ft7, rtz
                  ori          a5, t0, 164
                  slt          zero, a3, a2
                  nop
                  slli         s5, s4, 9
                  slli         s11, sp, 30
                  slt          s8, a5, s6
                  fcvt.s.w     fa7, s6
                  nop
                  slt          t0, t2, a7
                  addi         s11, t2, -1593
                  slti         s2, a5, -80
                  ori          sp, a2, -1831
                  fsgnj.s      fs9, fa0, fs11
                  fmax.s       ft3, fs6, fs6
                  or           s8, a6, tp
                  fcvt.s.wu    fs4, s7, rne
                  fdiv.s       ft1, fs5, ft2, rtz
                  auipc        s11, 525755
                  div          s4, s9, a1
                  or           s2, a7, s8
                  mulhu        a4, t6, s3
                  fsub.s       fs11, ft8, fa6, rtz
                  srai         t2, sp, 17
                  flt.s        a3, fa2, fa3
                  slti         a3, t1, 597
                  feq.s        a4, fs2, ft5
                  fsqrt.s      fs1, ft3, rmm
                  flt.s        s8, fa0, fs2
                  rem          t1, t5, a3
                  xori         a2, zero, -1426
                  rem          s10, gp, ra
                  srli         zero, s4, 30
                  sra          zero, a5, s11
                  fsub.s       ft1, fa4, ft5, rmm
                  nop
                  srl          s5, gp, t5
                  fle.s        a5, ft1, fs5
                  mul          s4, s10, a6
                  xor          t6, s11, a5
                  feq.s        s7, fa2, fa2
                  sltu         zero, t0, a3
                  or           s2, t1, a7
                  fmin.s       fa4, ft11, fs4
                  addi         s11, t0, 1032
                  ori          gp, tp, -431
                  mulhsu       t2, a4, t0
                  sra          zero, sp, sp
                  xor          sp, s4, a2
                  fmv.x.w      s7, ft0
                  addi         a6, a0, 1642
                  flt.s        a0, fs6, fa3
                  srai         t1, tp, 28
                  mulhu        s8, sp, a2
                  slt          a0, a0, s9
                  slti         t0, a1, 1107
                  fle.s        a2, ft8, fa7
                  div          s4, gp, a4
                  srl          s4, t0, a2
                  and          t5, s11, a3
                  fadd.s       fa6, fs9, fs0, rne
                  mulh         a2, s4, s2
                  sra          t6, s1, zero
                  fmin.s       ft4, fs1, ft7
                  slti         s7, s9, 482
                  and          t0, sp, t5
                  sltu         zero, s2, s6
                  fsgnj.s      fs2, fa3, fa5
                  sra          s4, s10, t1
                  feq.s        s11, fs11, ft5
                  add          t1, t5, a2
                  divu         s6, s6, sp
                  fmv.x.w      a6, fs11
                  fsgnj.s      fs3, fs6, ft9
                  srl          sp, s11, gp
                  fsqrt.s      fs0, ft3
                  srli         s5, t0, 20
                  mulhsu       s4, t3, t0
                  fmv.w.x      ft8, a7
                  lui          a2, 662651
                  sltu         a1, a7, sp
                  srai         s0, s4, 12
                  fle.s        t4, fa1, ft5
                  auipc        s2, 38492
                  flt.s        a2, fs3, fs9
                  sltiu        a2, a3, 1673
                  feq.s        a7, fs0, fs4
                  sra          a5, t1, s0
                  fsgnjx.s     fa4, fa1, ft2
                  mulh         t0, sp, t6
                  mul          s0, a0, t3
                  rem          t1, t0, a0
                  fcvt.wu.s    sp, ft2, rtz
                  lui          s10, 719575
                  fcvt.w.s     zero, ft11
                  div          s0, gp, t2
                  fsgnj.s      ft0, ft10, fs0
                  auipc        s7, 968775
                  sll          s10, a0, a4
                  or           a2, s7, s11
                  fmul.s       fs11, ft8, fs11
                  fmv.w.x      fs6, tp
                  remu         gp, a6, t3
                  fadd.s       fs0, ft4, fa0
                  mul          s5, s5, a3
                  remu         a7, s0, t3
                  feq.s        t5, ft1, fs6
                  nop
                  mul          s1, t3, t5
                  xor          a2, s0, s3
                  divu         a5, gp, t3
                  addi         t4, gp, -305
                  andi         t2, t6, 1404
                  andi         s5, a5, 179
                  fcvt.s.w     fs9, t0
                  divu         a7, ra, a3
                  sll          s6, tp, s8
                  slt          a1, a1, a6
                  fsqrt.s      fa2, ft7, rne
                  lui          s10, 289395
                  nop
                  remu         a1, t5, s6
                  sltiu        s5, a4, 67
                  fcvt.s.wu    fa0, s7, rmm
                  andi         a4, a0, -573
                  fsgnj.s      fa6, fs8, fs0
                  xori         s0, ra, -201
                  nop
                  mulhu        t1, s7, s0
                  flt.s        a3, fa1, fa3
                  srai         t3, s10, 4
                  andi         a1, s4, -1590
                  sll          s0, t3, s11
                  fcvt.s.wu    fa7, a6
                  nop
                  fmv.x.w      s4, fs1
                  fmin.s       fa4, fs4, ft6
                  sll          a6, s4, t3
                  mulhsu       s2, a0, s0
                  fcvt.s.w     fa4, sp
                  sub          s7, s10, a3
                  srai         t0, gp, 18
                  fmax.s       fa7, fs0, ft6
                  fcvt.wu.s    s3, fs3, rmm
                  fmax.s       fa7, ft6, ft9
                  add          a0, s9, t1
                  fsqrt.s      ft9, ft3, rdn
                  auipc        a3, 329522
                  fsqrt.s      ft7, fs10
                  ori          s10, a2, 798
                  or           s2, a2, sp
                  mulhu        gp, s4, a4
                  slt          s2, s0, t2
                  slti         a4, sp, -483
                  srl          a5, a4, s1
                  fle.s        s3, fs7, fs1
                  fclass.s     s0, fa1
                  mulhu        t4, a4, s5
                  fcvt.wu.s    s4, fa7, rne
                  fcvt.s.wu    ft9, a4, rmm
                  lui          s7, 803882
                  rem          s7, t0, tp
                  srai         t6, s3, 29
                  fmax.s       fa3, fa3, fs2
                  feq.s        t0, ft1, fs8
                  feq.s        t4, fa6, fs4
                  add          t0, t3, s6
                  fclass.s     a2, fs7
                  sll          s10, a3, s10
                  fmax.s       fa6, fs0, ft2
                  fmv.w.x      fa6, a5
                  fsgnj.s      fa2, fs3, fa2
                  srli         s5, t4, 24
                  fmax.s       ft0, fs6, fa7
                  fcvt.wu.s    zero, fa7
                  feq.s        gp, ft0, ft5
                  fmv.x.w      a1, fs5
                  ori          a7, t3, -674
                  remu         s7, t0, s6
                  auipc        s11, 165470
                  or           s2, t3, s9
                  div          a3, a1, s6
                  sra          a5, s9, a7
                  mulh         a3, tp, a0
                  lui          sp, 689441
                  sll          t1, gp, s3
                  fmv.w.x      fs10, t0
                  fsgnjx.s     ft1, fa1, ft6
                  or           zero, s11, a4
                  sltiu        s7, sp, 1641
                  sra          sp, t4, a2
                  fmv.x.w      t4, fs7
                  sll          a0, t0, ra
                  fsub.s       ft6, fa0, ft3, rne
                  sra          t0, t6, s3
                  sll          a1, s10, tp
                  mulh         s8, t6, a7
                  fmul.s       fa6, fa2, fs7, rup
                  fsqrt.s      fa1, ft2, rne
                  sra          sp, gp, a0
                  fcvt.w.s     gp, ft9, rup
                  fle.s        a0, fa0, fs5
                  srli         t6, a2, 29
                  add          t4, t2, a3
                  flt.s        a7, fa7, ft4
                  divu         t3, t1, a3
                  srli         s5, sp, 28
                  slt          t2, s3, gp
                  fcvt.w.s     t4, fa6
                  mulh         a0, a2, s10
                  ori          a2, t0, 639
                  fadd.s       ft3, ft9, fs5, rmm
                  sltu         s10, gp, a4
                  srai         s1, a2, 16
                  fsgnjn.s     fs10, fs4, fa7
                  fclass.s     a5, fa4
                  fsub.s       fs5, fa6, fa3
                  fsgnjn.s     fs1, ft3, ft6
                  fcvt.s.wu    ft9, a2
                  fle.s        t2, ft3, ft9
                  srli         t2, s6, 16
                  fadd.s       fs9, fs2, fa2, rup
                  sltu         s0, s7, zero
                  nop
                  fcvt.wu.s    a1, fs7, rne
                  slti         t3, s11, -598
                  fmin.s       fs9, fs2, ft5
                  slt          t2, s4, s10
                  remu         a1, s4, s5
                  fdiv.s       fs10, ft10, ft7, rmm
                  andi         a7, s4, -1979
                  fcvt.wu.s    a6, ft4, rup
                  flt.s        t1, ft9, fa4
                  fclass.s     s5, ft8
                  fcvt.w.s     s1, ft3
                  fle.s        a4, ft11, fs7
                  sltu         zero, t3, t0
                  xor          a2, a1, a1
                  rem          s2, gp, s8
                  mulhsu       a7, s3, a6
                  nop
                  fmv.x.w      s0, fa1
                  andi         s0, t0, 1945
                  srl          t0, s4, t4
                  fsgnj.s      fs8, fs5, fs5
                  sub          a3, a0, t1
                  fcvt.s.wu    fs7, s2
                  srai         a5, t6, 5
                  sub          s1, t3, ra
                  mulh         s10, s5, a1
                  andi         zero, a4, 1088
                  fsqrt.s      fs10, fa4, rne
                  fdiv.s       ft2, ft0, fa6, rup
                  xor          s4, zero, s0
                  flt.s        a7, fa0, fs1
                  fmul.s       ft5, ft0, ft7
                  divu         gp, ra, t3
                  fsgnj.s      ft4, fa7, fa1
                  fclass.s     a2, fs8
                  fsgnjn.s     fa5, fs10, ft9
                  ori          t5, a7, 1702
                  div          t1, ra, t5
                  div          a1, t3, s8
                  divu         sp, s5, a3
                  srai         s8, s6, 18
                  nop
                  mulhu        a4, ra, s0
                  fsgnjx.s     ft0, ft7, fa1
                  fcvt.s.wu    ft3, a1
                  fclass.s     t2, fs4
                  sll          zero, t4, gp
                  feq.s        t6, ft3, ft9
                  fsgnjn.s     ft8, fs1, ft1
                  sltiu        a1, s3, -1159
                  srl          gp, sp, ra
                  rem          s6, a6, a6
                  fmin.s       fa3, fs6, fs1
                  nop
                  fdiv.s       ft11, fs9, ft4, rne
                  fclass.s     s3, fs6
                  mulhu        t3, a6, s8
                  fcvt.w.s     a6, fa2
                  fsqrt.s      ft10, fs4, rup
                  mulhu        t5, a6, gp
                  xori         a3, t0, -1020
                  fsgnjn.s     fs1, ft4, fa5
                  andi         s3, s0, 645
                  fcvt.w.s     gp, fa2, rtz
                  auipc        s3, 392890
                  srl          t1, s8, t1
                  remu         s4, zero, s2
                  fsgnjn.s     fs10, fa1, ft7
                  sll          a2, s2, t0
                  fsgnjx.s     fs5, fa7, ft10
                  xori         a3, s7, 1068
                  fmin.s       fa1, ft8, fs11
                  nop
                  slli         t4, a6, 13
                  rem          s11, a5, t3
                  ori          a7, gp, 1637
                  andi         sp, s4, 1427
                  slli         zero, s0, 20
                  lui          s3, 241344
                  fmv.x.w      s2, ft1
                  mulh         a1, s6, sp
                  srai         s0, ra, 13
                  fmv.x.w      t5, ft9
                  div          t1, a2, a5
                  fcvt.s.w     fa7, s11, rtz
                  fmax.s       fs0, fs10, fa2
                  auipc        s5, 374394
                  remu         a3, s4, t1
                  srli         t3, s2, 29
                  sltiu        t6, s11, -2016
                  auipc        t4, 201121
                  srli         t6, s3, 13
                  div          t6, s2, s1
                  mul          a4, s4, s8
                  mulhsu       t2, zero, s3
                  andi         a0, s9, -358
                  fmul.s       fa5, ft1, ft1, rup
                  fsgnjx.s     fa7, ft2, ft4
                  lui          s0, 874638
                  fsgnjn.s     ft2, ft3, ft0
                  fclass.s     t5, fs9
                  sltu         a1, s5, s11
                  slti         a3, s5, 538
                  slli         a4, t0, 12
                  div          s0, s1, a2
                  fdiv.s       ft10, fs4, fa0
                  div          sp, a4, s10
                  rem          t0, t4, sp
                  fsgnj.s      ft9, ft11, fs11
                  fcvt.wu.s    a3, ft10, rup
                  fle.s        s4, fs6, fs2
                  andi         s5, a6, -84
                  feq.s        s0, fs10, ft3
                  div          s4, a6, s5
                  mulhu        a2, t3, t6
                  flt.s        a3, fa5, ft6
                  fcvt.s.w     fs10, s3
                  fsub.s       fs0, fs8, fs8
                  mulh         t0, s6, s6
                  fsub.s       fs7, fs1, fs3
                  xori         a2, t5, -889
                  or           a1, s10, zero
                  fsqrt.s      fs10, ft6
                  div          s1, s11, a0
                  ori          sp, s1, -1843
                  or           a7, t5, t2
                  fclass.s     s3, fa3
                  slt          t4, a0, s3
                  fsgnj.s      ft11, fs0, ft10
                  flt.s        t1, fs11, ft5
                  andi         a1, ra, 115
                  feq.s        s6, ft8, fs5
                  xori         sp, t4, -496
                  ori          t3, a2, -1431
                  auipc        a1, 216992
                  fmax.s       ft1, fa7, ft0
                  andi         t2, s7, 734
                  remu         a6, t4, s7
                  andi         a4, a5, -918
                  remu         a1, s10, t4
                  feq.s        gp, ft8, ft1
                  fcvt.w.s     t3, fa0
                  fmv.w.x      ft0, tp
                  addi         a3, s1, -1271
                  fsgnj.s      fs7, fa7, ft4
                  mul          a3, s9, s3
                  mulhsu       s1, s9, t1
                  sub          t6, t1, a5
                  slt          a1, a6, s9
                  sub          s2, s4, t2
                  fsgnjn.s     fa3, fa3, fs10
                  slti         a5, ra, 1506
                  add          s5, t0, t3
                  flt.s        a5, ft8, ft0
                  sltiu        a5, s6, 51
                  xor          sp, s8, t4
                  xor          s6, a7, s1
                  sll          zero, sp, sp
                  fmin.s       fs5, fs5, fa3
                  xor          s3, s6, s6
                  mul          s1, s4, a6
                  slti         s6, t0, 116
                  flt.s        s10, ft9, fs6
                  fmv.x.w      t6, fs5
                  mulhsu       t4, t3, s0
                  fcvt.w.s     a5, fs5
                  fcvt.wu.s    a4, fs10
                  mul          s11, s4, s2
                  slli         a6, a0, 25
                  nop
                  fmax.s       fa1, ft9, fa3
                  fsgnjn.s     fs2, fs1, ft11
                  fadd.s       ft3, fs8, fa0, rup
                  mulh         a6, t0, s7
                  fmin.s       fs10, ft4, fa3
                  fmax.s       fs7, fa0, ft8
                  andi         s0, a6, -312
                  srli         s7, t3, 1
                  fadd.s       fa2, fa1, fa2
                  sltu         t1, a1, t4
                  and          t2, a2, a1
                  div          a6, a2, s7
                  remu         zero, t0, s3
                  mulh         t1, t0, s6
                  sra          s3, t0, s10
                  addi         s7, s0, -1140
                  mulh         a2, a1, a6
                  fmv.x.w      s11, ft2
                  xor          s10, t5, s7
                  slli         t4, zero, 4
                  fsgnjn.s     fs2, fa2, fs9
                  sltu         a1, s6, s10
                  slli         s4, s1, 19
                  srli         s0, s11, 25
                  mulh         s4, s2, s3
                  divu         t0, s10, t1
                  srli         t6, a3, 9
                  fadd.s       fa1, fa1, fs6, rmm
                  fcvt.w.s     a6, fa4
                  mul          s7, a0, a0
                  mulhu        sp, gp, t4
                  fcvt.w.s     s2, fa0
                  remu         t6, s1, s3
                  srl          s2, t2, tp
                  mulhsu       sp, s9, t2
                  fmv.x.w      s10, ft1
                  ori          s1, ra, 116
                  sltiu        t0, t0, 1343
                  auipc        t2, 1038027
                  sltiu        a5, s3, 50
                  fcvt.s.w     ft4, a0, rne
                  remu         t3, s3, s10
                  sub          a3, a5, gp
                  or           s8, s9, t6
                  add          s0, s4, t1
                  fmax.s       ft10, ft11, fs10
                  fmul.s       fs5, fs4, ft2
                  sra          s1, s6, zero
                  and          zero, zero, a0
                  fmin.s       fa7, ft8, fa4
                  sll          t3, s6, s1
                  slli         s4, t4, 30
                  fmv.x.w      a3, fs8
                  slli         t6, a1, 16
                  nop
                  fsgnj.s      ft4, ft8, fs3
                  fadd.s       ft2, fa4, fa0, rup
                  fle.s        a7, fa7, fa3
                  auipc        t6, 508856
                  fcvt.s.w     fs2, t3, rne
                  remu         a1, a1, s2
                  xori         t1, s5, 474
                  fmv.w.x      fs1, s0
                  fsub.s       ft7, fs3, ft9, rtz
                  fsgnjx.s     fa4, fa3, fa7
                  auipc        t1, 129912
                  fsub.s       fs3, fs0, ft11
                  srl          t5, gp, a1
                  lui          t5, 69953
                  fclass.s     t5, ft8
                  divu         a4, a1, s5
                  mulh         a7, a3, s1
                  sra          a3, s9, s0
                  sra          s0, s2, s9
                  fmv.w.x      fa1, a5
                  srl          a1, t6, t3
                  fmin.s       fa2, fa6, ft2
                  srl          gp, a5, a2
                  andi         t4, s1, -1159
                  flt.s        t0, fs2, ft11
                  srli         a3, s11, 25
                  fcvt.s.wu    ft0, ra
                  ori          t5, s11, 1860
                  mulh         t3, s6, a6
                  fcvt.s.wu    fs8, t4
                  rem          t6, a7, s11
                  sltu         s8, t1, s11
                  fadd.s       fs0, fs9, fa2
                  div          t5, t6, s10
                  and          a1, t1, t2
                  sltu         a1, t2, s2
                  divu         s5, t1, a7
                  andi         s8, s8, 1075
                  srli         a7, a4, 5
                  nop
                  add          s1, gp, s11
                  fsgnjx.s     fa7, fs7, ft11
                  slt          s5, s1, sp
                  sra          s11, s10, tp
                  lui          s10, 287612
                  slt          t0, s1, a4
                  divu         s4, ra, t3
                  srl          s6, t6, a5
                  sltiu        s8, t6, 110
                  fclass.s     a4, fs4
                  fmin.s       ft4, ft8, fs9
                  mul          s6, a5, s5
                  ori          t2, t5, 66
                  mulh         a5, s3, t1
                  ori          a1, a2, -925
                  slli         t5, t0, 26
                  sltu         a0, a3, sp
                  sll          a7, s11, t0
                  srl          s0, a6, s10
                  div          a3, sp, s10
                  fle.s        s5, fa7, fs11
                  fmin.s       fs2, fs5, ft8
                  slt          s5, s10, a0
                  remu         s10, a0, tp
                  fmv.x.w      t1, fs8
                  slti         s3, s1, 771
                  slt          t2, s5, a7
                  rem          t6, a5, t1
                  fsgnj.s      ft3, ft5, fa5
                  remu         a3, a0, s9
                  fcvt.w.s     t3, ft10, rdn
                  flt.s        s7, ft5, ft4
                  and          t4, s5, s3
                  add          s6, a1, s1
                  fadd.s       fs6, fa6, fa2, rtz
                  xori         a7, s4, 1561
                  fcvt.wu.s    a0, fs1, rne
                  mulhsu       t6, tp, zero
                  fsgnjx.s     fa2, ft4, fa7
                  lui          a6, 809255
                  flt.s        sp, fs3, ft6
                  div          s4, s6, t6
                  mulhu        t2, gp, t3
                  auipc        a5, 469954
                  mulhu        sp, s11, s2
                  fcvt.s.wu    fs9, zero, rtz
                  feq.s        s3, ft1, ft8
                  slt          s0, a7, sp
                  fadd.s       fa7, fs9, fa3, rup
                  flt.s        t3, ft0, ft2
                  mulh         s1, a2, s7
                  andi         a6, a7, 252
                  srli         s1, s4, 3
                  fsgnjx.s     fs11, fs3, fa4
                  mulhsu       s10, s4, a6
                  srl          t0, s3, t3
                  fmin.s       fs11, fs9, ft11
                  andi         t0, t1, -78
                  andi         zero, t0, -597
                  slt          t0, a4, s7
                  nop
                  mulh         t1, tp, tp
                  fcvt.w.s     s2, fs2, rne
                  rem          a3, a5, t2
                  sra          s5, s4, a0
                  and          a0, s8, t0
                  divu         a0, s3, a6
                  mulh         s7, zero, s11
                  add          a1, t5, s1
                  sltiu        a1, a3, 1913
                  slt          a6, t5, gp
                  srai         a4, a3, 2
                  nop
                  lui          s11, 692784
                  slli         s4, t4, 15
                  div          a4, s0, s4
                  fsqrt.s      fs3, fs10
                  fcvt.s.wu    fs8, gp, rne
                  mul          s5, s4, zero
                  fsqrt.s      ft8, fs10, rmm
                  srl          a2, t2, tp
                  fle.s        s7, fa4, fa4
                  mulh         s1, a7, s7
                  and          a5, zero, s5
                  fcvt.s.w     ft10, ra
                  xori         s0, s10, 1952
                  slti         s0, t3, -1760
                  mulhu        a4, s7, s11
                  slt          s1, a4, a2
                  mulhu        s10, s3, s10
                  sub          s7, t6, zero
                  slt          a2, a3, s11
                  fmax.s       fs11, fa1, ft4
                  fmul.s       ft5, fs10, fa7, rmm
                  slli         zero, t2, 1
                  or           a5, a7, s4
                  remu         a7, t2, zero
                  fmv.x.w      s7, ft2
                  mulh         s11, ra, ra
                  feq.s        s2, fs6, fs6
                  sub          a3, s11, ra
                  addi         a2, s2, 1684
                  fclass.s     s2, fa2
                  sltu         a2, t6, t3
                  flt.s        a0, ft10, fs9
                  sltiu        a2, t5, 1339
                  sll          t1, a1, s11
                  nop
                  srai         a1, ra, 29
                  mulhu        sp, t6, a7
                  mulh         a2, s2, t6
                  fclass.s     s10, fa5
                  feq.s        a2, fs10, fs8
                  slli         s8, s8, 21
                  fsub.s       ft11, fs2, fs4
                  or           s6, s9, s4
                  mulhu        t6, s5, t4
                  fadd.s       fs6, ft5, ft9, rmm
                  fmv.w.x      ft3, t0
                  fcvt.s.wu    ft4, t6
                  srai         s0, a0, 26
                  ori          a6, t1, -1008
                  sub          t0, tp, s4
                  mulh         s0, sp, t2
                  divu         a1, s3, t0
                  xor          s1, s9, ra
                  fmax.s       fa5, fs4, fs9
                  sra          s6, t2, s4
                  fsgnjx.s     ft8, fs11, fa5
                  sll          a4, s10, a0
                  rem          s2, s4, s8
                  andi         a3, s10, -1451
                  slti         s0, a7, -1028
                  fcvt.wu.s    s6, fs5
                  flt.s        t0, fa7, fa3
                  fsgnjx.s     ft1, fs5, fa2
                  fmv.w.x      fs1, s9
                  div          s2, t6, s3
                  fclass.s     a2, ft5
                  slt          t4, s10, a6
                  sub          a0, s3, sp
                  fcvt.w.s     s11, ft3
                  flt.s        t2, ft8, fa6
                  divu         a0, s2, s7
                  divu         a6, a7, s6
                  fsgnjx.s     fs3, fs5, fs3
                  fadd.s       fs9, ft7, fs0
                  add          t5, t0, a0
                  fclass.s     a5, fs11
                  auipc        s3, 715080
                  fsgnjx.s     ft1, ft11, fa1
                  srli         s8, a2, 13
                  rem          t6, s7, a2
                  fdiv.s       fa1, fs7, fa5
                  fmin.s       fs7, fs6, fs0
                  fmv.x.w      a5, ft3
                  mulhsu       t5, a7, a2
                  andi         t4, gp, 1236
                  fsub.s       fs6, fa2, ft9, rup
                  andi         s4, sp, 704
                  add          t1, a7, t2
                  flt.s        a2, ft4, ft11
                  div          s4, s11, t6
                  srli         sp, tp, 8
                  slli         a5, a2, 24
                  add          s4, zero, s9
                  sub          a4, t0, s10
                  sll          t5, tp, a0
                  xor          s1, t4, tp
                  add          a2, a2, t2
                  sub          t5, a6, sp
                  sub          zero, t1, a2
                  remu         a7, s1, s2
                  andi         s2, a1, 1929
                  sra          a5, s7, a4
                  fclass.s     s4, ft0
                  fsgnjn.s     ft9, fa6, fa6
                  ori          s8, s1, 1384
                  ori          gp, a5, 1146
                  auipc        a0, 140586
                  slt          a7, s1, t2
                  and          s4, s10, a4
                  flt.s        t1, ft8, fs10
                  fmv.x.w      gp, ft11
                  andi         a3, s6, 1610
                  slli         s3, s9, 31
                  feq.s        a7, fa4, fs9
                  fmul.s       ft0, fs9, fa1, rdn
                  fcvt.wu.s    a5, fs10
                  fmul.s       ft1, ft3, ft10, rdn
                  sltiu        zero, a0, -687
                  sub          t4, t6, s5
                  sltu         a6, a4, a0
                  mul          a1, a2, s10
                  auipc        a7, 843118
                  srai         a6, s3, 9
                  fcvt.wu.s    a4, ft3, rmm
                  fadd.s       fa7, fs0, fa3, rne
                  nop
                  fcvt.w.s     t3, ft4
                  srai         s6, tp, 16
                  sltu         t1, tp, t1
                  auipc        s3, 292613
                  fcvt.s.w     ft7, s9
                  srli         a4, a0, 4
                  srli         s7, t0, 21
                  and          a1, s8, t5
                  mul          a6, tp, s7
                  add          t4, s7, t1
                  xor          gp, a5, tp
                  fadd.s       fs1, fs3, ft10, rup
                  mulhu        a1, t4, a2
                  fcvt.wu.s    a3, ft11, rne
                  div          a1, s6, a4
                  fmax.s       ft0, fa6, fs6
                  mul          t4, t5, t3
                  ori          t6, a1, -784
                  fadd.s       ft0, fs7, ft0, rtz
                  rem          s11, s0, s4
                  fmv.x.w      a4, fs11
                  fclass.s     s10, fs6
                  slli         a3, t0, 21
                  sra          s10, zero, s7
                  fsgnjn.s     ft5, ft3, ft6
                  slli         s6, ra, 0
                  auipc        s2, 805390
                  lui          a7, 841214
                  sub          s11, s4, s8
                  lui          s5, 930108
                  fle.s        s11, fs7, ft3
                  fmv.x.w      gp, ft8
                  mulhu        t5, s1, s9
                  sra          a0, ra, a1
                  lui          t1, 61671
                  fsub.s       fa1, ft2, fa5
                  fcvt.wu.s    s0, ft1
                  srai         s6, s2, 25
                  fcvt.wu.s    s2, fs9
                  sltiu        s10, s7, -658
                  fclass.s     a5, ft10
                  rem          t5, gp, t0
                  slt          s4, s1, t5
                  srl          s2, s1, a2
                  lui          a1, 362477
                  fmax.s       fa3, fs2, fa4
                  fclass.s     a3, ft10
                  divu         t4, a6, gp
                  slli         a3, s9, 18
                  remu         s5, a0, s2
                  srai         s10, s1, 18
                  sltiu        t4, a6, 509
                  and          s4, zero, s11
                  fmin.s       ft3, ft6, fa1
                  fmin.s       ft3, ft11, ft8
                  ori          t4, s0, -1601
                  fsub.s       ft1, fs1, fs5
                  divu         sp, a1, t6
                  mul          t6, a5, t3
                  fsgnjn.s     fs5, fs6, ft3
                  ori          t0, s10, -337
                  fsgnj.s      fs0, ft5, fa4
                  or           t1, sp, a2
                  slt          s7, s2, a1
                  mulhu        s5, s6, a3
                  fdiv.s       ft2, fs11, fs0, rne
                  fmv.w.x      fa1, a3
                  sub          a2, s7, s3
                  auipc        s1, 128118
                  fmv.w.x      ft3, t5
                  sltu         a5, t6, s3
                  slt          t1, s3, t1
                  fmin.s       ft10, ft11, fs10
                  fsub.s       ft3, ft3, fs9, rtz
                  or           t0, s8, t0
                  addi         s0, a2, -1120
                  xor          a4, tp, s5
                  slt          a3, a6, t4
                  fle.s        a7, ft9, ft10
                  sub          a0, t0, s6
                  sltiu        t1, a2, -2042
                  slti         t4, gp, 868
                  sll          t6, s0, s9
                  rem          a7, s11, s9
                  srai         s6, gp, 24
                  remu         zero, s5, s9
                  slti         s5, t6, 234
                  fmv.w.x      fa5, a7
                  mulhsu       s4, s4, tp
                  fle.s        t0, fa6, ft5
                  fdiv.s       fs4, fa3, ft10, rne
                  fsub.s       fs9, ft4, fa0
                  slli         s3, t0, 10
                  slt          a1, gp, tp
                  rem          t2, tp, s3
                  feq.s        s6, ft3, ft7
                  mul          s7, s7, s3
                  flt.s        t1, fs2, ft1
                  addi         s6, t5, -1495
                  divu         s6, s10, tp
                  andi         a5, a5, 21
                  fsgnjn.s     ft11, fs7, fa5
                  nop
                  fcvt.s.wu    fa5, a3, rne
                  sltiu        s11, a4, 1119
                  slt          s4, s6, s6
                  mulhsu       a4, tp, s6
                  xori         zero, ra, 1292
                  andi         s1, s3, 1227
                  mulhu        s11, t1, s11
                  fcvt.s.wu    fs3, sp
                  andi         sp, t0, -1635
                  sltiu        a3, a0, -333
                  fmul.s       ft4, ft7, ft8
                  fadd.s       fa3, fa4, fs10
                  fcvt.s.wu    fs7, s11, rne
                  slli         t3, s1, 6
                  mulhu        s4, t4, t6
                  fcvt.s.w     ft3, a0, rup
                  xori         t3, s6, -778
                  ori          s11, a6, 188
                  fmv.w.x      ft3, t2
                  fcvt.s.wu    fs11, s3
                  fadd.s       fs3, ft4, ft4, rne
                  fsub.s       fa2, fs2, fs8
                  srli         s10, a2, 10
                  fdiv.s       ft7, ft6, ft5
                  slli         t5, s6, 6
                  fcvt.w.s     s0, fs3, rmm
                  fclass.s     a3, fs5
                  fclass.s     s10, fa7
                  xori         gp, a6, 1763
                  lui          a2, 993115
                  rem          t3, t6, s11
                  slli         a5, s2, 1
                  slt          s10, t2, s7
                  xor          s5, t2, a3
                  sltiu        s5, a5, 1298
                  sltiu        t2, gp, 207
                  sll          s1, s3, zero
                  nop
                  fmv.x.w      s10, fa4
                  addi         sp, s10, 553
                  sll          s5, t5, s0
                  fsgnjx.s     ft11, fs5, fa4
                  fclass.s     s11, fs10
                  sll          t3, t3, a1
                  and          s2, s5, s0
                  fsgnjx.s     fs4, ft7, ft4
                  fcvt.s.wu    ft10, a1
                  rem          t2, s4, t6
                  fsgnjx.s     fa2, fs5, fs6
                  sltu         s0, s6, tp
                  mulh         s0, a4, s1
                  srl          s11, a2, s2
                  slti         t2, a2, -1666
                  fsub.s       fa7, fs1, ft7, rmm
                  fmv.w.x      fs5, t2
                  srai         a1, s9, 17
                  fsgnjx.s     fa5, ft1, fa7
                  sll          a5, a0, sp
                  fmv.x.w      a2, ft5
                  srai         t2, s10, 5
                  lui          a2, 945881
                  fcvt.w.s     s8, fs7, rup
                  fdiv.s       fs11, ft6, ft7, rne
                  lui          s6, 275716
                  nop
                  fsgnjx.s     fa2, fs7, fa0
                  fmax.s       ft10, ft5, fs3
                  fmv.x.w      s1, fa0
                  slli         t2, s5, 18
                  xori         s0, t0, 1507
                  ori          s8, s1, 784
                  fmax.s       ft1, fs5, fa2
                  fmin.s       ft2, fa0, fa0
                  ori          sp, a3, 993
                  fcvt.w.s     s1, ft8
                  xor          t4, s3, t4
                  sltiu        s6, gp, -257
                  rem          t4, s7, a2
                  sll          a1, gp, t5
                  nop
                  fdiv.s       fs11, fa6, fs0
                  fcvt.s.wu    fa0, s11, rmm
                  div          t5, s4, a6
                  sra          s3, s7, a7
                  feq.s        zero, fs9, fs9
                  fsgnjn.s     fs7, fa6, ft7
                  xor          a5, s1, s6
                  feq.s        a2, fs1, fs0
                  fdiv.s       fa3, fs4, ft4
                  xor          s0, t3, s5
                  fclass.s     t1, ft6
                  fmv.x.w      s4, ft7
                  srl          a0, a5, a1
                  sub          gp, t2, t5
                  addi         s1, s6, -372
                  div          s5, gp, a6
                  fle.s        s10, fa2, fs6
                  sltiu        t1, t2, 481
                  flt.s        t0, ft6, fs1
                  xor          a2, zero, sp
                  srai         s7, t6, 1
                  sltiu        t0, a4, 207
                  fcvt.s.wu    ft9, t4
                  fmul.s       ft4, fs7, fs7, rtz
                  fsgnjx.s     fs9, fa1, fs1
                  mulh         t6, s11, ra
                  auipc        sp, 844457
                  fsgnj.s      ft6, fs7, fs10
                  xor          a3, t2, t1
                  andi         a1, s9, 626
                  fsgnj.s      fa4, fs4, fs4
                  lui          s6, 682028
                  slti         zero, t4, -1027
                  slti         a0, t0, -103
                  remu         a6, t3, s3
                  fsqrt.s      fs6, fa7
                  remu         s10, sp, s11
                  fmax.s       fa4, ft11, fs7
                  lui          t3, 851508
                  slt          a2, zero, sp
                  fmv.x.w      a2, ft4
                  fcvt.s.wu    ft0, s1, rtz
                  srl          s5, t5, s10
                  fcvt.w.s     s2, fa4, rup
                  fle.s        s11, ft0, fa2
                  sltu         s0, a1, t5
                  srai         a3, s4, 7
                  sra          t4, s9, s0
                  fmv.w.x      fa3, s7
                  mul          s10, t6, s2
                  fdiv.s       fs0, ft10, ft5, rtz
                  fadd.s       fs7, fa4, ft2
                  fclass.s     s10, fa2
                  ori          sp, sp, -792
                  slti         t2, a3, 1504
                  fsgnjx.s     fs3, fa1, fs1
                  fmv.w.x      ft2, zero
                  fmv.x.w      t0, fs3
                  fcvt.w.s     s8, ft11, rdn
                  or           a3, s2, s7
                  slti         a5, t6, 1515
                  xori         s6, s9, 6
                  and          t0, a2, a0
                  feq.s        s3, fs1, fa4
                  and          s7, a5, s1
                  flt.s        s6, ft6, fa6
                  fsgnjx.s     fs4, fa3, fs7
                  add          s10, a1, a3
                  andi         a1, a3, -1847
                  fadd.s       fs10, fs5, ft1, rdn
                  slt          s5, s9, a0
                  addi         a5, t3, -1272
                  andi         t5, t3, 791
                  or           s10, zero, ra
                  fmv.w.x      fs0, s5
                  fsgnj.s      fs7, ft1, fa6
                  slti         s1, t4, 1939
                  rem          s6, sp, s2
                  div          s8, s1, gp
                  fmul.s       fa4, fs6, fa2, rup
                  feq.s        s10, fs2, fs1
                  slti         s8, s5, 961
                  nop
                  fmax.s       ft1, fs8, ft2
                  fmul.s       fa4, fs5, fs4
                  fcvt.s.wu    ft2, t4
                  nop
                  mulh         s0, a1, s8
                  srl          a1, a6, tp
                  mul          t1, s10, a7
                  fmul.s       ft5, fs2, fs6, rdn
                  slt          s0, t3, t3
                  xori         s1, s4, -1631
                  fsqrt.s      ft11, fs4, rne
                  and          s1, t5, s8
                  fle.s        a3, fa6, ft5
                  fsgnjx.s     ft6, fs8, fs1
                  xori         s6, a3, 1904
                  remu         t2, t2, a3
                  xori         s4, s11, -1394
                  fmv.x.w      sp, fs6
                  fcvt.w.s     s10, fa2
                  fdiv.s       fa5, fa2, fs7
                  fle.s        a5, ft9, ft3
                  flt.s        t4, ft10, fa6
                  fle.s        s5, ft9, ft10
                  slt          s4, t0, s3
                  fclass.s     s7, fa5
                  fmin.s       fs6, ft0, ft7
                  auipc        s10, 574400
                  sub          s0, t4, s11
                  fdiv.s       ft11, fs2, fa3
                  rem          sp, a3, a1
                  fcvt.s.w     ft11, s10, rne
                  fsgnj.s      fs4, fs6, ft10
                  sltiu        t4, t0, 1464
                  sll          t0, s3, s1
                  auipc        gp, 973964
                  fadd.s       ft4, fs1, fs3, rup
                  sra          s2, s4, t2
                  or           s1, s3, a6
                  slli         s1, t4, 22
                  fadd.s       ft8, fs3, fs9
                  mul          a6, t6, t2
                  fsub.s       ft2, fs11, ft3
                  mulhu        a2, a6, t4
                  slt          s3, sp, zero
                  remu         t3, a1, t1
                  slli         t2, s3, 13
                  nop
                  fmin.s       ft5, ft5, ft0
                  remu         a0, t4, t2
                  fmv.x.w      t0, fa5
                  fsgnj.s      fs1, ft3, fs2
                  srli         a7, gp, 12
                  fsqrt.s      ft3, fs1, rup
                  fsgnjx.s     fs4, fa3, fs9
                  mulhu        s7, s11, sp
                  flt.s        a1, ft7, fa6
                  fsub.s       ft4, ft9, ft0, rup
                  fsub.s       fa7, fa4, fa3, rdn
                  mulhu        s5, t0, t3
                  addi         t1, sp, -623
                  sra          a3, a1, a2
                  sltu         s1, a2, s4
                  fmin.s       fs2, ft11, fs8
                  rem          t2, t2, s1
                  div          a2, ra, s9
                  sra          a0, tp, t3
                  rem          s1, t0, s6
                  mulh         a5, a7, t5
                  addi         t3, s5, -822
                  slti         s0, tp, 1979
                  fsgnjx.s     ft0, fa1, fa2
                  sra          t2, t4, s5
                  srai         s3, zero, 25
                  fle.s        s7, ft1, ft11
                  fle.s        a4, fs5, ft5
                  fdiv.s       fa4, ft3, fs0
                  auipc        s7, 187560
                  fmul.s       ft4, ft6, fs9
                  fcvt.wu.s    s0, ft7
                  lui          zero, 650548
                  fcvt.wu.s    a4, ft3, rup
                  srl          t6, zero, ra
                  fsgnj.s      ft6, fa5, ft0
                  slti         t2, s3, 148
                  or           s2, ra, s6
                  srli         s6, gp, 14
                  fclass.s     s4, fs8
                  addi         t1, zero, 878
                  xori         a7, t0, -242
                  fsqrt.s      ft0, ft10, rtz
                  fcvt.w.s     s4, ft7
                  addi         a1, t5, 1434
                  and          t0, s7, t3
                  fsqrt.s      fa5, fs11
                  sltu         a5, t0, s5
                  fmv.w.x      fs3, s3
                  mul          a4, s7, a6
                  rem          t5, t2, s11
                  mulh         a5, a2, s3
                  xori         s11, a5, 81
                  mulhsu       s6, s6, a6
                  mul          s1, s8, t0
                  sltu         sp, s6, s7
                  srli         a2, s7, 24
                  fle.s        s6, ft3, fs3
                  addi         a0, t5, 1102
                  fmin.s       fa2, fa7, fa1
                  xori         t1, s5, 1924
                  fsqrt.s      ft5, ft10
                  slli         s8, zero, 22
                  fsgnjx.s     fa4, fa6, fa0
                  srai         a4, a7, 2
                  slt          sp, t1, a5
                  xori         s6, s2, -655
                  rem          s10, t0, a5
                  and          s1, s1, s3
                  mulhu        s3, s6, s2
                  and          s3, zero, sp
                  mulh         a1, s11, s4
                  fadd.s       fs9, fs5, ft0
                  fdiv.s       fs9, fa1, fs11, rtz
                  mul          t2, a7, sp
                  auipc        zero, 405320
                  fclass.s     s7, fa2
                  slti         t6, s6, 1456
                  fsgnj.s      fa3, fa4, fa7
                  fdiv.s       ft1, ft6, ft6, rtz
                  flt.s        a4, fs8, fs5
                  slli         s0, tp, 4
                  fle.s        a6, fa4, ft5
                  fdiv.s       fa2, ft5, fa7
                  fsub.s       ft0, fs0, fs11, rup
                  rem          t4, s6, s3
                  lui          a7, 1019692
                  flt.s        t3, ft6, ft6
                  slti         s6, a6, -1130
                  fclass.s     s8, fs11
                  feq.s        s7, fs2, fs3
                  div          t1, a1, a2
                  andi         a4, zero, 184
                  fsgnjn.s     fs8, ft6, fs1
                  rem          zero, s1, tp
                  srli         s8, a6, 16
                  div          s10, t3, a3
                  fmv.w.x      fs0, s4
                  fcvt.s.wu    fs4, t4, rdn
                  sltu         a0, a1, s4
                  slt          t2, s3, s2
                  srli         a6, s7, 25
                  xor          t0, t2, s1
                  rem          s2, a4, tp
                  or           s3, a2, s7
                  slt          s1, a4, t4
                  auipc        s1, 652970
                  slli         sp, s5, 16
                  fsgnj.s      fs8, fs9, ft5
                  addi         t6, a6, -963
                  fsub.s       fs6, fs7, ft7, rdn
                  div          a0, t4, s5
                  xor          gp, t3, a0
                  sra          t2, s7, s9
                  mulh         a2, t2, s8
                  addi         t2, tp, 1352
                  srl          zero, a0, s4
                  sub          a5, a7, a5
                  divu         s2, a1, tp
                  rem          t6, a4, s1
                  mul          t2, a0, a5
                  and          t5, ra, a7
                  fmax.s       ft6, ft5, fa3
                  mulh         a7, s7, t2
                  and          s10, s0, a5
                  fdiv.s       fs10, fa4, ft3, rtz
                  sltiu        gp, a6, 1911
                  flt.s        s11, fa2, fs4
                  xori         a1, s11, -1315
                  sll          t2, s10, a4
                  fle.s        s8, fa1, fa4
                  fsqrt.s      fs6, fs1
                  add          t6, s4, t6
                  auipc        t1, 947163
                  fmul.s       ft8, ft1, fa7, rmm
                  fcvt.w.s     t6, fs0, rdn
                  sll          gp, s3, s6
                  fmin.s       fs3, fa2, fa6
                  fcvt.s.wu    ft1, t2, rup
                  nop
                  sll          t3, s9, gp
                  divu         a5, s2, t2
                  fle.s        a2, ft4, fa5
                  fdiv.s       ft6, ft8, fa2
                  fmv.w.x      fa5, t1
                  rem          s7, s0, a2
                  andi         s8, s8, 1032
                  fsub.s       fs7, fs1, fa1
                  fmul.s       fs2, fa6, fs8, rdn
                  xor          a2, zero, ra
                  xor          t5, t1, s5
                  ori          a5, s2, 542
                  div          a0, a0, a5
                  mul          s3, a4, a0
                  div          s4, t5, t5
                  div          zero, a6, a3
                  xori         t2, a1, -1096
                  divu         zero, a2, sp
                  fmv.w.x      ft7, s0
                  or           zero, a3, a7
                  add          a7, a7, s8
                  sll          t1, gp, a5
                  sra          a5, s4, t2
                  flt.s        s6, fs11, ft2
                  fcvt.wu.s    s10, fs2, rtz
                  fsgnj.s      ft3, fa7, fa6
                  slt          s11, s7, s3
                  sltiu        a1, tp, 1585
                  fsgnjx.s     fa0, ft2, fa3
                  fclass.s     a3, fs5
                  sltiu        t0, a2, 1798
                  flt.s        s10, fa1, fs1
                  slti         s2, s2, -1259
                  flt.s        s0, ft6, fs6
                  srl          a1, a1, t5
                  fclass.s     a1, ft7
                  add          s1, s0, t5
                  fcvt.wu.s    s1, fs8, rdn
                  auipc        t4, 803514
                  fle.s        s7, ft2, ft1
                  fsgnj.s      ft8, ft1, fs11
                  fmv.w.x      fs1, t6
                  andi         a4, a6, -13
                  fmv.x.w      a3, fa3
                  srl          s2, s11, t0
                  mul          s8, t3, s5
                  srli         s11, ra, 2
                  feq.s        t2, ft9, fa4
                  fadd.s       ft4, fa3, ft7, rup
                  fsqrt.s      ft10, fs11, rdn
                  srai         s7, s0, 7
                  fadd.s       fa5, ft2, fs5
                  fdiv.s       fs2, ft0, fs2
                  or           a2, s0, sp
                  sltu         sp, t2, t3
                  slli         a3, a4, 3
                  sltiu        gp, a6, 469
                  fmin.s       fs4, fs10, fs6
                  ori          s2, s4, 21
                  fdiv.s       ft7, fa5, fs9
                  fdiv.s       fs9, fs7, ft9
                  nop
                  fsgnj.s      ft11, fs10, fs4
                  srli         a6, s2, 29
                  and          t5, a1, a2
                  sll          s6, a5, t3
                  mulhu        t5, sp, t3
                  divu         gp, a2, gp
                  fmv.w.x      ft5, t5
                  slti         s3, s5, -1080
                  fmin.s       ft1, ft5, fa6
                  fle.s        s0, ft6, fs4
                  fcvt.wu.s    sp, fa7, rne
                  fdiv.s       fa4, fs4, fs6, rtz
                  divu         s2, t0, ra
                  sll          t4, gp, t6
                  fmv.w.x      fs1, a1
                  divu         a1, sp, a0
                  slt          a3, a7, t0
                  srl          s11, t3, s7
                  nop
                  fcvt.s.w     fa4, t5, rne
                  fmin.s       ft5, fs5, fa1
                  fmv.w.x      fs1, zero
                  fsgnjx.s     fs6, fs0, fa7
                  xori         s7, s10, -1072
                  srli         s8, t3, 7
                  sll          t0, t5, t6
                  fadd.s       ft0, ft8, fs10
                  addi         t2, s10, -1408
                  slti         gp, a1, -625
                  fadd.s       fa1, fa6, fa2, rdn
                  divu         a4, t2, s5
                  fmv.w.x      ft4, t3
                  srl          a1, tp, a6
                  or           zero, s2, s0
                  mulhu        s4, t3, a6
                  and          a7, a4, s5
                  andi         s10, t1, -1623
                  fsqrt.s      ft4, ft7, rtz
                  xori         a5, t1, 1047
                  flt.s        t2, fs0, fa7
                  lui          a1, 243046
                  fcvt.s.w     fs6, t4, rmm
                  slti         gp, tp, 1450
                  addi         s2, tp, -401
                  srli         s10, t2, 22
                  ori          a1, a2, 710
                  fmul.s       fs10, ft5, ft9
                  fmin.s       fa5, fa2, fa0
                  xori         t1, s3, -614
                  xor          a6, s4, s3
                  fmul.s       fa6, fa4, fs1, rtz
                  fclass.s     s0, fa5
                  srai         a0, s2, 4
                  sltiu        gp, zero, -1415
                  nop
                  divu         t0, s11, t3
                  sra          zero, a7, sp
                  mul          a5, s10, s3
                  fsgnj.s      fs10, fa2, fa2
                  sub          s11, s6, s1
                  slti         t5, s4, 1064
                  fmul.s       fs6, ft7, fa5
                  fsgnjn.s     fs9, fs8, fs2
                  slti         s3, s1, 733
                  mulhsu       t4, s0, zero
                  and          s8, t1, a7
                  or           sp, t6, a0
                  sub          a0, s8, t2
                  ori          s6, a2, -1536
                  sra          a6, sp, s8
                  and          a6, tp, t1
                  mulhu        a1, a7, s10
                  fmv.x.w      s5, ft6
                  add          s2, a2, gp
                  divu         s3, s1, a0
                  feq.s        a3, ft11, ft11
                  srai         s8, s0, 22
                  fcvt.s.wu    fs8, a6
                  fcvt.s.w     fa7, a6
                  nop
                  xori         s3, s3, 868
                  srli         a4, a1, 30
                  andi         s7, a4, 562
                  fcvt.s.wu    ft4, s2, rtz
                  and          t5, a3, s0
                  flt.s        t0, fa7, fa5
                  rem          a7, t6, t2
                  divu         t3, s1, a1
                  add          a7, a0, a7
                  fcvt.wu.s    a5, fa7, rdn
                  slt          a4, t2, t5
                  ori          a7, ra, -199
                  fcvt.s.wu    ft5, s0, rup
                  fmax.s       ft5, fa3, fa0
                  flt.s        t1, fs9, ft10
                  slti         a6, t2, 1781
                  xor          a2, t4, gp
                  or           s5, a3, a1
                  mulhsu       s3, tp, t4
                  mul          s6, t5, t6
                  ori          s0, s6, -111
                  feq.s        sp, fs9, ft10
                  remu         a2, s7, s0
                  xori         s4, a6, 1897
                  fmin.s       fs6, ft7, fa7
                  srl          a0, t4, gp
                  fcvt.s.w     fs1, gp, rdn
                  srli         t6, sp, 21
                  sll          t5, s4, s9
                  mul          a5, t2, s0
                  rem          t1, s9, a7
                  fsgnj.s      ft4, fa4, fa7
                  mul          s11, a7, gp
                  addi         sp, t2, -1752
                  nop
                  fle.s        s6, fs11, fs3
                  slt          t4, s11, s0
                  sub          a5, s7, a0
                  mulhsu       s1, a6, ra
                  srli         s7, a5, 11
                  slt          a5, a1, s4
                  fmv.x.w      sp, fs5
                  rem          t6, t3, ra
                  fsgnjn.s     ft0, fa2, fa1
                  addi         sp, s10, 781
                  fclass.s     t1, fa1
                  fadd.s       ft7, fs9, fs3, rdn
                  xor          s0, a3, s9
                  mulhu        t6, sp, s3
                  fdiv.s       fa7, fs0, ft0
                  fclass.s     a3, fs11
                  fmax.s       ft10, fs1, ft8
                  nop
                  slli         s6, a1, 17
                  xori         s6, a1, -1297
                  mulh         a0, a5, t3
                  ori          t0, t6, 1976
                  fmv.x.w      s4, fs6
                  fmax.s       fs10, fa7, fa5
                  fcvt.w.s     s7, fs6, rne
                  srai         a4, a3, 0
                  fmul.s       fs7, ft1, fs8
                  sub          a3, s8, a2
                  fmv.x.w      s11, fs3
                  slti         s3, s4, 525
                  rem          s4, zero, tp
                  fdiv.s       fa2, fa4, fs9
                  fsqrt.s      fa4, ft10, rup
                  fsgnj.s      fs8, fs9, fa7
                  remu         a6, s4, t5
                  feq.s        a6, fa4, fa5
                  addi         t0, a2, -743
                  slti         t3, s7, -707
                  sra          s6, s7, ra
                  lui          a6, 289627
                  remu         t2, s10, zero
                  or           a2, s9, t6
                  div          a4, s1, t3
                  fclass.s     s3, fa4
                  fadd.s       fs9, fa4, fa6
                  remu         t4, t5, a5
                  fsqrt.s      fa3, fs0
                  fcvt.wu.s    a0, ft0
                  fsgnjx.s     fs10, ft1, ft8
                  sll          s6, a0, a1
                  mulhsu       a3, a0, zero
                  fadd.s       ft11, fs1, ft9, rdn
                  fsgnjn.s     fs10, fa0, fa2
                  flt.s        a4, fs7, ft1
                  fsgnjx.s     ft7, ft2, ft8
                  sll          s3, s3, gp
                  fsub.s       fs8, fa5, fs1, rup
                  fcvt.s.wu    fs7, s5, rmm
                  andi         t6, s10, 841
                  sll          zero, t6, s6
                  fadd.s       ft1, fa4, ft10
                  add          s5, t2, t4
                  srai         t6, a2, 5
                  sub          a0, a6, zero
                  or           a0, zero, a1
                  fcvt.s.wu    fa7, s4, rne
                  and          s5, ra, s5
                  and          a3, t1, s1
                  xori         s4, s0, -1215
                  mulhsu       a5, a5, a4
                  srli         t2, s4, 17
                  fmv.w.x      fs2, s8
                  fmul.s       fs4, ft3, ft8, rmm
                  fmax.s       fa5, fa5, fa5
                  and          s8, a5, s1
                  fmax.s       ft6, ft11, fs10
                  fmax.s       ft5, ft10, ft5
                  sltiu        t3, sp, -1897
                  andi         s8, s3, 1783
                  fsgnjn.s     ft6, fs0, ft7
                  fle.s        a3, fs9, ft10
                  remu         sp, t0, t6
                  flt.s        a1, ft10, fs5
                  lui          zero, 927416
                  fmul.s       fs9, ft5, fs11, rup
                  slli         s3, t1, 0
                  fcvt.s.w     fs4, t2
                  srl          a7, gp, a1
                  mulhu        a1, s3, a3
                  fsgnj.s      fs9, fs5, fa2
                  lui          t3, 700341
                  mulhu        a3, a3, a4
                  andi         s5, s3, 352
                  sll          a3, s5, t4
                  fmin.s       fs1, fs7, ft9
                  slt          a3, s3, t1
                  fcvt.w.s     t1, fs1
                  and          s6, sp, s0
                  srai         t4, ra, 6
                  slli         s8, a4, 26
                  addi         s10, t4, 1912
                  ori          a1, a0, -521
                  nop
                  mul          s4, t5, t0
                  or           a3, s5, t3
                  sra          a6, a6, s5
                  fsgnj.s      fs7, ft5, fs1
                  fmv.x.w      t5, ft8
                  fdiv.s       fs11, ft10, ft0, rmm
                  and          s6, s10, sp
                  auipc        s10, 975860
                  fsgnjx.s     fa2, ft9, fa5
                  fmv.w.x      fs7, t1
                  fmv.w.x      fs2, s2
                  fdiv.s       ft10, ft4, fs9, rne
                  fdiv.s       fa3, fa0, ft0, rmm
                  fsub.s       fs9, fs3, fs3
                  fmv.x.w      s6, ft9
                  xor          t1, a5, s10
                  fcvt.wu.s    t2, fa3
                  nop
                  fadd.s       fs8, ft10, fs8
                  sub          t5, s6, s3
                  slli         a4, a6, 23
                  srli         a6, a3, 30
                  xori         s3, s6, 936
                  andi         t6, s9, -1230
                  fcvt.s.w     fa7, a0
                  remu         a2, s7, s11
                  flt.s        s1, ft10, ft5
                  lui          s3, 785291
                  fadd.s       fs1, fa2, fs0, rup
                  xori         t1, s9, -1386
                  mulh         t5, s9, a3
                  slli         t3, a0, 12
                  sll          t4, s0, t0
                  xor          s0, t3, s0
                  fclass.s     a2, fa4
                  fmv.w.x      ft2, s1
                  slti         a2, a4, 1683
                  fcvt.s.wu    fs11, a0, rmm
                  fle.s        t5, ft9, fs9
                  sll          s2, a1, t3
                  fcvt.w.s     a7, fa2
                  ori          sp, tp, 1393
                  rem          t0, s4, s2
                  or           s8, a5, s3
                  slli         s7, s10, 28
                  fsgnjx.s     fs4, ft3, ft5
                  andi         a3, a7, 1061
                  sltiu        s5, a5, -1116
                  xori         s7, s10, -1964
                  fsgnjx.s     fs9, ft6, ft3
                  divu         s11, s2, zero
                  fcvt.s.wu    fs11, t2
                  nop
                  slt          a4, a5, t2
                  srai         t2, a0, 31
                  slli         t4, tp, 26
                  slli         t0, s1, 28
                  fcvt.w.s     s7, fa7, rtz
                  fcvt.s.w     fa2, a0
                  lui          a2, 597284
                  fmv.w.x      fs11, a0
                  addi         s7, a4, 1882
                  sll          a7, t0, zero
                  srai         s10, a4, 6
                  sltiu        t2, s9, -699
                  auipc        a5, 547815
                  fdiv.s       fs2, fa5, ft2
                  flt.s        t5, ft11, ft10
                  feq.s        t0, ft11, fs6
                  fsgnjx.s     fs8, fs6, fs1
                  fsub.s       fs6, fs1, ft1
                  add          a3, t6, t6
                  and          a3, s6, s9
                  fsgnjx.s     ft11, ft7, fs8
                  nop
                  slt          s7, t1, a0
                  mul          s3, s11, s1
                  slti         s2, a4, -1452
                  fcvt.s.w     fs5, a4
                  fadd.s       ft2, ft2, fs2
                  or           a2, a4, gp
                  add          zero, s8, ra
                  sub          s2, a4, s10
                  xor          s8, a0, s10
                  feq.s        t6, fs7, fa5
                  srli         s0, s8, 10
                  divu         s5, s6, a4
                  fmin.s       ft9, fs9, ft10
                  addi         a1, s7, -1511
                  lui          gp, 33263
                  slt          a7, s10, s2
                  div          zero, tp, s4
                  sll          sp, t1, t4
                  sra          a4, a3, t4
                  fcvt.s.wu    fs4, s7
                  srl          s2, a2, t2
                  addi         a6, s0, 135
                  and          s1, a7, s6
                  fsqrt.s      fa6, ft11
                  andi         zero, s4, 99
                  addi         s7, tp, -1577
                  sll          a7, s7, a2
                  xori         a0, ra, -1482
                  srli         s11, t1, 12
                  ori          a7, t0, 853
                  fcvt.wu.s    s2, fs0
                  fmul.s       fa6, fs0, fs9
                  mul          a2, s9, ra
                  fcvt.w.s     gp, fa1, rup
                  sltu         s3, s5, s1
                  add          s10, s4, sp
                  fsqrt.s      ft5, fs0, rmm
                  fle.s        gp, fs2, fs5
                  fmul.s       ft9, fa6, fa1, rmm
                  mulhu        a5, t6, a3
                  sll          t1, a3, s3
                  fclass.s     a5, fs4
                  fmax.s       fs3, fa6, fa2
                  nop
                  div          s0, s10, s0
                  auipc        s5, 118167
                  add          s4, a1, s10
                  fcvt.w.s     t2, fs10
                  sltiu        zero, s11, -397
                  fclass.s     a1, fs7
                  nop
                  divu         s1, t4, s4
                  feq.s        a6, fa6, ft6
                  nop
                  sub          s3, s1, a4
                  fsqrt.s      ft6, ft1, rup
                  fle.s        s11, fa4, fs5
                  fmv.x.w      a5, fs9
                  fsqrt.s      fa4, ft11
                  fcvt.s.w     ft7, a7, rdn
                  fmax.s       fa4, fs3, fs7
                  fcvt.wu.s    a4, fs3, rne
                  divu         t4, s11, a3
                  and          s7, a5, t3
                  fclass.s     t4, fs5
                  srli         a0, a3, 25
                  and          a2, t1, a0
                  fcvt.s.wu    ft2, t5
                  sra          a0, a5, s10
                  mulhsu       a4, a0, s4
                  rem          t2, t6, gp
                  srl          t2, s2, ra
                  sub          a4, s6, s9
                  fcvt.s.wu    fs0, t1, rup
                  mulh         t5, ra, s11
                  feq.s        s1, ft2, fa4
                  divu         s1, zero, a7
                  sltiu        s8, t1, 179
                  sra          s3, t0, a4
                  sub          a7, t5, s0
                  fsub.s       ft4, fa2, ft8
                  slli         t4, sp, 9
                  slli         a5, a6, 10
                  rem          s1, t3, t2
                  fmv.w.x      fa4, a1
                  fsub.s       fa4, ft3, fa1, rtz
                  rem          t0, s5, t1
                  mulh         t6, s4, s9
                  mul          t3, s11, s10
                  sltiu        a0, t3, 353
                  mulhsu       a2, s3, a4
                  fdiv.s       fs1, fa1, ft7
                  srai         s11, s9, 14
                  fsub.s       fa2, fs7, ft2
                  divu         t6, sp, t6
                  remu         a6, gp, a1
                  srai         s3, t5, 18
                  or           s0, t6, a7
                  divu         t5, gp, t2
                  sll          s8, s1, s1
                  lui          t2, 770618
                  slt          sp, s1, t3
                  mul          t4, s4, s9
                  fsub.s       ft6, fa2, ft0
                  fle.s        t3, fs7, ft7
                  mulh         a0, s4, a0
                  fcvt.w.s     s2, fs0
                  lui          s7, 976344
                  fdiv.s       fs7, ft2, ft10
                  fcvt.s.wu    fs10, sp
                  fcvt.wu.s    t3, fs8, rtz
                  fsub.s       fs8, fs3, ft11
                  slt          a2, t3, a6
                  slt          t3, s5, a4
                  fmv.x.w      s11, fs6
                  sub          s5, s11, a5
                  srl          t4, a4, ra
                  fmv.x.w      a3, fa4
                  mul          sp, t4, s5
                  flt.s        s3, fa2, fs6
                  remu         t3, s2, zero
                  lui          s2, 793415
                  srai         a5, s9, 22
                  feq.s        a7, fs8, fs9
                  fsqrt.s      ft8, fs8, rtz
                  flt.s        s5, fs7, fa6
                  mulhsu       a2, s3, a2
                  srli         a7, s1, 13
                  add          s1, a7, sp
                  sltu         s11, t4, s1
                  srl          t4, t0, s2
                  fmax.s       fs6, ft1, fs7
                  flt.s        a4, ft2, ft4
                  sll          s5, s7, a4
                  fmax.s       ft10, fa6, fs3
                  fadd.s       fa6, ft11, ft7, rmm
                  slti         t2, s4, 695
                  fcvt.w.s     s2, ft2
                  or           t3, zero, s0
                  fmin.s       ft7, ft6, fs9
                  mulhsu       a0, a7, s5
                  fsgnjn.s     fs11, fs2, fs1
                  fmv.w.x      ft11, zero
                  fcvt.s.wu    ft11, s10
                  fcvt.s.wu    ft1, s10
                  fsqrt.s      fs0, ft1
                  mulh         s8, s1, t0
                  flt.s        t5, ft2, ft8
                  fsub.s       fs6, ft1, fs2, rne
                  rem          a4, t3, t3
                  srai         t6, t3, 22
                  srli         a6, s4, 20
                  ori          t6, gp, 1943
                  slt          s8, s5, s11
                  fmv.x.w      s4, fs1
                  fmul.s       fs5, fa0, fs3, rtz
                  fadd.s       ft4, ft4, fs7, rdn
                  rem          t0, t3, a0
                  mulhu        gp, t2, t0
                  sub          t6, a6, s10
                  fsgnjx.s     fa2, ft8, ft4
                  xor          s5, t5, a6
                  slt          sp, a3, s4
                  addi         s4, t0, -1224
                  mulhu        t0, t2, zero
                  add          a6, t0, t6
                  sltu         a1, sp, s2
                  fcvt.s.w     fa0, s3, rmm
                  slti         s3, gp, -1154
                  fsqrt.s      ft7, fa2
                  slti         t6, s6, -476
                  nop
                  srli         s11, s7, 19
                  slt          t0, t1, t1
                  auipc        s2, 40387
                  srai         t5, sp, 18
                  fcvt.w.s     t4, fs8, rup
                  sltiu        gp, s11, -162
                  fmul.s       fa1, fs0, fs4
                  fmv.x.w      t6, fs3
                  addi         a4, a5, 767
                  slt          t1, s4, s6
                  srai         s6, t2, 0
                  srai         s5, t0, 0
                  fle.s        s11, fs2, ft10
                  srai         gp, s7, 21
                  sra          t5, zero, s6
                  auipc        a6, 194557
                  fmv.x.w      s6, ft11
                  fclass.s     gp, fs9
                  sltu         sp, s1, s5
                  auipc        s4, 935831
                  sub          s6, s5, s2
                  fmul.s       ft5, ft3, fs6
                  xori         s5, t3, -1827
                  andi         a7, gp, -414
                  fcvt.wu.s    s2, ft10, rup
                  mulhu        zero, a5, a1
                  mulh         a4, t2, sp
                  addi         s4, gp, -1537
                  add          s7, t4, s4
                  fcvt.s.w     fs4, s5
                  sltu         zero, s9, s0
                  slti         s3, t6, 94
                  flt.s        t4, ft11, ft7
                  fsqrt.s      ft1, fa7, rup
                  or           s11, a5, t2
                  fmul.s       fs10, fs8, ft5
                  mulh         s6, t4, s9
                  fdiv.s       ft4, fa4, fs0, rmm
                  srai         t6, t2, 31
                  fmul.s       fs5, fs5, fa7
                  sltiu        t3, s7, -664
                  nop
                  fmin.s       ft4, ft8, ft3
                  fdiv.s       ft1, ft7, ft7, rmm
                  fsgnj.s      fs10, ft11, ft1
                  nop
                  ori          s2, tp, 1851
                  mulhsu       a1, t4, t2
                  srli         a1, a2, 30
                  slt          t0, s8, s6
                  fdiv.s       fa4, ft3, ft3
                  fsqrt.s      fs6, ft3
                  or           t0, tp, a6
                  fmax.s       ft6, ft6, ft0
                  xor          s0, a3, s5
                  srai         t5, s10, 14
                  flt.s        s1, ft7, ft8
                  sltiu        a5, s1, -1819
                  sltiu        a3, s3, -137
                  fsgnjn.s     fa2, fs0, fs7
                  slti         s4, s6, -74
                  remu         a7, a3, s8
                  fsqrt.s      ft0, fs4, rdn
                  fsgnjn.s     fs10, fs0, ft3
                  fle.s        s5, ft2, ft11
                  fmin.s       fs0, fa1, fa1
                  srai         a7, s5, 7
                  div          s4, a1, t4
                  sra          s11, s6, s11
                  mulh         s1, s9, s0
                  fclass.s     a3, fs10
                  fmul.s       fa6, fs8, fs8
                  fsub.s       ft11, fs3, ft11
                  fsgnjx.s     fs2, fs8, ft11
                  mulhsu       t2, s7, s11
                  nop
                  sltiu        s2, a0, -1123
                  slti         s4, ra, 1187
                  fmv.x.w      a2, ft10
                  fmin.s       ft2, ft11, ft8
                  mulhsu       s10, s3, s9
                  sll          t1, t5, a2
                  fcvt.w.s     s10, fs5, rne
                  fsqrt.s      fa6, fs1
                  ori          t4, ra, 115
                  mul          s6, a5, a7
                  remu         sp, a3, a6
                  add          s6, s7, s8
                  fcvt.s.w     ft10, t0, rne
                  nop
                  fcvt.s.w     ft7, zero
                  mul          s0, s4, s2
                  sra          s5, sp, sp
                  lui          t0, 1015315
                  fdiv.s       fa2, fs3, fs1
                  fsgnj.s      fa3, fa4, fa3
                  mul          sp, s8, s0
                  andi         s1, s11, 1792
                  fmin.s       fs3, fa6, ft4
                  sll          a2, a4, t6
                  mul          a1, t2, a1
                  addi         a4, a5, 2043
                  ori          s2, s5, 106
                  fle.s        s2, fa0, ft9
                  slti         s6, a0, 1523
                  fcvt.wu.s    a6, ft0, rdn
                  sltu         s6, sp, tp
                  div          t0, sp, s6
                  auipc        t4, 686424
                  fsqrt.s      ft10, fa5, rtz
                  flt.s        s10, fa6, fs9
                  fcvt.s.w     ft9, s0, rmm
                  fsgnjn.s     ft4, fs0, fa0
                  rem          s8, t6, s4
                  nop
                  fsgnj.s      fs1, fa5, fs9
                  xor          a3, a6, a6
                  fsgnjx.s     ft1, fs10, fa5
                  fcvt.s.w     fs3, s6
                  fmv.w.x      fs8, t5
                  div          s10, a2, s7
                  fmin.s       fa2, ft9, fa3
                  mulh         t5, s3, s3
                  and          t6, s5, ra
                  fsgnj.s      fs9, ft7, ft0
                  fmv.w.x      fs6, s6
                  fsgnj.s      ft7, fs4, ft0
                  auipc        zero, 944281
                  or           s7, a0, sp
                  srli         s2, a7, 22
                  remu         s8, s4, s1
                  or           a6, s1, s8
                  fsub.s       fs10, ft4, ft10, rtz
                  sub          a2, gp, s3
                  fmv.x.w      t2, ft2
                  srai         sp, zero, 4
                  auipc        a6, 728749
                  fcvt.wu.s    sp, fs9, rmm
                  addi         zero, ra, -1584
                  ori          zero, a5, -1115
                  srai         a4, t2, 28
                  fsgnj.s      fs4, ft4, fs10
                  addi         gp, s0, -499
                  feq.s        a0, fa3, ft3
                  slti         t5, a1, -1168
                  srli         s3, a0, 16
                  flt.s        a4, ft0, fa5
                  addi         a6, s7, 883
                  fcvt.wu.s    t1, ft1
                  slli         s6, t6, 11
                  sltu         a6, zero, s1
                  addi         s7, s8, -860
                  fsgnjn.s     fs9, ft5, fa6
                  and          a4, a7, a3
                  mulhsu       t3, s6, s10
                  mulhsu       s0, tp, s8
                  slli         gp, a3, 3
                  slti         t5, s0, -1393
                  rem          s8, a6, s5
                  fmv.x.w      a5, ft9
                  div          a0, t0, s0
                  sltu         s10, s0, a6
                  divu         s4, a6, gp
                  xor          t4, s4, s4
                  andi         s0, zero, -109
                  feq.s        a4, fs11, ft0
                  div          s1, s5, s4
                  fsgnjx.s     fa5, ft7, fa3
                  sub          s0, a2, t2
                  lui          a6, 366231
                  mulh         a5, t5, t2
                  fmul.s       ft1, fs0, fs2, rmm
                  mulh         a5, s10, t4
                  addi         a6, a5, -777
                  add          a1, t5, zero
                  div          zero, zero, t3
                  feq.s        a3, fa3, ft1
                  sltiu        s5, a3, -197
                  lui          a7, 761074
                  auipc        s5, 470174
                  fsgnj.s      ft1, ft2, fs5
                  andi         t2, t1, -256
                  slti         s4, a4, -1131
                  slti         s4, t3, -103
                  addi         a7, s1, -1025
                  mulhu        s8, s11, t6
                  fcvt.s.wu    fa0, s2, rtz
                  fsgnjx.s     fa4, ft0, fa1
                  add          gp, t5, s10
                  slti         a0, a3, -1237
                  sub          t3, gp, s0
                  sub          a0, t0, s6
                  fsqrt.s      fs10, fs4, rup
                  fmax.s       fs3, ft9, ft6
                  remu         s4, sp, s8
                  sltu         t3, s1, a6
                  fmin.s       ft4, fs7, fs7
                  sltu         a5, a6, s4
                  fsqrt.s      fs0, fs0, rup
                  fclass.s     t0, fa2
                  sll          a1, s6, t2
                  fcvt.s.wu    ft7, sp, rmm
                  divu         a5, t3, t2
                  fclass.s     t1, fs8
                  fadd.s       fa4, ft5, ft0
                  andi         a5, sp, 1592
                  fmax.s       ft7, fa7, fs6
                  flt.s        gp, ft4, fs0
                  fsgnjx.s     ft2, fs10, fs8
                  or           a2, t0, s5
                  ori          t4, t1, 1246
                  fsgnj.s      fs7, fs1, ft8
                  or           t3, t0, a7
                  fcvt.wu.s    t5, fs11, rdn
                  fmv.w.x      ft5, a1
                  lui          a7, 727038
                  remu         a3, s9, zero
                  mulhsu       s2, a3, a5
                  srli         s2, s11, 28
                  slti         a1, a5, -217
                  sltu         a0, s9, a2
                  fsgnj.s      fs0, fs5, fs1
                  mulh         gp, a6, s8
                  mulhu        sp, ra, a4
                  fsgnjx.s     fa1, ft8, ft11
                  fmv.x.w      a6, ft9
                  fmv.x.w      zero, fa4
                  fmul.s       fa0, fs6, ft0, rmm
                  lui          s1, 75498
                  xori         s5, ra, 93
                  xori         s11, a4, -1753
                  rem          a5, s4, s5
                  fmv.x.w      a5, ft1
                  lui          s0, 514051
                  divu         t6, s4, gp
                  fclass.s     a3, ft6
                  addi         s10, t5, -1282
                  fclass.s     s6, fs6
                  fsgnjx.s     fa3, ft2, fs7
                  flt.s        a4, ft2, fs6
                  fsgnj.s      fa1, fs7, ft9
                  remu         a0, a6, s11
                  fsub.s       fs8, fs8, fa0, rtz
                  fsgnjn.s     fa4, fa0, ft2
                  fmv.x.w      t2, fs3
                  fdiv.s       fa6, fs4, ft11
                  fmul.s       fs2, fa7, fa4
                  sll          sp, tp, s5
                  fsgnjx.s     fs7, ft0, ft2
                  ori          a5, t5, 2001
                  slti         gp, s9, -409
                  addi         s11, t5, -1215
                  lui          a5, 962914
                  xori         a4, s11, 1817
                  fmul.s       ft11, ft6, ft10
                  fmv.w.x      ft0, tp
                  sltu         a1, t2, s10
                  andi         s7, s4, -1149
                  addi         s7, t2, -1101
                  mul          t6, a2, t1
                  mulhu        s4, s9, sp
                  sub          t1, a4, s8
                  sll          t4, s11, s4
                  feq.s        s11, fs2, ft7
                  fcvt.s.w     ft2, a3, rne
                  ori          sp, s0, 1577
                  remu         s8, s6, a1
                  fcvt.s.wu    fs6, a5, rdn
                  fsgnjx.s     fs7, fs1, ft1
                  srl          t5, ra, zero
                  fmv.x.w      t1, fa5
                  ori          t6, t2, -1663
                  and          t6, a4, t1
                  sltiu        t3, sp, 812
                  rem          a0, t0, a5
                  rem          zero, a5, a1
                  fmax.s       fa7, ft10, fs0
                  srli         s0, s10, 12
                  fsgnjn.s     ft3, fa3, fa7
                  slti         a5, t4, -834
                  sll          s11, s10, zero
                  fle.s        s8, ft2, fs8
                  div          s2, s5, s7
                  mulh         a7, a6, gp
                  sltu         a2, s1, a5
                  lui          gp, 403557
                  fclass.s     t0, fs8
                  fmv.x.w      s5, ft10
                  or           sp, s8, t0
                  xori         a2, t2, -1231
                  rem          zero, t1, tp
                  rem          a4, t2, s1
                  flt.s        s0, fs11, fa1
                  flt.s        a5, fs10, ft8
                  fcvt.s.wu    fa4, a1, rdn
                  fcvt.wu.s    t1, fs1, rdn
                  fmv.w.x      ft0, s4
                  mul          t6, zero, a2
                  sltu         a2, a5, s1
                  fmul.s       fa6, ft7, fa1
                  xor          s2, s11, a6
                  remu         a5, s1, s10
                  sub          t3, a2, sp
                  slli         s6, s8, 26
                  rem          a1, zero, s7
                  slt          gp, a5, s4
                  sll          a3, s5, a5
                  addi         s7, a6, 1398
                  rem          s2, s9, s0
                  fcvt.w.s     s10, ft1, rmm
                  fsgnjn.s     fa2, ft4, fs7
                  lui          a1, 748222
                  fsgnj.s      ft11, ft2, ft7
                  divu         t2, s10, t0
                  fcvt.wu.s    a1, ft10, rup
                  sub          gp, s1, s5
                  auipc        a2, 651468
                  sll          s2, a1, s8
                  andi         a7, s4, 982
                  rem          t5, s9, s6
                  slti         sp, t4, -1399
                  lui          a5, 888144
                  srl          a1, t3, s6
                  addi         s4, a0, -226
                  srai         gp, a3, 4
                  flt.s        zero, fs0, fa7
                  fle.s        t6, fs9, ft6
                  fclass.s     s5, ft8
                  slt          a3, t1, s1
                  auipc        a6, 934542
                  fsgnjn.s     ft0, ft9, ft3
                  fsgnjx.s     ft8, ft4, fa4
                  fmv.x.w      s5, fa4
                  xor          sp, s3, t6
                  srli         sp, a3, 23
                  ori          s0, a2, -564
                  ori          a2, s4, -1494
                  andi         a5, a7, 794
                  xori         a3, s7, 768
                  fmul.s       fs0, ft8, ft11
                  ori          s2, s7, 80
                  fcvt.w.s     a6, ft11, rmm
                  fcvt.s.wu    fa1, s2
                  sltu         s11, t4, a1
                  add          s8, s7, t5
                  fclass.s     s6, ft11
                  mulhsu       zero, t0, gp
                  ori          s0, t5, -1835
                  addi         t3, s2, 1096
                  slti         a6, sp, 762
                  xor          t0, t2, gp
                  fcvt.s.w     fa4, t0
                  feq.s        zero, fa1, fs7
                  srli         a7, t1, 8
                  fcvt.wu.s    s7, ft9, rtz
                  mulh         s10, a3, gp
                  mulhsu       s10, t6, s3
                  fmul.s       fs10, fs5, ft5
                  fmul.s       fa2, ft2, fa3, rtz
                  fdiv.s       ft6, ft8, fa1, rne
                  fmin.s       ft3, fa4, fs0
                  fsgnjx.s     fa5, fs8, fa3
                  sub          s3, a3, t0
                  fsgnj.s      fs9, ft9, fs7
                  fsqrt.s      fs5, fa1
                  and          t0, zero, t3
                  fdiv.s       ft11, ft5, fs9, rup
                  lui          a5, 700077
                  srai         s0, t4, 15
                  fadd.s       fa6, fa0, fa1
                  nop
                  andi         a6, t4, -1687
                  fadd.s       ft1, fa0, fs11
                  divu         a4, s0, s11
                  div          s0, a7, t6
                  or           t4, a1, s6
                  mulh         a7, s7, t2
                  andi         s0, s8, 752
                  xori         s0, gp, -117
                  lui          s1, 62632
                  div          t4, a6, s4
                  nop
                  sll          sp, s0, s6
                  fsgnjx.s     fs10, ft10, fs10
                  fadd.s       ft5, fs0, ft10, rne
                  addi         s7, t1, -120
                  or           s1, s6, a7
                  mul          t2, a6, zero
                  fle.s        s6, ft0, fs4
                  addi         a1, a6, -1659
                  fmax.s       fa6, fs4, ft10
                  fcvt.s.wu    fs7, a6
                  auipc        zero, 127145
                  sltiu        sp, sp, -508
                  fmv.w.x      ft1, s4
                  fsgnjx.s     fs7, ft1, fa0
                  mul          s10, s5, s11
                  sub          s2, s0, t2
                  mulh         zero, s4, s7
                  fsgnj.s      ft1, fa1, fs11
                  fadd.s       ft5, fa7, ft8, rup
                  mulh         t4, t5, s7
                  fsqrt.s      ft9, ft0, rdn
                  fcvt.wu.s    s2, fs4
                  slt          a0, s8, s5
                  fcvt.s.wu    fa2, s6
                  srai         gp, t4, 5
                  fclass.s     s11, fs3
                  xor          sp, s4, t0
                  div          s5, s10, a4
                  ori          a4, s2, -751
                  ori          t1, a3, 295
                  sltu         sp, s5, a0
                  fmv.x.w      t2, ft8
                  divu         a0, s7, s4
                  mulh         t0, s2, a7
                  feq.s        zero, fa2, fa0
                  sltu         s5, s6, a1
                  nop
                  rem          s8, sp, s3
                  fmv.w.x      fa3, t1
                  fle.s        s5, fa2, fs5
                  fmin.s       fs6, fs6, ft10
                  fsgnjx.s     fa1, fs7, ft0
                  fmv.x.w      s7, ft1
                  nop
                  fsqrt.s      fs0, fa2
                  srai         t6, t1, 31
                  sub          t5, t6, gp
                  ori          s6, t0, -769
                  fsgnj.s      fa5, fa7, fs11
                  lui          s1, 144702
                  ori          t0, t5, -812
                  fdiv.s       ft11, fs0, ft5
                  fsgnjx.s     fa7, fs2, fa2
                  auipc        s10, 729203
                  slli         t2, gp, 27
                  fmv.x.w      a7, ft4
                  srli         t0, t1, 23
                  and          zero, a0, s7
                  feq.s        a5, fa2, fs3
                  and          a4, t4, s9
                  fcvt.w.s     s8, ft3, rne
                  fsgnjn.s     fa2, fa1, fs0
                  fmv.x.w      s1, ft10
                  slti         s5, s5, 349
                  fmax.s       fs9, ft1, ft1
                  fmax.s       ft0, fs0, ft6
                  sltu         s6, s10, s11
                  divu         a6, sp, t1
                  divu         a6, a4, a6
                  sltu         s11, a7, s8
                  xori         zero, t6, 610
                  fsgnjn.s     ft5, fs7, ft0
                  xor          t2, s6, ra
                  nop
                  sra          s11, a4, s6
                  fmv.w.x      fa7, t3
                  fdiv.s       ft3, ft11, fs2
                  mulhu        s4, s11, a6
                  remu         s8, s7, a4
                  xor          a4, gp, t4
                  addi         t1, a6, -1449
                  srli         a5, s1, 31
                  fcvt.s.w     fs2, a3, rne
                  mul          zero, a3, s6
                  fmv.w.x      ft5, t1
                  remu         a2, s6, a0
                  sll          s2, s0, s9
                  sra          s1, s5, t2
                  slti         a7, a3, 1427
                  lui          s0, 626297
                  mulhu        a4, gp, t4
                  fsgnjx.s     fs8, ft0, ft11
                  ori          t3, s1, -1488
                  xor          t4, a0, s0
                  addi         s2, a1, 378
                  mulhu        s2, gp, t5
                  feq.s        a2, ft6, fa4
                  sltiu        a4, t4, 1528
                  lui          s7, 182537
                  auipc        a5, 224302
                  rem          t4, t4, t4
                  addi         t5, s5, 1505
                  add          s1, t1, s6
                  fsgnjn.s     fs10, fa4, fs2
                  xori         a5, gp, 1355
                  fcvt.s.wu    fs9, s11
                  sltu         s10, gp, t0
                  fsqrt.s      ft9, fs7, rtz
                  mulh         t2, t2, a3
                  srai         a0, s3, 13
                  fsqrt.s      ft3, ft10
                  sltu         s11, sp, tp
                  fsqrt.s      fs10, fs6, rne
                  xor          s2, ra, tp
                  mul          a3, t0, s7
                  and          t0, a1, t6
                  fclass.s     a3, fs8
                  sltu         sp, s0, t2
                  fmv.w.x      ft1, a3
                  fmul.s       ft6, fs3, fs6, rtz
                  and          s8, t1, t6
                  mulhsu       sp, s0, a4
                  rem          a4, s5, a1
                  fsgnjx.s     ft11, ft9, fs0
                  fsub.s       fs5, fs0, fa1
                  slti         a1, s2, 449
                  fcvt.s.w     fa0, s8
                  nop
                  slt          t4, s3, t6
                  addi         s10, ra, 685
                  sra          t2, t1, a3
                  fsgnj.s      ft9, ft7, fs4
                  xor          a6, t5, zero
                  fsgnjx.s     fs3, fs10, ft1
                  xori         t6, s4, -1867
                  sra          s0, s0, s5
                  mulh         s6, zero, s11
                  lui          t2, 635432
                  fclass.s     t5, fa3
                  add          t1, t6, s11
                  mulh         s11, tp, s10
                  xori         a1, t6, -1980
                  fmul.s       fa5, ft4, fs3
                  sll          s4, s7, ra
                  fsgnj.s      fa5, fa6, fs11
                  lui          t0, 956498
                  lui          s10, 466741
                  fmax.s       ft3, fa7, fa3
                  xor          t1, t3, tp
                  addi         s1, t6, 420
                  slt          s4, t0, t2
                  feq.s        t4, fa0, fa0
                  mulhsu       s10, s5, s7
                  and          t1, ra, sp
                  divu         a4, a7, s1
                  fcvt.w.s     t5, ft10, rne
                  feq.s        t1, ft4, fs8
                  mulhu        s3, t4, t0
                  rem          s0, gp, gp
                  fmv.x.w      s1, fs1
                  mulhsu       s2, s7, zero
                  add          a2, a7, t6
                  mul          a5, t1, a3
                  xor          a4, a7, tp
                  fdiv.s       fa6, ft1, ft4
                  srai         s10, a1, 20
                  andi         sp, s5, -1466
                  sub          s2, a5, a6
                  feq.s        s11, fa5, fa4
                  mulh         s6, t6, a4
                  slt          t3, ra, t5
                  fdiv.s       fs9, ft0, fs2
                  divu         t6, a2, s4
                  addi         a1, s1, 2014
                  slti         a1, s1, -1530
                  rem          a2, s1, t4
                  sltiu        a7, t1, 1808
                  mulhu        t3, gp, s3
                  fcvt.s.w     fa6, a0
                  fsub.s       fs8, ft7, fs6, rtz
                  andi         a1, a0, 44
                  fclass.s     s7, fs8
                  lui          a7, 169926
                  fcvt.s.w     ft6, s3, rdn
                  fcvt.s.w     ft10, t1, rdn
                  fclass.s     s3, ft4
                  fsqrt.s      fs4, ft6
                  rem          s0, a7, t5
                  srli         a5, t0, 9
                  sll          t6, gp, s6
                  fmul.s       ft10, fs11, ft9, rmm
                  lui          t1, 837729
                  sltu         s2, tp, t5
                  sltu         s11, s7, a4
                  srai         s1, s1, 5
                  mulh         a7, a6, s0
                  mulh         t5, s1, t3
                  fmin.s       ft10, fs4, fs8
                  fcvt.s.wu    ft5, t4
                  slli         t4, zero, 28
                  fsqrt.s      fs0, ft9
                  srl          a7, a2, s10
                  mulhsu       s6, s11, gp
                  mulh         a2, s2, a6
                  sltu         s1, t6, s5
                  mulhsu       t0, s5, s7
                  auipc        s3, 404564
                  fcvt.wu.s    s5, fa1, rup
                  nop
                  addi         a7, s3, -1956
                  feq.s        s7, fa6, ft2
                  fmv.w.x      fa0, a6
                  slti         a2, s7, -2027
                  or           s6, a7, a7
                  and          a5, s3, t5
                  srl          a0, s5, a1
                  fcvt.s.wu    ft2, t4
                  ori          a0, a5, -1260
                  fmv.w.x      fs11, tp
                  fsqrt.s      fs11, ft10
                  fcvt.s.wu    fa2, s4
                  mulhsu       gp, t5, t6
                  fadd.s       ft10, ft9, ft7, rmm
                  div          s0, t2, s2
                  div          s7, a0, a0
                  sltu         t4, t6, a7
                  sll          a1, a6, tp
                  sra          s11, gp, a3
                  remu         s0, gp, s11
                  mulhu        s1, t0, a1
                  divu         a5, tp, sp
                  ori          t5, s2, 475
                  fsub.s       fs8, fa4, ft7
                  fsgnjn.s     ft0, fs4, fa1
                  fmin.s       ft5, ft6, fs2
                  or           t4, t4, a3
                  auipc        gp, 449158
                  fcvt.w.s     t5, ft0, rmm
                  fmax.s       fs3, ft7, fs3
                  lui          a2, 877111
                  and          s1, s2, s4
                  auipc        a1, 367367
                  fdiv.s       ft11, ft6, ft3, rne
                  sll          a3, s8, gp
                  fadd.s       ft5, ft10, ft6
                  srl          s11, t2, sp
                  feq.s        a7, fs0, fs4
                  fle.s        a2, fs4, ft7
                  fdiv.s       fa3, fa6, fs6, rne
                  div          s8, s7, ra
                  fle.s        s0, fs3, ft10
                  srl          a6, a2, s7
                  xori         t5, s10, -1490
                  flt.s        t6, ft3, fs3
                  fdiv.s       fa3, ft4, ft4, rup
                  fmin.s       ft4, fs10, fs10
                  or           a0, a3, a5
                  sltiu        a6, s11, -1014
                  slti         t3, a2, -1286
                  addi         s1, a7, -114
                  fmv.w.x      fs5, a1
                  slt          t6, a4, t5
                  auipc        s4, 657428
                  fsgnj.s      fa5, ft2, fs0
                  fsgnj.s      ft1, fs4, fs10
                  sll          t5, s4, t0
                  or           s6, sp, s2
                  fsgnj.s      fs3, fs1, fs4
                  mulhsu       t0, s3, a5
                  fcvt.s.wu    fs2, t4, rne
                  fsub.s       fs7, ft1, fs11
                  addi         s1, s9, 204
                  sub          s11, a6, s0
                  mul          a2, s9, s0
                  ori          s5, t0, -333
                  fsgnjx.s     fa4, fs7, fs0
                  fadd.s       fs7, fa4, ft11
                  fsgnjx.s     fa7, fs6, ft8
                  andi         a0, a7, 1275
                  mulh         a5, t5, s9
                  fmul.s       fs0, fa7, fa7
                  fsgnjn.s     fs3, fs4, fs6
                  fmin.s       fs6, fa1, ft4
                  fadd.s       ft1, fa5, fa2, rtz
                  srli         a7, t3, 6
                  fadd.s       fa7, fs2, ft8, rne
                  fsqrt.s      fs1, fs0, rmm
                  fclass.s     s8, fa7
                  fsgnjx.s     ft6, fs4, fs1
                  ori          t6, s2, -67
                  auipc        t3, 570387
                  add          a3, a1, s7
                  ori          s8, a6, -970
                  fsgnj.s      ft5, fs5, ft0
                  sll          s4, a6, t2
                  sra          a5, a7, s6
                  srli         s0, a7, 20
                  rem          a0, t2, a0
                  mulh         a5, a2, t0
                  srli         sp, s9, 8
                  ori          a0, s0, 942
                  mulhu        s3, a6, tp
                  fcvt.wu.s    a2, ft8
                  rem          sp, a0, sp
                  slt          a1, s11, s11
                  mulh         s11, s11, a3
                  mulh         sp, s8, s11
                  remu         t5, a0, s8
                  fcvt.s.wu    fa2, sp
                  fsub.s       fs1, fs1, fs1, rup
                  nop
                  flt.s        s11, fs11, fa4
                  sll          a2, s8, s1
                  fsgnjn.s     fs3, ft11, fa5
                  remu         s11, a2, t1
                  ori          t5, a0, 417
                  rem          s11, a7, a2
                  rem          t3, a2, s11
                  feq.s        s4, ft0, ft8
                  fsqrt.s      fs2, ft3
                  or           sp, a0, s0
                  fcvt.wu.s    t3, fa2
                  xor          s7, s9, t2
                  fsub.s       ft7, fa6, ft11
                  sltu         t0, s8, s6
                  auipc        s2, 905115
                  fcvt.s.w     ft4, s7
                  mulh         a7, t3, s8
                  fle.s        a7, fa1, ft10
                  mulhu        a6, s10, s11
                  fcvt.s.w     fa4, s8, rtz
                  sra          s4, s10, zero
                  slli         a1, a1, 21
                  fcvt.s.wu    ft9, a5, rdn
                  fsub.s       fs6, fa7, ft10, rmm
                  fclass.s     s10, ft9
                  mul          t3, s9, a4
                  fsqrt.s      ft0, fa5
                  fmul.s       ft7, ft3, fa4
                  slt          sp, s2, t2
                  and          t5, s0, sp
                  rem          t5, ra, zero
                  mulhsu       t2, t3, t5
                  fsgnjn.s     fa5, fa1, ft0
                  fmax.s       ft9, fs2, fa3
                  andi         t2, s11, 721
                  fsub.s       ft4, ft7, fa1, rmm
                  sra          s4, t3, t4
                  rem          s5, t4, a6
                  div          t1, s8, a7
                  fsub.s       fs1, fa7, ft7
                  sra          sp, s1, t5
                  fcvt.w.s     s10, ft10
                  fsgnj.s      fs10, fs11, ft8
                  remu         t4, t6, s10
                  fmv.x.w      a4, fa1
                  add          s5, s8, ra
                  fmul.s       fa1, fa2, fs9
                  slti         s6, s3, 437
                  fsgnjn.s     fs10, fa4, ft3
                  sra          s1, a3, a0
                  fle.s        s11, ft10, ft6
                  fclass.s     s0, fa3
                  fcvt.s.w     ft5, t0
                  lui          a2, 237452
                  slti         s3, a4, -405
                  remu         a4, t1, gp
                  nop
                  fadd.s       ft3, fa1, ft8, rne
                  divu         s2, a4, t4
                  addi         a3, a3, -246
                  remu         s6, gp, t1
                  fmv.w.x      ft2, s11
                  slti         t0, s11, -1455
                  fcvt.s.w     fa1, s8, rup
                  rem          sp, t6, s0
                  addi         t1, gp, -79
                  fcvt.wu.s    a0, fa0
                  fmv.w.x      ft2, a1
                  mulhu        t0, gp, t5
                  mulh         s3, t1, a4
                  fsqrt.s      fa7, fa6
                  feq.s        s8, fs4, ft2
                  fclass.s     s5, fs0
                  sub          s2, s5, ra
                  srai         t1, s4, 16
                  sub          s5, t4, ra
                  fsqrt.s      fs2, fs10
                  fmv.x.w      a5, fa6
                  fcvt.w.s     s6, ft0, rmm
                  mulh         t3, t5, tp
                  srai         t5, s6, 0
                  fcvt.w.s     zero, fs6
                  xor          a0, s9, a3
                  fsgnjn.s     fs4, fs7, fs4
                  ori          s0, t1, 1185
                  flt.s        s10, ft2, fa6
                  srai         s0, s9, 11
                  div          s3, s4, zero
                  sll          s4, s1, a4
                  fmin.s       fa1, fs7, fs4
                  srli         s5, s5, 14
                  fadd.s       fs9, fs11, fs1, rtz
                  fmin.s       fs9, fs6, ft8
                  fcvt.s.wu    fa6, t5, rtz
                  addi         s1, a2, 336
                  fclass.s     a4, ft3
                  fcvt.w.s     t1, fs4
                  slli         t3, a6, 15
                  fsqrt.s      fs10, fa5, rdn
                  fadd.s       fs8, ft8, fs8
                  lui          s6, 1045961
                  andi         s2, s6, 1450
                  fmv.w.x      fs7, s6
                  sltu         s5, s1, tp
                  fcvt.wu.s    sp, fs3
                  fle.s        sp, ft3, fs3
                  slli         a3, tp, 20
                  slt          t1, a0, t6
                  fcvt.s.wu    fs1, t5
                  fmv.x.w      t5, ft5
                  sub          s4, t4, a7
                  sub          t5, a5, tp
                  fmin.s       ft4, fa4, fs1
                  and          t6, t0, s10
                  feq.s        t5, ft0, fs5
                  lui          s7, 930082
                  fmv.x.w      s10, fa4
                  andi         sp, s7, 1071
                  srli         s0, s11, 16
                  slti         t0, a0, -1333
                  fle.s        t1, ft6, ft2
                  xori         s11, zero, -1467
                  feq.s        s11, fa3, fs8
                  xori         a2, s1, -1435
                  sltiu        t0, gp, -456
                  slli         s5, t5, 12
                  fsub.s       fa2, fs8, ft7
                  addi         a0, t1, -840
                  fsgnjx.s     fa1, fs9, ft10
                  fmv.w.x      ft3, t1
                  srl          sp, s2, s8
                  flt.s        zero, fa4, fa2
                  addi         s2, s4, 1469
                  sra          zero, s7, a2
                  fsqrt.s      fs10, ft2
                  fcvt.s.w     fa0, s11, rne
                  fmul.s       fs4, fs7, ft8
                  fmv.x.w      t4, fa5
                  mul          s11, t1, s10
                  fadd.s       fa7, ft0, ft4, rup
                  slli         s3, gp, 27
                  srai         t1, t0, 7
                  sra          a4, tp, s11
                  fmul.s       ft7, ft7, fa3
                  remu         t3, t1, s5
                  fclass.s     a1, fs8
                  fadd.s       fs4, fs6, ft9, rtz
                  fcvt.s.w     ft5, s6
                  sub          s3, s3, ra
                  slti         sp, a6, -1698
                  srai         a6, a7, 15
                  fadd.s       fs5, fs3, fs8, rup
                  sra          gp, s5, t1
                  fsgnjx.s     fa0, fa1, fs7
                  srli         s6, a2, 22
                  remu         s5, t4, a4
                  sltiu        a6, a1, -2018
                  sltiu        t2, a2, 992
                  fle.s        s3, fa4, fa0
                  fmin.s       fs9, fa7, fs11
                  fsqrt.s      fa4, fa4
                  fclass.s     t1, ft3
                  add          s11, a3, s11
                  fle.s        t2, fa0, ft3
                  srl          t5, zero, s1
                  andi         a5, a5, 616
                  remu         a2, t5, a4
                  mulh         s2, a1, s5
                  lui          a2, 428306
                  slti         t1, t6, 641
                  mul          s3, a4, zero
                  fsgnj.s      fs11, fs1, fa6
                  sra          s4, s11, gp
                  mulh         zero, a6, a7
                  nop
                  fsgnjn.s     fs8, ft3, ft10
                  nop
                  fcvt.s.wu    fs11, s7
                  and          t0, a6, t5
                  fsub.s       fa2, ft3, ft11
                  and          t0, a1, gp
                  fmv.x.w      t3, fs11
                  slt          a5, s1, t1
                  fmax.s       ft1, ft5, fa2
                  mul          a3, s10, s5
                  fcvt.wu.s    t5, ft6, rtz
                  div          t6, gp, s3
                  mulhu        a6, a0, t6
                  fmax.s       ft1, ft9, fs0
                  divu         s2, zero, tp
                  ori          t1, t5, -809
                  fmax.s       ft7, fs2, fa2
                  fmin.s       ft6, ft6, fa0
                  slti         t0, tp, -1724
                  add          s2, gp, zero
                  slti         s8, t5, -590
                  fcvt.s.w     ft1, t6, rne
                  remu         t2, ra, a0
                  fdiv.s       fa3, fs3, fa4, rmm
                  fmv.x.w      t1, ft7
                  srai         sp, s4, 30
                  fmin.s       ft10, fs7, ft7
                  remu         s4, t1, a6
                  sra          s7, a2, a4
                  sltu         s3, t5, s10
                  div          a5, tp, a0
                  fcvt.s.wu    ft3, a0
                  auipc        gp, 794152
                  fmax.s       fs9, fa2, fs6
                  and          t3, s11, t1
                  mulhu        s0, tp, s9
                  mulhu        a5, zero, t1
                  fsgnjx.s     ft4, ft4, fs10
                  srl          t5, zero, s5
                  ori          s8, ra, -217
                  srl          a5, t6, s1
                  sltu         sp, tp, a7
                  mulhsu       t6, t5, t5
                  lui          s4, 898423
                  addi         t3, s9, 792
                  fclass.s     s7, ft6
                  slti         a2, s0, 1946
                  fadd.s       fa1, fs3, ft11
                  ori          s3, s9, 1435
                  auipc        t2, 353016
                  ori          t4, t5, -1038
                  ori          t4, t1, -1993
                  fsqrt.s      ft11, fa7, rdn
                  lui          s5, 961445
                  sra          a5, s6, a5
                  fcvt.wu.s    s0, ft3, rtz
                  fmv.w.x      fs2, a1
                  mulhu        t2, s5, s10
                  fsgnjn.s     fs11, fs4, fs3
                  fclass.s     s2, ft11
                  nop
                  and          sp, sp, s1
                  mulh         a3, s6, s9
                  nop
                  xori         s3, tp, 625
                  add          s7, s0, a1
                  fmin.s       fs8, fs1, fs2
                  fle.s        t0, fs1, fs6
                  and          s0, t3, s10
                  fmin.s       fs7, fa4, fs4
                  mulhsu       a7, t6, a3
                  fsgnjn.s     fs1, fs9, ft2
                  fdiv.s       fa4, fa4, ft6, rup
                  andi         a3, s6, 171
                  fadd.s       fs7, fs3, ft0
                  sra          t6, t0, t6
                  xori         a2, s11, 1649
                  flt.s        s0, ft4, ft2
                  remu         a7, a7, s10
                  fsgnjn.s     fa0, fa4, fs3
                  fadd.s       fa1, ft4, fa5
                  mulh         t4, t2, a7
                  lui          s6, 453042
                  fmv.x.w      s11, fa5
                  div          s6, t0, s1
                  rem          s2, zero, s5
                  xori         a2, t2, -1940
                  mulhsu       a3, tp, sp
                  mul          s10, ra, s5
                  sra          s2, ra, s11
                  fcvt.s.wu    fs5, s4
                  fadd.s       fs9, ft1, fs0, rdn
                  fadd.s       ft0, fs1, fa1, rdn
                  or           s2, tp, s2
                  auipc        a3, 635247
                  fsgnjx.s     ft10, fa1, fs6
                  add          gp, t0, s10
                  nop
                  fcvt.w.s     t5, ft11
                  fsgnjn.s     fs4, fa4, ft11
                  flt.s        s2, ft9, fa6
                  fcvt.w.s     a0, ft4
                  addi         s4, a1, -1085
                  fsgnjn.s     fs11, ft1, ft1
                  lui          gp, 111279
                  fcvt.wu.s    s4, fs11
                  fadd.s       fa1, ft10, fs1, rmm
                  mul          gp, zero, a4
                  fle.s        s11, fs4, fs6
                  fdiv.s       fs6, fa4, fs10, rmm
                  fsgnjn.s     fs5, ft2, fs9
                  fcvt.s.w     ft2, t5
                  fmv.x.w      s11, ft10
                  fsgnj.s      fs5, ft10, fs10
                  remu         s11, ra, a3
                  fsqrt.s      ft3, ft4
                  divu         s5, t3, s1
                  xor          a0, a6, s5
                  mulhu        a4, t5, a4
                  fcvt.wu.s    a1, ft7, rmm
                  flt.s        t4, ft3, fa1
                  slli         a3, a1, 0
                  flt.s        a3, fs8, ft7
                  srai         a2, s7, 22
                  or           s3, s1, s7
                  xori         s11, a0, -506
                  xor          t3, a1, a7
                  srai         a4, t3, 10
                  fadd.s       fs0, ft5, fa5
                  and          a2, t5, a6
                  srli         s4, zero, 2
                  slli         a7, sp, 21
                  xori         s3, t4, -1641
                  fadd.s       ft1, ft8, fa6, rne
                  and          s5, s11, s1
                  fsgnjx.s     fs11, fa5, ft1
                  feq.s        s10, ft8, fs1
                  srl          a0, s1, a0
                  slti         s0, t5, -639
                  rem          t1, s6, s8
                  fmin.s       fa4, fa0, ft5
                  lui          t0, 362588
                  fsgnj.s      fs5, ft6, fa0
                  xor          a3, t3, s3
                  nop
                  nop
                  fsub.s       ft1, fs2, ft4
                  xor          a3, s6, t1
                  fcvt.wu.s    s2, fs3, rdn
                  srli         t0, a4, 7
                  div          s5, gp, s11
                  addi         a7, a7, 366
                  fsgnjx.s     fa6, ft2, fs0
                  fadd.s       fa0, ft1, ft6
                  fmin.s       ft9, ft6, fs4
                  rem          a2, s2, a5
                  auipc        a5, 686662
                  mulhsu       a1, a3, s2
                  ori          a3, a3, -1331
                  srli         a7, zero, 20
                  fclass.s     sp, ft7
                  mulhsu       gp, a2, t4
                  mulhsu       s6, a6, ra
                  slt          t5, gp, a3
                  srai         t6, t1, 27
                  fadd.s       fa0, fa1, ft6, rup
                  sltu         s5, s6, s11
                  fmin.s       ft2, fs4, fa0
                  sltu         t0, s3, t6
                  fcvt.s.w     fa1, s0
                  fsgnj.s      ft11, ft2, ft11
                  fsqrt.s      fs4, fs3
                  xori         s6, s10, 1613
                  fadd.s       fs4, fs8, ft4, rmm
                  slt          t1, s1, s5
                  fclass.s     s3, fs6
                  fmv.x.w      a2, fs4
                  slt          s8, s6, s11
                  sltiu        a3, a0, -546
                  fmv.x.w      s4, ft2
                  slli         t4, zero, 1
                  flt.s        t0, fs9, ft7
                  fmin.s       fa7, ft11, fs11
                  add          t2, t4, s4
                  fle.s        s2, ft4, ft6
                  slti         s6, a7, 527
                  xor          a4, t1, s1
                  fsgnjx.s     fs5, ft1, ft4
                  fmv.w.x      fs1, sp
                  divu         a1, s3, s8
                  slti         a6, s11, -743
                  remu         s3, a6, tp
                  nop
                  mulhu        a0, gp, tp
                  fclass.s     s5, ft10
                  fmin.s       ft1, ft3, fa7
                  fmv.w.x      ft0, s11
                  fcvt.wu.s    a3, fs5
                  mulhsu       t5, s6, s9
                  fcvt.wu.s    zero, fa2
                  flt.s        a0, fs4, fs7
                  auipc        a6, 989031
                  srli         s4, t2, 4
                  and          zero, s6, a7
                  srl          a4, t4, a3
                  slti         t4, a6, 1278
                  addi         s4, s0, 590
                  srl          s0, sp, s0
                  div          s5, s6, tp
                  andi         s11, t5, -97
                  add          s1, a4, s6
                  fadd.s       ft4, ft1, fs2, rne
                  xor          a1, s5, sp
                  slli         a7, gp, 0
                  fmul.s       ft3, ft9, fa4
                  sub          s0, a6, s9
                  srl          s8, a3, s4
                  fcvt.s.wu    fa4, s1, rmm
                  addi         s0, a3, 2012
                  sltu         t0, ra, s9
                  slti         s2, a0, -282
                  sub          t6, tp, s8
                  fsgnj.s      fa2, fs7, ft10
                  feq.s        a5, fs11, ft8
                  ori          s6, s10, 123
                  nop
                  lui          s11, 224167
                  slti         t3, a2, 1729
                  fsgnj.s      ft10, fs6, ft5
                  fcvt.wu.s    sp, fs9
                  sltiu        t3, s5, -2016
                  fdiv.s       fs9, fs6, ft1, rup
                  fmin.s       ft6, ft0, fa1
                  fmin.s       ft11, ft11, fa6
                  mulhu        a2, s9, tp
                  mul          s0, s10, a6
                  sll          s4, tp, a1
                  fclass.s     a1, fa6
                  fmv.x.w      s5, ft0
                  fcvt.wu.s    a7, fa6
                  add          a4, t5, s3
                  sll          a2, s0, s10
                  mulhu        a4, s3, s3
                  fcvt.s.w     ft7, s8
                  fsub.s       fa1, ft5, fs0, rne
                  slti         a5, a5, 1959
                  addi         t0, s10, -511
                  fcvt.w.s     t6, ft0
                  feq.s        s7, fs2, ft10
                  srl          t1, tp, s0
                  srai         a3, s7, 29
                  nop
                  fmin.s       fa1, fa7, ft0
                  ori          s5, s0, 1546
                  srli         s8, gp, 18
                  fdiv.s       fs6, fs8, ft7, rtz
                  remu         t0, s10, gp
                  fsgnjn.s     ft8, fs2, fs4
                  slli         s11, t4, 14
                  slli         a7, a1, 28
                  fsgnjn.s     fa4, fa1, fs5
                  srai         s2, s8, 22
                  mulh         gp, a1, a3
                  fmax.s       ft0, fa7, ft1
                  feq.s        t1, ft1, ft9
                  fmin.s       fs3, fs4, ft3
                  divu         a5, gp, ra
                  srai         gp, s3, 28
                  fle.s        t4, fa3, ft2
                  or           s1, a7, a3
                  xor          t6, t4, a1
                  and          s6, s9, s6
                  mul          s3, t6, t2
                  fcvt.s.w     fa7, s0
                  fmin.s       ft1, fs1, fs6
                  fcvt.s.wu    fs1, a4, rmm
                  fsgnjn.s     fa1, fa0, fa1
                  fadd.s       fa1, ft9, fa2
                  rem          s11, s1, s11
                  div          s7, s5, sp
                  flt.s        a3, fs10, ft10
                  rem          s10, s11, gp
                  ori          t4, s11, 1232
                  mulhsu       t5, a6, t2
                  mul          a2, t3, s1
                  sltiu        s11, a4, -1134
                  add          t5, a4, t6
                  mulhsu       t2, a7, s0
                  nop
                  sltu         s1, s2, s0
                  fcvt.w.s     t4, ft2
                  flt.s        s5, fa6, ft1
                  remu         a7, a5, s7
                  fsub.s       fs0, fa2, fa3, rtz
                  flt.s        gp, ft3, fs7
                  rem          a3, a1, s3
                  xor          s8, s9, ra
                  xori         a2, a4, 47
                  fle.s        t3, fs11, ft8
                  addi         a2, s7, -1138
                  ori          t1, s8, 1051
                  sll          a1, tp, a2
                  andi         t3, s6, -1921
                  fmv.x.w      a7, ft8
                  fsqrt.s      fa0, ft2, rtz
                  fmv.w.x      fa0, s5
                  mulh         s6, sp, a6
                  nop
                  sltiu        s0, t5, 1171
                  fsqrt.s      fs10, fs1, rup
                  fsub.s       ft8, fs3, fs5
                  addi         s3, a5, 172
                  lui          t3, 655405
                  slti         a5, s9, -161
                  divu         t6, a7, s7
                  or           s10, s5, t6
                  fsgnj.s      fs0, ft1, ft7
                  fadd.s       ft3, fa3, ft5
                  fmv.x.w      t3, ft1
                  sll          t2, s2, s2
                  ori          gp, a7, 357
                  sra          s3, a1, s2
                  addi         a2, s3, 484
                  auipc        zero, 98384
                  fadd.s       fs6, fa4, fs10, rtz
                  xori         s11, a3, -1871
                  fsgnjx.s     fa7, ft4, fa0
                  fmin.s       fs7, fs5, fs2
                  auipc        a2, 978192
                  fmv.x.w      a4, fs10
                  fsqrt.s      fa2, fs0
                  mulh         a2, s0, s0
                  sltiu        zero, a5, -1455
                  fmax.s       fs10, fs1, ft6
                  fsgnjn.s     fa5, fs2, fs11
                  srli         s4, s1, 25
                  fcvt.s.wu    fa7, t0, rdn
                  fmv.w.x      ft5, sp
                  fcvt.s.wu    fs8, t3, rdn
                  fadd.s       ft8, ft2, fs2, rne
                  slli         s11, sp, 26
                  slli         a0, tp, 0
                  or           t0, t3, s4
                  divu         t5, s5, a5
                  lui          s2, 390241
                  fle.s        a5, fa0, fa3
                  ori          s4, s0, 1520
                  flt.s        s6, ft3, ft10
                  addi         s0, s6, -1366
                  srl          a5, t2, s6
                  sltu         t2, gp, a7
                  slt          t1, a7, s6
                  mulhsu       a3, t0, s4
                  fmv.x.w      t2, fs8
                  fcvt.s.wu    fs8, t0, rtz
                  srai         s11, a2, 20
                  srli         s4, zero, 11
                  fmul.s       fs4, fs0, ft1, rdn
                  fmin.s       fa7, fa4, ft8
                  fmul.s       fa5, fs4, ft8
                  sub          zero, a4, s0
                  fcvt.w.s     s2, fs5
                  fsqrt.s      fa3, fs6, rmm
                  fsgnjn.s     fs2, ft3, ft11
                  and          a7, t6, s3
                  mulhsu       t5, t4, gp
                  div          s2, a3, zero
                  lui          t1, 483386
                  fsgnjn.s     fa1, ft10, ft6
                  srai         s10, t2, 23
                  sra          sp, a5, s2
                  fle.s        a1, fs0, fs8
                  fclass.s     t3, fs10
                  fmin.s       ft5, fa6, fs10
                  fcvt.wu.s    t2, fs10, rdn
                  lui          t6, 394932
                  fmv.x.w      s0, fa3
                  remu         s2, s8, a6
                  add          s0, sp, s10
                  add          s4, sp, a4
                  remu         s3, t5, a3
                  srl          s6, t0, a1
                  fcvt.w.s     a1, fa4
                  fsgnjn.s     fa7, fs11, fs7
                  fsub.s       ft10, fs5, ft10
                  srai         a4, a1, 22
                  feq.s        s6, fs0, fs4
                  fmax.s       fs7, ft6, fa7
                  feq.s        a5, fa1, ft6
                  flt.s        t1, fa6, fa4
                  sub          t2, ra, t1
                  nop
                  fadd.s       fs6, ft1, fs3, rmm
                  fcvt.s.w     fa4, s1
                  slli         a0, a3, 23
                  divu         sp, s7, a6
                  mulhu        t1, s10, s6
                  nop
                  mulhu        s8, s1, a2
                  fmin.s       ft2, fs10, fs4
                  add          s7, gp, s11
                  mulhu        s5, s9, a7
                  rem          gp, s5, ra
                  srai         s1, a1, 25
                  mulhsu       a0, a7, a6
                  fsgnjn.s     ft5, fa5, fs11
                  fmv.x.w      t1, ft11
                  fmv.x.w      sp, fa0
                  sra          a3, gp, a3
                  remu         s4, s2, t1
                  sub          s11, s10, a5
                  fle.s        s3, fs11, fs4
                  fdiv.s       ft8, ft3, fa3
                  srli         s6, t4, 13
                  sub          t1, a7, a3
                  mul          s3, a4, t0
                  sub          sp, a0, t5
                  nop
                  fsgnjn.s     fs5, ft10, fs11
                  fmul.s       fa4, ft8, fs3
                  sra          s1, a0, a6
                  sltu         a6, ra, gp
                  fmax.s       fs4, ft5, ft0
                  xor          s5, s2, t6
                  feq.s        t4, fs11, fs5
                  add          s0, s7, t5
                  and          t6, t6, s4
                  srli         s4, t6, 7
                  xor          s2, a2, s4
                  srai         t0, s5, 16
                  fsgnjn.s     fs10, ft8, ft8
                  srli         t5, s5, 21
                  lui          a5, 376041
                  remu         t1, s11, a2
                  fadd.s       ft7, fs10, fa4
                  fcvt.w.s     s6, fa0, rtz
                  fdiv.s       fa3, fs2, fs7, rmm
                  fclass.s     t3, ft7
                  and          a2, s11, s8
                  srli         s1, a1, 1
                  fcvt.w.s     sp, fs1, rmm
                  sub          gp, t0, gp
                  fmax.s       ft5, ft2, ft10
                  mulh         t2, tp, t6
                  fmax.s       ft6, fa3, ft1
                  fle.s        sp, fs5, fs3
                  fmv.w.x      fs6, s3
                  fsgnjn.s     fa1, fa1, ft10
                  mulhsu       t5, t6, t5
                  sltu         t6, a6, s5
                  fcvt.s.wu    ft8, t0
                  auipc        t4, 979312
                  feq.s        s5, fs8, fa5
                  rem          a6, a4, t5
                  add          s0, s6, s10
                  sub          sp, a0, s5
                  fclass.s     a0, fs5
                  and          s1, s5, t0
                  xori         t2, a7, 585
                  srai         gp, ra, 11
                  div          t4, s0, s10
                  divu         a0, a1, s10
                  remu         a1, t6, a5
                  srai         gp, t2, 8
                  fle.s        s8, fa1, fs1
                  fmv.x.w      s0, ft0
                  flt.s        t5, ft7, fs8
                  fsgnjn.s     fs7, fs6, fs1
                  or           s7, tp, s1
                  srli         s2, t4, 19
                  sll          s1, s7, a0
                  auipc        s7, 776162
                  sltu         s7, s6, t6
                  auipc        s1, 438462
                  slli         s10, s10, 14
                  remu         t1, a5, t5
                  mulh         a5, s7, a4
                  srai         t3, ra, 3
                  and          gp, s5, s2
                  srli         t6, t3, 3
                  fmax.s       fs10, fs5, ft9
                  fsgnjx.s     ft3, fs2, fa7
                  fsgnjx.s     fs8, fa3, ft2
                  mul          s7, t2, t0
                  ori          t4, a6, 704
                  fcvt.s.wu    fs11, zero
                  sub          s0, a3, s2
                  remu         t6, s2, tp
                  fadd.s       ft11, fs2, ft2, rmm
                  srl          s8, t4, a7
                  fadd.s       ft3, fa5, fs11
                  fcvt.wu.s    s4, fs1
                  sub          t6, zero, s8
                  sra          s1, t4, s2
                  nop
                  fsgnj.s      fs7, fa0, fs2
                  fcvt.w.s     sp, fa7, rne
                  fmv.x.w      gp, fs0
                  sltu         a1, s4, s8
                  mul          s1, a3, t2
                  rem          s2, zero, a7
                  lui          s3, 72835
                  srl          s0, a6, s3
                  fclass.s     t1, ft11
                  lui          s4, 891621
                  ori          sp, tp, -1939
                  fle.s        a3, ft8, fa1
                  mulh         a5, sp, s0
                  sub          s2, a5, t5
                  fmax.s       fs0, ft11, ft8
                  fmin.s       ft11, ft8, fs1
                  fsub.s       fs6, fs5, ft10, rne
                  fcvt.s.w     fa1, s4
                  nop
                  fsqrt.s      fa6, fa2, rup
                  sltu         t6, s5, a3
                  div          t4, sp, a5
                  fclass.s     s0, fs8
                  fsub.s       fs10, fs2, ft10, rmm
                  auipc        t6, 749307
                  fsqrt.s      fs6, fs1
                  fmin.s       fs5, fa4, fa6
                  fsub.s       fs7, fa5, ft5
                  fdiv.s       fs2, fs11, fs2, rtz
                  xori         a1, tp, -1961
                  fclass.s     t2, fs5
                  srai         t4, t5, 4
                  fdiv.s       ft7, fa3, ft2, rup
                  fmul.s       fs2, fs11, ft11
                  divu         a3, s11, s4
                  slt          t6, s7, ra
                  sll          t1, a1, s4
                  fle.s        t2, fs10, fa7
                  fsgnjx.s     fa7, fs5, fs0
                  sub          s10, s3, gp
                  fsgnj.s      fs6, ft9, fa7
                  fclass.s     a7, fa0
                  auipc        a4, 735103
                  fsgnj.s      fa2, fa6, fs4
                  fsgnjn.s     fa0, ft2, fa6
                  srai         s8, s7, 17
                  xori         s5, ra, -1092
                  sltu         s6, s6, t0
                  fcvt.s.wu    fs11, s5, rne
                  fsgnj.s      ft11, fs7, fa3
                  fadd.s       fs3, fa2, ft10, rdn
                  fclass.s     t6, fa4
                  divu         a3, s4, s10
                  fsub.s       fa2, fs7, fs9, rne
                  fadd.s       ft11, fa0, ft5
                  mulhu        a3, a7, t2
                  fsgnjx.s     ft3, ft9, ft1
                  fmax.s       ft8, fs8, fa2
                  sub          s11, s8, a0
                  andi         t0, s3, -283
                  sll          t3, gp, t4
                  fsgnj.s      ft2, fa1, fs2
                  fsgnj.s      fs7, ft8, ft1
                  fdiv.s       ft4, ft5, ft10
                  or           t2, sp, sp
                  feq.s        s7, ft4, fa6
                  remu         s4, a3, gp
                  or           t0, s7, t5
                  mulhu        s8, t2, ra
                  nop
                  fmul.s       ft4, ft1, fa3, rdn
                  addi         a5, a3, 1249
                  add          s3, gp, s4
                  slt          t1, sp, s2
                  ori          zero, sp, 1263
                  fmin.s       ft6, fa3, ft1
                  sltu         s7, s3, t0
                  fcvt.s.wu    fa0, t5
                  or           sp, a3, a6
                  fcvt.s.w     fs8, s6, rdn
                  rem          a0, t2, a6
                  fmin.s       fs9, fa1, fa6
                  rem          s10, s0, a2
                  mulh         t4, a6, s3
                  nop
                  xor          s7, a2, t5
                  slt          s11, gp, s6
                  flt.s        s1, fs4, ft9
                  fcvt.wu.s    s0, ft5, rtz
                  mulhsu       s2, s6, a7
                  sll          t0, zero, s5
                  fsgnj.s      ft10, ft7, fs0
                  slli         a4, s6, 8
                  fmul.s       ft6, ft9, fa0, rdn
                  fadd.s       fs5, fa7, fs1
                  srl          a1, t4, sp
                  feq.s        s4, fs9, fa5
                  nop
                  fdiv.s       ft4, ft6, fs9, rne
                  fcvt.s.wu    ft8, s3, rne
                  remu         t1, t2, a2
                  divu         t6, sp, ra
                  fmin.s       fa3, fs2, ft11
                  fcvt.wu.s    s8, ft9
                  divu         t6, tp, s7
                  fsgnjn.s     ft3, fs3, fa2
                  and          zero, s11, a7
                  fmax.s       fs0, fs8, fa7
                  fdiv.s       fs2, fs11, fs3
                  and          s10, s1, s9
                  fsgnj.s      fa7, fa5, ft3
                  mulhsu       s8, s7, a4
                  ori          a4, sp, -2025
                  fadd.s       ft6, ft10, fs6
                  sra          a6, s1, s10
                  sll          a0, t3, t0
                  slti         zero, t1, -670
                  or           sp, t5, a4
                  slt          t2, a3, s11
                  add          s4, s6, sp
                  fle.s        zero, fs6, fs8
                  fmul.s       ft11, fs1, ft11, rtz
                  sll          s2, t3, a1
                  fsqrt.s      fs7, fa3, rne
                  fsqrt.s      ft5, fs0
                  sltiu        t0, s8, 1031
                  fadd.s       fa0, fs11, ft7, rdn
                  fcvt.wu.s    a6, fs7
                  fcvt.s.wu    ft6, a0
                  sra          t2, zero, a1
                  slt          s5, sp, s7
                  lui          s3, 532641
                  fdiv.s       fs6, fa0, ft11
                  fsub.s       fs4, ft2, fs10
                  fsgnjn.s     ft10, fa3, fa1
                  fadd.s       ft2, fa5, ft4, rup
                  fcvt.s.wu    fs3, zero, rdn
                  mulhsu       s3, s10, s3
                  fmax.s       ft0, fa4, fs1
                  sub          t5, ra, a0
                  and          sp, s10, tp
                  srl          s0, gp, t1
                  sra          zero, ra, t1
                  fmv.x.w      gp, fs5
                  fclass.s     s8, fa6
                  sra          s7, s4, a3
                  ori          t3, s4, 968
                  div          t3, s11, s9
                  lui          a0, 499087
                  fmv.x.w      t4, fa5
                  sltu         t6, s4, s9
                  fsgnjn.s     fs0, fa7, fs11
                  sll          t1, s2, s2
                  xori         zero, a2, 350
                  and          t0, zero, a0
                  sltu         t0, a2, s6
                  mul          t2, a4, ra
                  fmul.s       fs11, ft5, fa7
                  lui          s2, 3310
                  fsub.s       fa2, fs10, fs8
                  srli         t6, zero, 20
                  lui          s2, 973751
                  sub          s3, s7, s8
                  feq.s        s1, ft8, ft4
                  fadd.s       fs4, fs9, ft4, rdn
                  divu         s2, a1, gp
                  fadd.s       fs4, ft7, fs1, rdn
                  fsub.s       ft5, ft10, fa7, rne
                  fle.s        a2, fa5, fs3
                  or           a2, a3, tp
                  fsgnjx.s     fs9, fs11, ft10
                  divu         t0, a3, gp
                  fclass.s     a3, fa3
                  feq.s        sp, ft4, ft7
                  fsgnjx.s     ft4, fs1, fa7
                  fcvt.s.w     fa0, t2, rdn
                  fcvt.wu.s    t0, ft5
                  mulhsu       s7, tp, ra
                  fsqrt.s      fa4, fs2
                  fsqrt.s      ft7, fa6
                  srl          a0, s7, tp
                  fmax.s       fs1, ft2, ft10
                  fmin.s       fs1, fa1, ft7
                  fmin.s       ft4, fs9, ft1
                  add          sp, a4, tp
                  andi         a4, sp, 684
                  sltu         t2, a4, tp
                  divu         sp, s0, a4
                  mulhu        t1, gp, t6
                  fsgnj.s      ft3, fa6, fs11
                  fcvt.w.s     t4, fs10
                  sltiu        a7, s7, -884
                  flt.s        sp, fa3, fa5
                  feq.s        s8, ft9, ft9
                  divu         t0, zero, a2
                  xor          s1, s11, s10
                  andi         t0, a7, -1227
                  feq.s        s7, ft4, fa1
                  mulhsu       s5, a5, s11
                  fsgnj.s      fs2, fs3, fa5
                  auipc        t4, 765194
                  mulhsu       s2, t1, a6
                  fmax.s       fs6, ft0, fs11
                  div          t6, s5, a0
                  fsub.s       fs6, fa6, ft4
                  slti         gp, s4, 2038
                  fcvt.w.s     s6, ft5, rne
                  fcvt.wu.s    s8, fs8
                  xori         a4, s3, -822
                  xori         sp, tp, 114
                  ori          t2, ra, 1459
                  or           s6, t2, s11
                  mul          s8, sp, s2
                  slli         a1, t4, 23
                  sra          a7, s5, t6
                  sltiu        t2, t4, -2046
                  nop
                  sltu         gp, a4, s11
                  nop
                  feq.s        a5, fs7, fa2
                  fmax.s       fs3, fa4, ft9
                  rem          s5, s5, s6
                  fmin.s       fs4, ft10, fs3
                  fsub.s       ft4, fa7, fs8, rmm
                  mulhu        t2, t1, a4
                  fadd.s       fs4, ft8, fs0
                  mulhsu       t4, s1, s5
                  fcvt.w.s     zero, fs10, rne
                  fsub.s       fs0, fa2, fs10, rdn
                  or           a0, a2, a7
                  fcvt.wu.s    a4, fa7, rdn
                  slti         a1, t2, 528
                  nop
                  feq.s        s5, ft4, ft7
                  fmul.s       fs11, ft7, fs7, rup
                  sltiu        t3, s2, 1107
                  remu         s3, s10, a3
                  fclass.s     s3, ft0
                  fcvt.s.wu    fs10, s6, rdn
                  fcvt.wu.s    a6, fa2
                  mulh         s1, t2, s2
                  mulhsu       s10, s9, a7
                  or           gp, a7, s5
                  fdiv.s       fs5, fs6, fa2, rtz
                  div          zero, a4, t2
                  fadd.s       fs9, ft1, fa5, rtz
                  sltiu        a6, ra, 1342
                  auipc        t2, 530195
                  sub          a1, s0, a6
                  mulhu        s3, s3, zero
                  fmv.w.x      fa1, s1
                  fcvt.s.w     fs6, t0, rne
                  add          a4, a0, zero
                  fsgnjn.s     ft8, ft5, fs8
                  fsqrt.s      ft5, ft3
                  srai         zero, s1, 16
                  ori          t4, ra, -569
                  xor          s1, s3, s5
                  fdiv.s       fa3, fa5, fs4
                  fsgnjx.s     ft2, fa6, fa3
                  fsgnjx.s     fs1, fa0, ft0
                  feq.s        zero, ft11, fa0
                  div          s5, zero, s11
                  xori         s7, s7, -1575
                  lui          t6, 178754
                  sltu         sp, t5, a3
                  rem          s10, s3, a2
                  fclass.s     a4, fs5
                  xor          s2, a5, a4
                  mulhu        a4, sp, a2
                  srai         s6, s1, 12
                  ori          s8, s10, 1974
                  fle.s        gp, ft9, fa5
                  fmax.s       fs8, fs11, ft3
                  slti         s4, a2, 1107
                  fcvt.w.s     a6, fs1
                  mulhu        a7, zero, a0
                  sra          s8, a1, a6
                  sub          s1, s9, s4
                  fcvt.s.wu    fs3, t6, rtz
                  fsgnjn.s     ft5, ft2, fs5
                  auipc        a6, 687753
                  fdiv.s       ft9, fs5, fa1, rtz
                  auipc        t0, 180234
                  srai         s5, s7, 6
                  remu         zero, s5, s1
                  xori         t5, a3, -1880
                  sltiu        a6, ra, 110
                  xori         a1, t2, 632
                  fcvt.s.wu    fa3, s9
                  fsgnjx.s     ft2, fs8, fs8
                  rem          t3, s3, t4
                  sltiu        t5, a7, 255
                  rem          a7, s8, t1
                  xori         a7, t0, 504
                  fadd.s       ft2, fa2, ft10
                  feq.s        s4, fs7, ft0
                  fsqrt.s      fa6, ft5
                  fcvt.wu.s    a0, fa0, rne
                  addi         a3, t6, 2002
                  or           s0, a4, t2
                  add          s2, a7, t4
                  fsub.s       fs11, ft10, fa3
                  auipc        s10, 555897
                  fmv.w.x      ft6, s0
                  fcvt.wu.s    a2, ft1
                  fcvt.w.s     s3, fa7, rne
                  mul          t0, s6, s11
                  fcvt.s.wu    fs7, a5
                  rem          t2, ra, t5
                  feq.s        a5, fs5, fs2
                  fadd.s       ft1, ft3, fs9
                  fmv.x.w      t2, ft8
                  fsgnjx.s     ft3, fs5, ft3
                  fsub.s       fa0, fs0, fs9, rmm
                  fsub.s       fa0, fa3, fa2, rdn
                  andi         a7, sp, -675
                  fmin.s       ft1, fa5, ft10
                  mul          a2, a3, s1
                  fadd.s       ft0, fs4, fs9
                  and          s6, s2, s10
                  fcvt.s.w     fs0, tp
                  fclass.s     sp, ft9
                  fle.s        a0, fa1, ft7
                  remu         s4, a7, s7
                  sltiu        s5, s4, -1226
                  fsgnj.s      ft3, ft8, ft1
                  sub          s11, a2, s2
                  fmul.s       ft5, fs10, ft7
                  sll          s2, s3, s1
                  flt.s        t2, fa0, fa1
                  fclass.s     s8, fa4
                  xori         t4, s8, 1972
                  fmv.x.w      t1, ft11
                  srli         a7, t5, 3
                  remu         a4, sp, t2
                  auipc        t3, 608675
                  fsgnjx.s     fs3, ft8, fs5
                  fsqrt.s      fa7, fs9, rdn
                  fsub.s       fa6, ft8, fs8, rdn
                  fadd.s       fa6, ft5, ft9, rmm
                  sltu         a7, a5, s1
                  remu         t0, t3, s0
                  fcvt.w.s     s4, ft5
                  srl          t1, t1, tp
                  feq.s        s6, fs11, fs5
                  sltiu        a4, s11, -1461
                  fsgnj.s      fa6, fa0, fs5
                  mulh         a7, a0, t3
                  or           a5, s8, s4
                  sltiu        t3, s2, 1746
                  fsgnjx.s     fa5, fs6, fs11
                  srl          t0, zero, s7
                  fcvt.w.s     a3, fs5, rmm
                  add          s5, t4, s2
                  mulhu        t1, tp, a1
                  mulhu        s7, a0, s2
                  fmax.s       fs1, fa5, fa2
                  mul          t3, s2, s6
                  mulhsu       t3, t2, s10
                  fsqrt.s      fa0, fa0, rdn
                  xori         s5, t2, 848
                  fadd.s       fs0, ft4, ft11, rdn
                  fsgnjn.s     ft11, fa1, fs1
                  mulhu        s0, t3, a5
                  fsub.s       fa4, fa5, ft4, rmm
                  andi         s8, a7, 916
                  fsub.s       ft0, ft11, ft2
                  srli         s7, a5, 19
                  fcvt.w.s     s0, fa1
                  feq.s        s8, ft7, ft2
                  slli         a3, t2, 31
                  fclass.s     t3, fs8
                  rem          s1, a6, s9
                  fcvt.s.w     fs8, gp
                  flt.s        a3, fa4, ft3
                  or           a3, a7, a7
                  srai         s3, t3, 7
                  fmin.s       fs0, fs9, fs6
                  srai         a3, t6, 28
                  mul          s6, s6, t6
                  flt.s        s8, fs9, fs6
                  fsgnjx.s     fs0, ft3, fs0
                  fsgnj.s      fa5, fa0, fs0
                  fadd.s       ft4, fa3, ft11, rne
                  fle.s        s11, fs4, ft1
                  remu         a1, a7, s3
                  sll          s11, s8, s11
                  mul          s4, s3, a1
                  srli         s4, s4, 2
                  and          s5, a0, t4
                  fmv.x.w      s11, fs3
                  srli         s8, t1, 2
                  fmv.x.w      t1, ft11
                  fsgnj.s      ft11, fs9, ft1
                  fmax.s       fs6, fs0, ft11
                  sra          a1, gp, s3
                  fcvt.s.wu    fa7, a0, rne
                  fcvt.wu.s    zero, ft7
                  fsgnj.s      ft4, fa2, fs0
                  feq.s        a5, fa0, fa6
                  fmin.s       fs3, ft0, ft0
                  sltiu        t6, s0, -1351
                  rem          sp, t2, s7
                  fmv.x.w      s5, fs0
                  fmax.s       fs9, ft1, fs3
                  srai         s11, s2, 5
                  fmul.s       ft5, ft0, ft5, rtz
                  fadd.s       fs3, ft1, ft0
                  slt          t2, a0, t2
                  fcvt.w.s     a5, fa4
                  fcvt.s.wu    fa0, s6
                  mulh         t4, s0, s4
                  fcvt.s.wu    fs9, s4
                  add          s8, a0, t2
                  fdiv.s       ft8, ft6, fs8
                  srli         a0, t2, 10
                  fmv.x.w      a7, fs9
                  lui          a5, 493811
                  fmv.x.w      s1, fs9
                  srl          gp, a0, t4
                  slli         a3, gp, 14
                  fsgnjx.s     fs11, fs1, fa0
                  fcvt.w.s     a4, fs7
                  divu         t5, s7, s6
                  fmul.s       fa4, fa5, fs11, rdn
                  mulhsu       s7, s11, s5
                  addi         s7, a6, 475
                  sra          s11, t5, a3
                  mul          s0, s6, t5
                  sra          t1, a2, t3
                  remu         t5, tp, t4
                  nop
                  fadd.s       ft4, ft9, ft2
                  fcvt.wu.s    s6, ft9
                  auipc        t1, 434596
                  rem          a1, s3, s2
                  fsqrt.s      fa7, fs3
                  feq.s        gp, fs5, ft1
                  mulhsu       t3, t2, a3
                  srai         a3, t4, 20
                  fcvt.s.wu    fs3, s1, rmm
                  andi         t1, s8, 563
                  fmin.s       fs0, fs5, fs0
                  xor          t1, s4, ra
                  srli         s11, a7, 21
                  fsgnjn.s     fa4, ft3, fa5
                  mulhu        a5, a4, gp
                  addi         a1, s4, 1118
                  fsqrt.s      ft5, fa7
                  sra          t3, t4, s6
                  srai         gp, gp, 31
                  slt          s11, s0, a3
                  srl          s5, s9, a5
                  fcvt.wu.s    a4, fs7
                  ori          a1, t5, -1694
                  flt.s        t3, fs6, ft3
                  mul          s7, s5, zero
                  fmax.s       fa5, ft9, fa5
                  fle.s        s2, ft7, ft5
                  fmv.w.x      ft10, a3
                  and          zero, t1, t3
                  and          s11, t4, a6
                  fcvt.w.s     t1, fs6
                  mul          t3, a2, s10
                  or           t0, s0, s7
                  fcvt.s.wu    fa6, a7
                  srli         s3, a6, 14
                  fmax.s       ft9, fs11, fs3
                  auipc        t5, 295957
                  fcvt.s.w     fs7, a1
                  divu         s2, a3, sp
                  xori         a3, a4, 151
                  mul          t4, a6, ra
                  slli         s5, a4, 11
                  slti         t1, t6, -1729
                  fcvt.w.s     zero, fa6
                  xor          zero, t3, t6
                  sll          a4, zero, a5
                  fcvt.s.w     ft11, zero, rmm
                  nop
                  mulhsu       s10, t3, t5
                  mul          s5, s1, t2
                  fmax.s       fa0, ft2, ft4
                  sltiu        a1, zero, 1966
                  fmax.s       fs3, fs1, ft11
                  fmv.w.x      fs8, s0
                  mulhsu       a6, s7, a6
                  nop
                  sub          s0, a4, t4
                  fmv.x.w      s8, ft10
                  sra          a1, s1, a0
                  sub          s7, a5, t0
                  mul          a0, t0, a4
                  auipc        t2, 254597
                  and          t6, s7, s1
                  divu         t3, a1, s10
                  slli         s8, a0, 24
                  slt          a0, t4, t6
                  flt.s        t0, fa6, fa1
                  slli         s2, t6, 0
                  fcvt.wu.s    sp, fa7
                  fcvt.wu.s    s2, fa5, rdn
                  fcvt.wu.s    s6, ft10
                  fle.s        s7, ft6, fs5
                  or           a4, t5, a1
                  sra          t1, s6, t4
                  fsqrt.s      ft9, ft0, rtz
                  srli         a6, s5, 10
                  fclass.s     a0, fs9
                  ori          s5, t5, -1011
                  fcvt.s.wu    fa4, s11, rtz
                  fle.s        s3, fs9, fs1
                  xori         a6, ra, 1792
                  fclass.s     s2, ft7
                  sll          t0, s8, ra
                  fmv.x.w      s4, ft1
                  fcvt.s.wu    ft2, t0
                  fcvt.w.s     t3, fa7, rdn
                  ori          t4, s6, -27
                  fmul.s       fa0, fs7, fs11, rne
                  fsqrt.s      fs11, fs1
                  flt.s        s6, fs5, ft5
                  fcvt.w.s     a7, fs11, rmm
                  or           t5, t6, t6
                  fmv.w.x      fs9, s7
                  xori         s6, s3, 1562
                  srai         gp, s9, 14
                  mulhsu       t6, t2, s10
                  fsgnjn.s     ft5, fs5, ft5
                  flt.s        a3, ft8, ft8
                  mul          s3, a0, a2
                  fsgnjn.s     ft10, fa2, ft7
                  fsgnjn.s     fa4, fa3, ft1
                  fsqrt.s      fs3, fs4, rne
                  add          a3, t4, t1
                  fle.s        a6, fs4, fs11
                  fsqrt.s      fs10, fs0
                  srl          a2, s9, s8
                  flt.s        s4, fs11, fa7
                  slt          t2, a3, zero
                  srl          zero, s0, a6
                  andi         s2, tp, -1020
                  flt.s        a3, ft10, fa6
                  or           t2, t4, s5
                  and          sp, s9, s11
                  fcvt.s.wu    fs5, s4, rne
                  remu         s10, ra, a5
                  fmin.s       fs4, ft9, ft1
                  xor          zero, s3, a0
                  lui          s2, 324401
                  auipc        a5, 133685
                  auipc        s7, 253606
                  fle.s        a0, ft8, fa4
                  rem          s3, s5, a4
                  fsgnj.s      fs10, fa3, fa2
                  xori         gp, a3, -1498
                  mul          gp, a4, tp
                  srl          a5, s3, a6
                  srl          a7, sp, t5
                  fmv.x.w      s4, ft10
                  flt.s        t5, fs9, fa3
                  mulhsu       t6, a6, a6
                  fsqrt.s      ft0, ft9
                  flt.s        t1, fs2, fs9
                  fmv.w.x      fs3, s2
                  mulhu        s3, s9, s9
                  fcvt.s.w     fs6, a5, rtz
                  fsgnjn.s     fs3, fs5, ft10
                  mul          t0, s5, s5
                  srai         s3, s9, 11
                  fle.s        t4, ft7, ft2
                  srli         t5, a7, 26
                  div          s1, s11, t3
                  fcvt.wu.s    s5, fa1
                  fcvt.w.s     s8, fs0
                  slli         s3, s10, 10
                  sub          s3, a3, t5
                  fsqrt.s      fs11, ft1, rup
                  fsub.s       fs5, fs8, ft6, rmm
                  fsgnj.s      fa6, ft10, ft6
                  mulh         a6, tp, s4
                  srai         t6, ra, 13
                  fsgnjx.s     ft0, fs6, fs7
                  andi         s4, zero, 1591
                  fcvt.s.w     fa7, t1, rup
                  srli         s3, s1, 25
                  feq.s        gp, fa0, ft3
                  and          s6, a7, t3
                  fsqrt.s      ft5, fs2, rmm
                  mulh         s7, s2, a6
                  fcvt.s.wu    fs5, s11, rmm
                  mulh         s7, t2, t0
                  fle.s        a3, ft8, ft10
                  auipc        t3, 199108
                  divu         a5, s10, t6
                  mulhsu       sp, s6, t6
                  mulhu        s5, a0, s10
                  and          s3, gp, s1
                  fmax.s       fs1, fs8, ft6
                  fmv.x.w      t6, fa7
                  lui          t5, 573275
                  or           a5, s5, t3
                  fclass.s     sp, fs11
                  fmul.s       ft3, fa5, fs1, rdn
                  sra          t0, t2, ra
                  fsub.s       ft4, fs1, ft1, rup
                  auipc        s10, 802155
                  srai         s10, ra, 23
                  fmv.w.x      ft3, t4
                  fcvt.wu.s    t5, fa0
                  sltiu        t6, t2, 1509
                  fmax.s       fs6, fs0, fs11
                  sra          t2, a7, s10
                  mulhsu       s8, sp, a0
                  div          s10, t3, a5
                  mulh         s7, a4, a1
                  fsqrt.s      fa3, fa4
                  ori          a2, s1, 1963
                  fcvt.s.wu    fs11, s3, rne
                  fcvt.wu.s    t5, fa0
                  xor          a4, a7, gp
                  slt          a5, a1, s4
                  fcvt.s.w     fa0, s9, rmm
                  divu         a3, s1, s11
                  fmin.s       fs3, ft2, ft9
                  fmin.s       ft3, fs11, ft1
                  sltu         a6, t0, a1
                  rem          a0, s7, zero
                  nop
                  fmul.s       fs9, fa3, ft9, rne
                  sll          s1, s9, tp
                  addi         s1, a1, 1621
                  addi         a6, a0, -1285
                  divu         a6, zero, a3
                  or           s11, t6, a7
                  fmul.s       fs5, ft10, fs6, rup
                  xor          a7, gp, a7
                  div          t2, t2, sp
                  fsub.s       ft4, fs2, fs8
                  fsub.s       fa2, ft6, fa2
                  fadd.s       fs10, ft9, ft1
                  fsub.s       fs4, fs3, ft4, rdn
                  mulhsu       s7, t4, s11
                  mul          s11, t4, a3
                  sub          a4, t1, s9
                  fmin.s       ft4, fa2, ft0
                  sub          sp, s8, s9
                  fmul.s       fa2, fs9, fs5, rne
                  fcvt.s.w     ft11, t6, rne
                  rem          a5, s1, a2
                  srai         a6, zero, 16
                  fle.s        a0, fa1, ft8
                  fcvt.wu.s    sp, ft4
                  or           a1, zero, s0
                  fmin.s       fs0, fa1, fs10
                  mulhu        s5, a6, a0
                  sltu         t1, t0, s6
                  fadd.s       ft9, fs7, fs6
                  fmin.s       ft11, fs2, ft8
                  addi         s10, sp, 1656
                  andi         s1, a1, -28
                  addi         sp, ra, -507
                  fadd.s       ft4, fa7, ft1, rtz
                  srai         t0, s11, 21
                  fclass.s     t5, ft1
                  fsgnjx.s     fs6, ft9, fs6
                  fmin.s       ft2, fa1, fs9
                  ori          s1, s9, 466
                  slli         s0, t6, 14
                  fmv.x.w      t0, ft10
                  sltu         a6, tp, ra
                  fmin.s       fs11, fs10, ft11
                  ori          a2, a7, 65
                  fcvt.s.w     fa5, a0, rmm
                  and          sp, s11, s10
                  fmul.s       fs1, fs3, ft1
                  fdiv.s       fs8, fs6, ft3
                  flt.s        s6, fa7, fs9
                  add          s6, s6, a3
                  fcvt.s.wu    fs2, a0, rmm
                  fcvt.s.wu    fs9, s10, rne
                  auipc        s3, 104548
                  feq.s        a0, fa3, ft7
                  sra          t3, s4, s10
                  srli         s8, t1, 16
                  fmax.s       fs1, fa5, fs5
                  lui          s4, 907503
                  mulhsu       t0, s6, t5
                  slt          a2, a4, t2
                  fmv.x.w      zero, fs3
                  mulhsu       s6, a1, s10
                  addi         a5, zero, 1563
                  lui          a4, 420176
                  fcvt.s.w     ft8, a1, rmm
                  sltu         s1, a2, s5
                  lui          t1, 631638
                  fcvt.wu.s    a2, fs2, rmm
                  mulhu        t0, t6, a6
                  srai         t2, t5, 2
                  sltiu        s2, a1, 1762
                  auipc        s10, 599820
                  feq.s        s10, ft5, ft4
                  nop
                  xor          s7, t2, s2
                  fsub.s       fs5, fs4, ft3, rmm
                  fcvt.wu.s    a7, fa4, rdn
                  fsgnjx.s     fa3, ft4, ft9
                  mul          sp, t0, a3
                  feq.s        t4, ft2, ft1
                  srl          t2, a6, zero
                  mul          a0, s6, gp
                  fsgnjx.s     ft8, fa1, ft3
                  sltu         a6, s6, a1
                  andi         s5, s10, -1913
                  srli         a6, s11, 31
                  fclass.s     sp, fa3
                  divu         s5, a4, s10
                  sra          s6, t5, a5
                  fsgnj.s      fs0, fs5, fa6
                  fsgnjn.s     fs9, fa3, fs8
                  sra          a3, a6, gp
                  add          s5, a2, a3
                  sub          a4, s8, ra
                  fclass.s     zero, fs11
                  and          s4, ra, sp
                  and          t5, s8, a3
                  fdiv.s       fs9, fa6, fs2, rtz
                  slt          t4, s10, s5
                  srai         sp, s10, 26
                  and          s0, s7, a5
                  fsgnj.s      fs6, fs6, fs6
                  fcvt.s.wu    ft7, a5
                  sltiu        a5, s1, 266
                  fdiv.s       fs6, fs9, ft11, rne
                  fcvt.wu.s    s0, fs3, rmm
                  fmax.s       fs7, fs4, fa1
                  srl          a1, t1, zero
                  lui          s10, 901859
                  fcvt.s.wu    fa3, t2, rdn
                  sltu         t2, a7, s4
                  srli         t5, s2, 20
                  fmul.s       ft11, ft7, ft2, rup
                  fcvt.wu.s    t6, ft7
                  fsqrt.s      ft10, fa0, rup
                  ori          s1, a7, 1799
                  add          s2, s7, s9
                  mul          s10, s4, a6
                  fsgnjx.s     fa4, fs8, ft10
                  flt.s        a2, ft3, fa1
                  fmv.w.x      fs6, a1
                  sll          s10, a4, t5
                  fcvt.s.wu    fa3, s1, rmm
                  xor          a0, t5, ra
                  fsqrt.s      fs1, ft1
                  and          t1, a4, s11
                  mulhsu       gp, gp, a1
                  mulh         s5, a1, tp
                  auipc        t2, 31539
                  fsgnj.s      ft2, fs5, fs9
                  and          a2, a0, s2
                  mulhsu       s1, a4, s11
                  fmax.s       ft9, ft11, fs3
                  flt.s        s8, ft9, ft3
                  srai         s3, zero, 6
                  fadd.s       ft9, ft4, ft3
                  fmin.s       fs7, ft7, fa6
                  fcvt.s.w     ft3, a4
                  fsqrt.s      ft10, fa3
                  sltu         s8, s7, s4
                  srl          s0, gp, s11
                  feq.s        gp, fs10, ft8
                  fle.s        s3, fs10, ft3
                  srli         a4, a2, 9
                  add          a2, s2, a2
                  mulh         s3, s8, tp
                  fmv.x.w      s2, fa2
                  fadd.s       fs3, fa6, fs11
                  fmv.w.x      ft1, t3
                  slt          a0, a4, s1
                  div          a5, s9, a3
                  fsgnj.s      ft2, fa4, ft2
                  rem          sp, a1, a7
                  xori         t3, tp, -1521
                  fsub.s       fa0, fs3, fs6, rne
                  fle.s        sp, fa6, fs11
                  fcvt.w.s     s1, fs3, rne
                  fle.s        a1, ft1, ft1
                  ori          t3, zero, -1083
                  slti         s3, a1, 729
                  mul          t1, a6, a5
                  fmax.s       fa7, ft10, ft3
                  fcvt.s.w     ft5, zero
                  fcvt.s.w     fa3, t5
                  fmv.x.w      s1, fs2
                  slli         t6, t0, 2
                  and          gp, a5, s3
                  feq.s        s8, fs0, fs11
                  lui          t6, 192087
                  sltiu        a7, zero, 1057
                  divu         t2, a7, t4
                  sll          s3, s2, s5
                  flt.s        t0, fs3, ft4
                  sltu         a1, t2, s10
                  sub          s4, s9, a7
                  mul          s7, s8, a7
                  slt          a5, a6, t6
                  andi         t3, a0, 1994
                  nop
                  sub          a1, a5, t5
                  ori          a3, t0, -116
                  add          a2, a4, s11
                  fmv.x.w      t3, ft5
                  and          a4, s3, s5
                  fmax.s       ft0, fs0, fs7
                  sll          a5, s6, a0
                  fsgnjn.s     fs0, fs3, fs7
                  fadd.s       fs3, fs4, fs0, rtz
                  srl          s11, gp, s6
                  fadd.s       ft10, ft7, fa3
                  add          gp, t2, ra
                  mulhsu       a6, a3, a7
                  fcvt.w.s     s3, fa2, rne
                  divu         s10, s3, s8
                  fadd.s       fs0, fs1, ft9, rup
                  fcvt.s.wu    fa1, s8
                  fsqrt.s      ft2, fs3, rmm
                  srli         s0, s11, 26
                  fmv.w.x      fa2, s5
                  mulhsu       s8, a3, t0
                  div          s7, a5, s10
                  sltu         t5, s10, s10
                  sub          s11, s0, a0
                  fcvt.s.wu    ft8, t3
                  addi         sp, a2, -1453
                  andi         s7, s4, 1507
                  sltu         t5, s9, sp
                  fsub.s       fs10, fs9, ft11, rne
                  fmul.s       fa4, fs9, fa7, rdn
                  rem          s8, s11, zero
                  xori         gp, s1, 655
                  mulh         s4, s8, s8
                  fcvt.w.s     s3, fs10, rtz
                  add          s5, s3, t1
                  sll          a5, a3, s11
                  fle.s        s0, fs7, fs8
                  nop
                  auipc        s4, 809821
                  feq.s        sp, fa6, ft8
                  fclass.s     a7, fs0
                  fmax.s       fa6, ft2, ft7
                  slti         s0, a0, -1742
                  mul          t0, a1, a0
                  mulhu        a7, s2, s7
                  sltiu        a5, ra, 140
                  andi         a4, s1, 1329
                  mulhsu       zero, a6, s3
                  flt.s        t2, fa1, ft4
                  add          s10, a0, s3
                  fsqrt.s      ft4, fa0
                  mulhu        a5, t6, s6
                  mulh         s6, s3, a1
                  slti         t4, zero, 910
                  flt.s        a4, ft1, fs3
                  auipc        a0, 213489
                  srl          a7, sp, s8
                  or           s0, a7, s8
                  fsub.s       fs4, fs2, fa4, rtz
                  slli         s4, a5, 17
                  lui          s10, 12193
                  fmax.s       fa5, fs2, fs6
                  sub          s11, a2, t6
                  fsub.s       fa5, ft11, fa7, rmm
                  remu         gp, gp, a0
                  sra          s7, a0, s4
                  fmv.x.w      a2, ft2
                  fsqrt.s      fs4, fs6, rdn
                  addi         t2, t3, -1926
                  fcvt.w.s     a3, ft2
                  xor          a3, s6, s7
                  slt          s6, s6, t6
                  fle.s        a3, ft7, ft8
                  fadd.s       ft0, fs1, fs5
                  feq.s        t6, fs9, fs0
                  fdiv.s       ft11, ft9, ft0
                  sra          s5, s8, t1
                  fcvt.wu.s    a4, ft7, rup
                  fcvt.w.s     a1, fa4, rdn
                  or           s10, s10, s2
                  sll          s2, a1, t3
                  auipc        t1, 391032
                  mulhu        s3, s5, ra
                  mulhu        a7, t4, s9
                  fsqrt.s      fa7, fa5, rmm
                  and          s3, gp, s8
                  nop
                  mulh         a5, a3, s11
                  flt.s        a3, fa0, fs1
                  mulhsu       t0, t6, s9
                  fsgnjx.s     ft3, fa3, ft0
                  auipc        s8, 459244
                  fclass.s     s5, fa3
                  nop
                  srli         s1, s6, 27
                  mul          a0, zero, ra
                  slti         s0, s2, -1986
                  slt          sp, t4, a6
                  fsgnjn.s     fs11, fa0, ft3
                  sll          a1, s10, a4
                  ori          t1, ra, -33
                  fcvt.wu.s    a1, fs11
                  or           a0, s7, a6
                  fcvt.s.wu    ft0, tp, rtz
                  fmul.s       fa5, fs0, fs8, rtz
                  slt          s1, s5, a6
                  fclass.s     s7, fa6
                  fcvt.w.s     s1, ft3, rdn
                  xor          s6, s7, a4
                  fsub.s       ft5, fa2, fs2, rtz
                  flt.s        s0, fa6, ft10
                  lui          a7, 35153
                  fle.s        a7, fs1, fs2
                  mulhu        t0, a3, a2
                  auipc        a0, 393613
                  sra          zero, t1, s6
                  fmv.x.w      s6, fa0
                  slli         s4, zero, 6
                  fsub.s       fa7, fs6, fs0, rdn
                  addi         s7, s7, 261
                  fdiv.s       fa5, fa7, ft6
                  fdiv.s       ft8, ft0, ft2
                  fdiv.s       fs5, fs2, fs3, rne
                  fcvt.s.wu    ft4, t3
                  fmv.w.x      fs3, zero
                  fmul.s       fa5, fa5, fs9, rdn
                  slt          s7, gp, s9
                  fmv.w.x      fs5, a2
                  remu         s0, a3, sp
                  flt.s        s0, ft0, fs4
                  auipc        s6, 826708
                  add          a1, gp, s9
                  fsgnjx.s     fa6, fs3, ft8
                  add          s5, a6, sp
                  srai         t3, t1, 9
                  fcvt.wu.s    s1, ft6, rmm
                  srli         gp, t3, 22
                  div          t5, t6, t2
                  ori          s5, t1, 671
                  addi         a1, t3, 978
                  fadd.s       fs6, ft8, ft7, rdn
                  fmax.s       fa5, ft6, fs11
                  slt          s10, a3, s10
                  srli         zero, a2, 17
                  fle.s        a0, ft11, fa1
                  sra          gp, s1, a1
                  or           a4, t3, t4
                  mulhu        s1, s6, t3
                  auipc        s5, 260681
                  mul          s4, s2, s0
                  fcvt.wu.s    a0, fa5, rup
                  mul          s1, a2, t2
                  fcvt.s.w     fs8, s6, rdn
                  auipc        s2, 576936
                  fcvt.s.wu    fs10, zero
                  slt          s7, s9, a5
                  sll          a4, a3, s7
                  or           s4, s8, s4
                  fsqrt.s      ft10, fs1, rmm
                  andi         s11, a2, -296
                  sub          t2, a7, sp
                  fsgnjx.s     fa2, fa0, fs10
                  sltu         s10, s5, zero
                  fclass.s     t6, fs6
                  div          a3, t0, s2
                  add          s7, a2, t2
                  xori         a6, tp, 826
                  sltiu        a0, tp, 1471
                  divu         s4, s1, t1
                  fcvt.s.wu    ft1, s2
                  fcvt.s.w     fa1, t3
                  feq.s        s5, fa7, ft3
                  fcvt.wu.s    t1, fs4
                  fmv.w.x      fs4, a4
                  nop
                  sub          a3, s10, t5
                  mulhsu       s2, a0, s11
                  divu         gp, t0, gp
                  srli         s3, s10, 3
                  fcvt.wu.s    a1, fa6, rdn
                  fclass.s     s11, ft1
                  fsgnj.s      fa7, ft0, fs6
                  sll          a7, s2, a6
                  ori          a0, a2, -1852
                  sra          t4, a6, s6
                  fmin.s       fa3, ft6, fs5
                  addi         t3, t1, 381
                  fcvt.w.s     s8, fa4
                  fsqrt.s      fs6, ft3, rdn
                  mulhsu       a5, s11, s7
                  mulhsu       t5, tp, s2
                  fdiv.s       ft2, ft0, ft10, rdn
                  lui          a0, 135985
                  fmul.s       fs11, ft0, ft6
                  add          s11, s10, t0
                  fsgnjn.s     ft6, fs11, fa1
                  flt.s        a6, fs7, fs9
                  srai         zero, s1, 10
                  addi         t1, s4, 46
                  andi         a4, a3, -903
                  fcvt.wu.s    s11, ft8
                  slt          t0, t1, s4
                  mulhu        t0, s5, s4
                  addi         t4, tp, -206
                  fcvt.wu.s    s0, fa6, rup
                  fmv.x.w      a1, fs8
                  slli         a5, s11, 19
                  fmax.s       fa7, ft3, fs2
                  sltiu        t5, s6, 610
                  slt          t5, s1, s7
                  mulhu        zero, a1, t4
                  fadd.s       ft0, fs0, fs6
                  and          t0, s0, a4
                  slti         s8, s8, 1693
                  auipc        a5, 873498
                  fcvt.wu.s    s10, ft10, rdn
                  auipc        s1, 563561
                  mulh         t5, s2, a4
                  fmv.x.w      s6, ft9
                  add          a4, a3, s7
                  addi         s10, s10, -1129
                  sll          a5, t0, a3
                  lui          s11, 88031
                  mulhsu       s2, gp, s7
                  mul          a2, s11, s6
                  andi         a4, t0, 989
                  fmv.w.x      fs5, sp
                  sub          a1, a0, t1
                  sub          gp, s8, t6
                  srli         s8, a6, 20
                  addi         t4, a1, -1912
                  fmul.s       fa1, ft8, fs4
                  divu         t2, t3, ra
                  fle.s        a4, fs9, ft7
                  fmin.s       fa0, fa5, ft2
                  mulhu        t0, gp, a5
                  fmv.w.x      ft10, s8
                  fcvt.wu.s    s4, ft1, rtz
                  or           t3, s3, s10
                  mulhsu       s3, a5, a1
                  andi         s3, s7, -2012
                  mulhu        s8, s2, t2
                  feq.s        t4, ft6, ft6
                  fcvt.wu.s    s11, fs4
                  lui          s6, 618929
                  rem          a0, s0, a4
                  mulhsu       a3, ra, s10
                  fsub.s       ft10, fa6, fs7, rdn
                  fadd.s       ft2, fa0, fs10
                  slti         s6, t2, -627
                  flt.s        a3, fa2, fs4
                  rem          s8, a7, a3
                  slti         sp, t3, -1396
                  andi         s7, zero, 1885
                  fmv.w.x      fa0, s8
                  fcvt.w.s     a3, ft10
                  fcvt.s.w     ft7, s7, rdn
                  fsqrt.s      ft1, fs6, rdn
                  rem          a4, t6, s4
                  xor          s3, a1, t2
                  lui          a4, 927590
                  fsgnjx.s     ft0, ft1, fs4
                  divu         s6, t0, a7
                  fmul.s       ft7, ft8, fs2
                  sltu         a1, zero, a7
                  sltiu        s8, a6, 156
                  xor          s6, ra, a4
                  nop
                  fsub.s       ft2, fa6, ft8
                  slti         t5, gp, -62
                  fcvt.s.wu    fa0, t2, rmm
                  auipc        a2, 685792
                  addi         a2, s9, -648
                  fcvt.s.w     ft9, tp
                  sltu         s10, t3, t3
                  andi         a4, sp, 1789
                  fsgnjn.s     fs3, fs1, fs6
                  mulhsu       s7, a1, sp
                  add          sp, gp, s10
                  srli         a4, s5, 13
                  sra          s8, a0, a0
                  fcvt.wu.s    a2, fa5, rdn
                  sltu         s10, t1, a2
                  xori         sp, s6, 67
                  divu         a0, zero, a3
                  fsgnjx.s     fa5, ft3, ft8
                  fmv.x.w      zero, fa7
                  divu         s6, s5, a2
                  sltiu        a5, s0, -601
                  slli         s8, t5, 15
                  sltiu        zero, a4, -444
                  div          a0, a5, t0
                  fle.s        s8, fa5, fs8
                  fsgnj.s      fs6, fs1, fs10
                  fcvt.w.s     s8, fs9
                  mulhsu       a3, t4, a6
                  nop
                  div          a6, a4, s4
                  fcvt.s.wu    fs3, s10, rup
                  srli         s1, s0, 6
                  sll          s10, s7, t6
                  auipc        s4, 841719
                  fadd.s       ft1, fs5, ft3, rup
                  fmin.s       ft2, fa4, fs4
                  mul          s11, a3, gp
                  andi         s3, t4, -1855
                  fclass.s     a0, ft1
                  xori         t3, a2, 1662
                  feq.s        t0, ft5, ft0
                  andi         zero, a0, 1732
                  fsgnjx.s     fa3, fa2, ft9
                  sltiu        s7, a7, 2009
                  fsgnjx.s     ft0, fa3, fa6
                  sltiu        a0, s7, -2021
                  slli         s2, t4, 12
                  slt          sp, a0, t5
                  fsgnjx.s     ft7, ft11, fs8
                  fmv.w.x      fs4, s11
                  slli         a2, a6, 30
                  srl          s2, s11, s3
                  fsqrt.s      fa3, fa2
                  fcvt.s.wu    fs11, s0
                  slti         a3, a0, 665
                  fmul.s       fa2, ft10, ft1, rne
                  fcvt.s.wu    fs2, a0
                  fcvt.s.w     fs10, t2, rtz
                  nop
                  fcvt.s.wu    fa4, s0, rdn
                  fsgnj.s      ft5, ft11, ft3
                  xori         t4, a0, -1435
                  fsgnj.s      fs5, fs11, fs0
                  mulhsu       a1, t1, s8
                  or           t1, s2, s7
                  mulh         a7, t3, s4
                  fmul.s       ft4, fs9, fs4, rtz
                  ori          t1, s9, 502
                  nop
                  sll          s10, s4, t0
                  fmv.x.w      a6, fa1
                  slt          t1, t4, t2
                  fmul.s       fa0, fs0, ft3, rdn
                  sub          zero, s2, t0
                  ori          sp, sp, -1516
                  fclass.s     a5, ft3
                  or           s5, zero, a3
                  fmv.x.w      s5, ft8
                  sub          s8, t2, a7
                  fmul.s       ft0, ft2, ft6, rup
                  divu         s2, a1, a5
                  auipc        s7, 946695
                  fsgnj.s      ft5, fs0, fa6
                  andi         t3, s2, -520
                  mulhsu       zero, a5, s9
                  fsub.s       fs8, fa3, ft6, rtz
                  fsgnjn.s     fs0, ft2, fs1
                  fle.s        zero, fa7, ft8
                  mulh         a7, ra, s9
                  remu         t5, s1, zero
                  fle.s        s3, fa2, fa5
                  sltu         a5, s3, t6
                  fmax.s       fs8, fa4, fa0
                  fmul.s       fs8, fa1, ft9, rne
                  fcvt.s.wu    fs8, a5
                  andi         t1, t2, 708
                  fmin.s       ft2, ft11, fs11
                  mulhu        s7, sp, s10
                  slti         s0, a1, -490
                  flt.s        gp, fs11, ft5
                  fmul.s       ft5, fs3, fs4, rtz
                  fmv.w.x      ft0, s3
                  mulh         t0, t1, a3
                  fcvt.s.w     ft4, s2, rdn
                  nop
                  srli         t2, t1, 23
                  fsub.s       ft5, fs3, fs4, rmm
                  srai         a4, t0, 9
                  nop
                  slli         a2, s5, 11
                  flt.s        s5, ft1, fa5
                  fmax.s       fa6, fs1, ft6
                  andi         s6, t0, -1418
                  ori          t6, tp, -1732
                  fclass.s     s6, fs11
                  fclass.s     sp, ft2
                  fsqrt.s      fa0, fs8, rne
                  fcvt.s.w     fs4, s2, rtz
                  mulhsu       a1, s3, a3
                  fcvt.s.w     ft11, a1
                  fsgnjn.s     ft1, fs4, fa2
                  fadd.s       ft4, fs4, ft6
                  xori         t6, a0, -1387
                  fmin.s       fs11, fa7, fs6
                  div          a6, gp, s9
                  feq.s        s1, fs7, ft4
                  rem          t1, t3, s5
                  fsqrt.s      fs11, fs9
                  fle.s        s2, fa6, fa7
                  remu         s6, t1, s8
                  add          s11, s4, s4
                  fmin.s       fs1, fa7, fs2
                  fcvt.s.wu    ft3, a7
                  mul          a0, a6, t2
                  fdiv.s       fs4, ft2, fa2
                  slt          s1, s3, gp
                  sub          t2, s7, s0
                  fmax.s       ft3, fs8, fs2
                  mulh         t4, s10, a0
                  mulhu        s10, s0, s1
                  sra          a6, a5, a6
                  fcvt.s.wu    fa3, s1
                  fsgnjn.s     fs1, fa6, fs10
                  and          gp, t2, a4
                  fsub.s       ft10, fs3, fs11, rdn
                  ori          t2, sp, 524
                  flt.s        a6, ft4, fa1
                  xor          a5, tp, s0
                  fmul.s       fa7, fs0, ft9, rmm
                  slti         t0, s6, -1301
                  add          t6, s9, a3
                  fle.s        a2, fs7, fs9
                  sltu         s2, t1, tp
                  fmax.s       ft2, ft5, ft9
                  andi         s10, a1, -213
                  or           s1, a2, s3
                  auipc        sp, 279012
                  divu         s11, s6, t3
                  and          t5, t3, s3
                  xori         a6, t1, 1452
                  sra          s1, a5, s8
                  fmul.s       ft8, ft2, fs4, rup
                  lui          t5, 756420
                  fadd.s       fs2, fs3, fs3, rup
                  flt.s        s8, fs10, fa0
                  sltiu        s6, t6, -1023
                  add          a2, s8, t4
                  flt.s        s10, fs6, ft9
                  sltu         t6, s7, s2
                  slt          a6, s2, s0
                  fcvt.wu.s    s1, fa1, rmm
                  feq.s        s6, fs8, fa6
                  flt.s        a1, ft6, fs3
                  fsub.s       ft4, fa5, fs2, rdn
                  sltu         gp, a6, a6
                  fsub.s       fa4, fs6, fa6, rmm
                  fsub.s       ft0, fs5, fa7, rdn
                  fmin.s       fs8, fs8, ft10
                  fsgnj.s      ft8, fs10, ft2
                  add          a1, ra, a5
                  fsub.s       ft0, fa4, ft3
                  fmin.s       fs2, ft6, fa6
                  fsgnjx.s     fa4, fs4, fs1
                  sra          s0, a3, a4
                  fsub.s       fs0, fa1, fs11, rtz
                  fcvt.wu.s    s10, fa6, rtz
                  add          s6, t3, a2
                  flt.s        s5, ft6, ft11
                  fsqrt.s      fa5, fs2
                  fcvt.wu.s    a0, fs9
                  and          s1, zero, zero
                  mul          s0, gp, sp
                  fdiv.s       fa6, ft6, ft3
                  remu         zero, s0, s8
                  fadd.s       fs8, ft1, fa2, rmm
                  fmin.s       fs6, fa7, fa7
                  fdiv.s       fs1, fs11, fs1, rdn
                  sltu         s1, a2, s10
                  flt.s        t5, fa6, fa3
                  srai         s1, s2, 4
                  andi         t3, a7, -1372
                  lui          a4, 455128
                  sll          s4, gp, t5
                  fmul.s       ft11, fs2, fs10
                  fcvt.w.s     s3, fs2, rmm
                  andi         s5, s2, 678
                  fclass.s     s4, ft4
                  sltiu        t3, a7, -1067
                  fsgnj.s      ft2, ft5, fa2
                  div          a2, s8, s5
                  fdiv.s       fs8, ft7, fs1, rtz
                  flt.s        s11, ft8, fa0
                  fmv.w.x      fs9, sp
                  slli         a3, t6, 17
                  srai         s7, t5, 25
                  srli         t1, a6, 19
                  fmax.s       ft9, ft0, fa7
                  fsqrt.s      fs8, fs6, rne
                  rem          t0, s2, ra
                  fclass.s     s11, ft4
                  fcvt.w.s     a7, ft8
                  fcvt.s.wu    ft7, s9
                  xor          s10, t0, sp
                  add          sp, sp, a7
                  fsgnj.s      ft7, fa0, fs6
                  lui          t2, 155462
                  fsgnjn.s     ft5, fa3, fs9
                  fcvt.wu.s    a1, fa1, rmm
                  or           s6, s9, s1
                  ori          t0, s10, -1516
                  fcvt.w.s     s2, ft9, rdn
                  sub          a1, sp, gp
                  fsub.s       fs6, fs1, fs1
                  slt          s6, t3, s0
                  add          s11, t3, s9
                  fcvt.s.wu    fa5, a3, rne
                  mulh         s7, s4, t0
                  srl          a6, a2, a1
                  fcvt.w.s     t4, fs11, rne
                  sub          s7, s10, s2
                  sltu         s7, t3, s3
                  div          a3, s6, a4
                  slt          a4, t2, s9
                  div          t5, zero, s1
                  nop
                  fcvt.s.wu    fa6, s6
                  fsgnj.s      fa1, ft10, ft4
                  ori          zero, gp, 529
                  fsgnj.s      fa5, ft7, fs10
                  rem          t6, a3, s8
                  fmul.s       fa0, fa5, fs4
                  fclass.s     s8, fa7
                  fdiv.s       fs4, ft3, ft3
                  and          a7, a4, ra
                  fclass.s     s7, ft9
                  flt.s        a0, fs2, fs7
                  slt          sp, gp, a6
                  divu         a4, t1, s1
                  fcvt.s.w     ft11, a4, rtz
                  and          s4, t1, a0
                  fcvt.w.s     a0, ft7, rup
                  fmax.s       fs0, ft11, fs9
                  lui          s6, 600358
                  xor          t4, a6, gp
                  fmin.s       fa3, fs3, ft0
                  feq.s        t6, fa0, ft10
                  addi         s5, a1, -1147
                  fcvt.wu.s    t3, ft6
                  xori         t4, s0, 1188
                  fsgnj.s      fs3, fs0, ft1
                  fle.s        t1, ft6, fa5
                  auipc        gp, 395665
                  lui          s3, 35852
                  xori         t6, s2, -1504
                  sll          s8, s1, t5
                  fsgnj.s      fs6, ft9, ft11
                  srl          s2, tp, gp
                  slt          s4, zero, ra
                  fdiv.s       ft11, ft6, fa3
                  remu         t0, s10, t1
                  mulhu        a7, s0, s1
                  fcvt.wu.s    a4, fs4
                  div          a6, s7, tp
                  fsgnjx.s     ft1, fa3, fs9
                  mulh         s11, a7, s10
                  sra          a6, s2, a0
                  fsub.s       fa2, fs5, ft2, rup
                  fle.s        s7, ft4, fs11
                  fcvt.w.s     t6, fs2
                  fmv.x.w      s0, ft8
                  and          s0, s6, zero
                  rem          gp, zero, t4
                  slti         s4, s0, 1383
                  xori         s5, sp, 796
                  fmax.s       ft7, ft8, ft6
                  fcvt.w.s     s11, fs4
                  feq.s        zero, fs0, ft3
                  flt.s        s3, ft7, fa7
                  and          t5, s2, a4
                  fle.s        t4, fa6, fa6
                  addi         t6, a3, 1061
                  fle.s        a2, ft11, ft5
                  and          sp, a2, s11
                  andi         t2, a4, -683
                  fsgnjn.s     ft3, fa2, fs8
                  fmv.x.w      zero, ft8
                  sra          a0, s5, a1
                  fmv.w.x      fs8, s0
                  slti         t5, t4, 215
                  add          zero, s8, tp
                  xor          t0, t5, s6
                  fclass.s     s7, fa6
                  xori         sp, gp, -1625
                  or           s0, s2, t3
                  slt          a7, s7, s11
                  or           s0, s10, ra
                  slli         t3, t5, 23
                  andi         t2, a7, 1895
                  fsgnjx.s     ft4, fa4, fs6
                  mulhu        s8, a7, gp
                  div          s6, a5, zero
                  ori          s4, a7, 1139
                  fcvt.wu.s    s1, fa2, rne
                  fcvt.s.w     ft9, s5
                  lui          s6, 728306
                  mulhsu       a5, s8, s9
                  fsub.s       fs1, ft9, fa2
                  or           gp, t1, s1
                  fle.s        a2, fa1, ft7
                  auipc        t6, 659423
                  nop
                  ori          t1, a4, -724
                  addi         t1, gp, -692
                  fcvt.s.wu    fs4, a4, rdn
                  sub          a4, s11, a4
                  fmul.s       ft5, ft4, fs1, rmm
                  fmin.s       fa2, fs1, ft8
                  fcvt.wu.s    t5, fs9
                  mulh         a4, t1, a1
                  fsgnjx.s     fs7, fa6, fs9
                  fcvt.w.s     s3, fa3
                  sltiu        s4, a2, -2016
                  fcvt.s.wu    fa0, s8
                  slti         a4, a3, 181
                  lui          t5, 55410
                  sra          s3, t6, ra
                  srl          t6, s10, s5
                  andi         s8, a6, -435
                  fsgnjn.s     ft3, ft11, ft4
                  add          t2, s0, t6
                  mul          a4, a3, a1
                  add          t4, zero, a5
                  mulhsu       t4, s6, a6
                  mulhu        a5, a7, zero
                  addi         s0, a7, 1528
                  fcvt.wu.s    s4, fa7
                  srl          s2, t2, s9
                  div          gp, s4, t3
                  fsgnjx.s     ft6, fs9, fs6
                  sltu         t3, t2, a5
                  mul          t0, t4, gp
                  fmv.w.x      ft5, s7
                  sra          a2, t0, t2
                  sra          a0, s7, a4
                  fcvt.s.w     fs8, ra
                  slt          s1, zero, tp
                  feq.s        s7, fa7, ft0
                  andi         t6, t5, 124
                  fle.s        a3, fa6, fs11
                  xor          s6, s4, t4
                  xori         s2, a6, -78
                  rem          a0, t3, t5
                  fdiv.s       fa6, fa3, ft2, rne
                  slti         sp, s5, 538
                  addi         s2, s4, 267
                  lui          gp, 112287
                  mulhu        s10, t1, s4
                  sub          t4, s4, s2
                  xor          s8, a4, sp
                  fcvt.s.w     fs0, s6
                  srli         s7, t5, 25
                  ori          t2, a0, -1766
                  fmul.s       ft3, fs7, fa5, rup
                  fdiv.s       ft11, fa7, ft10, rup
                  andi         s4, t2, 1067
                  fsqrt.s      ft11, fa3
                  srl          zero, a4, s5
                  fsgnj.s      fs7, fs2, ft10
                  or           zero, s10, t5
                  fcvt.s.w     ft3, s1
                  fle.s        s2, fs4, ft7
                  srli         t1, gp, 17
                  sll          a7, zero, gp
                  nop
                  fcvt.s.wu    fa7, a1
                  and          a0, a0, s10
                  fclass.s     t6, fa0
                  fmax.s       fa3, fa1, fa0
                  srl          s7, s3, a6
                  fle.s        gp, ft6, ft1
                  flt.s        gp, fs0, ft3
                  sltiu        s7, s8, 387
                  sra          gp, a6, s9
                  fcvt.w.s     s0, fa2
                  fcvt.s.wu    ft9, gp
                  xor          gp, a2, s2
                  slti         t0, a7, -1155
                  fsgnjn.s     fa7, fs5, fa5
                  sltiu        a3, s9, -1054
                  slti         zero, s11, -1934
                  sra          s4, t2, s6
                  divu         a1, t0, s1
                  fcvt.s.wu    ft5, a1
                  feq.s        t5, ft11, fa2
                  srl          s10, a3, s7
                  fmul.s       fs8, fs8, fa3
                  fmul.s       fs0, ft3, fs6
                  mulhu        zero, s3, a7
                  auipc        s6, 697254
                  fmin.s       fs8, fs11, fs9
                  nop
                  add          s5, s11, t2
                  srai         t3, a3, 22
                  andi         s7, s2, 2026
                  fmul.s       fs6, ft11, fs7
                  sra          a5, t5, a6
                  rem          a7, t2, s8
                  slli         t6, s6, 20
                  sltiu        a6, t6, 1373
                  fsqrt.s      fa2, fs4, rdn
                  and          t0, s1, ra
                  mulhu        a6, zero, s4
                  fcvt.w.s     t6, fs7
                  fmv.x.w      zero, fa3
                  fdiv.s       fs10, fs3, fs0, rne
                  divu         t4, s11, a5
                  sltiu        s11, gp, -99
                  auipc        s8, 174278
                  fcvt.s.w     fa6, a0, rdn
                  fsqrt.s      ft2, fs9, rne
                  or           t0, ra, sp
                  slt          s4, s2, a0
                  remu         t2, a3, a6
                  fmv.x.w      t5, ft7
                  and          a7, s1, s2
                  flt.s        s8, ft5, ft4
                  auipc        t6, 167476
                  addi         a3, s6, 186
                  fadd.s       ft5, ft5, fs4
                  rem          t0, s10, a5
                  xor          t2, s1, s2
                  fcvt.wu.s    t3, fs1
                  lui          t5, 480963
                  ori          t3, a4, 33
                  fadd.s       fs11, fs10, fs2, rtz
                  ori          t3, s7, 404
                  fsub.s       ft1, fa2, fs8, rdn
                  fsgnjx.s     fs11, fs11, fs7
                  xor          a4, a4, s5
                  and          a5, a7, s4
                  andi         s3, a1, 1942
                  srai         a2, s0, 11
                  xori         t1, a3, -452
                  fadd.s       fa7, ft2, fs5, rdn
                  andi         t6, tp, 564
                  fcvt.w.s     t6, ft7, rne
                  slt          t3, s10, zero
                  or           a5, s5, s3
                  fmul.s       fs11, ft7, ft3, rup
                  remu         t3, s10, zero
                  fcvt.s.w     fa4, s9, rdn
                  mulhsu       s6, t2, t2
                  slli         a0, t6, 5
                  sltu         t4, t2, s10
                  fcvt.s.wu    fa1, gp, rmm
                  add          zero, s7, s11
                  andi         t2, s0, -1254
                  fcvt.s.w     fa1, a4, rup
                  mulhu        s6, s8, s5
                  fcvt.s.wu    fs2, s1
                  sra          t1, t1, tp
                  fcvt.w.s     s11, fa4
                  mul          t5, a1, gp
                  fsgnj.s      fs8, fa3, fa5
                  slt          s7, a6, s5
                  feq.s        s5, ft7, fs5
                  fsgnj.s      fs10, ft7, fs2
                  fmin.s       ft8, fs7, fa7
                  sll          s2, gp, a0
                  auipc        s4, 571293
                  fcvt.s.w     fs10, s11, rtz
                  srl          sp, a0, ra
                  fmul.s       fs0, ft10, fs5, rtz
                  mulhsu       gp, gp, s7
                  xor          a4, t0, s1
                  lui          t3, 549731
                  sra          s3, s6, t2
                  fmv.w.x      fa6, tp
                  fcvt.w.s     s11, fs0, rne
                  fmv.w.x      ft10, a1
                  sll          t0, t6, s1
                  slli         a2, sp, 11
                  divu         a3, a0, a0
                  fsgnjn.s     fs4, ft11, fa6
                  fmin.s       fs1, ft7, fs3
                  fclass.s     t1, fs1
                  sub          sp, sp, s3
                  ori          a4, zero, -1744
                  mul          s7, s8, s7
                  feq.s        a0, fs2, fs7
                  srai         s5, s0, 5
                  sll          s3, tp, a4
                  mulhsu       t0, a7, s6
                  sltiu        t1, gp, 1592
                  fadd.s       ft2, fs6, fa5, rmm
                  slt          s1, t6, s7
                  mulhsu       s5, a4, t2
                  slt          s4, a4, t1
                  nop
                  flt.s        sp, fs5, ft5
                  flt.s        s10, fs4, ft6
                  sra          t5, zero, t2
                  sra          a4, a5, s9
                  sltu         s3, s5, tp
                  remu         t5, t4, a0
                  fcvt.s.wu    fa5, s5, rne
                  fle.s        t3, fs0, ft7
                  or           a5, s2, gp
                  fsub.s       ft10, fs6, fa7, rup
                  slli         sp, t3, 23
                  fsgnjx.s     fa7, fs11, fa7
                  add          a7, t1, s3
                  fcvt.w.s     t1, fs8, rne
                  fmv.x.w      t2, ft5
                  fmv.w.x      fa0, s8
                  slti         s5, a7, 1398
                  fcvt.wu.s    a0, ft3, rdn
                  div          a0, sp, gp
                  rem          zero, s2, t2
                  remu         a7, t6, ra
                  fmv.w.x      ft7, s5
                  fadd.s       ft2, fa6, fs2
                  sra          a6, a7, a4
                  rem          s6, s1, s5
                  andi         t2, s6, -1933
                  fclass.s     a0, fs3
                  srli         a7, a4, 5
                  fcvt.s.wu    fa2, s0, rdn
                  addi         s5, s11, -1382
                  ori          t0, sp, 545
                  xori         s0, s2, 259
                  fsqrt.s      ft10, fs7, rne
                  fdiv.s       fa4, ft5, fs3
                  fsgnj.s      fs1, fs8, fs6
                  xor          a3, s4, s7
                  divu         s8, gp, t2
                  fle.s        t5, fa5, ft0
                  addi         s2, s11, -671
                  addi         s3, ra, -2048
                  xor          t6, t2, s10
                  fclass.s     s5, ft1
                  slt          a4, s1, s8
                  and          t6, t6, ra
                  fmin.s       ft10, fa5, ft8
                  fclass.s     a1, fa2
                  fadd.s       fa4, fs7, ft4
                  fmax.s       fs4, ft2, fa5
                  mulh         s0, s9, a6
                  fmv.x.w      s11, fa7
                  nop
                  fdiv.s       fa4, ft0, ft7, rne
                  remu         t5, s9, s1
                  fmax.s       fs5, fs3, fa4
                  fsgnjx.s     fs3, fs0, fa5
                  fmax.s       ft9, fa6, fa0
                  fmv.x.w      t0, fa2
                  fmv.x.w      s2, ft4
                  addi         sp, t3, 1720
                  mulh         s1, t5, t3
                  feq.s        gp, ft5, ft5
                  fmax.s       ft2, ft11, fs1
                  fmul.s       fs8, fs9, ft5, rne
                  divu         a4, s1, a4
                  fcvt.wu.s    gp, ft7
                  slti         a2, t1, 1526
                  fmv.x.w      t5, ft11
                  mul          a7, s1, s7
                  xor          t6, s9, s11
                  and          a5, gp, t0
                  addi         t0, s6, 206
                  fcvt.s.w     fs5, a4
                  auipc        a4, 1008803
                  xor          a6, t5, sp
                  fsgnjx.s     ft1, fa1, ft2
                  fsgnj.s      ft11, fs6, fa5
                  auipc        a4, 751733
                  or           s1, sp, a3
                  srai         a1, a4, 3
                  fmul.s       fa0, ft3, ft4, rdn
                  slt          s10, sp, t0
                  sub          s7, s0, t5
                  sll          s3, s10, t1
                  rem          a1, a6, t5
                  srli         a0, t2, 10
                  fcvt.s.w     fs4, a7
                  div          s2, ra, s1
                  sll          s4, t2, a1
                  auipc        s0, 455830
                  slti         s6, t4, -661
                  fle.s        t6, fs11, fs1
                  fcvt.w.s     s6, fa5, rne
                  or           t4, t5, s2
                  fsgnj.s      fs7, fa3, fs10
                  fle.s        t1, fs4, fa7
                  fsub.s       fa6, fs4, fa5, rdn
                  nop
                  fmul.s       ft0, ft0, fs10, rdn
                  srai         gp, a0, 2
                  fmul.s       fs0, ft10, ft1
                  add          zero, a0, a6
                  fsgnjx.s     fs6, ft7, fs1
                  add          t4, tp, s6
                  mulh         s7, s10, s1
                  fcvt.w.s     a2, fs1, rup
                  slt          s8, s3, s9
                  mulh         s2, ra, ra
                  mulhu        t4, s2, s11
                  rem          a4, ra, s5
                  srli         t4, sp, 10
                  sll          s4, s10, a2
                  slti         t6, t0, 481
                  sltiu        t6, s11, -1599
                  andi         t3, t6, 1503
                  remu         a5, t1, s3
                  ori          t0, s0, -569
                  ori          a1, s4, 527
                  fcvt.wu.s    s10, ft10
                  mulh         t3, s5, a0
                  slt          t4, ra, t1
                  mulhsu       s10, s11, t4
                  divu         s6, t0, t0
                  fsqrt.s      fa2, fs10
                  fmin.s       fs0, ft9, fs5
                  fcvt.wu.s    sp, fa0
                  xor          a0, s10, a4
                  rem          t2, t5, s9
                  mulhsu       a3, s2, a0
                  slt          a1, s8, a4
                  sub          a6, s0, a4
                  ori          s10, zero, -934
                  remu         t0, zero, s4
                  andi         a2, t6, 632
                  fsgnjn.s     ft4, fs1, fs0
                  fmv.x.w      s3, fa1
                  fmax.s       ft7, fs9, fa5
                  nop
                  srai         s4, tp, 13
                  fmax.s       ft1, fs2, fs1
                  fcvt.wu.s    s7, ft8, rne
                  flt.s        a2, fs4, fa7
                  rem          s2, sp, s8
                  fmul.s       fa4, ft2, fs9, rdn
                  fsub.s       fs10, fs2, ft4, rdn
                  fadd.s       fs1, fs3, fa5, rtz
                  srai         t6, s1, 24
                  fsgnj.s      ft6, fs9, ft10
                  add          s1, t5, ra
                  fsub.s       ft3, ft5, fa5, rmm
                  fadd.s       fa7, ft0, fa4, rup
                  fle.s        s0, fa3, fs1
                  slli         s2, a3, 14
                  xor          t6, a6, a0
                  mulh         a7, t0, s2
                  auipc        zero, 561671
                  mulh         t2, t5, t3
                  fsqrt.s      ft6, fs2
                  sltu         s10, gp, zero
                  srl          s7, s10, s10
                  fcvt.wu.s    t1, fs7
                  fcvt.s.wu    fs8, zero, rup
                  mul          s6, a0, t3
                  fmax.s       ft11, fs10, fs0
                  or           t2, a7, s0
                  fsqrt.s      fa1, ft10
                  add          s4, s3, s8
                  add          s7, t3, a0
                  fsgnjx.s     ft11, fa0, fs9
                  auipc        s3, 63485
                  fmv.w.x      ft10, a6
                  feq.s        s6, fa6, fa3
                  srli         s6, a6, 17
                  xori         t5, tp, 583
                  ori          a0, a4, -1230
                  add          s5, s2, ra
                  slti         s11, a2, 620
                  srai         t4, zero, 11
                  fsub.s       fa5, fa1, ft1, rup
                  fsub.s       fs5, fs10, fs7, rmm
                  srl          s5, zero, t3
                  fsgnj.s      ft0, fs2, fs6
                  mulh         s8, a6, a6
                  slli         t2, ra, 28
                  feq.s        s6, ft7, ft11
                  sltiu        s4, gp, 311
                  srl          s10, ra, s9
                  fcvt.wu.s    s2, fs7
                  fmul.s       ft0, ft10, fs6
                  slli         t2, a0, 10
                  xori         s4, s11, -873
                  fcvt.wu.s    a2, fs1, rmm
                  and          a2, a5, s3
                  fclass.s     t6, fs10
                  fdiv.s       fs1, ft11, ft11
                  sra          s10, t3, s7
                  srl          s0, t5, s2
                  sub          zero, s11, t5
                  fcvt.wu.s    a4, fa5, rup
                  sltu         s5, a1, s9
                  div          a2, a1, s7
                  fsgnj.s      fs9, fs3, ft5
                  fdiv.s       fs9, ft10, fs4, rup
                  fsgnj.s      fs11, fs8, fa4
                  srai         s6, s11, 21
                  fclass.s     a2, fa4
                  div          s11, s3, s1
                  andi         s6, s11, 77
                  divu         a6, s10, s7
                  fmv.x.w      s5, ft9
                  flt.s        t1, ft4, fa2
                  fsgnjx.s     fs7, fa1, fa6
                  fmul.s       fs3, fs8, fs1, rup
                  mulhu        a6, s4, t2
                  sub          a3, a3, s8
                  xor          s5, a5, a4
                  sltu         zero, sp, a0
                  sltiu        a6, a2, -302
                  fdiv.s       fs5, fs9, fa5, rmm
                  sra          t3, t6, sp
                  div          a6, a1, s6
                  slli         a5, s2, 27
                  andi         zero, a7, -1807
                  sltiu        t6, s2, -1587
                  divu         a2, tp, s5
                  slt          t5, tp, s11
                  andi         zero, s5, -1021
                  slti         a0, s3, 1001
                  sra          a2, t1, s3
                  fsgnj.s      ft6, fs9, ft10
                  andi         a7, ra, -1457
                  slt          t4, s10, tp
                  nop
                  srl          s0, t4, t1
                  slt          t4, s11, t5
                  xor          t6, a4, t4
                  fmv.x.w      t6, ft6
                  sub          t5, s3, sp
                  or           s11, ra, t4
                  fadd.s       fa6, fa2, fs6, rdn
                  fmv.w.x      fa7, s5
                  addi         zero, t0, -1009
                  fmv.x.w      s3, fa0
                  slti         a5, s3, -1362
                  mulhu        a5, s7, sp
                  srli         a7, s11, 14
                  mul          s0, a4, s7
                  xori         sp, s6, 41
                  fmin.s       fa0, fs0, fa3
                  remu         s10, s0, t1
                  flt.s        a6, ft8, fs10
                  fcvt.s.w     fs11, a6, rdn
                  sub          s2, t5, s4
                  fmul.s       ft6, ft4, fa2
                  fmin.s       ft7, fs9, ft8
                  feq.s        s2, fs4, ft0
                  fsgnj.s      ft0, fa1, fa0
                  flt.s        t4, fs2, ft7
                  fadd.s       ft7, fs3, fs4
                  sra          a5, t6, a7
                  add          a6, s1, s0
                  feq.s        t6, fs0, ft8
                  mulhsu       s10, s2, s5
                  xor          t5, a2, a0
                  sltu         s6, sp, tp
                  fcvt.s.w     fa4, s6, rup
                  fmin.s       fs3, ft7, fs8
                  srl          t0, a2, sp
                  flt.s        s6, ft4, fs9
                  sra          a3, a5, sp
                  slti         t3, a6, 1391
                  mulhsu       s3, gp, a0
                  fmin.s       ft10, ft3, fa6
                  fcvt.s.w     ft3, s0
                  flt.s        a5, fs7, fa6
                  fsgnjn.s     fa3, ft4, ft4
                  rem          zero, s2, zero
                  fmul.s       fa0, ft6, ft9
                  fmv.w.x      ft5, s2
                  fmv.x.w      s4, fa2
                  fadd.s       ft3, ft8, fs11
                  sll          a1, zero, t3
                  fmv.x.w      a0, fs0
                  fcvt.s.w     fs9, t4, rup
                  slli         t6, t4, 20
                  slti         gp, s7, -384
                  lui          s4, 206247
                  sll          t2, s1, s8
                  slt          s6, a5, s6
                  remu         a7, a2, s1
                  fcvt.s.w     fs9, t4
                  fmax.s       fs5, fa3, fa5
                  rem          s7, zero, s2
                  srli         t0, t4, 15
                  fcvt.w.s     t5, ft3, rne
                  addi         s4, a7, 926
                  fle.s        s4, fs9, ft2
                  srl          a5, sp, a1
                  sltu         s0, s5, t5
                  srai         s1, s10, 24
                  srli         s0, s3, 11
                  sll          a2, a2, a4
                  xori         t1, a2, 956
                  mul          s5, s2, s4
                  flt.s        s7, fa7, fa4
                  flt.s        zero, fs5, fa2
                  add          s5, zero, a1
                  xori         sp, s10, -1470
                  fmv.w.x      ft6, t4
                  fmin.s       ft0, ft8, fs4
                  and          a2, t4, t0
                  fdiv.s       fs9, ft5, fs6, rne
                  fcvt.wu.s    s3, fs5
                  fmv.w.x      fs7, a7
                  divu         s4, a5, a6
                  mul          s2, t2, a1
                  fmin.s       fs9, ft11, fa6
                  xori         a7, s10, -799
                  fle.s        zero, ft3, ft3
                  slli         s6, t1, 22
                  and          s2, s0, a1
                  fcvt.s.w     ft4, s3
                  fcvt.s.w     ft3, t0, rdn
                  fsgnj.s      fa1, fs9, fs3
                  fclass.s     s8, ft10
                  sltiu        t0, a5, 729
                  fmin.s       ft6, fa0, fa5
                  remu         t3, s8, s10
                  fsqrt.s      fs4, ft5, rdn
                  fmin.s       ft8, ft10, fs2
                  mulhu        zero, s0, s10
                  fcvt.s.wu    fs4, ra, rmm
                  srai         t1, t2, 3
                  sltu         a0, t5, gp
                  and          a4, t0, zero
                  fmax.s       fa0, ft5, fa7
                  fmv.x.w      t3, fs3
                  fcvt.wu.s    gp, fs11
                  fmv.w.x      fa6, sp
                  fsgnjx.s     ft7, fa2, ft2
                  fsub.s       ft4, fs4, ft6, rdn
                  srai         sp, a7, 31
                  sub          s3, s8, a7
                  rem          s3, s0, s0
                  fmv.x.w      t2, fs5
                  fsqrt.s      ft7, fs6
                  fmul.s       ft10, fa0, fs8
                  add          a2, a7, t2
                  sltu         a5, s11, t1
                  auipc        s7, 986590
                  div          s8, a6, s0
                  nop
                  sltiu        sp, a3, 273
                  fdiv.s       fs4, fa6, fa1
                  fcvt.s.w     fs3, s7, rne
                  mulh         sp, s11, t2
                  add          t1, t6, a3
                  sra          a5, s9, s9
                  lui          s3, 210841
                  srl          a1, t6, s1
                  srl          s8, t3, zero
                  fmax.s       ft11, fs9, ft3
                  srai         t4, s2, 31
                  div          s5, t5, s9
                  addi         a7, a3, -1927
                  ori          t0, s2, 828
                  fmul.s       fs3, ft2, ft9, rdn
                  mulh         t2, a0, s11
                  fadd.s       ft9, ft6, ft3, rtz
                  divu         s5, ra, s10
                  fcvt.s.wu    fs7, a1
                  srai         a5, ra, 11
                  mul          t2, zero, s9
                  fmul.s       fs0, fs2, fs0, rmm
                  or           a1, s11, t2
                  slt          a4, tp, t2
                  fcvt.wu.s    a0, fa4
                  flt.s        t0, fs9, fs7
                  fsgnj.s      fs0, ft3, ft10
                  ori          a3, t1, 2015
                  fdiv.s       fa5, fs11, ft9
                  srl          s0, s1, tp
                  fle.s        gp, ft0, ft11
                  sll          gp, tp, gp
                  fcvt.w.s     a3, fa7
                  fcvt.wu.s    s4, ft8, rne
                  sll          s11, t1, s7
                  lui          zero, 41848
                  fsgnjn.s     ft6, fs8, fs9
                  slt          s10, s0, a1
                  xori         s7, ra, 1345
                  sltiu        s8, t1, -533
                  flt.s        a1, fa2, ft5
                  slti         a1, ra, -1658
                  fclass.s     sp, fa6
                  sub          a3, s6, t2
                  nop
                  fmv.w.x      fs8, a7
                  mulhu        t4, t2, a4
                  fsgnjn.s     fs3, ft1, ft8
                  fcvt.s.w     ft5, s6, rne
                  or           s1, sp, a6
                  fmin.s       ft3, ft8, fa1
                  fsgnj.s      fa2, fs0, fa5
                  or           t2, s11, a5
                  xor          a4, sp, zero
                  srl          a4, t0, s7
                  slt          t0, t6, s8
                  fmv.x.w      t3, fs10
                  srai         s11, s9, 31
                  fsqrt.s      ft7, ft5, rdn
                  fsgnjx.s     ft1, fs7, fa3
                  nop
                  divu         t3, ra, s0
                  fadd.s       ft6, fs2, fa4
                  fadd.s       ft0, fs7, fa4
                  srai         t1, t4, 28
                  auipc        s10, 878296
                  fsgnjx.s     fa7, fs1, ft4
                  and          a1, a7, s4
                  flt.s        s3, ft10, ft5
                  sltiu        a3, t2, -308
                  fsgnjx.s     ft0, fs4, fs2
                  fmv.w.x      fs0, s9
                  rem          a4, a2, a1
                  fdiv.s       fs2, fs6, fs10, rup
                  remu         a6, s1, a4
                  ori          s2, t5, 53
                  addi         s8, t3, 1763
                  fcvt.s.wu    ft10, t6, rne
                  fadd.s       fs9, fs8, ft3, rdn
                  mulh         t6, a4, t4
                  mulhu        a2, s3, a0
                  mul          s8, s0, s11
                  fcvt.s.w     ft10, t0, rup
                  fmv.x.w      s4, fs0
                  fcvt.w.s     s6, fs1
                  xor          s1, t0, a6
                  fsgnjn.s     ft6, ft4, ft5
                  sll          a1, s7, a6
                  add          t6, s11, s5
                  and          s10, t3, s0
                  lui          a7, 186994
                  rem          s6, s4, s6
                  ori          sp, s4, 707
                  fsgnjn.s     fs3, ft7, fa2
                  fsub.s       fs11, fs1, fs3
                  feq.s        s2, fs3, fs1
                  fcvt.s.wu    fs2, gp, rtz
                  fmul.s       fa6, fa4, fs3, rtz
                  fsgnjx.s     ft11, fa3, fa1
                  add          s4, a2, s11
                  fsgnj.s      ft4, ft5, ft0
                  flt.s        s7, fa7, fa3
                  fmax.s       fa7, fs6, fa5
                  fsgnj.s      fs1, fs9, fs3
                  fadd.s       ft5, fa7, ft7
                  fsgnjn.s     fa7, fa0, ft9
                  fcvt.s.w     ft0, t2, rmm
                  slti         s8, s1, 721
                  slt          s4, s8, s3
                  fmul.s       fs4, fs3, fs11
                  fadd.s       fs3, fs3, fs7
                  srli         s11, sp, 7
                  slti         sp, t2, 310
                  fmv.w.x      ft8, t1
                  fmax.s       fa6, ft3, ft1
                  srli         s3, a5, 12
                  rem          s7, t5, s8
                  auipc        s0, 834285
                  slti         t0, s11, -1248
                  fcvt.s.wu    ft6, tp, rmm
                  fmax.s       fs4, ft1, ft1
                  slti         t4, t4, -932
                  nop
                  fmin.s       fs5, ft8, fa4
                  and          s3, t1, zero
                  fmin.s       fa5, fs9, fa1
                  slli         s7, a7, 21
                  addi         s1, t0, -208
                  fcvt.wu.s    a3, ft6
                  fmv.x.w      s10, fs0
                  rem          s2, s5, zero
                  fclass.s     a1, fs11
                  fcvt.wu.s    gp, fa6, rne
                  fdiv.s       ft1, fs4, ft9, rup
                  fclass.s     a0, fs0
                  and          s5, s3, tp
                  fsgnjn.s     ft10, fa1, ft0
                  xor          s10, s8, zero
                  sltu         t6, t1, ra
                  srli         a7, s7, 28
                  sll          a6, a0, tp
                  fcvt.s.wu    fs7, s2, rup
                  fcvt.s.wu    ft10, tp, rne
                  slti         s7, s11, -1475
                  rem          t4, sp, s5
                  fdiv.s       ft0, fs5, fs9
                  srli         t1, a6, 0
                  srli         s6, t3, 18
                  fdiv.s       fs5, ft6, ft11
                  mulh         s7, zero, s5
                  sltiu        t0, a5, -2
                  fsgnj.s      ft1, fs1, ft7
                  fclass.s     s7, ft6
                  ori          a3, a1, 1790
                  fcvt.w.s     sp, fs10, rmm
                  srl          a2, t4, t6
                  sltiu        t0, s4, 1640
                  sra          s7, tp, tp
                  srl          t3, a7, s3
                  mulh         s11, s9, s2
                  sra          t2, sp, t3
                  divu         gp, a7, s6
                  fsgnjn.s     ft2, ft7, fa1
                  fsgnjn.s     fa2, fa2, fa4
                  sub          a5, t4, s8
                  slti         s5, sp, 1956
                  fle.s        s10, fs10, fs1
                  fmax.s       ft1, fs7, fs9
                  fmax.s       fs6, fs7, fa1
                  fle.s        t4, fs7, fa6
                  add          a6, s3, a0
                  or           s10, s5, t6
                  remu         a0, s10, a6
                  auipc        t5, 760187
                  fmv.x.w      a7, fa5
                  nop
                  fcvt.s.w     fa0, zero, rmm
                  or           s3, a6, s0
                  fsqrt.s      fa6, ft0, rup
                  nop
                  fcvt.wu.s    t1, fs8, rtz
                  fclass.s     zero, ft9
                  srl          t0, t2, tp
                  ori          s1, a3, -472
                  lui          gp, 539150
                  mulh         t6, t3, t1
                  mulhsu       s7, t3, s5
                  mulhu        t2, a4, s3
                  fsgnj.s      fs4, fa1, ft2
                  fsgnjn.s     fs9, fs5, fs6
                  sub          a5, a0, s3
                  fsqrt.s      fs3, ft3, rdn
                  rem          s6, t5, s3
                  slti         zero, a1, -603
                  fsgnjn.s     fs1, ft2, fa4
                  fmv.x.w      a1, fs6
                  mulhu        t6, a2, s10
                  fcvt.s.wu    fa4, a6, rne
                  xori         t3, a2, 1678
                  fsub.s       fs7, fa0, fs7
                  sltiu        a0, ra, 573
                  slt          sp, a4, a7
                  fcvt.s.w     ft10, a5
                  fsgnj.s      fs3, fa7, fs2
                  fsgnj.s      ft0, fa4, ft8
                  and          a5, a2, a4
                  slt          s3, a4, a7
                  lui          t6, 814950
                  fsgnjn.s     fs5, fa2, fa2
                  sll          a1, s8, a7
                  lui          s11, 729126
                  xori         t1, s5, 14
                  fle.s        s4, ft9, fa5
                  feq.s        t3, fs4, ft9
                  srai         a0, s10, 24
                  flt.s        a7, fs2, ft10
                  feq.s        t4, fa7, fs6
                  srai         s3, s9, 15
                  fdiv.s       fa6, fs2, fs7, rdn
                  sltu         s1, s4, a5
                  fmv.x.w      a0, fs11
                  xori         a3, a0, 592
                  slli         a2, sp, 5
                  fmv.x.w      sp, ft2
                  mulhu        s1, t6, zero
                  fsgnjn.s     ft8, fa0, fs1
                  or           gp, t5, sp
                  auipc        t2, 361321
                  fclass.s     t6, fa5
                  fcvt.s.wu    ft1, s7, rmm
                  fcvt.s.w     ft9, s6
                  fdiv.s       ft1, fa3, ft5, rdn
                  fcvt.s.wu    ft1, ra
                  mulhsu       gp, s2, s10
                  fsub.s       ft9, fs5, fs1, rne
                  fcvt.wu.s    t5, fs7, rup
                  fcvt.w.s     t2, ft7, rup
                  fsgnjx.s     ft0, fa6, fa3
                  ori          t2, a7, -1766
                  and          s2, a1, s9
                  fdiv.s       ft11, fa1, ft10
                  slt          t5, t6, s5
                  slti         sp, a7, 955
                  add          s1, s7, s10
                  fcvt.s.wu    fa5, t5, rtz
                  fmul.s       fs4, ft10, fs4, rup
                  rem          t6, ra, t4
                  fsgnjn.s     fs1, fs9, fs3
                  mulhsu       s10, t5, t0
                  fle.s        s6, ft11, fa6
                  srl          s0, t6, sp
                  fsgnjx.s     fa4, fs11, fs10
                  mulhsu       s7, t4, gp
                  fclass.s     s2, ft3
                  lui          sp, 151986
                  auipc        s0, 482860
                  flt.s        s7, ft7, fs6
                  divu         a2, t0, s6
                  fdiv.s       ft0, fs9, fa2
                  fsub.s       fs2, ft5, fa1, rup
                  lui          a0, 303573
                  mulh         sp, a1, s10
                  fcvt.s.w     ft11, a5, rmm
                  srli         t6, s7, 30
                  fcvt.w.s     s0, ft9
                  mulhu        t1, a6, a6
                  fsgnjn.s     fs7, fa5, ft1
                  slli         t2, a0, 11
                  srli         t0, s7, 31
                  fsgnj.s      ft6, fs3, fa1
                  lui          s6, 165780
                  fmv.w.x      fa1, zero
                  nop
                  remu         t6, a2, zero
                  sra          zero, a2, sp
                  sltiu        t3, s6, -1647
                  fadd.s       fs4, fs8, fa0, rup
                  add          t1, a5, a5
                  mulhu        a5, s5, t0
                  fmv.w.x      fs2, t1
                  fdiv.s       ft1, ft10, fa3
                  remu         s4, s6, a5
                  auipc        t4, 760010
                  auipc        s11, 154287
                  fle.s        a0, fs4, ft8
                  lui          a4, 230984
                  mulh         a5, a7, tp
                  feq.s        s10, ft5, fs6
                  fmv.x.w      s4, fa1
                  fsub.s       fa3, ft1, ft11, rmm
                  rem          t2, a5, s6
                  lui          s5, 123518
                  nop
                  xori         t5, t0, -532
                  add          s10, t5, s11
                  auipc        s6, 635301
                  fmv.w.x      fs0, s10
                  divu         a4, gp, t3
                  srl          s2, a0, a4
                  srai         t4, t4, 16
                  fmul.s       fa0, ft9, fs0
                  mul          t3, s5, s2
                  fadd.s       ft3, fa1, fa4, rtz
                  fsgnjx.s     ft4, ft2, fs3
                  slt          s6, t6, t0
                  andi         s5, a7, -278
                  fsub.s       fs1, ft9, ft5
                  and          a7, ra, zero
                  fclass.s     t1, fs7
                  nop
                  fsgnjx.s     fs10, ft5, ft11
                  or           s2, s6, a5
                  fsgnj.s      ft1, ft1, fa5
                  and          t4, s4, a7
                  fcvt.s.wu    fa4, a1
                  sll          s6, s10, a0
                  xor          a3, s1, a0
                  nop
                  mulhsu       a4, s9, t4
                  fcvt.s.wu    fa6, s8, rne
                  fcvt.s.wu    fs0, tp, rup
                  add          t1, a7, a6
                  srai         s2, s10, 10
                  slt          s11, t6, t0
                  fle.s        t4, fs9, ft1
                  mulhu        a0, s6, a7
                  fmin.s       fs5, fs7, fa1
                  fcvt.w.s     a2, ft5, rne
                  xor          s1, a7, s6
                  sltiu        s5, s4, 1877
                  ori          t2, a2, 505
                  srl          s8, ra, zero
                  lui          t0, 725146
                  fsqrt.s      ft0, fa1, rup
                  sltiu        t6, s6, 1446
                  slli         s2, a3, 30
                  and          s3, a3, a0
                  andi         zero, t6, 60
                  xori         s4, a1, -1454
                  mulhu        t2, a7, sp
                  srai         s5, a6, 11
                  xor          s5, t0, s5
                  sub          zero, sp, sp
                  divu         s2, tp, s7
                  slti         s10, a6, -1735
                  fcvt.s.wu    ft6, ra, rdn
                  mul          a7, a1, t6
                  slt          a5, t1, s1
                  fmax.s       ft10, fs10, ft7
                  fsgnj.s      fs8, ft7, ft4
                  add          t1, s9, s8
                  slti         a3, a6, 1706
                  or           s2, s8, t5
                  xori         t0, s7, -983
                  srl          s6, t2, t4
                  feq.s        a7, fa6, fs0
                  mul          s2, sp, a5
                  slt          a1, s6, s2
                  fsgnjx.s     ft0, ft2, fs5
                  xor          a5, t1, s0
                  fsqrt.s      ft2, fs2
                  mulhsu       t4, t6, s0
                  lui          t2, 737160
                  fmin.s       fs8, fs10, fa2
                  fsgnj.s      fs10, fa6, fs3
                  auipc        t1, 815838
                  slt          sp, s9, a0
                  nop
                  fmul.s       fs11, fs0, fa2, rup
                  fmax.s       fs9, ft11, fs1
                  fcvt.wu.s    t4, fa6, rmm
                  fsub.s       fs4, ft0, fs7
                  addi         a0, s0, 327
                  remu         a0, a6, a7
                  sub          s11, s5, tp
                  fmul.s       fa2, ft1, fs0
                  flt.s        s8, fa1, fs8
                  fcvt.w.s     a1, fa7
                  fmax.s       fs11, fa2, fa7
                  addi         a4, gp, -1569
                  flt.s        s6, fs3, ft3
                  sll          t2, s5, s8
                  fmax.s       fa4, fs7, ft11
                  srai         t3, a4, 27
                  srai         s7, a6, 21
                  fsqrt.s      fa3, fa6
                  mul          a1, t0, t3
                  sll          a4, s5, s11
                  nop
                  mulh         s5, sp, a1
                  rem          a5, sp, zero
                  mulh         a2, t2, gp
                  xor          t4, zero, s4
                  mulhsu       a4, t3, a0
                  divu         gp, t2, s11
                  fmul.s       ft7, fa2, fs0, rup
                  fmv.w.x      fs3, t4
                  lui          a7, 629140
                  fcvt.w.s     t1, fs7, rdn
                  mul          s5, s4, a5
                  andi         s2, t3, -1931
                  srai         t0, s10, 20
                  or           a2, t3, a5
                  slti         s7, a3, 1109
                  fle.s        t4, ft10, fa1
                  mulh         s10, zero, t3
                  mulhu        zero, a6, s9
                  fmv.w.x      fs4, t3
                  sra          s4, s7, zero
                  fsub.s       ft4, ft6, fa6, rdn
                  sltiu        s8, tp, 2046
                  sltiu        s3, t5, 703
                  fmax.s       fs6, fa5, ft8
                  or           a6, a6, zero
                  fmv.w.x      fs10, a0
                  fmv.w.x      fs11, s9
                  flt.s        t4, fa1, fs1
                  mulh         a6, s0, s0
                  fcvt.w.s     s5, ft3, rup
                  sra          s10, t6, t0
                  srl          s1, a2, a6
                  xori         sp, t3, 931
                  lui          gp, 181364
                  fsub.s       fa2, fs9, fs2
                  fcvt.s.wu    ft5, a7
                  fcvt.s.w     fa1, sp
                  fdiv.s       ft0, ft6, fs11, rtz
                  andi         s10, t4, -1935
                  fsqrt.s      ft7, ft11, rmm
                  fsub.s       fs11, fs7, ft2, rne
                  fdiv.s       fa7, fa1, fa1
                  mulhu        a1, t2, s8
                  mul          s3, s1, t3
                  ori          s1, s2, -62
                  fsgnjx.s     fs8, ft4, fs1
                  fcvt.wu.s    s4, fa7, rtz
                  fmv.x.w      a2, fs6
                  nop
                  flt.s        a2, fa1, ft8
                  srl          t5, t1, s9
                  andi         a1, s9, -1979
                  fsqrt.s      fs4, ft0
                  fmv.w.x      ft9, s6
                  fcvt.w.s     s10, fs8, rmm
                  ori          gp, a4, 499
                  divu         s3, zero, s8
                  fmax.s       fs9, ft9, fa1
                  sltu         s0, s2, t2
                  nop
                  slt          gp, s1, a0
                  add          a7, s5, t2
                  slti         t2, s10, -301
                  sll          t2, s11, a0
                  xor          t4, t4, s9
                  fmv.w.x      fs3, s4
                  sll          s6, a1, s5
                  fdiv.s       fs0, ft3, fa5
                  sltu         s1, zero, s5
                  slli         s7, zero, 2
                  fadd.s       fs3, fa1, fs7
                  fmv.w.x      fs9, s0
                  fdiv.s       fa2, fs4, ft11, rne
                  srl          a6, a4, a3
                  mulh         t6, s10, t5
                  add          t3, s5, s9
                  fsub.s       fa4, fa0, fa7, rdn
                  sltiu        a4, s2, -727
                  fmv.x.w      s10, fs8
                  feq.s        gp, fa0, ft0
                  feq.s        t1, fa5, ft5
                  fcvt.w.s     a6, fs4
                  srl          a5, t2, t1
                  mulhu        t2, a0, s7
                  fmax.s       fs1, ft6, ft7
                  remu         s0, s8, s9
                  xori         a1, s3, 41
                  add          s8, s1, a0
                  fadd.s       fs10, fs3, fs6
                  fmax.s       fa1, ft11, fa1
                  fsub.s       fa4, fa3, fs4, rdn
                  fmv.w.x      fs9, t4
                  auipc        a6, 973526
                  feq.s        s8, fs6, fs3
                  sra          s7, sp, s0
                  slti         sp, t5, 326
                  andi         s10, t5, 325
                  fsgnj.s      fs8, ft6, fs0
                  fadd.s       fs11, ft4, fa7
                  fmv.x.w      a0, fs1
                  sra          a1, s8, t1
                  andi         t5, t2, -1460
                  mulhsu       a3, s1, s2
                  sra          gp, s3, sp
                  srai         a4, a3, 23
                  fcvt.wu.s    s3, fs3, rne
                  sra          a4, a4, ra
                  sltiu        gp, a4, -387
                  nop
                  fle.s        sp, ft1, fa4
                  sra          s5, a3, s3
                  slli         t2, zero, 8
                  fadd.s       ft9, fs2, ft3
                  fcvt.s.wu    ft9, t6
                  mulhsu       a4, s9, t1
                  sra          s0, a1, zero
                  srl          t2, tp, a7
                  remu         s5, s8, ra
                  nop
                  fsgnjn.s     fs11, fa7, fa1
                  fsub.s       fa4, ft4, ft1
                  andi         a4, s7, 482
                  lui          s5, 2992
                  mul          s10, sp, t4
                  fsgnj.s      ft8, ft5, fa4
                  slt          s8, s4, t1
                  fcvt.s.wu    fa1, s11, rdn
                  sltu         s4, s8, s9
                  slti         a4, a6, -529
                  andi         s6, tp, 1181
                  fadd.s       ft3, fs11, ft4
                  fadd.s       fa7, ft0, fs8, rup
                  srai         a0, s3, 23
                  mulhu        a3, gp, s0
                  fsgnjx.s     ft7, fa1, fa7
                  slli         s5, tp, 1
                  sltu         a2, a4, s0
                  lui          t6, 567616
                  fadd.s       fa7, ft3, ft7, rup
                  addi         t3, a1, 1803
                  andi         a0, s5, -1319
                  rem          t2, t3, s6
                  or           t4, t1, a7
                  fdiv.s       ft3, fs0, fa5
                  or           t1, a6, a0
                  ori          s3, s7, -60
                  fcvt.wu.s    a1, fs9, rtz
                  rem          s2, t1, a4
                  fmv.w.x      fs11, s9
                  sra          s6, s2, t2
                  xori         a0, s8, -1496
                  rem          t2, a1, s5
                  fsqrt.s      ft2, fs5, rne
                  or           s2, ra, zero
                  fcvt.wu.s    a3, fs8
                  fdiv.s       fa0, ft4, fa3
                  fsub.s       fs6, fs8, fa6
                  fmv.w.x      fs9, t1
                  fmax.s       fa2, fs2, ft7
                  sub          s8, a5, s7
                  xor          s8, a7, gp
                  sltiu        a6, s7, 1978
                  nop
                  xori         t6, sp, -564
                  mulh         t6, tp, s0
                  lui          a3, 310735
                  fmv.w.x      ft0, t2
                  rem          t0, s6, zero
                  fcvt.s.wu    fa6, t0
                  fcvt.s.wu    fa1, gp, rtz
                  fdiv.s       fs1, fa7, ft11
                  slti         s7, s8, -279
                  nop
                  fmul.s       fs3, fs8, ft7, rdn
                  fdiv.s       ft9, fa3, fa5, rne
                  srli         a1, a0, 7
                  div          s1, a4, s8
                  divu         s4, gp, tp
                  fle.s        t1, fs7, ft6
                  srai         sp, a4, 3
                  fmul.s       ft7, fs1, fa3
                  andi         a0, a5, -1420
                  andi         s4, zero, 1688
                  fmul.s       fa3, fs11, fa2, rdn
                  fle.s        a2, fs10, fs8
                  mul          s6, t0, t2
                  fle.s        sp, fs2, fs3
                  fsgnj.s      ft0, fs6, fs11
                  fmax.s       ft8, fs6, ft8
                  fsub.s       ft4, ft7, fs3
                  add          a3, a0, a2
                  and          s2, tp, zero
                  fcvt.w.s     a4, ft3, rtz
                  fsgnjn.s     fs0, fa0, ft2
                  sra          t0, s7, t5
                  fcvt.s.w     ft4, s6, rtz
                  fsgnjn.s     fa4, fa7, fa2
                  sra          t0, t1, s7
                  fsgnjn.s     ft10, fs2, ft9
                  fmul.s       fs6, fa6, fs2
                  srli         a5, s4, 24
                  fcvt.w.s     a2, ft1
                  fmul.s       fs9, fa3, fa6
                  xori         a4, s4, 496
                  fsgnjn.s     fs0, fs8, fs0
                  fmv.x.w      a6, fs9
                  fmv.w.x      ft0, ra
                  fcvt.w.s     s1, ft4
                  fmax.s       fs9, fa6, fa3
                  fmv.x.w      s10, fs2
                  fmul.s       fa1, fs3, fs6, rne
                  fcvt.wu.s    s6, fa4, rup
                  srli         zero, zero, 5
                  fdiv.s       fa2, fa4, fa0
                  rem          s11, a5, a4
                  sll          a7, a3, t2
                  flt.s        s4, ft10, fs3
                  fmin.s       ft11, ft8, fs3
                  fmul.s       ft8, fa0, fa0
                  lui          a3, 204061
                  add          sp, gp, a3
                  xor          s7, a2, gp
                  fcvt.w.s     a7, fa4
                  fmax.s       fs11, fs2, ft8
                  or           s6, s11, s0
                  andi         a3, a3, 1126
                  feq.s        t0, fa0, fa1
                  fdiv.s       ft8, fa3, ft8
                  fadd.s       ft0, fs10, ft8
                  fsgnjn.s     fs0, ft9, fa0
                  mul          t2, gp, t3
                  sra          s0, s5, a6
                  fmax.s       fs7, ft3, fa3
                  slli         s0, t4, 18
                  fmin.s       ft0, fa5, ft4
                  fcvt.wu.s    s3, ft3, rne
                  fadd.s       fs3, fs1, ft1, rdn
                  fsqrt.s      fs0, ft10, rmm
                  fmul.s       ft1, ft4, ft5
                  fcvt.wu.s    s7, ft11
                  div          t3, a4, ra
                  or           s6, tp, t1
                  fmax.s       fs6, ft0, fa0
                  sltiu        t6, a1, -1290
                  slt          s8, a1, s8
                  remu         a2, a3, a6
                  sll          s7, t0, a4
                  remu         t3, a0, a0
                  fcvt.w.s     s0, ft2
                  fclass.s     a2, ft11
                  fclass.s     s0, ft3
                  srai         a6, t4, 27
                  sra          t5, a0, ra
                  fmv.w.x      fs6, t4
                  mulh         t4, s10, s3
                  fcvt.w.s     s0, ft8
                  srai         a1, a3, 20
                  div          t3, a1, a4
                  add          t5, zero, t2
                  fsgnj.s      fs0, fs8, fa1
                  addi         a0, s3, -1100
                  mul          a6, gp, t3
                  xor          a1, s1, a0
                  srai         s6, s10, 31
                  slli         a2, s6, 8
                  srl          s4, ra, t2
                  or           t4, zero, a3
                  rem          a3, a4, s0
                  auipc        t4, 887932
                  fmul.s       fs6, fs7, fa5
                  srl          s5, t1, zero
                  srl          a2, s1, s1
                  feq.s        a4, ft1, fa5
                  add          s6, s2, s10
                  add          s0, zero, t2
                  rem          sp, s10, t6
                  sub          a1, a1, s6
                  fmv.w.x      ft10, t6
                  mulh         t1, s8, tp
                  add          a1, s3, t0
                  and          s10, s8, tp
                  xor          s6, s10, gp
                  addi         t5, t0, 118
                  fclass.s     a7, ft7
                  sub          a6, a3, s8
                  fsgnj.s      fa0, fs2, fs11
                  ori          a0, a0, -1181
                  remu         t2, t2, sp
                  andi         s2, t1, -150
                  fmin.s       fs8, fa3, ft10
                  andi         a7, s8, 902
                  or           s2, a1, s9
                  fmv.w.x      ft2, a1
                  fsub.s       ft0, ft5, fs6, rup
                  andi         a5, t3, -1184
                  fdiv.s       fs11, fs2, fa2, rdn
                  fclass.s     s4, fa3
                  lui          t6, 374786
                  fcvt.wu.s    s4, ft2
                  rem          t6, tp, ra
                  fcvt.s.wu    fs1, ra
                  divu         a3, s0, s9
                  srl          gp, s8, s1
                  ori          t6, a4, 584
                  slli         t5, s11, 2
                  rem          s1, s2, a0
                  lui          a1, 1003844
                  sltu         t0, s4, s0
                  srl          s3, s11, a0
                  xor          s7, ra, s7
                  slti         a2, s6, -590
                  slti         t0, s3, 1069
                  divu         t0, a1, t5
                  srli         a4, a5, 29
                  sra          a2, a7, t1
                  fsgnjn.s     ft7, ft5, ft8
                  flt.s        a7, fs5, fa0
                  addi         t1, t0, -1965
                  slli         s7, zero, 18
                  mulh         a7, t1, t6
                  fsqrt.s      ft1, fa7, rup
                  div          t2, s9, s9
                  fsgnjx.s     fs7, ft11, fs11
                  divu         t4, t3, a5
                  sltiu        a1, gp, -381
                  feq.s        a5, fs0, ft2
                  fcvt.wu.s    s11, ft2, rtz
                  fmin.s       fs3, fs4, fs9
                  or           s3, s2, t2
                  srli         s8, s9, 28
                  srli         a3, t2, 10
                  srli         t3, t3, 4
                  fsqrt.s      ft3, ft11
                  sltiu        sp, a7, 224
                  fmv.x.w      s3, ft9
                  addi         s3, s0, -1366
                  fcvt.s.w     fs1, s2
                  lui          a6, 419274
                  remu         s7, t6, s6
                  fadd.s       ft4, fa0, fs11
                  mul          a7, s7, t2
                  srai         s7, t0, 2
                  add          sp, s5, a7
                  fsub.s       fs6, fa5, fs6, rmm
                  srl          t1, s7, s3
                  srai         gp, s9, 19
                  fdiv.s       fs7, ft9, fa3, rtz
                  ori          s8, a7, -758
                  fsgnjx.s     ft5, ft6, ft1
                  divu         s10, s2, a6
                  la x1, test_done
                  jalr x0, x1, 0
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
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_2:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_3:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_4:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_5:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_6:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_7:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_8:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_9:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_10:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_11:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_12:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_13:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_14:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

mmode_intr_vector_15:
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  j mmode_intr_handler
                  1: la x1, test_done
                  jalr x0, x1, 0

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
                  addi x4, x4, -4
                  sw  x25, (x4)
                  add x25, x4, zero
                  addi x25, x25, -128
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  add x4, x25, zero
                  csrr x15, 0x341 # MEPC
                  csrr x15, 0x342 # MCAUSE
                  li x30, 0x3 # BREAKPOINT
                  beq x15, x30, ebreak_handler
                  li x30, 0x8 # ECALL_UMODE
                  beq x15, x30, ecall_handler
                  li x30, 0x9 # ECALL_SMODE
                  beq x15, x30, ecall_handler
                  li x30, 0xb # ECALL_MMODE
                  beq x15, x30, ecall_handler
                  li x30, 0x1
                  beq x15, x30, instr_fault_handler
                  li x30, 0x5
                  beq x15, x30, load_fault_handler
                  li x30, 0x7
                  beq x15, x30, store_fault_handler
                  li x30, 0xc
                  beq x15, x30, pt_fault_handler
                  li x30, 0xd
                  beq x15, x30, pt_fault_handler
                  li x30, 0xf
                  beq x15, x30, pt_fault_handler
                  li x30, 0x2 # ILLEGAL_INSTRUCTION
                  beq x15, x30, illegal_instr_handler
                  csrr x30, 0x343 # MTVAL
                  1: la x1, test_done
                  jalr x1, x1, 0

ecall_handler:    
                  la x15, _start
                  sw x0, 0(x15)
                  sw x1, 4(x15)
                  sw x2, 8(x15)
                  sw x3, 12(x15)
                  sw x4, 16(x15)
                  sw x5, 20(x15)
                  sw x6, 24(x15)
                  sw x7, 28(x15)
                  sw x8, 32(x15)
                  sw x9, 36(x15)
                  sw x10, 40(x15)
                  sw x11, 44(x15)
                  sw x12, 48(x15)
                  sw x13, 52(x15)
                  sw x14, 56(x15)
                  sw x15, 60(x15)
                  sw x16, 64(x15)
                  sw x17, 68(x15)
                  sw x18, 72(x15)
                  sw x19, 76(x15)
                  sw x20, 80(x15)
                  sw x21, 84(x15)
                  sw x22, 88(x15)
                  sw x23, 92(x15)
                  sw x24, 96(x15)
                  sw x25, 100(x15)
                  sw x26, 104(x15)
                  sw x27, 108(x15)
                  sw x28, 112(x15)
                  sw x29, 116(x15)
                  sw x30, 120(x15)
                  sw x31, 124(x15)
                  la x1, write_tohost
                  jalr x0, x1, 0

instr_fault_handler:
                  add x25, x4, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x4, x25, zero
                  lw  x25, (x4)
                  addi x4, x4, 4
                  mret

load_fault_handler:
                  add x25, x4, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x4, x25, zero
                  lw  x25, (x4)
                  addi x4, x4, 4
                  mret

store_fault_handler:
                  add x25, x4, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x4, x25, zero
                  lw  x25, (x4)
                  addi x4, x4, 4
                  mret

ebreak_handler:   
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x25, x4, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x4, x25, zero
                  lw  x25, (x4)
                  addi x4, x4, 4
                  mret

illegal_instr_handler:
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x25, x4, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x4, x25, zero
                  lw  x25, (x4)
                  addi x4, x4, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x15, 0x300 # MSTATUS;
                  csrr  x15, 0x304 # MIE;
                  csrr  x15, 0x344 # MIP;
                  csrrc x15, 0x344, x15 # MIP;
                  add x25, x4, zero
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 128
                  add x4, x25, zero
                  lw  x25, (x4)
                  addi x4, x4, 4
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
