.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x25, h0_start
jalr x0, x25, 0
h0_start:
                  li x2, 0x40001120
                  csrw 0x301, x2
kernel_sp:        
                  la x9, kernel_stack_end

trap_vec_init:    
                  la x2, mtvec_handler
                  ori x2, x2, 1
                  csrw 0x305, x2 # MTVEC

mepc_setup:       
                  la x2, init
                  csrw 0x341, x2

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x2, 0x3800
                  csrw 0x300, x2 # MSTATUS
                  li x2, 0x0
                  csrw 0x304, x2 # MIE
                  mret
init:             
                  li x2, 4286578687
                  fmv.w.x f0, x2
                  li x2, 4286578688
                  fmv.w.x f1, x2
                  li x2, 2139095041
                  fmv.w.x f2, x2
                  li x2, 0
                  fmv.w.x f3, x2
                  li x2, 2143289344
                  fmv.w.x f4, x2
                  li x2, 4286578687
                  fmv.w.x f5, x2
                  li x2, 2139095040
                  fmv.w.x f6, x2
                  li x2, 0
                  fmv.w.x f7, x2
                  li x2, 2139095041
                  fmv.w.x f8, x2
                  li x2, 3306365403
                  fmv.w.x f9, x2
                  li x2, 2139095040
                  fmv.w.x f10, x2
                  li x2, 2143289344
                  fmv.w.x f11, x2
                  li x2, 2139095041
                  fmv.w.x f12, x2
                  li x2, 2143289344
                  fmv.w.x f13, x2
                  li x2, 4286578688
                  fmv.w.x f14, x2
                  li x2, 4286578687
                  fmv.w.x f15, x2
                  li x2, 4286578688
                  fmv.w.x f16, x2
                  li x2, 2143289344
                  fmv.w.x f17, x2
                  li x2, 1207596222
                  fmv.w.x f18, x2
                  li x2, 2150535594
                  fmv.w.x f19, x2
                  li x2, 2153003677
                  fmv.w.x f20, x2
                  li x2, 2148104704
                  fmv.w.x f21, x2
                  li x2, 2139095040
                  fmv.w.x f22, x2
                  li x2, 4286578688
                  fmv.w.x f23, x2
                  li x2, 0
                  fmv.w.x f24, x2
                  li x2, 2139095040
                  fmv.w.x f25, x2
                  li x2, 3819672954
                  fmv.w.x f26, x2
                  li x2, 2153581749
                  fmv.w.x f27, x2
                  li x2, 2143289344
                  fmv.w.x f28, x2
                  li x2, 2139095040
                  fmv.w.x f29, x2
                  li x2, 3601126
                  fmv.w.x f30, x2
                  li x2, 2139095041
                  fmv.w.x f31, x2
                  fsrmi 2
                  li x0, 0x80000000
                  li x1, 0x8dc49075
                  li x2, 0x0
                  li x3, 0xf5a2b05a
                  li x4, 0x0
                  li x5, 0x4
                  li x6, 0x58269207
                  li x7, 0x0
                  li x8, 0xfa8976c5
                  li x10, 0x80000000
                  li x11, 0xf0ce41e0
                  li x12, 0xa0638aef
                  li x13, 0x4
                  li x14, 0xa
                  li x15, 0x5
                  li x16, 0xd
                  li x17, 0xe3eb6e83
                  li x18, 0x80000000
                  li x19, 0xfae51a59
                  li x20, 0xc
                  li x21, 0xf
                  li x22, 0x0
                  li x23, 0xb
                  li x25, 0x0
                  li x26, 0xc
                  li x27, 0xa9ca3f23
                  li x28, 0xa11e092f
                  li x29, 0x80000000
                  li x30, 0x0
                  li x31, 0x0
                  la x24, user_stack_end
main:             srl          a4, t3, a3
                  ori          t2, s0, 1797
                  add          s2, t5, t4
                  sra          s3, tp, s8
                  fmul.s       ft7, fs10, ft1, rup
                  fadd.s       fa7, fa2, ft3, rup
                  fsgnjn.s     ft8, fs4, ft0
                  sra          s10, a2, t3
                  add          t0, tp, a4
                  srli         a5, a7, 19
                  divu         s7, s11, s3
                  slti         s0, t2, -1012
                  auipc        s3, 423164
                  fsgnjx.s     fs11, ft2, fs1
                  fsgnj.s      fa6, ft1, ft10
                  mulhsu       a6, t2, t3
                  fadd.s       ft11, fa3, ft4
                  slli         tp, s6, 13
                  fsub.s       fa5, fs9, fs0, rdn
                  and          t6, a7, a3
                  fmin.s       ft3, fa0, fa5
                  mulhsu       t0, s7, zero
                  ori          s11, a0, 1835
                  flt.s        t6, fa7, ft2
                  fcvt.s.w     fa4, ra
                  nop
                  flt.s        t5, fa2, fs0
                  slti         t4, ra, 88
                  divu         s6, s5, a4
                  andi         a0, ra, -478
                  fmax.s       fs11, fa6, ft9
                  fdiv.s       ft1, fs5, fa1, rup
                  fdiv.s       fa0, ft3, ft2, rtz
                  sub          sp, a6, s1
                  fsub.s       ft7, fs7, fs11, rtz
                  fsgnj.s      ft6, fs10, fs11
                  fsgnj.s      fs9, fs3, ft10
                  srai         s11, s11, 12
                  flt.s        ra, ft11, fs8
                  mulhsu       s7, sp, s7
                  add          t4, t0, s4
                  remu         s4, s9, t4
                  add          t3, s5, t4
                  fadd.s       ft9, fs2, ft4
                  fclass.s     t4, fs2
                  fclass.s     s4, fs0
                  divu         a4, s4, t4
                  fadd.s       fa6, fs0, fa1, rtz
                  feq.s        t0, ft6, fa4
                  divu         a5, a4, t3
                  fmax.s       ft6, fa1, ft2
                  sub          a4, zero, s10
                  lui          s0, 667543
                  fcvt.w.s     t2, fs8, rdn
                  fmv.w.x      ft11, s1
                  srl          gp, s10, tp
                  fcvt.w.s     a6, ft11
                  fsgnjn.s     ft4, fa0, fa2
                  srai         s7, zero, 7
                  fmax.s       fa3, fa4, fs0
                  or           a2, a1, s10
                  fsqrt.s      fa0, fa1
                  fadd.s       fs9, fs6, ft0
                  fcvt.w.s     a5, ft7, rne
                  fmin.s       fs2, fa1, fs7
                  divu         s4, a5, a2
                  sltu         t3, a6, a5
                  sll          s3, s11, t6
                  slt          t2, a6, s2
                  srl          a2, t4, s9
                  addi         s3, t2, -1468
                  ori          t3, s3, 680
                  fsqrt.s      fa1, fs10
                  add          t4, a7, sp
                  slti         a3, sp, -901
                  div          t4, t1, s1
                  mulhu        s4, t2, ra
                  divu         s0, a7, s6
                  srai         t1, a1, 13
                  div          s4, t3, s3
                  mul          a7, s2, a1
                  fsgnj.s      ft11, fa6, ft11
                  sltu         tp, s1, sp
                  fcvt.w.s     a5, ft4
                  sltu         s7, ra, s5
                  slli         s10, s7, 11
                  andi         a5, s11, -1612
                  rem          s5, s9, s1
                  fmax.s       fa4, fs8, ft1
                  mul          s3, a2, s0
                  mulh         t6, s7, tp
                  fmv.w.x      fs7, sp
                  and          s7, s6, ra
                  mulhu        t6, s7, a0
                  add          t1, a6, s5
                  fmv.w.x      ft0, tp
                  fclass.s     s6, fa1
                  rem          a4, t0, t3
                  ori          t6, s1, -238
                  sub          a7, s9, sp
                  fsqrt.s      fs6, ft2, rup
                  div          a2, a2, a0
                  mulhu        a7, s4, a6
                  feq.s        sp, fs1, ft7
                  fmul.s       fa0, ft7, ft3, rmm
                  xori         t5, ra, -1938
                  or           sp, s9, a2
                  sltu         s3, s1, a2
                  fle.s        t6, fs10, fa5
                  fmin.s       ft9, fa5, ft4
                  fle.s        a6, fs5, fa6
                  fadd.s       ft6, fs3, ft9, rup
                  nop
                  slli         a1, s0, 14
                  slli         s0, zero, 10
                  flt.s        s11, ft7, ft1
                  div          t3, s2, zero
                  sll          sp, t3, s6
                  fcvt.w.s     a1, fa1
                  auipc        tp, 1008779
                  slti         t1, a0, -142
                  sltu         tp, a7, a2
                  fcvt.wu.s    tp, fa1
                  addi         s4, t6, -854
                  nop
                  auipc        gp, 431990
                  sll          s3, zero, s5
                  fadd.s       fs10, fs8, fs4, rup
                  feq.s        a2, fs5, fs2
                  sll          t3, gp, s6
                  or           a6, s1, t4
                  remu         a7, t4, s11
                  fmin.s       ft0, ft8, fa1
                  fclass.s     s11, fs2
                  fadd.s       ft10, ft11, ft3, rtz
                  feq.s        t4, fs0, ft2
                  feq.s        ra, fa5, fs7
                  fsgnj.s      fs6, ft11, fa4
                  fsgnj.s      ft5, fs11, ft8
                  auipc        t2, 315264
                  srai         zero, s6, 14
                  fsqrt.s      fa2, fs1, rtz
                  fadd.s       fs8, ft3, ft8, rne
                  flt.s        s3, fa5, fs3
                  or           a6, gp, ra
                  fsgnj.s      fs9, ft4, fa2
                  fsgnjx.s     fs0, fs1, fa1
                  sll          sp, s9, s9
                  srli         a6, t0, 17
                  sub          a7, s4, s3
                  addi         s4, a0, -1670
                  mulhsu       a3, s3, s6
                  andi         s7, a4, 168
                  add          gp, t2, t0
                  slt          t2, sp, s0
                  sltu         a2, a1, s11
                  fdiv.s       fs10, ft1, ft11, rne
                  fcvt.s.wu    fs0, s9, rdn
                  fcvt.wu.s    a1, fs9, rne
                  fsgnj.s      fs7, fs7, ft0
                  auipc        t0, 1041925
                  ori          a0, t1, -1641
                  srli         t1, a6, 19
                  lui          gp, 31065
                  fsqrt.s      ft9, fa1
                  lui          a2, 270982
                  fmv.x.w      a1, ft9
                  mulh         tp, ra, s6
                  srai         sp, s9, 31
                  div          s3, t6, s7
                  mulh         a5, ra, s8
                  sra          t2, a3, s9
                  fsgnjx.s     fs1, ft4, fs5
                  mul          t1, sp, s5
                  fclass.s     t3, fs4
                  sltu         a5, s0, s6
                  and          s10, s6, tp
                  sltiu        ra, a6, 1153
                  fmin.s       ft11, ft8, fa0
                  sll          a3, t2, sp
                  ori          s4, t0, -1491
                  fsgnjx.s     fa1, fs6, ft2
                  fsgnjn.s     fa7, ft8, fs0
                  feq.s        t6, fs1, fs8
                  fcvt.s.w     fs10, t6, rtz
                  remu         t2, tp, s2
                  andi         zero, t5, 38
                  fmul.s       ft4, fa0, fs5
                  fsgnj.s      ft0, ft2, ft0
                  mulh         zero, s11, gp
                  sra          gp, s10, a0
                  add          t1, a4, s9
                  fmin.s       fa2, fs7, fa3
                  sltu         t1, s10, s3
                  auipc        gp, 261084
                  sll          tp, ra, t6
                  srai         a5, a3, 6
                  fsgnjn.s     fs3, ft3, fa4
                  fsgnjn.s     ft4, fs1, fs5
                  ori          gp, ra, -111
                  ori          gp, s4, 1677
                  fcvt.wu.s    t6, fa4, rmm
                  srai         s10, a4, 15
                  fle.s        sp, fa7, fs2
                  rem          t3, s10, s9
                  fmax.s       fa3, fs11, fs9
                  add          s6, zero, s8
                  auipc        a6, 451764
                  rem          s6, s2, tp
                  addi         s7, a4, -1072
                  fdiv.s       ft10, ft1, fa2
                  fsgnjx.s     fs2, fs2, fa6
                  mulh         s7, a2, a5
                  fmv.x.w      s4, ft4
                  div          t2, a4, t5
                  mulhu        t5, t3, s8
                  mulhu        s6, s2, t2
                  fmul.s       fs6, ft11, ft0
                  fmul.s       fa0, ft4, fa4
                  fmin.s       fa6, fs2, ft9
                  lui          zero, 1035984
                  lui          tp, 489178
                  auipc        s2, 1015843
                  slt          a4, ra, s10
                  mulh         a5, s2, s4
                  slti         a1, t1, -1714
                  fcvt.s.wu    fs0, ra, rdn
                  sltiu        a3, t6, -27
                  xori         zero, a4, 1117
                  fcvt.wu.s    s7, fa5, rup
                  fmv.x.w      a1, fa6
                  remu         s11, a4, s3
                  and          t3, s7, s9
                  fcvt.s.w     fa5, s11, rmm
                  fmin.s       fs6, fs8, fs3
                  slli         s11, s5, 9
                  fsgnjn.s     fs10, ft7, fs6
                  remu         s0, s7, tp
                  fcvt.s.w     fs10, t3
                  mulhsu       a1, s5, t2
                  mulhsu       a7, ra, s6
                  flt.s        a3, ft3, fs7
                  xori         a7, s9, 574
                  srai         t0, s3, 22
                  fmin.s       fs1, ft7, fa6
                  slli         s11, s8, 28
                  fsgnjx.s     ft8, fa4, ft1
                  fsgnjn.s     ft4, ft5, fs1
                  sll          t5, s11, a4
                  addi         s11, gp, -546
                  fsgnjx.s     ft10, ft11, ft2
                  fsqrt.s      fs11, ft2
                  fcvt.w.s     t1, ft5, rtz
                  nop
                  sll          s7, t0, s4
                  lui          a2, 74139
                  srai         sp, a5, 20
                  ori          s7, a1, -1562
                  fmv.w.x      fa1, s0
                  andi         a6, a5, 1093
                  fmv.w.x      ft2, t5
                  andi         a5, a6, -3
                  srai         ra, zero, 1
                  fmul.s       ft6, ft2, fa4
                  fmin.s       fa2, fa5, ft8
                  fcvt.s.w     fa6, sp, rtz
                  andi         s0, t4, -441
                  remu         a5, a4, gp
                  ori          s6, a3, 1089
                  fmin.s       fs7, fa2, fa2
                  srl          s7, zero, a7
                  sub          t1, gp, a6
                  or           a6, tp, t0
                  nop
                  lui          a0, 785869
                  sll          s0, t1, s9
                  xor          s0, s2, a5
                  mul          zero, sp, a0
                  mulh         t6, s10, s1
                  or           ra, t5, s7
                  or           a3, a2, t3
                  fadd.s       fs2, ft7, fa0
                  xor          s3, a6, ra
                  fmv.x.w      s5, ft2
                  fcvt.w.s     s4, ft5, rne
                  add          tp, ra, a5
                  fsgnjn.s     fs0, fs9, fa1
                  mulhu        s2, s3, s9
                  flt.s        zero, fs10, fs4
                  sltu         s7, s4, s2
                  fsgnj.s      fa1, fa3, fs2
                  sltu         t6, a4, s4
                  slt          s2, a5, s10
                  sll          s6, s8, t0
                  fsub.s       fa5, ft2, fs2, rtz
                  sltiu        s0, s4, 1599
                  sltiu        s10, gp, 979
                  sltu         t1, t0, s2
                  sra          a1, a3, t5
                  slt          a5, s5, s10
                  slli         s2, t1, 17
                  lui          s2, 256657
                  mul          a1, s2, t3
                  ori          ra, a7, -1210
                  slti         a3, s3, -790
                  fcvt.s.w     fa7, a4
                  fadd.s       ft9, fs9, fs9
                  fcvt.s.wu    fs7, s6
                  fcvt.wu.s    t6, fa0
                  fsgnjn.s     fa3, fa5, ft3
                  slli         a5, s1, 20
                  fsqrt.s      fa2, ft9, rup
                  rem          sp, t5, t5
                  fcvt.s.w     fs8, s11
                  fle.s        ra, fa5, fs9
                  fcvt.wu.s    sp, ft4
                  rem          a3, a1, s4
                  fmv.w.x      ft4, a5
                  sll          a1, a5, s7
                  sltiu        ra, zero, -884
                  srli         s11, s1, 14
                  sra          a5, s4, s7
                  slti         s4, a5, 130
                  fmv.w.x      ft2, ra
                  andi         sp, sp, -809
                  fsgnjx.s     fs1, fa7, ft9
                  fmul.s       ft2, fs11, ft2, rdn
                  auipc        a2, 896227
                  fle.s        s10, fa1, fs3
                  sltiu        a1, s1, 525
                  andi         t1, sp, -1866
                  addi         a7, s7, -34
                  sub          t4, s2, a7
                  xor          a7, gp, a1
                  fle.s        a7, ft9, ft0
                  fsgnj.s      fs3, fs7, fs1
                  sltiu        a7, s0, -1809
                  fsgnjn.s     fa7, fs9, ft5
                  sltu         s10, a0, s10
                  fcvt.w.s     t2, fs11
                  srli         a4, s8, 3
                  fcvt.s.wu    ft0, tp, rtz
                  slli         t5, a5, 14
                  fcvt.w.s     t5, ft8
                  nop
                  mul          s10, s1, a2
                  div          s5, a1, s5
                  fclass.s     t2, ft2
                  xori         t0, s5, 1815
                  flt.s        sp, fs2, fa4
                  srli         t0, s3, 2
                  addi         s3, t5, -1587
                  fmv.w.x      ft8, s11
                  or           a1, a7, s10
                  sltu         gp, t0, s3
                  mul          tp, ra, tp
                  fcvt.w.s     sp, fa7, rtz
                  fsub.s       ft11, fs7, fs1
                  ori          a5, sp, -183
                  mul          s11, a1, a2
                  add          a0, s2, t0
                  fcvt.wu.s    t4, fa6
                  srai         t5, s11, 31
                  ori          s10, tp, -114
                  fsgnj.s      ft6, fs3, fa7
                  fsqrt.s      fs11, ft7
                  remu         a7, t5, t5
                  mulhu        s5, tp, a5
                  srli         sp, a3, 17
                  mulhsu       s7, s1, sp
                  andi         a5, a3, 1795
                  fmv.x.w      s5, fs0
                  fmv.w.x      fa1, ra
                  sll          t3, ra, s9
                  sltiu        a1, a6, -138
                  nop
                  fmin.s       fa6, fs6, fa1
                  flt.s        s0, fa1, fa5
                  sra          s3, s1, ra
                  nop
                  fmv.w.x      fs2, a4
                  fle.s        t6, ft8, ft1
                  mulhu        tp, t6, s4
                  xori         t2, t3, 1100
                  xori         t5, tp, 651
                  fsqrt.s      ft9, fa7, rtz
                  andi         a1, t0, 590
                  fcvt.s.wu    fs0, t5, rmm
                  fclass.s     t5, ft4
                  nop
                  flt.s        s2, ft3, fs5
                  lui          a5, 755298
                  feq.s        tp, fa5, ft4
                  remu         a6, ra, t6
                  fdiv.s       ft5, fs6, ft0
                  fcvt.s.wu    fa1, s8, rmm
                  fmv.x.w      s11, ft2
                  fsgnjn.s     ft1, fs1, fs9
                  slti         a1, s0, 1112
                  fsgnjx.s     fs8, ft3, ft6
                  fle.s        zero, fa1, ft11
                  fsqrt.s      fa6, ft1
                  mulhu        t3, a1, s4
                  sra          t2, s0, sp
                  fcvt.s.w     fa6, s6, rdn
                  srai         zero, s8, 12
                  fcvt.s.w     ft8, s11
                  fsgnjx.s     ft6, ft3, ft8
                  ori          s6, t3, -2040
                  ori          s2, s8, 1964
                  remu         t0, a0, sp
                  srl          t3, s8, a0
                  rem          t0, a1, s3
                  slli         tp, t3, 7
                  mul          t3, s3, sp
                  fsgnj.s      ft0, ft9, fs11
                  fmul.s       fa3, fs4, fa2, rtz
                  fadd.s       fa6, ft2, fa6, rdn
                  nop
                  sltiu        s7, s6, -1669
                  fmul.s       ft11, fa7, fs7
                  div          a7, a4, t5
                  fmv.w.x      ft5, ra
                  fsgnj.s      fa7, fa6, fs11
                  addi         s6, a5, 381
                  or           s7, a0, s9
                  sltiu        a0, gp, 974
                  fdiv.s       fs9, ft7, fs8, rne
                  fmv.w.x      fa6, t0
                  fmin.s       ft6, ft3, fs5
                  fmin.s       ft0, fs6, fs0
                  slti         t3, s8, -315
                  div          s11, t3, t3
                  fclass.s     ra, ft3
                  slti         t4, ra, -1009
                  fsqrt.s      fa6, fs3
                  sub          t0, a7, t4
                  andi         a1, s2, -1246
                  fadd.s       fs7, fs3, fs4
                  fmin.s       fs0, fs8, fs8
                  fmv.w.x      fa5, gp
                  fcvt.s.wu    fs7, s11, rne
                  divu         tp, s7, s5
                  sltu         a6, zero, s4
                  fdiv.s       ft3, ft6, fs9, rtz
                  fmin.s       fs0, ft0, ft10
                  sll          a3, ra, s11
                  mulhsu       a4, t5, a3
                  and          s7, ra, t4
                  slti         s6, s5, -757
                  fsgnjn.s     ft9, fs9, ft8
                  fmul.s       fa6, fa1, ft2, rne
                  fcvt.w.s     a5, ft1, rne
                  feq.s        a1, fs8, fa0
                  mulh         t6, a2, t2
                  fcvt.wu.s    a0, ft11, rup
                  add          s7, t5, t2
                  add          a1, ra, a3
                  fadd.s       ft7, fs6, fs3, rne
                  mulhsu       s5, s5, s3
                  sltiu        zero, s10, -1046
                  xori         s5, a6, -286
                  fmin.s       fs0, ft1, ft5
                  ori          t4, t4, -1022
                  fsqrt.s      ft2, fs11
                  srai         s6, gp, 30
                  sltiu        s11, s1, -1431
                  sra          a7, t0, sp
                  flt.s        s5, ft8, fs7
                  fsgnj.s      fs0, fs0, fs6
                  fsgnjx.s     fa2, ft1, fs8
                  mulhsu       s6, s8, a0
                  fmul.s       fs3, fs11, fa3
                  fcvt.w.s     a2, ft3
                  div          a3, t3, s7
                  fcvt.s.w     fs10, s7, rup
                  fsub.s       fa7, ft0, fa3, rtz
                  sra          gp, s10, gp
                  xor          s4, t5, s6
                  slt          a2, sp, s7
                  sub          s0, t1, a4
                  fmv.x.w      t4, ft8
                  srl          s3, s9, t0
                  fmv.w.x      fs4, ra
                  divu         t3, s1, s3
                  mulh         s6, a7, a3
                  sll          ra, t1, s5
                  remu         a6, t0, s8
                  remu         tp, s9, s7
                  slli         tp, t6, 22
                  fcvt.s.wu    ft2, s6, rne
                  mulhu        a4, a3, zero
                  fsgnjx.s     fa4, fs1, ft4
                  fmv.x.w      s0, fs11
                  sll          t5, a6, t0
                  fsub.s       ft3, fs0, fs5
                  fle.s        s11, fs0, ft8
                  add          s0, a3, t3
                  fcvt.s.wu    fs3, a0, rne
                  fsub.s       fa0, ft5, ft2, rne
                  fcvt.s.wu    ft10, a0
                  fdiv.s       fs0, fs9, fs7, rne
                  slt          t6, a0, t6
                  ori          tp, a5, -975
                  fcvt.wu.s    s7, fa7
                  lui          t2, 181732
                  lui          ra, 372534
                  fmax.s       fa7, fs8, ft6
                  flt.s        gp, ft1, fs11
                  slli         s11, t0, 25
                  fmax.s       fa4, fs0, fs11
                  fcvt.wu.s    s11, ft8, rtz
                  mulhu        t0, a2, t1
                  sltu         s11, s0, a3
                  fsgnjn.s     fs1, fs5, ft4
                  sub          a0, s3, zero
                  mul          s4, t1, s0
                  xor          a6, s7, zero
                  fsub.s       ft10, fa2, fs7, rtz
                  fsgnjx.s     fa3, ft4, ft1
                  fmax.s       ft10, fs0, fs0
                  fcvt.s.wu    ft4, ra, rtz
                  add          s11, s6, s8
                  nop
                  or           t0, s9, t6
                  mulhu        s10, a2, a5
                  sll          a5, t6, t4
                  sub          a4, a3, s8
                  xori         s0, s9, 653
                  mulh         s3, ra, zero
                  mulhsu       t5, a3, t1
                  ori          s6, s5, 1847
                  mul          a0, s0, s3
                  fmin.s       fs0, ft11, fs11
                  fdiv.s       fa4, fs3, fs7
                  srl          ra, t6, s4
                  fmv.w.x      ft7, tp
                  lui          tp, 641952
                  sub          s5, t4, tp
                  fcvt.s.w     ft10, a3, rdn
                  fcvt.s.wu    fs8, a5
                  fadd.s       fa6, fa3, fs8
                  fadd.s       fs7, ft0, fs5, rne
                  remu         t0, s7, a2
                  sll          s5, tp, s11
                  fcvt.s.w     fs2, a7, rdn
                  lui          zero, 998049
                  flt.s        t1, fa2, fs3
                  auipc        a2, 781219
                  fle.s        s0, ft4, ft10
                  fmax.s       fs11, ft3, fs6
                  fsub.s       ft0, fa7, fs0
                  srli         a1, s3, 1
                  fcvt.s.wu    fs3, t0, rup
                  fclass.s     t4, ft11
                  srai         s6, a7, 28
                  mulh         s5, s3, a1
                  fsqrt.s      fs5, fs4, rup
                  slt          a7, a2, t1
                  xor          zero, s0, a4
                  sltiu        gp, a4, 1380
                  nop
                  lui          a0, 591064
                  fcvt.s.w     ft2, a7, rmm
                  sll          s5, s10, s5
                  mul          t0, s7, s10
                  remu         zero, s7, a0
                  slti         t2, t2, -405
                  addi         t1, t4, 1615
                  slt          t6, t3, t5
                  fcvt.s.wu    fs7, s3, rmm
                  fcvt.w.s     a0, fa7, rmm
                  sltu         a4, gp, gp
                  xor          s3, sp, t5
                  fcvt.s.w     fa7, s1, rup
                  sub          a4, s2, t5
                  divu         s2, s8, a7
                  fsgnjn.s     fs9, ft11, ft6
                  srai         a2, gp, 3
                  srli         t5, s3, 3
                  fclass.s     a1, ft4
                  auipc        a6, 759964
                  sll          t2, a1, s1
                  lui          a6, 194966
                  fle.s        sp, ft6, fa5
                  fsgnj.s      fs4, fs7, ft10
                  fclass.s     t4, fs0
                  andi         t1, s7, 788
                  remu         t4, gp, tp
                  fcvt.w.s     t4, fs8, rtz
                  fmv.x.w      sp, fs11
                  flt.s        a2, ft3, fs1
                  srai         a5, a6, 0
                  mulhu        t1, s6, a4
                  addi         s3, a1, 1009
                  fle.s        s7, fs2, ft3
                  slli         t5, s4, 7
                  fmv.x.w      a4, fa4
                  fle.s        t6, fa2, ft11
                  add          s7, a0, t0
                  lui          s3, 697633
                  fsgnjn.s     ft5, fs9, fa2
                  fsgnjn.s     ft8, fs0, fa1
                  remu         s2, a2, t2
                  sll          t6, a0, t1
                  fsgnjx.s     ft5, fs6, fs3
                  slti         t4, a4, 106
                  fmv.x.w      t0, ft2
                  sltu         s5, a6, a1
                  fcvt.s.wu    ft3, s6
                  fmv.x.w      a3, ft4
                  fcvt.s.wu    fs9, a6, rdn
                  fmv.w.x      fa3, s3
                  fsgnjx.s     fs4, fs4, ft3
                  slti         tp, a7, 1427
                  slti         a7, s5, -759
                  fmin.s       fs11, fs0, fs5
                  nop
                  xori         s10, a5, 1684
                  sltu         gp, a7, s3
                  slti         t1, a1, 959
                  div          a0, t1, t3
                  auipc        zero, 741521
                  divu         s5, a0, s10
                  mul          t3, a6, a5
                  slti         gp, a3, -2033
                  mulhu        t0, s8, sp
                  fsgnjx.s     fa1, fs7, fs7
                  fmul.s       fs3, ft8, fs7
                  div          ra, a5, t2
                  fmv.w.x      fs9, s8
                  srl          sp, s8, t4
                  fcvt.s.w     ft6, s7
                  andi         s0, a1, -1207
                  mulhu        sp, s5, a5
                  lui          sp, 218384
                  remu         a4, sp, ra
                  xor          a1, s1, a2
                  fdiv.s       fa0, ft7, ft11, rmm
                  fmv.w.x      fs0, gp
                  slli         t4, s0, 1
                  lui          s10, 785693
                  feq.s        a5, ft7, fs10
                  fle.s        a0, fa4, fa2
                  fcvt.wu.s    gp, ft6, rup
                  add          s7, sp, ra
                  sltu         s2, ra, zero
                  lui          zero, 73602
                  mulhsu       ra, tp, s6
                  xori         a0, a1, 1040
                  fcvt.wu.s    s10, ft11
                  slt          a1, zero, s5
                  srl          s4, s6, t1
                  or           tp, gp, t0
                  and          s10, s1, s1
                  mulhsu       zero, tp, s11
                  div          a6, t0, a2
                  andi         s2, a5, -1961
                  sltiu        s4, s4, -810
                  sll          t5, s10, s7
                  fsqrt.s      fa6, fs5
                  flt.s        a1, fa4, fs0
                  lui          t0, 91332
                  mul          ra, t0, s1
                  fadd.s       ft1, fs5, ft6, rne
                  remu         zero, a2, s10
                  xori         a6, a7, 1512
                  mul          s4, a7, a7
                  fsgnj.s      ft11, ft9, ft3
                  rem          t2, t2, t4
                  fsgnj.s      fa2, fa1, fs5
                  fmv.w.x      fs5, t3
                  slli         sp, s10, 25
                  ori          tp, s8, -764
                  mulhu        a3, s11, a7
                  and          tp, a7, s3
                  sltiu        sp, t1, 1043
                  slt          a1, ra, s5
                  srl          t1, a3, s7
                  fcvt.s.wu    fa1, s7
                  fle.s        t4, fs4, fa0
                  fmv.w.x      fs5, s6
                  fmin.s       fs5, fa1, ft11
                  sltu         s10, a4, s5
                  srai         t4, s3, 18
                  fcvt.s.w     ft4, s5, rtz
                  rem          s3, s2, s10
                  fcvt.s.w     fs2, t1
                  andi         gp, a7, 1993
                  slli         s6, s7, 5
                  divu         a0, gp, ra
                  fmv.x.w      sp, fs1
                  slli         t5, s8, 21
                  srai         a1, s8, 31
                  fsgnjn.s     ft0, fs11, fa1
                  div          s11, t2, t4
                  mul          s10, a5, s0
                  srli         a4, s1, 3
                  fmin.s       fa6, fa0, fa0
                  slli         s11, sp, 10
                  fcvt.s.w     ft0, s1, rtz
                  fsgnjx.s     ft10, ft5, ft3
                  xori         t5, t2, -1344
                  slli         s7, t3, 31
                  ori          t0, s3, 701
                  fsqrt.s      ft5, fs10, rtz
                  fdiv.s       fs3, fs4, ft1
                  nop
                  srli         s2, a3, 18
                  slli         sp, t0, 8
                  fcvt.wu.s    s3, fa3
                  fcvt.w.s     s4, fs5
                  slli         s7, t1, 21
                  fsub.s       fa4, ft7, fa2, rdn
                  slti         s6, s0, -1979
                  sltiu        s6, a2, -1918
                  slt          s2, s9, t2
                  fmv.x.w      t4, fs2
                  andi         s2, tp, 838
                  sltu         a3, a0, s7
                  xori         a3, s8, -1027
                  fsub.s       fs9, fs8, ft1, rne
                  fmax.s       ft6, ft3, fs6
                  mulh         t3, s5, a6
                  fsgnjn.s     ft6, fa5, fs6
                  srli         a2, sp, 16
                  and          t2, s6, s4
                  mulhu        tp, tp, t2
                  xor          t2, s0, s7
                  andi         s3, s9, -1238
                  and          a3, a0, a6
                  sltu         a0, s7, a6
                  sra          a5, s9, s0
                  srli         t0, s1, 25
                  slli         s6, a1, 16
                  sra          s6, s10, s2
                  addi         a6, s4, 758
                  or           a5, t0, ra
                  divu         s5, a6, t3
                  sltu         t0, s2, ra
                  nop
                  auipc        a4, 592103
                  div          a2, s10, t2
                  mulhu        a0, ra, s8
                  auipc        a4, 700492
                  flt.s        tp, ft7, fs6
                  fcvt.w.s     s5, ft3, rne
                  fsub.s       fa6, ft11, fs7
                  fsub.s       fa2, fs3, fa6
                  mulh         s6, s7, zero
                  rem          sp, t4, a2
                  auipc        a1, 232288
                  fmul.s       ft3, fs6, fa4
                  srl          t5, s9, s0
                  lui          t3, 674808
                  sltiu        s3, a7, 49
                  auipc        a1, 874964
                  slli         s5, a1, 24
                  remu         a7, a5, s11
                  fmul.s       ft5, fs2, fs6, rne
                  fmin.s       fs1, ft8, fa3
                  mulhu        ra, s10, a7
                  slli         s11, a7, 16
                  xor          s2, a0, a4
                  fsub.s       fa6, fa5, fs10
                  mul          s0, s0, t5
                  add          ra, a7, t2
                  srl          t4, t4, a2
                  fcvt.s.wu    ft4, t5, rdn
                  lui          a5, 785213
                  fclass.s     t2, fa6
                  slti         a2, s1, 825
                  auipc        s7, 836555
                  slt          a4, s2, s3
                  sub          gp, a5, s6
                  sub          s11, t3, s8
                  fmv.w.x      fs11, s8
                  fcvt.w.s     zero, fs1, rdn
                  sll          s0, t3, s9
                  sltiu        s5, s4, -376
                  fsgnjn.s     ft8, ft11, fa4
                  fle.s        t2, fa3, ft1
                  fdiv.s       fa2, fs4, fa4
                  rem          t4, t0, a0
                  sub          t2, t3, a7
                  srai         s4, a3, 21
                  xor          a3, s3, s11
                  and          s2, s0, t6
                  fmul.s       fa7, fa6, fs10, rdn
                  xori         t0, s2, 1573
                  mul          t1, t0, s10
                  fcvt.s.wu    fs5, a6
                  nop
                  andi         a5, a6, -1265
                  slt          t6, s6, s3
                  or           a0, s0, t3
                  fmul.s       ft11, fa7, fa3
                  fmul.s       fs4, fs9, fa7, rmm
                  or           gp, s9, s9
                  fdiv.s       ft10, ft5, fs6, rmm
                  fcvt.s.w     fa2, a6, rne
                  fle.s        t5, ft1, fa4
                  addi         t2, s4, -967
                  fle.s        tp, fs7, ft4
                  or           ra, gp, a1
                  mulhsu       t1, s10, a4
                  fcvt.wu.s    s4, ft0, rtz
                  fsgnjn.s     fa6, fa4, ft5
                  andi         t0, a4, 85
                  mulh         t3, s1, t5
                  fsgnj.s      fs3, fs11, fa1
                  remu         gp, a1, a0
                  srl          gp, sp, s4
                  fsgnj.s      ft0, ft2, fa1
                  fmv.x.w      s5, fa2
                  mul          t0, a2, s0
                  fle.s        t6, fs10, fs11
                  slt          gp, s1, s11
                  fle.s        a5, ft9, fa6
                  fle.s        a2, fa1, fa1
                  fmin.s       fs3, fa4, fs5
                  fcvt.s.wu    fs4, a5
                  fle.s        a0, fs10, fa3
                  slti         s6, a7, 1358
                  addi         a5, t6, -1637
                  sub          t6, gp, s9
                  fsgnjx.s     ft9, fa6, ft2
                  mulhu        t0, a0, t1
                  sll          a5, t5, zero
                  srli         t4, s1, 23
                  fmax.s       fs7, fa4, fs4
                  flt.s        t1, fa6, fa7
                  nop
                  srl          s11, t2, s9
                  mulhsu       a7, s6, s0
                  and          t2, s2, a7
                  slti         tp, s5, -1608
                  fmax.s       ft5, ft11, ft3
                  sltu         t0, s11, ra
                  fdiv.s       fs10, fa1, fa3
                  mulhu        s3, a6, a4
                  sll          a1, s0, a4
                  lui          s10, 507043
                  auipc        t0, 471211
                  fcvt.w.s     s5, ft4, rdn
                  fclass.s     a0, ft3
                  remu         a7, t3, sp
                  divu         s10, a1, s3
                  sra          a4, s3, t2
                  sltu         a4, a3, t5
                  srai         a5, sp, 6
                  fcvt.wu.s    a1, fs0
                  fle.s        s3, fs11, fa0
                  fsqrt.s      fa1, fs2
                  srai         t5, t0, 22
                  and          a2, tp, t2
                  fclass.s     s0, ft5
                  or           s3, a4, a7
                  feq.s        a3, fa5, ft3
                  sra          a7, s5, t3
                  or           zero, sp, s9
                  ori          ra, t4, 1753
                  or           gp, s0, s8
                  mulhu        a6, a1, t1
                  fcvt.wu.s    t3, fa7
                  slti         s7, a1, -1913
                  fclass.s     a3, ft5
                  srai         s7, t2, 17
                  fcvt.s.wu    fs3, a6, rdn
                  fcvt.s.w     fs7, a6
                  slli         a2, s11, 3
                  lui          s10, 435548
                  fcvt.w.s     t0, fa4
                  feq.s        s5, fa7, ft2
                  add          ra, t5, ra
                  div          a1, s7, gp
                  div          s2, s2, ra
                  remu         s11, s1, zero
                  add          t2, s1, t4
                  srl          tp, s10, a7
                  fcvt.s.w     fa4, s9
                  fmax.s       fs8, ft10, ft11
                  srli         s4, t4, 26
                  fclass.s     t4, fs5
                  slt          a0, s7, s4
                  srli         s6, s9, 18
                  srl          a7, tp, zero
                  auipc        s5, 240917
                  fmv.w.x      fa7, t2
                  fmax.s       ft8, ft10, fs11
                  fmv.w.x      ft7, t6
                  fsgnjx.s     fa6, ft11, fs10
                  sltiu        a5, t3, 848
                  fcvt.w.s     s0, fs6
                  fsgnj.s      ft7, fs9, fa3
                  slli         t1, t4, 31
                  divu         s6, a6, a0
                  fmin.s       fs0, ft2, fs7
                  flt.s        s2, fs10, ft8
                  fmul.s       ft8, ft4, ft11, rmm
                  srli         t1, a0, 8
                  xori         a4, zero, -1021
                  mulhu        a6, a7, tp
                  ori          s10, a0, -917
                  mulhu        t4, t6, s1
                  nop
                  and          tp, a5, zero
                  fmv.w.x      fs8, s5
                  andi         a6, a2, -358
                  fsub.s       fa7, fs11, fs9
                  fsgnjn.s     ft6, fa1, ft6
                  div          s6, s4, a0
                  fcvt.wu.s    a7, ft2, rup
                  sltu         s3, s2, s2
                  fcvt.s.wu    fa0, t1
                  feq.s        s11, ft10, ft1
                  fclass.s     t4, ft8
                  fdiv.s       fs7, fa5, ft0
                  feq.s        gp, ft3, fs10
                  feq.s        a7, ft0, fs4
                  sra          t6, t0, s7
                  addi         t4, a2, 1872
                  sltu         t3, t4, s11
                  slt          a6, t1, a7
                  fmul.s       fs5, ft5, ft5, rmm
                  fcvt.wu.s    t0, fs1, rdn
                  srl          t4, a5, t0
                  sltu         ra, a6, a0
                  fsgnj.s      fs4, fa4, fa1
                  mulh         a2, s8, t0
                  fmv.w.x      ft8, s2
                  fmv.x.w      zero, ft1
                  fadd.s       fs9, ft9, ft11, rtz
                  rem          s3, gp, s7
                  fclass.s     s0, ft7
                  nop
                  and          s7, zero, t3
                  fsqrt.s      fs10, fa7
                  sll          s10, s7, zero
                  or           a3, gp, t5
                  flt.s        s5, fa0, ft8
                  or           gp, a2, s10
                  fadd.s       fa4, fa6, fs11, rdn
                  srl          t0, a5, s6
                  xor          gp, tp, s1
                  fsgnjx.s     fs1, fa4, ft10
                  addi         t5, s0, -563
                  sltiu        gp, s11, 1138
                  addi         ra, tp, 288
                  mulhu        gp, s5, t2
                  div          a1, a5, s5
                  flt.s        t2, fs1, fs3
                  srl          zero, a5, s3
                  fadd.s       fs11, fa0, ft2
                  sra          a4, tp, t0
                  sra          sp, t4, a5
                  addi         a1, a1, -760
                  add          tp, s1, s1
                  xori         a4, s5, -506
                  addi         s5, s6, -725
                  fmv.w.x      fs8, zero
                  addi         a2, a2, 1208
                  fmv.x.w      a3, ft6
                  sub          s2, a4, s0
                  sltiu        ra, s11, 1097
                  auipc        a6, 9054
                  feq.s        a5, fs3, fs8
                  mulhu        a4, t0, tp
                  flt.s        s5, ft11, ft3
                  fclass.s     a7, fs6
                  fcvt.s.wu    ft6, s7
                  fsgnj.s      ft10, fs7, fa7
                  mulhu        s4, s8, s9
                  or           s0, a4, zero
                  fsub.s       ft2, fa2, ft5
                  div          gp, t3, a4
                  slti         zero, zero, -126
                  andi         s11, s2, 616
                  divu         s3, s5, zero
                  slti         ra, t4, 325
                  div          s5, s10, s10
                  fsqrt.s      fa0, ft2, rmm
                  fsqrt.s      fa3, fs4
                  sub          a0, s3, tp
                  fmin.s       fa1, fs3, fs0
                  mul          t3, gp, a7
                  srai         a1, a6, 13
                  fsgnjn.s     fs4, fs11, ft0
                  mul          s0, gp, s7
                  srai         s4, a1, 8
                  flt.s        t2, fs0, ft0
                  sra          a5, s3, t4
                  fadd.s       fa7, ft7, fs1, rdn
                  fmv.w.x      fa2, s8
                  div          s2, a3, gp
                  mulhu        a1, a6, s8
                  fmul.s       ft3, fs3, fa2, rup
                  and          s11, a5, s9
                  mul          s4, s7, a1
                  fsgnjx.s     fs5, fa4, ft10
                  lui          t4, 864502
                  fmax.s       fs2, fa3, fa2
                  fmul.s       ft9, ft8, ft10
                  slt          a6, a3, gp
                  fmin.s       ft1, fa4, fs10
                  fsgnjn.s     fs7, fa3, fa0
                  fclass.s     s6, fs3
                  slli         t2, a4, 0
                  or           s5, s8, s4
                  flt.s        s4, fs3, fa0
                  sltu         t1, s8, a3
                  addi         s10, s5, -976
                  mulhu        s4, s7, a0
                  slli         s3, zero, 8
                  fmax.s       ft7, ft5, fs5
                  and          s10, t0, s3
                  fmin.s       fs9, ft7, fs6
                  fmul.s       ft2, fs6, ft6
                  add          s0, s10, s9
                  flt.s        a2, fs4, ft6
                  fadd.s       ft3, ft8, fa4, rup
                  ori          a7, t0, -1093
                  fdiv.s       ft2, fs5, ft7
                  ori          t1, s6, -655
                  fmin.s       fs3, ft6, ft3
                  mulhu        s10, s6, a4
                  srai         t1, s0, 29
                  xor          a1, t3, s8
                  feq.s        a4, ft4, fs8
                  sltu         a0, s0, s7
                  fsgnjn.s     fs4, ft5, ft9
                  sll          t1, s6, a0
                  fmv.x.w      gp, fa6
                  srai         a6, a3, 30
                  mulhu        a4, gp, s7
                  sll          t4, ra, zero
                  add          sp, t5, s2
                  sra          a0, s4, s2
                  fcvt.w.s     s11, fs11
                  fcvt.s.wu    fs7, a1, rup
                  mulhu        a2, sp, a5
                  divu         a2, s4, s6
                  mul          tp, a5, a4
                  feq.s        t6, fa7, fa4
                  rem          s10, a1, s0
                  divu         a7, t0, s8
                  divu         t4, t3, s11
                  slti         a5, s3, 478
                  fsgnjx.s     fa7, fs5, ft3
                  mulh         s6, s0, a6
                  rem          s3, t5, s10
                  sub          a3, t4, t5
                  add          a5, t2, a4
                  fmax.s       fa2, fa1, ft4
                  rem          t1, s2, s8
                  fsgnjn.s     ft7, ft8, fs6
                  fcvt.s.w     fs1, t0, rne
                  fsgnj.s      fa0, fa5, ft6
                  fcvt.wu.s    s6, fa4, rmm
                  flt.s        s0, fa2, ft8
                  srli         a0, zero, 12
                  sltiu        t5, a1, -1761
                  fcvt.s.w     fs10, tp, rtz
                  sltu         s11, t1, zero
                  slti         a0, a2, 1044
                  sub          t2, s11, t0
                  mulhu        sp, s4, s1
                  fsqrt.s      ft5, ft9, rne
                  xori         s6, t1, -1723
                  xori         s6, s11, -806
                  nop
                  flt.s        tp, fs1, ft0
                  sltu         a7, s5, ra
                  xor          tp, s4, a4
                  slli         t4, t0, 21
                  fcvt.w.s     a3, fa0, rtz
                  rem          t2, a1, gp
                  sltu         s7, ra, a6
                  slli         a7, gp, 4
                  mulhsu       t0, s0, t4
                  remu         s11, sp, zero
                  feq.s        t5, fs11, ft4
                  sra          sp, a6, a6
                  rem          a4, t0, zero
                  sra          ra, s9, zero
                  srli         s10, a4, 12
                  sll          s10, s1, t0
                  fsub.s       fs0, ft5, fa2
                  fclass.s     zero, fa1
                  fadd.s       fs6, fs10, ft0, rup
                  srl          a6, a2, a7
                  fmin.s       ft3, fs8, fs10
                  mulhu        t0, a3, sp
                  sltiu        t6, sp, 1767
                  slti         tp, s10, -1429
                  fsgnjx.s     fs4, fa0, ft0
                  remu         zero, s11, t1
                  fmin.s       ft2, fa4, fa1
                  sll          a0, t1, s5
                  fsqrt.s      fs8, fa6
                  and          a7, s5, gp
                  feq.s        a6, fs1, fa6
                  nop
                  divu         a2, s3, s7
                  mulh         tp, s3, s10
                  slt          t3, a5, s9
                  flt.s        s3, ft8, ft4
                  slli         s7, a0, 11
                  slt          s6, a4, s3
                  mulhsu       gp, t0, s1
                  fsqrt.s      ft10, ft0
                  fdiv.s       ft2, ft8, ft6
                  fadd.s       ft3, ft4, fs0, rmm
                  nop
                  fsqrt.s      fs10, fa7
                  mulhsu       a5, t6, gp
                  fmv.w.x      fs10, s5
                  fsgnj.s      ft6, fa7, fs11
                  fmax.s       fa4, fs3, ft1
                  remu         s4, s6, s9
                  auipc        gp, 735004
                  fadd.s       fs10, ft8, fs11, rtz
                  nop
                  fmv.x.w      a1, ft7
                  fle.s        a6, ft3, fa6
                  mulhu        a6, s3, t2
                  mulhu        s5, s1, a1
                  fadd.s       ft8, fs6, ft8, rdn
                  fmul.s       fs8, fs8, fs6
                  slti         s7, t5, 171
                  fmin.s       fs8, fa2, fa3
                  div          s11, t4, s6
                  fsgnj.s      fa7, ft4, fa6
                  fclass.s     s5, fa4
                  fmul.s       ft11, fa0, fa7, rmm
                  fle.s        s2, fa5, fa5
                  fclass.s     s2, fs1
                  sll          tp, s11, s1
                  mulhu        s11, t5, t4
                  div          zero, a7, a4
                  slti         zero, sp, -621
                  fsgnjn.s     fs5, fa2, ft8
                  ori          tp, s0, 727
                  remu         s5, zero, t3
                  fsgnjn.s     fa7, fa3, fs1
                  sra          t2, a2, t1
                  sra          s7, a3, a7
                  lui          t2, 37687
                  ori          s3, sp, 716
                  srli         a2, zero, 11
                  slli         s4, s6, 27
                  fcvt.s.w     fs7, s5
                  fsgnjn.s     fs4, ft0, ft4
                  fle.s        a5, fs11, fs10
                  fle.s        s10, fa5, fs1
                  srl          s0, s10, t4
                  slli         s10, zero, 21
                  auipc        s3, 289752
                  or           s6, a6, a6
                  fadd.s       ft10, fa1, ft11
                  rem          gp, s6, t2
                  nop
                  addi         t2, a0, -930
                  rem          t0, s11, ra
                  fcvt.s.w     ft5, t4, rmm
                  flt.s        s4, ft6, ft4
                  srl          t3, s8, a6
                  mulhsu       a7, zero, t5
                  sub          s4, zero, s7
                  fcvt.s.wu    fa6, t3, rdn
                  sll          s10, t3, s11
                  fadd.s       ft1, ft11, ft2, rtz
                  sra          t1, s3, s11
                  mulh         sp, a5, s5
                  fsub.s       ft9, ft6, fa0
                  fmin.s       ft11, fs8, fa5
                  fle.s        a5, fs0, fs9
                  slli         t2, s11, 3
                  srli         s0, s5, 8
                  srl          a5, a1, t6
                  srai         t2, ra, 3
                  andi         t5, t3, 1444
                  or           t1, s10, t0
                  nop
                  fcvt.w.s     s2, fa7, rup
                  xor          t0, s11, a1
                  and          a5, a2, s3
                  nop
                  fcvt.s.wu    ft6, t6
                  fcvt.s.wu    ft8, a0
                  fcvt.w.s     t6, fs6
                  lui          s2, 295905
                  nop
                  fmax.s       fs9, fa6, fs4
                  lui          t0, 621553
                  rem          s3, s7, a3
                  fdiv.s       fs4, fs10, fs0
                  fsgnjn.s     ft10, fs8, fs4
                  flt.s        a6, fs10, ft9
                  div          zero, gp, s3
                  flt.s        tp, fs5, fs9
                  srli         t0, a1, 1
                  rem          a3, t1, ra
                  xori         s2, s5, -2018
                  sll          a7, s7, a1
                  sra          zero, a0, s11
                  flt.s        gp, ft9, ft8
                  fcvt.s.wu    ft10, s9
                  ori          a5, t2, -1763
                  slti         a3, t3, -1476
                  sltiu        a6, t5, 537
                  and          t0, s0, s1
                  remu         t6, s6, s8
                  xor          t6, t0, t4
                  fle.s        s4, fa0, ft10
                  remu         a4, zero, s9
                  nop
                  fdiv.s       ft1, fs9, fs5
                  fsgnjn.s     ft5, ft4, fs10
                  slli         s6, t5, 30
                  sub          sp, a4, a2
                  fsgnjn.s     fs11, fs3, ft3
                  srli         gp, t0, 27
                  fmul.s       fs3, fa1, fs9
                  addi         t2, tp, -1244
                  sltiu        t4, t5, 1912
                  mulhu        s4, ra, t6
                  sra          t5, a5, s9
                  srl          t0, zero, s5
                  fsub.s       ft0, fs2, fs7, rup
                  div          a5, t2, s2
                  mulhu        gp, s5, s9
                  xori         s3, a2, 1407
                  flt.s        a6, fa6, fs9
                  srl          s5, s0, s2
                  fsgnjx.s     fs9, ft11, ft3
                  fcvt.s.w     ft8, ra
                  lui          a4, 86637
                  mulhu        s6, zero, a2
                  slt          s5, t4, s0
                  fadd.s       ft8, ft6, fs6, rmm
                  slti         s10, t4, 1125
                  fsqrt.s      ft6, fs11
                  rem          zero, s3, t6
                  mulhsu       a2, s5, t6
                  divu         zero, t3, t0
                  ori          s6, s5, -78
                  fsgnjx.s     fs10, ft9, fa2
                  fclass.s     t0, ft8
                  fsgnjn.s     ft4, ft1, ft1
                  fclass.s     t6, ft7
                  srai         s4, t2, 19
                  ori          t3, ra, 933
                  fmax.s       ft11, fs11, fs6
                  mulh         t0, gp, s11
                  fsgnj.s      fa3, fa1, ft11
                  mulh         s11, t1, zero
                  fclass.s     t6, fa2
                  mulh         zero, tp, t2
                  or           t4, a4, gp
                  srl          s7, a4, a5
                  fmv.x.w      s5, fs4
                  fclass.s     s3, fs4
                  slli         gp, s6, 11
                  addi         a0, s4, 1186
                  sra          a2, s3, a6
                  fclass.s     a4, ft8
                  srl          s7, s10, t4
                  ori          t1, s8, -1966
                  fcvt.wu.s    ra, ft2
                  fclass.s     t3, ft4
                  xori         s4, s1, -480
                  fcvt.s.w     fa3, a4
                  sltiu        a6, s5, 27
                  mul          a2, tp, gp
                  addi         a2, zero, -2032
                  flt.s        a3, fa1, fa0
                  fsqrt.s      ft3, ft2, rtz
                  nop
                  fcvt.s.wu    ft10, s4
                  lui          s10, 119630
                  and          s4, a4, s10
                  mulhu        gp, s6, s10
                  sll          a7, t5, s6
                  sll          a7, t6, a4
                  lui          t1, 560869
                  fmv.w.x      ft2, s6
                  slli         s11, s4, 6
                  slli         a2, s9, 10
                  srai         a3, sp, 0
                  mulhsu       s2, a2, s9
                  fsgnjx.s     fs6, ft8, fs9
                  fle.s        a2, fa4, ft11
                  slt          sp, s0, s0
                  fsgnjx.s     ft11, ft9, fa3
                  fsgnjx.s     ft3, ft11, fs2
                  remu         s7, s0, s1
                  fsgnjn.s     fa4, ft3, ft9
                  slt          s6, s10, s3
                  addi         s7, s4, 41
                  fcvt.s.wu    fa5, s10, rne
                  auipc        s6, 103815
                  fclass.s     s6, ft1
                  fmv.w.x      fa0, sp
                  sll          t2, s8, s6
                  fadd.s       fs8, fa6, ft11
                  srli         s7, zero, 13
                  div          s3, a7, s4
                  slti         s2, t2, 460
                  srl          s6, s8, t6
                  fmv.w.x      ft9, tp
                  mulh         a7, a1, t3
                  fsub.s       fa4, ft7, ft8, rmm
                  fmin.s       ft11, fa1, ft11
                  slti         zero, s11, -1551
                  fcvt.s.w     fa1, t3, rup
                  sub          a6, a6, a6
                  slt          t5, s10, s0
                  feq.s        zero, ft2, fs6
                  fmin.s       fa1, fs7, fa1
                  ori          s2, s5, 739
                  divu         t3, a5, a5
                  ori          a1, a0, -1147
                  srli         t4, a0, 2
                  xori         tp, s4, 450
                  mulhu        s0, s8, s2
                  xor          a1, a2, s2
                  flt.s        t2, fs0, fs9
                  srl          a5, a5, zero
                  fcvt.w.s     s7, ft4
                  fsgnjx.s     ft3, ft7, fa3
                  fcvt.wu.s    ra, fs0, rne
                  mulhu        t2, t5, s10
                  srl          a1, a0, a6
                  andi         zero, s0, -745
                  fcvt.s.w     fs10, s5, rne
                  fcvt.s.wu    fs9, t3, rup
                  sltu         a5, s5, t2
                  andi         t1, t3, 954
                  fmv.x.w      a0, fs5
                  xor          s5, t3, s9
                  flt.s        t5, ft5, fs6
                  add          t6, a1, zero
                  srai         t1, sp, 31
                  fcvt.s.w     ft1, a4, rdn
                  fmin.s       ft4, fs3, fa2
                  slli         s4, gp, 25
                  fcvt.w.s     t1, ft9
                  rem          a4, ra, s0
                  fsgnjx.s     ft1, fs7, fs4
                  feq.s        ra, fa4, fs9
                  fsgnj.s      fs8, ft10, ft10
                  mul          zero, s9, ra
                  sub          a3, a5, s10
                  andi         s0, a6, 1679
                  div          s0, s5, s9
                  fmax.s       fs2, ft5, fa2
                  fmv.x.w      t2, ft0
                  slt          t1, s3, s4
                  fcvt.wu.s    s6, fs3, rne
                  slt          s0, s1, t0
                  fdiv.s       fs0, fs2, ft0, rne
                  fle.s        s5, fs0, ft3
                  mulh         s0, a2, a2
                  remu         t2, s7, t0
                  add          s3, s6, ra
                  fmv.w.x      fs11, s2
                  rem          a1, gp, t1
                  fsgnjx.s     fa0, fa1, ft1
                  mulhu        a7, a6, ra
                  andi         s7, t5, 424
                  slti         s10, a4, 89
                  nop
                  mulh         s3, a3, t6
                  ori          zero, a6, 435
                  fmax.s       fs1, fs2, fa0
                  sll          t6, s7, tp
                  fcvt.s.wu    fa0, s6, rup
                  add          t6, t4, sp
                  fsgnjn.s     fs1, fs2, fa0
                  fsqrt.s      fs10, fs5, rdn
                  sltiu        tp, t3, 93
                  fsub.s       fa3, fa2, fa6
                  xori         a7, s4, 910
                  fsgnj.s      fs5, fa6, ft4
                  rem          s2, t4, a2
                  xor          sp, t0, s0
                  addi         ra, a2, -1720
                  fmul.s       fa7, fs4, ft0
                  fsgnjn.s     fa5, fs8, fa3
                  fsgnjn.s     fa4, ft5, fs6
                  mul          s11, tp, s3
                  div          tp, a6, a1
                  fcvt.s.wu    ft1, s0, rmm
                  sltu         t1, a1, t1
                  srli         a3, t0, 15
                  mulh         ra, t5, a6
                  sll          tp, gp, a6
                  fcvt.wu.s    s0, fs2, rne
                  xori         s7, s4, -1279
                  mulhu        s5, s4, s11
                  fsgnj.s      ft7, ft8, ft11
                  remu         s3, t4, t1
                  ori          s6, s0, -1003
                  fdiv.s       ft1, fa4, fs3
                  remu         s0, s9, zero
                  mulh         tp, tp, t5
                  auipc        s2, 595064
                  fcvt.s.w     ft0, s5, rup
                  nop
                  or           a7, t4, s3
                  xor          a2, s11, s8
                  fcvt.s.wu    fa1, s3, rdn
                  fmv.x.w      sp, ft8
                  sltu         a6, a6, t5
                  nop
                  auipc        t5, 552615
                  sltu         s4, s2, a6
                  fmul.s       fs10, fs3, ft6
                  fsqrt.s      fa2, fs3
                  fmv.w.x      fa2, a6
                  fle.s        t1, fs2, ft2
                  sra          a6, s5, a5
                  fadd.s       fa1, fa6, fs7
                  rem          s2, s3, s3
                  feq.s        s2, fs0, fs3
                  div          t0, a6, t6
                  srl          s6, a0, s6
                  remu         a0, t2, s11
                  srai         s11, s2, 29
                  add          zero, s3, s7
                  fmv.w.x      ft8, a5
                  sltu         sp, s0, a2
                  fsqrt.s      ft1, fa5
                  sra          a7, ra, s7
                  rem          s2, s8, s4
                  srl          s10, sp, gp
                  or           gp, t4, a6
                  sll          sp, a0, a3
                  fcvt.w.s     s0, fs5, rne
                  add          t5, s1, s6
                  div          a3, s9, s10
                  mulhu        sp, t3, t3
                  and          t2, a5, s8
                  fdiv.s       fs9, fs3, ft6
                  srli         a2, a4, 10
                  sra          a2, t3, s5
                  fsub.s       fs7, fa0, fs1
                  fmax.s       fs0, fa7, fs1
                  fdiv.s       fs6, fs8, ft3, rdn
                  add          tp, t6, t3
                  fle.s        a7, fa1, ft7
                  rem          s0, t5, s6
                  fdiv.s       fa2, fa0, fa3
                  fcvt.wu.s    a1, fs3, rne
                  lui          t2, 736803
                  srai         a4, ra, 31
                  flt.s        a2, ft4, ft9
                  auipc        gp, 1005554
                  fcvt.w.s     a1, ft9
                  flt.s        t0, ft8, ft10
                  sll          ra, s6, t5
                  fsgnjn.s     ft10, fs2, ft11
                  mulhsu       s7, s11, t6
                  sll          s7, a3, s9
                  lui          s10, 971928
                  srl          a4, ra, s9
                  mul          a3, t3, s8
                  fle.s        zero, ft2, fa7
                  rem          a5, a4, a0
                  lui          s3, 619173
                  add          a5, a3, a6
                  fsgnjx.s     ft6, ft2, fs2
                  fle.s        t1, fs10, fs0
                  remu         t5, s3, s1
                  fmax.s       fa1, ft2, ft9
                  rem          t4, sp, sp
                  sub          t0, s1, s0
                  slti         t1, s5, 1311
                  srl          s11, t0, a6
                  andi         t1, s3, 1916
                  andi         a0, s2, -1630
                  fsgnjn.s     ft8, ft0, fs2
                  sltu         s3, a0, gp
                  xor          t1, zero, t0
                  fcvt.s.wu    fs9, s9
                  fcvt.w.s     t5, ft9
                  sltiu        ra, s9, -1796
                  fsgnjn.s     fs2, ft1, fa6
                  sll          t2, s8, s1
                  fcvt.s.w     ft0, ra, rup
                  slli         sp, sp, 4
                  mulh         t2, gp, t3
                  fsqrt.s      fs1, fa6, rtz
                  fmin.s       fa5, fa1, ft5
                  fcvt.s.wu    fs8, s10
                  fsgnjx.s     ft7, fs11, ft9
                  fle.s        a5, fs11, fs9
                  sll          a5, t5, s4
                  sra          s5, a3, s0
                  lui          t5, 144981
                  fcvt.s.wu    fs0, t4
                  mulh         s6, s3, a7
                  rem          t2, a3, zero
                  fmin.s       fs8, ft8, fs5
                  remu         a3, zero, s2
                  fcvt.s.wu    ft3, t0
                  slli         t5, sp, 22
                  sra          s3, s11, t6
                  fmv.w.x      fs2, a2
                  srai         s7, t0, 3
                  fcvt.s.wu    fa4, a3, rdn
                  mulhu        t3, s6, s5
                  sltu         s0, s3, s8
                  auipc        s2, 979873
                  andi         ra, t0, 1080
                  srli         t6, s10, 21
                  fcvt.s.wu    ft9, s1
                  fmax.s       ft5, fs5, fa2
                  srai         t1, s11, 8
                  divu         ra, t1, t2
                  fdiv.s       fa3, ft5, fa1, rmm
                  ori          t5, s0, -1432
                  slti         a0, zero, 380
                  fcvt.w.s     a5, fs8, rup
                  slt          a5, s4, a6
                  mulhu        t4, t4, t6
                  sltu         tp, a2, s7
                  slt          t0, t5, a7
                  fclass.s     sp, fa2
                  rem          t0, s6, s11
                  fcvt.s.w     ft10, t4
                  fsgnj.s      fs3, fs10, ft7
                  fle.s        a2, ft4, fa7
                  fcvt.s.w     fs0, a3, rtz
                  fmin.s       fs9, fs9, fs4
                  slti         t2, t0, 463
                  fcvt.s.w     fa7, s7, rup
                  fsgnj.s      fs8, fa4, fs4
                  fcvt.w.s     tp, fs3, rne
                  add          a5, tp, gp
                  fdiv.s       fa0, ft5, fa2, rtz
                  srl          s10, s9, s7
                  sltiu        a5, ra, 1690
                  srl          a0, s10, t0
                  srai         t3, a7, 16
                  mulhsu       s5, a4, t5
                  xor          s6, a1, s0
                  remu         s2, s1, t5
                  slt          a0, a0, s10
                  ori          t3, a2, -180
                  mulhsu       a6, t5, s3
                  fsqrt.s      fs11, fs10
                  ori          s3, a1, 757
                  srl          t0, a4, a6
                  add          t3, gp, tp
                  fdiv.s       fs0, ft2, fs5
                  fadd.s       ft8, fs4, fa3, rup
                  add          t6, t3, s1
                  mulhsu       a2, t6, s6
                  fdiv.s       fs4, ft3, fs10
                  sltu         a0, t3, s3
                  sra          tp, s7, a5
                  fclass.s     gp, fa0
                  srl          s0, s0, a2
                  mulhsu       s3, t2, s7
                  srl          a1, s8, a4
                  fsgnj.s      fs3, fa3, fs1
                  slti         s5, a7, 1771
                  fsqrt.s      ft9, ft8, rdn
                  auipc        a5, 704652
                  sll          t6, s11, s8
                  sltu         t6, s0, s9
                  or           a4, s7, a5
                  div          s2, a3, s10
                  fcvt.w.s     a6, fs10
                  or           a7, a1, s4
                  fsgnj.s      ft3, ft7, fs2
                  fcvt.wu.s    t0, ft2
                  sltu         s6, t3, s1
                  srli         sp, s6, 5
                  divu         t3, t1, a5
                  fcvt.s.wu    fs0, t0, rdn
                  sltu         s0, t6, s4
                  fmv.w.x      fa0, s6
                  andi         zero, a4, -60
                  slli         t2, t4, 13
                  addi         zero, t4, -1965
                  fmin.s       fs3, ft2, ft9
                  or           a5, zero, tp
                  srl          t0, gp, t6
                  and          s10, a0, a4
                  sltiu        s11, s0, 73
                  nop
                  fmv.w.x      fa2, s1
                  mul          t5, a7, gp
                  sll          t5, s9, s9
                  sltiu        a5, s11, -491
                  sra          a5, a4, t0
                  fdiv.s       fs0, fs1, fs11, rtz
                  sub          t6, s4, t2
                  divu         a7, t2, a4
                  feq.s        t3, fa2, ft7
                  slt          t4, s2, s2
                  mulhu        t6, t4, s8
                  or           a5, a4, s1
                  fmin.s       fa0, fa6, ft10
                  and          a4, gp, zero
                  srli         sp, t3, 18
                  add          t6, s9, ra
                  div          a2, s3, zero
                  mulhsu       s3, s1, s6
                  fsgnjx.s     ft0, ft3, ft7
                  or           s5, s8, s0
                  fle.s        a7, fa5, fa7
                  fcvt.w.s     t2, fs6
                  nop
                  slli         a6, s2, 2
                  sub          a5, a3, s9
                  slt          s2, s11, s3
                  fcvt.w.s     t6, fa5, rmm
                  sltu         s0, ra, t0
                  remu         a5, a6, s3
                  srai         t1, a5, 31
                  mulhu        a1, a7, a6
                  sub          s5, a7, ra
                  fcvt.w.s     t6, fa0, rmm
                  mulhsu       a4, sp, sp
                  rem          s11, s9, s8
                  addi         a3, s4, 396
                  mul          a5, s3, a4
                  srl          s11, t3, t2
                  mulhu        zero, t1, s4
                  and          s6, a5, s1
                  feq.s        t5, ft5, fs9
                  fcvt.s.w     fa5, a1, rtz
                  fdiv.s       ft1, ft2, fa5
                  auipc        t6, 260579
                  lui          s2, 178436
                  auipc        gp, 799093
                  remu         t4, t4, zero
                  fcvt.s.wu    fs10, t3, rtz
                  fmax.s       ft0, fs7, fs2
                  nop
                  slti         a6, a1, 1883
                  fcvt.wu.s    tp, ft11
                  sra          t0, t3, t6
                  fclass.s     sp, fs3
                  slt          t2, a0, a7
                  fcvt.s.wu    ft9, s4
                  fle.s        t0, ft8, ft2
                  slli         s6, s4, 26
                  or           a1, a0, s1
                  srli         t5, s8, 17
                  slti         gp, s2, -1676
                  fmv.w.x      fa6, ra
                  sra          sp, ra, s6
                  fsqrt.s      fs4, ft11
                  srl          s5, t1, s0
                  slt          sp, ra, t6
                  fcvt.s.wu    fs7, t4, rne
                  mulhsu       t3, s8, s5
                  fcvt.wu.s    s3, ft11, rtz
                  sra          a1, t6, a1
                  mulhu        s5, a6, a3
                  or           a2, a4, tp
                  sub          t0, s3, s7
                  flt.s        t5, fa3, fa5
                  fmax.s       ft0, fs2, fa4
                  lui          s5, 942038
                  add          a4, a4, a0
                  fcvt.s.wu    fa5, t2
                  fmul.s       fs10, ft11, fs9
                  div          t3, s6, s11
                  slti         s6, t1, -740
                  sub          s2, t3, a6
                  fmv.w.x      fa5, a6
                  sra          s6, sp, t5
                  mulh         s2, ra, a5
                  fmax.s       fs1, fs4, fs7
                  fcvt.wu.s    a4, fs5, rmm
                  fmin.s       ft1, ft1, fs10
                  slli         s3, s5, 20
                  slli         a7, s11, 14
                  fcvt.s.wu    ft4, a6
                  sltiu        sp, s4, 134
                  and          a0, a0, s8
                  fmin.s       ft3, fs10, fa5
                  mulhu        ra, t2, t3
                  add          s6, t5, s1
                  xor          s6, a0, s2
                  andi         t6, gp, 516
                  rem          a4, gp, a1
                  sltu         a7, t0, t3
                  remu         t6, t6, gp
                  fclass.s     a5, ft2
                  fmax.s       ft4, ft7, fs2
                  sra          s7, t0, a5
                  rem          ra, zero, a2
                  srl          zero, t2, s4
                  fclass.s     a4, ft5
                  fmv.w.x      fs5, s6
                  rem          t3, s10, s4
                  sub          s0, a1, s8
                  fadd.s       ft5, fa0, ft11
                  slli         s7, tp, 6
                  fcvt.s.wu    fs8, a5
                  auipc        s6, 842845
                  sra          a1, s8, a7
                  fle.s        a6, fs6, ft10
                  sra          t3, s5, s4
                  and          t4, a6, s1
                  fmv.x.w      s3, fa4
                  xor          gp, s1, s7
                  mul          a2, sp, sp
                  srl          s4, t3, s3
                  fmin.s       fs9, fa2, ft0
                  fsub.s       ft1, ft7, fa6
                  sltiu        t4, t5, -1635
                  slt          t4, s1, tp
                  sra          s0, zero, s0
                  fmin.s       fa4, ft5, fa0
                  andi         a5, t4, 1267
                  fdiv.s       fs0, ft6, ft8, rup
                  fle.s        s4, ft9, fs2
                  slt          s3, t6, s4
                  fadd.s       fa5, ft8, fs1, rdn
                  fcvt.s.wu    ft4, a6
                  mulh         tp, t4, a2
                  sll          a4, s3, s5
                  rem          zero, a2, a3
                  fadd.s       fs10, fs0, fs1
                  slt          a7, a3, ra
                  fmul.s       ft10, fs4, fs3, rup
                  feq.s        t5, fs0, fs7
                  fcvt.s.w     ft11, a7
                  or           a2, s5, sp
                  fmin.s       ft11, fa2, fs7
                  fmv.x.w      a2, fs3
                  sll          a2, s8, a1
                  fmax.s       fa0, fs1, fa1
                  divu         t4, s10, a4
                  fdiv.s       fa7, fa4, fa7
                  auipc        a7, 976420
                  lui          t1, 751675
                  sra          a0, t2, s1
                  and          a2, a1, s4
                  fclass.s     a3, ft9
                  xor          a7, sp, a0
                  slti         s0, a5, 1875
                  remu         t1, t3, t3
                  add          t3, t4, a3
                  div          a0, s4, tp
                  mulhu        s11, t6, s0
                  fsqrt.s      ft8, fs4
                  fcvt.wu.s    t5, fa2, rmm
                  div          s0, a2, s5
                  mulhu        t6, gp, t5
                  fle.s        ra, ft2, ft7
                  div          s4, a7, s10
                  fsub.s       ft2, ft9, fs0, rup
                  rem          a7, a3, a1
                  xor          a2, t3, ra
                  rem          zero, t0, a5
                  slli         s2, s0, 17
                  remu         s5, s3, s8
                  sll          s5, s11, s7
                  mulh         t2, a3, a2
                  fmax.s       ft0, fs4, fs10
                  div          t6, t0, s9
                  fcvt.w.s     s2, fs11
                  nop
                  mulhsu       a0, t6, s5
                  nop
                  addi         s0, s6, 1894
                  fcvt.s.wu    fs11, a2, rmm
                  mulhsu       s3, t5, zero
                  divu         tp, t0, s11
                  sltiu        sp, s6, 1616
                  feq.s        gp, fs0, fs10
                  nop
                  xor          a6, s3, t1
                  fmv.w.x      fs10, zero
                  sltiu        t5, a5, -1524
                  mulh         a7, ra, a3
                  mulhu        t5, a1, t0
                  fcvt.w.s     gp, ft10
                  addi         a2, s10, -51
                  fmv.w.x      fs11, s0
                  sltiu        a6, s2, -108
                  srl          a3, t6, a4
                  fsgnj.s      fa4, fs4, fs7
                  or           a6, s6, s5
                  fsgnjx.s     fa4, fs8, fa3
                  ori          s3, a0, -1426
                  slt          t3, s4, s5
                  lui          t3, 535738
                  sltiu        a4, ra, -657
                  sub          a5, s3, a7
                  xor          s7, s9, a2
                  xori         s7, a3, 947
                  xori         tp, s6, 1196
                  fsgnjx.s     fa3, ft5, fs6
                  fmul.s       fs7, fa3, fa0, rup
                  fclass.s     a0, ft4
                  sra          s4, a3, s5
                  add          ra, s10, s7
                  mulhu        s4, s7, s2
                  or           a5, s10, t2
                  mulh         s10, t4, ra
                  andi         a5, s0, -901
                  sub          a0, a1, s1
                  div          s2, s3, s3
                  and          a1, t6, s4
                  divu         t0, gp, s9
                  nop
                  fcvt.s.wu    ft1, tp
                  fdiv.s       ft6, fs7, fa1, rtz
                  div          a5, s0, s5
                  fcvt.s.w     fs8, sp, rmm
                  fsgnjn.s     fa0, ft8, fs1
                  div          t6, s3, s2
                  srli         a3, s7, 0
                  srl          tp, s1, s7
                  fsub.s       fs7, fa2, ft4
                  slli         a2, t6, 25
                  sltiu        a5, s2, -1720
                  flt.s        s2, ft4, fs8
                  fclass.s     t4, fs9
                  fsqrt.s      fa2, fs4, rmm
                  or           a6, s8, s7
                  fcvt.s.wu    fs2, a6
                  slt          s3, a0, gp
                  fadd.s       fs9, ft8, fs10, rup
                  nop
                  slli         s10, ra, 18
                  fcvt.wu.s    ra, fs9
                  divu         zero, t6, s11
                  fle.s        gp, ft9, ft3
                  fmv.x.w      ra, ft4
                  and          a7, t2, s1
                  sra          t6, sp, s5
                  xori         s0, s3, -361
                  fmv.x.w      t6, fa7
                  sltiu        s0, t5, 1641
                  fmv.w.x      ft6, s8
                  fcvt.s.w     ft2, s9, rmm
                  fmul.s       ft6, fs4, fa7
                  fadd.s       fa5, ft4, ft8, rup
                  fdiv.s       ft9, fs1, ft0
                  fmv.w.x      fs2, s1
                  feq.s        ra, ft4, fs7
                  fdiv.s       ft9, fs6, fs8, rne
                  fmax.s       ft3, fs6, fs9
                  flt.s        s11, ft1, fa0
                  fsgnj.s      fa1, fa0, fs9
                  fadd.s       fs7, ft6, fs10
                  sub          s6, s1, s0
                  slt          gp, gp, t5
                  div          s11, a6, a0
                  fadd.s       fs11, fa5, ft9, rmm
                  addi         zero, a0, 1667
                  fclass.s     a4, ft7
                  ori          a3, t0, 122
                  mulh         a0, a4, a3
                  nop
                  add          t4, s4, s10
                  rem          ra, a5, a5
                  lui          a5, 836656
                  or           gp, t1, a7
                  sub          t6, ra, a2
                  fcvt.wu.s    a3, ft7, rtz
                  fadd.s       ft0, ft3, fs9
                  xor          s11, s1, t2
                  sltu         t2, t3, s8
                  flt.s        t2, ft9, fa1
                  mulhu        s6, s5, sp
                  fsgnjx.s     ft3, fs3, ft2
                  fcvt.wu.s    s0, ft9
                  fmax.s       fs0, ft1, ft11
                  fdiv.s       ft10, fa4, fa1
                  and          s4, a7, t3
                  fmv.w.x      ft3, s1
                  slli         a2, s7, 30
                  sub          s5, sp, a2
                  auipc        a5, 647720
                  fdiv.s       ft5, fs8, fs9, rmm
                  fcvt.wu.s    s10, ft0, rmm
                  div          s10, s6, s6
                  lui          t1, 751898
                  fcvt.s.wu    ft5, t2
                  fdiv.s       ft9, fa1, ft3
                  lui          s7, 111828
                  srli         ra, s7, 13
                  fadd.s       fs8, ft3, fa7, rne
                  fmv.w.x      ft7, tp
                  xori         t2, s5, -539
                  or           t1, s8, a5
                  sltiu        s5, s3, -970
                  addi         t3, s5, 992
                  fcvt.s.w     ft1, a0, rne
                  fcvt.wu.s    t0, fs10, rne
                  mulhu        t4, s8, s10
                  slti         s6, t3, 1663
                  nop
                  mulhsu       t2, s5, s8
                  fmax.s       ft3, ft9, fs1
                  auipc        a0, 272832
                  mulhsu       s11, t0, s9
                  fclass.s     a3, fa3
                  andi         s3, a3, 1063
                  xori         a6, zero, 1286
                  sltu         zero, a2, t1
                  fdiv.s       fs8, ft5, fs5
                  fsqrt.s      ft1, ft11
                  fcvt.w.s     s5, fs1
                  and          s11, s5, s11
                  mulh         t4, s7, s2
                  srli         t4, sp, 14
                  fmin.s       ft6, fa5, fa4
                  add          s3, s5, tp
                  fcvt.s.w     ft6, s0
                  srl          t4, s10, s11
                  fsgnjn.s     ft6, fs5, ft9
                  fsqrt.s      fa6, fs1
                  flt.s        s6, fa3, ft6
                  and          t0, a3, s5
                  ori          s3, s1, 1856
                  fsgnjx.s     ft8, ft10, ft10
                  sll          a3, a4, s10
                  fmv.x.w      zero, ft2
                  xor          s0, a5, zero
                  slt          s0, a6, tp
                  or           t3, s4, a0
                  fsgnj.s      fa5, fs7, ft10
                  and          t3, gp, a3
                  fmax.s       ft5, ft6, fa0
                  slti         t5, t2, 2024
                  fsgnjn.s     ft1, fa5, fa2
                  fcvt.wu.s    a4, fs2, rup
                  mul          t6, a5, a3
                  fsgnjn.s     fa4, fs3, ft4
                  fadd.s       fs7, ft6, fs8, rdn
                  fcvt.wu.s    t5, ft4
                  sltu         gp, s11, a0
                  fmv.x.w      a7, fs3
                  fsub.s       fs0, fs11, fs2
                  rem          s2, a2, s6
                  div          a0, a0, a0
                  auipc        s11, 3000
                  fdiv.s       ft9, fa1, fa7, rtz
                  slt          s7, ra, a3
                  sra          a2, ra, a6
                  divu         s5, a6, t3
                  fmv.w.x      fa3, s1
                  auipc        s0, 730242
                  mulh         a5, ra, t2
                  remu         s11, t2, sp
                  fsgnjn.s     fa7, fs1, ft4
                  mulhsu       s6, t4, s7
                  fle.s        t6, fa7, fs0
                  nop
                  mulh         zero, s3, sp
                  mul          t1, t5, a1
                  fclass.s     s2, fa2
                  divu         a4, t0, a2
                  fmin.s       ft11, fs6, fs6
                  div          a5, t6, a4
                  slti         s6, s4, 124
                  fcvt.wu.s    s10, ft1, rtz
                  fmax.s       fa0, fs7, ft8
                  srli         a0, s2, 11
                  fmv.w.x      fs7, gp
                  xori         t1, t1, -1635
                  fsgnjx.s     ft4, fs8, fs8
                  add          a6, tp, s6
                  slti         t3, a1, -48
                  lui          t6, 569287
                  and          a4, t2, a5
                  fmv.x.w      ra, fa5
                  slli         tp, ra, 5
                  remu         a7, t0, s10
                  fsgnj.s      fa7, ft3, fa7
                  fmv.w.x      fs10, ra
                  xori         t6, a6, 335
                  sltiu        ra, t3, -2046
                  fadd.s       ft5, fs5, fa2
                  divu         s3, a6, t6
                  fadd.s       fs6, ft3, ft6
                  sub          t1, t3, a6
                  slt          s10, t6, t3
                  flt.s        t3, fs4, ft9
                  andi         s3, t5, -388
                  or           a2, s5, s7
                  remu         s7, t6, a6
                  fsgnjx.s     fa3, ft9, fa1
                  fsgnj.s      fa2, fa4, fs1
                  fclass.s     a7, fs9
                  fcvt.s.wu    fs7, s8
                  srai         zero, s7, 28
                  fcvt.s.wu    ft0, a7, rne
                  slti         s4, s10, 505
                  div          t6, a0, t0
                  fmv.x.w      a4, fs2
                  fcvt.w.s     a6, fa1, rne
                  sll          t2, s7, s2
                  fsgnjx.s     ft4, fa5, fs10
                  srli         a2, s6, 22
                  feq.s        s3, fs8, fs4
                  fmv.x.w      t4, ft4
                  flt.s        s11, fa4, fa3
                  srai         t6, t2, 10
                  sltu         s6, zero, a5
                  add          t5, s9, s7
                  fsqrt.s      ft3, ft5, rup
                  mulhu        s0, t4, s1
                  slti         a2, s10, -1845
                  sll          tp, a3, s8
                  fsqrt.s      ft2, ft8
                  slti         a3, s10, 981
                  mulhu        s5, s0, a0
                  auipc        t0, 893911
                  sll          sp, a4, s4
                  fmv.w.x      fs10, s2
                  feq.s        sp, fa2, fs11
                  fsgnj.s      fa7, fa6, fs11
                  fsub.s       fs7, fs6, fa3
                  fsgnj.s      fs11, ft0, ft6
                  xor          t5, s2, ra
                  mul          t1, s2, a7
                  mulh         a5, a2, s2
                  fdiv.s       ft5, fs1, fs5
                  flt.s        s0, ft1, fs2
                  or           t2, a2, a7
                  div          a2, a1, t1
                  mul          a4, t1, s4
                  sltu         a2, s0, s8
                  mulhsu       s3, a2, a6
                  slti         gp, a5, 1295
                  mulh         s7, s9, ra
                  andi         zero, s2, 1493
                  fdiv.s       fs11, ft1, fa6
                  flt.s        gp, fa0, ft3
                  fadd.s       fa5, fs1, ft8
                  lui          t4, 754787
                  fcvt.w.s     s5, ft10
                  srl          s3, s7, s7
                  flt.s        s10, fs11, fs11
                  fsgnjn.s     ft4, ft10, fs1
                  xor          t5, a3, t2
                  xori         t3, a3, -464
                  slt          a5, zero, ra
                  feq.s        ra, ft11, fs1
                  fsgnj.s      ft10, ft7, fa1
                  fclass.s     ra, fs8
                  flt.s        t1, ft9, fs10
                  srli         a4, a3, 12
                  sltiu        s11, a2, 13
                  div          t1, a6, s8
                  sltu         s4, s5, t4
                  mulhsu       tp, s7, a1
                  remu         s7, s11, s10
                  fmv.x.w      zero, ft5
                  sll          ra, t5, a0
                  fmul.s       fs5, fs1, fs4
                  andi         s7, t3, -1352
                  srl          sp, a1, a5
                  fmin.s       fs5, ft8, fs3
                  fle.s        a5, fs4, ft11
                  sltu         a0, s1, a0
                  fsub.s       fs4, fs7, fs3
                  sll          a5, s9, t2
                  rem          s3, t4, gp
                  mul          s10, t2, a6
                  slti         t3, sp, 122
                  nop
                  rem          a6, s10, ra
                  andi         a5, a2, -376
                  sltu         s11, s7, t3
                  ori          s2, s0, 1367
                  fle.s        t4, fa7, fs5
                  nop
                  fclass.s     t3, fs2
                  fmv.w.x      fs1, t1
                  srli         s11, s2, 16
                  fsqrt.s      fs10, fa0, rmm
                  fmax.s       ft5, ft10, fs2
                  fadd.s       ft4, fs4, ft1, rne
                  mulhsu       t5, t0, t4
                  fadd.s       fa3, ft0, fs1, rup
                  fcvt.s.w     fa3, s0, rne
                  mul          a6, s1, t1
                  xor          t5, s11, a2
                  fcvt.w.s     s3, fs2, rup
                  nop
                  slt          zero, a3, s9
                  feq.s        a1, ft8, ft6
                  or           s10, tp, tp
                  mulh         a7, a2, sp
                  div          t6, tp, t5
                  slli         t5, a4, 1
                  sltiu        s0, s11, -659
                  fmv.w.x      fs3, t6
                  fmax.s       ft3, ft0, fs6
                  fsgnj.s      ft10, fa3, fs11
                  lui          a1, 817915
                  fsgnj.s      ft4, fa7, ft2
                  mulhu        s10, sp, sp
                  mulh         a2, gp, t2
                  fsgnj.s      ft4, ft6, fs5
                  addi         ra, s10, -813
                  sltu         s10, a5, a1
                  auipc        t4, 580021
                  srai         t2, s5, 29
                  fle.s        gp, fs9, ft4
                  mulh         t6, a5, ra
                  fmul.s       fs3, fa4, ft11, rup
                  slt          s10, t3, s0
                  sltiu        s0, s5, -870
                  slt          s0, s10, s1
                  fadd.s       fa0, ft3, fs9, rup
                  mulhsu       a2, s4, s11
                  sltiu        sp, a2, -300
                  sll          s2, t2, a4
                  ori          s6, t6, -1247
                  xor          t0, s0, s7
                  andi         s7, s9, -1385
                  sra          zero, s0, gp
                  fsgnjn.s     ft1, ft1, fa2
                  slt          a4, s4, s4
                  slli         s7, s4, 13
                  fle.s        t1, fa2, fa2
                  mulhu        zero, s6, s3
                  mul          a7, s1, t3
                  andi         a0, gp, -1006
                  or           s5, t6, ra
                  fmv.x.w      zero, fa2
                  fsub.s       fa5, fs8, ft10, rne
                  divu         t4, t5, t4
                  flt.s        a4, fa4, ft3
                  srai         s3, a7, 7
                  fsgnjn.s     ft3, ft9, ft7
                  nop
                  nop
                  slti         a6, s8, 135
                  mulh         s7, a1, s10
                  sltu         s2, zero, t0
                  ori          t2, a5, -1772
                  srl          a0, a1, a4
                  fsub.s       fa6, ft3, ft0, rup
                  mulhsu       s7, s4, s8
                  fmv.w.x      fs11, s11
                  fcvt.s.w     fs8, a4, rup
                  fmax.s       fa1, fs3, fs8
                  fmax.s       ft11, ft6, ft7
                  fmv.w.x      fa5, t5
                  auipc        a2, 609728
                  srai         sp, a4, 6
                  fsub.s       fa2, ft2, ft8
                  fdiv.s       fs8, ft2, ft8
                  auipc        a0, 375110
                  mul          a7, gp, t3
                  fmax.s       fa2, ft6, ft10
                  fmv.x.w      t2, fs4
                  addi         s7, s9, -840
                  ori          a4, s10, 37
                  fclass.s     t0, fs4
                  divu         t6, t3, s3
                  fcvt.s.wu    fs5, sp
                  mulh         s6, s7, s5
                  xori         s3, tp, -1761
                  srli         s5, s11, 5
                  andi         s2, a3, 800
                  auipc        a2, 844431
                  fmv.x.w      t2, fa0
                  fsub.s       fs6, fs0, fs0, rmm
                  srai         s3, gp, 19
                  fadd.s       ft2, ft8, ft7
                  mulhsu       t6, a0, a3
                  rem          s0, s1, s5
                  fmin.s       fa6, ft3, ft10
                  rem          s7, t5, a0
                  andi         s10, s7, 912
                  mulhsu       s7, t1, a2
                  flt.s        s4, fs0, ft1
                  mulh         t0, s11, a2
                  feq.s        t1, ft4, fs8
                  fle.s        t5, fs2, fa6
                  sltu         s4, a4, t1
                  div          t0, ra, a6
                  fsub.s       ft9, ft8, fs1
                  fmul.s       fa6, fs5, ft4
                  fmin.s       fs5, ft3, ft2
                  rem          s3, s9, s11
                  ori          a2, a0, -1359
                  fmul.s       fs3, ft6, ft3, rdn
                  mulhsu       a2, s1, a3
                  xor          ra, gp, s4
                  fmin.s       ft0, fa1, fa7
                  fdiv.s       fs9, ft8, fa4
                  fmul.s       fs10, fa2, ft11
                  or           s11, s0, s8
                  mul          t4, a1, a2
                  fmv.x.w      s10, fs2
                  fmv.w.x      fs5, a3
                  mulh         gp, t3, gp
                  srli         s2, t0, 17
                  fcvt.s.w     fs5, s0
                  fcvt.wu.s    tp, ft2
                  srl          t1, t4, s0
                  flt.s        s4, fa0, fa0
                  fmv.w.x      ft7, s5
                  fclass.s     s11, ft4
                  srli         s6, s0, 20
                  fcvt.w.s     t2, fa7, rup
                  ori          s11, tp, -423
                  fcvt.w.s     a1, ft6, rtz
                  xor          s4, ra, ra
                  feq.s        tp, fa1, fs7
                  divu         s0, s5, t0
                  sll          s7, s2, s7
                  div          t0, s7, t1
                  slti         t1, t3, 607
                  flt.s        a3, fs2, fs3
                  feq.s        s7, fa6, fs10
                  fsgnjx.s     fs9, ft6, fs9
                  fclass.s     a6, ft0
                  lui          t4, 12807
                  add          s5, gp, s1
                  fcvt.s.w     fs8, s7, rdn
                  andi         gp, s1, -670
                  xori         t0, t0, 1938
                  andi         a5, tp, -1501
                  nop
                  xori         t3, t6, -1879
                  fsub.s       fa3, ft11, fa0
                  addi         t5, zero, -1848
                  fsgnj.s      fs9, fs2, fs0
                  fsqrt.s      fs4, fa2
                  fsgnjx.s     fs3, fa2, fa3
                  feq.s        s2, fs3, fs11
                  fcvt.s.w     fs1, tp
                  div          s11, a5, a2
                  or           t2, t3, t1
                  divu         sp, t1, t2
                  fmul.s       fa0, ft2, fa3, rne
                  xori         s3, t2, -1048
                  mul          a0, a5, a3
                  fmv.w.x      ft10, a6
                  fmv.x.w      ra, ft9
                  fmax.s       ft2, fs7, fs3
                  divu         a3, a3, a0
                  srli         gp, s0, 31
                  div          t3, zero, a4
                  fcvt.w.s     a6, ft11
                  nop
                  fadd.s       fa4, fa5, fs10, rdn
                  fle.s        a1, fs3, fs2
                  fcvt.wu.s    t0, ft3, rdn
                  fsgnjn.s     fa3, ft3, fa6
                  mulh         t6, a1, s4
                  mulhsu       a0, a5, t5
                  mulh         a7, tp, t4
                  slt          s5, a7, a2
                  mulh         s4, s2, tp
                  feq.s        sp, fa4, fa5
                  nop
                  fmin.s       ft3, fs2, fa6
                  sub          ra, s3, a2
                  rem          t1, ra, s7
                  fcvt.s.wu    ft5, s10
                  fsqrt.s      fa0, fs1
                  fclass.s     ra, fs1
                  fmax.s       fs11, ft1, fa2
                  lui          s4, 969815
                  flt.s        s10, fa7, fa0
                  srli         s5, s8, 28
                  xori         s3, a1, 176
                  fdiv.s       fs10, fa3, ft7, rtz
                  mul          a5, a7, a5
                  xor          s2, ra, t3
                  fcvt.w.s     s11, ft5, rdn
                  sll          t5, s2, s6
                  fsgnj.s      fs0, fs1, fs8
                  feq.s        a7, fa5, ft1
                  slli         a7, a2, 10
                  lui          a5, 797084
                  fcvt.wu.s    a7, ft7, rdn
                  sub          t1, s2, sp
                  sltiu        t0, a1, -361
                  fcvt.s.w     fs4, a6
                  feq.s        t2, ft1, fs2
                  fmul.s       fs9, ft5, fs0
                  xor          ra, s4, a3
                  mulhu        s2, s4, s7
                  lui          s7, 127177
                  mulhu        gp, s9, ra
                  srai         a3, s1, 12
                  rem          a3, s2, s11
                  fmv.x.w      t0, ft10
                  sltu         s2, t3, a7
                  mul          a2, zero, tp
                  rem          tp, s11, t4
                  fcvt.wu.s    t0, fa2, rtz
                  fsub.s       fa2, fa6, ft4
                  fsgnj.s      ft9, ft4, fs4
                  fle.s        s10, ft7, fs5
                  fsgnjn.s     fs2, ft1, ft8
                  fmv.x.w      a3, ft5
                  divu         a3, ra, t1
                  fcvt.s.w     fs11, gp
                  add          a7, s0, a6
                  sra          s6, a1, s5
                  and          t4, s8, t6
                  lui          a6, 642606
                  xori         t2, t5, -305
                  sltu         ra, s7, s0
                  fmv.w.x      ft0, a7
                  nop
                  sra          t4, s1, s4
                  fcvt.w.s     t1, fs5, rup
                  slli         s0, s0, 16
                  fdiv.s       fs8, fs0, fs4, rmm
                  and          a5, tp, s3
                  fsub.s       ft6, ft0, fa5, rtz
                  fdiv.s       fa4, fs2, fa0
                  fadd.s       fa1, ft1, fs6, rup
                  fcvt.wu.s    s4, ft8
                  fle.s        s3, fa7, fs10
                  srl          a0, a6, t5
                  mulhsu       t1, s3, a7
                  flt.s        t5, ft3, fs8
                  or           s5, gp, a5
                  sra          t4, tp, a1
                  mul          a6, a4, a1
                  andi         a0, t2, 811
                  flt.s        t2, fa3, fs0
                  sll          t2, t1, t1
                  xor          s5, s10, gp
                  andi         s10, t3, 159
                  lui          sp, 355727
                  fdiv.s       fs1, ft0, ft11, rup
                  sra          a3, s3, s11
                  fcvt.s.w     fs4, s3
                  fsgnjn.s     ft5, fs2, fs11
                  fsgnjn.s     fs5, ft9, fa4
                  or           s3, sp, a6
                  srai         a5, a4, 31
                  add          zero, a5, s1
                  fsqrt.s      ft5, ft7
                  fcvt.wu.s    t6, fa7, rdn
                  fmv.w.x      ft6, s6
                  mul          t4, t2, a0
                  addi         a0, s4, 873
                  add          a1, s6, s10
                  flt.s        s7, ft6, fs2
                  srli         a5, s4, 24
                  feq.s        s5, fs3, fs7
                  srli         s2, t4, 13
                  sra          s4, t2, s9
                  remu         t2, a2, a3
                  fmin.s       ft8, fa3, fa7
                  lui          s7, 976256
                  fsgnj.s      ft4, fa2, fs10
                  slti         s6, t1, 746
                  andi         a7, ra, 109
                  fmv.x.w      a5, fa2
                  xori         gp, zero, 308
                  sub          t6, s1, a3
                  sltu         a7, ra, t6
                  fsub.s       fs11, fa2, fs9, rdn
                  lui          t1, 341248
                  fcvt.s.w     ft10, a1, rne
                  nop
                  sub          s2, a5, s11
                  and          tp, a2, t2
                  slli         s6, a3, 20
                  sltu         s11, s1, a0
                  fmv.w.x      fa5, s5
                  fcvt.s.w     fs9, t1
                  slt          gp, a4, a2
                  add          s10, s5, s9
                  fmin.s       ft11, ft3, fa4
                  mul          ra, s11, sp
                  feq.s        s6, fs6, fa6
                  fmul.s       fs8, ft11, fs10
                  mulhu        a6, t0, t2
                  nop
                  slli         t0, t5, 17
                  fcvt.wu.s    tp, fa0
                  fsgnj.s      fs7, fs2, fa3
                  slti         t5, ra, 1472
                  fcvt.wu.s    a2, ft2
                  slli         s3, t0, 23
                  ori          a5, s2, 1312
                  andi         s7, a0, 628
                  sub          zero, s3, t3
                  lui          a5, 803662
                  slti         gp, zero, 1120
                  fsgnj.s      fs5, fa6, ft6
                  lui          s3, 745170
                  divu         t2, s10, zero
                  fcvt.w.s     s5, ft5
                  feq.s        s6, ft2, ft3
                  fsgnj.s      fa7, fs5, ft5
                  div          t3, s9, a5
                  rem          s7, t1, s7
                  fcvt.w.s     t2, ft6, rmm
                  fmv.w.x      fs7, a7
                  mulh         tp, s9, a7
                  or           s11, s5, s3
                  mulhu        a7, zero, ra
                  or           zero, sp, s4
                  fadd.s       ft11, ft1, fs10
                  and          ra, t5, a4
                  fmv.x.w      ra, fs5
                  fadd.s       ft0, ft2, fa4
                  fcvt.s.w     fa7, a3
                  sll          a1, s6, s10
                  add          a7, s11, t0
                  or           a2, a1, s6
                  xor          t4, s1, t2
                  ori          s6, tp, 241
                  fdiv.s       ft6, fa7, fs5, rne
                  fcvt.w.s     t3, ft0
                  or           t1, a7, a0
                  feq.s        t3, ft4, fs11
                  sll          s6, t4, a0
                  andi         zero, t5, -1664
                  mulhu        tp, a6, s5
                  fcvt.s.w     fs11, s9, rne
                  fcvt.s.wu    fa7, t2
                  sub          s5, s5, s3
                  rem          a5, a0, t6
                  fmv.x.w      t4, fa6
                  fdiv.s       ft6, fa4, fa3
                  sltiu        a4, a2, -817
                  fmax.s       fs11, ft11, ft3
                  auipc        s11, 750373
                  fsqrt.s      fa3, fs1, rne
                  mulhu        a2, a3, a1
                  fsgnjn.s     ft5, fs10, ft10
                  sra          t5, s6, a5
                  srl          zero, a6, t0
                  sub          t4, gp, a6
                  xori         s0, a4, -464
                  sltiu        gp, s1, 1487
                  fsgnjx.s     ft11, ft10, fa6
                  sra          a5, t4, t3
                  sra          a4, s6, tp
                  fmin.s       fa5, fs5, fs11
                  feq.s        tp, ft4, ft2
                  fmul.s       ft1, ft4, fs4, rdn
                  andi         sp, t3, 1608
                  fcvt.w.s     s5, ft2, rtz
                  xor          s7, a7, t5
                  remu         a6, a6, s2
                  fmax.s       fs0, fs11, fs1
                  fmax.s       ft1, fa2, ft6
                  remu         ra, sp, a4
                  slt          t5, tp, a4
                  fcvt.wu.s    t6, ft8
                  fsgnjx.s     ft0, fs2, fa6
                  xor          t1, sp, s3
                  srli         t3, a5, 27
                  fcvt.s.w     fa2, t4, rmm
                  xor          s10, a4, t3
                  fle.s        gp, fa3, fa2
                  xori         tp, s7, -1997
                  fadd.s       ft11, ft7, ft7, rmm
                  addi         t1, s0, 463
                  xor          t0, s2, a7
                  fcvt.s.w     fs8, t2, rne
                  mulhu        t0, s2, s8
                  fcvt.s.w     fa3, a6, rne
                  fsgnjx.s     ft5, ft0, fs4
                  slli         t0, a0, 30
                  fcvt.s.w     fs11, s11, rmm
                  addi         ra, gp, 40
                  srli         ra, a2, 24
                  auipc        s11, 1212
                  xori         a5, t4, -60
                  sll          a1, t6, t0
                  nop
                  mulh         gp, s1, a1
                  fsgnjn.s     ft5, ft0, ft4
                  mulh         s11, s8, s10
                  fclass.s     s3, fs3
                  remu         s4, s1, s10
                  fcvt.wu.s    s10, fs7
                  fclass.s     sp, fs7
                  sltu         zero, t5, s5
                  add          a3, a0, gp
                  or           a6, ra, s4
                  div          s5, s0, s2
                  fcvt.wu.s    t5, fs2
                  fmv.x.w      a5, ft9
                  slti         t4, t2, -1561
                  remu         ra, t4, a4
                  sll          ra, s5, gp
                  sub          s4, sp, s0
                  fcvt.wu.s    s10, fa2, rmm
                  fsgnj.s      fs5, fs9, fs4
                  fcvt.w.s     s7, ft9
                  mul          s3, t4, tp
                  nop
                  feq.s        t3, fs9, fa5
                  slti         t5, s2, 1659
                  fsgnjn.s     ft10, fa4, fs2
                  div          tp, s11, s1
                  lui          ra, 590379
                  or           a1, a2, t0
                  auipc        s11, 72725
                  rem          t5, a4, t1
                  xori         a4, a7, 1075
                  ori          t6, t0, -518
                  srai         s5, t3, 21
                  fmin.s       fs5, fs4, ft0
                  remu         a5, s7, s11
                  slli         t1, a6, 31
                  sltu         a3, s6, s4
                  fdiv.s       fa7, fs3, ft10
                  sub          a1, s8, s4
                  add          s0, s8, t4
                  mul          sp, a7, t5
                  andi         s6, s10, 112
                  srl          a1, t6, t0
                  sltu         gp, tp, s2
                  sltu         a2, s5, a3
                  remu         a4, s8, s6
                  auipc        s5, 530525
                  srl          t6, a7, a3
                  fclass.s     s2, fa2
                  andi         zero, a4, -949
                  srl          a5, s6, zero
                  xor          s2, sp, s0
                  fsgnjn.s     fa6, fs10, fs7
                  fcvt.s.wu    ft5, a7, rdn
                  slti         tp, s9, -1816
                  sll          a5, a4, s9
                  mulhsu       s7, tp, s1
                  fcvt.s.w     ft9, a6, rne
                  addi         s7, zero, 227
                  nop
                  xori         t2, tp, -1327
                  fcvt.wu.s    a3, fs7
                  fsub.s       ft4, ft10, fs7, rup
                  srl          sp, zero, t1
                  and          a5, tp, a0
                  slli         gp, a1, 31
                  fsgnjn.s     ft11, fs8, fs9
                  fmv.w.x      fa4, a2
                  fmax.s       ft11, fs9, fs10
                  srl          tp, tp, s4
                  xori         s7, a7, 772
                  rem          a5, s0, s3
                  sra          a5, t6, t6
                  fdiv.s       fs9, fs10, fs5, rne
                  fcvt.s.w     fa4, s11, rne
                  fmv.w.x      fs0, zero
                  andi         t0, s1, 1284
                  fsgnjx.s     fs8, fs4, fs11
                  ori          ra, a3, 505
                  and          t6, a2, s1
                  and          s5, s11, s10
                  fle.s        t1, fa2, ft1
                  sub          a3, a6, t1
                  slti         zero, s6, 1048
                  sll          s3, s8, s4
                  fmax.s       fs9, ft4, ft9
                  slli         s7, s0, 16
                  sltu         s2, t2, a6
                  lui          s3, 931759
                  or           a1, s6, sp
                  auipc        t5, 941661
                  divu         t0, gp, s1
                  divu         s10, sp, t2
                  fadd.s       fa7, fs4, fa3
                  xor          a3, s4, tp
                  fsub.s       ft7, ft2, ft2
                  and          a6, a3, s4
                  fmul.s       fs9, ft10, fa7, rtz
                  flt.s        sp, ft1, ft4
                  fmul.s       ft2, fs10, fa7, rmm
                  srai         s10, sp, 0
                  slli         t2, a7, 13
                  srai         zero, zero, 13
                  lui          a4, 477218
                  fsgnjx.s     ft2, fa0, ft5
                  div          t2, s7, gp
                  andi         gp, s4, -110
                  fmin.s       fa7, fs8, ft1
                  feq.s        a5, fa7, fs5
                  nop
                  remu         s11, t5, a1
                  fsgnj.s      fs8, fs9, ft0
                  add          s6, a2, a4
                  slti         ra, tp, 1077
                  fcvt.wu.s    ra, ft2, rne
                  divu         a1, s3, s6
                  fsgnjx.s     ft5, fa5, fs7
                  fcvt.s.w     fs5, t6, rup
                  fcvt.w.s     s5, fs9, rdn
                  fcvt.wu.s    ra, fa5, rup
                  fcvt.wu.s    tp, fs3
                  lui          s6, 932206
                  rem          a4, s1, s4
                  or           t0, s1, s6
                  fcvt.s.w     ft9, s6, rmm
                  fmul.s       fs9, fa2, ft5, rne
                  fmv.w.x      fa4, s9
                  fmv.w.x      fs8, s11
                  fcvt.s.wu    ft7, s3
                  feq.s        s2, fs1, fs8
                  rem          a3, t0, s11
                  sltu         t3, t3, a2
                  fmax.s       fa7, fa2, fs9
                  div          a0, s9, gp
                  srli         s3, s0, 12
                  flt.s        t3, fa0, fa3
                  fcvt.w.s     s0, fa5
                  feq.s        s3, fs4, fs6
                  slti         s7, s0, -1082
                  mulh         a6, t3, gp
                  flt.s        s0, fs10, fa6
                  slli         a1, s10, 8
                  feq.s        t4, fa0, fa7
                  sll          s11, s11, s6
                  fsub.s       fs2, ft10, fa0, rne
                  fcvt.s.wu    fs4, sp
                  slt          s6, t3, a4
                  sra          s3, a3, gp
                  div          s0, s5, t5
                  fsgnj.s      ft6, fa4, fs7
                  ori          a3, s9, -566
                  add          t3, a5, t6
                  fsgnjx.s     fa2, fa4, ft9
                  fsub.s       fa5, fs0, ft1, rup
                  fmax.s       fs7, fs8, ft11
                  fcvt.s.w     ft11, s0
                  fclass.s     sp, fs4
                  mulh         s10, t0, s10
                  fsgnjn.s     ft9, fa5, fs5
                  fmv.w.x      ft2, t6
                  and          a3, a7, s4
                  fclass.s     s7, fs6
                  fsub.s       ft10, fs10, ft10
                  sltu         s11, s3, a7
                  fmax.s       ft5, ft1, fs10
                  xori         a1, t1, -1680
                  fsub.s       fs1, fs4, ft4, rne
                  sltu         s4, ra, tp
                  fcvt.wu.s    a3, ft9
                  fle.s        s0, fs11, fa6
                  xori         s6, a4, 1101
                  remu         sp, s1, t1
                  fadd.s       ft8, fs8, ft2, rup
                  sltiu        a2, t1, -790
                  mulhu        s7, a6, gp
                  slti         a2, t1, -435
                  auipc        t2, 763470
                  fle.s        s7, ft6, fs9
                  fmax.s       fs5, fs1, fa4
                  mulhsu       a2, s10, a4
                  or           s10, s6, s7
                  sra          a1, a6, t6
                  remu         a6, s0, s0
                  sltu         s3, s1, s2
                  fsgnjn.s     fa3, ft3, ft3
                  fclass.s     s3, ft6
                  sltiu        s6, t1, -1361
                  xori         s10, s3, -1272
                  fdiv.s       fs9, fa3, fs5
                  divu         s11, s6, t3
                  sltu         s11, tp, a1
                  and          t1, t4, tp
                  fle.s        s7, fs10, ft7
                  xor          a4, a3, sp
                  fsqrt.s      fs1, ft4
                  nop
                  fcvt.w.s     s4, ft9, rne
                  fsgnjn.s     fa7, ft5, fa7
                  srl          zero, s11, t2
                  addi         t6, t1, -96
                  fsqrt.s      ft9, ft11, rdn
                  fmv.w.x      ft4, t5
                  auipc        s11, 750986
                  remu         s4, t2, zero
                  fle.s        a4, fs10, fa2
                  flt.s        tp, fs4, ft7
                  remu         sp, a1, s11
                  ori          s4, s0, -1572
                  fcvt.s.w     fa0, a2
                  fsub.s       fa3, fa6, fa6
                  fsgnjn.s     fa0, fs9, ft11
                  auipc        a7, 387195
                  divu         t0, t2, gp
                  sll          t4, sp, t6
                  xor          ra, s5, s1
                  fsgnjn.s     ft0, ft3, fs11
                  fcvt.wu.s    ra, fa3
                  ori          s4, s9, -893
                  xori         s5, s6, 731
                  xori         s0, s4, -846
                  mulhu        s3, a7, t4
                  and          a7, s0, s11
                  mulh         zero, zero, s11
                  andi         t1, a1, -275
                  fmin.s       fa1, ft10, fa6
                  remu         t6, a1, tp
                  slli         tp, a5, 30
                  sltu         gp, s5, t3
                  slti         s5, s10, -204
                  sltiu        s4, gp, 178
                  nop
                  sltu         s4, t5, a0
                  fsgnjn.s     fs8, fs2, ft4
                  mulhsu       s0, sp, gp
                  fmul.s       fa4, fs4, ft4, rup
                  remu         s11, a0, s2
                  fcvt.w.s     t2, fa1
                  srl          s7, s5, a7
                  addi         s4, t2, 1638
                  sub          gp, a0, t1
                  fadd.s       fs8, fs3, ft1, rne
                  div          s4, s0, tp
                  fmv.w.x      fs0, s9
                  divu         s2, s7, s9
                  sltiu        gp, t0, -254
                  fcvt.w.s     a3, fa0
                  fsgnjx.s     fa1, fs9, fa3
                  srai         s3, s11, 22
                  fcvt.s.w     fs8, a1
                  fcvt.s.wu    fa1, gp, rdn
                  fle.s        a7, fs1, ft1
                  add          s5, tp, ra
                  fmv.x.w      s10, fa4
                  fcvt.wu.s    a5, fs9
                  fdiv.s       fa6, ft8, fs0
                  and          ra, t4, s10
                  fcvt.wu.s    t3, ft9, rtz
                  fsgnj.s      fa3, ft6, fs8
                  rem          s5, a2, t5
                  fsgnjn.s     fa1, ft0, fs5
                  flt.s        a6, ft8, fs11
                  fadd.s       ft4, fa4, ft11
                  fle.s        t4, ft4, fa6
                  slli         s7, t3, 20
                  ori          t0, sp, -1259
                  fdiv.s       fs5, fs9, fa7, rdn
                  xor          t6, s11, s1
                  fcvt.wu.s    a7, fs8, rne
                  mulh         s2, gp, s8
                  sub          s3, sp, a7
                  sltu         t2, s8, tp
                  fmul.s       fs8, fa6, fs1
                  addi         ra, s11, -1004
                  fsgnjn.s     ft10, fa4, fs11
                  add          t0, gp, t2
                  slli         s0, a6, 7
                  fcvt.wu.s    a6, fa1
                  sltu         a4, s3, s11
                  mulhsu       a5, a0, sp
                  mul          a0, s2, s11
                  fcvt.s.w     ft9, t2, rne
                  mul          t2, a7, t4
                  divu         ra, s4, zero
                  sltiu        zero, s10, 355
                  srai         a7, s10, 4
                  and          gp, sp, s0
                  fsgnj.s      ft9, fs6, fs10
                  fcvt.s.w     fs8, s6
                  fle.s        t1, fa2, fa1
                  fcvt.s.w     fa7, s4
                  mulh         gp, s10, t0
                  srli         s11, s2, 19
                  flt.s        s6, ft9, ft2
                  sltiu        t4, gp, 1953
                  slt          a4, sp, zero
                  sra          s7, t2, s7
                  srli         zero, t6, 25
                  flt.s        s0, fs5, ft2
                  xori         gp, t4, -995
                  mulhu        t5, s11, t5
                  fsqrt.s      fa4, fs8
                  fsgnjn.s     fs8, fa0, fa4
                  slt          s10, t6, s0
                  xori         s0, a7, 1110
                  or           t6, s6, a6
                  sll          s6, t1, s10
                  sll          s4, t4, s0
                  sltiu        a6, t0, -159
                  addi         s3, t2, 1492
                  srl          t3, t3, s5
                  andi         t6, t5, -212
                  fdiv.s       ft4, ft1, fa5, rup
                  rem          s11, s2, s0
                  fsgnj.s      fs8, fa6, ft8
                  mulh         ra, s4, a2
                  remu         tp, a4, a3
                  fmax.s       ft10, fs1, ft6
                  fsgnj.s      fa0, fs6, fa1
                  sltiu        s0, a2, -1113
                  fmv.w.x      fs1, s1
                  fle.s        ra, ft8, ft4
                  feq.s        a7, fa6, fs8
                  fle.s        t1, ft6, ft1
                  xor          a4, s6, s3
                  fcvt.w.s     a0, fs0, rmm
                  sltu         gp, a0, sp
                  xori         sp, a6, 1149
                  fmv.w.x      fs8, t6
                  div          t2, ra, s3
                  fdiv.s       fa0, fa3, ft5
                  srl          a0, s6, s6
                  mulh         a3, a3, s2
                  fcvt.s.w     fs8, a0, rmm
                  fmax.s       ft2, fa0, fs10
                  xor          s7, s2, s2
                  sll          s10, zero, s3
                  fcvt.s.wu    ft6, s7, rtz
                  fmax.s       ft10, fs1, ft10
                  fsgnj.s      fs8, ft3, fs10
                  slli         a5, t6, 28
                  add          t3, zero, s1
                  fmin.s       ft7, fa2, fs6
                  fcvt.s.w     fa0, gp
                  ori          gp, s7, 1123
                  srai         a2, s9, 14
                  fmv.w.x      fa1, s11
                  mulhsu       a1, t6, a3
                  or           ra, sp, s9
                  fsgnj.s      fa2, fa0, ft0
                  sub          t0, a7, a5
                  slli         s5, s4, 11
                  xor          s3, s3, zero
                  mul          t5, t1, t5
                  fcvt.w.s     a4, fa7
                  fsgnjn.s     ft0, fa5, fa4
                  ori          t5, s9, 1281
                  sltu         t5, a1, zero
                  srai         t6, s6, 22
                  and          t3, zero, t5
                  sltiu        tp, s10, -1688
                  remu         s11, a1, gp
                  and          zero, sp, s6
                  fadd.s       fa7, fs1, ft7, rmm
                  fsub.s       fs8, ft6, fa4
                  fclass.s     gp, fa7
                  fclass.s     a4, fs3
                  ori          a0, zero, 548
                  andi         s2, s11, 646
                  slt          t2, t2, s5
                  fle.s        zero, fa7, fs3
                  fadd.s       ft2, fs9, fa4
                  or           a7, tp, s6
                  xor          s11, s0, tp
                  sll          s7, s2, gp
                  remu         a3, s7, s9
                  fcvt.w.s     a5, fa0
                  fcvt.w.s     s5, fs11, rup
                  fcvt.w.s     s11, fa4, rup
                  fcvt.wu.s    a6, ft2
                  fclass.s     t5, fa6
                  andi         t0, t1, 1551
                  fle.s        ra, ft5, ft4
                  fdiv.s       fa2, fs1, fa1, rup
                  auipc        s2, 695244
                  mul          s0, s11, sp
                  feq.s        t2, fa6, fs8
                  remu         s4, t1, zero
                  fmin.s       fa2, ft10, fa1
                  fcvt.w.s     a1, fs3, rdn
                  xor          s6, t5, t1
                  sll          t0, s2, a6
                  fcvt.s.wu    fs5, a1, rdn
                  xor          ra, t5, a5
                  fclass.s     a2, fa0
                  fmax.s       ft6, fs3, ft6
                  fsgnj.s      ft4, fs7, ft1
                  fsgnjn.s     fa2, ft4, fs9
                  sll          a3, zero, s11
                  mulhsu       t1, t2, t2
                  xor          t0, s3, s1
                  or           s2, a5, s7
                  sub          s5, sp, ra
                  add          s5, a3, a2
                  fcvt.s.wu    fa0, a4, rmm
                  flt.s        s0, fs0, ft2
                  mul          t2, ra, a0
                  remu         s4, s8, s7
                  add          t0, s10, a6
                  fadd.s       fs4, fs10, ft0
                  fclass.s     s10, fa7
                  fcvt.wu.s    t3, fa7
                  andi         s0, t3, 1189
                  remu         t1, ra, sp
                  and          t0, s0, tp
                  fsgnjn.s     fa4, ft5, fa5
                  fsgnjx.s     ft8, fs11, ft9
                  fsgnjn.s     fa0, fs5, fs5
                  lui          tp, 515665
                  fmax.s       fs10, ft11, fs6
                  and          s5, t4, t5
                  fdiv.s       fa0, fs8, fa2, rdn
                  mul          s5, a7, a2
                  sltiu        zero, t6, -868
                  fmv.w.x      fa6, s10
                  srai         a1, t0, 19
                  fmul.s       fa5, fs9, ft1, rdn
                  feq.s        a0, fa6, fs10
                  fcvt.s.wu    ft3, a6
                  slti         s6, s11, 855
                  fcvt.s.w     ft5, a4, rne
                  fdiv.s       fs0, ft5, ft9
                  fle.s        a4, fa5, fa5
                  sub          t6, t4, s6
                  divu         t4, a1, a6
                  srli         a5, a1, 2
                  div          a7, s9, a2
                  xor          s2, t5, t4
                  fmin.s       fs3, fa0, fa4
                  fmv.x.w      a0, ft1
                  nop
                  slti         zero, ra, 1498
                  fsgnj.s      fa3, fs6, fs5
                  srl          t3, gp, s1
                  xori         sp, s4, -6
                  fmul.s       ft1, ft3, ft2
                  flt.s        a1, fs1, ft3
                  addi         a0, s9, 499
                  sll          a1, gp, gp
                  fcvt.wu.s    s0, fs9, rdn
                  fmv.x.w      s10, fs0
                  fmul.s       ft11, fs6, ft4
                  fmax.s       ft5, fs0, fa2
                  srl          a3, a1, t1
                  nop
                  srl          t5, s0, tp
                  sltu         s2, t2, a2
                  sub          sp, s2, s8
                  fmv.w.x      ft0, zero
                  ori          t6, a1, -485
                  lui          s7, 495431
                  flt.s        a6, ft5, ft1
                  slli         s6, s4, 18
                  fcvt.s.wu    fs5, a2
                  fmul.s       fa1, fa3, fa6
                  srai         s0, a0, 8
                  mul          a1, ra, s11
                  fsgnjn.s     fa3, ft8, fa2
                  sltu         sp, t3, s6
                  fsgnjx.s     fa7, fs8, fa5
                  fmv.w.x      fa4, a6
                  slli         a4, t1, 26
                  auipc        zero, 73610
                  div          s5, a3, t0
                  fcvt.s.w     ft8, a2
                  fle.s        a4, ft8, fs2
                  fcvt.w.s     s7, fs6, rne
                  remu         zero, s10, s8
                  fclass.s     t2, fs5
                  nop
                  flt.s        a0, ft11, fa3
                  fclass.s     tp, fa1
                  sll          t6, s4, s9
                  srli         s5, t3, 5
                  fcvt.s.wu    ft2, t5, rmm
                  slt          t0, s4, s7
                  ori          zero, gp, -896
                  fmin.s       fa5, ft3, fs6
                  fcvt.s.wu    fs4, tp, rne
                  addi         a4, t6, 653
                  fsgnjx.s     ft6, fs3, fa2
                  fmax.s       fa1, fs2, fa2
                  fmul.s       ft10, fa3, ft1, rtz
                  srai         ra, s2, 2
                  addi         t3, s5, -1014
                  fmv.x.w      t4, fs3
                  sll          a4, ra, a1
                  sltu         ra, ra, s9
                  remu         gp, t5, s3
                  flt.s        s0, ft1, ft7
                  divu         t4, s4, a6
                  feq.s        t6, fs4, fa2
                  srl          sp, gp, zero
                  divu         a2, gp, t6
                  fcvt.s.w     ft5, t2
                  fmul.s       ft11, fs3, fs1
                  fsgnjn.s     ft3, fa2, fs11
                  add          s7, t6, s4
                  mulhsu       sp, t6, sp
                  rem          a3, ra, t2
                  div          a4, t3, s11
                  and          s7, a5, s10
                  mulhsu       s6, s4, a3
                  feq.s        a4, fs9, ft7
                  addi         a0, s2, -1168
                  divu         s11, s9, s6
                  sra          s10, zero, s1
                  sltiu        s11, s1, -852
                  fmax.s       ft9, fa3, fs2
                  fmv.x.w      s5, ft6
                  srai         s0, a1, 18
                  add          a5, zero, t1
                  fmv.x.w      gp, fs8
                  flt.s        a3, fs6, ft10
                  xor          a5, a7, sp
                  or           s3, a6, t1
                  fadd.s       fa0, ft2, ft1, rdn
                  sub          s11, s4, a7
                  ori          t0, s8, -1472
                  sltu         t6, a2, t3
                  auipc        t5, 659534
                  sll          a5, t6, s7
                  xori         t4, a0, 2020
                  flt.s        s11, fa1, fs4
                  rem          s6, s9, t1
                  and          a4, s4, tp
                  xori         s7, zero, -1831
                  fclass.s     s5, ft8
                  fadd.s       fs7, fa7, fs8
                  slt          t3, a4, s9
                  fmv.x.w      s4, fa1
                  slt          tp, t0, s9
                  sltu         a7, s10, t1
                  mulhu        s3, t5, gp
                  and          s11, t5, sp
                  fmul.s       fa6, ft4, fa4, rdn
                  slli         t4, t6, 25
                  sltu         s2, a5, t3
                  fadd.s       ft9, ft8, fa5, rmm
                  add          sp, s9, t2
                  srai         tp, s10, 15
                  divu         a0, a7, a0
                  mul          a4, tp, a3
                  sltu         s5, a5, s7
                  divu         s0, sp, s4
                  fdiv.s       ft3, ft9, ft8
                  slti         t2, t4, 862
                  fle.s        t0, ft0, ft10
                  ori          ra, s2, 10
                  sub          a1, sp, a2
                  fle.s        t1, fa5, ft8
                  fadd.s       fa4, fs10, fs4, rup
                  divu         t1, s5, gp
                  or           zero, sp, s11
                  mul          t2, t6, s10
                  lui          s6, 636280
                  auipc        s0, 101026
                  fmax.s       ft6, ft1, ft1
                  sub          t1, s5, s7
                  srai         t1, s4, 17
                  andi         s7, s3, -667
                  fle.s        t3, ft11, fa0
                  srl          t4, sp, a5
                  mulhu        a2, a7, t0
                  srai         t6, s11, 3
                  fcvt.wu.s    t0, fs8
                  sra          t0, a2, a6
                  or           tp, t6, a0
                  lui          s3, 561424
                  rem          a5, sp, a7
                  ori          t4, a7, 815
                  fsgnjn.s     fs11, ft11, fa4
                  divu         zero, t0, s11
                  fsub.s       ft1, fs11, fa4
                  mulhsu       t5, a4, s6
                  divu         s4, s10, s2
                  fmul.s       ft1, ft3, fa3, rne
                  fmv.w.x      fs7, s5
                  fcvt.s.wu    fs9, a5
                  flt.s        t2, ft7, ft5
                  slli         t6, a1, 26
                  flt.s        s0, fa4, fs11
                  fsgnjn.s     fs3, ft10, fs4
                  mulh         a1, t3, t6
                  mulh         a0, a5, s5
                  fclass.s     zero, ft0
                  fmax.s       fs11, ft5, ft5
                  or           t0, t4, t5
                  fsgnjx.s     fa0, ft9, ft10
                  sra          s0, s4, t0
                  fcvt.s.w     fa6, s10, rne
                  mul          tp, a7, ra
                  slt          s2, s1, t1
                  fle.s        gp, fs4, fs1
                  xor          s2, t6, tp
                  rem          s3, ra, a1
                  feq.s        s0, fs11, ft3
                  remu         s5, s9, s5
                  xor          t5, s6, s7
                  slti         gp, s7, -1779
                  fmax.s       fs11, ft1, ft5
                  fcvt.wu.s    ra, fs9
                  remu         t5, a0, zero
                  divu         s5, t0, a5
                  div          s7, t0, s5
                  feq.s        s11, fa6, ft9
                  fmul.s       ft9, fs9, fa7
                  lui          a3, 518047
                  fsgnj.s      fa6, fs11, ft6
                  sltiu        s2, s6, -1858
                  mulhsu       t5, t4, s7
                  fcvt.wu.s    s5, fs1
                  slti         ra, gp, 420
                  div          t1, a2, s10
                  remu         sp, sp, s3
                  mulhu        a2, s4, s11
                  fcvt.s.w     fa4, s5
                  srli         a6, s1, 31
                  andi         t5, s4, 813
                  fmv.x.w      t5, ft0
                  sltu         s4, s10, s8
                  fadd.s       fs3, ft3, fs1
                  fsqrt.s      ft6, ft8, rne
                  rem          tp, t1, s9
                  slt          t3, s3, a6
                  fmv.x.w      t2, fs10
                  sltiu        a3, s9, -631
                  srli         a7, s1, 0
                  xor          a5, a4, s3
                  mulh         gp, a1, s5
                  fcvt.w.s     a2, ft0, rtz
                  fmax.s       ft8, ft11, fa1
                  remu         a6, t0, s6
                  andi         a0, t0, -1111
                  fdiv.s       fa1, fs11, fs8, rdn
                  xor          gp, s10, a0
                  fmv.x.w      s4, ft3
                  fmin.s       fs8, fa3, fs11
                  mulh         s5, s0, t0
                  lui          s0, 530467
                  addi         s0, t5, -510
                  fsgnj.s      ft5, fa7, ft2
                  xori         gp, s0, -498
                  addi         t4, s2, 483
                  auipc        s5, 715807
                  fclass.s     s4, fs6
                  mul          a1, a5, a4
                  srl          a1, t0, a6
                  auipc        a6, 265299
                  remu         s7, gp, s7
                  mulhsu       sp, t3, t3
                  flt.s        ra, ft8, fs4
                  fmin.s       fa0, fs11, fa1
                  andi         a6, s10, 1491
                  or           t3, t4, a0
                  and          s6, t3, a7
                  fcvt.w.s     a0, fa3
                  fcvt.s.wu    fs0, s8
                  mulhsu       a4, t4, a0
                  mul          s2, s7, t1
                  slt          sp, a7, t2
                  add          t3, t1, t3
                  sub          s7, a2, s3
                  fsqrt.s      fa3, fa6, rdn
                  fle.s        t3, ft11, ft4
                  slt          t4, s5, t1
                  fmv.w.x      ft0, s10
                  sub          a7, s1, s11
                  fsqrt.s      ft0, ft5, rne
                  xor          s0, zero, s0
                  fdiv.s       ft5, ft3, ft7, rup
                  fcvt.w.s     t3, fa6, rne
                  remu         t4, a6, t1
                  flt.s        a0, fa1, ft4
                  remu         s5, a0, s6
                  srl          gp, t0, s10
                  slti         a1, tp, -1568
                  div          a5, s4, a5
                  fsgnjx.s     ft11, fs0, fs8
                  fmul.s       ft1, fa4, fs10
                  xori         s11, tp, -1481
                  sra          t0, t0, s3
                  fdiv.s       fa7, fs5, ft9, rup
                  ori          s7, a4, 706
                  divu         zero, sp, s4
                  sltiu        a0, t6, 911
                  srli         s11, a3, 31
                  feq.s        t6, ft8, ft0
                  srl          t3, t5, a4
                  sub          t0, s11, a2
                  sub          s0, tp, a1
                  fadd.s       fa3, fa2, ft5, rdn
                  mulh         a6, s10, s11
                  srli         a6, t0, 1
                  fsgnj.s      fs1, ft3, fa2
                  flt.s        s6, ft8, ft7
                  sll          a1, s10, t1
                  addi         s0, s4, -983
                  fle.s        s6, ft2, fs3
                  mulhsu       s4, a4, s5
                  flt.s        t4, ft6, ft3
                  fmv.x.w      s6, ft8
                  xor          a2, t1, s9
                  fcvt.s.w     fs9, s7, rmm
                  fsgnj.s      fs7, fs9, fs1
                  fsub.s       fa2, fs10, fa2, rup
                  and          s3, a2, t2
                  auipc        t1, 1037849
                  fsgnj.s      fa3, fa7, fa7
                  fmul.s       fs5, ft5, fs0, rne
                  sra          sp, a7, s11
                  fmax.s       ft5, ft11, fs10
                  fmin.s       ft4, ft3, ft1
                  fsgnj.s      fs6, ft1, fs2
                  fdiv.s       ft2, fs2, ft11
                  sltiu        s2, t5, 861
                  fsgnjx.s     ft2, fs2, fs0
                  fsgnjn.s     ft0, ft6, fs11
                  flt.s        s4, fs3, ft7
                  fsgnjn.s     fa0, fa2, ft3
                  mulhu        zero, t2, s8
                  flt.s        s0, fa2, fa4
                  fsgnjn.s     fa2, fs9, fs0
                  slti         gp, s9, 735
                  or           a4, s8, t4
                  lui          s2, 210493
                  sltu         a1, a4, s0
                  andi         s7, s4, 1286
                  fmv.x.w      ra, fs10
                  or           a3, s7, a3
                  ori          t1, s3, 1567
                  flt.s        a7, ft1, ft4
                  sll          zero, a6, s2
                  fdiv.s       fs4, fs6, fs8, rtz
                  and          a7, a2, sp
                  sltiu        a2, ra, 1859
                  slli         t2, s2, 31
                  nop
                  fadd.s       fs4, fs5, fa1
                  fmul.s       fs5, ft8, ft1
                  fle.s        s10, fa0, fa2
                  rem          s3, t1, s8
                  fadd.s       fs11, fa7, fa2, rtz
                  fcvt.s.wu    ft11, s7
                  fsgnjx.s     fs5, fs7, ft6
                  sltiu        a5, s5, 586
                  slli         sp, t0, 10
                  div          s6, s1, ra
                  fadd.s       ft5, ft11, ft7, rne
                  lui          s2, 1029878
                  srli         s0, s8, 8
                  mulhsu       s11, s10, a1
                  nop
                  fsgnjn.s     fs10, fs5, fs3
                  rem          s10, t2, a7
                  fmv.x.w      t0, fs8
                  srl          t6, s8, a5
                  mulhsu       t2, gp, a7
                  fle.s        t5, fa1, ft11
                  mulh         a0, a5, s10
                  fcvt.w.s     a0, fa6, rtz
                  fle.s        s0, fs8, ft5
                  mulh         s6, s6, tp
                  sra          s7, a4, t6
                  fsub.s       fs7, fs6, fa5
                  fcvt.w.s     s3, fa4
                  fcvt.wu.s    a2, ft6
                  divu         a6, s0, a6
                  feq.s        t4, fs8, fs1
                  mulhsu       s3, zero, s5
                  fmul.s       fs6, ft0, fa0
                  addi         s6, a1, -1541
                  fmv.w.x      fs5, t5
                  divu         s10, s9, a2
                  slli         a3, a3, 12
                  fdiv.s       fs1, fs11, ft9
                  lui          a0, 367173
                  fcvt.w.s     t3, ft4
                  rem          s7, s1, s2
                  fcvt.s.w     fa0, zero
                  mulhu        a0, zero, s10
                  fdiv.s       ft8, fa2, ft2
                  or           t3, s7, tp
                  fmin.s       fa3, fs1, ft11
                  fsub.s       fa7, ft2, fa1
                  or           a7, sp, t5
                  divu         a6, a1, t2
                  fclass.s     a1, fa2
                  fadd.s       fa2, fs7, ft10, rmm
                  fsub.s       ft2, fa7, fa2, rup
                  remu         t4, a5, s3
                  fdiv.s       fs10, fs6, fa0
                  lui          gp, 38719
                  fsgnjx.s     fa3, ft9, fs10
                  addi         s7, ra, 589
                  sltu         a2, t6, a3
                  fmv.x.w      s4, fs6
                  fcvt.w.s     t4, fs2, rdn
                  mulh         t1, t0, sp
                  slli         zero, s11, 19
                  fsgnjn.s     fs0, ft6, fs5
                  fsgnj.s      ft9, fa6, ft7
                  mulhsu       s11, zero, tp
                  addi         tp, a4, -588
                  sltu         a6, a6, tp
                  and          tp, s0, a1
                  xor          gp, s6, tp
                  fsgnjn.s     ft4, ft4, fs9
                  rem          t6, t2, t2
                  xor          s2, a6, a5
                  fsgnjx.s     fs8, fs9, ft8
                  fcvt.s.w     ft11, t5
                  sll          a4, s11, s11
                  mulhsu       gp, s0, a3
                  srli         gp, a1, 18
                  mulhsu       s3, s0, s10
                  divu         s6, gp, s6
                  fmul.s       ft5, fs7, fa4, rtz
                  fmul.s       fa6, ft5, fs11, rup
                  fcvt.s.w     ft5, sp, rtz
                  fclass.s     a5, ft9
                  fmul.s       fa0, ft6, fa6
                  sltu         t4, gp, s0
                  andi         t3, s3, 185
                  rem          sp, s2, t2
                  nop
                  div          gp, t4, t4
                  fclass.s     t3, fs8
                  fcvt.s.w     fs10, a5, rne
                  lui          s7, 94359
                  divu         t6, s2, s1
                  xor          s10, a0, t0
                  fsgnj.s      fs6, ft6, fa7
                  mulh         ra, a0, sp
                  andi         a2, a3, -876
                  sub          a6, s6, a6
                  fcvt.s.wu    fs4, a4, rne
                  fmul.s       fs3, fa5, fa3
                  fsgnj.s      fs11, ft4, fa4
                  fcvt.s.w     fa0, tp, rne
                  fsub.s       fa6, fs7, fa5, rmm
                  sub          gp, s9, s3
                  fsub.s       fa1, ft9, fs10
                  fle.s        a6, fa7, fs8
                  fcvt.wu.s    ra, fs3, rne
                  slli         s11, tp, 13
                  fmul.s       ft4, fs11, fs11
                  rem          t2, s9, s8
                  xori         zero, a0, -1371
                  fadd.s       fs8, ft5, fs9, rup
                  srai         a2, s11, 14
                  fle.s        a2, ft0, fs4
                  fcvt.wu.s    t1, fa2, rup
                  fle.s        s6, fa0, fa5
                  mulh         s7, s4, t1
                  add          t1, a1, s11
                  slti         a6, a1, 1372
                  fmv.x.w      s2, fa6
                  slt          a0, s3, a1
                  andi         a3, t2, -1189
                  addi         t1, a2, -1337
                  mulhu        s11, a3, a3
                  remu         a7, s6, tp
                  fcvt.s.w     fa3, t5, rup
                  fmax.s       ft7, ft10, fs1
                  fcvt.s.wu    fs10, gp
                  nop
                  sltiu        zero, t0, -822
                  fadd.s       ft9, fs1, fa4
                  fclass.s     a4, fs10
                  div          tp, s2, t5
                  slli         a0, t3, 29
                  sra          s6, s9, a2
                  sra          t5, s4, a0
                  slt          gp, t2, a6
                  sub          sp, t4, s2
                  flt.s        s5, ft3, ft3
                  fdiv.s       ft2, ft7, ft3, rne
                  divu         t6, ra, t2
                  mul          a7, t5, a3
                  divu         s5, a6, t6
                  fadd.s       ft0, fs9, fa2
                  fdiv.s       ft6, fa2, ft10, rmm
                  xor          a7, s1, a1
                  srai         a3, t5, 25
                  mulhsu       a3, s9, s11
                  ori          s11, t0, -861
                  fsub.s       fa1, ft3, ft2, rdn
                  fmv.x.w      a3, fa7
                  slli         a0, t5, 26
                  fcvt.wu.s    t0, ft2
                  mulhsu       a3, t5, a0
                  fmax.s       fs10, fs1, fs3
                  fsgnjn.s     ft10, fs4, ft0
                  div          sp, s2, t5
                  or           s3, s4, s10
                  srl          a2, s7, a0
                  fsqrt.s      ft0, ft1
                  sub          a7, s10, t1
                  mulhsu       s11, tp, s6
                  fmin.s       ft9, ft7, ft9
                  fsub.s       fs4, ft3, ft11, rne
                  div          t4, t6, a4
                  slt          tp, s8, t6
                  fmv.w.x      fs5, t3
                  flt.s        s2, fs2, fs5
                  mulhsu       t2, gp, a2
                  fcvt.s.w     ft3, gp, rtz
                  mul          a2, s6, a1
                  addi         a5, sp, -1439
                  nop
                  feq.s        tp, ft0, ft5
                  flt.s        a4, fs6, fa4
                  add          a1, t1, s10
                  fle.s        s5, ft5, ft8
                  xor          a4, s10, s1
                  nop
                  lui          s11, 439699
                  slt          t2, a3, s9
                  fcvt.s.w     fa1, s2, rdn
                  fsub.s       ft2, ft6, ft4, rdn
                  or           tp, a0, a0
                  sra          sp, s9, s7
                  slli         a4, s2, 27
                  addi         sp, s2, 50
                  fcvt.s.wu    fa3, a7, rtz
                  rem          a7, s3, t3
                  fle.s        s6, ft7, fa5
                  sub          s0, s10, a3
                  addi         s3, a5, 2033
                  add          zero, s5, s0
                  mulhu        a2, t5, t5
                  flt.s        a7, fa2, fa5
                  fle.s        s6, ft2, ft2
                  fcvt.w.s     s10, fs10
                  srli         a1, a1, 28
                  fsgnj.s      ft9, ft10, fa2
                  fle.s        s4, fa7, ft5
                  slli         a6, zero, 15
                  mulhsu       a5, s10, tp
                  mulhsu       zero, t5, zero
                  slti         s2, t5, -88
                  fmv.x.w      s5, fa0
                  fdiv.s       ft10, ft5, fa0
                  fsqrt.s      fs1, ft10, rmm
                  fsgnjx.s     ft11, ft9, fa6
                  fmax.s       fs5, ft6, fa6
                  slt          s5, s9, a7
                  srai         s5, s3, 0
                  or           a1, s6, a6
                  mulhsu       tp, a7, t5
                  fmin.s       fs1, fa2, fa3
                  slti         s3, t2, -895
                  sub          ra, s3, t4
                  fsgnjx.s     fa4, fs6, fs1
                  fmv.x.w      s10, ft6
                  sra          zero, s2, gp
                  andi         a2, s6, 1196
                  slti         t1, gp, 1054
                  mul          s7, sp, a3
                  mulhsu       a7, a6, a5
                  add          sp, ra, ra
                  lui          t5, 52272
                  or           s0, s0, a1
                  sra          a5, a4, s2
                  slti         s4, tp, -1461
                  fsgnjn.s     fa5, fs1, ft10
                  fclass.s     a7, fs0
                  fmul.s       ft7, fs8, ft3
                  fclass.s     s10, ft2
                  srli         tp, sp, 19
                  fclass.s     t1, fs3
                  xor          tp, a7, a2
                  auipc        s4, 970493
                  sltu         a6, a0, a1
                  fcvt.s.wu    ft7, s8, rne
                  remu         s7, t4, s8
                  fcvt.w.s     gp, ft11, rne
                  fcvt.w.s     t6, fa0, rdn
                  feq.s        zero, fs10, fs5
                  andi         sp, s11, -1092
                  or           t4, a2, s9
                  fmv.x.w      a1, fs7
                  fcvt.s.w     ft4, t5, rmm
                  andi         s3, a3, 483
                  fsqrt.s      fa2, fs6
                  addi         s10, s8, -50
                  fmv.x.w      ra, ft2
                  fcvt.wu.s    t5, fa4
                  fcvt.s.wu    fs0, t1, rdn
                  mulhsu       a1, t0, a3
                  fmul.s       ft0, fs11, ft0, rtz
                  lui          a0, 831729
                  or           a2, s3, t5
                  fmin.s       fs0, fa4, ft11
                  divu         sp, s4, s1
                  srli         t6, t6, 29
                  remu         s0, a1, a4
                  sll          t2, tp, s10
                  addi         t4, t4, -554
                  nop
                  sltu         ra, t1, s1
                  auipc        s0, 596965
                  rem          gp, ra, a7
                  addi         a7, tp, 1530
                  xor          t4, a5, tp
                  sub          s4, zero, s4
                  remu         s10, a4, a2
                  fcvt.w.s     s4, fs6, rup
                  lui          s0, 135498
                  remu         s11, a6, t0
                  sra          s2, a2, a3
                  auipc        t2, 602857
                  nop
                  fmv.x.w      a2, fs2
                  fcvt.w.s     t4, fs3, rup
                  slti         s10, a3, -1516
                  srl          a4, a2, t0
                  fcvt.w.s     s6, fs2, rne
                  sll          s10, a5, a6
                  xori         a3, t6, 1854
                  sltu         s7, s5, a0
                  srl          s5, t3, s7
                  fmv.w.x      fs7, a2
                  andi         s3, a5, 1373
                  srl          t2, s6, a5
                  sub          t6, a4, s3
                  fclass.s     t6, ft4
                  fle.s        a7, ft3, fs8
                  fadd.s       ft11, ft0, ft11, rtz
                  srli         a3, t0, 21
                  fsgnjn.s     fa3, fa7, fa1
                  srl          t3, s5, s9
                  or           s6, s4, sp
                  sltiu        s5, ra, 403
                  fsgnj.s      ft11, fs8, fs1
                  fcvt.s.wu    fa4, s3, rtz
                  mulhsu       t3, s6, s4
                  divu         a1, s2, sp
                  sll          tp, a3, t1
                  auipc        s3, 321476
                  fmv.x.w      t5, ft11
                  remu         a1, a2, a0
                  andi         t6, s6, -247
                  fcvt.s.w     fa4, t1
                  fsqrt.s      fs8, fa1, rtz
                  fmv.x.w      a3, ft7
                  mulhu        s3, s6, s4
                  rem          s5, s1, t5
                  and          a3, a0, a5
                  lui          a4, 658229
                  fsqrt.s      fa7, fs8, rup
                  addi         a5, t4, -153
                  nop
                  srl          t2, t3, a7
                  fcvt.s.w     fa7, a3
                  srli         s4, s1, 8
                  auipc        a0, 550005
                  sll          t5, s1, a0
                  fcvt.wu.s    s7, ft9, rmm
                  sub          t4, t5, t5
                  fcvt.w.s     a4, fs0, rdn
                  fmax.s       ft0, ft4, fs0
                  sra          t5, s9, s11
                  fsgnj.s      ft10, ft2, fs7
                  andi         s4, sp, 191
                  fmv.x.w      s7, ft7
                  remu         t5, t1, s10
                  or           t3, a6, s0
                  fcvt.w.s     s3, ft8, rmm
                  fmv.w.x      ft9, gp
                  srl          tp, a0, s7
                  mulhu        ra, ra, a0
                  slt          gp, a6, gp
                  mulhu        t2, s4, s0
                  remu         t3, s6, ra
                  andi         t4, s5, -977
                  fcvt.w.s     s0, ft1
                  mul          s0, a0, a0
                  div          a6, a7, s8
                  xori         t3, t5, 508
                  srli         s4, a3, 9
                  fsgnjx.s     fa0, fs9, fa1
                  feq.s        t6, fa1, ft8
                  mulh         t0, s11, t5
                  sra          a3, a3, s1
                  rem          a7, s3, s9
                  fmv.x.w      t6, fs0
                  sra          t1, s11, a7
                  mulh         t4, s3, t2
                  lui          a4, 111465
                  fmin.s       ft2, fs6, ft10
                  and          a4, a3, s10
                  mul          s4, t3, a6
                  rem          s4, t2, a4
                  nop
                  andi         s2, s0, -1802
                  or           a3, tp, s0
                  mulhu        s11, a4, s1
                  ori          s2, s1, 727
                  addi         t4, s5, 429
                  auipc        t6, 222197
                  fmin.s       fa5, fa4, fa0
                  srli         s10, tp, 25
                  fmin.s       ft1, ft1, fs5
                  fsgnj.s      ft3, fs0, fa7
                  slli         t0, s7, 11
                  divu         tp, gp, t1
                  fmin.s       fa3, ft3, fs9
                  xori         zero, s5, 1972
                  fclass.s     s10, ft4
                  remu         t2, ra, s0
                  lui          s3, 738105
                  sltiu        s3, t0, -42
                  fcvt.w.s     s11, fs11, rtz
                  xori         ra, s9, 1901
                  slt          s0, s11, a1
                  mulhu        a7, a0, gp
                  sltu         s0, a0, s5
                  add          t4, s5, s4
                  fadd.s       fa4, fa6, fa5, rtz
                  fcvt.s.wu    fs1, t6, rtz
                  fmul.s       fa4, ft11, fa1
                  fsqrt.s      ft3, fa7, rmm
                  add          s11, ra, s7
                  fsqrt.s      ft8, fs9, rup
                  slt          s0, zero, tp
                  divu         s7, s2, s3
                  rem          a4, a3, t2
                  nop
                  fcvt.w.s     ra, fa7, rdn
                  ori          t3, s4, 1356
                  fmin.s       fs8, fs3, fa3
                  and          t2, a3, s4
                  feq.s        s6, ft9, ft3
                  fsgnjx.s     fs6, ft8, fa0
                  srli         zero, sp, 31
                  sub          a4, tp, s9
                  fcvt.s.wu    fa7, s3
                  fmv.x.w      s10, fs0
                  div          t2, t0, s8
                  mulh         s4, gp, a6
                  mulhu        s3, a5, t0
                  flt.s        a3, fs10, ft6
                  divu         t4, a1, s6
                  fcvt.wu.s    s2, fs8
                  xori         a4, a4, -808
                  add          s0, s2, s7
                  div          tp, s10, s9
                  and          s6, sp, s3
                  divu         s2, a3, s0
                  fsqrt.s      fs7, ft3, rup
                  addi         t5, a4, -38
                  andi         t0, s6, -619
                  fmv.w.x      ft6, s8
                  flt.s        s7, fs5, ft9
                  sub          t3, t0, sp
                  sltiu        t4, a6, 883
                  fmin.s       fs9, fa6, ft5
                  mulhu        t2, gp, a0
                  srli         s10, t3, 27
                  and          s7, t5, t2
                  fdiv.s       fa0, ft8, ft11, rup
                  add          a4, a7, s1
                  mul          s3, a2, ra
                  fcvt.s.wu    fa5, s11, rdn
                  auipc        t2, 20213
                  slli         a4, tp, 15
                  ori          t4, a3, -929
                  fsqrt.s      ft7, fa4
                  slt          a6, s8, s10
                  divu         sp, s11, s0
                  fsgnjn.s     fs8, fa4, fs9
                  auipc        t4, 856425
                  addi         s11, t2, -689
                  xori         a0, a2, 978
                  srai         s5, zero, 11
                  srai         s4, sp, 4
                  mulhsu       s3, s0, a6
                  fsgnjn.s     fs7, ft1, fa4
                  sltiu        a3, s7, -1428
                  fcvt.s.w     fa6, t1
                  fcvt.w.s     gp, ft3
                  fmul.s       ft10, fa4, ft5, rup
                  fmv.w.x      ft6, a3
                  ori          s0, a3, -1171
                  addi         s4, a3, -1651
                  auipc        s7, 940135
                  srai         zero, s2, 31
                  or           a4, s9, s5
                  fsgnjn.s     ft6, fa6, fs10
                  fmax.s       fs1, ft2, ft7
                  fmv.x.w      s3, fa1
                  andi         s10, a6, 351
                  fmv.x.w      a1, fs8
                  fdiv.s       ft5, fs9, ft10, rtz
                  fmv.x.w      s0, fa5
                  fmv.w.x      ft5, a5
                  and          s5, s7, s0
                  mulhsu       sp, a4, t6
                  fadd.s       fa3, fa4, fs1, rne
                  fclass.s     gp, fa6
                  mul          a6, a2, gp
                  sra          t6, a2, s4
                  slti         s10, t1, -554
                  and          s0, a7, s4
                  fmv.w.x      fa1, ra
                  mul          s2, s1, zero
                  fcvt.s.w     fa1, zero
                  sub          t5, a2, s5
                  mul          sp, zero, gp
                  slt          a2, s6, s3
                  addi         a6, a6, 42
                  sra          s5, t2, s7
                  add          a4, t2, s6
                  srai         s5, s6, 13
                  srai         t5, t2, 10
                  mulhu        s11, a6, s3
                  srai         a0, a7, 3
                  ori          t6, s7, 1204
                  srl          s3, zero, a4
                  divu         s6, s9, a7
                  xori         a5, t1, 975
                  fmv.x.w      s5, fs2
                  nop
                  remu         a3, a5, t2
                  sltu         s0, s11, a1
                  andi         a4, s8, -1106
                  add          s7, a2, tp
                  fsub.s       ft8, fa5, ft7, rdn
                  fmv.w.x      fa6, s11
                  ori          a6, s6, 1508
                  fmul.s       fs3, ft5, fa6
                  ori          s3, s9, 888
                  rem          t5, a3, s11
                  fclass.s     t0, fs2
                  fcvt.w.s     gp, ft0
                  slti         s11, a1, 1529
                  slti         a2, zero, -742
                  feq.s        sp, ft1, fa2
                  xor          s2, s11, a6
                  slt          tp, t6, s3
                  fsqrt.s      fs6, ft8, rtz
                  fsub.s       fa1, fa2, fs8, rne
                  fmax.s       fs5, fa1, ft11
                  fcvt.wu.s    s4, ft11, rdn
                  fmul.s       ft2, fs8, fs6
                  divu         sp, s8, a4
                  mulhsu       s10, t6, a7
                  remu         t1, zero, ra
                  fsub.s       ft9, fs6, ft9, rmm
                  nop
                  fclass.s     t5, fa2
                  lui          a2, 269975
                  fle.s        zero, ft11, fa1
                  srai         zero, s0, 4
                  fsgnjn.s     fs3, fs0, ft6
                  mulhsu       a6, sp, s9
                  fcvt.s.wu    fs11, t4, rmm
                  addi         s11, t5, -220
                  feq.s        a3, ft6, fs1
                  fmv.x.w      t4, fs7
                  sub          a4, gp, a3
                  slti         a0, s0, 1255
                  xor          a0, a4, zero
                  fsgnj.s      ft11, fa2, fs11
                  nop
                  lui          a5, 782042
                  fsgnjn.s     fa0, fs2, fs3
                  fsgnj.s      fs3, fs7, fs5
                  fcvt.s.wu    fs6, t3
                  nop
                  mulhu        s2, a4, s7
                  fsgnjx.s     fa4, fs5, ft11
                  fmul.s       fs4, fs4, fs1, rdn
                  xor          a0, sp, s10
                  srl          s6, s11, zero
                  fcvt.wu.s    t0, fs4, rtz
                  fcvt.wu.s    a2, fs7, rne
                  srli         s7, t5, 24
                  lui          a3, 837072
                  fcvt.w.s     s3, fs11
                  sra          s10, s1, t4
                  fsub.s       fa0, ft9, fs2
                  xori         sp, s5, 848
                  fcvt.wu.s    a6, ft6, rup
                  mulh         t4, a7, s8
                  fmin.s       ft5, fa0, fs6
                  mulh         sp, t1, s2
                  or           ra, tp, s6
                  fmv.w.x      fa3, a5
                  slti         a7, a7, -1350
                  fsgnj.s      fs6, ft9, ft5
                  fmv.x.w      s6, fs11
                  sltiu        a6, tp, 804
                  sltu         t2, s5, a1
                  fsgnj.s      ft7, fa0, ft2
                  srli         ra, s1, 17
                  fsub.s       ft5, fs9, ft8, rup
                  fsqrt.s      fa2, ft2, rdn
                  ori          t6, ra, 597
                  fcvt.s.wu    ft0, zero
                  fle.s        sp, ft0, fs9
                  fmax.s       ft8, ft8, ft11
                  lui          t2, 8882
                  fsgnjx.s     fa2, ft4, fs3
                  fmv.w.x      ft5, a0
                  divu         s0, gp, s9
                  divu         a4, a2, t6
                  slti         s5, ra, 1101
                  nop
                  slti         sp, zero, -89
                  fcvt.w.s     s3, ft2
                  fmv.w.x      fs10, ra
                  fsqrt.s      fs10, ft5
                  addi         s6, a1, 57
                  addi         a1, s0, -972
                  flt.s        t2, fs6, fa5
                  fle.s        gp, fs7, ft9
                  fsgnjx.s     fs4, fa3, fa0
                  sltiu        s7, tp, -559
                  nop
                  slt          t0, a4, t0
                  slli         s7, s11, 13
                  fsgnj.s      fa3, ft11, fa5
                  srl          a0, s11, t0
                  fle.s        a7, fa4, fs3
                  sll          gp, s1, sp
                  sltiu        s11, s11, -484
                  fcvt.s.w     ft7, s1, rup
                  sltiu        a0, s4, 1119
                  mulhu        s0, s5, s5
                  mulhu        s6, t0, s2
                  xor          a4, s1, s7
                  fsgnjx.s     ft7, fs8, fs0
                  fclass.s     t3, ft4
                  fmul.s       fs1, fs6, fa6, rmm
                  fmv.x.w      t6, fa5
                  srai         a5, s2, 6
                  fsub.s       fa6, ft3, ft11, rdn
                  and          a3, s9, s9
                  fsub.s       fa7, fs6, ft1, rmm
                  feq.s        a7, fs3, fa6
                  lui          a0, 375053
                  sra          t0, s8, t3
                  srli         s5, a3, 18
                  fsqrt.s      fa0, ft9
                  mulh         s0, t6, t5
                  and          a2, t4, s9
                  fclass.s     s2, fs9
                  slti         s7, t1, 1509
                  div          zero, t1, a1
                  andi         s10, t0, 1851
                  flt.s        s3, ft7, fa7
                  fmv.w.x      ft2, tp
                  add          a2, zero, a0
                  divu         s6, a1, t1
                  mul          s6, s0, s1
                  fcvt.s.w     ft7, s3
                  feq.s        sp, ft5, fa5
                  fsgnj.s      fa1, fs6, ft2
                  remu         t6, tp, s6
                  mulhsu       a2, s11, t3
                  sll          s7, s6, a6
                  ori          s4, a4, 1718
                  srai         t5, ra, 23
                  sll          t1, a3, s3
                  fadd.s       fa2, fa4, ft6
                  fsgnj.s      ft5, ft9, fa6
                  flt.s        a0, ft0, fs1
                  mul          ra, t0, a3
                  sub          s7, a4, s7
                  andi         a3, t6, 1635
                  mulh         t3, a5, s3
                  slt          a0, s6, a1
                  andi         s7, t6, 831
                  sub          s7, s4, s6
                  slt          t6, t5, s11
                  slli         s0, a3, 20
                  sll          t0, a7, s10
                  slt          sp, s4, a4
                  or           a0, a6, s5
                  fadd.s       fs0, ft0, fs4
                  auipc        t0, 143541
                  sltiu        t4, s11, 674
                  rem          s7, a5, a7
                  flt.s        s3, fa4, fa2
                  remu         s4, a1, s11
                  fmax.s       ft9, fa5, fs9
                  sltu         t5, zero, a0
                  and          zero, a7, s1
                  fmv.w.x      ft4, a6
                  srli         t5, t4, 2
                  fcvt.s.w     fs10, t3, rtz
                  or           s5, ra, t1
                  mul          a4, s5, s1
                  fsgnj.s      ft6, ft10, fs5
                  fsgnjx.s     fs3, fs7, fs7
                  fmin.s       fs6, ft5, ft6
                  nop
                  feq.s        a1, fa5, fa4
                  addi         s4, s3, -969
                  rem          s11, a1, sp
                  divu         s7, a3, s11
                  slti         a3, s8, -1006
                  and          a3, s3, t4
                  fmul.s       fa2, fa3, fs3
                  fmin.s       fs5, fs0, fs7
                  add          s10, s4, a0
                  fmul.s       ft4, fs5, fs8
                  divu         t6, sp, s11
                  mulh         a3, s1, gp
                  xor          s7, ra, s9
                  srai         s2, a0, 3
                  fcvt.s.w     fs8, t0, rtz
                  fcvt.s.wu    fs2, a7
                  add          ra, s9, gp
                  ori          t2, sp, -87
                  mulh         zero, a4, t4
                  mulhu        a1, s6, a5
                  divu         s2, a4, t0
                  fcvt.wu.s    a2, fs0, rtz
                  fmax.s       fa4, ft7, ft9
                  fmul.s       fs7, fa3, ft10, rup
                  sra          t4, a7, s10
                  slli         s2, s10, 25
                  flt.s        a1, ft3, fs8
                  fadd.s       fa2, ft11, ft10, rtz
                  fsub.s       fs7, fs0, fs8
                  srai         t5, a5, 1
                  sub          a0, t2, t6
                  fmax.s       fs2, ft4, ft10
                  xor          a4, s2, a7
                  lui          zero, 883378
                  sltiu        s3, s4, -1730
                  fmax.s       fs6, fs2, ft3
                  fcvt.w.s     gp, fs1, rup
                  slli         t5, a3, 12
                  fmul.s       ft0, ft6, ft6
                  xor          a2, tp, t6
                  sra          s2, t6, s0
                  or           ra, a6, s9
                  fsqrt.s      fs0, ft6
                  slli         a4, sp, 17
                  divu         t0, zero, t0
                  mulhu        s10, s7, s3
                  add          a7, sp, tp
                  addi         t2, s4, -931
                  srli         s4, gp, 23
                  mulhsu       s5, t0, s10
                  sub          tp, s8, s2
                  remu         a7, a1, s9
                  fsqrt.s      ft11, fa0, rne
                  andi         t4, a5, -904
                  srl          s11, s11, s1
                  mulh         s2, s8, s0
                  fmv.x.w      s4, fa1
                  auipc        s0, 147755
                  fmv.w.x      ft8, s7
                  fle.s        s2, ft0, fs3
                  fclass.s     t2, fs5
                  srai         t2, a0, 18
                  slt          a0, s1, gp
                  fcvt.wu.s    s0, fs10, rdn
                  xori         ra, tp, -1164
                  fmin.s       ft7, fa1, ft3
                  sltu         s11, t0, s5
                  ori          s10, a1, -1749
                  feq.s        s7, fa0, fs1
                  remu         s4, sp, a0
                  sra          a5, a0, s2
                  lui          t3, 375205
                  auipc        a6, 983352
                  sra          a3, t1, a0
                  fclass.s     s2, fs9
                  feq.s        t0, fa2, fa3
                  flt.s        a5, fs3, fa0
                  slli         t1, tp, 26
                  and          ra, a6, a5
                  fsgnjx.s     ft1, ft8, fs0
                  or           t1, t3, t5
                  fclass.s     sp, ft1
                  and          t5, s4, s8
                  remu         s3, a4, s2
                  auipc        s11, 933703
                  sltiu        a7, s3, -532
                  fle.s        a0, fa6, fa4
                  fmul.s       fa0, fa3, fa4
                  divu         t3, s0, s3
                  nop
                  sra          tp, t4, s9
                  srli         s10, a6, 5
                  xori         a2, s11, -1002
                  sll          s5, t4, s4
                  remu         a0, s7, a3
                  srli         t6, s11, 4
                  feq.s        ra, ft9, ft8
                  sltiu        s7, ra, -403
                  srai         ra, sp, 29
                  srl          a1, s2, t1
                  slt          t4, a0, s10
                  add          tp, a5, ra
                  srl          a6, t3, a7
                  div          a3, s3, t5
                  slti         s2, ra, 1675
                  fmax.s       fs4, ft9, ft11
                  nop
                  lui          s5, 714811
                  sltiu        s11, sp, 1458
                  mul          a4, gp, t6
                  fcvt.wu.s    a5, fa1
                  addi         sp, s0, 859
                  fcvt.s.w     fs3, s9, rtz
                  sltiu        t3, a7, 9
                  feq.s        zero, fs0, ft7
                  sltiu        t0, a1, -411
                  fmul.s       ft8, fs6, ft10
                  addi         tp, t6, 999
                  lui          s7, 673773
                  sll          t3, tp, tp
                  fclass.s     t6, ft10
                  srli         ra, t4, 15
                  fadd.s       fs11, fs4, ft0
                  fmul.s       ft2, fs1, fs9, rtz
                  fmin.s       fa5, ft8, fa7
                  div          s11, t4, t5
                  srl          ra, gp, sp
                  srli         a5, a2, 23
                  fmv.w.x      ft5, a5
                  xori         zero, zero, -572
                  mulh         a2, t5, a2
                  feq.s        tp, ft1, ft6
                  fsgnjx.s     fs10, fs1, fs3
                  auipc        s0, 681294
                  sltiu        t2, a4, -1133
                  fmax.s       ft11, fs8, fa1
                  fclass.s     t3, ft7
                  fadd.s       fa1, fa4, ft5
                  sub          s2, ra, a2
                  fsgnj.s      ft7, ft6, ft3
                  fmin.s       fa2, fs9, ft5
                  andi         s7, a4, -1001
                  and          ra, s0, s11
                  fmin.s       fa6, fs7, ft9
                  srli         a7, a3, 11
                  nop
                  sra          zero, t0, a4
                  div          tp, sp, s11
                  mulhsu       t5, t4, s9
                  and          s6, s5, t5
                  xor          a3, s4, a1
                  fsgnj.s      fs0, ft5, fa7
                  feq.s        a6, fs10, fs2
                  fle.s        t3, fa4, fs5
                  add          sp, s7, zero
                  fcvt.s.wu    fs9, t1, rup
                  fsub.s       fs2, fs10, ft2
                  rem          t2, sp, s8
                  mulhsu       ra, zero, s6
                  fsgnjx.s     fa4, fs9, ft5
                  fle.s        s11, fs5, ft1
                  sltu         t4, t4, zero
                  rem          a4, a6, a0
                  mulhsu       ra, s3, s11
                  and          t5, t1, gp
                  fsgnjx.s     fs8, ft3, fs1
                  fsgnjn.s     ft11, fa2, ft3
                  fmv.w.x      ft10, a5
                  and          a0, t1, t3
                  fsgnjx.s     ft6, ft1, ft10
                  feq.s        a0, fs6, fa7
                  addi         a3, a1, 808
                  srai         s10, s3, 8
                  fcvt.w.s     s7, fa4
                  fcvt.s.w     ft10, gp, rup
                  sub          gp, a2, ra
                  xor          t1, t1, s3
                  sra          zero, a0, a6
                  div          zero, t2, s7
                  fmax.s       fs0, ft4, fs11
                  fmv.w.x      fs3, s6
                  andi         a3, s10, -289
                  auipc        s7, 257910
                  fmul.s       fa3, ft4, ft1, rup
                  fsub.s       ft0, fa3, fs10
                  nop
                  fclass.s     a1, ft2
                  flt.s        a3, fa1, ft11
                  srl          t2, s9, s1
                  and          a6, a6, gp
                  and          gp, s6, s3
                  fsgnjx.s     ft8, fa0, ft11
                  mul          ra, t6, t5
                  divu         gp, s10, s7
                  sltiu        s2, a5, -323
                  fcvt.wu.s    a4, fa3
                  fmin.s       fs3, fs4, fs9
                  fcvt.s.w     fs3, a5
                  feq.s        s7, fs2, ft6
                  div          s7, t0, s1
                  srli         gp, a0, 19
                  and          a7, zero, t5
                  remu         sp, tp, a6
                  add          zero, a3, s8
                  srli         a0, s11, 14
                  slt          s10, a3, t2
                  lui          a6, 87408
                  nop
                  fcvt.wu.s    zero, fs3
                  fmv.w.x      fa0, sp
                  fcvt.w.s     a7, ft5, rtz
                  fmin.s       ft7, ft3, fa3
                  sub          t1, a2, a6
                  fmul.s       fs4, fa7, fs9, rmm
                  sltiu        sp, a2, 1564
                  fmin.s       ft1, ft3, ft8
                  rem          s4, a1, ra
                  mulhu        t0, s2, s11
                  sltu         s11, t1, s10
                  mulhu        gp, tp, s8
                  fsqrt.s      ft2, fa2
                  andi         a5, s9, -350
                  sltu         t5, t6, a0
                  lui          s5, 181643
                  flt.s        a7, fa3, fa6
                  fadd.s       fa0, ft11, ft3, rup
                  rem          t6, a4, tp
                  mulhsu       sp, s3, t5
                  fcvt.w.s     tp, fa2, rmm
                  fsgnjx.s     ft3, fs9, ft8
                  fmul.s       fa6, ft9, fs11, rne
                  addi         t3, s8, 1958
                  fsub.s       fs7, ft1, fa4, rmm
                  divu         a6, s0, s2
                  mul          s4, s4, t1
                  div          zero, t3, sp
                  fle.s        s4, fs2, ft2
                  fmax.s       fa3, fa6, ft0
                  rem          a6, s11, gp
                  mulh         a4, a7, sp
                  flt.s        a0, fa4, fa4
                  rem          a2, a0, s8
                  and          s5, t2, t3
                  remu         t1, s3, t0
                  fmin.s       ft0, ft1, ft2
                  div          t3, a5, gp
                  fdiv.s       fa6, fs8, fs10
                  sltiu        a3, s6, 567
                  srli         a3, t2, 1
                  feq.s        s11, fa7, fa7
                  fsqrt.s      fs10, fs8, rdn
                  fdiv.s       ft7, fa3, fs0
                  fmv.w.x      ft5, s10
                  fadd.s       ft4, fs1, fa2, rne
                  sub          a3, t1, t0
                  andi         a4, s0, 1520
                  flt.s        zero, fs0, fs4
                  sub          tp, s0, s9
                  slli         t3, s6, 8
                  sub          zero, s11, s9
                  fadd.s       ft11, fa5, fs3, rmm
                  fmin.s       fs9, fa0, fs8
                  mulhsu       s0, sp, s4
                  srai         t3, s8, 29
                  fcvt.wu.s    s11, fa5, rtz
                  fadd.s       fa6, fs6, ft4
                  auipc        a5, 566620
                  fle.s        a6, fa5, fs6
                  srli         t0, a5, 1
                  fdiv.s       fa5, fs3, fa3, rtz
                  sub          a5, s3, s2
                  sltiu        s7, a1, 762
                  remu         s4, a6, s7
                  ori          s3, t5, -82
                  andi         zero, t6, -873
                  divu         t3, sp, a4
                  fcvt.s.w     fa3, s1, rdn
                  slti         tp, t4, -1102
                  or           s4, s2, zero
                  fdiv.s       fs10, ft9, ft7
                  fmin.s       fa0, fa4, fa6
                  mulh         a2, a5, s0
                  sra          s10, t6, a5
                  fsgnjx.s     fs3, fa4, fs3
                  addi         a3, s2, 725
                  add          a4, gp, a7
                  fclass.s     t4, fs6
                  or           s5, a1, a5
                  xori         s2, s10, 2015
                  addi         s3, s7, 621
                  mulh         s0, t5, s9
                  add          t1, a2, a0
                  feq.s        a3, ft0, fa1
                  srli         ra, t3, 1
                  fmv.w.x      ft9, a4
                  addi         t0, t2, -68
                  fmv.x.w      s5, ft11
                  xor          s6, s6, s9
                  rem          s7, a0, s9
                  add          s6, tp, ra
                  fmul.s       ft4, ft1, ft3, rtz
                  fcvt.w.s     a7, fs1, rmm
                  fsgnj.s      ft10, fs1, fa6
                  slt          s6, a0, t1
                  and          a2, s7, t6
                  div          t3, a5, zero
                  remu         t2, a4, s0
                  fcvt.s.w     fs11, s9, rmm
                  div          t1, s1, zero
                  slli         a2, a2, 16
                  srl          a3, s1, a3
                  fclass.s     s5, fa2
                  fmv.w.x      fs9, t2
                  sltu         a7, tp, s10
                  fsgnj.s      fa2, fs9, fa1
                  fsgnjx.s     fs1, fa0, ft2
                  xori         sp, a7, -402
                  fsgnjn.s     fa4, fs8, ft2
                  fmax.s       ft8, fs9, fa6
                  ori          s7, s0, 335
                  fsqrt.s      ft2, ft6
                  lui          t4, 589584
                  fmv.x.w      s7, ft9
                  fcvt.w.s     s3, fs2
                  fcvt.s.wu    fa2, s11
                  sltiu        a5, gp, 1260
                  fsgnj.s      ft8, fs10, fa3
                  fclass.s     t6, fs10
                  and          s3, t0, a7
                  fsgnjn.s     ft10, ft10, fa6
                  sra          a4, s0, t6
                  remu         a7, t6, tp
                  fcvt.w.s     t5, fa1, rup
                  auipc        t1, 864778
                  slli         a2, s2, 4
                  remu         s4, a2, a6
                  fmv.x.w      a6, ft11
                  sltiu        s6, t3, -1884
                  sll          a5, a2, a6
                  fmv.x.w      s3, fa1
                  xori         s6, a5, 508
                  fle.s        s6, ft10, ft10
                  fmin.s       fs4, ft11, fs4
                  slli         t6, a4, 8
                  sll          a1, a3, t3
                  srl          a7, s3, s8
                  fsqrt.s      ft7, fa3, rtz
                  add          t4, s1, t6
                  fdiv.s       fa3, fs5, fa2, rmm
                  remu         s6, gp, a7
                  mulh         s4, s1, ra
                  srli         t5, a0, 26
                  fle.s        s10, fs9, fa4
                  ori          t3, a6, 1613
                  srl          t2, a3, t3
                  slli         gp, ra, 20
                  xor          t6, s0, a5
                  mulh         s2, t0, s2
                  mul          s5, a7, t3
                  fmul.s       fs10, fs7, fs2
                  divu         a2, sp, ra
                  addi         s6, s4, -1040
                  ori          t4, t5, 1573
                  sra          s10, s10, s5
                  fle.s        t4, fs9, fs11
                  div          s2, t0, sp
                  remu         s4, t2, t5
                  rem          t0, s5, a6
                  sra          t0, s10, a1
                  and          s4, s7, gp
                  mulh         t3, t6, a4
                  xori         s4, a3, -704
                  or           a6, a3, a1
                  sltiu        s7, a4, -742
                  or           s6, s7, a0
                  fmv.w.x      fs10, s3
                  fclass.s     a4, fs9
                  ori          s10, a0, -2007
                  slt          t6, s0, a5
                  fsgnjn.s     ft10, fs4, ft7
                  feq.s        s7, ft10, fs7
                  sra          t1, a1, t6
                  srai         sp, s2, 0
                  sll          t6, a3, s2
                  mulhu        t6, a7, a5
                  fmin.s       fs5, ft9, fs2
                  fmv.x.w      a4, fa2
                  or           ra, s3, s4
                  srli         gp, t5, 31
                  srai         a3, gp, 27
                  lui          s11, 497815
                  sub          t1, a6, a5
                  fmv.w.x      fs2, t1
                  slti         s3, a4, 1371
                  fcvt.w.s     s3, fs11, rup
                  fmax.s       fs4, fs6, fs4
                  addi         s6, a1, 1288
                  fmv.x.w      a0, fa3
                  feq.s        a6, fa2, fa4
                  mulhu        a6, a3, sp
                  fcvt.s.wu    ft0, s0
                  addi         s6, t2, -227
                  mul          t2, a1, ra
                  xor          a2, a2, zero
                  xor          a7, a4, sp
                  feq.s        a5, fs11, ft9
                  andi         zero, s5, 431
                  mulh         t5, sp, tp
                  sltu         a6, gp, t6
                  sltiu        a0, a0, 118
                  fmv.w.x      fs2, a4
                  sra          tp, s6, ra
                  fcvt.w.s     zero, ft11
                  fmul.s       ft1, fs2, ft8
                  fcvt.wu.s    t6, ft2
                  sra          t3, sp, s3
                  fsqrt.s      fs6, fa3, rtz
                  fsub.s       fa3, ft0, fs5
                  slt          s2, a2, t2
                  sltu         tp, t5, s3
                  fsgnjn.s     ft6, fs1, fs8
                  mulh         ra, sp, s1
                  addi         t3, s8, 233
                  slli         t1, a5, 19
                  divu         t0, a0, tp
                  srl          a2, s5, tp
                  fclass.s     a3, fs0
                  lui          zero, 246883
                  ori          s10, a1, -590
                  fsgnjx.s     fs6, ft7, fs1
                  sll          s11, t2, t5
                  sltiu        t3, s0, -658
                  mulhu        a7, a1, s7
                  mulhsu       s3, s2, a3
                  fsgnjx.s     fs5, fa5, fs7
                  fsgnjn.s     fa6, fa1, fs6
                  fcvt.w.s     t5, ft1
                  divu         t2, a1, gp
                  mul          tp, t3, a4
                  fmul.s       fa1, ft1, fs5, rmm
                  sltu         a3, a7, s0
                  divu         s4, a2, s7
                  mul          a7, a3, t2
                  fsgnjx.s     ft11, fa1, ft3
                  fsgnjx.s     fa0, fs2, fs7
                  fsub.s       fs0, fs9, ft2, rne
                  add          s7, s7, a3
                  fcvt.s.w     fs5, gp, rup
                  sll          s0, s8, s7
                  addi         gp, s3, 353
                  fsqrt.s      ft4, fa5, rne
                  fdiv.s       fs10, fs0, ft8, rne
                  fmv.w.x      fs7, a3
                  xor          t4, s11, s4
                  fle.s        t0, fs8, fs6
                  fcvt.s.w     ft10, tp, rne
                  sltu         gp, t2, a3
                  mulhu        t2, t3, a1
                  andi         s5, a0, -2046
                  ori          s3, a6, -546
                  and          gp, gp, s10
                  fcvt.s.w     ft7, s7, rmm
                  sltiu        s10, s2, 912
                  fsgnj.s      fa2, ft11, fs10
                  fmv.w.x      fs0, a1
                  nop
                  xori         a6, t0, 1459
                  fdiv.s       fs1, ft3, ft6, rtz
                  sltiu        gp, s3, 1881
                  feq.s        t4, ft8, fs3
                  fmin.s       fa7, fa5, ft10
                  ori          t1, a6, -464
                  xor          t3, a3, s7
                  slti         a1, t1, -849
                  fmv.x.w      s5, fs3
                  fcvt.wu.s    s7, fs10
                  or           a5, s6, s1
                  sub          tp, s3, t4
                  mulh         s2, s5, s4
                  fcvt.s.w     fa4, s10
                  fsgnj.s      fs3, ft8, fs2
                  xori         a0, s11, 370
                  feq.s        a3, ft3, fa6
                  sra          t1, s6, s0
                  flt.s        ra, fs10, ft4
                  divu         a0, a2, t3
                  fcvt.s.wu    fs4, s0
                  fmv.x.w      tp, fa3
                  div          a2, ra, s8
                  xori         s2, s9, 899
                  mulhu        s3, t1, s10
                  srl          ra, s0, a1
                  xor          s10, t3, a5
                  mulh         tp, a4, t4
                  mulhsu       ra, a1, t6
                  sltiu        s6, s1, -2047
                  sltiu        t0, s5, -822
                  add          s6, tp, a2
                  mul          s2, a7, s8
                  lui          s10, 144978
                  srai         s0, t2, 12
                  fcvt.s.w     fa2, a4
                  xori         a2, tp, 1797
                  nop
                  remu         a5, a2, a1
                  andi         sp, t3, -120
                  lui          a0, 694651
                  fcvt.s.wu    fs2, s6, rne
                  fadd.s       fa6, fs0, fs9
                  fsgnjn.s     fs11, fs9, fa1
                  sltu         t3, t1, sp
                  slli         t3, s10, 21
                  fcvt.s.wu    fa5, s9
                  sltiu        zero, tp, -792
                  flt.s        t6, fs2, fs0
                  andi         a5, a4, 714
                  srl          t2, s3, sp
                  or           ra, s5, t0
                  fmax.s       fs7, fs1, ft4
                  fclass.s     a1, ft2
                  flt.s        s7, fa1, fa6
                  fdiv.s       ft1, ft11, fs3
                  or           s4, t6, s8
                  srl          a4, a7, a2
                  xori         sp, s0, 1896
                  fadd.s       fs6, fa1, fa6
                  fsub.s       fs6, ft6, ft4, rne
                  ori          s3, sp, 93
                  xor          sp, s5, t4
                  fcvt.s.w     ft9, a1, rmm
                  srai         sp, a1, 26
                  mulhsu       a4, a4, s4
                  remu         s0, s8, ra
                  sltu         zero, s2, a3
                  lui          s5, 130695
                  slti         gp, s11, -423
                  srl          a6, t0, zero
                  fcvt.w.s     s11, ft3
                  sll          t3, a6, s8
                  fmin.s       ft6, fs9, fa0
                  fsgnj.s      fs6, fa3, fs3
                  sltu         s5, t3, sp
                  auipc        a2, 433837
                  slt          t4, s2, zero
                  addi         t6, a2, -524
                  fcvt.s.wu    ft10, a6
                  fmv.x.w      zero, fs8
                  fadd.s       fs1, ft6, ft8
                  srl          a2, s3, ra
                  fsub.s       fs4, fs9, fs10
                  mulhu        s3, s8, a6
                  fclass.s     s2, fs9
                  fmin.s       ft4, fa6, fs7
                  andi         s5, t3, -1825
                  fsgnjn.s     ft2, ft7, fa0
                  div          sp, a4, zero
                  fsgnjn.s     fa1, fs11, fs6
                  mulhsu       gp, a7, s4
                  srl          t2, s10, a7
                  fcvt.w.s     s4, fs5, rmm
                  lui          zero, 336618
                  fmv.x.w      t0, fs9
                  flt.s        t1, fs6, fa2
                  divu         a2, tp, s1
                  or           t4, s1, a2
                  and          s5, t0, a6
                  xor          t5, s2, s2
                  addi         t5, zero, -1199
                  fcvt.w.s     ra, fs8
                  andi         s7, s6, -1885
                  slt          s11, gp, t2
                  slt          s3, a6, a6
                  slli         t5, ra, 3
                  remu         s11, s0, ra
                  slt          a5, s0, t5
                  mulh         t2, a2, sp
                  slt          t4, t2, tp
                  fmax.s       fa1, ft2, ft7
                  ori          t1, s0, 1283
                  slti         t2, s6, -960
                  fsub.s       ft3, fs1, fs11, rtz
                  sltiu        s4, a4, -1610
                  fclass.s     a6, fs5
                  fcvt.w.s     t3, fa2
                  srli         t1, t6, 3
                  fsgnj.s      ft11, fs1, fa5
                  flt.s        sp, ft4, ft0
                  fmul.s       ft11, ft5, fa3
                  fmv.x.w      t6, ft6
                  addi         gp, a0, -1271
                  and          a3, t1, zero
                  fsgnjn.s     fs0, ft5, ft3
                  fsub.s       fs10, fs9, fs2
                  or           s6, gp, t2
                  fsgnjn.s     fs0, ft8, fs6
                  sub          t0, s8, a7
                  addi         t2, a3, -1237
                  fsub.s       fa0, fa0, fa1, rdn
                  slli         t2, a3, 20
                  fmv.w.x      ft7, s6
                  lui          a6, 763430
                  fcvt.wu.s    t0, fa6
                  sltiu        s2, s3, -1283
                  fmax.s       ft7, fs3, fs2
                  lui          a2, 313591
                  sltu         t6, t1, a1
                  fsgnjx.s     ft5, ft3, fs9
                  fsub.s       ft4, fa2, fs6
                  sra          s5, t5, t0
                  andi         t6, zero, -232
                  mul          a4, s7, s8
                  srli         s5, t4, 18
                  sub          t3, s0, zero
                  or           t4, gp, s1
                  srli         t2, s2, 7
                  rem          s0, t1, t5
                  mul          a1, s8, t3
                  srai         a2, sp, 23
                  srli         s2, t2, 1
                  fmax.s       fa2, ft11, ft11
                  fcvt.s.wu    fa0, s11
                  srl          a5, s3, s6
                  and          ra, a5, s10
                  mul          zero, ra, a4
                  div          t3, a0, s0
                  fcvt.s.wu    fa3, a2, rmm
                  rem          s10, t5, a2
                  fcvt.s.wu    fs4, t1, rdn
                  mulh         ra, a5, t1
                  auipc        a5, 301640
                  andi         sp, a2, 1479
                  mulhsu       a4, a6, t6
                  div          s6, sp, s11
                  lui          tp, 774361
                  mul          s0, s11, s10
                  fmv.w.x      fs7, s9
                  divu         t5, s10, a4
                  srli         t2, ra, 16
                  fcvt.s.w     fa5, s11, rtz
                  mulhsu       t2, sp, t5
                  auipc        a3, 876122
                  div          a4, a3, a1
                  addi         a4, s2, -709
                  xori         sp, s10, -64
                  sltu         s7, a7, s4
                  fmv.x.w      gp, ft9
                  andi         t2, a3, 1018
                  fmax.s       fs4, fa0, fa1
                  fsqrt.s      ft2, ft11, rtz
                  sltu         tp, t0, a1
                  div          t2, tp, t6
                  xor          t5, s4, a5
                  fmin.s       fa5, ft8, ft6
                  fmul.s       fa5, ft2, ft3
                  fsub.s       ft11, ft8, ft9, rtz
                  fsqrt.s      ft5, fs4, rup
                  nop
                  sra          a7, t0, a1
                  slti         t3, gp, -1708
                  xori         a2, s2, 1289
                  fmv.w.x      ft3, s9
                  fmv.w.x      ft6, t0
                  addi         s2, t5, -793
                  sll          a0, s9, t3
                  xor          a7, t2, ra
                  fdiv.s       fs11, ft3, ft7, rdn
                  fmv.x.w      s7, ft2
                  sltu         t0, s11, s0
                  fsgnj.s      ft7, fs4, fs7
                  slli         a5, a1, 21
                  xori         s0, s2, 263
                  auipc        t1, 857708
                  fsqrt.s      fs2, fs6
                  remu         sp, s5, a5
                  fmax.s       ft3, ft1, fs11
                  fsqrt.s      fs9, ft8, rne
                  and          s2, s7, t3
                  fmv.x.w      sp, fa3
                  fle.s        a4, fs5, ft3
                  fmul.s       fa7, fa7, fs11, rmm
                  fcvt.wu.s    a4, ft9
                  fmin.s       ft5, ft11, fa3
                  divu         t2, s6, s0
                  sltu         a7, gp, a7
                  slt          s5, t2, t1
                  add          a0, s5, zero
                  fcvt.s.wu    fs2, a7, rdn
                  fcvt.w.s     t4, ft7
                  fcvt.s.wu    ft11, t6
                  sltu         a2, s2, s6
                  xori         gp, t0, -1930
                  fsqrt.s      ft0, ft1, rtz
                  fcvt.wu.s    t6, fa3, rdn
                  divu         sp, s10, a6
                  fsub.s       fs10, fa7, fs2, rup
                  fmul.s       fa1, ft10, fa3
                  fmax.s       ft0, ft8, fa0
                  fsub.s       fs5, ft4, ft4, rne
                  nop
                  srli         s11, sp, 19
                  mulh         sp, sp, a4
                  fclass.s     a3, fs0
                  or           s5, s10, zero
                  andi         t3, s0, 78
                  fcvt.wu.s    t2, ft2
                  fmax.s       fa2, fs2, fs6
                  fclass.s     sp, fs1
                  mul          t5, t4, t6
                  fsgnjn.s     ft1, ft9, ft5
                  auipc        s5, 707551
                  fsgnj.s      fs5, fa4, fs11
                  auipc        a7, 248287
                  fcvt.s.w     fa6, a2
                  flt.s        t6, fs6, ft1
                  auipc        a1, 395524
                  fsgnjx.s     ft4, fs0, fa2
                  fmin.s       fa6, fa4, fa6
                  fsqrt.s      fa4, fs6
                  fle.s        t4, fa2, fa6
                  mul          a6, t5, t2
                  fmv.x.w      a4, fa7
                  add          s3, s7, s8
                  fcvt.s.w     fa7, t1
                  fmv.w.x      fs5, a4
                  fmv.x.w      s6, fa1
                  sll          a1, a6, s8
                  fcvt.wu.s    s2, ft0
                  srli         s2, t5, 0
                  rem          t0, a3, s10
                  ori          s7, t4, -145
                  srl          s5, t2, s2
                  sltu         s6, a4, s3
                  or           s5, t0, a6
                  fsgnjx.s     fa6, fs0, ft9
                  fcvt.s.w     fa5, gp, rne
                  fsgnjx.s     ft9, fs3, fs3
                  mul          s7, a2, s0
                  divu         t1, t3, t0
                  sra          s11, s2, sp
                  fsqrt.s      fa6, fs2, rne
                  fmv.x.w      sp, ft6
                  srli         a7, s3, 27
                  srli         a7, s3, 24
                  fcvt.wu.s    a2, fs8
                  mulhu        s4, a2, a7
                  lui          a5, 715534
                  add          s4, ra, a0
                  sltiu        s5, s3, -954
                  nop
                  divu         tp, t1, ra
                  srli         a1, a2, 6
                  fadd.s       fa7, fs8, fs5
                  div          s2, s11, s4
                  divu         gp, a3, a5
                  slti         t1, s8, -703
                  ori          s10, t1, 1540
                  xor          tp, t3, tp
                  xor          s10, t3, s3
                  slli         s5, tp, 28
                  xor          s7, s1, t0
                  sltiu        t5, t1, -176
                  sll          t1, s10, gp
                  sll          t5, t3, sp
                  andi         t1, s11, -808
                  div          s2, ra, s9
                  divu         a2, t1, t4
                  fmul.s       fs8, ft3, ft5
                  fmax.s       fs0, fs9, fs5
                  fmin.s       fa0, fs2, fs0
                  fmax.s       ft1, ft6, ft2
                  or           s2, t0, s4
                  sltu         t1, t6, a2
                  divu         sp, zero, s7
                  fmax.s       fa1, fs0, fs3
                  slli         tp, a3, 20
                  srli         a6, tp, 12
                  nop
                  nop
                  fcvt.s.w     ft1, gp, rmm
                  xor          gp, a2, s0
                  fmax.s       fs9, fs10, fs5
                  srli         s11, s3, 23
                  add          a2, a2, zero
                  fcvt.s.wu    ft6, s5, rmm
                  sltu         s10, s9, s4
                  flt.s        s6, fs8, ft6
                  slti         a2, t2, -1865
                  lui          a0, 558310
                  rem          ra, t4, s11
                  ori          ra, t1, -409
                  or           t2, a7, t5
                  sra          ra, a7, gp
                  fmin.s       fa7, fs10, fs11
                  feq.s        a0, ft5, fa7
                  fmv.x.w      s11, fs9
                  feq.s        s2, ft9, ft8
                  xor          a6, a5, a1
                  mulhu        a4, s5, a1
                  fsgnjn.s     ft0, ft0, ft0
                  fsgnjn.s     ft11, ft0, fs5
                  fcvt.s.w     ft2, gp
                  rem          t5, s4, a0
                  fsqrt.s      ft3, fa2, rne
                  fcvt.s.wu    fs6, t2
                  fsqrt.s      fs7, fa6, rup
                  fcvt.s.wu    ft4, t1, rdn
                  auipc        gp, 1027647
                  fcvt.w.s     sp, fs11
                  fcvt.s.w     fs11, s9, rtz
                  div          s2, a4, t0
                  nop
                  fmul.s       fs6, fa7, ft3
                  rem          zero, s9, s5
                  fclass.s     s3, fs3
                  and          t4, s10, s2
                  mul          s10, sp, t4
                  slt          gp, t6, a6
                  srli         s6, s3, 12
                  rem          t5, tp, a2
                  or           a7, a2, t0
                  sltiu        sp, s7, 233
                  xor          t6, s4, a5
                  fsub.s       ft7, fa2, fs2
                  remu         tp, t4, t5
                  mulh         s3, t5, a4
                  fsgnj.s      ft10, ft2, fs9
                  fcvt.s.wu    fa6, a7, rmm
                  slt          t1, a7, t2
                  addi         gp, a7, 555
                  sltiu        s11, a3, -2001
                  fcvt.s.wu    ft6, a2, rdn
                  fsqrt.s      fs1, fs11
                  div          s0, a7, s3
                  slt          a4, t1, sp
                  mulhu        t2, s8, a1
                  and          t2, t4, a2
                  fmul.s       ft6, fa1, ft3, rtz
                  fadd.s       ft3, fa6, ft5
                  or           t2, t0, s6
                  srli         s5, t0, 16
                  mulhu        a4, a0, zero
                  srl          t6, a4, s2
                  flt.s        t4, fs1, fa0
                  fcvt.w.s     t0, fs6, rdn
                  rem          t0, s7, s0
                  fadd.s       ft8, fs9, fs0, rne
                  fle.s        a2, fa4, fs5
                  fcvt.s.wu    fa7, a0, rup
                  and          t6, s2, ra
                  fmax.s       fa4, fa7, fs2
                  fcvt.s.wu    fs10, a5, rne
                  ori          t5, t5, 1573
                  sra          a6, t0, a4
                  xor          a1, t3, gp
                  fmax.s       ft0, fs10, fs4
                  mulh         s0, t5, a4
                  sll          gp, t3, s11
                  mulhsu       t3, gp, t0
                  sltiu        t0, s1, -1897
                  fmax.s       fs3, fa4, ft0
                  fdiv.s       ft5, fs8, ft11
                  fsgnjn.s     ft4, fs4, ft11
                  srl          s4, s1, a0
                  mul          t5, a4, t2
                  slli         s7, a7, 0
                  sra          s11, tp, s7
                  fmv.x.w      s2, fs7
                  ori          a4, s3, -630
                  fsgnj.s      ft6, fa2, ft0
                  fmv.w.x      ft5, t4
                  sll          s4, tp, zero
                  fcvt.s.w     fa1, a1
                  sll          a1, s2, t0
                  xori         a1, a3, 1197
                  remu         s6, s4, s2
                  fadd.s       ft10, ft3, fs10, rmm
                  fclass.s     a2, ft11
                  srai         s11, a5, 0
                  fle.s        a5, fs1, fs2
                  flt.s        s3, fa3, ft10
                  fmv.x.w      t6, ft0
                  fsgnjx.s     ft7, fa4, ft3
                  nop
                  fmin.s       fa1, fs6, fs9
                  fclass.s     t4, fa0
                  fsqrt.s      fs10, fa4, rmm
                  and          a7, a1, a4
                  fmv.x.w      t3, ft8
                  auipc        a0, 48789
                  divu         s3, a0, sp
                  or           a7, gp, a7
                  slt          t3, a1, s5
                  fmv.w.x      ft6, t1
                  lui          t6, 478159
                  xori         t2, a1, 1655
                  fmul.s       fa4, fa6, ft10, rmm
                  srl          a0, s5, t0
                  sra          s2, s3, s11
                  rem          t6, t6, s11
                  ori          t0, a6, -959
                  fmul.s       fs8, fs7, ft6
                  fmv.w.x      fa3, t2
                  nop
                  auipc        t1, 905244
                  srli         s11, a7, 15
                  mulhsu       gp, s6, ra
                  fdiv.s       fa2, fa4, fs3, rdn
                  fdiv.s       ft5, ft10, ft2
                  sll          a1, a4, a4
                  xori         t5, a5, -725
                  add          s2, zero, sp
                  slt          gp, s0, s6
                  divu         a0, s10, s6
                  nop
                  sll          a0, t3, t4
                  fcvt.wu.s    s7, ft1, rtz
                  slli         a3, s10, 16
                  rem          tp, tp, s3
                  flt.s        ra, ft10, ft9
                  mulhsu       t5, a7, tp
                  and          s5, s4, s11
                  sra          s5, gp, s1
                  fcvt.s.w     fs1, t5, rmm
                  fdiv.s       fa6, fs2, fs10
                  sltu         s10, s4, a6
                  addi         t6, s0, -921
                  xor          a7, t2, s8
                  nop
                  addi         t1, t2, -1723
                  fcvt.s.w     ft3, t3
                  slti         tp, t0, -756
                  fmin.s       fs9, fa2, fs9
                  srl          s5, s3, t1
                  add          a4, a1, a0
                  fle.s        a7, ft1, ft11
                  fcvt.w.s     a0, ft6
                  slt          a2, t6, s9
                  lui          s6, 971447
                  nop
                  fcvt.s.wu    ft5, s9, rtz
                  mulh         ra, t5, zero
                  slli         sp, s4, 17
                  and          s3, s10, s4
                  fmax.s       fs8, ft3, ft2
                  divu         zero, s4, t4
                  addi         a4, a6, -1977
                  fmin.s       fs0, fs7, ft0
                  xori         s11, a0, 533
                  fsgnjn.s     ft2, fa0, ft11
                  fsgnj.s      ft10, fa2, fs5
                  mulhsu       tp, s0, s3
                  fsgnjn.s     fa7, ft1, fs11
                  fclass.s     s10, ft7
                  and          a2, a2, s5
                  slt          s11, s4, t1
                  sub          s3, a6, t6
                  mulhsu       a4, s5, s7
                  fadd.s       fs1, fs7, fa6
                  fsgnj.s      fs10, ft6, ft5
                  fcvt.s.wu    fa7, t6, rtz
                  auipc        t1, 162220
                  sltu         t4, s4, a3
                  divu         t1, a7, s7
                  srli         a6, t2, 6
                  slt          a3, s2, a2
                  fcvt.w.s     s11, fa7
                  fsgnj.s      fa3, fs3, ft3
                  fsqrt.s      fs1, ft11
                  nop
                  fmv.w.x      fs8, s8
                  feq.s        t6, ft9, fa7
                  fcvt.s.w     fs4, t4, rne
                  fsgnjx.s     fa6, ft5, fa0
                  ori          t2, a2, 1300
                  fsub.s       fs6, fa5, fa1, rmm
                  fdiv.s       fa1, ft6, ft0
                  fsgnjn.s     ft1, ft3, ft6
                  fmin.s       fa2, ft7, ft2
                  fle.s        s7, ft10, fa2
                  sub          t5, s0, a1
                  fmax.s       fs7, fa4, fs3
                  div          a1, s11, a3
                  nop
                  divu         zero, s4, s5
                  fsgnjn.s     ft5, fa6, fa2
                  mul          s0, t4, sp
                  srl          s7, gp, t0
                  ori          sp, t5, -1547
                  lui          a6, 1032095
                  flt.s        tp, ft4, fs4
                  mulhu        s0, t6, s1
                  nop
                  divu         s0, a0, s8
                  fmin.s       fa1, ft8, ft10
                  fmv.w.x      ft10, a0
                  div          tp, t0, tp
                  mulh         s10, t0, t1
                  fcvt.w.s     a1, ft6
                  nop
                  addi         s4, t0, 934
                  and          a6, tp, tp
                  fmax.s       fs0, ft0, ft9
                  ori          t0, s3, -536
                  fle.s        t3, ft0, ft0
                  fmax.s       ft5, ft8, fs10
                  remu         s5, gp, tp
                  mul          s6, s10, a2
                  and          t0, s6, a7
                  nop
                  fsub.s       fs8, ft9, ft0
                  fsqrt.s      ft4, fa6
                  sub          a7, s6, tp
                  lui          s3, 233166
                  slt          s3, ra, t6
                  fsgnjx.s     ft5, fa5, fs8
                  fcvt.s.w     fa7, sp, rup
                  mulhu        a1, t2, t6
                  or           a3, s1, s2
                  fmax.s       ft3, fs7, ft0
                  nop
                  sltiu        s4, s3, 128
                  lui          s4, 1033140
                  sll          ra, s3, a4
                  ori          t1, zero, 331
                  fmv.w.x      fs3, a2
                  fadd.s       fa5, fs9, ft7, rne
                  srl          gp, gp, t3
                  srli         s4, t0, 3
                  srl          s4, a6, s9
                  divu         ra, ra, a4
                  mulh         a3, a4, s11
                  divu         s2, s9, s8
                  flt.s        t5, fa0, fs10
                  fmax.s       fa5, fa5, fs1
                  addi         ra, s2, 759
                  slli         a0, gp, 28
                  and          a6, s11, t5
                  xor          s11, s3, a5
                  lui          t2, 533840
                  fcvt.s.w     ft2, s2
                  slti         t4, s4, 1385
                  fsgnjn.s     fs11, ft5, fs4
                  andi         s5, s3, 1613
                  auipc        t0, 892158
                  fmin.s       fs1, fs5, fa0
                  fmax.s       fs5, fa0, fs3
                  nop
                  fclass.s     a7, fs4
                  fcvt.s.wu    fs11, s8, rmm
                  add          s0, s7, s10
                  div          s0, t5, a0
                  fclass.s     t2, fa2
                  srai         s3, s5, 19
                  fsgnj.s      fa5, fs7, fs1
                  or           t0, a4, s4
                  fadd.s       ft1, fa1, ft7
                  fcvt.wu.s    a3, fa0, rmm
                  fsqrt.s      fa1, fs4
                  flt.s        t4, fa2, ft5
                  feq.s        a6, fs1, ft6
                  fsgnjn.s     fs10, fs6, fs2
                  mulhsu       s2, zero, s2
                  rem          s10, t1, s9
                  fmv.w.x      fa1, s9
                  fsgnj.s      ft4, ft2, fs10
                  fmax.s       fs1, fa0, fs0
                  fclass.s     s4, fs8
                  sub          a5, s3, sp
                  ori          tp, t5, 158
                  fcvt.s.w     ft4, a7, rdn
                  sltu         s11, tp, t6
                  srl          a3, gp, a1
                  fmul.s       ft6, fa5, ft4, rdn
                  sub          a6, s6, a0
                  remu         gp, s7, tp
                  sltu         zero, t2, t5
                  fadd.s       fs5, fs7, ft6, rup
                  fsub.s       fa7, ft10, fs11
                  sltu         s4, s4, s11
                  divu         t1, tp, s8
                  sltiu        s4, t2, -1361
                  xor          s2, a7, a0
                  xor          s5, t5, s11
                  slli         s2, sp, 24
                  remu         t4, t2, s9
                  fsub.s       ft4, ft7, ft0
                  mul          zero, sp, tp
                  sll          sp, a4, s8
                  fmv.w.x      fa4, ra
                  fadd.s       ft11, fs10, ft0
                  fle.s        a5, fa1, ft7
                  mul          s2, s6, s3
                  or           t6, t4, s3
                  ori          a6, t5, -730
                  andi         a4, s6, 1970
                  sll          t4, s1, s6
                  fmv.w.x      ft4, t6
                  srl          t1, s6, a0
                  srai         s4, s11, 0
                  slti         gp, s3, 248
                  slti         s0, s9, 935
                  addi         a7, s6, -139
                  nop
                  srai         t0, s11, 13
                  fcvt.s.w     ft7, a0
                  add          a2, a7, sp
                  lui          s2, 119756
                  fcvt.s.wu    ft6, tp, rdn
                  remu         t0, s8, a0
                  fcvt.w.s     t2, fs3
                  fle.s        zero, fa4, fa5
                  divu         s11, s9, s10
                  fadd.s       fs10, ft1, fa4, rdn
                  slli         t4, t1, 3
                  remu         s7, s6, s8
                  feq.s        t6, fa6, fs9
                  xor          t0, ra, t6
                  mulhu        a1, s7, s0
                  addi         a1, a3, 316
                  slli         t6, a1, 14
                  remu         s3, s8, a3
                  nop
                  add          sp, s6, a1
                  lui          a3, 72597
                  fsub.s       ft4, fa5, fs2, rne
                  feq.s        a0, fs5, fs4
                  slti         s7, s6, 412
                  fmul.s       fa3, fs2, ft10
                  fsgnj.s      fa0, fa6, fs7
                  fsgnj.s      fs3, fs6, fa7
                  divu         s3, sp, a6
                  fadd.s       fs9, fs8, fs7
                  xor          s2, tp, a0
                  fsgnjx.s     ft8, ft2, fs4
                  mulhu        a6, a5, gp
                  fclass.s     gp, fa4
                  fle.s        tp, fs1, fa3
                  slt          s5, a6, a4
                  rem          t6, t4, s3
                  fmv.w.x      fs2, s4
                  sub          s10, t0, a5
                  remu         a0, a1, s11
                  mulh         t5, s6, s2
                  mulhu        ra, gp, sp
                  fdiv.s       ft7, ft9, ft10
                  rem          s10, s0, s9
                  fcvt.w.s     t2, fs2
                  fle.s        a7, ft0, fs6
                  sltu         a0, zero, t6
                  fsgnjn.s     fa5, fa5, fs1
                  fcvt.w.s     t3, fs3, rup
                  fcvt.w.s     gp, fs11
                  rem          a4, s5, s2
                  fadd.s       ft8, fs5, fs7, rup
                  fcvt.s.w     ft1, s10, rmm
                  fadd.s       fa4, fs4, fs1
                  fcvt.wu.s    s11, ft8, rdn
                  srl          t4, t2, s9
                  fle.s        t4, ft11, fa3
                  fsgnj.s      fs10, fa6, fa0
                  fmv.x.w      s7, fs0
                  mulh         s10, a6, s5
                  lui          tp, 476419
                  fadd.s       fs0, fa7, fa5, rup
                  fcvt.w.s     t2, fa1
                  fsub.s       fs8, fs4, ft11, rup
                  divu         t4, ra, a1
                  fmax.s       fs4, fa7, ft10
                  srl          s11, t1, s3
                  sltiu        t4, s11, -1153
                  flt.s        a7, fa2, ft2
                  fcvt.s.w     fa3, s4
                  fcvt.s.w     ft0, t3
                  srl          a2, s5, s6
                  fmv.x.w      t4, fa3
                  mulhsu       s6, a7, a4
                  sub          a1, s3, s3
                  fdiv.s       ft7, fs0, fs10
                  mulh         a0, t0, a6
                  feq.s        a3, fa5, ft7
                  srai         s3, s8, 24
                  fmul.s       ft9, ft3, ft11
                  remu         s0, s6, s6
                  fmv.x.w      zero, ft1
                  srli         s7, ra, 19
                  sra          a2, s6, t1
                  fmin.s       fs10, fa3, fa0
                  feq.s        s11, fs1, ft9
                  fsgnjx.s     fs11, ft1, fs0
                  fsgnjx.s     fs2, fa1, ft2
                  mulhu        t1, s11, a1
                  addi         t1, s8, 227
                  fsub.s       fs0, fs6, ft5
                  fcvt.s.w     fa2, s7, rmm
                  fclass.s     a4, ft8
                  mulhu        s10, s2, a2
                  mulhu        zero, s5, zero
                  slt          s11, t2, t5
                  auipc        s3, 746221
                  mulhsu       t1, t2, t0
                  sltu         s5, a3, sp
                  fcvt.w.s     tp, ft9
                  feq.s        s5, ft10, fs7
                  sltiu        s7, s10, 1188
                  add          a5, s4, tp
                  auipc        s11, 339331
                  and          a2, t5, t5
                  lui          s10, 811296
                  fcvt.s.w     fa7, t2, rup
                  slt          s3, gp, sp
                  fmul.s       fs3, fs5, fs2
                  fclass.s     t2, ft9
                  fdiv.s       ft2, fs5, fs11, rdn
                  rem          a0, t2, t4
                  fsgnj.s      fa2, ft8, fs1
                  fdiv.s       fa4, fs5, ft3, rdn
                  fsgnjx.s     ft4, fa0, fs5
                  srl          a3, t4, gp
                  sltu         s11, t4, zero
                  xor          tp, t1, s4
                  fsgnjx.s     fs0, fa1, fs8
                  add          t5, tp, t2
                  fsub.s       fa0, fa4, fa1, rup
                  divu         ra, a6, s11
                  div          a0, s3, s11
                  srai         a0, s0, 10
                  fcvt.s.w     fs9, a7, rup
                  fsgnjn.s     fa7, fa3, fs7
                  fmv.x.w      t1, ft4
                  srai         s2, zero, 23
                  srai         a5, t6, 31
                  fmv.w.x      ft1, s8
                  srl          gp, t5, a4
                  and          gp, ra, t0
                  mulhu        a4, a3, s1
                  fmax.s       ft11, fs7, ft1
                  fmax.s       ft4, ft2, fa5
                  srai         gp, t6, 23
                  fcvt.wu.s    t6, ft7, rmm
                  flt.s        s2, fs7, ft4
                  fclass.s     a4, fs0
                  feq.s        s0, ft5, fa2
                  fcvt.wu.s    t6, ft10, rne
                  slt          t2, a6, a7
                  divu         t1, s11, sp
                  andi         a1, a5, 1513
                  fsqrt.s      fs8, ft6
                  fadd.s       fs2, fa0, fs10
                  fcvt.s.w     ft11, a0, rtz
                  mul          t1, s6, a6
                  remu         gp, s3, t0
                  mulh         sp, s5, s9
                  sltu         a4, a4, s3
                  srli         t2, sp, 27
                  fsqrt.s      fa2, fs11
                  xori         a5, s8, 313
                  flt.s        s5, ft9, fs9
                  fadd.s       ft2, fa0, fa6, rmm
                  nop
                  or           s0, s11, t3
                  ori          a3, t4, 927
                  divu         a3, zero, zero
                  divu         s3, t6, a4
                  ori          s7, a4, -399
                  remu         t0, s1, t4
                  fmul.s       ft9, fs11, fa7
                  fadd.s       ft11, fa0, fs0
                  and          t4, s0, s6
                  andi         t4, s7, -890
                  add          t5, s3, a7
                  feq.s        s5, fa0, ft1
                  sll          s10, a7, s11
                  fmv.x.w      t4, fs1
                  nop
                  fclass.s     t4, ft5
                  auipc        s10, 669533
                  srli         t6, s4, 3
                  rem          t4, s0, s0
                  add          s6, s4, s10
                  mul          gp, s3, tp
                  ori          s5, s5, -807
                  fadd.s       fs3, ft4, fa1
                  fcvt.wu.s    zero, ft4
                  fsgnj.s      fs5, fa0, fa6
                  mulhsu       s10, s3, t0
                  fsgnj.s      fs1, ft11, fs11
                  fcvt.s.wu    ft11, t1
                  fmul.s       ft8, fs10, fs3, rne
                  mulhsu       gp, s4, s8
                  nop
                  fadd.s       fa6, fa1, ft2
                  srl          s0, s3, t6
                  fcvt.w.s     t4, ft0, rne
                  flt.s        s4, fs8, ft0
                  fsgnj.s      fs5, fa6, ft0
                  and          s4, a5, s4
                  divu         a5, t0, a1
                  mulhu        t5, s4, s11
                  slt          a5, t4, tp
                  add          a6, s7, a7
                  remu         a2, a2, s2
                  lui          a3, 275116
                  ori          t0, a1, -1099
                  slti         s2, t5, -1649
                  auipc        a1, 322434
                  fle.s        t0, ft9, fa1
                  sltiu        a7, zero, 1333
                  divu         a1, t3, s0
                  fcvt.s.w     ft1, a1, rne
                  fcvt.s.wu    ft7, s0
                  fmul.s       fa3, ft9, fs2, rup
                  flt.s        a3, fa6, ft10
                  div          ra, zero, ra
                  sll          zero, t3, s2
                  srli         tp, t2, 14
                  srai         t0, s11, 10
                  fmin.s       fa1, ft6, ft5
                  ori          sp, a6, 1614
                  slti         ra, s0, 24
                  lui          s2, 766846
                  fadd.s       fs9, ft9, fa0
                  mulh         t4, gp, s0
                  mulhsu       a5, t3, t3
                  feq.s        a6, fa1, fs6
                  slti         a7, a3, 1505
                  fsgnjn.s     ft7, ft6, fs6
                  slli         s3, s11, 31
                  fle.s        s0, ft3, ft3
                  fmul.s       fs6, fs2, fa6
                  sltiu        t3, zero, 1930
                  sub          a2, a4, a7
                  fmax.s       ft11, ft7, ft6
                  mulh         t3, s7, a7
                  fcvt.wu.s    t4, ft10, rne
                  fmin.s       fs3, fs11, ft9
                  mulhu        t2, t2, a1
                  fsub.s       ft11, fa7, fs4, rmm
                  lui          s3, 614401
                  lui          a3, 443710
                  xori         t0, a4, -1332
                  lui          gp, 84860
                  div          s5, a1, t5
                  fcvt.w.s     zero, fs5
                  fsgnjx.s     ft7, fa6, fa6
                  slt          a5, t0, a7
                  feq.s        s3, fs11, ft7
                  sub          tp, a6, s4
                  div          sp, s8, a4
                  fmin.s       fa7, ft5, fs8
                  remu         a5, s1, gp
                  lui          s10, 586161
                  sll          t5, s10, a5
                  mulhu        a1, a2, tp
                  sltiu        a7, a1, -751
                  sltu         s11, sp, s5
                  ori          t1, s3, 1384
                  mulhu        s10, t3, s10
                  sra          s7, s10, s10
                  sra          a0, t1, a2
                  rem          t5, a3, s8
                  divu         gp, s11, s6
                  fsub.s       fs7, ft11, fa6
                  rem          sp, s9, t6
                  and          a5, ra, s10
                  fle.s        t5, fa3, ft7
                  mulh         a7, s1, t4
                  addi         s0, s11, 448
                  slt          tp, s9, a1
                  remu         t2, a5, t6
                  sltu         ra, a1, a3
                  fmax.s       ft8, fa7, fs7
                  fmin.s       ft7, ft0, fs1
                  fsgnjx.s     fa7, fs1, fs7
                  lui          t1, 942569
                  xor          s10, t1, s9
                  fsqrt.s      fa2, fs3
                  auipc        zero, 992127
                  fsgnjn.s     ft11, fa2, fs5
                  fmin.s       ft3, fs11, ft10
                  fsgnjn.s     fs4, ft3, ft8
                  fsgnjx.s     fs2, ft2, fa0
                  mulhu        t1, s10, t0
                  ori          gp, zero, 1495
                  xori         a3, zero, 72
                  xori         t3, a5, 1704
                  fadd.s       fs4, fs10, fs3, rup
                  fsub.s       fs2, ft7, fs4, rne
                  fdiv.s       ft3, ft0, ft10, rup
                  srl          t5, s9, ra
                  fmin.s       fa4, fa2, ft3
                  remu         a1, a1, a2
                  slt          a0, s3, s7
                  slli         s4, s5, 10
                  flt.s        s11, ft3, ft9
                  fsub.s       fs10, fs11, ft1
                  fcvt.s.w     ft6, t5, rtz
                  fle.s        zero, ft10, ft2
                  remu         s4, a2, a7
                  fmul.s       fa3, ft8, fa0
                  lui          a6, 698150
                  fdiv.s       fa1, ft11, fa2
                  flt.s        a6, ft1, fs8
                  addi         a2, tp, -169
                  fadd.s       fs4, fa2, ft8
                  and          t0, s1, t6
                  remu         a3, t5, zero
                  slli         a6, a1, 19
                  addi         t3, zero, 1237
                  addi         a6, ra, -1989
                  fsgnj.s      fa3, fa1, fa4
                  mulh         a7, s5, gp
                  fmv.x.w      a1, fs0
                  fsub.s       fa6, fa2, ft4, rne
                  fcvt.s.wu    fa7, a4
                  fadd.s       fs6, fs2, fs7
                  fsub.s       fa4, fa5, ft10
                  fmin.s       fs5, fs0, ft8
                  xori         t4, a5, 525
                  fle.s        zero, fs10, ft11
                  div          a4, s8, s8
                  fsgnjn.s     fa4, ft11, fs6
                  fclass.s     tp, fs0
                  auipc        t0, 634964
                  fmv.w.x      ft2, zero
                  addi         a1, t1, 1422
                  fcvt.w.s     t1, ft5
                  fmax.s       fs1, fs11, ft7
                  fmv.w.x      ft4, s2
                  sra          tp, a2, s7
                  srai         s5, t3, 14
                  add          a4, t0, tp
                  fcvt.s.w     fa2, a7
                  xor          s0, s11, s7
                  and          s5, t2, s6
                  fsgnj.s      fa0, fa7, ft2
                  sltiu        a1, s4, -1660
                  add          t6, s10, ra
                  add          t4, t6, t0
                  fdiv.s       ft5, fs3, fs9
                  xori         a4, s3, -1336
                  mulh         s2, s3, a5
                  andi         s3, s0, 1411
                  remu         s4, s0, s7
                  fsqrt.s      fs6, fa4, rmm
                  fmv.x.w      a0, ft0
                  fsub.s       ft9, fs6, fa5
                  mul          s6, t1, a5
                  fadd.s       fa7, ft4, fs3
                  sltiu        a3, s4, 304
                  fsqrt.s      fs3, fa6, rne
                  andi         t3, a1, 1698
                  fadd.s       ft5, fs11, fa4
                  fmv.w.x      fs7, a4
                  feq.s        t0, fs9, fa7
                  divu         tp, s10, t0
                  and          t6, t1, zero
                  fsgnjn.s     fa4, fs4, ft5
                  nop
                  div          t3, s2, sp
                  sll          s0, t1, a0
                  mulh         s2, t4, sp
                  xori         t1, s7, -331
                  addi         s10, a2, -445
                  fmv.w.x      ft11, ra
                  mulhu        tp, t0, gp
                  fsgnj.s      fs9, fs9, ft1
                  and          a2, a4, s5
                  fsqrt.s      ft4, fa1, rmm
                  ori          t6, s6, 344
                  sra          ra, s3, a1
                  fadd.s       ft2, ft1, ft9, rtz
                  xor          s3, s2, s6
                  and          gp, s6, tp
                  slti         t4, s0, -1489
                  fcvt.s.w     ft5, a3, rup
                  xori         a1, a3, 736
                  flt.s        t0, ft3, ft3
                  fsgnj.s      fs8, fs3, fs2
                  fmv.w.x      fs2, t1
                  fcvt.wu.s    s5, fs9
                  nop
                  rem          t2, a4, a4
                  fsgnjx.s     ft6, fa6, ft6
                  rem          t6, a4, gp
                  feq.s        s6, fs6, fs10
                  or           s2, s4, s5
                  remu         a5, s4, s0
                  flt.s        zero, ft3, ft4
                  divu         gp, a6, s5
                  xor          t3, a3, s6
                  fsqrt.s      ft9, ft8, rtz
                  fsgnjn.s     ft11, fs8, fs4
                  or           t0, a3, s0
                  fsub.s       fs0, fs11, ft1
                  mulhu        a2, a3, sp
                  fcvt.w.s     s5, ft11
                  andi         a5, s6, -1935
                  fclass.s     s3, fs2
                  fmin.s       fs6, ft1, fa4
                  srl          a4, a5, s10
                  fmv.w.x      fs4, t2
                  feq.s        a5, ft11, fs6
                  sltiu        s6, a1, -149
                  fadd.s       ft11, ft10, ft7, rmm
                  fcvt.s.w     ft8, gp, rtz
                  fsgnjx.s     fs0, fs5, ft11
                  xori         t5, s6, -1459
                  andi         t0, s9, -523
                  fmv.w.x      ft9, s4
                  fsgnjn.s     fa2, ft8, fs9
                  slti         t3, t3, -278
                  srl          a1, s7, s9
                  sub          ra, s1, tp
                  xori         s2, s5, 1426
                  ori          s11, sp, -2002
                  fclass.s     t2, fa0
                  srl          a3, a2, t0
                  andi         a4, a4, 1738
                  srli         t0, s11, 25
                  feq.s        t2, ft7, ft10
                  and          s11, s2, gp
                  feq.s        s5, fs10, ft4
                  lui          ra, 46135
                  div          a5, a0, ra
                  fsub.s       ft8, fa0, fs1
                  mul          t6, s7, s2
                  fmin.s       fs5, ft11, fs9
                  fcvt.w.s     t3, fa5, rmm
                  and          t4, a2, a1
                  fsub.s       fa5, ft7, fa0, rne
                  auipc        a3, 638079
                  fmv.x.w      s3, fa2
                  xor          t1, s7, s1
                  mulh         a4, s7, a5
                  remu         s10, t2, a3
                  fsgnjn.s     ft10, fs8, ft2
                  add          a3, s11, tp
                  sltu         t6, s0, a5
                  fcvt.w.s     zero, fa2
                  addi         t6, a2, -1122
                  lui          zero, 619119
                  mulh         t2, a5, s8
                  sub          s4, t3, t1
                  fsgnjx.s     fs3, ft5, ft7
                  fsqrt.s      ft4, fa3
                  fle.s        t0, fs7, ft2
                  mulhsu       a3, tp, t6
                  remu         t5, t0, s7
                  sltu         a6, t6, s0
                  fsqrt.s      fa1, fs8, rmm
                  fdiv.s       ft8, ft9, ft10, rtz
                  add          zero, s6, s0
                  ori          t1, s3, 902
                  lui          s5, 221055
                  fmax.s       fs7, fs2, ft6
                  and          t3, s5, gp
                  lui          s0, 805684
                  andi         s4, s9, 93
                  auipc        s2, 237090
                  fadd.s       fa6, fa4, ft11
                  fmul.s       ft0, ft9, ft9
                  nop
                  fmv.x.w      s4, fs2
                  xor          a4, s0, s6
                  srai         s3, a0, 3
                  auipc        t1, 345304
                  or           s2, a6, t4
                  fmin.s       fa6, ft7, ft9
                  nop
                  slli         t5, sp, 5
                  fcvt.s.w     fa4, s6
                  lui          a5, 398885
                  mulhsu       a0, t0, t5
                  rem          a5, t4, zero
                  fmin.s       ft2, fs2, fa6
                  sll          a0, a6, t0
                  fsgnjn.s     fs0, fa6, fs0
                  fsgnjx.s     fs1, ft7, ft0
                  fcvt.wu.s    t4, fa0
                  fsgnj.s      fs9, ft1, fa5
                  and          t0, s5, t4
                  feq.s        gp, ft3, fs3
                  mul          t1, gp, s2
                  rem          s7, s1, t5
                  fadd.s       ft1, fs3, fs4, rup
                  and          a6, a3, t5
                  fmv.x.w      t2, fs4
                  srli         t6, a3, 2
                  auipc        s5, 108260
                  feq.s        s5, fs6, ft10
                  slti         t4, t2, -1558
                  fdiv.s       fa2, fs1, fa1
                  slti         zero, tp, -1385
                  nop
                  fcvt.w.s     a0, ft0, rup
                  mul          t3, a3, a2
                  ori          a6, a3, -416
                  fadd.s       ft9, fa2, fs7, rtz
                  fmv.w.x      fs6, s8
                  remu         a7, s7, a4
                  slti         a6, s7, 221
                  sltu         sp, t3, a5
                  remu         sp, t6, s7
                  flt.s        s0, fs0, ft2
                  fadd.s       fs2, fs7, ft11, rne
                  fclass.s     ra, fs5
                  fsqrt.s      fs9, fs2, rne
                  fcvt.w.s     a3, ft1
                  fle.s        s6, fs0, ft2
                  add          t2, zero, s4
                  slti         a7, s8, -1729
                  addi         ra, a5, -1192
                  mulh         gp, s4, s6
                  fcvt.wu.s    s3, fs5, rtz
                  sll          s0, s2, s11
                  fdiv.s       fs3, fa3, ft1, rdn
                  and          t3, s1, a4
                  srli         ra, a4, 23
                  lui          tp, 695212
                  slt          t5, a4, a3
                  sll          s7, t1, s9
                  slt          s10, ra, a3
                  or           s10, s8, ra
                  andi         s7, a7, 1500
                  and          t5, t1, a0
                  fsgnjx.s     fa4, fa1, ft2
                  fcvt.s.wu    ft10, s8, rdn
                  sll          a0, a5, a4
                  rem          s5, a4, sp
                  fsgnj.s      fs7, ft9, ft7
                  srl          s10, s9, s4
                  add          s7, tp, t0
                  sll          s5, s1, s1
                  fdiv.s       fa5, fs3, ft9
                  fmax.s       ft3, fs4, fa2
                  fle.s        s6, fs9, fa0
                  mul          a1, t2, a5
                  fcvt.wu.s    a4, fs7, rtz
                  fdiv.s       fa7, fa4, ft10
                  fsgnjn.s     ft9, fa6, ft1
                  sltiu        tp, t1, 613
                  srl          t4, s1, tp
                  fdiv.s       fs6, ft0, fa1, rtz
                  flt.s        s0, fa2, ft6
                  fmv.x.w      s3, fa6
                  mul          s0, s4, s6
                  slli         t2, s6, 3
                  remu         t3, a2, s11
                  feq.s        t1, fa4, fs7
                  fsub.s       fs6, fa3, ft7, rdn
                  fcvt.w.s     s0, fs2, rtz
                  slt          s7, a7, a0
                  sub          gp, t1, a5
                  srl          s7, a5, s4
                  fmin.s       fs3, fs9, fs6
                  fcvt.s.wu    fs6, t6, rdn
                  ori          a3, a6, -1579
                  ori          t0, s5, 499
                  fcvt.w.s     t4, ft3, rup
                  fsgnj.s      fa7, fs11, ft4
                  fsgnjn.s     fs5, ft3, ft1
                  fmax.s       fs9, fa3, fs11
                  auipc        s6, 990053
                  div          a3, t2, s5
                  fadd.s       fa2, fa1, fa3, rdn
                  fsgnj.s      fs5, fs0, ft2
                  ori          a1, s6, -1813
                  srl          a3, t6, t0
                  fcvt.wu.s    a4, fs7, rne
                  fmax.s       fa1, fs0, fs2
                  slli         s0, t6, 5
                  xori         s5, s9, -1280
                  srai         a2, t3, 26
                  add          s5, a0, a3
                  fsqrt.s      ft3, ft6, rup
                  fmul.s       fs1, fs2, ft2, rtz
                  srl          t1, a0, t0
                  slli         s6, t4, 22
                  fmul.s       ft5, fs2, ft11, rup
                  feq.s        s3, fs10, fa5
                  xor          s11, t1, t4
                  sltiu        a1, gp, 1907
                  nop
                  lui          s11, 437991
                  slli         s2, a7, 11
                  srl          a4, t0, a2
                  flt.s        s7, ft1, fa7
                  xor          ra, s7, t0
                  mulh         ra, gp, a2
                  add          s10, t3, t1
                  fcvt.s.wu    fs6, a2
                  fadd.s       ft6, ft4, ft5, rup
                  sltiu        a6, t1, 1969
                  mulhsu       a4, tp, t3
                  addi         t5, a0, 281
                  slti         s5, s6, -525
                  fcvt.s.wu    fs4, zero, rmm
                  fmax.s       fs4, ft9, fs0
                  xori         t1, a0, -1302
                  fmv.x.w      sp, fs10
                  sra          a3, t1, s2
                  mulh         t2, a5, t1
                  fsgnjx.s     ft0, fs0, fs9
                  or           sp, s9, zero
                  lui          t4, 484652
                  nop
                  or           t1, tp, s8
                  fclass.s     gp, ft5
                  div          a6, t3, s6
                  div          a5, t5, s5
                  flt.s        t4, fs3, fs9
                  fmax.s       fs8, ft9, fs3
                  rem          a2, a2, zero
                  fcvt.wu.s    s7, ft10, rmm
                  slli         s7, sp, 20
                  divu         a6, s10, a1
                  feq.s        t6, fa6, fa3
                  fcvt.wu.s    t5, fa4, rne
                  xori         a3, s5, 1477
                  mul          a0, s10, sp
                  mulhu        s11, t5, s9
                  sltu         a1, t4, ra
                  sltu         t6, t4, s0
                  fmul.s       fs4, ft0, ft5, rdn
                  slli         s4, t6, 6
                  fsgnj.s      fa5, fs6, fa1
                  sll          t0, s0, a4
                  rem          ra, a3, gp
                  sltiu        t4, s5, 1543
                  and          s7, a3, sp
                  sra          a1, a6, t1
                  fmv.x.w      a1, ft7
                  fsub.s       fs3, ft10, ft10
                  fmul.s       fs1, ft6, fs9, rmm
                  fmul.s       fs11, fs8, ft6
                  auipc        t2, 670866
                  lui          t3, 523684
                  ori          t6, t3, 1580
                  lui          a7, 504685
                  fsqrt.s      fa5, fs2, rne
                  auipc        a4, 818157
                  mulh         a7, tp, a3
                  fcvt.w.s     s0, fa6
                  sub          s11, s7, s6
                  sltiu        s6, a6, 1916
                  divu         gp, s7, s0
                  fsqrt.s      fs4, fs3, rne
                  addi         zero, s9, -102
                  xori         s11, s10, 924
                  div          t4, tp, a3
                  fadd.s       fs5, ft1, fa5
                  fadd.s       fa2, fs7, ft3, rtz
                  fcvt.wu.s    s2, fa7
                  sll          t6, a1, s5
                  fmul.s       fa7, fs0, fa1
                  div          t3, t2, s2
                  sll          a7, t4, s7
                  or           a1, t0, s6
                  xor          a7, t3, t4
                  slli         a2, s9, 31
                  add          tp, s7, s2
                  feq.s        ra, fa2, fs0
                  slt          t4, a3, sp
                  and          t1, t0, s3
                  sra          s4, s10, a0
                  div          a7, a7, gp
                  mul          t5, a0, s10
                  fmin.s       fs5, fa7, ft2
                  slti         zero, s6, -620
                  mul          a6, a0, s10
                  fsgnjx.s     fa6, fa4, ft0
                  auipc        a3, 158155
                  sub          t1, a7, s9
                  div          s10, t2, a2
                  slli         s7, a6, 30
                  remu         a3, t3, ra
                  mulhu        a5, t6, s11
                  sltiu        a4, a4, 1704
                  auipc        s0, 873016
                  fdiv.s       ft6, fs5, fs5, rup
                  fadd.s       fa6, ft8, ft7
                  fsgnj.s      fa0, fs7, ft10
                  srli         sp, s3, 19
                  slli         s6, t3, 22
                  sltiu        ra, s11, 725
                  lui          s3, 214871
                  fmin.s       fs8, fs9, ft4
                  fdiv.s       fs2, fs9, fa0
                  mul          a0, a0, a2
                  remu         zero, s6, s0
                  remu         gp, t3, s9
                  xor          t1, a7, s2
                  sll          a1, t6, s3
                  mul          a0, a4, gp
                  mulhu        s3, t5, a6
                  fsgnj.s      fa1, fs3, fs10
                  auipc        t0, 217679
                  srli         sp, ra, 4
                  andi         s6, sp, 1932
                  srl          s6, s0, t1
                  rem          t2, s0, s1
                  fdiv.s       fa7, ft4, fs10, rtz
                  srli         a1, s5, 20
                  or           a5, ra, tp
                  feq.s        s7, fa6, fa2
                  and          s11, s7, a1
                  rem          s7, s9, t6
                  auipc        s2, 441452
                  fclass.s     a0, ft3
                  mulhu        a5, t1, t0
                  srai         a0, s7, 25
                  div          tp, a1, a7
                  flt.s        zero, ft11, fa2
                  mulhsu       s7, ra, ra
                  xor          a2, s2, gp
                  auipc        gp, 924626
                  slt          a1, s10, s3
                  flt.s        sp, fa3, ft2
                  slli         t3, zero, 4
                  srl          s7, a0, t3
                  slt          s3, s5, a2
                  srli         sp, t1, 27
                  fmv.x.w      a7, ft11
                  fcvt.wu.s    gp, fa2, rne
                  nop
                  xori         s0, s4, -956
                  fcvt.s.w     fs2, t2
                  or           t1, t3, sp
                  sltu         s2, a3, gp
                  divu         gp, gp, a1
                  fcvt.wu.s    gp, fs0, rne
                  divu         s6, a4, a1
                  fmin.s       fs2, ft4, fa7
                  srai         t0, s5, 11
                  fsub.s       fs3, fs10, ft9
                  srai         t2, s7, 14
                  fmv.x.w      s0, fs2
                  divu         t5, s4, tp
                  fmax.s       fs8, ft3, ft8
                  fdiv.s       ft1, fs2, fa4
                  srli         a3, s3, 7
                  sltiu        a2, a6, -1913
                  fsgnjn.s     ft0, ft8, ft6
                  slt          a4, t6, gp
                  xori         s11, t2, 2039
                  lui          t2, 739534
                  ori          t5, tp, 1637
                  ori          a1, s11, -378
                  srli         t0, t3, 30
                  fmv.x.w      s7, fa3
                  addi         s4, a0, -514
                  mulh         a3, a7, s10
                  fle.s        s0, fs4, fs5
                  fcvt.s.wu    fs2, ra, rdn
                  slti         tp, s6, 1767
                  slti         s6, a3, 250
                  div          sp, s6, s2
                  fcvt.s.w     ft2, t1, rdn
                  rem          sp, a6, a5
                  remu         s7, s8, a4
                  fclass.s     a6, ft1
                  lui          sp, 235850
                  feq.s        s4, fs5, fa6
                  feq.s        t5, fa1, fa1
                  fsqrt.s      ft7, fa4
                  fmin.s       fs10, fs7, fs7
                  addi         a1, a3, 3
                  sra          s11, a6, sp
                  rem          s4, s4, zero
                  auipc        s10, 252758
                  fmv.x.w      s3, ft2
                  div          t1, zero, a1
                  fdiv.s       fs5, fs8, ft2, rdn
                  slt          t4, t4, a2
                  fmv.x.w      a7, ft2
                  auipc        s4, 672451
                  fcvt.wu.s    t3, fa4, rup
                  divu         s3, s5, a1
                  fsub.s       fa2, fa0, fa5, rtz
                  fcvt.wu.s    t3, fs6, rtz
                  sltu         t4, t3, s0
                  sll          s10, s10, a4
                  ori          t1, a4, 617
                  fmin.s       fa7, ft8, ft4
                  fmv.w.x      ft10, a6
                  fmul.s       fs9, fs10, ft8, rup
                  fsgnj.s      fa1, ft7, fa0
                  lui          tp, 817203
                  lui          a4, 483093
                  xori         a2, a4, 928
                  fsgnjx.s     fa4, fa3, fs9
                  fmin.s       ft8, fs0, fs0
                  slli         s11, s6, 25
                  xor          ra, a5, s1
                  addi         a7, t1, 740
                  fmv.x.w      a3, ft3
                  srai         s7, s4, 13
                  addi         tp, s11, -1351
                  mulhsu       t4, a1, a6
                  divu         t1, a7, s8
                  fdiv.s       ft3, fs7, ft2, rup
                  srai         t1, zero, 18
                  fcvt.s.wu    fs11, a6, rne
                  fmax.s       ft8, fa5, fs4
                  fdiv.s       ft3, fa2, fs4, rmm
                  slt          t3, a4, s8
                  nop
                  fsub.s       fs9, ft5, ft6
                  fcvt.s.wu    ft8, ra, rne
                  fclass.s     a0, fs9
                  xor          a1, ra, s2
                  feq.s        a2, ft0, ft0
                  fcvt.s.w     fs6, t3
                  srai         s5, a3, 3
                  mulhu        a1, s0, t3
                  fmv.x.w      a7, fa3
                  mul          t3, t3, gp
                  sra          a5, a2, a7
                  fmv.x.w      a6, ft8
                  fsub.s       fa1, fs0, fs1, rdn
                  xori         t4, sp, 1520
                  slt          zero, s3, t2
                  fsub.s       fa6, fa7, ft4, rup
                  fle.s        sp, ft5, fs8
                  mulhu        t1, s6, a1
                  fmax.s       fs9, fa4, ft9
                  add          s5, s2, s6
                  srli         s10, a4, 2
                  fsgnj.s      fs0, ft3, fs5
                  mulhsu       t2, t6, s6
                  fcvt.w.s     ra, ft5
                  sll          s5, s9, s10
                  lui          s7, 858798
                  lui          t4, 816607
                  mul          a6, s6, a4
                  div          s2, s5, s6
                  sra          s5, s9, s0
                  fmin.s       fs5, fs2, ft2
                  sltiu        t5, t6, 1151
                  div          zero, gp, s5
                  addi         s6, s5, -486
                  div          a3, s4, a7
                  or           s11, sp, s5
                  srl          sp, s0, s1
                  sltu         s6, t4, t5
                  fmv.x.w      a6, fs9
                  addi         a7, ra, -413
                  fcvt.w.s     a4, fa4, rne
                  nop
                  xori         a7, s10, -1694
                  fdiv.s       fa7, fs4, fs11, rdn
                  fsqrt.s      ft7, ft6
                  mulh         a3, s0, t5
                  xori         t5, s3, 1346
                  srli         t3, t3, 23
                  sra          s10, t1, s0
                  sltu         s11, a0, a7
                  fmul.s       fs3, fs3, fs0
                  xori         a6, a5, -208
                  sub          t1, s10, a5
                  sltu         t2, tp, s2
                  mulhu        s6, s6, t6
                  mul          s10, ra, ra
                  slti         t1, s4, -100
                  div          sp, t6, tp
                  slt          sp, s0, t1
                  sltu         t4, t5, a5
                  fclass.s     s2, fs11
                  fmv.w.x      fs7, t6
                  feq.s        a3, fs7, fs1
                  mulhu        s11, a7, s1
                  fsgnj.s      fs9, ft2, fa7
                  slli         s6, s6, 31
                  slti         s11, s4, -695
                  flt.s        s2, ft0, fs6
                  slli         t6, s1, 26
                  fmv.w.x      fs9, sp
                  sub          s2, s3, a1
                  fmv.w.x      fs1, s4
                  xor          s2, s10, ra
                  fle.s        a3, fs4, ft5
                  fsgnjx.s     fa5, ft4, fs10
                  slti         a1, t2, -1743
                  srl          t0, s3, s4
                  slti         s3, sp, -784
                  mulhu        a4, s4, t6
                  div          a5, s1, t0
                  ori          tp, a4, -1743
                  lui          a6, 851371
                  feq.s        tp, ft5, ft10
                  remu         a2, t6, a0
                  fclass.s     t5, ft2
                  andi         zero, zero, -523
                  div          t3, t2, s9
                  slt          s5, s7, s6
                  add          s2, a5, s5
                  fsgnjx.s     fs7, fa7, fs0
                  slt          s0, a3, a0
                  addi         s2, ra, 779
                  divu         t5, s5, a7
                  mul          a3, t5, a7
                  fmax.s       fs5, fs4, fs8
                  lui          t1, 334202
                  xori         t6, t5, -550
                  fmv.x.w      s4, fa7
                  fsub.s       fs6, fs0, fs8
                  ori          t1, ra, 358
                  mulhu        t4, s6, a3
                  sra          s0, tp, t2
                  mulhu        s0, s0, s10
                  slt          s3, a4, s7
                  rem          s7, t5, ra
                  fsgnj.s      fa7, ft7, fa0
                  sltiu        t4, a4, 378
                  fsqrt.s      fa1, ft6, rne
                  xor          s6, a7, zero
                  srli         t4, s10, 23
                  slli         t4, a3, 28
                  sltu         t6, s4, s11
                  fmin.s       fs9, fs5, ft3
                  auipc        a4, 109926
                  sltu         s5, s10, a0
                  fsqrt.s      fa1, ft4
                  fmax.s       fa3, ft7, ft10
                  fcvt.w.s     s0, fs1, rup
                  divu         s5, s3, s11
                  fsgnj.s      ft10, fs6, ft2
                  fdiv.s       fa1, ft1, fs11, rne
                  fcvt.w.s     tp, fs2
                  fmv.w.x      fa0, a7
                  fsgnjn.s     ft10, fa6, fa0
                  and          t0, s11, a3
                  or           a0, s1, a7
                  srli         s11, a1, 30
                  divu         s0, a7, ra
                  fcvt.wu.s    t3, fs7, rne
                  sltu         s2, s3, s5
                  rem          s3, a3, a1
                  flt.s        t2, ft2, fs3
                  fmv.w.x      fa2, t2
                  mul          s2, s11, s6
                  sltiu        gp, s0, -1677
                  slt          a4, s11, s4
                  sltu         s6, s1, tp
                  divu         a3, t0, s2
                  fcvt.s.wu    ft1, a6
                  fsgnjn.s     fa4, fs1, ft9
                  mulh         t5, s0, a4
                  srai         a6, sp, 22
                  fsgnjn.s     fs8, fs4, fs0
                  fsgnjx.s     ft1, ft4, ft3
                  xor          s4, zero, a4
                  fle.s        t5, fa7, ft11
                  remu         t4, a5, s7
                  srli         a5, t6, 4
                  lui          a2, 920649
                  mulhsu       a2, t6, a6
                  sltiu        sp, zero, 285
                  sll          a4, t3, s9
                  or           s10, s0, t0
                  addi         zero, a5, 663
                  fsgnjx.s     ft6, fa4, fs8
                  fdiv.s       ft4, fs5, fa0, rmm
                  fadd.s       fs3, ft7, ft3, rmm
                  srl          a3, gp, a1
                  sub          a3, a7, s10
                  fcvt.wu.s    t6, ft6, rdn
                  xor          gp, a1, s5
                  addi         s4, zero, 200
                  fsqrt.s      fs4, fs9
                  fcvt.s.w     fs11, s8
                  sub          s0, s3, ra
                  fsub.s       fs4, ft0, fs3, rdn
                  lui          ra, 598505
                  rem          s0, s4, s0
                  fcvt.w.s     a3, fs1, rtz
                  sra          a2, s9, s7
                  divu         s5, t6, a1
                  sltiu        a7, a4, 1539
                  fle.s        a4, fs8, fs5
                  fcvt.s.wu    fa5, s8, rup
                  div          a5, s4, t1
                  fsgnj.s      ft5, fs2, fs7
                  div          a7, a0, s7
                  andi         s0, a6, 1779
                  sll          t2, t0, sp
                  fle.s        s0, fs2, ft0
                  addi         t1, s6, -157
                  fsgnjn.s     fs4, fs3, fs3
                  srai         a3, s9, 15
                  slt          sp, s5, sp
                  mul          t6, zero, t6
                  and          ra, ra, s2
                  mulh         gp, t5, tp
                  and          s2, a7, t2
                  auipc        s4, 161579
                  fsgnj.s      fa5, fs0, ft10
                  fcvt.wu.s    sp, fs1, rdn
                  xor          sp, s4, a1
                  fclass.s     s11, ft8
                  srai         s3, t5, 21
                  srli         s6, a1, 14
                  fadd.s       ft2, fa6, ft3
                  mul          t4, ra, s1
                  flt.s        s4, ft1, ft5
                  srai         s5, gp, 7
                  sll          a1, s5, a3
                  add          s11, t2, s11
                  fclass.s     t6, ft5
                  divu         s4, a2, t3
                  fmv.w.x      ft9, a2
                  remu         tp, t1, s1
                  srai         a3, a0, 16
                  sltu         s3, gp, s7
                  srli         s5, zero, 3
                  fsub.s       fs6, ft5, ft11, rne
                  fsgnj.s      ft9, fa1, fs3
                  slt          gp, s11, t5
                  mulh         a1, a0, a2
                  fsgnjn.s     ft11, fa0, fs7
                  rem          t2, s2, tp
                  sltiu        s2, t5, -130
                  srli         s4, a4, 25
                  flt.s        s5, fa4, fs11
                  slt          gp, ra, a4
                  fmv.x.w      ra, fs9
                  xori         ra, t3, -1477
                  xori         a6, a2, -388
                  sra          ra, s10, t4
                  sltu         a4, a6, s11
                  mul          t6, a7, a0
                  fcvt.w.s     a1, fa1, rdn
                  ori          a6, a0, -372
                  sltiu        a4, s11, -392
                  fmul.s       ft11, fa2, fa7
                  remu         a5, t5, gp
                  fcvt.wu.s    tp, ft2
                  fcvt.wu.s    s10, ft7
                  slti         s5, s7, -559
                  mul          zero, t3, tp
                  mulhsu       t0, zero, sp
                  nop
                  remu         s5, a1, s9
                  remu         t2, a2, t2
                  lui          a3, 668938
                  fsub.s       fs11, fs2, ft5, rdn
                  div          ra, s4, a6
                  fclass.s     a7, fs10
                  mulhu        a6, a3, a5
                  sltiu        tp, a1, -1926
                  sra          s2, s10, a5
                  addi         zero, ra, 263
                  fmin.s       fs8, ft4, fs3
                  mulh         ra, t4, ra
                  divu         s4, zero, s9
                  or           t6, s0, t4
                  lui          t1, 607970
                  feq.s        t3, fa3, fs8
                  or           a4, t4, s8
                  mul          zero, s8, ra
                  lui          a1, 781158
                  fcvt.w.s     gp, fa7, rne
                  mul          a1, s4, a6
                  add          a0, t3, t0
                  srli         s6, t0, 25
                  auipc        t6, 361022
                  divu         ra, s4, zero
                  fsgnjx.s     fa3, ft6, fs3
                  fcvt.s.wu    ft3, t4
                  sra          a7, s8, a6
                  fdiv.s       ft7, fs2, ft6
                  sltu         s4, s9, t2
                  slti         a6, t2, -301
                  mulhsu       tp, s1, t1
                  srl          t2, t1, t6
                  fsub.s       ft7, ft3, fs10, rdn
                  fadd.s       ft5, fa0, fs11
                  sll          a1, a4, s5
                  fmv.w.x      fa4, a4
                  mulhu        s3, a4, s10
                  lui          a2, 535189
                  divu         a3, s8, t2
                  fmax.s       fs9, fs10, ft3
                  fcvt.w.s     s4, ft1
                  xor          s6, a1, a5
                  fsub.s       ft4, ft0, fs11
                  addi         gp, t5, 318
                  mul          s2, s4, sp
                  flt.s        a1, ft10, fs1
                  sra          a4, s1, a1
                  ori          a0, t0, 720
                  mulhu        s3, a2, ra
                  fsgnjx.s     fs7, ft6, fs10
                  fmin.s       ft10, fs7, fa5
                  fsgnj.s      fs5, fs2, ft7
                  divu         a6, gp, a0
                  fsqrt.s      ft10, fs10, rup
                  fcvt.wu.s    s11, fs9
                  fmul.s       ft0, fs3, fa3, rup
                  fsqrt.s      fs9, ft11, rmm
                  sltu         s10, t0, a3
                  slli         t3, s4, 17
                  fsgnj.s      fs3, ft6, ft0
                  fcvt.s.w     fa1, s9, rmm
                  fmin.s       ft11, ft10, ft1
                  srli         t4, t5, 30
                  andi         s10, s8, 603
                  fmul.s       fs8, fa0, ft10
                  auipc        t2, 28610
                  fcvt.s.wu    fa7, t2, rne
                  xor          s4, zero, gp
                  fcvt.wu.s    s11, fa0, rmm
                  remu         s0, tp, t2
                  div          a4, t2, a4
                  fmul.s       ft9, fs10, ft5
                  and          s7, gp, a7
                  fle.s        s4, fa1, fs5
                  fcvt.s.w     fa2, a7, rup
                  fsqrt.s      ft8, ft10, rdn
                  slti         s6, s2, -981
                  fcvt.w.s     s2, fs9, rdn
                  sll          t4, s10, a6
                  feq.s        t6, fs4, ft3
                  fmv.w.x      fa5, s2
                  lui          tp, 720109
                  fadd.s       fs2, ft7, ft9, rup
                  srl          a0, s5, t5
                  mulh         s6, gp, t4
                  fcvt.wu.s    a3, fs2
                  slt          s11, t5, a0
                  sra          a1, t2, sp
                  ori          t4, a4, -1158
                  fcvt.s.w     fs8, a3, rne
                  fle.s        s5, fa6, fa7
                  fmin.s       ft1, fs8, ft11
                  sll          a4, s6, s11
                  div          a0, a3, a4
                  slti         t6, a4, -2012
                  fcvt.w.s     a5, fa1, rne
                  fcvt.wu.s    t5, ft10
                  fmax.s       fa6, ft7, ft3
                  fdiv.s       fa5, fs8, ft4, rup
                  sll          t4, tp, s0
                  fcvt.s.w     ft10, a2, rne
                  sltu         s6, ra, t2
                  auipc        s3, 683488
                  fdiv.s       fa2, fa6, fs6, rmm
                  and          s5, t6, gp
                  fmin.s       fs0, fs8, fs11
                  srai         t1, a7, 18
                  mulh         ra, s0, a4
                  slt          a2, t5, a1
                  nop
                  mulhu        t2, t6, s3
                  fcvt.wu.s    t4, fa3, rup
                  fmax.s       fa2, ft11, fs9
                  slti         s0, a0, 1829
                  xori         t1, s3, 92
                  addi         s2, tp, -1324
                  divu         s2, s8, t6
                  mul          a3, t1, s3
                  addi         a1, sp, 1773
                  fdiv.s       fs10, fa2, fs1
                  or           a1, a3, s1
                  fcvt.wu.s    s7, ft6
                  remu         a5, s11, s3
                  fclass.s     a5, fs2
                  mulhsu       ra, a2, s0
                  fmv.x.w      s4, ft0
                  auipc        a3, 48284
                  srl          t3, t3, s3
                  fmin.s       fs11, ft6, fs3
                  fmul.s       ft7, ft4, ft11, rtz
                  xor          t6, s10, a1
                  fclass.s     s6, ft0
                  sltiu        t1, sp, 25
                  fdiv.s       fs5, fa4, ft2, rdn
                  mul          a0, s3, s11
                  and          a5, a4, s4
                  mulhsu       t3, s9, sp
                  nop
                  fcvt.s.w     fa2, t4, rtz
                  or           t0, t0, a0
                  or           tp, t0, a6
                  xor          t2, a7, s1
                  fsub.s       fs1, ft4, ft6, rdn
                  fmv.x.w      a0, fs11
                  ori          s10, a4, -618
                  andi         s0, a2, 750
                  xori         zero, a7, 573
                  add          a3, s6, sp
                  slli         s7, t4, 0
                  fsgnj.s      fa6, fs3, fs4
                  and          a3, s5, gp
                  sll          s7, a4, s3
                  nop
                  fsub.s       fs2, ft4, ft4
                  nop
                  rem          s11, tp, sp
                  rem          s10, ra, t6
                  or           a0, ra, a3
                  fsgnj.s      fs2, ft0, ft1
                  sltu         s6, tp, a0
                  mulhu        a1, s8, a3
                  sll          s4, a5, s6
                  and          s2, gp, s7
                  sra          ra, a5, t3
                  rem          t1, a1, t2
                  fclass.s     tp, fa2
                  xori         tp, s9, -880
                  srai         t5, t5, 20
                  sra          a0, s2, zero
                  fmv.x.w      s2, fs7
                  xor          s6, t2, t0
                  mul          t5, a7, s7
                  xori         s0, t4, 918
                  fmax.s       ft0, fa5, fa7
                  fmax.s       fs0, fs5, fa0
                  fdiv.s       fa3, ft0, fa7, rtz
                  slt          t6, a5, t3
                  divu         s4, tp, a2
                  addi         t2, a5, -1909
                  fle.s        s11, ft7, fs5
                  mulhsu       zero, s6, a7
                  sltu         s5, t4, s4
                  fcvt.s.wu    ft9, s8
                  xor          t3, t2, s11
                  fmv.w.x      fs6, s0
                  rem          s0, s11, gp
                  fmin.s       fs11, ft7, fa2
                  and          t2, t5, s7
                  auipc        t3, 846590
                  fle.s        a3, ft8, fa3
                  remu         zero, s0, tp
                  remu         s7, t3, t0
                  fmul.s       ft1, fs0, fa5, rdn
                  lui          s6, 127659
                  mulhsu       s5, a6, s4
                  fsqrt.s      ft8, fa7, rdn
                  fsgnj.s      fs9, ft0, ft2
                  fle.s        s11, ft11, fs5
                  fle.s        t0, ft1, fs4
                  or           a4, s11, a0
                  fsgnj.s      ft0, ft3, fa2
                  fle.s        a2, ft6, fa7
                  div          s7, ra, t0
                  fclass.s     t5, fs5
                  auipc        t1, 937765
                  fle.s        s0, ft7, fa6
                  slt          a1, t2, s7
                  xori         s4, a6, 735
                  add          a5, ra, a4
                  sra          s11, s8, t6
                  fmv.x.w      s7, fs8
                  add          t0, s7, a7
                  fmin.s       fs4, fa4, fs9
                  fle.s        zero, fa6, fa2
                  fmv.w.x      ft7, a2
                  flt.s        s10, fs5, fa2
                  fcvt.s.wu    fs11, s9
                  fmv.w.x      fs10, a5
                  div          s7, t1, t2
                  fmv.x.w      a1, ft0
                  fmax.s       fs11, fs0, fs1
                  auipc        s6, 93585
                  srai         t3, a2, 2
                  sub          t4, a4, s6
                  fmv.w.x      ft3, s5
                  fsgnjn.s     fa5, fa3, ft1
                  sra          t1, ra, a5
                  div          sp, s3, a5
                  mul          s6, a4, a2
                  andi         t0, gp, 1291
                  fcvt.s.w     fs11, a2, rdn
                  fmin.s       ft9, ft9, ft8
                  fsgnj.s      fs2, fa1, fs5
                  auipc        s4, 472899
                  fmul.s       ft5, ft8, fs2
                  or           sp, a1, s1
                  rem          t1, a0, s7
                  fadd.s       ft8, fs8, ft5, rtz
                  fadd.s       ft5, fs7, fs11
                  divu         t6, s9, s0
                  fcvt.w.s     s5, ft7
                  slli         a0, gp, 1
                  sll          a5, a2, zero
                  andi         s5, a4, -874
                  mulhu        a5, t5, s6
                  auipc        zero, 926693
                  nop
                  or           t5, t1, t1
                  sltu         a0, t5, a5
                  remu         s6, t4, a1
                  andi         s7, t1, -1255
                  fsgnjx.s     fs3, fs11, fa4
                  sltiu        t6, s10, -298
                  fmv.w.x      ft3, gp
                  add          s7, ra, t1
                  andi         t0, s9, 423
                  divu         t5, s0, sp
                  fmin.s       ft5, ft4, ft6
                  mulhu        t6, a3, t5
                  fclass.s     s10, ft2
                  fmv.x.w      t1, ft8
                  fle.s        s6, fs2, ft9
                  fcvt.wu.s    t1, ft5
                  fmv.x.w      s2, ft6
                  sltiu        s10, t3, -839
                  feq.s        a4, ft9, fs10
                  fadd.s       ft4, fa0, ft9
                  fle.s        a1, fs7, ft6
                  or           s7, tp, t6
                  andi         t0, a5, 986
                  fsub.s       fa4, ft7, ft10, rup
                  fsgnjx.s     fa7, ft2, ft8
                  srli         s3, t4, 5
                  andi         s4, a4, -652
                  or           s10, t2, a3
                  srai         t6, t0, 15
                  fsgnj.s      fs11, ft5, ft1
                  flt.s        a0, fs3, ft5
                  sub          gp, a5, tp
                  div          a7, ra, a4
                  sll          s5, sp, a1
                  srai         s2, tp, 2
                  sll          gp, a5, tp
                  feq.s        a0, fs2, fs0
                  div          t3, t6, ra
                  mul          s7, t4, a7
                  fsgnjx.s     fs4, ft4, fs4
                  divu         s0, s10, t3
                  and          s10, s10, s3
                  lui          t4, 574483
                  fsub.s       fs2, fs9, fs9
                  slli         gp, gp, 29
                  fcvt.s.wu    fa2, s0
                  mul          t0, t3, s10
                  mulh         a2, tp, s8
                  sra          s11, a2, s3
                  and          s4, tp, s3
                  fmax.s       ft2, fs7, fa1
                  fclass.s     s7, fa0
                  sltiu        t3, a6, 397
                  remu         s10, s6, gp
                  xor          a3, t3, t5
                  mulhsu       t5, a6, a6
                  fclass.s     t4, ft0
                  mul          s4, s10, a3
                  mulhu        a7, a0, a6
                  srai         tp, sp, 26
                  fmul.s       fs0, fa7, fs5
                  or           s6, a0, ra
                  remu         t0, s7, s11
                  fsub.s       fs8, ft8, fa2, rne
                  ori          t5, tp, -2045
                  fsgnjn.s     fa2, ft3, ft10
                  srl          tp, a6, s4
                  mulhsu       t4, t2, t5
                  xor          a3, a3, sp
                  fcvt.s.wu    fs5, a7
                  sltiu        a1, a6, 769
                  mulhsu       t5, s2, s6
                  mulhu        a7, a6, t3
                  rem          s4, s3, a3
                  fmv.w.x      fs0, a1
                  fcvt.wu.s    s4, ft3
                  sub          t3, s0, s3
                  rem          a1, s2, a1
                  xor          a7, s2, zero
                  slt          a2, s1, s11
                  sltiu        a2, t2, 1405
                  sra          a1, a4, s8
                  fsgnjn.s     fs5, ft7, fa5
                  divu         s5, s9, t6
                  auipc        a2, 127251
                  srl          a3, ra, t3
                  sra          t4, s4, zero
                  fcvt.wu.s    zero, fs4
                  or           s11, a0, s7
                  fsgnj.s      ft7, ft10, ft4
                  divu         a7, s10, a0
                  fsub.s       fs4, ft1, fa3, rmm
                  flt.s        t0, ft10, fa7
                  lui          a4, 142812
                  mul          s10, sp, a5
                  mulhsu       a4, a0, s6
                  addi         t2, s2, -150
                  mulhu        s3, a6, t4
                  sll          a0, a6, a7
                  mulh         t1, a0, t0
                  sll          a7, a5, t3
                  fcvt.s.wu    ft5, a1
                  mulhu        s6, t2, t2
                  slti         a1, gp, 1449
                  mulh         s5, gp, sp
                  fcvt.s.w     fs9, t6, rtz
                  fcvt.w.s     s11, fa5, rdn
                  fcvt.wu.s    a3, fs4, rmm
                  slli         s3, s7, 29
                  fmv.x.w      t1, fa6
                  slti         a0, a5, -1498
                  fmv.w.x      ft5, t4
                  srai         t4, s6, 26
                  andi         a4, zero, 1213
                  sub          t6, s7, t4
                  sub          s6, t4, t4
                  srli         s10, sp, 30
                  srli         t0, a2, 30
                  flt.s        s4, fa0, fa7
                  andi         s6, s11, -1750
                  fsqrt.s      fs6, fs2, rne
                  fsub.s       fa3, fa0, fs5, rup
                  fcvt.s.w     ft6, s9, rtz
                  rem          tp, gp, t5
                  fsgnjx.s     fs4, ft8, ft1
                  fcvt.w.s     s0, fs11, rmm
                  srli         s5, s6, 7
                  lui          sp, 265174
                  mulh         tp, a4, gp
                  xor          s0, t6, t1
                  fcvt.w.s     ra, fa6, rup
                  andi         t1, a3, 767
                  and          s4, s2, tp
                  xor          s4, a5, a7
                  fsgnjn.s     fs0, fa2, fs8
                  fle.s        a7, ft6, fs5
                  or           t5, s1, t5
                  sltu         sp, a1, a2
                  ori          t5, t4, -99
                  slt          a3, s2, s1
                  srli         a6, s1, 31
                  fsqrt.s      ft1, fa1, rmm
                  feq.s        zero, fa3, ft3
                  mulh         gp, sp, t0
                  srl          a5, gp, a4
                  fdiv.s       fa4, ft1, ft11
                  and          a3, s8, zero
                  fmin.s       ft7, ft7, fs2
                  srl          a2, s1, a0
                  fadd.s       fs5, fs8, fs5, rdn
                  lui          s3, 113471
                  sra          s11, gp, s9
                  srl          a5, gp, t4
                  slti         t1, t2, -1612
                  fsgnjx.s     fa0, fa7, fa4
                  andi         s4, s8, 1429
                  fmul.s       fs0, ft9, fs2, rmm
                  mulh         tp, t2, zero
                  flt.s        t2, ft11, ft9
                  sltiu        a5, a1, -136
                  fle.s        t6, ft10, ft2
                  sra          t2, a4, t4
                  div          s3, tp, a7
                  mul          t1, t3, s0
                  fadd.s       fa0, ft3, fs8, rmm
                  remu         a2, tp, s6
                  slti         a5, s4, 175
                  fsgnjx.s     fs4, fa4, fs0
                  fle.s        t3, ft7, ft6
                  fadd.s       fs11, fs2, fs5, rup
                  xor          gp, s10, t0
                  addi         s6, a2, -680
                  xori         t1, t1, 1871
                  slti         a3, tp, -1130
                  rem          t5, s11, t3
                  sra          a1, s3, s5
                  or           sp, t2, sp
                  fle.s        s11, fa2, ft1
                  fmv.x.w      t3, fa0
                  addi         a1, a0, -661
                  fsub.s       ft9, fa7, fs8
                  xori         s11, s9, -1788
                  srl          t1, gp, a0
                  xor          a6, s1, s4
                  fcvt.wu.s    a4, ft3
                  mulhsu       s11, t3, a4
                  rem          a7, t5, s7
                  or           t6, s9, zero
                  fmin.s       fs6, fs1, ft4
                  slti         a5, s3, -1844
                  fsgnj.s      fs5, fs5, fa0
                  fdiv.s       fs10, fs0, ft10, rtz
                  fcvt.s.wu    fs6, sp, rmm
                  andi         a7, t5, 442
                  or           t0, t0, a1
                  fcvt.wu.s    ra, fa3, rup
                  fcvt.s.wu    fs8, s6
                  fcvt.s.wu    fa6, s2, rup
                  slli         tp, a1, 8
                  sra          s11, t5, a2
                  xor          a7, tp, a6
                  slt          gp, t2, s0
                  or           s4, t2, a5
                  srai         s6, s11, 16
                  slt          s10, a3, s2
                  slti         s4, s5, -903
                  auipc        a1, 157547
                  mulhu        t4, t1, t6
                  and          s7, s2, s10
                  fcvt.s.w     fa5, a7, rmm
                  rem          s2, s9, s11
                  auipc        t2, 771154
                  fadd.s       ft9, ft5, fs3
                  mulhu        t2, t3, t4
                  fsgnjn.s     fs6, ft3, fa7
                  fmv.w.x      ft9, t0
                  flt.s        t5, ft3, fa0
                  fmv.x.w      t0, fs10
                  lui          sp, 448025
                  fmul.s       ft11, fa4, ft1
                  nop
                  and          sp, a1, s9
                  slli         s0, s7, 3
                  ori          a0, s0, 899
                  sltiu        ra, t6, -1526
                  srli         t2, a3, 26
                  mul          tp, a7, a3
                  fclass.s     a2, fs4
                  sub          a2, s3, s5
                  fmax.s       fs10, fs5, fs7
                  rem          s10, s8, t1
                  fadd.s       ft11, fs4, fs7, rdn
                  flt.s        t4, ft10, fa1
                  fsgnj.s      ft5, ft2, fs7
                  div          zero, ra, t2
                  sll          s4, t2, a1
                  fmax.s       fs3, fs7, fa2
                  fadd.s       fa0, ft10, fa7
                  sltiu        tp, t0, 1129
                  sra          t1, t4, s6
                  srai         t2, t6, 19
                  srl          a7, a0, s0
                  remu         ra, a0, a5
                  fcvt.w.s     s10, fs6, rmm
                  fsgnj.s      ft2, fs3, fa4
                  xori         s4, a3, 199
                  fle.s        a0, fs10, fs7
                  sltu         s7, a3, a0
                  andi         t3, s9, -1211
                  sltiu        t3, a6, -33
                  lui          t4, 8246
                  sra          t0, t2, s8
                  fdiv.s       fa4, ft2, fs5
                  mulhu        a0, s2, s10
                  divu         t0, s9, s9
                  fle.s        gp, fa0, fs11
                  sra          a0, t4, a5
                  mulh         t0, a6, s5
                  slti         t5, s1, 1692
                  slti         t1, s6, 668
                  fmv.w.x      fs3, s1
                  fmul.s       fa3, fa6, ft7, rup
                  srl          gp, s2, a3
                  fmv.x.w      t3, fs7
                  srl          t6, a4, t2
                  fmul.s       fa4, fs6, fa5
                  nop
                  srli         t5, a6, 9
                  xori         s5, s0, -1813
                  or           s0, zero, t0
                  sra          s10, t3, s10
                  fmax.s       ft8, ft7, ft7
                  ori          a2, s4, -1825
                  srai         s5, s4, 17
                  fclass.s     a1, fs1
                  addi         t2, t2, 1308
                  addi         s10, a0, 1004
                  fsgnjn.s     fa6, fs4, fs11
                  fcvt.s.wu    ft8, t0, rne
                  fmv.w.x      ft3, sp
                  fsgnjx.s     ft1, ft0, fs8
                  sll          s6, s4, a2
                  rem          s0, s0, a4
                  fdiv.s       fs1, fa3, fs11, rtz
                  rem          a1, a0, s11
                  fmin.s       ft7, fa3, fa3
                  xor          s11, s3, t0
                  rem          s6, s1, s9
                  sub          s5, s3, a1
                  fcvt.s.wu    ft11, s11
                  mulh         sp, t0, s1
                  div          t1, t6, a4
                  mulh         s0, s6, t4
                  fsub.s       ft3, fs11, fa5
                  fmin.s       ft9, ft5, fa0
                  rem          s4, a1, s3
                  and          t2, s0, t3
                  fsgnjx.s     fa0, fs0, fs4
                  rem          t2, a5, s7
                  xori         t5, a1, -108
                  fsub.s       ft3, ft6, ft10
                  fsub.s       fs4, fa0, ft8, rdn
                  slt          s6, a7, t3
                  or           s6, s11, s0
                  fcvt.s.wu    fa6, s5, rtz
                  lui          a6, 181744
                  fmul.s       fs3, fs0, ft9
                  ori          zero, a3, -826
                  fmv.x.w      s10, ft4
                  slli         a7, s8, 24
                  fclass.s     tp, fa7
                  divu         s5, s3, t2
                  add          s4, a5, s2
                  fsgnjn.s     ft1, ft6, ft7
                  remu         s10, ra, a0
                  fcvt.s.wu    ft8, s8, rup
                  lui          t2, 518666
                  fcvt.wu.s    s11, fs1
                  and          t0, a0, a1
                  or           t6, a4, t1
                  slli         sp, s1, 3
                  addi         a0, a3, 1857
                  srai         a2, ra, 2
                  andi         tp, a4, -615
                  srai         tp, ra, 11
                  ori          t5, t0, 1389
                  sltu         s5, a0, a1
                  andi         s2, t4, -1124
                  sltiu        t2, t2, -1509
                  fclass.s     a1, fa4
                  feq.s        ra, fs7, fa4
                  and          a0, a3, t4
                  lui          a5, 737525
                  rem          tp, a1, t6
                  xori         ra, a4, 1052
                  andi         t6, a7, 702
                  slli         sp, t1, 15
                  remu         a6, a5, s0
                  mulhu        zero, zero, t3
                  mul          s3, a4, zero
                  sub          t4, gp, s10
                  fcvt.s.w     ft0, a7
                  fmul.s       fs2, fa3, ft3
                  fsub.s       ft11, fs10, fs8
                  srai         s6, s10, 26
                  sub          t2, s6, ra
                  divu         t4, a2, t2
                  srli         s5, s8, 21
                  fsgnjn.s     fa0, ft8, fa3
                  slti         a1, ra, -2039
                  addi         s4, s2, 1306
                  flt.s        t3, ft10, fs5
                  ori          t5, sp, 1826
                  fmv.x.w      s11, ft4
                  fclass.s     a3, fs2
                  remu         t0, s11, t6
                  fmv.w.x      fa4, zero
                  fsub.s       ft5, ft1, fa0
                  fadd.s       fa1, fs6, fa5, rmm
                  mulhu        t6, s1, s6
                  nop
                  srai         zero, gp, 15
                  and          a6, a4, s8
                  fmin.s       fa3, ft8, ft6
                  sra          s5, a7, s3
                  addi         s6, zero, 1738
                  slli         t0, t5, 3
                  or           a7, s1, t2
                  nop
                  divu         t1, a4, ra
                  div          t1, t1, s10
                  sll          t3, a2, t3
                  fmax.s       fa6, fs1, fs9
                  andi         t1, a2, -601
                  slti         tp, a5, -1610
                  xor          gp, t1, s0
                  fcvt.w.s     tp, fs7, rmm
                  fmv.w.x      fa4, s1
                  addi         a6, gp, -1065
                  sra          ra, a6, a5
                  mulhsu       a7, t4, s5
                  fcvt.s.w     ft8, t2, rtz
                  rem          s10, s0, t2
                  fmv.w.x      fs8, a4
                  fcvt.wu.s    s7, fa4
                  fmv.x.w      s4, ft11
                  fdiv.s       fs5, ft3, ft8, rtz
                  fmax.s       fa0, fs9, ft1
                  xor          s11, s2, t3
                  fcvt.wu.s    sp, fs1, rup
                  fmv.x.w      t3, fs0
                  fsgnjx.s     fs3, fs3, fs10
                  addi         ra, t6, -1534
                  fmul.s       fs6, fs11, fs8
                  srai         t1, t2, 14
                  slti         a7, s7, 1483
                  srli         s0, tp, 28
                  fmax.s       ft9, fa3, ft8
                  feq.s        a5, ft7, ft10
                  xor          s10, t6, sp
                  sub          sp, s5, s6
                  or           s4, s0, s11
                  or           a5, t1, t2
                  andi         sp, s1, -183
                  fmin.s       fs1, fs2, fa6
                  fcvt.w.s     a0, fa4, rne
                  lui          gp, 250684
                  fcvt.w.s     s11, fa7, rtz
                  fcvt.wu.s    s4, ft2
                  lui          a0, 93502
                  fmax.s       fa1, ft10, fs10
                  fclass.s     s5, ft1
                  mulhu        t3, s0, s10
                  ori          s4, s11, -1542
                  divu         s6, t4, zero
                  sra          a6, t0, sp
                  and          zero, s2, gp
                  div          s7, s6, s3
                  fmin.s       fs9, ft7, fs8
                  sll          s5, s0, t2
                  fadd.s       fs6, fs6, fa5
                  fsqrt.s      fa6, ft9, rne
                  divu         s6, t0, t4
                  fmax.s       ft3, ft9, fs7
                  andi         ra, t4, -40
                  fdiv.s       fa7, fs10, ft2
                  fcvt.wu.s    a4, fa2
                  fdiv.s       ft10, fa7, fs0
                  fcvt.s.w     ft11, t1
                  add          a2, s6, t0
                  mulhsu       a2, a4, s5
                  fmv.x.w      s7, fa4
                  fcvt.s.w     fa0, zero, rne
                  andi         s4, sp, 1020
                  srai         t3, a7, 3
                  srl          gp, s10, s4
                  remu         s2, s2, s5
                  fsqrt.s      fs0, fa2
                  and          a2, s8, a6
                  fsgnjx.s     fs5, fa7, fs9
                  xori         s0, s5, -1736
                  fsqrt.s      ft2, ft0
                  feq.s        a4, fa7, fs9
                  slt          s4, s0, a2
                  remu         zero, s1, t2
                  divu         a6, s6, zero
                  sll          a3, s6, a2
                  fcvt.s.wu    fs10, ra
                  andi         s6, sp, 680
                  fmul.s       ft8, fs8, fs0
                  nop
                  sltiu        t0, s2, -337
                  mulh         s2, t6, tp
                  mulh         t1, ra, t3
                  sub          s2, t3, a3
                  lui          a3, 1046868
                  xor          a7, t2, s1
                  ori          a6, t4, -467
                  divu         t2, s0, s2
                  xori         s4, tp, -150
                  fsgnjx.s     fs4, fa2, fa0
                  fcvt.w.s     a0, fa6, rdn
                  fdiv.s       fs4, ft7, fa6, rup
                  nop
                  lui          a6, 694071
                  addi         a0, s7, -1290
                  mulh         s11, s11, t4
                  andi         t2, s1, 395
                  flt.s        t3, ft7, ft4
                  auipc        t4, 373117
                  fmv.w.x      fs10, s6
                  fsub.s       ft7, ft0, fa6, rmm
                  add          a2, ra, t6
                  mulhu        gp, t6, tp
                  xor          a6, t6, a7
                  xori         zero, t0, 1436
                  srai         a5, a1, 8
                  mulhu        s4, a5, t5
                  rem          s5, t1, tp
                  srai         s3, s1, 26
                  slti         t0, s4, -234
                  ori          s3, s5, 1757
                  flt.s        t5, ft0, ft3
                  andi         t0, s11, -1720
                  xori         a7, s5, 615
                  fcvt.s.w     fs1, t4, rmm
                  mulhu        zero, s3, a5
                  fmul.s       ft9, fs6, ft3
                  mulhsu       t0, a2, s5
                  slti         t6, s1, 813
                  divu         a4, a1, tp
                  fle.s        s6, ft2, fs11
                  srai         zero, s7, 20
                  fsgnj.s      fs4, fs7, fa2
                  fmin.s       fs6, fs6, fs11
                  srl          s7, sp, s0
                  or           gp, t3, s9
                  and          t6, t0, ra
                  mulhu        s0, a4, ra
                  div          a0, a7, s6
                  sltu         t5, sp, t2
                  fsgnjn.s     ft8, fa1, fa5
                  flt.s        s10, fs6, ft5
                  fclass.s     t5, fs10
                  slli         ra, t4, 18
                  div          s0, a0, s10
                  nop
                  fdiv.s       fs8, fs5, fs6, rup
                  srli         a6, s9, 3
                  remu         t1, s10, s4
                  slti         s5, s7, 1599
                  mulhsu       t4, t6, sp
                  fsgnjx.s     ft0, fa5, fs4
                  fadd.s       fs11, fs1, ft5
                  rem          t1, s2, tp
                  feq.s        a3, fs3, fa5
                  lui          s6, 69731
                  srl          t2, s6, a0
                  fsub.s       fs11, ft7, ft2, rne
                  xori         ra, s11, 1872
                  fsgnj.s      fa0, fs6, ft6
                  fsgnjx.s     fa2, fs5, ft8
                  divu         a0, a0, a1
                  flt.s        t3, fs3, ft11
                  fcvt.w.s     t3, fa6
                  sltu         t5, s4, s1
                  lui          t0, 540016
                  srli         t1, t5, 30
                  fmax.s       ft3, fs11, ft7
                  sltiu        a4, a6, 678
                  fsgnjn.s     fs0, fs0, fs10
                  fmv.x.w      s0, fa5
                  fmin.s       ft5, ft7, fs7
                  sra          a6, s7, s11
                  fdiv.s       fs4, fa7, fs7, rne
                  fcvt.w.s     s0, fs3, rne
                  flt.s        s3, fs10, fs4
                  add          t6, s8, s2
                  sll          tp, a6, a2
                  srli         t3, t5, 6
                  fcvt.s.w     fs8, a1, rdn
                  ori          s3, a7, -1801
                  sll          t0, a2, s6
                  sra          zero, a0, s3
                  mulh         s0, gp, a5
                  and          t6, s7, s6
                  fsub.s       ft1, fa5, fa4
                  fcvt.s.wu    fa4, a5, rup
                  slli         s6, a3, 22
                  fcvt.wu.s    s0, fs8
                  and          ra, a6, s6
                  mulhsu       s5, s0, s9
                  fmul.s       fa0, ft1, ft5
                  or           a1, s2, sp
                  lui          s4, 360574
                  fcvt.wu.s    t6, fs11
                  sll          s3, s11, s2
                  srl          t2, t1, s3
                  divu         s11, s7, tp
                  lui          s7, 784855
                  auipc        t4, 733374
                  divu         s5, a7, a7
                  fsgnj.s      fs1, fs7, ft2
                  fmax.s       fs8, ft5, fs0
                  ori          t6, s11, 162
                  sll          t1, s6, a6
                  xori         t6, ra, -911
                  sra          s5, t6, s8
                  fmul.s       fs6, fa6, fa4
                  and          s10, s0, s11
                  auipc        sp, 356896
                  flt.s        t1, fa7, fs2
                  mul          a4, s6, s2
                  fmv.w.x      fa4, s8
                  sll          t5, t2, t2
                  fmv.x.w      a7, fs6
                  mulh         t5, s8, s1
                  mulh         s11, s2, s7
                  and          s4, tp, sp
                  fcvt.s.w     fs8, a0
                  fsgnjn.s     fa7, fs5, fs0
                  addi         s4, s0, -524
                  fsub.s       fs2, ft1, ft4
                  rem          t5, a5, t0
                  div          sp, a7, a3
                  slt          t0, s1, s8
                  fmin.s       fs8, fs10, ft11
                  fsgnj.s      ft7, ft7, fs9
                  feq.s        zero, ft2, fs10
                  fsub.s       fs0, fs10, fs10, rup
                  xori         ra, a5, -2046
                  mul          a1, s5, s9
                  flt.s        a6, ft9, fs4
                  fmax.s       ft11, ft8, ft8
                  sra          ra, a2, a0
                  fadd.s       fa5, ft7, ft2
                  fmv.x.w      zero, fs4
                  fcvt.wu.s    t1, fa7, rdn
                  and          tp, t6, s2
                  nop
                  fdiv.s       fs3, ft2, fs0
                  xori         a4, s4, 235
                  slli         a6, tp, 3
                  xor          s11, gp, a6
                  flt.s        t4, ft3, fs10
                  fcvt.s.wu    ft5, t6, rdn
                  fmin.s       fs8, fa6, fa6
                  div          t4, gp, sp
                  fadd.s       fs6, ft10, fa1
                  mulhu        a0, a4, s7
                  fcvt.s.w     ft2, a5
                  srai         a6, t2, 7
                  fle.s        t1, fs0, fa1
                  slt          zero, a2, zero
                  srli         s6, s3, 0
                  fmv.w.x      fa4, t4
                  addi         s0, s4, -1983
                  mulh         s4, s6, a7
                  fsgnjx.s     fs2, fa5, fa0
                  or           s3, s8, s2
                  fcvt.wu.s    s5, fa3, rup
                  sub          s6, a0, gp
                  fmax.s       fs5, fa5, ft3
                  slt          s4, tp, t1
                  add          t0, t1, sp
                  xori         t1, s4, -693
                  sra          a5, s3, t2
                  or           gp, s5, s0
                  rem          t0, t1, s4
                  mulhsu       a3, s10, a1
                  flt.s        t2, fs4, fs11
                  fle.s        a2, ft9, fs2
                  andi         zero, a1, 1030
                  srai         s4, t0, 26
                  feq.s        ra, fa6, fa1
                  slli         s3, a1, 6
                  fcvt.w.s     a3, ft0
                  mulh         t4, t2, t4
                  ori          t3, s8, 306
                  add          ra, s9, a2
                  div          a4, a3, t5
                  fcvt.w.s     t2, fs4, rne
                  fsgnjx.s     fa6, fs1, ft5
                  fmv.x.w      gp, ft1
                  div          a1, a0, ra
                  sub          s4, s2, t5
                  addi         a0, s7, 307
                  or           a1, ra, s9
                  fsgnjn.s     ft2, fs5, fs11
                  auipc        s3, 65547
                  or           s3, s8, t2
                  srl          s7, sp, s7
                  sltiu        a5, t0, 1385
                  fsgnjn.s     fa1, fs4, ft4
                  mulh         s0, t3, s6
                  sub          t0, a1, t5
                  or           s10, a2, a3
                  sra          s2, a1, s9
                  and          a3, t2, s4
                  fcvt.wu.s    t3, ft3, rne
                  mulh         t4, s9, a1
                  sltu         a5, s4, a0
                  srli         tp, s7, 13
                  fmv.x.w      a6, ft0
                  rem          s2, ra, t2
                  mulh         s5, s1, s10
                  fcvt.w.s     s7, fs9
                  rem          a2, t5, s8
                  sra          tp, a2, s8
                  and          s0, zero, a6
                  fcvt.wu.s    a7, ft5
                  sltu         s2, s8, s2
                  slli         t6, s8, 8
                  xor          a0, s0, a1
                  fdiv.s       ft0, fa2, fa0
                  nop
                  slli         t4, a7, 25
                  fsgnjx.s     fa4, fs11, ft3
                  sltiu        tp, s0, 946
                  feq.s        t5, fs6, ft1
                  sub          s3, a5, t0
                  fmv.w.x      fs3, ra
                  sub          a0, t2, s6
                  fle.s        gp, fa5, fa2
                  srl          ra, s11, a0
                  sltiu        a0, s9, -921
                  fmul.s       fa7, ft0, fa7, rdn
                  mulhsu       a6, s4, t3
                  nop
                  sltiu        s7, s0, 2020
                  fsgnjx.s     fs10, fs7, fs8
                  srai         t2, a0, 4
                  slti         s0, t5, 291
                  fmax.s       ft7, fa2, fs5
                  div          s4, s7, t4
                  mulhu        a3, a4, t0
                  srli         s2, a6, 0
                  feq.s        t5, fs3, ft11
                  fsgnjn.s     fs9, fa4, ft11
                  fmin.s       fs9, fs6, fs4
                  auipc        a2, 902866
                  lui          a4, 81450
                  fmax.s       fs11, ft11, ft0
                  srai         a2, s3, 7
                  andi         sp, t0, -680
                  sltiu        t6, a0, -59
                  divu         s7, t2, s3
                  sub          a0, a6, a7
                  fcvt.wu.s    s4, ft6, rtz
                  or           a3, s6, s0
                  fsqrt.s      fs10, fa1, rdn
                  or           t0, t4, t4
                  srai         a5, a3, 2
                  andi         s5, t5, 1879
                  add          ra, a1, s3
                  fmin.s       fs4, ft0, ft4
                  srai         s5, s3, 12
                  mul          a3, s1, t5
                  remu         zero, s4, zero
                  fclass.s     t3, fs7
                  fsgnjx.s     fs5, ft6, fs3
                  xor          a5, t4, s3
                  fclass.s     tp, fa3
                  xori         a4, s11, -476
                  xori         a1, s1, 493
                  srl          s11, t3, s0
                  mulhsu       t4, s0, t0
                  slt          a7, a3, a7
                  mul          s4, t0, t6
                  and          t5, sp, s4
                  divu         zero, t2, sp
                  mul          t4, s6, a2
                  mulh         a3, gp, s0
                  mul          s3, tp, a4
                  auipc        a7, 40637
                  div          t1, s8, s3
                  div          a6, s5, gp
                  or           a2, ra, a0
                  sltu         t6, s1, s11
                  fsgnjn.s     ft11, ft0, fa7
                  slli         a2, a7, 12
                  xor          a1, a4, t2
                  div          a1, a7, zero
                  fmv.x.w      t6, ft0
                  slt          a5, a3, s7
                  fcvt.s.w     fa4, a6, rup
                  fmv.w.x      ft7, s0
                  srli         t4, a6, 7
                  fcvt.w.s     a4, fa1, rdn
                  sltiu        a5, s8, 1419
                  fmv.x.w      a2, fa4
                  auipc        t5, 605371
                  fdiv.s       fs7, fa7, ft11, rne
                  sltu         a3, t5, t3
                  sra          s10, sp, s10
                  fsgnj.s      fs5, fs0, fs2
                  ori          a2, s5, 1562
                  fmin.s       fs2, fs4, fs6
                  or           a2, a7, s0
                  fsgnjn.s     fs0, fs6, ft9
                  slt          tp, s0, s4
                  fsgnj.s      fa7, fs5, ft1
                  mul          a3, a4, a4
                  andi         t0, s9, -1486
                  nop
                  sll          gp, a1, s7
                  andi         s11, a1, 1354
                  slli         s4, zero, 27
                  sltu         a7, s6, a3
                  fmul.s       fa7, ft7, ft10
                  srl          s0, s9, a1
                  mulh         a2, a4, t4
                  remu         s4, s11, a3
                  fle.s        gp, ft1, ft11
                  fcvt.s.wu    fs2, a6
                  or           a2, t5, s3
                  fsgnj.s      ft7, ft5, ft9
                  auipc        s0, 211269
                  nop
                  mulh         t2, s2, s7
                  fcvt.s.w     ft10, a1, rmm
                  addi         tp, sp, -1875
                  xori         a4, s5, -297
                  div          t4, s4, zero
                  fdiv.s       fa2, ft8, fs9
                  add          a3, s6, zero
                  mul          a6, s11, s7
                  fmax.s       fs7, ft0, fs6
                  remu         t1, a2, t2
                  fsgnj.s      ft11, ft3, ft5
                  fmv.x.w      a1, fs2
                  fmv.x.w      t5, ft3
                  add          tp, t0, a3
                  fsgnjn.s     ft7, fs9, fa4
                  sll          sp, gp, a2
                  and          a5, a6, s7
                  fsgnjx.s     fs1, fa7, fa2
                  fsqrt.s      fs7, ft4
                  remu         s4, t3, a3
                  flt.s        a3, ft4, ft5
                  slli         t1, a2, 6
                  div          a4, s4, a1
                  fmin.s       fa0, fa6, ft5
                  feq.s        a0, ft3, fa6
                  slli         s4, a7, 16
                  sll          s0, t0, s11
                  ori          t1, a7, -1313
                  fmul.s       fa6, ft3, fa4, rne
                  fcvt.s.wu    fa4, a4
                  fsgnjx.s     fa5, fa4, fs7
                  fmax.s       fs1, fs4, ft11
                  and          s4, s7, t4
                  fmv.w.x      fa6, s8
                  mulhsu       s10, t5, a4
                  xori         sp, a3, 672
                  mulh         s6, s11, t4
                  sra          a0, zero, sp
                  sltu         s7, s4, a3
                  srai         s6, sp, 15
                  auipc        sp, 308425
                  fcvt.wu.s    a4, fs5
                  sltu         s6, t4, t5
                  mulhu        a0, s1, a6
                  fmv.x.w      a6, fs7
                  fcvt.wu.s    s5, fs11, rne
                  srai         ra, s6, 30
                  andi         gp, a2, 966
                  fcvt.w.s     s4, fa0, rdn
                  xor          t6, s7, a1
                  xori         a6, s3, -1966
                  nop
                  div          a6, s11, a0
                  and          t3, s3, s7
                  remu         gp, a6, s6
                  flt.s        a5, fs9, fs6
                  ori          s2, a1, -76
                  srai         t1, s0, 0
                  mulh         t4, gp, s6
                  div          t2, s8, sp
                  fsub.s       fs2, fa1, fa3
                  fmax.s       ft8, fa1, fa1
                  slt          s0, s8, s10
                  xori         s10, a1, 1822
                  fdiv.s       fa0, fa6, fs5
                  auipc        zero, 209141
                  fdiv.s       ft8, ft0, fa4
                  fdiv.s       fs2, fs2, fa5, rup
                  mulhu        a3, a3, a3
                  div          a0, s9, ra
                  rem          a4, a1, t3
                  fsgnjn.s     fs11, ft0, fs10
                  sltu         t5, t6, a1
                  xori         s5, t1, 599
                  srli         s5, ra, 3
                  mulh         sp, s10, a0
                  and          t3, t5, a7
                  fdiv.s       ft5, fa1, fa4
                  fle.s        s6, fa4, fa2
                  sll          a0, s4, t3
                  fcvt.s.wu    ft8, s5
                  sub          s5, s1, s11
                  fsub.s       ft7, ft9, ft9
                  div          s7, zero, s3
                  nop
                  fmul.s       fs8, fs3, fa4
                  xori         s4, s5, 526
                  fmin.s       fa3, fs4, fa4
                  fsgnjn.s     fs1, fs11, fs0
                  or           a5, t2, t5
                  lui          s2, 664661
                  nop
                  add          a2, s6, s4
                  fle.s        a1, ft11, fa6
                  fmv.x.w      s11, fs8
                  flt.s        t4, fa3, fa2
                  slt          s4, s2, s10
                  andi         t3, t4, -846
                  nop
                  fdiv.s       fa5, ft5, fa7, rne
                  ori          t1, a6, 318
                  fclass.s     a1, fs4
                  srai         ra, sp, 22
                  ori          a6, s9, -1599
                  fsgnjx.s     fs5, fa0, ft7
                  srai         s6, s11, 3
                  slli         t1, gp, 1
                  divu         a0, a3, t0
                  sra          a5, s6, s10
                  sra          s11, a2, s3
                  fsub.s       ft6, fa2, fs5
                  fmin.s       ft8, fa6, fa1
                  mulhu        a7, s6, sp
                  feq.s        t0, fa7, fs4
                  slt          s3, s1, s6
                  fcvt.wu.s    s6, fs6, rmm
                  addi         tp, a4, 946
                  auipc        sp, 617581
                  addi         a5, a4, -930
                  fcvt.s.w     ft7, s3
                  fmax.s       ft6, ft6, fa6
                  fmax.s       ft0, ft2, fa1
                  fmax.s       ft6, fa1, fs0
                  feq.s        s6, ft2, fs9
                  slti         s6, a1, -508
                  flt.s        s5, fs10, ft5
                  fcvt.s.w     fs1, a5, rmm
                  fsqrt.s      fa2, ft6, rmm
                  div          t5, t3, t0
                  sub          gp, s8, s5
                  srai         a0, a3, 29
                  fclass.s     s4, ft8
                  fmul.s       ft5, ft7, fa0
                  fmul.s       ft5, fs2, fa1, rdn
                  or           s5, sp, s1
                  sltiu        a0, a5, -1262
                  fsub.s       fa1, fa2, fs0, rtz
                  feq.s        s4, fs2, fa3
                  xor          a0, zero, t2
                  fsgnjx.s     fa7, ft1, fs1
                  mulhu        a0, a3, s7
                  mulhu        s4, t2, t6
                  remu         s11, sp, s6
                  flt.s        sp, fa6, ft2
                  fdiv.s       fs0, fa4, fa6, rdn
                  fmax.s       ft11, fa6, ft1
                  fdiv.s       fa5, fs9, fs0, rne
                  or           s6, a7, s3
                  srl          s6, s7, s10
                  fdiv.s       fs7, fs3, ft0
                  sub          s10, t3, s1
                  fsgnjx.s     ft7, fs5, fs4
                  fmax.s       fs0, fa1, fa6
                  divu         a1, s1, t5
                  slti         t5, s6, 395
                  fsgnjn.s     ft3, ft3, ft11
                  fmin.s       ft3, ft8, fs6
                  div          s6, zero, t1
                  srai         a4, a5, 17
                  fcvt.s.wu    ft11, a7, rup
                  rem          s0, a5, t4
                  fmin.s       ft9, ft2, fs1
                  sltu         t2, zero, a4
                  fsub.s       fa1, fs11, ft2
                  or           s5, s8, a1
                  fmul.s       fa3, ft4, ft8, rmm
                  feq.s        a3, fs8, fs3
                  slt          a7, a7, t5
                  srli         s10, tp, 23
                  xor          s10, s3, a0
                  rem          s3, s7, s7
                  fmin.s       fa6, fs2, fs10
                  sll          a6, a3, zero
                  fadd.s       fs11, fa5, ft10, rdn
                  divu         tp, t3, a7
                  fcvt.wu.s    s11, fs11, rdn
                  addi         gp, zero, -1966
                  and          s11, s10, s9
                  fsub.s       fs11, fa6, fa4, rmm
                  sra          s2, t2, ra
                  nop
                  fadd.s       fs2, ft10, ft9, rmm
                  mulhu        s10, a0, t0
                  addi         tp, a0, -821
                  sub          t2, a5, a2
                  fmul.s       fs9, ft9, fa2
                  addi         a3, s2, -921
                  fdiv.s       fa2, ft10, fs9
                  sltiu        t2, zero, -603
                  div          a1, s4, a6
                  slt          a3, a5, s7
                  srai         s11, s6, 11
                  ori          a5, s7, -911
                  mul          s7, t6, zero
                  div          s3, s8, ra
                  sltiu        a0, ra, -891
                  fcvt.w.s     s4, ft4
                  fsqrt.s      fa7, fs2
                  andi         a5, a2, -1400
                  fsgnj.s      fs4, ft1, fs11
                  fmax.s       ft8, ft1, fs7
                  flt.s        a1, fa5, fs3
                  fmax.s       fa3, fa2, fs10
                  mulhsu       t4, s4, s1
                  and          a7, s0, t1
                  sra          s3, a5, t0
                  fsub.s       ft9, fs8, ft8
                  fmul.s       fs10, fa7, fs5, rne
                  mulhsu       t4, s2, s11
                  ori          s2, gp, 1073
                  sltiu        s7, s10, 1351
                  div          t0, s2, a2
                  feq.s        s0, ft9, fs9
                  or           s11, a2, s6
                  fcvt.s.wu    fs3, a0
                  fsgnjx.s     fa0, fs0, ft4
                  andi         s5, s8, -1844
                  fsqrt.s      ft1, fs5
                  nop
                  sub          s2, s3, s10
                  remu         a7, a6, a2
                  fsgnjn.s     fa0, fa7, fa5
                  fsub.s       fa4, fa7, ft0, rmm
                  fmv.w.x      ft1, gp
                  fsgnjx.s     fa5, fs3, ft8
                  fdiv.s       ft0, ft3, ft3
                  xori         s7, s4, -1056
                  srl          a3, t1, s4
                  sra          t2, a7, a2
                  fmv.x.w      a1, fs1
                  fsgnjx.s     ft0, fs10, ft2
                  rem          s0, t1, s7
                  fclass.s     a1, fa0
                  fle.s        s7, ft4, fs10
                  nop
                  rem          a6, a4, t1
                  divu         t2, t1, s2
                  xor          s11, t5, s8
                  flt.s        t2, fs2, fs11
                  sll          t3, s11, t6
                  mulh         t0, t3, s9
                  fmin.s       ft1, fs1, fs2
                  xori         gp, t5, -1766
                  and          s3, a4, a1
                  fmv.x.w      s4, fa3
                  fmv.w.x      fa2, s5
                  sltu         a5, a0, s1
                  div          gp, s9, t0
                  rem          a7, t6, t3
                  xor          t6, t3, zero
                  fadd.s       ft11, fa4, fs7
                  fmul.s       ft6, ft2, fs10
                  sub          gp, t2, s11
                  fmul.s       fs5, fs5, fs3, rtz
                  ori          t1, s0, -766
                  fcvt.s.wu    ft5, s0, rtz
                  srli         a5, t6, 24
                  mulhu        t3, s5, s4
                  fcvt.s.wu    fs7, s1
                  fmax.s       ft11, ft0, fa6
                  add          t1, t6, s10
                  mulhsu       s0, t4, tp
                  ori          a2, a0, 1337
                  fmv.w.x      ft3, a7
                  mulhu        a4, zero, s1
                  fmax.s       fs1, fa6, fs3
                  or           t2, a1, a2
                  slt          t6, s8, ra
                  fadd.s       ft6, fs3, ft5, rtz
                  addi         s4, sp, 1937
                  fsgnjx.s     ft8, ft3, ft4
                  fsgnjx.s     fa3, ft2, ft2
                  sub          a2, s7, t6
                  fle.s        zero, fs11, ft5
                  fdiv.s       fs6, fa1, ft3, rup
                  sra          a4, s6, tp
                  remu         sp, t0, s0
                  slli         t4, s1, 26
                  fclass.s     s10, fa0
                  mulhu        s5, a4, s3
                  fle.s        gp, fa2, ft11
                  srli         s6, ra, 14
                  rem          t6, s4, s0
                  slti         a2, s2, -1165
                  fclass.s     a7, ft7
                  sll          a6, a6, t3
                  mulh         s10, s7, s11
                  sll          t2, s11, s8
                  srl          s11, t6, tp
                  fadd.s       fs7, ft2, fa3
                  addi         t2, a5, 514
                  sll          t0, t4, sp
                  fmin.s       ft3, ft0, fa1
                  fsqrt.s      fs5, fa4, rup
                  slti         s4, a4, -1376
                  srli         s4, s4, 16
                  fcvt.s.wu    ft5, a5, rdn
                  xori         gp, t0, 1874
                  ori          a0, s2, 402
                  div          sp, t0, t1
                  divu         sp, a5, s3
                  sub          a3, s2, ra
                  add          s10, ra, s0
                  sra          t3, s10, gp
                  fcvt.s.w     ft0, s10
                  or           t4, t5, s11
                  fle.s        a6, ft9, ft0
                  add          s5, a4, t3
                  addi         s4, gp, -400
                  xori         t4, s7, -1679
                  addi         s6, ra, -1825
                  fadd.s       fs6, ft0, fs5, rdn
                  xor          a6, s2, t3
                  div          t3, t6, ra
                  fmv.x.w      a6, ft7
                  fsgnj.s      ft0, ft2, fs2
                  fmax.s       fs11, fs7, fs11
                  or           a2, s10, a1
                  sub          t5, t1, t4
                  fsqrt.s      fs8, ft3, rtz
                  xori         s0, t4, 1108
                  fsgnjn.s     ft5, fs5, fs1
                  and          s7, s6, sp
                  sra          s5, s7, a0
                  fmv.w.x      fs10, a7
                  xor          ra, s10, t5
                  fmv.x.w      s3, ft5
                  and          t4, s2, s5
                  divu         s3, s4, s9
                  mulhsu       t2, ra, t1
                  fmv.w.x      ft8, a2
                  slti         a2, s1, -746
                  fcvt.s.w     fs4, s4
                  sltiu        s6, sp, 720
                  and          gp, t2, a1
                  flt.s        s4, ft4, ft11
                  fsgnjn.s     fa0, ft3, fa2
                  add          a5, t5, t1
                  auipc        a2, 580766
                  sltiu        a1, a2, -922
                  sra          a3, s7, t6
                  fsgnjx.s     fa1, fa0, fs3
                  andi         sp, s5, -716
                  mul          ra, t1, t4
                  nop
                  slli         s3, a5, 9
                  sll          a1, s1, s6
                  feq.s        ra, fs8, fs8
                  mul          a6, s11, s5
                  and          s7, s7, a6
                  slli         a4, s11, 9
                  ori          t6, s8, 1874
                  fmv.x.w      s5, ft0
                  fsgnjx.s     ft11, fa1, fs5
                  fmv.w.x      ft2, s11
                  mulh         t3, t5, a3
                  srli         t6, a5, 2
                  slli         t5, s0, 14
                  xor          s0, s7, ra
                  remu         t0, a4, gp
                  fmul.s       fs7, fs2, fs9
                  divu         a2, s2, s2
                  div          a3, t5, t3
                  div          a7, s3, s11
                  fsub.s       fs4, ft10, ft7, rup
                  div          a0, s3, s9
                  fmax.s       fs7, ft2, fa4
                  div          a1, a5, a5
                  lui          t4, 826734
                  srai         t2, a3, 13
                  fmul.s       ft6, ft4, fa3, rup
                  srai         s4, a5, 18
                  xori         t4, s8, 156
                  fcvt.w.s     zero, fa2, rmm
                  fsgnjn.s     fa6, ft0, fs7
                  xor          s5, t5, a4
                  xor          a3, s7, a3
                  fcvt.wu.s    tp, ft7, rdn
                  div          s2, s2, t0
                  fmin.s       fa0, fs4, fa3
                  fcvt.wu.s    s10, ft3, rup
                  mulh         gp, s5, s0
                  fcvt.s.w     fs2, a3
                  fmax.s       ft2, fa5, fa1
                  fadd.s       fs4, fa3, fs5, rtz
                  fsgnjn.s     fs9, ft10, fa2
                  mul          gp, s8, a2
                  lui          s4, 652299
                  remu         s10, s10, s11
                  sltiu        s7, s8, -545
                  fclass.s     s6, fs6
                  fcvt.s.wu    fa4, s6, rup
                  xor          gp, a0, s8
                  fadd.s       fs5, fs9, ft5
                  sll          s0, a0, sp
                  slli         zero, a0, 11
                  lui          s11, 376767
                  fle.s        s11, fs5, fa3
                  sra          s11, s3, a4
                  fcvt.s.w     fs1, tp, rmm
                  fle.s        s11, fa4, fs8
                  fdiv.s       fa4, fa5, fa4
                  rem          s2, s0, t6
                  slli         a1, t4, 1
                  sll          gp, s9, s10
                  mulh         s0, s2, a6
                  sltiu        t4, s0, -1621
                  fcvt.wu.s    s4, fa7
                  fsgnjx.s     fs0, fs4, fs6
                  fmax.s       fa2, fa2, fs3
                  fsub.s       fs2, fa6, fa5, rtz
                  xori         a5, s8, 224
                  mul          s4, s4, s4
                  xori         s5, a7, -1455
                  mulhsu       a6, s1, s9
                  fle.s        t1, fs7, ft6
                  add          t0, a5, s4
                  ori          gp, s10, -296
                  divu         a2, a4, t3
                  lui          a2, 244595
                  fmul.s       fs2, ft4, fa3
                  slti         t0, t3, 658
                  slli         s11, gp, 4
                  fsgnj.s      fs8, ft8, ft8
                  mulhu        zero, a5, s5
                  div          s10, ra, s5
                  fle.s        s3, ft5, ft1
                  fsub.s       fs10, fa6, fs5, rup
                  srli         t5, s6, 25
                  mulh         a2, sp, a5
                  fsgnjn.s     fa4, ft10, fs6
                  mulhu        a1, t0, gp
                  fcvt.w.s     t5, ft5, rup
                  addi         t5, s1, -1077
                  slt          s7, s3, s11
                  fsgnjn.s     ft11, ft10, fa0
                  rem          s6, a1, s10
                  srl          t2, a5, s8
                  fsgnj.s      fa0, fa6, fs11
                  fmv.x.w      a6, fa6
                  fcvt.w.s     a6, fs0, rup
                  xori         s0, s7, 1745
                  divu         a3, tp, s10
                  fsub.s       ft5, ft3, ft6, rup
                  fcvt.s.wu    fs10, t6
                  addi         t3, a2, -721
                  sltu         t1, gp, t1
                  fmin.s       fa7, fs2, ft5
                  flt.s        a5, ft6, fs4
                  srli         s6, sp, 30
                  andi         t4, a4, -1860
                  add          s10, s9, s10
                  fmul.s       fs5, fa3, ft8
                  fcvt.s.wu    fs6, s5, rtz
                  xor          zero, t4, t0
                  andi         t4, sp, -1760
                  feq.s        a2, fa4, ft10
                  sll          t2, a7, s1
                  fadd.s       fa7, fs8, ft8
                  xori         a6, sp, 369
                  auipc        s10, 421234
                  fcvt.s.wu    fs11, s11
                  fle.s        a7, fa3, fs8
                  fmv.x.w      a2, fa3
                  fcvt.wu.s    t6, ft9, rtz
                  fsgnj.s      fa7, ft11, fa1
                  srli         a0, a3, 21
                  fsub.s       ft7, fa7, fa5
                  fcvt.w.s     s4, fa4
                  fclass.s     a1, ft9
                  fsgnjx.s     fs9, ft3, ft5
                  xori         s0, s7, -825
                  xor          t2, t1, s8
                  fsgnj.s      fa3, fs9, fs6
                  feq.s        tp, fs5, fs6
                  fsub.s       fa0, fa2, ft3, rup
                  fsqrt.s      fa6, ft11, rtz
                  xor          t6, t2, s1
                  mul          zero, t5, a3
                  div          a1, tp, gp
                  sra          s11, sp, s9
                  srli         s10, tp, 25
                  fmin.s       fs4, ft10, fa2
                  sub          sp, s11, ra
                  divu         t2, a7, s9
                  flt.s        gp, fs8, fs1
                  div          s10, s3, zero
                  sltu         s11, s10, s11
                  srli         a4, s5, 22
                  fle.s        s4, fs7, fs7
                  mulh         a1, s2, t2
                  fmax.s       fa2, fa6, fa3
                  mul          t1, a0, s9
                  fcvt.s.wu    fs2, t1
                  auipc        s10, 494171
                  srli         s10, ra, 20
                  sltu         t4, gp, gp
                  remu         t6, a1, t5
                  fsgnjx.s     fs3, ft6, fs1
                  slt          zero, zero, t4
                  fsgnj.s      ft7, fs6, ft5
                  and          s2, s4, s5
                  auipc        s6, 875441
                  mulhu        a1, zero, a1
                  addi         sp, zero, 988
                  fclass.s     a6, ft3
                  fadd.s       ft5, ft2, ft4, rdn
                  xor          a4, s1, a1
                  ori          a1, a4, 1086
                  mulhsu       t1, t6, t3
                  auipc        a3, 935502
                  slti         ra, s2, 927
                  sll          s6, s0, tp
                  feq.s        a4, fa4, fa0
                  fsgnjx.s     fs0, ft4, fa4
                  auipc        t2, 797117
                  fcvt.wu.s    t0, ft4, rmm
                  divu         a1, a1, s5
                  fmv.w.x      fs4, a4
                  feq.s        gp, ft1, ft8
                  slli         a3, s7, 11
                  fcvt.s.w     fs10, t5, rmm
                  slli         a4, s8, 5
                  fsgnj.s      ft9, ft7, fs7
                  rem          a5, zero, s1
                  flt.s        s3, fs5, fa1
                  slli         s7, a7, 17
                  fsub.s       fa0, fs6, fs10, rup
                  mulhu        sp, s11, s4
                  remu         a0, s11, zero
                  xor          t4, s1, a7
                  remu         sp, s5, s6
                  fsgnj.s      ft4, fa1, fa0
                  slt          s11, a1, s4
                  andi         tp, s5, -394
                  fcvt.wu.s    s6, ft0, rup
                  fmin.s       ft4, ft2, ft4
                  sltu         tp, a1, s6
                  andi         a1, a7, 1748
                  fsub.s       fa1, fa5, ft2, rmm
                  sltu         s11, a5, a2
                  fsqrt.s      fs11, fs11, rne
                  fcvt.s.wu    fa1, sp
                  fmv.w.x      fs7, a0
                  srai         a1, a4, 28
                  fcvt.wu.s    t1, fa7, rdn
                  xori         gp, tp, -1637
                  sra          s3, ra, a5
                  xor          t0, s9, s1
                  fmul.s       ft0, fs5, ft2, rtz
                  or           a4, a7, t3
                  flt.s        s5, fa1, fs5
                  and          t6, s11, t6
                  fmv.x.w      t5, ft3
                  lui          s6, 745909
                  fmv.x.w      a4, fa0
                  fdiv.s       fa7, ft0, ft7
                  andi         s7, t5, 1302
                  auipc        a6, 401988
                  sltiu        a7, a4, 1151
                  feq.s        t1, fs0, fa6
                  sltiu        s4, tp, -1712
                  srai         s6, t3, 20
                  auipc        zero, 667457
                  andi         t0, s11, 476
                  fle.s        zero, fs2, fa6
                  mul          t4, s10, t3
                  add          gp, t3, t4
                  srai         s2, tp, 1
                  slt          s3, a3, ra
                  flt.s        a7, ft10, ft9
                  fmax.s       ft3, fs11, fs8
                  fmul.s       fs9, ft6, fs2, rtz
                  srl          ra, t1, s6
                  fmv.x.w      a7, ft10
                  sll          t4, t4, zero
                  fmv.w.x      fs11, tp
                  sra          a3, t4, s5
                  lui          t4, 288861
                  fmv.x.w      s3, ft0
                  fsgnjn.s     fa7, fs8, fs4
                  fcvt.s.wu    fs5, ra, rmm
                  mulhsu       a6, a1, a3
                  div          t5, s0, s8
                  nop
                  add          t2, zero, s1
                  fsqrt.s      fs8, fs9
                  fsgnj.s      fs6, fa7, fs8
                  fle.s        s7, ft2, fs9
                  slt          s7, s0, t0
                  sra          a2, s2, t5
                  fmv.w.x      ft9, s0
                  sub          a1, t0, a4
                  mulhsu       s0, s3, a6
                  fclass.s     a1, ft6
                  srl          t3, a0, t4
                  sltu         a0, a5, a4
                  sll          t0, tp, t1
                  xori         t3, a4, -851
                  fmin.s       fs5, ft5, fs11
                  fadd.s       ft4, fa3, ft10, rup
                  flt.s        a2, fs7, fs4
                  fmul.s       ft5, ft8, fs7
                  slt          s4, a3, s10
                  srli         zero, s5, 26
                  add          a6, s11, s7
                  remu         t4, ra, s9
                  or           t4, a0, a5
                  mulhu        a3, t1, s7
                  fsgnj.s      fa3, fs10, fa1
                  sub          ra, a7, a4
                  fcvt.s.wu    fa6, t2, rne
                  srli         t0, zero, 6
                  andi         a0, t4, -1496
                  sll          a0, s0, s9
                  fcvt.s.wu    ft0, s10
                  fsqrt.s      fa5, fa7, rne
                  add          s11, sp, a1
                  sra          s3, t3, gp
                  mulhsu       t1, s4, ra
                  srl          t1, a3, ra
                  sub          a5, s4, s11
                  feq.s        t4, ft4, fs4
                  fdiv.s       fs4, ft7, fs5
                  xor          zero, s6, a7
                  fdiv.s       ft3, fs8, ft0
                  addi         s7, s7, 1829
                  fsub.s       ft8, ft9, fa0
                  sub          t0, s6, s11
                  fsqrt.s      fa6, ft3
                  fdiv.s       fs10, ft6, ft10, rmm
                  fmax.s       ft10, fs2, fs8
                  flt.s        a1, fa0, fa4
                  fclass.s     t1, fs8
                  andi         gp, a0, 1286
                  fmin.s       fs4, ft8, ft11
                  remu         zero, s6, s1
                  srai         tp, ra, 17
                  remu         s6, a4, t5
                  nop
                  rem          s3, a5, s11
                  sltiu        a6, s0, -1358
                  fcvt.wu.s    t4, ft3
                  div          a7, t2, a6
                  fmv.x.w      t4, ft11
                  srli         t6, a6, 22
                  fdiv.s       fa3, fa1, ft4, rup
                  feq.s        s7, fs4, ft8
                  srl          s10, s1, s1
                  fcvt.wu.s    t4, fa5, rmm
                  fsgnjn.s     ft4, fa5, fa7
                  fsgnjx.s     ft4, ft1, fs1
                  xori         zero, a3, -606
                  or           t2, s11, zero
                  auipc        t2, 402721
                  fdiv.s       fs5, ft11, fa3
                  fdiv.s       ft7, ft0, fa0
                  fcvt.w.s     s11, fs10, rne
                  sltu         a3, s9, a1
                  fcvt.s.w     ft5, a5
                  fmin.s       fs2, fs3, ft8
                  ori          s4, a2, 1348
                  mul          ra, a6, a6
                  srl          ra, s8, a0
                  fsgnjn.s     ft1, fs2, fs10
                  fmv.x.w      zero, fa4
                  div          s3, s2, zero
                  sra          gp, s6, sp
                  fadd.s       ft0, ft4, ft0
                  fsgnj.s      fs1, ft6, fa4
                  fmv.w.x      fa3, s7
                  rem          s6, s7, s7
                  div          a2, t6, s8
                  srli         tp, s5, 20
                  fle.s        t4, fa7, ft5
                  addi         a3, s1, -9
                  div          s11, s4, s8
                  remu         ra, s6, s8
                  sltiu        a6, s6, -1252
                  fcvt.wu.s    sp, fa4, rmm
                  fsgnjx.s     ft0, fa0, ft1
                  lui          sp, 77742
                  rem          s7, s5, s11
                  div          s2, t2, a6
                  fmul.s       ft10, fs11, ft8, rdn
                  addi         t3, s5, -1849
                  fsgnjn.s     fs9, ft7, ft5
                  srai         a3, s3, 10
                  fmin.s       fs10, fa3, ft5
                  sra          a6, s11, s5
                  fmul.s       fs1, fa4, fs2
                  fcvt.s.w     fs8, gp
                  nop
                  fle.s        a6, fs2, ft8
                  addi         s0, s0, 1805
                  xori         t2, tp, -217
                  fadd.s       ft9, ft7, ft2, rne
                  div          t4, s1, sp
                  add          t0, a4, s9
                  fmax.s       fs9, fs2, ft11
                  nop
                  fsub.s       fa1, fs11, ft8
                  sra          tp, s7, s0
                  fmv.x.w      t4, fs6
                  fsub.s       ft8, ft10, ft11
                  slt          s5, s2, s7
                  fclass.s     s2, fs0
                  srl          zero, s1, s2
                  srl          gp, zero, s3
                  divu         t6, ra, s2
                  fcvt.s.wu    ft2, a6, rmm
                  auipc        t1, 211392
                  fcvt.wu.s    s7, fa6
                  fsqrt.s      fa4, ft8, rdn
                  sltiu        s0, t2, -324
                  remu         s6, tp, t4
                  slt          t1, s3, a5
                  div          a4, t4, s10
                  fsgnjx.s     ft11, fs2, fs10
                  fmv.w.x      ft11, t3
                  srl          t6, s4, s6
                  fsgnj.s      fs3, fs1, fs4
                  mulh         t1, a6, t1
                  xor          s10, t5, s7
                  fmax.s       fs8, fa1, ft11
                  fsgnjn.s     ft9, fs8, fa0
                  mulhsu       t2, a1, s11
                  fsqrt.s      ft9, fs10
                  nop
                  xor          a5, t0, ra
                  sltu         s4, s11, s11
                  fsqrt.s      ft7, fa4
                  and          s7, t3, ra
                  ori          a5, s4, -512
                  lui          tp, 907467
                  mulhu        s4, a1, ra
                  fclass.s     s2, fs6
                  fcvt.s.w     ft1, gp
                  fmv.w.x      ft8, s2
                  addi         a3, s11, 1351
                  mulhu        t0, sp, t4
                  fmax.s       fa5, ft3, ft2
                  xori         sp, t3, 657
                  srai         s7, a2, 13
                  ori          s11, s5, 1891
                  andi         s11, sp, 965
                  fle.s        tp, ft2, ft2
                  lui          a0, 548022
                  div          t2, tp, s1
                  fdiv.s       fa6, fs9, ft10
                  fcvt.wu.s    s10, fs11, rup
                  fsqrt.s      ft10, fa1, rup
                  remu         tp, t0, a0
                  slt          a0, a1, s9
                  slli         s4, a3, 16
                  addi         tp, a4, -1448
                  sltiu        a6, s1, -1713
                  sra          a4, s6, s10
                  mulhsu       s4, s7, s10
                  mulh         t5, t4, a6
                  fcvt.wu.s    s7, fa6
                  fmax.s       ft7, fa6, ft0
                  fmv.x.w      a7, ft8
                  addi         t3, a0, 591
                  fsub.s       ft9, ft11, ft11
                  slti         s5, a5, -1977
                  sub          a7, t3, s10
                  fsub.s       fs9, fa4, ft7, rup
                  fsgnjx.s     ft6, fs0, fs6
                  srai         zero, t4, 18
                  fcvt.s.w     fs0, s6
                  fcvt.wu.s    t2, fa3, rne
                  fmul.s       fs10, fa0, fa1, rmm
                  mulhsu       s4, t0, s11
                  sub          gp, gp, a5
                  andi         zero, s5, 758
                  nop
                  fsgnjn.s     fs1, ft9, fa0
                  flt.s        s10, ft2, ft0
                  sltu         tp, s2, ra
                  fmin.s       ft2, ft10, ft0
                  mulhu        zero, s5, s4
                  srl          a0, s2, a7
                  fcvt.s.wu    ft9, a0
                  mul          t3, s6, t0
                  fmv.w.x      ft5, a5
                  mulh         a6, a5, t2
                  feq.s        a3, fa0, fs2
                  fdiv.s       fa0, fs4, fa7, rne
                  flt.s        t3, fs4, ft5
                  fmax.s       ft7, fs9, fa6
                  lui          t2, 592468
                  sll          s2, a1, a2
                  mulhsu       s0, a3, ra
                  mulh         t1, sp, a5
                  lui          t1, 227595
                  fmax.s       fa2, fs9, fa7
                  fcvt.s.wu    fs7, a5
                  fsgnjx.s     fa1, ft4, fs3
                  auipc        t2, 105220
                  fsgnj.s      fa4, fa6, fa6
                  sltu         t6, a4, a4
                  addi         s7, s9, -1565
                  fmv.w.x      fa7, ra
                  fmax.s       fs8, ft3, fs0
                  and          ra, s0, tp
                  fle.s        ra, fa7, fa0
                  srl          tp, ra, ra
                  fcvt.s.w     fa2, s9, rup
                  sub          s10, t0, s9
                  fcvt.s.w     fs1, s4
                  rem          zero, a7, s5
                  xori         t2, t0, 940
                  add          s5, t1, s8
                  fle.s        s2, fa7, ft2
                  fcvt.wu.s    t5, fs7, rtz
                  fmul.s       ft9, fa7, ft0, rup
                  auipc        a6, 679430
                  fcvt.wu.s    s2, fa6
                  mulhu        a4, a5, s2
                  fmul.s       fa2, ft7, ft11, rmm
                  addi         t2, s4, -1482
                  fsub.s       fs6, ft4, fs6, rne
                  sltiu        s3, t2, 143
                  fadd.s       fa5, fa3, fs5
                  slt          tp, s4, t2
                  srli         gp, a7, 0
                  mul          s6, a1, s7
                  fle.s        s6, fs3, ft2
                  fsub.s       fs5, fs0, fa1, rdn
                  rem          t1, s0, s0
                  fcvt.s.w     fa1, tp, rup
                  slti         s3, s5, -1296
                  flt.s        s2, ft6, ft6
                  div          s10, a1, s3
                  fmax.s       ft1, fa0, fs0
                  xori         s7, s3, 783
                  or           s11, s0, a7
                  auipc        s7, 941017
                  fcvt.wu.s    s0, fs9
                  fsqrt.s      fa6, fa3, rmm
                  fcvt.s.wu    fs11, ra, rdn
                  mulh         a0, s1, t4
                  fsqrt.s      fs6, fa1
                  fmin.s       fa0, fs4, ft4
                  addi         gp, t2, -1956
                  slti         t3, t1, 1610
                  srl          s4, s1, t4
                  fsgnj.s      fs9, fs4, ft4
                  flt.s        a3, fa7, ft2
                  fadd.s       fa5, ft2, fs9, rup
                  add          tp, s5, s6
                  mulh         t1, tp, a2
                  xor          ra, s8, tp
                  fclass.s     s2, fa4
                  fsub.s       fa2, fs11, ft5, rmm
                  fmax.s       ft2, fs8, ft8
                  sltiu        s10, s9, 185
                  auipc        a3, 1022526
                  andi         ra, s4, -291
                  fmv.x.w      s6, ft7
                  rem          t6, t1, a1
                  fmax.s       ft1, fs4, fs10
                  fmin.s       fa6, ft3, fs6
                  fclass.s     gp, ft1
                  mulh         t0, s0, t0
                  fmin.s       ft2, fa6, fs0
                  srai         t4, sp, 4
                  fmax.s       ft0, fs11, ft7
                  add          s6, zero, s5
                  srai         a7, sp, 24
                  xori         t2, sp, 1504
                  sltiu        a2, a5, 1400
                  xor          t0, zero, s11
                  and          gp, t6, zero
                  slti         t5, a7, 242
                  fmv.w.x      ft5, s2
                  or           t4, s9, a1
                  fcvt.s.wu    fs5, s2
                  sltiu        s11, s11, -1829
                  fmv.x.w      a4, fs6
                  fsgnj.s      fs3, fs1, fa1
                  fadd.s       fs3, ft7, fs10
                  or           t3, s5, t1
                  fmax.s       fs8, ft9, fa5
                  andi         ra, t4, -1136
                  feq.s        s2, ft2, fs3
                  fle.s        a2, fs1, ft9
                  fsub.s       ft6, fs2, fa2, rup
                  mulh         t0, s2, a4
                  fadd.s       fa6, fa3, fs0
                  feq.s        t0, fs6, ft5
                  fclass.s     a6, fs0
                  slli         s6, a1, 25
                  xori         s4, t2, -1263
                  fdiv.s       fa6, fs4, fs2
                  fmv.x.w      gp, ft0
                  sra          s7, s9, t4
                  mulhu        a2, t3, gp
                  sub          s11, t0, s6
                  fle.s        s0, fa4, fs0
                  ori          a6, s4, -160
                  fcvt.wu.s    a6, fs11
                  slti         s10, a4, -950
                  fmax.s       fs8, fs8, fs2
                  fclass.s     s7, fs10
                  fclass.s     a7, ft5
                  andi         t6, s9, -1126
                  fsub.s       ft3, ft6, ft9, rtz
                  lui          a3, 133701
                  fmv.x.w      s4, fa5
                  remu         t3, t3, a3
                  andi         s10, s10, 599
                  fclass.s     ra, fa3
                  xori         t6, a1, -1859
                  srli         gp, s5, 7
                  mulhu        s11, s1, t2
                  srai         s2, zero, 3
                  fmin.s       ft6, fa6, fs11
                  fsgnjx.s     ft9, ft7, ft2
                  fmv.w.x      fs5, s11
                  andi         gp, t2, 985
                  remu         s7, a2, t4
                  fsub.s       fs8, ft8, fa7
                  xor          a2, t5, s6
                  sra          a5, s6, s11
                  srl          s11, gp, a7
                  sltu         ra, s9, t0
                  fcvt.s.w     fa0, a3, rmm
                  sll          s0, a2, sp
                  slti         ra, s0, -1900
                  div          s11, a0, s1
                  fmv.x.w      s2, fs6
                  srli         a5, a5, 2
                  fclass.s     s7, fa7
                  srli         s0, s3, 17
                  fmul.s       fs7, ft7, ft0
                  srl          s10, s4, a2
                  fclass.s     gp, ft1
                  sra          zero, ra, s9
                  remu         a1, zero, a6
                  add          t4, a5, a6
                  fmul.s       fa3, fa4, fa1
                  or           s0, s0, s1
                  fmax.s       fs4, fa0, fs3
                  fcvt.w.s     a0, ft5
                  mulh         a4, t2, t6
                  nop
                  fsub.s       ft5, fs6, fs9
                  addi         s0, s6, -1591
                  ori          a0, a5, -902
                  and          s7, s2, s5
                  fcvt.s.wu    fa4, a0
                  slli         t3, s2, 21
                  mulhu        t2, a5, a2
                  fcvt.s.w     ft3, t5, rne
                  fadd.s       fs3, fs5, fs7
                  nop
                  fcvt.w.s     a0, fa5
                  addi         a1, t2, -1044
                  addi         t5, s9, -1276
                  fmax.s       ft6, fs2, fa6
                  and          t4, s1, s4
                  fsqrt.s      fs0, fa0
                  divu         t6, s9, s1
                  and          s10, a2, zero
                  add          s4, s5, s1
                  fmin.s       fs7, fs9, fa2
                  fsqrt.s      fs10, fa7
                  fsub.s       ft4, fs7, fs10
                  remu         a6, sp, ra
                  flt.s        t5, fs11, ft10
                  andi         t0, a4, -1839
                  fclass.s     a7, ft10
                  and          s4, s5, s7
                  lui          s11, 347289
                  fdiv.s       fs11, fs0, fs2
                  fdiv.s       fs11, fs3, fs10
                  andi         t1, t6, -1475
                  fclass.s     s5, fa7
                  slt          s10, s5, sp
                  fsgnjx.s     ft5, ft9, fs0
                  divu         ra, s5, a7
                  sll          a1, s9, a6
                  fcvt.wu.s    s4, fs6
                  divu         t3, s8, a2
                  fcvt.s.wu    ft2, t2, rdn
                  fmax.s       fs11, fs1, fa1
                  and          zero, s8, a7
                  fsgnj.s      fs0, ft9, fa3
                  fadd.s       fs0, fa4, ft9
                  rem          gp, s10, s8
                  fdiv.s       ft6, fa5, fa5, rtz
                  slli         a0, s6, 20
                  fcvt.s.w     ft7, t1
                  fsub.s       fa7, fs7, fa4, rne
                  fcvt.s.wu    fa7, s0
                  fmin.s       fs5, ft1, fs1
                  or           sp, a4, t2
                  fdiv.s       fs3, ft2, fs11, rup
                  mulhu        s11, t3, s9
                  fcvt.s.w     ft6, s11
                  fclass.s     s7, fs6
                  srl          t2, tp, t3
                  fsub.s       ft8, ft4, fs8, rdn
                  mul          t3, s5, s3
                  fsub.s       fa3, ft10, ft8
                  xor          gp, a5, a4
                  mulhsu       t0, s10, s6
                  fmin.s       fa1, fs8, fs6
                  fsqrt.s      fs4, fs11
                  fmv.x.w      t5, ft10
                  fmin.s       ft7, fs8, ft4
                  sll          s0, s1, s1
                  fmv.x.w      s6, fs5
                  fclass.s     a5, ft10
                  divu         s3, gp, a2
                  fcvt.s.w     ft7, zero
                  fmax.s       fs10, fs6, fs4
                  fcvt.wu.s    t1, ft10, rmm
                  flt.s        t1, fa6, ft4
                  rem          s3, t2, tp
                  feq.s        s11, fa4, fs7
                  fcvt.s.wu    fa3, zero, rne
                  nop
                  fclass.s     gp, fs5
                  fcvt.wu.s    t2, fs9
                  flt.s        a3, ft5, fa0
                  sltu         s3, a6, t1
                  and          sp, a1, s10
                  mulhsu       a7, zero, s1
                  fdiv.s       ft0, fa0, fs1, rup
                  xori         a3, t6, -934
                  fcvt.wu.s    a0, ft9
                  srai         t4, tp, 27
                  fclass.s     s11, ft8
                  mul          t0, s9, a4
                  fmin.s       fs10, fs4, ft7
                  divu         s3, s1, a6
                  slti         t6, ra, 1178
                  div          tp, s9, s2
                  sra          s5, a4, a0
                  and          s4, gp, s9
                  sll          a7, t6, a1
                  rem          s5, a2, s3
                  sltiu        a0, ra, -1489
                  sub          a5, tp, t5
                  and          tp, s8, a6
                  fmv.w.x      ft7, a5
                  sll          a5, gp, s2
                  fsgnj.s      ft0, fa5, fa7
                  sra          s10, t2, s5
                  slti         a3, a2, -126
                  slt          a0, zero, s9
                  fmv.x.w      s11, ft5
                  xori         a0, t0, -1438
                  sltiu        zero, s1, -820
                  fmul.s       fs0, ft9, ft1, rmm
                  fsgnjx.s     fs0, fa7, ft1
                  mulhsu       t5, t0, a7
                  srl          sp, t4, gp
                  div          t4, a0, t1
                  or           zero, s11, s1
                  add          sp, a4, a5
                  addi         a1, a5, -630
                  sltu         s6, t1, s11
                  mulhsu       a7, a4, zero
                  xori         a6, s6, 290
                  fmv.x.w      s10, fa6
                  mul          gp, t5, s3
                  fcvt.w.s     s7, ft1
                  andi         s3, s0, -84
                  fsqrt.s      ft5, fs10, rup
                  divu         t4, sp, a2
                  srli         s3, a0, 29
                  mul          s3, s3, t4
                  fsgnjn.s     fa2, ft7, fs7
                  addi         a7, sp, 755
                  mulhsu       a3, t2, s10
                  fsgnjx.s     fa2, fs3, ft2
                  fcvt.wu.s    a0, fs7, rmm
                  fsqrt.s      ft2, ft7
                  fcvt.s.w     fa1, s11
                  slt          ra, t6, s0
                  fsgnjn.s     ft8, fs8, fs9
                  andi         t5, s2, -1627
                  slli         a2, s10, 25
                  sll          sp, t0, a2
                  mulhsu       s2, s4, s6
                  fcvt.s.w     fa5, t2, rtz
                  remu         a2, t2, t5
                  fsub.s       fs9, ft4, ft5, rup
                  div          a0, a4, a1
                  fcvt.wu.s    s6, fs5, rup
                  fcvt.w.s     a2, ft9
                  mulh         zero, a0, s7
                  srl          t4, s3, a5
                  fsgnj.s      fs10, fs10, fs0
                  nop
                  fmul.s       fs2, ft8, fa2, rup
                  srl          a7, ra, t5
                  mulh         t5, t6, gp
                  srli         gp, tp, 6
                  fsgnjn.s     fa2, fa1, fa0
                  fsgnjn.s     ft10, fs9, ft7
                  fadd.s       fa6, ft7, fs7
                  xor          s4, t4, sp
                  ori          t2, t4, 1265
                  slti         a7, s0, -1640
                  feq.s        t1, ft1, ft0
                  fsgnjn.s     fa2, fs5, fs7
                  fsgnj.s      fs3, fs0, ft3
                  lui          a0, 873193
                  rem          a3, a4, s6
                  ori          a5, s0, 1902
                  sub          t1, a0, s5
                  slli         a4, sp, 8
                  fcvt.wu.s    s6, fa4
                  fadd.s       ft7, ft5, ft5
                  mulh         s7, a3, s7
                  andi         t5, tp, -255
                  fle.s        s10, ft9, ft11
                  fcvt.wu.s    zero, ft6
                  andi         ra, t5, 801
                  fclass.s     t2, fa4
                  fcvt.s.wu    fs6, t0
                  feq.s        a6, ft9, fs1
                  auipc        gp, 684810
                  slli         a4, t5, 27
                  addi         a1, t6, -1459
                  mulh         s6, a4, gp
                  fcvt.s.wu    ft10, s10
                  ori          a1, t1, 850
                  mulhsu       s7, s0, a6
                  mulhsu       a4, a7, sp
                  fsqrt.s      fs10, ft11
                  addi         ra, s11, -1994
                  slt          t2, gp, a6
                  sra          a7, sp, s8
                  fsqrt.s      ft0, fs11, rdn
                  fsgnjx.s     fs4, fs0, ft8
                  fdiv.s       ft0, ft8, ft0, rdn
                  fcvt.s.w     fa1, s11, rdn
                  mulh         a7, a5, t5
                  lui          zero, 452175
                  fsgnjx.s     ft10, ft11, ft2
                  fcvt.s.wu    fs3, a4
                  rem          a1, s6, gp
                  flt.s        s6, fs6, fs11
                  add          a4, sp, s10
                  addi         s2, s11, 334
                  srli         a5, ra, 5
                  fclass.s     sp, fa5
                  fcvt.s.wu    ft10, ra
                  fcvt.s.wu    ft6, a6, rmm
                  ori          t1, sp, 1684
                  fmin.s       ft11, ft2, fs5
                  fcvt.w.s     s0, fa2, rne
                  andi         a3, tp, 1649
                  fsgnj.s      fs0, fa4, ft0
                  rem          s11, s3, s0
                  flt.s        a3, fs4, fs2
                  fdiv.s       ft1, ft8, ft0
                  div          s4, t0, zero
                  slti         a1, sp, 598
                  div          a2, a5, t4
                  xori         t1, a7, 318
                  fmv.x.w      zero, ft4
                  fmin.s       ft6, ft3, ft6
                  ori          a7, a4, 269
                  or           sp, t5, a5
                  ori          a1, sp, -1097
                  nop
                  addi         t2, s5, -629
                  lui          a5, 371292
                  div          a5, t4, s10
                  fsgnj.s      fs8, fs1, fa3
                  slt          zero, a0, s2
                  xori         gp, a1, -123
                  fdiv.s       ft6, ft5, fa3
                  srai         a5, s2, 27
                  fmin.s       fa0, ft0, fa4
                  nop
                  rem          t3, s6, a7
                  mulhsu       ra, s2, a7
                  fmin.s       ft7, ft10, fa3
                  addi         ra, a6, 1371
                  fmul.s       ft9, fa3, fa6
                  fsgnjx.s     ft7, fa1, fa7
                  fsqrt.s      fa0, fs2, rmm
                  fclass.s     a3, ft6
                  mulhsu       s4, a3, zero
                  xor          a3, s11, t1
                  feq.s        s4, fs2, ft1
                  slt          s0, s10, s4
                  add          a1, s5, t5
                  fmin.s       fs8, ft9, ft6
                  flt.s        s0, fs5, ft11
                  andi         s3, t6, -775
                  ori          t4, s6, -839
                  slt          a3, a6, t4
                  sltiu        s11, a3, 1172
                  fsqrt.s      fs2, fa0, rtz
                  fmv.x.w      t5, fa7
                  fcvt.wu.s    t4, fs2
                  xori         a4, sp, -91
                  andi         t6, a7, 1995
                  and          s10, s3, a2
                  rem          a5, a6, s0
                  fmul.s       fa2, fs10, fs11
                  ori          a0, s9, -895
                  remu         ra, t1, t1
                  andi         t0, s11, -194
                  fcvt.s.w     fs10, t0, rdn
                  fmul.s       fa5, ft9, ft5
                  srai         a1, s6, 13
                  fmul.s       fa2, fs9, fs0
                  srl          a6, a0, t5
                  sltiu        a5, s3, -546
                  fcvt.s.wu    fs6, s10
                  srli         s11, t0, 15
                  fmv.w.x      fa1, a6
                  sub          a5, a2, a6
                  addi         ra, s6, -1890
                  fmax.s       fa1, ft11, fa5
                  srl          a2, a2, gp
                  sltu         t6, s5, s3
                  mulhu        t0, s2, s1
                  mulhsu       a0, a3, a3
                  nop
                  add          t1, t3, a3
                  slt          t2, s10, a2
                  flt.s        a1, fa1, fs3
                  rem          s4, s1, s0
                  fclass.s     s10, fs2
                  fadd.s       fs10, fs1, ft5, rdn
                  auipc        a3, 415339
                  fclass.s     t2, fs8
                  sll          t4, a4, a1
                  fclass.s     s10, fa6
                  rem          a6, tp, t2
                  fsqrt.s      fs5, ft4, rup
                  srl          a6, tp, s2
                  lui          a0, 392311
                  mulhu        t2, s9, s9
                  fmax.s       fs4, fs3, ft8
                  lui          t0, 474990
                  or           t4, a6, gp
                  sub          s4, s11, s7
                  nop
                  fmv.x.w      s10, fa2
                  fmax.s       ft3, fs11, ft7
                  xori         t5, ra, 1741
                  fclass.s     s6, fa0
                  andi         a1, sp, -261
                  fmul.s       fs11, ft6, fs7
                  andi         t4, a4, 1313
                  slt          a0, s6, s4
                  fcvt.s.wu    fs2, sp
                  sltiu        gp, s5, -325
                  divu         t0, zero, gp
                  or           a1, t4, s11
                  fle.s        zero, fa3, fs10
                  fcvt.s.wu    fs2, a2
                  feq.s        tp, fs1, fa0
                  slli         s10, s10, 28
                  div          t2, a5, t3
                  srl          s4, gp, s8
                  fcvt.w.s     t5, ft4
                  or           t2, s0, s4
                  add          sp, a5, zero
                  divu         a2, zero, a7
                  fsgnjn.s     fa4, fa7, ft11
                  srai         a6, s8, 2
                  srl          s2, s10, s2
                  fcvt.s.wu    ft4, t4
                  remu         a1, a0, a0
                  and          a3, a6, zero
                  fmul.s       fa0, fs0, fa4, rmm
                  remu         t1, s7, s1
                  fsqrt.s      fs1, fa0
                  fclass.s     s7, ft4
                  sltu         s4, s9, s3
                  addi         a1, s8, 1899
                  slt          gp, ra, a7
                  fcvt.s.w     fs3, t1
                  srai         s7, s10, 6
                  xori         a0, s6, -1596
                  add          t4, t2, s8
                  fsub.s       ft6, ft11, fa0
                  fmv.x.w      t6, ft10
                  fle.s        a2, fa2, ft0
                  srli         a4, t3, 17
                  flt.s        a1, ft8, ft6
                  flt.s        s7, fs5, fa1
                  sltiu        t6, s2, -868
                  div          t4, s0, s11
                  mulhu        t6, s0, s11
                  div          a0, sp, a4
                  divu         t5, a2, t5
                  fsgnj.s      fs10, ft9, fs7
                  addi         a7, a2, 849
                  mulhu        t1, a4, t0
                  sub          t1, a3, s2
                  addi         s7, s2, -148
                  andi         zero, ra, -984
                  div          t6, s7, s9
                  sltu         a6, zero, a5
                  or           a3, a1, tp
                  fadd.s       fa5, ft5, ft3
                  srli         t5, s3, 29
                  fsgnj.s      fs10, fa6, fa5
                  fadd.s       fs10, ft11, fa1
                  mulh         a2, t2, sp
                  divu         a3, t6, sp
                  slti         zero, s4, -565
                  div          sp, t3, gp
                  or           s10, t3, s9
                  fsgnjx.s     fs10, ft5, ft3
                  divu         s2, sp, t1
                  sub          s10, t2, s4
                  mulh         a5, s4, tp
                  xor          tp, a6, ra
                  xori         a2, t1, 473
                  slt          t6, s5, s4
                  fsub.s       fa2, fs10, fs6
                  rem          s10, t1, a1
                  remu         a5, gp, s11
                  ori          s3, t2, -1170
                  fle.s        s7, fs4, fs0
                  srli         tp, t4, 24
                  fmv.w.x      fa7, t3
                  fsqrt.s      fs5, ft2, rdn
                  srl          a3, a7, ra
                  xori         a7, gp, 1198
                  div          a6, a5, s9
                  fmv.x.w      ra, fa6
                  nop
                  fmax.s       ft2, fs5, ft1
                  xori         s6, s3, 1176
                  and          a7, a4, a1
                  nop
                  andi         a4, s7, -1300
                  xori         sp, a0, 69
                  sll          s5, s6, tp
                  slti         s2, a0, 112
                  xor          a4, s6, t6
                  fle.s        gp, fs3, fa4
                  fcvt.s.wu    ft5, t6, rdn
                  ori          tp, s0, -1389
                  fle.s        s10, fs9, fs5
                  fclass.s     t1, fs8
                  andi         sp, t2, -1128
                  fsqrt.s      fa4, ft2
                  sub          t5, tp, t4
                  fle.s        gp, fs11, ft3
                  fcvt.s.wu    fs11, a6, rdn
                  fsgnjn.s     fa0, fs11, ft3
                  fcvt.w.s     t0, ft2, rtz
                  andi         t6, s5, 170
                  slt          s11, ra, s2
                  ori          s6, s3, 1435
                  remu         t6, s4, t1
                  sra          s10, s4, s0
                  srai         a4, s3, 0
                  mulh         tp, a6, a2
                  slt          s0, s7, s3
                  slt          t6, a6, a1
                  xori         s7, s11, -1824
                  fle.s        s0, ft10, fs7
                  feq.s        t3, fs1, fs6
                  or           t1, t5, t5
                  fcvt.w.s     a0, fa0
                  fcvt.w.s     s6, fs10, rup
                  mulh         a6, zero, a6
                  mulhsu       t4, t1, s9
                  fmax.s       ft11, fs4, fa7
                  sub          s7, s1, tp
                  divu         s3, t5, ra
                  sub          t2, a1, a1
                  sltu         a7, t1, a4
                  flt.s        t3, ft2, fs1
                  mulhu        a0, a0, tp
                  flt.s        s5, fa0, ft7
                  sra          tp, a6, s11
                  xor          s3, s0, a6
                  sltu         tp, a6, a1
                  divu         tp, a3, s1
                  slti         sp, zero, -1288
                  srl          t4, sp, gp
                  fsgnjn.s     ft0, ft10, fa5
                  fadd.s       ft10, fs7, fa3, rdn
                  sltiu        t0, s3, 1172
                  divu         a6, t0, s5
                  fdiv.s       fs7, fa0, fs2, rtz
                  fcvt.wu.s    s5, fs11, rne
                  fmv.x.w      s7, fa0
                  or           sp, sp, s4
                  mulh         s6, tp, s2
                  srli         s0, s4, 2
                  slti         s5, a1, -1298
                  add          a6, a2, s9
                  rem          a6, s10, a4
                  fcvt.w.s     a1, ft4
                  rem          t0, t4, s6
                  nop
                  divu         s11, a3, s10
                  sltiu        s5, a7, -2004
                  feq.s        zero, ft8, fs8
                  feq.s        t6, ft7, fa2
                  xor          t2, ra, a2
                  ori          a1, t2, 1707
                  fclass.s     a0, fs11
                  mulhu        s10, s0, s3
                  lui          s2, 152579
                  slli         s2, t2, 16
                  fsgnj.s      fs8, ft1, fs2
                  mulhu        s6, s9, sp
                  fmul.s       fa3, fa0, ft11
                  addi         a5, gp, 1570
                  and          s3, a1, s0
                  xor          s3, s2, s1
                  fdiv.s       fs4, fa6, ft2, rup
                  fdiv.s       fa5, ft5, ft1
                  fsgnj.s      ft7, fs8, fa2
                  fadd.s       fa5, ft5, fs0
                  fsgnjn.s     fa5, fs0, ft10
                  rem          s2, a5, s4
                  fsgnj.s      ft10, fs10, ft8
                  fcvt.s.w     fs7, s10
                  sub          t6, a0, s4
                  fcvt.w.s     s11, fs2
                  fadd.s       fa7, ft9, ft9, rdn
                  nop
                  nop
                  add          t0, a4, a5
                  mul          s11, a2, a7
                  fmul.s       ft8, fa7, fa7, rup
                  divu         s11, a0, s9
                  fcvt.s.wu    ft8, t1, rtz
                  slti         s11, a3, -1271
                  sub          a7, s8, zero
                  fadd.s       ft8, ft5, fs1
                  and          zero, a4, sp
                  div          a6, ra, s1
                  addi         t5, s2, -1184
                  fcvt.w.s     s10, fa7, rmm
                  fclass.s     tp, fs9
                  nop
                  sltiu        a4, a2, 523
                  andi         zero, t4, -509
                  fsub.s       fs8, ft11, fs8
                  rem          s0, a3, s4
                  sltiu        a4, a6, -1816
                  mulhsu       s10, a3, gp
                  ori          t0, tp, -452
                  sub          s3, a7, s2
                  srl          s6, s10, a3
                  fle.s        sp, fs4, fs0
                  sltu         s3, t3, a3
                  fsgnjn.s     fa6, ft11, ft4
                  fcvt.w.s     sp, ft8
                  xori         s4, t1, -367
                  sltiu        a1, a2, -772
                  sll          a4, s1, a4
                  fadd.s       ft6, fs0, fs5
                  fclass.s     s6, ft3
                  rem          t5, a7, t4
                  div          a2, t0, s3
                  srli         ra, s7, 30
                  remu         a4, s5, t4
                  sltu         ra, a1, s2
                  sltiu        gp, t6, 909
                  fmin.s       fs9, fa2, ft1
                  fmin.s       fa4, ft8, ft10
                  add          a2, t2, gp
                  fclass.s     a3, fs9
                  divu         t6, t2, s8
                  xori         sp, t4, 563
                  fsgnjx.s     ft3, ft0, ft11
                  fcvt.w.s     s10, fs0, rup
                  div          s0, t2, a1
                  slti         t4, a7, -1410
                  srli         t6, a5, 2
                  srli         s4, s11, 23
                  lui          t1, 570513
                  mulhu        s0, s10, a0
                  fmax.s       fs3, fs4, fs9
                  srai         a7, a0, 7
                  add          zero, a6, t6
                  flt.s        sp, ft3, fs6
                  fle.s        s6, fs8, fs7
                  slli         gp, sp, 14
                  lui          a5, 655965
                  mulhsu       t2, a4, t5
                  xori         s3, a7, 351
                  xor          s7, s0, a2
                  fsgnj.s      fs11, fs6, fs2
                  fle.s        t6, fa2, fs11
                  fcvt.w.s     ra, fa4
                  fle.s        a6, fs8, fs5
                  xori         t1, t2, -1269
                  remu         a1, tp, t6
                  fsqrt.s      ft8, ft1
                  fcvt.s.w     fs2, s8
                  andi         s4, t6, -1665
                  fdiv.s       ft10, ft8, fa5
                  fsub.s       fa6, ft0, ft6, rmm
                  or           zero, t4, a5
                  rem          t2, a0, a6
                  fcvt.wu.s    a4, ft7
                  fcvt.s.wu    fa5, a2, rmm
                  fsgnjx.s     fa0, fa4, ft1
                  and          s4, zero, t5
                  addi         t5, s4, 1680
                  srl          s3, s2, s11
                  srli         sp, t5, 2
                  fcvt.s.wu    fa3, ra
                  sub          a7, t3, sp
                  fadd.s       ft2, ft8, fs2
                  fmv.w.x      fs6, s6
                  slli         s5, s7, 27
                  fsqrt.s      fs8, fa1, rmm
                  xor          ra, s6, s9
                  flt.s        zero, fa2, fs3
                  fmv.x.w      a0, fa3
                  fmv.w.x      fs7, a0
                  fclass.s     t5, ft1
                  mulhsu       a0, s5, a2
                  slli         s7, tp, 1
                  fsub.s       fa3, fa6, ft0, rtz
                  feq.s        sp, ft0, ft0
                  fsub.s       fs10, fa5, ft6
                  fdiv.s       fs9, ft6, ft1
                  mul          t5, s7, a3
                  andi         s2, a2, 553
                  fsub.s       fa6, fs5, fs2, rdn
                  andi         a2, a1, -854
                  fcvt.w.s     zero, fs0, rup
                  fdiv.s       fs4, fa3, ft3, rne
                  mul          t6, s9, a0
                  rem          tp, s3, s11
                  mulhsu       s4, s4, a1
                  fsgnjx.s     fs4, fs4, ft11
                  srai         a2, t4, 5
                  addi         a4, s9, 1783
                  fmin.s       fs2, ft3, fs11
                  auipc        t1, 176196
                  lui          t5, 731583
                  srai         a2, s4, 18
                  slti         t2, t0, -699
                  div          a2, a6, a0
                  fdiv.s       fs5, ft7, ft8, rup
                  srai         tp, a1, 14
                  sub          s5, a1, s9
                  fsgnj.s      ft10, fs11, ft2
                  fmin.s       fa6, ft3, ft5
                  fmv.w.x      ft6, t3
                  slli         s3, s4, 19
                  fcvt.s.w     ft8, s11, rup
                  fcvt.wu.s    t0, fa7, rne
                  and          a1, s4, a7
                  fmul.s       fs5, ft7, fa0, rmm
                  addi         s10, a4, 1196
                  mulhu        s0, tp, s10
                  fcvt.s.w     ft5, a3, rup
                  fmul.s       ft5, fs3, ft10, rmm
                  fsub.s       ft0, fa5, fs7, rtz
                  xori         s11, t6, -590
                  sll          t1, a1, a3
                  sub          s11, s5, a5
                  fmax.s       fa3, fs4, ft11
                  fcvt.wu.s    t6, ft10
                  div          s7, zero, s3
                  fcvt.wu.s    s3, fs8, rne
                  div          a4, a4, s11
                  fcvt.w.s     t5, fs6
                  fcvt.w.s     t0, fs2
                  sltiu        s4, s10, 541
                  sra          s6, sp, a1
                  sub          a6, s4, t6
                  and          s0, t0, gp
                  xor          s2, s9, t3
                  addi         a7, gp, 1229
                  fsgnjn.s     fa3, fs9, fs6
                  fcvt.wu.s    s5, fs6
                  lui          t5, 5376
                  srai         s7, s4, 8
                  mulh         t4, a6, t5
                  flt.s        ra, fs3, ft7
                  srli         s6, s7, 14
                  fsgnj.s      fs4, ft5, fs7
                  sltu         s10, t2, ra
                  fmax.s       ft3, fa0, ft7
                  sll          t3, a5, s10
                  fdiv.s       fs4, fs9, fs1, rmm
                  sra          s5, s2, s0
                  fcvt.wu.s    t0, fs6
                  remu         t1, s3, ra
                  slli         s7, t1, 6
                  auipc        s0, 298408
                  fsgnjx.s     ft0, fs10, fs6
                  div          s6, t1, t2
                  fdiv.s       fa2, ft4, fs1
                  and          s3, a4, zero
                  fsgnjn.s     fa7, ft8, ft8
                  fcvt.wu.s    a5, ft3
                  fmin.s       ft1, fs0, ft3
                  slt          a2, a0, s7
                  add          s3, a3, a3
                  fmax.s       ft9, fa4, fs1
                  remu         a7, s3, s11
                  or           s11, t5, t4
                  add          a3, a2, s1
                  sll          a1, ra, t5
                  mulhu        s10, ra, t1
                  nop
                  srli         s0, zero, 26
                  fsgnjn.s     fs8, ft2, ft10
                  fdiv.s       fs1, fs3, fs0
                  fcvt.wu.s    s6, fa3
                  fmax.s       fa6, fa5, ft0
                  ori          t2, a1, 1214
                  nop
                  fsqrt.s      ft4, ft8
                  fle.s        t2, ft4, fs11
                  srl          a4, zero, s5
                  xor          s2, t5, s0
                  xori         s10, tp, 1226
                  fdiv.s       ft11, ft3, ft9, rup
                  sll          gp, s1, s7
                  sltu         sp, a2, t6
                  remu         s3, t4, zero
                  slli         s4, a6, 8
                  fcvt.s.w     fs4, s2, rdn
                  and          tp, a4, a1
                  sra          a1, s7, a3
                  fsgnj.s      ft1, ft8, ft3
                  remu         s0, t6, s8
                  sra          tp, t5, s9
                  srli         t1, s1, 9
                  fmax.s       fa1, ft3, fs2
                  slli         tp, s0, 17
                  fcvt.s.w     ft8, s3
                  fmax.s       fa7, fa2, fa4
                  fadd.s       fa1, ft0, ft10, rmm
                  or           a7, s0, a7
                  xor          a7, a4, a0
                  fcvt.w.s     a5, ft10, rtz
                  mulhsu       t2, s2, t0
                  nop
                  divu         a2, s2, a5
                  ori          a3, a5, 1202
                  rem          tp, a3, zero
                  slti         s6, s9, 1947
                  mulhu        s10, t6, a7
                  fadd.s       ft3, fa4, fs1
                  sll          s2, s4, tp
                  nop
                  sltu         t2, t3, gp
                  fsgnjn.s     ft4, ft8, fs5
                  mulhu        a3, s5, t6
                  flt.s        s0, ft6, fs8
                  mulh         a3, zero, s10
                  mulh         ra, sp, t5
                  fcvt.w.s     s6, ft1
                  fsgnj.s      ft4, fs6, ft10
                  div          zero, s0, s6
                  feq.s        a4, ft3, fs6
                  fadd.s       ft2, ft3, fa7
                  fmin.s       fs5, fs7, ft10
                  or           a0, tp, a3
                  div          ra, a4, s11
                  slli         t0, s4, 16
                  fcvt.s.w     fs8, a0, rmm
                  ori          s6, s3, 286
                  div          s4, a6, a0
                  slt          s11, s1, s4
                  fdiv.s       fa0, ft3, fa6, rdn
                  fdiv.s       ft5, fs0, fs8
                  sll          s6, t2, s6
                  fadd.s       fs5, ft4, fa7
                  slti         ra, a4, -139
                  andi         t1, sp, 1183
                  remu         s7, s10, s3
                  div          ra, s6, ra
                  sra          a3, sp, s1
                  slt          t2, a1, s0
                  fsgnj.s      fs8, ft7, fs1
                  fsub.s       fa0, fa3, ft7, rmm
                  mul          s4, s11, s9
                  auipc        t4, 1042081
                  mulh         tp, s2, t3
                  fsgnjx.s     ft0, ft6, fa5
                  fsqrt.s      fs7, fa0
                  fsqrt.s      fs7, ft9
                  xori         ra, s3, 1193
                  fcvt.s.wu    ft3, t4, rmm
                  andi         s5, s3, 1341
                  fclass.s     a1, fs6
                  and          s2, a6, s6
                  fsgnjx.s     fa6, fa7, ft5
                  fsgnjn.s     fs4, ft3, ft5
                  sltiu        a5, t1, -398
                  fsgnjx.s     ft1, fs5, fs11
                  sltiu        a5, ra, -1172
                  and          zero, s7, s4
                  fcvt.w.s     t2, ft3
                  fmax.s       fs0, ft2, fs11
                  remu         a3, s9, s10
                  or           t4, t2, t5
                  xori         a3, a6, 869
                  andi         t1, s9, -1271
                  fsgnjn.s     fs10, ft3, fa6
                  srli         s7, gp, 26
                  fsgnj.s      fa7, fa0, fs1
                  or           t6, tp, t4
                  mulhsu       t6, s7, t1
                  fsgnjx.s     fs6, ft0, ft10
                  sltu         gp, a6, s4
                  fcvt.s.wu    fa3, t5, rdn
                  slti         t2, a5, 993
                  srl          zero, ra, t2
                  mulhsu       a5, a1, s3
                  fcvt.s.wu    fs0, t0, rne
                  feq.s        tp, ft4, ft0
                  divu         a2, a3, s0
                  addi         a2, s1, -1799
                  mulhsu       s10, t4, a7
                  mulh         t6, t0, a5
                  fclass.s     zero, fs7
                  and          s2, s2, gp
                  sub          ra, s4, s1
                  flt.s        a7, fa7, fs5
                  div          s7, gp, t5
                  ori          sp, s0, 556
                  mulh         gp, a3, s0
                  fsub.s       fa5, fs8, fs6, rup
                  fcvt.s.wu    ft7, s3, rtz
                  fcvt.w.s     s7, fa1
                  remu         s4, a7, s11
                  sltiu        a3, s0, 1546
                  fadd.s       fs9, fa3, ft6, rup
                  mulh         t1, zero, s3
                  fcvt.w.s     t5, fa3, rup
                  fcvt.wu.s    s4, fs10, rdn
                  fcvt.s.w     ft2, s8
                  sltiu        a2, s3, 1228
                  xori         s5, a3, 6
                  sub          ra, a5, tp
                  sltu         gp, a1, s2
                  slli         a1, a1, 11
                  sltu         a2, a6, s7
                  mulh         s5, ra, s4
                  lui          t0, 97826
                  fsgnj.s      ft8, ft7, fs7
                  sub          s2, sp, s11
                  fsgnj.s      fa1, fs3, fs4
                  slli         t4, t4, 31
                  divu         t5, s0, s4
                  fdiv.s       ft11, fs5, ft1, rne
                  fmin.s       fs7, fs2, ft9
                  nop
                  lui          s10, 569195
                  and          gp, s6, t6
                  divu         a0, s1, ra
                  fmul.s       fa2, ft8, fs0, rne
                  sra          s10, t4, a2
                  slli         a0, s9, 20
                  fcvt.wu.s    t1, fs5, rmm
                  feq.s        s7, ft3, fs10
                  fcvt.w.s     a3, ft3
                  fsub.s       fs6, fs1, ft9
                  fsqrt.s      fs4, ft7
                  fclass.s     a4, ft3
                  fmin.s       fa7, ft1, ft11
                  fmin.s       fs7, ft10, fs9
                  fmv.w.x      ft4, a1
                  remu         s2, s11, a3
                  add          a7, t4, t4
                  srli         gp, s0, 4
                  fcvt.wu.s    s2, fs6, rup
                  div          a1, t2, a3
                  flt.s        t3, ft10, fa4
                  andi         s7, a1, 1221
                  div          a7, t3, s5
                  sltiu        a2, t5, 476
                  fdiv.s       fa5, ft10, fa6
                  fsub.s       fa3, fs1, fa0
                  fadd.s       fs1, ft2, fs8
                  fsqrt.s      fs7, fa6
                  fdiv.s       fs1, ft8, fs3
                  xor          s10, t2, s2
                  fdiv.s       ft8, fs7, fa2, rtz
                  fmax.s       fs10, fs6, fa2
                  srli         t6, s8, 21
                  sltu         t4, s5, s0
                  div          tp, a1, s2
                  fsgnj.s      fa5, fa4, fs0
                  sub          sp, tp, t1
                  fcvt.w.s     a6, fa5, rdn
                  xor          sp, s8, a0
                  fcvt.w.s     a5, fa4, rup
                  fsgnj.s      fa0, ft9, ft2
                  nop
                  flt.s        t6, fs3, fa4
                  slli         a6, ra, 12
                  feq.s        a7, fs11, fa1
                  slti         t2, a1, -328
                  sltiu        t4, s1, 254
                  divu         s11, s9, s10
                  sll          t4, a0, a2
                  sra          a7, a6, s4
                  mul          s4, t2, t3
                  sll          t5, ra, a2
                  slt          a2, t0, s1
                  srli         s11, a5, 29
                  srli         a3, ra, 7
                  sub          a6, tp, s0
                  fcvt.s.w     fa3, s4, rmm
                  fcvt.wu.s    s6, fa2
                  xori         s7, a4, 1997
                  fmul.s       fs9, ft10, fs1
                  fmin.s       ft2, fs1, fa6
                  sltiu        a1, gp, 1343
                  lui          a7, 572463
                  fmul.s       fa3, ft2, fs8, rtz
                  fadd.s       fs3, fs5, fs9, rtz
                  mulh         a1, s10, t3
                  and          a1, zero, s6
                  fclass.s     t0, ft9
                  mul          t0, s6, a7
                  fsub.s       ft1, fs8, ft4
                  xori         gp, a7, 1314
                  fsub.s       ft8, ft3, fs2, rdn
                  sltu         sp, s3, t2
                  fadd.s       fs10, ft9, fs7
                  fclass.s     a6, ft6
                  divu         ra, gp, s8
                  fadd.s       fs9, ft9, fa3
                  add          s10, s10, a2
                  sltu         gp, a7, a5
                  fadd.s       fa3, ft10, fs2, rtz
                  add          s3, ra, a0
                  fcvt.s.w     ft1, s2, rdn
                  flt.s        s10, ft11, ft8
                  sra          a1, zero, s6
                  rem          a3, t3, t6
                  ori          t5, t6, 569
                  fle.s        s7, ft6, ft0
                  rem          s0, s6, s3
                  fmax.s       fs0, fs9, ft11
                  auipc        s7, 146360
                  fcvt.w.s     a3, ft0, rmm
                  srl          zero, s3, t6
                  slli         s0, ra, 15
                  fmin.s       fs1, fs5, ft1
                  divu         a5, s10, s6
                  fclass.s     s10, ft3
                  fcvt.w.s     s7, fs10
                  ori          a1, zero, -1537
                  div          s7, s3, t3
                  rem          a6, s8, s4
                  auipc        s5, 385139
                  srai         a4, s5, 3
                  mul          s4, t1, a7
                  fcvt.s.wu    fa2, a1, rup
                  slli         ra, t1, 18
                  fsgnjn.s     ft3, fs5, ft3
                  addi         s2, a6, 885
                  mulh         t0, a3, t0
                  sub          a2, gp, t3
                  sub          t2, s1, a1
                  rem          t6, t6, t3
                  fsqrt.s      fs6, fs5
                  fmv.x.w      a7, fs3
                  fmax.s       fs8, ft5, fs9
                  and          t4, tp, s7
                  auipc        a6, 492156
                  fcvt.s.w     ft10, s5, rup
                  xori         s11, zero, 1803
                  mulh         sp, s6, tp
                  fmv.x.w      a5, fa4
                  fclass.s     s5, fs9
                  slt          tp, a5, s4
                  or           a3, s9, a1
                  fcvt.wu.s    t4, fs2, rtz
                  fmv.w.x      fa6, t5
                  srli         t1, a7, 31
                  auipc        sp, 441293
                  fsgnjx.s     ft6, fa6, ft11
                  srl          a1, tp, s3
                  fsgnj.s      fs3, ft8, fs3
                  div          t3, s6, s6
                  auipc        a1, 1001797
                  fclass.s     s11, ft6
                  xori         a4, s10, -82
                  slti         a4, t5, -449
                  mulhsu       sp, s10, sp
                  div          t6, a4, t3
                  xori         s2, a3, -1516
                  divu         tp, t1, s5
                  fadd.s       ft0, ft8, fs4
                  sll          a3, t4, a0
                  slli         s3, s0, 5
                  nop
                  ori          a4, ra, 619
                  ori          zero, a1, -897
                  mul          s10, sp, ra
                  fclass.s     s5, fs2
                  rem          t5, s0, s7
                  fcvt.s.w     fa0, s7
                  fcvt.wu.s    tp, ft9
                  xor          gp, zero, zero
                  fcvt.s.wu    fs4, t3
                  fclass.s     zero, fa7
                  nop
                  fadd.s       fs10, fs0, ft6
                  srl          a0, s11, tp
                  fcvt.s.w     fa7, s7
                  auipc        s5, 714237
                  mulhu        zero, s9, s10
                  sltiu        s7, s10, -1477
                  fmv.x.w      s0, ft3
                  div          s5, tp, a6
                  fle.s        a4, fs5, ft6
                  fmul.s       fs0, fs2, fa0, rup
                  or           a2, tp, a0
                  sll          sp, t6, s1
                  fsgnjn.s     fs6, ft9, ft5
                  sra          a5, a5, t5
                  fsgnjn.s     fs6, fs9, fa3
                  srai         tp, s1, 9
                  sltiu        a3, s0, 1326
                  fcvt.wu.s    s11, ft10, rmm
                  fmul.s       fs7, fs3, fa5, rmm
                  rem          a5, s9, t4
                  fsqrt.s      ft10, ft4
                  mulhu        a6, s7, s5
                  fsqrt.s      fs1, fa5, rne
                  xori         t0, s1, -271
                  fcvt.s.wu    ft9, a4
                  nop
                  srai         s7, ra, 14
                  lui          s10, 154125
                  fdiv.s       fa6, fa4, ft4, rdn
                  fmul.s       fs2, fa0, ft11, rne
                  sub          a7, s5, s10
                  fsgnjn.s     ft5, ft11, ft11
                  add          gp, zero, t4
                  xor          a5, s3, a4
                  fmax.s       ft10, fs2, ft1
                  fdiv.s       ft6, fs0, ft8
                  mulh         a7, t6, s6
                  fclass.s     a4, fs2
                  fsgnjx.s     fa4, ft7, fs10
                  slt          sp, s3, t6
                  div          t3, t3, a0
                  feq.s        ra, ft3, fa4
                  fdiv.s       fs5, fa3, fa5
                  mulhsu       a6, a5, s0
                  sub          t3, zero, s8
                  slti         t2, s7, 101
                  fmax.s       ft2, fa1, ft3
                  fmul.s       fs0, ft11, ft7
                  slt          zero, t3, a4
                  fsgnjn.s     fs6, ft5, fs7
                  xori         t1, t1, 295
                  sra          a7, s1, s2
                  fsgnjx.s     ft4, fs7, fs10
                  mulhsu       zero, t0, t0
                  fsqrt.s      ft2, ft7, rne
                  fclass.s     s11, fa2
                  nop
                  divu         a7, a4, s5
                  or           ra, s5, sp
                  fmv.x.w      tp, fs7
                  srli         t1, a6, 19
                  remu         s0, sp, t3
                  slti         zero, a7, -1337
                  andi         a1, zero, 709
                  flt.s        s7, fs9, fa0
                  feq.s        a3, ft3, fa7
                  fcvt.s.wu    fs9, t2
                  fadd.s       ft0, fs8, fa0
                  slli         s5, a5, 24
                  lui          s3, 37670
                  fdiv.s       fa1, fa7, fs4
                  nop
                  fadd.s       fs5, fa3, fa4
                  mulhsu       t3, s10, s6
                  fadd.s       fa3, ft9, ft9
                  mulhu        tp, t4, ra
                  lui          s4, 824463
                  rem          s11, s6, tp
                  mulhsu       a1, t5, t6
                  fsqrt.s      ft3, ft3, rdn
                  sltiu        a2, a4, 1703
                  sltiu        a4, s8, -58
                  mulh         a4, s10, tp
                  and          sp, a2, s2
                  fmul.s       ft5, fs11, ft7, rtz
                  slti         s11, tp, 1219
                  add          t5, sp, t1
                  or           t5, t2, t1
                  fcvt.s.wu    ft7, s2, rmm
                  slt          s7, a0, s6
                  mul          ra, s2, s11
                  xor          t0, a1, a0
                  slt          s11, gp, t2
                  divu         a0, t6, s1
                  feq.s        s0, fs2, fa2
                  fsgnjx.s     ft1, fa7, fs7
                  div          a6, s8, s10
                  sll          a2, s3, s9
                  fcvt.w.s     s2, fs1
                  auipc        s0, 31466
                  or           t5, tp, a1
                  and          tp, a6, s5
                  mulh         t5, s11, a4
                  fmv.x.w      s2, fs5
                  fcvt.s.w     fs7, s5, rne
                  srl          s6, s0, s7
                  fmul.s       fs1, fs9, ft7
                  remu         t4, s5, gp
                  fsgnjx.s     fa6, fa6, fs10
                  fdiv.s       fs0, fs0, fa1
                  fcvt.w.s     t2, fs11
                  fcvt.w.s     t3, fs10
                  flt.s        s2, fs7, fs8
                  fmul.s       ft8, ft9, ft5, rup
                  rem          a6, s4, gp
                  fmin.s       ft9, fa6, ft5
                  fmv.x.w      a0, fs9
                  fdiv.s       fs0, fa7, ft1
                  flt.s        s0, ft8, fa0
                  feq.s        tp, ft9, fs10
                  and          s10, t5, a0
                  sub          t5, s2, t4
                  fmax.s       fa2, fa5, ft5
                  fsub.s       fs7, fa7, ft11
                  slt          a4, sp, s4
                  fcvt.s.w     ft10, s10, rne
                  fle.s        s5, ft4, fs10
                  xori         t6, a2, 550
                  sll          s10, a2, a6
                  mulhsu       s6, s6, s1
                  fcvt.wu.s    a7, fs3, rne
                  slt          a3, zero, t2
                  addi         t4, s11, 170
                  mul          s6, ra, t4
                  fsgnjx.s     fs11, ft11, fs2
                  feq.s        a7, fs1, ft3
                  fsgnjn.s     fs6, ft7, ft6
                  slli         t0, a4, 13
                  sra          t5, a6, s0
                  fmv.w.x      ft3, gp
                  mulhsu       a3, t0, s6
                  div          s0, s10, a3
                  lui          s10, 629438
                  mulh         ra, s6, t5
                  slt          a2, tp, a5
                  div          s3, t4, a7
                  mul          tp, s10, a6
                  fsqrt.s      fa2, ft0
                  srai         t3, s11, 13
                  nop
                  lui          a0, 942919
                  or           s11, zero, t2
                  div          s2, a3, t2
                  fcvt.w.s     t4, fs6, rmm
                  and          s2, t4, tp
                  fsgnj.s      fa3, ft5, ft1
                  fsgnj.s      ft10, fa7, fs5
                  mulh         a2, s5, s7
                  mulhu        s5, t0, s8
                  slti         a4, s9, -1397
                  mulhsu       zero, s4, s2
                  fmin.s       fa7, fa1, ft4
                  div          a2, s11, s11
                  rem          s5, s6, ra
                  slt          a2, t0, s11
                  fcvt.s.wu    ft1, a5
                  fcvt.wu.s    t3, fa7
                  fsgnjn.s     ft4, ft10, fs9
                  fadd.s       fa5, fa6, fa6, rup
                  or           t2, s3, a7
                  slt          a3, a7, t4
                  addi         s11, s3, -99
                  slli         t3, s8, 10
                  div          a2, t6, t0
                  fcvt.s.w     ft8, t5, rne
                  addi         sp, s4, -76
                  fle.s        ra, fa7, ft11
                  fcvt.s.wu    fa1, t3, rup
                  auipc        s10, 971110
                  srai         s11, s9, 5
                  ori          s6, a4, -159
                  fmul.s       ft9, ft6, fa7, rmm
                  xori         zero, t4, -1352
                  fle.s        t0, ft6, ft1
                  andi         t5, sp, 3
                  xori         t2, a3, 2011
                  fcvt.s.wu    ft0, s9, rmm
                  sltu         t3, s2, a1
                  fmv.w.x      fs2, s8
                  fcvt.w.s     s11, fs2
                  div          s5, a1, t2
                  fcvt.s.w     fa1, t4
                  slti         s11, t4, 732
                  slt          t6, t2, t3
                  fmv.x.w      s7, fs6
                  fmv.x.w      gp, ft2
                  add          s4, a3, a1
                  mulh         t3, a4, s3
                  mulhu        s0, s5, s4
                  sll          s7, a6, t4
                  xori         s4, t6, 1662
                  xori         s2, a4, -1832
                  mulhu        tp, s8, s10
                  fdiv.s       fs7, fa4, ft7, rtz
                  fmv.w.x      fs7, a1
                  fsgnj.s      fa0, ft11, fa6
                  srli         gp, a1, 7
                  sra          s2, s0, a4
                  andi         t2, t3, -850
                  fmul.s       fs7, fs0, fa7
                  add          zero, a3, t3
                  fsgnjn.s     fa2, ft3, fs4
                  rem          t1, a2, sp
                  div          t4, s10, a4
                  feq.s        s0, fs10, fs0
                  andi         t1, a3, 109
                  remu         s7, t5, s3
                  fadd.s       fs4, ft2, ft6, rmm
                  sll          a2, s4, s9
                  andi         a2, t1, 958
                  add          t2, t3, a2
                  fsgnjn.s     fa0, fa3, ft0
                  fclass.s     a5, fs3
                  sub          ra, zero, a5
                  fsgnjx.s     ft5, fs11, ft6
                  fmv.x.w      tp, fs3
                  fsgnjx.s     fa6, fs0, fs10
                  fle.s        s4, ft5, fa3
                  feq.s        s5, ft10, fs10
                  sltu         a7, tp, ra
                  xori         a4, tp, 1428
                  mul          a5, a7, a5
                  sra          t4, s8, t5
                  fsgnjn.s     fa0, fs2, ft4
                  mulhu        s6, a4, s2
                  srai         s7, a4, 27
                  sltiu        a5, s8, 1073
                  lui          sp, 1032446
                  fsgnjx.s     fs9, fs4, fs6
                  fclass.s     a1, ft3
                  remu         s4, s11, t5
                  addi         t4, a5, -356
                  divu         s0, s0, s9
                  mulhu        sp, s11, s10
                  srai         s0, s8, 31
                  srli         s2, t1, 10
                  fmv.x.w      t0, fs4
                  andi         t5, s10, 1280
                  xor          t3, s3, s5
                  fsgnj.s      fs5, ft6, fs7
                  andi         a7, s8, 89
                  srl          s7, s3, t3
                  sra          a0, tp, s6
                  srl          s6, zero, s3
                  sub          t1, s0, a7
                  xori         t1, t5, 995
                  sltiu        ra, s7, -1967
                  sll          s10, a3, t4
                  andi         t6, a6, -1472
                  fmul.s       ft3, fa0, ft2, rup
                  srai         t4, s4, 28
                  fadd.s       fs0, fa6, ft7
                  srai         s3, a7, 0
                  fmin.s       fa0, fa6, ft0
                  xor          a0, a5, a1
                  fmul.s       fs8, fs2, fa6, rup
                  fmax.s       fs7, fs7, fs6
                  andi         a5, s2, 856
                  div          t3, s2, s3
                  add          t4, s0, a5
                  srai         s3, s3, 0
                  fsgnj.s      ft0, fs7, fs1
                  and          a5, s8, t3
                  and          s0, s6, a6
                  and          t4, s11, s1
                  mul          s3, a6, a0
                  flt.s        a5, fs6, fs1
                  sll          s6, t2, s10
                  lui          a3, 974556
                  fcvt.s.wu    fa0, t2, rup
                  xori         a6, a6, 1034
                  div          s11, a7, sp
                  divu         a2, a5, s10
                  div          t2, s4, s9
                  fcvt.wu.s    t3, fa5, rtz
                  lui          s0, 128176
                  srai         a7, t0, 30
                  addi         s10, ra, 885
                  addi         s4, a1, 1633
                  slti         tp, s5, -1130
                  add          sp, s4, zero
                  fsgnjx.s     ft0, fs4, fs4
                  or           zero, s10, s4
                  fcvt.s.wu    fa5, a4, rtz
                  fmv.w.x      fa1, a4
                  sltu         s2, s9, s8
                  sra          a2, ra, gp
                  fcvt.s.w     ft0, s6, rne
                  mulhu        a0, s6, t2
                  fsgnjx.s     ft7, fs1, fa4
                  srl          ra, s9, a5
                  feq.s        s4, ft8, fa6
                  add          s7, t2, s11
                  and          a6, s11, a0
                  fcvt.w.s     s3, fs3, rup
                  rem          a4, a5, s4
                  mulhsu       sp, s9, t3
                  fmin.s       ft6, fa6, fs2
                  fcvt.s.w     ft9, s11, rdn
                  fsgnjn.s     fs0, ft9, ft2
                  sra          a5, t4, a0
                  flt.s        s0, ft3, ft6
                  rem          t1, t1, ra
                  mul          a7, s6, a0
                  fsgnj.s      ft0, ft10, ft8
                  fcvt.s.wu    fa6, s8
                  fmin.s       ft1, fa1, fa1
                  fle.s        t0, ft3, ft11
                  srl          s11, t6, t4
                  srl          s5, ra, sp
                  fcvt.s.w     fs2, ra
                  fmin.s       fa4, fs5, ft8
                  ori          tp, t5, -334
                  fcvt.w.s     s2, ft8
                  lui          gp, 1025502
                  mulh         zero, s9, a2
                  fsgnjn.s     ft0, fs4, ft8
                  add          t0, t3, a3
                  mul          t1, s2, t4
                  xor          t5, s1, gp
                  nop
                  fsub.s       ft3, fs8, fa3
                  sltu         a0, s2, s1
                  sub          s10, s2, a0
                  fmax.s       ft10, ft2, ft9
                  fsgnj.s      ft4, fs3, ft9
                  sltiu        s4, s6, -443
                  fdiv.s       fs10, ft11, fa5
                  fsgnj.s      fs8, fa5, ft3
                  mul          sp, a5, t3
                  auipc        s4, 388805
                  rem          a7, s8, t3
                  fsgnj.s      ft11, fa1, ft2
                  mulhsu       a3, a7, s9
                  fsgnjn.s     fa3, fs2, fa6
                  fsqrt.s      fa4, fs8
                  xor          t0, s6, zero
                  fmul.s       ft1, fa2, ft7, rmm
                  mulhsu       t0, s7, s7
                  slli         s2, ra, 6
                  fsgnj.s      fs6, ft9, fs10
                  xori         sp, a1, 796
                  fsgnjn.s     ft8, fs8, fs10
                  fsgnjn.s     ft1, fa3, fa5
                  divu         s5, s7, t2
                  auipc        t1, 420240
                  or           a5, a7, a7
                  slti         s3, a4, 1370
                  fsub.s       fa0, ft4, ft2
                  xori         t6, s8, -639
                  slt          s0, a6, a2
                  fsqrt.s      fs10, fa5
                  xor          sp, zero, s7
                  fmul.s       fa5, fa4, fa6, rup
                  add          t2, a3, ra
                  andi         s0, t5, 719
                  fsgnjx.s     ft10, ft5, fa5
                  divu         tp, a1, a5
                  add          t3, s4, sp
                  slt          a6, a7, s10
                  xor          a6, gp, s2
                  slti         s5, tp, 302
                  remu         s3, t5, s3
                  fmul.s       fa5, fa3, ft1, rne
                  mulhsu       s6, t5, a5
                  srl          s3, t3, t1
                  slli         a1, a6, 16
                  fmax.s       fa6, fs2, ft5
                  or           s4, a6, tp
                  flt.s        a5, ft0, ft3
                  fdiv.s       ft7, fa0, ft1, rtz
                  srai         s10, tp, 10
                  fmv.x.w      t5, ft4
                  fsgnjn.s     fa1, ft2, fs7
                  addi         t1, t0, -1679
                  divu         t5, t0, a3
                  ori          s3, s3, 633
                  slli         t3, a4, 8
                  divu         s7, t2, gp
                  slti         s10, s6, 1128
                  fcvt.wu.s    sp, ft7
                  andi         gp, s4, -1759
                  lui          gp, 564886
                  and          t5, t2, s0
                  fsgnjn.s     ft10, ft1, fs1
                  mulhu        s3, a2, a5
                  fclass.s     s4, fs3
                  and          t5, s2, s5
                  fcvt.w.s     s10, fs0
                  div          a0, s0, a0
                  divu         a2, a2, s6
                  auipc        t3, 1011800
                  fmv.x.w      a2, ft9
                  srli         a4, t0, 7
                  ori          t4, s0, 469
                  mulh         a0, a4, tp
                  fsgnjx.s     fs5, fs5, ft8
                  fsub.s       ft5, fs11, ft8
                  fadd.s       ft6, fa3, ft5, rne
                  mulh         a5, s3, t4
                  sra          t1, tp, s11
                  fadd.s       fa7, fa0, fs0, rdn
                  fsgnjx.s     ft6, fs6, ft4
                  sltu         t5, a4, t2
                  xori         gp, s4, 1318
                  fmul.s       fs1, ft8, fs0, rup
                  fsgnjn.s     ft3, ft11, ft5
                  div          sp, s1, s9
                  fcvt.wu.s    t0, ft10
                  fmv.x.w      a0, fs7
                  sub          s2, sp, t6
                  fcvt.s.wu    ft4, tp, rtz
                  fle.s        gp, fa7, ft1
                  fle.s        t3, ft3, fa7
                  fmin.s       fs3, fa5, fa6
                  sll          a2, zero, s3
                  rem          t6, zero, ra
                  slt          s4, gp, a0
                  fmul.s       fa6, fa4, fa7
                  sll          s6, a5, s4
                  fmul.s       fa5, fa7, fs1
                  flt.s        a7, fs7, fs7
                  sra          gp, a7, a6
                  div          s0, s10, s11
                  or           s10, a7, t5
                  mulhu        gp, s4, a5
                  fle.s        zero, ft1, fs4
                  fclass.s     s3, ft5
                  slli         s0, t5, 16
                  andi         t1, gp, 1195
                  or           a1, a3, t5
                  fclass.s     s7, fs3
                  sll          s5, t1, sp
                  fcvt.wu.s    a0, fs2, rup
                  fsub.s       fs3, fs2, fa1
                  xor          a0, a0, tp
                  fcvt.s.wu    fa4, s0
                  srli         t6, a0, 10
                  addi         a0, t2, -554
                  mulhu        s6, s6, ra
                  fcvt.wu.s    s11, fa0
                  fcvt.s.wu    ft11, s3
                  sll          zero, t4, a7
                  srli         a1, gp, 14
                  fcvt.wu.s    a5, ft4, rne
                  ori          a0, s7, -1204
                  fmul.s       ft8, fs4, ft11, rne
                  fcvt.s.w     ft1, s4, rmm
                  and          s0, s3, s4
                  mulhsu       t4, t5, a4
                  and          a5, t1, tp
                  divu         gp, t6, gp
                  sub          s7, a3, s0
                  feq.s        gp, fa6, fa1
                  srli         t3, s0, 25
                  slt          t5, s1, t1
                  rem          t4, s4, a2
                  sltu         a4, s9, ra
                  mulh         tp, ra, sp
                  auipc        s3, 30058
                  srl          t0, gp, t0
                  slli         zero, a5, 30
                  sltu         gp, t4, s3
                  or           s0, s5, sp
                  feq.s        gp, fs5, fs7
                  fcvt.w.s     a6, ft9
                  fsgnjn.s     fs11, ft1, fs7
                  fsqrt.s      fs0, fs1
                  mul          t1, t0, t6
                  xor          a3, s1, s5
                  mul          t6, s9, s1
                  mulh         t3, a2, s0
                  fclass.s     s11, fa5
                  slti         a6, t6, 1142
                  xori         a5, s1, 212
                  div          t1, ra, s5
                  div          s0, s4, s1
                  nop
                  divu         t4, sp, t5
                  slt          t3, s5, s0
                  sub          tp, a7, a3
                  auipc        gp, 341986
                  fcvt.s.w     ft1, zero, rdn
                  divu         a0, sp, t4
                  fcvt.w.s     t0, ft1, rne
                  ori          a1, t0, 2023
                  sltiu        t6, s9, 1698
                  rem          gp, t6, ra
                  fcvt.w.s     t0, fa1
                  sub          s6, a7, s7
                  slli         a6, a6, 4
                  fmul.s       fs3, ft6, fs9, rne
                  fmv.x.w      a6, fs10
                  divu         a7, s7, s4
                  slt          a4, a4, s2
                  slti         sp, s4, -289
                  fcvt.s.wu    fs4, s0
                  fdiv.s       ft8, fs7, fa1, rne
                  fdiv.s       fs3, fs10, fa2, rne
                  rem          t5, a3, s1
                  sll          t2, s2, s11
                  addi         t0, a2, 704
                  sltiu        t3, s6, -852
                  fmax.s       fs2, fa1, fs4
                  divu         s10, s7, a7
                  fcvt.wu.s    a4, fa2
                  fmax.s       fs5, ft8, fs2
                  and          gp, tp, a2
                  fsgnj.s      fa0, ft0, ft0
                  andi         a6, s0, -1867
                  or           t5, s5, a3
                  fclass.s     t4, ft11
                  feq.s        s4, ft3, ft3
                  srai         t0, gp, 20
                  addi         a7, s4, -1825
                  andi         s10, a2, 588
                  sltiu        t3, t2, -394
                  nop
                  fmv.w.x      fa7, s11
                  sra          ra, sp, t2
                  fmv.x.w      t3, fs2
                  srai         ra, ra, 26
                  fcvt.s.wu    fa4, a3, rtz
                  divu         tp, s3, t4
                  fcvt.wu.s    s10, ft2, rdn
                  fcvt.s.wu    fs4, s3, rtz
                  sub          a5, s1, a7
                  srai         s2, s4, 12
                  slli         s6, a7, 31
                  fmin.s       ft2, fs6, fa3
                  fcvt.s.w     fs1, a2, rmm
                  slli         t0, s11, 16
                  feq.s        a6, ft8, ft11
                  xori         a4, t3, 227
                  slt          s2, s0, s9
                  sltiu        t4, s6, -1577
                  fclass.s     s0, fs4
                  fmv.w.x      fa3, a1
                  feq.s        t3, ft7, fs6
                  xor          s6, t4, t0
                  remu         ra, a6, a1
                  lui          t1, 944255
                  rem          t3, t6, s6
                  sub          s2, t5, s1
                  fle.s        s3, fa1, fs8
                  fsgnjx.s     fa3, fs4, fa4
                  xori         ra, sp, 1875
                  ori          t0, t3, 1499
                  sra          a0, s10, a0
                  fsgnj.s      fa7, ft3, ft9
                  feq.s        s0, fs11, fs7
                  addi         t2, a3, 1905
                  slti         gp, gp, 775
                  slti         s11, s5, -374
                  srli         s3, t6, 25
                  sub          t3, t4, s5
                  fsgnj.s      ft4, fs10, fs6
                  sltiu        a4, s8, 1665
                  fsub.s       ft8, fa2, fs6
                  mulhsu       t2, s5, sp
                  slt          t1, t5, a5
                  sll          gp, s8, a1
                  fsgnjx.s     fa1, fs0, ft2
                  fcvt.s.wu    fs1, zero, rtz
                  fmul.s       fs1, fs3, ft11, rdn
                  or           a6, a0, s0
                  divu         zero, t4, a3
                  fsgnjn.s     ft3, fs10, fs1
                  fcvt.s.w     fs10, s5, rtz
                  add          s5, s6, s11
                  sltu         s6, t2, zero
                  rem          a1, s2, tp
                  div          t0, a4, s8
                  lui          t1, 290219
                  addi         a5, a0, -495
                  fmax.s       ft3, fs7, fs11
                  flt.s        a4, ft11, fs7
                  srl          zero, t5, gp
                  fsub.s       ft11, fa4, ft3, rne
                  fcvt.s.w     fs3, t3
                  fadd.s       fs3, fs2, fs4, rtz
                  fcvt.s.w     fs4, s3, rup
                  fsgnj.s      fs7, fa2, fs2
                  fmv.w.x      ft5, s6
                  fclass.s     a0, fa4
                  lui          a3, 835525
                  xori         a5, zero, 1225
                  ori          s2, a3, 1344
                  nop
                  lui          zero, 569542
                  sll          a2, a2, s1
                  sub          tp, s3, a2
                  ori          a6, s9, 1359
                  slli         a5, s6, 25
                  srl          t0, t6, s10
                  feq.s        t5, ft5, fs11
                  xori         s0, s10, -1769
                  sra          s3, sp, s3
                  slt          s11, a6, s0
                  fmul.s       fa3, ft9, ft2, rup
                  fsgnjx.s     fs3, ft11, ft0
                  fmax.s       fa3, ft9, ft7
                  remu         a5, s4, sp
                  fsgnj.s      fs6, fs6, ft0
                  fsub.s       fs1, ft11, fs9
                  fsub.s       fa7, fa0, fs11, rmm
                  addi         s11, a1, -270
                  srli         t4, a0, 7
                  xor          a6, s5, a4
                  xor          a4, s1, a0
                  fcvt.w.s     s11, fa0, rtz
                  fsgnj.s      fa6, ft0, fs7
                  srli         t1, ra, 2
                  divu         s6, s5, a1
                  sub          s3, sp, a2
                  srai         a1, a4, 19
                  add          gp, a2, t2
                  xori         s2, a4, -127
                  xori         a7, s0, -1829
                  nop
                  mulhu        zero, s9, sp
                  fcvt.wu.s    a0, fs5
                  mul          s11, zero, s5
                  lui          t0, 695659
                  rem          s4, ra, a5
                  sltiu        gp, s6, -507
                  ori          a2, t4, 428
                  fdiv.s       fs8, fs2, ft7, rtz
                  fcvt.s.wu    ft2, s10, rmm
                  remu         a5, a6, a3
                  xori         a1, gp, 936
                  sub          a3, s7, tp
                  div          s4, a1, a1
                  srl          a2, t2, t0
                  fmv.w.x      fa3, s4
                  fmv.x.w      a2, ft9
                  mulhsu       a0, s3, a1
                  sltiu        gp, a5, 303
                  andi         tp, s6, 743
                  xor          a1, s4, s5
                  fmul.s       fa0, fs1, ft8, rne
                  fmv.w.x      fs10, a2
                  slti         t1, ra, 440
                  fle.s        a7, ft1, fa1
                  mulhsu       tp, tp, t0
                  fmv.x.w      tp, fs7
                  fsgnjn.s     fa6, ft1, ft8
                  and          s4, s5, gp
                  rem          t0, a2, t1
                  sltu         ra, sp, a5
                  nop
                  srl          zero, tp, s9
                  add          s2, t5, sp
                  divu         sp, a5, s9
                  fsgnj.s      ft3, ft4, fs4
                  fclass.s     a3, fa1
                  xori         s7, a5, -1046
                  addi         t1, t0, -892
                  fcvt.wu.s    a0, fs4
                  fsqrt.s      ft6, fa5
                  feq.s        a2, ft6, fa5
                  mul          t2, s0, s0
                  slti         t6, a0, -1251
                  addi         gp, s4, -1507
                  fsgnjx.s     ft8, fs3, fs10
                  fcvt.wu.s    ra, fs10
                  fcvt.w.s     s6, ft10
                  flt.s        s11, fs6, fs8
                  add          ra, a4, t5
                  sltiu        t1, s6, -217
                  mulhu        sp, a4, a4
                  fdiv.s       fs2, fa2, fa5, rmm
                  slt          s0, t1, s4
                  sltiu        s6, s2, 1868
                  flt.s        sp, fa2, fs3
                  sub          a7, s3, gp
                  fsub.s       fs8, fs2, fa6, rdn
                  srai         s2, s7, 7
                  feq.s        ra, fa7, ft7
                  fcvt.s.w     fa2, s5, rne
                  sltu         s5, a0, tp
                  fsqrt.s      fs7, fa5, rne
                  divu         ra, s7, sp
                  andi         a0, s6, 1628
                  fmax.s       ft8, ft2, fs9
                  fcvt.w.s     s11, fs4
                  nop
                  lui          gp, 498716
                  fadd.s       fa7, ft11, fa1
                  and          s10, s1, a6
                  fcvt.wu.s    zero, fa3
                  srli         a6, a4, 29
                  slt          s4, s6, ra
                  fsgnjx.s     ft1, ft2, fa3
                  fmax.s       fs5, fa2, fa3
                  fadd.s       fa6, ft0, fs10
                  xori         s2, a4, -1069
                  mul          s3, t3, s3
                  xori         a7, gp, 1902
                  xor          t3, t6, s9
                  mulh         t5, a7, a0
                  mulh         tp, t3, s4
                  fcvt.s.w     fs2, sp
                  mulh         a1, a6, t1
                  auipc        t3, 60256
                  divu         s10, a2, a5
                  remu         sp, t0, ra
                  sll          t0, s0, a4
                  sll          gp, t5, t0
                  slti         s4, s10, 964
                  fsqrt.s      fa1, fs1
                  slt          gp, t0, a0
                  slli         a0, ra, 0
                  nop
                  fle.s        s2, fs4, fa7
                  fle.s        a1, fa1, ft5
                  fmul.s       fs0, ft0, fa0
                  sub          gp, s1, t4
                  divu         t2, s4, t5
                  srai         a5, t6, 5
                  sub          a6, t3, s1
                  mulh         a7, sp, a4
                  ori          t3, a7, -976
                  addi         t6, s11, -944
                  srl          t3, a6, a4
                  fmv.x.w      a6, fs7
                  fle.s        t6, fs3, ft5
                  fadd.s       fs11, fa7, ft1, rdn
                  sltiu        t3, t0, -1252
                  fsgnjx.s     fa3, ft6, ft0
                  fsgnj.s      fs10, fa6, ft7
                  fcvt.w.s     a6, fa4
                  andi         t6, gp, 2010
                  sll          t4, s0, ra
                  or           s4, s4, a1
                  andi         t3, tp, 1716
                  fcvt.wu.s    t1, fs0
                  ori          s7, s5, 241
                  sltu         s10, s7, a0
                  fcvt.s.w     ft0, s10
                  auipc        s0, 32900
                  ori          zero, a4, -937
                  nop
                  auipc        a6, 191968
                  srl          s6, a7, a1
                  fsqrt.s      fs1, ft9
                  fmin.s       ft3, fs10, ft8
                  divu         t1, tp, a2
                  feq.s        t2, fs4, ft0
                  fmv.x.w      s11, fs10
                  fcvt.s.wu    fs6, a0
                  mulhsu       s4, t5, a2
                  feq.s        t3, ft7, fs11
                  andi         a0, s4, -1127
                  fcvt.w.s     t4, fs4
                  fcvt.s.w     fs3, a0, rtz
                  flt.s        sp, fs8, fa4
                  or           a2, s3, a6
                  xor          a7, t1, a0
                  slli         t6, t3, 27
                  nop
                  mulhsu       ra, sp, a5
                  andi         s7, a1, 1366
                  slli         s2, s10, 4
                  sub          a2, s5, a4
                  add          a2, s2, s3
                  auipc        a7, 576583
                  nop
                  mulhu        s0, s6, a4
                  fmv.w.x      fa3, s7
                  add          tp, a6, sp
                  mulhsu       t5, t6, zero
                  fcvt.w.s     a3, ft10, rne
                  sub          t3, t0, t1
                  fsgnjn.s     fa4, fs8, fa4
                  mulh         t1, a4, s0
                  slli         s2, s5, 0
                  remu         s5, s8, s8
                  slti         a6, ra, 1208
                  lui          t1, 184828
                  fdiv.s       fs4, ft2, fa3, rmm
                  fmv.x.w      tp, fa2
                  mul          t3, t2, a0
                  sra          t2, s2, s0
                  mulhsu       t4, tp, t6
                  slli         a6, t4, 13
                  sll          a0, s3, zero
                  fmax.s       fs11, ft5, ft9
                  fle.s        a0, fs7, fa3
                  ori          gp, t1, -973
                  fmv.w.x      ft0, a2
                  fdiv.s       ft7, ft5, ft1
                  sltu         s10, t4, a2
                  sra          s2, t2, a5
                  sra          t4, s4, t1
                  fmv.x.w      ra, fa0
                  xori         ra, t1, -1741
                  fsgnj.s      ft11, fs9, fs8
                  sub          t3, gp, s11
                  or           zero, s0, s6
                  xori         a1, s4, 710
                  and          a1, s1, t2
                  fadd.s       fa4, fa7, fs9
                  fadd.s       fa2, ft1, fs5
                  fdiv.s       ft2, ft3, fa7
                  divu         gp, s3, a6
                  remu         a5, zero, s9
                  sltu         s10, s0, t0
                  fle.s        s4, fa7, ft2
                  fle.s        t0, ft8, fs10
                  ori          t5, sp, -1196
                  nop
                  xori         t0, tp, 1669
                  remu         a3, t4, ra
                  fcvt.s.w     fs10, t4, rmm
                  auipc        gp, 156713
                  lui          ra, 247902
                  auipc        t5, 706007
                  divu         sp, t1, ra
                  or           gp, t3, s9
                  xor          t5, s11, s3
                  addi         a0, a0, 91
                  mulhsu       a4, a3, sp
                  fadd.s       fs6, fa7, ft9
                  divu         s3, a4, gp
                  rem          a4, s2, a7
                  xor          a2, t6, gp
                  mulhsu       zero, s1, t0
                  xor          s2, t0, s11
                  slli         t6, a1, 13
                  srli         a5, s4, 3
                  srli         t3, s10, 21
                  fdiv.s       ft5, ft2, fa0
                  fmv.w.x      fs9, a2
                  fmax.s       fa2, fa5, fs1
                  addi         s3, s0, -1781
                  fmin.s       fs1, fs4, fs11
                  andi         s6, t1, -206
                  nop
                  or           t5, s1, a4
                  fle.s        s11, ft4, ft10
                  andi         s6, s8, 1563
                  sll          t6, s0, t1
                  fcvt.s.w     fs3, a5, rmm
                  and          ra, s5, s3
                  addi         a4, t6, 1513
                  srai         s3, a1, 9
                  sltiu        s4, a1, 1030
                  feq.s        a1, fa5, ft1
                  mul          t3, a4, s2
                  fmin.s       fs5, ft8, fa3
                  fclass.s     a4, ft10
                  slt          t6, s1, ra
                  slt          sp, a2, s6
                  rem          a2, t1, a2
                  sltiu        a3, s9, 926
                  sltiu        t0, a6, -83
                  ori          t3, tp, 262
                  slti         tp, s10, -339
                  sub          a1, a0, a0
                  sub          zero, a3, s11
                  fsgnjx.s     fa7, fs6, fs2
                  srl          t5, a7, t2
                  fcvt.w.s     s6, fa7
                  fsgnjn.s     fa1, ft1, fa7
                  remu         ra, t6, zero
                  mulhu        s6, s11, a1
                  fsgnj.s      fs6, fs8, ft0
                  fsub.s       fs2, fs11, ft6, rdn
                  fsub.s       fs6, ft8, fs0
                  fcvt.s.wu    fs1, s2
                  mulhu        a6, s3, t4
                  div          a2, zero, s0
                  addi         t0, s0, 1656
                  flt.s        a2, ft4, ft1
                  fcvt.wu.s    a5, fs3, rtz
                  lui          s0, 512874
                  and          s10, s1, a1
                  flt.s        a4, fs9, ft6
                  auipc        t1, 250413
                  fsgnjx.s     fs5, fs6, fs4
                  fmax.s       ft4, fs4, fs4
                  fsgnjx.s     fs5, fa0, fs9
                  or           a3, t4, a5
                  fmv.x.w      zero, fs1
                  xor          zero, t1, s9
                  div          s0, s7, t5
                  lui          s0, 670013
                  xor          s6, s11, s4
                  nop
                  fsgnj.s      ft10, fs0, fa1
                  fmv.w.x      fa0, s5
                  mul          ra, t0, s10
                  rem          s5, t6, t6
                  sltiu        gp, t6, 199
                  sltu         s4, t4, tp
                  nop
                  fmul.s       fs5, ft8, ft2, rmm
                  divu         zero, s3, a5
                  divu         s4, s9, zero
                  fsgnj.s      fa2, ft2, fa2
                  divu         s7, s11, t1
                  add          s10, s5, s10
                  fdiv.s       ft11, fs5, ft9, rtz
                  div          a1, t4, t2
                  add          zero, a0, a2
                  fcvt.s.w     fs0, s7, rup
                  add          a1, s6, t5
                  fadd.s       ft6, ft8, fs0
                  sra          t4, a0, s9
                  fcvt.s.wu    fs3, t4
                  remu         zero, s3, t5
                  fsub.s       fa0, fs11, fa5
                  feq.s        s0, ft7, fs2
                  fmv.w.x      ft1, t1
                  fadd.s       fs8, fs9, fs7
                  fcvt.wu.s    a1, ft6, rmm
                  mulhsu       tp, s9, t1
                  remu         t2, s9, t0
                  divu         s6, ra, s11
                  remu         t5, s7, t1
                  sltu         tp, s5, ra
                  fmax.s       fa3, ft2, fa5
                  sll          t5, s0, s1
                  xori         t5, s3, -761
                  sll          t2, s1, s10
                  div          ra, t2, a1
                  fclass.s     ra, ft6
                  mul          s7, a4, a3
                  mulh         zero, t6, t0
                  fsqrt.s      fa6, ft7
                  div          a1, s1, s11
                  fsgnjn.s     fa6, ft3, fs1
                  fsgnj.s      fs10, fa7, fa4
                  fsgnj.s      fs11, fa0, ft7
                  fmul.s       ft5, fs8, fs2
                  srli         a0, t4, 24
                  fle.s        s5, ft10, ft5
                  feq.s        t4, fa4, ft2
                  fmin.s       fs9, ft9, ft4
                  addi         s4, a2, -1690
                  feq.s        s6, ft11, ft5
                  sltiu        t4, s3, -753
                  flt.s        s11, fs0, fa7
                  mulhu        a6, s0, a7
                  fmul.s       fs8, fs5, fs11, rmm
                  srli         a0, s10, 31
                  fcvt.s.wu    ft8, s5
                  mulh         tp, a0, t1
                  or           s11, a6, a1
                  fmax.s       fs4, ft4, ft3
                  fsgnj.s      fs2, ft2, ft9
                  xor          s4, a3, t6
                  xor          gp, t2, s9
                  fadd.s       fa3, ft3, ft1, rup
                  or           t2, s6, s2
                  and          a2, s10, t6
                  fsgnjn.s     ft0, fs6, fa6
                  divu         a5, t4, ra
                  sll          s7, s11, s10
                  fadd.s       ft1, fs0, ft6
                  mulh         a5, a2, a5
                  srai         t2, s11, 25
                  mulhu        a6, a5, a0
                  fmin.s       fs2, ft2, ft9
                  fclass.s     t2, fa3
                  lui          a6, 338583
                  slli         s7, a4, 8
                  sra          s5, s2, t1
                  xor          a2, s11, s1
                  fcvt.wu.s    s7, fa3
                  fsgnj.s      ft3, ft10, ft6
                  feq.s        t0, fs2, ft3
                  sra          a6, a1, sp
                  addi         t1, s11, 1861
                  divu         t0, t5, zero
                  fle.s        s3, fs9, ft7
                  fdiv.s       fa5, fs7, ft7
                  fmin.s       ft4, fa0, fa6
                  fsqrt.s      ft1, fs11
                  fcvt.wu.s    t6, fa3
                  ori          t3, s7, 170
                  fmv.w.x      fa6, tp
                  lui          s10, 57085
                  lui          s7, 113937
                  fmin.s       ft1, ft10, fa3
                  nop
                  addi         a2, s2, 730
                  slli         a5, t2, 6
                  fmv.w.x      fs10, sp
                  nop
                  auipc        a4, 938944
                  flt.s        t3, fs10, fa6
                  rem          s4, t5, ra
                  fdiv.s       ft5, fs11, fs9
                  div          ra, s8, s8
                  slti         sp, t1, 519
                  xori         s2, s1, 272
                  fsgnjn.s     fs4, ft11, ft11
                  and          a2, zero, s11
                  slli         s0, t1, 12
                  mulh         a3, s10, s9
                  nop
                  slt          t1, tp, ra
                  slli         a1, s2, 14
                  sltu         a2, s3, gp
                  fmv.x.w      t6, fs7
                  div          t0, a2, s6
                  fcvt.s.w     ft9, t1, rmm
                  fcvt.s.wu    ft4, s9
                  addi         s7, a5, -613
                  la x25, test_done
                  jalr x0, x25, 0
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
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_2:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_3:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_4:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_5:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_6:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_7:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_8:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_9:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_10:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_11:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_12:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_13:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_14:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

mmode_intr_vector_15:
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 0x1f
                  beqz x2, 1f
                  j mmode_intr_handler
                  1: la x25, test_done
                  jalr x0, x25, 0

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
                  addi x9, x9, -4
                  sw  x24, (x9)
                  add x24, x9, zero
                  addi x24, x24, -128
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  add x9, x24, zero
                  csrr x2, 0x341 # MEPC
                  csrr x2, 0x342 # MCAUSE
                  li x17, 0x3 # BREAKPOINT
                  beq x2, x17, ebreak_handler
                  li x17, 0x8 # ECALL_UMODE
                  beq x2, x17, ecall_handler
                  li x17, 0x9 # ECALL_SMODE
                  beq x2, x17, ecall_handler
                  li x17, 0xb # ECALL_MMODE
                  beq x2, x17, ecall_handler
                  li x17, 0x1
                  beq x2, x17, instr_fault_handler
                  li x17, 0x5
                  beq x2, x17, load_fault_handler
                  li x17, 0x7
                  beq x2, x17, store_fault_handler
                  li x17, 0xc
                  beq x2, x17, pt_fault_handler
                  li x17, 0xd
                  beq x2, x17, pt_fault_handler
                  li x17, 0xf
                  beq x2, x17, pt_fault_handler
                  li x17, 0x2 # ILLEGAL_INSTRUCTION
                  beq x2, x17, illegal_instr_handler
                  csrr x17, 0x343 # MTVAL
                  1: la x25, test_done
                  jalr x1, x25, 0

ecall_handler:    
                  la x2, _start
                  sw x0, 0(x2)
                  sw x1, 4(x2)
                  sw x2, 8(x2)
                  sw x3, 12(x2)
                  sw x4, 16(x2)
                  sw x5, 20(x2)
                  sw x6, 24(x2)
                  sw x7, 28(x2)
                  sw x8, 32(x2)
                  sw x9, 36(x2)
                  sw x10, 40(x2)
                  sw x11, 44(x2)
                  sw x12, 48(x2)
                  sw x13, 52(x2)
                  sw x14, 56(x2)
                  sw x15, 60(x2)
                  sw x16, 64(x2)
                  sw x17, 68(x2)
                  sw x18, 72(x2)
                  sw x19, 76(x2)
                  sw x20, 80(x2)
                  sw x21, 84(x2)
                  sw x22, 88(x2)
                  sw x23, 92(x2)
                  sw x24, 96(x2)
                  sw x25, 100(x2)
                  sw x26, 104(x2)
                  sw x27, 108(x2)
                  sw x28, 112(x2)
                  sw x29, 116(x2)
                  sw x30, 120(x2)
                  sw x31, 124(x2)
                  la x25, write_tohost
                  jalr x0, x25, 0

instr_fault_handler:
                  add x24, x9, zero
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 128
                  add x9, x24, zero
                  lw  x24, (x9)
                  addi x9, x9, 4
                  mret

load_fault_handler:
                  add x24, x9, zero
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 128
                  add x9, x24, zero
                  lw  x24, (x9)
                  addi x9, x9, 4
                  mret

store_fault_handler:
                  add x24, x9, zero
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 128
                  add x9, x24, zero
                  lw  x24, (x9)
                  addi x9, x9, 4
                  mret

ebreak_handler:   
                  csrr  x2, 0x341
                  addi  x2, x2, 4
                  csrw  0x341, x2
                  add x24, x9, zero
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 128
                  add x9, x24, zero
                  lw  x24, (x9)
                  addi x9, x9, 4
                  mret

illegal_instr_handler:
                  csrr  x2, 0x341
                  addi  x2, x2, 4
                  csrw  0x341, x2
                  add x24, x9, zero
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 128
                  add x9, x24, zero
                  lw  x24, (x9)
                  addi x9, x9, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x2, 0x300 # MSTATUS;
                  csrr  x2, 0x304 # MIE;
                  csrr  x2, 0x344 # MIP;
                  csrrc x2, 0x344, x2 # MIP;
                  add x24, x9, zero
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 128
                  add x9, x24, zero
                  lw  x24, (x9)
                  addi x9, x9, 4
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
