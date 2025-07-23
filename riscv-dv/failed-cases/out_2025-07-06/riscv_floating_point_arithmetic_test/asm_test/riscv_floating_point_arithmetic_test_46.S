.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x28, h0_start
jalr x0, x28, 0
h0_start:
                  li x14, 0x40001120
                  csrw 0x301, x14
kernel_sp:        
                  la x25, kernel_stack_end

trap_vec_init:    
                  la x14, mtvec_handler
                  ori x14, x14, 1
                  csrw 0x305, x14 # MTVEC

mepc_setup:       
                  la x14, init
                  csrw 0x341, x14

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x14, 0x3800
                  csrw 0x300, x14 # MSTATUS
                  li x14, 0x0
                  csrw 0x304, x14 # MIE
                  mret
init:             
                  li x14, 2139095041
                  fmv.w.x f0, x14
                  li x14, 2143289344
                  fmv.w.x f1, x14
                  li x14, 2143289344
                  fmv.w.x f2, x14
                  li x14, 2139095040
                  fmv.w.x f3, x14
                  li x14, 2139095039
                  fmv.w.x f4, x14
                  li x14, 4286578687
                  fmv.w.x f5, x14
                  li x14, 2186938967
                  fmv.w.x f6, x14
                  li x14, 2139095041
                  fmv.w.x f7, x14
                  li x14, 2147483648
                  fmv.w.x f8, x14
                  li x14, 2139095041
                  fmv.w.x f9, x14
                  li x14, 1080438
                  fmv.w.x f10, x14
                  li x14, 4286578687
                  fmv.w.x f11, x14
                  li x14, 2139095040
                  fmv.w.x f12, x14
                  li x14, 2148869177
                  fmv.w.x f13, x14
                  li x14, 3942162899
                  fmv.w.x f14, x14
                  li x14, 0
                  fmv.w.x f15, x14
                  li x14, 2153282567
                  fmv.w.x f16, x14
                  li x14, 4171509528
                  fmv.w.x f17, x14
                  li x14, 2149250227
                  fmv.w.x f18, x14
                  li x14, 2147483648
                  fmv.w.x f19, x14
                  li x14, 2704497676
                  fmv.w.x f20, x14
                  li x14, 0
                  fmv.w.x f21, x14
                  li x14, 0
                  fmv.w.x f22, x14
                  li x14, 0
                  fmv.w.x f23, x14
                  li x14, 2139095040
                  fmv.w.x f24, x14
                  li x14, 4286578687
                  fmv.w.x f25, x14
                  li x14, 2143289344
                  fmv.w.x f26, x14
                  li x14, 2189707543
                  fmv.w.x f27, x14
                  li x14, 2143289344
                  fmv.w.x f28, x14
                  li x14, 0
                  fmv.w.x f29, x14
                  li x14, 2139095039
                  fmv.w.x f30, x14
                  li x14, 2139095041
                  fmv.w.x f31, x14
                  fsrmi 3
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0xa
                  li x3, 0x8566d92a
                  li x4, 0xe6435d22
                  li x5, 0xfa19fa60
                  li x6, 0x8f648609
                  li x7, 0xf8fc2d08
                  li x8, 0xf8d1526a
                  li x9, 0xf4a46cb6
                  li x10, 0x0
                  li x11, 0xd
                  li x12, 0x80000000
                  li x13, 0x80000000
                  li x14, 0xf27d4e40
                  li x15, 0x80000000
                  li x16, 0x80000000
                  li x17, 0x768c2f01
                  li x18, 0x0
                  li x19, 0x0
                  li x20, 0x0
                  li x21, 0xfddb0dca
                  li x22, 0x9
                  li x24, 0x7de626da
                  li x26, 0x80000000
                  li x27, 0xf55813a5
                  li x28, 0xfdfbc4d0
                  li x29, 0x7d848c79
                  li x30, 0x0
                  li x31, 0x80000000
                  la x23, user_stack_end
main:             fsqrt.s      fs8, fs9, rne
                  xori         a6, t5, -286
                  div          s6, zero, s10
                  fsgnjx.s     fa1, ft10, fs2
                  fsgnjn.s     fs5, fa0, fa1
                  fsgnjx.s     fs4, fa2, fs6
                  rem          s5, s7, t5
                  rem          s5, s0, s4
                  ori          a4, a0, -1613
                  slt          s4, s8, s10
                  sub          gp, a3, a2
                  divu         zero, s2, s4
                  fsgnjx.s     ft7, fs4, fs8
                  xori         a7, t5, -755
                  sltu         s0, s1, tp
                  xori         s4, a6, -1498
                  slti         s10, s3, 168
                  fcvt.wu.s    gp, fs5
                  mulhu        s2, ra, a7
                  fcvt.s.wu    fs9, ra
                  rem          ra, tp, a1
                  mulhsu       t1, s5, s8
                  auipc        a0, 298670
                  feq.s        s6, ft10, ft1
                  fmin.s       fs6, fa2, ft6
                  flt.s        t6, fs5, fs4
                  slt          ra, s8, gp
                  feq.s        s0, fa6, fs1
                  addi         t4, gp, -1158
                  fmax.s       ft11, fs0, ft4
                  fmv.w.x      fs4, a4
                  fmin.s       fs7, fs7, fa3
                  remu         s3, sp, a1
                  fmax.s       ft9, fs2, ft2
                  add          s10, t1, s2
                  add          a1, gp, s1
                  fsgnjx.s     ft2, fs2, fs1
                  feq.s        t1, fs6, ft3
                  mul          t4, s3, s8
                  fsgnjx.s     fs1, fs5, ft10
                  andi         t5, tp, -1032
                  feq.s        s5, fs0, ft8
                  sll          a0, a7, s0
                  fdiv.s       fs2, ft5, ft5, rmm
                  sltu         s0, a7, s3
                  sltiu        a2, t4, -1280
                  sltu         a5, s11, a6
                  div          tp, t0, s11
                  mulhsu       a3, a2, a5
                  flt.s        t4, fs9, fs10
                  divu         a5, t1, tp
                  srl          s5, s4, a5
                  sra          s4, sp, a2
                  flt.s        s0, fs7, fa6
                  fmin.s       fs10, fa2, fs2
                  fcvt.w.s     s8, fa3
                  fmv.w.x      fs9, s5
                  fsgnjx.s     ft3, ft7, ft1
                  add          a2, s6, t1
                  mulhu        t4, t4, tp
                  fsqrt.s      fs1, fa3
                  fcvt.wu.s    t1, fs11, rdn
                  fle.s        a3, ft10, ft5
                  feq.s        s4, ft8, fs1
                  fcvt.s.w     fa6, sp, rne
                  srli         a0, s2, 8
                  ori          s5, s7, 170
                  fle.s        s4, ft5, fs10
                  fcvt.wu.s    t6, fs7
                  add          a6, a4, zero
                  srl          s3, a1, s5
                  srai         a2, s6, 0
                  remu         s8, t4, s8
                  andi         t4, s6, -592
                  slti         a7, s0, 652
                  slli         t1, s10, 24
                  mul          a6, s3, a1
                  slti         s4, gp, 665
                  ori          t5, s9, 727
                  fmax.s       ft11, ft7, fs3
                  auipc        s2, 572866
                  remu         sp, sp, gp
                  fmin.s       fs7, ft11, ft6
                  xori         a0, s5, -937
                  srl          s10, s11, a2
                  mul          t4, s6, t0
                  srli         s0, sp, 20
                  sltu         a6, tp, a7
                  divu         s0, s8, a3
                  sltiu        s0, tp, 60
                  fmax.s       fs1, fs8, fa3
                  slt          a7, s8, t0
                  slt          a0, t6, a7
                  sltu         t1, s10, s4
                  xori         s4, s3, 1689
                  xori         s6, t6, -918
                  auipc        t1, 294723
                  srl          t0, a1, s7
                  xor          t2, ra, a0
                  fsub.s       ft5, ft7, fs6
                  fsgnjn.s     fs1, ft9, ft0
                  addi         a4, s2, 755
                  sra          s4, a0, s9
                  fcvt.wu.s    a0, fs8
                  remu         t6, a7, t1
                  srli         a0, t6, 10
                  mulhu        sp, s4, a0
                  fmul.s       fs5, ft11, fs3, rup
                  ori          s11, a4, -1613
                  andi         gp, t3, -1984
                  fcvt.s.w     fs8, zero
                  mul          s1, a7, s10
                  fsgnjn.s     fs7, ft4, ft4
                  ori          s3, s5, -802
                  feq.s        a3, fs7, fa7
                  sub          s8, ra, a0
                  div          s1, s3, a5
                  fadd.s       fs7, fa6, fa7
                  slt          s0, tp, t1
                  and          s10, s1, t6
                  slli         t6, sp, 3
                  fle.s        s1, ft8, fs6
                  fle.s        t6, fs8, ft1
                  srl          s8, s1, gp
                  ori          s5, s11, 231
                  lui          t0, 916097
                  slt          a5, t5, a7
                  fle.s        s0, fs5, fs5
                  fmv.x.w      s11, fs10
                  fcvt.s.wu    fa5, zero
                  fcvt.wu.s    ra, ft11
                  fsqrt.s      fa5, ft8, rdn
                  fsub.s       fs8, fs6, fa4
                  xori         zero, s3, -1197
                  divu         ra, a3, a7
                  mul          t1, sp, a0
                  addi         s6, s11, 28
                  fclass.s     s2, ft0
                  mul          s0, a3, ra
                  fcvt.s.w     fs6, t4, rtz
                  or           t6, s9, s11
                  fcvt.w.s     s4, ft11
                  addi         t5, s5, 251
                  rem          ra, s11, a6
                  fdiv.s       fs11, ft9, ft7
                  div          a0, a1, gp
                  fclass.s     sp, fa1
                  fcvt.s.wu    ft1, tp
                  fmin.s       fa3, fs10, fs9
                  nop
                  srl          t4, t5, a5
                  mul          a4, s6, s7
                  add          a5, s6, a4
                  fmul.s       fs6, fs3, ft9
                  sub          tp, t4, s5
                  fsgnj.s      fs7, fs1, fs0
                  fmv.w.x      fa6, s1
                  add          s8, sp, t6
                  sub          t0, s10, s1
                  fmin.s       ft11, fa7, fs0
                  lui          t2, 366921
                  fcvt.wu.s    a5, fa5, rup
                  fsub.s       ft1, fs3, ft1
                  fsgnj.s      fs11, ft1, fa0
                  fsqrt.s      fa5, fa0
                  rem          s2, s6, s10
                  slt          t2, s8, t6
                  fmin.s       fs0, fa4, ft8
                  feq.s        a7, fs8, ft7
                  fsgnjx.s     ft9, fs3, ft11
                  fcvt.w.s     t4, ft2
                  feq.s        a7, ft7, fs6
                  fle.s        a7, ft7, fs1
                  andi         tp, s7, 628
                  srl          sp, a0, t0
                  fadd.s       ft6, fs6, fs7, rdn
                  fsqrt.s      ft7, fs2, rne
                  fcvt.s.wu    fs1, s8, rmm
                  fdiv.s       fa2, fa5, fs4, rdn
                  fcvt.wu.s    s5, fa0, rne
                  addi         zero, t2, -651
                  fclass.s     t2, fs7
                  slt          t2, t5, a1
                  nop
                  srli         s10, a1, 18
                  fcvt.s.wu    fs8, s11
                  sltiu        s10, zero, 1471
                  remu         t2, s4, s7
                  mulhsu       zero, a4, s2
                  fcvt.w.s     s8, fa4, rtz
                  sll          tp, tp, t1
                  divu         tp, a2, s10
                  mulhu        a3, gp, t4
                  fsgnj.s      fa0, fs6, fs8
                  rem          t1, a6, t6
                  mulh         a3, a7, t3
                  fcvt.wu.s    s8, fa4, rup
                  mulhu        a1, t0, ra
                  fsub.s       ft2, ft6, fs11
                  fmv.x.w      s5, fs6
                  sll          s6, t5, s3
                  lui          t2, 326371
                  fle.s        s3, fa7, fa0
                  fcvt.wu.s    t4, ft4, rmm
                  lui          t4, 794442
                  fsgnjx.s     fs3, fa0, fa7
                  fsub.s       fa7, ft8, ft8
                  rem          a5, zero, a3
                  sltu         a2, s2, t4
                  fadd.s       ft10, ft8, fs5
                  divu         sp, t6, s7
                  srai         a5, a0, 26
                  fsqrt.s      ft0, fa2, rmm
                  srli         a6, a5, 0
                  fcvt.w.s     t4, ft8, rup
                  andi         gp, s5, 194
                  mul          a6, s0, t1
                  fclass.s     a5, fs8
                  fsgnjx.s     ft0, fs1, fs7
                  mulh         a0, gp, s5
                  mul          t5, a0, s10
                  add          s11, t2, a1
                  fcvt.wu.s    s1, fs2, rdn
                  or           s3, s8, tp
                  divu         ra, t1, s11
                  fle.s        a5, ft11, fs3
                  ori          s8, s10, 2030
                  add          a1, s8, a5
                  slt          s1, s4, t1
                  rem          a7, s6, zero
                  addi         a4, s11, 1244
                  sll          t1, gp, a1
                  sub          sp, s11, ra
                  div          a3, t4, a1
                  fcvt.s.wu    fs9, a3, rdn
                  fsqrt.s      fa5, ft7, rtz
                  fsgnjn.s     fs9, ft2, fs0
                  or           ra, a6, s2
                  divu         a7, s1, a5
                  fle.s        a6, ft2, ft1
                  fmax.s       fa7, ft4, fa0
                  xori         a4, s2, -931
                  fmul.s       ft8, ft8, fs6
                  fmul.s       fs1, fs4, fs3, rdn
                  slli         t4, t6, 27
                  fle.s        t1, ft0, ft0
                  sltu         t6, a1, s2
                  remu         s5, s1, t4
                  mul          a3, s7, s11
                  fsub.s       fa5, fa3, ft4
                  andi         a6, t5, -1178
                  fsgnjn.s     fs6, fa5, ft7
                  addi         t6, zero, 1848
                  fmin.s       fa0, fs9, fs5
                  fcvt.wu.s    s5, fs9
                  auipc        t6, 714705
                  fsgnjx.s     ft6, ft1, ft0
                  fcvt.s.wu    fs2, s9
                  ori          a5, s4, 118
                  sll          s0, t0, s4
                  nop
                  and          a1, s11, a1
                  ori          a6, zero, -46
                  slli         a0, s9, 26
                  srl          s3, s5, s11
                  fle.s        sp, ft2, ft8
                  rem          a7, t4, sp
                  ori          t6, a7, 240
                  fmv.x.w      s0, fa6
                  add          a3, tp, t5
                  or           t0, a5, t6
                  sll          t2, t6, s10
                  mulhu        s4, t2, gp
                  fsqrt.s      fa1, fs4
                  sll          a6, s2, ra
                  and          s8, s9, s11
                  fsqrt.s      fa2, ft9
                  fcvt.wu.s    ra, ft11, rtz
                  srli         s11, a3, 28
                  slli         a7, s10, 2
                  fadd.s       fa7, fa1, fs11
                  auipc        s3, 588948
                  mulh         s3, a5, ra
                  mul          tp, s0, a2
                  rem          t4, s0, t6
                  sltu         t0, t5, s5
                  and          sp, s8, t4
                  mulhu        s8, s9, ra
                  fsub.s       fs7, fs1, fs10
                  fcvt.w.s     a4, fs1, rdn
                  mulhsu       s10, t1, a5
                  fadd.s       fa6, ft3, fa1
                  fsub.s       fs1, ft4, fs2, rup
                  xori         t6, a6, -1405
                  divu         s2, s6, a6
                  fle.s        s0, fs8, ft10
                  sub          a2, tp, s4
                  fclass.s     s0, ft8
                  sltu         t5, t0, a0
                  div          a3, sp, t4
                  fsgnjx.s     fs1, fa4, fs8
                  fmin.s       ft7, fa2, ft7
                  or           s6, a4, sp
                  and          s10, s8, t1
                  mulhu        s3, t0, a2
                  fcvt.s.wu    fa1, s7
                  fsgnjx.s     fa2, fs0, ft10
                  flt.s        tp, fa6, fs9
                  rem          a1, ra, sp
                  add          t1, a3, s0
                  fsgnjn.s     fa0, ft0, fa0
                  fmul.s       ft5, fa4, ft10, rup
                  fle.s        ra, fs4, fa0
                  divu         t2, s10, s11
                  fmax.s       fa6, ft3, ft0
                  fmv.w.x      fa4, a3
                  srl          a0, t5, s2
                  fcvt.s.w     fs0, zero
                  srai         gp, a7, 3
                  rem          a4, a6, s1
                  fdiv.s       ft6, fa1, ft5
                  rem          s1, a5, t1
                  sltiu        t2, sp, 389
                  fmv.w.x      fa1, t0
                  fcvt.w.s     s3, fs2
                  slli         a2, a5, 27
                  auipc        s6, 876384
                  fcvt.s.wu    fs7, gp, rmm
                  fmv.w.x      fa2, t2
                  sra          s6, s0, t2
                  add          a1, tp, t5
                  slli         ra, s6, 1
                  or           a2, t3, s5
                  mulhu        a4, a3, t6
                  fcvt.wu.s    t1, fa4
                  fclass.s     a0, ft5
                  sra          zero, gp, a0
                  lui          zero, 387692
                  slti         s10, s9, 1893
                  fmax.s       ft2, ft8, ft0
                  fsqrt.s      fa0, ft1, rmm
                  nop
                  auipc        ra, 492038
                  srl          a5, a6, t5
                  div          s10, s8, s11
                  fsgnj.s      ft8, fs11, ft0
                  andi         s0, s6, 1224
                  fcvt.w.s     a5, fa7
                  fsqrt.s      fs7, ft4, rmm
                  fadd.s       fa4, fs11, fs7
                  fdiv.s       ft2, fa7, fs8
                  fsub.s       ft9, fa7, fs5
                  ori          s6, s4, -492
                  slt          a5, a5, a0
                  sra          a6, s9, t0
                  nop
                  fmv.x.w      a5, ft1
                  xor          a5, s0, s5
                  and          t5, t6, a5
                  fclass.s     t4, fa4
                  auipc        s1, 805378
                  fmin.s       fs7, fs6, fa1
                  and          s8, s7, s4
                  remu         a5, a3, a4
                  fmin.s       fa0, fs2, fs10
                  fmv.x.w      s1, fs1
                  sll          a4, s2, t2
                  fsub.s       ft4, fa2, fs11, rtz
                  fle.s        a3, ft7, ft5
                  andi         a5, gp, 703
                  slti         a7, s4, 1221
                  slt          s8, s2, t1
                  fdiv.s       ft2, fa6, fs6, rdn
                  and          t4, sp, sp
                  fmv.w.x      fa2, a7
                  slt          a2, t4, s8
                  mulh         s8, t6, a5
                  fcvt.s.wu    fa7, zero, rne
                  and          t6, t0, a0
                  ori          a4, s3, 572
                  div          s5, zero, s5
                  sub          t4, ra, a3
                  slt          ra, t3, a6
                  fcvt.s.w     fs5, s0, rne
                  mulh         t2, t0, a7
                  slli         t2, a7, 18
                  sll          s4, s10, a7
                  sll          a7, t1, a4
                  flt.s        t6, fs7, ft4
                  fsqrt.s      ft0, fs11, rdn
                  ori          tp, tp, 1006
                  fsgnjx.s     ft1, ft5, fs8
                  rem          a1, a7, tp
                  feq.s        sp, ft0, fa6
                  remu         t1, gp, tp
                  fle.s        tp, fs2, ft0
                  mulh         a5, s11, t0
                  feq.s        t5, fs6, fa7
                  xor          a4, sp, gp
                  and          a7, a5, ra
                  div          a1, t5, a1
                  andi         sp, s0, -1449
                  fsgnjx.s     ft0, ft8, fs1
                  slt          a5, s5, a4
                  sltiu        s8, t1, -1088
                  addi         s8, s4, 1481
                  and          t2, s4, t6
                  mulh         s11, a7, s0
                  mul          s3, s6, a6
                  sltiu        a5, s2, -1942
                  fsub.s       fa6, fs3, fa7
                  fmul.s       fs1, fs7, ft3, rdn
                  andi         s5, s11, -1260
                  sltu         a7, a5, s7
                  fadd.s       ft10, fs10, ft7
                  fclass.s     gp, ft8
                  divu         s1, s5, s7
                  fsqrt.s      fs4, fa0, rdn
                  fmv.w.x      ft9, a1
                  fcvt.s.w     ft10, s2
                  rem          t6, s7, t4
                  mulhsu       t1, t4, sp
                  sra          a3, s11, s2
                  fmax.s       ft9, fa4, fs8
                  lui          s1, 913821
                  addi         a4, t6, 152
                  sltu         a7, t3, a0
                  lui          a5, 433206
                  fmv.x.w      a0, fa5
                  fle.s        sp, fa0, fa0
                  fsgnjn.s     fs10, fs6, fs9
                  fcvt.w.s     s1, fa4, rmm
                  slli         s5, ra, 4
                  fadd.s       fs3, ft1, fa7
                  slti         s5, sp, 583
                  fclass.s     s10, fa7
                  fmv.x.w      tp, fa1
                  fdiv.s       fs5, ft5, ft6
                  fsgnjn.s     ft9, fs0, ft11
                  sra          t4, s5, gp
                  flt.s        a7, fa4, fs1
                  fcvt.s.w     fs1, s3
                  fcvt.wu.s    t1, fs4, rtz
                  fclass.s     t0, fa4
                  slli         s3, s3, 6
                  srl          gp, t0, a5
                  fdiv.s       fs2, ft3, ft11
                  remu         a6, sp, t3
                  nop
                  srli         a6, t0, 29
                  slti         a3, ra, 508
                  addi         a6, t2, 387
                  fmax.s       fs3, fs11, fs0
                  andi         a3, t5, -1645
                  fle.s        a4, fs6, ft3
                  fcvt.w.s     s8, fa0
                  div          t6, a2, a7
                  mulhsu       s5, s5, s3
                  and          a5, t5, a0
                  slt          s11, s2, s5
                  slt          a7, s2, a6
                  fadd.s       fa1, fa3, fa4, rtz
                  sltu         gp, a5, a6
                  fle.s        s2, fs10, fa6
                  fmax.s       fa3, ft6, fs10
                  mul          ra, s0, s1
                  fadd.s       fa3, fs9, fs6, rup
                  nop
                  sll          s4, s3, t0
                  rem          t2, tp, a5
                  auipc        s11, 380173
                  fsub.s       ft4, fa3, ft7, rup
                  fdiv.s       fa5, ft10, ft4
                  srl          a2, s3, a0
                  add          s4, s11, s10
                  feq.s        a2, fs7, ft10
                  or           a0, s10, t4
                  remu         a0, s11, s2
                  srl          s0, s10, s6
                  addi         a7, t0, -727
                  fsgnj.s      fa3, fa1, ft6
                  addi         a5, t1, -1575
                  mulhsu       s10, a7, s9
                  fmv.x.w      s6, ft1
                  mulhsu       t2, a7, a5
                  flt.s        s3, fs10, ft1
                  auipc        zero, 404979
                  rem          a2, t5, s10
                  fadd.s       ft9, fs9, fa2
                  sltiu        a1, a2, -1154
                  fclass.s     tp, fs2
                  srai         zero, a4, 29
                  divu         t0, t1, t1
                  flt.s        a0, fa7, ft10
                  rem          s10, a5, t4
                  feq.s        zero, fs4, ft6
                  fsgnj.s      fs9, ft9, fs0
                  mul          t5, t5, a7
                  fcvt.wu.s    a0, ft1
                  srli         sp, s3, 8
                  add          s1, s2, t6
                  sub          gp, s1, s7
                  xor          s6, s4, t1
                  fmv.x.w      tp, ft4
                  mulhu        s6, zero, s3
                  fcvt.w.s     t2, fa6
                  mul          s4, gp, t3
                  div          t1, a5, t6
                  add          t1, a6, s9
                  fmv.x.w      a7, fs10
                  slli         t2, s5, 8
                  fmv.x.w      t4, fs8
                  fmv.w.x      fs11, s10
                  fle.s        t2, fs11, ft11
                  fclass.s     t5, fs7
                  srl          zero, s8, t2
                  and          s6, t4, t1
                  add          sp, a2, s1
                  sub          s1, t0, a2
                  rem          s1, ra, t5
                  fmv.x.w      a6, fa0
                  sub          s6, a6, s2
                  or           t2, a5, s8
                  fcvt.s.wu    fs7, sp, rup
                  srl          t2, t3, a4
                  fmax.s       fa6, fs3, ft3
                  mulh         t0, zero, t4
                  sll          zero, s3, t5
                  mulhsu       tp, t1, t3
                  mulh         s8, s3, ra
                  fsgnj.s      ft9, fa2, ft1
                  flt.s        t5, ft3, ft6
                  slti         t4, t1, -1951
                  slti         s3, s2, -410
                  fle.s        a0, fs2, fa7
                  srl          gp, s10, t2
                  fsqrt.s      fs2, ft5, rdn
                  srl          a5, s6, s9
                  fsub.s       fs2, ft10, ft6, rup
                  fdiv.s       ft5, ft0, fa5, rne
                  fsgnjn.s     ft1, fs3, fa3
                  fcvt.w.s     t4, ft4, rne
                  mulhu        s10, a0, s8
                  fle.s        s0, fs8, ft0
                  fcvt.s.w     fa4, s0
                  andi         a7, t0, 2017
                  slli         s2, t6, 3
                  ori          tp, gp, -1295
                  or           a5, gp, t4
                  fmul.s       ft9, fa6, fa1
                  andi         a5, t5, 572
                  rem          t6, t5, sp
                  slti         t0, s4, 281
                  sltiu        s2, s5, 874
                  fsqrt.s      fs9, ft5, rne
                  auipc        a1, 48858
                  divu         s5, s8, gp
                  sltiu        tp, a7, 946
                  fsqrt.s      ft10, fs4, rtz
                  mulh         tp, s1, s0
                  auipc        gp, 838672
                  fcvt.w.s     sp, fs7, rup
                  feq.s        a6, ft11, fs4
                  slt          s3, s6, s6
                  divu         s0, t6, t5
                  andi         s10, a3, -1297
                  slt          a2, s8, a2
                  fsub.s       fs5, ft0, fs6, rtz
                  slti         s4, s3, -78
                  slti         s1, s0, 958
                  divu         t5, a5, t3
                  fdiv.s       fs5, fa6, ft0
                  auipc        gp, 169397
                  sub          a1, ra, a6
                  div          s2, s1, tp
                  fle.s        a7, ft11, fs4
                  fcvt.wu.s    ra, fs6
                  and          s4, t0, ra
                  addi         a7, s7, -1656
                  rem          sp, s11, s4
                  fcvt.s.w     ft6, ra, rdn
                  feq.s        a4, fs2, ft8
                  fcvt.s.w     fa0, tp, rmm
                  feq.s        a2, ft6, ft6
                  fcvt.w.s     a3, ft4, rdn
                  slt          a3, tp, t2
                  fmv.x.w      a7, fs11
                  xor          s11, t6, s9
                  fsgnj.s      fs1, fa1, ft11
                  sub          t1, a7, s6
                  fle.s        s1, fa4, ft6
                  fcvt.s.wu    fs11, t5
                  slti         s6, s2, -541
                  add          t2, t0, s8
                  fmul.s       ft11, fs6, ft3, rmm
                  div          s2, t0, t3
                  fcvt.w.s     ra, fs3, rdn
                  fmv.w.x      ft5, t2
                  add          gp, a5, gp
                  fdiv.s       fs3, fa4, fs11, rup
                  fsub.s       fs11, fs9, fa3, rmm
                  addi         t2, tp, 936
                  fsgnjx.s     ft4, fs10, ft3
                  sltu         s1, gp, a3
                  rem          zero, ra, s4
                  fsgnjx.s     fs7, fa2, ft10
                  mulhu        a2, t2, s3
                  lui          s4, 502713
                  div          ra, ra, s7
                  sltiu        ra, s2, -355
                  xori         t6, zero, 88
                  fle.s        s1, ft0, fa0
                  mul          a1, t0, s11
                  srli         zero, a7, 29
                  sltiu        zero, s0, 17
                  slli         t5, a2, 30
                  fsgnjn.s     ft8, fa4, fs2
                  and          s4, t4, tp
                  auipc        s1, 562989
                  fcvt.wu.s    s8, ft0, rdn
                  or           t6, a1, s7
                  or           s10, s5, ra
                  mulh         t5, s8, t6
                  sra          s6, t3, s0
                  fmul.s       fs11, fs8, ft10
                  feq.s        gp, fs10, fa7
                  fclass.s     s11, ft4
                  or           a4, s3, s4
                  sra          a5, s9, s7
                  fcvt.w.s     s2, fa4
                  fcvt.s.w     fa2, s10, rup
                  srai         s3, t2, 9
                  fsub.s       fa4, fs9, ft6, rdn
                  srai         t2, a2, 24
                  xori         gp, a7, 1670
                  or           zero, s7, a7
                  or           a0, s3, s2
                  and          t6, zero, s9
                  slt          zero, t0, s9
                  fmin.s       fs1, ft7, ft6
                  fclass.s     a4, fs2
                  fcvt.s.w     fa7, a2, rmm
                  add          gp, a1, s11
                  nop
                  divu         s0, a4, s6
                  fmin.s       fs6, fa3, fs6
                  ori          a6, s1, -1637
                  div          tp, s10, s5
                  srl          t5, a3, a6
                  mul          a6, s7, a3
                  fmax.s       fa3, fa2, fa3
                  xori         s6, t5, -988
                  fmul.s       ft7, ft6, ft3
                  xor          t0, a1, gp
                  remu         t5, a2, a5
                  mul          t0, t6, t6
                  slli         s3, s1, 14
                  fcvt.w.s     a4, ft2, rtz
                  lui          s6, 439427
                  fcvt.w.s     gp, fs11
                  fdiv.s       fs9, ft5, fa0, rup
                  ori          t4, gp, -1489
                  fmv.w.x      fs0, s0
                  rem          t5, s10, t4
                  andi         zero, a4, -1494
                  fsqrt.s      ft0, ft11
                  fcvt.s.wu    ft2, a4, rdn
                  srai         t5, ra, 30
                  slt          t2, a3, s6
                  fadd.s       fa3, ft2, ft11, rmm
                  fsqrt.s      ft10, ft0
                  fmv.w.x      ft8, a3
                  srai         s0, s10, 14
                  srai         sp, a6, 20
                  fcvt.s.wu    ft8, tp
                  ori          t0, a7, -920
                  xori         t5, s3, 940
                  srl          s8, sp, ra
                  xori         s3, s5, 803
                  fcvt.s.w     fa6, s0
                  mul          a7, s4, a1
                  fdiv.s       fs5, ft2, fs11, rmm
                  fsgnjn.s     fs4, ft6, fa4
                  fmul.s       fs9, fa5, ft6, rmm
                  mulhu        a1, s10, t0
                  fmax.s       ft10, fa1, ft0
                  fmv.w.x      ft3, s7
                  fmv.x.w      a1, fs11
                  addi         t1, t3, 353
                  fmv.w.x      fs6, a3
                  fle.s        s3, ft9, fs10
                  fmax.s       fa5, fs9, ft9
                  ori          tp, a6, 1195
                  fsgnjx.s     ft7, fa6, fs4
                  lui          s8, 168606
                  fmin.s       ft5, fa1, fa1
                  srai         a5, sp, 30
                  fsgnjn.s     fs0, fa6, fs9
                  div          s6, s8, t1
                  fcvt.w.s     a3, fa6, rdn
                  nop
                  slt          a6, s9, a2
                  slti         t0, s4, -317
                  fclass.s     s0, fs1
                  srl          s8, s10, s5
                  sra          s6, ra, t1
                  fmin.s       ft0, fs7, ft6
                  mulhu        a1, t6, s9
                  fle.s        a5, ft9, fs0
                  mulh         a4, zero, gp
                  xori         s2, t5, -352
                  srl          t2, a1, gp
                  srl          ra, t1, s8
                  fcvt.w.s     t6, fa5
                  fcvt.wu.s    s3, fs4, rtz
                  mulhu        t2, a5, s4
                  fmv.w.x      fa7, s3
                  fmax.s       fs8, fs11, fs8
                  mulh         sp, t1, a6
                  fcvt.w.s     s10, ft11
                  remu         t6, t6, a2
                  auipc        a1, 57448
                  slli         t1, a4, 8
                  sub          s1, s7, t4
                  fmin.s       ft7, fa3, fa0
                  slti         s0, s8, 367
                  and          s5, t3, s8
                  fmv.w.x      fs1, a0
                  fmv.x.w      t4, ft8
                  fmin.s       ft1, ft9, fs5
                  sll          s10, s3, t2
                  sll          s11, t6, s4
                  remu         a0, s6, t4
                  flt.s        s1, fs7, fs0
                  fcvt.s.wu    fs8, a5, rtz
                  srl          zero, zero, s0
                  sub          a3, ra, s11
                  fmv.w.x      ft11, s0
                  fclass.s     a4, fa5
                  sra          t2, s9, s3
                  rem          t4, a2, t2
                  fmv.w.x      fs9, s3
                  div          a4, a7, t0
                  fcvt.s.wu    ft8, s5
                  fdiv.s       fs3, ft5, ft9, rdn
                  feq.s        t0, fa4, fs7
                  mulh         ra, s11, a0
                  div          ra, s9, s8
                  srli         gp, t1, 5
                  srai         s6, s1, 11
                  slti         s0, t4, 534
                  slti         s8, s6, 1566
                  sub          s10, s1, a7
                  fcvt.s.w     fa3, a4, rup
                  slli         s2, ra, 25
                  fsub.s       fs4, fa1, fs3, rtz
                  fmin.s       fa6, ft11, fa7
                  sub          s1, s2, ra
                  fsgnjx.s     ft3, fs7, ft0
                  fsgnjn.s     fs0, fs9, fs10
                  and          sp, s11, tp
                  fmul.s       fs5, ft6, ft10
                  lui          tp, 803211
                  fmul.s       ft11, fa5, fa1
                  fmv.x.w      s10, fa5
                  slt          a2, s8, a0
                  srl          a1, a0, a6
                  srai         a1, a7, 16
                  mul          s10, t6, sp
                  add          s4, t4, s9
                  feq.s        ra, fa2, ft2
                  fdiv.s       fs11, fa5, fs1
                  fcvt.w.s     s10, fs7, rup
                  fsgnjx.s     ft7, fs10, fs1
                  mulhu        t0, s10, t3
                  andi         a6, s0, 1722
                  fsgnjx.s     fa2, ft6, fa7
                  fcvt.s.w     fa7, s2, rdn
                  fsgnjx.s     ft1, ft1, fs8
                  sll          t0, t4, s0
                  fmul.s       fa3, fs1, fs4, rup
                  fmv.x.w      a1, fs8
                  sll          t5, a3, a3
                  sra          a0, s11, s9
                  fsqrt.s      fa0, ft5
                  mul          s4, t3, sp
                  fsgnjn.s     fa2, ft2, fs0
                  sltu         s3, s10, a2
                  fcvt.s.w     fa2, t4, rup
                  xor          a0, a2, t5
                  fmv.x.w      s0, fa1
                  remu         t1, s6, s11
                  auipc        s2, 524698
                  fmax.s       fs11, fa5, fa4
                  div          t5, s9, a3
                  and          s6, t3, tp
                  fadd.s       fa3, ft10, fs4, rup
                  srl          t0, t2, s0
                  fmax.s       ft4, ft0, ft3
                  addi         t2, s7, -2000
                  addi         s1, s10, 1045
                  addi         t5, a4, -1617
                  fclass.s     a1, fs6
                  sub          s8, ra, tp
                  fle.s        t2, fs4, fs2
                  fcvt.wu.s    s11, fs9
                  xori         s0, s5, 676
                  divu         s2, s0, a3
                  sll          gp, t4, s7
                  sub          t6, gp, s8
                  mulhu        a4, t1, gp
                  fadd.s       ft5, fa0, fa7
                  xori         a3, tp, -1299
                  fcvt.s.w     fa3, a1
                  or           a3, a3, a2
                  fcvt.w.s     s0, ft10, rtz
                  fmv.x.w      ra, fa7
                  rem          ra, a1, a5
                  fadd.s       fs0, fa4, ft4, rtz
                  fsgnjx.s     fs2, ft9, fs0
                  andi         s11, a4, 1699
                  slt          a3, t2, a7
                  fmv.x.w      tp, fa6
                  mul          s6, t1, t5
                  add          s4, a3, a0
                  sltu         t2, zero, t5
                  fcvt.w.s     gp, fa2, rup
                  fclass.s     gp, fa1
                  sltu         a2, ra, s4
                  fmv.x.w      zero, fa0
                  fmul.s       ft5, fs11, fa5
                  andi         gp, t5, 493
                  or           gp, a6, s11
                  fmax.s       ft0, fs7, fs1
                  flt.s        s5, ft7, ft0
                  sltiu        s5, s10, 1156
                  sub          s11, a4, s9
                  slli         s8, t3, 0
                  and          a5, s8, s2
                  fcvt.s.w     fs11, zero
                  fsub.s       ft2, ft6, fs2
                  slli         s6, s3, 11
                  mulh         gp, a0, t6
                  add          t6, a6, a7
                  and          s6, t2, t4
                  fmax.s       fs8, ft2, fa2
                  fmv.w.x      fs11, s8
                  fsgnj.s      ft0, fs4, fa2
                  flt.s        a0, fs6, fs7
                  fmax.s       fs10, ft8, fs2
                  fle.s        sp, fs7, ft3
                  or           ra, t2, a4
                  fle.s        sp, ft4, ft9
                  sltiu        t4, s0, 1849
                  or           a7, s6, s11
                  or           a0, ra, s0
                  fle.s        zero, ft10, fa1
                  sra          t1, t0, a0
                  fdiv.s       fs2, ft3, fa4
                  xor          a2, a4, a5
                  mulhsu       a2, a0, s3
                  fsub.s       fa7, fs2, ft8
                  slti         sp, s4, 1198
                  srli         gp, s1, 30
                  srl          t4, t3, s0
                  fcvt.wu.s    t5, ft0, rne
                  andi         gp, s8, 265
                  fmv.w.x      fa6, s6
                  srli         tp, a7, 26
                  fcvt.wu.s    t4, fa3
                  fle.s        s3, ft5, fs11
                  sltiu        a7, s6, -1148
                  fcvt.s.w     ft1, sp, rne
                  fcvt.s.w     fs6, s5, rdn
                  sltiu        s10, gp, -1465
                  add          a6, t4, s0
                  sltu         t2, s1, s4
                  fmul.s       fs9, fa0, ft1, rtz
                  fmv.x.w      a4, fa2
                  srl          tp, s0, s11
                  fmul.s       ft7, ft7, ft5, rne
                  fsqrt.s      fs5, ft5
                  flt.s        sp, fa0, fa7
                  fmin.s       fa0, fs6, fa0
                  fmv.w.x      fa0, s0
                  fadd.s       fs2, fs7, ft0, rmm
                  flt.s        s6, fs7, fs0
                  sltu         gp, a6, s10
                  sll          s8, s10, zero
                  srai         t0, a4, 25
                  fle.s        zero, ft5, fa5
                  addi         a0, a7, -724
                  fdiv.s       fs1, ft1, fa5
                  addi         a4, s6, 80
                  sltu         s1, t5, a0
                  fmin.s       fs8, fa2, ft8
                  rem          zero, s6, s2
                  srai         s3, t4, 4
                  mulhsu       a5, s1, t3
                  fdiv.s       ft5, fs5, fs1, rup
                  mulhsu       s11, s11, s10
                  slti         t0, tp, -1785
                  mulhsu       t6, a2, a7
                  slt          s2, a0, a2
                  fcvt.s.w     ft11, gp, rmm
                  rem          a4, a7, s5
                  slti         s0, a6, -1326
                  fsqrt.s      fa1, ft1
                  fcvt.w.s     s11, fa0, rmm
                  fsgnjn.s     fa5, fs4, ft9
                  fmax.s       fa4, ft1, fs3
                  fcvt.wu.s    sp, ft4
                  sra          tp, s3, t2
                  srai         a6, a4, 10
                  divu         t4, t2, t1
                  xor          sp, t6, s6
                  flt.s        s5, fa6, ft1
                  slti         s4, s4, 1144
                  andi         a7, s9, 1429
                  remu         s2, s7, s4
                  fsgnjx.s     fa6, ft2, ft5
                  fcvt.w.s     a1, fs9
                  fsub.s       fs3, ft2, ft8, rdn
                  mul          s6, t0, t3
                  divu         s1, t4, t3
                  fle.s        a0, fa0, fa1
                  sub          a6, t2, s1
                  srl          t5, ra, t1
                  feq.s        gp, ft0, fs3
                  sll          ra, s5, s8
                  sra          t1, a6, zero
                  fsgnjx.s     ft4, ft11, fa4
                  fadd.s       fs8, fa0, ft7
                  mulhsu       zero, s8, s7
                  flt.s        s1, fs5, fs10
                  fcvt.s.wu    ft4, s1, rne
                  mul          a0, s0, a5
                  sltu         a1, a6, zero
                  mul          a6, s0, zero
                  fle.s        ra, fa2, fs2
                  or           t6, s3, s5
                  fsqrt.s      fs5, fs5
                  lui          a0, 712244
                  slt          s5, ra, s0
                  ori          sp, a0, -1756
                  srai         a6, s1, 30
                  fcvt.s.w     ft0, s6
                  addi         s0, s8, 2010
                  sltu         s8, s4, s8
                  fadd.s       ft1, ft11, fs10, rne
                  rem          s2, a3, t3
                  fadd.s       ft1, ft7, ft7, rup
                  auipc        s1, 394586
                  fmin.s       fs0, ft0, fs7
                  div          a3, a4, a7
                  fsqrt.s      fa7, fa7, rmm
                  lui          sp, 262039
                  div          gp, t1, sp
                  sub          a7, t1, s5
                  xori         s6, s3, -341
                  fcvt.s.w     fs11, s5
                  feq.s        s11, fa7, ft11
                  sub          s10, t0, a3
                  or           a2, s8, s7
                  and          a7, zero, s9
                  fsgnjx.s     fa1, fs6, fa3
                  mulh         a0, t3, s4
                  slli         tp, a1, 1
                  fsgnjx.s     ft11, fa3, ft8
                  fsqrt.s      fs0, fs9, rmm
                  lui          ra, 552663
                  mulhu        t2, t5, a6
                  mulhsu       s5, s11, s6
                  mulhsu       a2, s10, s3
                  fmax.s       fs3, fa6, fs2
                  feq.s        zero, fa7, ft11
                  fmin.s       fs9, ft1, ft9
                  fdiv.s       fs9, ft3, fs3, rmm
                  auipc        t5, 924547
                  nop
                  fsgnjx.s     fa1, fs6, fs8
                  fcvt.s.wu    fa1, s5, rmm
                  xor          zero, s7, a5
                  fsgnjx.s     fa6, fa0, fa7
                  sub          t6, t6, t4
                  flt.s        s5, fs5, fa2
                  fcvt.s.w     ft3, t5
                  div          s5, a7, tp
                  sltiu        a5, s5, -1684
                  fmin.s       fs0, ft1, fa5
                  fle.s        a7, ft7, fs10
                  feq.s        tp, ft7, fs3
                  mul          a7, s7, s5
                  and          s4, s5, s8
                  flt.s        s1, fa2, ft8
                  slt          a0, a2, a6
                  fclass.s     t4, fa1
                  mulhsu       t2, s9, t2
                  fclass.s     zero, ft10
                  sub          s2, a1, s0
                  slli         s6, s6, 1
                  fsgnjx.s     ft4, fs11, fa0
                  or           t4, a7, sp
                  addi         s4, s2, 175
                  fsgnj.s      fa0, ft7, ft9
                  slt          a0, s4, t0
                  slti         zero, s0, 738
                  fcvt.wu.s    a2, fs9
                  slli         s6, t1, 9
                  xor          s11, s8, s2
                  mulh         zero, t2, t5
                  mulh         tp, sp, s9
                  remu         s8, s9, sp
                  fmin.s       fs2, fa0, ft2
                  mulhu        a7, a0, s9
                  fmv.x.w      a4, ft6
                  fcvt.s.wu    ft10, s7, rmm
                  fmul.s       ft10, ft3, fa4
                  srli         s10, s10, 16
                  andi         t4, tp, 1392
                  fmv.w.x      ft7, t0
                  mulh         a3, a5, t0
                  mulhsu       s6, a5, s4
                  fsgnj.s      ft10, fs8, fa5
                  sltiu        ra, s8, -428
                  andi         a1, s8, -1382
                  auipc        t5, 776040
                  lui          zero, 985647
                  fmv.x.w      s5, ft5
                  div          a3, a6, gp
                  fsgnj.s      fa1, ft9, fa6
                  fmul.s       fs6, fs2, fa7, rup
                  slli         a1, s10, 16
                  slti         s3, a1, -1142
                  feq.s        ra, ft0, fs7
                  rem          s3, s0, a2
                  div          s5, a6, tp
                  fcvt.s.w     fs4, t1, rmm
                  andi         s0, t6, -1209
                  div          a7, zero, a5
                  fmv.x.w      sp, fs4
                  lui          t4, 71300
                  fsgnjx.s     fa2, ft11, ft9
                  feq.s        t0, fs0, ft6
                  fsqrt.s      ft11, fa1
                  rem          a4, t4, s6
                  addi         a5, gp, -1571
                  fle.s        a5, fs0, ft6
                  remu         a5, gp, s6
                  srai         t2, s6, 7
                  lui          t5, 261204
                  flt.s        ra, fs7, ft8
                  slli         s10, s8, 7
                  sub          ra, s11, sp
                  auipc        a4, 748631
                  fsqrt.s      fa0, fs4, rne
                  slt          s10, a3, s11
                  fsgnjn.s     ft0, ft0, fs5
                  and          zero, s4, sp
                  sltu         s3, a6, t0
                  ori          s5, s10, -1558
                  sra          zero, a7, s11
                  ori          sp, s7, -572
                  mul          t5, tp, tp
                  ori          t2, gp, -545
                  fsqrt.s      ft4, fs0
                  fmin.s       fa6, ft10, ft6
                  rem          s1, s11, s7
                  auipc        s2, 91577
                  nop
                  fclass.s     s5, fs7
                  sra          zero, s0, s6
                  auipc        t6, 402939
                  sra          ra, sp, a0
                  fmv.x.w      t2, fs10
                  fcvt.wu.s    a1, fs2, rup
                  srl          s0, t6, s1
                  srai         ra, s10, 23
                  fcvt.w.s     t2, fs0
                  and          t4, s5, s9
                  lui          ra, 555937
                  mul          t5, s6, s1
                  mulhsu       s0, s1, gp
                  or           s4, s10, s1
                  fadd.s       fs8, fa7, fa5
                  or           a1, a1, sp
                  sub          t2, a6, s4
                  fmv.w.x      ft4, s5
                  srl          s1, t0, tp
                  fmax.s       ft7, fs11, fs3
                  sltu         a2, t1, t1
                  mulh         s11, a1, gp
                  fsqrt.s      fa0, fs3, rne
                  fsqrt.s      ft11, fa0
                  xori         t2, s9, 1083
                  slli         a4, a6, 15
                  fcvt.s.w     fs1, a5
                  ori          t2, t1, -1015
                  nop
                  fclass.s     t2, fa1
                  fsgnjn.s     fa7, fs4, fs6
                  fdiv.s       fs11, ft11, ft2
                  mulhsu       s4, s8, sp
                  add          s1, ra, s6
                  remu         a2, t1, t4
                  add          t2, s1, s7
                  add          s8, t2, s2
                  fcvt.s.wu    fs3, t1
                  nop
                  fmul.s       fs1, fa1, fs1, rmm
                  sll          s3, s3, s9
                  fcvt.wu.s    s0, fs11
                  fcvt.wu.s    a4, ft5, rup
                  addi         s6, s10, 941
                  fsgnjx.s     fa4, ft8, fs11
                  ori          s8, t6, 10
                  fcvt.wu.s    t4, fs4
                  sltu         t1, t4, t5
                  andi         a5, t5, 210
                  mulhu        ra, t1, t0
                  fsub.s       fs4, fs6, fa2, rup
                  mulhsu       a2, s4, s4
                  lui          a7, 1022586
                  slli         s10, a3, 9
                  srai         t0, tp, 21
                  fsgnjn.s     fs10, fs10, ft6
                  fmv.w.x      fs10, tp
                  auipc        t2, 770661
                  mulh         s5, gp, sp
                  divu         sp, s9, t6
                  slti         a1, s8, 1869
                  mulh         tp, a0, t6
                  fle.s        a6, fs0, ft2
                  fmv.x.w      a4, ft8
                  ori          t0, s4, -1807
                  fclass.s     a5, ft2
                  fle.s        a3, fs5, ft0
                  slti         s2, a2, -57
                  fmin.s       fs5, ft5, fs1
                  mul          t1, s4, s11
                  mulhsu       a1, s10, s6
                  fmul.s       fs3, ft0, fa4
                  sra          a7, a7, gp
                  fsub.s       ft4, ft0, fs0, rmm
                  fmin.s       fa6, fa3, fa4
                  mulhsu       zero, t0, s9
                  sll          s4, s7, zero
                  ori          a6, a2, -363
                  fmax.s       fs0, ft10, fs10
                  rem          gp, a4, s10
                  or           s3, a7, a0
                  fsgnjn.s     fs0, fs10, fa0
                  fcvt.s.wu    fa0, s9, rtz
                  fsgnj.s      ft9, ft1, fs9
                  xori         s8, s11, 1743
                  fmax.s       fs1, fa4, fs5
                  div          t4, t6, gp
                  srli         t0, s2, 27
                  addi         s0, t3, -1875
                  fadd.s       fa7, fs8, fs2
                  andi         a5, s3, -706
                  sub          sp, s11, a1
                  addi         s6, a6, -316
                  rem          t0, gp, ra
                  rem          s1, a1, a3
                  fmul.s       fs6, ft6, fs6, rmm
                  fsgnjx.s     fs3, ft10, fa6
                  fclass.s     t6, ft1
                  nop
                  add          gp, tp, s0
                  sll          a3, a6, s8
                  slli         ra, tp, 20
                  auipc        a5, 102811
                  fadd.s       fs8, fs2, ft8, rtz
                  addi         t5, t1, -1124
                  sltiu        s1, sp, 1249
                  sub          a3, tp, a7
                  fmv.x.w      s8, fa1
                  flt.s        t6, ft4, fs4
                  fsgnj.s      fa5, ft7, fs7
                  fmv.w.x      fa7, a2
                  fcvt.w.s     a3, fs4
                  mulh         s2, s0, a2
                  fclass.s     ra, ft3
                  fclass.s     t5, fa3
                  addi         t1, s1, -522
                  flt.s        t2, fs4, ft4
                  andi         ra, t6, 1934
                  feq.s        s8, ft4, fs4
                  fmax.s       fs9, ft10, ft0
                  fmv.w.x      fs8, s3
                  fcvt.s.w     fs7, tp, rup
                  add          t2, sp, sp
                  srai         t2, s4, 20
                  fsgnjn.s     ft9, ft4, fa4
                  fcvt.s.wu    fa2, s8
                  slli         a1, sp, 4
                  sltiu        a3, t4, 1714
                  fmin.s       fa7, fs10, ft4
                  srl          s4, a2, a5
                  fcvt.w.s     s3, fa3
                  fdiv.s       ft2, fs10, fa1
                  srl          a2, ra, zero
                  sltiu        s11, sp, -224
                  slti         s11, t2, -1625
                  flt.s        s4, fs7, fs1
                  fcvt.w.s     s8, ft0, rup
                  feq.s        gp, ft10, ft9
                  or           a0, t1, s0
                  mulhsu       t1, a6, s7
                  and          s3, a0, s0
                  slli         s3, s8, 13
                  fmv.x.w      t0, fa4
                  fcvt.wu.s    a0, fa5
                  fcvt.s.w     fa3, a6, rmm
                  addi         a7, zero, -823
                  xori         t4, sp, -1186
                  fmv.w.x      fs0, s5
                  fmax.s       ft1, fs1, ft3
                  fsgnj.s      fs1, fs7, ft4
                  ori          s0, a5, 1257
                  fadd.s       ft10, ft9, ft1
                  fclass.s     zero, ft11
                  fsqrt.s      fa2, fs0
                  div          a6, t4, s10
                  div          t5, s8, a7
                  fmul.s       fs8, fs9, fs11, rne
                  fle.s        tp, fs6, ft3
                  xori         a0, t2, 982
                  mulhu        a7, sp, a5
                  or           t4, t2, tp
                  feq.s        s5, ft10, ft11
                  srai         a4, s11, 11
                  fmv.x.w      zero, ft11
                  sltu         a2, sp, a1
                  addi         a6, s8, 1566
                  fsqrt.s      fa1, ft2, rdn
                  add          s4, a0, t1
                  rem          s5, a7, a3
                  slli         t0, zero, 2
                  mulhsu       s10, s7, s4
                  xor          a7, a3, a5
                  ori          s6, t3, 888
                  fclass.s     s2, fa2
                  sll          s11, s3, a6
                  srli         a6, t4, 17
                  or           a4, t4, s9
                  flt.s        s3, ft2, fs8
                  and          a4, gp, a7
                  sltiu        a6, s11, 1242
                  fcvt.s.w     fs7, a5, rdn
                  slt          a7, t1, t6
                  fmv.x.w      t1, fs4
                  slti         a1, tp, -1719
                  div          a3, s1, s7
                  ori          ra, s7, -1933
                  sra          t2, gp, t6
                  ori          sp, s11, -768
                  mulhu        tp, a2, s4
                  slt          gp, a6, t1
                  mulh         t1, a4, s10
                  sub          a1, a0, a6
                  fsgnjx.s     fs4, ft4, ft10
                  slli         a7, s9, 20
                  sll          t2, t2, s5
                  slli         sp, s11, 21
                  divu         a2, a1, sp
                  fmv.x.w      zero, fs3
                  fcvt.s.wu    ft8, a1, rdn
                  fcvt.s.w     fs6, t4
                  div          t6, a6, t5
                  fclass.s     t6, fs5
                  auipc        t0, 636626
                  lui          a5, 927430
                  slti         s8, sp, 895
                  mul          s2, t5, s9
                  fsqrt.s      ft2, fs10, rdn
                  mulh         a6, a5, t0
                  fcvt.w.s     s8, fs7
                  feq.s        a4, fs2, fs4
                  sltiu        a0, a2, 1353
                  mulh         s1, ra, a1
                  auipc        s3, 1027523
                  feq.s        t2, fs11, fs6
                  mul          a0, s10, a7
                  fsgnjx.s     fa4, ft8, ft2
                  fmul.s       fs8, fs7, fs1, rne
                  fadd.s       fa7, fs10, fs9, rmm
                  srl          tp, s2, t2
                  feq.s        a2, fs6, fa7
                  fmv.x.w      a3, fa4
                  slli         a0, t3, 12
                  fdiv.s       fa6, ft1, fa1, rup
                  fcvt.s.wu    ft1, s6
                  sub          s2, a0, a6
                  nop
                  divu         a5, ra, a0
                  fcvt.wu.s    a1, fa5, rtz
                  fmv.x.w      t2, ft6
                  auipc        tp, 741
                  add          tp, s1, s6
                  sll          s5, s2, s8
                  mulhu        zero, s11, s5
                  fcvt.s.wu    fs2, a6
                  fdiv.s       fa6, fa1, fa2
                  fsqrt.s      ft3, ft0
                  fmin.s       fa6, fs10, fs2
                  and          s3, s0, a6
                  fsgnj.s      fa2, ft2, fa7
                  add          s5, a4, t6
                  slt          s1, a5, ra
                  flt.s        a6, fa6, ft6
                  xor          s10, a1, s11
                  fmax.s       fa0, fa5, fs9
                  nop
                  fdiv.s       ft7, fa0, fs0
                  fsgnjn.s     fs5, ft0, ft8
                  mul          s2, t6, a1
                  sll          t5, t1, a5
                  xori         a4, s9, 270
                  slti         s4, tp, -1632
                  remu         a2, s4, s2
                  fcvt.s.wu    fs5, sp
                  fmul.s       fa4, fa1, fs9, rdn
                  add          a1, s7, s9
                  mulh         s8, a0, t0
                  fcvt.wu.s    a2, fs11, rne
                  fsgnjx.s     ft7, fa2, fs0
                  rem          s4, t6, sp
                  sltu         s4, s5, t5
                  fsqrt.s      fa2, ft9, rmm
                  addi         a2, s10, -284
                  fsgnj.s      fs0, fs3, fs10
                  lui          a4, 150555
                  srli         s5, a1, 6
                  feq.s        t0, fs10, fa7
                  nop
                  fcvt.w.s     tp, fs11, rne
                  nop
                  fle.s        a4, fa4, ft8
                  slti         sp, t3, -1751
                  remu         s4, sp, s9
                  fdiv.s       ft1, fa4, fs10, rtz
                  fmv.w.x      ft8, a2
                  fsgnjx.s     ft6, ft10, fa2
                  fsgnj.s      ft0, ft11, fa2
                  flt.s        s4, ft6, fa6
                  feq.s        s5, fa5, ft5
                  mulh         s0, zero, s4
                  xor          t5, s10, s1
                  xor          sp, s5, t3
                  srl          s8, t2, zero
                  or           t1, a6, a4
                  fle.s        ra, fs5, ft7
                  remu         ra, a3, t2
                  and          t4, zero, s2
                  mulh         ra, s4, a2
                  feq.s        t0, ft8, fa3
                  fcvt.w.s     a3, ft11
                  sltu         a0, a3, t2
                  fmax.s       ft2, ft1, fs6
                  fcvt.wu.s    s0, ft8
                  fcvt.wu.s    s10, fs11
                  mulh         s6, zero, s6
                  and          s2, t5, s6
                  rem          gp, a0, t5
                  fsgnj.s      ft1, fa7, ft7
                  fcvt.wu.s    ra, ft2
                  sra          a2, s8, a5
                  fsqrt.s      ft7, fa7
                  mul          s10, a3, s4
                  mulhu        t0, tp, s2
                  fcvt.wu.s    s1, fs8, rtz
                  flt.s        a7, ft11, ft0
                  slli         a1, sp, 11
                  fle.s        a1, fa5, ft7
                  sra          s5, tp, s2
                  fcvt.w.s     s1, fa4
                  flt.s        a0, fa0, fs0
                  sll          a1, a1, zero
                  fclass.s     a6, ft8
                  slli         a2, t6, 12
                  xori         s5, s3, -937
                  fmax.s       ft0, fs11, ft9
                  fsub.s       fa2, ft10, fs4
                  flt.s        sp, fs1, ft4
                  fcvt.s.wu    ft8, s5, rup
                  fmin.s       ft4, fs1, fs5
                  nop
                  slli         a5, t3, 4
                  xori         a1, gp, -1157
                  fsgnjx.s     ft3, fa5, fs6
                  div          a4, s10, a5
                  div          s1, s10, a4
                  mul          a0, s8, a2
                  mul          a3, a0, s11
                  nop
                  sltu         s4, s8, t5
                  sll          s1, tp, a6
                  fmul.s       fa0, ft2, fa5, rmm
                  fle.s        tp, ft1, fa5
                  andi         s3, s11, 1338
                  slti         a4, a7, -2031
                  slti         s6, zero, 583
                  andi         ra, s11, -1612
                  fsqrt.s      fs8, fa0
                  mulh         t0, ra, gp
                  remu         t4, s9, s4
                  mulhsu       s5, s6, a1
                  srli         t4, s4, 8
                  or           a4, gp, s1
                  ori          s8, s4, -1866
                  fmin.s       fa4, ft9, fs3
                  ori          a0, zero, -1803
                  fcvt.s.w     ft0, a6, rmm
                  fclass.s     a0, fs5
                  slli         t5, a6, 17
                  fcvt.wu.s    s8, ft11
                  slti         s6, s2, 533
                  or           s6, a7, t5
                  mul          s11, a1, gp
                  andi         t4, t2, 1791
                  fcvt.s.wu    fs4, a1
                  rem          ra, s11, s7
                  fmv.x.w      a1, fs11
                  fsgnjx.s     ft0, fs11, fa2
                  rem          zero, s5, s4
                  sltiu        t5, a1, -675
                  srl          t4, s1, s9
                  sltu         s11, s5, s3
                  sltu         s11, tp, a5
                  srli         s5, s10, 25
                  sltiu        s6, zero, -726
                  srl          zero, a1, s8
                  fsgnjn.s     ft4, ft4, fa5
                  sltiu        t0, zero, -1089
                  mulhu        a2, s3, a6
                  mulhsu       ra, a2, a5
                  sltu         ra, t5, s2
                  sub          a4, s8, s1
                  fcvt.wu.s    a0, fs9
                  fle.s        tp, fs0, fa4
                  lui          t1, 435236
                  srli         t0, t0, 4
                  auipc        s5, 565570
                  or           s5, a5, t0
                  slt          t1, s3, ra
                  rem          gp, tp, s5
                  sll          a3, s9, t5
                  andi         a7, s4, 83
                  mulhu        a2, s5, a4
                  fclass.s     s5, ft8
                  mulhsu       s11, t3, s9
                  fcvt.s.wu    ft11, t3
                  xori         a2, s0, 291
                  sltiu        t2, gp, -445
                  fcvt.wu.s    a2, fa7, rup
                  andi         s6, a0, 620
                  xor          s0, t3, s0
                  srli         t1, t5, 4
                  rem          s6, a0, tp
                  fmul.s       fa7, fs7, ft0, rmm
                  mulh         s10, s10, a5
                  srl          s3, t2, t6
                  or           s8, a2, s10
                  or           t2, s10, a2
                  xor          t0, s6, t0
                  mulhsu       tp, t4, s7
                  mulh         gp, a6, t0
                  xori         sp, t0, -1108
                  fsgnjx.s     fa2, fa7, fs6
                  and          a4, s8, zero
                  sra          t5, t2, a4
                  divu         t5, ra, a2
                  or           s8, a4, t4
                  sltiu        s5, t0, 584
                  xor          a3, a0, t3
                  sltiu        a1, s2, -1509
                  fsgnjn.s     fs6, fa0, fs3
                  or           a1, t2, t0
                  fle.s        sp, fs1, ft3
                  srai         s11, t0, 4
                  fcvt.s.wu    fs3, s6, rup
                  rem          s6, s8, a5
                  fsgnjx.s     fa2, ft9, fs10
                  lui          tp, 442310
                  fle.s        s1, ft2, fa1
                  srli         t2, t3, 2
                  auipc        t6, 273922
                  addi         t0, a5, 1466
                  fmul.s       fs3, ft6, ft2
                  fsub.s       ft7, ft5, fs0, rne
                  fsgnjx.s     fa7, ft0, fs3
                  fcvt.s.wu    fs7, ra
                  fmv.w.x      ft9, ra
                  xor          t5, s8, s10
                  fclass.s     gp, fs0
                  fsub.s       ft4, fa7, fs10
                  fmv.w.x      fa4, t2
                  sltiu        s5, a0, 1215
                  xori         t6, s6, -1013
                  slt          a4, s0, ra
                  fsgnjn.s     ft0, ft11, fs5
                  flt.s        a0, ft11, ft11
                  slli         a1, ra, 13
                  sll          tp, s9, t4
                  sra          s8, a2, gp
                  fmv.w.x      fs9, s8
                  mulh         s0, s4, s10
                  fcvt.wu.s    a7, ft10
                  auipc        s8, 452467
                  rem          t4, tp, s11
                  divu         t0, s10, a6
                  auipc        t5, 201198
                  fsgnjx.s     fa4, fs1, ft1
                  xori         zero, s1, 2029
                  xor          s8, s5, s11
                  fsqrt.s      ft2, fa3, rup
                  sub          zero, t6, a3
                  or           t0, s3, a1
                  fsub.s       ft0, fs2, fa7, rtz
                  srli         s11, s3, 17
                  fmul.s       fa4, fs11, fa3
                  or           t4, s0, t5
                  sub          s0, s10, tp
                  sub          ra, t2, tp
                  feq.s        s8, ft0, fs8
                  andi         s11, t1, 542
                  sub          a3, a3, s4
                  fsgnjn.s     fs4, fs8, fa0
                  fmv.x.w      s1, fa0
                  sltiu        s1, tp, -1833
                  slti         t2, tp, -885
                  slt          a2, a1, a6
                  xori         t5, a1, -1652
                  fclass.s     a2, fs1
                  rem          t5, s4, s5
                  add          a3, t0, t5
                  sltu         a2, a6, tp
                  ori          s11, t1, 985
                  flt.s        a5, fs7, ft7
                  andi         s5, gp, -1130
                  lui          t1, 725648
                  slti         t4, gp, -1484
                  and          a5, t0, s9
                  fsqrt.s      fs10, ft3
                  fmv.w.x      ft4, s11
                  fmin.s       fs10, ft11, ft8
                  srli         s5, t5, 20
                  mulh         s2, s1, t1
                  srai         s0, a3, 19
                  fcvt.w.s     a7, ft8
                  or           zero, s2, s11
                  sra          s11, s10, a0
                  fcvt.s.wu    fa3, t6, rne
                  fmin.s       fs6, fs6, fa1
                  slli         a6, t4, 17
                  fsgnjx.s     fa0, fs6, fa5
                  mulhsu       s10, a5, a6
                  fsqrt.s      fa6, fs5, rmm
                  xor          s8, sp, gp
                  fdiv.s       ft5, fs1, ft2
                  fdiv.s       fa1, fa1, ft9
                  sub          t5, tp, a0
                  mul          a5, a2, gp
                  mulhsu       a2, a1, a7
                  sltu         a7, s6, s2
                  fmv.w.x      fa7, a3
                  rem          tp, gp, a1
                  sltiu        t5, gp, -788
                  fcvt.w.s     sp, ft9, rtz
                  add          zero, t6, a5
                  or           sp, t2, s4
                  fmul.s       ft9, fs6, ft2
                  fsqrt.s      fa4, fs3, rmm
                  addi         s11, a7, 1633
                  andi         s2, a3, 342
                  fdiv.s       fs11, ft7, fa1, rmm
                  add          a0, s5, tp
                  fadd.s       fa7, fs2, fs4
                  sub          a4, t6, gp
                  xor          t5, s6, t5
                  fmul.s       ft3, fs9, ft10
                  add          t6, s4, a2
                  fadd.s       fs1, ft4, ft8
                  lui          a2, 230850
                  lui          s6, 48030
                  mulhu        t5, sp, s8
                  or           s0, a3, s4
                  fmv.x.w      a4, fa0
                  fmv.x.w      s8, fa1
                  fsgnj.s      fs7, ft6, ft6
                  srai         sp, ra, 5
                  sra          t0, a3, t3
                  ori          a4, s3, -1102
                  fdiv.s       fs10, fs4, fs8
                  sub          t1, s8, a6
                  fcvt.w.s     s10, fs10, rtz
                  fsgnj.s      fa0, ft9, fa5
                  fadd.s       fa1, ft9, ft6, rdn
                  fsgnj.s      fa3, fs4, fa0
                  andi         s1, s0, 1033
                  srai         t4, s10, 31
                  mul          t6, a7, a7
                  fmax.s       ft9, ft3, fs5
                  divu         s6, s5, a2
                  fmin.s       fa7, fs6, fa4
                  xor          t1, t3, s0
                  srli         s4, s9, 6
                  ori          s1, s6, 1268
                  auipc        sp, 793132
                  srl          t6, s7, sp
                  slt          t2, gp, a6
                  fsgnjn.s     fs7, ft9, ft4
                  srai         a1, t3, 11
                  fcvt.wu.s    t5, ft11
                  fsgnjn.s     fs10, fs1, ft8
                  fmv.x.w      t1, ft3
                  fcvt.s.w     ft11, gp, rne
                  div          s10, a4, t2
                  fsgnj.s      ft7, fs8, ft8
                  auipc        t2, 1026903
                  slti         t5, a2, -1302
                  and          a5, a1, gp
                  sltiu        s6, t3, -19
                  fle.s        a4, fa2, ft9
                  divu         t6, a0, s11
                  mulhu        t0, sp, s8
                  slli         a2, ra, 4
                  sra          t0, ra, a3
                  slti         t5, a5, 1212
                  sll          t4, t5, gp
                  fclass.s     tp, ft4
                  fcvt.w.s     a4, fa2, rmm
                  mul          s2, s0, gp
                  fdiv.s       fs3, fs11, ft3
                  srai         s5, s10, 21
                  sltiu        zero, a5, 1996
                  andi         a2, s7, 1492
                  remu         a0, a3, a0
                  flt.s        zero, fs6, ft8
                  andi         gp, s4, -2033
                  fdiv.s       ft11, ft10, ft2, rup
                  flt.s        s11, fs7, fa2
                  fdiv.s       fa2, ft0, ft1, rup
                  lui          s8, 393554
                  ori          a4, a1, -1762
                  fcvt.s.w     fs5, s3, rdn
                  divu         s8, s4, a7
                  ori          s3, a1, -1934
                  nop
                  and          t5, gp, s7
                  slti         ra, s6, 1008
                  lui          t0, 997107
                  sll          a0, a2, zero
                  fle.s        t5, fa4, fs6
                  srl          gp, s1, s3
                  fsub.s       fs10, fs8, fa4, rne
                  andi         s0, gp, 33
                  fmv.x.w      s11, fs7
                  fdiv.s       fs0, ft0, ft2, rdn
                  slt          s2, t5, t5
                  fsgnj.s      ft0, fs10, fa4
                  slt          a2, s3, s7
                  mulhsu       a5, ra, a1
                  fmax.s       ft6, fa1, ft1
                  divu         a6, t3, s7
                  fsgnjn.s     ft11, fs11, fa2
                  fmin.s       fs1, fa5, ft1
                  fmin.s       fa2, fs1, ft1
                  fmv.w.x      fs0, s10
                  mulhsu       s3, a2, sp
                  flt.s        a6, fs7, fs8
                  rem          s5, a2, t6
                  sltiu        a7, a6, -1865
                  sll          s8, t1, t2
                  fmv.w.x      fs9, zero
                  fclass.s     a0, fa1
                  xori         s11, a4, -688
                  fcvt.s.w     ft7, a5
                  div          s10, s0, t1
                  add          a2, t4, t3
                  ori          t1, a1, -823
                  fmv.w.x      fs9, t6
                  slli         s8, ra, 26
                  fcvt.s.w     fa2, s2
                  rem          t4, s3, s3
                  fclass.s     s4, fs10
                  mulhsu       sp, s10, s2
                  slti         a5, s7, -1353
                  fcvt.w.s     a1, fa5
                  auipc        a1, 99235
                  fsgnjx.s     ft2, ft1, fa7
                  sltu         t6, a1, t3
                  sub          a2, t5, s3
                  mulhsu       t4, s7, s5
                  fle.s        gp, fa6, ft7
                  mulhu        a7, t6, s3
                  lui          zero, 641858
                  auipc        s8, 316577
                  fadd.s       fs2, fa3, ft9
                  sll          sp, zero, a0
                  divu         t4, a6, a4
                  srli         a3, s4, 0
                  or           s5, t0, tp
                  addi         a2, t4, -266
                  sra          a0, gp, a6
                  fmul.s       ft0, ft2, fs8
                  xor          s11, s10, s6
                  fcvt.w.s     a3, fs8
                  add          a5, t4, t4
                  fcvt.s.wu    ft3, t0
                  fcvt.wu.s    t0, fs0, rdn
                  fmin.s       ft1, fs10, fa5
                  slli         t2, s8, 31
                  mulhsu       a0, s4, gp
                  fcvt.w.s     a5, ft5, rne
                  fmul.s       fs3, fs9, ft1
                  andi         ra, s8, -856
                  nop
                  fcvt.w.s     s6, fs7
                  srli         t2, s6, 29
                  flt.s        a0, fs10, ft7
                  fadd.s       fs0, ft10, ft7, rup
                  fcvt.w.s     t1, ft0, rdn
                  fsgnj.s      ft6, fs0, fs2
                  fcvt.s.wu    ft10, t0
                  mulh         a2, s6, a2
                  ori          a2, s6, 145
                  flt.s        zero, fs8, fs2
                  xori         sp, s0, 45
                  sltu         s10, a3, s2
                  auipc        t0, 699548
                  mulhu        a1, s10, tp
                  fle.s        a7, fs4, fs9
                  fsub.s       fa7, fa3, fa6
                  fmul.s       ft1, fs9, fa7
                  rem          a3, s3, a4
                  fmv.x.w      s2, fa2
                  mulhu        sp, a5, gp
                  ori          a4, t1, 700
                  fmv.w.x      fs9, a3
                  fmul.s       fs2, ft8, fa3, rup
                  fle.s        ra, ft6, fa2
                  or           t1, a6, s11
                  ori          a3, s11, 870
                  fadd.s       ft8, fs4, fa3, rup
                  srli         s5, s4, 29
                  fmul.s       fa5, fs1, fs11
                  flt.s        t2, ft3, fs4
                  fclass.s     ra, fs2
                  fcvt.wu.s    s10, fs8, rmm
                  srl          s10, t5, a3
                  fmin.s       ft4, fs9, fs1
                  fclass.s     a2, fs1
                  flt.s        s3, fs5, fa0
                  fle.s        t6, fs11, fs8
                  fmv.w.x      fs0, t6
                  slt          s1, zero, a5
                  addi         sp, t3, -952
                  slti         tp, a2, 538
                  srai         a3, a2, 10
                  mulhu        s2, a7, a7
                  fmul.s       ft3, fs9, fa5, rmm
                  rem          t2, s2, t0
                  rem          a6, s10, t5
                  fcvt.s.w     ft1, s7
                  srai         s2, t6, 28
                  add          a0, a3, s7
                  slt          t5, s11, ra
                  srli         s11, s0, 9
                  fmv.w.x      ft0, a3
                  fcvt.s.wu    fa2, gp, rne
                  and          t6, t4, s0
                  srli         sp, t5, 13
                  mulh         s11, a5, s0
                  sub          a3, s8, a5
                  sub          s11, zero, t2
                  mulhsu       a3, s6, t1
                  sll          s8, s0, a5
                  xor          t5, s3, t1
                  xori         a3, a5, 1232
                  fsub.s       ft11, fs4, ft4, rup
                  remu         t4, t3, t4
                  fmul.s       fa3, fs10, fs2, rtz
                  mulh         a0, t0, s5
                  srli         t6, zero, 1
                  fsgnjn.s     fs10, fa0, fs11
                  fsgnjn.s     ft4, ft9, ft7
                  srl          s2, tp, t4
                  slli         a7, s6, 10
                  mul          gp, t1, s2
                  lui          t1, 294880
                  fmin.s       fs2, fs7, fs2
                  divu         s10, a7, sp
                  feq.s        s2, fa1, fa2
                  fsqrt.s      ft5, ft2
                  slti         s2, gp, -243
                  slti         s1, a2, 785
                  fcvt.w.s     s5, fa5
                  fmv.w.x      ft3, s0
                  fdiv.s       fa5, fs5, ft8, rmm
                  sub          a4, s7, ra
                  fmax.s       ft5, ft8, ft4
                  xori         s1, a4, 914
                  div          s5, a0, tp
                  feq.s        a6, fa7, fa5
                  slti         a7, gp, -842
                  addi         t1, s0, 1158
                  sub          ra, sp, tp
                  andi         zero, s1, -970
                  fsgnjn.s     fs1, ft7, fa5
                  fsub.s       fs7, fs0, ft3, rne
                  fcvt.w.s     s6, fa0
                  auipc        s3, 1045313
                  fclass.s     s2, fs6
                  andi         a1, s5, 1447
                  fsgnjx.s     fs8, fa2, fa1
                  fmv.x.w      a5, ft8
                  addi         ra, a3, 176
                  fmv.w.x      fs3, s6
                  addi         s10, t5, 613
                  divu         a1, tp, s9
                  fsqrt.s      fs5, ft5
                  div          sp, a5, s4
                  fsub.s       fs1, fs6, ft0, rtz
                  slli         s6, t6, 18
                  flt.s        s5, fs1, fa7
                  fmin.s       ft0, fa0, fa4
                  addi         s6, t6, -372
                  mulh         sp, s8, a2
                  fmv.w.x      ft10, gp
                  fcvt.s.w     fs3, s5
                  ori          t2, s10, 124
                  srli         a0, a4, 7
                  srli         sp, tp, 23
                  lui          ra, 6726
                  sra          a7, s6, t6
                  sltiu        t5, t2, -663
                  divu         a3, a7, t4
                  xor          a0, t0, s10
                  xor          t6, s7, t5
                  feq.s        t1, ft5, ft1
                  fmin.s       fs0, fa7, fs10
                  fcvt.s.wu    fa4, s3
                  rem          a1, t6, sp
                  add          gp, s8, s11
                  fmv.x.w      a3, ft7
                  add          a4, s2, s7
                  auipc        s0, 224612
                  slli         s6, s8, 26
                  sub          gp, a7, zero
                  auipc        s1, 422273
                  srl          a3, zero, s2
                  fcvt.w.s     s1, ft8
                  mulhu        s0, a1, s9
                  ori          a1, t6, 1164
                  fsub.s       ft11, ft0, fs1, rtz
                  fmul.s       fa6, ft4, fs11
                  fdiv.s       fa3, fs10, fs11, rup
                  addi         s2, s5, -1560
                  mulhsu       zero, ra, t0
                  fsgnjn.s     fs2, fa5, fa3
                  fmv.x.w      s10, fs1
                  rem          s8, s2, s8
                  mulhu        t0, s9, sp
                  fcvt.w.s     s3, fs8, rtz
                  add          t5, t1, s9
                  fmin.s       ft0, fs5, fa1
                  fcvt.wu.s    a4, ft7, rup
                  mul          a2, a7, t0
                  rem          s0, a2, t0
                  sra          a7, t2, s1
                  fcvt.s.w     fa2, s8, rmm
                  fcvt.w.s     s8, ft5, rup
                  fsgnjx.s     fa6, fs3, ft4
                  fsgnj.s      fs5, ft5, ft7
                  fcvt.wu.s    s4, ft1, rdn
                  sll          a2, s2, gp
                  feq.s        t4, fa0, fa0
                  feq.s        s10, fs6, fs3
                  sll          a6, zero, a5
                  fcvt.s.wu    ft6, s9, rdn
                  srl          a7, s3, a7
                  sltiu        a7, s9, 829
                  fmv.w.x      fa5, zero
                  fmv.x.w      a4, ft7
                  srli         s11, s6, 14
                  sltu         gp, a4, tp
                  slt          t5, s11, s7
                  feq.s        s11, ft4, fs6
                  fle.s        a0, fs2, fs7
                  fsqrt.s      ft7, fs3, rtz
                  auipc        sp, 199283
                  mul          s0, s5, s11
                  fdiv.s       fs7, ft1, fa0
                  and          gp, s5, a7
                  remu         a0, gp, s9
                  fcvt.wu.s    a4, fa6, rdn
                  remu         a4, a3, s1
                  addi         t5, a1, 1712
                  flt.s        t5, fa1, fs8
                  sltu         a5, ra, a3
                  fmin.s       fs6, ft10, fa4
                  fsgnjx.s     fs2, fs3, fs10
                  fsub.s       fa6, ft6, ft7
                  mulhsu       t6, a4, t4
                  sra          s0, s2, tp
                  remu         a1, s4, s8
                  rem          t0, a4, t4
                  fclass.s     s4, fs3
                  fcvt.wu.s    t0, ft9
                  flt.s        zero, ft6, fs10
                  srai         a2, tp, 27
                  divu         a2, s3, tp
                  auipc        s10, 246335
                  mulh         t2, a2, a3
                  srli         s8, s2, 23
                  mulh         s5, sp, s7
                  or           ra, s5, a1
                  fcvt.s.wu    ft11, s7
                  auipc        a7, 193784
                  sll          s1, s8, tp
                  mulh         s11, tp, a4
                  fsub.s       fa0, fs2, fs11, rup
                  sltiu        a4, a3, -1617
                  mulhsu       t0, s4, s9
                  srli         t2, s1, 21
                  mul          s11, ra, s2
                  fclass.s     a3, ft7
                  sltu         s5, t3, a0
                  fdiv.s       fs6, fa1, ft9
                  sra          s2, tp, tp
                  sll          ra, s1, sp
                  fle.s        a1, fs0, ft9
                  fmax.s       ft10, fs4, fs3
                  fcvt.wu.s    a1, fa5, rup
                  slt          ra, ra, a1
                  addi         s2, s0, 67
                  fsgnj.s      fs1, ft0, fa3
                  fcvt.s.w     ft1, s1
                  mulhu        t0, s4, s9
                  fsgnjn.s     ft1, fa3, fs7
                  fcvt.s.wu    ft8, s9
                  addi         t5, t5, -767
                  fsub.s       ft7, fs6, fs8
                  fcvt.wu.s    a0, ft6, rmm
                  fmv.w.x      ft3, t6
                  fmv.w.x      fa3, a7
                  fcvt.w.s     s6, fs3, rmm
                  and          tp, s1, a7
                  fsqrt.s      fs3, ft6
                  divu         s6, s11, s3
                  fsgnj.s      ft6, fs8, fs2
                  sll          s8, t1, s0
                  fsqrt.s      fs6, ft11
                  fcvt.wu.s    a2, fs0, rup
                  ori          s8, a7, -435
                  sltiu        s6, ra, -545
                  fadd.s       fs6, fs7, ft9, rtz
                  rem          a2, gp, s6
                  or           t1, gp, sp
                  srai         a6, a4, 3
                  nop
                  xor          t2, s9, t4
                  slt          s8, s3, t1
                  addi         s4, zero, 1511
                  flt.s        s10, ft3, fa7
                  mulh         s11, s11, t0
                  fcvt.wu.s    t6, fs2, rdn
                  fcvt.w.s     a7, ft0
                  srl          s1, t1, a7
                  fdiv.s       ft8, ft8, fs1
                  sltiu        s0, s1, 1088
                  sltu         a6, s5, s5
                  sll          tp, ra, a5
                  fmul.s       ft9, ft4, fs6
                  slli         s10, s11, 21
                  fmv.w.x      ft4, s8
                  srl          a1, s5, a0
                  mulh         a7, a5, t1
                  fsub.s       fa7, ft10, fs11, rne
                  div          a5, a6, s2
                  andi         a3, t6, 79
                  fmin.s       fa3, ft6, fs1
                  xori         s6, s4, -1889
                  divu         t2, a7, a3
                  mulhu        t5, s0, a2
                  sltu         a6, s5, s10
                  fcvt.wu.s    ra, fs1, rtz
                  sltiu        t1, tp, 1991
                  fadd.s       fa1, fs8, fs10, rdn
                  mul          a1, tp, s11
                  fcvt.s.w     fa3, s0
                  fsgnjn.s     ft11, fa1, ft5
                  feq.s        s4, fs11, fa3
                  xor          tp, sp, a5
                  slti         t2, a7, -1847
                  fdiv.s       fs0, fs7, fa3, rdn
                  add          a3, t0, s2
                  feq.s        t0, ft11, fa2
                  fcvt.w.s     a7, ft6
                  fsgnjn.s     fs3, ft7, fs7
                  mulhsu       a7, a2, s0
                  fsqrt.s      ft10, fs7, rtz
                  sub          a2, t2, a4
                  fclass.s     a4, fa4
                  fmv.w.x      fs0, sp
                  flt.s        t6, fa7, ft8
                  mulhu        sp, a7, s11
                  fsgnjn.s     ft5, ft9, fs6
                  srai         ra, s2, 27
                  remu         a0, t6, a4
                  lui          a2, 744690
                  auipc        t5, 683669
                  fle.s        gp, ft6, fs9
                  mulhsu       t1, s4, tp
                  sra          a6, t0, a7
                  fmax.s       fs4, fa2, ft3
                  remu         sp, gp, s10
                  srli         zero, t5, 9
                  fdiv.s       ft9, fs0, fs2
                  srai         t6, a1, 14
                  srai         s3, a0, 19
                  slti         s3, a7, 1390
                  srli         s3, s6, 20
                  fsgnjn.s     fs9, ft6, ft4
                  xor          a7, t2, t3
                  fsgnj.s      ft3, ft11, fa5
                  rem          a6, s9, a4
                  feq.s        s3, fs7, ft10
                  srli         gp, a2, 30
                  fmax.s       fs3, fa1, fs8
                  fsub.s       fs7, ft3, ft4, rtz
                  flt.s        sp, fs0, fa1
                  srli         s0, t5, 31
                  fmv.x.w      s6, fs8
                  flt.s        a1, fs0, ft7
                  xori         tp, a5, -2008
                  srai         tp, s1, 27
                  nop
                  addi         s11, sp, -618
                  addi         ra, s5, 1773
                  fcvt.w.s     t2, fs3, rup
                  fcvt.s.w     ft10, s10
                  slli         s6, s10, 17
                  or           sp, a6, a2
                  sub          s6, s1, s8
                  slti         ra, a4, -820
                  fsgnjn.s     ft10, fs6, fa3
                  fadd.s       fs0, fs5, fa2
                  mulhu        a7, a5, s4
                  or           sp, t3, t3
                  lui          sp, 388495
                  fmin.s       fs11, ft9, ft6
                  flt.s        s8, fa7, fa1
                  sltu         t2, gp, t5
                  feq.s        a6, ft11, fs7
                  fmv.x.w      a7, ft11
                  fmv.w.x      fs4, s8
                  fmin.s       fs7, ft6, ft5
                  xor          a2, s5, s6
                  auipc        s10, 431688
                  flt.s        s10, fs8, fs8
                  fle.s        a5, ft10, fs3
                  mulhsu       s3, s0, a2
                  sltu         s11, zero, a2
                  fmv.x.w      t5, fs11
                  and          gp, s5, s5
                  fsgnjn.s     ft1, ft3, fa4
                  mulhsu       s0, t1, sp
                  fsqrt.s      fs10, fs5
                  fmv.x.w      s5, fs7
                  slt          s6, a1, t3
                  slli         s2, a3, 7
                  fcvt.wu.s    s8, fs7
                  mulhu        s10, s11, s4
                  feq.s        a0, fs8, fa5
                  sltiu        s6, s2, 698
                  srl          a3, a5, t2
                  fmax.s       ft2, ft6, fa5
                  sub          s8, gp, s6
                  slt          ra, s9, s0
                  or           a3, s1, t4
                  sltu         s0, a6, s4
                  fclass.s     sp, fs0
                  flt.s        t5, fs8, ft3
                  div          a4, s9, a3
                  fclass.s     sp, fs9
                  sub          a6, s11, s11
                  add          s4, a0, s11
                  mulh         s5, s4, s6
                  fcvt.s.wu    fs3, zero, rne
                  sll          a7, t3, a0
                  fadd.s       fa4, ft8, fs9, rtz
                  and          s4, s2, tp
                  rem          s8, s9, s10
                  lui          t4, 858935
                  fcvt.w.s     a5, ft7, rdn
                  flt.s        a5, fa0, ft11
                  slli         a1, s8, 2
                  sltu         s0, s9, s7
                  sra          a0, s3, t1
                  fcvt.s.wu    fs7, a5
                  slti         s8, a6, -1848
                  fcvt.wu.s    s8, fs9
                  sltiu        zero, sp, -99
                  mulh         sp, ra, a6
                  fle.s        s4, fs1, ft8
                  divu         t4, a7, t3
                  fsgnj.s      ft3, fs3, fa1
                  feq.s        a0, fa0, fa0
                  xor          s2, a1, t1
                  slli         s6, tp, 6
                  fsqrt.s      ft11, fs5
                  srai         a6, a0, 27
                  slt          a5, s1, a0
                  fmax.s       fs5, fs6, ft8
                  auipc        t1, 837687
                  divu         s5, a1, s9
                  sltu         s10, s2, a1
                  add          s2, t4, s6
                  fsub.s       fs3, ft8, fs3
                  fdiv.s       fs0, fa6, fs10, rup
                  fle.s        a7, fs0, fs8
                  andi         zero, s9, 1613
                  fcvt.w.s     a5, ft0
                  div          a6, t3, t1
                  fmv.x.w      s6, fa2
                  fle.s        a4, fa0, fs6
                  feq.s        s2, fs7, fa4
                  fsgnjn.s     fs1, fs0, ft8
                  sll          s6, t6, t2
                  fcvt.s.w     ft7, s1, rtz
                  slti         gp, t1, 1720
                  addi         t4, s4, -1162
                  xor          zero, a2, s7
                  or           tp, t4, s3
                  divu         s3, t6, a4
                  slt          s6, s4, ra
                  sll          tp, tp, t1
                  sltiu        t0, a6, -67
                  addi         s2, t6, 1947
                  lui          a6, 358690
                  mulh         a2, a7, a3
                  flt.s        zero, fs1, ft7
                  andi         a6, s11, 1579
                  and          a5, s11, t3
                  sltiu        a4, t2, 776
                  fclass.s     zero, ft10
                  auipc        s3, 772069
                  xor          s5, s3, tp
                  fsgnjn.s     fs7, fs11, fa3
                  ori          s1, gp, -508
                  remu         a1, s5, s1
                  fcvt.s.wu    ft11, s5, rmm
                  remu         s5, t1, s10
                  flt.s        t1, ft6, fs6
                  addi         a0, s5, 303
                  addi         s5, a4, 405
                  add          s4, s1, s10
                  fsqrt.s      fs10, fs0, rne
                  div          s8, a0, s6
                  rem          a0, a1, t2
                  mulh         a7, s1, t2
                  ori          a4, sp, -1698
                  xori         sp, a6, 989
                  sltu         s5, a3, t6
                  sra          s2, zero, t0
                  fcvt.wu.s    a2, ft7
                  ori          a1, tp, 2005
                  sltiu        s1, s9, -204
                  lui          sp, 569891
                  feq.s        a4, ft0, ft1
                  slti         a2, s6, 580
                  srli         a6, a0, 3
                  add          a1, t1, s0
                  remu         a1, s9, a3
                  fsub.s       ft5, ft10, fa7, rdn
                  lui          s0, 253106
                  fmv.x.w      s5, fs8
                  fcvt.s.wu    fa6, a6
                  fmv.x.w      t0, fs0
                  and          s5, ra, s4
                  remu         s6, t0, s4
                  fmv.w.x      ft2, sp
                  mulh         t6, s1, t2
                  fcvt.wu.s    a3, ft8
                  fsqrt.s      fa3, ft5, rdn
                  fmin.s       ft11, ft10, fs1
                  andi         a3, a6, -1959
                  fdiv.s       fa6, ft6, fs0, rne
                  fsgnjn.s     fa4, fs0, ft1
                  xor          a4, s10, s9
                  ori          t0, t2, 716
                  slt          t2, t6, zero
                  add          tp, s8, t1
                  fsgnj.s      fs4, fs1, ft11
                  andi         a6, a0, 1135
                  fmin.s       ft1, ft6, fa2
                  slt          s0, t5, t4
                  slti         tp, ra, -1725
                  xor          s5, s1, ra
                  fle.s        s1, ft8, fa4
                  lui          s2, 959583
                  srli         t6, s5, 27
                  ori          s3, s2, 687
                  mulh         s1, s2, tp
                  remu         gp, s5, t2
                  divu         s10, s6, s10
                  slt          a3, t6, s3
                  fle.s        a6, fa0, ft3
                  slt          a2, a1, s4
                  lui          gp, 75972
                  auipc        a5, 697380
                  slti         s11, t5, 396
                  mulhsu       a0, a0, t2
                  and          s1, a2, t0
                  auipc        t6, 652213
                  fcvt.s.wu    ft3, s2
                  flt.s        t0, fa6, fa7
                  andi         t6, t5, 1671
                  fsgnj.s      fs5, ft4, ft9
                  mul          tp, a2, s3
                  fdiv.s       fs4, fs0, fs3, rup
                  div          tp, t1, t1
                  fclass.s     t5, ft0
                  addi         t0, s11, 34
                  sub          t5, a6, zero
                  mulhsu       zero, s11, s4
                  fmv.x.w      s4, fs4
                  mul          t4, t0, t0
                  mulhsu       s1, a6, t5
                  divu         s8, a0, t2
                  sltu         s3, tp, s1
                  slli         a5, a0, 21
                  flt.s        a5, fs3, ft8
                  nop
                  xori         s0, s7, 1988
                  ori          s3, a4, -1938
                  fclass.s     a5, fs3
                  fle.s        t6, fs9, fa4
                  auipc        t6, 803320
                  sub          zero, t4, s7
                  mulhu        s1, ra, s11
                  xor          s3, a3, t1
                  sll          s1, t4, s5
                  rem          sp, a7, tp
                  fdiv.s       fs5, fs10, ft11, rmm
                  mulh         s1, ra, s5
                  fsgnj.s      fa5, fs11, fs5
                  slli         a2, sp, 30
                  srai         t0, s0, 13
                  srli         a3, t6, 27
                  fsub.s       fs0, ft2, fs6
                  fmv.w.x      fs3, s9
                  addi         t5, t4, 844
                  sll          t2, t5, tp
                  xor          s11, t5, s1
                  sra          t6, s3, a0
                  nop
                  add          s4, a4, tp
                  fmul.s       fs0, fs3, fs11
                  fcvt.wu.s    a2, fs2, rmm
                  remu         ra, a2, s11
                  fdiv.s       fs9, fs2, ft4, rdn
                  feq.s        a2, ft1, fa7
                  sra          ra, s1, s4
                  srl          s2, s5, a4
                  sra          s1, a1, t1
                  sltiu        s8, a6, 1905
                  div          sp, s6, a6
                  fmul.s       ft6, fa5, fs7
                  sub          t1, t6, ra
                  feq.s        s1, fa5, ft0
                  fsgnjn.s     fs10, fs4, fs8
                  fclass.s     t2, ft5
                  srli         gp, a6, 26
                  div          a7, zero, a0
                  slli         s8, s5, 10
                  fmin.s       ft7, ft3, ft5
                  and          t4, s3, a3
                  or           t4, zero, s0
                  nop
                  sll          s0, t4, s7
                  add          s4, a7, t1
                  mul          s10, gp, ra
                  add          s11, t0, t3
                  mul          s6, t4, a0
                  slli         a0, t3, 9
                  fcvt.s.wu    ft0, s5, rtz
                  fsqrt.s      ft8, fs11
                  fsgnj.s      ft10, ft8, fs11
                  slti         gp, t6, -1700
                  fmax.s       fs2, fa0, ft9
                  fle.s        s3, fs2, ft4
                  mulhu        a6, gp, gp
                  fmul.s       ft5, fs10, fa1
                  lui          tp, 183725
                  fmul.s       fs8, fs11, ft11
                  or           a0, t5, tp
                  fsgnj.s      ft10, fs6, fs10
                  ori          a2, t0, -6
                  fdiv.s       fa4, fs8, fs3
                  fcvt.w.s     s5, fs5
                  mulhu        t0, gp, ra
                  and          a2, t6, s11
                  mul          a6, s9, tp
                  and          s1, t6, t0
                  sra          a2, t4, s2
                  fmv.w.x      fs5, s2
                  mulhu        t2, t6, zero
                  feq.s        a7, ft6, fs7
                  sltu         t2, a2, a2
                  fclass.s     s3, ft1
                  fcvt.s.w     fs8, a6
                  srli         ra, sp, 21
                  fdiv.s       ft9, ft9, fs6
                  auipc        t0, 546621
                  nop
                  fadd.s       fa7, ft5, ft6
                  fle.s        a0, ft5, ft4
                  flt.s        s6, fs6, fs5
                  andi         s0, t2, 299
                  fdiv.s       fs9, ft5, ft9
                  fsgnjn.s     fs4, ft4, ft8
                  fmv.x.w      t2, fs5
                  andi         sp, s3, 1736
                  and          s8, t5, s4
                  fsub.s       fa7, fs2, fa5
                  fmax.s       ft10, fs4, fs4
                  fcvt.w.s     a0, ft11, rne
                  flt.s        a0, fa2, fa1
                  remu         s1, t5, s3
                  sra          ra, s1, sp
                  fadd.s       ft9, fs5, ft8, rup
                  mulhu        s1, t3, s10
                  fcvt.wu.s    tp, ft2
                  sltu         s6, a5, t0
                  lui          t0, 171798
                  slli         a1, s5, 26
                  srl          s8, s8, t4
                  sra          t6, s5, s10
                  fclass.s     s5, ft6
                  andi         s8, t3, 1341
                  ori          s2, zero, -91
                  fsgnjn.s     fa1, fs4, ft6
                  fcvt.s.wu    ft6, s7
                  fsub.s       fa7, fs11, ft10
                  fmv.w.x      ft11, a1
                  fclass.s     s11, ft5
                  div          t5, s9, s1
                  fclass.s     a2, ft1
                  mulhu        s11, t0, s3
                  xor          s5, s8, s11
                  fmul.s       fs3, ft5, fs4
                  fsub.s       fs0, fa3, ft2, rdn
                  or           s3, s6, a6
                  fsgnjx.s     ft1, ft11, fa0
                  fclass.s     s1, ft5
                  mulh         sp, s1, s0
                  remu         t6, s8, ra
                  nop
                  fle.s        a6, ft2, fa5
                  sra          a3, s4, zero
                  feq.s        a1, fs3, fs6
                  fadd.s       fs0, fs8, ft8
                  flt.s        sp, fs8, ft3
                  sll          s6, a1, a3
                  slti         s0, tp, 886
                  fcvt.s.wu    fs9, gp
                  xori         t4, t4, -1121
                  fsgnjx.s     ft7, fs9, fs6
                  sltu         t4, a4, s9
                  fsub.s       ft0, ft5, fa3, rne
                  divu         t2, t5, ra
                  fdiv.s       ft2, ft6, fs10, rdn
                  add          s4, zero, s5
                  fclass.s     s1, fs5
                  fcvt.s.w     ft2, s0, rup
                  slti         ra, t0, 1333
                  mul          ra, s5, a3
                  remu         t1, a3, s9
                  fadd.s       fa5, fa2, fs2
                  fadd.s       ft3, fa0, fa2, rup
                  fcvt.s.wu    fs3, a3, rup
                  divu         s2, s2, tp
                  and          zero, s10, t6
                  srai         t5, gp, 0
                  slt          a1, s11, a6
                  mul          t0, zero, s7
                  fsgnjx.s     ft3, ft9, ft7
                  sll          a7, a0, a0
                  srai         s1, a2, 31
                  fsgnjn.s     ft4, ft1, fs4
                  fle.s        a4, ft6, ft6
                  fdiv.s       fs5, fs8, ft7
                  srli         s10, t3, 2
                  fdiv.s       fa0, fs1, fs7, rdn
                  fmax.s       fs8, fs5, ft1
                  sub          a1, zero, t3
                  xor          s10, gp, t3
                  xori         a1, s6, -1823
                  mulhsu       s0, sp, s6
                  andi         a6, a2, 366
                  fadd.s       fs4, ft8, ft6, rne
                  andi         t4, s10, 1191
                  remu         tp, s7, a3
                  fclass.s     s0, fs4
                  sub          s4, t5, a0
                  xor          t5, s5, t3
                  sltu         s6, t1, sp
                  xor          a4, s3, a6
                  srl          s10, ra, sp
                  fmv.w.x      fs0, s9
                  fmv.w.x      ft11, a6
                  auipc        a5, 664268
                  sub          s1, s9, s5
                  sll          a1, t2, t5
                  slt          a0, s2, t2
                  sltiu        s2, a1, 2029
                  or           a4, t0, a1
                  fcvt.s.w     fs0, tp
                  sll          a7, a6, s7
                  fadd.s       fa4, fa4, fs11, rne
                  fmul.s       fa5, fs11, ft6, rup
                  nop
                  ori          a1, s0, 343
                  slt          s11, a1, s9
                  addi         sp, a1, -671
                  srai         zero, s5, 22
                  xor          s8, t1, a2
                  fle.s        a6, fs6, fa1
                  fcvt.w.s     a1, ft4
                  flt.s        a4, fs1, fs3
                  sra          t4, t4, t0
                  fsgnjx.s     ft3, fa5, ft6
                  mulh         t6, s6, a2
                  mul          ra, s9, t3
                  fdiv.s       fs11, fs3, fs6
                  feq.s        s3, ft6, fa1
                  fsgnjx.s     ft8, fs6, fs5
                  lui          t0, 306263
                  flt.s        t2, ft5, ft9
                  slt          a6, a2, zero
                  divu         s0, t0, t6
                  fcvt.s.w     ft1, s6, rne
                  fclass.s     a2, fs6
                  ori          a2, s9, 1216
                  div          s3, s9, t5
                  nop
                  slti         s1, t5, -548
                  flt.s        a3, ft4, fa4
                  fmin.s       ft8, fs10, ft3
                  divu         a7, s1, s8
                  and          s10, t1, s7
                  lui          s5, 917144
                  sltu         t2, a4, zero
                  sub          a2, sp, t3
                  or           a0, s7, a0
                  xori         t2, t0, 1756
                  sub          s5, s7, a0
                  fcvt.s.wu    fa1, s5
                  fcvt.wu.s    s5, fa2
                  rem          a7, a3, a6
                  fsgnjx.s     fa1, fs0, ft11
                  fcvt.s.wu    fs2, t3, rtz
                  addi         gp, t2, -1142
                  sub          a7, a4, ra
                  sub          a1, a6, a7
                  fclass.s     a7, fs4
                  fmv.w.x      fa7, s2
                  ori          sp, s1, -243
                  ori          tp, s10, 889
                  mulh         ra, zero, t1
                  div          sp, s7, s1
                  sub          ra, sp, a1
                  mulh         s0, gp, tp
                  xori         a0, s5, -444
                  srli         s10, s1, 9
                  fcvt.s.w     fs0, s5, rne
                  and          t1, zero, s3
                  srl          s3, t3, a4
                  xor          s11, s6, t5
                  div          a0, a7, t5
                  fcvt.s.w     ft5, gp
                  srli         a3, a4, 6
                  fcvt.wu.s    s6, fa4
                  slli         a5, s5, 12
                  slli         t4, zero, 19
                  fadd.s       fs0, fa4, ft10, rdn
                  fsgnjn.s     ft9, fs0, fa4
                  fmv.w.x      fa2, a0
                  fcvt.s.w     fs2, a4, rup
                  fsgnjx.s     fs4, fs6, fs2
                  fcvt.wu.s    tp, fs11, rtz
                  sltu         s4, tp, a0
                  lui          t0, 678043
                  fcvt.s.wu    fs5, t6, rdn
                  remu         t0, a1, zero
                  ori          a1, s10, 358
                  addi         a4, a0, 787
                  fmul.s       fa1, ft1, ft5, rmm
                  slt          s2, a2, t1
                  fclass.s     s4, fs4
                  andi         s4, a7, 1215
                  fcvt.wu.s    a6, fa3
                  fadd.s       ft10, fs0, fs11, rne
                  mulhu        t0, t6, s5
                  fsqrt.s      fs3, fa3
                  ori          a2, a3, 707
                  xori         gp, a3, -481
                  fmv.w.x      ft6, s9
                  srli         s11, t6, 11
                  srai         s0, s0, 0
                  fcvt.s.wu    fa3, a1, rtz
                  fsgnjx.s     fs9, fs8, fs11
                  xori         a6, s3, -571
                  fmv.w.x      ft9, s2
                  fmax.s       ft9, ft2, fs1
                  fcvt.s.w     ft3, t5, rmm
                  fclass.s     t5, ft5
                  srli         s8, t0, 8
                  slti         s0, s7, 934
                  fdiv.s       ft5, ft1, fs0
                  fmax.s       fs0, fs11, fa1
                  slt          a7, t3, t0
                  or           s8, t4, s10
                  fsub.s       ft10, fs10, ft0
                  sll          gp, a4, a6
                  fcvt.wu.s    s5, ft6, rtz
                  fcvt.s.w     ft6, t4, rne
                  fdiv.s       fa3, ft7, ft10, rmm
                  sltiu        ra, a1, 857
                  fmul.s       fs5, ft4, fs3, rne
                  fsqrt.s      ft3, ft8, rtz
                  fsgnjn.s     fa2, fa0, fs1
                  rem          t5, a5, s4
                  rem          zero, sp, t2
                  mul          zero, a1, a1
                  fsgnjn.s     fs10, ft7, fa4
                  fdiv.s       ft10, fs7, fs3
                  slt          a1, s7, s4
                  fcvt.w.s     t1, ft2, rne
                  fmin.s       fs11, fs5, ft10
                  mulhu        s0, s3, s0
                  fclass.s     s5, fa4
                  flt.s        a7, fa5, fa2
                  xori         t1, t5, 1091
                  fle.s        s8, fs10, fs2
                  fmul.s       fa1, ft7, ft0
                  fle.s        t2, fs9, ft1
                  feq.s        sp, fs10, fs6
                  slti         s1, t2, -477
                  divu         gp, a2, a3
                  mul          a3, tp, a4
                  sltu         s8, a0, tp
                  xori         s6, s0, -333
                  nop
                  or           s0, s5, t4
                  fmax.s       fs8, ft6, fa5
                  addi         s2, s0, 1031
                  xori         s11, s6, -125
                  flt.s        t2, fa3, ft6
                  mulhsu       s10, t1, t1
                  sltu         s10, s0, s4
                  fcvt.w.s     a4, ft7, rtz
                  mulh         t0, s3, tp
                  fdiv.s       ft0, fa6, fs8, rne
                  lui          ra, 933539
                  ori          ra, s2, -1284
                  fsgnj.s      ft11, fa4, fa6
                  xor          s3, s3, a1
                  fmv.x.w      s3, fs2
                  xori         t2, s7, -1925
                  nop
                  fmul.s       fs2, fs11, fs9, rup
                  slli         s3, s5, 28
                  srli         t1, a1, 10
                  div          t6, gp, s4
                  andi         t5, a7, -838
                  fcvt.s.wu    fs5, s11
                  nop
                  fcvt.w.s     t1, fa5, rdn
                  ori          s5, gp, 338
                  xor          s11, s1, s10
                  fmul.s       ft5, ft3, fa1, rdn
                  addi         s6, tp, 619
                  srai         a4, gp, 11
                  fmul.s       fs10, ft1, fa4, rmm
                  xor          s8, a2, a1
                  xor          t5, gp, sp
                  slli         sp, ra, 9
                  sltu         s10, a5, s3
                  slti         s3, a2, -66
                  mul          t4, s3, a6
                  feq.s        ra, ft3, ft10
                  or           t0, s9, a2
                  feq.s        s3, fa0, fs7
                  srai         a7, t2, 8
                  fmv.w.x      fs5, s3
                  add          tp, a0, ra
                  or           t4, t1, s2
                  fmax.s       ft6, fa4, ft3
                  fmax.s       fs1, ft11, fa1
                  fclass.s     a5, fs3
                  fmv.x.w      s8, fa4
                  sltiu        a2, t5, 1722
                  fcvt.s.w     fa0, s9, rtz
                  andi         s11, a3, -1060
                  sll          s8, s6, zero
                  addi         t4, s9, -2029
                  fle.s        s8, fa0, fs3
                  rem          a3, s8, t0
                  fcvt.wu.s    s6, fa5
                  addi         s1, t5, 1477
                  slti         ra, t6, -868
                  flt.s        t6, fa2, fs5
                  fclass.s     a5, ft8
                  fsgnj.s      fs4, fs4, fs7
                  andi         t1, a2, 761
                  slli         t5, ra, 28
                  xori         tp, s8, 1408
                  or           t2, tp, a1
                  slti         s1, a5, -1002
                  add          ra, s3, zero
                  ori          a3, s0, 1157
                  slt          a5, t1, s1
                  fcvt.s.wu    fs6, a4, rne
                  srl          a2, s10, s5
                  and          gp, sp, s4
                  fcvt.w.s     sp, fa1
                  sll          a2, zero, t2
                  sub          a5, t5, gp
                  xor          tp, t6, a1
                  fmul.s       ft2, fs5, fs7
                  mulh         t4, s4, s0
                  fsqrt.s      fa2, fs1
                  fcvt.wu.s    gp, fs8, rup
                  mulh         s11, a2, a6
                  slt          s10, t4, s3
                  fmax.s       fs7, fs10, ft1
                  srl          a2, gp, s4
                  ori          s3, s0, -83
                  fmin.s       ft11, fa3, ft9
                  auipc        a2, 285951
                  slli         s10, t1, 15
                  slli         s2, a0, 31
                  srli         t2, s10, 8
                  fmax.s       fs4, fs6, ft4
                  fmin.s       fa3, ft6, fa4
                  fcvt.s.w     fs6, t3, rne
                  fmv.x.w      gp, ft4
                  xori         s3, a7, 1486
                  fcvt.w.s     s11, fa0, rtz
                  mulhu        a0, t5, a4
                  sub          a2, s1, s5
                  mulh         s3, a4, s10
                  xori         s5, t0, -920
                  fadd.s       ft8, fs0, fa2
                  addi         a7, s11, -81
                  mulhu        s0, s9, s2
                  rem          t0, a3, t1
                  srai         t2, a4, 1
                  fsgnjx.s     ft9, fa1, fa3
                  fsgnjx.s     fs11, ft1, fs8
                  fmul.s       ft11, fs9, fa7
                  fle.s        s4, fs0, ft9
                  div          tp, a0, a3
                  flt.s        s1, ft11, fs6
                  feq.s        s0, fa3, fs2
                  sltiu        s10, zero, -1424
                  divu         s5, tp, a5
                  fsgnj.s      fa1, fa3, ft11
                  slli         t5, zero, 8
                  rem          a1, a4, a5
                  fsgnj.s      ft5, fa3, fs4
                  srli         t2, t6, 23
                  fcvt.w.s     s3, fa0
                  flt.s        t6, ft1, fs5
                  srai         tp, s2, 14
                  fmv.x.w      t4, ft7
                  fmv.x.w      tp, ft1
                  xor          a7, t1, tp
                  add          s4, s4, a7
                  fmax.s       fs9, ft6, ft7
                  fclass.s     s4, ft7
                  mulh         a6, s4, s7
                  sll          t0, s10, s9
                  fsqrt.s      ft4, fa2
                  fmax.s       fs2, fa5, ft4
                  slti         t4, a4, -1532
                  fmv.x.w      gp, fs5
                  fcvt.s.wu    ft7, t0, rup
                  fle.s        s4, fa5, ft8
                  mulh         s6, a1, zero
                  divu         a7, t0, t4
                  fdiv.s       ft1, ft2, ft5
                  lui          t0, 395407
                  fsgnjx.s     ft2, fs6, ft1
                  lui          a4, 805449
                  fdiv.s       ft10, ft8, fs4
                  mulhu        t1, t5, a6
                  mulh         a3, zero, t4
                  fclass.s     s8, fs11
                  fdiv.s       ft9, fa1, fa4
                  srai         a0, gp, 6
                  xori         t1, a3, 1540
                  div          t2, s3, s0
                  fmv.x.w      t1, fa0
                  auipc        s5, 420486
                  slt          s4, s11, a1
                  fdiv.s       fs3, ft8, ft10
                  fcvt.s.w     fs7, t6, rne
                  fcvt.s.w     fs3, ra, rup
                  fclass.s     a3, fs10
                  srli         a6, gp, 12
                  nop
                  mulhu        s0, t3, s3
                  addi         t5, s0, -71
                  fmv.x.w      a5, ft8
                  fsgnjn.s     ft9, ft9, fs0
                  fle.s        a3, fs3, ft3
                  div          t2, t0, s0
                  fdiv.s       fs8, ft11, ft1, rdn
                  mulhu        s5, s1, ra
                  fmin.s       fs6, ft1, fs11
                  divu         s8, t6, gp
                  fmin.s       ft7, fa0, fa7
                  fsgnjn.s     fs7, ft4, ft9
                  srai         a1, zero, 25
                  sll          s6, t3, t4
                  sub          t6, s9, sp
                  srl          s4, s6, t5
                  fle.s        s11, ft9, fs0
                  fmin.s       ft4, fs2, fa5
                  ori          sp, s4, -251
                  fsub.s       fs6, ft1, fs6
                  fmv.w.x      fs5, gp
                  mul          s5, a6, a6
                  div          s11, a6, s0
                  sltu         a4, t4, s4
                  divu         a2, s0, s10
                  fsgnj.s      ft2, fs0, ft2
                  sltiu        s0, a4, 243
                  fmax.s       fa5, ft8, ft7
                  slti         a4, t0, 239
                  fmv.w.x      fs5, s2
                  sll          gp, s7, a5
                  slt          a7, ra, zero
                  fsgnjn.s     ft4, fs7, ft6
                  slt          s4, s3, t5
                  fcvt.wu.s    gp, fa4
                  feq.s        ra, ft7, ft0
                  lui          s0, 528979
                  fcvt.wu.s    a2, ft9, rup
                  srai         gp, s1, 0
                  slt          s10, t2, t4
                  fle.s        t1, ft3, fa3
                  fsgnj.s      ft3, fs9, ft11
                  fadd.s       ft0, fa6, fa7
                  fcvt.w.s     a6, fs7, rdn
                  sub          s4, a6, gp
                  fmv.x.w      s0, ft10
                  and          s10, t6, t2
                  fsub.s       ft10, ft9, fa0
                  xori         gp, s1, 578
                  srli         a6, s9, 2
                  fcvt.w.s     t2, fa3, rtz
                  fsub.s       fs3, fs7, fs1
                  rem          t6, zero, s4
                  srl          t0, t0, ra
                  fmin.s       fs7, fs5, ft1
                  srli         zero, a6, 30
                  mul          ra, s1, s8
                  sub          s5, t2, t6
                  fmv.w.x      fa6, zero
                  feq.s        a2, fa5, ft4
                  fsgnj.s      fa0, fs5, fa7
                  sub          t2, s4, t3
                  ori          sp, s2, 132
                  auipc        s3, 108668
                  mulh         s5, sp, s10
                  mulhu        a6, s2, a3
                  mulhu        t5, a5, s11
                  and          s6, tp, zero
                  xor          t2, s5, s4
                  div          s6, s3, a5
                  divu         t2, sp, s0
                  lui          a2, 582396
                  fmv.w.x      ft6, a6
                  sll          tp, s6, t1
                  add          t5, ra, s0
                  mulhu        s3, gp, a4
                  xori         a0, s2, -1532
                  rem          a5, a4, tp
                  fmax.s       fa4, fs10, fs0
                  fle.s        zero, ft1, ft0
                  fcvt.wu.s    t4, ft6
                  xori         a7, t3, -1706
                  remu         t5, a7, s3
                  fsqrt.s      fs10, fs0, rne
                  mulhu        a5, s2, t3
                  slli         tp, s6, 13
                  add          a7, sp, tp
                  fmax.s       ft1, fs11, fs8
                  fclass.s     a7, ft1
                  auipc        a1, 866580
                  fsgnjx.s     ft11, fs1, ft9
                  slti         a6, a0, 1132
                  and          a1, t4, a3
                  fadd.s       fs0, fa2, fa5, rup
                  or           tp, t2, s4
                  srl          tp, s9, t4
                  add          t4, t6, s7
                  or           s6, s5, s5
                  fcvt.wu.s    s6, ft6, rmm
                  xori         s5, s1, 53
                  fcvt.s.w     fa6, sp
                  feq.s        t4, fs5, fa1
                  fmv.w.x      ft2, s4
                  fcvt.w.s     s2, fa0, rup
                  flt.s        t0, ft0, ft11
                  fle.s        s10, fa4, ft5
                  mulh         s5, t3, a3
                  fsub.s       fa1, fs4, fs7, rdn
                  fsgnj.s      ft10, fs11, ft10
                  fmv.w.x      ft0, s7
                  fcvt.w.s     t4, fs10, rup
                  fsgnj.s      fs8, fs9, fs3
                  srl          s3, t1, s2
                  fmax.s       ft4, fa0, ft9
                  fadd.s       ft6, fs2, fa1, rup
                  slli         gp, t5, 10
                  feq.s        a5, fs1, ft0
                  add          a7, t2, s11
                  fsqrt.s      ft5, fs5, rmm
                  andi         a4, s8, 876
                  divu         tp, a0, gp
                  fmv.w.x      ft10, s8
                  mulhsu       s2, a6, a0
                  divu         t6, s9, a1
                  addi         s10, t1, -317
                  fcvt.s.wu    fs1, t3, rdn
                  mulhsu       t0, s9, s4
                  slli         a1, s11, 24
                  xori         a0, t4, 629
                  sltiu        s6, s3, -1125
                  rem          t6, s9, a7
                  slt          t1, a5, zero
                  andi         t1, a4, -1752
                  fsgnjn.s     ft0, fa5, fs7
                  fcvt.s.wu    ft1, zero
                  div          s8, s5, s0
                  fcvt.s.wu    fa3, s0, rdn
                  auipc        s0, 248285
                  fle.s        t4, fs11, fs1
                  mul          s3, a0, t2
                  fmin.s       fa3, fa3, fs8
                  fle.s        t4, fs2, fs11
                  fcvt.w.s     t5, ft11
                  fsgnjx.s     fs6, fa4, fa2
                  divu         a1, s6, s11
                  add          s3, ra, s11
                  rem          s5, t5, t0
                  fsub.s       fs11, fa0, ft8, rtz
                  srli         s6, a7, 2
                  fclass.s     s6, fs1
                  fsub.s       ft6, fs6, fa6
                  fdiv.s       ft10, fs11, ft11, rup
                  add          s10, s10, a7
                  slli         t0, gp, 4
                  fle.s        s4, ft3, ft5
                  mulh         gp, zero, s9
                  sra          a1, a3, t6
                  div          a5, s1, t3
                  ori          t0, t6, 1129
                  fcvt.wu.s    s11, ft6
                  slti         s2, t6, -970
                  sltiu        s6, t5, -612
                  fcvt.wu.s    s2, fs9, rdn
                  fsgnjx.s     ft0, fs2, ft1
                  fmv.x.w      s2, fs4
                  slli         a1, gp, 19
                  fsgnj.s      fs6, ft4, ft11
                  srli         t6, t0, 20
                  slli         a6, a4, 4
                  andi         a4, t4, -1546
                  fmin.s       ft11, fa5, fs4
                  fmax.s       ft7, fs5, fs9
                  srl          s4, sp, s7
                  andi         a2, s0, -338
                  auipc        gp, 726207
                  fsgnj.s      ft6, fs1, fs8
                  mul          a5, a2, s4
                  fmin.s       fs2, fa6, ft4
                  fadd.s       ft1, fs11, fs7, rdn
                  srl          gp, t6, a4
                  fadd.s       fa4, ft9, fa5
                  ori          s4, a5, 1626
                  remu         s8, s9, zero
                  slt          a5, s3, t2
                  xori         s11, a1, -1953
                  sltu         s8, a3, s8
                  sltu         gp, s9, ra
                  sub          gp, t5, t5
                  xori         gp, s9, -1139
                  fcvt.s.w     fs7, t5, rtz
                  xori         t4, s6, 1928
                  auipc        t1, 408931
                  fmax.s       fs6, fs10, fs6
                  srl          s3, tp, s2
                  mulhu        t0, s3, s7
                  xori         ra, tp, -1282
                  flt.s        a1, ft9, fs7
                  fmin.s       fa6, fa6, ft8
                  slti         t1, sp, 1759
                  slt          t1, t4, t5
                  nop
                  sub          s10, t4, a3
                  fmv.x.w      a1, fs9
                  fmin.s       fs11, ft6, fs9
                  add          s2, s2, a5
                  auipc        t0, 587823
                  fmv.w.x      fa6, t1
                  fmv.x.w      a3, fa7
                  mulhu        t4, a7, t1
                  fclass.s     s5, ft5
                  and          t5, s1, t5
                  srli         t6, s4, 21
                  sltiu        s8, s11, -1257
                  fmv.w.x      ft4, a2
                  fsub.s       ft9, fa6, fs6, rtz
                  mulhsu       t1, s3, a6
                  fcvt.wu.s    a7, fa4, rne
                  sltiu        a3, s5, 1697
                  fcvt.wu.s    s2, ft6
                  fmin.s       ft10, fs8, ft9
                  or           a0, tp, zero
                  slli         t6, a2, 3
                  fclass.s     s5, ft11
                  sra          s4, t3, s7
                  xor          s4, tp, s0
                  fcvt.wu.s    t2, fa3
                  xori         s10, zero, 960
                  slti         s5, s2, -490
                  fcvt.w.s     a4, fa2, rup
                  ori          a0, s9, 180
                  sra          s3, sp, s6
                  fsgnj.s      fs5, ft2, ft5
                  ori          s0, s8, 77
                  slli         t2, t2, 14
                  fmv.w.x      fa6, a3
                  slt          a1, a4, a7
                  fdiv.s       ft9, ft4, ft7
                  mulhu        t0, s5, t1
                  mulhu        a4, s10, t4
                  sltu         sp, s7, a7
                  fsqrt.s      fa5, fs3, rdn
                  fle.s        tp, fa7, ft7
                  fle.s        tp, fa6, fs10
                  fmv.w.x      fs1, a0
                  div          a1, t5, t3
                  fcvt.s.wu    fa1, s4, rtz
                  fclass.s     s6, fs5
                  auipc        a5, 436288
                  flt.s        a3, fs6, ft9
                  fle.s        t1, ft3, fs0
                  fmv.x.w      t0, fs11
                  mulhu        s3, a2, a5
                  fmul.s       ft5, fa2, fs10
                  xori         a2, sp, 1669
                  srl          s6, t5, a6
                  fsgnj.s      ft0, fa6, fs0
                  fmul.s       ft0, fs7, ft2, rne
                  slli         a2, s2, 20
                  ori          sp, t0, -490
                  mulhsu       s1, zero, zero
                  slti         a2, t5, -821
                  mulh         tp, a7, zero
                  slli         gp, a7, 15
                  ori          a1, zero, 1984
                  or           s3, a2, s2
                  addi         a5, t6, -1838
                  sub          s2, s7, s6
                  auipc        a0, 308358
                  fsgnj.s      ft5, fs0, fa5
                  fcvt.s.w     fs7, a2, rdn
                  or           t6, s8, a7
                  srai         t6, s8, 14
                  slti         a5, a3, 275
                  fle.s        s6, fa7, ft2
                  rem          s3, a4, s5
                  mulhsu       a5, s9, s5
                  fsgnjn.s     ft4, ft0, fa2
                  fsgnjn.s     fa6, ft6, ft11
                  mulhu        a6, t0, tp
                  sltu         a5, s6, s2
                  lui          ra, 275724
                  fclass.s     s4, fa6
                  addi         a1, a0, 1824
                  mul          a4, t1, s10
                  div          s5, gp, t2
                  fle.s        s2, fa4, fa6
                  mulh         a4, sp, a0
                  fsub.s       ft2, fa0, ft7
                  fcvt.s.w     ft2, a2, rdn
                  slti         t1, s0, -2048
                  fclass.s     zero, fs7
                  and          s8, t4, t6
                  sltu         s5, ra, s6
                  mulh         a2, a3, s4
                  mul          a7, s1, t1
                  fsgnjn.s     ft7, ft11, fs9
                  fmul.s       ft3, fa7, ft4, rdn
                  srai         tp, zero, 13
                  flt.s        s10, fs4, ft3
                  fmv.x.w      t5, fa5
                  nop
                  srai         s5, t3, 29
                  xor          tp, t0, t4
                  sub          a4, s4, zero
                  sll          zero, s0, t3
                  xor          tp, t5, s4
                  flt.s        a2, ft8, fs7
                  xor          a7, s6, s4
                  mulh         zero, tp, a0
                  fmv.w.x      fs11, s10
                  andi         t5, s1, -872
                  fcvt.wu.s    sp, fs8, rtz
                  lui          a7, 418732
                  mulhsu       s11, s11, a6
                  fcvt.wu.s    t1, fs5, rne
                  srai         a7, s0, 4
                  fmax.s       ft9, fs7, fa2
                  slli         zero, t1, 18
                  addi         tp, a3, -796
                  sltu         t5, s8, t4
                  fmv.x.w      t1, fa7
                  fcvt.s.w     ft8, s5
                  fcvt.w.s     t2, fa2, rdn
                  slt          t6, t1, s1
                  srl          s2, s0, t3
                  srli         s2, a6, 31
                  fdiv.s       fa2, ft5, fs11
                  nop
                  div          s0, ra, t4
                  or           t2, s3, sp
                  fmin.s       ft8, ft8, ft0
                  remu         t5, zero, s10
                  sub          s0, s0, s4
                  ori          t0, s9, 637
                  srli         s5, s5, 0
                  fmin.s       fs6, ft5, ft2
                  sra          t4, gp, a0
                  flt.s        t5, ft2, fs10
                  fsgnjn.s     ft10, fa1, fs6
                  xor          a7, tp, tp
                  fclass.s     s8, fs2
                  fcvt.s.wu    fa1, a5
                  and          t0, tp, zero
                  andi         gp, t0, -439
                  slti         a4, t6, 2014
                  mul          tp, gp, s0
                  fsgnjx.s     fa2, fs1, ft9
                  fmv.w.x      fa2, s11
                  fclass.s     s6, fs9
                  fcvt.s.wu    ft5, a7, rdn
                  xori         a1, t3, 1048
                  slt          a4, a3, s3
                  srai         a5, a0, 24
                  xori         t5, s5, 1842
                  fmul.s       ft5, fa5, ft1
                  fsqrt.s      ft8, ft0
                  fsgnjn.s     fs4, ft6, fs9
                  fmin.s       ft2, fs11, ft0
                  fcvt.s.w     ft3, s4, rdn
                  fmv.x.w      t1, fs8
                  fsgnj.s      fs10, fa4, fa1
                  fdiv.s       fs6, ft9, fa5
                  add          t5, t6, t3
                  sltu         tp, s2, t3
                  fsqrt.s      ft7, fs9, rup
                  divu         zero, a2, a0
                  and          s10, t3, t0
                  rem          gp, s5, t4
                  mul          t1, zero, t0
                  slli         a3, t3, 22
                  fdiv.s       fa4, fa5, ft5, rdn
                  fsgnjn.s     fs9, fs3, fs4
                  nop
                  sub          s1, a3, a7
                  auipc        a6, 130736
                  div          s5, s1, s10
                  fsgnj.s      fs10, ft0, ft0
                  auipc        s3, 585258
                  fdiv.s       fa7, fs6, ft0, rmm
                  fmv.x.w      s1, fs8
                  fcvt.s.wu    fs7, t1
                  fmax.s       ft2, fa3, ft8
                  addi         t5, s1, -519
                  fmul.s       ft9, ft4, ft6, rdn
                  rem          a7, a0, a5
                  slt          t0, a1, t6
                  sltu         a2, s9, a5
                  mulh         s2, s2, s9
                  and          s8, t4, a0
                  mulhsu       t1, t3, a0
                  fsgnjx.s     fs9, fs11, fs6
                  mulhsu       s8, t1, a7
                  fadd.s       ft6, fa0, fs9
                  fle.s        s8, fs1, ft5
                  auipc        t2, 375026
                  mulhu        gp, a1, s10
                  fmin.s       fa3, ft0, fs11
                  andi         s10, t0, -1984
                  fcvt.wu.s    s10, fs9, rup
                  slt          sp, t3, a1
                  ori          s1, a3, 983
                  fmul.s       fa1, fs1, fs8, rup
                  srl          t1, a4, a0
                  fsgnj.s      fs7, fa4, fs9
                  mul          s5, a6, a3
                  fmul.s       fs8, fs4, ft10, rtz
                  fmin.s       fs10, ft11, ft10
                  fcvt.s.wu    fa6, ra
                  fsgnjn.s     ft9, fs7, fa1
                  sub          s6, s7, s5
                  auipc        a2, 627870
                  feq.s        t0, fa5, ft0
                  fsqrt.s      fs10, fa6, rup
                  sll          s10, s7, a0
                  fmv.x.w      a3, fs3
                  or           s8, s9, s10
                  feq.s        s3, fs11, ft9
                  sltu         s1, gp, s10
                  flt.s        s2, ft6, fs1
                  nop
                  ori          a3, a7, -1806
                  sub          t1, t2, t2
                  and          a5, s6, tp
                  and          s11, s5, a4
                  flt.s        s4, ft9, ft5
                  fdiv.s       ft9, fs8, fa2
                  remu         s8, ra, s6
                  div          s10, t6, a5
                  mulh         s2, a0, a6
                  fclass.s     gp, fa2
                  fsgnj.s      ft9, ft5, ft3
                  fsub.s       fs5, ft6, ft7
                  sltiu        t2, s9, 1979
                  srai         a0, t5, 2
                  mul          a3, a0, a1
                  fadd.s       ft6, ft3, fs0
                  fmul.s       fa5, fa5, ft2
                  mulh         a0, t5, s9
                  rem          t4, a6, t1
                  srl          t0, t1, t1
                  fcvt.s.w     fs7, s2, rne
                  xor          t4, s2, t0
                  fsqrt.s      fa5, ft3, rdn
                  fmv.w.x      ft6, s11
                  fsqrt.s      fa7, fs0, rtz
                  fsgnj.s      ft2, ft7, ft0
                  remu         ra, a3, gp
                  or           zero, s9, s1
                  fsub.s       ft3, ft8, fa3
                  fdiv.s       fa6, fs11, ft0, rdn
                  sra          s8, s6, s1
                  fsub.s       fs11, fs1, fa0
                  nop
                  remu         a3, a0, s8
                  fdiv.s       ft8, fa3, ft0
                  srli         sp, ra, 15
                  and          a7, t0, a5
                  addi         ra, tp, 246
                  andi         s1, a5, -1836
                  fmax.s       fs11, ft7, fs10
                  and          a0, t3, s3
                  rem          s4, ra, sp
                  fclass.s     s11, fs2
                  fdiv.s       ft11, fa5, ft3, rup
                  xori         s0, s9, 1178
                  nop
                  sll          tp, t2, s2
                  mulhsu       t5, ra, s0
                  add          a1, t6, sp
                  sltiu        a1, t2, 1085
                  lui          zero, 631001
                  auipc        zero, 257814
                  lui          zero, 488918
                  slli         a2, s6, 25
                  addi         t0, tp, 2012
                  sltiu        t2, s11, -113
                  sra          s4, s10, s4
                  lui          a7, 185017
                  fmax.s       ft0, ft7, fs6
                  div          a2, s10, s5
                  fsgnjx.s     ft6, fa3, fa5
                  fmin.s       fa4, fs7, fa3
                  sll          a2, t0, a4
                  or           s3, a1, t4
                  and          a4, s11, a6
                  fsgnjn.s     fs7, ft1, fa5
                  fmv.w.x      fa5, s7
                  or           a1, s5, a5
                  remu         s3, s4, ra
                  mulh         s10, a3, s6
                  fsqrt.s      ft6, fa4, rtz
                  fsqrt.s      ft11, fs5, rup
                  fcvt.w.s     s6, fs3, rup
                  divu         sp, sp, s10
                  rem          t6, ra, a3
                  mulhsu       s2, s5, t1
                  slt          s1, a4, a5
                  feq.s        s11, ft6, fs11
                  mulhsu       t6, s5, s4
                  addi         s6, s3, 1272
                  div          gp, s1, t0
                  xori         s3, a1, 1247
                  ori          s5, s9, 1224
                  or           ra, s1, t5
                  fsgnjn.s     ft5, fs1, fs5
                  addi         s4, a4, 1525
                  fadd.s       fs11, ft6, fa4
                  addi         a4, a3, -781
                  ori          t2, s11, 1375
                  auipc        t1, 1004098
                  fmin.s       ft1, fa5, ft9
                  andi         tp, t4, -114
                  lui          ra, 242280
                  and          s1, a3, t1
                  fle.s        sp, fa7, fa0
                  fsqrt.s      ft7, fa6, rne
                  srai         s11, a1, 25
                  fsgnjn.s     fa0, fs8, fa7
                  sltu         s1, s5, s5
                  fmv.x.w      s4, ft2
                  fmv.x.w      s5, ft8
                  xori         s3, a0, 118
                  fmv.w.x      fa4, ra
                  srl          s2, t1, s8
                  fmax.s       ft3, ft5, fs0
                  srli         s8, a6, 11
                  srli         s6, s11, 21
                  feq.s        tp, fa1, fs0
                  ori          s8, t6, -1684
                  mulhsu       s2, sp, a0
                  fsgnjn.s     fa3, fs7, fa7
                  div          t1, a7, s10
                  sltiu        s5, s9, 642
                  fdiv.s       fa0, ft2, ft6
                  nop
                  fmin.s       fa1, ft5, fs8
                  xor          tp, s3, s8
                  sub          t2, a2, a6
                  rem          a3, a5, s10
                  fmin.s       ft1, ft4, ft9
                  sub          zero, s2, s11
                  fsqrt.s      ft11, ft5, rtz
                  slti         a2, s10, -1256
                  andi         a4, a0, 998
                  xor          a7, t4, a1
                  fsgnj.s      ft7, fa5, ft9
                  fmv.w.x      ft9, s2
                  sra          t4, a1, a0
                  fle.s        tp, fa3, ft3
                  slti         s4, t2, -1713
                  sltiu        s1, s3, -1587
                  fmv.w.x      fa4, a2
                  nop
                  fle.s        a3, fa2, fa6
                  fsqrt.s      ft10, fs6, rtz
                  fsgnj.s      ft7, fa2, ft8
                  sll          t0, a6, a6
                  flt.s        a2, ft1, fs5
                  remu         s0, s0, s0
                  lui          s11, 98985
                  fsqrt.s      fs0, fa5, rmm
                  and          a3, s5, s10
                  fcvt.wu.s    t6, fs11, rmm
                  fmv.w.x      ft3, a4
                  fadd.s       ft6, fs7, ft0
                  mulhu        a4, s2, zero
                  sltu         s3, zero, ra
                  sll          ra, sp, a5
                  sub          s3, s11, t6
                  fadd.s       ft2, fa2, fs10, rup
                  mulhsu       s4, ra, s1
                  slli         s8, s9, 10
                  fadd.s       ft0, fa6, ft10, rne
                  remu         s5, tp, s11
                  fsub.s       fa2, fs8, fs6, rdn
                  sll          s4, a5, t5
                  fmin.s       fs11, fs0, ft2
                  fsub.s       ft6, ft0, fa0
                  mulhsu       s3, s1, t2
                  fsgnjx.s     ft2, fs5, fs4
                  divu         s0, t0, s8
                  remu         a6, s0, a0
                  srli         s4, a3, 9
                  sub          a5, t4, s10
                  fsgnjx.s     ft2, fa3, ft11
                  slli         s1, s8, 31
                  slti         a0, a3, -873
                  remu         s10, a5, tp
                  sra          t0, t2, a7
                  fsgnjn.s     fa7, fs10, fa6
                  slt          s2, a7, tp
                  feq.s        s4, ft9, fs3
                  mulhu        a5, a1, s6
                  lui          s3, 798361
                  feq.s        a4, fa6, fs9
                  fcvt.s.w     fs8, s2
                  sra          s3, s3, t6
                  remu         a0, s2, s0
                  fcvt.s.w     fs9, tp
                  or           s5, ra, sp
                  andi         tp, s4, 1986
                  srli         s2, tp, 31
                  fadd.s       fs2, ft3, ft7, rdn
                  sll          s0, s8, a3
                  rem          zero, s11, t3
                  srli         a2, t2, 20
                  sub          a1, ra, s5
                  fmv.x.w      ra, ft5
                  fsgnjx.s     fs11, fa0, fs3
                  fmv.x.w      a1, fs3
                  or           t4, a3, ra
                  remu         t0, a6, s5
                  add          t5, s2, s7
                  xor          a4, a0, ra
                  andi         s1, s5, -1540
                  fclass.s     a2, fa7
                  fmul.s       fa3, ft7, ft5
                  fcvt.s.w     fs2, s2, rup
                  fsgnj.s      fs3, ft5, fs7
                  mulhsu       tp, a3, t6
                  remu         a2, s0, a5
                  nop
                  srl          a3, a4, gp
                  feq.s        s5, fa1, fs7
                  fsub.s       ft10, ft8, ft5
                  fle.s        a0, ft6, ft0
                  fmin.s       fs9, ft7, fs1
                  slli         a6, a4, 8
                  fsub.s       ft5, fs3, fs9
                  and          a2, a7, zero
                  xor          a1, s6, s5
                  fsgnjn.s     ft8, fs1, fa1
                  xor          t4, s10, s6
                  mulhu        ra, sp, t2
                  lui          zero, 307101
                  rem          t0, a5, s11
                  feq.s        a4, fa3, ft1
                  lui          s6, 959000
                  srli         a1, s2, 15
                  ori          s2, s3, 1322
                  slt          s4, s1, a7
                  sub          s11, s7, t5
                  fmv.x.w      t4, fs5
                  fsub.s       fa7, fa0, ft4
                  srl          s6, s11, s9
                  sltu         a5, s6, a7
                  fmv.x.w      a2, fs2
                  fcvt.s.w     ft6, a7
                  add          s8, a3, gp
                  xor          t0, t1, a4
                  remu         s4, zero, t3
                  rem          s8, ra, s11
                  xor          a0, a3, s7
                  fdiv.s       fs5, fs11, ft6
                  fcvt.w.s     sp, fa1, rup
                  or           ra, a4, sp
                  div          s5, s2, s0
                  auipc        ra, 797116
                  sub          t1, s8, a7
                  fmv.w.x      fa0, s3
                  fcvt.s.wu    fa7, t1
                  auipc        a7, 875491
                  fadd.s       ft9, fs0, fa0, rmm
                  fdiv.s       fs7, fs8, ft3, rup
                  auipc        s5, 569026
                  divu         t5, a3, a5
                  slti         a7, s3, -1232
                  fmin.s       fs9, ft3, fs5
                  auipc        sp, 977630
                  andi         s2, tp, -231
                  div          s11, s2, sp
                  nop
                  slti         s6, t0, -943
                  rem          t0, s11, t5
                  rem          a1, t4, t0
                  fle.s        a2, fa7, fs4
                  and          a7, a7, a6
                  fmul.s       fa0, fa5, fs5
                  fcvt.s.wu    ft7, zero, rdn
                  fmin.s       ft4, fs4, fa1
                  srli         a3, s6, 4
                  fcvt.s.wu    ft7, tp
                  feq.s        a7, fs7, ft11
                  slli         s8, a4, 14
                  add          s5, t3, a0
                  mul          tp, a2, a6
                  fmv.w.x      ft3, s2
                  xor          a2, t1, s10
                  slti         t4, sp, 1171
                  fcvt.s.wu    ft9, zero
                  srai         s5, t5, 16
                  fsub.s       ft5, ft8, ft4, rdn
                  fadd.s       ft1, fs5, fs9
                  rem          t5, a3, s11
                  fsgnjn.s     ft0, fa4, ft8
                  fcvt.s.w     fs6, a2, rtz
                  fclass.s     s11, fs4
                  and          gp, a6, t1
                  slli         t1, gp, 4
                  addi         s6, a1, -1638
                  fadd.s       fa4, fs0, fa5
                  fadd.s       ft5, ft0, fa3, rup
                  fcvt.wu.s    a3, fs4
                  xor          ra, gp, a1
                  srai         t1, t4, 11
                  fle.s        t6, ft8, fa2
                  fsgnj.s      fa0, fa2, fs6
                  fsgnjn.s     fa2, ft7, fa1
                  and          s8, t3, s2
                  slti         a5, a3, -1205
                  or           t0, gp, t1
                  or           a1, t4, s10
                  div          a4, s0, a7
                  fmv.x.w      sp, fs11
                  fcvt.s.w     fa1, s3
                  and          tp, s0, s11
                  rem          t4, tp, ra
                  fsgnjx.s     fs2, fs4, fa2
                  div          s5, s4, s7
                  fmax.s       ft5, fa5, fa3
                  lui          ra, 679033
                  divu         s0, s10, s3
                  fcvt.wu.s    s8, fa7
                  fsgnjn.s     ft9, fa3, fa1
                  or           a1, tp, s5
                  srli         a3, t0, 18
                  mulh         t0, s0, s3
                  flt.s        t6, ft1, fs0
                  flt.s        zero, fa2, fa6
                  fmul.s       fs3, fa0, fs5
                  fsqrt.s      ft1, ft3
                  fsgnjn.s     ft9, ft8, ft5
                  add          a1, t4, t1
                  fadd.s       fa1, ft0, fs4, rdn
                  mulhsu       a7, t0, s0
                  srl          s8, s2, s11
                  or           a0, s10, s9
                  fmul.s       ft9, fs3, ft9, rup
                  flt.s        s0, ft6, fs3
                  addi         a4, tp, -1938
                  andi         ra, s0, 1511
                  fcvt.wu.s    s5, fa3, rtz
                  div          t5, s10, s6
                  sub          s1, gp, s9
                  fmul.s       fs5, fs2, fa3, rup
                  fsqrt.s      fs11, fs8
                  fmul.s       fs5, fa1, fs7
                  fdiv.s       ft11, fa3, fs2
                  mul          t5, s1, t6
                  or           a2, s8, tp
                  fsgnjx.s     fs6, fa7, fs3
                  fsqrt.s      fa0, ft4
                  fmul.s       ft9, ft6, fs0, rdn
                  fcvt.s.wu    ft4, t1, rdn
                  fclass.s     t0, fs0
                  sll          s2, t2, t2
                  fcvt.s.w     fa2, s3
                  divu         zero, s11, s10
                  sltiu        a2, s11, 96
                  flt.s        s3, fa2, ft3
                  srli         s4, a4, 7
                  fcvt.w.s     t4, ft7
                  slli         s0, a6, 17
                  mulhsu       s1, s11, gp
                  andi         a0, a6, -1557
                  flt.s        t6, fa0, fa6
                  mul          t4, a2, a6
                  sll          s1, t4, t4
                  fcvt.w.s     s10, fa2
                  fcvt.w.s     t4, ft9, rtz
                  fmv.x.w      s5, ft4
                  add          a0, t4, a1
                  fsqrt.s      ft8, fs8, rtz
                  fcvt.s.w     fa3, t2
                  sltiu        t6, s3, -1213
                  flt.s        s5, ft9, fs0
                  fcvt.wu.s    a6, fs3, rne
                  slt          s3, s5, s11
                  remu         t2, t4, s2
                  fsgnj.s      ft10, fs3, fa7
                  fcvt.w.s     t6, fs5, rmm
                  feq.s        s8, fa2, fa2
                  slti         a7, s10, -1027
                  mul          a1, t2, a7
                  fadd.s       fa2, fs2, fs1
                  mulhu        s8, t6, s5
                  auipc        s8, 705260
                  fcvt.w.s     ra, fs9, rdn
                  lui          a4, 552792
                  rem          s5, s6, t0
                  xori         s6, a3, -111
                  divu         sp, a5, zero
                  addi         a4, t1, -1398
                  fadd.s       fs6, ft0, ft0
                  sll          s1, s11, a2
                  mulhu        a3, s5, t0
                  fsqrt.s      ft10, fs11, rtz
                  add          s6, t5, s0
                  mulh         a3, a7, s4
                  fsgnjn.s     fs0, fa6, fa3
                  mul          a6, t3, a0
                  fsqrt.s      ft10, ft9, rmm
                  sub          a1, t2, t1
                  divu         t6, s0, a2
                  xor          t2, s7, s8
                  fle.s        ra, fa1, fs1
                  srli         tp, s4, 1
                  srai         a2, s8, 23
                  mulhu        tp, s9, tp
                  mulhsu       t5, t2, s4
                  rem          t2, t2, t6
                  fadd.s       fa5, fa3, fs11, rne
                  andi         a6, gp, 569
                  xor          a1, a2, t6
                  sub          a1, t1, a4
                  fsgnjn.s     fs7, ft8, ft0
                  andi         a3, s1, -620
                  fadd.s       fs11, ft6, fs2
                  fsgnjx.s     ft10, ft8, ft9
                  sll          t6, s6, s7
                  lui          t0, 39327
                  sll          a3, ra, sp
                  mul          a2, gp, t2
                  sra          a2, s3, s4
                  sra          a4, s2, s9
                  divu         s10, s10, s4
                  xori         a0, s3, -162
                  fsub.s       fs1, ft3, fs4, rup
                  fmul.s       fs3, fa6, fs4
                  and          t4, s8, a7
                  fle.s        t5, fa3, ft1
                  divu         zero, t3, t3
                  or           t1, tp, s3
                  fclass.s     t1, ft0
                  rem          s1, t5, s2
                  sub          ra, a0, a5
                  ori          gp, a7, -115
                  slti         s8, a2, -1475
                  div          s1, t4, sp
                  feq.s        t0, fs4, ft0
                  fle.s        s8, fa7, fs11
                  srl          s10, t1, ra
                  fsgnjn.s     ft1, fa3, fs6
                  add          a7, s2, a6
                  nop
                  fcvt.w.s     t5, fa6, rtz
                  fmv.w.x      ft0, s1
                  srai         s2, zero, 29
                  sub          a4, zero, gp
                  slti         tp, tp, 1307
                  xori         a1, t6, 36
                  fclass.s     tp, fs3
                  fsgnj.s      fa5, ft11, fs1
                  xor          s2, s7, t6
                  slt          s6, a5, s8
                  sll          t1, s7, sp
                  fmv.x.w      t5, fs0
                  fsqrt.s      fs6, ft7
                  fclass.s     a2, ft5
                  fclass.s     a5, ft3
                  addi         a4, t0, -1763
                  mulh         s3, s4, t1
                  xori         a2, tp, 42
                  xor          a5, s9, s4
                  fsub.s       fs1, fa5, ft1, rup
                  div          sp, s11, t2
                  xor          tp, s0, t6
                  fclass.s     t4, fs4
                  feq.s        a0, ft3, fa4
                  fsub.s       fs9, fa3, fs7, rup
                  fcvt.s.w     fs0, a0, rtz
                  srai         tp, a4, 26
                  srli         s6, a5, 23
                  lui          sp, 534958
                  andi         ra, a3, -451
                  fcvt.wu.s    s2, ft7, rmm
                  or           gp, s2, a3
                  fsgnjx.s     fa0, ft0, ft6
                  sltu         a4, a2, s0
                  sra          s4, gp, s11
                  fsqrt.s      fs11, fa2, rdn
                  fsgnj.s      fa6, ft4, fa2
                  fcvt.s.wu    fs8, s6
                  or           a5, a5, t1
                  sltiu        s5, a6, 972
                  fle.s        a5, fs1, ft4
                  slt          t1, s11, s3
                  fmin.s       fs6, fa1, ft10
                  fmul.s       fa1, ft11, ft3
                  sub          a7, sp, s9
                  srai         a3, s5, 2
                  divu         a1, t4, s4
                  slti         s6, s3, -544
                  nop
                  fmin.s       ft1, ft0, ft8
                  fadd.s       fs6, fs9, fs5, rdn
                  divu         gp, t2, sp
                  divu         t4, s1, a4
                  slt          a0, s6, s6
                  mulhsu       s6, t0, tp
                  mulh         s5, sp, t5
                  sltu         s3, a2, a2
                  sra          s11, s6, zero
                  fsub.s       ft7, ft9, ft5, rtz
                  srli         s1, s6, 7
                  fsub.s       fs8, fs2, ft10
                  fcvt.s.w     ft11, s2, rmm
                  sll          s8, t3, zero
                  xor          t0, a2, sp
                  andi         s2, a3, -258
                  slt          tp, a1, s7
                  sra          s6, t5, s0
                  slli         sp, t5, 9
                  rem          a6, t0, a0
                  xor          ra, s9, a3
                  fsgnj.s      ft2, fs2, fa2
                  or           a3, s7, s7
                  mulhsu       t0, s10, t2
                  divu         s10, s10, sp
                  srl          a5, t2, s1
                  xori         a2, a3, 1930
                  divu         a2, s0, ra
                  srli         ra, a2, 25
                  mulh         sp, s6, s10
                  feq.s        a2, ft5, ft4
                  xor          s2, a6, sp
                  fmv.x.w      a0, ft10
                  fsub.s       fa7, ft4, fs2
                  add          t2, t5, s11
                  fclass.s     a3, fa7
                  andi         s6, s10, 619
                  sll          a7, t4, a1
                  lui          s2, 699261
                  mulh         sp, s10, s4
                  fsgnj.s      fs6, fa6, fa2
                  sll          t0, s2, t3
                  fsub.s       ft0, fa6, ft10
                  srl          a7, a1, a6
                  div          a6, s4, a6
                  addi         s8, s0, -353
                  fsgnjx.s     fs11, fs5, ft6
                  fcvt.s.w     fa5, a5
                  andi         t6, t2, 1754
                  fcvt.s.w     fs2, a6
                  fsub.s       ft6, ft9, fa6, rmm
                  nop
                  fdiv.s       ft3, fs7, fs8
                  fle.s        a7, fs7, ft2
                  slt          t1, s5, t1
                  sub          gp, s7, t1
                  sra          a0, a7, t5
                  rem          t2, t5, a7
                  div          s5, a6, tp
                  fsgnjn.s     ft0, fs2, fs7
                  fcvt.s.w     fs9, a6
                  mulhu        a2, zero, sp
                  fsgnj.s      ft3, fa5, ft0
                  sltiu        s8, a5, 1524
                  flt.s        a0, fa5, ft9
                  slt          s11, t1, ra
                  fmv.x.w      t6, fs0
                  fadd.s       ft10, fa5, fs6, rtz
                  xor          s5, a2, a2
                  sub          tp, a6, a7
                  mulhu        a3, t2, gp
                  srli         a1, t5, 11
                  srli         zero, a0, 2
                  add          a0, s1, t6
                  fcvt.w.s     s8, fa2, rtz
                  ori          s8, s6, 1397
                  andi         s4, s4, -2012
                  divu         s3, a6, s8
                  sltu         s8, t1, a4
                  fsgnjn.s     ft8, fa0, fs0
                  mulhsu       s1, s11, t4
                  xori         sp, a7, 133
                  sltiu        t6, s2, 1021
                  lui          a2, 24895
                  fcvt.w.s     a7, fa5
                  fsgnjn.s     ft11, ft10, fs8
                  auipc        sp, 171366
                  fsqrt.s      ft1, fs5, rne
                  fclass.s     s3, fs3
                  fmul.s       ft9, ft10, fs3
                  addi         t1, a4, -1
                  lui          s3, 248801
                  rem          s11, t0, s2
                  xori         a1, s8, -724
                  mul          a7, s8, a2
                  srai         s0, s9, 24
                  fsqrt.s      fs8, ft4
                  auipc        a4, 124070
                  fclass.s     s8, ft8
                  xor          ra, sp, t2
                  sltu         a6, s10, a2
                  srl          t2, s11, s10
                  fcvt.s.w     ft4, s3
                  sll          s2, s0, t1
                  slli         s0, a0, 21
                  mul          a1, s1, gp
                  sltiu        a1, s3, -736
                  fsub.s       ft4, ft2, ft7
                  ori          zero, a3, 1844
                  fsgnjn.s     fs6, fs6, ft10
                  fsub.s       fa5, fs6, fs4
                  fcvt.s.w     fs11, s10
                  add          s8, a3, a1
                  fadd.s       fa7, fa2, fs6
                  andi         sp, s0, -1780
                  andi         a1, a7, -788
                  xor          a6, s0, a5
                  div          s0, t6, tp
                  nop
                  ori          s1, s4, -808
                  fclass.s     t2, ft4
                  xor          ra, t1, s2
                  sll          s3, s8, ra
                  fsgnjx.s     ft2, fs9, ft9
                  auipc        tp, 162057
                  slli         t4, s7, 27
                  fclass.s     a7, fa0
                  sub          sp, s10, s8
                  srl          s4, t6, tp
                  xori         s8, s7, -1406
                  srl          s8, zero, gp
                  srai         t4, s3, 11
                  lui          s10, 1007708
                  xor          s11, a6, t3
                  fsub.s       fa6, ft9, ft7
                  fclass.s     a6, fs4
                  div          t4, t1, zero
                  fcvt.s.wu    fa5, a7, rup
                  feq.s        t5, fs6, ft5
                  fmax.s       fs7, fs9, ft10
                  ori          s6, a2, 1902
                  fcvt.s.wu    ft10, a1
                  fclass.s     s5, ft5
                  sltiu        a2, zero, -645
                  lui          a6, 791430
                  fmax.s       ft6, ft0, fa4
                  lui          t5, 96325
                  fcvt.s.w     fs7, zero, rdn
                  and          s5, s2, tp
                  mulh         gp, a6, a0
                  xor          a0, ra, s7
                  addi         a2, s4, -1394
                  sltu         s11, tp, t6
                  mulh         s2, s9, t6
                  fcvt.s.w     ft2, s8
                  mulhu        s10, ra, s11
                  fcvt.s.w     ft2, a4
                  sll          tp, s10, s3
                  feq.s        s5, fs3, fs7
                  nop
                  fcvt.wu.s    ra, fs6, rdn
                  fcvt.s.w     fs2, ra
                  sll          t6, a3, s9
                  divu         a5, gp, s5
                  mul          t4, s8, s1
                  mul          s4, t2, a2
                  fsub.s       ft11, fs9, ft3, rdn
                  fcvt.w.s     s2, fa7, rtz
                  sra          a5, s7, sp
                  fsgnj.s      fa4, fs1, ft6
                  add          s6, s2, s3
                  srl          t2, a3, s8
                  fle.s        s1, ft2, fa3
                  mulhsu       s10, t0, a3
                  div          t2, a0, s4
                  xor          a2, sp, s6
                  sltu         a5, a4, t2
                  xor          s2, s4, a3
                  mulhu        ra, s11, a4
                  flt.s        s6, ft2, fa1
                  flt.s        s5, fs4, fs2
                  sub          t6, s0, s2
                  auipc        a3, 145869
                  nop
                  rem          s1, a3, s8
                  nop
                  div          a1, s8, tp
                  srli         t4, a3, 6
                  nop
                  fmin.s       fs0, fa1, ft1
                  fcvt.s.wu    fs5, s0, rtz
                  flt.s        s0, fs2, fa7
                  fsgnj.s      fs1, ft3, ft6
                  fmin.s       fa2, fa0, ft9
                  srl          s6, s9, t4
                  andi         zero, a3, 424
                  xor          a6, t3, a2
                  fsub.s       fs11, ft6, fa6, rmm
                  sltiu        t1, a2, 333
                  ori          s10, a3, -635
                  lui          s1, 545978
                  auipc        s0, 635244
                  fadd.s       ft8, fs11, fa5, rtz
                  slt          a0, a7, t1
                  srli         t5, tp, 3
                  sltu         t5, s4, s9
                  nop
                  fsgnjn.s     ft3, ft11, ft0
                  slti         s11, s10, -117
                  fclass.s     t5, fs1
                  fmul.s       fs10, fs2, ft5, rup
                  flt.s        t1, fs11, fs9
                  slti         ra, a1, -1871
                  rem          s0, a2, s2
                  mulhu        s5, a6, s4
                  and          t1, zero, a1
                  fmax.s       fs1, ft3, ft0
                  fcvt.s.wu    fa4, t5
                  and          s4, tp, s5
                  xor          a3, s2, t6
                  slli         t2, s6, 6
                  fmin.s       ft11, ft8, fa1
                  fmin.s       fs10, ft1, ft7
                  flt.s        a1, ft6, fs6
                  and          s5, a6, zero
                  slt          a0, s1, a5
                  fle.s        a6, fs4, ft1
                  slt          gp, s11, sp
                  divu         t5, s0, s1
                  fdiv.s       ft0, ft11, ft5
                  fmul.s       fs4, fs4, fs0, rtz
                  divu         s1, s0, t0
                  fmul.s       fa5, ft7, ft10, rmm
                  fcvt.s.w     fs10, a2
                  mulhu        t2, a7, a0
                  fsgnjn.s     fs6, ft8, ft9
                  sll          zero, t4, s6
                  fsgnjx.s     ft3, fs11, fs6
                  fsgnjn.s     fs1, fs11, fs11
                  fcvt.s.w     fs4, t2
                  fdiv.s       ft3, fs0, fs5, rmm
                  add          s1, tp, a3
                  fmul.s       fa7, fs3, ft0
                  fmv.w.x      fs6, a6
                  slli         zero, t5, 13
                  fle.s        a7, fs0, fa4
                  fadd.s       fs10, ft2, ft11
                  remu         s11, zero, zero
                  add          t4, sp, sp
                  or           ra, s3, s4
                  srai         t0, s2, 31
                  nop
                  fsqrt.s      fa5, fa0, rup
                  and          s10, a3, s8
                  xor          a4, t5, a4
                  srli         t5, s11, 15
                  fmul.s       ft11, fs10, fs6, rne
                  srai         t6, t4, 11
                  fsgnj.s      fs5, ft2, fs7
                  and          s10, s11, a1
                  fcvt.s.wu    fs4, t2, rmm
                  fmin.s       ft7, fs7, fa1
                  lui          ra, 864606
                  lui          s3, 897755
                  sll          t4, a0, t5
                  mulh         s6, ra, a5
                  fle.s        tp, fa0, ft6
                  mulh         sp, a4, t5
                  srai         t1, s7, 4
                  sra          s0, a4, s5
                  xori         zero, a3, 1787
                  xor          s11, s10, s6
                  slt          sp, s7, s10
                  mulhsu       a5, a2, a0
                  or           a4, sp, s11
                  mul          t5, s8, s4
                  fsub.s       fa3, fs6, ft9
                  fcvt.s.w     ft3, t1, rne
                  slti         s3, ra, 303
                  addi         t2, s9, -673
                  sub          t2, s6, s3
                  fle.s        s6, fa3, fs6
                  sltiu        t0, a2, -1784
                  fsgnjn.s     fa5, fs5, ft6
                  mulh         a3, t5, a1
                  fcvt.s.w     fs5, s2, rmm
                  xori         tp, a7, -882
                  xori         s6, tp, 466
                  fsgnjn.s     fs6, fa0, ft2
                  mulh         a4, s9, a0
                  and          t4, s2, a7
                  fmax.s       fa6, fs1, fa2
                  fcvt.wu.s    a7, fs5, rmm
                  flt.s        s8, ft8, fa1
                  xori         a3, s8, -1934
                  mulh         zero, zero, sp
                  add          t4, a0, zero
                  sll          s1, s11, s1
                  fsgnjx.s     fa1, ft3, fa2
                  fmv.x.w      a7, fa3
                  fcvt.s.wu    fa0, sp
                  sra          s2, t4, t6
                  fsgnjx.s     ft1, fa7, fs9
                  slti         s2, a5, 1455
                  xor          a5, t1, gp
                  sub          a7, s8, zero
                  or           zero, a2, s10
                  lui          gp, 590672
                  addi         a6, t3, 1005
                  fdiv.s       ft7, ft2, fs1, rmm
                  fsgnjx.s     fs8, fa1, ft8
                  fmv.x.w      a5, fa4
                  rem          s11, gp, s4
                  fmv.w.x      ft8, a5
                  fle.s        a1, ft7, ft10
                  srai         t5, s4, 8
                  rem          t0, t0, s11
                  and          t4, a2, s3
                  mul          s8, t6, t4
                  and          zero, a2, sp
                  fcvt.wu.s    s4, fs6, rne
                  fmul.s       ft10, fs3, ft10
                  feq.s        a5, fs8, fs6
                  fsgnjx.s     ft7, ft1, fs3
                  slli         s10, t4, 26
                  or           s10, s8, t1
                  nop
                  mulhu        s4, t5, s3
                  xor          s11, gp, zero
                  fcvt.wu.s    s5, ft0, rup
                  fsub.s       ft1, fs11, ft8, rup
                  feq.s        a4, fs10, fa0
                  sra          t4, s11, t2
                  fclass.s     s10, fa2
                  fsgnj.s      fa0, ft9, ft4
                  div          t4, a6, s9
                  fsgnjn.s     ft8, fs11, fs7
                  mul          t0, s11, s10
                  auipc        a3, 461920
                  mulhu        t1, s3, s8
                  xor          a3, ra, a1
                  or           s10, s6, a7
                  mulhu        s4, t4, s5
                  slt          gp, s3, a7
                  andi         t2, tp, 160
                  fcvt.s.w     fs8, t4, rdn
                  slti         a1, t0, 1210
                  xor          a0, t2, s4
                  fmv.w.x      fs6, t4
                  mulhsu       t4, t6, s5
                  fmax.s       fa5, fa2, fs7
                  rem          a1, tp, s2
                  fcvt.wu.s    a1, fs9
                  sub          t2, zero, a0
                  fsub.s       fa2, fa6, fs5, rdn
                  flt.s        s5, fa2, ft10
                  sra          a1, a1, s6
                  rem          zero, s7, s8
                  flt.s        a0, fs0, ft11
                  div          s11, t6, a4
                  xor          a4, a6, a6
                  ori          a1, tp, 1758
                  feq.s        s11, ft1, ft5
                  ori          t0, a0, -1561
                  mulh         s2, s1, s11
                  fcvt.s.w     fs5, a2
                  feq.s        s1, ft8, ft2
                  fmul.s       fa4, fa6, fa5
                  addi         a7, s5, -692
                  fsgnjx.s     fs4, fa7, fa0
                  or           s0, t0, sp
                  sra          a2, s4, t0
                  fcvt.s.w     ft0, a6, rup
                  fsgnj.s      ft1, fs9, fa2
                  sltu         t0, s4, a5
                  fcvt.s.w     fs2, a7
                  divu         zero, s7, a1
                  sll          t1, gp, s2
                  fcvt.s.w     ft0, s5
                  fclass.s     ra, fs4
                  fclass.s     a0, fa2
                  andi         t6, t3, 964
                  andi         a2, a7, -182
                  and          a6, t4, t2
                  rem          t5, a4, zero
                  add          sp, s10, s9
                  sub          s6, a0, a4
                  mulhu        s6, s11, a6
                  fsub.s       ft11, fs9, ft0, rup
                  sltiu        s0, s0, -1327
                  sll          s4, a2, t0
                  srai         s0, t3, 5
                  rem          t6, t5, t3
                  nop
                  fmv.x.w      a2, fa1
                  fcvt.w.s     a5, fs0
                  feq.s        a1, ft5, fa1
                  sltu         a7, t5, ra
                  fclass.s     a5, ft10
                  fsub.s       fs10, fs8, ft11
                  fcvt.s.w     ft2, s1, rup
                  fmul.s       ft8, fs11, fa3, rdn
                  srli         t0, s0, 4
                  sltu         s6, sp, s1
                  xori         s10, t1, 1426
                  fmv.w.x      fa0, gp
                  slli         a0, s2, 3
                  srl          s2, t3, s4
                  mul          a6, s10, s4
                  xori         s4, s1, -1510
                  fcvt.w.s     s1, fa3
                  flt.s        gp, fs8, fa7
                  fle.s        s3, fs8, fs3
                  fmax.s       fs2, fs4, fs3
                  fsub.s       fs6, ft10, fa7, rtz
                  sltu         s2, t1, zero
                  xori         sp, tp, 1449
                  srai         t1, a1, 19
                  fsqrt.s      ft6, fs4, rup
                  fsgnjx.s     fa1, fs3, fs0
                  fsgnj.s      ft2, fs0, ft2
                  and          a6, t1, sp
                  divu         t5, t4, t6
                  mul          t1, gp, a5
                  andi         gp, s0, -1894
                  and          s10, s8, a1
                  fmv.x.w      s10, fs1
                  fcvt.wu.s    a4, fs11, rmm
                  sltu         zero, a0, s3
                  xori         a3, a0, 652
                  or           sp, s8, t2
                  fmv.x.w      a3, fs2
                  srl          s8, t6, gp
                  fdiv.s       ft1, ft2, fs5, rne
                  rem          a3, s10, a1
                  slti         s10, a6, 1850
                  fclass.s     tp, ft11
                  fcvt.wu.s    s11, fa6
                  and          s6, t1, a0
                  sub          t5, t2, t4
                  fcvt.s.wu    fs6, tp, rup
                  rem          a2, s5, t6
                  mul          s3, a5, t3
                  sltiu        t6, s7, 750
                  slti         s10, zero, 1146
                  fcvt.s.w     fs10, a5
                  xori         s11, a3, 753
                  sra          sp, s7, t1
                  addi         t2, t5, -1130
                  fclass.s     a2, ft3
                  fdiv.s       ft11, ft2, fs5
                  andi         a0, a2, 434
                  fadd.s       fs9, ft0, ft3
                  fcvt.s.w     fs8, sp
                  andi         zero, a0, 911
                  fcvt.w.s     t0, fs5, rdn
                  add          t0, t3, t1
                  andi         t6, t2, -120
                  fsgnjx.s     ft10, fs6, fs3
                  srli         t6, s5, 21
                  fmv.w.x      ft11, s6
                  fsgnjn.s     fa6, ft9, fs7
                  sltiu        s5, s7, -1357
                  sra          t2, a0, gp
                  slt          a2, ra, t1
                  remu         t1, t2, gp
                  ori          s8, s5, -682
                  div          s4, s4, a1
                  addi         s2, s0, 442
                  fcvt.s.w     fs3, a7, rmm
                  fsqrt.s      fa4, fs2, rmm
                  fmv.w.x      fa5, t0
                  fsgnjx.s     fa3, ft9, fs4
                  fmv.x.w      s11, ft7
                  fadd.s       ft9, ft1, fa2
                  xori         s11, s8, -1367
                  mulh         tp, t1, s1
                  div          s8, t6, sp
                  slt          s4, a6, t3
                  fadd.s       fs0, fa2, fs1, rtz
                  mulhu        gp, a6, tp
                  srl          ra, s5, s4
                  fmax.s       ft1, fa4, ft1
                  auipc        a6, 25889
                  div          s0, s5, s4
                  fsgnj.s      fa5, fs9, fa2
                  div          s1, s8, a2
                  fcvt.w.s     a1, fs2
                  mul          s11, a3, a2
                  fsub.s       fs3, ft9, fs7, rdn
                  feq.s        gp, fs9, ft3
                  fadd.s       ft11, fs3, fa5
                  fsgnjx.s     fs5, fs7, ft6
                  fcvt.s.w     ft11, a2
                  srli         s0, s2, 31
                  remu         tp, s9, gp
                  remu         t1, t3, s8
                  sub          s5, a5, t1
                  slt          a2, zero, a3
                  mul          s4, s10, a7
                  fsqrt.s      ft5, fs10
                  sra          sp, s7, t3
                  fsgnjx.s     ft2, fs6, fa5
                  div          tp, t6, s1
                  fmv.w.x      fa2, s11
                  fsqrt.s      ft7, fs11, rtz
                  sub          sp, tp, s5
                  remu         s8, a7, s7
                  fmv.w.x      ft8, s4
                  sll          a7, s7, s8
                  fsgnj.s      ft6, ft8, ft4
                  mul          s3, s11, t2
                  fmin.s       fa7, fs3, fs6
                  fsgnjx.s     ft10, fa5, fa1
                  slti         t4, s11, -873
                  mulhsu       a3, t2, ra
                  fsgnjn.s     fa6, ft0, fs11
                  flt.s        tp, fa5, ft9
                  sltu         a2, t0, a6
                  add          s8, t0, a5
                  slli         gp, a7, 17
                  fadd.s       fs9, fs5, ft5, rdn
                  auipc        t0, 848215
                  fcvt.s.wu    fa5, s11
                  divu         s1, tp, a4
                  fsgnjx.s     fs8, fs11, fs10
                  sll          t1, s7, zero
                  mulh         s5, t5, tp
                  feq.s        t6, fs1, ft0
                  or           a2, t3, t1
                  mulhu        gp, t4, t3
                  divu         t6, s11, a2
                  feq.s        s2, fa0, fa4
                  rem          a0, a0, zero
                  fmax.s       fs3, ft8, fa3
                  mulhu        sp, s7, s8
                  sltiu        a0, t5, -576
                  fle.s        a0, ft10, fa6
                  sltu         sp, zero, a5
                  fmul.s       ft9, fs8, ft10
                  mul          gp, a6, s3
                  fcvt.s.wu    ft0, a5, rtz
                  or           s3, t1, s8
                  sltiu        a4, ra, -1453
                  fmin.s       fs2, ft8, fa1
                  fsgnjn.s     ft8, fs10, ft10
                  mul          a5, tp, t6
                  addi         a4, a5, 1369
                  fcvt.s.wu    ft4, a2
                  mulhu        t2, s6, a5
                  sra          a4, gp, s9
                  fmin.s       fs4, ft6, fs10
                  nop
                  fmv.w.x      fs9, t3
                  srai         ra, a3, 17
                  sltu         s3, a1, a0
                  srli         t4, a3, 24
                  slti         a0, s5, -971
                  nop
                  fdiv.s       ft7, ft7, fa0, rmm
                  fsgnjx.s     ft6, fa6, fa7
                  rem          t1, s1, s7
                  fdiv.s       ft8, fs3, fa0
                  fclass.s     a0, ft9
                  or           s1, s5, t6
                  sra          s2, t3, a0
                  slli         ra, gp, 25
                  divu         t5, a1, s8
                  fle.s        tp, fs7, ft11
                  add          s10, a3, s4
                  fmv.x.w      ra, ft11
                  divu         s5, t2, s0
                  fcvt.wu.s    a6, fs8
                  fcvt.s.w     fa5, t1, rmm
                  div          a2, s10, s1
                  flt.s        s3, fs7, fs9
                  andi         a3, t4, 1787
                  fmv.w.x      ft5, s9
                  mulhsu       s8, ra, sp
                  mul          s2, t2, a2
                  rem          a1, ra, a2
                  fmv.w.x      fs11, a7
                  nop
                  fmax.s       ft6, fs0, ft9
                  remu         a1, s4, s5
                  sra          a5, s4, s7
                  fmul.s       ft3, fa6, fs2
                  sltu         s0, a6, zero
                  fsqrt.s      fs5, fs10
                  and          a2, t5, a2
                  div          s10, s3, a4
                  srl          a1, s8, t0
                  fmax.s       ft8, fs2, ft0
                  mulhsu       t1, gp, t4
                  sub          t0, t3, t6
                  slli         a0, t2, 6
                  fmv.x.w      s5, ft7
                  rem          gp, ra, t2
                  andi         s8, t6, 1754
                  fcvt.w.s     s8, ft6, rup
                  fcvt.s.w     ft6, t5, rup
                  divu         t6, s3, t2
                  divu         a5, t4, t5
                  fmax.s       ft1, fa6, ft10
                  fadd.s       ft10, fa6, ft11, rup
                  flt.s        a0, fs2, fa7
                  mulhu        s6, s11, a5
                  fmul.s       fs0, fs2, fs6, rdn
                  fclass.s     a6, ft10
                  andi         sp, s11, 761
                  xor          s6, ra, ra
                  sll          a7, t6, s11
                  fdiv.s       ft4, fs1, fs8
                  ori          a6, s1, 152
                  srai         s6, a7, 18
                  fsub.s       fa1, fs11, fs11, rmm
                  slli         t5, t4, 26
                  fsgnjn.s     fs4, fs10, ft8
                  srli         s8, a4, 10
                  lui          ra, 725574
                  div          s0, zero, a6
                  srli         sp, t6, 0
                  fsub.s       ft7, fs7, ft4
                  fadd.s       fa7, ft5, ft6
                  fmul.s       ft10, ft2, ft7
                  lui          s3, 668227
                  lui          t0, 1022081
                  flt.s        a0, ft3, ft11
                  mulh         s2, s2, s11
                  sll          a0, t3, s5
                  remu         a1, s9, t0
                  nop
                  fsgnj.s      fs9, fa2, fa4
                  div          s4, t5, s5
                  nop
                  auipc        s3, 281733
                  fsgnj.s      ft11, fa7, fa7
                  mulhu        s3, a3, s2
                  auipc        a4, 191046
                  slt          a6, s10, tp
                  fsqrt.s      ft10, ft9, rne
                  fle.s        s2, fs0, fa6
                  fsgnj.s      fa1, ft8, ft2
                  or           s5, s4, t0
                  andi         t4, s3, -1588
                  srai         a5, a6, 17
                  slti         s5, a4, -1819
                  sub          s2, a1, sp
                  slli         t2, tp, 26
                  remu         a2, s3, a1
                  fadd.s       ft7, ft5, fa4, rtz
                  sub          t1, s1, s9
                  sub          zero, s7, a3
                  andi         s2, a1, -895
                  fmin.s       fs10, fs8, ft2
                  fle.s        s10, ft7, ft11
                  remu         s4, t1, s10
                  slti         zero, s1, -358
                  sltu         a7, zero, sp
                  sub          t6, s5, s10
                  srl          s6, a5, t1
                  fcvt.s.w     ft5, sp
                  fmv.x.w      sp, ft2
                  mulhu        sp, a6, a6
                  xori         t4, gp, -1320
                  sub          s3, s2, s11
                  fsub.s       fs11, ft8, fs10, rup
                  nop
                  fsgnj.s      fs11, fs6, ft6
                  nop
                  mulhu        s0, s4, a0
                  fmin.s       fs2, fa2, fs9
                  sra          a4, s2, t5
                  srli         t6, a5, 26
                  fcvt.s.w     fa0, s4
                  fmul.s       fs8, fs6, fa5, rup
                  fcvt.s.wu    fa6, s1, rup
                  srai         s4, t5, 15
                  lui          a6, 989403
                  mul          t4, s0, s11
                  remu         s1, s6, s9
                  fmv.x.w      a6, fs5
                  sltu         s0, s3, t3
                  sltiu        ra, t5, -124
                  feq.s        s2, fs0, fs4
                  fdiv.s       fs5, fs10, fa1, rtz
                  fsqrt.s      ft9, fs5, rne
                  flt.s        a4, ft1, fa3
                  div          a5, a6, tp
                  fsgnj.s      fs11, fs11, ft4
                  sltu         s8, t5, s1
                  sltu         a6, a5, s3
                  sltiu        s11, a4, -496
                  fadd.s       fa7, fs1, ft4
                  auipc        zero, 910616
                  sltu         t2, s8, t5
                  srai         ra, s1, 6
                  feq.s        a4, fa6, fa6
                  fsgnj.s      ft7, ft7, fa5
                  xor          a3, zero, a4
                  addi         a5, ra, 826
                  sll          t1, gp, s2
                  fmax.s       fa0, ft5, fs6
                  fle.s        t2, ft2, ft6
                  fsub.s       ft6, fa0, fa6
                  fmv.w.x      fs4, a3
                  add          t1, s2, a7
                  fle.s        s3, fs1, ft5
                  fcvt.wu.s    s2, fs10
                  lui          t0, 433280
                  fcvt.s.wu    ft7, zero
                  srli         t5, s8, 7
                  fadd.s       fa7, ft5, fa1
                  slli         zero, a4, 22
                  fsgnjn.s     ft9, ft1, fs3
                  fsgnjx.s     ft8, ft10, fs0
                  lui          s6, 43860
                  addi         s10, s3, -48
                  andi         a2, s1, 846
                  fdiv.s       fs9, fs10, ft10, rdn
                  fle.s        s2, ft5, fs6
                  mulh         s8, tp, s1
                  fmv.x.w      s4, ft6
                  ori          a3, s7, 61
                  and          zero, t1, tp
                  slli         s4, s8, 20
                  xori         ra, gp, -1990
                  fsgnj.s      fs7, fs1, fa0
                  fclass.s     t6, ft7
                  slt          tp, tp, s11
                  fclass.s     s2, fs1
                  and          t1, a6, a1
                  fclass.s     t0, fa1
                  sll          t1, s10, s1
                  sltu         ra, s6, s4
                  fcvt.s.wu    ft8, a3
                  mul          t2, a7, t2
                  mul          a1, s5, t5
                  fmul.s       fs0, fs6, fs2, rtz
                  fsgnjn.s     fs5, ft10, ft7
                  fclass.s     s2, fa4
                  flt.s        a2, fs8, fa4
                  flt.s        s2, fs1, fs5
                  srl          s10, sp, s3
                  divu         a2, a5, a1
                  fclass.s     zero, ft5
                  fcvt.wu.s    s4, ft1, rup
                  fcvt.wu.s    ra, fs4
                  fmax.s       fa0, fs9, ft3
                  mulhsu       s10, a1, t2
                  mulh         a1, s0, a6
                  mulh         t5, zero, a3
                  addi         s0, a2, -613
                  fcvt.w.s     a0, fs8
                  and          s6, t3, s6
                  fdiv.s       fs10, fs0, fs0
                  and          t4, s9, t6
                  fdiv.s       ft11, fs3, fs7, rmm
                  fsub.s       fs8, ft1, fs3, rtz
                  xor          s5, sp, t3
                  fsgnjx.s     ft2, ft6, fs9
                  mulhu        t4, ra, t6
                  nop
                  xor          t4, a0, zero
                  fsub.s       fs10, ft1, fs0, rup
                  fmin.s       fs7, fs0, fs3
                  fclass.s     t6, fs6
                  slti         a4, s10, 921
                  feq.s        t4, fs6, fs0
                  remu         a6, t4, s3
                  fclass.s     a1, fs9
                  sra          s4, s11, a4
                  fmv.x.w      s8, ft4
                  sub          a6, a7, s3
                  srl          s1, s7, a4
                  or           a1, ra, s1
                  xori         s2, s10, -933
                  ori          s0, s7, 1886
                  addi         t6, s0, 44
                  xor          tp, t2, s10
                  feq.s        s1, fa4, fs2
                  sltiu        s6, t1, -1897
                  fsgnj.s      ft4, fa1, ft1
                  slti         a0, t1, -1855
                  addi         t5, s11, -1040
                  and          t6, s5, a2
                  fmv.w.x      fs10, gp
                  div          a7, s1, gp
                  add          sp, zero, t3
                  add          sp, s8, tp
                  fsqrt.s      ft10, fa2, rdn
                  fcvt.wu.s    tp, ft7
                  nop
                  sltu         s6, s7, a3
                  slt          a4, s5, t4
                  xori         t6, zero, -1320
                  mulhsu       s6, s3, s4
                  fmin.s       fa1, ft6, fs7
                  sra          a3, a1, t6
                  lui          s4, 136155
                  srai         tp, t6, 26
                  feq.s        t0, ft10, fa7
                  sra          s3, t3, a7
                  andi         a6, s1, -160
                  sltiu        a5, t2, 732
                  fsgnj.s      ft0, ft3, fa3
                  divu         t5, t0, t1
                  srli         s3, s0, 12
                  ori          zero, sp, -427
                  fsgnjn.s     ft8, fa2, ft7
                  fcvt.wu.s    t4, ft6
                  fmv.x.w      sp, fa5
                  rem          a7, ra, a5
                  div          a5, a7, s6
                  sra          a1, t1, t2
                  mulhu        a7, s4, a0
                  fcvt.s.w     ft1, a2, rtz
                  fcvt.s.w     ft7, t4, rmm
                  fclass.s     sp, fa0
                  sltu         s11, s5, a0
                  or           s5, s10, s2
                  xori         t1, a4, -765
                  fle.s        s6, fs9, ft8
                  slt          ra, t5, a0
                  mulh         s10, t5, gp
                  srai         a3, t3, 28
                  flt.s        a4, ft6, ft11
                  auipc        s4, 638845
                  xor          a1, ra, sp
                  slt          a1, s7, a4
                  nop
                  fsgnjn.s     fs11, fs5, fs6
                  fcvt.s.wu    fs3, s7
                  xori         a1, s6, -1126
                  slli         s2, a0, 30
                  ori          tp, s10, -1765
                  fsgnjn.s     ft4, fa4, fa2
                  divu         t1, s4, a1
                  fcvt.s.w     fa1, a0, rdn
                  srl          s10, t5, gp
                  sll          gp, s7, s7
                  flt.s        s11, ft3, fa0
                  fdiv.s       ft7, ft2, ft2, rup
                  mulh         zero, zero, sp
                  remu         gp, s5, a7
                  fsub.s       fs3, fs10, ft10, rmm
                  divu         s5, tp, s7
                  xori         a4, t2, 554
                  srli         a2, s7, 10
                  slti         t6, s2, 1432
                  remu         t6, zero, t2
                  mul          tp, t4, gp
                  fdiv.s       fs0, ft10, fs0
                  and          a3, s10, a1
                  div          s6, a6, a5
                  auipc        s1, 972308
                  sub          t0, t6, a0
                  fmv.x.w      t1, fs9
                  fsgnjx.s     fs8, fs3, fa0
                  fcvt.s.w     ft6, t5, rdn
                  mul          s1, a5, a5
                  add          t1, s0, s10
                  sll          a2, s6, ra
                  xor          ra, t3, s0
                  mulhu        t2, s2, a1
                  fsqrt.s      ft10, fs5, rtz
                  fdiv.s       fs4, ft2, ft7
                  fsgnjn.s     ft10, ft6, fa1
                  fcvt.wu.s    s11, fa2, rup
                  xor          a3, sp, s9
                  slt          a0, s9, s8
                  divu         s0, a6, t4
                  fcvt.wu.s    a6, fa5, rmm
                  slt          ra, ra, s5
                  ori          s5, a3, 18
                  feq.s        s10, fs5, ft11
                  mulhu        s2, t4, a2
                  auipc        a4, 185451
                  fsgnj.s      fs5, fs10, fs0
                  and          t2, t0, a4
                  feq.s        s11, fs1, fs1
                  fmul.s       ft0, fs7, fs2
                  lui          s0, 499989
                  fcvt.s.wu    fs5, a5, rmm
                  fmin.s       fa5, fs6, ft3
                  fmv.x.w      s0, ft6
                  slt          s1, a3, s2
                  rem          a2, a4, sp
                  andi         a4, t3, -343
                  fsqrt.s      fa4, ft5, rup
                  fsqrt.s      fs3, fa1, rtz
                  xor          s3, t3, s4
                  fadd.s       ft9, fs3, ft4
                  addi         sp, t6, 1860
                  fsub.s       fs10, fa5, fa3
                  fadd.s       fa5, fs9, fa5
                  flt.s        a2, fs7, ft10
                  fsub.s       fa0, ft11, fs0, rtz
                  fsub.s       fs4, fs11, fa0
                  fadd.s       fs0, fs10, fa6
                  fadd.s       fa2, ft6, fa5, rdn
                  srl          t1, s7, tp
                  lui          a5, 573786
                  fle.s        t0, fa7, fa2
                  fsub.s       fs4, fs4, fs5
                  and          t6, zero, s8
                  mul          s8, a4, a7
                  rem          a4, t0, a1
                  fsgnj.s      fa3, ft7, fs3
                  sltiu        s1, a5, 297
                  fsgnjn.s     ft2, fa0, ft5
                  or           a7, s6, gp
                  fmax.s       fs4, ft10, fs8
                  andi         s1, t0, -1995
                  srl          a6, t2, t4
                  feq.s        s11, fs10, ft5
                  fmax.s       fs3, fs1, ft1
                  nop
                  and          a5, s1, ra
                  fdiv.s       ft5, fa4, fa5
                  fcvt.s.wu    ft0, a2
                  fmv.x.w      t6, ft3
                  remu         s2, a2, s11
                  slti         s3, t3, 556
                  srai         t6, a3, 23
                  fclass.s     gp, ft0
                  fsgnj.s      fs6, fs5, fa5
                  fmv.w.x      ft2, t2
                  auipc        s10, 193304
                  addi         sp, s2, 1718
                  sll          a2, s4, s10
                  sltiu        zero, s3, 2029
                  fcvt.wu.s    a7, ft1
                  ori          a7, s10, -835
                  remu         s4, s7, ra
                  mulh         s8, a6, zero
                  fclass.s     a6, ft11
                  and          a1, s9, s11
                  or           s2, t0, t1
                  nop
                  fsgnjn.s     fs2, ft10, ft10
                  or           s0, gp, s2
                  fsub.s       ft4, fs8, fa3
                  srai         t0, a6, 11
                  or           a6, t5, a3
                  slti         a2, a5, -1128
                  sltu         s1, a4, t6
                  slli         a3, t3, 11
                  andi         s5, s4, -1060
                  fmax.s       fa6, fs0, fs2
                  fdiv.s       fs7, fs2, fa1
                  fsqrt.s      fs0, fs2
                  fcvt.s.wu    ft9, t6, rne
                  and          s11, s6, a6
                  fdiv.s       fa1, ft9, fs7
                  fmin.s       fa0, fs9, fa2
                  mulhu        a3, tp, a4
                  fcvt.wu.s    t0, ft2, rmm
                  divu         a4, ra, ra
                  sll          ra, a3, a7
                  fsgnjn.s     fs11, ft11, ft1
                  xori         t4, t3, 458
                  fsub.s       fa2, ft8, fs5, rdn
                  lui          s0, 435704
                  fadd.s       fs1, fa0, fa1
                  addi         t2, a7, 160
                  mulh         a0, a5, a6
                  sltu         s4, s8, a5
                  fsgnjn.s     fs7, fs10, ft10
                  fsgnjx.s     fa6, fs7, fa4
                  fle.s        t0, fs9, fs4
                  fmv.w.x      fa0, a2
                  fmv.x.w      a3, fa2
                  fle.s        t1, fa2, ft0
                  sltiu        a6, zero, 882
                  fle.s        s4, ft1, fa5
                  slti         sp, t3, -59
                  divu         s1, ra, a6
                  fmin.s       fa5, fa3, ft9
                  ori          a4, tp, 699
                  divu         zero, zero, s2
                  nop
                  fmul.s       fa7, fa2, ft3, rup
                  xori         s0, s7, -866
                  mulh         s10, s2, s4
                  and          s11, gp, s8
                  mul          a6, s3, s11
                  slti         s3, s7, 1163
                  fmv.w.x      fs3, t1
                  nop
                  slt          gp, t2, s5
                  flt.s        s1, fa3, fs9
                  fsgnj.s      fs1, ft11, fs3
                  fsqrt.s      ft5, fs2, rup
                  mul          ra, a5, t0
                  slt          s3, tp, t6
                  fclass.s     t0, ft4
                  fclass.s     s0, ft7
                  fmv.w.x      fa7, t6
                  srai         a0, s8, 11
                  and          a1, s0, s4
                  srli         s3, ra, 12
                  fsgnjx.s     ft6, ft6, ft2
                  fsub.s       ft8, fa1, ft5
                  xori         t1, sp, 260
                  fcvt.wu.s    a3, fa3
                  slti         t0, ra, -1688
                  fmin.s       fa7, fs10, fs0
                  sra          s4, s5, t4
                  fsgnjx.s     ft1, fs10, ft5
                  and          a7, a1, s5
                  fsgnj.s      ft11, fs8, fs2
                  fmv.x.w      s11, fa3
                  sltu         a7, s11, t0
                  fsgnj.s      fs7, fs1, ft9
                  div          s0, tp, sp
                  sltu         s8, s0, a3
                  fmv.w.x      ft7, ra
                  remu         zero, a7, s10
                  fsgnjx.s     fa2, ft3, ft6
                  fmv.x.w      a0, fs9
                  mul          a4, s11, a3
                  sll          t2, t4, a2
                  mul          s10, t0, t5
                  fcvt.s.w     ft0, s2
                  lui          a0, 688452
                  sub          s1, s7, a2
                  fmv.w.x      ft0, s1
                  sll          gp, s3, a0
                  fclass.s     s4, fs9
                  srli         s8, s5, 12
                  fmv.w.x      fs2, a7
                  fmax.s       ft11, fs4, fa7
                  fmax.s       ft0, fs0, ft11
                  xori         sp, s8, -247
                  srai         gp, a5, 20
                  div          a3, zero, s3
                  addi         a1, s1, 2042
                  sll          ra, s8, s11
                  fle.s        t4, fs10, fa5
                  fmul.s       ft4, fs11, ft0
                  fadd.s       fa1, fa2, ft1, rup
                  srli         a1, zero, 7
                  fsgnjx.s     fa6, fs0, fs11
                  fclass.s     a4, fa5
                  sra          a7, gp, ra
                  fle.s        t4, ft7, ft11
                  fcvt.s.w     fs4, s7, rtz
                  fsgnjn.s     fa6, fa4, ft2
                  div          sp, s0, a0
                  divu         zero, tp, t2
                  divu         s2, s10, t2
                  mulhu        a2, a5, s11
                  fmax.s       fs9, fs7, fs0
                  lui          a7, 134004
                  sra          t6, a2, s2
                  fcvt.wu.s    zero, ft3, rdn
                  xori         a1, gp, -706
                  slt          s8, s6, s4
                  mul          s4, s10, ra
                  mul          zero, a4, tp
                  slti         s2, a2, 666
                  slt          a7, a2, a2
                  feq.s        gp, ft8, ft11
                  xor          t0, s3, t3
                  fsqrt.s      ft6, ft0
                  fmin.s       fs5, fa7, ft8
                  sltiu        a0, a2, 423
                  xor          t6, s11, a4
                  slli         a6, t3, 1
                  fadd.s       ft8, ft4, ft11, rne
                  fsgnj.s      fa2, ft10, ft0
                  fsgnjn.s     ft0, fa7, fs6
                  sll          a0, s5, s1
                  srli         s11, s3, 18
                  sub          t6, a1, tp
                  sltiu        s11, t3, 1818
                  nop
                  sub          s0, s0, t6
                  fmin.s       ft6, fs11, fs4
                  fmin.s       ft2, ft7, ft10
                  xori         a2, t1, 997
                  fcvt.s.w     fs5, zero
                  addi         s6, a4, 1397
                  fcvt.wu.s    s5, fs4
                  sltu         a1, t2, t0
                  xori         t1, gp, 948
                  add          t5, sp, a6
                  fmv.w.x      fs7, s11
                  divu         s5, a1, s4
                  sltiu        t0, zero, 870
                  mulh         ra, s3, t6
                  fadd.s       fs3, fa7, fs10
                  fmv.w.x      fa1, s11
                  fdiv.s       ft11, fs2, ft11, rup
                  or           a3, a3, t4
                  fmv.x.w      s3, fs0
                  fsub.s       fs8, ft9, ft6
                  and          zero, sp, ra
                  fle.s        t4, ft10, fs10
                  fmv.w.x      fa1, a4
                  fadd.s       fs4, fs3, fa6, rdn
                  fsqrt.s      ft7, ft11, rup
                  add          t1, t6, s8
                  sltu         sp, a5, zero
                  rem          s10, a0, s9
                  fsgnjx.s     fs6, ft6, ft8
                  fmv.w.x      fs10, ra
                  div          sp, s6, a2
                  fmin.s       fs5, fs5, ft2
                  sltiu        a4, s8, -77
                  remu         t5, s5, s5
                  fsub.s       ft2, fs1, fa1
                  feq.s        t0, fa5, ft8
                  add          t6, a4, s8
                  mul          s3, gp, gp
                  nop
                  sltu         a0, t5, s1
                  add          s2, s7, a7
                  auipc        s4, 650718
                  fmv.w.x      fa1, s4
                  remu         s11, zero, s5
                  sltu         zero, s2, gp
                  fsgnj.s      fs7, fa5, fs7
                  sll          s0, s11, t0
                  fcvt.w.s     ra, fs4
                  fsgnjn.s     ft7, fs11, fs1
                  flt.s        a7, ft3, ft7
                  remu         a6, t4, a1
                  fcvt.w.s     a0, fs9, rmm
                  fdiv.s       fa5, ft3, ft3
                  fle.s        a2, ft8, fs10
                  fle.s        t2, fa6, ft1
                  fsgnjn.s     fa7, ft8, fs0
                  fcvt.w.s     a7, ft6, rdn
                  fadd.s       fs3, fs1, fs10
                  divu         tp, s8, a1
                  sltu         a0, zero, gp
                  or           sp, a1, a3
                  sra          s3, s3, sp
                  mul          a6, s10, t5
                  xori         s1, tp, 728
                  sltiu        t2, ra, 499
                  fcvt.w.s     sp, ft11, rtz
                  srai         s0, t4, 1
                  flt.s        a3, ft8, ft6
                  fmv.x.w      ra, ft5
                  fsgnj.s      fa5, fs3, ft2
                  fsub.s       fs3, fa7, fs1
                  fmv.x.w      s8, fs0
                  fcvt.s.w     ft6, s10
                  slti         zero, gp, -34
                  and          a1, s10, t6
                  lui          t6, 780833
                  xor          tp, zero, t5
                  slti         a4, a7, -752
                  fmin.s       fa2, ft4, ft9
                  lui          s6, 555548
                  fmv.x.w      a1, fs0
                  slti         s10, t6, -175
                  fadd.s       fa7, fs6, fa1, rup
                  sra          a4, s7, s1
                  fmul.s       fs6, fa4, fa7
                  lui          t0, 163017
                  fmv.x.w      t5, fa2
                  sll          t2, s5, a1
                  xor          a5, ra, t0
                  slt          s11, t0, s8
                  or           ra, tp, t1
                  fmv.x.w      s5, ft1
                  ori          s1, s5, 773
                  divu         ra, t6, t3
                  remu         a3, a0, s3
                  fsub.s       ft5, fs11, ft2, rdn
                  slti         s10, s4, -1912
                  fclass.s     sp, fa6
                  rem          a0, zero, t4
                  ori          a5, tp, 772
                  fclass.s     t5, fa5
                  fcvt.wu.s    tp, ft1, rmm
                  srl          t4, a6, s0
                  flt.s        ra, fs5, fa7
                  fcvt.s.w     fa7, t2
                  fcvt.wu.s    a4, fs9
                  sltiu        a7, s7, -62
                  fmv.x.w      a2, ft4
                  fcvt.s.w     ft0, ra
                  fsub.s       fa4, fs9, ft5, rne
                  sltiu        tp, s3, -95
                  fmin.s       ft10, fs9, fs7
                  srai         t5, a7, 3
                  mul          t2, a5, t4
                  slt          s10, t5, t1
                  fcvt.s.w     fs0, a3, rne
                  srl          a4, t4, gp
                  xori         t4, a6, -123
                  sub          zero, a3, s11
                  fadd.s       fs5, fs11, fs1, rup
                  ori          a4, a4, 1813
                  srl          tp, a6, s3
                  srli         a7, a6, 9
                  fmax.s       fs8, ft6, ft9
                  srli         zero, s8, 28
                  lui          s0, 434047
                  feq.s        s11, fs9, ft7
                  srai         sp, s10, 11
                  fcvt.wu.s    s6, fs1, rup
                  ori          s2, tp, -228
                  flt.s        a6, fa0, ft6
                  fle.s        s2, fa4, fs2
                  lui          t0, 588670
                  fcvt.w.s     tp, fa6, rup
                  div          s0, gp, a6
                  sub          s1, a3, s2
                  mulhsu       a7, s6, t1
                  fmin.s       fs4, ft7, ft6
                  srai         s0, a3, 23
                  sub          t6, a6, a1
                  remu         s10, s11, t3
                  divu         t6, a6, zero
                  sra          t4, gp, t4
                  slti         a6, s6, -1769
                  mulh         a4, a4, a2
                  fle.s        a6, ft10, ft11
                  mulhu        a5, a4, s8
                  srli         s2, t3, 26
                  sra          zero, t1, s11
                  fcvt.s.w     fs5, s1, rdn
                  add          s10, a2, sp
                  div          s0, ra, t3
                  fmv.x.w      gp, ft5
                  sll          a2, s11, ra
                  fmin.s       ft5, fs8, ft6
                  fmin.s       fa6, fa0, fs6
                  slti         s1, s4, -1858
                  fcvt.wu.s    t6, fs10, rdn
                  mulhu        ra, a0, sp
                  feq.s        sp, ft5, fa4
                  sub          gp, s8, s0
                  fcvt.s.w     fs4, s11, rne
                  slt          t6, a0, a1
                  nop
                  remu         s0, s11, gp
                  auipc        s5, 863635
                  or           a1, s7, t1
                  sra          t2, t5, a3
                  fsgnj.s      fs8, fa3, fa0
                  slt          a2, gp, s9
                  mul          t2, t6, t3
                  fdiv.s       fs3, ft4, ft2, rup
                  mulh         s3, s11, s4
                  fcvt.s.w     ft2, a6
                  fcvt.w.s     s6, fa2
                  mul          a5, a2, a4
                  mulh         s10, a2, s1
                  lui          s0, 469620
                  fcvt.wu.s    s3, ft11, rne
                  divu         t6, s1, s10
                  nop
                  slti         s4, t2, -612
                  andi         t5, t3, 600
                  mulhsu       s10, s5, a1
                  addi         s0, t5, 1581
                  slli         s3, s0, 20
                  sra          tp, a2, s3
                  nop
                  flt.s        a0, fa2, fs7
                  addi         t1, t0, -1589
                  add          s6, t0, s7
                  and          s1, sp, s2
                  rem          a7, s3, a5
                  fsgnjn.s     fs4, ft7, fs11
                  mul          a2, s8, t6
                  fmax.s       fs11, fa1, ft2
                  sltu         zero, s3, sp
                  divu         a0, a2, a1
                  srli         a5, a6, 15
                  xor          gp, a1, a0
                  fsgnj.s      fa3, ft5, ft2
                  fmv.x.w      sp, fs10
                  srai         s1, s9, 5
                  slli         s4, zero, 6
                  fsub.s       ft3, fs8, ft7, rne
                  flt.s        t4, fs11, ft4
                  nop
                  lui          a4, 16115
                  fsgnj.s      ft3, fa7, ft11
                  slt          t6, t3, zero
                  fcvt.s.w     fs3, t5, rne
                  and          t0, sp, zero
                  fmul.s       ft10, fs0, ft4, rup
                  divu         gp, a0, t4
                  xori         t6, s9, 1840
                  sra          a0, s1, sp
                  ori          t0, s11, 278
                  sub          s10, s7, s7
                  srli         a1, s9, 25
                  mul          t5, a0, s10
                  mulh         s5, a4, gp
                  sub          t6, a3, s2
                  fmul.s       fa7, fa1, fs9, rtz
                  srai         t5, s11, 27
                  sltiu        s1, sp, -1411
                  fsgnjx.s     fs2, fs4, fs7
                  nop
                  fmul.s       fs8, ft11, ft4, rdn
                  feq.s        ra, fa3, ft4
                  srl          a7, s5, a4
                  nop
                  fmax.s       ft5, fs0, fa2
                  fsub.s       fa4, fs11, fa6, rtz
                  mulhsu       a2, t3, t2
                  fclass.s     s2, fs10
                  fmul.s       ft6, ft4, fs7, rmm
                  and          a7, s0, s10
                  lui          tp, 210978
                  ori          t1, s6, 1840
                  fcvt.s.wu    fs4, tp, rmm
                  fcvt.s.w     fs0, t5
                  fle.s        ra, fs6, ft0
                  sltu         t2, a1, a0
                  addi         s11, gp, 89
                  fmv.x.w      a5, fs1
                  flt.s        a3, fa6, fs3
                  fclass.s     s1, ft9
                  remu         a0, zero, s3
                  remu         zero, s3, t5
                  div          s5, sp, s8
                  mulhu        t5, a5, a2
                  fadd.s       fs5, fs11, fs9, rtz
                  auipc        zero, 547281
                  mulhsu       a0, t6, sp
                  fcvt.w.s     a1, fs11, rtz
                  remu         a1, t4, s11
                  div          a7, a7, s4
                  fmul.s       fa7, fa5, fs8, rne
                  fcvt.s.w     fs6, s1, rdn
                  sltiu        gp, s2, -2010
                  remu         s6, t3, a6
                  fcvt.w.s     t5, fs6, rtz
                  fmin.s       fs7, fa4, fs0
                  lui          t4, 1000869
                  fcvt.wu.s    a3, fs9
                  fsqrt.s      fs1, fs5
                  slti         s0, a4, 746
                  fcvt.s.wu    ft9, a0, rne
                  slli         s6, s1, 15
                  fsqrt.s      fa0, fs5, rne
                  mulhsu       t1, s2, s10
                  mulhu        s2, t1, tp
                  divu         ra, a0, t1
                  mulh         sp, sp, t0
                  xor          t2, a6, a1
                  fcvt.w.s     s4, fa7, rdn
                  xori         zero, s3, -838
                  rem          a7, s9, t6
                  ori          s2, a3, -1674
                  xori         a4, a4, -1333
                  fmv.w.x      fs4, s7
                  fsub.s       ft0, fs5, fs8, rdn
                  fcvt.w.s     ra, ft6
                  mulhu        s5, s4, gp
                  divu         s1, a3, s9
                  srai         s0, ra, 12
                  mulhu        s11, s7, s0
                  andi         t6, ra, 62
                  remu         a5, a6, t3
                  mulhu        gp, s3, s0
                  sltiu        t2, t1, -659
                  fcvt.wu.s    a0, fa6, rup
                  fmul.s       ft7, fa1, ft0
                  fle.s        t4, ft7, fs4
                  or           s0, t1, s3
                  mulhu        s4, tp, a0
                  nop
                  or           s5, s3, gp
                  xori         s2, s2, -1786
                  rem          a5, s10, s11
                  mulh         zero, t3, a0
                  fmul.s       fs4, ft5, fs11, rup
                  fdiv.s       fs3, fs2, fa3
                  fmv.w.x      fs1, t3
                  srai         s0, s10, 27
                  mul          s0, zero, s10
                  sra          s3, t1, s5
                  mulhsu       t2, s10, s5
                  fdiv.s       fs7, fa2, fs8, rne
                  mulhsu       a2, t1, s10
                  fcvt.wu.s    s11, ft4, rdn
                  fmv.w.x      ft0, a7
                  fdiv.s       fs6, fa0, fs3
                  ori          s6, a5, 865
                  ori          a6, s2, 1776
                  mulhu        s6, s4, a1
                  divu         a4, s5, t3
                  nop
                  fsgnj.s      ft4, fs3, fa4
                  fmax.s       fs10, ft7, fs4
                  fdiv.s       fs6, fs5, fa3, rdn
                  sra          s8, a3, a3
                  fsub.s       fa1, ft5, fs8, rdn
                  add          sp, s4, s6
                  fmin.s       ft7, fs9, fs10
                  slli         a7, t6, 4
                  sll          s10, zero, s2
                  fmin.s       ft3, ft6, ft5
                  mulhu        t6, gp, a6
                  fcvt.s.wu    ft11, gp
                  andi         a0, s5, -100
                  sltiu        sp, a0, 668
                  fmv.w.x      fs11, s3
                  divu         s10, a6, a3
                  fmv.w.x      ft10, s3
                  andi         s5, t2, -769
                  xor          s3, t4, ra
                  fsgnj.s      fs5, fa6, fs5
                  fcvt.s.w     ft5, tp
                  feq.s        a7, fs9, fs10
                  xori         s6, a2, 1336
                  srli         tp, tp, 27
                  mul          t1, s7, gp
                  nop
                  fmv.w.x      fs1, a7
                  xor          a7, a0, s0
                  fmv.x.w      s11, ft3
                  fclass.s     ra, ft9
                  auipc        a4, 207897
                  fle.s        a1, fs3, ft8
                  rem          s4, gp, s10
                  fsgnjx.s     fa7, ft7, fa1
                  slti         s4, s4, -964
                  add          s5, t2, s11
                  sub          s1, a6, s1
                  fcvt.s.wu    ft8, a7
                  sra          sp, ra, s11
                  fsgnj.s      ft9, ft11, fa0
                  divu         gp, s11, a5
                  fcvt.wu.s    gp, ft8, rmm
                  sltiu        t1, s10, -480
                  fmax.s       fs2, fa7, fa6
                  andi         t0, a5, 106
                  divu         ra, tp, a0
                  fadd.s       fs10, fa2, fa2
                  divu         s6, t0, s1
                  srl          s5, ra, zero
                  xori         s2, t6, 1500
                  mulhu        s2, tp, zero
                  fsqrt.s      fs11, ft1
                  srl          a3, s4, s10
                  fmax.s       fs2, fa2, fs11
                  or           s10, a0, t3
                  andi         s3, a6, 1953
                  fmv.w.x      ft2, t1
                  fsgnj.s      fs11, fa1, fa0
                  remu         t6, s8, s8
                  fsub.s       fa5, ft3, ft9, rmm
                  fle.s        ra, fs8, fs3
                  fcvt.s.wu    fs6, s9, rup
                  fdiv.s       fa6, ft7, ft6, rup
                  rem          s2, s2, a5
                  fmv.x.w      t4, fs11
                  fmv.x.w      t4, fs5
                  xori         a2, s3, -1536
                  fdiv.s       ft0, ft3, fs4, rdn
                  xori         a2, t4, -1025
                  fcvt.s.wu    fa3, s4
                  sub          ra, a0, t5
                  fcvt.s.w     fa5, s8, rup
                  lui          a4, 455944
                  fclass.s     ra, fs2
                  sra          sp, a1, s9
                  sltiu        ra, t6, 937
                  slti         t6, s1, -1465
                  fsgnjn.s     ft3, fa6, fs3
                  rem          s6, a4, a0
                  slli         gp, s6, 28
                  fmax.s       ft5, ft7, ft1
                  fmax.s       ft5, fa1, fa1
                  fdiv.s       ft0, fs3, fs1, rne
                  feq.s        s10, ft10, ft7
                  fcvt.w.s     s8, fa0, rne
                  ori          t1, t5, 2023
                  lui          a7, 430843
                  mulhsu       t1, s7, s9
                  fcvt.w.s     s1, ft9, rmm
                  mulhu        a3, s0, s1
                  add          a0, s2, ra
                  mulhu        t2, sp, s7
                  fcvt.s.w     fa0, t1, rne
                  fmv.w.x      ft0, tp
                  xor          t0, s2, tp
                  xori         t0, s8, 230
                  slli         t0, s10, 20
                  xori         a7, a7, 677
                  nop
                  fcvt.s.w     ft0, s8, rtz
                  add          a7, a7, s8
                  fmv.w.x      ft3, s2
                  srl          t6, s2, s8
                  fdiv.s       ft9, fs10, ft8, rup
                  feq.s        ra, fs3, ft1
                  and          a2, s2, tp
                  andi         s2, s11, -1396
                  fsgnjn.s     fa1, fs3, ft11
                  and          s0, t2, s5
                  fsgnjx.s     fa3, fa0, ft6
                  fsqrt.s      ft1, fs9, rmm
                  slti         zero, a0, 303
                  addi         s0, s10, -1468
                  fsgnjx.s     ft1, ft4, fs6
                  flt.s        t4, fs5, ft3
                  rem          s3, t3, zero
                  xor          a0, t1, a5
                  fcvt.wu.s    t6, fs5
                  fmax.s       ft2, fs2, ft10
                  slli         s10, a6, 20
                  mulh         a4, s1, s1
                  auipc        gp, 311103
                  fmax.s       fs8, fs8, fa1
                  remu         zero, t1, a5
                  sltu         a5, tp, a5
                  fcvt.wu.s    a2, ft2, rup
                  fsgnjx.s     ft3, fa4, fs4
                  fle.s        a4, fs8, fs9
                  fcvt.w.s     s6, ft7, rne
                  fmv.w.x      ft3, s7
                  add          a0, s11, s1
                  addi         s10, s11, -423
                  auipc        s2, 1023150
                  fcvt.s.wu    ft10, s3
                  sll          s0, s6, t6
                  mulhsu       s10, a4, t6
                  srl          a0, tp, a2
                  fadd.s       ft8, fs5, fs8, rup
                  mul          t2, s1, s3
                  fmv.w.x      fs9, tp
                  fadd.s       fa5, fs5, ft9
                  fsub.s       ft7, ft11, fs0
                  srai         a7, s4, 29
                  slt          s2, zero, t3
                  fle.s        a2, fa7, fs10
                  sll          a5, t4, zero
                  fmax.s       ft1, ft8, ft10
                  fmv.x.w      ra, ft4
                  or           t4, a7, s0
                  xor          s1, t5, s6
                  fmul.s       fs5, fa3, fs3
                  fmax.s       fa0, fa6, fs4
                  mulh         t4, a5, gp
                  sll          s4, a2, s2
                  or           s5, t1, s11
                  and          t6, s11, a6
                  mulhsu       a4, a7, ra
                  slt          gp, t5, s0
                  or           s2, s3, s1
                  rem          tp, sp, s5
                  fsgnjx.s     fa7, ft11, fs2
                  fmv.x.w      a7, ft0
                  auipc        s6, 900915
                  fsub.s       ft2, fa6, ft1, rdn
                  feq.s        t6, fs2, fs6
                  fcvt.s.wu    ft2, s10
                  rem          a0, a5, s0
                  divu         t2, ra, t1
                  mulhsu       s2, sp, ra
                  xor          a5, s0, a0
                  fadd.s       ft4, fa4, fs11
                  fsgnjx.s     fa4, fa7, fa6
                  sltiu        a2, t0, 1985
                  feq.s        s6, ft4, fs6
                  fsqrt.s      fa5, ft10, rne
                  fcvt.w.s     s10, fa5, rne
                  and          a6, t2, sp
                  and          s10, s6, a5
                  fcvt.w.s     sp, fa4
                  slt          a4, s6, s11
                  srl          a1, s8, t3
                  sll          a6, s9, s11
                  fle.s        t0, ft8, fa7
                  flt.s        s3, fa6, ft9
                  ori          s2, a4, 1334
                  feq.s        s3, fa3, fs5
                  sltiu        s1, t6, 1843
                  srai         a0, gp, 29
                  sub          gp, t4, t5
                  and          s0, t2, t0
                  fcvt.s.w     fa0, sp
                  divu         t1, s1, a7
                  andi         s3, s0, -188
                  fsgnjx.s     fs7, fa3, fs2
                  fmul.s       fa5, fs6, ft10
                  addi         a7, t4, -1105
                  mulhu        a3, a3, tp
                  mul          a0, a2, t4
                  slti         t1, ra, 1700
                  slti         s10, s6, -1882
                  fsgnjx.s     fs3, fa3, ft4
                  divu         a7, tp, a4
                  auipc        t5, 350724
                  rem          a5, zero, a4
                  slti         tp, ra, 1765
                  fclass.s     s10, ft2
                  mulhu        a3, zero, t1
                  fsqrt.s      fa6, ft0
                  divu         s11, s11, s5
                  fcvt.s.w     fs8, a1
                  fmin.s       fs8, fa2, fs4
                  sltiu        a4, t1, -864
                  fmv.w.x      fs10, t1
                  and          a0, t5, a5
                  fsub.s       fs4, ft10, ft6, rmm
                  fle.s        t5, ft11, fs11
                  mulh         a2, s11, t3
                  sltiu        t1, a6, -1769
                  ori          t6, gp, 1540
                  andi         a0, s1, 1344
                  mulhu        t2, a0, a7
                  add          s0, t5, t6
                  fmul.s       fs8, ft6, fs6, rtz
                  srai         s10, s9, 6
                  xor          a5, a0, t4
                  remu         a3, a2, a5
                  and          zero, s6, t4
                  auipc        a6, 581441
                  slt          t5, t5, s2
                  fmax.s       fa7, ft8, ft10
                  fmax.s       fa7, fs2, ft1
                  sll          a0, a3, a0
                  sra          gp, zero, t4
                  and          s4, t4, gp
                  fsgnj.s      fs8, ft4, ft1
                  fcvt.s.wu    fs3, t0, rdn
                  mul          a3, zero, tp
                  fsgnj.s      fs7, fa7, fa4
                  fsub.s       ft6, fa3, fa7, rtz
                  auipc        s4, 1047342
                  slli         a3, s11, 29
                  sll          a1, s8, s4
                  slti         t2, s6, 1374
                  fmin.s       fs1, ft2, ft11
                  fle.s        ra, fs6, fs3
                  fcvt.wu.s    gp, fs8
                  remu         t1, t5, a4
                  fle.s        t5, ft2, fs1
                  sltiu        sp, s0, -1535
                  flt.s        a0, fs7, fa6
                  addi         t2, sp, -1999
                  and          gp, t4, t5
                  sra          a0, tp, a5
                  fsub.s       fa6, fs1, fa6, rne
                  slt          t6, s3, t3
                  mul          t5, ra, s3
                  divu         ra, t6, s5
                  xor          s2, s3, a3
                  and          tp, s3, a5
                  addi         sp, s2, -1029
                  srli         s8, a3, 27
                  sltu         s8, s9, s10
                  slli         a0, s3, 1
                  srl          t5, s5, a3
                  lui          a7, 99237
                  addi         s0, t2, -609
                  nop
                  feq.s        a0, fs0, ft10
                  fmul.s       ft5, fs10, ft9
                  div          a4, t3, a5
                  srli         s4, a3, 0
                  and          a5, s4, s3
                  andi         sp, t3, -1326
                  sltiu        t1, t4, 45
                  fmv.x.w      s3, fs5
                  andi         a3, s6, -1496
                  auipc        s5, 1034619
                  xor          a2, s10, t5
                  fsub.s       ft0, fs0, ft3
                  sll          s8, s11, t2
                  auipc        s4, 522808
                  divu         s6, ra, zero
                  xori         s1, s4, 200
                  nop
                  xor          s3, s6, ra
                  remu         s4, s4, t2
                  add          t0, t6, ra
                  fsub.s       fs9, ft11, fs11
                  srai         s6, t3, 19
                  nop
                  remu         ra, zero, a3
                  fcvt.s.w     fa0, t1, rup
                  mulhu        s1, a6, a4
                  mulh         a6, t5, s8
                  srl          ra, t6, a4
                  fsgnjx.s     fs9, ft0, fa4
                  fmv.x.w      s11, fs5
                  addi         s5, tp, -1839
                  srli         zero, t3, 15
                  add          s4, t5, t4
                  fsqrt.s      fa4, ft1, rne
                  sll          a5, s11, a6
                  and          s0, a5, a3
                  fmul.s       fs8, fa5, fs6
                  mulh         s8, t0, a6
                  nop
                  srl          s8, s4, s7
                  mulhu        ra, t4, s9
                  fmin.s       fs3, ft10, fa2
                  addi         t5, a5, 183
                  divu         t6, s0, s8
                  add          s1, s9, a7
                  sltu         t2, tp, sp
                  sll          t6, a0, a4
                  mulhu        a3, s7, ra
                  fsub.s       fa2, fs9, fs10, rdn
                  fmul.s       fs8, ft1, fa6, rtz
                  flt.s        t1, fa5, fs2
                  sltiu        gp, t5, 2015
                  lui          s6, 38960
                  sub          a6, t5, s0
                  or           a5, s7, s1
                  fcvt.s.w     fs1, t6
                  srai         tp, s2, 29
                  xor          t0, t1, t0
                  xori         a7, t0, -1809
                  fmv.w.x      ft5, t4
                  sll          sp, t3, a1
                  sll          t0, a6, s7
                  ori          ra, s5, -959
                  mulh         s6, sp, s7
                  xori         t4, sp, -1150
                  fdiv.s       fa1, fs11, fs7, rne
                  divu         t6, t0, a2
                  rem          a4, a1, a0
                  sub          a0, a1, s5
                  mul          s10, t3, tp
                  addi         s4, a3, 1866
                  fsgnjx.s     ft1, fs10, ft4
                  auipc        a1, 945878
                  addi         s10, gp, 681
                  fsgnjn.s     ft11, ft6, fs6
                  fmax.s       ft1, fs4, fa2
                  div          s11, a2, a5
                  or           t2, a0, a3
                  sub          t5, t0, a6
                  slli         s10, s0, 19
                  ori          s5, a2, -1627
                  rem          s6, s6, s5
                  mul          s10, t1, s7
                  feq.s        sp, fs0, ft7
                  srli         s3, s3, 10
                  fle.s        a5, ft10, fs4
                  divu         zero, s8, s11
                  nop
                  fcvt.s.w     fs8, sp
                  fadd.s       fa2, fa2, ft2
                  addi         s6, sp, -2032
                  srai         a4, sp, 11
                  fdiv.s       fs10, ft5, fa2
                  fsgnjx.s     ft7, fa0, ft3
                  mulhu        s0, s2, a4
                  sll          sp, a6, s6
                  srl          t5, s2, s2
                  fmul.s       ft0, ft5, ft10, rdn
                  fmv.w.x      ft2, t1
                  auipc        t6, 763005
                  ori          a0, s10, 1986
                  slli         a7, s10, 11
                  sltiu        a6, a1, 1648
                  mul          t4, sp, t4
                  mul          sp, tp, s1
                  fsgnj.s      ft6, fs9, fs10
                  fadd.s       fa7, fa7, fs11
                  addi         s4, tp, -1014
                  mulhsu       a7, s10, s7
                  add          a1, s11, s8
                  fmax.s       ft2, fa2, ft0
                  lui          t0, 1021592
                  fcvt.w.s     s8, fs6, rdn
                  fdiv.s       ft11, ft10, fa1, rmm
                  fmax.s       fs9, fs8, ft8
                  and          a6, a4, zero
                  fsqrt.s      fs5, fs1, rtz
                  remu         gp, s5, s0
                  ori          tp, t2, 1950
                  lui          sp, 493535
                  sltu         t0, s10, t1
                  div          a3, tp, t6
                  fcvt.wu.s    a3, ft8
                  fmul.s       fs5, ft4, fa5, rdn
                  mul          t4, gp, s11
                  fsgnjn.s     fs2, fa0, fs8
                  fsub.s       fa4, fs8, fa2
                  nop
                  xor          tp, a0, a7
                  sltu         s10, gp, a3
                  ori          a7, a1, 1959
                  fmin.s       fs0, fa1, fs6
                  slt          t0, tp, a6
                  fclass.s     t0, fa1
                  mulh         zero, gp, a5
                  divu         zero, s8, s9
                  fmv.w.x      ft5, a4
                  flt.s        s8, fa2, fs4
                  fmin.s       fs2, fs1, ft1
                  lui          s3, 533826
                  fmul.s       fs5, ft1, fa6
                  ori          s0, s7, -1274
                  sltu         t4, t5, s7
                  fdiv.s       ft8, fa1, fs0
                  divu         t1, zero, t2
                  sll          t6, s3, ra
                  or           zero, s10, a3
                  mulhsu       sp, s10, gp
                  srli         t6, s9, 20
                  xori         t6, s11, -410
                  sra          s11, a7, a4
                  div          s1, sp, s5
                  sltiu        s11, s10, 1482
                  fcvt.w.s     s1, fa1
                  mulhu        a4, s8, t4
                  auipc        a3, 232550
                  and          a5, t5, a4
                  srai         sp, a4, 3
                  flt.s        s0, ft8, ft0
                  fcvt.s.w     ft11, t2, rtz
                  fcvt.s.wu    ft0, s5
                  fadd.s       ft6, fa3, fa7
                  or           a1, t6, sp
                  nop
                  srai         a1, a5, 30
                  ori          t2, a1, -1602
                  rem          s1, s8, a2
                  div          s6, t4, s11
                  and          a4, zero, t3
                  fsgnjx.s     fs2, fa0, fa6
                  fmv.x.w      gp, ft8
                  andi         a5, t1, -154
                  slli         s0, s8, 2
                  feq.s        s3, ft10, fs9
                  nop
                  mulhsu       t2, a6, s9
                  fclass.s     a7, fs0
                  fsqrt.s      fs2, fa0
                  fsqrt.s      fa4, ft5, rdn
                  fmv.w.x      fs11, gp
                  rem          a5, t2, a5
                  mul          a0, s2, a2
                  fadd.s       ft10, fa1, ft5
                  mulhsu       s0, t2, t3
                  mulh         t4, t2, a4
                  fsqrt.s      fs4, fs11, rdn
                  addi         a3, a7, -1161
                  fmul.s       ft7, fa4, fs6
                  add          zero, s7, s9
                  srl          s4, t4, s0
                  fmin.s       fs0, fs2, ft3
                  xor          t5, t0, s3
                  fmv.w.x      ft4, t2
                  mulh         t6, ra, t5
                  fsgnj.s      fs10, ft10, fa2
                  fsgnjn.s     ft2, ft6, fs7
                  fsub.s       ft4, fa4, fa0
                  fsqrt.s      fs1, ft0, rmm
                  fcvt.s.w     fa7, tp, rmm
                  srl          sp, a5, ra
                  feq.s        s2, ft1, fa3
                  fsgnjn.s     ft4, fs3, fs10
                  auipc        a7, 60199
                  flt.s        s8, ft2, fs0
                  rem          t4, t4, s6
                  feq.s        s1, fs4, ft10
                  slt          a5, t6, t5
                  ori          s1, ra, 191
                  divu         s6, t0, s10
                  remu         a2, s1, s7
                  fcvt.s.w     ft8, sp
                  sll          s0, t1, t1
                  fle.s        t4, ft11, ft10
                  fsgnjx.s     fs9, fs11, ft11
                  slt          s3, s3, s5
                  fcvt.s.wu    fa3, s7
                  divu         t6, sp, s0
                  fcvt.s.wu    ft3, a4, rtz
                  sra          t6, s2, s6
                  fcvt.s.wu    ft11, s1, rdn
                  fadd.s       fs4, ft9, ft9
                  fmin.s       ft6, ft7, fa7
                  fcvt.wu.s    s8, fa0
                  srli         t0, ra, 7
                  andi         s5, s7, 1329
                  lui          a6, 904832
                  add          t6, s11, sp
                  slli         a1, s10, 15
                  div          zero, a0, sp
                  and          s1, t3, gp
                  fsgnj.s      fa3, ft2, fa7
                  fmv.x.w      t4, fs11
                  divu         a7, s6, a6
                  fmv.w.x      fa5, s8
                  mulhu        sp, gp, t3
                  fmv.x.w      t5, ft9
                  slti         zero, a1, 1068
                  slli         s3, a1, 16
                  srl          t5, s1, a3
                  add          tp, s4, a6
                  feq.s        s1, ft5, fa3
                  slti         s3, a5, -1659
                  sltu         sp, s8, a7
                  fle.s        s8, fs6, fa7
                  div          a2, s9, t2
                  ori          a2, t6, 1217
                  divu         gp, zero, s5
                  andi         a7, t4, 1885
                  nop
                  sll          s3, s5, t5
                  flt.s        a2, ft10, fa2
                  fle.s        gp, ft11, fs9
                  xor          a1, s3, t4
                  srai         s0, tp, 18
                  srai         s10, a4, 9
                  fcvt.s.wu    fa0, t2
                  fsgnjn.s     fs2, fs9, ft8
                  fcvt.wu.s    s2, fa5, rup
                  mulhu        s8, s1, t2
                  fsub.s       fs3, fs0, fa4
                  fsgnj.s      fs7, ft5, ft8
                  xori         s11, s2, -819
                  mulhsu       s0, a2, a3
                  slt          s4, a7, tp
                  fadd.s       fa4, fa2, fa4
                  sll          tp, s11, a7
                  fadd.s       fs11, fs6, fa2, rup
                  sll          t1, s6, s0
                  fmin.s       fa5, ft6, fs7
                  flt.s        s4, fa2, ft5
                  fmv.w.x      ft7, a1
                  fdiv.s       fa0, fa1, fa7, rmm
                  remu         t4, s5, a4
                  fsgnjx.s     fa3, fa5, fa0
                  fmax.s       fs10, fa2, fa4
                  slti         a1, t3, -1330
                  remu         t5, a2, a3
                  fsqrt.s      fa7, fa3
                  xori         a2, a3, -2026
                  sra          t2, tp, s2
                  slti         s10, s0, 1812
                  fle.s        s10, ft7, fa5
                  fsqrt.s      fs1, fa7, rmm
                  add          gp, a1, s7
                  rem          a0, s0, gp
                  mulhsu       tp, s6, t6
                  fle.s        a0, fs3, fa5
                  mul          ra, t5, s1
                  fsgnjn.s     ft6, ft1, fa7
                  add          s11, s10, s1
                  fdiv.s       fs11, ft11, fs1
                  xor          ra, tp, gp
                  remu         t4, t4, a1
                  andi         a6, t2, 726
                  srl          sp, a0, s10
                  slti         a6, s0, 1128
                  fsub.s       ft5, ft11, ft1
                  sub          s1, s4, s9
                  mulhsu       tp, tp, s8
                  slti         s3, s7, -163
                  mulhu        tp, a7, t2
                  fadd.s       fs9, ft8, fa0
                  xori         a3, a6, 712
                  sll          s3, t6, t3
                  addi         s4, s9, -353
                  fadd.s       ft5, fs10, fa0
                  lui          gp, 933494
                  fsgnjn.s     fa1, ft7, fa4
                  mulhsu       s3, s5, t1
                  fmv.x.w      s11, ft5
                  fle.s        s5, fs0, ft6
                  xor          s4, ra, s6
                  slli         a5, a3, 18
                  lui          a6, 214224
                  fle.s        a7, ft9, fa6
                  fcvt.wu.s    t0, fa4
                  div          t2, t4, ra
                  auipc        s2, 964404
                  fmul.s       fa7, fa4, fs0, rup
                  xor          t2, s9, a1
                  mul          a3, gp, gp
                  lui          a5, 876686
                  fsgnjx.s     fs4, fa4, fs6
                  slli         s6, a0, 27
                  fmv.x.w      a1, fs4
                  mul          a3, t5, gp
                  nop
                  fmv.x.w      s1, ft10
                  ori          s10, t4, -190
                  fsgnj.s      fs3, ft6, ft7
                  slt          t2, s6, a5
                  fsub.s       fs1, fs6, fa6, rne
                  fle.s        a6, ft8, fs3
                  slli         s11, s0, 6
                  fcvt.w.s     s0, ft0
                  andi         t5, t6, -1296
                  or           s1, tp, tp
                  srl          s1, a7, t3
                  fclass.s     a3, fs0
                  fsgnj.s      fs7, fa2, fs8
                  or           s1, s10, a7
                  slti         t5, s4, -535
                  divu         s1, s4, s10
                  fmul.s       fa0, fa0, fs3
                  sra          sp, zero, t0
                  remu         a7, a6, a5
                  xori         a5, s11, 118
                  xor          s3, s0, a3
                  mulh         tp, ra, s6
                  fsqrt.s      fs4, ft0, rne
                  fadd.s       ft1, fs3, ft7, rne
                  xor          a5, s3, a2
                  fadd.s       ft3, fs0, fs0, rdn
                  sltu         s6, s8, a2
                  xori         a5, tp, -174
                  sll          t1, a6, s10
                  srl          a6, s6, gp
                  fsgnjn.s     fs11, ft2, ft1
                  mulh         t4, s11, a6
                  sra          tp, t4, a1
                  rem          s1, a7, s9
                  divu         a6, sp, a2
                  ori          s0, s6, 9
                  div          a6, tp, t5
                  sra          s1, a7, t1
                  fmul.s       ft6, fa0, fa2, rup
                  sltu         t2, s3, s7
                  fmul.s       fs6, fs6, fa1, rne
                  sll          s10, a5, t2
                  ori          s5, s4, 1555
                  fmv.x.w      t1, ft7
                  fle.s        s10, fs2, fs9
                  sra          ra, s6, ra
                  fcvt.s.wu    fa7, s11, rmm
                  or           s5, ra, s8
                  or           a0, s1, s1
                  fcvt.s.wu    fa1, s3, rdn
                  fcvt.s.wu    ft6, a0, rdn
                  andi         tp, t5, -225
                  fmin.s       fa7, fs7, ft5
                  sll          a7, s10, s6
                  fmul.s       ft3, fs9, ft8, rmm
                  add          a5, zero, a7
                  slti         s1, a1, 344
                  feq.s        a0, fa5, ft7
                  fcvt.s.w     ft10, s9
                  div          a2, a4, t4
                  fmax.s       fs9, fs9, fs8
                  divu         s0, tp, a2
                  addi         a4, a7, -361
                  fsgnjx.s     fa3, fs10, ft3
                  srai         ra, s6, 3
                  fmin.s       ft0, ft11, ft10
                  flt.s        zero, ft7, fa4
                  fcvt.s.w     ft0, a7
                  mulh         t2, a7, zero
                  feq.s        a5, fa1, fa6
                  add          t6, t1, a6
                  fcvt.wu.s    a5, fa2
                  sra          a4, a6, t2
                  sll          t1, t3, tp
                  slti         sp, gp, 343
                  andi         a7, zero, -71
                  and          ra, t4, a2
                  or           s4, a2, s4
                  fcvt.w.s     s5, fs4, rne
                  fmv.x.w      t5, fa4
                  flt.s        s6, ft1, fs0
                  mulh         ra, a7, s10
                  xor          a7, ra, ra
                  andi         t2, s5, 1604
                  lui          s5, 480917
                  fcvt.wu.s    a7, ft1
                  fcvt.w.s     ra, ft2, rtz
                  mul          s0, s6, a3
                  auipc        a6, 804177
                  fdiv.s       fa6, ft8, fs3
                  sltiu        s2, tp, 632
                  mulhu        s10, s3, s5
                  lui          a2, 899655
                  srli         a2, gp, 30
                  flt.s        a0, fa6, fs1
                  sub          s5, s7, t0
                  mulhu        t1, t2, t3
                  auipc        s2, 516664
                  fmax.s       ft10, fa2, fs0
                  xor          s10, s11, ra
                  fcvt.wu.s    a1, fs1, rtz
                  fmv.w.x      ft2, t2
                  and          t0, a0, a5
                  sll          a7, t6, a5
                  fsub.s       ft3, fa4, fa5, rup
                  fsub.s       fs11, ft8, fs3, rmm
                  fmin.s       ft7, ft6, fs1
                  lui          a5, 423235
                  rem          t0, ra, s9
                  sltu         t1, a0, ra
                  slt          a2, t5, a3
                  slti         sp, t2, 340
                  fcvt.s.w     ft6, tp
                  auipc        s6, 729481
                  fsgnj.s      ft4, fs7, fa1
                  nop
                  fmul.s       fa4, fs5, fs4
                  feq.s        t1, fs5, fa5
                  divu         s2, t1, a7
                  mulh         a0, a2, ra
                  remu         a2, a7, a2
                  lui          t1, 303821
                  fmax.s       fa1, fs7, fa3
                  flt.s        s11, fs10, fs0
                  fsgnjx.s     ft7, fs8, fa0
                  flt.s        s10, ft10, fs6
                  add          gp, s7, s0
                  nop
                  mulhu        s6, s2, s10
                  mulhsu       s0, s0, t5
                  remu         a1, s1, s4
                  sra          a6, s7, zero
                  sltiu        t4, sp, 557
                  and          a6, s4, gp
                  fmax.s       fa2, fs3, fa7
                  slli         s5, a7, 4
                  rem          a7, ra, s11
                  fmin.s       ft5, ft11, fs5
                  xori         t4, t5, 1288
                  auipc        t5, 610912
                  fcvt.s.w     ft10, a1, rne
                  fcvt.wu.s    t1, fs9, rup
                  fmax.s       fa4, ft10, fs11
                  fsgnjn.s     fs3, fa4, fa1
                  fadd.s       ft9, fs9, fa1, rtz
                  fcvt.s.w     fa4, t4, rup
                  sltu         t2, sp, s8
                  sll          s11, t2, a4
                  sra          s11, a0, t0
                  fmv.x.w      s2, fs3
                  fmv.x.w      a1, ft5
                  slli         s11, t0, 12
                  and          t6, zero, a5
                  fmv.w.x      ft8, a1
                  feq.s        t0, ft11, fs8
                  fsub.s       ft1, ft10, fa6
                  lui          s6, 352210
                  and          a6, t4, a4
                  fcvt.s.w     fa3, a2, rdn
                  divu         t0, a7, s2
                  mulh         s2, gp, s1
                  fmax.s       fs6, fa0, fa7
                  srli         s10, tp, 0
                  fmul.s       fs11, fs3, fa3
                  fmul.s       fs9, fs10, ft9, rup
                  sra          a2, zero, s6
                  fsub.s       fa6, fs4, fs6, rmm
                  mulh         s11, a2, s2
                  div          t4, ra, a3
                  fmax.s       fs8, fa7, ft9
                  lui          t6, 177982
                  auipc        a4, 212260
                  fmv.w.x      fs4, ra
                  fle.s        s1, ft8, ft4
                  fcvt.s.wu    ft7, t3
                  srli         t2, s0, 9
                  fle.s        s11, ft11, fa1
                  feq.s        s0, fa1, fs0
                  sll          t2, a1, t3
                  auipc        s1, 626842
                  mulhsu       t1, t6, t0
                  fsqrt.s      fa0, fa6, rdn
                  slli         zero, s9, 2
                  divu         s2, t0, a7
                  fsgnjx.s     ft4, fs2, fs11
                  mul          s2, s9, ra
                  mulh         ra, a2, zero
                  auipc        s6, 561390
                  fsgnjx.s     ft0, fs0, fs0
                  fmul.s       ft5, fa6, fs11, rne
                  mulhsu       s10, t2, s9
                  remu         t2, s10, t4
                  nop
                  slti         tp, a3, 1661
                  addi         t4, s7, 876
                  ori          a5, a0, 1393
                  fsgnjn.s     ft5, fa7, fa2
                  fmin.s       fs3, fs6, fa3
                  mul          tp, t1, s5
                  or           s1, a6, tp
                  add          s2, s8, t2
                  add          s5, a2, s3
                  ori          tp, s4, -1375
                  and          s1, t1, s4
                  srl          a2, gp, t3
                  fsub.s       fs9, ft9, ft4
                  mulh         tp, t5, a4
                  and          zero, a1, s0
                  div          s0, ra, a5
                  fclass.s     zero, fs4
                  fclass.s     s3, fs0
                  mulh         a2, t1, t5
                  mulh         s8, a5, t3
                  srl          s5, a1, gp
                  xori         a7, a6, 2047
                  slli         s1, s1, 3
                  remu         s8, s8, t6
                  slti         s4, a3, 447
                  flt.s        t2, fs7, fa1
                  add          s0, s2, a6
                  flt.s        a5, fs11, fa3
                  rem          s1, s5, sp
                  srai         tp, ra, 22
                  fmul.s       fs9, fs8, fs4
                  fsgnjn.s     fa5, fs0, fs6
                  fclass.s     ra, fa4
                  remu         s10, s1, a6
                  fsgnjn.s     ft10, ft6, fa1
                  and          t4, s8, s1
                  sub          a2, s8, a0
                  sra          s2, a2, a6
                  divu         s1, s5, s0
                  auipc        a2, 560342
                  sltiu        zero, s10, 1648
                  fmv.x.w      zero, fs7
                  sll          zero, sp, ra
                  sltiu        t6, t5, 1098
                  feq.s        s3, fs10, fs8
                  divu         sp, t4, s11
                  ori          t0, s7, -1875
                  and          s11, a1, t4
                  sra          t1, t4, zero
                  fadd.s       fs5, fs2, fa2
                  fsub.s       ft8, ft2, fs8
                  slti         a6, a6, 1953
                  fsgnjx.s     fa2, ft11, ft1
                  feq.s        a3, ft0, fa3
                  flt.s        a5, fs0, fs0
                  fle.s        t6, ft11, fs6
                  fcvt.s.w     fs6, a6
                  fmv.w.x      fa5, a0
                  fclass.s     a1, fs4
                  slt          tp, a6, t4
                  sra          s10, gp, s6
                  xor          a5, t5, s7
                  add          t1, s6, a5
                  xori         s6, t2, -1648
                  fcvt.s.w     fs4, s0
                  sra          t5, s9, a2
                  feq.s        a4, fa4, fs9
                  srai         zero, gp, 5
                  and          a2, ra, s2
                  mulh         t6, t5, s1
                  fsgnj.s      ft2, fs7, fa6
                  div          tp, tp, t3
                  mul          a2, t6, s7
                  rem          s10, s8, s6
                  fclass.s     a2, fs11
                  mulhu        s2, s2, a0
                  feq.s        a2, fs11, ft9
                  sll          a0, s1, a6
                  add          zero, s0, s10
                  rem          a4, a4, t6
                  fadd.s       fs11, fs0, ft8, rtz
                  mulhu        t0, a4, s11
                  div          gp, t2, t6
                  fsqrt.s      ft3, ft7
                  fmv.w.x      fs5, a0
                  ori          s3, sp, -323
                  fcvt.wu.s    a4, fs7
                  lui          s6, 137570
                  div          a3, s3, sp
                  fcvt.wu.s    s5, ft8, rup
                  divu         t2, t1, s0
                  add          s3, s7, s1
                  fcvt.w.s     t6, ft2
                  slli         a2, s6, 0
                  xor          a4, ra, s9
                  fmv.x.w      a2, fa5
                  fadd.s       fs6, fs1, ft11
                  xori         a6, tp, -7
                  srli         a6, tp, 8
                  mulhu        a7, a2, s11
                  fmax.s       ft7, ft1, ft7
                  fmv.x.w      t5, fs10
                  fmin.s       fs5, ft3, ft8
                  or           s0, s11, a0
                  ori          s8, a0, 492
                  andi         tp, t3, -1546
                  slli         gp, a1, 31
                  fsgnj.s      fs3, fs1, ft1
                  ori          s4, s6, 1077
                  flt.s        s5, fs3, fs9
                  slt          zero, t0, tp
                  fmin.s       fa1, fa2, fa5
                  slt          a4, a4, s0
                  mul          a2, s9, ra
                  mul          tp, s0, t2
                  sra          s5, ra, t1
                  fcvt.s.wu    ft10, t4, rup
                  divu         a4, s1, a7
                  fdiv.s       fa0, fs0, fs6
                  sra          t4, a6, zero
                  div          s1, s3, t2
                  fcvt.s.wu    fs2, t6, rne
                  lui          a2, 831087
                  or           s6, a6, a0
                  lui          s6, 485589
                  fmax.s       fs2, ft3, ft10
                  flt.s        s11, ft2, fs2
                  rem          zero, t3, t1
                  fmv.w.x      ft9, s0
                  andi         s5, t3, -1469
                  fadd.s       fs3, fs0, fs8, rne
                  or           t4, a0, s5
                  slti         s6, s5, -263
                  fclass.s     s5, fs1
                  fsqrt.s      ft10, ft2, rdn
                  lui          a5, 15772
                  fmul.s       fs5, fa5, ft10
                  sltiu        gp, a5, 729
                  fsgnjx.s     fs8, fs4, fa1
                  and          a6, gp, t3
                  fmul.s       fa6, fs0, ft6
                  fsgnj.s      fs1, fs6, fa6
                  fmax.s       fa1, fs3, fs9
                  rem          s5, t5, t6
                  feq.s        ra, fs1, ft7
                  srli         t0, t3, 6
                  sltiu        sp, a4, -478
                  sll          a7, zero, a1
                  fmul.s       fs3, fs4, fs5
                  andi         zero, t6, -329
                  nop
                  fsub.s       fs2, fs0, fs8, rtz
                  srli         s8, a4, 1
                  fdiv.s       fs3, ft11, fa3, rdn
                  fle.s        t4, fs10, fa2
                  slti         s10, a0, 554
                  srli         sp, a3, 5
                  lui          s4, 131800
                  addi         s8, s6, -806
                  srai         a7, a4, 6
                  slti         t2, t3, 2036
                  andi         s10, s6, -1479
                  andi         a4, a5, 1126
                  sra          t5, t2, tp
                  fsgnj.s      ft8, fs6, ft10
                  andi         t4, a7, 1000
                  fcvt.s.w     ft3, a5, rne
                  fmv.w.x      fs0, s8
                  fmv.w.x      fa7, s2
                  fmin.s       fs0, ft7, fs7
                  slt          a1, gp, a0
                  slli         t0, s10, 5
                  and          t0, a7, sp
                  sll          tp, t5, t2
                  fcvt.s.wu    fs8, tp, rmm
                  flt.s        t6, ft6, ft6
                  fsgnj.s      fs1, ft4, fa7
                  flt.s        s5, fs2, ft10
                  fcvt.wu.s    t5, fs9, rtz
                  xor          a6, gp, t5
                  lui          s3, 151548
                  srl          a5, t3, s3
                  sub          a2, s11, a7
                  add          a2, t2, sp
                  fmin.s       ft8, fs0, fs5
                  slli         s3, s3, 22
                  fmin.s       fa3, fa0, fa4
                  add          s4, a4, s9
                  or           sp, a0, s6
                  fadd.s       fa0, fa3, ft8
                  remu         t1, a7, a2
                  srai         t5, s8, 15
                  remu         a5, s1, s8
                  sra          s10, a1, a3
                  fcvt.s.w     fs8, t2
                  add          s2, a0, s1
                  rem          zero, ra, a5
                  lui          sp, 974944
                  fclass.s     a7, fa7
                  slt          t0, s2, a5
                  fadd.s       fa2, ft3, ft2, rdn
                  fcvt.wu.s    a0, fs10, rne
                  addi         t2, ra, 639
                  srl          t4, t6, s11
                  fclass.s     tp, fs11
                  fsgnjx.s     fa2, fs6, fs5
                  slli         t1, s7, 6
                  add          t0, s5, zero
                  srli         t0, s0, 13
                  rem          gp, t3, t6
                  fcvt.s.wu    fs11, zero
                  fsqrt.s      fs5, ft0, rup
                  slt          sp, ra, a2
                  and          a2, a3, s8
                  fmv.x.w      s4, ft9
                  fsgnj.s      ft4, ft5, ft9
                  fcvt.s.wu    ft1, a6
                  auipc        t6, 747603
                  fmv.w.x      ft7, a5
                  fadd.s       fa6, ft4, ft0, rup
                  mul          a5, a4, t6
                  ori          tp, gp, -1779
                  srli         a2, zero, 12
                  sll          t4, s3, ra
                  fcvt.s.wu    fs3, s11, rtz
                  sltiu        a7, s9, -1315
                  slti         s8, s0, 1774
                  xor          s5, s2, a2
                  fmv.w.x      fs11, t3
                  fadd.s       fs10, ft2, fa6, rtz
                  fdiv.s       ft0, fs3, fa7
                  sltiu        s11, s11, -1482
                  fclass.s     t1, fa5
                  slt          s0, t3, a2
                  fsqrt.s      fs1, ft7, rtz
                  slli         a3, s0, 30
                  sra          t5, s2, t3
                  fsgnj.s      fa7, fa5, fa6
                  andi         s3, t0, -1537
                  sll          zero, a5, a6
                  sub          s6, s7, t6
                  fdiv.s       fa3, ft6, fa4
                  add          t4, t6, s9
                  srl          sp, gp, t0
                  fsgnjx.s     ft10, ft9, fa5
                  mulhsu       tp, t6, s9
                  srl          s3, a2, t6
                  rem          s5, a3, s6
                  fmul.s       fa0, fs11, fs9
                  add          s11, gp, s9
                  flt.s        zero, ft9, ft5
                  mulhsu       t1, s4, a3
                  fmul.s       ft7, ft7, fs4, rmm
                  fmv.w.x      ft1, s4
                  srli         tp, s1, 19
                  sra          s11, s0, a5
                  mulh         a1, a4, t4
                  sll          zero, s0, s4
                  fmul.s       ft4, ft0, fs2, rne
                  slt          s6, t1, a4
                  lui          a0, 904028
                  xori         t5, ra, -1742
                  fdiv.s       fs8, fa7, fs9, rdn
                  divu         s10, a3, tp
                  xor          t0, tp, s2
                  fsgnjn.s     fs0, fa3, fs1
                  fsub.s       ft7, fa1, ft4
                  srl          a1, s7, s7
                  fle.s        a6, fs9, ft7
                  addi         s5, s3, 1033
                  and          t2, s5, s10
                  fmul.s       fs6, ft1, ft5
                  add          t4, t6, gp
                  fmv.w.x      fs7, s6
                  feq.s        s3, fa1, fs7
                  rem          t6, tp, s8
                  remu         s4, s2, t0
                  remu         a7, t5, t0
                  auipc        tp, 467203
                  fmv.x.w      a3, ft3
                  fmin.s       fa0, fa1, ft7
                  lui          s5, 770831
                  addi         a0, a2, 1657
                  feq.s        s3, fa1, fs7
                  mulhsu       t5, s4, s5
                  and          s1, s4, a0
                  div          s11, t3, s7
                  fcvt.w.s     a4, fs1
                  xor          a7, t2, s4
                  flt.s        a3, ft7, fa7
                  fmul.s       fa3, fa5, ft7, rtz
                  sltu         a0, a4, tp
                  div          s10, t1, s8
                  fadd.s       fs3, fa2, fs9
                  fmv.w.x      ft4, s5
                  slti         t2, a1, -573
                  fcvt.s.w     fs9, t4, rne
                  andi         tp, s2, -676
                  or           s6, s9, t2
                  divu         s4, t2, t0
                  xor          t4, s9, s9
                  and          tp, t6, s8
                  slt          t2, zero, t6
                  fcvt.wu.s    a0, fa5, rtz
                  rem          s1, s8, t2
                  mul          t1, s5, s2
                  nop
                  fadd.s       ft4, ft4, ft0
                  srli         a1, s5, 8
                  sltiu        a6, a5, -825
                  add          a7, a4, ra
                  slt          s4, s9, s2
                  sra          s2, s5, s7
                  srai         s8, s2, 19
                  rem          s4, ra, s8
                  auipc        t5, 464546
                  fadd.s       ft11, fa3, fs2, rtz
                  fcvt.s.wu    fa5, s6
                  sra          zero, s3, a1
                  fsgnjx.s     fs6, fa3, fs9
                  fcvt.s.w     ft7, a4
                  fmax.s       ft7, ft3, fs4
                  mul          a5, sp, a0
                  fclass.s     s3, fs3
                  sltu         s4, a2, s6
                  divu         a2, a3, t2
                  sll          s8, s2, a7
                  rem          sp, s3, a4
                  sltiu        gp, sp, -118
                  sra          zero, s4, sp
                  sltiu        a5, gp, -1838
                  srai         s1, a0, 15
                  xor          a0, a5, s4
                  fsgnjx.s     fs2, ft8, fs9
                  remu         s0, t2, s0
                  slli         a5, a2, 24
                  divu         s5, s3, t5
                  div          s10, t6, s2
                  mul          ra, s6, s10
                  sll          a3, ra, s5
                  andi         tp, a3, -1240
                  fmul.s       ft4, ft8, fa4, rmm
                  xori         t6, t5, -1205
                  xori         ra, gp, 1143
                  fsqrt.s      fa5, ft3, rdn
                  srai         s4, s4, 0
                  fle.s        ra, ft6, ft1
                  sll          s3, s9, s2
                  add          a2, a4, zero
                  divu         t0, sp, zero
                  fsgnjn.s     fa6, fs10, fa6
                  fcvt.wu.s    sp, fs4, rmm
                  fsub.s       fs2, fs0, ft9, rne
                  rem          zero, s11, s3
                  feq.s        s1, fa5, fs3
                  fsqrt.s      ft9, ft8, rne
                  fcvt.w.s     t5, ft9
                  flt.s        t4, fs11, fa7
                  sub          t0, a3, s0
                  mul          s3, gp, a4
                  sltu         t2, s1, t4
                  flt.s        t4, fs5, ft11
                  fadd.s       fs10, fs2, fs2, rtz
                  fmax.s       fs9, fs5, ft5
                  fcvt.w.s     t0, fs6
                  fcvt.w.s     ra, fs11, rup
                  fclass.s     s0, fs6
                  slli         s5, a0, 3
                  fmul.s       fs8, fs11, fs9, rmm
                  flt.s        a5, fa7, ft9
                  xori         s1, s1, -90
                  mul          s10, t6, s8
                  nop
                  sltiu        sp, s5, -866
                  feq.s        t0, ft7, ft2
                  fsqrt.s      fs0, ft10
                  fcvt.s.wu    ft8, s1, rmm
                  fle.s        s1, fa7, fs0
                  lui          t1, 207601
                  andi         s5, sp, -695
                  ori          a3, s1, 411
                  addi         a4, zero, -940
                  fadd.s       fs1, fs3, fs0, rne
                  rem          s4, gp, a6
                  slti         s8, a2, 388
                  mulhu        s2, a2, s8
                  fadd.s       fa6, fa7, ft2
                  slli         s0, zero, 0
                  andi         gp, t3, 655
                  fclass.s     t0, fa4
                  ori          sp, a7, -1888
                  fmul.s       fs7, fs2, fs0, rup
                  mulh         a4, s1, a2
                  mulhu        t2, s0, s3
                  fsgnjn.s     ft9, ft6, ft7
                  flt.s        s2, fa5, fs6
                  fdiv.s       ft0, fa6, fs8
                  and          t6, a5, a3
                  sltiu        a0, s10, 1747
                  add          t0, t0, tp
                  fmax.s       fs3, ft11, ft2
                  auipc        s1, 995414
                  fmin.s       fa1, fa5, fa7
                  fadd.s       ft8, fs1, fs0
                  srai         s3, a0, 4
                  andi         t1, s3, -361
                  flt.s        s10, fs3, ft8
                  fcvt.s.wu    ft5, s11, rdn
                  nop
                  srl          t1, t6, s2
                  rem          t5, s1, s1
                  fcvt.w.s     s6, fa4
                  sll          tp, s7, a5
                  lui          s0, 581483
                  fle.s        a7, ft7, ft6
                  fcvt.s.wu    fa6, t3
                  slti         t1, s8, 871
                  sll          s3, zero, a6
                  sub          s11, t0, t5
                  feq.s        a6, ft8, fa5
                  mulhu        a0, zero, s6
                  sltiu        s11, s5, -149
                  fsub.s       ft1, ft1, ft8
                  sltu         s6, s11, s8
                  rem          s3, t5, t0
                  nop
                  div          t0, t5, s7
                  slt          tp, a0, s6
                  fcvt.s.w     fs3, s9, rdn
                  fmv.x.w      s1, ft5
                  feq.s        a4, fs6, fs10
                  fadd.s       fs9, fa1, fs7
                  fsgnjx.s     fa1, fs2, ft3
                  mulh         a5, s2, t4
                  mul          a3, t3, a7
                  nop
                  fmv.w.x      fa2, t0
                  fcvt.w.s     s6, fs11, rtz
                  sltiu        s11, a3, -172
                  mulhu        a2, s11, a3
                  sll          s5, t6, a3
                  slti         s11, t0, -1026
                  fmul.s       ft4, fa3, ft7, rup
                  fmax.s       fa5, fa7, fa0
                  fmv.x.w      a3, ft6
                  fclass.s     t6, fs2
                  ori          s1, a7, 1233
                  srli         s1, t0, 29
                  remu         t5, a2, s11
                  sra          s8, s1, s7
                  fsgnjx.s     fa7, ft4, fs11
                  fdiv.s       ft10, fa4, fs10
                  or           s6, s2, t0
                  mulh         t6, a6, zero
                  add          t0, t1, a4
                  mulhu        s3, s1, ra
                  mulhsu       zero, a3, a0
                  auipc        a1, 290563
                  fsub.s       fs6, ft3, fs0, rup
                  fmv.w.x      fa5, a5
                  xori         s1, a3, 858
                  sub          s11, a4, s7
                  xori         zero, s2, -1280
                  divu         s8, a5, s8
                  rem          a3, sp, tp
                  nop
                  fle.s        s8, fs11, fa7
                  fmv.w.x      ft1, t3
                  andi         t0, s7, -697
                  fcvt.s.wu    fs11, t5, rtz
                  feq.s        s8, fa5, fa3
                  sll          s1, t0, s8
                  mulhu        a5, a6, s11
                  fsgnj.s      fa1, ft3, fs4
                  mul          t1, a5, s1
                  fsgnj.s      fs5, fa4, fa3
                  fcvt.s.wu    fs3, a3
                  flt.s        t6, fa3, ft0
                  fcvt.wu.s    ra, ft5
                  sltiu        s6, ra, 1308
                  sub          a5, s6, s4
                  fcvt.s.w     fs0, a4, rtz
                  mul          a1, a1, s9
                  mulhsu       t6, a2, sp
                  fle.s        s3, fs2, ft10
                  xori         s10, s9, -70
                  slli         a7, s10, 15
                  fsub.s       fa4, fs1, fa4
                  fcvt.s.wu    fa6, s5
                  fcvt.s.wu    fs7, a0, rtz
                  divu         tp, t0, s6
                  fmin.s       fa2, ft0, ft2
                  fcvt.w.s     s3, ft0
                  addi         a2, t3, 1077
                  fmv.x.w      a7, ft4
                  sra          s4, s7, t6
                  fsqrt.s      fs2, ft10
                  fmax.s       ft7, fa3, fa1
                  fmax.s       ft6, fa0, ft0
                  nop
                  mulh         s1, s7, tp
                  fsub.s       ft9, fa2, ft5, rtz
                  nop
                  feq.s        t4, ft4, ft1
                  fadd.s       ft8, fs9, fs9, rtz
                  xor          s2, s3, s7
                  fmv.x.w      s8, ft9
                  srai         zero, tp, 1
                  fmax.s       fs11, fa2, ft2
                  fmv.w.x      fs2, s0
                  nop
                  andi         a7, sp, -1289
                  addi         t4, a3, -1604
                  flt.s        t0, fs7, fa7
                  srl          sp, a1, s10
                  flt.s        a6, fs4, ft10
                  sltu         t1, s9, s3
                  sltu         s2, s9, s6
                  andi         s5, s9, -1187
                  fmul.s       ft3, ft6, fs3, rdn
                  srli         s3, s5, 26
                  fmv.w.x      fs4, t6
                  or           s3, a7, a1
                  rem          t1, a6, a3
                  fmul.s       fs4, ft1, ft10, rdn
                  fsub.s       fa3, fa7, fs10
                  srai         s11, t3, 7
                  fadd.s       ft0, fs11, fs3, rtz
                  feq.s        s0, fs5, fa2
                  lui          t6, 893337
                  slli         t5, s9, 19
                  sra          gp, s6, s4
                  auipc        s0, 1043033
                  addi         tp, t5, 1255
                  fcvt.wu.s    ra, fa4, rdn
                  xori         s11, s5, 813
                  srli         a4, a1, 22
                  srai         t1, a0, 27
                  fmul.s       fa1, ft8, fa4, rdn
                  and          t4, a6, zero
                  nop
                  fadd.s       ft11, fa5, fs6, rmm
                  sub          s11, s3, s6
                  fdiv.s       fs8, fa2, fs4, rdn
                  fmv.w.x      fs6, t1
                  fmv.x.w      t1, fa1
                  sltiu        s11, s3, -1899
                  fsgnj.s      fa2, ft6, ft10
                  fcvt.s.wu    ft9, s1, rne
                  fsub.s       fs11, ft4, ft9
                  auipc        s10, 669857
                  fsqrt.s      fa3, ft0, rmm
                  fsqrt.s      fs7, fa3, rdn
                  fmax.s       fa1, ft2, fs10
                  feq.s        t2, ft11, fs10
                  fmax.s       fs1, fs10, ft3
                  mul          t6, ra, sp
                  divu         t0, a5, t6
                  mulh         t4, tp, s7
                  sll          gp, s6, s3
                  fsgnjx.s     ft2, fa2, ft7
                  slti         s0, t6, -1059
                  sltu         s6, a1, tp
                  sll          t5, t0, t2
                  and          tp, a2, s11
                  fadd.s       ft8, fs10, ft2, rne
                  ori          tp, s6, -680
                  add          a2, t6, a3
                  fdiv.s       ft9, fa6, fs4
                  sltiu        a1, a0, -538
                  div          s6, s3, gp
                  fsgnjx.s     fs9, fa4, ft7
                  remu         zero, sp, a2
                  fsgnj.s      fs3, fs4, fs10
                  fcvt.s.wu    fs9, a2, rdn
                  fmax.s       ft4, fs11, fa6
                  fcvt.wu.s    a3, fs8, rtz
                  fsub.s       fs10, fs1, fa6
                  srli         tp, a7, 31
                  ori          t4, s7, -661
                  sra          t6, s11, t0
                  nop
                  fsgnjx.s     fs7, fs8, fs8
                  andi         a5, s1, 773
                  mulhu        t2, s3, ra
                  mulh         s3, a3, t3
                  and          a3, a4, s1
                  fsgnj.s      fs4, fa6, fa5
                  add          a0, t6, a0
                  fdiv.s       ft8, ft3, fa5
                  fsgnjn.s     ft11, ft1, fa4
                  fmax.s       fs6, fa0, fa3
                  fsqrt.s      fs1, ft7
                  mulhu        a7, tp, s6
                  addi         a5, a1, 264
                  mulhu        a2, s8, t1
                  or           ra, s5, ra
                  or           s8, t2, s1
                  auipc        a1, 152844
                  fadd.s       fs11, fa0, ft5, rmm
                  slli         s10, t0, 4
                  sltu         sp, a7, a2
                  mulh         a3, a3, t1
                  fcvt.w.s     a7, fs4
                  fclass.s     a5, fs7
                  srai         t2, zero, 27
                  slti         t5, tp, 800
                  slti         t5, t1, -612
                  xori         s11, s5, 1334
                  sub          a3, t3, a5
                  mulhu        a7, s0, t0
                  xor          tp, t0, gp
                  fmv.x.w      a1, fs6
                  fcvt.w.s     zero, ft8
                  xori         a1, t4, -1199
                  mulhsu       tp, t4, s2
                  fcvt.s.w     ft2, s0, rdn
                  sltiu        a1, s5, 313
                  feq.s        zero, ft2, ft7
                  andi         t4, s5, -1556
                  xor          a2, s6, t3
                  xor          tp, a3, zero
                  xori         a4, t0, 594
                  slt          s2, s9, s2
                  fsgnjx.s     fs6, fa2, fs2
                  fmv.w.x      fs0, s10
                  fmv.x.w      s6, fs1
                  xor          a7, s5, t3
                  ori          tp, a1, 279
                  or           gp, s3, s8
                  mul          s10, tp, t0
                  fmv.x.w      s8, fa1
                  mulhsu       t2, s8, s7
                  fmax.s       ft1, ft5, fa5
                  auipc        s10, 38852
                  fmax.s       ft4, fa3, fs8
                  fsub.s       fa0, ft10, ft10
                  slli         s10, t0, 5
                  slt          s4, a0, sp
                  fmv.x.w      t1, ft3
                  fsgnj.s      ft1, fa3, fs4
                  andi         s0, t3, -821
                  sll          s10, t0, a0
                  slli         t2, s6, 31
                  fcvt.w.s     a1, fs6, rup
                  addi         s5, t5, 590
                  nop
                  addi         s0, t6, 323
                  fmax.s       ft0, ft8, ft5
                  fadd.s       ft5, ft3, ft1, rtz
                  fcvt.s.w     ft8, a5, rne
                  or           t1, s1, s3
                  sll          s6, s2, t5
                  fmv.x.w      a7, fa3
                  fmul.s       fa2, fa1, fs6, rne
                  fcvt.s.wu    fa4, a1
                  sub          tp, s5, zero
                  sub          a7, s6, t4
                  fmul.s       fs11, ft5, fs6
                  sll          sp, s0, s1
                  fsqrt.s      ft8, ft1, rdn
                  feq.s        s5, ft10, fs0
                  srl          s3, t3, s5
                  fdiv.s       ft2, fa0, fa7
                  mulhu        t6, s10, a5
                  fsgnj.s      fs7, ft8, fs8
                  flt.s        t0, fs2, fs11
                  addi         t6, s4, -1043
                  and          t4, a2, a6
                  fle.s        t4, fa1, ft6
                  srai         a6, t3, 31
                  fsgnj.s      ft6, ft7, fa7
                  slt          a1, s3, s5
                  sltiu        t0, a3, -1716
                  fmv.x.w      a1, ft2
                  slli         a5, a4, 11
                  feq.s        t2, fa0, fa2
                  mulh         s5, s11, t3
                  srli         t1, a3, 15
                  sub          s6, a5, a5
                  div          a4, s7, s10
                  fle.s        a7, fs8, fs9
                  nop
                  nop
                  fsub.s       fs11, fs1, ft2, rne
                  fcvt.s.wu    fs0, a4
                  fsqrt.s      fs10, fa2
                  fmv.x.w      tp, fs11
                  mulhsu       ra, s7, t3
                  fcvt.w.s     tp, fa5, rup
                  sltu         t2, t2, s3
                  mul          a6, s3, t0
                  mulh         a0, s10, a4
                  fmul.s       fa0, fa2, ft5
                  fmul.s       ft0, fa2, ft5
                  and          a3, a7, s3
                  slti         a0, s6, -1328
                  divu         zero, a4, s10
                  divu         s5, s11, s6
                  srl          t5, s4, s3
                  fle.s        s8, fs10, ft5
                  fsub.s       fs10, fa1, ft4
                  fmv.x.w      ra, ft5
                  sltu         a4, s4, a3
                  mul          s6, gp, s7
                  fmv.w.x      fs11, s5
                  mulhu        s11, a4, s11
                  remu         a7, t5, t3
                  mulh         s0, a5, s3
                  srli         sp, s7, 0
                  fcvt.w.s     t5, ft8, rtz
                  sra          s2, s9, s1
                  slli         sp, a7, 20
                  or           a3, tp, a3
                  fsgnj.s      fs7, fs8, ft6
                  mulh         s8, t5, t4
                  mulhu        s5, a4, sp
                  fsub.s       ft0, ft3, ft0
                  sll          a1, s3, t2
                  auipc        a4, 459092
                  fcvt.wu.s    s4, ft9, rne
                  feq.s        a3, fa5, fa7
                  slt          a1, t3, s6
                  sll          t1, t6, t2
                  add          gp, s8, s10
                  lui          a0, 308934
                  and          s1, t4, t2
                  divu         t2, s1, a4
                  fcvt.s.wu    fs5, s6
                  fcvt.s.wu    fa3, t4, rdn
                  nop
                  fcvt.s.wu    fs0, ra, rmm
                  fclass.s     a1, ft6
                  sltu         s8, t6, zero
                  or           sp, t4, zero
                  sltu         s10, a4, t6
                  fle.s        a0, fs9, fs7
                  flt.s        t4, fs1, fa2
                  mulh         s2, gp, t6
                  addi         a7, s0, 759
                  fcvt.wu.s    gp, ft11, rmm
                  feq.s        t2, ft1, fa6
                  feq.s        ra, fa4, ft2
                  fsgnj.s      ft5, fs10, fs10
                  fcvt.s.w     fa6, s9, rdn
                  fmul.s       fs10, fa3, fs11
                  sltiu        a6, t6, 1482
                  sub          s10, a6, a2
                  fsgnj.s      fa3, ft2, ft11
                  fcvt.w.s     s11, ft9, rdn
                  fcvt.wu.s    s2, ft6
                  mulh         ra, sp, s9
                  mulhsu       t2, s11, s0
                  nop
                  ori          s2, t0, -350
                  feq.s        gp, fa4, fs7
                  add          s2, t1, a0
                  mul          zero, s7, s5
                  srl          a7, s3, s9
                  fcvt.s.w     fs8, a5
                  feq.s        a3, fa6, ft10
                  fmul.s       fs4, ft8, fs4, rup
                  fcvt.s.wu    fa3, s1
                  slt          t6, s5, a0
                  fcvt.s.wu    fs6, s7, rup
                  or           gp, a7, ra
                  fcvt.w.s     s1, fs1, rdn
                  fcvt.s.w     fs4, s11
                  xor          a0, t5, t5
                  slli         t5, s4, 29
                  fdiv.s       fa3, fs5, fa2, rmm
                  add          s1, gp, t4
                  slt          s0, t1, t0
                  fsgnj.s      fa0, fa1, fa2
                  sltu         t6, a3, s8
                  slli         a7, s11, 14
                  xor          a4, t1, t3
                  slli         sp, t6, 20
                  fmin.s       fa6, fa2, fs5
                  srl          a3, tp, a7
                  remu         s5, s9, t6
                  slti         s3, t2, 575
                  fcvt.wu.s    a5, fs3
                  fmv.x.w      s3, ft8
                  flt.s        t6, fs3, ft0
                  rem          s11, sp, s6
                  and          s10, a6, gp
                  sub          a5, t3, a2
                  nop
                  andi         sp, s4, 1532
                  fdiv.s       ft10, ft1, fa5
                  div          a4, t4, a7
                  fmv.w.x      fa2, t6
                  mulhu        a1, a4, t3
                  flt.s        s3, fa3, fa6
                  fle.s        s0, fs1, ft1
                  mulhu        gp, a6, a7
                  slti         a1, tp, -1946
                  sll          a3, s0, s7
                  sll          s11, t4, t4
                  fcvt.s.w     ft11, s0, rdn
                  sra          a1, a3, a5
                  addi         s3, t5, -1612
                  div          s0, s3, a0
                  fmv.w.x      ft11, a0
                  andi         t4, t6, 603
                  mulhsu       t4, a2, s4
                  andi         a1, a4, 1530
                  auipc        t1, 743004
                  auipc        t4, 635197
                  fsgnjn.s     fa3, fa5, fa2
                  and          s1, t4, s6
                  srli         s5, a2, 3
                  fcvt.s.wu    fa7, ra
                  fdiv.s       ft6, fa6, fs5
                  ori          tp, s5, -12
                  rem          s6, s1, s0
                  mulhu        tp, t2, t4
                  xor          t1, t0, s10
                  remu         t0, s10, s0
                  slt          tp, s2, zero
                  fmin.s       fs3, ft9, ft7
                  andi         zero, a7, -1598
                  fmax.s       ft6, fs1, fs8
                  mulhu        a4, t3, t2
                  mul          s2, t2, a3
                  mulh         s3, s6, s8
                  fmul.s       fa2, fa5, ft2, rdn
                  ori          s8, a4, -1741
                  add          t6, s0, s9
                  auipc        s10, 375128
                  srl          a1, s11, ra
                  fmul.s       fa5, fa3, ft5, rne
                  lui          s5, 130893
                  flt.s        t4, fs5, ft4
                  sll          t4, s10, t5
                  feq.s        t5, fa3, fa2
                  sltu         a2, t0, s8
                  fsgnjn.s     fs1, fs3, fs10
                  feq.s        s2, fa4, ft6
                  slti         s10, a0, -1980
                  fadd.s       fs7, fa4, ft9
                  ori          s1, zero, 668
                  sltu         t4, a0, t1
                  fcvt.s.wu    fs10, s1, rmm
                  fcvt.s.wu    fs5, a5, rmm
                  feq.s        t5, ft9, ft7
                  mulhsu       t5, t0, a5
                  rem          s2, a2, s9
                  fsgnjx.s     fa5, fs8, ft8
                  fdiv.s       ft2, fs3, fa4, rmm
                  fmul.s       fa0, ft3, fs7
                  fmin.s       ft2, ft7, fs2
                  fadd.s       fa2, fs3, fa4
                  fsub.s       ft1, ft4, fs8
                  srai         t0, s7, 13
                  slli         s3, s0, 21
                  fcvt.s.wu    fs8, gp
                  fmul.s       ft4, fa7, fs5
                  slti         sp, t3, 882
                  lui          gp, 131912
                  addi         a2, a7, 1505
                  srai         s3, s2, 27
                  and          s11, a1, a7
                  srl          a0, a4, s8
                  lui          s4, 907096
                  slti         zero, a2, 1219
                  mul          a2, s7, a7
                  divu         s1, t3, a4
                  mul          a2, t6, zero
                  sltu         s6, s9, zero
                  flt.s        t2, fs9, ft0
                  fmul.s       fs9, ft0, fa2, rne
                  fsub.s       fs9, fs5, fa0, rtz
                  fcvt.s.w     ft8, s8, rup
                  fsqrt.s      ft0, fs9
                  fmul.s       fs3, fa6, ft3
                  fmv.x.w      t6, ft7
                  addi         s5, s9, -1386
                  fmul.s       fa2, fs2, ft4
                  divu         t6, tp, s8
                  andi         sp, a2, 1751
                  mulh         a4, s7, t1
                  addi         t5, a0, -59
                  srli         tp, t2, 3
                  fsgnjn.s     fs2, ft3, fs11
                  fsqrt.s      ft2, fa3, rdn
                  fle.s        a5, ft0, fs11
                  mul          s1, sp, sp
                  fcvt.wu.s    a5, fa6, rne
                  srai         s0, t4, 2
                  addi         sp, s8, -288
                  mulhu        sp, s1, s4
                  fcvt.wu.s    a6, ft6
                  mul          t4, a1, a0
                  ori          t4, s2, -1779
                  and          s8, a1, zero
                  mul          a2, t5, a2
                  fcvt.s.wu    ft3, a2
                  fcvt.s.w     fs0, s7
                  div          s1, t0, a1
                  sub          s3, t1, a5
                  and          t4, s5, s2
                  fmin.s       ft2, fs6, fa7
                  slt          s11, a5, s7
                  mul          t6, a3, s7
                  fsub.s       fs5, fa0, fa0, rup
                  fmul.s       fa4, fa2, ft9, rdn
                  mulh         a3, s1, a0
                  fmv.x.w      a3, fs7
                  fdiv.s       fa6, fs9, fs2, rne
                  fclass.s     s11, fa6
                  mul          s11, s10, s4
                  ori          t5, t1, -1265
                  feq.s        gp, fs7, fa3
                  andi         zero, a3, -1823
                  fadd.s       fa1, ft2, fs1
                  fmv.w.x      fa7, a4
                  nop
                  remu         a2, s6, s3
                  fcvt.s.wu    fs6, s3
                  sltiu        a2, s8, 1729
                  mulhu        s2, t1, a3
                  fmin.s       fs7, fa3, fa2
                  andi         s4, a7, 1386
                  fsgnjx.s     fa6, fa0, fs0
                  sltu         t6, a5, ra
                  fclass.s     sp, fs6
                  sra          a1, s4, a0
                  fsqrt.s      fs1, ft0, rdn
                  or           t4, t4, sp
                  mul          ra, tp, sp
                  mulhsu       a3, s5, s10
                  andi         t6, t0, 554
                  srli         s10, s2, 14
                  fsub.s       fa4, ft9, fs6, rmm
                  fmax.s       fs5, ft1, fa6
                  srli         gp, t4, 2
                  mulhu        ra, zero, tp
                  divu         a6, a2, s8
                  xor          a4, s11, a3
                  fsgnjn.s     ft4, fs8, fa5
                  xori         a1, t2, 1907
                  mulh         s6, a4, a3
                  fmin.s       fs5, fs6, ft8
                  fdiv.s       fa5, fs2, fs0
                  fsgnjx.s     ft7, fa5, fs7
                  srai         t4, s11, 10
                  fsgnj.s      ft1, fs8, ft2
                  fmul.s       fs6, fa0, ft6
                  fcvt.s.wu    ft10, s10
                  slt          t0, a6, s4
                  slli         s8, t3, 11
                  add          t1, s10, s5
                  sra          t1, a7, s5
                  fsqrt.s      ft7, fa5, rup
                  fadd.s       fs4, ft0, fs2
                  fmv.x.w      a0, fa6
                  andi         a2, s1, -1302
                  fclass.s     t0, ft7
                  fsgnj.s      ft1, ft6, ft9
                  srl          t6, t5, gp
                  fcvt.wu.s    t5, ft6, rdn
                  slli         ra, a3, 12
                  fmin.s       fs3, ft1, fs1
                  fadd.s       fs2, fs6, ft5
                  addi         s2, t0, 1078
                  fdiv.s       ft4, ft3, ft9, rmm
                  xor          t0, tp, t4
                  fcvt.wu.s    t0, ft8, rtz
                  ori          a3, s9, -1239
                  fmv.x.w      s5, fs5
                  sltu         tp, s9, t1
                  ori          t1, zero, 419
                  fsgnjn.s     fs0, fs10, ft3
                  mulhsu       t6, tp, a0
                  srai         s1, a3, 22
                  srl          a3, a7, gp
                  ori          s2, s5, 628
                  fcvt.s.wu    fs6, s0, rup
                  fsgnjn.s     fs3, ft6, fa7
                  mulh         t1, s0, t6
                  or           s2, s0, s5
                  fcvt.wu.s    t1, fs9, rmm
                  lui          s0, 223193
                  remu         s8, s4, s9
                  fmul.s       fa0, ft5, ft1
                  fcvt.s.w     fa4, a1, rtz
                  srl          s8, gp, s10
                  sltu         t6, a6, tp
                  fcvt.wu.s    s8, fs8, rne
                  slli         sp, t6, 15
                  remu         a2, t6, s11
                  sll          s5, s10, s11
                  auipc        s11, 608942
                  xor          s0, s8, t1
                  fcvt.s.w     ft8, ra, rtz
                  slli         sp, zero, 26
                  srli         a7, a6, 9
                  sra          s1, ra, s1
                  srl          s3, t1, s3
                  fdiv.s       fa2, fa5, fs7, rdn
                  sra          t0, a4, s11
                  fmv.x.w      a1, fs7
                  lui          a7, 858671
                  fmax.s       fa6, fa6, ft7
                  slti         zero, a5, -314
                  xori         a3, a4, -536
                  divu         s8, s9, s9
                  mulhu        tp, a5, gp
                  sub          a1, s5, s0
                  mul          a6, t0, s3
                  sll          tp, sp, s4
                  fadd.s       ft1, fa2, fs2, rmm
                  fmv.w.x      ft0, s5
                  add          s5, s4, s8
                  slli         a0, a1, 22
                  xori         zero, a2, -690
                  sltiu        t4, s7, 441
                  sltu         a6, s1, tp
                  flt.s        a6, ft10, fs3
                  srli         t2, a5, 18
                  ori          s11, gp, -174
                  srai         sp, zero, 18
                  addi         s11, ra, -375
                  fsgnjn.s     fs6, fs3, fa4
                  and          t6, s9, s5
                  nop
                  rem          a7, s0, t4
                  srai         s2, a7, 26
                  fsgnj.s      fa2, fa4, fs11
                  slt          zero, s2, s6
                  fdiv.s       fa4, fs7, ft4, rtz
                  sltu         a0, t3, s11
                  fsub.s       fs4, fs2, ft0
                  feq.s        a7, fa2, ft11
                  srli         s3, s6, 0
                  fsgnjn.s     fs3, ft3, fa0
                  divu         a6, s6, s8
                  fsub.s       ft4, fs8, fa2, rdn
                  srl          s6, t0, s6
                  fcvt.s.wu    ft6, a5, rup
                  fsgnjn.s     fa4, fs7, ft4
                  fmin.s       fs10, fs3, fa1
                  sll          s11, tp, a7
                  mulh         s10, a4, ra
                  remu         s11, zero, s0
                  sltu         s0, tp, s1
                  auipc        gp, 386268
                  mul          a1, t0, s8
                  fcvt.wu.s    a7, ft7
                  fsgnjn.s     fs11, fs10, fs6
                  mulh         s11, t6, t4
                  fmv.x.w      t6, ft8
                  feq.s        a3, fa5, ft10
                  sra          t6, s7, a5
                  div          a2, gp, s9
                  fsub.s       fa4, fs4, fs3, rup
                  sub          s8, ra, t5
                  sll          s3, a6, s2
                  sub          s11, gp, s11
                  fmv.x.w      s1, ft2
                  mulhu        s6, s2, s1
                  fcvt.w.s     a3, fa6
                  slli         sp, a4, 23
                  nop
                  slti         a5, s1, 1489
                  sub          ra, s9, ra
                  flt.s        t2, ft11, fs3
                  fsgnj.s      fa6, ft5, ft11
                  fmax.s       fa5, ft3, ft10
                  divu         s1, s3, s10
                  fclass.s     gp, fs10
                  fadd.s       ft3, ft11, fs9
                  xor          zero, s11, s10
                  mul          gp, gp, a5
                  fclass.s     s6, ft8
                  mul          s8, a6, s11
                  addi         t5, s0, -317
                  fsub.s       fa1, fs7, ft5, rne
                  srli         s4, a5, 28
                  sltiu        a3, sp, 205
                  sltu         a7, a2, s9
                  mulh         gp, ra, s1
                  fsgnjx.s     fa3, fs8, fs6
                  divu         s5, s6, a0
                  fcvt.w.s     a3, ft3, rne
                  fcvt.s.wu    fa1, a3
                  sub          gp, t4, ra
                  lui          s5, 626450
                  remu         s3, a5, a6
                  fsgnjn.s     fs7, ft10, ft0
                  fcvt.w.s     a2, fa2
                  fmul.s       ft6, fs0, ft9
                  fmul.s       ft3, fa7, fa1, rne
                  slli         ra, tp, 17
                  ori          tp, s4, -986
                  fdiv.s       ft6, fa4, ft3
                  flt.s        tp, ft7, ft5
                  srli         t1, s4, 22
                  fclass.s     t4, ft6
                  sll          t6, t5, tp
                  fmv.w.x      ft2, ra
                  fsgnjn.s     fs3, fs7, fa2
                  fsgnjx.s     fs8, ft8, fa0
                  fdiv.s       fa6, fs6, fa3, rdn
                  fsgnj.s      ft11, fa4, fs6
                  srai         s5, a3, 19
                  mulhu        t5, s11, t2
                  feq.s        t6, fa2, ft8
                  or           t1, t4, s6
                  slli         a1, s0, 25
                  xori         t2, t5, -1913
                  or           a5, gp, ra
                  andi         t5, a0, -1165
                  div          tp, s3, t3
                  mulhu        a4, t1, a3
                  fsqrt.s      fa1, fs5, rne
                  srl          t0, t3, s0
                  srli         s0, ra, 7
                  fcvt.w.s     t2, fs1, rtz
                  flt.s        s1, fa5, fa4
                  addi         tp, ra, -924
                  fsub.s       fa0, fs7, fs5
                  mulhu        zero, ra, s3
                  or           s4, a6, t0
                  fclass.s     s0, ft6
                  sltu         s6, s4, a7
                  ori          ra, t5, -1307
                  nop
                  nop
                  addi         s1, t5, -1105
                  slli         s0, a3, 24
                  fsgnjx.s     fs10, fa6, fs5
                  or           s8, a2, s11
                  xori         s2, s1, -208
                  nop
                  or           s8, t4, s2
                  fmv.w.x      fa7, t1
                  mulh         s4, s7, zero
                  rem          t1, a5, s9
                  srl          t4, a4, s9
                  and          a0, a4, a7
                  ori          t0, a2, -1410
                  fadd.s       fs6, fs8, fs0, rdn
                  mul          s8, tp, t6
                  or           a5, t2, a3
                  fmul.s       fs6, fs2, fs10, rne
                  rem          a0, a2, tp
                  mulhu        sp, sp, t3
                  fsub.s       fs3, fa4, fs3, rup
                  and          t5, a2, s3
                  mulhsu       s1, s0, s5
                  mul          ra, s3, t0
                  flt.s        s10, fs2, ft8
                  fmax.s       fs10, fa6, fs1
                  ori          a1, sp, -98
                  auipc        tp, 864057
                  sltiu        s10, s4, 288
                  fcvt.wu.s    a6, fs4
                  addi         t5, a2, -2010
                  add          s10, a4, sp
                  ori          a6, s0, -1464
                  fadd.s       ft0, fs11, ft4
                  fcvt.wu.s    s5, ft7, rtz
                  slti         s8, s2, -1469
                  srl          t0, sp, a7
                  fmv.w.x      fa5, t4
                  auipc        a0, 947810
                  div          t5, t4, t1
                  sltu         s10, s1, s4
                  sltiu        a5, a7, 1958
                  fsgnjx.s     fa0, fs7, fa3
                  ori          s4, t0, 877
                  fmv.w.x      ft10, zero
                  fdiv.s       fs8, fs11, fa4, rne
                  fcvt.s.w     fa6, a2, rdn
                  srai         s2, s1, 16
                  fsub.s       ft0, ft2, ft5, rne
                  sub          ra, a1, t4
                  fcvt.s.wu    ft11, a0, rtz
                  fcvt.wu.s    t5, fs9, rdn
                  or           a1, a0, sp
                  fmul.s       ft4, fs4, ft8
                  fmul.s       fs6, ft7, fs6, rtz
                  xori         a2, t3, -1758
                  fsub.s       ft2, fa7, fa7
                  flt.s        tp, fs7, ft9
                  sra          a5, tp, s1
                  xori         t4, s2, -1330
                  auipc        a2, 803169
                  fsgnj.s      fs0, ft1, fs4
                  div          s2, s3, t4
                  fmin.s       ft6, ft5, fs8
                  sltiu        s3, a6, 650
                  fdiv.s       ft3, fs11, fa7
                  div          s2, ra, s11
                  fdiv.s       fa3, fa2, fs8
                  fsgnjn.s     fa2, fs0, fs8
                  fmul.s       fs1, fs9, fa5
                  slli         tp, a4, 0
                  fcvt.s.w     fs6, gp
                  fmax.s       ft4, fs8, fs6
                  slti         a5, gp, -739
                  auipc        a7, 497203
                  srl          a6, a1, s4
                  andi         zero, s0, 1991
                  mulhu        a0, t1, a6
                  add          s4, s9, a6
                  srli         s3, t5, 2
                  divu         a3, s2, s1
                  fsgnjn.s     fs8, ft7, ft10
                  auipc        s3, 436270
                  sll          s8, s10, s7
                  slt          s5, s10, s9
                  fadd.s       ft1, fs11, fa7, rtz
                  fdiv.s       fs1, fs7, fa7
                  nop
                  srai         t0, s11, 18
                  srli         a7, t0, 1
                  mulhu        s11, t1, s3
                  feq.s        s1, fa6, ft7
                  fmul.s       ft2, fa2, fs9, rdn
                  fmul.s       fa2, ft7, ft0
                  ori          s5, t3, -1589
                  fadd.s       fs7, fa4, fs4, rmm
                  fclass.s     t4, fs11
                  slli         t2, s1, 11
                  fcvt.s.wu    ft1, s3, rmm
                  remu         s3, t1, a0
                  divu         s10, s11, s6
                  sub          s8, t0, ra
                  fmv.w.x      ft3, s4
                  fmv.w.x      ft1, a7
                  slti         s3, a4, 107
                  divu         a4, s11, t0
                  sltiu        t4, a7, -1953
                  fcvt.w.s     a1, fs7, rdn
                  sltiu        s4, s1, 578
                  fdiv.s       fa2, ft3, fs1
                  divu         t0, s11, tp
                  fcvt.s.w     fa5, s6
                  and          s6, s4, t1
                  sll          a7, zero, s10
                  fmv.w.x      fs2, gp
                  fclass.s     t6, ft11
                  xor          s4, s11, t5
                  div          a4, t4, t3
                  flt.s        t6, ft8, ft9
                  srai         a2, a2, 0
                  slt          sp, s9, s7
                  srl          s6, ra, s9
                  fdiv.s       fs11, fs8, fa2
                  sub          s1, ra, a1
                  fmax.s       fs0, fs5, fa7
                  xori         s5, sp, -1868
                  fmv.w.x      fs9, a3
                  slt          s1, s11, t6
                  add          a2, sp, a5
                  slli         a6, s11, 26
                  slt          s10, ra, gp
                  fsqrt.s      fs10, fa2, rmm
                  fcvt.s.wu    fs5, s10, rdn
                  rem          s0, t6, s10
                  slt          s5, s8, a0
                  feq.s        a3, ft11, fa5
                  fsgnj.s      fa5, fs11, fa6
                  fmin.s       ft5, fs8, fs0
                  feq.s        ra, fs0, fs5
                  fsub.s       fa0, ft4, ft11
                  or           a7, s11, s8
                  fmv.x.w      s11, fs3
                  mulhsu       t5, a7, a5
                  fsub.s       fs3, fs10, fs0, rdn
                  fmul.s       fa4, fs7, ft3
                  xor          t2, a1, t1
                  mul          t0, ra, t2
                  ori          gp, a5, -1088
                  fmul.s       fa3, fs2, fs3, rdn
                  fmul.s       fs4, fa1, ft10, rmm
                  div          sp, s6, a1
                  srli         tp, a2, 16
                  fdiv.s       fs5, ft8, ft2, rup
                  fle.s        s10, fa7, fa6
                  mulhu        zero, t1, zero
                  sra          s11, tp, s4
                  flt.s        sp, ft4, fa1
                  addi         ra, s11, 176
                  sll          t4, t0, t5
                  fmul.s       fs11, fa0, ft9
                  rem          s3, zero, a3
                  sub          a1, s11, a1
                  fle.s        a6, fs11, fs2
                  fsgnjn.s     fs8, ft2, ft5
                  flt.s        a4, fs4, fs4
                  srli         sp, s6, 25
                  fmul.s       fs3, ft3, fs10, rne
                  mulhu        a1, s10, s4
                  fmul.s       ft11, fa1, fs0
                  nop
                  fcvt.s.w     fa3, ra
                  and          s8, t5, s8
                  fsgnj.s      ft9, fa3, ft7
                  fmv.x.w      s11, ft2
                  sltu         s1, s1, s5
                  mulh         a0, a0, s6
                  fsgnj.s      ft4, ft11, fa0
                  sll          s0, s0, a4
                  sll          s0, t2, s4
                  rem          a1, t1, gp
                  fmv.x.w      a2, ft5
                  mul          s8, s7, s2
                  fle.s        s11, fa7, ft1
                  fmin.s       fs4, fs2, ft8
                  lui          s0, 73401
                  fsqrt.s      ft4, ft7
                  mul          ra, t0, t2
                  mulh         tp, s4, a0
                  feq.s        t5, fa7, ft3
                  feq.s        t2, fs11, ft11
                  sll          a6, s10, t4
                  slti         t5, sp, 1675
                  and          ra, a4, s0
                  fsgnjn.s     fs6, fa3, fs7
                  xor          t1, s8, s5
                  mulh         a3, a4, s3
                  rem          zero, s6, zero
                  xor          s0, a6, a1
                  or           t0, s11, a3
                  fsgnjx.s     ft2, fs1, ft4
                  mulhu        a7, a3, sp
                  auipc        a1, 945977
                  fmax.s       ft7, ft1, fs10
                  fmax.s       fs0, fs11, fs6
                  fmv.x.w      tp, fs11
                  fle.s        tp, fa1, fa4
                  fmin.s       fs3, fa3, fs6
                  lui          s2, 207247
                  addi         a7, s8, 1294
                  fcvt.wu.s    t6, ft9
                  sll          s0, a0, s11
                  feq.s        a4, ft7, ft8
                  fsgnjx.s     fa7, fa1, fs11
                  fcvt.wu.s    a1, ft9
                  slti         t1, t6, -840
                  fsqrt.s      fs4, ft3, rtz
                  sltiu        t6, ra, 1630
                  remu         t1, s5, ra
                  nop
                  remu         a2, s7, a2
                  fclass.s     s1, ft2
                  fsqrt.s      ft2, ft2, rdn
                  mul          a2, a4, s5
                  slt          s2, a5, s9
                  fcvt.s.wu    fa4, a7
                  lui          s2, 381593
                  fcvt.s.wu    ft1, a2
                  auipc        a1, 892914
                  fcvt.s.w     fs10, s7, rtz
                  fcvt.wu.s    t2, fs1
                  fmv.x.w      s0, ft5
                  addi         a1, s6, -115
                  fdiv.s       fa7, fs6, ft11, rtz
                  srai         a3, t5, 20
                  fsgnjn.s     fs6, fs8, fa5
                  slti         a4, s11, -113
                  slti         ra, s1, 673
                  slti         s2, s2, -368
                  fsqrt.s      ft2, ft5
                  fmv.w.x      fa1, a5
                  fsub.s       fa2, fs5, ft7, rdn
                  fcvt.s.w     fs7, s0
                  ori          a1, ra, 1482
                  fmul.s       fs10, fs2, fa2, rup
                  add          s2, a0, a2
                  slli         s1, a3, 13
                  fsub.s       fs5, fs10, ft8, rup
                  srli         a7, a4, 10
                  fsgnjn.s     fs6, fs1, ft4
                  sub          s10, a6, a6
                  add          s5, s5, t0
                  fsgnj.s      ft11, fs10, ft2
                  divu         sp, a3, s8
                  div          t6, t1, a7
                  fdiv.s       fs3, fs10, ft4
                  rem          a4, s1, s5
                  sltu         s6, s2, t5
                  add          s10, s2, t5
                  remu         t2, s11, t3
                  slt          a5, s9, t4
                  sra          a6, s8, t4
                  fmv.x.w      sp, fa5
                  sltu         s2, a2, s6
                  fmul.s       ft11, fs2, fs9
                  fcvt.w.s     t0, fa6, rne
                  fmv.w.x      ft7, a3
                  fcvt.s.w     ft7, a3, rne
                  fsgnjx.s     fs10, ft11, ft10
                  ori          t4, s4, -71
                  feq.s        s8, fs0, ft0
                  sltiu        tp, s7, -543
                  sll          t0, t5, s2
                  flt.s        gp, fs1, fs7
                  mulhsu       s3, s9, a4
                  add          ra, t3, s5
                  srli         t2, s1, 28
                  sra          t0, s6, t3
                  nop
                  fcvt.s.w     ft11, s8, rtz
                  fcvt.s.w     ft4, gp
                  fcvt.w.s     a6, ft11, rne
                  slli         s4, gp, 5
                  fsgnjn.s     fs1, fa3, ft1
                  add          zero, t1, gp
                  andi         gp, t4, -667
                  fcvt.w.s     s5, ft6, rtz
                  fmul.s       fa4, ft6, fs9, rtz
                  andi         a3, a0, -1124
                  fmul.s       ft5, ft9, fa3, rmm
                  slti         s0, sp, 145
                  mulh         t5, s10, t3
                  divu         t5, s8, s7
                  fmv.x.w      s3, ft1
                  sltiu        a7, s0, 1919
                  addi         s10, s8, 17
                  fmin.s       fa3, ft6, fa1
                  fcvt.wu.s    tp, fs4, rtz
                  nop
                  lui          a7, 820888
                  fsub.s       fs3, fa6, ft7
                  sra          s10, s6, s10
                  fmin.s       fs7, fa1, fs9
                  sltiu        s2, s6, 312
                  and          a4, zero, s10
                  slli         t2, zero, 20
                  add          s2, a0, s6
                  sra          a4, t0, a4
                  fcvt.wu.s    t0, fa4, rdn
                  auipc        a0, 999950
                  fmul.s       fs5, ft4, ft1, rmm
                  divu         t2, t4, a4
                  mulhu        zero, s2, s0
                  slli         s2, a5, 9
                  or           t4, t6, t3
                  addi         a0, s10, -1883
                  auipc        gp, 112045
                  srli         t6, t1, 9
                  fcvt.wu.s    s8, ft4, rne
                  fmax.s       ft6, ft6, fs4
                  fmax.s       fa3, fa2, ft9
                  srai         sp, s9, 11
                  fle.s        s6, fs4, fs0
                  ori          a7, a0, 780
                  divu         a7, t0, s7
                  slt          a0, a4, s4
                  slli         a4, a5, 5
                  mul          s3, s4, zero
                  mul          t5, s1, s10
                  add          a6, s2, t2
                  srl          a7, s10, a5
                  auipc        a6, 753056
                  and          a0, t5, t5
                  slli         a3, a1, 24
                  fsub.s       fa4, fs3, ft11, rtz
                  sub          t5, a3, s11
                  sub          gp, zero, s9
                  sra          t1, t4, t6
                  addi         t5, s10, -1539
                  fmv.w.x      ft9, s5
                  or           s0, s4, zero
                  slt          s11, s11, t4
                  mul          a4, t0, a1
                  fsqrt.s      fs3, fs3, rtz
                  fcvt.w.s     s3, ft7
                  add          t2, s8, t5
                  mulhu        s2, t5, a1
                  srl          a3, s7, t5
                  srl          s1, s2, tp
                  slti         s4, t4, 863
                  fsub.s       fs2, fa2, ft3, rmm
                  fcvt.s.wu    fs4, s5
                  mulhsu       zero, t0, t6
                  srl          s0, tp, s2
                  mul          a6, s5, s5
                  fcvt.w.s     t1, fs4, rup
                  slti         s10, a1, 1037
                  fsgnj.s      ft1, fa5, fs10
                  fcvt.s.wu    ft11, tp, rdn
                  fsub.s       fs7, fa3, fs10, rup
                  fle.s        s1, fa0, fa0
                  fcvt.wu.s    a0, fs0
                  fdiv.s       fs10, ft6, fs0
                  addi         a3, s3, 69
                  fcvt.wu.s    t0, fs10
                  fcvt.wu.s    a3, ft2, rtz
                  remu         a4, sp, t1
                  sltu         a0, s1, s6
                  sltu         s0, s9, t4
                  ori          t4, s2, 1153
                  srl          a1, a5, a7
                  xor          t4, a1, a6
                  sltu         zero, a1, ra
                  sll          t6, s5, a5
                  fdiv.s       ft5, ft3, fs7
                  fsqrt.s      fa5, fa1
                  sltiu        a6, t1, -300
                  fclass.s     s11, fs11
                  fsgnjx.s     ft7, fa7, fs9
                  fmv.w.x      ft9, s3
                  div          s0, a4, sp
                  flt.s        s2, ft10, fa3
                  fmul.s       ft9, fs10, ft5, rne
                  rem          s1, t3, s8
                  fmv.w.x      ft11, s8
                  remu         ra, t6, s10
                  divu         t2, a5, s5
                  nop
                  div          t6, zero, t0
                  fcvt.wu.s    gp, ft8, rup
                  fcvt.w.s     t1, ft5
                  fsub.s       fs4, fs6, fs5
                  fcvt.s.wu    fs7, a6, rdn
                  fcvt.s.w     ft0, a5
                  fmv.w.x      ft1, s4
                  fsgnjx.s     fa7, ft8, fs8
                  flt.s        gp, ft9, fs3
                  fsub.s       fs8, fs7, ft5, rdn
                  fle.s        s1, ft0, ft9
                  lui          s0, 584583
                  fsub.s       fs1, ft7, ft6, rdn
                  mul          t4, s9, s7
                  fmax.s       fs7, fa0, ft6
                  add          sp, s0, tp
                  lui          a2, 218100
                  nop
                  add          t2, ra, a5
                  fadd.s       ft11, ft8, fs0
                  fsgnjx.s     fa0, ft1, fs1
                  fcvt.w.s     a3, fs8, rmm
                  srli         ra, a7, 28
                  srli         t6, t2, 31
                  lui          s5, 547753
                  fclass.s     s0, fs9
                  fcvt.w.s     a6, fa1
                  mulhsu       s2, a3, s4
                  mulh         s3, gp, s0
                  andi         t5, t3, 297
                  fadd.s       ft8, fs9, fs7, rdn
                  fmul.s       fs5, fs1, fa7
                  fsgnj.s      fs10, ft2, fs6
                  flt.s        s10, ft6, fa5
                  xor          s2, tp, s7
                  mulh         a1, t2, t4
                  flt.s        s3, ft6, fs7
                  fcvt.s.wu    fa1, ra, rdn
                  xori         a5, a7, 730
                  sll          t5, zero, s8
                  slt          t5, a7, t1
                  fcvt.w.s     a4, ft3
                  or           s2, a2, a4
                  fsub.s       ft5, fs1, fs11
                  fcvt.s.wu    ft8, t1, rmm
                  fmul.s       fs5, fa1, fs4, rdn
                  remu         s5, ra, s5
                  ori          a2, a4, 706
                  fclass.s     t1, fs11
                  fsub.s       ft10, fs5, ft11, rup
                  fmin.s       fs11, fa3, ft10
                  fmv.w.x      ft0, s0
                  flt.s        s5, ft1, fs11
                  fcvt.s.w     ft11, a0
                  mulhu        zero, a3, gp
                  remu         gp, s10, s0
                  auipc        t6, 682371
                  mulhsu       s0, gp, s2
                  fclass.s     s10, fs2
                  feq.s        a0, ft10, fs2
                  ori          sp, s5, -204
                  xori         s6, s1, 1398
                  fcvt.s.wu    ft11, s1
                  sll          s0, a2, s7
                  andi         s2, sp, -373
                  fdiv.s       fs1, ft9, fs7, rtz
                  add          s3, t5, a4
                  add          a1, a3, s1
                  fadd.s       fa7, fa6, fa3
                  fmin.s       fa6, ft0, ft7
                  andi         s1, s1, -357
                  fcvt.s.w     ft7, zero, rtz
                  auipc        s3, 449407
                  fsub.s       ft4, fs10, fs5, rdn
                  remu         a0, a5, tp
                  fsub.s       ft3, fs6, fa2, rtz
                  slt          a3, s6, t1
                  fsqrt.s      fs3, fs5
                  feq.s        ra, fa6, ft4
                  fmv.x.w      t4, fa4
                  xor          a7, a3, a6
                  sub          s1, s9, a6
                  fsgnj.s      fs7, ft4, fs11
                  ori          t4, a6, 492
                  sub          ra, gp, s4
                  rem          s6, ra, t5
                  fsgnj.s      fa2, fs11, ft0
                  nop
                  fdiv.s       fs11, fs2, ft9, rne
                  ori          s2, t1, -892
                  sltu         t5, s7, zero
                  div          s3, t4, ra
                  div          s0, ra, t4
                  fcvt.wu.s    zero, ft2, rtz
                  srl          ra, s6, a0
                  addi         s10, a0, 802
                  andi         t6, s3, -935
                  fmin.s       fs0, fa6, ft0
                  fclass.s     a3, fs5
                  srl          s5, a3, t3
                  fdiv.s       fs10, ft2, ft3, rne
                  fsgnjn.s     fs4, fa1, ft1
                  add          a5, t1, s6
                  fle.s        a7, fs5, fa5
                  fsgnj.s      fa6, fa5, fs5
                  slli         s8, t2, 7
                  fmax.s       fa6, fs2, fa3
                  xori         a3, s1, 2014
                  fsqrt.s      fs0, fa0
                  slt          s6, t6, a0
                  mulhu        tp, ra, s10
                  sra          t4, sp, a1
                  lui          s10, 84298
                  ori          t4, a6, 238
                  xor          t5, s3, s3
                  xor          s1, a2, s4
                  slt          a7, s5, a7
                  fmax.s       fa2, fs2, fs8
                  fmv.w.x      fs9, s7
                  sra          a3, s6, a0
                  mulhsu       t5, gp, ra
                  slli         a2, a1, 13
                  fsgnj.s      fs8, fa6, fs4
                  fcvt.wu.s    t2, fs9
                  fsub.s       fs3, fs11, fs4, rmm
                  fmul.s       fs2, fs1, ft7
                  sra          a3, s1, t6
                  rem          a2, s1, tp
                  fcvt.s.w     fs6, s10
                  add          s3, s7, a1
                  fcvt.s.w     fs7, t1, rne
                  fmax.s       fa3, fs11, fa0
                  mulhu        a6, t6, t5
                  slti         a0, a2, 1254
                  mulhsu       a3, s0, s1
                  sub          a3, t5, s1
                  flt.s        t1, ft4, fs1
                  slli         s1, s11, 6
                  div          a4, s9, s4
                  ori          gp, sp, 885
                  srl          t5, t4, t5
                  srai         a1, t4, 29
                  fmin.s       fa6, fs9, fa7
                  fclass.s     s11, fs9
                  andi         t1, sp, 197
                  rem          t0, s3, t3
                  fsgnjx.s     fs4, ft5, fa2
                  srli         t5, ra, 16
                  fsgnj.s      fa0, fs2, ft4
                  fmv.x.w      t6, ft7
                  flt.s        s4, fs5, fs4
                  fsqrt.s      fs4, fs2, rtz
                  fmul.s       fa3, ft9, fs10, rne
                  mulh         s0, s6, t6
                  fcvt.s.w     ft2, a3, rdn
                  auipc        a1, 82424
                  srai         tp, t1, 28
                  fsgnj.s      ft11, fs2, fs7
                  flt.s        a4, fs10, fa0
                  auipc        gp, 479182
                  ori          t0, gp, -1508
                  and          a4, sp, a2
                  sltu         a0, s10, a4
                  divu         zero, s1, s2
                  fmv.w.x      fs1, t2
                  flt.s        gp, fs1, ft10
                  fdiv.s       ft6, fs3, fs5
                  fcvt.wu.s    s5, fs11, rtz
                  fcvt.w.s     a7, fa1, rmm
                  fsqrt.s      ft0, fs8, rne
                  auipc        t5, 448391
                  fsqrt.s      ft0, fs6, rmm
                  mul          a0, t3, ra
                  srli         sp, t5, 22
                  add          s11, a4, t2
                  slli         t4, s11, 0
                  xori         s3, a0, -1552
                  flt.s        gp, fa7, fs3
                  slt          t6, t4, s1
                  fsgnj.s      fs3, ft11, ft8
                  or           t5, gp, s0
                  andi         a3, gp, -1546
                  fsqrt.s      fs0, ft5, rup
                  nop
                  nop
                  fsgnjx.s     ft3, ft9, fa4
                  lui          s5, 394723
                  srli         t6, gp, 6
                  slti         gp, sp, 1575
                  fsgnjx.s     ft6, fs0, ft9
                  fsgnjn.s     fa3, fs10, fs10
                  div          tp, t1, a5
                  fsgnjx.s     fa2, ft8, fs7
                  div          a7, s1, a7
                  lui          a6, 930270
                  ori          s11, s1, -22
                  fmul.s       fs2, fs7, fa0, rne
                  mulh         a4, a0, t3
                  and          t4, s5, a4
                  fsub.s       ft4, ft3, fa4
                  sltu         a6, s0, s5
                  rem          gp, ra, a3
                  sra          t2, s8, ra
                  add          a1, t5, s11
                  divu         sp, a0, a7
                  fclass.s     t0, fa2
                  fdiv.s       fs5, ft7, fs8, rne
                  xori         s2, s10, 1000
                  fsgnjx.s     fs10, fs11, ft3
                  fmv.w.x      ft6, tp
                  mulh         t1, t3, s7
                  and          a5, t5, tp
                  srli         tp, t0, 29
                  mulhu        sp, a6, t6
                  nop
                  sltiu        a1, gp, -1360
                  fmv.w.x      fs0, zero
                  rem          a7, a2, tp
                  fle.s        s10, fa7, ft1
                  mulhsu       a6, a6, t3
                  fsub.s       fa7, fs10, ft10, rmm
                  ori          s11, s1, 30
                  sub          s8, a6, s0
                  srli         a0, t5, 29
                  feq.s        s6, fs7, fs11
                  remu         t2, s10, s3
                  auipc        t6, 452342
                  mulhu        t4, a2, s2
                  addi         t1, t1, 260
                  addi         s1, a2, 374
                  ori          a2, s2, 1814
                  fadd.s       fa7, ft6, fs11, rmm
                  fcvt.s.wu    fs5, s1, rne
                  or           s6, t5, tp
                  fcvt.wu.s    sp, ft3
                  sra          gp, t5, a3
                  add          s1, s0, s8
                  sltu         a7, s1, t1
                  fmv.w.x      ft2, gp
                  mulhu        s8, s11, a7
                  nop
                  and          a1, s0, t5
                  fsqrt.s      fs2, fa7, rtz
                  div          s8, t3, s3
                  srl          tp, s6, s9
                  fsgnjn.s     ft5, fs10, fa7
                  mul          s8, s7, s10
                  fcvt.wu.s    a2, ft8, rtz
                  fcvt.s.w     fa5, sp
                  fmul.s       fs7, fs3, ft8
                  or           a0, s9, t6
                  flt.s        t5, fs4, fs8
                  fdiv.s       fs0, fs7, fs6, rmm
                  fsgnjx.s     fs2, ft4, ft4
                  sltiu        s2, t4, -1654
                  slli         s4, t6, 19
                  slti         a2, a7, 335
                  lui          ra, 396976
                  fmin.s       fs2, fs1, ft9
                  fcvt.w.s     s11, fs5, rtz
                  andi         s4, s2, 778
                  fsgnj.s      ft1, ft5, ft9
                  srl          t5, ra, s11
                  rem          s2, s10, a3
                  fclass.s     a0, fa3
                  xori         tp, s3, -556
                  slli         tp, s3, 12
                  mulhsu       a5, a3, a6
                  mulhsu       a1, t0, s11
                  fmul.s       fs8, ft7, ft5
                  xori         s8, s6, 566
                  fmin.s       fa6, ft0, fs11
                  slt          a7, t4, s5
                  fsgnjx.s     ft11, fa6, ft5
                  fclass.s     s1, ft3
                  fcvt.wu.s    sp, fs6, rtz
                  mul          zero, s11, a4
                  ori          s10, gp, 1073
                  rem          tp, s3, a6
                  ori          s6, s3, -1453
                  divu         zero, a2, t5
                  sll          s5, s6, s3
                  fsgnjn.s     fs6, ft5, fs5
                  flt.s        sp, fa0, fs7
                  fsub.s       ft2, ft6, ft3, rmm
                  fmax.s       fs6, fa5, fa1
                  sll          s10, a6, t0
                  fmul.s       ft8, fa1, ft3, rne
                  andi         t5, tp, -1238
                  srli         gp, gp, 16
                  ori          a0, a5, 891
                  divu         s10, a4, a7
                  fsgnjn.s     fs11, fs7, ft2
                  div          s3, s2, s1
                  fmv.x.w      zero, ft6
                  sra          a2, s2, sp
                  fclass.s     t5, fa6
                  slti         s2, a6, 1848
                  mulh         s8, s8, a7
                  fsgnjn.s     fa4, ft9, fs5
                  or           zero, s8, a3
                  fsub.s       fs9, fs10, ft1
                  mulhsu       zero, s0, sp
                  srli         a7, s11, 13
                  fmul.s       fs8, fa5, ft8
                  flt.s        a1, fs0, fa4
                  remu         s10, ra, s11
                  slti         tp, a5, 719
                  fcvt.wu.s    s11, fs3
                  addi         s5, tp, 95
                  fmin.s       fa1, fs0, fs7
                  fle.s        a4, ft7, fa4
                  sub          t6, a7, s0
                  srl          s8, sp, t4
                  sltiu        s4, a2, 842
                  lui          tp, 307297
                  fmax.s       fs9, ft11, fs6
                  fsub.s       fa4, fs5, fa1
                  nop
                  mulh         ra, s0, a4
                  or           a0, s10, a6
                  remu         s0, s4, t2
                  fsgnj.s      ft11, fa2, ft9
                  sub          tp, t5, a7
                  sltiu        a7, a3, -938
                  fcvt.w.s     t5, fs5
                  fadd.s       fa7, fs5, ft6
                  slli         a5, s6, 17
                  or           ra, gp, s1
                  slti         s1, t1, 162
                  srai         s3, s10, 25
                  lui          t1, 502372
                  fsub.s       ft2, fa6, fs9
                  srai         a6, ra, 5
                  sll          ra, s4, gp
                  fsgnj.s      ft6, ft10, fa6
                  rem          s4, s9, a3
                  mulhsu       s3, ra, a1
                  sll          sp, t4, a0
                  nop
                  mul          ra, ra, tp
                  fsgnjx.s     fs11, ft1, fs8
                  mul          t1, s0, t6
                  rem          a4, a3, s1
                  lui          s10, 679412
                  nop
                  fmv.x.w      a4, fa3
                  flt.s        t2, ft6, fa2
                  div          s4, t5, a3
                  mulhu        s3, a2, t0
                  fsgnj.s      fa3, fa3, fa3
                  fmax.s       ft9, ft3, fa2
                  sltiu        a6, s11, 988
                  srli         a1, tp, 10
                  fadd.s       ft2, ft6, fa0, rtz
                  fmv.w.x      fs11, s5
                  mulhsu       ra, a7, s0
                  fadd.s       fa4, fs7, ft0
                  fsgnj.s      fa3, fa4, fs0
                  fdiv.s       ft11, ft11, fs9, rdn
                  divu         t4, s11, a5
                  fdiv.s       fa5, fs4, ft2, rup
                  mulhsu       tp, s11, zero
                  slli         s11, s4, 22
                  fsqrt.s      ft2, fs3, rdn
                  fsgnj.s      ft9, fs5, fs6
                  sltiu        t1, a2, -189
                  fmv.w.x      fs0, s2
                  xor          s11, a1, a3
                  fmin.s       fa7, fa7, fa6
                  nop
                  fadd.s       fs6, ft7, ft10
                  fmul.s       ft1, ft11, fs10
                  sra          s4, t6, a2
                  rem          t0, t0, t2
                  fmul.s       fa7, ft0, fs9
                  fsub.s       ft0, fs2, ft2
                  fsgnjn.s     fa2, fs9, ft3
                  fsub.s       ft2, ft9, fs5
                  fmv.w.x      fs9, s7
                  mul          s2, a7, s5
                  xor          s11, tp, s11
                  auipc        ra, 161164
                  fsub.s       fa3, fs8, fa7
                  sltu         s0, s1, s3
                  fle.s        t6, ft4, fa7
                  fmin.s       fa7, fs10, fs9
                  feq.s        t2, fs0, fs8
                  slti         a5, tp, 160
                  fcvt.s.w     fa4, a4, rmm
                  sub          a4, s10, s7
                  sub          a3, s5, t1
                  slt          ra, tp, s10
                  and          s2, s2, s3
                  mulh         a7, s9, s8
                  xor          s0, t5, s10
                  mul          zero, a1, t1
                  xori         a4, s6, -1872
                  remu         t5, gp, s0
                  sub          s5, s1, a6
                  fcvt.s.w     fs10, a7, rdn
                  remu         a0, s4, a0
                  div          s10, t1, t5
                  mulhsu       t1, gp, a3
                  srl          s0, t6, a3
                  lui          a3, 687515
                  slli         gp, s9, 8
                  ori          t6, s2, -2029
                  fcvt.wu.s    s1, ft5
                  srl          s2, s6, s10
                  add          s3, s5, s0
                  ori          s5, s6, 1640
                  fadd.s       ft7, fa4, fs9, rmm
                  slt          s3, t5, a2
                  sltiu        s10, gp, 14
                  and          t2, s0, a7
                  fdiv.s       fs0, ft11, ft6
                  fmul.s       fs10, fs8, fs10
                  sll          a3, zero, s0
                  mulh         ra, s8, t2
                  fcvt.wu.s    a3, fs6
                  auipc        a4, 134591
                  fmax.s       fs6, fa7, ft10
                  addi         s10, t2, -976
                  add          s10, a7, s5
                  add          a1, a3, t6
                  fsqrt.s      ft10, fs10
                  srl          tp, s7, t1
                  slt          s3, s4, s8
                  remu         a1, tp, ra
                  andi         s4, a5, -698
                  fcvt.wu.s    a6, ft0, rne
                  and          s6, t6, s1
                  sll          sp, s6, s9
                  remu         sp, a1, s5
                  div          a7, zero, a4
                  div          s3, t3, s2
                  slt          a6, zero, s1
                  mulh         s2, s6, s2
                  mulhsu       a1, t1, s10
                  remu         t1, s2, sp
                  fsgnj.s      fs9, fs3, fs8
                  fmv.x.w      a4, fa7
                  addi         s5, tp, 63
                  fcvt.wu.s    a1, fs1, rtz
                  remu         ra, s1, a0
                  fcvt.w.s     sp, fs9, rtz
                  xor          s1, t6, a7
                  fsqrt.s      ft5, ft1
                  fsqrt.s      ft9, fa2, rmm
                  fsgnjn.s     fs10, ft10, fs1
                  fcvt.wu.s    s3, fa6
                  fmax.s       fa1, ft2, ft2
                  srli         a6, s1, 27
                  auipc        a2, 1021112
                  slli         t1, t1, 22
                  remu         s3, ra, ra
                  fsgnjx.s     ft7, fs6, fs6
                  auipc        s1, 169774
                  sra          a6, t1, t3
                  ori          t4, tp, -1991
                  slt          s1, a7, s6
                  andi         zero, t4, -1120
                  sub          s2, t1, tp
                  fsqrt.s      fa1, ft6, rtz
                  sltu         a1, s7, a0
                  fsgnjn.s     fa5, ft4, ft1
                  srl          a3, s1, s1
                  fmv.w.x      ft10, sp
                  rem          a3, s8, t6
                  mulh         a5, a2, gp
                  xori         t2, a6, -544
                  sra          sp, a7, gp
                  add          s0, zero, tp
                  sltu         s10, a1, s2
                  fclass.s     t1, fa6
                  nop
                  fsgnj.s      ft7, ft4, fs10
                  div          a0, s5, s8
                  fcvt.s.w     fs10, a5
                  fclass.s     s1, ft0
                  fmin.s       fa0, fs2, ft0
                  fmul.s       fs3, fs0, fa5
                  fmax.s       fa1, fa6, ft5
                  fdiv.s       ft10, ft9, ft2, rtz
                  mulhu        s11, t6, s4
                  lui          tp, 20834
                  divu         a0, s6, a7
                  fadd.s       ft0, ft3, fa5
                  fsgnjx.s     fa3, fa3, fa2
                  fmul.s       fs9, fa6, fa7
                  fcvt.wu.s    s8, fa0, rtz
                  fsub.s       fs4, fs11, ft9, rdn
                  fcvt.s.w     fs9, t5, rup
                  srl          t0, a0, tp
                  xori         s11, s6, -121
                  sltiu        a6, s5, -1667
                  divu         a1, t6, s2
                  fadd.s       fa4, ft10, ft8
                  fcvt.s.wu    fa4, s2
                  srli         s0, s1, 18
                  flt.s        s3, fs9, fs8
                  fsqrt.s      fs2, fa4
                  srl          zero, a4, zero
                  xor          a3, t5, tp
                  fmv.x.w      s3, fs7
                  sll          gp, s10, t1
                  slt          s6, t4, t1
                  mulhu        gp, ra, s6
                  nop
                  srai         a2, s3, 9
                  sltu         zero, a2, zero
                  mulh         s10, t6, ra
                  nop
                  sltu         a1, a2, s1
                  nop
                  ori          s4, t0, 518
                  sub          gp, a7, a5
                  fsqrt.s      fs11, fs7
                  divu         s3, t2, ra
                  mulh         s2, ra, a6
                  srli         t0, s3, 14
                  sll          s0, sp, s11
                  feq.s        t5, fa7, fa6
                  nop
                  ori          t6, sp, -310
                  srl          tp, a7, ra
                  mulhsu       s8, s1, a7
                  div          a3, t3, s4
                  and          sp, s10, a2
                  sll          s1, t3, t1
                  andi         t5, a5, 1790
                  ori          zero, a3, 1697
                  fsqrt.s      fs1, fs0
                  mulhsu       s10, s10, s5
                  flt.s        s5, ft3, fs2
                  fmv.w.x      ft2, a1
                  or           a7, t5, s9
                  xor          a6, t6, t3
                  fmax.s       ft11, fa3, ft7
                  fmin.s       ft8, ft11, ft2
                  ori          s8, s1, 1956
                  divu         sp, sp, t1
                  fmin.s       ft10, fs10, ft2
                  fcvt.s.w     fs10, a5
                  addi         t5, gp, 1289
                  slt          s10, t5, tp
                  remu         sp, ra, gp
                  fsqrt.s      fa2, fa1, rne
                  fsgnjx.s     fs5, fa6, ft6
                  sltiu        s6, t6, 1163
                  sltu         t2, s1, s5
                  remu         a0, t2, tp
                  fdiv.s       fa4, ft6, fs5
                  xor          s3, s6, s4
                  fmv.w.x      ft1, s10
                  addi         a1, s8, -970
                  slt          t1, a4, t4
                  mulhu        a3, a2, a1
                  fmv.x.w      a0, fs2
                  sra          a1, a2, a2
                  divu         a6, a3, tp
                  lui          t2, 925819
                  rem          a0, tp, s10
                  feq.s        ra, fs1, ft10
                  remu         tp, a1, s4
                  or           a7, a7, zero
                  slti         s6, t6, 372
                  fmax.s       fs6, ft7, ft0
                  fsub.s       fs8, fs8, fs0, rup
                  div          t1, a3, a5
                  xori         t6, t0, 1478
                  flt.s        a3, fs1, fa0
                  srai         s6, a1, 0
                  fcvt.s.wu    fa0, t3
                  fsgnj.s      ft11, fa3, ft8
                  remu         a2, t6, a2
                  fmul.s       ft8, fa7, fs9
                  and          zero, t2, s5
                  lui          s4, 638941
                  remu         s1, s9, s1
                  andi         t0, t0, 466
                  fclass.s     s4, ft7
                  fsub.s       fs3, fs10, fs5, rdn
                  add          t6, s8, s10
                  xori         t0, a0, -69
                  ori          t4, s9, -760
                  auipc        s6, 801430
                  ori          t0, zero, 1871
                  fmul.s       fa5, ft0, ft7, rup
                  auipc        s4, 195291
                  fmul.s       ft1, ft6, fa4
                  fmv.x.w      s10, fs2
                  fsub.s       fs11, fs10, fs8, rne
                  sub          a7, a3, a3
                  fsgnjn.s     fs7, ft5, fs4
                  slt          s6, a7, t5
                  sltiu        t6, s2, -1896
                  add          t5, t5, zero
                  sltu         s2, tp, s8
                  slli         a1, s6, 22
                  addi         a2, s11, 65
                  fsgnjx.s     ft10, ft3, ft6
                  remu         s10, tp, a5
                  add          a6, a2, ra
                  fcvt.s.wu    fs7, s0
                  fsub.s       fs8, ft0, ft8
                  divu         s8, gp, t5
                  add          zero, s11, s10
                  fdiv.s       fs1, fa1, fa4, rmm
                  fcvt.wu.s    s11, fs5, rdn
                  xor          s11, t4, t6
                  mulhsu       s5, a2, t0
                  srl          a2, a7, zero
                  mulh         t2, t3, s8
                  fcvt.w.s     s1, fs7, rdn
                  fmv.w.x      fa3, t2
                  fcvt.s.w     fa1, s6
                  fclass.s     s11, fs9
                  fsqrt.s      fs2, ft1, rmm
                  fsqrt.s      fs9, fs5, rup
                  feq.s        a3, fa6, ft4
                  remu         a0, s7, t2
                  fsgnjx.s     fs0, fs2, fs0
                  and          gp, s6, tp
                  and          t1, a7, t2
                  fmax.s       ft10, fs5, fs10
                  nop
                  fcvt.s.wu    fa6, a3
                  feq.s        s5, fa5, ft7
                  fsgnjx.s     ft4, ft0, ft1
                  and          t1, ra, a3
                  div          t2, t6, s2
                  fmv.x.w      t2, fs5
                  sub          s1, tp, a4
                  sub          ra, s0, a5
                  fclass.s     s10, fs9
                  fsgnj.s      ft11, fa1, fa1
                  lui          s1, 285920
                  feq.s        t1, fs8, fa2
                  sll          t4, a0, a3
                  fle.s        a5, fs2, fa4
                  nop
                  fadd.s       fs7, ft4, ft7, rtz
                  auipc        t5, 520210
                  feq.s        s11, fs10, fs0
                  fcvt.w.s     s6, ft9, rdn
                  slli         a7, s1, 2
                  sra          tp, a7, t1
                  sub          gp, a4, tp
                  fsgnjn.s     fs2, fs10, fs8
                  srl          gp, s9, sp
                  fmv.x.w      t4, fs10
                  addi         a0, t4, 809
                  fmv.x.w      a1, fs4
                  nop
                  fcvt.wu.s    s6, fa2
                  flt.s        t6, ft2, ft1
                  or           s8, s3, s6
                  add          s5, a5, a1
                  mulhu        s10, sp, a0
                  fmax.s       fs6, fa1, ft9
                  srli         a2, s8, 22
                  fcvt.w.s     s5, ft7
                  mul          a7, t3, t6
                  feq.s        a6, fs5, fs1
                  srl          t1, s0, gp
                  sltu         s3, a1, tp
                  addi         gp, s8, 474
                  fcvt.w.s     a6, ft1
                  andi         s5, tp, -1453
                  mulhu        a3, t3, t5
                  fmv.x.w      s3, fs2
                  divu         a3, s9, t6
                  nop
                  feq.s        t5, ft10, fs1
                  fclass.s     a3, ft10
                  andi         s4, s2, 994
                  nop
                  sltu         a6, s2, gp
                  sltu         t2, a2, t0
                  add          tp, s6, s8
                  fclass.s     s10, fs0
                  andi         s0, t5, -838
                  xor          tp, a1, s2
                  xori         s8, a2, -1933
                  andi         a6, a3, 887
                  fsgnjn.s     ft5, fs8, fs4
                  addi         s2, t0, -1373
                  fcvt.wu.s    a1, fa4, rmm
                  sltu         s8, sp, s9
                  or           t0, s9, t6
                  srl          s4, s4, a5
                  div          a6, s4, s7
                  fle.s        t6, ft7, ft10
                  mulhu        a4, a6, sp
                  fcvt.s.wu    ft4, a2, rup
                  fcvt.s.wu    fs4, t6
                  slt          t4, a7, s9
                  fle.s        a0, fs6, ft4
                  fsub.s       ft5, fa1, fa3, rne
                  mul          a0, s1, t2
                  fcvt.w.s     t0, fs10
                  and          a0, gp, a4
                  sltiu        a0, t0, -368
                  or           a2, s2, gp
                  divu         a7, s11, a4
                  add          a3, s9, s2
                  rem          s8, t4, s6
                  divu         a6, t0, s11
                  mulh         s6, tp, zero
                  slti         a1, s1, 253
                  mulhu        s8, a0, s10
                  sub          tp, a6, s4
                  auipc        gp, 698189
                  sra          s1, t2, t6
                  divu         s2, zero, a0
                  fmv.x.w      s6, fs5
                  fdiv.s       fs1, fa4, ft9
                  flt.s        gp, fs5, ft3
                  ori          t1, a1, -1969
                  fmin.s       fa6, ft9, fa6
                  fmul.s       fa5, fa0, fs3
                  mulhu        s4, t4, s10
                  slti         gp, sp, -1461
                  fcvt.wu.s    ra, fa0, rdn
                  mulhsu       a7, a4, t3
                  nop
                  srli         a0, t6, 24
                  fdiv.s       fa7, fs4, ft7, rne
                  addi         t6, t0, -607
                  fsgnjx.s     fs8, ft1, fs11
                  rem          gp, t5, t6
                  fcvt.wu.s    gp, fs10, rup
                  mul          ra, a7, s3
                  mulh         a7, ra, s2
                  fmv.x.w      s6, ft5
                  fmax.s       ft9, fa5, fa0
                  slt          gp, a3, s0
                  and          s3, a1, ra
                  srli         a5, t0, 15
                  or           s3, s9, t4
                  addi         a0, a6, -920
                  fcvt.s.wu    fs9, a5, rne
                  mulhu        gp, t3, s2
                  addi         ra, a0, 957
                  rem          a7, t1, a2
                  lui          a2, 10931
                  mulh         a7, s6, s2
                  fclass.s     a5, fs9
                  xori         a2, s5, 800
                  sll          t4, tp, s6
                  fadd.s       ft6, fs10, fa6
                  fmul.s       fs4, fs4, ft3, rup
                  sll          s5, t2, a1
                  mulhsu       a1, s10, ra
                  fmv.w.x      fa2, s4
                  fmul.s       fa5, fs11, fa4
                  fmv.w.x      fs8, zero
                  fmax.s       ft1, fa2, fa4
                  fmul.s       ft3, ft4, ft6, rmm
                  sra          t5, s11, tp
                  flt.s        tp, ft5, ft11
                  or           s2, t0, a4
                  slli         t5, s8, 30
                  slti         t0, tp, -926
                  fmv.x.w      a4, fs11
                  mulh         t4, a2, s5
                  fsgnj.s      fs0, ft4, fa2
                  or           a3, s8, a1
                  fcvt.s.w     fs4, s4, rup
                  divu         s1, a4, tp
                  srai         zero, tp, 27
                  nop
                  mul          t2, a7, a0
                  fmv.w.x      ft0, s8
                  fcvt.s.wu    fs1, s6
                  ori          a4, sp, -1968
                  fsgnjx.s     fs9, fs2, fs1
                  fmax.s       fa0, fa6, fa5
                  fsgnjn.s     fa0, fa1, fa0
                  xor          s0, t1, s10
                  sra          gp, t6, a1
                  fsub.s       fs3, fa5, fs1
                  fmv.x.w      tp, ft9
                  sub          t6, s4, a4
                  andi         s11, ra, -1162
                  fmin.s       fs9, ft7, fs9
                  srli         s10, s0, 9
                  sra          s4, t2, t4
                  fcvt.w.s     t1, fa4
                  nop
                  flt.s        a2, ft9, ft2
                  fle.s        sp, fa2, ft5
                  sub          s2, t4, a4
                  fle.s        a0, fs6, ft1
                  mul          t5, t3, s9
                  srli         s3, s11, 24
                  nop
                  fmax.s       fa5, fa3, fs11
                  auipc        s0, 503777
                  fsgnjx.s     ft8, fs6, fa5
                  mulhsu       gp, s11, s0
                  fsgnjn.s     fa4, ft4, ft10
                  and          t2, a1, a3
                  fmv.w.x      fs7, a2
                  addi         t4, t0, 25
                  fmin.s       ft11, fa7, fa0
                  sub          s11, a4, tp
                  fsgnjx.s     ft1, ft9, fs4
                  auipc        tp, 276755
                  fsgnjx.s     ft10, fs11, fs6
                  fmul.s       fs5, ft8, fs10, rtz
                  div          t1, a2, tp
                  ori          s5, s7, 442
                  fsqrt.s      fs3, ft6, rdn
                  fmax.s       ft3, ft4, ft8
                  auipc        s6, 569287
                  slt          t0, s2, s6
                  rem          t0, zero, s6
                  fmv.w.x      fs5, s6
                  feq.s        zero, ft6, fa4
                  sra          zero, s11, gp
                  auipc        sp, 486636
                  fsgnjn.s     ft4, ft2, ft11
                  fadd.s       fa2, fs1, ft10
                  fcvt.s.w     fa0, s6
                  feq.s        a1, fa6, fa2
                  fle.s        t1, ft0, fs7
                  or           s3, s11, a7
                  mulh         a2, t1, a4
                  fmv.w.x      fs7, s0
                  andi         t4, s3, 762
                  mulh         s10, a7, s0
                  fmax.s       ft11, ft6, ft5
                  srai         s0, s8, 6
                  ori          a5, ra, -1500
                  slt          tp, s5, a4
                  fsqrt.s      fs10, fs8, rne
                  slt          s5, tp, t1
                  sltiu        s10, ra, -524
                  add          a0, a3, s11
                  sra          a7, ra, s8
                  or           t6, a6, s4
                  slt          zero, s10, ra
                  auipc        ra, 499582
                  srl          a5, s6, t1
                  fcvt.s.wu    ft11, a0
                  sltiu        gp, a3, 1813
                  fsgnjn.s     fs5, fs11, ft11
                  rem          t1, a7, a1
                  sltu         a6, sp, t4
                  sra          tp, s9, sp
                  fcvt.s.wu    fs0, s1, rmm
                  fle.s        ra, ft8, ft6
                  fsgnjx.s     ft7, fa1, fs8
                  fmax.s       fs8, ft8, fs8
                  divu         s1, a3, a0
                  andi         t6, s3, 1491
                  flt.s        s4, ft7, ft7
                  div          t5, sp, t1
                  fcvt.w.s     a1, ft4, rdn
                  addi         t4, t2, -1962
                  srai         s8, t5, 8
                  fsqrt.s      ft0, ft10
                  fcvt.wu.s    ra, ft7
                  mul          t1, s8, a2
                  fsgnjn.s     fs9, ft10, ft0
                  slli         a0, a3, 13
                  fsgnjn.s     ft8, fs11, fs9
                  sub          a1, t1, s6
                  divu         s2, s0, a6
                  auipc        t2, 475474
                  andi         s3, s11, 1794
                  fmv.x.w      a1, fs5
                  sub          s3, a4, s0
                  nop
                  or           a3, t1, a2
                  fcvt.w.s     s6, fs11
                  fcvt.wu.s    s6, fa2
                  fsub.s       ft11, fa1, fa0
                  fmul.s       fs8, ft11, ft6
                  flt.s        t4, ft9, ft1
                  mul          t1, ra, a2
                  fcvt.w.s     a3, ft10
                  fdiv.s       fs0, fs7, fs6, rne
                  mulhu        gp, ra, s4
                  lui          a0, 59923
                  lui          s5, 224648
                  fdiv.s       fa6, fs9, ft7
                  fsgnjx.s     fs7, ft4, ft4
                  fsub.s       ft11, ft0, ft7
                  add          t2, a5, t1
                  fcvt.w.s     s6, fs10
                  andi         gp, s7, -1853
                  divu         a3, s4, t3
                  fmul.s       fs11, fs0, ft0, rtz
                  addi         s4, a6, 299
                  feq.s        t1, fs1, fs5
                  lui          a4, 347555
                  mul          tp, s5, ra
                  ori          t6, t2, -971
                  fcvt.wu.s    s2, ft2, rdn
                  slt          s6, t5, s8
                  srli         s10, a1, 8
                  or           a2, s9, s0
                  fsgnj.s      fa0, fa2, fs11
                  ori          a6, s3, -295
                  fmv.w.x      fs5, a5
                  mulhsu       t1, t2, a6
                  feq.s        gp, fa6, ft6
                  feq.s        s8, fs2, fs1
                  fsqrt.s      fs10, fs8
                  fsgnj.s      ft7, fs7, ft3
                  sltu         ra, a3, t2
                  sll          a1, t5, ra
                  sra          a0, t5, s7
                  or           s8, s11, s0
                  mul          s8, s6, s6
                  xor          t4, a7, s7
                  fsgnjx.s     ft2, fa1, ft0
                  fcvt.wu.s    sp, fs6, rtz
                  fsqrt.s      ft8, fs1
                  xor          s6, a5, s11
                  flt.s        sp, fs7, ft4
                  fadd.s       ft2, ft7, fa0, rne
                  fmin.s       ft3, ft2, fs6
                  srli         s4, t6, 24
                  fsgnjx.s     fs3, fs9, ft6
                  fcvt.wu.s    a5, fa1, rdn
                  addi         s1, s11, -378
                  xori         s1, s4, -399
                  srli         s6, t4, 28
                  flt.s        a6, fs9, fa1
                  srl          s3, a0, s9
                  sll          t5, t4, a1
                  mulh         t5, sp, a1
                  fmv.w.x      ft7, t3
                  fmv.x.w      zero, fs10
                  fsgnjx.s     fa0, ft7, fs9
                  fdiv.s       fa6, ft11, fs3
                  fmv.w.x      ft3, s10
                  srli         a2, s4, 12
                  mulhsu       a3, s6, a6
                  mulh         a2, ra, s3
                  fcvt.s.w     fs8, t2, rtz
                  mulhu        s6, s11, a7
                  sltu         a7, s3, s5
                  slli         t0, a5, 15
                  fclass.s     s1, ft9
                  fadd.s       fs10, fa1, fa7
                  sltiu        sp, tp, -1162
                  sll          a6, s6, a1
                  fclass.s     sp, ft1
                  ori          s2, gp, -1402
                  fsgnjn.s     fs6, fa0, fs11
                  nop
                  fsgnjn.s     ft11, fs9, fs9
                  addi         s11, s7, 995
                  fdiv.s       fs3, ft5, ft7
                  fcvt.s.w     fs5, a5, rdn
                  xor          t4, t2, t1
                  flt.s        s2, fs2, ft8
                  feq.s        a7, fs11, fa4
                  div          a7, s4, gp
                  remu         t2, t6, s5
                  flt.s        t6, ft10, fs1
                  fsqrt.s      fs1, fa7
                  sltiu        a5, s9, 146
                  fsgnj.s      fa4, ft5, ft3
                  fcvt.s.wu    fs9, s8
                  feq.s        t4, ft11, fs6
                  fcvt.wu.s    ra, fa3
                  feq.s        a6, ft11, ft5
                  sll          a1, t4, a0
                  fsgnjn.s     fa4, fs5, ft4
                  srl          sp, s5, t6
                  slt          a5, a5, tp
                  divu         zero, a2, s5
                  sltu         a4, s10, t3
                  lui          s8, 183671
                  sltu         a5, t0, s1
                  fsgnjx.s     ft7, ft10, fs10
                  slt          a5, s8, s1
                  fcvt.w.s     gp, ft9
                  and          ra, s0, s11
                  slt          a4, tp, s11
                  srli         t5, t6, 12
                  and          s8, t5, ra
                  fcvt.w.s     a3, fs6
                  slli         t0, a2, 16
                  xori         a7, s9, 81
                  divu         s11, s11, tp
                  mulh         a3, t0, gp
                  fsgnj.s      fa7, fs4, fa4
                  slti         a6, a1, -1688
                  fsgnjx.s     ft5, ft5, ft11
                  auipc        t6, 321899
                  fdiv.s       ft8, ft6, fs6, rmm
                  fcvt.s.wu    fs10, gp, rtz
                  sltu         a3, zero, a5
                  slt          a3, s3, a6
                  srli         s4, tp, 29
                  feq.s        sp, ft7, fs10
                  fle.s        zero, fa5, fa3
                  fcvt.s.wu    fa5, a0
                  div          a6, a5, tp
                  ori          t5, a1, 1193
                  flt.s        a5, ft0, ft0
                  slti         a6, s5, 1709
                  divu         a7, t5, s10
                  srli         s6, ra, 15
                  fcvt.s.w     fa4, a7, rtz
                  sra          a6, s8, t3
                  fmv.w.x      ft9, s7
                  fclass.s     s6, fs8
                  sll          s4, a2, t6
                  sltu         a0, s5, s9
                  slt          a3, zero, a1
                  fcvt.wu.s    t4, ft3
                  sltiu        a5, s7, 1534
                  fsqrt.s      fs0, ft11
                  mul          sp, t0, s6
                  sltiu        s10, zero, 1941
                  fcvt.s.w     ft2, s5
                  sll          gp, s11, a2
                  lui          ra, 608714
                  sub          t0, a3, t6
                  xori         s6, s0, 1061
                  fmv.w.x      ft10, a0
                  feq.s        s10, fa0, fa5
                  sub          t1, a3, a6
                  divu         s5, ra, s7
                  mulhsu       ra, t0, s11
                  fmax.s       ft3, fs6, ft5
                  fcvt.wu.s    a6, fs3, rmm
                  and          a1, a6, tp
                  add          s1, a5, gp
                  slt          a0, t6, zero
                  fmv.x.w      ra, fa6
                  feq.s        t4, ft8, ft7
                  fsgnjn.s     fa6, ft1, ft6
                  fdiv.s       fs6, ft9, ft0
                  mulh         t1, s1, a2
                  fcvt.wu.s    s0, fs2, rne
                  slti         t1, s1, 1732
                  and          ra, a3, s3
                  sltiu        s6, t4, -1117
                  sra          s8, t0, a4
                  ori          a2, t5, -1733
                  fsub.s       ft2, fs5, ft10
                  sub          tp, t2, t4
                  srai         a6, s9, 25
                  xor          gp, t4, a4
                  mulhsu       t4, a3, s2
                  fcvt.wu.s    t0, fs0, rdn
                  fmin.s       ft11, ft7, fs9
                  auipc        s4, 107036
                  fmin.s       fa4, ft10, fa3
                  fmax.s       fa2, fs11, ft7
                  fsub.s       fs8, fa6, ft11
                  fclass.s     s10, ft9
                  mulhsu       s11, t3, s6
                  mulh         s10, tp, zero
                  sltu         t1, sp, a5
                  ori          s5, a5, -440
                  fcvt.wu.s    s3, fs11, rmm
                  fle.s        a2, ft0, fs11
                  mulhu        t5, a2, a2
                  auipc        a2, 256815
                  add          s10, s11, s10
                  fmax.s       fa0, fa5, fa7
                  div          t1, t1, ra
                  sra          s4, t3, t6
                  fdiv.s       ft10, fs3, fs11
                  srai         s4, s6, 29
                  and          t1, s10, a6
                  fcvt.s.w     fa2, a3
                  sltiu        a7, a7, 305
                  fadd.s       fs8, ft5, fa7, rne
                  fmv.x.w      sp, fa4
                  andi         t5, a4, -197
                  nop
                  sra          t2, a6, tp
                  auipc        a6, 608550
                  sltu         s4, a7, s7
                  slt          a2, t2, t4
                  fsqrt.s      ft5, ft11, rmm
                  fcvt.wu.s    sp, ft9
                  feq.s        a1, fa1, fs8
                  sltu         s10, tp, a7
                  fcvt.s.wu    ft5, s4, rdn
                  fmax.s       ft2, fa5, fs4
                  flt.s        t1, fs2, ft2
                  fdiv.s       ft3, ft5, ft3
                  add          s3, s8, zero
                  xor          s11, a4, a6
                  rem          t5, t4, s4
                  slti         a3, t6, -1301
                  flt.s        a4, ft5, ft0
                  slli         a2, s4, 15
                  fsgnj.s      fs1, fs2, fs5
                  slt          tp, s11, tp
                  fmax.s       fs8, fa6, fa6
                  xor          a6, a7, t2
                  add          a6, s10, s7
                  mulhsu       a2, s2, s1
                  mulh         a5, a7, s0
                  fadd.s       fs1, fs7, fa3, rne
                  fmax.s       fs11, fa2, ft10
                  fclass.s     s2, fs9
                  xor          a3, t1, s11
                  fsqrt.s      ft2, ft7, rup
                  rem          a3, a7, t1
                  mulhu        s1, s8, gp
                  fsgnjn.s     fa1, fa4, ft8
                  andi         a1, t3, -654
                  mulh         s1, s5, ra
                  sub          t0, ra, a3
                  sub          s1, s3, s6
                  slt          s4, s1, s5
                  slt          zero, s5, a4
                  sltiu        a6, t3, -549
                  feq.s        ra, fa6, ft2
                  fdiv.s       fa3, fs7, fa0, rmm
                  div          a1, s7, s9
                  fclass.s     t2, fs2
                  mulh         t0, a2, t5
                  srai         s3, a2, 19
                  fsgnjn.s     fs5, fa1, fs3
                  fmv.x.w      t0, fa4
                  fmv.w.x      fa0, a2
                  fmax.s       ft1, fs11, fs3
                  auipc        sp, 85719
                  fmax.s       fs5, fa1, fs9
                  remu         s1, a1, s4
                  fmv.w.x      fs7, tp
                  sra          t2, sp, a4
                  mulhu        a4, t3, gp
                  fcvt.s.wu    fa3, sp
                  and          sp, ra, a3
                  slt          zero, t4, s8
                  fle.s        a3, fa6, ft8
                  mulhu        tp, s7, zero
                  srai         zero, a6, 16
                  slli         t0, s2, 2
                  ori          t1, s2, -1121
                  slli         zero, tp, 3
                  slli         ra, a7, 15
                  sltiu        a3, s8, -208
                  slli         sp, zero, 28
                  sltu         zero, t5, s9
                  fadd.s       fa7, fs2, fs7, rup
                  lui          s1, 56695
                  fsgnjn.s     fa0, fs3, fs10
                  sub          s8, sp, s6
                  or           s2, a1, ra
                  fmv.x.w      s2, fa7
                  fmv.w.x      ft6, a1
                  xori         t0, sp, 181
                  xor          a1, a0, s10
                  fmv.w.x      ft4, tp
                  and          t5, ra, s0
                  sltu         s0, a2, t3
                  or           s4, s9, t4
                  addi         t2, t3, 292
                  feq.s        gp, ft11, ft10
                  slti         s10, s7, 1470
                  rem          tp, gp, s11
                  slli         tp, gp, 9
                  divu         s10, s9, a6
                  fmax.s       ft8, fa3, fs7
                  lui          s4, 118264
                  feq.s        t5, fa1, ft11
                  fmax.s       ft8, ft10, fs6
                  fsgnjx.s     ft1, fs5, fs10
                  xori         s6, t2, 1371
                  fmin.s       fs11, ft9, fs1
                  fsgnjx.s     fa3, fa0, fs1
                  remu         ra, t0, sp
                  fmul.s       fa1, fs9, fs10
                  slli         a2, t2, 6
                  fsqrt.s      ft10, fs4, rup
                  srl          a1, a1, t2
                  addi         s6, t3, -1994
                  fmin.s       fs10, fa5, fs1
                  fmul.s       fs9, ft5, ft7, rdn
                  lui          s5, 618361
                  mulhu        a4, s6, a6
                  fcvt.w.s     s11, fs1
                  fsgnj.s      ft0, fs0, fa2
                  lui          t4, 974746
                  auipc        zero, 1039261
                  sltu         s3, a1, s5
                  xori         a1, a5, 873
                  fmv.x.w      s4, ft3
                  slli         s4, s0, 23
                  lui          t4, 833129
                  fmin.s       ft2, ft0, fa7
                  rem          sp, t4, s5
                  srai         a7, s3, 31
                  sll          s6, t0, a0
                  ori          t0, t4, -2007
                  and          s11, t0, a5
                  feq.s        tp, fa4, fa0
                  sra          a4, sp, a2
                  fmul.s       fs2, fs3, fa6, rne
                  fmax.s       fs6, ft0, fs11
                  add          s0, t0, t5
                  slti         s11, t2, 1893
                  fsqrt.s      ft1, fs4
                  fcvt.w.s     tp, fs1
                  mul          zero, s10, s4
                  mulhsu       t6, zero, t4
                  feq.s        s6, fs6, ft3
                  fcvt.s.wu    ft10, s9, rmm
                  and          sp, a4, sp
                  srai         s4, a7, 4
                  div          a7, t5, s3
                  sll          s8, a2, s11
                  ori          t1, s7, 107
                  or           tp, a1, a7
                  sub          t5, s4, a2
                  fcvt.wu.s    a7, fa5, rtz
                  fcvt.w.s     s10, ft7
                  sub          s5, s0, a4
                  fcvt.s.wu    ft2, gp, rup
                  fmv.x.w      zero, ft11
                  sltu         sp, zero, t3
                  flt.s        a4, fs2, fs0
                  fsub.s       fs6, fa1, fs6
                  fsub.s       fs5, ft0, fs11, rmm
                  srli         t4, t1, 31
                  sltu         s8, t5, t4
                  srl          a5, t3, zero
                  feq.s        a7, ft3, fs11
                  mulhsu       t5, t6, s2
                  andi         t6, gp, 1401
                  divu         a3, s4, zero
                  addi         t6, s5, 966
                  or           t1, zero, zero
                  fcvt.w.s     t1, ft10
                  fle.s        s5, ft6, ft6
                  remu         a3, t0, a2
                  or           a2, a4, a0
                  mul          t0, gp, s3
                  divu         a5, s1, sp
                  fsub.s       ft7, ft5, ft10, rup
                  lui          t1, 697729
                  fdiv.s       ft9, ft1, fs11
                  fdiv.s       ft8, ft11, fa7, rmm
                  ori          t5, a3, 1047
                  nop
                  fadd.s       ft3, fs9, fa2, rup
                  flt.s        t4, ft1, fs1
                  fcvt.w.s     s4, fs6, rdn
                  divu         s2, s7, s7
                  fclass.s     a0, ft4
                  lui          a1, 322011
                  or           zero, sp, s2
                  slti         s0, t3, -1806
                  srl          s6, s3, a7
                  xor          s10, s11, ra
                  fmv.x.w      s10, ft4
                  sltu         s6, a7, zero
                  remu         s4, a5, s1
                  nop
                  fle.s        t4, fa1, ft1
                  flt.s        t2, fs4, fa6
                  sll          zero, sp, s2
                  sltiu        s5, a4, -65
                  fmv.x.w      a5, fa2
                  remu         a1, t3, t1
                  sra          t1, t6, t4
                  sltiu        a5, s7, 2042
                  fadd.s       ft0, fa5, fa7, rdn
                  rem          sp, tp, s7
                  mulhsu       tp, a2, t5
                  fsgnj.s      fs1, fa4, ft3
                  mul          t5, a6, s11
                  sub          a5, a2, t0
                  fsgnjn.s     fa7, fa4, ft5
                  mul          a2, s6, a3
                  mulhu        a2, a5, s9
                  mulhu        s3, gp, t6
                  divu         t0, s0, tp
                  mul          gp, s5, a1
                  ori          s5, tp, 239
                  lui          s1, 92888
                  fcvt.wu.s    t5, ft2, rtz
                  lui          t0, 221885
                  fmul.s       fa6, ft3, fs4, rmm
                  fcvt.s.w     ft1, s3, rne
                  fsgnj.s      fa0, fs2, fs6
                  sll          gp, s7, s0
                  fdiv.s       fs2, ft9, fa4
                  sltiu        a6, a7, -778
                  fmax.s       fs3, ft2, fs7
                  fmin.s       fa2, fs3, fs4
                  lui          a3, 346571
                  fmv.x.w      a0, fa6
                  mul          s0, s3, t6
                  slt          a3, t3, s1
                  rem          s6, t2, s9
                  fcvt.w.s     a5, fs2
                  andi         t4, sp, 905
                  xori         ra, s10, -1095
                  fsub.s       fa7, fa6, fs8
                  ori          t5, a3, 275
                  sltiu        t4, s9, -785
                  fmv.w.x      fa5, t4
                  fadd.s       fa0, fa4, fa1
                  slt          t0, s6, a3
                  fcvt.w.s     s11, ft0, rne
                  rem          ra, a4, s7
                  mulhsu       t4, t3, s9
                  fcvt.wu.s    t5, ft11
                  nop
                  sltiu        s8, s9, 932
                  rem          zero, a4, t0
                  nop
                  slti         s4, t5, 804
                  srai         t5, t0, 17
                  fsgnjx.s     fs2, ft3, ft5
                  slt          t6, a2, a2
                  div          a0, s0, s6
                  auipc        t1, 222250
                  fmax.s       fa6, fa2, fs5
                  srl          t1, tp, s9
                  fsgnjx.s     fs4, ft2, fa0
                  flt.s        ra, fs0, fs3
                  div          a5, s2, a5
                  fadd.s       fa0, fa5, ft10, rmm
                  slli         a7, a6, 19
                  fdiv.s       fs7, ft1, ft2, rup
                  addi         s3, zero, 29
                  andi         s8, ra, -1715
                  fle.s        s1, fs2, fa4
                  fsqrt.s      fs10, fa2, rdn
                  mulhsu       a6, a1, tp
                  sra          ra, t2, s4
                  fmax.s       ft7, ft1, fs11
                  divu         s1, t1, s4
                  srli         s4, t3, 22
                  fmv.w.x      fs6, t6
                  sltu         s8, a6, tp
                  sub          a1, t3, s7
                  remu         s10, zero, gp
                  mulh         a4, s2, s0
                  mulhsu       zero, gp, s1
                  xor          t4, tp, s9
                  andi         t5, s0, -1533
                  sra          t0, t3, gp
                  fsub.s       fa5, fs10, fs9
                  divu         ra, s8, s8
                  sub          t2, s7, a2
                  fcvt.s.wu    fs0, a7
                  rem          zero, a2, ra
                  slt          s5, s9, zero
                  fsub.s       ft9, ft0, fs10
                  srli         s8, sp, 2
                  sltiu        s6, s7, -831
                  fle.s        s2, fa7, fs0
                  sra          ra, s10, s4
                  rem          a6, a5, a2
                  sltiu        t5, gp, 1781
                  or           s5, zero, s10
                  fdiv.s       fa4, fa1, fs0, rne
                  andi         t6, s6, 501
                  ori          s1, tp, -1063
                  fmax.s       fs10, fs10, ft5
                  xori         a5, s8, 758
                  fcvt.w.s     s6, fa3, rdn
                  slti         gp, s4, -272
                  nop
                  auipc        a5, 796345
                  slt          sp, s2, s8
                  fsgnjn.s     ft2, ft8, ft7
                  sltiu        s0, a4, 719
                  sltiu        s1, a1, -891
                  slti         ra, s7, 176
                  lui          a3, 34249
                  srl          t6, t5, s4
                  mulhu        gp, a2, a0
                  slli         s2, t2, 20
                  slt          tp, sp, s1
                  add          s10, gp, a7
                  or           s1, a0, t5
                  and          t0, s2, t3
                  fcvt.s.wu    ft8, s8
                  fmv.w.x      fs1, s10
                  sltiu        s3, a6, -1639
                  mulhu        t2, a0, sp
                  and          t1, s3, a3
                  flt.s        a0, ft1, fs8
                  fdiv.s       fa0, fa7, fa7, rne
                  fsub.s       fs8, fs8, fa2, rup
                  fmax.s       fs9, fs6, fa3
                  remu         a1, a5, s11
                  fsgnj.s      fa6, ft5, ft0
                  remu         sp, s10, a1
                  slti         a3, a3, -1426
                  remu         a0, s7, s0
                  mulh         ra, a3, s4
                  mulhu        t4, s3, a6
                  add          s5, s4, t6
                  sltiu        ra, t3, 1383
                  fsgnjn.s     ft4, fs8, ft11
                  sll          s4, tp, a1
                  add          t5, a4, tp
                  fadd.s       fs10, fs9, ft5, rmm
                  sll          t5, s6, a1
                  fmv.w.x      fs11, s9
                  slti         t1, a3, -1174
                  divu         t0, a4, s4
                  fsub.s       ft3, ft1, fa6, rup
                  fsgnjx.s     ft6, fs10, fa6
                  ori          s4, s4, -641
                  lui          t4, 311865
                  fmul.s       fs0, fs6, fs10
                  flt.s        s8, ft1, fa0
                  xori         zero, t1, 1121
                  mul          s5, tp, s11
                  srai         s11, a4, 21
                  remu         s5, s9, t0
                  srai         a4, sp, 2
                  fsgnj.s      ft2, fa2, ft8
                  srai         a7, t3, 21
                  fcvt.s.w     ft0, ra
                  lui          s0, 230148
                  divu         s0, a4, t3
                  rem          s10, ra, a7
                  fadd.s       fa6, ft0, ft6
                  sll          t6, s7, s8
                  slt          sp, s2, a4
                  fsqrt.s      ft11, fa7
                  sra          s10, s1, t4
                  mulhu        a0, a0, s9
                  or           s11, a5, a2
                  fsub.s       fs7, ft6, ft9, rtz
                  fcvt.w.s     a5, fs7
                  fmin.s       ft2, fs2, ft0
                  fdiv.s       ft3, fa3, ft3, rup
                  fsgnj.s      ft9, ft7, ft11
                  mulhu        tp, a0, ra
                  fsgnjx.s     fs4, ft3, ft7
                  and          s5, s6, a5
                  srl          a1, s3, s6
                  fle.s        tp, fa1, ft10
                  fsqrt.s      fa4, ft3
                  flt.s        t5, ft0, ft7
                  fcvt.s.w     ft0, s0, rmm
                  srl          s1, s2, t3
                  fmax.s       fa1, fa0, ft4
                  flt.s        a0, fs5, fs10
                  fsgnjn.s     ft10, fa6, ft5
                  mulhu        s5, a6, a1
                  fadd.s       fs2, ft5, fs4, rmm
                  slt          t4, a3, a1
                  sll          s6, s10, tp
                  srli         a0, ra, 11
                  ori          a5, s2, -1243
                  srli         a7, a2, 15
                  divu         s4, t0, t1
                  fsgnj.s      fa3, fa0, ft10
                  fcvt.s.w     fa5, a0
                  addi         s11, s3, 1626
                  fcvt.s.wu    ft5, a5, rtz
                  mulhu        s5, s6, zero
                  slli         t1, t6, 17
                  divu         t6, a3, zero
                  fcvt.w.s     a2, fs9, rup
                  fcvt.s.w     ft7, a3, rdn
                  rem          s2, a1, s9
                  lui          a1, 360337
                  srl          tp, a7, s6
                  andi         tp, a1, -293
                  fcvt.w.s     s6, fs11, rup
                  slt          s0, a7, s5
                  fle.s        sp, fs0, fs5
                  addi         a1, s5, 70
                  srl          tp, a3, t2
                  fcvt.s.w     fs10, a0
                  nop
                  fsqrt.s      fs6, ft3
                  xor          s4, tp, s8
                  and          t0, a5, t0
                  mulh         s0, s1, a5
                  fsgnj.s      ft5, ft0, fs0
                  sub          s4, s9, a0
                  sra          t4, t6, t5
                  sltiu        a7, t1, -1300
                  fadd.s       fs0, ft4, fs6
                  sub          s4, gp, s0
                  mulhsu       t1, gp, s7
                  slti         s5, s0, 1266
                  fmul.s       fa5, ft3, fs4, rdn
                  mul          s0, a2, t5
                  fsqrt.s      fs4, ft8, rne
                  rem          s8, t0, a0
                  slti         t1, a7, -1244
                  mulh         s6, a2, t2
                  fsgnjn.s     ft7, ft2, fa2
                  nop
                  sltu         a1, a5, s0
                  addi         s10, ra, -196
                  sra          t2, s7, s6
                  sltiu        a6, s0, 499
                  fsgnjx.s     fs4, ft1, ft6
                  srli         t5, a4, 25
                  slt          zero, t5, t4
                  slt          t2, t0, t6
                  fmv.w.x      ft1, s11
                  fcvt.s.wu    fa0, a3
                  sll          s5, s9, t3
                  addi         s2, ra, 222
                  fcvt.s.wu    fs8, t5, rdn
                  div          t5, tp, s2
                  divu         s4, s0, s0
                  sltiu        t5, s11, 1631
                  slt          ra, s8, s3
                  fcvt.w.s     s1, fs6, rmm
                  feq.s        s5, fs10, ft6
                  mulhsu       a0, s3, s9
                  fcvt.s.w     fa2, t0
                  fmax.s       fa2, ft5, fs7
                  divu         a5, s4, t0
                  fmv.w.x      ft5, sp
                  sltiu        tp, t6, -1437
                  sltiu        t1, s2, 650
                  lui          a2, 799024
                  slli         a4, s3, 9
                  div          t6, a5, a7
                  sll          t1, ra, t5
                  lui          s2, 136318
                  srli         gp, a4, 0
                  slt          a1, s0, zero
                  mul          a0, ra, s4
                  nop
                  xori         gp, a7, 846
                  fmv.x.w      t1, fa7
                  fcvt.w.s     t1, ft7, rne
                  sub          s8, t2, a2
                  remu         s11, sp, gp
                  fmul.s       ft0, fs1, fa2, rmm
                  fcvt.w.s     t0, fa4, rdn
                  addi         s11, t0, -606
                  and          a3, t5, a5
                  andi         a0, sp, -849
                  slt          a3, t0, ra
                  sll          s10, s1, t1
                  remu         s6, a3, t3
                  srli         s5, s3, 8
                  addi         a7, s10, -1893
                  divu         s3, s6, t3
                  or           a3, s4, t0
                  feq.s        sp, fa1, fs0
                  fcvt.s.w     fs0, s0
                  fmv.w.x      ft6, t2
                  srli         a6, t1, 13
                  and          s11, zero, t1
                  ori          s10, t1, 2026
                  xor          s10, s4, a1
                  sra          a4, s11, s2
                  sll          sp, a3, a4
                  fle.s        s10, fs6, ft0
                  slt          s6, s10, s7
                  fcvt.w.s     s5, ft0, rtz
                  slt          a7, t5, t2
                  fcvt.s.w     fs3, a3, rtz
                  sub          s6, t4, t2
                  sltiu        gp, t5, -1168
                  slti         s0, s0, 389
                  srai         sp, ra, 23
                  slti         t6, s4, 1143
                  xor          s6, sp, a1
                  flt.s        s1, ft3, fa1
                  srl          s10, sp, a1
                  slli         s8, t4, 23
                  add          s2, s8, zero
                  fmax.s       fs11, fs6, fs2
                  addi         ra, gp, -471
                  ori          s4, s11, -1117
                  srli         a1, s7, 10
                  fmv.x.w      a6, fs9
                  lui          t6, 137792
                  srai         zero, gp, 3
                  fmv.x.w      s2, fs11
                  fdiv.s       ft10, ft0, fs4
                  and          t6, tp, s11
                  slti         s10, t6, -377
                  xor          t6, s6, gp
                  sltu         s11, zero, s9
                  nop
                  and          zero, zero, a6
                  mul          s8, s3, s2
                  fmax.s       fs10, fs7, ft9
                  fsgnjx.s     fa0, fs3, ft8
                  fdiv.s       ft6, ft9, fs3
                  fsgnjx.s     ft8, ft5, ft10
                  fsgnjx.s     ft1, fa5, fs9
                  andi         a2, t5, 1257
                  srl          s6, s6, a1
                  or           s2, t5, tp
                  fcvt.w.s     t4, fa7
                  xori         a7, s4, 1538
                  fsgnjn.s     fa2, fs4, fa6
                  srl          a0, a4, t6
                  xor          s0, gp, sp
                  mulh         a6, s1, a5
                  fsgnjx.s     ft0, ft0, ft8
                  fmv.w.x      fs8, s7
                  or           s4, zero, a0
                  or           a1, t3, a0
                  mul          zero, tp, s5
                  fmv.w.x      fa5, t4
                  fsub.s       ft8, ft8, fa0, rup
                  slti         s5, s6, 1269
                  fcvt.s.wu    fs11, a4
                  fmax.s       fa2, ft6, ft11
                  fclass.s     t5, fs6
                  srli         s5, a2, 22
                  mul          a3, a2, a5
                  fadd.s       fs7, fa5, fa5
                  fmax.s       ft0, fa0, ft0
                  slli         t0, a4, 12
                  nop
                  sub          a3, a7, t6
                  nop
                  auipc        s8, 753956
                  slti         sp, a6, 1105
                  fsgnjx.s     ft3, fa1, ft5
                  div          s6, s0, t5
                  nop
                  or           s11, a3, gp
                  slt          t4, s11, t2
                  feq.s        s6, fa3, fs1
                  fcvt.s.w     fs8, s0
                  or           s10, zero, s11
                  flt.s        t6, fs10, fs5
                  fmv.w.x      ft10, a3
                  fcvt.wu.s    ra, ft4
                  fcvt.w.s     t1, fs10, rup
                  fcvt.wu.s    tp, fa6
                  sltiu        s1, a3, -853
                  div          a0, s1, a4
                  rem          a0, s5, t4
                  fsqrt.s      fa5, ft8
                  remu         zero, gp, tp
                  fmin.s       fs5, fa6, ft6
                  fcvt.w.s     s6, fs0
                  or           t0, t4, zero
                  xor          s3, t2, a1
                  fcvt.s.wu    fa0, t6
                  remu         a6, t1, a3
                  sltiu        zero, a6, 1450
                  remu         a0, t2, zero
                  divu         s3, a3, a4
                  slti         a7, a2, -2030
                  fcvt.s.w     ft10, a6, rdn
                  flt.s        t0, ft1, fa0
                  auipc        a1, 422366
                  addi         s4, a2, -928
                  addi         t4, s4, -316
                  ori          s8, a5, 1666
                  fsgnj.s      fa6, fs1, fa7
                  and          s11, t3, s2
                  fsgnjn.s     fs1, fa4, fs6
                  fsgnjn.s     fs1, fs1, fa1
                  addi         a6, s4, 1173
                  auipc        s6, 1011285
                  srli         s2, s0, 25
                  fmv.x.w      a5, fs11
                  slt          t4, s2, gp
                  fmv.x.w      s4, fs9
                  divu         s8, gp, s11
                  fsgnjn.s     fs10, fa0, fa3
                  xori         a1, a3, 1297
                  srl          zero, t0, sp
                  div          a1, s5, s7
                  add          ra, s3, ra
                  fdiv.s       ft5, fa6, fa1, rtz
                  ori          s6, tp, 316
                  or           s6, a3, a2
                  fdiv.s       ft6, fs10, fs8, rne
                  sltu         s3, s4, t0
                  rem          t1, zero, t6
                  slti         s6, a4, 1092
                  xori         t4, gp, -220
                  mulhsu       s3, s3, s2
                  xori         gp, s2, 1481
                  flt.s        a1, fa3, ft3
                  and          t2, a7, a5
                  flt.s        t5, fa5, ft11
                  feq.s        a2, ft9, ft2
                  fcvt.wu.s    s1, ft4, rdn
                  and          s5, sp, s3
                  srli         a3, t4, 5
                  sll          a7, sp, a2
                  and          t1, t3, s6
                  xori         a2, a7, -1416
                  mul          a7, s4, s1
                  mulhsu       s2, s11, tp
                  fmax.s       ft4, fa4, fs8
                  auipc        t6, 41405
                  mulh         s5, sp, a3
                  sll          gp, s11, s8
                  and          s5, tp, tp
                  xori         a3, ra, -1347
                  fsgnjx.s     ft0, fa5, ft2
                  fmv.x.w      s11, fa1
                  xori         gp, s11, -1477
                  fmax.s       fs7, fa6, fs8
                  sra          s10, a7, a5
                  or           s5, a2, gp
                  srai         s6, t5, 2
                  fmin.s       ft5, fs7, fs2
                  and          gp, s6, a4
                  fsgnj.s      fs7, ft6, ft0
                  sltu         t2, s10, s8
                  nop
                  xori         a1, t3, 922
                  sub          ra, a5, t6
                  fclass.s     a1, fs11
                  fcvt.s.wu    fa7, t4, rup
                  fclass.s     zero, ft10
                  sub          zero, s6, s0
                  srai         s5, s7, 20
                  remu         s5, s3, gp
                  fadd.s       fs9, ft5, ft1
                  sra          a3, s11, a4
                  fsub.s       fa6, ft9, ft6, rdn
                  fcvt.s.w     fa4, t0, rmm
                  rem          s11, a4, t3
                  fsgnj.s      ft11, fs5, fs1
                  fcvt.w.s     t4, ft0
                  fclass.s     s6, ft5
                  fmul.s       fa0, fs7, ft3, rne
                  xor          a6, a2, s8
                  fmv.w.x      ft9, a5
                  slt          t6, s10, s11
                  fmul.s       fa7, ft3, fa2, rmm
                  fsgnj.s      fs3, ft0, fs1
                  mul          a4, s1, s2
                  srai         t1, a6, 22
                  fcvt.w.s     t1, fs4, rne
                  fcvt.w.s     gp, fa3
                  and          ra, s2, s6
                  fmv.x.w      tp, fs4
                  fcvt.w.s     t0, fs9
                  fcvt.wu.s    a2, ft10
                  fmv.w.x      fs2, s6
                  fadd.s       ft0, ft10, fs1, rmm
                  remu         a2, a7, s0
                  sll          s4, s4, s4
                  srl          s0, gp, s2
                  rem          s11, t3, t1
                  andi         s0, s11, -299
                  addi         ra, a4, 952
                  lui          t6, 232845
                  fcvt.s.wu    fa7, s1, rtz
                  fcvt.s.wu    fs2, a0
                  slt          tp, a3, t2
                  srli         t2, a0, 26
                  addi         a2, s9, -3
                  mulh         a7, a2, t5
                  fmax.s       fs5, fa6, fs9
                  lui          s10, 713854
                  fcvt.w.s     t1, ft11
                  srl          s1, t4, t5
                  fmin.s       ft1, fa0, fs5
                  add          t5, tp, a5
                  srli         a3, a4, 2
                  divu         a2, s6, zero
                  sltu         s1, a6, s8
                  fsub.s       ft8, ft1, fs5, rup
                  mul          zero, s0, t2
                  fcvt.s.w     fa3, ra, rdn
                  fmul.s       fs6, fs10, ft9
                  mulh         s0, s7, t6
                  div          ra, a0, s5
                  sub          a1, s9, a5
                  srl          t0, a7, a0
                  srl          tp, a1, t1
                  fsgnjn.s     fs10, ft3, ft2
                  sltiu        s1, s0, 852
                  sltu         a2, t2, a3
                  fsgnjn.s     fs1, ft2, fa0
                  fsub.s       fs4, fa1, fs1
                  nop
                  mulh         t2, a3, a3
                  fcvt.w.s     t1, fa1, rdn
                  fsgnjx.s     fs5, fa2, ft10
                  remu         t0, s10, a2
                  sra          s2, a4, s11
                  sll          a7, s5, t4
                  fadd.s       fa1, fs1, ft8, rup
                  slt          gp, s11, t3
                  fmin.s       ft7, fs5, ft4
                  auipc        s4, 820655
                  andi         s10, t5, -1509
                  feq.s        s3, fs9, fs6
                  ori          s0, s8, 1652
                  slt          s6, s6, s3
                  fsgnjn.s     fs4, fa7, fs5
                  remu         a7, zero, s6
                  auipc        s3, 335242
                  fsub.s       fs5, fs5, ft1, rtz
                  srli         t6, s8, 7
                  fsgnjn.s     fs6, fs5, ft3
                  div          s6, s0, a0
                  srl          sp, tp, t6
                  add          tp, t5, s5
                  add          tp, s0, s3
                  add          a4, s7, t6
                  fmax.s       ft10, ft11, ft5
                  addi         sp, a4, -303
                  sll          tp, a0, a5
                  xor          gp, a1, a1
                  fcvt.s.w     fs7, s7, rtz
                  fsgnjx.s     fs7, fa2, fs11
                  mulh         s2, a2, s10
                  nop
                  slt          s0, a4, a3
                  mulhu        a4, s0, s9
                  fsgnj.s      ft11, ft6, fa3
                  fsqrt.s      fs7, fa3
                  and          t6, s5, t2
                  and          t2, s11, a6
                  slti         ra, t6, 1975
                  nop
                  fclass.s     s11, fs11
                  slt          s0, gp, s0
                  slt          s11, a0, a4
                  slt          a1, s4, sp
                  slli         t6, t2, 1
                  srai         a2, a5, 13
                  divu         a2, s1, sp
                  mulhu        s6, s4, s8
                  fmin.s       fa4, fs7, fs2
                  nop
                  fsgnjx.s     fa1, fs10, fs3
                  fcvt.s.w     fs4, s0, rtz
                  fsgnjn.s     ft10, fs11, ft4
                  fdiv.s       fs0, ft3, fs11, rne
                  rem          a4, t5, s9
                  feq.s        t1, ft6, ft8
                  sll          s3, s5, gp
                  auipc        t0, 936560
                  slli         s5, s4, 26
                  fmul.s       fa7, fa3, fs3
                  fadd.s       fs0, fa7, ft9, rdn
                  lui          a5, 58739
                  div          t4, s10, s10
                  fclass.s     s6, ft8
                  fcvt.w.s     a6, ft0, rup
                  srli         a4, s6, 7
                  auipc        s3, 897021
                  slli         ra, t0, 0
                  xor          tp, gp, t2
                  fmin.s       fa4, fs0, fa0
                  fmin.s       fs5, fs2, ft10
                  or           a6, a2, a3
                  fmax.s       ft5, fs4, fs1
                  fmin.s       ft8, fa7, fa7
                  xor          s0, gp, a1
                  fmin.s       ft10, fa6, fs7
                  slt          s6, a3, s5
                  slti         s6, s11, 387
                  mulhsu       t0, sp, s8
                  fsub.s       fa7, ft5, fa4, rtz
                  ori          s6, a6, -1783
                  fmin.s       fs1, fs4, fs6
                  feq.s        s5, ft2, fs5
                  fmul.s       ft2, fs6, fa0
                  fsgnjn.s     fs2, fs3, ft7
                  fsgnj.s      fs10, fa6, fa3
                  xori         tp, a3, 1283
                  fmax.s       fs2, ft4, fa1
                  fcvt.wu.s    s2, fa2
                  fmv.x.w      ra, ft3
                  slti         t5, s3, -1544
                  fmv.w.x      ft3, a1
                  fcvt.wu.s    a5, ft0, rmm
                  fcvt.w.s     a3, fs7, rdn
                  fsgnj.s      fs1, fs5, ft5
                  mul          s4, s5, sp
                  add          a3, tp, t0
                  slti         s10, s2, 1558
                  ori          zero, s6, -651
                  mulhu        t2, a6, a0
                  fmin.s       fs10, fs10, fs6
                  addi         a5, a1, -176
                  mulhu        sp, sp, s7
                  fcvt.wu.s    a1, ft0
                  fcvt.s.wu    ft1, a5, rne
                  fcvt.wu.s    a4, fa6
                  fsqrt.s      ft9, fa4
                  divu         s1, a3, s6
                  fcvt.s.w     ft7, a0
                  sltu         a2, t3, a2
                  fcvt.s.wu    fs9, t0
                  fcvt.s.wu    ft9, t0, rne
                  fmv.w.x      ft2, t6
                  lui          a6, 879482
                  fadd.s       fs10, fs3, fs2
                  remu         s3, sp, a2
                  lui          a6, 226612
                  sltu         s3, t3, t3
                  fmul.s       ft7, fs0, ft3, rmm
                  fmax.s       ft3, fs0, fs5
                  and          t4, t3, t1
                  andi         a6, a7, 1359
                  fcvt.s.w     ft6, a3
                  fmv.x.w      a1, fs11
                  or           t5, s7, gp
                  mul          t5, s8, t0
                  andi         a4, s5, 358
                  fcvt.s.wu    fs7, a2, rne
                  and          s3, ra, t0
                  fsgnj.s      fa4, ft10, fs6
                  mulhu        a0, a4, s8
                  sub          a2, t2, s2
                  fmul.s       ft8, ft11, fs2, rmm
                  srl          s3, s6, tp
                  fsgnjn.s     ft11, ft11, ft9
                  fsgnjn.s     ft0, fa5, ft0
                  fmv.x.w      a2, ft4
                  auipc        a4, 667192
                  mulhsu       ra, a0, a4
                  feq.s        s8, ft3, ft5
                  fcvt.wu.s    gp, ft0, rtz
                  add          t4, s10, t1
                  fle.s        a1, fa0, ft10
                  fmul.s       fs6, fa1, ft5, rmm
                  sll          s4, a0, s2
                  fmul.s       fa4, fa6, ft8
                  flt.s        s0, fs7, ft1
                  fclass.s     t1, ft9
                  div          s1, s10, sp
                  auipc        s3, 88226
                  fdiv.s       fs6, fs9, fa0, rtz
                  and          a5, s4, a7
                  sll          t2, t6, t0
                  or           t1, sp, a2
                  fdiv.s       fs1, ft10, fs2, rmm
                  fclass.s     s6, ft9
                  auipc        a5, 924731
                  slti         a3, tp, -870
                  fle.s        s1, fa2, fa0
                  and          s0, tp, t2
                  mul          s0, s5, a4
                  divu         s10, t1, t0
                  remu         t5, t1, a1
                  and          gp, s1, sp
                  fcvt.w.s     tp, ft9
                  auipc        a4, 462278
                  mulhu        a1, a5, t3
                  fdiv.s       ft3, fs0, ft0
                  fcvt.w.s     t4, fs11
                  div          s5, a1, t3
                  ori          a3, s2, -1681
                  or           a0, sp, tp
                  sltiu        a1, s7, 673
                  fle.s        sp, ft9, fa1
                  fcvt.wu.s    gp, fa6, rmm
                  lui          t6, 135852
                  srli         s6, s10, 9
                  sltiu        ra, s1, -1538
                  fclass.s     t1, fs5
                  nop
                  mulhsu       a3, t1, t3
                  fmv.x.w      a5, fs7
                  fmax.s       fa4, fs3, ft1
                  auipc        a5, 107806
                  fcvt.wu.s    s6, fa3, rne
                  fcvt.wu.s    gp, ft9, rdn
                  auipc        a2, 879736
                  slli         t6, s9, 8
                  lui          s4, 790381
                  fcvt.s.w     ft6, s7, rtz
                  srl          t2, s10, t5
                  flt.s        a3, ft8, fs1
                  add          t6, a2, zero
                  srli         a0, s8, 27
                  fmv.w.x      fs11, s7
                  and          a6, t3, s4
                  fcvt.w.s     t2, fa5, rmm
                  addi         a6, sp, 990
                  fmv.w.x      fs1, s0
                  fcvt.wu.s    t2, fs10
                  fmv.w.x      fa7, a1
                  xori         a0, t2, -24
                  fcvt.s.w     fs0, s10, rup
                  mulh         s11, t1, t5
                  fmv.x.w      s4, ft8
                  fcvt.w.s     s1, ft11, rmm
                  fle.s        a1, fs2, ft8
                  rem          a1, a5, a7
                  fle.s        a6, ft9, fs0
                  slli         a6, s3, 9
                  divu         s6, t2, s4
                  andi         s5, s1, 1406
                  srli         s8, s5, 30
                  divu         ra, t1, s2
                  rem          s11, s0, a5
                  fsqrt.s      ft7, fa6
                  ori          t4, zero, 2022
                  srl          a4, a5, a6
                  fmv.w.x      ft0, a4
                  nop
                  mulh         s11, s9, s1
                  fmv.w.x      ft0, a7
                  xor          a3, a3, s6
                  fcvt.wu.s    a7, ft10, rdn
                  fcvt.s.w     ft1, s4, rdn
                  sltu         t2, a1, t1
                  mul          a2, t0, a3
                  sltiu        t6, s1, 534
                  mulh         s10, s0, a2
                  feq.s        s6, ft1, fa6
                  slt          s6, tp, t6
                  andi         t5, s0, 1206
                  mulh         a1, s9, s2
                  fdiv.s       ft6, fs5, ft4
                  srli         a1, s0, 5
                  andi         a5, a3, 583
                  sltu         t0, s6, tp
                  fcvt.wu.s    a7, fs10
                  mulh         s1, s11, a0
                  fsub.s       fa5, ft8, fa2
                  srli         s5, s0, 27
                  xor          tp, s7, s9
                  mul          t2, t6, s6
                  auipc        s4, 910487
                  srai         zero, s7, 8
                  nop
                  fsgnjn.s     fs2, fs11, fs10
                  slti         t0, t2, 1060
                  sra          a4, sp, tp
                  flt.s        a3, ft4, ft7
                  xor          t0, s1, a6
                  fmin.s       fs3, ft3, fs0
                  fmv.x.w      s2, ft5
                  lui          a0, 380772
                  nop
                  srai         t5, t6, 29
                  remu         s8, s9, t5
                  fsgnjx.s     ft10, fs8, fs4
                  mulhu        t0, s0, ra
                  fsub.s       fa6, ft9, fa1
                  fcvt.w.s     a5, ft10, rdn
                  andi         s5, s10, -1017
                  feq.s        s1, fs6, fs4
                  mulhsu       s4, a7, a4
                  mulhu        s8, s1, s11
                  mul          t5, tp, s8
                  mulhsu       a6, t6, a2
                  mulh         a1, tp, s7
                  divu         t1, t6, s5
                  and          zero, t4, t4
                  sltiu        a4, a1, -1797
                  flt.s        a5, fa0, fa7
                  mulh         s3, s10, s11
                  fcvt.s.w     fs10, a3, rdn
                  flt.s        s0, ft5, ft11
                  fcvt.w.s     a2, fa2, rup
                  sra          s11, s3, a0
                  divu         t5, zero, a3
                  fmv.x.w      zero, fs3
                  divu         tp, a0, a6
                  fsub.s       ft1, fs11, fa0
                  fsgnjn.s     fa4, fs1, fs1
                  mulh         a3, s4, s5
                  fmin.s       fa6, fs10, ft3
                  fsgnjn.s     fa4, ft9, fa5
                  slti         a0, s3, 1641
                  fsgnjn.s     fs0, fs1, ft7
                  div          t6, a0, a4
                  remu         ra, a6, a1
                  add          s2, s9, a0
                  andi         t2, a5, -1773
                  fmv.x.w      a3, fa4
                  srli         sp, t5, 18
                  fmv.w.x      fa6, s9
                  addi         a2, s6, 2025
                  fsqrt.s      ft6, fs2, rup
                  feq.s        ra, ft10, fa6
                  remu         s6, gp, s1
                  auipc        s5, 974751
                  fcvt.w.s     s8, ft8
                  fmul.s       fa2, fs8, fs4, rup
                  slli         s8, s1, 24
                  fsub.s       fs9, fs0, fs10
                  srl          a3, s6, s9
                  feq.s        t2, ft5, ft9
                  xor          a4, s5, t3
                  fclass.s     a6, fa3
                  fdiv.s       fs1, fa1, fs6
                  remu         a2, s2, a7
                  sltu         s2, s4, t0
                  fcvt.w.s     gp, fs3, rne
                  fcvt.wu.s    t4, ft0, rne
                  fcvt.wu.s    zero, ft7, rdn
                  sll          s11, s9, t1
                  srl          a4, t5, t4
                  lui          t2, 442431
                  xori         a5, t6, 1800
                  mulh         a7, s1, t6
                  fcvt.wu.s    t0, fa0
                  xori         t0, s10, 1777
                  and          a2, s8, a1
                  xor          a5, sp, s11
                  fdiv.s       ft4, fs6, fa2
                  fcvt.s.wu    fs10, t1
                  div          a2, s4, s3
                  divu         s6, t4, s9
                  fclass.s     s6, fs10
                  mulh         s8, s8, s11
                  nop
                  slti         ra, t2, -9
                  mulhsu       sp, ra, s4
                  xor          a3, zero, s11
                  feq.s        a3, ft6, fa3
                  xori         s0, a6, 1752
                  slti         tp, s0, -1247
                  fsgnjn.s     fa1, fa6, fs11
                  xor          t4, t4, s1
                  rem          t1, s1, a5
                  fadd.s       fs9, ft4, fs8
                  fle.s        s6, fs9, fa0
                  srl          t5, a1, t6
                  fmv.x.w      t5, fs4
                  and          tp, t6, a0
                  xor          s0, s3, a0
                  xori         sp, s1, -638
                  fsub.s       fs5, fs2, fs5, rtz
                  sra          t4, a3, t4
                  fmv.w.x      fs5, a0
                  sll          a2, gp, s8
                  fmv.x.w      gp, ft11
                  and          a6, s7, t4
                  fcvt.s.wu    fa4, sp, rmm
                  srai         a5, a1, 28
                  xor          a1, a6, a3
                  fsgnjx.s     fs3, fa6, fs9
                  divu         s6, s0, a1
                  fmax.s       fa0, fa7, ft9
                  mulhsu       a1, s9, s10
                  xor          a7, a6, a7
                  and          gp, gp, a0
                  mulhsu       a3, t4, ra
                  fmax.s       ft6, fa5, ft6
                  slti         a4, zero, -931
                  sub          s5, a3, tp
                  sra          s10, s10, t0
                  feq.s        s4, ft11, ft8
                  sll          t5, a4, s6
                  mulh         a5, s10, t1
                  remu         a5, t4, t5
                  mulhu        s2, s9, zero
                  or           sp, s10, t4
                  divu         tp, sp, s9
                  fsgnjn.s     fs9, fa2, fs6
                  fmin.s       ft7, fs8, ft5
                  addi         s3, s7, -1838
                  fsgnjn.s     ft6, fa7, ft9
                  fclass.s     t4, fs10
                  fmul.s       fs11, fs10, fa0
                  srai         t6, sp, 28
                  or           t2, t3, s6
                  auipc        sp, 856598
                  srai         a4, ra, 9
                  xori         a7, s9, 1188
                  fcvt.wu.s    s11, fs10, rup
                  fmax.s       fa1, ft4, ft4
                  fcvt.s.wu    ft2, s0
                  fdiv.s       ft9, ft6, fs3, rne
                  sltu         a6, a4, s9
                  srai         t4, s6, 16
                  add          a6, t0, a4
                  fsqrt.s      fs6, fs4
                  remu         s10, sp, a3
                  remu         a6, s8, s6
                  fle.s        s6, fs0, fa0
                  nop
                  flt.s        s0, ft1, fs8
                  fmin.s       ft3, fa7, fa2
                  or           t0, t5, tp
                  mulhu        s5, s7, sp
                  srai         gp, a0, 28
                  flt.s        a5, fs4, fs7
                  fmax.s       ft4, fa0, ft4
                  div          t1, a1, s9
                  srli         t5, s4, 6
                  slli         t6, a1, 13
                  srli         ra, t4, 30
                  andi         a0, s0, 867
                  fsub.s       ft6, fa3, fs3
                  remu         t6, s5, t3
                  fsgnj.s      fs9, fa1, fa3
                  ori          s0, t2, 1005
                  rem          s3, tp, s6
                  divu         s4, t1, a7
                  rem          ra, s8, s6
                  remu         s6, s10, s5
                  fmv.w.x      ft6, s3
                  fcvt.wu.s    s0, fs4
                  fmv.w.x      fs11, a3
                  slt          s8, zero, s0
                  fadd.s       ft4, fa3, fs10, rne
                  fmin.s       fa5, ft10, ft0
                  fmv.x.w      t6, fa4
                  addi         s11, s8, -1663
                  fadd.s       fa3, ft1, ft1
                  feq.s        a0, fs1, ft3
                  fle.s        t0, ft0, fs3
                  fmax.s       fs11, fs0, fa4
                  fsgnj.s      fa4, fa4, ft3
                  fcvt.w.s     t2, fs7
                  fcvt.s.wu    fs8, s8
                  mulh         s0, sp, a4
                  div          t0, s9, t0
                  add          a5, s4, tp
                  xor          a5, s6, a1
                  feq.s        s1, ft3, ft10
                  lui          a1, 518918
                  sub          a1, s4, s11
                  auipc        a1, 470110
                  slt          s6, t5, a5
                  srli         a6, a1, 12
                  fcvt.wu.s    s8, fa1
                  fsgnj.s      fs7, fa6, fs0
                  fmv.x.w      s0, fs11
                  fmax.s       fs7, fs3, fs3
                  div          a0, s11, a4
                  srai         a2, s7, 29
                  sltu         a6, s3, s4
                  slti         t1, s4, 812
                  fcvt.s.wu    ft11, s7, rup
                  sll          sp, t1, a5
                  fmin.s       ft1, ft10, fs10
                  add          s3, s4, t5
                  ori          t0, s1, -1233
                  fle.s        t2, ft6, fa5
                  xor          tp, t1, ra
                  fle.s        ra, ft3, fa0
                  fcvt.s.wu    fs11, t6
                  addi         t5, s8, -996
                  fsgnjn.s     ft8, ft8, ft3
                  auipc        t1, 460992
                  xori         s0, t6, -469
                  sll          s6, t2, zero
                  flt.s        a4, fs9, fa2
                  sra          t5, a6, a2
                  mulh         sp, s4, s10
                  fsgnj.s      ft2, fs7, ft1
                  sra          a4, s6, t3
                  fsgnjn.s     fs3, ft0, ft9
                  fmv.w.x      ft11, ra
                  xori         s3, t1, 1138
                  fsgnj.s      ft1, fs9, ft0
                  sra          zero, s2, zero
                  mulh         t4, s3, t3
                  mulhsu       a6, a1, a1
                  nop
                  fmul.s       fs9, fa6, ft7, rdn
                  mulhu        a0, a6, s0
                  fmax.s       ft0, fs4, fs3
                  fcvt.w.s     t1, fs1
                  mulhsu       a7, s0, t5
                  fle.s        t0, fs10, fa3
                  fmv.w.x      ft3, t5
                  srl          a6, s11, s5
                  fmin.s       fs2, ft0, ft0
                  mulhsu       a1, s6, sp
                  fcvt.wu.s    s5, ft7, rtz
                  auipc        s4, 475627
                  slti         a2, s8, 1225
                  fsub.s       fs9, ft0, fa5, rmm
                  sltu         gp, s1, s8
                  fadd.s       ft5, fs10, ft10, rdn
                  xor          s4, s1, s11
                  fsgnjx.s     ft9, fa2, fa4
                  div          a5, a5, a0
                  flt.s        sp, ft10, fs10
                  slli         s5, s6, 8
                  divu         a1, gp, t5
                  andi         a0, s0, -1678
                  and          t5, a5, a0
                  fsgnjx.s     fs6, fs9, ft4
                  fcvt.w.s     t5, fa2
                  flt.s        s5, fa2, ft8
                  fmax.s       fs7, ft5, ft1
                  rem          a5, s5, t4
                  sub          a3, a0, s3
                  srai         sp, tp, 2
                  slti         s0, sp, 2043
                  feq.s        gp, ft11, fa0
                  fclass.s     a6, fs4
                  remu         s2, s5, s1
                  sll          s5, t5, s4
                  sltu         a7, s5, s6
                  ori          a2, s0, -1374
                  mulhu        gp, t4, s0
                  add          s10, s7, s7
                  slti         s11, a5, -670
                  ori          t1, sp, -2039
                  fcvt.w.s     a5, fs4, rup
                  fmin.s       fa4, fs10, fa4
                  fsgnj.s      ft5, ft5, ft11
                  fsgnjx.s     ft10, ft3, ft5
                  fclass.s     a6, fa3
                  mul          tp, a6, s8
                  fclass.s     s5, fa7
                  auipc        a5, 1361
                  fmul.s       ft2, fa2, fa6
                  feq.s        ra, ft6, fa5
                  fdiv.s       ft7, fa7, ft2
                  fcvt.s.wu    fa3, a0, rtz
                  mulhu        s0, t4, s2
                  fmax.s       fa2, ft11, fs0
                  fdiv.s       fs4, fa2, ft8, rdn
                  fmul.s       fs8, fs4, fs11
                  fsqrt.s      fa5, fs5
                  fdiv.s       fa4, fa4, ft6, rmm
                  add          s4, s4, a3
                  fmax.s       fs4, fs10, ft5
                  slti         gp, s3, -635
                  sll          a1, s2, s8
                  sltiu        t1, s0, 393
                  fsgnj.s      fa7, fa7, fa4
                  fclass.s     gp, ft5
                  fsgnjx.s     ft5, ft7, fa6
                  mulhu        s5, s2, s10
                  sltu         t4, s9, s10
                  mulhu        s5, s2, t1
                  fsqrt.s      ft6, ft2
                  srl          t1, a1, s6
                  fmax.s       ft2, ft9, ft8
                  fsgnjn.s     fs4, ft0, fa3
                  nop
                  slti         s6, s5, -1530
                  slt          a3, s7, t0
                  addi         t0, s9, -201
                  flt.s        s2, fa4, fs10
                  slt          zero, s3, a4
                  ori          a1, s11, -494
                  sra          t4, a0, s8
                  fsgnj.s      fs4, fs1, fs7
                  fmul.s       fs7, fs1, fs4, rtz
                  slti         s2, t0, 1462
                  srli         s4, s11, 10
                  mulh         a4, ra, a1
                  sll          s5, a5, t6
                  fcvt.s.w     ft3, s3, rup
                  and          a5, s11, s6
                  fsgnjn.s     fa6, fa7, ft5
                  slt          s10, s10, t0
                  fmul.s       ft2, fs6, fs9, rne
                  fsgnj.s      fs9, ft1, ft6
                  add          s10, t0, s2
                  sltu         tp, t5, s6
                  sra          gp, t1, zero
                  xori         tp, t1, -720
                  slt          sp, a5, s0
                  fcvt.wu.s    a7, ft1, rtz
                  slli         t4, a0, 21
                  fcvt.wu.s    s0, fs5, rmm
                  srl          t2, a2, t3
                  srl          gp, ra, s1
                  auipc        s3, 1004565
                  sltiu        s2, a3, -1413
                  fcvt.s.w     ft5, t1
                  sub          s4, a7, a2
                  mulhu        s11, ra, zero
                  andi         a6, s10, 47
                  mulhsu       a1, gp, t5
                  sltu         zero, s9, a0
                  xor          s3, t2, a3
                  sll          s8, t0, s7
                  fcvt.w.s     t6, fa2, rtz
                  mul          a4, t5, sp
                  srai         t2, a3, 28
                  fmv.w.x      fs3, a3
                  fcvt.s.wu    fs5, s5
                  fsgnj.s      ft7, fs10, ft7
                  srl          s4, s0, ra
                  fsub.s       fs0, fa6, ft7, rne
                  fmul.s       fa6, fs10, fa3
                  mulhsu       s6, s3, s6
                  fmin.s       fa5, ft2, ft9
                  or           tp, a6, t5
                  fmax.s       ft10, fs4, fs11
                  feq.s        gp, fa1, fs4
                  sll          a2, a1, s11
                  xor          s1, a1, a0
                  andi         s3, a6, -1513
                  fcvt.wu.s    a6, fs9, rne
                  sltiu        s3, s10, -1704
                  fcvt.s.wu    fa0, sp, rdn
                  fmul.s       ft8, fs5, ft6, rup
                  divu         s11, s0, a3
                  slt          s8, a5, sp
                  srl          sp, t3, a0
                  mulh         a2, ra, a2
                  sltu         gp, zero, a6
                  fle.s        a5, fa0, fs1
                  auipc        s11, 161950
                  flt.s        ra, ft2, fa0
                  fsgnjn.s     fs11, fa0, fa4
                  fmul.s       ft9, fs7, fs0, rdn
                  fmv.x.w      s6, fa4
                  andi         s4, a7, 1415
                  sltiu        a5, t5, 912
                  fcvt.wu.s    t2, fa6, rne
                  divu         t1, t1, sp
                  sub          t5, s10, s5
                  fsgnj.s      fa3, fs6, fs1
                  sra          s3, a7, sp
                  and          s4, tp, ra
                  fsgnjn.s     fa5, fs8, fa6
                  fmax.s       ft9, fs5, fa7
                  fmv.w.x      fs4, s9
                  auipc        t6, 594588
                  xori         t0, s7, 1066
                  xori         a3, s7, -694
                  divu         s4, t3, t4
                  addi         a7, s2, 1244
                  slt          s5, s4, s7
                  flt.s        s2, ft4, fs5
                  remu         a1, t1, a2
                  srai         ra, s8, 10
                  auipc        a6, 1027125
                  mulh         t2, t0, s6
                  fmv.x.w      s11, ft10
                  sub          t1, t2, s2
                  fmv.w.x      ft2, t2
                  fsub.s       ft0, ft7, fs11
                  mulhsu       tp, a6, s4
                  ori          t6, a6, 1462
                  div          t1, gp, s1
                  fmul.s       fs11, fs8, fs1
                  ori          zero, a2, 1873
                  fmin.s       ft10, fs6, ft7
                  srl          s6, sp, t1
                  fdiv.s       fs6, fa3, fs2
                  fcvt.w.s     s5, fs7
                  fmul.s       fa1, ft5, ft6, rdn
                  fmin.s       ft5, fs11, fs1
                  fsub.s       fs3, fa0, ft6
                  fcvt.s.w     fa2, a3
                  fcvt.s.w     ft10, s7
                  fcvt.w.s     s1, fs9, rmm
                  slt          s8, ra, a2
                  fsub.s       ft10, ft9, ft2
                  fmv.x.w      gp, fs3
                  fsgnjn.s     fs7, ft2, ft7
                  slti         a6, t0, -1611
                  feq.s        t1, ft3, fs4
                  div          s0, a2, t2
                  fsqrt.s      fs11, ft2
                  and          a2, s4, zero
                  auipc        t5, 314159
                  divu         a5, t5, t4
                  slti         t4, t4, -660
                  sra          a2, a3, s9
                  xori         a3, a5, -624
                  fdiv.s       fs8, fa5, ft11, rup
                  nop
                  slli         tp, a3, 17
                  mulhsu       t2, s8, a0
                  slli         t2, a4, 24
                  fdiv.s       ft10, fa4, fs9
                  fdiv.s       fs11, fs4, ft11, rdn
                  srai         s10, a3, 13
                  fle.s        t0, ft10, fs0
                  fle.s        ra, fs0, ft2
                  remu         s6, s6, s8
                  fsgnjx.s     fa0, fs0, ft2
                  sra          s5, s4, t3
                  slti         zero, s11, 1281
                  flt.s        gp, fs2, ft5
                  and          a5, t5, a5
                  add          ra, s1, s8
                  fclass.s     t4, fa4
                  fcvt.s.w     fa7, s0, rmm
                  add          s6, s0, t6
                  mul          s8, t5, s8
                  flt.s        a0, ft1, fs5
                  srli         s11, s7, 18
                  flt.s        t2, fs11, fa6
                  fclass.s     t5, fs1
                  andi         s4, s6, -1905
                  srl          s0, a2, s7
                  fsub.s       fs0, ft3, fa3
                  div          a2, s8, a0
                  srli         s8, s4, 7
                  slt          sp, zero, tp
                  slli         t0, a1, 12
                  rem          t6, a1, t5
                  fsgnjn.s     fs5, fs0, ft5
                  fcvt.s.w     fs4, t2, rmm
                  rem          tp, s6, a4
                  slt          sp, s4, a7
                  slt          t5, tp, s6
                  mulhu        a6, a4, a4
                  sra          a1, t1, sp
                  flt.s        s3, fs6, fs5
                  fcvt.s.wu    fs0, a7, rdn
                  fle.s        a4, fs8, ft10
                  fsgnjn.s     ft2, fa4, ft10
                  fmin.s       ft11, fs6, fs6
                  div          s1, sp, s8
                  srai         t5, s7, 3
                  mulhsu       a2, t3, s8
                  slt          a5, zero, a6
                  sltiu        a0, s2, 369
                  nop
                  fadd.s       ft9, fs2, fs3
                  slt          a6, ra, s1
                  srl          s4, t5, zero
                  fcvt.w.s     a3, fs0, rup
                  rem          s11, a0, sp
                  rem          s11, sp, a6
                  sra          gp, s4, s9
                  sltu         a2, a7, a6
                  fcvt.s.wu    ft5, a7
                  fcvt.s.wu    fa3, a4, rne
                  remu         t5, ra, a3
                  fsgnj.s      ft2, ft10, fs2
                  fadd.s       fa2, fs5, fa0
                  fclass.s     a6, fs6
                  fcvt.w.s     t6, ft4, rtz
                  fadd.s       ft8, fs5, ft8
                  srai         zero, a2, 27
                  fsqrt.s      fs3, fa0
                  nop
                  sll          s0, ra, a2
                  fcvt.s.w     fs3, a0, rtz
                  sltiu        tp, s1, 218
                  fsub.s       fa5, ft10, fa3, rmm
                  remu         s0, sp, t3
                  slli         a6, s1, 20
                  fle.s        ra, fs3, ft5
                  fle.s        s4, fs2, fa6
                  fmax.s       ft5, fs11, ft4
                  sltu         s8, a7, t4
                  fsgnjx.s     fs1, ft0, ft6
                  fcvt.wu.s    s0, ft8
                  flt.s        a4, ft0, fs0
                  mulh         t2, t2, a2
                  mul          a6, s3, s7
                  fsgnjx.s     ft0, ft1, fs6
                  fdiv.s       fs10, ft3, fa3
                  xori         t5, ra, 342
                  feq.s        t5, fs6, fs2
                  mulhsu       tp, a6, s7
                  fmul.s       ft0, ft9, ft3
                  fsub.s       fs11, fa2, fs0
                  rem          a0, zero, a0
                  fmin.s       fa1, ft0, fa5
                  sub          s11, t5, t4
                  xori         t0, s11, -1573
                  add          s6, a4, s8
                  sltiu        s0, t2, 828
                  fmax.s       fs5, fs5, ft5
                  fcvt.s.wu    ft4, s3
                  slti         s2, s1, -800
                  fsub.s       fs10, ft5, fa5
                  sltu         s2, t4, t4
                  ori          a5, a2, -622
                  mulhu        ra, s10, t2
                  sll          t1, t2, zero
                  srai         t5, t5, 28
                  fmax.s       fa6, fa1, fs1
                  divu         a6, s5, t2
                  mulhu        a4, a7, t5
                  or           gp, s10, t2
                  sll          t2, a5, t4
                  flt.s        t1, fs8, fa3
                  mulhu        t6, ra, sp
                  fmin.s       fs6, fs10, fa7
                  fclass.s     t6, fa7
                  slti         s3, a5, 436
                  div          s2, s5, gp
                  slti         s5, t6, -1427
                  fadd.s       ft1, ft0, ft3, rmm
                  or           t6, tp, s6
                  fsgnjn.s     ft1, ft1, ft11
                  fcvt.s.w     ft2, sp
                  mul          a5, sp, s7
                  sub          s2, t5, t1
                  fsub.s       ft0, fs3, fa4, rdn
                  fmv.w.x      fs1, s9
                  fcvt.wu.s    a2, fa1
                  sltu         gp, s4, s11
                  fmv.x.w      a1, ft2
                  fsub.s       fa4, fs9, fa1
                  fsgnjx.s     ft10, fa2, fs3
                  slti         t4, a0, 657
                  fclass.s     sp, ft9
                  slti         s3, t5, 215
                  andi         a6, a6, -1534
                  fsgnj.s      fa6, fa0, fs10
                  srli         s2, t6, 6
                  fmax.s       ft11, fs1, fs6
                  flt.s        t5, fs8, fs6
                  or           a7, a2, s6
                  fcvt.wu.s    a5, fa5, rtz
                  add          ra, s0, s9
                  or           t6, t3, t6
                  srl          a1, t1, a5
                  fle.s        a5, ft1, fs9
                  mulhsu       t0, s11, a7
                  sra          s8, ra, a5
                  fadd.s       fs9, fs0, ft10
                  fsub.s       ft0, fa1, ft10, rne
                  mulhu        a6, s10, s9
                  slt          a1, s7, t3
                  sll          s11, a4, s5
                  slli         s0, t3, 30
                  andi         s0, s9, 1954
                  fsub.s       ft0, ft9, fs1, rne
                  andi         s5, s3, 1647
                  fclass.s     a1, fs11
                  fle.s        s4, ft3, ft5
                  srai         a5, a2, 6
                  or           s2, t4, t3
                  xor          a6, s1, tp
                  xori         zero, s3, 105
                  fdiv.s       ft5, fa4, ft8
                  sltu         zero, s6, s6
                  slti         s11, t5, 1436
                  mulh         t1, s4, t2
                  fcvt.w.s     t0, ft2, rup
                  fmv.w.x      fa2, a1
                  lui          t0, 91900
                  fdiv.s       ft7, ft7, fa2, rmm
                  mulhsu       s10, zero, s7
                  sll          a1, t6, t6
                  sub          a4, t1, s7
                  flt.s        s10, fs8, ft4
                  slti         t5, s10, 166
                  srli         s11, s1, 31
                  fsgnjn.s     ft11, ft7, fs0
                  sra          a0, t6, tp
                  mulh         a6, s8, s2
                  auipc        zero, 825290
                  fsgnjn.s     fa0, fs1, fs4
                  sub          a6, a5, t1
                  fmv.w.x      fa0, s11
                  srli         a6, s6, 30
                  fcvt.w.s     a6, ft4, rdn
                  fmv.w.x      fs8, a1
                  flt.s        s3, fs0, fs3
                  mulhsu       a6, s10, s2
                  srai         t6, ra, 27
                  mulh         ra, s3, s8
                  and          a6, t6, t3
                  fmul.s       fs9, ft6, fa7
                  remu         s0, s8, s2
                  addi         t4, a6, 333
                  rem          a2, s1, t1
                  fsgnjn.s     fs8, fs0, ft3
                  mulhsu       t1, sp, s3
                  fclass.s     gp, fs2
                  or           sp, a3, s4
                  mulh         t2, a0, s10
                  fmul.s       ft11, fa5, ft2, rne
                  feq.s        s4, fs4, ft8
                  xori         gp, s7, 292
                  or           a3, t0, s6
                  fsgnj.s      fs8, fa7, fa3
                  mulhsu       tp, s8, s0
                  rem          a7, s4, a6
                  and          s8, gp, t0
                  xori         t0, s9, -2007
                  fcvt.wu.s    t1, ft4, rtz
                  fsgnjn.s     ft8, fs11, ft9
                  fcvt.s.wu    ft8, a6, rtz
                  mulhsu       t0, a6, gp
                  add          a7, s5, s8
                  fle.s        a4, fa0, ft6
                  mulhu        a6, a5, s6
                  or           a7, s9, a2
                  auipc        s4, 614784
                  fcvt.wu.s    a7, fa5, rtz
                  la x28, test_done
                  jalr x0, x28, 0
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
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_2:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_3:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_4:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_5:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_6:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_7:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_8:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_9:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_10:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_11:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_12:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_13:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_14:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

mmode_intr_vector_15:
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x28, test_done
                  jalr x0, x28, 0

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
                  addi x25, x25, -4
                  sw  x23, (x25)
                  add x23, x25, zero
                  addi x23, x23, -128
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  add x25, x23, zero
                  csrr x14, 0x341 # MEPC
                  csrr x14, 0x342 # MCAUSE
                  li x26, 0x3 # BREAKPOINT
                  beq x14, x26, ebreak_handler
                  li x26, 0x8 # ECALL_UMODE
                  beq x14, x26, ecall_handler
                  li x26, 0x9 # ECALL_SMODE
                  beq x14, x26, ecall_handler
                  li x26, 0xb # ECALL_MMODE
                  beq x14, x26, ecall_handler
                  li x26, 0x1
                  beq x14, x26, instr_fault_handler
                  li x26, 0x5
                  beq x14, x26, load_fault_handler
                  li x26, 0x7
                  beq x14, x26, store_fault_handler
                  li x26, 0xc
                  beq x14, x26, pt_fault_handler
                  li x26, 0xd
                  beq x14, x26, pt_fault_handler
                  li x26, 0xf
                  beq x14, x26, pt_fault_handler
                  li x26, 0x2 # ILLEGAL_INSTRUCTION
                  beq x14, x26, illegal_instr_handler
                  csrr x26, 0x343 # MTVAL
                  1: la x28, test_done
                  jalr x1, x28, 0

ecall_handler:    
                  la x14, _start
                  sw x0, 0(x14)
                  sw x1, 4(x14)
                  sw x2, 8(x14)
                  sw x3, 12(x14)
                  sw x4, 16(x14)
                  sw x5, 20(x14)
                  sw x6, 24(x14)
                  sw x7, 28(x14)
                  sw x8, 32(x14)
                  sw x9, 36(x14)
                  sw x10, 40(x14)
                  sw x11, 44(x14)
                  sw x12, 48(x14)
                  sw x13, 52(x14)
                  sw x14, 56(x14)
                  sw x15, 60(x14)
                  sw x16, 64(x14)
                  sw x17, 68(x14)
                  sw x18, 72(x14)
                  sw x19, 76(x14)
                  sw x20, 80(x14)
                  sw x21, 84(x14)
                  sw x22, 88(x14)
                  sw x23, 92(x14)
                  sw x24, 96(x14)
                  sw x25, 100(x14)
                  sw x26, 104(x14)
                  sw x27, 108(x14)
                  sw x28, 112(x14)
                  sw x29, 116(x14)
                  sw x30, 120(x14)
                  sw x31, 124(x14)
                  la x28, write_tohost
                  jalr x0, x28, 0

instr_fault_handler:
                  add x23, x25, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x25, x23, zero
                  lw  x23, (x25)
                  addi x25, x25, 4
                  mret

load_fault_handler:
                  add x23, x25, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x25, x23, zero
                  lw  x23, (x25)
                  addi x25, x25, 4
                  mret

store_fault_handler:
                  add x23, x25, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x25, x23, zero
                  lw  x23, (x25)
                  addi x25, x25, 4
                  mret

ebreak_handler:   
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x23, x25, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x25, x23, zero
                  lw  x23, (x25)
                  addi x25, x25, 4
                  mret

illegal_instr_handler:
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  add x23, x25, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x25, x23, zero
                  lw  x23, (x25)
                  addi x25, x25, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x14, 0x300 # MSTATUS;
                  csrr  x14, 0x304 # MIE;
                  csrr  x14, 0x344 # MIP;
                  csrrc x14, 0x344, x14 # MIP;
                  add x23, x25, zero
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 128
                  add x25, x23, zero
                  lw  x23, (x25)
                  addi x25, x25, 4
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
